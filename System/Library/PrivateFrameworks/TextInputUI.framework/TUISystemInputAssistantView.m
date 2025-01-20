@interface TUISystemInputAssistantView
- (BOOL)_areButtonBarItemsVisible;
- (BOOL)_shouldHostCenterViewOutsidePageView;
- (BOOL)_swiftPlaygroundsWorkaroundEnabled;
- (BOOL)backgroundVisible;
- (BOOL)centerViewHidden;
- (BOOL)hidesExpandableButton;
- (BOOL)isInputAssistantItemHidden;
- (BOOL)isTransitioning;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)scrollEnabled;
- (BOOL)shouldSkipValidation;
- (BOOL)showsActionButtonBarItems;
- (BOOL)showsButtonBarItemsInline;
- (BOOL)showsCenterView;
- (BOOL)showsExpandableButtonBarItems;
- (BOOL)validateIfNeeded;
- (CGRect)containerFrame;
- (NSArray)staticConstraints;
- (NSLayoutConstraint)containerCenter;
- (NSLayoutConstraint)containerLeading;
- (NSLayoutConstraint)containerTrailing;
- (NSLocale)locale;
- (NSString)actionButtonImageName;
- (TUIAssistantButtonBarView)leftButtonBar;
- (TUIAssistantButtonBarView)rightButtonBar;
- (TUIAssistantButtonBarView)unifiedButtonBar;
- (TUICandidateView)candidateView;
- (TUIPredictionView)predictionView;
- (TUISystemInputAssistantLayout)layout;
- (TUISystemInputAssistantLayoutStandard)defaultLayout;
- (TUISystemInputAssistantPageView)centerPageView;
- (TUISystemInputAssistantStyle)style;
- (TUISystemInputAssistantView)initWithFrame:(CGRect)a3;
- (TUISystemInputAssistantViewDelegate)delegate;
- (UIEdgeInsets)overrideSafeAreaInsets;
- (UIEdgeInsets)safeAreaInsets;
- (UIKBRenderConfig)renderConfig;
- (UIKBVisualEffectView)backdropView;
- (UITextInputAssistantItem)inputAssistantItem;
- (UITextInputAssistantItem)systemInputAssistantItem;
- (UIView)centerView;
- (UIView)containerView;
- (UIView)secondaryView;
- (_UIButtonBarAppearanceDelegate)appearanceDelegate;
- (double)centerViewWidth;
- (double)preferredInsets;
- (id)_createUnifiedButtonBarIfNecessary;
- (id)_currentLayoutViewSet;
- (id)_hostedCenterView;
- (id)actionButtonBlock;
- (void)_didTapExpandButton:(id)a3;
- (void)_exchangeCenterViewIfNecessaryForCompatibility;
- (void)_setButtonBarItemsExpanded:(BOOL)a3 animationType:(unint64_t)a4;
- (void)_updateBarButtonGroups;
- (void)_updateBarButtonGroupsIfNeeded;
- (void)_updateExpandableButtonBarItems;
- (void)_updateStyle;
- (void)_updateStyleForButtonBars;
- (void)_updateVisualProvider;
- (void)assistantButtonBarView:(id)a3 wantsToShowCollapsedItemGroup:(id)a4 fromButton:(id)a5;
- (void)assistantPageView:(id)a3 didSwitchToSecondaryViewVisible:(BOOL)a4;
- (void)layoutSubviews;
- (void)resetContainerConstraints;
- (void)setActionButtonBlock:(id)a3;
- (void)setActionButtonImageName:(id)a3;
- (void)setAppearanceDelegate:(id)a3;
- (void)setBackdropView:(id)a3;
- (void)setBackgroundVisible:(BOOL)a3;
- (void)setButtonBarItemsExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setCenterPageView:(id)a3;
- (void)setCenterView:(id)a3;
- (void)setCenterViewHidden:(BOOL)a3;
- (void)setCenterViewWidth:(double)a3;
- (void)setContainerCenter:(id)a3;
- (void)setContainerLeading:(id)a3;
- (void)setContainerTrailing:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDefaultLayout:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHidesExpandableButton:(BOOL)a3;
- (void)setInputAssistantItem:(id)a3;
- (void)setInputAssistantItem:(id)a3 force:(BOOL)a4;
- (void)setLayout:(id)a3;
- (void)setLeftButtonBar:(id)a3;
- (void)setLocale:(id)a3;
- (void)setNeedsValidation;
- (void)setOverrideSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setRenderConfig:(id)a3;
- (void)setRightButtonBar:(id)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setSecondaryView:(id)a3;
- (void)setShowsActionButtonBarItems:(BOOL)a3;
- (void)setShowsButtonBarItemsInline:(BOOL)a3;
- (void)setShowsExpandableButtonBarItems:(BOOL)a3;
- (void)setStaticConstraints:(id)a3;
- (void)setStyle:(id)a3;
- (void)setSystemInputAssistantItem:(id)a3;
- (void)setUnifiedButtonBar:(id)a3;
- (void)transitionToLayout:(id)a3 withStyle:(id)a4 start:(id)a5;
- (void)updateContainerConstraintsForFloating;
@end

@implementation TUISystemInputAssistantView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticConstraints, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_appearanceDelegate, 0);
  objc_storeStrong((id *)&self->_defaultLayout, 0);
  objc_storeStrong((id *)&self->_centerPageView, 0);
  objc_storeStrong((id *)&self->_unifiedButtonBar, 0);
  objc_storeStrong((id *)&self->_containerCenter, 0);
  objc_storeStrong((id *)&self->_containerTrailing, 0);
  objc_storeStrong((id *)&self->_containerLeading, 0);
  objc_storeStrong((id *)&self->_systemInputAssistantItem, 0);
  objc_storeStrong((id *)&self->_inputAssistantItem, 0);
  objc_storeStrong(&self->_actionButtonBlock, 0);
  objc_storeStrong((id *)&self->_actionButtonImageName, 0);
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_centerView, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rightButtonBar, 0);
  objc_storeStrong((id *)&self->_leftButtonBar, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->locale, 0);
}

- (void)setStaticConstraints:(id)a3
{
}

- (NSArray)staticConstraints
{
  return self->_staticConstraints;
}

- (void)setContainerView:(id)a3
{
}

- (void)setAppearanceDelegate:(id)a3
{
}

- (_UIButtonBarAppearanceDelegate)appearanceDelegate
{
  return self->_appearanceDelegate;
}

- (void)setDefaultLayout:(id)a3
{
}

- (TUISystemInputAssistantLayoutStandard)defaultLayout
{
  return self->_defaultLayout;
}

- (void)setCenterPageView:(id)a3
{
}

