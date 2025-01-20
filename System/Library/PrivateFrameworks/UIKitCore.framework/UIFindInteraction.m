@interface UIFindInteraction
+ (NSString)_globalFindBuffer;
+ (void)_setGlobalFindBuffer:(id)a3;
- (BOOL)isFindNavigatorVisible;
- (NSString)replacementText;
- (NSString)searchText;
- (UIFindInteraction)initWithSessionDelegate:(id)sessionDelegate;
- (UIFindSession)activeFindSession;
- (UITextSearchOptions)_configuredSearchOptions;
- (UIView)_hostView;
- (UIView)view;
- (_UIFindNavigatorHarness)findNavigatorHarness;
- (id)_createActiveFindSessionIfNecessary;
- (id)_currentFindNavigatorController;
- (id)_findNavigatorHosting;
- (id)_findNavigatorHostingForStrategy:(unint64_t)a3;
- (id)_findNavigatorSceneComponent;
- (id)_hostScrollView;
- (id)delegate;
- (id)searchableObject;
- (unint64_t)_computedHostingStrategy;
- (unint64_t)_currentHostingStrategy;
- (void)_didBeginActiveFindSession;
- (void)_didEndActiveFindSession;
- (void)_recomputeHostingStrategyIfNecessary;
- (void)_setHostView:(id)a3;
- (void)_updateHostViewConformance;
- (void)_willChangeNavigatorPlacement:(id)a3;
- (void)didMoveToView:(id)a3;
- (void)dismissFindNavigator;
- (void)findNext;
- (void)findPrevious;
- (void)optionsMenuProvider;
- (void)presentFindNavigatorShowingReplace:(BOOL)showingReplace;
- (void)setFindNavigatorHarness:(id)a3;
- (void)setOptionsMenuProvider:(void *)optionsMenuProvider;
- (void)setReplacementText:(NSString *)replacementText;
- (void)setSearchText:(NSString *)searchText;
- (void)setSearchableObject:(id)a3;
- (void)updateResultCount;
@end

@implementation UIFindInteraction

- (BOOL)isFindNavigatorVisible
{
  if (!self->_activeFindSession) {
    return 0;
  }
  v2 = [(UIFindInteraction *)self _findNavigatorHostingForStrategy:self->_lastUsedHostingStrategy];
  char v3 = [v2 isFindNavigatorVisible];

  return v3;
}

- (void)didMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
  [(UIFindInteraction *)self _updateHostViewConformance];
}

- (void)_updateHostViewConformance
{
  char v3 = [(UIFindInteraction *)self _hostView];
  NSClassFromString(&cfstr_Mfcomposewebvi.isa);
  if (objc_opt_isKindOfClass()) {
    char v4 = 2;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)&self->_hostViewIs = *(unsigned char *)&self->_hostViewIs & 0xFD | v4;

  id v5 = [(UIFindInteraction *)self _hostView];
  NSClassFromString(&cfstr_Wkwebview.isa);
  *(unsigned char *)&self->_hostViewIs = *(unsigned char *)&self->_hostViewIs & 0xFE | objc_opt_isKindOfClass() & 1;
}

- (UIView)_hostView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alternateHostView);
  char v4 = WeakRetained;
  if (WeakRetained) {
    id v5 = WeakRetained;
  }
  else {
    id v5 = objc_loadWeakRetained((id *)&self->_view);
  }
  v6 = v5;

  return (UIView *)v6;
}

- (UIFindInteraction)initWithSessionDelegate:(id)sessionDelegate
{
  id v4 = sessionDelegate;
  v13.receiver = self;
  v13.super_class = (Class)UIFindInteraction;
  id v5 = [(UIFindInteraction *)&v13 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_delegate, v4);
    *(unsigned char *)&v6->_privateDelegateDoes = *(unsigned char *)&v6->_privateDelegateDoes & 0xFE | objc_opt_respondsToSelector() & 1;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_delegate);
    if (objc_opt_respondsToSelector()) {
      char v9 = 2;
    }
    else {
      char v9 = 0;
    }
    *(unsigned char *)&v6->_privateDelegateDoes = *(unsigned char *)&v6->_privateDelegateDoes & 0xFD | v9;

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v6 selector:sel__systemInputAssistantCenterVisibilityChanged_ name:0x1ED118340 object:0];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v6 selector:sel__keyboardDidChangePlacementNotification_ name:@"UIKeyboardDidChangeFrameNotification" object:0];
  }
  return v6;
}

