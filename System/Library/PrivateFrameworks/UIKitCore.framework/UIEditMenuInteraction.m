@interface UIEditMenuInteraction
+ (BOOL)_isOutOfProcessEditMenusEnabled;
+ (NSCopying)visualStyleRegistryIdentity;
+ (void)_registerPlatformMetrics;
- ($9638EFF0CCCAFE90921E224CC361F7AC)_anchorForPreferredArrowDirection:(SEL)a3;
- (BOOL)_dismissedByActionSelection;
- (BOOL)_dismissedRecently;
- (BOOL)_enforcesMenuControllerLifecycle;
- (BOOL)_includeMenuControllerItems;
- (BOOL)_useSenderAsResponderSender;
- (BOOL)isDisplayingMenu;
- (BOOL)presentsContextMenuAsSecondaryAction;
- (CGPoint)locationInView:(UIView *)view;
- (CGRect)_editMenuPresentation:(id)a3 targetRectForConfiguration:(id)a4;
- (CGRect)_targetRectForConfiguration:(id)a3;
- (CGRect)menuFrameInCoordinateSpace:(id)a3;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIEditMenuConfiguration)activeConfiguration;
- (UIEditMenuConfiguration)pendingConfiguration;
- (UIEditMenuInteraction)initWithDelegate:(id)delegate;
- (UIMenuLeaf)_selectedMenuLeaf;
- (UIView)view;
- (_UIEditMenuPresentation)_outgoingPresentation;
- (_UIEditMenuPresentation)activeEditMenuPresentation;
- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)_defaultSuggestedActionsAtLocation:(CGPoint)a3 configuration:(id)a4;
- (id)_editMenuPresentation:(id)a3 preferredLayoutRectsForConfiguration:(id)a4;
- (id)_editMenuPresentation:(id)a3 titleViewForMenu:(id)a4 configuration:(id)a5;
- (id)_menuForSuggestedActions:(id)a3 configuration:(id)a4;
- (id)_menuPreparationContextForConfiguration:(id)a3;
- (id)_proxySender;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)delegate;
- (id)firstResponderTargetForConfiguration:(id)a3;
- (void)_contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4 completion:(id)a5;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_dismissMenuWithPresentationType:(int64_t)a3;
- (void)_editMenuPresentation:(id)a3 didSelectMenuLeaf:(id)a4 completion:(id)a5;
- (void)_editMenuPresentation:(id)a3 didTransitionMenuForConfiguration:(id)a4;
- (void)_editMenuPresentation:(id)a3 preparedMenuForDisplay:(id)a4 completion:(id)a5;
- (void)_editMenuPresentation:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)_editMenuPresentation:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)_prepareMenuAtLocation:(CGPoint)a3 configuration:(id)a4 completionHandler:(id)a5;
- (void)_setEnforcesMenuControllerLifecycle:(BOOL)a3;
- (void)_setProxySender:(id)a3;
- (void)_setUseSenderAsResponderSender:(BOOL)a3;
- (void)_updateContextMenuInteractionDrivers;
- (void)_updateVisibleMenuWithReason:(int64_t)a3 updateBlock:(id)a4;
- (void)_viewTraitCollectionDidChange:(id)a3;
- (void)_willDismissMenuForConfiguration:(id)a3 animator:(id)a4;
- (void)_willPresentMenuForConfiguration:(id)a3 animator:(id)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)deferredMenuElementWasFulfilled:(id)a3;
- (void)didMoveToView:(id)a3;
- (void)dismissMenu;
- (void)presentEditMenuWithConfiguration:(UIEditMenuConfiguration *)configuration;
- (void)reloadVisibleMenu;
- (void)setActiveConfiguration:(id)a3;
- (void)setDisplayingMenu:(BOOL)a3;
- (void)setPendingConfiguration:(id)a3;
- (void)setPresentsContextMenuAsSecondaryAction:(BOOL)a3;
- (void)set_includeMenuControllerItems:(BOOL)a3;
- (void)set_selectedMenuLeaf:(id)a3;
- (void)updateVisibleMenuPositionAnimated:(BOOL)animated;
- (void)willMoveToView:(id)a3;
@end

@implementation UIEditMenuInteraction

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  if (!a4)
  {
    v7[7] = v4;
    v7[8] = v5;
    if ([(UIEditMenuInteraction *)self isDisplayingMenu])
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __53__UIEditMenuInteraction__didMoveFromWindow_toWindow___block_invoke;
      v7[3] = &unk_1E52D9F70;
      v7[4] = self;
      +[UIView performWithoutAnimation:v7];
    }
  }
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)didMoveToView:(id)a3
{
  id v5 = a3;
  objc_storeWeak((id *)&self->_view, v5);
  uint64_t v4 = v5;
  if (v5)
  {
    [v5 addInteraction:self->_contextMenuInteraction];
    uint64_t v4 = v5;
  }
}