- (TUISystemInputAssistantPageView)centerPageView
{
  return self->_centerPageView;
}

- (void)setUnifiedButtonBar:(id)a3
{
}

- (TUIAssistantButtonBarView)unifiedButtonBar
{
  return self->_unifiedButtonBar;
}

- (void)setContainerCenter:(id)a3
{
}

- (NSLayoutConstraint)containerCenter
{
  return self->_containerCenter;
}

- (void)setContainerTrailing:(id)a3
{
}

- (NSLayoutConstraint)containerTrailing
{
  return self->_containerTrailing;
}

- (void)setContainerLeading:(id)a3
{
}

- (NSLayoutConstraint)containerLeading
{
  return self->_containerLeading;
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (UITextInputAssistantItem)systemInputAssistantItem
{
  return self->_systemInputAssistantItem;
}

- (UITextInputAssistantItem)inputAssistantItem
{
  return self->_inputAssistantItem;
}

- (BOOL)showsButtonBarItemsInline
{
  return self->_showsButtonBarItemsInline;
}

- (void)setActionButtonBlock:(id)a3
{
}

- (id)actionButtonBlock
{
  return self->_actionButtonBlock;
}

- (void)setActionButtonImageName:(id)a3
{
}

- (NSString)actionButtonImageName
{
  return self->_actionButtonImageName;
}

- (void)setShowsActionButtonBarItems:(BOOL)a3
{
  self->_showsActionButtonBarItems = a3;
}

- (BOOL)showsActionButtonBarItems
{
  return self->_showsActionButtonBarItems;
}

- (BOOL)hidesExpandableButton
{
  return self->_hidesExpandableButton;
}

- (BOOL)showsExpandableButtonBarItems
{
  return self->_showsExpandableButtonBarItems;
}

- (double)centerViewWidth
{
  return self->_centerViewWidth;
}

- (BOOL)scrollEnabled
{
  return self->_scrollEnabled;
}

- (BOOL)centerViewHidden
{
  return self->_centerViewHidden;
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (UIView)centerView
{
  return self->_centerView;
}

- (void)setOverrideSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_overrideSafeAreaInsets = a3;
}

- (UIEdgeInsets)overrideSafeAreaInsets
{
  double top = self->_overrideSafeAreaInsets.top;
  double left = self->_overrideSafeAreaInsets.left;
  double bottom = self->_overrideSafeAreaInsets.bottom;
  double right = self->_overrideSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)backgroundVisible
{
  return self->_backgroundVisible;
}

- (TUISystemInputAssistantStyle)style
{
  return self->_style;
}

- (TUISystemInputAssistantLayout)layout
{
  return self->_layout;
}

- (void)setDelegate:(id)a3
{
}

- (TUISystemInputAssistantViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TUISystemInputAssistantViewDelegate *)WeakRetained;
}

- (void)setRightButtonBar:(id)a3
{
}

- (TUIAssistantButtonBarView)rightButtonBar
{
  return self->_rightButtonBar;
}

- (void)setLeftButtonBar:(id)a3
{
}

- (TUIAssistantButtonBarView)leftButtonBar
{
  return self->_leftButtonBar;
}

- (void)setBackdropView:(id)a3
{
}

- (UIKBVisualEffectView)backdropView
{
  return self->_backdropView;
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (void)setLocale:(id)a3
{
}

- (NSLocale)locale
{
  return self->locale;
}

- (id)_hostedCenterView
{
  if ([(TUISystemInputAssistantView *)self _swiftPlaygroundsWorkaroundEnabled]
    && [(TUISystemInputAssistantView *)self _shouldHostCenterViewOutsidePageView])
  {
    v3 = [(TUISystemInputAssistantView *)self centerView];
  }
  else
  {
    v3 = [(TUISystemInputAssistantView *)self centerPageView];
  }
  return v3;
}

- (void)_exchangeCenterViewIfNecessaryForCompatibility
{
  if ([(TUISystemInputAssistantView *)self _swiftPlaygroundsWorkaroundEnabled])
  {
    if ([(TUISystemInputAssistantView *)self _shouldHostCenterViewOutsidePageView])
    {
      v3 = [(TUISystemInputAssistantView *)self centerView];
      v4 = [v3 superview];

      if (v4 == self) {
        return;
      }
      v5 = [(TUISystemInputAssistantView *)self centerPageView];
      [v5 removeFromSuperview];

      id v13 = [(TUISystemInputAssistantView *)self containerView];
      uint64_t v6 = [(TUISystemInputAssistantView *)self centerView];
    }
    else
    {
      v7 = [(TUISystemInputAssistantView *)self centerPageView];
      v8 = [v7 superview];

      if (v8 == self) {
        return;
      }
      v9 = [(TUISystemInputAssistantView *)self centerView];
      [v9 removeFromSuperview];

      v10 = [(TUISystemInputAssistantView *)self centerView];
      v11 = [(TUISystemInputAssistantView *)self centerPageView];
      [v11 setPrimaryView:v10];

      id v13 = [(TUISystemInputAssistantView *)self containerView];
      uint64_t v6 = [(TUISystemInputAssistantView *)self centerPageView];
    }
    v12 = (void *)v6;
    [v13 addSubview:v6];
  }
}

- (BOOL)_shouldHostCenterViewOutsidePageView
{
  v2 = [(TUISystemInputAssistantView *)self inputAssistantItem];
  v3 = [v2 _centerBarButtonGroups];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)_swiftPlaygroundsWorkaroundEnabled
{
  if (_swiftPlaygroundsWorkaroundEnabled_onceToken != -1) {
    dispatch_once(&_swiftPlaygroundsWorkaroundEnabled_onceToken, &__block_literal_global_149);
  }
  return _swiftPlaygroundsWorkaroundEnabled_workaroundEnabled;
}

void __65__TUISystemInputAssistantView__swiftPlaygroundsWorkaroundEnabled__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v2 = [v0 bundleIdentifier];

  if ([v2 isEqualToString:@"com.apple.Playgrounds"]) {
    char v1 = dyld_program_sdk_at_least() ^ 1;
  }
  else {
    char v1 = 0;
  }
  _swiftPlaygroundsWorkaroundEnabled_workaroundEnabled = v1;
}

- (void)assistantPageView:(id)a3 didSwitchToSecondaryViewVisible:(BOOL)a4
{
  BOOL v4 = a4;
  self->_buttonBarItemsExpanded = a4;
  uint64_t v6 = [(TUISystemInputAssistantView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(TUISystemInputAssistantView *)self delegate];
    [v8 systemInputAssistantView:self didExpand:v4];
  }
}