- (void)dismissFindNavigator
{
  char v3 = [(UIFindInteraction *)self view];
  id v4 = [v3 window];

  if (v4)
  {
    id v5 = [(UIFindInteraction *)self _findNavigatorHosting];
    [v5 dismissFindNavigatorEndingActiveSession:1];
  }
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

+ (void)_setGlobalFindBuffer:(id)a3
{
}

+ (NSString)_globalFindBuffer
{
  return (NSString *)(id)__globalFindBuffer;
}

- (void)_didBeginActiveFindSession
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 findInteraction:self didBeginFindSession:self->_activeFindSession];
  }
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"UIFindInteractionFindSessionDidBeginNotification" object:self->_activeFindSession];
}

- (void)_didEndActiveFindSession
{
  [(UIFindSession *)self->_activeFindSession invalidateFoundResults];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 findInteraction:self didEndFindSession:self->_activeFindSession];
  }
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"UIFindInteractionFindSessionDidEndNotification" object:self->_activeFindSession];
}

- (id)_createActiveFindSessionIfNecessary
{
  activeFindSession = self->_activeFindSession;
  if (!activeFindSession)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v5 = [(UIFindInteraction *)self view];
    id v6 = [WeakRetained findInteraction:self sessionForView:v5];
    id v7 = self->_activeFindSession;
    self->_activeFindSession = v6;

    v8 = [(UIFindInteraction *)self view];
    [(UIFindSession *)self->_activeFindSession setSearchableResponder:v8];

    [(UIFindSession *)self->_activeFindSession setParentInteraction:self];
    [(UIFindSession *)self->_activeFindSession setReplacementText:self->_replacementText];
    [(UIFindSession *)self->_activeFindSession setSearchText:self->_searchText];
    activeFindSession = self->_activeFindSession;
  }
  char v9 = [(UIFindSession *)activeFindSession searchText];

  if (!v9)
  {
    v10 = +[UIFindInteraction _globalFindBuffer];
    [(UIFindSession *)self->_activeFindSession setSearchText:v10];
  }
  v11 = self->_activeFindSession;
  return v11;
}

- (id)_findNavigatorSceneComponent
{
  v2 = [(UIFindInteraction *)self view];
  char v3 = +[_UIFindNavigatorSceneComponent sceneComponentForView:v2];

  return v3;
}

- (unint64_t)_computedHostingStrategy
{
  v2 = [(UIFindInteraction *)self view];
  char v3 = [v2 window];
  char v4 = [v3 windowScene];
  id v5 = [v4 keyboardSceneDelegate];

  id v6 = [v5 systemInputAssistantViewController];
  id v7 = [v6 view];
  v8 = [v7 window];

  if (v8)
  {
    char v9 = [v5 systemInputAssistantViewController];
    char v10 = [v9 _hidesCenterViewForActiveWindowingMode];

    if (v10) {
      goto LABEL_11;
    }
  }
  else
  {
    id v11 = +[UIKeyboardImpl sharedInstance];
    v12 = [v5 visualModeManager];
    int v13 = [v12 shouldShowWithinAppWindow];

    v14 = [v5 scene];
    v15 = [v14 traitCollection];
    uint64_t v16 = [v15 horizontalSizeClass];

    if (v13 && v16 == 1) {
      goto LABEL_11;
    }
  }
  v17 = +[UIKeyboardImpl activeInstance];
  if ([v17 isMinimized])
  {

LABEL_12:
    unint64_t v19 = 1;
    goto LABEL_13;
  }
  if (+[UIKeyboardImpl isSplit])
  {
  }
  else
  {
    BOOL v18 = +[UIKeyboardImpl isFloating];

    if (!v18) {
      goto LABEL_12;
    }
  }
LABEL_11:
  unint64_t v19 = 2;
LABEL_13:

  return v19;
}

- (unint64_t)_currentHostingStrategy
{
  unint64_t result = self->_lastUsedHostingStrategy;
  if (!result)
  {
    unint64_t result = [(UIFindInteraction *)self _computedHostingStrategy];
    self->_lastUsedHostingStrategy = result;
  }
  return result;
}