- (void)_viewTraitCollectionDidChange:(id)a3
{
  id v5 = a3;
  if ([(UIEditMenuInteraction *)self isDisplayingMenu])
  {
    uint64_t v4 = [(UIEditMenuInteraction *)self activeEditMenuPresentation];
    [v4 sourceViewDidUpdateFromTraitCollection:v5];
  }
}

- (void)willMoveToView:(id)a3
{
  id v4 = a3;
  id v5 = [(UIContextMenuInteraction *)self->_contextMenuInteraction view];
  [v5 removeInteraction:self->_contextMenuInteraction];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (WeakRetained == v4)
  {
  }
  else
  {
    v7 = WeakRetained;
    BOOL v8 = [(UIEditMenuInteraction *)self isDisplayingMenu];

    if (v8)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __40__UIEditMenuInteraction_willMoveToView___block_invoke;
      v9[3] = &unk_1E52D9F70;
      v9[4] = self;
      +[UIView performWithoutAnimation:v9];
    }
  }
  objc_storeWeak((id *)&self->_view, 0);
}

- (BOOL)isDisplayingMenu
{
  v3 = [(UIEditMenuInteraction *)self activeEditMenuPresentation];
  id v4 = [v3 displayedMenu];
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [(UIContextMenuInteraction *)self->_contextMenuInteraction _hasVisibleMenu];
  }

  return v5;
}

- (_UIEditMenuPresentation)activeEditMenuPresentation
{
  return self->_activeEditMenuPresentation;
}

- (void)set_includeMenuControllerItems:(BOOL)a3
{
  self->__includeMenuControllerItems = a3;
}

- (void)_setProxySender:(id)a3
{
  objc_storeWeak(&self->__proxySender, a3);
  contextMenuInteraction = self->_contextMenuInteraction;
  id v5 = [(UIEditMenuInteraction *)self _proxySender];
  [(UIContextMenuInteraction *)contextMenuInteraction setProxySender:v5];
}

- (UIEditMenuInteraction)initWithDelegate:(id)delegate
{
  id v4 = delegate;
  v21.receiver = self;
  v21.super_class = (Class)UIEditMenuInteraction;
  id v5 = [(UIEditMenuInteraction *)&v21 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_presentsContextMenuAsSecondaryAction = 1;
    v7 = [(UIContextMenuInteraction *)[_UIEditMenuBridgedContextMenuInteraction alloc] initWithDelegate:v6];
    BOOL v8 = [(UIEditMenuInteraction *)v6 _proxySender];
    [(_UIEditMenuBridgedContextMenuInteraction *)v7 setProxySender:v8];

    contextMenuInteraction = v6->_contextMenuInteraction;
    v6->_contextMenuInteraction = &v7->super;
    v10 = v7;

    [(UIEditMenuInteraction *)v6 _updateContextMenuInteractionDrivers];
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 2;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFFD | v11;
    if (objc_opt_respondsToSelector()) {
      __int16 v12 = 4;
    }
    else {
      __int16 v12 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFFB | v12;
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = 8;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFF7 | v13;
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = 16;
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFEF | v14;
    if (objc_opt_respondsToSelector()) {
      __int16 v15 = 32;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFDF | v15;
    if (objc_opt_respondsToSelector()) {
      __int16 v16 = 64;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFBF | v16;
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = 128;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFF7F | v17;
    if (objc_opt_respondsToSelector()) {
      __int16 v18 = 256;
    }
    else {
      __int16 v18 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFEFF | v18;
    if (objc_opt_respondsToSelector()) {
      __int16 v19 = 512;
    }
    else {
      __int16 v19 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFDFF | v19;
    +[UIEditMenuInteraction _registerPlatformMetrics]();
  }
  return v6;
}

- (void)_updateContextMenuInteractionDrivers
{
  id v4 = [MEMORY[0x1E4F1CA48] array];
  if ([(UIEditMenuInteraction *)self presentsContextMenuAsSecondaryAction])
  {
    v3 = objc_opt_new();
    [v4 addObject:v3];
  }
  [(UIContextMenuInteraction *)self->_contextMenuInteraction setDrivers:v4];
}

- (BOOL)presentsContextMenuAsSecondaryAction
{
  return self->_presentsContextMenuAsSecondaryAction;
}

- (id)_proxySender
{
  id WeakRetained = objc_loadWeakRetained(&self->__proxySender);
  id v4 = WeakRetained;
  if (!WeakRetained) {
    id WeakRetained = self;
  }
  id v5 = WeakRetained;

  return v5;
}

+ (void)_registerPlatformMetrics
{
  self;
  if (_registerPlatformMetrics___defaultRegistrationToken != -1)
  {
    dispatch_once(&_registerPlatformMetrics___defaultRegistrationToken, &__block_literal_global_154);
  }
}

- (void)setPresentsContextMenuAsSecondaryAction:(BOOL)a3
{
  if (self->_presentsContextMenuAsSecondaryAction != a3)
  {
    self->_presentsContextMenuAsSecondaryAction = a3;
    [(UIEditMenuInteraction *)self _updateContextMenuInteractionDrivers];
  }
}

- (void)updateVisibleMenuPositionAnimated:(BOOL)animated
{
  BOOL v3 = animated;
  id v5 = [(UIEditMenuInteraction *)self activeEditMenuPresentation];
  id v7 = [v5 displayedMenu];

  if (v7)
  {
    v6 = [(UIEditMenuInteraction *)self activeEditMenuPresentation];
    [v6 updateMenuPositionAnimated:v3];
  }
}

void __49__UIEditMenuInteraction__registerPlatformMetrics__block_invoke()
{
  v0 = +[_UIVisualStyleRegistry defaultRegistry];
  uint64_t v1 = objc_opt_class();
  [v0 registerVisualStyleClass:v1 forStylableClass:objc_opt_class()];

  v2 = +[_UIVisualStyleRegistry registryForIdiom:0];
  uint64_t v3 = objc_opt_class();
  [v2 registerVisualStyleClass:v3 forStylableClass:objc_opt_class()];

  id v5 = +[_UIVisualStyleRegistry registryForIdiom:1];
  uint64_t v4 = objc_opt_class();
  [v5 registerVisualStyleClass:v4 forStylableClass:objc_opt_class()];
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)@"UIEditMenuInteraction";
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__selectedMenuLeaf);
  objc_storeStrong((id *)&self->__outgoingPresentation, 0);
  objc_storeStrong((id *)&self->_activeEditMenuPresentation, 0);
  objc_storeStrong((id *)&self->_activeConfiguration, 0);
  objc_storeStrong((id *)&self->_pendingConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak(&self->__proxySender);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_destroyWeak((id *)&self->_view);
}

+ (BOOL)_isOutOfProcessEditMenusEnabled
{
  if (qword_1EB264FD8 != -1) {
    dispatch_once(&qword_1EB264FD8, &__block_literal_global_652);
  }
  return _MergedGlobals_1322;
}

uint64_t __56__UIEditMenuInteraction__isOutOfProcessEditMenusEnabled__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  _MergedGlobals_1322 = result;
  return result;
}

uint64_t __40__UIEditMenuInteraction_willMoveToView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissMenu];
}

uint64_t __53__UIEditMenuInteraction__didMoveFromWindow_toWindow___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissMenu];
}