- (void)assistantButtonBarView:(id)a3 wantsToShowCollapsedItemGroup:(id)a4 fromButton:(id)a5
{
  id v17 = a4;
  id v7 = a5;
  id v8 = [v17 representativeItem];
  uint64_t v9 = [v8 target];
  if (v9)
  {
    v10 = (void *)v9;
    uint64_t v11 = [v8 action];

    if (v11)
    {
      v12 = [v8 target];
      objc_msgSend(v12, "performSelector:withObject:", objc_msgSend(v8, "action"), v8);
LABEL_7:

      goto LABEL_8;
    }
  }
  uint64_t v13 = [(TUISystemInputAssistantView *)self delegate];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(TUISystemInputAssistantView *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      v12 = [(TUISystemInputAssistantView *)self delegate];
      [v12 systemInputAssistantView:self wantsToShowCollapsedItemGroup:v17 fromView:v7];
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)TUISystemInputAssistantView;
  [(TUISystemInputAssistantView *)&v19 layoutSubviews];
  [(TUISystemInputAssistantView *)self validateIfNeeded];
  [(TUISystemInputAssistantView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(TUISystemInputAssistantView *)self backdropView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(TUISystemInputAssistantView *)self safeAreaInsets];
  if (v10 > v12)
  {
    [(TUISystemInputAssistantView *)self preferredInsets];
    UIRectInset();
    double v4 = v13;
    double v6 = v14;
    double v8 = v15;
    double v10 = v16;
  }
  id v17 = [(TUISystemInputAssistantView *)self _currentLayoutViewSet];
  v18 = [(TUISystemInputAssistantView *)self layout];
  objc_msgSend(v18, "layoutViewSet:inBounds:forAssistantView:", v17, self, v4, v6, v8, v10);
}

- (double)preferredInsets
{
  return 0.0;
}

- (BOOL)shouldSkipValidation
{
  [(TUISystemInputAssistantView *)self bounds];
  return CGRectIsEmpty(*(CGRect *)&v2);
}

- (BOOL)validateIfNeeded
{
  if (!self->_needsValidation || [(TUISystemInputAssistantView *)self shouldSkipValidation]) {
    return 1;
  }
  BOOL v4 = [(TUIAssistantButtonBarView *)self->_leftButtonBar validateButtonGroups];
  BOOL v5 = [(TUIAssistantButtonBarView *)self->_rightButtonBar validateButtonGroups];
  BOOL v6 = [(TUIAssistantButtonBarView *)self->_unifiedButtonBar validateButtonGroups];
  self->_needsValidation = 0;
  return v4 || v5 || v6;
}

- (void)setNeedsValidation
{
  self->_needsValidation = 1;
  atomic_fetch_add_explicit(&self->_needsValidationGuard, 1u, memory_order_relaxed);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__TUISystemInputAssistantView_setNeedsValidation__block_invoke;
  block[3] = &unk_1E55941A8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __49__TUISystemInputAssistantView_setNeedsValidation__block_invoke(uint64_t result)
{
  if (atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(result + 32) + 412), 0xFFFFFFFF, memory_order_relaxed) == 1)
  {
    uint64_t v1 = result;
    UIEdgeInsets result = [*(id *)(result + 32) validateIfNeeded];
    if (result)
    {
      uint64_t v2 = *(void **)(v1 + 32);
      return [v2 setNeedsLayout];
    }
  }
  return result;
}

- (void)transitionToLayout:(id)a3 withStyle:(id)a4 start:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  double v9 = (void (**)(void))a5;
  id v10 = [(TUISystemInputAssistantView *)self layout];

  if (v10 != v11) {
    self->_isTransitioning = 1;
  }
  if (v9) {
    v9[2](v9);
  }
  [(TUISystemInputAssistantView *)self setStyle:v8];
  [(TUISystemInputAssistantView *)self setLayout:v11];
  [(TUISystemInputAssistantView *)self _updateBarButtonGroups];
  self->_isTransitioning = 0;
}

- (void)setStyle:(id)a3
{
  BOOL v5 = (TUISystemInputAssistantStyle *)a3;
  p_style = &self->_style;
  if (self->_style != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_style, a3);
    p_style = (TUISystemInputAssistantStyle **)[(TUISystemInputAssistantView *)self _updateStyle];
    BOOL v5 = v7;
  }
  MEMORY[0x1F41817F8](p_style, v5);
}

- (void)setLayout:(id)a3
{
  BOOL v5 = (TUISystemInputAssistantLayout *)a3;
  layout = self->_layout;
  if (layout != v5)
  {
    double v9 = v5;
    double v7 = [(TUISystemInputAssistantView *)self _currentLayoutViewSet];
    [(TUISystemInputAssistantLayout *)layout invalidate:v7];

    objc_storeStrong((id *)&self->_layout, a3);
    if ([(TUISystemInputAssistantLayout *)v9 usesUnifiedButtonBar]) {
      id v8 = [(TUISystemInputAssistantView *)self _createUnifiedButtonBarIfNecessary];
    }
    [(TUISystemInputAssistantView *)self _updateBarButtonGroupsIfNeeded];
    [(TUISystemInputAssistantView *)self setNeedsLayout];
    BOOL v5 = v9;
  }
}

