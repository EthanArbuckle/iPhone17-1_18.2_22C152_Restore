@interface _UIFindNavigatorViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_dismissesKeyboardOnReturn;
- (BOOL)allowsCompactAssistantBar;
- (BOOL)findNavigatorShouldShowReplacementOption:(id)a3;
- (BOOL)hostedInKeyboard;
- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4;
- (UIFindSession)findSession;
- (UIResponder)parentResponder;
- (_UIFindNavigatorView)findNavigatorView;
- (_UIFindNavigatorViewControllerDelegate)findNavigatorViewControllerDelegate;
- (double)preferredHeightForTraitCollection:(id)a3;
- (double)preferredWidthForTraitCollection:(id)a3;
- (id)_configuredSearchOptions;
- (id)keyCommands;
- (id)nextResponder;
- (id)parentFocusEnvironment;
- (id)undoManager;
- (unint64_t)tintTechnique;
- (void)_didEnterReplacementString:(id)a3;
- (void)_didEnterSearchQuery:(id)a3;
- (void)_finishSearchingOnResignIfNecessary;
- (void)_handleDone:(id)a3;
- (void)_handleHighlightPreviousResult:(id)a3;
- (void)_handleInsertNewline:(id)a3;
- (void)_handleSearchReturn:(id)a3;
- (void)_performAutoSearch;
- (void)_performSearchWithQuery:(id)a3 options:(id)a4;
- (void)_recomputeConfiguredSearchOptions;
- (void)_replaceFieldDidChange:(id)a3;
- (void)_searchTextFieldChanged:(id)a3;
- (void)_textViewDidChangeNotification:(id)a3;
- (void)_updateReplaceButtonEnabled;
- (void)_updateResultsCount;
- (void)_updateReturnKeyType;
- (void)_windowDidChangeToFirstResponder:(id)a3;
- (void)buildMenuWithBuilder:(id)a3;
- (void)find:(id)a3;
- (void)findAndReplace:(id)a3;
- (void)findNavigator:(id)a3 didChangeMode:(int64_t)a4;
- (void)findNavigator:(id)a3 didInvokeNextResultInDirection:(int64_t)a4;
- (void)findNavigator:(id)a3 didInvokeReplaceReplacingAll:(BOOL)a4;
- (void)findNavigatorDidInvalidateSearchSession:(id)a3;
- (void)findNext:(id)a3;
- (void)findPrevious:(id)a3;
- (void)loadView;
- (void)resignFirstResponderAndFinishSearching;
- (void)setAssistantBarStyle:(int64_t)a3;
- (void)setFindNavigatorViewControllerDelegate:(id)a3;
- (void)setFindSession:(id)a3;
- (void)setParentResponder:(id)a3;
- (void)setTintTechnique:(unint64_t)a3;
- (void)updateViewForActiveFindSession;
- (void)viewDidLoad;
- (void)viewWillMoveToWindow:(id)a3;
@end

@implementation _UIFindNavigatorViewController

- (_UIFindNavigatorView)findNavigatorView
{
  [(UIViewController *)self loadViewIfNeeded];
  findNavigatorView = self->_findNavigatorView;
  return findNavigatorView;
}

- (void)setFindSession:(id)a3
{
  v5 = (UIFindSession *)a3;
  v12 = v5;
  if (self->_findSession != v5)
  {
    objc_storeStrong((id *)&self->_findSession, a3);
    [(_UIFindNavigatorViewController *)self updateViewForActiveFindSession];
    v5 = v12;
  }
  v6 = [(UIFindSession *)v5 searchText];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    lastSearchOptions = self->_lastSearchOptions;
    if (lastSearchOptions)
    {
      v9 = lastSearchOptions;
    }
    else
    {
      v9 = +[UITextSearchOptions defaultSearchOptions];
    }
    v10 = v9;
    v11 = [(UIFindSession *)v12 searchText];
    [(_UIFindNavigatorViewController *)self _performSearchWithQuery:v11 options:v10];
  }
}

