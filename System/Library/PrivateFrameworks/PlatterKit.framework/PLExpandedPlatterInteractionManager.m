@interface PLExpandedPlatterInteractionManager
+ (void)initialize;
- (BOOL)_contextMenuInteractionShouldAllowSwipeToDismiss:(id)a3;
- (BOOL)reachedForceThreshold;
- (PLExpandedPlatterInteractionHosting)presentingViewController;
- (PLExpandedPlatterInteractionManager)initWithPresentingViewController:(id)a3 delegate:(id)a4;
- (PLExpandedPlatterInteractionManagerDelegate)delegate;
- (id)_contextMenuConfigurationIdentifier;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)_identifier;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (unint64_t)_activationMethodForContextMenuInteraction:(id)a3;
- (void)_contextMenuInteraction:(id)a3 shouldPresentWithCompletion:(id)a4;
- (void)_setPresentingViewControllerHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)dismiss;
- (void)presentAtLocation:(CGPoint)a3 completion:(id)a4;
- (void)updateVisibleMenuWithBlock:(id)a3;
@end

@implementation PLExpandedPlatterInteractionManager

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    PLRegisterPlatterKitLogging();
  }
}

- (PLExpandedPlatterInteractionManager)initWithPresentingViewController:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PLExpandedPlatterInteractionManager;
  v8 = [(PLExpandedPlatterInteractionManager *)&v22 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_presentingViewController, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags = *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 2;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags = *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags & 0xFFFD | v10;
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 4;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags = *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags & 0xFFFB | v11;
    if (objc_opt_respondsToSelector()) {
      __int16 v12 = 8;
    }
    else {
      __int16 v12 = 0;
    }
    *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags = *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags & 0xFFF7 | v12;
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = 16;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags = *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags & 0xFFEF | v13;
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = 32;
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags = *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags & 0xFFDF | v14;
    if (objc_opt_respondsToSelector()) {
      __int16 v15 = 64;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags = *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags & 0xFFBF | v15;
    if (objc_opt_respondsToSelector()) {
      __int16 v16 = 128;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags = *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags & 0xFF7F | v16;
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = 256;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags = *(_WORD *)&v9->_expandedPlatterInteractionManagerDelegateFlags & 0xFEFF | v17;
    v18 = [[PLContextMenuInteraction alloc] initWithDelegate:v9];
    contextMenuInteraction = v9->_contextMenuInteraction;
    v9->_contextMenuInteraction = &v18->super;

    v20 = [v6 viewForPreview];
    [v20 addInteraction:v9->_contextMenuInteraction];
  }
  return v9;
}

- (void)presentAtLocation:(CGPoint)a3 completion:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (self->_cachedCompletion)
  {
    v8 = PLLogTransition;
    if (os_log_type_enabled((os_log_t)PLLogTransition, OS_LOG_TYPE_ERROR)) {
      -[PLExpandedPlatterInteractionManager presentAtLocation:completion:](v8);
    }
    (*((void (**)(void))self->_cachedCompletion + 2))();
  }
  v9 = (void *)[v7 copy];
  id cachedCompletion = self->_cachedCompletion;
  self->_id cachedCompletion = v9;

  -[UIContextMenuInteraction _presentMenuAtLocation:](self->_contextMenuInteraction, "_presentMenuAtLocation:", x, y);
}

- (void)updateVisibleMenuWithBlock:(id)a3
{
  if (a3) {
    -[UIContextMenuInteraction updateVisibleMenuWithBlock:](self->_contextMenuInteraction, "updateVisibleMenuWithBlock:");
  }
}

- (void)dismiss
{
}