- (void)presentEditMenuWithConfiguration:(UIEditMenuConfiguration *)configuration
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = configuration;
  v6 = [(UIEditMenuInteraction *)self view];

  if (!v6)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __int16 v12 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        goto LABEL_7;
      }
      __int16 v13 = [(UIEditMenuInteraction *)self activeConfiguration];
      __int16 v14 = [(UIEditMenuInteraction *)self view];
      *(_DWORD *)buf = 138412546;
      __int16 v18 = v13;
      __int16 v19 = 2112;
      v20 = v14;
      _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "The edit menu (configuration: %@) can only be presented when the view is in a window scene: %@", buf, 0x16u);
    }
    else
    {
      __int16 v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &presentEditMenuWithConfiguration____s_category) + 8);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      __int16 v12 = v11;
      __int16 v13 = [(UIEditMenuInteraction *)self activeConfiguration];
      __int16 v14 = [(UIEditMenuInteraction *)self view];
      *(_DWORD *)buf = 138412546;
      __int16 v18 = v13;
      __int16 v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "The edit menu (configuration: %@) can only be presented when the view is in a window scene: %@", buf, 0x16u);
    }

LABEL_7:
    goto LABEL_8;
  }
  objc_storeStrong((id *)&self->_pendingConfiguration, configuration);
  [(UIEditMenuConfiguration *)v5 sourcePoint];
  double v8 = v7;
  double v10 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__UIEditMenuInteraction_presentEditMenuWithConfiguration___block_invoke;
  v15[3] = &unk_1E52F3748;
  v15[4] = self;
  __int16 v16 = v5;
  -[UIEditMenuInteraction _prepareMenuAtLocation:configuration:completionHandler:](self, "_prepareMenuAtLocation:configuration:completionHandler:", v16, v15, v8, v10);

LABEL_8:
}