- (void)setRenderConfig:(id)a3
{
  id v5 = a3;
  renderConfig = self->_renderConfig;
  if (renderConfig)
  {
    int v7 = [(UIKBRenderConfig *)renderConfig lightKeyboard];
    int v8 = [v5 lightKeyboard];
    v11.receiver = self;
    v11.super_class = (Class)TUISystemInputAssistantView;
    [(TUISystemInputAssistantView *)&v11 _setRenderConfig:v5];
    if (v7 == v8) {
      goto LABEL_11;
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TUISystemInputAssistantView;
    [(TUISystemInputAssistantView *)&v11 _setRenderConfig:v5];
  }
  objc_storeStrong((id *)&self->_renderConfig, a3);
  if (objc_opt_respondsToSelector()) {
    [(UIView *)self->_centerView setRenderConfig:v5];
  }
  [(TUISystemInputAssistantView *)self _updateVisualProvider];
  if ([v5 lightKeyboard]) {
    uint64_t v9 = 3901;
  }
  else {
    uint64_t v9 = 2030;
  }
  id v10 = [(TUISystemInputAssistantView *)self backdropView];
  [v10 transitionToStyle:v9];

LABEL_11:
}

- (void)setSystemInputAssistantItem:(id)a3
{
  id v5 = (UITextInputAssistantItem *)a3;
  p_systemInputAssistantItem = &self->_systemInputAssistantItem;
  if (self->_systemInputAssistantItem != v5)
  {
    int v7 = v5;
    objc_storeStrong((id *)p_systemInputAssistantItem, a3);
    p_systemInputAssistantItem = (UITextInputAssistantItem **)[(TUISystemInputAssistantView *)self _updateBarButtonGroupsIfNeeded];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_systemInputAssistantItem, v5);
}

- (BOOL)isInputAssistantItemHidden
{
  [(TUISystemInputAssistantView *)self validateIfNeeded];
  double v3 = [(TUISystemInputAssistantView *)self inputAssistantItem];
  BOOL v4 = [v3 leadingBarButtonGroups];
  if (__57__TUISystemInputAssistantView_isInputAssistantItemHidden__block_invoke(v4))
  {
    id v5 = [(TUISystemInputAssistantView *)self inputAssistantItem];
    BOOL v6 = [v5 _centerBarButtonGroups];
    if (__57__TUISystemInputAssistantView_isInputAssistantItemHidden__block_invoke(v6))
    {
      int v7 = [(TUISystemInputAssistantView *)self inputAssistantItem];
      int v8 = [v7 trailingBarButtonGroups];
      char v9 = __57__TUISystemInputAssistantView_isInputAssistantItemHidden__block_invoke(v8);
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

uint64_t __57__TUISystemInputAssistantView_isInputAssistantItemHidden__block_invoke(void *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v3 = v1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(v3);
          }
          int v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (([v8 isHidden] & 1) == 0)
          {
            long long v19 = 0u;
            long long v20 = 0u;
            long long v17 = 0u;
            long long v18 = 0u;
            char v9 = objc_msgSend(v8, "barButtonItems", 0);
            uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v18;
              while (2)
              {
                for (uint64_t j = 0; j != v11; ++j)
                {
                  if (*(void *)v18 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  double v14 = *(void **)(*((void *)&v17 + 1) + 8 * j);
                  if (([v14 _hidden] & 1) == 0 && !objc_msgSend(v14, "isKeyboardItem"))
                  {

                    uint64_t v15 = 0;
                    goto LABEL_24;
                  }
                }
                uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
                if (v11) {
                  continue;
                }
                break;
              }
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
        uint64_t v15 = 1;
      }
      while (v5);
    }
    else
    {
      uint64_t v15 = 1;
    }
LABEL_24:
  }
  else
  {
    uint64_t v15 = 1;
  }

  return v15;
}

- (void)setInputAssistantItem:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  int v7 = (UITextInputAssistantItem *)a3;
  p_inputAssistantItem = &self->_inputAssistantItem;
  if (self->_inputAssistantItem != v7 || v4)
  {
    uint64_t v10 = v7;
    objc_storeStrong((id *)p_inputAssistantItem, a3);
    [(TUISystemInputAssistantView *)self _updateBarButtonGroups];
    p_inputAssistantItem = (UITextInputAssistantItem **)[(TUISystemInputAssistantView *)self _exchangeCenterViewIfNecessaryForCompatibility];
    int v7 = v10;
  }
  MEMORY[0x1F41817F8](p_inputAssistantItem, v7);
}

- (void)setInputAssistantItem:(id)a3
{
}

- (void)_setButtonBarItemsExpanded:(BOOL)a3 animationType:(unint64_t)a4
{
  if (self->_buttonBarItemsExpanded != a3)
  {
    BOOL v5 = a3;
    self->_buttonBarItemsExpanded = a3;
    int v7 = [(TUISystemInputAssistantView *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      char v9 = [(TUISystemInputAssistantView *)self delegate];
      [v9 systemInputAssistantView:self willExpand:v5];
    }
    uint64_t v10 = [(TUISystemInputAssistantView *)self centerPageView];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__TUISystemInputAssistantView__setButtonBarItemsExpanded_animationType___block_invoke;
    v11[3] = &unk_1E5593588;
    v11[4] = self;
    BOOL v12 = v5;
    [v10 setSecondaryViewVisible:v5 withAnimationType:a4 completion:v11];

    [(TUISystemInputAssistantView *)self _updateBarButtonGroups];
  }
}

void __72__TUISystemInputAssistantView__setButtonBarItemsExpanded_animationType___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) delegate];
      [v5 systemInputAssistantView:*(void *)(a1 + 32) didExpand:*(unsigned __int8 *)(a1 + 40)];
    }
  }
}

- (void)setButtonBarItemsExpanded:(BOOL)a3 animated:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  [(TUISystemInputAssistantView *)self _setButtonBarItemsExpanded:a3 animationType:v4];
}

- (void)_didTapExpandButton:(id)a3
{
}

- (void)setHidesExpandableButton:(BOOL)a3
{
  if (self->_hidesExpandableButton != a3)
  {
    self->_hidesExpandableButton = a3;
    [(TUISystemInputAssistantView *)self _updateExpandableButtonBarItems];
  }
}

- (void)setShowsExpandableButtonBarItems:(BOOL)a3
{
  if (self->_showsExpandableButtonBarItems != a3)
  {
    self->_showsExpandableButtonBarItems = a3;
    [(TUISystemInputAssistantView *)self _updateExpandableButtonBarItems];
    [(TUISystemInputAssistantView *)self _updateBarButtonGroups];
  }
}

- (void)_updateExpandableButtonBarItems
{
  if (self->_showsExpandableButtonBarItems)
  {
    id v3 = [(TUISystemInputAssistantView *)self _createUnifiedButtonBarIfNecessary];
    [(TUIAssistantButtonBarView *)self->_unifiedButtonBar setHidden:0];
    [(TUISystemInputAssistantPageView *)self->_centerPageView setHidesExpandButton:self->_hidesExpandableButton];
    uint64_t v4 = [(TUISystemInputAssistantPageView *)self->_centerPageView expandButton];
    [v4 addTarget:self action:sel__didTapExpandButton_ forControlEvents:64];

    [(TUISystemInputAssistantView *)self _updateVisualProvider];
    [(TUISystemInputAssistantView *)self _updateBarButtonGroups];
    BOOL v5 = [(TUISystemInputAssistantView *)self centerViewHidden];
  }
  else
  {
    [(TUIAssistantButtonBarView *)self->_unifiedButtonBar setHidden:1];
    [(TUISystemInputAssistantPageView *)self->_centerPageView setHidesExpandButton:1];
    BOOL v5 = 0;
  }
  [(TUISystemInputAssistantView *)self setButtonBarItemsExpanded:v5 animated:0];
}