- (void)loadView
{
  v3 = [_UIFindNavigatorView alloc];
  v4 = -[_UIFindNavigatorView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  findNavigatorView = self->_findNavigatorView;
  self->_findNavigatorView = v4;

  [(_UIFindNavigatorView *)self->_findNavigatorView setFindNavigatorDelegate:self];
  v6 = self->_findNavigatorView;
  [(UIInputViewController *)self setView:v6];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)_UIFindNavigatorViewController;
  [(UIInputViewController *)&v12 viewDidLoad];
  [(_UIFindNavigatorViewController *)self setTintTechnique:1];
  v3 = [(_UIFindNavigatorView *)self->_findNavigatorView doneButton];
  [v3 addTarget:self action:sel__handleDone_ forControlEvents:0x2000];

  v4 = [(_UIFindNavigatorView *)self->_findNavigatorView searchTextField];
  [v4 addTarget:self action:sel__handleSearchReturn_ forControlEvents:0x2000];

  v5 = [(_UIFindNavigatorView *)self->_findNavigatorView searchTextField];
  [v5 addTarget:self action:sel__searchTextFieldChanged_ forControlEvents:0x20000];

  v6 = [(_UIFindNavigatorView *)self->_findNavigatorView replaceTextField];
  [v6 addTarget:self action:sel__didEnterReplacementString_ forControlEvents:0x2000];

  uint64_t v7 = [(_UIFindNavigatorView *)self->_findNavigatorView replaceTextField];
  [v7 addTarget:self action:sel__replaceFieldDidChange_ forControlEvents:0x20000];

  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:self selector:sel__textViewDidChangeNotification_ name:@"UITextViewTextDidChangeNotification" object:0];

  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel__windowDidChangeToFirstResponder_ name:@"UIWindowFirstResponderDidChangeNotification" object:0];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45___UIFindNavigatorViewController_viewDidLoad__block_invoke;
  v11[3] = &unk_1E52EEB18;
  v11[4] = self;
  v10 = [(_UIFindNavigatorView *)self->_findNavigatorView settingsButton];
  [v10 _setMenuProvider:v11];
}

- (BOOL)hostedInKeyboard
{
  v2 = [(UIFindSession *)self->_findSession parentInteraction];
  BOOL v3 = [v2 _currentHostingStrategy] == 1;

  return v3;
}

- (void)setAssistantBarStyle:(int64_t)a3
{
  self->_assistantBarStyle = a3;
  -[_UIFindNavigatorView setAssistantBarStyle:](self->_findNavigatorView, "setAssistantBarStyle:");
  [(_UIFindNavigatorViewController *)self setTintTechnique:a3 != 1];
}

- (void)setTintTechnique:(unint64_t)a3
{
  self->_tintTechnique = a3;
  v5 = [(UIFindSession *)self->_findSession searchableResponderAsView];
  if (a3 || !v5)
  {
    if (a3 != 1) {
      goto LABEL_7;
    }
    id v8 = v5;
    uint64_t v6 = +[UIColor labelColor];
  }
  else
  {
    id v8 = v5;
    uint64_t v6 = [v5 tintColor];
  }
  uint64_t v7 = (void *)v6;
  [(UIView *)self->_findNavigatorView setTintColor:v6];

  v5 = v8;
LABEL_7:
}

- (id)nextResponder
{
  if ([(_UIFindNavigatorViewController *)self hostedInKeyboard]
    && (id v3 = objc_loadWeakRetained((id *)&self->_parentResponder), v3, v3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentResponder);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIFindNavigatorViewController;
    WeakRetained = [(UIViewController *)&v6 nextResponder];
  }
  return WeakRetained;
}