- (BOOL)reachedForceThreshold
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  contextMenuInteraction = self->_contextMenuInteraction;
  return [(UIContextMenuInteraction *)contextMenuInteraction _reachedForceThreshold];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v9 = PLLogTransition;
  if (os_log_type_enabled((os_log_t)PLLogTransition, OS_LOG_TYPE_DEBUG)) {
    -[PLExpandedPlatterInteractionManager contextMenuInteraction:configurationForMenuAtLocation:]((uint64_t)WeakRetained, v9);
  }
  if ((*(_WORD *)&self->_expandedPlatterInteractionManagerDelegateFlags & 8) != 0
    && (id v10 = objc_loadWeakRetained((id *)&self->_delegate),
        int v11 = objc_msgSend(v10, "expandedPlatterInteractionManager:shouldBeginInteractionWithTouchAtLocation:", self, x, y), v10, !v11))
  {
    v24 = 0;
  }
  else
  {
    id v29 = WeakRetained;
    objc_initWeak(location, self);
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    __int16 v13 = v12;
    __int16 expandedPlatterInteractionManagerDelegateFlags = (__int16)self->_expandedPlatterInteractionManagerDelegateFlags;
    __int16 v15 = (id *)&off_1D9406000;
    id v16 = v7;
    if ((expandedPlatterInteractionManagerDelegateFlags & 2) != 0)
    {
      __int16 v17 = v33;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __93__PLExpandedPlatterInteractionManager_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
      v33[3] = &unk_1E6B5FE38;
      v27 = &v34;
      id v34 = v12;
      v28 = &v35;
      objc_copyWeak(&v35, location);
    }
    else
    {
      __int16 v17 = 0;
    }
    v18 = (void *)MEMORY[0x1D948D440](v17);
    __int16 v19 = (__int16)self->_expandedPlatterInteractionManagerDelegateFlags;
    if ((v19 & 4) != 0)
    {
      v20 = v30;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __93__PLExpandedPlatterInteractionManager_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
      v30[3] = &unk_1E6B5FE60;
      v26 = &v31;
      id v31 = v13;
      __int16 v15 = &v32;
      objc_copyWeak(&v32, location);
    }
    else
    {
      v20 = 0;
    }
    v21 = (void *)MEMORY[0x1D948D440](v20);
    objc_super v22 = (void *)MEMORY[0x1E4F428F0];
    v23 = [(PLExpandedPlatterInteractionManager *)self _contextMenuConfigurationIdentifier];
    v24 = [v22 configurationWithIdentifier:v23 previewProvider:v18 actionProvider:v21];

    if ((v19 & 4) != 0)
    {
      objc_destroyWeak(v15);
    }
    if ((expandedPlatterInteractionManagerDelegateFlags & 2) != 0)
    {
      objc_destroyWeak(v28);
    }
    objc_destroyWeak(location);
    id v7 = v16;
    id WeakRetained = v29;
  }

  return v24;
}

id __93__PLExpandedPlatterInteractionManager_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [v1 expandedPlatterInteractionManagerContentViewController:WeakRetained];

  return v3;
}

id __93__PLExpandedPlatterInteractionManager_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [v2 expandedPlatterInteractionManager:WeakRetained menuWithSuggestedActions:v4];

  return v6;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  id v7 = PLLogTransition;
  if (os_log_type_enabled((os_log_t)PLLogTransition, OS_LOG_TYPE_DEBUG)) {
    -[PLExpandedPlatterInteractionManager contextMenuInteraction:configuration:highlightPreviewForItemWithIdentifier:]((uint64_t)WeakRetained, v7);
  }
  v8 = [WeakRetained viewForPreview];
  v9 = [v8 window];

  if (v9)
  {
    [(PLExpandedPlatterInteractionManager *)self _setPresentingViewControllerHighlighted:1 animated:1];
    id v10 = objc_alloc_init(MEMORY[0x1E4F42CF8]);
    int v11 = [MEMORY[0x1E4F428B8] clearColor];
    [v10 setBackgroundColor:v11];

    if (objc_opt_respondsToSelector())
    {
      id v12 = [WeakRetained visiblePath];
      [v10 setVisiblePath:v12];
    }
    __int16 v13 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:v8 parameters:v10];
  }
  else
  {
    __int16 v14 = PLLogTransition;
    if (os_log_type_enabled((os_log_t)PLLogTransition, OS_LOG_TYPE_ERROR)) {
      -[PLExpandedPlatterInteractionManager contextMenuInteraction:configuration:highlightPreviewForItemWithIdentifier:]((uint64_t)v8, v14);
    }
    __int16 v13 = 0;
  }

  return v13;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_cachedCompletion)
  {
    int v11 = (void *)MEMORY[0x1D948D440]();
    id cachedCompletion = self->_cachedCompletion;
    self->_id cachedCompletion = 0;

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __103__PLExpandedPlatterInteractionManager_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke;
    v15[3] = &unk_1E6B5FE88;
    id v16 = v11;
    id v13 = v11;
    [v10 addCompletion:v15];
  }
  if ((*(_WORD *)&self->_expandedPlatterInteractionManagerDelegateFlags & 0x10) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained expandedPlatterInteractionManager:self willPresentContentWithAnimator:v10];
  }
}

uint64_t __103__PLExpandedPlatterInteractionManager_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __95__PLExpandedPlatterInteractionManager_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v8[3] = &unk_1E6B5F800;
  v8[4] = self;
  [v6 addAnimations:v8];
  if ((*(_WORD *)&self->_expandedPlatterInteractionManagerDelegateFlags & 0x80) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained expandedPlatterInteractionManager:self willDismissContentWithAnimator:v6];
  }
}