void __58__UIEditMenuInteraction_presentEditMenuWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(void *)(v4 + 64))
    {
      id v14 = v3;
      id v5 = (_UIEditMenuInProcessPresentation *)*(id *)(v4 + 80);
      if (!v5)
      {
        if (!+[UIEditMenuInteraction _isOutOfProcessEditMenusEnabled](UIEditMenuInteraction, "_isOutOfProcessEditMenusEnabled")|| (v6 = [_UIEditMenuOverlayUIClientPresentation alloc], v7 = *(void **)(a1 + 32), [v7 view], v8 = objc_claimAutoreleasedReturnValue(), id v5 = -[_UIEditMenuOverlayUIClientPresentation initWithDelegate:sourceView:](v6, "initWithDelegate:sourceView:", v7, v8), v8, !v5))
        {
          double v9 = [_UIEditMenuInProcessPresentation alloc];
          double v10 = *(void **)(a1 + 32);
          __int16 v11 = [v10 view];
          id v5 = [(_UIEditMenuPresentation *)v9 initWithDelegate:v10 sourceView:v11];
        }
        -[_UIEditMenuPresentation setEnforcesMenuControllerLifecycle:](v5, "setEnforcesMenuControllerLifecycle:", [*(id *)(a1 + 32) _enforcesMenuControllerLifecycle]);
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), v5);
      }
      [(_UIEditMenuContentPresentation *)v5 displayMenu:v14 configuration:*(void *)(a1 + 40)];
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
      uint64_t v12 = *(void *)(a1 + 32);
      __int16 v13 = *(void **)(v12 + 64);
      *(void *)(v12 + 64) = 0;

      id v3 = v14;
    }
  }
}

- (void)dismissMenu
{
}

- (void)reloadVisibleMenu
{
  id v3 = [(UIEditMenuInteraction *)self activeConfiguration];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 sourcePoint];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__UIEditMenuInteraction_reloadVisibleMenu__block_invoke;
    v5[3] = &unk_1E52E4B40;
    v5[4] = self;
    -[UIEditMenuInteraction _prepareMenuAtLocation:configuration:completionHandler:](self, "_prepareMenuAtLocation:configuration:completionHandler:", v4, v5);
  }
}

void __42__UIEditMenuInteraction_reloadVisibleMenu__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__UIEditMenuInteraction_reloadVisibleMenu__block_invoke_2;
  v6[3] = &unk_1E52DD358;
  id v7 = v3;
  id v5 = v3;
  [v4 _updateVisibleMenuWithReason:1 updateBlock:v6];
}

id __42__UIEditMenuInteraction_reloadVisibleMenu__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (CGPoint)locationInView:(UIView *)view
{
  uint64_t v4 = view;
  id v5 = [(UIEditMenuInteraction *)self contextMenuInteraction];
  int v6 = [v5 _hasVisibleMenu];

  if (v6)
  {
    [(UIContextMenuInteraction *)self->_contextMenuInteraction locationInView:v4];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    __int16 v11 = [(UIEditMenuInteraction *)self activeConfiguration];

    if (v11)
    {
      uint64_t v12 = [(UIEditMenuInteraction *)self activeConfiguration];
      [v12 sourcePoint];
      double v8 = v13;
      double v10 = v14;
    }
    else
    {
      double v8 = 1.79769313e308;
      double v10 = 1.79769313e308;
    }
    if (v8 == 1.79769313e308 && v10 == 1.79769313e308)
    {
      __int16 v15 = [(UIEditMenuInteraction *)self view];

      if (v15 == v4)
      {
        double v8 = 1.79769313e308;
        double v10 = 1.79769313e308;
      }
      else
      {
        __int16 v16 = [(UIEditMenuInteraction *)self view];
        objc_msgSend(v16, "convertPoint:toView:", v4, v8, 1.79769313e308);
        double v8 = v17;
        double v10 = v18;
      }
    }
  }

  double v19 = v8;
  double v20 = v10;
  result.y = v20;
  result.x = v19;
  return result;
}

- (void)_dismissMenuWithPresentationType:(int64_t)a3
{
  id v5 = [(UIEditMenuInteraction *)self pendingConfiguration];

  if (v5)
  {
    pendingConfiguration = self->_pendingConfiguration;
    self->_pendingConfiguration = 0;
  }
  double v7 = [(UIEditMenuInteraction *)self activeEditMenuPresentation];

  if (a3 == 2 || !v7)
  {
    double v8 = [(UIEditMenuInteraction *)self contextMenuInteraction];
    int v9 = [v8 _hasVisibleMenu];

    if (a3 == 1 || !v9) {
      return;
    }
    id v10 = [(UIEditMenuInteraction *)self contextMenuInteraction];
    [v10 dismissMenu];
  }
  else
  {
    id v10 = [(UIEditMenuInteraction *)self activeEditMenuPresentation];
    [v10 hideMenuWithReason:0];
  }
}