- (id)_createUnifiedButtonBarIfNecessary
{
  if (!self->_unifiedButtonBar)
  {
    id v3 = [TUIAssistantButtonBarView alloc];
    uint64_t v4 = -[TUIAssistantButtonBarView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    unifiedButtonBar = self->_unifiedButtonBar;
    self->_unifiedButtonBar = v4;

    [(TUIAssistantButtonBarView *)self->_unifiedButtonBar setDelegate:self];
    [(TUIAssistantButtonBarView *)self->_unifiedButtonBar setButtonAlignment:1];
    uint64_t v6 = [(TUISystemInputAssistantView *)self renderConfig];
    int v7 = [v6 buttonBarVisualProvider];
    [(TUIAssistantButtonBarView *)self->_unifiedButtonBar setVisualProvider:v7];

    [(TUIAssistantButtonBarView *)self->_unifiedButtonBar setAccessibilityIdentifier:@"UnifiedButtonBar"];
    [(TUISystemInputAssistantView *)self setButtonBarItemsExpanded:0 animated:0];
    [(TUISystemInputAssistantView *)self _updateBarButtonGroups];
  }
  char v8 = [(TUISystemInputAssistantView *)self secondaryView];
  char v9 = v8;
  if (!v8) {
    char v9 = self->_unifiedButtonBar;
  }
  uint64_t v10 = [(TUISystemInputAssistantView *)self centerPageView];
  [v10 setSecondaryView:v9];

  uint64_t v11 = self->_unifiedButtonBar;
  return v11;
}

- (void)setShowsButtonBarItemsInline:(BOOL)a3
{
  if (self->_showsButtonBarItemsInline != a3)
  {
    self->_showsButtonBarItemsInline = a3;
    leftButtonBar = self->_leftButtonBar;
    if (a3)
    {
      if (!leftButtonBar)
      {
        BOOL v5 = [TUIAssistantButtonBarView alloc];
        uint64_t v6 = -[TUIAssistantButtonBarView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        int v7 = self->_leftButtonBar;
        self->_leftButtonBar = v6;

        [(TUIAssistantButtonBarView *)self->_leftButtonBar setDelegate:self];
        char v8 = [(TUISystemInputAssistantView *)self appearanceDelegate];
        [(TUIAssistantButtonBarView *)self->_leftButtonBar setAppearanceDelegate:v8];

        [(TUIAssistantButtonBarView *)self->_leftButtonBar setButtonAlignment:0];
        [(TUIAssistantButtonBarView *)self->_leftButtonBar setAccessibilityIdentifier:@"LeftButtonBar"];
        char v9 = [(TUISystemInputAssistantView *)self containerView];
        [v9 addSubview:self->_leftButtonBar];
      }
      if (!self->_rightButtonBar)
      {
        uint64_t v10 = [TUIAssistantButtonBarView alloc];
        uint64_t v11 = -[TUIAssistantButtonBarView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        rightButtonBar = self->_rightButtonBar;
        self->_rightButtonBar = v11;

        [(TUIAssistantButtonBarView *)self->_rightButtonBar setDelegate:self];
        double v13 = [(TUISystemInputAssistantView *)self appearanceDelegate];
        [(TUIAssistantButtonBarView *)self->_rightButtonBar setAppearanceDelegate:v13];

        [(TUIAssistantButtonBarView *)self->_rightButtonBar setButtonAlignment:2];
        [(TUIAssistantButtonBarView *)self->_rightButtonBar setAccessibilityIdentifier:@"RightButtonBar"];
        double v14 = [(TUISystemInputAssistantView *)self containerView];
        [v14 addSubview:self->_rightButtonBar];
      }
      [(TUIAssistantButtonBarView *)self->_leftButtonBar setHidden:0];
      [(TUIAssistantButtonBarView *)self->_rightButtonBar setHidden:0];
      [(TUISystemInputAssistantView *)self _updateVisualProvider];
      [(TUISystemInputAssistantView *)self _updateBarButtonGroups];
    }
    else
    {
      [(TUIAssistantButtonBarView *)leftButtonBar setHidden:1];
      uint64_t v15 = self->_rightButtonBar;
      [(TUIAssistantButtonBarView *)v15 setHidden:1];
    }
  }
}

- (BOOL)showsCenterView
{
  if (![(TUISystemInputAssistantView *)self centerViewHidden]) {
    return 1;
  }
  return [(TUISystemInputAssistantView *)self showsExpandableButtonBarItems];
}

- (void)setBackgroundVisible:(BOOL)a3
{
  self->_backgroundVisible = a3;
  BOOL v3 = !a3;
  id v4 = [(TUISystemInputAssistantView *)self backdropView];
  [v4 setHidden:v3];
}

- (void)setScrollEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_scrollEnabled = a3;
  id v4 = [(TUISystemInputAssistantView *)self centerPageView];
  [v4 setScrollEnabled:v3];
}

- (void)setCenterViewHidden:(BOOL)a3
{
  if (self->_centerViewHidden != a3)
  {
    BOOL v3 = a3;
    self->_centerViewHidden = a3;
    BOOL v5 = [(TUISystemInputAssistantView *)self centerView];
    [v5 setHidden:v3];

    uint64_t v6 = v3 ^ 1;
    int v7 = [(TUISystemInputAssistantView *)self leftButtonBar];
    [v7 setConstrainedHorizontally:v6];

    char v8 = [(TUISystemInputAssistantView *)self rightButtonBar];
    [v8 setConstrainedHorizontally:v6];

    [(TUISystemInputAssistantView *)self _updateExpandableButtonBarItems];
    [(TUISystemInputAssistantView *)self _updateBarButtonGroups];
    [(TUISystemInputAssistantView *)self setNeedsLayout];
  }
}

- (void)setCenterViewWidth:(double)a3
{
  if (self->_centerViewWidth != a3)
  {
    self->_centerViewWidth = a3;
    [(TUISystemInputAssistantView *)self setNeedsLayout];
  }
}

- (void)setSecondaryView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryView, a3);
  BOOL v5 = (TUIAssistantButtonBarView *)a3;
  unifiedButtonBar = v5;
  if (!v5) {
    unifiedButtonBar = self->_unifiedButtonBar;
  }
  id v7 = [(TUISystemInputAssistantView *)self centerPageView];
  [v7 setSecondaryView:unifiedButtonBar];
}

- (void)setCenterView:(id)a3
{
  objc_storeStrong((id *)&self->_centerView, a3);
  id v5 = a3;
  [v5 setHidden:self->_centerViewHidden];
  uint64_t v6 = [(TUISystemInputAssistantView *)self renderConfig];
  [v5 _setRenderConfig:v6];

  id v7 = [(TUISystemInputAssistantView *)self centerPageView];
  [v7 setPrimaryView:v5];

  [(TUISystemInputAssistantView *)self _exchangeCenterViewIfNecessaryForCompatibility];
  [(TUISystemInputAssistantView *)self _updateStyle];
}