uint64_t __95__PLExpandedPlatterInteractionManager_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPresentingViewControllerHighlighted:0 animated:0];
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  v5 = objc_msgSend(MEMORY[0x1E4F43130], "defaultStyle", a3, a4);
  [v5 setHasInteractivePreview:1];
  if (objc_opt_respondsToSelector()) {
    [v5 setPrefersCenteredPreviewWhenActionsAreAbsent:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v5 setKeepsInputViewsVisible:1];
  }
  if (objc_opt_respondsToSelector()) {
    [v5 setIgnoresDefaultSizingRules:1];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v7 = [WeakRetained expandedPlatterInteractionManagerContainerView:self];
    if (v7) {
      [v5 setContainerView:v7];
    }
  }
  return v5;
}

- (BOOL)_contextMenuInteractionShouldAllowSwipeToDismiss:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (self->_initialPanOccurred)
  {
    char v6 = 1;
  }
  else
  {
    char v6 = 1;
    if ((*(_WORD *)&self->_expandedPlatterInteractionManagerDelegateFlags & 0x40) == 0
      || (char v6 = [WeakRetained expandedPlatterInteractionManagerShouldAllowInitialSwipeToDismiss:self],
          !self->_initialPanOccurred))
    {
      self->_initialPanOccurred = 1;
    }
  }

  return v6;
}

- (void)_contextMenuInteraction:(id)a3 shouldPresentWithCompletion:(id)a4
{
  if ((*(_WORD *)&self->_expandedPlatterInteractionManagerDelegateFlags & 0x20) != 0)
  {
    p_delegate = &self->_delegate;
    id v6 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained expandedPlatterInteractionManager:self shouldCommitInteraction:v6];
  }
}

- (unint64_t)_activationMethodForContextMenuInteraction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if ((*(_WORD *)&self->_expandedPlatterInteractionManagerDelegateFlags & 0x100) != 0) {
    unint64_t v6 = [WeakRetained expandedPlatterInteractionManagerShouldAllowLongPressGesture:self] ^ 1;
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)_identifier
{
  if (*(_WORD *)&self->_expandedPlatterInteractionManagerDelegateFlags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v4 = [WeakRetained expandedPlatterInteractionManagerIdentifier:self];
  }
  else
  {
    id WeakRetained = [MEMORY[0x1E4F29128] UUID];
    id v3 = [WeakRetained UUIDString];
    id v4 = [@"com.apple.PlatterKit.PLExpandedPlatterInteractionManager" stringByAppendingPathExtension:v3];
  }
  return v4;
}

- (id)_contextMenuConfigurationIdentifier
{
  v2 = [(PLExpandedPlatterInteractionManager *)self _identifier];
  id v3 = [v2 stringByAppendingPathExtension:@"contextMenuConfiguration"];

  return v3;
}

- (void)_setPresentingViewControllerHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  if (objc_opt_respondsToSelector())
  {
    if (v4)
    {
      id v7 = (void *)[MEMORY[0x1E4F743C8] newDefaultHighlightAnimator];
      uint64_t v8 = MEMORY[0x1E4F143A8];
      uint64_t v9 = 3221225472;
      id v10 = __88__PLExpandedPlatterInteractionManager__setPresentingViewControllerHighlighted_animated___block_invoke;
      int v11 = &unk_1E6B5F828;
      id v12 = WeakRetained;
      BOOL v13 = v5;
      [v7 addAnimations:&v8];
      objc_msgSend(v7, "startAnimation", v8, v9, v10, v11);
    }
    else
    {
      [WeakRetained setHighlighted:v5];
    }
  }
}

uint64_t __88__PLExpandedPlatterInteractionManager__setPresentingViewControllerHighlighted_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHighlighted:*(unsigned __int8 *)(a1 + 40)];
}

- (PLExpandedPlatterInteractionHosting)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (PLExpandedPlatterInteractionHosting *)WeakRetained;
}

- (PLExpandedPlatterInteractionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLExpandedPlatterInteractionManagerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong(&self->_cachedCompletion, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
}

- (void)presentAtLocation:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D93DD000, log, OS_LOG_TYPE_ERROR, "Already have a cached completion – calling with 'finished=NO'", v1, 2u);
}

- (void)contextMenuInteraction:(uint64_t)a1 configurationForMenuAtLocation:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D93DD000, a2, OS_LOG_TYPE_DEBUG, "Configuring context menu configuration for expanded platter presentation from view controller: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)contextMenuInteraction:(uint64_t)a1 configuration:(NSObject *)a2 highlightPreviewForItemWithIdentifier:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D93DD000, a2, OS_LOG_TYPE_ERROR, "View for preview isn't in a window: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)contextMenuInteraction:(uint64_t)a1 configuration:(NSObject *)a2 highlightPreviewForItemWithIdentifier:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D93DD000, a2, OS_LOG_TYPE_DEBUG, "Configuring targeted preview for expanded platter presentation from view controller: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end