- (void)_updateVisibleMenuWithReason:(int64_t)a3 updateBlock:(id)a4
{
  double v14 = (void (**)(id, void *))a4;
  int v6 = [(UIEditMenuInteraction *)self activeEditMenuPresentation];
  double v7 = [v6 displayedMenu];

  if (v7)
  {
    double v8 = (void *)[v7 _mutableCopy];
    uint64_t v9 = v14[2](v14, v8);
    if ((void *)v9 == v8)
    {
    }
    else
    {
      id v10 = (void *)v9;
      +[UIView areAnimationsEnabled];
      __int16 v11 = [(UIEditMenuInteraction *)self activeEditMenuPresentation];
      [v11 replaceVisibleMenuWithMenu:v10 reason:a3];
    }
  }
  else
  {
    uint64_t v12 = [(UIEditMenuInteraction *)self contextMenuInteraction];
    int v13 = [v12 _hasVisibleMenu];

    if (!v13) {
      goto LABEL_8;
    }
    double v8 = [(UIEditMenuInteraction *)self contextMenuInteraction];
    [v8 updateVisibleMenuWithBlock:v14];
  }

LABEL_8:
}

- (BOOL)_dismissedByActionSelection
{
  return self->_dismissedByMenuAction;
}

- (BOOL)_dismissedRecently
{
  return CFAbsoluteTimeGetCurrent() < self->_lastDismissalTime + 0.6;
}

- (CGRect)menuFrameInCoordinateSpace:(id)a3
{
  id v4 = a3;
  id v5 = [(UIEditMenuInteraction *)self activeEditMenuPresentation];

  if (v5)
  {
    int v6 = [(UIEditMenuInteraction *)self activeEditMenuPresentation];
    [v6 menuFrameInCoordinateSpace:v4];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB20];
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)firstResponderTargetForConfiguration:(id)a3
{
  id v4 = a3;
  if ((*(_WORD *)&self->_delegateImplements & 0x80) == 0
    || ([(UIEditMenuInteraction *)self delegate],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 _editMenuInteraction:self firstResponderTargetForConfiguration:v4],
        int v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    int v6 = [v4 _firstResponderTarget];
    if (!v6)
    {
      int v6 = [(UIEditMenuInteraction *)self view];
    }
  }

  return v6;
}

- (id)_defaultSuggestedActionsAtLocation:(CGPoint)a3 configuration:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  double v7 = [(UIEditMenuInteraction *)self firstResponderTargetForConfiguration:a4];
  double v8 = [(UIEditMenuInteraction *)self view];
  double v9 = +[_UIEditMenuProvider menuElementsFromResponderChain:atLocation:inCoordinateSpace:includeMenuControllerItems:](_UIEditMenuProvider, "menuElementsFromResponderChain:atLocation:inCoordinateSpace:includeMenuControllerItems:", v7, v8, [(UIEditMenuInteraction *)self _includeMenuControllerItems], x, y);

  return v9;
}

- (void)_editMenuPresentation:(id)a3 didSelectMenuLeaf:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = (void (**)(void))a5;
  objc_storeWeak((id *)&self->__selectedMenuLeaf, v9);
  double v11 = [(UIEditMenuInteraction *)self _proxySender];
  char v17 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v9;
    double v13 = [v8 activeConfiguration];
    double v14 = [(UIEditMenuInteraction *)self firstResponderTargetForConfiguration:v13];

    objc_msgSend(v12, "set_useSenderForResolvingTarget:", -[UIEditMenuInteraction _useSenderAsResponderSender](self, "_useSenderAsResponderSender"));
    double v15 = [v12 _resolvedTargetFromFirstTarget:v14 sender:v11 shouldUseFallbackActionOut:&v17];

    if (!v15) {
      goto LABEL_10;
    }
    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v12 _performFallbackActionWithSender:v11 target:v15];
        goto LABEL_8;
      }
    }
  }
  else
  {
    double v15 = 0;
  }
  [v9 performWithSender:v11 target:v15];
LABEL_8:
  if ((*(_WORD *)&self->_delegateImplements & 0x100) != 0)
  {
    double v16 = [(UIEditMenuInteraction *)self delegate];
    [v16 _editMenuInteraction:self didPerformMenuLeaf:v9 target:v15];
  }
LABEL_10:
  self->_dismissedByMenuAction = ([v9 attributes] & 8) == 0;
  objc_storeWeak((id *)&self->__selectedMenuLeaf, 0);
  v10[2](v10);
}

- (CGRect)_editMenuPresentation:(id)a3 targetRectForConfiguration:(id)a4
{
  id v5 = a4;
  [(UIEditMenuInteraction *)self _targetRectForConfiguration:v5];
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  if (CGRectIsNull(v16))
  {
    [v5 sourcePoint];
    CGFloat x = v10;
    CGFloat y = v11;
    CGFloat width = *MEMORY[0x1E4F1DB30];
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)_editMenuPresentation:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a5;
  id v9 = a4;
  id v8 = [(UIEditMenuInteraction *)self _outgoingPresentation];
  [v8 forceEndDismissalIfNeeded];

  [(UIEditMenuInteraction *)self _dismissMenuWithPresentationType:2];
  [(UIEditMenuInteraction *)self _willPresentMenuForConfiguration:v9 animator:v7];
}