- (id)parentFocusEnvironment
{
  if ([(_UIFindNavigatorViewController *)self hostedInKeyboard])
  {
    id v3 = [(UIFindSession *)self->_findSession divergentResponder];
    if (objc_msgSend(v3, "__isKindOfUIView"))
    {
      v4 = _UIFocusEnvironmentSafeCast(v3);

      goto LABEL_6;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)_UIFindNavigatorViewController;
  v4 = [(UIViewController *)&v6 parentFocusEnvironment];
LABEL_6:
  return v4;
}

- (id)undoManager
{
  v2 = [(UIFindSession *)self->_findSession searchableResponder];
  id v3 = [v2 undoManager];

  return v3;
}

- (id)keyCommands
{
  v10[3] = *MEMORY[0x1E4F143B8];
  extraKeyCommands = self->_extraKeyCommands;
  if (!extraKeyCommands)
  {
    v4 = +[UIKeyCommand keyCommandWithInput:@"\r" modifierFlags:0x20000 action:sel__handleHighlightPreviousResult_];
    [v4 setWantsPriorityOverSystemBehavior:1];
    v5 = +[UIKeyCommand keyCommandWithInput:@"\r" modifierFlags:0x80000 action:sel__handleInsertNewline_];
    [v5 setWantsPriorityOverSystemBehavior:1];
    objc_super v6 = +[UIKeyCommand keyCommandWithInput:@"UIKeyInputEscape" modifierFlags:0 action:sel__handleDone_];
    v10[0] = v4;
    v10[1] = v5;
    v10[2] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
    id v8 = self->_extraKeyCommands;
    self->_extraKeyCommands = v7;

    extraKeyCommands = self->_extraKeyCommands;
  }
  return extraKeyCommands;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIFindNavigatorViewController;
  [(UIResponder *)&v7 buildMenuWithBuilder:v4];
  v5 = [v4 system];
  objc_super v6 = +[UIMenuSystem contextSystem];

  if (v5 == v6)
  {
    [v4 removeMenuForIdentifier:@"com.apple.menu.lookup"];
    [v4 removeMenuForIdentifier:@"com.apple.menu.learn"];
    [v4 removeMenuForIdentifier:@"com.apple.menu.share"];
  }
}

- (void)viewWillMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIFindNavigatorViewController;
  -[UIViewController viewWillMoveToWindow:](&v6, sel_viewWillMoveToWindow_);
  if (a3)
  {
    if (+[UIKeyboard usesInputSystemUI])
    {
      v5 = [(_UIFindNavigatorViewController *)self findNavigatorView];
      [v5 becomeFirstResponder];
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)resignFirstResponderAndFinishSearching
{
  id v3 = [(UIResponder *)self->_findNavigatorView firstResponder];
  if (-[UIResponder _containsResponder:](self->_findNavigatorView, "_containsResponder:")) {
    [v3 resignFirstResponder];
  }
}

- (void)_finishSearchingOnResignIfNecessary
{
  [MEMORY[0x1E4F29060] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
  id v7 = [(UIResponder *)self firstResponder];
  id v3 = [(UIResponder *)self _ui_findNavigatorResponder];
  if (v3 && v7)
  {
    id v4 = [(UIResponder *)self _ui_findNavigatorResponder];
    if ([v4 _containsResponder:v7])
    {
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_findNavigatorViewControllerDelegate);
      int v6 = [WeakRetained findNavigatorShouldDismissOnResponderChange:self];

      if (!v6) {
        goto LABEL_8;
      }
      id v3 = objc_loadWeakRetained((id *)&self->_findNavigatorViewControllerDelegate);
      [v3 findNavigatorViewControllerDidRequestDismissal:self];
    }
  }

LABEL_8:
}

- (void)_windowDidChangeToFirstResponder:(id)a3
{
}

- (void)_textViewDidChangeNotification:(id)a3
{
  id v8 = a3;
  findNavigatorView = self->_findNavigatorView;
  v5 = [(UIResponder *)self firstResponder];
  LODWORD(findNavigatorView) = [(UIResponder *)findNavigatorView _containsResponder:v5];

  if (findNavigatorView)
  {
    if (!self->_performingReplacement)
    {
      int v6 = [v8 object];
      id v7 = [(UIFindSession *)self->_findSession searchableResponder];

      if (v6 == v7)
      {
        [(UIFindSession *)self->_findSession invalidateFoundResults];
        [(_UIFindNavigatorViewController *)self _performAutoSearch];
      }
    }
  }
}

- (void)find:(id)a3
{
  id v3 = [(_UIFindNavigatorView *)self->_findNavigatorView searchTextField];
  [v3 becomeFirstResponder];
}

- (void)findAndReplace:(id)a3
{
  if ([(UIFindSession *)self->_findSession supportsReplacement])
  {
    [(_UIFindNavigatorView *)self->_findNavigatorView setMode:1];
    [(UIView *)self->_findNavigatorView layoutIfNeeded];
    id v4 = [(_UIFindNavigatorView *)self->_findNavigatorView replaceTextField];
    [v4 becomeFirstResponder];
  }
}

- (void)findNext:(id)a3
{
}

- (void)findPrevious:(id)a3
{
}

- (BOOL)_dismissesKeyboardOnReturn
{
  v2 = [(UIViewController *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

- (void)_updateReturnKeyType
{
  if ([(_UIFindNavigatorViewController *)self _dismissesKeyboardOnReturn])
  {
    uint64_t v3 = 6;
  }
  else if ([(UIFindSession *)self->_findSession resultCount] <= 0)
  {
    uint64_t v3 = 6;
  }
  else
  {
    uint64_t v3 = 4;
  }
  id v4 = [(_UIFindNavigatorView *)self->_findNavigatorView searchTextField];
  [v4 setReturnKeyType:v3];

  id v5 = [(_UIFindNavigatorView *)self->_findNavigatorView searchTextField];
  [v5 reloadInputViews];
}

- (void)_updateResultsCount
{
  UIFindSessionSearchResultDisplayStyle v3 = [(UIFindSession *)self->_findSession searchResultDisplayStyle];
  int64_t v4 = [(_UIFindNavigatorView *)self->_findNavigatorView mode];
  if (v3 != UIFindSessionSearchResultDisplayStyleNone
    && (int64_t v5 = v4, [(NSString *)self->_lastSearchQuery length])
    && (lastSearchQuery = self->_lastSearchQuery,
        [(UIFindSession *)self->_findSession searchText],
        id v7 = objc_claimAutoreleasedReturnValue(),
        LODWORD(lastSearchQuery) = [(NSString *)lastSearchQuery isEqualToString:v7],
        v7,
        lastSearchQuery))
  {
    NSInteger v8 = [(UIFindSession *)self->_findSession resultCount];
    NSInteger v9 = [(UIFindSession *)self->_findSession highlightedResultIndex];
    if (v3 == UIFindSessionSearchResultDisplayStyleTotal || v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = (void *)MEMORY[0x1E4F28EE0];
      v17 = [NSNumber numberWithInteger:v8];
      id v21 = [v16 localizedStringFromNumber:v17 numberStyle:1];
    }
    else
    {
      uint64_t v20 = v9 + 1;
      if (v5 == 1) {
        _UILocalizedFormat(@"MATCH_OF_MATCHES_ABBREVIATED", @"Indicates which match is currently highlighted, in an abbreviated form.", @"%ld/%ld", v10, v11, v12, v13, v14, v20);
      }
      else {
        _UILocalizedFormat(@"MATCH_OF_MATCHES", @"Indicates which match is currently highlighted.", @"%ld of %ld", v10, v11, v12, v13, v14, v20);
      }
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v21 = 0;
  }
  v18 = [(_UIFindNavigatorView *)self->_findNavigatorView resultCountLabel];
  [v18 setText:v21];

  v19 = [(_UIFindNavigatorView *)self->_findNavigatorView resultCountLabel];
  [v19 sizeToFit];
}

- (void)_updateReplaceButtonEnabled
{
  uint64_t v3 = [(UIFindSession *)self->_findSession resultCount];
  BOOL v4 = [(UIFindSession *)self->_findSession allowsReplacementForCurrentlyHighlightedResult];
  int64_t v5 = [(UIFindSession *)self->_findSession searchText];
  int v6 = [(_UIFindNavigatorView *)self->_findNavigatorView searchTextField];
  id v7 = [v6 text];
  unsigned int v8 = [v5 isEqualToString:v7];

  BOOL v9 = v3 > 0 && v4;
  findNavigatorView = self->_findNavigatorView;
  [(_UIFindNavigatorView *)findNavigatorView setReplaceButtonEnabled:v9 & v8];
}

- (id)_configuredSearchOptions
{
  return [(UIFindSession *)self->_findSession configuredSearchOptions];
}

- (void)_recomputeConfiguredSearchOptions
{
  id v10 = [(UIFindSession *)self->_findSession configuredSearchOptions];
  uint64_t v3 = [(_UIFindNavigatorViewController *)self findNavigatorView];
  int v4 = [v3 matchCase];

  unint64_t v5 = [v10 stringCompareOptions] & 0xFFFFFFFFFFFFFF7ELL;
  uint64_t v6 = 129;
  if (v4) {
    uint64_t v6 = 0;
  }
  [v10 setStringCompareOptions:v5 | v6];
  id v7 = [(_UIFindNavigatorViewController *)self findNavigatorView];
  int v8 = [v7 wholeWords];

  if (v8) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }
  [v10 setWordMatchMethod:v9];
  [(UIFindSession *)self->_findSession setConfiguredSearchOptions:v10];
}

- (void)_handleDone:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_findNavigatorViewControllerDelegate);
  [WeakRetained findNavigatorViewControllerDidRequestDismissal:self];
}

- (void)_handleHighlightPreviousResult:(id)a3
{
}

- (void)_handleSearchReturn:(id)a3
{
  id v5 = a3;
  if ([(_UIFindNavigatorViewController *)self _dismissesKeyboardOnReturn])
  {
    int v4 = [(UIResponder *)self _ui_findNavigatorResponder];
    [v4 becomeFirstResponder];
  }
  else
  {
    [(_UIFindNavigatorViewController *)self _didEnterSearchQuery:v5];
  }
}

- (void)_handleInsertNewline:(id)a3
{
  int v4 = [(_UIFindNavigatorViewController *)self findNavigatorView];
  id v5 = [v4 searchTextField];
  int v6 = [v5 isFirstResponder];

  id v7 = [(_UIFindNavigatorViewController *)self findNavigatorView];
  int v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v7 searchTextField];
LABEL_5:
    id v12 = (id)v9;

    goto LABEL_7;
  }
  id v10 = [v7 replaceTextField];
  int v11 = [v10 isFirstResponder];

  if (v11)
  {
    int v8 = [(_UIFindNavigatorViewController *)self findNavigatorView];
    uint64_t v9 = [v8 replaceTextField];
    goto LABEL_5;
  }
  id v12 = 0;
LABEL_7:
  [v12 insertNewline];
}

- (void)_didEnterSearchQuery:(id)a3
{
  id v5 = [a3 text];
  int v4 = [(_UIFindNavigatorViewController *)self _configuredSearchOptions];
  if ([v5 isEqualToString:self->_lastSearchQuery]
    && [v4 isEqual:self->_lastSearchOptions])
  {
    [(UIFindSession *)self->_findSession highlightNextResultInDirection:0];
  }
  else
  {
    [(_UIFindNavigatorViewController *)self _performSearchWithQuery:v5 options:v4];
  }
}

- (void)_performSearchWithQuery:(id)a3 options:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_lastSearchQuery, a3);
  objc_storeStrong((id *)&self->_lastSearchOptions, a4);
  +[UIFindInteraction _setGlobalFindBuffer:v10];
  uint64_t v8 = [v10 length];
  findSession = self->_findSession;
  if (v8)
  {
    [(UIFindSession *)findSession performSearchWithQuery:v10 options:v7];
    [(UIFindSession *)self->_findSession highlightNextResultInDirection:0];
  }
  else
  {
    [(UIFindSession *)findSession invalidateFoundResults];
  }
}

