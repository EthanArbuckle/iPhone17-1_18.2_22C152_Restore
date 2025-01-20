@interface _UINavigationBarVisualProviderLegacyIOS
- (BOOL)_shim_107516167;
- (BOOL)_shim_34415965;
- (BOOL)_shim_disableBlurTinting;
- (BOOL)_shim_throwConstraintExceptions;
- (BOOL)_shim_wantsCustomTouchHandlingForTouches:(id)a3;
- (BOOL)_shouldPopForTouchAtPoint:(CGPoint)a3;
- (BOOL)_shouldShowBackButtonForNavigationItem:(id)a3;
- (BOOL)_supportsCanvasView;
- (BOOL)_suppressBackIndicator;
- (BOOL)canHandleStatusBarTouchAtPoint:(CGPoint)a3;
- (BOOL)gestureRecognizerShouldBegin:(id)a3 defaultAnswer:(id)a4;
- (BOOL)shouldUseHeightRangeFittingWidth;
- (CGPoint)frameOriginForStatusBarLocatedAt:(CGPoint)a3;
- (CGRect)_contentViewFrameInBounds:(CGRect)a3 style:(id)a4;
- (CGSize)_preferredContentSizeForItem:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (double)_backIndicatorClippingMargin;
- (double)_backTitleWidthOverTitleWidthForMatchingBackButtonView:(id)a3 titleView:(id)a4 withBackButtonWidth:(double)a5;
- (double)_effectiveBackIndicatorLeftMargin;
- (double)_shim_backgroundHeight;
- (double)_shim_shadowAlpha;
- (id)_backButtonForBackItem:(id)a3 topItem:(id)a4;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_defaultTitleFontForItem:(id)a3 fittingHeight:(double)a4 withScaleAdjustment:(double)a5;
- (id)_effectiveBackIndicatorImage;
- (id)_effectiveBackIndicatorTransitionMaskImage;
- (id)_navigationItemAtPoint:(CGPoint)a3;
- (id)_shim_backIndicatorView;
- (id)_shim_compatibilityBackgroundView;
- (id)_shim_contentView;
- (id)_shim_customHitTest:(CGPoint)a3 forView:(id)a4;
- (id)_shim_displayViewsIncludingHiddenBackButtonViews:(BOOL)a3;
- (id)_shim_layoutView;
- (id)_shim_promptText;
- (id)_shim_userContentGuide;
- (id)_timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4;
- (id)backButtonViewAtPoint:(CGPoint)a3;
- (id)preferredFocusedView;
- (int64_t)_shim_backdropStyle;
- (int64_t)statusBarStyle;
- (unint64_t)_subviewIndexAboveBackground;
- (void)_completeNavigationTransitionWithIncomingViews:(id)a3 outgoingViews:(id)a4 transitionAssistant:(id)a5 completion:(id)a6;
- (void)_completeTopItemTransitionWithIncomingViews:(id)a3 outgoingViews:(id)a4 previousLeftViews:(id)a5 previousRightViews:(id)a6 enableUserInteraction:(id)a7 transitionAssistant:(id)a8;
- (void)_getLeftMargin:(double *)a3 rightMargin:(double *)a4 forNavigationItem:(id)a5 showingBackButton:(BOOL)a6 visualStyle:(id)a7;
- (void)_getTitleViewFrame:(CGRect *)a3 leftViewFrames:(id)a4 rightViewFrames:(id)a5 forPreviousItem:(id)a6 item:(id)a7;
- (void)_getTitleViewFrame:(CGRect *)a3 leftViewFrames:(id)a4 rightViewFrames:(id)a5 forPreviousItem:(id)a6 item:(id)a7 returnedIdealWidthOfTextContent:(double *)a8 availableLayoutWidthForTextContent:(double *)a9 idealBackButtonWidth:(double *)a10;
- (void)_handleMouseDownAtPoint:(CGPoint)a3;
- (void)_handleMouseUpAtPoint:(CGPoint)a3;
- (void)_layoutInBounds:(CGRect)a3 withVisualStyle:(id)a4;
- (void)_layoutSubviewsFromContentView;
- (void)_popForTouchAtPoint:(CGPoint)a3;
- (void)_setUpContentFocusContainerGuide;
- (void)_setViewsAnimated:(BOOL)a3 forTopNavigationItem:(id)a4 backNavigationItem:(id)a5 previousTopItem:(id)a6;
- (void)_shim_30244716;
- (void)_shim_popForCarplayPressAtFakePoint:(CGPoint)a3;
- (void)_shim_pressBackIndicator:(BOOL)a3 initialPress:(BOOL)a4;
- (void)_shim_setCustomBackgroundView:(id)a3;
- (void)_shim_setDisableBlurTinting:(BOOL)a3;
- (void)_shim_setPromptText:(id)a3 animated:(BOOL)a4;
- (void)_shim_setShadowAlpha:(double)a3;
- (void)_shim_setUseContentView:(BOOL)a3;
- (void)_shim_touchesBegan:(id)a3 withEvent:(id)a4;
- (void)_shim_touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)_shim_touchesEnded:(id)a3 withEvent:(id)a4;
- (void)_shim_touchesMoved:(id)a3 withEvent:(id)a4;
- (void)_shim_updateBackgroundViewIgnoringFlag;
- (void)_shim_updateUserContentGuideForTopItem:(id)a3 backItem:(id)a4;
- (void)_startPopAnimationFromOldBackItem:(id)a3 oldTopItem:(id)a4 newBackItem:(id)a5 newTopItem:(id)a6 withTransitionAssistant:(id)a7 completion:(id)a8;
- (void)_startPushAnimationFromOldBackItem:(id)a3 oldTopItem:(id)a4 newBackItem:(id)a5 newTopItem:(id)a6 withTransitionAssistant:(id)a7 completion:(id)a8;
- (void)_updateBackIndicatorImage;
- (void)_updateBackIndicatorViewTintColor;
- (void)_updateBackground;
- (void)_wrapView:(id)a3 inClippingViewWithLeftBoundary:(double)a4 rightBoundary:(double)a5 leftMaskImage:(id)a6 leftMaskIsChevron:(BOOL)a7 rightMaskImage:(id)a8;
- (void)barSizeChanged;
- (void)changeAppearance;
- (void)intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)invalidateIntrinsicContentSize;
- (void)layoutSubviews;
- (void)popAnimated:(BOOL)a3 completion:(id)a4;
- (void)prepare;
- (void)prepareForPop;
- (void)prepareForPush;
- (void)provideViewsForContents:(id)a3 topItem:(id)a4 backItem:(id)a5;
- (void)pushAnimated:(BOOL)a3 completion:(id)a4;
- (void)removeContentForItem:(id)a3;
- (void)setBackButtonVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setupTopNavigationItem;
- (void)teardown;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateArchivedSubviews:(id)a3;
- (void)updateBackgroundGroupName;
- (void)updateTopNavigationItemAnimated:(BOOL)a3;
- (void)updateTopNavigationItemTitleView;
@end

@implementation _UINavigationBarVisualProviderLegacyIOS

- (void)prepare
{
  v10.receiver = self;
  v10.super_class = (Class)_UINavigationBarVisualProviderLegacyIOS;
  [(_UINavigationBarVisualProvider *)&v10 prepare];
  v3 = [_UIBarBackground alloc];
  [(UIView *)self->super._navigationBar bounds];
  v4 = -[_UIBarBackground initWithFrame:](v3, "initWithFrame:");
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

  v6 = objc_alloc_init(_UIBarBackgroundLayoutLegacy);
  backgroundViewLayout = self->_backgroundViewLayout;
  self->_backgroundViewLayout = v6;

  [(_UIBarBackground *)self->_backgroundView setLayout:self->_backgroundViewLayout];
  [(_UIBarBackground *)self->_backgroundView setTopAligned:1];
  [(UIView *)self->super._navigationBar addSubview:self->_backgroundView];
  v8 = [[_UINavigationBarGestureHandler alloc] initWithNavigationBar:self->super._navigationBar];
  gestureHandler = self->_gestureHandler;
  self->_gestureHandler = v8;

  [(_UINavigationBarGestureHandler *)self->_gestureHandler setDelegate:self];
  [(_UINavigationBarVisualProviderLegacyIOS *)self _setUpContentFocusContainerGuide];
}

- (void)teardown
{
  [(UIView *)self->_backgroundView removeFromSuperview];
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  [(UIView *)self->_layoutView removeFromSuperview];
  layoutView = self->_layoutView;
  self->_layoutView = 0;

  self->_contentView = 0;
  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarVisualProviderLegacyIOS;
  [(_UINavigationBarVisualProvider *)&v5 teardown];
}

- (void)changeAppearance
{
  [(UINavigationBar *)self->super._navigationBar setNeedsLayout];
  v3 = [(_UINavBarPrompt *)self->_prompt prompt];

  if (v3)
  {
    prompt = self->_prompt;
    [(UIView *)prompt setNeedsLayout];
  }
}

- (void)updateArchivedSubviews:(id)a3
{
  v27[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27[0] = self->_titleView;
  v27[1] = self->_prompt;
  v27[2] = self->_backgroundView;
  v27[3] = self->_backIndicatorView;
  uint64_t v5 = 0;
  v27[4] = self->_layoutView;
  do
  {
    if (v27[v5]) {
      objc_msgSend(v4, "removeObject:");
    }
    ++v5;
  }
  while (v5 != 5);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = self->_rightViews;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        [v4 removeObject:*(void *)(*((void *)&v21 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v11 = self->_leftViews;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(v4, "removeObject:", *(void *)(*((void *)&v17 + 1) + 8 * v15++), (void)v17);
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  for (uint64_t i = 4; i != -1; --i)
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = [(UIView *)self->super._navigationBar traitCollection];
  -[_UINavigationBarGestureHandler setIdiom:](self->_gestureHandler, "setIdiom:", [v4 userInterfaceIdiom]);
  [(_UINavigationBarVisualProviderLegacyIOS *)self _setUpContentFocusContainerGuide];
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v6 = [v5 _customLeftViews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v10++) setSemanticContentAttribute:a3];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = objc_msgSend(v5, "_customRightViews", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v15++) setSemanticContentAttribute:a3];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }

  [(UIImageView *)self->_backIndicatorView setSemanticContentAttribute:a3];
  v16 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  long long v17 = [(_UINavigationBarVisualProviderLegacyIOS *)self _backButtonForBackItem:v16 topItem:v5];
  [v17 setSemanticContentAttribute:a3];
}

- (int64_t)statusBarStyle
{
  if ([(UINavigationBar *)self->super._navigationBar barStyle]) {
    return 1;
  }
  [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout topInset];
  if (v3 > 0.0) {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarVisualProviderLegacyIOS;
  return [(_UINavigationBarVisualProvider *)&v5 statusBarStyle];
}

- (BOOL)canHandleStatusBarTouchAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (dyld_program_sdk_at_least()) {
    return 0;
  }
  uint64_t v7 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  if (v7)
  {
    uint64_t v8 = -[_UINavigationBarVisualProviderLegacyIOS _navigationItemAtPoint:](self, "_navigationItemAtPoint:", x, y);
    BOOL v6 = v7 == v8;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)preferredFocusedView
{
  double v3 = [(NSArray *)self->_leftViews firstObject];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(NSArray *)self->_rightViews firstObject];
  }
  BOOL v6 = v5;

  return v6;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = [a3 layer];
  uint64_t v7 = [v6 implicitAnimationForKeyPath:v5];

  uint64_t v8 = (void *)[v7 copy];
  return v8;
}

- (id)_timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4
{
  navigationBar = self->super._navigationBar;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(UINavigationBar *)navigationBar _currentVisualStyle];
  uint64_t v10 = [(_UINavigationBarItemStack *)self->super._stack transitionAssistant];
  v11 = objc_msgSend(v9, "timingFunctionForAnimationInView:withKeyPath:isInteractive:", v8, v7, objc_msgSend(v10, "interactive"));

  return v11;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3 defaultAnswer:(id)a4
{
  BOOL v6 = (uint64_t (**)(id, id))a4;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 locationInView:self->super._navigationBar];
    double v9 = v8;
    double v11 = v10;

    -[_UINavigationBarVisualProviderLegacyIOS backButtonViewAtPoint:](self, "backButtonViewAtPoint:", v9, v11);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    char v12 = v7 == 0;
  }
  else
  {
    char v12 = v6[2](v6, v7);
  }

  return v12;
}

- (CGPoint)frameOriginForStatusBarLocatedAt:(CGPoint)a3
{
  int64_t v3 = [(UINavigationBar *)self->super._navigationBar barPosition];
  double v4 = 0.0;
  double v5 = 20.0;
  if (v3 != 3) {
    double v5 = 0.0;
  }
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGSize)_preferredContentSizeForItem:(id)a3
{
  id v4 = a3;
  [(UINavigationBar *)self->super._navigationBar defaultSizeForOrientation:[(UINavigationBar *)self->super._navigationBar effectiveInterfaceOrientation]];
  double v6 = v5;
  double v8 = v7;
  if (v4)
  {
    int64_t v9 = [(UINavigationBar *)self->super._navigationBar _activeBarMetrics];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72___UINavigationBarVisualProviderLegacyIOS__preferredContentSizeForItem___block_invoke;
    v16[3] = &__block_descriptor_48_e8_d16__0q8l;
    *(double *)&v16[4] = v6;
    *(double *)&v16[5] = v8;
    [v4 _desiredHeightForBarMetrics:v9 defaultHeightBlock:v16];
    double v8 = v10;
  }
  double v11 = [(UIView *)self->super._navigationBar superview];
  char v12 = v11;
  if (v11)
  {
    [v11 bounds];
    double v6 = v13;
  }

  double v14 = v6;
  double v15 = v8;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(UIView *)self->_contentView subviews];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) invalidateIntrinsicContentSize];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if ([(_UINavigationBarVisualProviderLegacyIOS *)self _supportsCanvasView])
  {
    uint64_t v5 = self->super._itemForMeasuring;
    if (!v5)
    {
      int v6 = [(_UINavigationBarItemStack *)self->super._stack state];
      if (v6 == 2)
      {
        uint64_t v3 = [(_UINavigationBarItemStack *)self->super._stack transitionAssistant];
        if ([v3 cancelledTransition])
        {
          uint64_t v5 = [(_UINavigationBarItemStack *)self->super._stack previousTopItem];
LABEL_9:

          goto LABEL_7;
        }
      }
      uint64_t v5 = [(_UINavigationBarItemStack *)self->super._stack topItem];
      if (v6 == 2) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_7:
  [(_UINavigationBarVisualProviderLegacyIOS *)self _preferredContentSizeForItem:v5];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)shouldUseHeightRangeFittingWidth
{
  return 0;
}

- (void)barSizeChanged
{
  id v2 = [(UINavigationBar *)self->super._navigationBar currentBackButton];
  [v2 _setAbbreviatedTitleIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (void)intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  if (self->_backIndicatorView == a3)
  {
    [a3 sizeToFit];
    contentView = self->_contentView;
    [(UIView *)contentView setNeedsLayout];
  }
}

- (void)_layoutSubviewsFromContentView
{
  uint64_t v3 = [(UIView *)self->_layoutView window];

  if (v3 && ![(_UINavigationBarItemStack *)self->super._stack state])
  {
    [(UIView *)self->_layoutView bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    id v13 = [(UINavigationBar *)self->super._navigationBar _effectiveDelegate];
    double v12 = [(UINavigationBar *)self->super._navigationBar _currentVisualStyle];
    -[_UINavigationBarVisualProviderLegacyIOS _layoutInBounds:withVisualStyle:](self, "_layoutInBounds:withVisualStyle:", v12, v5, v7, v9, v11);
  }
}

- (void)_layoutInBounds:(CGRect)a3 withVisualStyle:(id)a4
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v98[1] = *MEMORY[0x1E4F143B8];
  id v69 = a4;
  v71 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  v70 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  prompt = self->_prompt;
  [v69 promptInset];
  CGFloat v11 = v10;
  v99.origin.CGFloat x = x;
  v99.origin.CGFloat y = y;
  v99.size.CGFloat width = width;
  v99.size.double height = height;
  CGRect v100 = CGRectInset(v99, v11, 0.0);
  -[UIView setFrame:](prompt, "setFrame:", v100.origin.x, v100.origin.y, v100.size.width, v100.size.height);
  double v12 = v71;
  [v71 _updateViewsForBarSizeChangeAndApply:1];
  uint64_t v13 = [v69 metricsIsMini];
  if (([v71 leftItemsSupplementBackButton] & 1) != 0
    || ([v71 leftBarButtonItems],
        double v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v14 count],
        v14,
        double v12 = v71,
        !v15))
  {
    v68 = [(_UINavigationBarVisualProviderLegacyIOS *)self _backButtonForBackItem:v70 topItem:v12];
    double v12 = v71;
  }
  else
  {
    v68 = 0;
  }
  v67 = [v12 _customLeftViews];
  if (v68)
  {
    v98[0] = v68;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:1];
    id v17 = v16;
    if (v67)
    {
      uint64_t v18 = objc_msgSend(v16, "arrayByAddingObjectsFromArray:");

      id v17 = (id)v18;
    }
  }
  else
  {
    id v17 = v67;
  }
  objc_opt_class();
  objc_opt_class();
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v19 = v17;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v92 objects:v97 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v93;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v93 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = *(void **)(*((void *)&v92 + 1) + 8 * i);
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass()) {
          [v23 setControlSize:v13];
        }
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v92 objects:v97 count:16];
    }
    while (v20);
  }

  [v71 _customRightViews];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [v24 countByEnumeratingWithState:&v88 objects:v96 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v89;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v89 != v26) {
          objc_enumerationMutation(v24);
        }
        uint64_t v28 = *(void **)(*((void *)&v88 + 1) + 8 * j);
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass()) {
          [v28 setControlSize:v13];
        }
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v88 objects:v96 count:16];
    }
    while (v25);
  }

  v29 = [v71 _titleView];
  if (v29 && (objc_opt_isKindOfClass() & 1) != 0) {
    [v29 setControlSize:v13];
  }
  long long v30 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v86 = *MEMORY[0x1E4F1DB28];
  long long v87 = v30;
  unint64_t v31 = [v19 count];
  uint64_t v32 = [v24 count];
  unint64_t v33 = v32;
  if (!v31)
  {
    v34 = 0;
    if (v32) {
      goto LABEL_34;
    }
LABEL_36:
    uint64_t v35 = 0;
    goto LABEL_37;
  }
  v34 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v31];
  if (!v33) {
    goto LABEL_36;
  }
LABEL_34:
  uint64_t v35 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v33];
LABEL_37:
  v66 = (void *)v35;
  -[_UINavigationBarVisualProviderLegacyIOS _getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:](self, "_getTitleViewFrame:leftViewFrames:rightViewFrames:forPreviousItem:item:", &v86, v34);
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v29 _shouldUseNavigationBarHeight])
  {
    int v36 = [v69 metricsHasPrompt];
    double v37 = 0.0;
    if (v36)
    {
      objc_msgSend(v69, "barPromptHeight", 0.0);
      double v39 = v38;
      [v69 barHeight];
      double v37 = v39 - v40;
    }
    *((double *)&v86 + 1) = v37;
    *((double *)&v87 + 1) = height - v37;
  }
  objc_msgSend(v29, "setFrame:", v86, v87);
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x2020000000;
  uint64_t v85 = 0;
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __75___UINavigationBarVisualProviderLegacyIOS__layoutInBounds_withVisualStyle___block_invoke;
  v77[3] = &unk_1E52DE258;
  unint64_t v81 = v31;
  id v41 = v19;
  id v78 = v41;
  v79 = self;
  v80 = &v82;
  [v34 enumerateObjectsUsingBlock:v77];
  unint64_t v42 = v83[3] + 1;
  if (v42 < v31)
  {
    do
    {
      v43 = [v41 objectAtIndex:v42];
      [v43 removeFromSuperview];

      ++v42;
    }
    while (v31 != v42);
  }
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __75___UINavigationBarVisualProviderLegacyIOS__layoutInBounds_withVisualStyle___block_invoke_2;
  v72[3] = &unk_1E52DE258;
  unint64_t v76 = v33;
  id v44 = v24;
  id v73 = v44;
  v74 = self;
  v75 = &v82;
  [v66 enumerateObjectsUsingBlock:v72];
  unint64_t v45 = v83[3] + 1;
  if (v45 < v33)
  {
    do
    {
      v46 = [v44 objectAtIndex:v45];
      [v46 removeFromSuperview];

      ++v45;
    }
    while (v33 != v45);
  }
  contentView = self->_contentView;
  v48 = [(UINavigationBar *)self->super._navigationBar items];
  uint64_t v49 = [v48 count];
  if (v31 | v33) {
    BOOL v51 = v49 == 0;
  }
  else {
    BOOL v51 = 1;
  }
  LODWORD(v50) = -1105618534;
  if (v51) {
    *(float *)&double v50 = 0.0;
  }
  [(UIView *)contentView setCharge:v50];

  [(_UINavigationBarVisualProviderLegacyIOS *)self _updateBackIndicatorImage];
  backIndicatorView = self->_backIndicatorView;
  if (backIndicatorView)
  {
    [(UIView *)backIndicatorView frame];
    double v65 = v53;
    double v55 = v54;
    [(_UINavigationBarVisualProviderLegacyIOS *)self _effectiveBackIndicatorLeftMargin];
    double v57 = v56;
    if ((*((_DWORD *)&self->super._navigationBar->super._viewFlags + 4) & 0x80000) != 0)
    {
      v101.origin.CGFloat x = x;
      v101.origin.CGFloat y = y;
      v101.size.CGFloat width = width;
      v101.size.double height = height;
      double v57 = CGRectGetMaxX(v101) - v65 - v57;
    }
    [v69 backIndicatorBottomMargin];
    [(UIImageView *)self->_backIndicatorView alignmentRectInsets];
    v102.origin.CGFloat x = x;
    v102.origin.CGFloat y = y;
    v102.size.CGFloat width = width;
    v102.size.double height = height;
    CGRectGetMaxY(v102);
    UIRoundToViewScale(self->super._navigationBar);
    -[UIImageView setFrame:](self->_backIndicatorView, "setFrame:", v57, v58, v65, v55);
    [(UIView *)self->_contentView bringSubviewToFront:self->_backIndicatorView];
    v59 = [(_UINavigationBarVisualProviderLegacyIOS *)self _backButtonForBackItem:v70 topItem:v71];
    if ([(UINavigationBar *)self->super._navigationBar _hasBackButton]
      && [v71 _leftItemsWantBackButton]
      && ([v59 _suppressesBackIndicatorView] & 1) == 0)
    {
      [v59 alpha];
      double v60 = v63;
    }
    else
    {
      double v60 = 0.0;
      if ([v71 _wantsBackButtonIndicator])
      {
        v61 = [v71 _buttonForBackButtonIndicator];
        [v61 alpha];
        double v60 = v62;
      }
    }
    [(UIView *)self->_backIndicatorView alpha];
    if ((v60 != 0.0) == (v64 == 0.0)) {
      [(UIView *)self->_backIndicatorView setAlpha:v60];
    }
  }
  _Block_object_dispose(&v82, 8);
}

- (void)layoutSubviews
{
  id v3 = [(UINavigationBar *)self->super._navigationBar _currentVisualStyle];
  [(UIView *)self->super._navigationBar bounds];
  if (self->_layoutView)
  {
    -[_UINavigationBarVisualProviderLegacyIOS _contentViewFrameInBounds:style:](self, "_contentViewFrameInBounds:style:", v3);
    -[UIView setFrame:](self->_layoutView, "setFrame:");
    [(UIView *)self->_layoutView setNeedsLayout];
    [(UIView *)self->_layoutView layoutIfNeeded];
  }
  else
  {
    -[_UINavigationBarVisualProviderLegacyIOS _layoutInBounds:withVisualStyle:](self, "_layoutInBounds:withVisualStyle:", v3);
  }
  [(_UINavigationBarVisualProviderLegacyIOS *)self _updateBackground];
}

- (void)prepareForPush
{
  int64_t v3 = [(UINavigationBar *)self->super._navigationBar _barStyle];
  id v8 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  double v4 = [v8 _titleView];
  [v4 setAlpha:0.0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v4, "setTitleAutoresizesToFit:", -[UINavigationBar _titleAutoresizesToFit](self->super._navigationBar, "_titleAutoresizesToFit"));
  }
  [(UIView *)self->_contentView addSubview:v4];
  objc_storeStrong((id *)&self->_titleView, v4);
  if ([v8 hidesBackButton])
  {
    double v5 = 0;
  }
  else
  {
    double v6 = [(_UINavigationBarItemStack *)self->super._stack backItem];
    double v5 = [v6 backButtonView];

    if (v5)
    {
      [v5 setStyle:v3];
      [v5 setPressed:0];
      [(UIView *)self->_contentView addSubview:v5];
      if ([v5 _appearanceIsInvalid])
      {
        double v7 = [(UIView *)self->super._navigationBar window];
        +[_UIAppearance _applyInvocationsTo:v5 window:v7];
      }
      if ([v5 customBackgroundImageChangedToOrFromNil]) {
        [(_UINavigationBarVisualProviderLegacyIOS *)self _updateBackIndicatorImage];
      }
    }
  }
}

- (void)prepareForPop
{
  int64_t v3 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  if (v3)
  {
    contentView = self->_contentView;
    id v6 = v3;
    double v5 = [v3 _titleView];
    [(UIView *)contentView addSubview:v5];

    int64_t v3 = v6;
  }
}

- (void)removeContentForItem:(id)a3
{
  contentView = (UINavigationBar *)self->_contentView;
  if (!contentView) {
    contentView = self->super._navigationBar;
  }
  [a3 _removeContentInView:contentView];
}

- (void)pushAnimated:(BOOL)a3 completion:(id)a4
{
  stack = self->super._stack;
  id v7 = a4;
  if (a3)
  {
    id v20 = [(_UINavigationBarItemStack *)stack previousBackItem];
    id v8 = [(_UINavigationBarItemStack *)self->super._stack previousTopItem];
    double v9 = [(_UINavigationBarItemStack *)self->super._stack backItem];
    double v10 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    CGFloat v11 = [(_UINavigationBarItemStack *)self->super._stack transitionAssistant];
    [(_UINavigationBarVisualProviderLegacyIOS *)self _startPushAnimationFromOldBackItem:v20 oldTopItem:v8 newBackItem:v9 newTopItem:v10 withTransitionAssistant:v11 completion:v7];

    goto LABEL_15;
  }
  id v20 = [(_UINavigationBarItemStack *)stack topItem];
  id v8 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  double v9 = [(_UINavigationBarItemStack *)self->super._stack previousBackItem];
  double v12 = [v20 _titleView];
  [v12 setAlpha:1.0];

  double v10 = [v9 backButtonView];
  [v10 _setAbbreviatedTitleIndex:0x7FFFFFFFFFFFFFFFLL];
  [v10 removeFromSuperview];
  double v13 = 0.0;
  if (v8)
  {
    double v14 = [v8 _titleView];
    [v14 removeFromSuperview];
    uint64_t v15 = [v8 backButtonView];
    objc_msgSend(v15, "setSemanticContentAttribute:", -[UIView semanticContentAttribute](self->super._navigationBar, "semanticContentAttribute"));
    if ([v20 hidesBackButton])
    {
      [v15 setAlpha:0.0];
    }
    else
    {
      int v16 = [v20 _leftItemsWantBackButton];
      char v17 = v16;
      if (v16) {
        double v18 = 1.0;
      }
      else {
        double v18 = 0.0;
      }
      [v15 setAlpha:v18];
      if (v17)
      {
        int v19 = [v15 _suppressesBackIndicatorView];

        if (v19) {
          double v13 = 0.0;
        }
        else {
          double v13 = 1.0;
        }
        goto LABEL_14;
      }
    }
  }
LABEL_14:
  [(UIView *)self->_backIndicatorView setAlpha:v13];
  (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);

  [(UINavigationBar *)self->super._navigationBar setNeedsLayout];
LABEL_15:
}