- (void)_editMenuPresentation:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v9 = (_UIEditMenuPresentation *)a3;
  id v10 = a5;
  [(UIEditMenuInteraction *)self _willDismissMenuForConfiguration:a4 animator:v10];
  if (self->_activeEditMenuPresentation == v9)
  {
    self->_activeEditMenuPresentation = 0;

    double v11 = [(UIEditMenuInteraction *)self _outgoingPresentation];
    [v11 forceEndDismissalIfNeeded];

    objc_storeStrong((id *)&self->__outgoingPresentation, a3);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__UIEditMenuInteraction__editMenuPresentation_willDismissMenuForConfiguration_animator___block_invoke;
  v13[3] = &unk_1E52D9F98;
  v13[4] = self;
  double v14 = v9;
  double v12 = v9;
  [v10 addCompletion:v13];
}

void __88__UIEditMenuInteraction__editMenuPresentation_willDismissMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(v1 + 88);
  if (v3 == v2)
  {
    *(void *)(v1 + 88) = 0;
  }
}

- (void)_editMenuPresentation:(id)a3 preparedMenuForDisplay:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  id v10 = [a3 activeConfiguration];
  double v11 = [(UIEditMenuInteraction *)self _menuPreparationContextForConfiguration:v10];

  id v12 = v8;
  id v13 = v11;
  if ([v12 metadata])
  {
    id v18 = v12;
  }
  else
  {
    objc_msgSend(v13, "setTracksSelection:", (objc_msgSend(v12, "options") & 0x80) == 0);
    unsigned __int8 v21 = 0;
    unsigned int v20 = 0;
    double v14 = +[_UIActionBridge validatedCommandMenuForMenu:v12 context:v13];
    uint64_t v15 = [v14 _resolvedElementSize];
    CGRect v16 = [v14 children];
    char v17 = _menuElementsPreparedForDisplay(v16, v15, v13, (uint64_t)&v20);
    id v18 = [v14 menuByReplacingChildren:v17];

    LOBYTE(v20) = 1;
    if ([v13 supportsHeaderView])
    {
      double v19 = [v12 headerView];
      HIBYTE(v20) |= v19 != 0;
    }
    [v18 setMetadata:v20 | ((unint64_t)v21 << 32)];
  }

  v9[2](v9, v18);
}

- (void)_editMenuPresentation:(id)a3 didTransitionMenuForConfiguration:(id)a4
{
  if ((*(_WORD *)&self->_delegateImplements & 0x20) != 0)
  {
    id v5 = a4;
    id v6 = [(UIEditMenuInteraction *)self delegate];
    [v6 _editMenuInteraction:self didTransitionMenuForConfiguration:v5];
  }
}

- (id)_editMenuPresentation:(id)a3 titleViewForMenu:(id)a4 configuration:(id)a5
{
  if ((*(_WORD *)&self->_delegateImplements & 0x40) != 0)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = [(UIEditMenuInteraction *)self delegate];
    id v5 = [v10 _editMenuInteraction:self titleViewForMenu:v9 configuration:v8];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)_editMenuPresentation:(id)a3 preferredLayoutRectsForConfiguration:(id)a4
{
  if ((*(_WORD *)&self->_delegateImplements & 0x200) != 0)
  {
    id v6 = a4;
    id v7 = [(UIEditMenuInteraction *)self delegate];
    id v4 = [v7 _editMenuInteraction:self preferredLayoutRectsForConfiguration:v6];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)_contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4 completion:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  id v9 = [MEMORY[0x1E4F29128] UUID];
  +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", v9, x, y);
  id v10 = (UIEditMenuConfiguration *)objc_claimAutoreleasedReturnValue();
  activeConfiguration = self->_activeConfiguration;
  self->_activeConfiguration = v10;

  id v12 = self->_activeConfiguration;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__UIEditMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke;
  v14[3] = &unk_1E52F37B8;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  -[UIEditMenuInteraction _prepareMenuAtLocation:configuration:completionHandler:](self, "_prepareMenuAtLocation:configuration:completionHandler:", v12, v14, x, y);
}