- (void)_performAutoSearch
{
  [MEMORY[0x1E4F29060] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
  uint64_t v3 = [(_UIFindNavigatorView *)self->_findNavigatorView searchTextField];
  uint64_t v9 = [v3 markedTextRange];

  if (!v9 || (int v4 = [v9 isEmpty], v5 = v9, v4))
  {
    int v6 = [(_UIFindNavigatorView *)self->_findNavigatorView searchTextField];
    id v7 = [v6 text];

    uint64_t v8 = [(_UIFindNavigatorViewController *)self _configuredSearchOptions];
    [(_UIFindNavigatorViewController *)self _performSearchWithQuery:v7 options:v8];

    id v5 = v9;
  }
}

- (void)_searchTextFieldChanged:(id)a3
{
  int v4 = [a3 text];
  uint64_t v5 = [v4 length];

  if (v5) {
    double v6 = 0.35;
  }
  else {
    double v6 = 0.0;
  }
  id v7 = [(_UIFindNavigatorView *)self->_findNavigatorView searchTextField];
  uint64_t v8 = [v7 text];
  [(UIFindSession *)self->_findSession setSearchText:v8];

  [(_UIFindNavigatorViewController *)self performSelector:sel__performAutoSearch withObject:0 afterDelay:v6];
}

- (void)_didEnterReplacementString:(id)a3
{
}

- (void)_replaceFieldDidChange:(id)a3
{
  int v4 = [(_UIFindNavigatorView *)self->_findNavigatorView replaceTextField];
  uint64_t v5 = [v4 text];
  [(UIFindSession *)self->_findSession setReplacementText:v5];

  [(_UIFindNavigatorViewController *)self _updateReplaceButtonEnabled];
}

- (void)updateViewForActiveFindSession
{
  [(_UIFindNavigatorViewController *)self _updateResultsCount];
  [(_UIFindNavigatorViewController *)self _updateReplaceButtonEnabled];
  uint64_t v3 = [(UIFindSession *)self->_findSession searchText];
  int v4 = [(_UIFindNavigatorViewController *)self findNavigatorView];
  uint64_t v5 = [v4 searchTextField];
  [v5 setText:v3];

  id v8 = [(UIFindSession *)self->_findSession replacementText];
  double v6 = [(_UIFindNavigatorViewController *)self findNavigatorView];
  id v7 = [v6 replaceTextField];
  [v7 setText:v8];
}

- (void)findNavigator:(id)a3 didChangeMode:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_findNavigatorViewControllerDelegate);
  [WeakRetained findNavigatorViewControllerViewDidChangeIntrinsicContentSize:self];

  [(_UIFindNavigatorViewController *)self _updateResultsCount];
}