- (id)_findNavigatorHostingForStrategy:(unint64_t)a3
{
  if (a3 == 1)
  {
    v12 = [(UIFindInteraction *)self _findNavigatorSceneComponent];
  }
  else if (a3 == 2)
  {
    if (!self->_findNavigatorHarness)
    {
      char v4 = objc_alloc_init(_UIFindNavigatorHarness);
      [(UIFindInteraction *)self setFindNavigatorHarness:v4];
    }
    id v5 = [(UIFindInteraction *)self _hostView];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [v5 scrollView];

      id v5 = (void *)v6;
    }
    id v7 = [(UIFindInteraction *)self findNavigatorHarness];
    [v7 setHostView:v5];

    v8 = [(UIFindInteraction *)self _hostScrollView];
    char v9 = [(UIFindInteraction *)self findNavigatorHarness];
    [v9 setHostScrollView:v8];

    char v10 = [(UIFindInteraction *)self view];
    id v11 = [(UIFindInteraction *)self findNavigatorHarness];
    [v11 setInteractionView:v10];

    v12 = [(UIFindInteraction *)self findNavigatorHarness];
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)_findNavigatorHosting
{
  unint64_t v3 = [(UIFindInteraction *)self _computedHostingStrategy];
  return [(UIFindInteraction *)self _findNavigatorHostingForStrategy:v3];
}

- (void)_recomputeHostingStrategyIfNecessary
{
  unint64_t v3 = [(UIFindInteraction *)self _computedHostingStrategy];
  char v4 = [(UIFindInteraction *)self _findNavigatorHostingForStrategy:self->_lastUsedHostingStrategy];
  if ([v4 isFindNavigatorVisible] && v3 != self->_lastUsedHostingStrategy)
  {
    id v5 = [v4 findNavigatorViewController];
    uint64_t v6 = [v5 findNavigatorView];
    BOOL v7 = [v6 mode] == 1;

    v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__UIFindInteraction__recomputeHostingStrategyIfNecessary__block_invoke;
    v9[3] = &unk_1E52DC3D0;
    id v10 = v4;
    id v11 = self;
    BOOL v12 = v7;
    [v8 performBlock:v9];

    self->_lastUsedHostingStrategy = v3;
  }
}

void __57__UIFindInteraction__recomputeHostingStrategyIfNecessary__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissFindNavigatorEndingActiveSession:0];
  id v6 = [*(id *)(a1 + 40) _findNavigatorHosting];
  v2 = [*(id *)(a1 + 40) activeFindSession];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  char v4 = [*(id *)(a1 + 40) view];
  id v5 = [v4 traitCollection];
  objc_msgSend(v6, "presentFindNavigatorWithFindSession:showingReplace:idiom:", v2, v3, objc_msgSend(v5, "userInterfaceIdiom"));
}

- (void)presentFindNavigatorShowingReplace:(BOOL)showingReplace
{
  BOOL v3 = showingReplace;
  id v11 = [(UIFindInteraction *)self _createActiveFindSessionIfNecessary];
  if (v11)
  {
    uint64_t v5 = [(UIFindSession *)self->_activeFindSession supportsReplacement] & v3;
    id v6 = [(UIFindInteraction *)self view];
    BOOL v7 = +[_UIContextMenuSceneComponent sceneComponentForView:v6];
    [v7 dismissActiveMenus];

    v8 = [(UIFindInteraction *)self _findNavigatorHosting];
    char v9 = [(UIFindInteraction *)self view];
    id v10 = [v9 traitCollection];
    objc_msgSend(v8, "presentFindNavigatorWithFindSession:showingReplace:idiom:", v11, v5, objc_msgSend(v10, "userInterfaceIdiom"));

    self->_lastUsedHostingStrategy = [(UIFindInteraction *)self _computedHostingStrategy];
    [(UIFindInteraction *)self _didBeginActiveFindSession];
  }
}

- (id)_currentFindNavigatorController
{
  v2 = [(UIFindInteraction *)self _findNavigatorHosting];
  BOOL v3 = [v2 findNavigatorViewController];

  return v3;
}

- (void)updateResultCount
{
  id v2 = [(UIFindInteraction *)self _currentFindNavigatorController];
  [v2 updateViewForActiveFindSession];
}

- (void)findNext
{
  id v2 = [(UIFindInteraction *)self _createActiveFindSessionIfNecessary];
  [v2 highlightNextResultInDirection:0];
}

- (void)findPrevious
{
  id v2 = [(UIFindInteraction *)self _createActiveFindSessionIfNecessary];
  [v2 highlightNextResultInDirection:1];
}

- (NSString)searchText
{
  activeFindSession = self->_activeFindSession;
  if (activeFindSession)
  {
    char v4 = [(UIFindSession *)activeFindSession searchText];
  }
  else
  {
    char v4 = self->_searchText;
  }
  return v4;
}