void __91__UIEditMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 children];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 72) identifier];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __91__UIEditMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_2;
    v8[3] = &unk_1E52DD380;
    id v9 = v3;
    id v7 = +[UIContextMenuConfiguration configurationWithIdentifier:v6 previewProvider:0 actionProvider:v8];
  }
  else
  {
    id v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __91__UIEditMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4.x, a4.y);
  [v6 handleFailureInMethod:a2 object:self file:@"UIEditMenuInteraction.m" lineNumber:667 description:@"This should never be called."];

  return 0;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = [UIPreviewTarget alloc];
  id v7 = [v5 view];

  [(UIEditMenuConfiguration *)self->_activeConfiguration sourcePoint];
  id v8 = -[UIPreviewTarget initWithContainer:center:](v6, "initWithContainer:center:", v7);

  id v9 = objc_opt_new();
  id v10 = [UITargetedPreview alloc];
  double v11 = objc_opt_new();
  id v12 = [(UITargetedPreview *)v10 initWithView:v9 parameters:v11 target:v8];

  return v12;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    id v11 = 0;
    id v12 = v9;
  }
  else
  {
    id v11 = (id)objc_opt_new();
    id v12 = v11;
  }
  [(UIEditMenuInteraction *)self _dismissMenuWithPresentationType:1];
  id v13 = [(UIEditMenuInteraction *)self activeConfiguration];
  [(UIEditMenuInteraction *)self _willPresentMenuForConfiguration:v13 animator:v12];

  if (v11)
  {
    [v11 runAnimations];
    [v11 runCompletions];
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    id v11 = 0;
    id v12 = v9;
  }
  else
  {
    id v11 = (id)objc_opt_new();
    id v12 = v11;
  }
  id v13 = [(UIEditMenuInteraction *)self activeConfiguration];
  [(UIEditMenuInteraction *)self _willDismissMenuForConfiguration:v13 animator:v12];

  id v14 = [v8 identifier];
  id v15 = [(UIEditMenuConfiguration *)self->_activeConfiguration identifier];

  if (v14 != v15)
  {
    if (!v11) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  activeConfiguration = self->_activeConfiguration;
  self->_activeConfiguration = 0;

  if (v11)
  {
LABEL_6:
    [v11 runAnimations];
    [v11 runCompletions];
  }
LABEL_7:
}

- (void)_setUseSenderAsResponderSender:(BOOL)a3
{
  self->__useSenderAsResponderSender = a3;
  -[UIContextMenuInteraction set_useSenderAsResponderSender:](self->_contextMenuInteraction, "set_useSenderAsResponderSender:");
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v5 = +[_UIContextMenuStyle defaultStyle];
  [v5 setPreferredLayout:3];
  [v5 setKeepsInputViewsVisible:1];
  id v6 = [(UIEditMenuInteraction *)self view];
  objc_msgSend(v5, "set_parentTraitEnvironmentForUserInterfaceStyle:", v6);

  return v5;
}

- ($9638EFF0CCCAFE90921E224CC361F7AC)_anchorForPreferredArrowDirection:(SEL)a3
{
  switch(a4)
  {
    case 0:
    case 2:
      id v5 = [($9638EFF0CCCAFE90921E224CC361F7AC *)self view];
      if ([v5 _shouldReverseLayoutDirection]) {
        unint64_t v6 = 8;
      }
      else {
        unint64_t v6 = 2;
      }

      goto LABEL_7;
    case 1:
      id v8 = [($9638EFF0CCCAFE90921E224CC361F7AC *)self view];
      if ([v8 _shouldReverseLayoutDirection]) {
        unint64_t v6 = 8;
      }
      else {
        unint64_t v6 = 2;
      }

      unint64_t v7 = 4;
      break;
    case 3:
      unint64_t v6 = 1;
      unint64_t v7 = 8;
      break;
    case 4:
      unint64_t v6 = 1;
      unint64_t v7 = 2;
      break;
    default:
      unint64_t v6 = 0;
LABEL_7:
      unint64_t v7 = 1;
      break;
  }
  retstr->var0 = v7;
  retstr->var1 = v6;
  retstr->var3 = 0.0;
  retstr->var4 = 0;
  retstr->var2 = 0.0;
  return self;
}

- (id)_menuPreparationContextForConfiguration:(id)a3
{
  id v4 = [(UIEditMenuInteraction *)self firstResponderTargetForConfiguration:a3];
  id v5 = +[_UIMenuPreparationContext contextWithPreparer:self firstResponderTarget:v4];
  [v5 setDeferredElementDelegate:self];
  [v5 setSupportsCustomViewMenuElements:0];
  unint64_t v6 = [(UIEditMenuInteraction *)self _proxySender];
  [v5 setSender:v6];

  objc_msgSend(v5, "setUseSenderAsResponderSender:", -[UIEditMenuInteraction _useSenderAsResponderSender](self, "_useSenderAsResponderSender"));
  return v5;
}