- (void)popAnimated:(BOOL)a3 completion:(id)a4
{
  stack = self->super._stack;
  id v7 = a4;
  if (a3)
  {
    id v27 = [(_UINavigationBarItemStack *)stack previousBackItem];
    id v8 = [(_UINavigationBarItemStack *)self->super._stack previousTopItem];
    double v9 = [(_UINavigationBarItemStack *)self->super._stack backItem];
    double v10 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    CGFloat v11 = [(_UINavigationBarItemStack *)self->super._stack transitionAssistant];
    [(_UINavigationBarVisualProviderLegacyIOS *)self _startPopAnimationFromOldBackItem:v27 oldTopItem:v8 newBackItem:v9 newTopItem:v10 withTransitionAssistant:v11 completion:v7];
  }
  else
  {
    id v27 = [(_UINavigationBarItemStack *)stack topItem];
    id v8 = [(_UINavigationBarItemStack *)self->super._stack backItem];
    double v12 = [(_UINavigationBarItemStack *)self->super._stack previousTopItem];
    double v9 = v12;
    if (v12)
    {
      double v13 = [v12 navigationBar];
      navigationBar = self->super._navigationBar;

      if (v13 == navigationBar)
      {
        [v9 _removeTitleAndButtonViews];
        [v9 setNavigationBar:0];
      }
      uint64_t v15 = [v27 navigationBar];

      if (v15)
      {
        int v16 = [v27 backButtonView];
        [v16 _setAbbreviatedTitleIndex:0x7FFFFFFFFFFFFFFFLL];
      }
    }
    if (v27)
    {
      char v17 = [v27 _titleView];
      double v18 = [v27 backButtonView];
      [v18 removeFromSuperview];

      [(UIView *)v17 setAlpha:1.0];
      titleView = self->_titleView;
      self->_titleView = v17;

      [v27 updateNavigationBarButtonsAnimated:0];
    }
    if (v8)
    {
      id v20 = [v8 backButtonView];
      [v20 setPressed:0];
      uint64_t v21 = [(_UINavigationBarItemStack *)self->super._stack transitionAssistant];
      if (([v21 shouldHideBackButtonDuringTransition] & 1) != 0
        || ([v27 hidesBackButton] & 1) != 0)
      {

        double v22 = 0.0;
        double v23 = 0.0;
      }
      else
      {
        int v25 = [v27 _leftItemsWantBackButton];

        double v22 = 0.0;
        double v23 = 0.0;
        if (v25)
        {
          int v26 = objc_msgSend(v20, "_suppressesBackIndicatorView", 0.0);
          double v22 = 1.0;
          if (v26) {
            double v23 = 0.0;
          }
          else {
            double v23 = 1.0;
          }
        }
      }
      [v20 setAlpha:v22];
      [(UIView *)self->_contentView addSubview:v20];
    }
    else
    {
      double v23 = 0.0;
    }
    [(UIView *)self->_backIndicatorView setAlpha:v23];
    id v24 = [(_UINavigationBarItemStack *)self->super._stack transitionAssistant];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v24);

    [(UINavigationBar *)self->super._navigationBar setNeedsLayout];
  }
}

- (void)updateTopNavigationItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  double v5 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  id v6 = [(_UINavigationBarItemStack *)self->super._stack previousTopItem];
  [(_UINavigationBarVisualProviderLegacyIOS *)self _setViewsAnimated:v3 forTopNavigationItem:v7 backNavigationItem:v5 previousTopItem:v6];
}

- (void)updateTopNavigationItemTitleView
{
  BOOL v3 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  obuint64_t j = [v3 _titleView];

  double v4 = obj;
  p_titleView = (id *)&self->_titleView;
  titleView = self->_titleView;
  if (titleView != obj)
  {
    id v7 = [(UIView *)titleView superview];
    if (v7 == self->_contentView)
    {
      id v8 = *p_titleView;
    }
    else
    {
      if (![(NSMutableArray *)self->_slideTransitionClippingViews containsObject:v7])
      {
LABEL_7:
        objc_storeStrong((id *)&self->_titleView, obj);
        [*p_titleView setAlpha:1.0];
        [(UIView *)self->_contentView addSubview:obj];

        double v4 = obj;
        goto LABEL_8;
      }
      [(NSMutableArray *)self->_slideTransitionClippingViews removeObject:v7];
      id v8 = v7;
    }
    [v8 removeFromSuperview];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)setupTopNavigationItem
{
  id v12 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  BOOL v3 = [v12 _titleView];
  double v4 = v3;
  if (v3)
  {
    [v3 setAlpha:1.0];
    [(UIView *)self->_contentView addSubview:v4];
  }
  objc_storeStrong((id *)&self->_titleView, v4);
  id v5 = [(_UINavigationBarItemStack *)self->super._stack previousTopItem];
  id v6 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  id v7 = v12;
  if (v5 != v12)
  {
    [v12 _updateViewsForBarSizeChangeAndApply:0];
    [(_UINavigationBarVisualProviderLegacyIOS *)self updateTopNavigationItemAnimated:0];
    [(UINavigationBar *)self->super._navigationBar updatePrompt];
    id v7 = v12;
    if (v6)
    {
      id v8 = [v6 navigationBar];

      id v7 = v12;
      if (v8)
      {
        double v9 = [v6 backButtonView];
        [v9 _setAbbreviatedTitleIndex:0x7FFFFFFFFFFFFFFFLL];

        id v7 = v12;
      }
    }
  }
  double v10 = [(_UINavigationBarVisualProviderLegacyIOS *)self _backButtonForBackItem:v6 topItem:v7];
  if (v10 && [v12 _leftItemsWantBackButton])
  {
    [(UIView *)self->_contentView addSubview:v10];
    if ([v10 _appearanceIsInvalid])
    {
      CGFloat v11 = [(UIView *)self->super._navigationBar window];
      +[_UIAppearance _applyInvocationsTo:v10 window:v11];
    }
    [v10 setAlpha:1.0];
    if ([v10 customBackgroundImageChangedToOrFromNil]) {
      [(_UINavigationBarVisualProviderLegacyIOS *)self changeAppearance];
    }
  }
}

- (void)setBackButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(_UINavigationBarItemStack *)self->super._stack state])
  {
    if (!v5)
    {
      id v23 = [(_UINavigationBarItemStack *)self->super._stack transitionAssistant];
      [v23 setShouldHideBackButtonDuringTransition:1];
    }
  }
  else
  {
    id v7 = [(_UINavigationBarItemStack *)self->super._stack backItem];
    id v8 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    double v9 = [v7 backButtonView];
    double v10 = v9;
    if (!v9
      || ([v9 superview],
          CGFloat v11 = objc_claimAutoreleasedReturnValue(),
          BOOL v12 = v11 == 0,
          v11,
          v12))
    {
      if (v8 && ([v8 leftItemsSupplementBackButton] & 1) == 0)
      {
        double v13 = [v8 _barButtonForBackButtonIndicator];
        if ([v13 _actsAsFakeBackButton])
        {
          uint64_t v14 = [v13 view];

          double v10 = (void *)v14;
        }
      }
    }
    uint64_t v15 = self->_contentView;
    if (v5)
    {
      if (v10)
      {
        int v16 = [(UINavigationBar *)self->super._navigationBar currentLeftView];

        if (v16 == v10)
        {
          id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [(_UINavigationBarVisualProviderLegacyIOS *)self _getTitleViewFrame:0 leftViewFrames:v17 rightViewFrames:0 forPreviousItem:v7 item:v8];
          double v18 = [v17 objectAtIndex:0];
          [v18 CGRectValue];
          objc_msgSend(v10, "setFrame:");

          [(UIView *)v15 addSubview:v10];
        }
      }
    }
    if (v10) {
      BOOL v19 = v5;
    }
    else {
      BOOL v19 = 0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __73___UINavigationBarVisualProviderLegacyIOS_setBackButtonVisible_animated___block_invoke;
    aBlock[3] = &unk_1E52DC3D0;
    id v20 = v10;
    BOOL v27 = v19;
    id v25 = v20;
    int v26 = self;
    uint64_t v21 = _Block_copy(aBlock);
    double v22 = v21;
    if (v4)
    {
      +[UINavigationBar defaultAnimationDuration];
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v22);
    }
    else
    {
      (*((void (**)(void *))v21 + 2))(v21);
    }
  }
}

- (BOOL)_shouldShowBackButtonForNavigationItem:(id)a3
{
  return 1;
}

- (id)_backButtonForBackItem:(id)a3 topItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6
    && ([v7 hidesBackButton] & 1) == 0
    && [(_UINavigationBarVisualProviderLegacyIOS *)self _shouldShowBackButtonForNavigationItem:v6])
  {
    double v9 = [v6 backButtonView];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (id)_defaultTitleFontForItem:(id)a3 fittingHeight:(double)a4 withScaleAdjustment:(double)a5
{
  id v8 = a3;
  double v9 = [(UINavigationBar *)self->super._navigationBar _currentVisualStyle];
  if (a5 == 0.0) {
    double v10 = 1.0;
  }
  else {
    double v10 = a5;
  }
  CGFloat v11 = [(UINavigationBar *)self->super._navigationBar _appearanceStorage];
  BOOL v12 = [v11 textAttributes];
  double v13 = [v12 objectForKey:*(void *)off_1E52D2040];

  if (v13)
  {
    [v13 pointSize];
    if (v14 != 0.0) {
      goto LABEL_17;
    }
    [v9 headingFontSize];
    double v16 = v15;
    id v17 = objc_msgSend(v13, "fontWithSize:");

    double v13 = [v8 _titleView];
    if (a4 > 0.0
      && [v13 isMemberOfClass:objc_opt_class()]
      && ([v17 lineHeight], v18 + 2.0 > a4))
    {
      do
      {
        BOOL v19 = [v17 fontWithSize:v16];

        double v16 = v16 + -1.0;
        [v19 lineHeight];
        id v17 = v19;
      }
      while (v20 + 2.0 > a4);
    }
    else
    {
      BOOL v19 = v17;
    }
    if (v10 < 1.0)
    {
      [v19 pointSize];
      uint64_t v24 = [v19 fontWithSize:v10 * v23];

      BOOL v19 = (void *)v24;
    }
  }
  else
  {
    [v9 headingFontSize];
    uint64_t v21 = objc_msgSend(off_1E52D39B8, "boldSystemFontOfSize:");
    double v13 = v21;
    if (v10 >= 1.0) {
      goto LABEL_17;
    }
    [v21 pointSize];
    BOOL v19 = [v13 fontWithSize:v10 * v22];
  }

  double v13 = v19;
LABEL_17:

  return v13;
}

- (void)_getLeftMargin:(double *)a3 rightMargin:(double *)a4 forNavigationItem:(id)a5 showingBackButton:(BOOL)a6 visualStyle:(id)a7
{
  id v32 = a5;
  id v12 = a7;
  [v12 textButtonMarginInNavigationBar:self->super._navigationBar];
  double v14 = v13;
  [v12 imageButtonMarginInNavigationBar:self->super._navigationBar];
  double v16 = v15;
  if (a3)
  {
    id v17 = [v32 _firstNonSpaceLeftItem];
    double v18 = v17;
    if (a6 || !v17)
    {
      [(UIView *)self->super._navigationBar _contentMargin];
      double v23 = v22;
      [v12 horizontalMarginAdjustment];
      double v20 = v23 - v24;
      if (v20 < 0.0) {
        double v20 = 0.0;
      }
    }
    else
    {
      int v19 = [v17 _isImageBarButtonItem];
      double v20 = v14;
      if (v19)
      {
        objc_msgSend(v18, "_leftImagePaddingForEdgeMarginInNavBar", v14);
        double v20 = v16 + v21;
      }
    }
    *a3 = v20;
  }
  if (a4)
  {
    id v25 = [v32 _firstNonSpaceRightItem];
    int v26 = v25;
    if (v25)
    {
      if ([v25 _isImageBarButtonItem])
      {
        [v26 _rightImagePaddingForEdgeMarginInNavBar];
        double v14 = v16 + v27;
      }
    }
    else
    {
      [(UIView *)self->super._navigationBar _contentMargin];
      double v29 = v28;
      [v12 horizontalMarginAdjustment];
      double v31 = v29 - v30;
      if (v31 >= 0.0) {
        double v14 = v31;
      }
      else {
        double v14 = 0.0;
      }
    }
    *a4 = v14;
  }
}

- (void)_getTitleViewFrame:(CGRect *)a3 leftViewFrames:(id)a4 rightViewFrames:(id)a5 forPreviousItem:(id)a6 item:(id)a7 returnedIdealWidthOfTextContent:(double *)a8 availableLayoutWidthForTextContent:(double *)a9 idealBackButtonWidth:(double *)a10
{
  uint64_t v504 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a5;
  id v419 = a6;
  id v17 = a7;
  if ([v15 count] || objc_msgSend(v16, "count"))
  {
    v385 = [MEMORY[0x1E4F28B00] currentHandler];
    [v385 handleFailureInMethod:a2 object:self file:@"_UINavigationBarVisualProviderLegacyIOS.m" lineNumber:842 description:@"Empty arrays required."];
  }
  double v18 = self;
  v423 = [(UINavigationBar *)self->super._navigationBar _currentVisualStyle];
  int v19 = [v17 _customLeftViews];
  double v20 = [v17 _customRightViews];
  v416 = v19;
  uint64_t v21 = [v19 count];
  v415 = v20;
  uint64_t v22 = [v20 count];
  double v23 = self->_contentView;
  double v24 = [(UIView *)self->super._navigationBar window];
  rect_24 = [(UIView *)self->super._navigationBar _screen];
  v411 = v23;
  [(UIView *)v23 bounds];
  double rect = v25;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  v410 = [(UINavigationBar *)self->super._navigationBar _effectiveDelegate];
  [v17 _fontScaleAdjustment];
  double v33 = v32;
  BOOL v89 = v32 == 0.0;
  double v34 = 1.0;
  if (!v89)
  {
    if ((unint64_t)a8 | (unint64_t)a9)
    {
      v386 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 1.0);
      double v18 = self;
      [v386 handleFailureInMethod:a2 object:self file:@"_UINavigationBarVisualProviderLegacyIOS.m" lineNumber:865 description:@"Not designed for collecting font scale information when already scaling"];

      double v34 = v33;
    }
    else
    {
      double v34 = v33;
      double v18 = self;
    }
  }
  double v446 = v34;
  size_t v420 = v21;
  size_t count = v22;
  uint64_t v35 = MEMORY[0x1E4F1DB28];
  v421 = [(_UINavigationBarVisualProviderLegacyIOS *)v18 _backButtonForBackItem:v419 topItem:v17];
  v422 = v17;
  double v36 = fabs(v31);
  BOOL v37 = fabs(v29) < 1.0 || v36 < 1.0;
  v433 = v24;
  if (v37)
  {
    double v38 = [v17 titleView];
    double v39 = v38;
    if (a3)
    {
      if (!v38)
      {
        CGSize v122 = *(CGSize *)(v35 + 16);
        a3->origiuint64_t n = *(CGPoint *)v35;
        a3->size = v122;
        if (v15) {
          goto LABEL_15;
        }
        goto LABEL_29;
      }
      [v38 frame];
      a3->origin.double x = v40;
      a3->origin.CGFloat y = v41;
      a3->size.CGFloat width = v42;
      a3->size.CGFloat height = v43;
    }
    if (v15)
    {
LABEL_15:
      if (v421
        && ([v17 hidesBackButton] & 1) == 0
        && (([v17 leftItemsSupplementBackButton] & 1) != 0 || !objc_msgSend(v416, "count")))
      {
        [v421 frame];
        CGFloat v45 = v44;
        CGFloat v47 = v46;
        CGFloat v49 = v48;
        CGFloat v51 = v50;
        v52 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
        [v15 addObject:v52];

        if (a10)
        {
          v505.origin.double x = v45;
          v505.origin.CGFloat y = v47;
          v505.size.CGFloat width = v49;
          v505.size.CGFloat height = v51;
          *a10 = CGRectGetWidth(v505);
        }
      }
      long long v491 = 0u;
      long long v489 = 0u;
      long long v490 = 0u;
      long long v488 = 0u;
      id v53 = v416;
      uint64_t v54 = [v53 countByEnumeratingWithState:&v488 objects:v503 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v489;
        do
        {
          for (uint64_t i = 0; i != v55; ++i)
          {
            if (*(void *)v489 != v56) {
              objc_enumerationMutation(v53);
            }
            double v58 = (void *)MEMORY[0x1E4F29238];
            [*(id *)(*((void *)&v488 + 1) + 8 * i) frame];
            v59 = objc_msgSend(v58, "valueWithCGRect:");
            [v15 addObject:v59];
          }
          uint64_t v55 = [v53 countByEnumeratingWithState:&v488 objects:v503 count:16];
        }
        while (v55);
      }

      id v17 = v422;
    }
LABEL_29:
    if (v16)
    {
      long long v486 = 0u;
      long long v487 = 0u;
      long long v484 = 0u;
      long long v485 = 0u;
      id v60 = v415;
      uint64_t v61 = [v60 countByEnumeratingWithState:&v484 objects:v502 count:16];
      if (v61)
      {
        uint64_t v62 = v61;
        uint64_t v63 = *(void *)v485;
        do
        {
          for (uint64_t j = 0; j != v62; ++j)
          {
            if (*(void *)v485 != v63) {
              objc_enumerationMutation(v60);
            }
            double v65 = (void *)MEMORY[0x1E4F29238];
            [*(id *)(*((void *)&v484 + 1) + 8 * j) frame];
            v66 = objc_msgSend(v65, "valueWithCGRect:");
            [v16 addObject:v66];
          }
          uint64_t v62 = [v60 countByEnumeratingWithState:&v484 objects:v502 count:16];
        }
        while (v62);
      }

      id v17 = v422;
    }
    if (a8) {
      *a8 = 0.0;
    }
    if (a9) {
      *a9 = 0.0;
    }

    goto LABEL_428;
  }
  v393 = a8;
  id rect_16 = v16;
  long long v482 = 0u;
  long long v483 = 0u;
  long long v480 = 0u;
  long long v481 = 0u;
  id v67 = v416;
  uint64_t v68 = [v67 countByEnumeratingWithState:&v480 objects:v501 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v481;
    do
    {
      for (uint64_t k = 0; k != v69; ++k)
      {
        if (*(void *)v481 != v70) {
          objc_enumerationMutation(v67);
        }
        v72 = *(void **)(*((void *)&v480 + 1) + 8 * k);
        if ([v72 _appearanceIsInvalid]) {
          +[_UIAppearance _applyInvocationsTo:v72 window:v24];
        }
      }
      uint64_t v69 = [v67 countByEnumeratingWithState:&v480 objects:v501 count:16];
    }
    while (v69);
  }

  long long v478 = 0u;
  long long v479 = 0u;
  long long v476 = 0u;
  long long v477 = 0u;
  obuint64_t j = v415;
  uint64_t v73 = [obj countByEnumeratingWithState:&v476 objects:v500 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v477;
    do
    {
      for (uint64_t m = 0; m != v74; ++m)
      {
        if (*(void *)v477 != v75) {
          objc_enumerationMutation(obj);
        }
        v77 = *(void **)(*((void *)&v476 + 1) + 8 * m);
        if ([v77 _appearanceIsInvalid]) {
          +[_UIAppearance _applyInvocationsTo:v77 window:v24];
        }
      }
      uint64_t v74 = [obj countByEnumeratingWithState:&v476 objects:v500 count:16];
    }
    while (v74);
  }

  id v78 = self;
  if (!v421
    || ([v17 hidesBackButton] & 1) != 0
    || [v67 count] && (objc_msgSend(v17, "leftItemsSupplementBackButton") & 1) == 0)
  {
    uint64_t v81 = [v17 _wantsBackButtonIndicator];
    unsigned int v80 = 0;
    int v79 = v81;
  }
  else
  {
    int v79 = 0;
    unsigned int v80 = 1;
    uint64_t v81 = 1;
  }
  int64_t v437 = [(UINavigationBar *)self->super._navigationBar _activeBarMetrics];
  BOOL v82 = [(UINavigationBar *)self->super._navigationBar isMinibar];
  double v475 = 0.0;
  double v474 = 0.0;
  if ([rect_24 _userInterfaceIdiom] == 2 || objc_msgSend(rect_24, "_userInterfaceIdiom") == 8)
  {
    [rect_24 overscanCompensationInsets];
    double v84 = v83;
    double v86 = v85;
    double v475 = v83;
    double v474 = v85;
  }
  else
  {
    [(_UINavigationBarVisualProviderLegacyIOS *)self _getLeftMargin:&v475 rightMargin:&v474 forNavigationItem:v17 showingBackButton:v81 visualStyle:v423];
    double v84 = v475;
    double v86 = v474;
  }
  [v423 buttonHeight];
  double v88 = v87;
  if (-[UIView _areAccessibilityButtonShapesEnabled]((uint64_t)self->super._navigationBar))
  {
    BOOL v89 = v437 == 1 || v437 == 102;
    int v90 = v89;
    long long v91 = _UINavigationButtonAccessibilityBackground(0, v90);
    [v91 size];
    double v88 = v92;
  }
  double v391 = v84;
  double v93 = v86 + v84;
  [v423 topMargin];
  UIRoundToViewScale(self->super._navigationBar);
  double v95 = v94;
  v402 = [(UINavigationBar *)self->super._navigationBar _appearanceStorage];
  v96 = [v17 title];
  v97 = [v17 titleView];
  v407 = v96;
  if (v97) {
    BOOL v398 = 0;
  }
  else {
    BOOL v398 = [v96 length] != 0;
  }
  double v448 = v29 - v93;
  double v453 = v27 + v95;

  v404 = [v17 titleView];
  CGFloat v394 = v31;
  CGFloat v395 = v27;
  if (v404)
  {
    v98 = [v17 titleView];
    [v98 frame];
    double v100 = v99;
    CGFloat v409 = v101;

    [v17 _idealCustomTitleWidth];
    if (v102 > v100)
    {
      [v17 _idealCustomTitleWidth];
      double v100 = v103;
    }
    [v17 _titleViewWidthForAnimations];
    size_t v104 = v420;
    if (v105 != 0.0)
    {
      [v17 _titleViewWidthForAnimations];
      double v100 = v106;
    }
    v107 = [v17 titleView];
    objc_msgSend(v107, "sizeThatFits:", v448, v88);
    double v387 = fmin(v100, 1000.0);
    double v109 = fmax(v387, v108);

    double v408 = v109;
    double v110 = v448 - v109;
    if (v398)
    {
      v396 = 0;
LABEL_96:
      double v123 = 0.0;
      goto LABEL_97;
    }
LABEL_95:
    [v402 titleVerticalAdjustmentForBarMetrics:v437];
    v396 = 0;
    goto LABEL_96;
  }
  if (!v398)
  {
    double v408 = *(double *)(v35 + 16);
    CGFloat v409 = *(double *)(v35 + 24);
    double v387 = 0.0;
    double v110 = v29 - v93;
    size_t v104 = v420;
    goto LABEL_95;
  }
  [v423 topTitleMargin];
  UIRoundToViewScale(self->super._navigationBar);
  double v112 = v111;
  [v17 _fontScaleAdjustment];
  CGFloat v409 = v112;
  uint64_t v114 = [(_UINavigationBarVisualProviderLegacyIOS *)self _defaultTitleFontForItem:v17 fittingHeight:v112 withScaleAdjustment:v113];
  v115 = [v402 textAttributes];
  uint64_t v116 = *(void *)off_1E52D2238;
  v117 = [v115 objectForKey:*(void *)off_1E52D2238];

  v396 = (void *)v114;
  if (v117)
  {
    v498[0] = *(void *)off_1E52D2040;
    v498[1] = v116;
    v499[0] = v114;
    v499[1] = v117;
    v118 = (void *)MEMORY[0x1E4F1C9E8];
    v119 = v499;
    v120 = v498;
    uint64_t v121 = 2;
  }
  else
  {
    uint64_t v496 = *(void *)off_1E52D2040;
    uint64_t v497 = v114;
    v118 = (void *)MEMORY[0x1E4F1C9E8];
    v119 = &v497;
    v120 = &v496;
    uint64_t v121 = 1;
  }
  id v164 = [v118 dictionaryWithObjects:v119 forKeys:v120 count:v121];

  v165 = (objc_class *)MEMORY[0x1E4F28B18];
  id v166 = v164;
  id v167 = v407;
  v168 = (void *)[[v165 alloc] initWithString:v167 attributes:v166];

  [v168 size];
  double v170 = v169;

  [v423 minTitleWidth];
  double v408 = v170;
  double v387 = fmin(v170, v171);
  double v123 = fmax(v387, v170) + 0.0;

  double v110 = v448;
  id v17 = v422;
  size_t v104 = v420;
LABEL_97:
  v392 = [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout shadowImage];
  if (v392) {
    char v124 = v82;
  }
  else {
    char v124 = 1;
  }
  if ((v124 & 1) == 0)
  {
    [v17 titleView];
  }
  UIRoundToViewScale(self->super._navigationBar);
  CGFloat v406 = v125;
  v454 = [MEMORY[0x1E4F1CA98] null];
  unint64_t v455 = v104 + v80;
  if (v455)
  {
    v434 = (double *)malloc_type_calloc(v104 + v80, 0x20uLL, 0x1000040E0EAB150uLL);
    v445 = (double *)malloc_type_calloc(v104, 8uLL, 0x100004000313F17uLL);
  }
  else
  {
    v434 = 0;
    v445 = 0;
  }
  v449 = [v17 _leftItemSpaceList];
  id v399 = v15;
  double v401 = v29;
  double v126 = v88;
  if (!v80)
  {
    unint64_t v149 = 0;
    int v403 = 0;
    double v150 = 0.0;
    double v388 = 0.0;
    size_t v133 = v455;
    v134 = (CGRect *)v434;
    goto LABEL_143;
  }
  [v423 minBackTextWidth];
  double v128 = v127;
  [(UIView *)self->_backIndicatorView frame];
  double Width = CGRectGetWidth(v506);
  v130 = [v421 _appearanceStorage];
  v131 = [v421 backgroundImageView];
  v132 = [v131 image];

  size_t v133 = v104 + v80;
  v134 = (CGRect *)v434;
  if (v132) {
    goto LABEL_113;
  }
  v132 = [v130 backButtonBackgroundImageForState:0 isMini:v82];
  if (v132) {
    BOOL v135 = 0;
  }
  else {
    BOOL v135 = v82;
  }
  if (v135)
  {
    v132 = [v130 backButtonBackgroundImageForState:0 isMini:0];
  }
  if (v132) {
    goto LABEL_113;
  }
  double v139 = 0.0;
  if (-[UIView _areAccessibilityButtonShapesEnabled]((uint64_t)self->super._navigationBar))
  {
    v132 = _UINavigationButtonAccessibilityBackground(1, v82);
    if (v132)
    {
LABEL_113:
      [v132 capInsets];
      double v137 = v136;
      double v139 = v138;
      goto LABEL_114;
    }
  }
  else
  {
    v132 = 0;
  }
  double v137 = 0.0;
LABEL_114:
  v140 = [v421 image];
  if (v140)
  {
    [v423 leftBackImageMargin];
    double v142 = fmax(v137, v141);
    [v423 rightImageMargin];
    double v144 = fmax(v139, v143);
    [v421 imageSize];
    double v146 = v144 + v142 + v145;
    [v423 minBackImageWidth];
    int v403 = 0;
    double v148 = fmax(v146, v144 + v142 + v147);
    double v388 = v148;
  }
  else
  {
    double v148 = v128 + Width;
    v151 = [v421 title];
    v152 = [v419 _abbreviatedBackButtonTitles];
    v153 = [v152 lastObject];
    int v403 = [v151 isEqualToString:v153];

    if (v151)
    {
      double v388 = v148;
      size_t v133 = v455;
      v134 = (CGRect *)v434;
      if ([v151 length])
      {
        v154 = [v421 _defaultFont];
        [v423 leftBackTitleMarginForCustomBackButtonBackground:v132];
        double v156 = v155;
        [v423 rightTitleMargin];
        double v158 = v156 + v446 * fmax(v139, v157);
        [v423 backButtonIndicatorSpacing];
        double v160 = (v446 + -1.0) * v159 + v158;
        v134 = (CGRect *)v434;
        [v423 minBackTextWidth];
        double v162 = v161 + v160;
        objc_msgSend(v151, "_legacy_sizeWithFont:", v154);
        double v388 = v162;
        double v148 = fmax(v163 + v160, v162);

        size_t v133 = v455;
      }
    }
    else
    {
      double v388 = v148;
      size_t v133 = v455;
      v134 = (CGRect *)v434;
    }
  }
  if (a10) {
    *a10 = v148;
  }
  [v423 maxBackButtonProportion];
  double v173 = v172;
  v507.origin.double x = rect;
  v507.size.CGFloat height = v394;
  v507.origin.CGFloat y = v395;
  v507.size.CGFloat width = v29;
  double v174 = floor(v173 * CGRectGetWidth(v507));
  [(UINavigationBar *)self->super._navigationBar _requestedMaxBackButtonWidth];
  if (v175 > 0.0)
  {
    [(UINavigationBar *)self->super._navigationBar _requestedMaxBackButtonWidth];
    double v174 = fmin(v174, v176);
  }
  double v150 = fmin(v148, v174);
  if (v140)
  {
    double v177 = v150;
  }
  else
  {
    [v423 backButtonIndicatorSpacing];
    double v177 = v446 * v178;
    double v123 = v123 + v150 - v446 * v178;
  }
  [(UINavigationBar *)self->super._navigationBar defaultBackButtonAlignmentHeight];
  v134->size.CGFloat width = v150;
  v134->size.CGFloat height = v179;
  v134->origin.CGFloat y = v453 + floor((v126 - v179) * 0.5);
  double v473 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v421, "_hasBaselineAlignedAbsoluteVerticalPosition:withinNavBar:forSize:", &v473, self->super._navigationBar, v134->size.width, v134->size.height))
  {
    double v180 = v473;
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      [v421 _backgroundVerticalPositionAdjustmentForBarMetrics:v437];
      v134->origin.CGFloat y = v181 + v134->origin.y;
    }
    if ([v421 hasCustomBackgroundImage]) {
      goto LABEL_142;
    }
    double v180 = v134->origin.y + -1.0;
  }
  v134->origin.CGFloat y = v180;