- (void)findNavigator:(id)a3 didInvokeReplaceReplacingAll:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(UIFindSession *)self->_findSession supportsReplacement])
  {
    double v6 = [(_UIFindNavigatorView *)self->_findNavigatorView searchTextField];
    id v7 = [v6 text];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      self->_performingReplacement = 1;
      findSession = self->_findSession;
      if (v4)
      {
        id v10 = [(_UIFindNavigatorView *)self->_findNavigatorView searchTextField];
        int v11 = [v10 text];
        id v12 = [(_UIFindNavigatorView *)self->_findNavigatorView replaceTextField];
        uint64_t v13 = [v12 text];
        uint64_t v14 = [(_UIFindNavigatorViewController *)self _configuredSearchOptions];
        [(UIFindSession *)findSession replaceAllInstancesOfSearchQuery:v11 withReplacementString:v13 options:v14];
      }
      else
      {
        if ([(UIFindSession *)self->_findSession allowsReplacementForCurrentlyHighlightedResult])
        {
          v15 = self->_findSession;
          v16 = [(_UIFindNavigatorView *)self->_findNavigatorView searchTextField];
          v17 = [v16 text];
          v18 = [(_UIFindNavigatorView *)self->_findNavigatorView replaceTextField];
          v19 = [v18 text];
          uint64_t v20 = [(_UIFindNavigatorViewController *)self _configuredSearchOptions];
          [(UIFindSession *)v15 performSingleReplacementWithSearchQuery:v17 replacementString:v19 options:v20];
        }
        [(UIFindSession *)self->_findSession highlightNextResultInDirection:0];
      }
      self->_performingReplacement = 0;
    }
  }
}