- (void)_updateStyleForButtonBars
{
  BOOL v3 = [(TUISystemInputAssistantView *)self style];
  [v3 barButtonWidth];
  double v5 = v4;
  uint64_t v6 = [(TUISystemInputAssistantView *)self leftButtonBar];
  [v6 setBarButtonWidth:v5];

  id v7 = [(TUISystemInputAssistantView *)self style];
  [v7 minimumInterBarItemSpace];
  double v9 = v8;
  uint64_t v10 = [(TUISystemInputAssistantView *)self leftButtonBar];
  [v10 setMinimumInterItemSpace:v9];

  uint64_t v11 = [(TUISystemInputAssistantView *)self style];
  uint64_t v12 = [v11 clipsToBounds];
  double v13 = [(TUISystemInputAssistantView *)self leftButtonBar];
  [v13 setClipsToBounds:v12];

  double v14 = [(TUISystemInputAssistantView *)self style];
  [v14 barButtonWidth];
  double v16 = v15;
  long long v17 = [(TUISystemInputAssistantView *)self rightButtonBar];
  [v17 setBarButtonWidth:v16];

  long long v18 = [(TUISystemInputAssistantView *)self style];
  [v18 minimumInterBarItemSpace];
  double v20 = v19;
  long long v21 = [(TUISystemInputAssistantView *)self rightButtonBar];
  [v21 setMinimumInterItemSpace:v20];

  id v24 = [(TUISystemInputAssistantView *)self style];
  uint64_t v22 = [v24 clipsToBounds];
  long long v23 = [(TUISystemInputAssistantView *)self rightButtonBar];
  [v23 setClipsToBounds:v22];
}

- (void)_updateStyle
{
  BOOL v3 = [(TUISystemInputAssistantView *)self style];
  uint64_t v4 = [v3 drawsPredictionBackdropView];
  double v5 = [(TUISystemInputAssistantView *)self predictionView];
  [v5 setDrawsBackdropView:v4];

  uint64_t v6 = [(TUISystemInputAssistantView *)self style];
  id v7 = [v6 predictionSeparatorColor];
  double v8 = [(TUISystemInputAssistantView *)self predictionView];
  [v8 setSeparatorColor:v7];

  double v9 = [(TUISystemInputAssistantView *)self style];
  uint64_t v10 = [v9 predictionHighlightColor];
  uint64_t v11 = [(TUISystemInputAssistantView *)self predictionView];
  [v11 setHighlightColor:v10];

  uint64_t v12 = [(TUISystemInputAssistantView *)self style];
  [v12 highlightMargin];
  double v14 = v13;
  double v15 = [(TUISystemInputAssistantView *)self predictionView];
  [v15 setHighlightMargin:v14];

  double v16 = [(TUISystemInputAssistantView *)self style];
  uint64_t v17 = [v16 useContinuousCornerInHighlight];
  long long v18 = [(TUISystemInputAssistantView *)self predictionView];
  [v18 setUseContinuousCornerInHighlight:v17];

  double v19 = [(TUISystemInputAssistantView *)self style];
  [v19 highlightCornerRadius];
  double v21 = v20;
  uint64_t v22 = [(TUISystemInputAssistantView *)self predictionView];
  [v22 setHighlightCornerRadius:v21];

  long long v23 = [(TUISystemInputAssistantView *)self style];
  [v23 separatorMargin];
  double v25 = v24;
  v26 = [(TUISystemInputAssistantView *)self predictionView];
  [v26 setSeparatorMargin:v25];

  uint64_t v27 = [(TUISystemInputAssistantView *)self style];
  uint64_t v28 = [v27 shouldAnimatePredictionCandidate];
  v29 = [(TUISystemInputAssistantView *)self predictionView];
  [v29 setShouldAnimateCells:v28];

  [(TUISystemInputAssistantView *)self _updateStyleForButtonBars];
  [(TUISystemInputAssistantView *)self _updateBarButtonGroupsIfNeeded];
  [(TUISystemInputAssistantView *)self setNeedsLayout];
}

- (void)_updateBarButtonGroups
{
  BOOL v3 = [(TUISystemInputAssistantView *)self layout];
  [v3 setUsesUnifiedButtonBar:self->_showsExpandableButtonBarItems];

  uint64_t v4 = [(TUISystemInputAssistantView *)self layout];
  double v5 = [(TUISystemInputAssistantView *)self _currentLayoutViewSet];
  uint64_t v6 = [(TUISystemInputAssistantView *)self inputAssistantItem];
  id v7 = [(TUISystemInputAssistantView *)self systemInputAssistantItem];
  [v4 configureButtonBarsInViewSet:v5 forApplicationAssistantItem:v6 withSystemAssistantItem:v7 withAssistantView:self];

  [(TUISystemInputAssistantView *)self setNeedsValidation];
  [(TUISystemInputAssistantView *)self setNeedsLayout];
}

- (void)_updateBarButtonGroupsIfNeeded
{
  if (!self->_isTransitioning) {
    [(TUISystemInputAssistantView *)self _updateBarButtonGroups];
  }
}

- (void)resetContainerConstraints
{
  BOOL v3 = [(TUISystemInputAssistantView *)self staticConstraints];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28DC8];
    double v5 = [(TUISystemInputAssistantView *)self staticConstraints];
    [v4 deactivateConstraints:v5];
  }
  uint64_t v6 = [(TUISystemInputAssistantView *)self containerLeading];

  if (v6)
  {
    id v7 = [(TUISystemInputAssistantView *)self containerLeading];
    [v7 setActive:0];
  }
  double v8 = [(TUISystemInputAssistantView *)self containerTrailing];

  if (v8)
  {
    double v9 = [(TUISystemInputAssistantView *)self containerTrailing];
    [v9 setActive:0];
  }
  uint64_t v10 = [(TUISystemInputAssistantView *)self containerCenter];

  if (v10)
  {
    uint64_t v11 = [(TUISystemInputAssistantView *)self containerCenter];
    [v11 setActive:0];
  }
  id v12 = [(TUISystemInputAssistantView *)self containerView];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:1];
}