LABEL_142:
  double v110 = v110 - v177;

  unint64_t v149 = 1;
  id v78 = self;
LABEL_143:
  [v423 interItemSpace];
  double v183 = v182;
  if (v149 >= v133) {
    goto LABEL_157;
  }
  v184 = [v449 objectAtIndex:v149 - v80];
  v185 = v184;
  if (!v184 || v184 == v454)
  {
    double v186 = 0.0;
    if (v80 | v79) {
      double v186 = v183;
    }
  }
  else
  {
    double v186 = totalSpaceForSpaceItems(v184, v80, v183);
  }
  if (v403) {
    double v186 = v186 + v186;
  }
  double v187 = v446 * v186;
  v445[v149 - v80] = v446 * v186;
  p_double x = &v134[v149].origin.x;
  *p_double x = v446 * v186;
  if (v80)
  {
    double MaxX = CGRectGetMaxX(*v134);
LABEL_155:
    *p_double x = MaxX + *p_x;
    goto LABEL_156;
  }
  if (v79)
  {
    [(UIView *)v78->_backIndicatorView frame];
    double MaxX = CGRectGetWidth(v508);
    goto LABEL_155;
  }
LABEL_156:
  double v123 = v123 + v187;

LABEL_157:
  double v397 = v150;
  v429 = [MEMORY[0x1E4F28E60] indexSet];
  long long v469 = 0u;
  long long v470 = 0u;
  long long v471 = 0u;
  long long v472 = 0u;
  id v451 = v67;
  uint64_t v190 = [v451 countByEnumeratingWithState:&v469 objects:v495 count:16];
  unsigned int v450 = v80;
  if (v190)
  {
    uint64_t v191 = v190;
    uint64_t v435 = 0;
    uint64_t v192 = *(void *)v470;
    do
    {
      uint64_t v193 = 0;
      uint64_t p_size = (uint64_t)&v134[v149].size;
      do
      {
        if (*(void *)v470 != v192) {
          objc_enumerationMutation(v451);
        }
        v195 = *(void **)(*((void *)&v469 + 1) + 8 * v193);
        int v196 = _barItemHidden(v195);
        if (v196)
        {
          *(void *)(p_size - 8) = 0;
          *(_OWORD *)uint64_t p_size = *MEMORY[0x1E4F1DB30];
          goto LABEL_179;
        }
        if ([v195 _appearanceIsInvalid]) {
          [v195 layoutBelowIfNeeded];
        }
        [v195 frame];
        objc_msgSend(v195, "alignmentRectForFrame:");
        double v198 = v197;
        double v200 = v199;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([v195 titleForState:0],
              v201 = objc_claimAutoreleasedReturnValue(),
              uint64_t v202 = [v201 length],
              v201,
              v202))
        {
          double v123 = v123 + v198;
          [v429 addIndex:v435 + v193];
        }
        else
        {
          double v110 = v110 - v198;
        }
        *(double *)uint64_t p_size = v198;
        *(double *)(p_size + 8) = v200;
        *(double *)(p_size - 8) = v453 + floor((v126 - v200) * 0.5);
        double v473 = 0.0;
        unsigned int v80 = v450;
        if ((objc_opt_respondsToSelector() & 1) != 0
          && objc_msgSend(v195, "_hasBaselineAlignedAbsoluteVerticalPosition:withinNavBar:forSize:", &v473, self->super._navigationBar, v434[2], v434[3]))
        {
          double v203 = v473;
LABEL_178:
          *(double *)(p_size - 8) = v203;
          goto LABEL_179;
        }
        if (objc_opt_respondsToSelector())
        {
          [v195 _backgroundVerticalPositionAdjustmentForBarMetrics:v437];
          *(double *)(p_size - 8) = v204 + *(double *)(p_size - 8);
        }
        if (objc_opt_respondsToSelector())
        {
          v205 = [v195 _appearanceStorage];
          v206 = [v205 anyBackgroundImage];

          if (!v206)
          {
            double v203 = *(double *)(p_size - 8) + -1.0;
            goto LABEL_178;
          }
        }
LABEL_179:
        if (v149 + v193 + 1 < v455)
        {
          if (v80) {
            uint64_t v207 = v149 + v193;
          }
          else {
            uint64_t v207 = v149 + v193 + 1;
          }
          v208 = [v449 objectAtIndex:v207];
          v209 = v208;
          if (!v208 || v208 == v454)
          {
            if (v196) {
              double v210 = 0.0;
            }
            else {
              double v210 = v183;
            }
          }
          else
          {
            double v210 = totalSpaceForSpaceItems(v208, v196 ^ 1u, v183);
          }
          double v211 = v446 * v210;
          v445[v207] = v446 * v210;
          *(double *)(p_size + 16) = v446 * v210 + CGRectGetMaxX(*(CGRect *)(p_size - 16));
          double v123 = v123 + v211;
        }
        ++v193;
        p_size += 32;
      }
      while (v191 != v193);
      uint64_t v191 = [v451 countByEnumeratingWithState:&v469 objects:v495 count:16];
      v435 += v193;
      v149 += v193;
    }
    while (v191);
  }

  unint64_t v212 = v420;
  v213 = [v449 objectAtIndex:v420];
  [v423 interBlockSpace];
  double v215 = v214;
  double v216 = 0.0;
  double v217 = 0.0;
  if (v213 && v213 != v454)
  {
    double v217 = totalSpaceForSpaceItems(v213, 0, v183);
    double v216 = 0.0;
  }
  double v390 = v217;
  id v15 = v399;
  id v16 = rect_16;
  id v17 = v422;
  double v24 = v433;
  unint64_t v218 = count;
  unint64_t v219 = v455;
  if (v434) {
    double v216 = CGRectGetMaxX(*(CGRect *)&v434[4 * v455 - 4]);
  }
  v389 = v213;
  double v405 = v216;
  if (count)
  {
    v220 = (CGRect *)malloc_type_calloc(count, 0x20uLL, 0x1000040E0EAB150uLL);
    v426 = (double *)malloc_type_calloc(count, 8uLL, 0x100004000313F17uLL);
  }
  else
  {
    v220 = 0;
    v426 = 0;
  }
  v221 = [v422 _rightItemSpaceList];
  v427 = [MEMORY[0x1E4F28E60] indexSet];
  v428 = v220;
  v432 = v221;
  if (v220 && v426)
  {
    long long v467 = 0u;
    long long v468 = 0u;
    long long v465 = 0u;
    long long v466 = 0u;
    id v439 = obj;
    uint64_t v222 = [v439 countByEnumeratingWithState:&v465 objects:v494 count:16];
    if (!v222) {
      goto LABEL_235;
    }
    uint64_t v223 = v222;
    uint64_t v224 = 0;
    uint64_t v442 = *(void *)v466;
    p_CGFloat height = (char *)&v220->size.height;
    while (1)
    {
      uint64_t v225 = 0;
      v226 = (double *)&p_height[32 * v224];
      do
      {
        if (*(void *)v466 != v442) {
          objc_enumerationMutation(v439);
        }
        uint64_t v227 = v224 + v225;
        v228 = *(void **)(*((void *)&v465 + 1) + 8 * v225);
        v229 = [v221 objectAtIndex:v224 + v225];
        v230 = v229;
        if (!v229 || v229 == v454)
        {
          if (v227) {
            double v231 = v183;
          }
          else {
            double v231 = 0.0;
          }
        }
        else
        {
          double v231 = totalSpaceForSpaceItems(v229, v227 != 0, v183);
        }
        v426[v224 + v225] = v231;
        if (_barItemHidden(v228))
        {
          *(v226 - 2) = 0.0;
          *(_OWORD *)(v226 - 1) = *MEMORY[0x1E4F1DB30];
          goto LABEL_231;
        }
        if ([v228 _appearanceIsInvalid]) {
          [v228 layoutBelowIfNeeded];
        }
        [v228 frame];
        objc_msgSend(v228, "alignmentRectForFrame:");
        double v233 = v232;
        uint64_t v235 = v234;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([v228 titleForState:0],
              v236 = objc_claimAutoreleasedReturnValue(),
              uint64_t v237 = [v236 length],
              v236,
              v221 = v432,
              v237))
        {
          double v123 = v123 + v233;
          [v427 addIndex:v224 + v225];
        }
        else
        {
          double v110 = v110 - v233;
        }
        *(v226 - 1) = v233;
        *(void *)v226 = v235;
        double v473 = 0.0;
        double v24 = v433;
        if ((objc_opt_respondsToSelector() & 1) != 0
          && objc_msgSend(v228, "_hasBaselineAlignedAbsoluteVerticalPosition:withinNavBar:forSize:", &v473, self->super._navigationBar, v428->size.width, v428->size.height))
        {
          double v238 = v473;
        }
        else
        {
          *(v226 - 2) = v453 + floor((v126 - *v226) * 0.5);
          if (objc_opt_respondsToSelector())
          {
            [v228 _backgroundVerticalPositionAdjustmentForBarMetrics:v437];
            *(v226 - 2) = v239 + *(v226 - 2);
          }
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            goto LABEL_230;
          }
          v240 = [v228 _appearanceStorage];
          v241 = [v240 anyBackgroundImage];

          v221 = v432;
          if (v241) {
            goto LABEL_230;
          }
          double v238 = *(v226 - 2) + -1.0;
        }
        *(v226 - 2) = v238;
LABEL_230:
        double v110 = v110 - v231;
LABEL_231:
        double MinX = v448;
        if (v227) {
          double MinX = CGRectGetMinX(*(CGRect *)(v226 - 7));
        }
        *(v226 - 3) = MinX - v231 - *(v226 - 1);

        ++v225;
        v226 += 4;
      }
      while (v223 != v225);
      uint64_t v223 = [v439 countByEnumeratingWithState:&v465 objects:v494 count:16];
      v224 += v225;
      if (!v223)
      {
LABEL_235:

        id v15 = v399;
        id v16 = rect_16;
        id v17 = v422;
        unint64_t v218 = count;
        unsigned int v80 = v450;
        unint64_t v212 = v420;
        unint64_t v219 = v455;
        break;
      }
    }
  }
  v243 = [v221 objectAtIndex:v218];

  double v244 = 0.0;
  double v245 = 0.0;
  if (v243 && v243 != v454)
  {
    double v245 = totalSpaceForSpaceItems(v243, 0, v183);
    double v244 = 0.0;
  }
  v430 = v243;
  if (v428)
  {
    double v246 = CGRectGetMaxX(*v428);
    double v244 = v246 - CGRectGetMinX(v428[v218 - 1]);
  }
  double v247 = v215;
  double v248 = fmax(v215, v390);
  double v440 = v244;
  if (v80)
  {
    v249 = [v421 title];
    uint64_t v250 = [v249 length];
    double v251 = v405;
    BOOL v253 = v408 > v448 - v405 - v440 && v250 == 0;

    double v244 = v440;
  }
  else
  {
    BOOL v253 = 0;
    double v251 = v405;
  }
  double v254 = fmax(v247, v245);
  int v255 = v253 & (v403 ^ 1);
  if (v251 == 0.0) {
    int v255 = 1;
  }
  if (v244 == 0.0 && v408 == 0.0) {
    double v257 = 0.0;
  }
  else {
    double v257 = v248;
  }
  if (v255) {
    double v258 = 0.0;
  }
  else {
    double v258 = v257;
  }
  if (((v403 ^ 1) & 1) == 0 && !objc_msgSend(v451, "count", v257)) {
    double v258 = v258 + v258;
  }
  double v259 = rect + v391;
  if (v408 == 0.0 || v440 == 0.0) {
    double v261 = 0.0;
  }
  else {
    double v261 = v254;
  }
  double v438 = v446 * v261;
  double v431 = v446 * v258;
  double v400 = v446 * v261 + v446 * v258;
  double v262 = v448 - (v408 + v405 + v440 + v400);
  if (v262 >= 0.0)
  {
    BOOL v277 = 0;
    unint64_t v268 = v218;
    double v276 = v408;
    double v282 = v408;
    double v280 = v401;
    v269 = v428;
    goto LABEL_304;
  }
  double v263 = v408 + v397 + v262;
  if (v446 < 1.0 && v263 < v387 + v388 && (v212 > 1 || v218 >= 2))
  {
    unint64_t v264 = v212 ? v80 + 1 : v80;
    unint64_t v265 = v218 != 0;
    BOOL v266 = v218 > v265;
    BOOL v267 = v219 > v264;
    if (v219 > v264 || v218 > v265)
    {
      BOOL v320 = v218 - v265 > v219 - v264;
      unint64_t v268 = v218;
      v269 = v428;
      unint64_t v444 = v264;
      while (!v267 || v320 && v268 != v265)
      {
        if (v266 && (v320 || v219 == v264))
        {
          unint64_t v456 = v219;
          unint64_t v328 = v268 - 1;
          unint64_t v329 = v268;
          v327 = &v269[v268 - 1];
          double v324 = v327->size.width;
          v326 = v269;
          double v325 = CGRectGetMinX(v269[v329 - 2]);
          unint64_t v321 = v328;
          unint64_t v219 = v456;
          goto LABEL_357;
        }
LABEL_358:
        double v263 = v408 + v397 + v262;
        if (v262 < 0.0 && v263 < v387 + v388)
        {
          BOOL v266 = v268 > v265;
          BOOL v320 = v268 - v265 > v219 - v264;
          BOOL v267 = v219 > v264;
          if (v219 > v264 || v268 > v265) {
            continue;
          }
        }
        goto LABEL_281;
      }
      unint64_t v321 = v268;
      unint64_t v322 = v219--;
      v323 = &v434[4 * v219];
      v512.origin.double x = *v323;
      v512.origin.CGFloat y = v323[1];
      double v324 = v323[2];
      v512.size.CGFloat height = v323[3];
      v512.size.CGFloat width = v324;
      double v325 = CGRectGetMinX(v512);
      v326 = v428;
      v327 = (CGRect *)&v434[4 * v322 - 8];
LABEL_357:
      double v262 = v262 + v324 + v325 - CGRectGetMaxX(*v327);
      unint64_t v268 = v321;
      v269 = v326;
      unint64_t v264 = v444;
      goto LABEL_358;
    }
  }
  unint64_t v268 = v218;
  v269 = v428;
LABEL_281:
  double v270 = fmin(v397, fmax(v263 * 0.4, v388));
  double v271 = fmin(v408, fmax(v263 - v270, v387));
  int v272 = v80 ^ 1;
  if (v271 >= v408) {
    int v272 = 1;
  }
  int v273 = v272 | v403;
  double v274 = fmin(v408, v270 - v388 + v271);
  if (v273) {
    double v275 = v270;
  }
  else {
    double v275 = v388;
  }
  if (v273) {
    double v276 = v271;
  }
  else {
    double v276 = v274;
  }
  BOOL v277 = v276 + v275 > v263;
  double v262 = v263 - (v276 + v275);
  UIRoundToViewScale(self->super._navigationBar);
  if (v278 <= 0.0)
  {
    double v280 = v401;
  }
  else
  {
    BOOL v279 = v275 < v397 || v276 < v408;
    double v280 = v401;
    if (v279)
    {
      if (v276 == v408)
      {
        double v281 = fmin(v262, v397 - v275);
        double v262 = v262 - v281;
        double v275 = v275 + v281;
      }
      else
      {
        double v331 = v408 - v276;
        if (v275 == v397)
        {
          double v332 = fmin(v262, v331);
          double v262 = v262 - v332;
        }
        else
        {
          double v383 = fmin(v262 * 0.4, v397 - v275);
          double v332 = fmin(v262 - v383, v331);
          double v262 = v262 - (v383 + v332);
          double v275 = v275 + v383;
        }
        double v276 = v276 + v332;
      }
    }
  }
  unint64_t v455 = v219;
  if (v80)
  {
    UIRoundToViewScale(self->super._navigationBar);
    *((void *)v434 + 2) = v283;
    if (v219 >= 2)
    {
      v284 = v434 + 4;
      for (uint64_t n = 1; n != v219; ++n)
      {
        double *v284 = *v284 - (v397 - v275);
        v284 += 4;
      }
    }
  }
  double v282 = v408;
LABEL_304:
  unint64_t v286 = [v17 _leftFlexibleSpaceCount];
  unint64_t v436 = [v17 _rightFlexibleSpaceCount];
  double v447 = v276;
  double v443 = (v280 - v276) * 0.5 - v259;
  unint64_t v287 = v268;
  if (v282 != 0.0)
  {
    if (v434) {
      double v288 = CGRectGetMaxX(*(CGRect *)&v434[4 * v455 - 4]);
    }
    else {
      double v288 = 0.0;
    }
    double v425 = v288;
    double v289 = v448;
    if (v269) {
      double v289 = CGRectGetMinX(v269[v268 - 1]);
    }
    v509.origin.double x = (v280 - v276) * 0.5 - v259;
    v509.origin.CGFloat y = v406;
    double v290 = v276;
    v509.size.CGFloat width = v276;
    v509.size.CGFloat height = v409;
    if (CGRectGetMinX(v509) < v431 + v425
      || (v510.origin.double x = v443,
          v510.origin.CGFloat y = v406,
          v510.size.CGFloat width = v276,
          v510.size.CGFloat height = v409,
          CGRectGetMaxX(v510) > v289 - v438))
    {
      double v291 = fmin(v289 - v425 - v431 - v438, v408) - v276;
      if (v398)
      {
        [v407 sizeWithFont:v396 forWidth:4 lineBreakMode:v447 + v291 letterSpacing:0.0];
        double v290 = v447;
        double v291 = fmax(v292 + 1.0 - v447, 0.0);
      }
      double v293 = v290 + v291;
      if ((v286 != 0) != (v436 != 0))
      {
        BOOL v294 = v286 == 0;
      }
      else
      {
        v511.origin.double x = rect + v391;
        v511.origin.CGFloat y = v453;
        v511.size.CGFloat width = v448;
        v511.size.CGFloat height = v126;
        CGFloat MidX = CGRectGetMidX(v511);
        BOOL v294 = v425 - MidX > MidX - v289;
      }
      double v262 = v262 - v291;
      double v447 = v293;
      double v296 = v289 - v438 - v293;
      if (v294) {
        double v296 = v431 + v425;
      }
      double v443 = v296;
    }
    double v280 = v401;
  }
  if (v262 <= 0.0 || !(v286 | v436)) {
    goto LABEL_384;
  }
  if (v434 && v286)
  {
    CGFloat height = v409;
    double x = v443;
    CGFloat y = v406;
    double v300 = v447;
    if (v408 == 0.0)
    {
      if (v440 == 0.0) {
        goto LABEL_329;
      }
      v301 = &v428[v268];
      double x = v301[-1].origin.x;
      CGFloat y = v301[-1].origin.y;
      double v300 = v301[-1].size.width;
      CGFloat height = v301[-1].size.height;
    }
    double v448 = CGRectGetMinX(*(CGRect *)&x);
LABEL_329:
    double v302 = CGRectGetMaxX(*(CGRect *)&v434[4 * v455 - 4]);
    if (v420)
    {
      uint64_t v303 = 0;
      double v304 = (v448 - v431 - v302) / (double)v286;
      double v305 = 0.0;
      do
      {
        if (v80) {
          uint64_t v306 = v303 + 1;
        }
        else {
          uint64_t v306 = v303;
        }
        v307 = [v449 objectAtIndex:v303];
        v308 = v307;
        v309 = &v434[4 * v306];
        double *v309 = v305 + *v309;
        if (v307 && v307 != v454)
        {
          long long v463 = 0u;
          long long v464 = 0u;
          long long v461 = 0u;
          long long v462 = 0u;
          id v310 = v307;
          uint64_t v311 = [v310 countByEnumeratingWithState:&v461 objects:v493 count:16];
          if (v311)
          {
            uint64_t v312 = v311;
            uint64_t v313 = *(void *)v462;
            do
            {
              for (iuint64_t i = 0; ii != v312; ++ii)
              {
                if (*(void *)v462 != v313) {
                  objc_enumerationMutation(v310);
                }
                if ([*(id *)(*((void *)&v461 + 1) + 8 * ii) systemItem] == 5)
                {
                  double *v309 = v304 + *v309;
                  double v305 = v304 + v305;
                }
              }
              uint64_t v312 = [v310 countByEnumeratingWithState:&v461 objects:v493 count:16];
            }
            while (v312);
          }

          id v16 = rect_16;
          id v17 = v422;
          double v24 = v433;
        }
        ++v303;

        unsigned int v80 = v450;
      }
      while (v303 != v420);
    }
  }
  if (v428 && v436)
  {
    CGFloat v315 = v409;
    double v316 = v443;
    CGFloat v317 = v406;
    double v318 = v447;
    if (v408 == 0.0)
    {
      double v319 = 0.0;
      if (v405 == 0.0)
      {
LABEL_369:
        double v333 = CGRectGetMinX(v428[v287 - 1]);
        if (count)
        {
          uint64_t v334 = 0;
          double v335 = (v333 - (v438 + v319)) / (double)v436;
          double v336 = 0.0;
          do
          {
            v337 = [v432 objectAtIndex:v334];
            v338 = v337;
            v339 = &v428[v334].origin.x;
            double *v339 = *v339 - v336;
            if (v337 && v337 != v454)
            {
              long long v459 = 0u;
              long long v460 = 0u;
              long long v457 = 0u;
              long long v458 = 0u;
              id v340 = v337;
              uint64_t v341 = [v340 countByEnumeratingWithState:&v457 objects:v492 count:16];
              if (v341)
              {
                uint64_t v342 = v341;
                uint64_t v343 = *(void *)v458;
                do
                {
                  for (juint64_t j = 0; jj != v342; ++jj)
                  {
                    if (*(void *)v458 != v343) {
                      objc_enumerationMutation(v340);
                    }
                    if ([*(id *)(*((void *)&v457 + 1) + 8 * jj) systemItem] == 5)
                    {
                      double *v339 = *v339 - v335;
                      double v336 = v335 + v336;
                    }
                  }
                  uint64_t v342 = [v340 countByEnumeratingWithState:&v457 objects:v492 count:16];
                }
                while (v342);
              }

              id v16 = rect_16;
              id v17 = v422;
              double v24 = v433;
            }

            ++v334;
            unsigned int v80 = v450;
          }
          while (v334 != count);
        }
        goto LABEL_384;
      }
      v384 = &v434[4 * v455];
      double v316 = *(v384 - 4);
      CGFloat v317 = *(v384 - 3);
      double v318 = *(v384 - 2);
      CGFloat v315 = *(v384 - 1);
    }
    double v319 = CGRectGetMaxX(*(CGRect *)&v316);
    goto LABEL_369;
  }