- (void)findNavigator:(id)a3 didInvokeNextResultInDirection:(int64_t)a4
{
  if (![(UIFindSession *)self->_findSession resultCount])
  {
    findSession = self->_findSession;
    id v7 = [(_UIFindNavigatorView *)self->_findNavigatorView searchTextField];
    uint64_t v8 = [v7 text];
    uint64_t v9 = [(_UIFindNavigatorViewController *)self _configuredSearchOptions];
    [(UIFindSession *)findSession performSearchWithQuery:v8 options:v9];
  }
  id v10 = self->_findSession;
  [(UIFindSession *)v10 highlightNextResultInDirection:a4];
}

- (void)findNavigatorDidInvalidateSearchSession:(id)a3
{
  id v4 = a3;
  [(_UIFindNavigatorViewController *)self _recomputeConfiguredSearchOptions];
  [(UIFindSession *)self->_findSession invalidateFoundResults];
  id v7 = [v4 searchTextField];

  uint64_t v5 = [v7 text];
  double v6 = [(_UIFindNavigatorViewController *)self _configuredSearchOptions];
  [(_UIFindNavigatorViewController *)self _performSearchWithQuery:v5 options:v6];
}

- (BOOL)findNavigatorShouldShowReplacementOption:(id)a3
{
  return [(UIFindSession *)self->_findSession supportsReplacement];
}