- (void)updateContainerConstraintsForFloating
{
  v50[5] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(TUISystemInputAssistantView *)self containerView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v4 = [(TUISystemInputAssistantView *)self containerLeading];

  if (!v4)
  {
    double v5 = [(TUISystemInputAssistantView *)self containerView];
    uint64_t v6 = [v5 leadingAnchor];
    id v7 = [(TUISystemInputAssistantView *)self leadingAnchor];
    double v8 = [v6 constraintEqualToAnchor:v7 constant:16.0];
    [(TUISystemInputAssistantView *)self setContainerLeading:v8];
  }
  double v9 = [(TUISystemInputAssistantView *)self containerTrailing];

  if (!v9)
  {
    uint64_t v10 = [(TUISystemInputAssistantView *)self trailingAnchor];
    uint64_t v11 = [(TUISystemInputAssistantView *)self containerView];
    id v12 = [v11 trailingAnchor];
    double v13 = [v10 constraintEqualToAnchor:v12 constant:16.0];
    [(TUISystemInputAssistantView *)self setContainerTrailing:v13];
  }
  double v14 = [(TUISystemInputAssistantView *)self containerCenter];

  if (!v14)
  {
    double v15 = [(TUISystemInputAssistantView *)self containerView];
    double v16 = [v15 centerXAnchor];
    uint64_t v17 = [(TUISystemInputAssistantView *)self centerXAnchor];
    long long v18 = [v16 constraintEqualToAnchor:v17];
    [(TUISystemInputAssistantView *)self setContainerCenter:v18];
  }
  double v19 = [(TUISystemInputAssistantView *)self staticConstraints];

  if (!v19)
  {
    v49 = [(TUISystemInputAssistantView *)self containerView];
    v47 = [v49 leftAnchor];
    v48 = [(TUISystemInputAssistantView *)self leftButtonBar];
    v46 = [v48 leftAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v50[0] = v45;
    v44 = [(TUISystemInputAssistantView *)self containerView];
    v42 = [v44 rightAnchor];
    v43 = [(TUISystemInputAssistantView *)self rightButtonBar];
    v41 = [v43 rightAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v50[1] = v40;
    v39 = [(TUISystemInputAssistantView *)self containerView];
    v37 = [v39 topAnchor];
    v38 = [(TUISystemInputAssistantView *)self rightButtonBar];
    v36 = [v38 topAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v50[2] = v35;
    v34 = [(TUISystemInputAssistantView *)self containerView];
    double v20 = [v34 bottomAnchor];
    double v21 = [(TUISystemInputAssistantView *)self rightButtonBar];
    uint64_t v22 = [v21 bottomAnchor];
    long long v23 = [v20 constraintEqualToAnchor:v22];
    v50[3] = v23;
    double v24 = [(TUISystemInputAssistantView *)self containerView];
    double v25 = [v24 topAnchor];
    v26 = [(TUISystemInputAssistantView *)self topAnchor];
    uint64_t v27 = [v25 constraintEqualToAnchor:v26];
    v50[4] = v27;
    uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:5];
    [(TUISystemInputAssistantView *)self setStaticConstraints:v28];
  }
  v29 = [(TUISystemInputAssistantView *)self staticConstraints];
  v30 = [v29 objectAtIndexedSubscript:0];
  char v31 = [v30 isActive];

  if ((v31 & 1) == 0)
  {
    v32 = (void *)MEMORY[0x1E4F28DC8];
    v33 = [(TUISystemInputAssistantView *)self staticConstraints];
    [v32 activateConstraints:v33];
  }
}

- (UIView)containerView
{
  containerView = self->_containerView;
  if (!containerView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(TUISystemInputAssistantView *)self bounds];
    double v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    uint64_t v6 = self->_containerView;
    self->_containerView = v5;

    [(TUISystemInputAssistantView *)self addSubview:self->_containerView];
    containerView = self->_containerView;
  }
  return containerView;
}

- (id)_currentLayoutViewSet
{
  BOOL v3 = objc_alloc_init(TUISystemInputAssistantLayoutViewSet);
  id v4 = [(TUISystemInputAssistantView *)self _hostedCenterView];
  [(TUISystemInputAssistantLayoutViewSet *)v3 setCenterView:v4];

  double v5 = [(TUISystemInputAssistantView *)self leftButtonBar];
  [(TUISystemInputAssistantLayoutViewSet *)v3 setLeftButtonBar:v5];

  uint64_t v6 = [(TUISystemInputAssistantView *)self rightButtonBar];
  [(TUISystemInputAssistantLayoutViewSet *)v3 setRightButtonBar:v6];

  id v7 = [(TUISystemInputAssistantView *)self unifiedButtonBar];
  [(TUISystemInputAssistantLayoutViewSet *)v3 setUnifiedButtonBar:v7];

  double v8 = [(TUISystemInputAssistantView *)self containerView];
  [(TUISystemInputAssistantLayoutViewSet *)v3 setViewSetContainer:v8];

  return v3;
}

- (void)_updateVisualProvider
{
  BOOL v3 = [(TUISystemInputAssistantView *)self renderConfig];
  if ([v3 lightKeyboard]) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  id v4 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  [(TUISystemInputAssistantView *)self setTintColor:v4];

  double v5 = [(TUISystemInputAssistantView *)self renderConfig];
  id v9 = [v5 buttonBarVisualProvider];

  if (v9)
  {
    uint64_t v6 = [(TUISystemInputAssistantView *)self leftButtonBar];
    [v6 setVisualProvider:v9];

    id v7 = [(TUISystemInputAssistantView *)self rightButtonBar];
    [v7 setVisualProvider:v9];

    double v8 = [(TUISystemInputAssistantView *)self unifiedButtonBar];
    [v8 setVisualProvider:v9];

    [(TUISystemInputAssistantView *)self layoutIfNeeded];
  }
}

- (BOOL)_areButtonBarItemsVisible
{
  return self->_showsButtonBarItemsInline || self->_buttonBarItemsExpanded;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  id v9 = [(TUISystemInputAssistantView *)self centerPageView];
  char v10 = [v9 isHidden];
  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [(TUISystemInputAssistantView *)self centerPageView];
    id v12 = [(TUISystemInputAssistantView *)self centerPageView];
    -[TUISystemInputAssistantView convertPoint:toView:](self, "convertPoint:toView:", v12, x, y);
    if (objc_msgSend(v11, "pointInside:withEvent:", v8))
    {
      char v13 = 1;
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v22 = v12;
    long long v23 = v11;
  }
  double v14 = [(TUISystemInputAssistantView *)self leftButtonBar];
  char v15 = [v14 isHidden];
  if ((v15 & 1) == 0)
  {
    double v16 = [(TUISystemInputAssistantView *)self leftButtonBar];
    id v4 = [(TUISystemInputAssistantView *)self leftButtonBar];
    -[TUISystemInputAssistantView convertPoint:toView:](self, "convertPoint:toView:", v4, x, y);
    if (objc_msgSend(v16, "pointInside:withEvent:", v8))
    {
      char v13 = 1;
LABEL_13:

      goto LABEL_14;
    }
    double v21 = v16;
  }
  uint64_t v17 = [(TUISystemInputAssistantView *)self rightButtonBar];
  if ([v17 isHidden])
  {

    char v13 = 0;
  }
  else
  {
    long long v18 = [(TUISystemInputAssistantView *)self rightButtonBar];
    double v19 = [(TUISystemInputAssistantView *)self rightButtonBar];
    -[TUISystemInputAssistantView convertPoint:toView:](self, "convertPoint:toView:", v19, x, y);
    char v13 = objc_msgSend(v18, "pointInside:withEvent:", v8);
  }
  double v16 = v21;
  if ((v15 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_14:

  id v12 = v22;
  uint64_t v11 = v23;
  if ((v10 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_16:

  return v13;
}

- (TUISystemInputAssistantView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)TUISystemInputAssistantView;
  BOOL v3 = -[TUISystemInputAssistantView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB18C8]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    id v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    [(TUISystemInputAssistantView *)v3 setBackdropView:v9];

    char v10 = [(TUISystemInputAssistantView *)v3 containerView];
    uint64_t v11 = [(TUISystemInputAssistantView *)v3 backdropView];
    [v10 addSubview:v11];

    id v12 = objc_alloc_init(TUISystemInputAssistantLayoutStandard);
    [(TUISystemInputAssistantView *)v3 setLayout:v12];

    char v13 = objc_alloc_init(TUISystemInputAssistantStyleStandard);
    [(TUISystemInputAssistantView *)v3 setStyle:v13];

    double v14 = -[TUISystemInputAssistantPageView initWithFrame:]([TUISystemInputAssistantPageView alloc], "initWithFrame:", v5, v6, v7, v8);
    [(TUISystemInputAssistantView *)v3 setCenterPageView:v14];

    char v15 = [(TUISystemInputAssistantView *)v3 centerPageView];
    [v15 setPageViewDelegate:v3];

    double v16 = [(TUISystemInputAssistantView *)v3 centerPageView];
    [v16 setAccessibilityIdentifier:@"CenterPageView"];

    uint64_t v17 = [(TUISystemInputAssistantView *)v3 containerView];
    long long v18 = [(TUISystemInputAssistantView *)v3 centerPageView];
    [v17 addSubview:v18];

    [(TUISystemInputAssistantView *)v3 setScrollEnabled:1];
    double v19 = [[TUIButtonBarAppearanceDelegate alloc] initWithSystemInputAssistantView:v3];
    [(TUISystemInputAssistantView *)v3 setAppearanceDelegate:v19];
  }
  return v3;
}

- (UIEdgeInsets)safeAreaInsets
{
  float64x2_t v2 = *(float64x2_t *)&self->_overrideSafeAreaInsets.top;
  float64x2_t v3 = *(float64x2_t *)&self->_overrideSafeAreaInsets.bottom;
  if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v2, *MEMORY[0x1E4FB2848]), (int32x4_t)vceqq_f64(v3, *(float64x2_t *)(MEMORY[0x1E4FB2848] + 16)))), 0xFuLL))))
  {
    v6.receiver = self;
    v6.super_class = (Class)TUISystemInputAssistantView;
    [(TUISystemInputAssistantView *)&v6 safeAreaInsets];
  }
  else
  {
    double left = self->_overrideSafeAreaInsets.left;
    double right = self->_overrideSafeAreaInsets.right;
  }
  result.double bottom = v3.f64[0];
  result.double top = v2.f64[0];
  result.double right = right;
  result.double left = left;
  return result;
}