LABEL_384:

  if (a3)
  {
    UIRoundToViewScale(self->super._navigationBar);
    double v443 = v345;
    UICeilToViewScale(self->super._navigationBar);
    CGFloat v347 = v346;
    v348 = v407;
    double v447 = v346;
    if (!v277)
    {
      uint64_t v349 = [v17 titleView];
      CGFloat v347 = v447;
      if (v349)
      {
        v350 = (void *)v349;
        [v17 _idealCustomTitleWidth];
        double v352 = v351;

        CGFloat v347 = v447;
        if (v352 == 0.0)
        {
          [v17 _setIdealCustomTitleWidth:v447];
          CGFloat v347 = v447;
        }
      }
    }
    a3->origin.double x = v443;
    a3->origin.CGFloat y = v406;
    a3->size.CGFloat width = v347;
    a3->size.CGFloat height = v409;
  }
  else
  {
    v348 = v407;
  }
  if (v434)
  {
    if (v15 && v455)
    {
      uint64_t v353 = 0;
      v354 = v434 + 2;
      do
      {
        if (v80)
        {
          if (!v353)
          {
            id v357 = v421;
            goto LABEL_400;
          }
          uint64_t v355 = v353 - 1;
          v356 = v451;
        }
        else
        {
          v356 = v451;
          uint64_t v355 = v353;
        }
        id v357 = [v356 objectAtIndex:v355];

LABEL_400:
        double v358 = *(v354 - 1);
        double v359 = v354[1];
        UIRoundToViewScale(self->super._navigationBar);
        double v361 = v360;
        UICeilToViewScale(self->super._navigationBar);
        double v363 = v362;
        if ((_barItemHidden(v357) & 1) == 0)
        {
          objc_msgSend(v357, "frameForAlignmentRect:", v361, v358, v363, v359);
          double v361 = v364;
          double v358 = v365;
          double v363 = v366;
          double v359 = v367;
        }
        v368 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v361, v358, v363, v359);
        [v15 addObject:v368];

        ++v353;
        v354 += 4;
      }
      while (v455 != v353);
    }
    free(v434);
    free(v445);
    id v17 = v422;
    v348 = v407;
  }
  if (v428)
  {
    if (v16 && v287)
    {
      uint64_t v369 = 0;
      v370 = &v428->size;
      do
      {
        v371 = [obj objectAtIndex:v369];
        double v372 = v370[-1].height;
        double v373 = v370->height;
        UIRoundToViewScale(self->super._navigationBar);
        double v375 = v374;
        UICeilToViewScale(self->super._navigationBar);
        double v377 = v376;
        if ((_barItemHidden(v371) & 1) == 0)
        {
          objc_msgSend(v371, "frameForAlignmentRect:", v375, v372, v377, v373);
          double v375 = v378;
          double v372 = v379;
          double v377 = v380;
          double v373 = v381;
        }
        v382 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v375, v372, v377, v373);
        [v16 addObject:v382];

        ++v369;
        v370 += 2;
      }
      while (v287 != v369);
    }
    free(v428);
    free(v426);
    id v17 = v422;
    v348 = v407;
  }
  if ((*((_DWORD *)&self->super._navigationBar->super._viewFlags + 4) & 0x80000) != 0)
  {
    if (v15 && [v15 count]) {
      _UIRTLConvertAllLTRFramesToRTL(v15, rect, v395, v280, v394);
    }
    if (v16 && [v16 count]) {
      _UIRTLConvertAllLTRFramesToRTL(v16, rect, v395, v280, v394);
    }
    if (a3)
    {
      v513.origin.double x = rect;
      v513.size.CGFloat height = v394;
      v513.origin.CGFloat y = v395;
      v513.size.CGFloat width = v280;
      a3->origin.double x = CGRectGetMaxX(v513) - v447 - v443;
      a3->origin.CGFloat y = v406;
      a3->size.CGFloat width = v447;
      a3->size.CGFloat height = v409;
    }
  }
  if (v393) {
    double *v393 = v123 + v400;
  }
  if (a9) {
    *a9 = v110;
  }

LABEL_428:
}

- (void)_getTitleViewFrame:(CGRect *)a3 leftViewFrames:(id)a4 rightViewFrames:(id)a5 forPreviousItem:(id)a6 item:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    id v16 = [(_UINavigationBarVisualProviderLegacyIOS *)self _backButtonForBackItem:v14 topItem:v15];
    id v17 = [v15 _customLeftViews];
    double v18 = [v15 _abbreviatedBackButtonTitles];
    unint64_t v19 = [v18 count];

    if ([v16 _abbreviatedTitleIndex] >= v19) {
      [v16 _setAbbreviatedTitleIndex:0x7FFFFFFFFFFFFFFFLL];
    }
    if (v16 && v19)
    {
      double v20 = [v16 image];
      if (!v20
        && [v16 _abbreviatedTitleIndex] == 0x7FFFFFFFFFFFFFFFLL
        && ([v15 hidesBackButton] & 1) == 0
        && (![v17 count] || objc_msgSend(v15, "leftItemsSupplementBackButton")))
      {
        double v26 = 0.0;
        [(_UINavigationBarVisualProviderLegacyIOS *)self _getTitleViewFrame:a3 leftViewFrames:v12 rightViewFrames:v13 forPreviousItem:v14 item:v15 returnedIdealWidthOfTextContent:0 availableLayoutWidthForTextContent:0 idealBackButtonWidth:&v26];
        if (v12)
        {
          while (1)
          {
            uint64_t v21 = [v12 objectAtIndexedSubscript:0];
            [v21 CGRectValue];
            double Width = CGRectGetWidth(v27);
            double v23 = v26;

            if (Width >= v23) {
              break;
            }
            uint64_t v24 = [v16 _abbreviatedTitleIndex];
            unint64_t v25 = v24 == 0x7FFFFFFFFFFFFFFFLL ? 0 : v24 + 1;
            if (v25 >= v19) {
              break;
            }
            objc_msgSend(v16, "_setAbbreviatedTitleIndex:");
            if ([v16 _abbreviatedTitleIndex] == 0x7FFFFFFFFFFFFFFFLL) {
              [v16 _setAbbreviatedTitleIndex:0];
            }
            [v12 removeAllObjects];
            [v13 removeAllObjects];
            [(_UINavigationBarVisualProviderLegacyIOS *)self _getTitleViewFrame:a3 leftViewFrames:v12 rightViewFrames:v13 forPreviousItem:v14 item:v15 returnedIdealWidthOfTextContent:0 availableLayoutWidthForTextContent:0 idealBackButtonWidth:&v26];
          }
        }
        goto LABEL_22;
      }
    }
    double v26 = 0.0;
    [(_UINavigationBarVisualProviderLegacyIOS *)self _getTitleViewFrame:a3 leftViewFrames:v12 rightViewFrames:v13 forPreviousItem:v14 item:v15 returnedIdealWidthOfTextContent:0 availableLayoutWidthForTextContent:0 idealBackButtonWidth:&v26];
LABEL_22:
  }
}

- (double)_backTitleWidthOverTitleWidthForMatchingBackButtonView:(id)a3 titleView:(id)a4 withBackButtonWidth:(double)a5
{
  id v8 = a3;
  navigationBar = self->super._navigationBar;
  id v10 = a4;
  CGFloat v11 = [(UINavigationBar *)navigationBar _currentVisualStyle];
  [v10 bounds];
  double Width = CGRectGetWidth(v23);
  [v10 _titleSize];
  double v14 = v13;

  BOOL v15 = Width == 0.0 || v14 > Width;
  double v16 = 1.0;
  if (!v15)
  {
    objc_msgSend(v11, "leftBackTitleMarginForCustomBackButtonBackground:", 0, 1.0);
    double v18 = a5 - v17;
    [v8 _titleSize];
    BOOL v20 = v19 > v18 || v18 == 0.0;
    double v16 = v19 / Width;
    if (v20) {
      double v16 = 1.0;
    }
  }
  if (fabs(v16) >= 0.1) {
    double v21 = v16;
  }
  else {
    double v21 = 1.0;
  }

  return v21;
}

- (unint64_t)_subviewIndexAboveBackground
{
  if ([(UIView *)self->super._navigationBar _canDrawContent]) {
    return 0;
  }
  if (self->_contentView == &self->super._navigationBar->super) {
    return 0;
  }
  BOOL v3 = [(UIView *)self->_backgroundView superview];
  navigationBar = self->super._navigationBar;

  if (v3 != navigationBar) {
    return 0;
  }
  id v7 = [(UIView *)self->super._navigationBar subviews];
  unint64_t v5 = [v7 indexOfObject:self->_backgroundView] + 1;

  return v5;
}

- (void)_wrapView:(id)a3 inClippingViewWithLeftBoundary:(double)a4 rightBoundary:(double)a5 leftMaskImage:(id)a6 leftMaskIsChevron:(BOOL)a7 rightMaskImage:(id)a8
{
  BOOL v9 = a7;
  unint64_t v46 = (unint64_t)a6;
  unint64_t v14 = (unint64_t)a8;
  navigationBar = self->super._navigationBar;
  id v16 = a3;
  [(UIView *)navigationBar bounds];
  double v18 = v17;
  double v20 = v19;
  double v21 = a5 - a4;
  uint64_t v22 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", a4, v17, v21, v19);
  -[UIView setBounds:](v22, "setBounds:", a4, v18, v21, v20);
  [(UIView *)v22 setClipsToBounds:1];
  [(UIView *)v22 setUserInteractionEnabled:0];
  [(UIView *)self->_contentView insertSubview:v22 atIndex:[(_UINavigationBarVisualProviderLegacyIOS *)self _subviewIndexAboveBackground]];
  [(UIView *)v22 addSubview:v16];

  slideTransitionClippingViews = self->_slideTransitionClippingViews;
  if (!slideTransitionClippingViews)
  {
    uint64_t v24 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    unint64_t v25 = self->_slideTransitionClippingViews;
    self->_slideTransitionClippingViews = v24;

    slideTransitionClippingViews = self->_slideTransitionClippingViews;
  }
  [(NSMutableArray *)slideTransitionClippingViews addObject:v22];
  if (v46 | v14)
  {
    id v26 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    objc_msgSend(v26, "setBounds:", 0.0, 0.0, v21, v20);
    double v27 = *MEMORY[0x1E4F1DAD8];
    double v28 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    objc_msgSend(v26, "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], v28);
    objc_msgSend(v26, "setPosition:", a4, v18);
    [(id)v46 size];
    double v30 = v29;
    double v32 = v31;
    [(id)v14 size];
    double v34 = v33;
    if (v46)
    {
      id v35 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
      id v36 = (id) v46;
      objc_msgSend(v35, "setContents:", objc_msgSend(v36, "CGImage"));
      if (v9) {
        double v37 = v32;
      }
      else {
        double v37 = v20;
      }
      objc_msgSend(v35, "setBounds:", 0.0, 0.0, v30, v37);
      objc_msgSend(v35, "setAnchorPoint:", 0.0, 0.0);
      double MinY = 0.0;
      if (v9)
      {
        [(UIView *)self->_backIndicatorView frame];
        double MinY = CGRectGetMinY(v48);
      }
      objc_msgSend(v35, "setPosition:", 0.0, MinY);
      [v36 scale];
      objc_msgSend(v35, "setContentsScale:");
      [v26 addSublayer:v35];
    }
    id v39 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    id v40 = +[UIColor redColor];
    objc_msgSend(v39, "setBackgroundColor:", objc_msgSend(v40, "CGColor"));

    objc_msgSend(v39, "setBounds:", 0.0, 0.0, fmax(v21 - v30 - v34, 0.0), v20);
    objc_msgSend(v39, "setAnchorPoint:", v27, v28);
    v49.origin.double x = 0.0;
    v49.origin.CGFloat y = 0.0;
    v49.size.CGFloat width = v21;
    v49.size.CGFloat height = v20;
    double v41 = v30 + CGRectGetMinX(v49);
    v50.origin.double x = 0.0;
    v50.origin.CGFloat y = 0.0;
    v50.size.CGFloat width = v21;
    v50.size.CGFloat height = v20;
    objc_msgSend(v39, "setPosition:", v41, CGRectGetMinY(v50));
    [v26 addSublayer:v39];
    if (v14)
    {
      id v42 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
      id v43 = (id) v14;
      objc_msgSend(v42, "setContents:", objc_msgSend(v43, "CGImage"));
      objc_msgSend(v42, "setBounds:", 0.0, 0.0, v34, v20);
      objc_msgSend(v42, "setAnchorPoint:", v27, v28);
      [v26 bounds];
      CGFloat v44 = CGRectGetMaxX(v51) - v34;
      v52.origin.double x = 0.0;
      v52.origin.CGFloat y = 0.0;
      v52.size.CGFloat width = v21;
      v52.size.CGFloat height = v20;
      objc_msgSend(v42, "setPosition:", v44, CGRectGetMinY(v52));
      [v43 scale];
      objc_msgSend(v42, "setContentsScale:");
      [v26 addSublayer:v42];
    }
    CGFloat v45 = [(UIView *)v22 layer];
    [v45 setMask:v26];
  }
}

- (double)_effectiveBackIndicatorLeftMargin
{
  BOOL v3 = [(UINavigationBar *)self->super._navigationBar _appearanceStorage];
  uint64_t v4 = [v3 backIndicatorImage];
  if (v4)
  {
    unint64_t v5 = (void *)v4;
    uint64_t v6 = [v3 backIndicatorTransitionMaskImage];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = [v3 backIndicatorLeftMargin];

      if (v8)
      {
        BOOL v9 = [v3 backIndicatorLeftMargin];
        [v9 doubleValue];
        double v11 = v10;

        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  [(UIView *)self->super._navigationBar _contentMargin];
  double v13 = v12;
  unint64_t v14 = [(UINavigationBar *)self->super._navigationBar _currentVisualStyle];
  [v14 horizontalMarginAdjustment];
  double v11 = v13 - v15;

  if (v11 < 0.0) {
    double v11 = 0.0;
  }
LABEL_8:

  return v11;
}

- (double)_backIndicatorClippingMargin
{
  if (!self->_backIndicatorView) {
    return 0.0;
  }
  [(_UINavigationBarVisualProviderLegacyIOS *)self _effectiveBackIndicatorLeftMargin];
  return result;
}

- (BOOL)_suppressBackIndicator
{
  BOOL v3 = [(UIView *)self->super._navigationBar _screen];
  if (v3)
  {
    navigationBar = self->super._navigationBar;
    unint64_t v5 = [(UIView *)navigationBar _screen];
    BOOL v6 = ![(UINavigationBar *)navigationBar _shouldShowBackButtonForScreen:v5];
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_effectiveBackIndicatorImage
{
  if ([(_UINavigationBarVisualProviderLegacyIOS *)self _suppressBackIndicator])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(UINavigationBar *)self->super._navigationBar backIndicatorImage];
    if (!v3)
    {
      if (qword_1EB25C378 != -1) {
        dispatch_once(&qword_1EB25C378, &__block_literal_global_59);
      }
      id v3 = (id)_MergedGlobals_29_0;
    }
  }
  return v3;
}

- (id)_effectiveBackIndicatorTransitionMaskImage
{
  if ([(_UINavigationBarVisualProviderLegacyIOS *)self _suppressBackIndicator])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(UINavigationBar *)self->super._navigationBar backIndicatorTransitionMaskImage];
    if (!v3)
    {
      if (qword_1EB25C388 != -1) {
        dispatch_once(&qword_1EB25C388, &__block_literal_global_64_0);
      }
      id v3 = (id)qword_1EB25C380;
    }
  }
  return v3;
}

- (void)_updateBackIndicatorImage
{
  id v12 = [(_UINavigationBarVisualProviderLegacyIOS *)self _effectiveBackIndicatorImage];
  id v3 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  uint64_t v4 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  unint64_t v5 = [(_UINavigationBarVisualProviderLegacyIOS *)self _backButtonForBackItem:v3 topItem:v4];

  [v5 backIndicatorViewHasRespondedToCustomBackgroundImageChange];
  if (v12
    || ([(UIImageView *)self->_backIndicatorView image],
        (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v6 = [(UIImageView *)self->_backIndicatorView image];
    char v7 = [v12 isEqual:v6];

    if (v12)
    {
      if (v7) {
        goto LABEL_12;
      }
      if (!self->_backIndicatorView)
      {
        id v8 = objc_alloc_init(UINavigationBarBackIndicatorView);
        backIndicatorView = self->_backIndicatorView;
        self->_backIndicatorView = &v8->super;

        [(UIImageView *)self->_backIndicatorView _setDefaultRenderingMode:2];
        [(UIImageView *)self->_backIndicatorView setSemanticContentAttribute:[(UIView *)self->super._navigationBar semanticContentAttribute]];
        [(UIView *)self->_contentView addSubview:self->_backIndicatorView];
        if (![(UINavigationBar *)self->super._navigationBar _hasBackButton]
          || ([(UINavigationBar *)self->super._navigationBar topItem],
              double v10 = objc_claimAutoreleasedReturnValue(),
              char v11 = [v10 _leftItemsWantBackButton],
              v10,
              (v11 & 1) == 0))
        {
          [(UIView *)self->_backIndicatorView setAlpha:0.0];
        }
      }
      [(UIImageView *)self->_backIndicatorView setImage:v12];
      [(UIView *)self->_backIndicatorView sizeToFit];
    }
    else
    {

      if (v7) {
        goto LABEL_12;
      }
    }
    [(UIView *)self->_contentView setNeedsLayout];
  }
LABEL_12:
  [(_UINavigationBarVisualProviderLegacyIOS *)self _updateBackIndicatorViewTintColor];
}

- (void)_updateBackIndicatorViewTintColor
{
  id v3 = [(UIView *)self->super._navigationBar traitCollection];
  unint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 > 1)
  {
    if (v4 != 3) {
      return;
    }
    id v9 = [(UIView *)self->_backIndicatorView tintColor];
    char v7 = [(_UINavigationBarItemStack *)self->super._stack backItem];
    id v8 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    unint64_t v5 = [(_UINavigationBarVisualProviderLegacyIOS *)self _backButtonForBackItem:v7 topItem:v8];

    if ([v5 isFocused])
    {
      BOOL v6 = +[UIColor _externalBarBackgroundColor];
    }
    else
    {
      BOOL v6 = 0;
    }
    if (([v9 isEqual:v6] & 1) == 0)
    {
      [(UIView *)self->_backIndicatorView setTintColor:v6];
      [(UINavigationBar *)self->super._navigationBar setNeedsLayout];
    }
    goto LABEL_13;
  }
  id v9 = [(UINavigationBar *)self->super._navigationBar topItem];
  if (![(UINavigationBar *)self->super._navigationBar _hasBackButton]
    && [v9 _wantsBackButtonIndicator])
  {
    unint64_t v5 = [v9 _barButtonForBackButtonIndicator];
    BOOL v6 = [v5 tintColor];
    [(UIView *)self->_backIndicatorView setTintColor:v6];
LABEL_13:

    goto LABEL_14;
  }
  [(UIView *)self->_backIndicatorView setTintColor:0];
LABEL_14:
}

- (CGRect)_contentViewFrameInBounds:(CGRect)a3 style:(id)a4
{
  CGFloat width = a3.size.width;
  CGFloat x = a3.origin.x;
  id v7 = a4;
  objc_msgSend(v7, "barHeightForMetrics:", objc_msgSend(v7, "metrics"));
  double v9 = v8;

  UIFloorToViewScale(self->super._navigationBar);
  double v11 = v10;
  double v12 = x;
  double v13 = width;
  double v14 = v9;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v12;
  return result;
}

- (BOOL)_supportsCanvasView
{
  id v2 = objc_opt_class();
  return [v2 _supportsCanvasView];
}

- (void)_startPushAnimationFromOldBackItem:(id)a3 oldTopItem:(id)a4 newBackItem:(id)a5 newTopItem:(id)a6 withTransitionAssistant:(id)a7 completion:(id)a8
{
  id rect_24 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v189 = a7;
  id v166 = a8;
  double v17 = [(UINavigationBar *)self->super._navigationBar _currentVisualStyle];
  id v182 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v172 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v180 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v184 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v19 = (double *)MEMORY[0x1E4F1DB28];
  CGSize v20 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  CGPoint v215 = (CGPoint)*MEMORY[0x1E4F1DB28];
  CGSize v216 = v20;
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  object = self;
  id rect_16 = v16;
  [(_UINavigationBarVisualProviderLegacyIOS *)self _getTitleViewFrame:&v215 leftViewFrames:v18 rightViewFrames:v21 forPreviousItem:v15 item:v16];
  if ([v21 count])
  {
    uint64_t v22 = [v21 lastObject];
    [v22 CGRectValue];
    double v164 = v23;
  }
  else
  {
    double v164 = 0.0;
  }
  uint64_t v24 = self;

  if ([v18 count])
  {
    unint64_t v25 = [v18 objectAtIndex:0];
    [v25 CGRectValue];
    double rect = v26;
    double v28 = v27;
    double v174 = v29;
    double v31 = v30;
  }
  else
  {
    double v28 = v19[1];
    double rect = *v19;
    double v31 = v19[3];
    double v174 = v19[2];
  }
  double v32 = rect_16;
  double v33 = [rect_16 leftBarButtonItem];

  CGFloat MinX = 0.0;
  if (v33)
  {
    id v35 = [v18 lastObject];
    [v35 CGRectValue];
    double MaxX = CGRectGetMaxX(v217);

    if ([rect_16 leftItemsSupplementBackButton]
      && (unint64_t)[v18 count] >= 2)
    {
      id v36 = [v18 objectAtIndex:1];
      [v36 CGRectValue];
      CGFloat MinX = CGRectGetMinX(v218);
    }
  }
  else
  {
    double MaxX = 0.0;
  }

  double v175 = v15;
  double v37 = [(_UINavigationBarVisualProviderLegacyIOS *)self _backButtonForBackItem:v15 topItem:rect_16];
  uint64_t v38 = [(_UINavigationItemButtonView *)v37 _backButtonBackgroundImageForState:0 barMetrics:[(UINavigationBar *)self->super._navigationBar isMinibar]];
  id v167 = v17;
  [v17 leftBackTitleMarginForCustomBackButtonBackground:v38];
  double v169 = v39;
  rect_8 = object->_contentView;
  int v40 = *((_DWORD *)&object->super._navigationBar->super._viewFlags + 4);
  double v41 = [v14 _titleView];
  uint64_t v42 = [v14 title];
  id v43 = [(_UINavigationItemButtonView *)v37 title];
  objc_opt_class();
  double v45 = 1.0;
  double v173 = v14;
  v168 = v43;
  CGFloat v160 = v31;
  CGFloat v161 = v28;
  double v159 = MinX;
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v43 isEqualToString:v42]
    && ![(_UINavigationItemButtonView *)v37 hasCustomBackgroundImage]
    && ([v189 shouldCrossfade] & 1) == 0)
  {
    [(_UINavigationBarVisualProviderLegacyIOS *)object _backTitleWidthOverTitleWidthForMatchingBackButtonView:v37 titleView:v41 withBackButtonWidth:v174];
    double v45 = v158;
    double v44 = 1.0;
    BOOL v46 = v45 != 1.0;
  }
  else
  {
    BOOL v46 = 0;
  }
  v188 = (void *)v42;
  if (v41)
  {
    [v41 frame];
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;
    double v55 = fmin(v47, rect + v169);
    double v56 = fmax(v48, rect);
    CGFloat v57 = (*(void *)&v40 & 0x80000) != 0 ? v56 : v55;
    [v182 addObject:v41];
    double v58 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v48, v50, v52, v54);
    objc_setAssociatedObject(v41, &_UINavigationBarOriginalFrameKey, v58, (void *)1);

    v219.origin.double x = v57;
    v219.origin.CGFloat y = v50;
    v219.size.CGFloat width = v52;
    v219.size.CGFloat height = v54;
    CGFloat v59 = v45 * CGRectGetWidth(v219);
    id v60 = (void *)MEMORY[0x1E4F29238];
    v220.origin.double x = v57;
    v220.origin.CGFloat y = v50;
    v220.size.CGFloat width = v59;
    v220.size.CGFloat height = v54;
    double v61 = v45;
    CGFloat MidX = CGRectGetMidX(v220);
    v221.origin.double x = v57;
    v221.origin.CGFloat y = v50;
    v221.size.CGFloat width = v59;
    v221.size.CGFloat height = v54;
    double MidY = CGRectGetMidY(v221);
    double v64 = MidX;
    double v45 = v61;
    double v65 = objc_msgSend(v60, "valueWithCGPoint:", v64, MidY);
    [v180 addObject:v65];

    uint64_t v42 = (uint64_t)v188;
    if (([v189 shouldCrossfade] & 1) == 0)
    {
      double v44 = MaxX;
      if (MaxX > 0.0)
      {
        v66 = __slideTransitionFadeMaskImage(1);
        v222.origin.double x = v48;
        v222.origin.CGFloat y = v50;
        v222.size.CGFloat width = v52;
        v222.size.CGFloat height = v54;
        double v67 = CGRectGetMinX(v222);
        [v66 size];
        double v69 = fmin(MaxX, v67 - v68);
        [(UIView *)object->super._navigationBar bounds];
        [(_UINavigationBarVisualProviderLegacyIOS *)object _wrapView:v41 inClippingViewWithLeftBoundary:v66 rightBoundary:0 leftMaskImage:0 leftMaskIsChevron:v69 rightMaskImage:CGRectGetMaxX(v223)];

        uint64_t v42 = (uint64_t)v188;
      }
    }
  }
  objc_msgSend(rect_24, "backButtonView", v44);
  uint64_t v70 = (_UINavigationItemButtonView *)objc_claimAutoreleasedReturnValue();
  double v71 = 0.0;
  if (![rect_16 _leftItemsWantBackButton]
    || ([v189 shouldHideBackButtonDuringTransition] & 1) != 0
    || ([rect_16 hidesBackButton] & 1) != 0
    || v37 && [(_UINavigationItemButtonView *)v37 _suppressesBackIndicatorView])
  {
    char v72 = 1;
  }
  else
  {
    if (![(_UINavigationItemButtonView *)v70 _suppressesBackIndicatorView])
    {
      [(_UINavigationBarVisualProviderLegacyIOS *)object _backIndicatorClippingMargin];
      double v71 = v119;
    }
    char v72 = 0;
  }
  v165 = (void *)v38;
  if (v70)
  {
    [(UIView *)v70 frame];
    double v163 = v73;
    double v75 = v74;
    double v77 = v76;
    double v79 = v78;
    if (v70 == v37)
    {
      unsigned int v80 = [_UINavigationItemButtonView alloc];
      uint64_t v81 = [(_UINavigationItemView *)v37 navigationItem];
      uint64_t v70 = [(_UINavigationItemButtonView *)v80 initWithNavigationItem:v81];

      BOOL v82 = [(_UINavigationItemButtonView *)v37 _appearanceStorage];

      if (v82)
      {
        double v83 = [rect_24 backBarButtonItem];
        double v84 = [v83 _appearanceStorage];
        double v85 = objc_getAssociatedObject(v83, &_UIAppearanceCustomizedSelectorsAssociationKey);
        [(_UINavigationItemButtonView *)v70 _applyBarButtonAppearanceStorage:v84 withTaggedSelectors:v85];

        double v32 = rect_16;
      }
      [(UIView *)v37 frame];
      -[_UINavigationItemView setFrame:](v70, "setFrame:");
      uint64_t v24 = object;
    }
    [(_UINavigationItemButtonView *)v70 setPressed:0];
    objecta = v70;
    if (([v189 shouldCrossfade] & 1) != 0 || v71 <= 0.0)
    {
      double v86 = v45;
      [(UIView *)rect_8 addSubview:v70];
    }
    else
    {
      double v86 = v45;
      double v87 = [(_UINavigationBarVisualProviderLegacyIOS *)v24 _effectiveBackIndicatorTransitionMaskImage];
      [(UIView *)v70 frame];
      [(_UINavigationBarVisualProviderLegacyIOS *)v24 _wrapView:v70 inClippingViewWithLeftBoundary:v87 rightBoundary:1 leftMaskImage:0 leftMaskIsChevron:v71 rightMaskImage:CGRectGetMaxX(v224)];
    }
    [(UIView *)v70 frame];
    CGFloat v91 = v90;
    CGFloat v92 = v89;
    CGFloat v94 = v93;
    navigationBar = v24->super._navigationBar;
    if ((*((_DWORD *)&navigationBar->super._viewFlags + 4) & 0x80000) != 0)
    {
      [(UIView *)navigationBar bounds];
      double v96 = v97;
    }
    else
    {
      double v96 = -v89;
    }
    BOOL v88 = v46;
    v98 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v163, v75, v77, v79);
    objc_setAssociatedObject(objecta, &_UINavigationBarOriginalFrameKey, v98, (void *)1);

    [v182 addObject:objecta];
    double v99 = (void *)MEMORY[0x1E4F29238];
    v225.origin.double x = v96;
    v225.origin.CGFloat y = v91;
    v225.size.CGFloat width = v92;
    v225.size.CGFloat height = v94;
    double v100 = CGRectGetMidX(v225);
    v226.origin.double x = v96;
    v226.origin.CGFloat y = v91;
    v226.size.CGFloat width = v92;
    v226.size.CGFloat height = v94;
    double v101 = objc_msgSend(v99, "valueWithCGPoint:", v100, CGRectGetMidY(v226));
    [v180 addObject:v101];

    uint64_t v42 = (uint64_t)v188;
    double v45 = v86;
  }
  else
  {
    objecta = 0;
    BOOL v88 = v46;
  }
  char v102 = v72;
  double v103 = v189;
  uint64_t v104 = [(_UINavigationBarVisualProviderLegacyIOS *)v24 _subviewIndexAboveBackground];
  if (v37)
  {
    [(_UINavigationItemButtonView *)v37 setStyle:[(UINavigationBar *)v24->super._navigationBar _barStyle]];
    [(_UINavigationItemButtonView *)v37 setPressed:0];
    if (v41)
    {
      [v41 frame];
      double x = v105;
      CGFloat y = v107;
      CGFloat width = v109;
      CGFloat height = v111;
    }
    else
    {
      CGFloat y = v215.y;
      double x = v215.x;
      CGFloat height = v216.height;
      CGFloat width = v216.width;
    }
    if (v175) {
      goto LABEL_49;
    }
    v117 = [v173 titleView];
    if (v117)
    {
    }
    else if ([v168 isEqualToString:v42])
    {
LABEL_49:
      double v113 = v174 / v45;
      if ((v40 & 0x80000) != 0)
      {
        v227.origin.double x = x;
        v227.origin.CGFloat y = y;
        v227.size.CGFloat width = width;
        v227.size.CGFloat height = height;
        double v118 = CGRectGetMaxX(v227);
        v228.origin.double x = rect;
        double v116 = v160;
        double v115 = v161;
        v228.origin.CGFloat y = v161;
        v228.size.CGFloat width = v174 / v45;
        v228.size.CGFloat height = v160;
        double v114 = v169 / v45 + v118 - CGRectGetWidth(v228);
      }
      else
      {
        double v114 = x - v169 / v45;
        double v116 = v160;
        double v115 = v161;
      }
      goto LABEL_61;
    }
    if ((v40 & 0x80000) != 0)
    {
      [(UIView *)v24->super._navigationBar bounds];
      double v170 = CGRectGetMaxX(v231);
      v232.origin.double x = rect;
      double v116 = v160;
      v232.origin.CGFloat y = v161;
      double v113 = v174;
      v232.size.CGFloat width = v174;
      v232.size.CGFloat height = v160;
      double v171 = v170 - CGRectGetWidth(v232);
      v233.origin.double x = rect;
      v233.origin.CGFloat y = v161;
      v233.size.CGFloat width = v174;
      v233.size.CGFloat height = v160;
      double v121 = CGRectGetMidX(v233);
      v234.origin.double x = x;
      double v115 = v161;
      v234.origin.CGFloat y = y;
      v234.size.CGFloat width = width;
      v234.size.CGFloat height = height;
      double v114 = v171 - (v121 - CGRectGetMidX(v234));
    }
    else
    {
      v229.origin.double x = x;
      v229.origin.CGFloat y = y;
      v229.size.CGFloat width = width;
      v229.size.CGFloat height = height;
      double v120 = CGRectGetMidX(v229);
      v230.origin.double x = rect;
      double v116 = v160;
      double v115 = v161;
      v230.origin.CGFloat y = v161;
      v230.size.CGFloat width = v174;
      v230.size.CGFloat height = v160;
      double v114 = v120 - CGRectGetMidX(v230) - v169;
      double v113 = v174;
    }
LABEL_61:
    if (([v189 shouldCrossfade] & 1) != 0 || v159 <= 0.0)
    {
      [(UIView *)rect_8 insertSubview:v37 atIndex:v104];
    }
    else
    {
      CGSize v122 = __slideTransitionFadeMaskImage(0);
      [(UIView *)v24->super._navigationBar bounds];
      double v123 = CGRectGetMinX(v235);
      v236.origin.double x = v114;
      v236.origin.CGFloat y = v115;
      v236.size.CGFloat width = v113;
      v236.size.CGFloat height = v116;
      double v124 = CGRectGetMaxX(v236);
      [v122 size];
      [(_UINavigationBarVisualProviderLegacyIOS *)v24 _wrapView:v37 inClippingViewWithLeftBoundary:0 rightBoundary:0 leftMaskImage:v122 leftMaskIsChevron:v123 rightMaskImage:fmax(v159, v124 + v125)];
    }
    [(UIView *)v37 setAlpha:0.0];
    if (([v189 shouldHideBackButtonDuringTransition] & 1) != 0
      || [v32 hidesBackButton])
    {
      -[_UINavigationItemView setFrame:](v37, "setFrame:", rect, v115, v174, v116);
    }
    else
    {
      -[_UINavigationItemView setFrame:](v37, "setFrame:", v114, v115, v113, v116);
      if (v88)
      {
        CGAffineTransformMakeScale(&v214, 1.0 / v45, 1.0);
        [(UIView *)v37 setTransform:&v214];
      }
      [v172 addObject:v37];
      double v126 = (void *)MEMORY[0x1E4F29238];
      v237.origin.double x = rect;
      v237.origin.CGFloat y = v115;
      v237.size.CGFloat width = v174;
      v237.size.CGFloat height = v116;
      double v127 = CGRectGetMidX(v237);
      v238.origin.double x = rect;
      v238.origin.CGFloat y = v115;
      v238.size.CGFloat width = v174;
      v238.size.CGFloat height = v116;
      double v128 = objc_msgSend(v126, "valueWithCGPoint:", v127, CGRectGetMidY(v238));
      [v184 addObject:v128];
    }
  }
  v129 = [v32 _titleView];
  if (v129)
  {
    CGPoint v130 = v215;
    CGSize v131 = v216;
    v132 = v24->super._navigationBar;
    if ((*((_DWORD *)&v132->super._viewFlags + 4) & 0x80000) != 0)
    {
      double v134 = -v216.width;
    }
    else
    {
      [(UIView *)v132 bounds];
      double v134 = v133;
    }
    if (([v189 shouldCrossfade] & 1) != 0 || (double v135 = v164, v164 <= 0.0))
    {
      -[UIView insertSubview:atIndex:](rect_8, "insertSubview:atIndex:", v129, v104, v135);
    }
    else
    {
      double v136 = __slideTransitionFadeMaskImage(0);
      v239.origiuint64_t n = v130;
      v239.size = v131;
      double v137 = CGRectGetMaxX(v239);
      [v136 size];
      [(_UINavigationBarVisualProviderLegacyIOS *)v24 _wrapView:v129 inClippingViewWithLeftBoundary:0 rightBoundary:0 leftMaskImage:v136 leftMaskIsChevron:0.0 rightMaskImage:fmax(v164, v137 + v138)];
    }
    objc_msgSend(v129, "setFrame:", v134, v130.y, v131);
    [v129 setAlpha:0.0];
    [v172 addObject:v129];
    double v139 = (void *)MEMORY[0x1E4F29238];
    v240.origiuint64_t n = v130;
    v240.size = v131;
    double v140 = CGRectGetMidX(v240);
    v241.origiuint64_t n = v130;
    v241.size = v131;
    double v141 = objc_msgSend(v139, "valueWithCGPoint:", v140, CGRectGetMidY(v241));
    [v184 addObject:v141];
  }
  uint64_t v190 = v129;
  BOOL v142 = v88;
  if ([v103 shouldCrossfade])
  {
    v212[0] = MEMORY[0x1E4F143A8];
    v212[1] = 3221225472;
    v212[2] = __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke;
    v212[3] = &unk_1E52DA8E8;
    id v213 = v184;
    [v172 enumerateObjectsUsingBlock:v212];
  }
  [v103 duration];
  double v144 = v143;
  [v103 incrementAnimationCount];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_2;
  aBlock[3] = &unk_1E52DE280;
  void aBlock[4] = v24;
  char v210 = v102;
  id v145 = v182;
  id v202 = v145;
  id v146 = v103;
  id v203 = v146;
  id v183 = v180;
  id v204 = v183;
  double v147 = v24;
  id v148 = v172;
  id v205 = v148;
  id v185 = v184;
  id v206 = v185;
  BOOL v211 = v142;
  double v181 = v37;
  uint64_t v207 = v181;
  double v209 = v45;
  id v149 = v41;
  id v208 = v149;
  double v150 = _Block_copy(aBlock);
  v195[0] = MEMORY[0x1E4F143A8];
  v195[1] = 3221225472;
  v195[2] = __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_5;
  v195[3] = &unk_1E52DE2A8;
  v195[4] = v147;
  id v151 = v148;
  id v196 = v151;
  id v152 = v145;
  id v197 = v152;
  id v153 = v146;
  id v198 = v153;
  id v154 = v166;
  id v200 = v154;
  double v155 = objecta;
  double v199 = v155;
  double v156 = _Block_copy(v195);
  if ([v153 shouldAnimateAlongside])
  {
    double v157 = [v153 transitionCoordinator];
    v193[0] = MEMORY[0x1E4F143A8];
    v193[1] = 3221225472;
    v193[2] = __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_6;
    v193[3] = &unk_1E52DA110;
    id v194 = v150;
    v191[0] = MEMORY[0x1E4F143A8];
    v191[1] = 3221225472;
    v191[2] = __147___UINavigationBarVisualProviderLegacyIOS__startPushAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_7;
    v191[3] = &unk_1E52DA110;
    id v192 = v156;
    [v157 animateAlongsideTransition:v193 completion:v191];
  }
  else
  {
    +[UIView _animateWithDuration:393216 delay:v147 options:v150 factory:v156 animations:v144 completion:0.0];
  }
}