- (BOOL)allowsCompactAssistantBar
{
  return 0;
}

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  return 1;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  id v4 = a3;
  +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:v4];
  double v6 = v5;
  uint64_t v7 = [v4 userInterfaceIdiom];
  uint64_t v8 = [v4 horizontalSizeClass];

  if ((!v7 || v8 == 1) && [(_UIFindNavigatorView *)self->_findNavigatorView mode] == 1) {
    return v6 + v6;
  }
  return v6;
}

- (double)preferredWidthForTraitCollection:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 userInterfaceIdiom] != 1 && objc_msgSend(v4, "userInterfaceIdiom") != 6;
  uint64_t v6 = [v4 horizontalSizeClass];
  double v7 = -1.0;
  if (!v5 && v6 != 1)
  {
    if ([(_UIFindNavigatorView *)self->_findNavigatorView mode] == 1) {
      double v7 = 700.0;
    }
    else {
      double v7 = -1.0;
    }
  }

  return v7;
}

- (UIFindSession)findSession
{
  return self->_findSession;
}

- (_UIFindNavigatorViewControllerDelegate)findNavigatorViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_findNavigatorViewControllerDelegate);
  return (_UIFindNavigatorViewControllerDelegate *)WeakRetained;
}

- (void)setFindNavigatorViewControllerDelegate:(id)a3
{
}

- (UIResponder)parentResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentResponder);
  return (UIResponder *)WeakRetained;
}

- (void)setParentResponder:(id)a3
{
}

- (unint64_t)tintTechnique
{
  return self->_tintTechnique;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentResponder);
  objc_destroyWeak((id *)&self->_findNavigatorViewControllerDelegate);
  objc_storeStrong((id *)&self->_findSession, 0);
  objc_storeStrong((id *)&self->_lastSearchOptions, 0);
  objc_storeStrong((id *)&self->_lastSearchQuery, 0);
  objc_storeStrong((id *)&self->_extraKeyCommands, 0);
  objc_storeStrong((id *)&self->_findNavigatorView, 0);
}

@end