- (CGRect)containerFrame
{
  float64x2_t v3 = [(TUISystemInputAssistantView *)self leftButtonBar];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  id v12 = [(TUISystemInputAssistantView *)self rightButtonBar];
  [v12 frame];
  v40.origin.double x = v13;
  v40.origin.double y = v14;
  v40.size.double width = v15;
  v40.size.double height = v16;
  v35.origin.double x = v5;
  v35.origin.double y = v7;
  v35.size.double width = v9;
  v35.size.double height = v11;
  CGRect v36 = CGRectUnion(v35, v40);
  double x = v36.origin.x;
  double y = v36.origin.y;
  double width = v36.size.width;
  double height = v36.size.height;

  if (![(TUISystemInputAssistantView *)self centerViewHidden])
  {
    objc_super v21 = [(TUISystemInputAssistantView *)self centerPageView];
    [v21 frame];
    v41.origin.double x = v22;
    v41.origin.double y = v23;
    v41.size.double width = v24;
    v41.size.double height = v25;
    v37.origin.double x = x;
    v37.origin.double y = y;
    v37.size.double width = width;
    v37.size.double height = height;
    CGRect v38 = CGRectUnion(v37, v41);
    double x = v38.origin.x;
    double y = v38.origin.y;
    double width = v38.size.width;
    double height = v38.size.height;
  }
  containerView = self->_containerView;
  if (containerView)
  {
    -[UIView convertRect:toView:](containerView, "convertRect:toView:", self, x, y, width, height);
    double x = v27;
    double y = v28;
    double width = v29;
    double height = v30;
  }
  double v31 = x;
  double v32 = y;
  double v33 = width;
  double v34 = height;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (TUICandidateView)candidateView
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  float64x2_t v3 = [(TUISystemInputAssistantView *)self centerView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(TUISystemInputAssistantView *)self centerView];
  }
  else
  {
    if (_os_feature_enabled_impl())
    {
      double v6 = [(TUISystemInputAssistantView *)self centerView];
      objc_opt_class();
      char v7 = objc_opt_isKindOfClass();

      if (v7)
      {
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        double v8 = [(TUISystemInputAssistantView *)self centerView];
        CGFloat v9 = [v8 arrangedSubviews];

        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v17;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              CGFloat v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v5 = v14;

                goto LABEL_15;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
      }
    }
    id v5 = 0;
  }
LABEL_15:
  return (TUICandidateView *)v5;
}

- (TUIPredictionView)predictionView
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  float64x2_t v3 = [(TUISystemInputAssistantView *)self centerView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(TUISystemInputAssistantView *)self centerView];
  }
  else
  {
    if (_os_feature_enabled_impl())
    {
      double v6 = [(TUISystemInputAssistantView *)self centerView];
      objc_opt_class();
      char v7 = objc_opt_isKindOfClass();

      if (v7)
      {
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        double v8 = [(TUISystemInputAssistantView *)self centerView];
        CGFloat v9 = [v8 arrangedSubviews];

        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v17;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              CGFloat v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v5 = v14;

                goto LABEL_15;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
      }
    }
    id v5 = 0;
  }
LABEL_15:
  return (TUIPredictionView *)v5;
}

@end