- (void)_startPopAnimationFromOldBackItem:(id)a3 oldTopItem:(id)a4 newBackItem:(id)a5 newTopItem:(id)a6 withTransitionAssistant:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v189 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v178 = a8;
  id v192 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v185 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v190 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v174 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v19 = (double *)MEMORY[0x1E4F1DB28];
  long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  CGPoint v222 = (CGPoint)*MEMORY[0x1E4F1DB28];
  long long v223 = v20;
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v195 = self;
  [(_UINavigationBarVisualProviderLegacyIOS *)self _getTitleViewFrame:&v222 leftViewFrames:v18 rightViewFrames:v21 forPreviousItem:v15 item:v16];
  uint64_t v22 = [v21 lastObject];

  if (v22)
  {
    double v23 = [v21 lastObject];
    [v23 CGRectValue];
    double v166 = v24;
  }
  else
  {
    double v166 = 0.0;
  }
  if ([v18 count])
  {
    unint64_t v25 = [v18 objectAtIndex:0];
    [v25 CGRectValue];
    double v27 = v26;
    double v161 = v29;
    double v162 = v28;
    double v31 = v30;
  }
  else
  {
    double v27 = *v19;
    double v31 = v19[2];
    double v161 = v19[3];
    double v162 = v19[1];
  }
  double v32 = [v16 leftBarButtonItem];

  double MinX = 0.0;
  if (v32)
  {
    double v34 = [v18 lastObject];
    [v34 CGRectValue];
    CGFloat MaxX = CGRectGetMaxX(v224);

    if ([v16 leftItemsSupplementBackButton]
      && (unint64_t)[v18 count] >= 2)
    {
      id v36 = [v18 objectAtIndex:1];
      [v36 CGRectValue];
      double MinX = CGRectGetMinX(v225);
    }
  }
  else
  {
    CGFloat MaxX = 0.0;
  }
  if (-[_UINavigationBarVisualProviderLegacyIOS _shouldShowBackButtonForNavigationItem:](self, "_shouldShowBackButtonForNavigationItem:", v15)&& ([v16 hidesBackButton] & 1) == 0)
  {
    uint64_t v38 = [v16 leftBarButtonItem];
    if (v38 && ![v16 leftItemsSupplementBackButton])
    {
      double v37 = 0;
    }
    else
    {
      double v37 = [v15 backButtonView];
    }
  }
  else
  {
    double v37 = 0;
  }
  double v39 = [v14 existingBackButtonView];
  double v165 = 0.0;
  v188 = v14;
  double v179 = v21;
  id v180 = v15;
  double v173 = v37;
  if (v37
    && ([v37 _suppressesBackIndicatorView] & 1) == 0
    && [v16 _leftItemsWantBackButton]
    && ([v17 shouldHideBackButtonDuringTransition] & 1) == 0)
  {
    int v40 = v17;
    p_isa = (id *)&v195->super.super.isa;
    id v42 = v185;
    if ([v16 hidesBackButton])
    {
      char v172 = 1;
    }
    else
    {
      [(_UINavigationBarVisualProviderLegacyIOS *)v195 _backIndicatorClippingMargin];
      double v165 = v156;
      char v172 = 0;
    }
  }
  else
  {
    int v40 = v17;
    char v172 = 1;
    p_isa = (id *)&v195->super.super.isa;
    id v42 = v185;
  }

  id v43 = [p_isa[1] _currentVisualStyle];
  uint64_t v44 = objc_msgSend(v39, "_backButtonBackgroundImageForState:barMetrics:", 0, objc_msgSend(p_isa[1], "isMinibar"));
  [v43 leftBackTitleMarginForCustomBackButtonBackground:v44];
  double v167 = v45;
  BOOL v46 = [v16 _titleView];
  uint64_t v47 = [v16 title];
  double v48 = [v39 title];
  objc_opt_class();
  double v49 = 1.0;
  id v194 = v16;
  double v176 = (void *)v44;
  double v177 = v43;
  double v181 = v48;
  id v182 = (void *)v47;
  double v163 = v27;
  double v164 = v31;
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v48 isEqualToString:v47]
    && ([v39 hasCustomBackgroundImage] & 1) == 0
    && ([v40 shouldCrossfade] & 1) == 0)
  {
    [v39 bounds];
    [p_isa _backTitleWidthOverTitleWidthForMatchingBackButtonView:v39 titleView:v46 withBackButtonWidth:v154];
    double v49 = v155;
    BOOL v50 = v155 != 1.0;
  }
  else
  {
    BOOL v50 = 0;
  }
  double v51 = v42;
  double v52 = p_isa[1];
  double v53 = &OBJC_IVAR____UIVectorTextLayoutRun__sourceString;
  int v54 = v52[28];
  CGFloat v55 = *(double *)&v223;
  CGPoint v183 = v222;
  double v56 = *((double *)&v223 + 1);
  [v52 bounds];
  CGFloat v170 = v59;
  CGFloat v171 = v58;
  CGFloat v60 = v57;
  CGFloat rect = v61;
  if (!v194 || !v46)
  {
    double v71 = v174;
    if (v46) {
      goto LABEL_46;
    }
    titleView = v195->_titleView;
    v195->_titleView = 0;
    goto LABEL_45;
  }
  CGFloat v62 = v56;
  double v159 = MaxX;
  CGFloat v160 = v57;
  [(UIView *)v195->_contentView addSubview:v46];
  objc_storeStrong((id *)&v195->_titleView, v46);
  CGFloat y = v222.y;
  double x = v222.x;
  CGFloat v65 = *((double *)&v223 + 1);
  double v66 = *(double *)&v223;
  double v157 = MinX;
  if (v39)
  {
    [v39 frame];
    double v68 = fmin(x, v167 + v67);
    double v69 = fmax(x, v67);
    if ((*(void *)&v54 & 0x80000) != 0) {
      double x = v69;
    }
    else {
      double x = v68;
    }
    CGFloat v70 = v49;
    double v66 = v49 * v66;
  }
  else
  {
    CGFloat v70 = v49;
  }
  double v51 = v185;
  double v71 = v174;
  v226.origin.double x = x;
  v226.origin.CGFloat y = y;
  v226.size.CGFloat width = v66;
  v226.size.CGFloat height = v65;
  double MidX = CGRectGetMidX(v226);
  v227.origin.double x = x;
  v227.origin.CGFloat y = y;
  v227.size.CGFloat width = v66;
  v227.size.CGFloat height = v65;
  objc_msgSend(v46, "setCenter:", MidX, CGRectGetMidY(v227));
  double v74 = (void *)MEMORY[0x1E4F29238];
  [v46 frame];
  double v75 = objc_msgSend(v74, "valueWithCGRect:");
  objc_setAssociatedObject(v46, &_UINavigationBarOriginalFrameKey, v75, (void *)1);

  double v49 = v70;
  if (v50)
  {
    CGAffineTransformMakeScale(&v221, v70, 1.0);
    [v46 setTransform:&v221];
  }
  objc_msgSend(v46, "setAlpha:", 0.0, *(void *)&v157);
  [v185 addObject:v46];
  double v76 = (void *)MEMORY[0x1E4F29238];
  v228.origiuint64_t n = v183;
  v228.size.CGFloat width = v55;
  double v56 = v62;
  v228.size.CGFloat height = v62;
  double v77 = CGRectGetMidX(v228);
  v229.origiuint64_t n = v183;
  v229.size.CGFloat width = v55;
  v229.size.CGFloat height = v62;
  double v78 = objc_msgSend(v76, "valueWithCGPoint:", v77, CGRectGetMidY(v229));
  [v174 addObject:v78];

  CGFloat v60 = v160;
  double MinX = v158;
  if (([v40 shouldCrossfade] & 1) == 0 && v159 > 0.0)
  {
    titleView = __slideTransitionFadeMaskImage(1);
    v230.origiuint64_t n = v183;
    v230.size.CGFloat width = v55;
    v230.size.CGFloat height = v62;
    double v79 = CGRectGetMinX(v230);
    [titleView size];
    double v81 = fmin(v159, v79 - v80);
    v231.origin.CGFloat y = v170;
    v231.origin.double x = v171;
    v231.size.CGFloat width = v160;
    v231.size.CGFloat height = rect;
    [(_UINavigationBarVisualProviderLegacyIOS *)v195 _wrapView:v46 inClippingViewWithLeftBoundary:titleView rightBoundary:0 leftMaskImage:0 leftMaskIsChevron:v81 rightMaskImage:CGRectGetMaxX(v231)];
LABEL_45:
  }
LABEL_46:
  if (!v39) {
    goto LABEL_63;
  }
  CGFloat v175 = v55;
  CGFloat v186 = v56;
  CGFloat v82 = v60;
  [v39 setPressed:0];
  [v39 frame];
  CGFloat v84 = v83;
  CGFloat v86 = v85;
  double v88 = v87;
  CGFloat v90 = v89;
  if (([v40 shouldCrossfade] & 1) != 0 || MinX == 0.0)
  {
    [(UIView *)v195->_contentView addSubview:v39];
  }
  else
  {
    CGFloat v91 = __slideTransitionFadeMaskImage(0);
    v232.origin.double x = v84;
    v232.origin.CGFloat y = v86;
    v232.size.CGFloat width = v88;
    v232.size.CGFloat height = v90;
    double v92 = MinX;
    double v93 = v49;
    double v94 = CGRectGetMaxX(v232);
    [v91 size];
    double v96 = v94 + fmax(v95, 2.0);
    double v49 = v93;
    [(_UINavigationBarVisualProviderLegacyIOS *)v195 _wrapView:v39 inClippingViewWithLeftBoundary:0 rightBoundary:0 leftMaskImage:v91 leftMaskIsChevron:0.0 rightMaskImage:fmax(v92, v96)];
  }
  if (!v188)
  {
    double v99 = [v194 titleView];
    if (v99)
    {
    }
    else if ([v181 isEqualToString:v182])
    {
      goto LABEL_52;
    }
    if ((v54 & 0x80000) != 0)
    {
      v246.origin.CGFloat y = v170;
      v246.origin.double x = v171;
      v246.size.CGFloat width = v82;
      v246.size.CGFloat height = rect;
      double v168 = v49;
      double v150 = CGRectGetMaxX(v246);
      v247.origin.double x = v84;
      v247.origin.CGFloat y = v86;
      v247.size.CGFloat width = v88;
      v247.size.CGFloat height = v90;
      double v151 = v150 - CGRectGetWidth(v247);
      v248.origin.double x = v84;
      CGFloat v60 = v82;
      v248.origin.CGFloat y = v86;
      v248.size.CGFloat width = v88;
      v248.size.CGFloat height = v90;
      double v152 = CGRectGetMidX(v248);
      v249.origiuint64_t n = v183;
      v249.size.CGFloat width = v175;
      v249.size.CGFloat height = v186;
      double v153 = v152 - CGRectGetMidX(v249);
      double v49 = v168;
      double v101 = v151 - v153;
      goto LABEL_62;
    }
    v235.origiuint64_t n = v183;
    v235.size.CGFloat width = v175;
    v235.size.CGFloat height = v186;
    double v102 = CGRectGetMidX(v235);
    v236.origin.double x = v84;
    v236.origin.CGFloat y = v86;
    v236.size.CGFloat width = v88;
    v236.size.CGFloat height = v90;
    double v97 = v102 - CGRectGetMidX(v236);
    double v98 = v167;
    goto LABEL_60;
  }
LABEL_52:
  double v88 = v88 / v49;
  if ((v54 & 0x80000) == 0)
  {
    double v97 = v222.x;
    double v98 = v167 / v49;
LABEL_60:
    double v101 = v97 - v98;
    goto LABEL_61;
  }
  v233.origiuint64_t n = v183;
  v233.size.CGFloat width = v175;
  v233.size.CGFloat height = v186;
  double v100 = CGRectGetMaxX(v233);
  v234.origin.double x = v84;
  v234.origin.CGFloat y = v86;
  v234.size.CGFloat width = v88;
  v234.size.CGFloat height = v90;
  double v101 = v167 / v49 + v100 - CGRectGetWidth(v234);
LABEL_61:
  CGFloat v60 = v82;
LABEL_62:
  [v192 addObject:v39];
  double v103 = (void *)MEMORY[0x1E4F29238];
  v237.origin.double x = v101;
  v237.origin.CGFloat y = v86;
  v237.size.CGFloat width = v88;
  v237.size.CGFloat height = v90;
  double v104 = CGRectGetMidX(v237);
  v238.origin.double x = v101;
  v238.origin.CGFloat y = v86;
  v238.size.CGFloat width = v88;
  v238.size.CGFloat height = v90;
  double v105 = objc_msgSend(v103, "valueWithCGPoint:", v104, CGRectGetMidY(v238));
  [v190 addObject:v105];