- (void)setSearchText:(NSString *)searchText
{
  id v11 = searchText;
  objc_storeStrong((id *)&self->_searchText, searchText);
  activeFindSession = self->_activeFindSession;
  if (activeFindSession) {
    [(UIFindSession *)activeFindSession setSearchText:v11];
  }
  id v6 = [(UIFindInteraction *)self _currentFindNavigatorController];
  BOOL v7 = [v6 viewIfLoaded];

  if (v7)
  {
    v8 = [(UIFindInteraction *)self _currentFindNavigatorController];
    char v9 = [v8 findNavigatorView];
    id v10 = [v9 searchTextField];
    [v10 setText:v11];
  }
}

- (NSString)replacementText
{
  activeFindSession = self->_activeFindSession;
  if (activeFindSession)
  {
    char v4 = [(UIFindSession *)activeFindSession replacementText];
  }
  else
  {
    char v4 = self->_replacementText;
  }
  return v4;
}

- (void)setReplacementText:(NSString *)replacementText
{
  id v11 = replacementText;
  objc_storeStrong((id *)&self->_replacementText, replacementText);
  activeFindSession = self->_activeFindSession;
  if (activeFindSession) {
    [(UIFindSession *)activeFindSession setReplacementText:v11];
  }
  id v6 = [(UIFindInteraction *)self _currentFindNavigatorController];
  BOOL v7 = [v6 viewIfLoaded];

  if (v7)
  {
    v8 = [(UIFindInteraction *)self _currentFindNavigatorController];
    char v9 = [v8 findNavigatorView];
    id v10 = [v9 replaceTextField];
    [v10 setText:v11];
  }
}

- (void)_setHostView:(id)a3
{
  objc_storeWeak((id *)&self->_alternateHostView, a3);
  [(UIFindInteraction *)self _updateHostViewConformance];
}

- (UITextSearchOptions)_configuredSearchOptions
{
  id v2 = [(UIFindInteraction *)self _createActiveFindSessionIfNecessary];
  BOOL v3 = [v2 configuredSearchOptions];

  return (UITextSearchOptions *)v3;
}

- (void)_willChangeNavigatorPlacement:(id)a3
{
  if (*(unsigned char *)&self->_privateDelegateDoes)
  {
    p_delegate = &self->_delegate;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained _findInteraction:self navigatorPlacementWillChange:v5];
  }
}

- (id)_hostScrollView
{
  if ((*(unsigned char *)&self->_hostViewIs & 2) != 0 && (*(unsigned char *)&self->_privateDelegateDoes & 1) == 0) {
    goto LABEL_3;
  }
  if ((*(unsigned char *)&self->_privateDelegateDoes & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v8 = [WeakRetained _findInteractionScrollViewForInsetAdjustment:self];
  }
  else
  {
    char v4 = [(UIFindInteraction *)self _hostView];
    char v5 = objc_msgSend(v4, "__isKindOfUIScrollView");

    BOOL v3 = [(UIFindInteraction *)self _hostView];
    if (v5) {
      goto LABEL_10;
    }
    NSClassFromString(&cfstr_Wkwebview.isa);
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
LABEL_3:
      BOOL v3 = 0;
      goto LABEL_10;
    }
    id WeakRetained = [(UIFindInteraction *)self _hostView];
    uint64_t v8 = [WeakRetained scrollView];
  }
  BOOL v3 = (void *)v8;

LABEL_10:
  return v3;
}

- (id)searchableObject
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = [(UIFindSession *)self->_activeFindSession searchableObject];
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (void)setSearchableObject:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v4 = [(UIFindInteraction *)self _createActiveFindSessionIfNecessary];
    [v4 setSearchableObject:v5];
  }
}

- (UIFindSession)activeFindSession
{
  return self->_activeFindSession;
}

- (void)optionsMenuProvider
{
  return self->_optionsMenuProvider;
}

- (void)setOptionsMenuProvider:(void *)optionsMenuProvider
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (_UIFindNavigatorHarness)findNavigatorHarness
{
  return self->_findNavigatorHarness;
}

- (void)setFindNavigatorHarness:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findNavigatorHarness, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_optionsMenuProvider, 0);
  objc_storeStrong((id *)&self->_replacementText, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_activeFindSession, 0);
  objc_destroyWeak((id *)&self->_alternateHostView);
  objc_destroyWeak((id *)&self->_view);
}

@end