- (void)_prepareMenuAtLocation:(CGPoint)a3 configuration:(id)a4 completionHandler:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  id v11 = -[UIEditMenuInteraction _defaultSuggestedActionsAtLocation:configuration:](self, "_defaultSuggestedActionsAtLocation:configuration:", v9, x, y);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __80__UIEditMenuInteraction__prepareMenuAtLocation_configuration_completionHandler___block_invoke;
  double v19 = &unk_1E52F37B8;
  id v12 = v11;
  id v20 = v12;
  id v21 = v10;
  id v13 = v10;
  id v14 = (void (**)(void *, void *))_Block_copy(&v16);
  if ((*(_WORD *)&self->_delegateImplements & 0x10) != 0)
  {
    id v15 = [(UIEditMenuInteraction *)self delegate];
    [v15 _editMenuInteraction:self menuForConfiguration:v9 suggestedActions:v12 completionHandler:v14];
  }
  else
  {
    id v15 = -[UIEditMenuInteraction _menuForSuggestedActions:configuration:](self, "_menuForSuggestedActions:configuration:", v12, v9, v16, v17, v18, v19, v20, v21);
    v14[2](v14, v15);
  }
}

void __80__UIEditMenuInteraction__prepareMenuAtLocation_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v3 = +[UIMenu menuWithChildren:*(void *)(a1 + 32)];
  }
  id v4 = v3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deferredMenuElementWasFulfilled:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__UIEditMenuInteraction_deferredMenuElementWasFulfilled___block_invoke;
  v6[3] = &unk_1E52DD358;
  id v7 = v4;
  id v5 = v4;
  [(UIEditMenuInteraction *)self _updateVisibleMenuWithReason:2 updateBlock:v6];
}

id __57__UIEditMenuInteraction_deferredMenuElementWasFulfilled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (isDeferredElementVisibleInMenu(*(void **)(a1 + 32), v3)) {
    id v4 = (id)[v3 copy];
  }
  else {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (id)_menuForSuggestedActions:(id)a3 configuration:(id)a4
{
  if (*(_WORD *)&self->_delegateImplements)
  {
    id v7 = a4;
    id v8 = a3;
    id v9 = [(UIEditMenuInteraction *)self delegate];
    id v4 = [v9 editMenuInteraction:self menuForConfiguration:v7 suggestedActions:v8];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (CGRect)_targetRectForConfiguration:(id)a3
{
  if ((*(_WORD *)&self->_delegateImplements & 2) != 0)
  {
    id v8 = a3;
    id v9 = [(UIEditMenuInteraction *)self delegate];
    [v9 editMenuInteraction:self targetRectForConfiguration:v8];
    double v3 = v10;
    double v4 = v11;
    double v5 = v12;
    double v6 = v13;
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB20];
    double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v14 = v3;
  double v15 = v4;
  double v16 = v5;
  double v17 = v6;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)_willPresentMenuForConfiguration:(id)a3 animator:(id)a4
{
  self->_lastDismissalTime = 0.0;
  self->_dismissedByMenuAction = 0;
  if ((*(unsigned char *)&self->_delegateImplements & 4) != 0)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(UIEditMenuInteraction *)self delegate];
    [v8 editMenuInteraction:self willPresentMenuForConfiguration:v7 animator:v6];
  }
}

- (void)_willDismissMenuForConfiguration:(id)a3 animator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_lastDismissalTime = CFAbsoluteTimeGetCurrent();
  if ((*(unsigned char *)&self->_delegateImplements & 8) != 0)
  {
    id v8 = [(UIEditMenuInteraction *)self delegate];
    [v8 editMenuInteraction:self willDismissMenuForConfiguration:v6 animator:v7];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__UIEditMenuInteraction__willDismissMenuForConfiguration_animator___block_invoke;
  v10[3] = &unk_1E52D9F98;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 addCompletion:v10];
}

void __67__UIEditMenuInteraction__willDismissMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) activeConfiguration];
  double v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    double v4 = *(void **)(a1 + 32);
    [v4 setActiveConfiguration:0];
  }
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (UIEditMenuConfiguration)pendingConfiguration
{
  return self->_pendingConfiguration;
}

- (void)setPendingConfiguration:(id)a3
{
}

- (UIEditMenuConfiguration)activeConfiguration
{
  return self->_activeConfiguration;
}

- (void)setActiveConfiguration:(id)a3
{
}

- (_UIEditMenuPresentation)_outgoingPresentation
{
  return self->__outgoingPresentation;
}

- (BOOL)_includeMenuControllerItems
{
  return self->__includeMenuControllerItems;
}

- (void)setDisplayingMenu:(BOOL)a3
{
  self->_displayingMenu = a3;
}

- (UIMenuLeaf)_selectedMenuLeaf
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__selectedMenuLeaf);
  return (UIMenuLeaf *)WeakRetained;
}

- (void)set_selectedMenuLeaf:(id)a3
{
}

- (BOOL)_useSenderAsResponderSender
{
  return self->__useSenderAsResponderSender;
}

- (BOOL)_enforcesMenuControllerLifecycle
{
  return self->__enforcesMenuControllerLifecycle;
}

- (void)_setEnforcesMenuControllerLifecycle:(BOOL)a3
{
  self->__enforcesMenuControllerLifecycle = a3;
}

@end