LABEL_63:
  double v106 = [v189 _titleView];
  double v187 = v106;
  if (v106)
  {
    [v106 frame];
    CGFloat v109 = v108;
    CGFloat v111 = v110;
    CGFloat v112 = v107;
    CGFloat v114 = v113;
    if ((*((_DWORD *)&v195->super._navigationBar->super._viewFlags + 4) & 0x80000) != 0) {
      double v115 = -v107;
    }
    else {
      double v115 = v60;
    }
    if (([v40 shouldCrossfade] & 1) != 0 || (double v116 = v166, v166 <= 0.0))
    {
      contentView = v195->_contentView;
      uint64_t v123 = [(_UINavigationBarVisualProviderLegacyIOS *)v195 _subviewIndexAboveBackground];
      double v124 = contentView;
      double v121 = v187;
      [(UIView *)v124 insertSubview:v187 atIndex:v123];
    }
    else
    {
      v117 = __slideTransitionFadeMaskImage(0);
      v239.origin.CGFloat y = v170;
      v239.origin.double x = v171;
      v239.size.CGFloat width = v60;
      v239.size.CGFloat height = rect;
      double v118 = CGRectGetMinX(v239);
      v240.origin.double x = v109;
      v240.origin.CGFloat y = v111;
      v240.size.CGFloat width = v112;
      v240.size.CGFloat height = v114;
      double v119 = CGRectGetMaxX(v240);
      [v117 size];
      double v121 = v187;
      [(_UINavigationBarVisualProviderLegacyIOS *)v195 _wrapView:v187 inClippingViewWithLeftBoundary:0 rightBoundary:0 leftMaskImage:v117 leftMaskIsChevron:v118 rightMaskImage:fmax(v166, v119 + fmax(v120, 2.0))];

      double v53 = &OBJC_IVAR____UIVectorTextLayoutRun__sourceString;
    }
    [v192 addObject:v121];
    double v125 = (void *)MEMORY[0x1E4F29238];
    v241.origin.double x = v115;
    v241.origin.CGFloat y = v111;
    v241.size.CGFloat width = v112;
    v241.size.CGFloat height = v114;
    double v126 = CGRectGetMidX(v241);
    v242.origin.double x = v115;
    v242.origin.CGFloat y = v111;
    v242.size.CGFloat width = v112;
    v242.size.CGFloat height = v114;
    double v127 = objc_msgSend(v125, "valueWithCGPoint:", v126, CGRectGetMidY(v242));
    [v190 addObject:v127];
  }
  if (v173)
  {
    [v173 setPressed:0];
    if (([v40 shouldCrossfade] & 1) != 0 || v165 <= 0.0)
    {
      [(UIView *)v195->_contentView addSubview:v173];
    }
    else
    {
      double v128 = [(_UINavigationBarVisualProviderLegacyIOS *)v195 _effectiveBackIndicatorTransitionMaskImage];
      v243.origin.CGFloat y = v170;
      v243.origin.double x = v171;
      v243.size.CGFloat width = v60;
      v243.size.CGFloat height = rect;
      [(_UINavigationBarVisualProviderLegacyIOS *)v195 _wrapView:v173 inClippingViewWithLeftBoundary:v128 rightBoundary:1 leftMaskImage:0 leftMaskIsChevron:v165 rightMaskImage:CGRectGetMaxX(v243)];
    }
    [v173 _setFadingInFromCustomAlpha:1];
    [v173 setAlpha:0.3];
    if ((*(_DWORD *)((unsigned char *)&v195->super._navigationBar->super.super.__layeringSceneIdentity + v53[373]) & 0x80000) != 0) {
      double v129 = v60;
    }
    else {
      double v129 = -v164;
    }
    if (([v40 shouldHideBackButtonDuringTransition] & 1) == 0)
    {
      CGPoint v130 = [v194 _customLeftViews];
      if ([v130 count] && (objc_msgSend(v194, "leftItemsSupplementBackButton") & 1) == 0)
      {
      }
      else
      {
        int v131 = [v194 hidesBackButton];

        if (!v131)
        {
          objc_msgSend(v173, "setFrame:", v129, v162, v164, v161);
          [v51 addObject:v173];
          v132 = (void *)MEMORY[0x1E4F29238];
          v244.origin.double x = v163;
          v244.origin.CGFloat y = v162;
          v244.size.CGFloat width = v164;
          v244.size.CGFloat height = v161;
          double v133 = CGRectGetMidX(v244);
          v245.origin.double x = v163;
          v245.origin.CGFloat y = v162;
          v245.size.CGFloat width = v164;
          v245.size.CGFloat height = v161;
          double v134 = objc_msgSend(v132, "valueWithCGPoint:", v133, CGRectGetMidY(v245));
          [v71 addObject:v134];

          goto LABEL_87;
        }
      }
    }
    objc_msgSend(v173, "setFrame:", v163, v162, v164, v161);
  }
LABEL_87:
  if ([v40 shouldCrossfade])
  {
    v219[0] = MEMORY[0x1E4F143A8];
    v219[1] = 3221225472;
    v219[2] = __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke;
    v219[3] = &unk_1E52DA8E8;
    id v220 = v71;
    [v51 enumerateObjectsUsingBlock:v219];
  }
  [v40 duration];
  if (v135 == 0.0) {
    +[UINavigationBar defaultAnimationDuration];
  }
  double v136 = v135;
  [v40 incrementAnimationCount];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_2;
  aBlock[3] = &unk_1E52DE280;
  void aBlock[4] = v195;
  char v217 = v172;
  id v137 = v192;
  id v209 = v137;
  id v138 = v40;
  id v210 = v138;
  id v193 = v190;
  id v211 = v193;
  id v139 = v51;
  id v212 = v139;
  id v191 = v71;
  id v213 = v191;
  BOOL v218 = v50;
  id v184 = v46;
  id v214 = v184;
  id v140 = v39;
  id v215 = v140;
  double v216 = v49;
  double v141 = _Block_copy(aBlock);
  v200[0] = MEMORY[0x1E4F143A8];
  v200[1] = 3221225472;
  v200[2] = __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_5;
  v200[3] = &unk_1E52DE2D0;
  id v142 = v173;
  id v201 = v142;
  id v202 = v195;
  id v143 = v139;
  id v203 = v143;
  id v144 = v137;
  id v204 = v144;
  id v145 = v138;
  id v205 = v145;
  id v146 = v178;
  id v207 = v146;
  id v147 = v140;
  id v206 = v147;
  id v148 = _Block_copy(v200);
  if ([v145 interactive]) {
    [(_UINavigationBarVisualProviderLegacyIOS *)v195 updateTopNavigationItemAnimated:1];
  }
  if ([v145 shouldAnimateAlongside])
  {
    id v149 = [v145 transitionCoordinator];
    v198[0] = MEMORY[0x1E4F143A8];
    v198[1] = 3221225472;
    v198[2] = __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_6;
    v198[3] = &unk_1E52DA110;
    id v199 = v141;
    v196[0] = MEMORY[0x1E4F143A8];
    v196[1] = 3221225472;
    v196[2] = __146___UINavigationBarVisualProviderLegacyIOS__startPopAnimationFromOldBackItem_oldTopItem_newBackItem_newTopItem_withTransitionAssistant_completion___block_invoke_7;
    v196[3] = &unk_1E52DA110;
    id v197 = v148;
    [v149 animateAlongsideTransition:v198 completion:v196];
  }
  else
  {
    +[UIView _animateWithDuration:393216 delay:v195 options:v141 factory:v148 animations:v136 completion:0.0];
  }
}

- (void)_completeNavigationTransitionWithIncomingViews:(id)a3 outgoingViews:(id)a4 transitionAssistant:(id)a5 completion:(id)a6
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v56 = (void (**)(id, uint64_t, void *))a6;
  double v59 = v12;
  double v57 = v10;
  double v58 = v11;
  if ([v12 cancelledTransition]) {
    double v13 = v10;
  }
  else {
    double v13 = v11;
  }
  id v14 = v13;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v15 = self->_slideTransitionClippingViews;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v77 objects:v84 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v78 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        id v21 = [v20 subviews];
        uint64_t v22 = [v21 lastObject];

        if (([v14 containsObject:v22] & 1) == 0)
        {
          if (!v22) {
            goto LABEL_13;
          }
          [(UIView *)self->_contentView insertSubview:v22 atIndex:[(_UINavigationBarVisualProviderLegacyIOS *)self _subviewIndexAboveBackground]];
        }

LABEL_13:
        [v20 removeFromSuperview];
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v77 objects:v84 count:16];
    }
    while (v17);
  }

  [(NSMutableArray *)self->_slideTransitionClippingViews removeAllObjects];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v23 = v14;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v73 objects:v83 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v74;
    long long v61 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v62 = *MEMORY[0x1E4F1DAB8];
    long long v60 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v74 != v26) {
          objc_enumerationMutation(v23);
        }
        double v28 = *(void **)(*((void *)&v73 + 1) + 8 * j);
        v72[0] = v62;
        v72[1] = v61;
        v72[2] = v60;
        [v28 setTransform:v72];
        if ([v59 cancelledTransition])
        {
          double v29 = objc_getAssociatedObject(v28, &_UINavigationBarOriginalFrameKey);
          double v30 = v29;
          if (v29)
          {
            [v29 CGRectValue];
            objc_msgSend(v28, "setFrame:");
            objc_setAssociatedObject(v28, &_UINavigationBarOriginalFrameKey, 0, (void *)1);
          }
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v73 objects:v83 count:16];
    }
    while (v25);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v31 = v23;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v68 objects:v82 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v69;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v69 != v34) {
          objc_enumerationMutation(v31);
        }
        id v36 = *(void **)(*((void *)&v68 + 1) + 8 * k);
        double v37 = [v36 superview];
        contentView = self->_contentView;

        if (v37 == contentView) {
          [v36 removeFromSuperview];
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v68 objects:v82 count:16];
    }
    while (v33);
  }

  double v39 = v59;
  if ([v59 cancelledTransition])
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v40 = v58;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v64 objects:v81 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v65;
      do
      {
        for (uint64_t m = 0; m != v42; ++m)
        {
          if (*(void *)v65 != v43) {
            objc_enumerationMutation(v40);
          }
          double v45 = *(void **)(*((void *)&v64 + 1) + 8 * m);
          [v45 setAlpha:1.0];
          BOOL v46 = objc_getAssociatedObject(v45, &_UINavigationBarOriginalFrameKey);
          uint64_t v47 = v46;
          if (v46)
          {
            [v46 CGRectValue];
            objc_msgSend(v45, "setFrame:");
            objc_setAssociatedObject(v45, &_UINavigationBarOriginalFrameKey, 0, (void *)1);
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v64 objects:v81 count:16];
      }
      while (v42);
    }

    double v39 = v59;
  }
  v56[2](v56, 1, v39);
  double v48 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  double v49 = [v48 _titleView];
  titleView = self->_titleView;
  self->_titleView = v49;

  if ([v39 shouldUpdatePromptAfterTransition])
  {
    [(UINavigationBar *)self->super._navigationBar updatePrompt];
    [v39 setShouldUpdatePromptAfterTransition:0];
  }
  [(_UINavigationBarVisualProviderLegacyIOS *)self _updateBackground];
  [v39 decrementAnimationCount];
  double v51 = [(UINavigationBar *)self->super._navigationBar topItem];
  double v52 = [v51 _pendingTitle];

  if (v52)
  {
    if ([v39 shouldAnimateAlongside])
    {
      double v53 = [v39 transitionCoordinator];
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __135___UINavigationBarVisualProviderLegacyIOS__completeNavigationTransitionWithIncomingViews_outgoingViews_transitionAssistant_completion___block_invoke;
      v63[3] = &unk_1E52DA598;
      v63[4] = self;
      [v53 animateAlongsideTransition:v63 completion:0];
    }
    else
    {
      double v53 = [(UINavigationBar *)self->super._navigationBar topItem];
      int v54 = [(UINavigationBar *)self->super._navigationBar topItem];
      CGFloat v55 = [v54 _pendingTitle];
      [v53 _setTitle:v55 animated:1 matchBarButtonItemAnimationDuration:1];
    }
  }
}

- (void)_setViewsAnimated:(BOOL)a3 forTopNavigationItem:(id)a4 backNavigationItem:(id)a5 previousTopItem:(id)a6
{
  BOOL v197 = a3;
  uint64_t v263 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v187 = a5;
  id v186 = a6;
  id v10 = [v9 _customLeftViews];
  v188 = v9;
  id v11 = [v9 _customRightViews];
  int64_t v12 = [(UINavigationBar *)self->super._navigationBar _barStyle];
  id v200 = self;
  BOOL v13 = [(UINavigationBar *)self->super._navigationBar isMinibar];
  long long v253 = 0u;
  long long v254 = 0u;
  long long v255 = 0u;
  long long v256 = 0u;
  obuint64_t j = v10;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v253 objects:v262 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v254;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v254 != v17) {
          objc_enumerationMutation(v14);
        }
        double v19 = *(void **)(*((void *)&v253 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v19 setControlSize:v13];
          [v19 setBarStyle:v12];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v19 setControlSize:v13];
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v253 objects:v262 count:16];
    }
    while (v16);
  }

  long long v251 = 0u;
  long long v252 = 0u;
  long long v249 = 0u;
  long long v250 = 0u;
  id v193 = v11;
  id v20 = v11;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v249 objects:v261 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v250;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v250 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void **)(*((void *)&v249 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v25 setControlSize:v13];
          [v25 setBarStyle:v12];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v25 setControlSize:v13];
          }
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v249 objects:v261 count:16];
    }
    while (v22);
  }

  CGSize v26 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  rect1.origiuint64_t n = (CGPoint)*MEMORY[0x1E4F1DB28];
  rect1.size = v26;
  uint64_t v27 = [v14 count];
  double v28 = [v188 leftBarButtonItems];
  double v29 = [v186 leftBarButtonItems];
  BOOL v182 = _dontCrossfadeBarButtonItems(v28, v29);

  double v30 = [v188 rightBarButtonItems];
  id v31 = [v186 rightBarButtonItems];
  BOOL v177 = _dontCrossfadeBarButtonItems(v30, v31);

  if ([v188 hidesBackButton])
  {
    unsigned int v32 = 0;
    uint64_t v33 = v200;
  }
  else
  {
    uint64_t v33 = v200;
    if (v27) {
      unsigned int v32 = [v188 leftItemsSupplementBackButton];
    }
    else {
      unsigned int v32 = 1;
    }
  }
  uint64_t v34 = [(_UINavigationBarVisualProviderLegacyIOS *)v33 _backButtonForBackItem:v187 topItem:v188];
  [v34 _setAbbreviatedTitleIndex:0x7FFFFFFFFFFFFFFFLL];
  uint64_t v35 = [v20 count];
  uint64_t v36 = v35;
  if (v27 || v32)
  {
    id v196 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

    if (v36) {
      goto LABEL_31;
    }
  }
  else
  {
    id v196 = 0;
    if (v35)
    {
LABEL_31:
      id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

      goto LABEL_34;
    }
  }
  id v37 = 0;
LABEL_34:
  uint64_t v38 = v33;
  double v39 = v196;
  [(_UINavigationBarVisualProviderLegacyIOS *)v38 _getTitleViewFrame:&rect1 leftViewFrames:v196 rightViewFrames:v37 forPreviousItem:v187 item:v188];
  uint64_t v40 = [v196 count];
  if (v40)
  {
    uint64_t v41 = v40;
    v243[0] = MEMORY[0x1E4F143A8];
    v243[1] = 3221225472;
    v243[2] = __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke;
    v243[3] = &unk_1E52DE2F8;
    char v247 = v32;
    id v244 = v34;
    id v245 = v196;
    uint64_t v246 = v41;
    [v14 enumerateObjectsUsingBlock:v243];
  }
  unsigned int v181 = v32;
  uint64_t v42 = [v37 count];
  if (v42)
  {
    uint64_t v43 = v42;
    v240[0] = MEMORY[0x1E4F143A8];
    v240[1] = 3221225472;
    v240[2] = __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_2;
    v240[3] = &unk_1E52DE320;
    id v241 = v37;
    uint64_t v242 = v43;
    [v20 enumerateObjectsUsingBlock:v240];
  }
  id v192 = v37;
  if (v197)
  {
    id v185 = v34;
    id v180 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v184 = v44;
    if (v14 && v200->_leftViews && objc_msgSend(v14, "isEqualToArray:") && v200->_leftViews)
    {
      int v183 = 0;
      id v176 = 0;
LABEL_95:
      long long v76 = v200;
      if (v20 && v200->_rightViews && objc_msgSend(v20, "isEqualToArray:") && v200->_rightViews)
      {
        id v175 = 0;
        goto LABEL_117;
      }
      p_rightViews = (id *)&v200->_rightViews;
      if (v200->_rightViews)
      {
        objc_msgSend(v180, "addObjectsFromArray:");
        if (v177)
        {
          long long v78 = [*p_rightViews lastObject];
          [v78 setAlpha:0.0];
        }
        long long v231 = 0u;
        long long v232 = 0u;
        long long v229 = 0u;
        long long v230 = 0u;
        id v79 = *p_rightViews;
        uint64_t v80 = [v79 countByEnumeratingWithState:&v229 objects:v259 count:16];
        if (v80)
        {
          uint64_t v81 = v80;
          uint64_t v82 = *(void *)v230;
          do
          {
            for (uint64_t k = 0; k != v81; ++k)
            {
              if (*(void *)v230 != v82) {
                objc_enumerationMutation(v79);
              }
              CGFloat v84 = *(void **)(*((void *)&v229 + 1) + 8 * k);
              if ([v84 isUserInteractionEnabled])
              {
                [v45 addObject:v84];
                [v84 setUserInteractionEnabled:0];
              }
            }
            uint64_t v81 = [v79 countByEnumeratingWithState:&v229 objects:v259 count:16];
          }
          while (v81);
        }

        id v175 = *p_rightViews;
        double v39 = v196;
        id v44 = v184;
        if (v20) {
          goto LABEL_113;
        }
      }
      else
      {
        id v175 = 0;
        if (v20)
        {
LABEL_113:
          v226[0] = MEMORY[0x1E4F143A8];
          v226[1] = 3221225472;
          v226[2] = __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_4;
          v226[3] = &unk_1E52DE348;
          BOOL v228 = v177;
          id v227 = v44;
          [v20 enumerateObjectsUsingBlock:v226];

          BOOL v85 = 1;
LABEL_116:
          v183 |= v85;
          objc_storeStrong((id *)&v200->_rightViews, v193);
LABEL_117:
          CGFloat v86 = [v188 _titleView];
          [v86 frame];
          v265.origin.double x = v87;
          v265.origin.CGFloat y = v88;
          v265.size.CGFloat width = v89;
          v265.size.CGFloat height = v90;
          BOOL v178 = CGRectEqualToRect(rect1, v265);

          uint64_t v198 = [(_UINavigationBarVisualProviderLegacyIOS *)v200 _subviewIndexAboveBackground];
          unint64_t v91 = [v39 count];
          unint64_t v92 = [(NSArray *)v200->_leftViews count];
          long long v222 = 0u;
          long long v223 = 0u;
          long long v224 = 0u;
          long long v225 = 0u;
          obja = v200->_leftViews;
          uint64_t v93 = [(NSArray *)obja countByEnumeratingWithState:&v222 objects:v258 count:16];
          if (v93)
          {
            uint64_t v94 = v93;
            char v95 = 0;
            uint64_t v96 = v91 > v92;
            id v194 = *(id *)v223;
            while (2)
            {
              for (uint64_t m = 0; m != v94; ++m)
              {
                if (*(id *)v223 != v194) {
                  objc_enumerationMutation(obja);
                }
                double v98 = *(void **)(*((void *)&v222 + 1) + 8 * m);
                [(UIView *)v76->_contentView insertSubview:v98 atIndex:v198];
                if (v95)
                {
                  BOOL v99 = 0;
                }
                else
                {
                  [v98 frame];
                  double v101 = v100;
                  double v103 = v102;
                  double v104 = [v196 objectAtIndexedSubscript:v96 + m];
                  [v104 CGRectValue];
                  BOOL v99 = v103 != v106 || v101 != v105;
                }
                v95 |= v99;
                if (v96 + m + 1 >= v91)
                {
                  long long v76 = v200;
                  goto LABEL_134;
                }
                long long v76 = v200;
              }
              uint64_t v94 = [(NSArray *)obja countByEnumeratingWithState:&v222 objects:v258 count:16];
              v96 += m;
              if (v94) {
                continue;
              }
              break;
            }
          }
          else
          {
            char v95 = 0;
          }
LABEL_134:
          int v179 = !v178;

          id v195 = (id)[v192 count];
          long long v218 = 0u;
          long long v219 = 0u;
          long long v220 = 0u;
          long long v221 = 0u;
          objb = v76->_rightViews;
          uint64_t v107 = [(NSArray *)objb countByEnumeratingWithState:&v218 objects:v257 count:16];
          if (v107)
          {
            uint64_t v108 = v107;
            uint64_t v109 = 0;
            uint64_t v110 = *(void *)v219;
            while (2)
            {
              for (uint64_t n = 0; n != v108; ++n)
              {
                if (*(void *)v219 != v110) {
                  objc_enumerationMutation(objb);
                }
                CGFloat v112 = *(void **)(*((void *)&v218 + 1) + 8 * n);
                [(UIView *)v76->_contentView insertSubview:v112 atIndex:v198];
                if (v95)
                {
                  BOOL v113 = 0;
                }
                else
                {
                  [v112 frame];
                  double v115 = v114;
                  double v117 = v116;
                  double v118 = [v192 objectAtIndexedSubscript:v109 + n];
                  [v118 CGRectValue];
                  BOOL v113 = v117 != v120 || v115 != v119;
                }
                v95 |= v113;
                if (v109 + n + 1 >= (unint64_t)v195)
                {
                  long long v76 = v200;
                  goto LABEL_150;
                }
                long long v76 = v200;
              }
              uint64_t v108 = [(NSArray *)objb countByEnumeratingWithState:&v218 objects:v257 count:16];
              v109 += n;
              if (v108) {
                continue;
              }
              break;
            }
          }
LABEL_150:

          if (v95)
          {
            [v196 removeAllObjects];
            [v192 removeAllObjects];
            [(_UINavigationBarVisualProviderLegacyIOS *)v76 _getTitleViewFrame:&rect1 leftViewFrames:v196 rightViewFrames:v192 forPreviousItem:v187 item:v188];
          }
          kuint64_t k = v184;
          if (!(v183 | v179)) {
            goto LABEL_181;
          }
          [v188 _titleViewWidthForAnimations];
          if (v122 == 0.0)
          {
            uint64_t v123 = [v188 _titleView];
            objc_msgSend(v123, "setFrame:", rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height);
          }
          else
          {
            v215[0] = MEMORY[0x1E4F143A8];
            v215[1] = 3221225472;
            v215[2] = __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_5;
            v215[3] = &unk_1E52DA520;
            id v216 = v188;
            CGRect v217 = rect1;
            +[UIView animateWithDuration:v215 animations:0.25];
            uint64_t v123 = v216;
          }

          if (v185) {
            uint64_t v124 = v181;
          }
          else {
            uint64_t v124 = 0;
          }
          if (v124 == 1)
          {
            double v125 = [v185 superview];
            double v126 = v125;
            if (v125 == v76->super._navigationBar)
            {
            }
            else
            {
              slideTransitionClippingViews = v76->_slideTransitionClippingViews;
              double v128 = [v185 superview];
              LOBYTE(slideTransitionClippingViews) = [(NSMutableArray *)slideTransitionClippingViews containsObject:v128];

              if ((slideTransitionClippingViews & 1) == 0) {
                [(UIView *)v76->_contentView addSubview:v185];
              }
            }
            [v185 alpha];
            if (v129 < 0.5) {
              goto LABEL_168;
            }
            [v185 frame];
            CGFloat v131 = v130;
            CGFloat v133 = v132;
            CGFloat v135 = v134;
            CGFloat v137 = v136;
            id v138 = [v196 objectAtIndex:0];
            [v138 CGRectValue];
            v266.origin.double x = v139;
            v266.origin.CGFloat y = v140;
            v266.size.CGFloat width = v141;
            v266.size.CGFloat height = v142;
            v264.origin.double x = v131;
            v264.origin.CGFloat y = v133;
            v264.size.CGFloat width = v135;
            v264.size.CGFloat height = v137;
            BOOL v143 = CGRectEqualToRect(v264, v266);

            if (!v143)
            {
LABEL_168:
              [v184 addObject:v185];
              id v144 = [v196 objectAtIndex:0];
              [v144 CGRectValue];
              objc_msgSend(v185, "setFrame:");
            }
          }
          else
          {
            [v185 removeFromSuperview];
            [v185 setAlpha:0.0];
            if (!v185)
            {
LABEL_172:
              unint64_t v147 = [v196 count];
              uint64_t v148 = v124;
              if (v147 > v124)
              {
                uint64_t v149 = 0;
                do
                {
                  double v150 = [(NSArray *)v76->_leftViews objectAtIndex:v149];
                  double v151 = [v196 objectAtIndex:v124 + v149];
                  [v151 CGRectValue];
                  objc_msgSend(v150, "setFrame:");

                  unint64_t v152 = [v196 count];
                  ++v149;
                  uint64_t v148 = v124 + v149;
                }
                while (v124 + v149 < v152);
              }
              for (iuint64_t i = v148 - v124; ii < [(NSArray *)v76->_leftViews count]; ++ii)
              {
                double v154 = [(NSArray *)v76->_leftViews objectAtIndex:ii];
                [v154 removeFromSuperview];
                [v184 removeObject:v154];
              }
              for (juint64_t j = 0; jj < [v192 count]; ++jj)
              {
                double v156 = [(NSArray *)v76->_rightViews objectAtIndex:jj];
                double v157 = [v192 objectAtIndex:jj];
                [v157 CGRectValue];
                objc_msgSend(v156, "setFrame:");
              }
              for (kuint64_t k = v184; jj < [(NSArray *)v76->_rightViews count]; ++jj)
              {
                double v158 = [(NSArray *)v76->_rightViews objectAtIndex:jj];
                [v158 removeFromSuperview];
                [v184 removeObject:v158];
              }
LABEL_181:
              double v159 = [(_UINavigationBarItemStack *)v76->super._stack transitionAssistant];
              [v159 duration];
              double v161 = v160;

              if (v161 == 0.0)
              {
                +[UINavigationBar defaultAnimationDuration];
                double v161 = v162;
              }
              double v163 = [(_UINavigationBarItemStack *)v76->super._stack transitionAssistant];
              [v163 incrementAnimationCount];

              aBlock[0] = MEMORY[0x1E4F143A8];
              aBlock[1] = 3221225472;
              aBlock[2] = __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_6;
              aBlock[3] = &unk_1E52D9F98;
              id v164 = v180;
              id v213 = v164;
              id v165 = kk;
              id v214 = v165;
              id v201 = _Block_copy(aBlock);
              v206[0] = MEMORY[0x1E4F143A8];
              v206[1] = 3221225472;
              v206[2] = __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_7;
              v206[3] = &unk_1E52DE370;
              v206[4] = v76;
              id v199 = v165;
              id v207 = v199;
              id v75 = v164;
              id v208 = v75;
              id v166 = v176;
              id v209 = v166;
              id v167 = v175;
              id v210 = v167;
              id v168 = v45;
              id v211 = v168;
              double v169 = _Block_copy(v206);
              CGFloat v170 = [(_UINavigationBarItemStack *)v76->super._stack transitionAssistant];
              CGFloat v171 = v76;
              char v172 = [v170 shouldAnimateAlongside];

              if (v172)
              {
                double v173 = [(_UINavigationBarItemStack *)v171->super._stack transitionAssistant];
                id v174 = [v173 transitionCoordinator];
                v204[0] = MEMORY[0x1E4F143A8];
                v204[1] = 3221225472;
                v204[2] = __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_8;
                v204[3] = &unk_1E52DA110;
                id v205 = v201;
                v202[0] = MEMORY[0x1E4F143A8];
                v202[1] = 3221225472;
                v202[2] = __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_9;
                v202[3] = &unk_1E52DA110;
                id v203 = v169;
                [v174 animateAlongsideTransition:v204 completion:v202];
              }
              else
              {
                +[UIView _animateWithDuration:393216 delay:v171 options:v201 factory:v169 animations:v161 completion:0.0];
              }

              long long v74 = v188;
              uint64_t v34 = v185;
              id v37 = v192;
              goto LABEL_187;
            }
          }
          char v145 = [v185 _suppressesBackIndicatorView];
          double v146 = 0.0;
          if ((v145 & 1) == 0) {
            objc_msgSend(v185, "alpha", 0.0);
          }
          [(UIView *)v76->_backIndicatorView setAlpha:v146];
          goto LABEL_172;
        }
      }
      BOOL v85 = *p_rightViews != 0;
      goto LABEL_116;
    }
    p_leftViews = (id *)&v200->_leftViews;
    if (v200->_leftViews)
    {
      objc_msgSend(v180, "addObjectsFromArray:");
      if (v182)
      {
        double v51 = [*p_leftViews lastObject];
        [v51 setAlpha:0.0];
      }
      long long v238 = 0u;
      long long v239 = 0u;
      long long v236 = 0u;
      long long v237 = 0u;
      id v52 = *p_leftViews;
      uint64_t v53 = [v52 countByEnumeratingWithState:&v236 objects:v260 count:16];
      if (v53)
      {
        uint64_t v54 = v53;
        uint64_t v55 = *(void *)v237;
        do
        {
          for (muint64_t m = 0; mm != v54; ++mm)
          {
            if (*(void *)v237 != v55) {
              objc_enumerationMutation(v52);
            }
            double v57 = *(void **)(*((void *)&v236 + 1) + 8 * mm);
            if ([v57 isUserInteractionEnabled])
            {
              [v45 addObject:v57];
              [v57 setUserInteractionEnabled:0];
            }
          }
          uint64_t v54 = [v52 countByEnumeratingWithState:&v236 objects:v260 count:16];
        }
        while (v54);
      }

      id v176 = *p_leftViews;
      id v44 = v184;
      if (v14) {
        goto LABEL_72;
      }
    }
    else
    {
      id v176 = 0;
      if (v14)
      {
LABEL_72:
        v233[0] = MEMORY[0x1E4F143A8];
        v233[1] = 3221225472;
        v233[2] = __117___UINavigationBarVisualProviderLegacyIOS__setViewsAnimated_forTopNavigationItem_backNavigationItem_previousTopItem___block_invoke_3;
        v233[3] = &unk_1E52DE348;
        BOOL v235 = v182;
        id v234 = v44;
        [v14 enumerateObjectsUsingBlock:v233];

        BOOL v58 = 1;
LABEL_94:
        int v183 = v58;
        objc_storeStrong(p_leftViews, obj);
        double v39 = v196;
        goto LABEL_95;
      }
    }
    BOOL v58 = *p_leftViews != 0;
    goto LABEL_94;
  }
  if (!v14 || !v200->_leftViews || !objc_msgSend(v14, "isEqualToArray:") || !v200->_leftViews)
  {
    [(NSArray *)v200->_leftViews makeObjectsPerformSelector:sel_removeFromSuperview];
    objc_storeStrong((id *)&v200->_leftViews, obj);
  }
  if (!v20 || !v200->_rightViews || !objc_msgSend(v20, "isEqualToArray:") || !v200->_rightViews)
  {
    [(NSArray *)v200->_rightViews makeObjectsPerformSelector:sel_removeFromSuperview];
    objc_storeStrong((id *)&v200->_rightViews, v193);
  }
  if (v32)
  {
    [v34 setPressed:0];
    objc_msgSend(v34, "setStyle:", -[UINavigationBar _barStyle](v200->super._navigationBar, "_barStyle"));
    BOOL v46 = [(_UINavigationBarItemStack *)v200->super._stack transitionAssistant];
    char v47 = [v46 shouldHideBackButtonDuringTransition];
    double v48 = 0.0;
    if ((v47 & 1) == 0)
    {
      int v49 = objc_msgSend(v188, "hidesBackButton", 0.0);
      double v48 = 1.0;
      if (v49) {
        double v48 = 0.0;
      }
    }
    [v34 setAlpha:v48];
  }
  else
  {
    [v34 removeFromSuperview];
    [v34 setAlpha:0.0];
  }
  double v59 = 0.0;
  if (v34 && ([v34 _suppressesBackIndicatorView] & 1) == 0)
  {
    [v34 alpha];
    double v59 = v60;
  }
  [(UIView *)v200->_backIndicatorView setAlpha:v59];
  if (v34) {
    unint64_t v61 = v32;
  }
  else {
    unint64_t v61 = 0;
  }
  unint64_t v62 = [v196 count];
  unint64_t v63 = v61;
  if (v62 > v61)
  {
    uint64_t v64 = 0;
    do
    {
      long long v65 = [v14 objectAtIndex:v64];
      long long v66 = [v196 objectAtIndex:v61 + v64];
      [v66 CGRectValue];
      objc_msgSend(v65, "setFrame:");

      [(UIView *)v200->_contentView addSubview:v65];
      [v65 setAlpha:1.0];

      unint64_t v67 = [v196 count];
      ++v64;
      unint64_t v63 = v61 + v64;
    }
    while (v61 + v64 < v67);
  }
  for (nuint64_t n = v63 - v61; nn < [(NSArray *)v200->_leftViews count]; ++nn)
  {
    long long v69 = [(NSArray *)v200->_leftViews objectAtIndex:nn];
    [v69 removeFromSuperview];
  }
  for (unint64_t i1 = 0; i1 < [v37 count]; ++i1)
  {
    long long v71 = [v20 objectAtIndex:i1];
    char v72 = [v37 objectAtIndex:i1];
    [v72 CGRectValue];
    objc_msgSend(v71, "setFrame:");

    [(UIView *)v200->_contentView addSubview:v71];
    [v71 setAlpha:1.0];
  }
  while (i1 < [(NSArray *)v200->_rightViews count])
  {
    long long v73 = [(NSArray *)v200->_rightViews objectAtIndex:i1];
    [v73 removeFromSuperview];

    ++i1;
  }
  long long v74 = v188;
  id v75 = [v188 _titleView];
  objc_msgSend(v75, "setFrame:", rect1.origin.x, rect1.origin.y, rect1.size.width, rect1.size.height);
LABEL_187:
}

- (void)_completeTopItemTransitionWithIncomingViews:(id)a3 outgoingViews:(id)a4 previousLeftViews:(id)a5 previousRightViews:(id)a6 enableUserInteraction:(id)a7 transitionAssistant:(id)a8
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v37 = a5;
  id v41 = a5;
  obuint64_t j = a6;
  id v40 = a6;
  id v16 = a7;
  id v39 = a8;
  int v38 = [v39 cancelledTransition];
  uint64_t v42 = v15;
  uint64_t v43 = v14;
  if (v38) {
    uint64_t v17 = v14;
  }
  else {
    uint64_t v17 = v15;
  }
  id v18 = v17;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v53 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        objc_msgSend(v23, "superview", obj, v37);
        uint64_t v24 = (UIView *)objc_claimAutoreleasedReturnValue();
        contentView = self->_contentView;

        if (v24 == contentView) {
          [v23 removeFromSuperview];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v20);
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v26 = v16;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v49 != v29) {
          objc_enumerationMutation(v26);
        }
        objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * j), "setUserInteractionEnabled:", 1, obj);
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v28);
  }

  if (v38)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v31 = v42;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v45;
      do
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v45 != v34) {
            objc_enumerationMutation(v31);
          }
          objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * k), "setAlpha:", 1.0, obj);
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v44 objects:v56 count:16];
      }
      while (v33);
    }

    objc_storeStrong((id *)&self->_rightViews, obj);
    objc_storeStrong((id *)&self->_leftViews, v37);
  }
  objc_msgSend(v39, "decrementAnimationCount", obj);
}

- (void)_updateBackground
{
  if ([(UIView *)self->super._navigationBar _canDrawContent])
  {
    [(UIView *)self->_backgroundView removeFromSuperview];
    navigationBar = self->super._navigationBar;
    [(UIView *)navigationBar setNeedsDisplay];
    return;
  }
  [(_UIBarBackground *)self->_backgroundView setCustomBackgroundView:self->_customBackgroundView];
  [(UIView *)self->super._navigationBar insertSubview:self->_backgroundView atIndex:0];
  [(UIView *)self->super._navigationBar bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  int64_t v12 = [(UINavigationBar *)self->super._navigationBar _barPosition];
  BOOL v13 = v12 == 3;
  if (self->_customBackgroundView)
  {
    [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout configureWithoutShadow];
    [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout setTopInset:0.0];
    if (v12 == 3)
    {
      double v14 = v11;
      goto LABEL_47;
    }
    double v14 = v11;
    goto LABEL_50;
  }
  id v15 = [(UIView *)self->super._navigationBar traitCollection];
  -[_UIBarBackgroundLayout setInterfaceIdiom:](self->_backgroundViewLayout, "setInterfaceIdiom:", [v15 userInterfaceIdiom]);

  id v16 = [(UIView *)self->super._navigationBar traitCollection];
  -[_UIBarBackgroundLayout setInterfaceStyle:](self->_backgroundViewLayout, "setInterfaceStyle:", [v16 userInterfaceStyle]);

  BOOL v68 = [(UINavigationBar *)self->super._navigationBar isTranslucent];
  uint64_t v17 = [(UINavigationBar *)self->super._navigationBar _effectiveBarTintColor];
  char v72 = 0;
  uint64_t v71 = 0;
  UIBarStyle v18 = [(UINavigationBar *)self->super._navigationBar barStyle];
  uint64_t v19 = self->super._navigationBar;
  if (v18 != 4)
  {
    id v70 = 0;
    [(UINavigationBar *)v19 _getBackgroundImage:&v70 shouldRespectOversizedBackgroundImage:&v72 actualBarMetrics:&v71 actualBarPosition:0];
    id v21 = v70;
    int v20 = [(UINavigationBar *)self->super._navigationBar _hidesShadow];
    if (!v21) {
      goto LABEL_17;
    }
    unint64_t v67 = v17;
    [v21 size];
    double v14 = v22;
    [v21 capInsets];
    BOOL v25 = 0;
    if (v12 == 3 && v23 == 0.0 && v24 == 0.0)
    {
      BOOL v66 = v12 == 3;
      id v26 = [(UIView *)self->super._navigationBar window];
      uint64_t v27 = __UIStatusBarManagerForWindow(v26);
      char v28 = [v27 isStatusBarHidden];

      if (v28)
      {
        BOOL v25 = 0;
      }
      else
      {
        uint64_t v35 = [(UINavigationBar *)self->super._navigationBar _currentVisualStyle];
        [v35 barHeightForMetrics:v71];
        BOOL v25 = v14 == v36;
      }
      BOOL v13 = v66;
    }
    char v69 = 0;
    [v21 _isInvisibleAndGetIsTranslucent:&v69];
    if (v68)
    {
      [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout configureImage:v21 forceTranslucent:v69 == 0];
    }
    else
    {
      backgroundViewLayout = self->_backgroundViewLayout;
      if (v67) {
        -[_UIBarBackgroundLayoutLegacy configureImage:forceOpaque:backgroundTintColor:](backgroundViewLayout, "configureImage:forceOpaque:backgroundTintColor:", v21, v69 != 0);
      }
      else {
        [(_UIBarBackgroundLayoutLegacy *)backgroundViewLayout configureImage:v21 forceOpaque:v69 != 0 barStyle:v18];
      }
    }
    if (v72) {
      int v38 = 1;
    }
    else {
      int v38 = v20;
    }
    if (v38 == 1)
    {
      if (!v72) {
        double v14 = v11;
      }
      if (v20)
      {
        [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout configureWithoutShadow];
        goto LABEL_43;
      }
    }
    else
    {
      uint64_t v39 = [(UINavigationBar *)self->super._navigationBar shadowImage];
      double v14 = v11;
      if (v39)
      {
        uint64_t v33 = (void *)v39;
        [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout configureShadowImage:v39];
        double v34 = 0.0;
        double v14 = v11;
        if (v25)
        {
LABEL_44:
          id v40 = [(UIView *)self->super._navigationBar window];
          id v41 = __UIStatusBarManagerForWindow(v40);
          [v41 defaultStatusBarHeightInOrientation:1];
          double v34 = v42;

          goto LABEL_45;
        }
        double v14 = v11;
LABEL_45:
        uint64_t v17 = v67;
        goto LABEL_46;
      }
    }
    [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout configureShadowForBarStyle:v18];
LABEL_43:
    uint64_t v33 = 0;
    double v34 = 0.0;
    if (v25) {
      goto LABEL_44;
    }
    goto LABEL_45;
  }
  int v20 = [(UINavigationBar *)v19 _hidesShadow];
LABEL_17:
  uint64_t v29 = [(UIView *)self->super._navigationBar _screen];
  uint64_t v30 = [v29 _userInterfaceIdiom];

  id v31 = self->_backgroundViewLayout;
  if (v30 == 3)
  {
    [(_UIBarBackgroundLayoutLegacy *)v31 configureAsTransparent];
    BOOL v13 = 0;
  }
  else
  {
    [(_UIBarBackgroundLayoutLegacy *)v31 configureEffectForStyle:v18 backgroundTintColor:v17 forceOpaque:!v68];
  }
  uint64_t v32 = self->_backgroundViewLayout;
  if (v20) {
    [(_UIBarBackgroundLayoutLegacy *)v32 configureWithoutShadow];
  }
  else {
    [(_UIBarBackgroundLayoutLegacy *)v32 configureShadowForBarStyle:v18];
  }
  id v21 = 0;
  uint64_t v33 = 0;
  double v34 = 0.0;
  double v14 = v11;
LABEL_46:
  [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout setTopInset:v34];

  if (v13)
  {
LABEL_47:
    BOOL v43 = [(UINavigationBar *)self->super._navigationBar _delegateWantsNavigationBarHidden];
    long long v44 = self->super._navigationBar;
    if (v43)
    {
      long long v45 = [(UIView *)v44 window];
      long long v46 = __UIStatusBarManagerForWindow(v45);
      char v47 = [v46 isStatusBarHidden];

      if ((v47 & 1) == 0)
      {
        long long v48 = [(UIView *)self->super._navigationBar window];
        long long v49 = __UIStatusBarManagerForWindow(v48);
        [v49 defaultStatusBarHeightInOrientation:1];
        double v51 = v50;

        v74.origin.double x = v5;
        v74.origin.CGFloat y = v7;
        v74.size.CGFloat width = v9;
        v74.size.CGFloat height = v11;
        CGFloat v52 = CGRectGetMinY(v74) - v51;
        v75.origin.double x = v5;
        v75.origin.CGFloat y = v7;
        v75.size.CGFloat width = v9;
        v75.size.CGFloat height = v11;
        double v14 = v51 + CGRectGetHeight(v75);
        double v7 = v52;
      }
    }
    else
    {
      [(UIView *)v44 frame];
      double v7 = -v54;
      double v14 = v54 + v55;
    }
    goto LABEL_52;
  }
LABEL_50:
  [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout topInset];
  double v7 = v7 - v53;
  double v14 = v14 + v53;
LABEL_52:
  [(UIView *)self->_backgroundView frame];
  v77.origin.double x = v56;
  v77.origin.CGFloat y = v57;
  v77.size.CGFloat width = v58;
  v77.size.CGFloat height = v59;
  v76.origin.double x = v5;
  v76.origin.CGFloat y = v7;
  v76.size.CGFloat width = v9;
  v76.size.CGFloat height = v14;
  if (!CGRectEqualToRect(v76, v77)) {
    -[UIView setFrame:](self->_backgroundView, "setFrame:", v5, v7, v9, v14);
  }
  double v60 = [(UINavigationBar *)self->super._navigationBar topItem];
  int v61 = [v60 _backgroundHidden];

  if (v61)
  {
    [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout configureAsTransparent];
    [(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout configureWithoutShadow];
    [(_UIBarBackgroundLayout *)self->_backgroundViewLayout setShadowAlpha:1.0];
  }
  [(_UINavigationBarVisualProviderLegacyIOS *)self updateBackgroundGroupName];
  [(_UIBarBackground *)self->_backgroundView transitionBackgroundViews];
  [(UINavigationBar *)self->super._navigationBar _updatePaletteBackgroundIfNecessary];
  unint64_t v62 = [(UINavigationBar *)self->super._navigationBar _accessibilityButtonBackgroundTintColor];
  if (v62)
  {
    uint64_t v63 = 0;
  }
  else
  {
    uint64_t v64 = +[UIDevice currentDevice];
    uint64_t v63 = [v64 _graphicsQuality] == 100
       && _UIBarBlurAcceptsBlendModeOnBackground(self->super._navigationBar);
  }
  long long v65 = [(UIView *)self->_contentView subviews];
  _UINavigationButtonUpdateAccessibilityBackgrounds(v65, v63, v62);
}

- (void)updateBackgroundGroupName
{
  id v5 = [(UIView *)self->super._navigationBar traitCollection];
  id v3 = self;
  double v4 = [v5 objectForTrait:v3];
  [(_UIBarBackground *)self->_backgroundView setGroupName:v4];
}

- (void)provideViewsForContents:(id)a3 topItem:(id)a4 backItem:(id)a5
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CGFloat v11 = [v9 _titleView];
  [v8 setTitleView:v11];

  [v8 setPromptView:self->_prompt];
  int64_t v12 = [(_UINavigationBarVisualProviderLegacyIOS *)self _backButtonForBackItem:v10 topItem:v9];

  if (v12)
  {
    if (self->_backIndicatorView)
    {
      v23[0] = self->_backIndicatorView;
      v23[1] = v12;
      BOOL v13 = (void *)MEMORY[0x1E4F1C978];
      double v14 = (UIImageView **)v23;
      uint64_t v15 = 2;
LABEL_10:
      UIBarStyle v18 = [v13 arrayWithObjects:v14 count:v15];
      [v8 setViewsRepresentingBackButton:v18];

      goto LABEL_11;
    }
    double v22 = v12;
    BOOL v13 = (void *)MEMORY[0x1E4F1C978];
    double v14 = (UIImageView **)&v22;
LABEL_9:
    uint64_t v15 = 1;
    goto LABEL_10;
  }
  if ([(_UINavigationBarVisualProviderLegacyIOS *)self _shouldShowBackButtonForNavigationItem:v9])
  {
    backIndicatorView = self->_backIndicatorView;
    if (backIndicatorView)
    {
      [(UIView *)backIndicatorView alpha];
      if (v17 > 0.0)
      {
        id v21 = self->_backIndicatorView;
        BOOL v13 = (void *)MEMORY[0x1E4F1C978];
        double v14 = &v21;
        goto LABEL_9;
      }
    }
  }
LABEL_11:
  if (self->_backgroundView)
  {
    backgroundView = self->_backgroundView;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&backgroundView count:1];
    [v8 setViewsRepresentingContentBackground:v19];
  }
}

- (void)_setUpContentFocusContainerGuide
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(UIView *)self->super._navigationBar _focusSystem];

  if (v3)
  {
    if (!self->_contentFocusContainerGuide)
    {
      double v4 = objc_alloc_init(UIFocusContainerGuide);
      contentFocusContainerGuide = self->_contentFocusContainerGuide;
      self->_contentFocusContainerGuide = v4;

      [(UIView *)self->super._navigationBar addLayoutGuide:self->_contentFocusContainerGuide];
      [(UILayoutGuide *)self->_contentFocusContainerGuide setIdentifier:@"UINavigationBarContentFocusContainerGuide"];
      id v16 = (void *)MEMORY[0x1E4F5B268];
      uint64_t v19 = [(UILayoutGuide *)self->_contentFocusContainerGuide topAnchor];
      UIBarStyle v18 = [(UIView *)self->super._navigationBar topAnchor];
      double v17 = [v19 constraintEqualToAnchor:v18];
      v20[0] = v17;
      double v6 = [(UILayoutGuide *)self->_contentFocusContainerGuide leadingAnchor];
      double v7 = [(UIView *)self->super._navigationBar leadingAnchor];
      id v8 = [v6 constraintEqualToAnchor:v7];
      v20[1] = v8;
      id v9 = [(UILayoutGuide *)self->_contentFocusContainerGuide trailingAnchor];
      id v10 = [(UIView *)self->super._navigationBar trailingAnchor];
      CGFloat v11 = [v9 constraintEqualToAnchor:v10];
      v20[2] = v11;
      int64_t v12 = [(UILayoutGuide *)self->_contentFocusContainerGuide bottomAnchor];
      BOOL v13 = [(UIView *)self->super._navigationBar bottomAnchor];
      double v14 = [v12 constraintEqualToAnchor:v13];
      v20[3] = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
      [v16 activateConstraints:v15];
    }
  }
}

- (id)_shim_contentView
{
  return self->_contentView;
}

- (id)_shim_layoutView
{
  return self->_layoutView;
}

- (id)_shim_displayViewsIncludingHiddenBackButtonViews:(BOOL)a3
{
  id v5 = [(UIView *)self->_contentView subviews];
  double v6 = (void *)[v5 mutableCopy];

  [v6 removeObject:self->_backgroundView];
  if (!a3)
  {
    double v7 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    id v8 = [(_UINavigationBarItemStack *)self->super._stack backItem];
    id v9 = [v8 backButtonView];
    if (v9)
    {
      if ([v7 hidesBackButton]) {
        [v6 removeObject:v9];
      }
      p_backIndicatorView = &self->_backIndicatorView;
      if (!*p_backIndicatorView
        || ([v7 hidesBackButton] & 1) == 0
        && [v7 _wantsBackButtonIndicator]
        && ![v9 _suppressesBackIndicatorView])
      {
        goto LABEL_12;
      }
    }
    else
    {
      p_backIndicatorView = &self->_backIndicatorView;
      if (!*p_backIndicatorView)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    [v6 removeObject:*p_backIndicatorView];
    goto LABEL_12;
  }
LABEL_13:
  return v6;
}

- (void)_shim_setCustomBackgroundView:(id)a3
{
  id v5 = (UIView *)a3;
  if (self->_customBackgroundView != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_customBackgroundView, a3);
    [(_UINavigationBarVisualProviderLegacyIOS *)self _updateBackground];
    id v5 = v6;
  }
}

- (id)_shim_compatibilityBackgroundView
{
  customBackgroundView = (_UIBarBackground *)self->_customBackgroundView;
  if (!customBackgroundView) {
    customBackgroundView = self->_backgroundView;
  }
  return customBackgroundView;
}

- (double)_shim_shadowAlpha
{
  [(_UIBarBackgroundLayout *)self->_backgroundViewLayout shadowAlpha];
  return result;
}

- (void)_shim_setShadowAlpha:(double)a3
{
}

- (void)_shim_setUseContentView:(BOOL)a3
{
  if (a3)
  {
    double v4 = [_UINavigationBarLegacyContentView alloc];
    [(UIView *)self->super._navigationBar bounds];
    id v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
    p_layoutView = (UIView **)&self->_layoutView;
    layoutView = self->_layoutView;
    self->_layoutView = v5;

    [(_UINavigationBarLegacyContentView *)self->_layoutView setVisualProvider:self];
    [(UIView *)self->super._navigationBar addSubview:self->_layoutView];
  }
  else
  {
    [(UIView *)self->_layoutView removeFromSuperview];
    id v8 = self->_layoutView;
    self->_layoutView = 0;

    p_layoutView = (UIView **)&self->super._navigationBar;
  }
  self->_contentView = *p_layoutView;
}

- (BOOL)_shim_disableBlurTinting
{
  return [(_UIBarBackgroundLayout *)self->_backgroundViewLayout disableTinting];
}

- (void)_shim_setDisableBlurTinting:(BOOL)a3
{
  [(_UIBarBackgroundLayout *)self->_backgroundViewLayout setDisableTinting:a3];
  [(_UINavigationBarVisualProviderLegacyIOS *)self changeAppearance];
}

- (double)_shim_backgroundHeight
{
  [(UIView *)self->_backgroundView frame];
  return v2;
}

- (int64_t)_shim_backdropStyle
{
  if (![(_UIBarBackgroundLayoutLegacy *)self->_backgroundViewLayout hasBackgroundEffect]) {
    return 0;
  }
  UIBarStyle v3 = [(UINavigationBar *)self->super._navigationBar barStyle];
  double v4 = [(UIView *)self->super._navigationBar traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];
  uint64_t v6 = 2010;
  if ((unint64_t)(v3 - 1) < 2) {
    uint64_t v6 = 2030;
  }
  uint64_t v7 = 4004;
  if ((unint64_t)(v3 - 1) < 2) {
    uint64_t v7 = 4009;
  }
  if (v5 == 8 || v5 == 2) {
    int64_t v9 = v7;
  }
  else {
    int64_t v9 = v6;
  }

  return v9;
}

- (id)_shim_userContentGuide
{
  v25[4] = *MEMORY[0x1E4F143B8];
  userContentGuide = self->_userContentGuide;
  if (!userContentGuide)
  {
    double v4 = objc_alloc_init(UILayoutGuide);
    uint64_t v5 = self->_userContentGuide;
    self->_userContentGuide = v4;

    [(UIView *)self->super._navigationBar addLayoutGuide:self->_userContentGuide];
    [(UILayoutGuide *)self->_userContentGuide _setLockedToOwningView:1];
    [(UILayoutGuide *)self->_userContentGuide setIdentifier:@"_UINavigationBarContentGuide"];
    uint64_t v6 = [(UILayoutGuide *)self->_userContentGuide topAnchor];
    uint64_t v7 = [(UIView *)self->super._navigationBar topAnchor];
    id v8 = [v6 constraintEqualToAnchor:v7];

    [v8 setIdentifier:@"_UINavigationBarContentGuide.top"];
    int64_t v9 = [(UILayoutGuide *)self->_userContentGuide bottomAnchor];
    id v10 = [(UIView *)self->super._navigationBar bottomAnchor];
    CGFloat v11 = [v9 constraintEqualToAnchor:v10];

    [v11 setIdentifier:@"_UINavigationBarContentGuide.bottom"];
    int64_t v12 = [(UILayoutGuide *)self->_userContentGuide leadingAnchor];
    BOOL v13 = [(UIView *)self->super._navigationBar leadingAnchor];
    double v14 = [v12 constraintEqualToAnchor:v13];
    userContentGuideLeading = self->_userContentGuideLeading;
    self->_userContentGuideLeading = v14;

    [(NSLayoutConstraint *)self->_userContentGuideLeading setIdentifier:@"_UINavigationBarContentGuide.leading"];
    id v16 = [(UIView *)self->super._navigationBar trailingAnchor];
    double v17 = [(UILayoutGuide *)self->_userContentGuide trailingAnchor];
    UIBarStyle v18 = [v16 constraintEqualToAnchor:v17];
    userContentGuideTrailing = self->_userContentGuideTrailing;
    self->_userContentGuideTrailing = v18;

    [(NSLayoutConstraint *)self->_userContentGuideTrailing setIdentifier:@"_UINavigationBarContentGuide.trailing"];
    v25[0] = v8;
    v25[1] = v11;
    int v20 = self->_userContentGuideTrailing;
    v25[2] = self->_userContentGuideLeading;
    v25[3] = v20;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
    [(UILayoutGuide *)self->_userContentGuide _setSystemConstraints:v21];

    double v22 = (void *)MEMORY[0x1E4F5B268];
    double v23 = [(UILayoutGuide *)self->_userContentGuide _systemConstraints];
    [v22 activateConstraints:v23];

    userContentGuide = self->_userContentGuide;
  }
  return userContentGuide;
}

- (void)_shim_updateUserContentGuideForTopItem:(id)a3 backItem:(id)a4
{
  id v6 = a3;
  if (self->_userContentGuide)
  {
    uint64_t v7 = [(_UINavigationBarVisualProviderLegacyIOS *)self _backButtonForBackItem:a4 topItem:v6];

    if (v7) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = [v6 _wantsBackButtonIndicator];
    }
    double v13 = 0.0;
    int64_t v9 = [(UINavigationBar *)self->super._navigationBar _currentVisualStyle];
    [(_UINavigationBarVisualProviderLegacyIOS *)self _getLeftMargin:&v13 rightMargin:&v12 forNavigationItem:v6 showingBackButton:v8 visualStyle:v9];
    [(UIView *)self->super._navigationBar bounds];
    double v10 = v13;
    if (v11 < v13 + v12)
    {
      double v12 = 0.0;
      double v13 = 0.0;
      double v10 = 0.0;
    }
    -[NSLayoutConstraint setConstant:](self->_userContentGuideLeading, "setConstant:", v10, *(void *)&v12, *(void *)&v13);
    [(NSLayoutConstraint *)self->_userContentGuideTrailing setConstant:v12];
  }
}

- (id)_shim_promptText
{
  return [(_UINavBarPrompt *)self->_prompt prompt];
}

- (void)_shim_setPromptText:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(_UINavBarPrompt *)self->_prompt prompt];
  if (v7 == v6) {
    goto LABEL_26;
  }
  if (v6)
  {
    uint64_t v8 = self->_prompt;
    int64_t v9 = [[_UINavBarPrompt alloc] initWithNavBar:self->super._navigationBar];
    prompt = self->_prompt;
    self->_prompt = v9;

    [(_UINavBarPrompt *)self->_prompt setPrompt:v6];
  }
  else
  {
    if ([0 isEqualToString:v7]) {
      goto LABEL_26;
    }
    uint64_t v8 = self->_prompt;
    double v11 = self->_prompt;
    self->_prompt = 0;
  }
  double v12 = [(UINavigationBar *)self->super._navigationBar _currentVisualStyle];
  double v13 = self->_prompt;
  if (v13)
  {
    [(UIView *)self->_contentView bounds];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    [v12 promptInset];
    CGFloat v23 = v22;
    v34.origin.double x = v15;
    v34.origin.CGFloat y = v17;
    v34.size.CGFloat width = v19;
    v34.size.CGFloat height = v21;
    CGRect v35 = CGRectInset(v34, v23, 0.0);
    -[UIView setFrame:](v13, "setFrame:", v35.origin.x, v35.origin.y, v35.size.width, v35.size.height);
    [(UIView *)self->_contentView addSubview:self->_prompt];
  }
  uint64_t v24 = [v12 metrics];
  if (v24 <= 100)
  {
    if (v24)
    {
      if (v24 != 1 || !self->_prompt) {
        goto LABEL_22;
      }
      goto LABEL_16;
    }
    if (!self->_prompt) {
      goto LABEL_22;
    }
    uint64_t v25 = 101;
LABEL_21:
    [v12 setMetrics:v25];
    goto LABEL_22;
  }
  if (v24 == 101)
  {
    if (self->_prompt) {
      goto LABEL_22;
    }
    uint64_t v25 = 0;
    goto LABEL_21;
  }
  if (v24 == 102 && !self->_prompt)
  {
LABEL_16:
    uint64_t v25 = 102;
    goto LABEL_21;
  }
LABEL_22:
  [(UIView *)self->_prompt setAlpha:0.0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72___UINavigationBarVisualProviderLegacyIOS__shim_setPromptText_animated___block_invoke;
  aBlock[3] = &unk_1E52D9F98;
  void aBlock[4] = self;
  id v26 = v8;
  uint64_t v33 = v26;
  uint64_t v27 = (void (**)(void))_Block_copy(aBlock);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __72___UINavigationBarVisualProviderLegacyIOS__shim_setPromptText_animated___block_invoke_2;
  v30[3] = &unk_1E52DC3A0;
  id v31 = v26;
  char v28 = v26;
  uint64_t v29 = (void (**)(void *, uint64_t))_Block_copy(v30);
  if (v4)
  {
    +[UINavigationBar defaultAnimationDuration];
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v27, v29);
  }
  else
  {
    v27[2](v27);
    v29[2](v29, 1);
  }

LABEL_26:
}

- (id)_shim_backIndicatorView
{
  return self->_backIndicatorView;
}

- (void)_shim_pressBackIndicator:(BOOL)a3 initialPress:(BOOL)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  backIndicatorView = self->_backIndicatorView;
  if (backIndicatorView)
  {
    BOOL v6 = a4;
    BOOL v7 = a3;
    [(UIView *)backIndicatorView alpha];
    if (v8 > 0.0)
    {
      v10[0] = self->_backIndicatorView;
      int64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
      +[UIButton _setVisuallyHighlighted:v7 forViews:v9 initialPress:v6];
    }
  }
}

- (id)_shim_customHitTest:(CGPoint)a3 forView:(id)a4
{
  double x = a3.x;
  BOOL v6 = (UINavigationBar *)a4;
  BOOL v7 = v6;
  if ((UINavigationBar *)self->_contentView == v6 || self->super._navigationBar == v6)
  {
    int64_t v9 = [(UIView *)v6 window];
    double v10 = [v9 windowScene];
    if ((unint64_t)([v10 interfaceOrientation] - 3) >= 2) {
      double v11 = 100.0;
    }
    else {
      double v11 = 75.0;
    }

    [(UIView *)self->super._navigationBar bounds];
    CGFloat v12 = v71.origin.x;
    CGFloat y = v71.origin.y;
    CGFloat width = v71.size.width;
    CGFloat height = v71.size.height;
    double MinX = CGRectGetMinX(v71);
    v72.origin.double x = v12;
    v72.origin.CGFloat y = y;
    v72.size.CGFloat width = width;
    v72.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v72);
    double v18 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    CGFloat v19 = [v18 _customLeftViews];
    double v20 = [v18 _customRightViews];
    CGFloat v21 = [(_UINavigationBarItemStack *)self->super._stack backItem];
    double v22 = [(_UINavigationBarVisualProviderLegacyIOS *)self _backButtonForBackItem:v21 topItem:v18];

    unint64_t v62 = v18;
    if (!v22 || ([v22 isHidden] & 1) != 0 || (objc_msgSend(v22, "alpha"), v23 <= 0.05))
    {
      BOOL v25 = 0;
    }
    else
    {
      uint64_t v24 = [v22 superview];
      BOOL v25 = v24 == self->_contentView;
    }
    unint64_t v26 = [v19 count];
    uint64_t v27 = [v20 count];
    int v61 = v22;
    if (v25) {
      char v28 = v22;
    }
    else {
      char v28 = 0;
    }
    uint64_t v29 = v28;
    char v30 = UIViewIgnoresTouchEvents(self->_titleView);
    titleView = 0;
    if ((v30 & 1) == 0) {
      titleView = self->_titleView;
    }
    uint64_t v64 = self;
    long long v65 = titleView;
    uint64_t v32 = v27 - 1;
    uint64_t v63 = v7;
    uint64_t v60 = 136;
    if (v32 < 0)
    {
      id v35 = 0;
      uint64_t v33 = -1;
    }
    else
    {
      uint64_t v33 = -1;
      do
      {
        CGRect v34 = objc_msgSend(v20, "objectAtIndex:", v32, v60, v61, v62);
        id v35 = [v34 superview];
        if (v35)
        {
          char v36 = UIViewIgnoresTouchEvents(v34);

          if (v36)
          {
            id v35 = 0;
          }
          else
          {
            id v35 = v34;
            uint64_t v33 = v32;
          }
        }

        BOOL v37 = v32-- < 1;
      }
      while (!v37 && !v35);
    }
    BOOL v68 = v65;
    if (!v65) {
      BOOL v68 = (UIView *)v35;
    }
    BOOL v66 = v35;
    if (v26)
    {
      uint64_t v38 = 0;
      BOOL v67 = v25 || v26 != 1;
      do
      {
        objc_msgSend(v19, "objectAtIndex:", v38, v60);
        double v8 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
        uint64_t v39 = [(UIView *)v8 superview];
        if (v39 && (id v40 = (void *)v39, v41 = UIViewIgnoresTouchEvents(v8), v40, (v41 & 1) == 0))
        {
          uint64_t v69 = v38 + 1;
          if (v38 + 1 >= v26) {
            goto LABEL_44;
          }
          unint64_t v42 = v38 + 2;
          do
          {
            BOOL v43 = [v19 objectAtIndex:v42 - 1];
            p_super = [v43 superview];
            if (p_super)
            {
              char v45 = UIViewIgnoresTouchEvents(v43);

              if (v45) {
                p_super = 0;
              }
              else {
                p_super = v43;
              }
            }

            if (v42 >= v26) {
              break;
            }
            ++v42;
          }
          while (!p_super);
          id v35 = v66;
          if (p_super)
          {
            int v46 = 0;
            char v47 = p_super;
          }
          else
          {
LABEL_44:
            p_super = 0;
            int v46 = 1;
            char v47 = v68;
          }
          long long v48 = v47;
          double v49 = _hitAreaRightEdge(v8, v48, MaxX);
          double v50 = fmax(v49, v11);
          if (!v67) {
            double v49 = v50;
          }
          if (x <= v49 && x >= _hitAreaLeftEdge(v29, v8, MinX))
          {

LABEL_82:
LABEL_83:
            BOOL v7 = v63;
            goto LABEL_84;
          }
          double v51 = v8;

          if (v46)
          {

            uint64_t v29 = v51;
            break;
          }

          uint64_t v38 = v69;
          uint64_t v29 = v51;
        }
        else
        {

          ++v38;
        }
      }
      while (v38 != v26);
    }
    if (v65)
    {
      if (x >= _hitAreaLeftEdge(v29, v64->_titleView, MinX) && x <= _hitAreaRightEdge(v64->_titleView, v35, MaxX))
      {
        double v8 = v64->_titleView;
        goto LABEL_83;
      }
      CGFloat v52 = v64->_titleView;

      uint64_t v29 = (UINavigationBar *)v52;
    }
    if ((v33 & 0x8000000000000000) == 0)
    {
      while (1)
      {
        objc_msgSend(v20, "objectAtIndex:", v33, v60);
        double v8 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
        uint64_t v53 = [(UIView *)v8 superview];
        if (v53 && (double v54 = (void *)v53, v55 = UIViewIgnoresTouchEvents(v8), v54, (v55 & 1) == 0))
        {
          unint64_t v56 = v33;
          if (v33)
          {
            do
            {
              CGFloat v57 = [v20 objectAtIndex:v56 - 1];
              if (UIViewIgnoresTouchEvents(v57)) {
                p_super = 0;
              }
              else {
                p_super = v57;
              }

              if (v56 < 2) {
                break;
              }
              --v56;
            }
            while (!p_super);
          }
          else
          {
            p_super = 0;
          }
          if (x >= _hitAreaLeftEdge(v29, v8, MinX) && x <= _hitAreaRightEdge(v8, p_super, MaxX)) {
            goto LABEL_82;
          }
        }
        else
        {
          p_super = &v8->super;
          double v8 = v29;
        }

        uint64_t v29 = v8;
        BOOL v37 = v33-- < 1;
        if (v37) {
          goto LABEL_77;
        }
      }
    }
    double v8 = v29;
LABEL_77:
    BOOL v7 = v63;
    navigationBar = v63;
    if (*(UINavigationBar **)((char *)&v64->super.super.isa + v60) == v63) {
      navigationBar = v64->super._navigationBar;
    }
    uint64_t v29 = v8;
    double v8 = navigationBar;
LABEL_84:
  }
  else
  {
    double v8 = v6;
  }

  return v8;
}

- (BOOL)_shim_wantsCustomTouchHandlingForTouches:(id)a3
{
  return _UITouchesContainsTouchFromCarTouchpad(a3) ^ 1;
}

- (id)_navigationItemAtPoint:(CGPoint)a3
{
  double x = a3.x;
  uint64_t v5 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  if (!v5)
  {
    id v24 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    goto LABEL_14;
  }
  [(UIView *)self->super._navigationBar _contentMargin];
  double v7 = v6;
  double v8 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  int64_t v9 = [(_UINavigationBarVisualProviderLegacyIOS *)self _backButtonForBackItem:v5 topItem:v8];
  double v10 = [v5 backButtonView];
  [(UIView *)self->super._navigationBar bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  int v19 = *((_DWORD *)&self->super._navigationBar->super._viewFlags + 4);
  double v20 = _UINavigationBarTouchExtremaForBackButtonView(v10, v7);
  if ((v19 & 0x80000) != 0)
  {
    v27.origin.double x = v12;
    v27.origin.CGFloat y = v14;
    v27.size.CGFloat width = v16;
    v27.size.CGFloat height = v18;
    double v20 = CGRectGetMaxX(v27) - v20;
  }
  if ((*(void *)&v19 & 0x80000) != 0) {
    BOOL v21 = x >= v20;
  }
  else {
    BOOL v21 = x <= v20;
  }
  if (v21)
  {
    [v9 frame];
    IsEmptCGFloat y = CGRectIsEmpty(v28);

    double v23 = v5;
    if (!IsEmpty) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  double v23 = v8;
LABEL_13:
  id v24 = v23;

LABEL_14:
  return v24;
}

- (id)backButtonViewAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(_UINavigationBarItemStack *)self->super._stack backItem];
  double v7 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  double v8 = [(_UINavigationBarVisualProviderLegacyIOS *)self _backButtonForBackItem:v6 topItem:v7];
  if (v8)
  {
    [(UIView *)self->super._navigationBar _contentMargin];
    double v10 = v9;
    double v11 = _UINavigationBarTouchExtremaForBackButtonView(v8, v9);
    double v13 = v12;
    [(UIView *)self->super._navigationBar bounds];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    int v22 = *((_DWORD *)&self->super._navigationBar->super._viewFlags + 4);
    double v23 = _UINavigationBarTouchExtremaForBackButtonView(v8, v10);
    if ((v22 & 0x80000) != 0)
    {
      v27.origin.double x = v15;
      v27.origin.double y = v17;
      v27.size.CGFloat width = v19;
      v27.size.CGFloat height = v21;
      double v23 = CGRectGetMaxX(v27) - v23;
    }
    BOOL v24 = x < v23;
    if ((*(void *)&v22 & 0x80000) == 0) {
      BOOL v24 = x > v23;
    }
    if (v24 || y > v13)
    {

      double v8 = 0;
    }
  }

  return v8;
}

- (void)_handleMouseDownAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(_UINavigationBarItemStack *)self->super._stack state]
    || [(UINavigationBar *)self->super._navigationBar _allowInteractionDuringTransition])
  {
    id v28 = [(_UINavigationBarItemStack *)self->super._stack backItem];
    if (v28)
    {
      -[_UINavigationBarVisualProviderLegacyIOS _navigationItemAtPoint:](self, "_navigationItemAtPoint:", x, y);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v7 = v6 != v28;
      if (v6 == v28)
      {
        double v8 = [v28 backButtonView];
        [v8 alpha];
        if (v9 > 0.5 && ([v8 isHidden] & 1) == 0)
        {
          [v8 setPressed:1 initialPress:1];
          [(_UINavigationBarVisualProviderLegacyIOS *)self _shim_pressBackIndicator:1 initialPress:1];
        }
      }
    }
    else
    {
      BOOL v7 = 1;
    }
    double v10 = [(_UINavigationBarItemStack *)self->super._stack topItem];
    double v11 = [v10 _buttonForBackButtonIndicator];
    double v12 = v11;
    if (v7)
    {
      if (v11)
      {
        [v11 alpha];
        if (v13 > 0.5 && ([v12 isHidden] & 1) == 0)
        {
          backIndicatorView = self->_backIndicatorView;
          [(UIView *)self->super._navigationBar _contentMargin];
          double v16 = v15;
          [(UIView *)self->super._navigationBar bounds];
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          CGFloat v22 = v21;
          CGFloat v24 = v23;
          int v25 = *((_DWORD *)&self->super._navigationBar->super._viewFlags + 4);
          double v26 = _UINavigationBarTouchExtremaForBackButtonView(backIndicatorView, v16);
          if ((v25 & 0x80000) != 0)
          {
            v30.origin.double x = v18;
            v30.origin.double y = v20;
            v30.size.CGFloat width = v22;
            v30.size.CGFloat height = v24;
            double v26 = CGRectGetMaxX(v30) - v26;
          }
          BOOL v27 = x >= v26;
          if ((*(void *)&v25 & 0x80000) == 0) {
            BOOL v27 = x <= v26;
          }
          if (v27) {
            [v12 setHighlighted:1];
          }
        }
      }
    }
  }
}

- (void)_handleMouseUpAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ((![(_UINavigationBarItemStack *)self->super._stack state]
     || [(UINavigationBar *)self->super._navigationBar _allowInteractionDuringTransition])&& (UIViewIgnoresTouchEvents(self->super._navigationBar) & 1) == 0)
  {
    id v6 = -[_UINavigationBarVisualProviderLegacyIOS _navigationItemAtPoint:](self, "_navigationItemAtPoint:", x, y);
    if (v6)
    {
      id v20 = v6;
      BOOL v7 = [v6 backButtonView];
      if ([v7 pressed])
      {
        [v7 setPressed:0 initialPress:0];
      }
      else
      {
        id v8 = [(_UINavigationBarItemStack *)self->super._stack backItem];
        if (v8 != v20)
        {
          double v9 = [v8 backButtonView];
          [v9 setPressed:0 initialPress:0];
        }
      }
      if (-[_UINavigationBarVisualProviderLegacyIOS _shouldPopForTouchAtPoint:](self, "_shouldPopForTouchAtPoint:", x, y))
      {
        -[_UINavigationBarVisualProviderLegacyIOS _popForTouchAtPoint:](self, "_popForTouchAtPoint:", x, y);
      }
      else
      {
        double v10 = [(_UINavigationBarItemStack *)self->super._stack topItem];
        double v11 = [v10 _buttonForBackButtonIndicator];

        if (v11 && ([v11 alpha], v12 > 0.5) && (objc_msgSend(v11, "isHidden") & 1) == 0)
        {
          backIndicatorView = self->_backIndicatorView;
          [(UIView *)self->super._navigationBar _contentMargin];
          double v15 = v14;
          [(UIView *)self->super._navigationBar bounds];
          if (_UIPointInsideNavigationBarTouchExtremaForBackButton(backIndicatorView, (*((_DWORD *)&self->super._navigationBar->super._viewFlags + 4) >> 19) & 1, v15, x, y, v16, v17, v18, v19))
          {
            [v11 setHighlighted:0];
            [v11 sendActionsForControlEvents:64];
          }
        }
        else
        {
          [(_UINavigationBarVisualProviderLegacyIOS *)self _shim_pressBackIndicator:0 initialPress:0];
        }
      }
      id v6 = v20;
    }
  }
}

- (BOOL)_shouldPopForTouchAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v6 = [(_UINavigationBarItemStack *)self->super._stack state];
  if (v6
    && ![(UINavigationBar *)self->super._navigationBar _allowInteractionDuringTransition])
  {
    return 0;
  }
  BOOL v7 = -[_UINavigationBarVisualProviderLegacyIOS _navigationItemAtPoint:](self, "_navigationItemAtPoint:", x, y);
  int v8 = [(_UINavigationBarItemStack *)self->super._stack state];
  stacuint64_t k = self->super._stack;
  if (v8 == 2)
  {
    double v10 = [(_UINavigationBarItemStack *)stack previousBackItem];
    [(_UINavigationBarItemStack *)self->super._stack previousTopItem];
  }
  else
  {
    double v10 = [(_UINavigationBarItemStack *)stack backItem];
    [(_UINavigationBarItemStack *)self->super._stack topItem];
  double v11 = };
  double v12 = [(_UINavigationBarVisualProviderLegacyIOS *)self _backButtonForBackItem:v10 topItem:v11];

  [v12 alpha];
  if (v13 <= 0.05 || ([v12 isHidden] & 1) != 0) {
    goto LABEL_12;
  }
  double v14 = [v12 superview];
  double v15 = v14;
  if (v6 != 2)
  {
    contentView = self->_contentView;

    if (v15 == contentView) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  CGFloat v16 = [(UIView *)v14 superview];
  CGFloat v17 = self->_contentView;

  if (v16 != v17)
  {
LABEL_12:

    double v12 = 0;
  }
LABEL_13:
  CGFloat v19 = [(_UINavigationBarItemStack *)self->super._stack topItem];
  int v20 = [v19 leftItemsSupplementBackButton];
  if ((v20 & 1) == 0)
  {
    double v21 = [v19 _customLeftViews];
    CGFloat v22 = [v21 firstObject];

    [v22 alpha];
    if (v23 > 0.05 && ([v22 isHidden] & 1) == 0)
    {
      CGFloat v24 = [v22 superview];
      int v25 = self->_contentView;

      if (v24 == v25) {
        goto LABEL_19;
      }
    }
  }
  CGFloat v22 = 0;
LABEL_19:
  double v26 = [(_UINavigationBarItemStack *)self->super._stack backItem];

  if (v22) {
    int v27 = v20;
  }
  else {
    int v27 = 1;
  }
  if (v12 && v7 == v26 && v27)
  {
    id v28 = -[_UINavigationBarVisualProviderLegacyIOS backButtonViewAtPoint:](self, "backButtonViewAtPoint:", x, y);

    if (v28) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (void)_popForTouchAtPoint:(CGPoint)a3
{
  navigationBar = self->super._navigationBar;
  -[_UINavigationBarVisualProviderLegacyIOS _navigationItemAtPoint:](self, "_navigationItemAtPoint:", a3.x, a3.y);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = [v5 backBarButtonItem];
  [(UINavigationBar *)navigationBar _sendNavigationPopForBackBarButtonItem:v4];
}

- (void)_shim_touchesBegan:(id)a3 withEvent:(id)a4
{
  id v7 = a4;
  id v5 = self->super._navigationBar;
  if ([v7 type])
  {

    int v6 = 0;
  }
  else
  {
    int v6 = [v7 _firstTouchForView:v5];

    if (v6)
    {
      [v6 locationInView:self->super._navigationBar];
      -[_UINavigationBarVisualProviderLegacyIOS _handleMouseDownAtPoint:](self, "_handleMouseDownAtPoint:");
    }
  }
}

- (void)_shim_touchesMoved:(id)a3 withEvent:(id)a4
{
  id v9 = a4;
  id v5 = self->super._navigationBar;
  if ([v9 type])
  {
    int v6 = 0;
LABEL_3:

    goto LABEL_4;
  }
  int v6 = [v9 _firstTouchForView:v5];

  if (v6
    && ![(_UINavigationBarItemStack *)self->super._stack state]
    && (UIViewIgnoresTouchEvents(self->super._navigationBar) & 1) == 0)
  {
    [v6 locationInView:self->super._navigationBar];
    -[_UINavigationBarVisualProviderLegacyIOS backButtonViewAtPoint:](self, "backButtonViewAtPoint:");
    id v7 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
    id v5 = v7;
    if (v7)
    {
      [(UINavigationBar *)v7 setPressed:1 initialPress:0];
    }
    else
    {
      [v6 previousLocationInView:self->super._navigationBar];
      int v8 = -[_UINavigationBarVisualProviderLegacyIOS backButtonViewAtPoint:](self, "backButtonViewAtPoint:");
      [v8 setPressed:0 initialPress:0];
    }
    [(_UINavigationBarVisualProviderLegacyIOS *)self _shim_pressBackIndicator:v5 != 0 initialPress:0];
    goto LABEL_3;
  }
LABEL_4:
}

- (void)_shim_touchesEnded:(id)a3 withEvent:(id)a4
{
  id v7 = a4;
  id v5 = self->super._navigationBar;
  if ([v7 type])
  {

    int v6 = 0;
  }
  else
  {
    int v6 = [v7 _firstTouchForView:v5];

    if (v6)
    {
      [v6 locationInView:self->super._navigationBar];
      -[_UINavigationBarVisualProviderLegacyIOS _handleMouseUpAtPoint:](self, "_handleMouseUpAtPoint:");
    }
  }
}

- (void)_shim_touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v11 = a4;
  id v5 = self->super._navigationBar;
  if ([v11 type])
  {
    int v6 = 0;
LABEL_3:

    goto LABEL_4;
  }
  int v6 = [v11 _firstTouchForView:v5];

  if (v6)
  {
    [v6 locationInView:self->super._navigationBar];
    -[_UINavigationBarVisualProviderLegacyIOS _navigationItemAtPoint:](self, "_navigationItemAtPoint:");
    id v7 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
    id v5 = v7;
    if (v7)
    {
      int v8 = [(UINavigationBar *)v7 backButtonView];
      id v9 = [(_UINavigationBarItemStack *)self->super._stack backItem];
      if (([v8 pressed] & 1) == 0 && v9 && v9 != v5)
      {
        uint64_t v10 = [(UINavigationBar *)v9 backButtonView];

        int v8 = (void *)v10;
      }
      [v8 setPressed:0 initialPress:0];
      [(_UINavigationBarVisualProviderLegacyIOS *)self _shim_pressBackIndicator:0 initialPress:0];
    }
    goto LABEL_3;
  }
LABEL_4:
}

- (void)_shim_popForCarplayPressAtFakePoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (-[_UINavigationBarVisualProviderLegacyIOS _shouldPopForTouchAtPoint:](self, "_shouldPopForTouchAtPoint:"))
  {
    -[_UINavigationBarVisualProviderLegacyIOS _popForTouchAtPoint:](self, "_popForTouchAtPoint:", x, y);
  }
}

- (BOOL)_shim_throwConstraintExceptions
{
  return [(UINavigationBar *)self->super._navigationBar isLocked];
}

- (void)_shim_updateBackgroundViewIgnoringFlag
{
  BOOL v3 = [(UIView *)self->super._navigationBar _canDrawContent];
  navigationBar = self->super._navigationBar;
  if (v3)
  {
    [(UIView *)navigationBar setNeedsDisplay];
  }
  else
  {
    [(UINavigationBar *)navigationBar setNeedsLayout];
    id v5 = self->super._navigationBar;
    [(UIView *)v5 layoutIfNeeded];
  }
}

- (void)_shim_30244716
{
}

- (BOOL)_shim_34415965
{
  return 1;
}

- (BOOL)_shim_107516167
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_userContentGuideTrailing, 0);
  objc_storeStrong((id *)&self->_userContentGuideLeading, 0);
  objc_storeStrong((id *)&self->_userContentGuide, 0);
  objc_storeStrong((id *)&self->_layoutView, 0);
  objc_destroyWeak((id *)&self->_transitionCoordinator);
  objc_storeStrong((id *)&self->_slideTransitionClippingViews, 0);
  objc_storeStrong((id *)&self->_gestureHandler, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_backIndicatorView, 0);
  objc_storeStrong((id *)&self->_rightViews, 0);
  objc_storeStrong((id *)&self->_leftViews, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_customBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundViewLayout, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end