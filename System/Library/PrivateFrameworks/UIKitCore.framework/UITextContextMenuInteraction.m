@interface UITextContextMenuInteraction
- (BOOL)_contextMenuInteraction:(id)a3 shouldAttemptToPresentConfiguration:(id)a4;
- (BOOL)_contextMenuInteraction:(id)a3 shouldBeDelayedByGestureRecognizer:(id)a4;
- (BOOL)_isExternalConfiguration:(id)a3;
- (BOOL)_shouldBridgeMenuControllerItems;
- (BOOL)_textInputIsSecure;
- (BOOL)dismissedByActionSelection;
- (BOOL)dismissedRecently;
- (BOOL)isDisplayingMenu;
- (BOOL)isDisplayingMenuForInputUI;
- (BOOL)isDisplayingMenuForSelectionCommands;
- (CGPoint)locationInTextInputViewForLocationInView:(CGPoint)a3;
- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4;
- (UIContextMenuConfiguration)externallyManagedConfiguration;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIContextMenuInteractionDelegate)externalContextMenuDelegate;
- (UIEditMenuInteraction)editMenuInteraction;
- (UITextContextMenuInteraction)init;
- (id)_contextMenuInteraction:(id)a3 accessoriesForMenuWithConfiguration:(id)a4;
- (id)_contextMenuInteraction:(id)a3 configuration:(id)a4 interactionEffectForTargetedPreview:(id)a5;
- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)_currentInputUIMenuElements;
- (id)_editMenuForCurrentSelectionWithSuggestedActions:(id)a3 isEditMenu:(BOOL)a4;
- (id)_editMenuForSuggestedActions:(id)a3 rvItem:(id)a4 isEditMenu:(BOOL)a5;
- (id)_editMenuInteraction:(id)a3 preferredLayoutRectsForConfiguration:(id)a4;
- (id)_editMenuInteraction:(id)a3 titleViewForMenu:(id)a4 configuration:(id)a5;
- (id)_suggestedActionsForContextMenuInteraction:(id)a3 location:(CGPoint)a4;
- (id)_targetedPreviewForCurrentSelection;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (void)_contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4 completion:(id)a5;
- (void)_contextMenuInteraction:(id)a3 didPerformMenuLeaf:(id)a4 target:(id)a5;
- (void)_defaultContextMenuInteraction:(void *)a3 configurationForMenuAtLocation:(double)a4 completion:(double)a5;
- (void)_didPerformMenuLeaf:(id)a3 target:(id)a4;
- (void)_editMenuInteraction:(id)a3 didPerformMenuLeaf:(id)a4 target:(id)a5;
- (void)_editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5 completionHandler:(id)a6;
- (void)_logDeprecatedMenuControllerUsageIfNeeded;
- (void)_presentEditMenuForInputUI;
- (void)_querySelectionCommandsForConfiguration:(id)a3 suggestedActions:(id)a4 completionHandler:(id)a5;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)didMoveToView:(id)a3;
- (void)dismissMenuForInputUI;
- (void)dismissSelectionCommandsWithReason:(int64_t)a3;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)prepareForContextMenuAtLocationInView:(CGPoint)a3 completion:(id)a4;
- (void)presentMenuForInputUI:(id)a3 preferredArrowDirection:(int64_t)a4;
- (void)presentSelectionCommandsWithConfiguration:(id)a3;
- (void)setExternalContextMenuDelegate:(id)a3;
- (void)updateVisibleMenuPosition;
- (void)willMoveToView:(id)a3;
@end

@implementation UITextContextMenuInteraction

- (BOOL)isDisplayingMenuForSelectionCommands
{
  return self->_currentSelectionCommandsConfiguration
      && [(UITextContextMenuInteraction *)self isDisplayingMenu];
}

- (void)dismissSelectionCommandsWithReason:(int64_t)a3
{
  currentSelectionCommandsConfiguration = self->_currentSelectionCommandsConfiguration;
  v6 = [(UITextContextMenuInteraction *)self contextMenuInteraction];
  if ([v6 _hasVisibleMenu]) {
    BOOL v8 = a3 != 1 && !self->_isPresentingOrDismissingContextMenu;
  }
  else {
    BOOL v8 = 0;
  }

  if (currentSelectionCommandsConfiguration) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = !v8;
  }
  if (!v9)
  {
    v10 = [(UITextContextMenuInteraction *)self editMenuInteraction];
    id v15 = [v10 _selectedMenuLeaf];
    if (v15)
    {
    }
    else
    {
      v11 = [(UITextContextMenuInteraction *)self contextMenuInteraction];
      id v15 = [v11 _selectedMenuLeaf];

      if (!v15)
      {
        id v15 = 0;
        if (!currentSelectionCommandsConfiguration) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
    }
    if (([v15 attributes] & 8) != 0)
    {
LABEL_24:

      return;
    }
    if (!currentSelectionCommandsConfiguration)
    {
LABEL_20:
      if (v8)
      {
        v14 = [(UITextContextMenuInteraction *)self contextMenuInteraction];
        [v14 dismissMenu];
      }
      if (self->_currentInputUIConfiguration) {
        [(UITextContextMenuInteraction *)self _presentEditMenuForInputUI];
      }
      goto LABEL_24;
    }
LABEL_19:
    v12 = [(UITextContextMenuInteraction *)self editMenuInteraction];
    [v12 dismissMenu];

    v13 = self->_currentSelectionCommandsConfiguration;
    self->_currentSelectionCommandsConfiguration = 0;

    goto LABEL_20;
  }
}

- (void)updateVisibleMenuPosition
{
  id v2 = [(UITextContextMenuInteraction *)self editMenuInteraction];
  [v2 updateVisibleMenuPositionAnimated:1];
}

- (void)didMoveToView:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UITextContextMenuInteraction;
  [(UITextInteraction *)&v14 didMoveToView:v4];
  v5 = [(UITextContextMenuInteraction *)self contextMenuInteraction];
  [v4 addInteraction:v5];

  v6 = [(UITextContextMenuInteraction *)self editMenuInteraction];

  if (v4 && v6)
  {
    v7 = [(UITextContextMenuInteraction *)self editMenuInteraction];
    [v4 addInteraction:v7];

    BOOL v8 = [(UITextInteraction *)self assistantDelegate];
    BOOL v9 = [v8 _editMenuAssistant];
    [v9 setMenuInteraction:self];

    v10 = [(UITextContextMenuInteraction *)self contextMenuInteraction];
    [v10 _setProxySender:v4];

    v11 = [(UITextContextMenuInteraction *)self editMenuInteraction];
    [v11 _setProxySender:v4];

    BOOL v12 = [(UITextContextMenuInteraction *)self _shouldBridgeMenuControllerItems];
    v13 = [(UITextContextMenuInteraction *)self editMenuInteraction];
    objc_msgSend(v13, "set_includeMenuControllerItems:", v12);
  }
}

- (UIEditMenuInteraction)editMenuInteraction
{
  return self->_editMenuInteraction;
}

- (void)willMoveToView:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)UITextContextMenuInteraction;
  [(UITextInteraction *)&v13 willMoveToView:a3];
  id v4 = [(UITextContextMenuInteraction *)self contextMenuInteraction];
  v5 = [v4 view];
  v6 = [(UITextContextMenuInteraction *)self contextMenuInteraction];
  [v5 removeInteraction:v6];

  v7 = [(UITextContextMenuInteraction *)self editMenuInteraction];

  if (v7)
  {
    BOOL v8 = [(UITextContextMenuInteraction *)self editMenuInteraction];
    BOOL v9 = [v8 view];
    v10 = [(UITextContextMenuInteraction *)self editMenuInteraction];
    [v9 removeInteraction:v10];

    v11 = [(UITextInteraction *)self assistantDelegate];
    BOOL v12 = [v11 _editMenuAssistant];
    [v12 setMenuInteraction:0];
  }
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (BOOL)_shouldBridgeMenuControllerItems
{
  v3 = [(UITextInteraction *)self _textInput];
  char v4 = objc_opt_respondsToSelector();

  v5 = [(UITextInteraction *)self _textInput];
  v6 = v5;
  if (v4) {
    char v7 = [v5 _implementsEditMenu];
  }
  else {
    char v7 = objc_opt_respondsToSelector();
  }
  char v8 = v7;

  return (v8 & 1) == 0;
}

- (UITextContextMenuInteraction)init
{
  v8.receiver = self;
  v8.super_class = (Class)UITextContextMenuInteraction;
  id v2 = [(UITextInteraction *)&v8 init];
  if (v2)
  {
    v3 = [[UIContextMenuInteraction alloc] initWithDelegate:v2];
    contextMenuInteraction = v2->_contextMenuInteraction;
    v2->_contextMenuInteraction = v3;

    v5 = [[UIEditMenuInteraction alloc] initWithDelegate:v2];
    editMenuInteraction = v2->_editMenuInteraction;
    v2->_editMenuInteraction = v5;

    [(UIEditMenuInteraction *)v2->_editMenuInteraction setPresentsContextMenuAsSecondaryAction:0];
  }
  return v2;
}

- (void)setExternalContextMenuDelegate:(id)a3
{
  v3 = self;
  p_externalContextMenuDelegate = &self->_externalContextMenuDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_externalContextMenuDelegate, v5);
  p_externalDelegateImplements = &v3->_externalDelegateImplements;
  v3->_externalDelegateImplements.highlightPreviewForItem = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.dismissalPreviewForItem = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.willPerformPreviewAction = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.willDisplay = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.willEndForConfiguration = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.previewForHighlighting_DEPR = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.previewForDismissing_DEPR = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.styleForMenu = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.accessoriesForMenu = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.shouldBeDelayedByGestureRecognizer = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.asyncConfigurationForMenuAtLocation = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.overrideSuggestedActions = objc_opt_respondsToSelector() & 1;
  v3->_externalDelegateImplements.shouldAttemptToPresent = objc_opt_respondsToSelector() & 1;
  LOBYTE(v3) = objc_opt_respondsToSelector();

  p_externalDelegateImplements->interactionEffectForTargetedPreview = v3 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externallyManagedConfiguration, 0);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_destroyWeak((id *)&self->_externalContextMenuDelegate);
  objc_storeStrong((id *)&self->_currentSelectionCommandsConfiguration, 0);
  objc_storeStrong((id *)&self->_currentInputUIConfiguration, 0);
}

- (CGPoint)locationInTextInputViewForLocationInView:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(UITextInteraction *)self view];
  char v7 = [(UITextInteraction *)self _textInput];
  objc_super v8 = [v6 superview];
  objc_msgSend(v8, "convertPoint:fromView:", v6, x, y);
  double v10 = v9;
  double v12 = v11;
  objc_super v13 = [v7 textInputView];
  objc_msgSend(v8, "convertPoint:toView:", v13, v10, v12);
  double v15 = v14;
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (void)prepareForContextMenuAtLocationInView:(CGPoint)a3 completion:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  objc_super v8 = [(UITextInteraction *)self assistantDelegate];
  double v9 = [(UITextInteraction *)self view];
  double v10 = [(UITextInteraction *)self _textInput];
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v10 _shouldShowEditMenu] & 1) == 0)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    goto LABEL_32;
  }
  -[UITextContextMenuInteraction locationInTextInputViewForLocationInView:](self, "locationInTextInputViewForLocationInView:", x, y);
  double v12 = v11;
  double v14 = v13;
  int v15 = [v10 conformsToProtocolCached:&unk_1ED700940];
  int v16 = [v10 conformsToProtocolCached:&unk_1ED7009A0];
  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled]&& v15 | v16)
  {
    if (v16)
    {
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __81__UITextContextMenuInteraction_prepareForContextMenuAtLocationInView_completion___block_invoke;
      v37[3] = &unk_1E530A5D0;
      id v38 = v7;
      objc_msgSend(v10, "selectTextForEditMenuWithLocationInView:completionHandler:", v37, v12, v14);
      double v17 = v38;
LABEL_10:

      goto LABEL_32;
    }
    if (v15)
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __81__UITextContextMenuInteraction_prepareForContextMenuAtLocationInView_completion___block_invoke_2;
      v35[3] = &unk_1E530A5D0;
      id v36 = v7;
      objc_msgSend(v10, "selectTextForContextMenuWithLocationInView:completionHandler:", v35, v12, v14);
      double v17 = v36;
      goto LABEL_10;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v10, "prepareSelectionForContextMenuWithLocationInView:completionHandler:", v7, v12, v14);
    goto LABEL_32;
  }
  [v8 setFirstResponderIfNecessary];
  [v8 setSelectionHighlightMode:0];
  double v18 = [v8 activeSelection];
  double v19 = [v18 selectedRange];

  if (v19)
  {
    v20 = [v18 selectedRange];
    int v21 = [v20 isEmpty];

    v22 = objc_msgSend(v10, "closestPositionToPoint:", v12, v14);
    v23 = [v18 selectedRange];
    v24 = [v23 start];
    uint64_t v25 = [v10 comparePosition:v22 toPosition:v24];
    if (v21)
    {
      BOOL v26 = v25 != 0;
    }
    else if (v25 == -1)
    {
      BOOL v26 = 1;
    }
    else
    {
      v34 = [v18 selectedRange];
      v33 = [v34 end];
      BOOL v26 = [v10 comparePosition:v33 toPosition:v22] == -1;
    }
    if ([(UITextContextMenuInteraction *)self _textInputIsSecure])
    {
      if (!v26)
      {
        v27 = 0;
        goto LABEL_29;
      }
      goto LABEL_23;
    }
  }
  else
  {
    if ([(UITextContextMenuInteraction *)self _textInputIsSecure])
    {
LABEL_23:
      [(UITextInteraction *)self _beginSelectionChange];
      goto LABEL_27;
    }
    LOBYTE(v26) = 1;
  }
  v27 = +[UIRevealInteraction revealItemForTextInput:locationInTextInputView:](UIRevealInteraction, "revealItemForTextInput:locationInTextInputView:", v10, v12, v14);
  if (v26)
  {
    [(UITextInteraction *)self _beginSelectionChange];
    if (v27)
    {
      uint64_t v28 = [v27 highlightRange];
      v30 = objc_msgSend(v10, "_textRangeFromNSRange:", v28, v29);
      [v18 setSelectedRange:v30];

LABEL_28:
      [v18 commit];
      [(UITextInteraction *)self _endSelectionChange];
      [v8 notifyKeyboardSelectionChanged];
      goto LABEL_29;
    }
LABEL_27:
    objc_msgSend(v18, "alterSelection:granularity:", 1, v12, v14);
    v27 = 0;
    goto LABEL_28;
  }
LABEL_29:
  v31 = [v18 selectedRange];
  int v32 = [v31 isEmpty];

  if (v32)
  {

    v27 = 0;
  }
  (*((void (**)(id, uint64_t, void *))v7 + 2))(v7, 1, v27);

LABEL_32:
}

void __81__UITextContextMenuInteraction_prepareForContextMenuAtLocationInView_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  createRVItem(a3, a4, a5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__UITextContextMenuInteraction_prepareForContextMenuAtLocationInView_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  createRVItem(a3, a4, a5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_textInputIsSecure
{
  v3 = [(UITextInteraction *)self _textInput];
  if (objc_opt_respondsToSelector())
  {
    char v4 = [(UITextInteraction *)self _textInput];
    char v5 = [v4 isSecureTextEntry];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_logDeprecatedMenuControllerUsageIfNeeded
{
  if (!dyld_program_sdk_at_least()) {
    return;
  }
  id v8 = +[UIMenuController sharedMenuController];
  v3 = [v8 menuItems];
  if (![v3 count])
  {

    goto LABEL_7;
  }
  BOOL v4 = [(UITextContextMenuInteraction *)self _shouldBridgeMenuControllerItems];

  if (!v4) {
    return;
  }
  char v5 = [(UITextInteraction *)self _textInput];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [(UITextInteraction *)self _textInput];
    [v8 _logWarningForMenuControllerUsage];
LABEL_7:

    return;
  }
  id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Text", &_logDeprecatedMenuControllerUsageIfNeeded___s_category) + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Using UIMenuController to add items into text menus is deprecated. Please implement the UITextInput API editMenuForTextRange:suggestedActions: instead.", buf, 2u);
  }
}

- (void)_didPerformMenuLeaf:(id)a3 target:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(UITextInteraction *)self _textInput];
  }
  double v9 = v8;
  if ([v10 attributes] & 8) != 0 && (objc_opt_respondsToSelector()) {
    [v9 willFinishIgnoringCalloutBarFadeAfterPerformingAction];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    +[UIKBAnalyticsDispatcher keyboardAnalyticsDispatchWithSelector:withTrigger:](UIKBAnalyticsDispatcher, "keyboardAnalyticsDispatchWithSelector:withTrigger:", [v10 action], @"EditMenu");
  }
}

- (id)_editMenuForSuggestedActions:(id)a3 rvItem:(id)a4 isEditMenu:(BOOL)a5
{
  BOOL v5 = a5;
  v67[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v54 = a4;
  id v55 = v8;
  v53 = [(UITextInteraction *)self _textInput];
  double v9 = [(UITextInteraction *)self assistantDelegate];
  id v10 = [v9 activeSelection];
  v51 = [v10 selectedRange];

  BOOL v52 = [(UITextContextMenuInteraction *)self _textInputIsSecure];
  if (objc_opt_respondsToSelector())
  {
    double v11 = [v53 editMenuForTextRange:v51 suggestedActions:v55];
    double v12 = v11;
    if (v11)
    {
      double v13 = [v11 children];

      goto LABEL_6;
    }
  }
  else
  {
    double v12 = 0;
  }
  double v13 = v55;
LABEL_6:
  [(UITextContextMenuInteraction *)self _logDeprecatedMenuControllerUsageIfNeeded];
  double v14 = [(UITextInteraction *)self _updatedAccessibilityTextMenuWithMenuElements:v13];
  int v15 = v14;
  if (v14)
  {
    id v16 = v14;

    double v13 = v16;
  }
  if (v54) {
    char v17 = v52;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) == 0)
  {
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x2050000000;
    double v18 = (void *)_MergedGlobals_3_25;
    uint64_t v64 = _MergedGlobals_3_25;
    if (!_MergedGlobals_3_25)
    {
      uint64_t v56 = MEMORY[0x1E4F143A8];
      uint64_t v57 = 3221225472;
      v58 = __getDDRevealBridgeClass_block_invoke;
      v59 = &unk_1E52D9900;
      v60 = &v61;
      __getDDRevealBridgeClass_block_invoke((uint64_t)&v56);
      double v18 = (void *)v62[3];
    }
    id v19 = v18;
    _Block_object_dispose(&v61, 8);
    v49 = [(UITextInteraction *)self view];
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x2020000000;
    v20 = (id *)qword_1EB25CF80;
    uint64_t v64 = qword_1EB25CF80;
    if (!qword_1EB25CF80)
    {
      uint64_t v56 = MEMORY[0x1E4F143A8];
      uint64_t v57 = 3221225472;
      v58 = __getkDataDetectorsSourceRectKeySymbolLoc_block_invoke_0;
      v59 = &unk_1E52D9900;
      v60 = &v61;
      int v21 = DataDetectorsUILibrary_0();
      v22 = dlsym(v21, "kDataDetectorsSourceRectKey");
      *(void *)(v60[1] + 24) = v22;
      qword_1EB25CF80 = *(void *)(v60[1] + 24);
      v20 = (id *)v62[3];
    }
    _Block_object_dispose(&v61, 8);
    if (v20)
    {
      id v48 = *v20;
      id v65 = v48;
      v23 = (void *)MEMORY[0x1E4F29238];
      v50 = [(UITextInteraction *)self assistantDelegate];
      v24 = [v50 _editMenuAssistant];
      [v24 _editMenuTargetRect];
      uint64_t v25 = objc_msgSend(v23, "valueWithCGRect:");
      id v26 = v19;
      v67[0] = v25;
      uint64_t v61 = 0;
      v62 = &v61;
      uint64_t v63 = 0x2020000000;
      v27 = (id *)qword_1EB25CF88;
      uint64_t v64 = qword_1EB25CF88;
      if (!qword_1EB25CF88)
      {
        uint64_t v56 = MEMORY[0x1E4F143A8];
        uint64_t v57 = 3221225472;
        v58 = __getkDDContextNoRoomForSubtitlesKeySymbolLoc_block_invoke;
        v59 = &unk_1E52D9900;
        v60 = &v61;
        uint64_t v28 = DataDetectorsUILibrary_0();
        uint64_t v29 = dlsym(v28, "kDDContextNoRoomForSubtitlesKey");
        *(void *)(v60[1] + 24) = v29;
        qword_1EB25CF88 = *(void *)(v60[1] + 24);
        v27 = (id *)v62[3];
      }
      _Block_object_dispose(&v61, 8);
      if (v27)
      {
        id v66 = *v27;
        v30 = NSNumber;
        id v31 = v66;
        int v32 = [v30 numberWithBool:v5];
        v33 = v26;
        v67[1] = v32;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:&v65 count:2];
        uint64_t v35 = [v33 updatedTextInteractionMenuElements:v13 withRVItem:v54 view:v49 context:v34];

        double v13 = (void *)v35;
        goto LABEL_21;
      }
      v46 = [MEMORY[0x1E4F28B00] currentHandler];
      v47 = [NSString stringWithUTF8String:"NSString *getkDDContextNoRoomForSubtitlesKey(void)"];
      objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, @"UITextContextMenuInteraction.m", 56, @"%s", dlerror());
    }
    else
    {
      v44 = [MEMORY[0x1E4F28B00] currentHandler];
      v45 = [NSString stringWithUTF8String:"NSString *getkDataDetectorsSourceRectKey(void)"];
      objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, @"UITextContextMenuInteraction.m", 55, @"%s", dlerror());
    }
    __break(1u);
  }
LABEL_21:
  id v36 = +[UIKBAutoFillMenus updatedSystemAutoFillMenuWithMenuElements:isSecureTextField:](UIKBAutoFillMenus, "updatedSystemAutoFillMenuWithMenuElements:isSecureTextField:", v13);
  v37 = v36;
  if (v36)
  {
    id v38 = v36;

    double v13 = v38;
  }
  v39 = [(UITextInteraction *)self assistantDelegate];
  v40 = [v39 updatedTextReplacementsMenuWithMenuElements:v13];

  if (v40)
  {
    id v41 = v40;

    double v13 = v41;
  }
  if (v12)
  {
    v42 = [v12 menuByReplacingChildren:v13];
  }
  else
  {
    v42 = +[UIMenu menuWithChildren:v13];
  }

  return v42;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  [v7 handleFailureInMethod:a2 object:self file:@"UITextContextMenuInteraction.m" lineNumber:429 description:@"This method should never be called. We use the async menuForConfiguration:suggestedActions: method instead."];

  return 0;
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = (UIEditMenuConfiguration *)a4;
  id v8 = [(UITextInteraction *)self assistantDelegate];
  double v9 = [v8 _editMenuAssistant];

  if (self->_currentInputUIConfiguration == v7)
  {
    double v14 = +[UIKeyboardImpl activeInstance];
    [v14 overrideEditMenuTargetRectForConfiguration:v7];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    v23 = [(UITextInteraction *)self _textInput];
    v24 = [v23 textInputView];
    uint64_t v25 = [v6 view];
    objc_msgSend(v24, "convertRect:toView:", v25, v16, v18, v20, v22);
    CGFloat v10 = v26;
    CGFloat v11 = v27;
    CGFloat v12 = v28;
    CGFloat v13 = v29;
  }
  else
  {
    CGFloat v10 = *MEMORY[0x1E4F1DB20];
    CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  v48.origin.double x = v10;
  v48.origin.double y = v11;
  v48.size.width = v12;
  v48.size.height = v13;
  if (CGRectIsNull(v48))
  {
    v30 = [v9 _selectionView];
    [v9 _editMenuTargetRect];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    v39 = [v6 view];
    objc_msgSend(v30, "convertRect:toView:", v39, v32, v34, v36, v38);
    CGFloat v10 = v40;
    CGFloat v11 = v41;
    CGFloat v12 = v42;
    CGFloat v13 = v43;
  }
  double v44 = v10;
  double v45 = v11;
  double v46 = v12;
  double v47 = v13;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.double y = v45;
  result.origin.double x = v44;
  return result;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v13 = a5;
  id v6 = [(UITextContextMenuInteraction *)self contextMenuInteraction];
  int v7 = [v6 _hasVisibleMenu];

  if (v7)
  {
    id v8 = [(UITextContextMenuInteraction *)self contextMenuInteraction];
    [v8 dismissMenu];
  }
  double v9 = [(UITextInteraction *)self _textInput];
  if (objc_opt_respondsToSelector())
  {
    [v9 systemWillPresentEditMenuWithAnimator:v13];
  }
  else
  {
    CGFloat v10 = [(UITextInteraction *)self _textInput];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      CGFloat v12 = [(UITextInteraction *)self _textInput];
      [v12 willPresentEditMenuWithAnimator:v13];
    }
  }
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v10 = a5;
  id v6 = [(UITextInteraction *)self _textInput];
  if (objc_opt_respondsToSelector())
  {
    [v6 systemWillDismissEditMenuWithAnimator:v10];
  }
  else
  {
    int v7 = [(UITextInteraction *)self _textInput];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      double v9 = [(UITextInteraction *)self _textInput];
      [v9 willDismissEditMenuWithAnimator:v10];
    }
  }
}

- (id)_editMenuInteraction:(id)a3 titleViewForMenu:(id)a4 configuration:(id)a5
{
  BOOL v5 = objc_msgSend(a5, "identifier", a3, a4);
  id v6 = +[UIKeyboardImpl activeInstance];
  int v7 = [v6 keyboardMenuTipIdentifier];
  int v8 = [v5 isEqual:v7];

  if (v8)
  {
    double v9 = +[UIKeyboardImpl activeInstance];
    id v10 = [v9 editMenuTipView];
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (void)_editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __109__UITextContextMenuInteraction__editMenuInteraction_menuForConfiguration_suggestedActions_completionHandler___block_invoke;
  v11[3] = &unk_1E530A5F8;
  v11[4] = self;
  id v12 = v9;
  id v10 = v9;
  [(UITextContextMenuInteraction *)self _querySelectionCommandsForConfiguration:a4 suggestedActions:a5 completionHandler:v11];
}

void __109__UITextContextMenuInteraction__editMenuInteraction_menuForConfiguration_suggestedActions_completionHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v11 = a2;
  BOOL v5 = [*(id *)(a1 + 32) _currentInputUIMenuElements];
  if ([v5 count]) {
    BOOL v6 = a3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v10 = v11;
  }
  else
  {
    int v7 = [v11 children];
    int v8 = [v5 arrayByAddingObjectsFromArray:v7];
    uint64_t v9 = [v11 menuByReplacingChildren:v8];

    id v10 = (id)v9;
  }
  id v12 = v10;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_editMenuInteraction:(id)a3 didPerformMenuLeaf:(id)a4 target:(id)a5
{
}

- (void)_querySelectionCommandsForConfiguration:(id)a3 suggestedActions:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 identifier];
  char v12 = [v11 isEqual:@"UITextContextMenuInteraction.TextSelectionMenu"];

  id v13 = [(UITextInteraction *)self assistantDelegate];
  double v14 = [v13 _editMenuAssistant];
  double v15 = [v14 overrideMenu];

  if ((v12 & 1) == 0)
  {
    id v18 = +[UIMenu menuWithChildren:MEMORY[0x1E4F1CBF0]];
    goto LABEL_20;
  }
  double v16 = [v15 children];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    id v18 = v15;
    uint64_t v19 = 0;
    if (!v18) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  double v20 = [(UITextInteraction *)self _textInput];
  int v21 = [v20 conformsToProtocolCached:&unk_1ED700940];
  int v22 = [v20 conformsToProtocolCached:&unk_1ED7009A0];
  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled]&& v21 | v22)
  {
    if (v22)
    {
      v23 = objc_opt_new();
      [v23 setFlags:1];
      [v23 setSurroundingGranularity:3];
      [v23 setGranularityCount:1];
      uint64_t v40 = 0;
      double v41 = &v40;
      uint64_t v42 = 0x2050000000;
      v24 = (void *)qword_1EB25CF90;
      uint64_t v43 = qword_1EB25CF90;
      if (!qword_1EB25CF90)
      {
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __getBETextDocumentRequestClass_block_invoke_0;
        v39[3] = &unk_1E52D9900;
        v39[4] = &v40;
        __getBETextDocumentRequestClass_block_invoke_0((uint64_t)v39);
        v24 = (void *)v41[3];
      }
      uint64_t v25 = v24;
      _Block_object_dispose(&v40, 8);
      double v26 = (void *)[[v25 alloc] _initWithUIKitDocumentRequest:v23];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __107__UITextContextMenuInteraction__querySelectionCommandsForConfiguration_suggestedActions_completionHandler___block_invoke;
      v35[3] = &unk_1E530A620;
      void v35[4] = self;
      id v36 = v9;
      id v37 = v10;
      char v38 = 1;
      [v20 requestDocumentContext:v26 completionHandler:v35];

      goto LABEL_16;
    }
    if (v21)
    {
      v23 = objc_opt_new();
      [v23 setFlags:1];
      [v23 setSurroundingGranularity:3];
      [v23 setGranularityCount:1];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __107__UITextContextMenuInteraction__querySelectionCommandsForConfiguration_suggestedActions_completionHandler___block_invoke_2;
      v31[3] = &unk_1E530A648;
      v31[4] = self;
      id v32 = v9;
      id v33 = v10;
      char v34 = 1;
      [v20 requestDocumentContext:v23 completionHandler:v31];

LABEL_16:
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v18 = [(UITextContextMenuInteraction *)self _editMenuForCurrentSelectionWithSuggestedActions:v9 isEditMenu:1];
      goto LABEL_19;
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __107__UITextContextMenuInteraction__querySelectionCommandsForConfiguration_suggestedActions_completionHandler___block_invoke_3;
    v27[3] = &unk_1E530A670;
    v27[4] = self;
    id v28 = v9;
    id v29 = v10;
    char v30 = 1;
    [v20 requestRVItemInSelectedRangeWithCompletionHandler:v27];
  }
  id v18 = 0;
LABEL_19:

LABEL_20:
  uint64_t v19 = 1;
  if (v18) {
LABEL_21:
  }
    (*((void (**)(id, id, uint64_t))v10 + 2))(v10, v18, v19);
LABEL_22:
}

void __107__UITextContextMenuInteraction__querySelectionCommandsForConfiguration_suggestedActions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v8 = [a2 _uikitDocumentContext];
  v3 = [v8 fullText];
  uint64_t v4 = [v8 selectedTextRange];
  BOOL v6 = createRVItem(v3, v4, v5);

  int v7 = [*(id *)(a1 + 32) _editMenuForSuggestedActions:*(void *)(a1 + 40) rvItem:v6 isEditMenu:1];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __107__UITextContextMenuInteraction__querySelectionCommandsForConfiguration_suggestedActions_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 fullText];
  uint64_t v5 = [v3 selectedTextRange];
  uint64_t v7 = v6;

  createRVItem(v4, v5, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = [*(id *)(a1 + 32) _editMenuForSuggestedActions:*(void *)(a1 + 40) rvItem:v9 isEditMenu:1];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __107__UITextContextMenuInteraction__querySelectionCommandsForConfiguration_suggestedActions_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _editMenuForSuggestedActions:*(void *)(a1 + 40) rvItem:a2 isEditMenu:1];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_editMenuForCurrentSelectionWithSuggestedActions:(id)a3 isEditMenu:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if ([(UITextContextMenuInteraction *)self _textInputIsSecure])
  {
    uint64_t v7 = 0;
    goto LABEL_15;
  }
  id v8 = [(UITextInteraction *)self _textInput];
  id v9 = [(UITextInteraction *)self assistantDelegate];
  id v10 = [v9 activeSelection];

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    double v14 = [v8 selectedTextRange];
    double v15 = [v14 start];
    double v16 = [v8 positionFromPosition:v15 offset:-500];
    uint64_t v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [v8 beginningOfDocument];
    }
    uint64_t v19 = v18;

    double v20 = [v14 end];
    int v21 = [v8 positionFromPosition:v20 offset:500];
    int v22 = v21;
    unsigned int v36 = v4;
    char v34 = v14;
    double v35 = v10;
    id v33 = v6;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      id v23 = [v8 endOfDocument];
    }
    v24 = v23;

    uint64_t v25 = [v8 textRangeFromPosition:v19 toPosition:v24];
    id v11 = [v8 textInRange:v25];
    uint64_t v26 = [v8 _selectedNSRange];
    uint64_t v28 = v27;
    id v29 = [v8 beginningOfDocument];
    uint64_t v30 = [v8 offsetFromPosition:v29 toPosition:v19];

    uint64_t v13 = v26 - v30;
    uint64_t v12 = v28;

    uint64_t v4 = v36;
    id v10 = v35;
    id v6 = v33;
    if (v11) {
      goto LABEL_5;
    }
LABEL_13:
    uint64_t v7 = 0;
    goto LABEL_14;
  }
  id v11 = [v8 selectedText];
  uint64_t v12 = [v11 length];
  uint64_t v13 = 0;
  if (!v11) {
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v7 = objc_msgSend(objc_alloc((Class)getRVItemClass()), "initWithText:selectedRange:", v11, v13, v12);
LABEL_14:

LABEL_15:
  double v31 = -[UITextContextMenuInteraction _editMenuForSuggestedActions:rvItem:isEditMenu:](self, "_editMenuForSuggestedActions:rvItem:isEditMenu:", v6, v7, v4, v33);

  return v31;
}

- (id)_currentInputUIMenuElements
{
  currentSelectionCommandsConfiguration = self->_currentSelectionCommandsConfiguration;
  id v3 = +[UIKeyboardImpl activeInstance];
  uint64_t v4 = v3;
  if (currentSelectionCommandsConfiguration) {
    [v3 stopDictationMenuElementsShowingTitle:1];
  }
  else {
  uint64_t v5 = [v3 keyboardMenuElements];
  }

  return v5;
}

- (id)_editMenuInteraction:(id)a3 preferredLayoutRectsForConfiguration:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(UITextInteraction *)self assistantDelegate];
  uint64_t v7 = [v6 _editMenuAssistant];

  id v8 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = objc_msgSend(v7, "_preferredLayoutRectsForEditMenu", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * i) CGRectValue];
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        int v22 = [v7 _selectionView];
        id v23 = [v5 view];
        objc_msgSend(v22, "convertRect:toView:", v23, v15, v17, v19, v21);
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;

        v41.origin.double x = v25;
        v41.origin.double y = v27;
        v41.size.width = v29;
        v41.size.height = v31;
        if (!CGRectIsNull(v41))
        {
          id v32 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v25, v27, v29, v31);
          [v8 addObject:v32];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v11);
  }

  return v8;
}

- (void)presentSelectionCommandsWithConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_currentSelectionCommandsConfiguration, a3);
  id v5 = a3;
  id v6 = [(UITextContextMenuInteraction *)self editMenuInteraction];
  [v6 presentEditMenuWithConfiguration:v5];
}

- (BOOL)dismissedRecently
{
  id v2 = [(UITextContextMenuInteraction *)self editMenuInteraction];
  char v3 = [v2 _dismissedRecently];

  return v3;
}

- (BOOL)isDisplayingMenu
{
  id v2 = [(UITextContextMenuInteraction *)self editMenuInteraction];
  char v3 = [v2 isDisplayingMenu];

  return v3;
}

- (BOOL)dismissedByActionSelection
{
  id v2 = [(UITextContextMenuInteraction *)self editMenuInteraction];
  char v3 = [v2 _dismissedByActionSelection];

  return v3;
}

- (void)presentMenuForInputUI:(id)a3 preferredArrowDirection:(int64_t)a4
{
  if (!self->_currentInputUIConfiguration)
  {
    id v6 = a3;
    if ([(UITextContextMenuInteraction *)self isDisplayingMenu]) {
      [(UITextContextMenuInteraction *)self dismissSelectionCommandsWithReason:0];
    }
    uint64_t v7 = [(UITextInteraction *)self assistantDelegate];
    id v15 = [v7 _editMenuAssistant];

    [v15 _editMenuTargetRect];
    +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", v6, v9 + v8 * 0.5, v11 + v10 * 0.5);
    uint64_t v12 = (UIEditMenuConfiguration *)objc_claimAutoreleasedReturnValue();

    uint64_t v13 = [v15 _editMenuSourceWindow];
    [(UIEditMenuConfiguration *)v12 set_overrideSourceWindow:v13];

    [(UIEditMenuConfiguration *)v12 set_ignoresPassthroughInView:1];
    -[UIEditMenuConfiguration set_prefersMenuPresentationInView:](v12, "set_prefersMenuPresentationInView:", [v15 _editMenuPrefersPresentationInView]);
    [(UIEditMenuConfiguration *)v12 setPreferredArrowDirection:a4];
    currentInputUIConfiguration = self->_currentInputUIConfiguration;
    self->_currentInputUIConfiguration = v12;

    [(UITextContextMenuInteraction *)self _presentEditMenuForInputUI];
  }
}

- (void)dismissMenuForInputUI
{
  currentInputUIConfiguration = self->_currentInputUIConfiguration;
  if (currentInputUIConfiguration)
  {
    self->_currentInputUIConfiguration = 0;

    uint64_t v4 = [(UITextContextMenuInteraction *)self editMenuInteraction];
    [v4 dismissMenu];

    if (self->_currentSelectionCommandsConfiguration)
    {
      id v5 = [(UITextContextMenuInteraction *)self editMenuInteraction];
      [v5 presentEditMenuWithConfiguration:self->_currentSelectionCommandsConfiguration];
    }
  }
}

- (BOOL)isDisplayingMenuForInputUI
{
  return self->_currentInputUIConfiguration
      && [(UITextContextMenuInteraction *)self isDisplayingMenu];
}

- (void)_presentEditMenuForInputUI
{
  if (self->_currentInputUIConfiguration)
  {
    id v3 = [(UITextContextMenuInteraction *)self editMenuInteraction];
    [v3 presentEditMenuWithConfiguration:self->_currentInputUIConfiguration];
  }
}

- (BOOL)_isExternalConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextContextMenuInteraction *)self externallyManagedConfiguration];
  id v6 = v4;
  id v7 = v5;
  double v8 = v7;
  if (v7 == v6)
  {
    char v9 = 1;
  }
  else
  {
    char v9 = 0;
    if (v6 && v7) {
      char v9 = [v6 isEqual:v7];
    }
  }

  return v9;
}

- (id)_targetedPreviewForCurrentSelection
{
  id v3 = [(UITextInteraction *)self assistantDelegate];
  id v4 = [v3 _editMenuAssistant];
  id v5 = [v4 _selectionView];

  id v6 = [v5 window];

  if (v6)
  {
    id v7 = [(UITextInteraction *)self assistantDelegate];
    double v8 = [v7 _editMenuAssistant];
    [v8 _editMenuTargetRect];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    double v17 = [UIView alloc];
    double v18 = -[UIView initWithFrame:](v17, "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v14, v16);
    double v19 = -[UIPreviewTarget initWithContainer:center:]([UIPreviewTarget alloc], "initWithContainer:center:", v5, v10 + v14 * 0.5, v12 + v16 * 0.5);
    double v20 = [UITargetedPreview alloc];
    double v21 = objc_opt_new();
    id v6 = [(UITargetedPreview *)v20 initWithView:v18 parameters:v21 target:v19];
  }
  return v6;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4.x, a4.y);
  [v6 handleFailureInMethod:a2 object:self file:@"UITextContextMenuInteraction.m" lineNumber:800 description:@"This method should never be called. We use the async configurationForMenuAtLocation: method instead."];

  return 0;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(UITextContextMenuInteraction *)self _isExternalConfiguration:v9])
  {
    if (self->_externalDelegateImplements.highlightPreviewForItem)
    {
      double v11 = [(UITextContextMenuInteraction *)self externalContextMenuDelegate];
      uint64_t v12 = [v11 contextMenuInteraction:v8 configuration:v9 highlightPreviewForItemWithIdentifier:v10];
      goto LABEL_6;
    }
    if (self->_externalDelegateImplements.previewForHighlighting_DEPR)
    {
      double v11 = [(UITextContextMenuInteraction *)self externalContextMenuDelegate];
      uint64_t v12 = [v11 contextMenuInteraction:v8 previewForHighlightingMenuWithConfiguration:v9];
LABEL_6:
      double v13 = (void *)v12;

      if (v13) {
        goto LABEL_8;
      }
    }
  }
  double v13 = [(UITextContextMenuInteraction *)self _targetedPreviewForCurrentSelection];
LABEL_8:

  return v13;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(UITextContextMenuInteraction *)self _isExternalConfiguration:v9])
  {
    if (self->_externalDelegateImplements.dismissalPreviewForItem)
    {
      double v11 = [(UITextContextMenuInteraction *)self externalContextMenuDelegate];
      uint64_t v12 = [v11 contextMenuInteraction:v8 configuration:v9 dismissalPreviewForItemWithIdentifier:v10];
      goto LABEL_6;
    }
    if (self->_externalDelegateImplements.previewForDismissing_DEPR)
    {
      double v11 = [(UITextContextMenuInteraction *)self externalContextMenuDelegate];
      uint64_t v12 = [v11 contextMenuInteraction:v8 previewForDismissingMenuWithConfiguration:v9];
LABEL_6:
      double v13 = (void *)v12;

      if (v13) {
        goto LABEL_8;
      }
    }
  }
  double v13 = [(UITextContextMenuInteraction *)self _targetedPreviewForCurrentSelection];
LABEL_8:

  return v13;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (self->_externalDelegateImplements.willPerformPreviewAction
    && [(UITextContextMenuInteraction *)self _isExternalConfiguration:v8])
  {
    id v10 = [(UITextContextMenuInteraction *)self externalContextMenuDelegate];
    [v10 contextMenuInteraction:v11 willPerformPreviewActionForMenuWithConfiguration:v8 animator:v9];
  }
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_externalDelegateImplements.willDisplay
    && [(UITextContextMenuInteraction *)self _isExternalConfiguration:v9])
  {
    id v11 = [(UITextContextMenuInteraction *)self externalContextMenuDelegate];
    [v11 contextMenuInteraction:v8 willDisplayMenuForConfiguration:v9 animator:v10];
  }
  uint64_t v12 = [(UITextContextMenuInteraction *)self editMenuInteraction];
  int v13 = [v12 isDisplayingMenu];

  if (v13)
  {
    if (v10)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __96__UITextContextMenuInteraction_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke;
      v16[3] = &unk_1E52D9F70;
      v16[4] = self;
      [v10 addAnimations:v16];
    }
    else
    {
      double v14 = [(UITextContextMenuInteraction *)self editMenuInteraction];
      [v14 dismissMenu];
    }
  }
  self->_isPresentingOrDismissingContextMenu = 1;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __96__UITextContextMenuInteraction_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke_2;
  v15[3] = &unk_1E52D9F70;
  v15[4] = self;
  [v10 addCompletion:v15];
}

void __96__UITextContextMenuInteraction_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) editMenuInteraction];
  [v1 dismissMenu];
}

uint64_t __96__UITextContextMenuInteraction_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 144) = 0;
  return result;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_externalDelegateImplements.willEndForConfiguration
    && [(UITextContextMenuInteraction *)self _isExternalConfiguration:v9])
  {
    id v11 = [(UITextContextMenuInteraction *)self externalContextMenuDelegate];
    [v11 contextMenuInteraction:v8 willEndForConfiguration:v9 animator:v10];

    if (v10)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __88__UITextContextMenuInteraction_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
      v14[3] = &unk_1E52D9F70;
      v14[4] = self;
      [v10 addAnimations:v14];
    }
    else
    {
      externallyManagedConfiguration = self->_externallyManagedConfiguration;
      self->_externallyManagedConfiguration = 0;
    }
  }
  self->_isPresentingOrDismissingContextMenu = 1;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__UITextContextMenuInteraction_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_2;
  v13[3] = &unk_1E52D9F70;
  v13[4] = self;
  [v10 addCompletion:v13];
}

void __88__UITextContextMenuInteraction_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 176);
  *(void *)(v1 + 176) = 0;
}

uint64_t __88__UITextContextMenuInteraction_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 144) = 0;
  return result;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_externalDelegateImplements.styleForMenu
    && [(UITextContextMenuInteraction *)self _isExternalConfiguration:v7])
  {
    id v8 = [(UITextContextMenuInteraction *)self externalContextMenuDelegate];
    id v9 = [v8 _contextMenuInteraction:v6 styleForMenuWithConfiguration:v7];
  }
  else
  {
    id v9 = +[_UIContextMenuStyle defaultStyle];
    id v8 = [v6 view];
    objc_msgSend(v9, "set_parentTraitEnvironmentForUserInterfaceStyle:", v8);
  }

  return v9;
}

- (id)_contextMenuInteraction:(id)a3 accessoriesForMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_externalDelegateImplements.accessoriesForMenu
    && [(UITextContextMenuInteraction *)self _isExternalConfiguration:v7])
  {
    id v8 = [(UITextContextMenuInteraction *)self externalContextMenuDelegate];
    id v9 = [v8 _contextMenuInteraction:v6 accessoriesForMenuWithConfiguration:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)_contextMenuInteraction:(id)a3 shouldBeDelayedByGestureRecognizer:(id)a4
{
  if (!self->_externalDelegateImplements.shouldBeDelayedByGestureRecognizer) {
    return 0;
  }
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UITextContextMenuInteraction *)self externalContextMenuDelegate];
  char v9 = [v8 _contextMenuInteraction:v7 shouldBeDelayedByGestureRecognizer:v6];

  return v9;
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_externalDelegateImplements.overrideSuggestedActions
    && [(UITextContextMenuInteraction *)self _isExternalConfiguration:v7])
  {
    id v8 = [(UITextContextMenuInteraction *)self externalContextMenuDelegate];
    char v9 = [v8 _contextMenuInteraction:v6 overrideSuggestedActionsForConfiguration:v7];
  }
  else
  {
    char v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (void)_contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4 completion:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__UITextContextMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke;
  aBlock[3] = &unk_1E530A698;
  aBlock[4] = self;
  id v11 = v10;
  id v22 = v11;
  id v12 = v9;
  id v21 = v12;
  double v23 = x;
  double v24 = y;
  int v13 = _Block_copy(aBlock);
  BOOL asyncConfigurationForMenuAtLocation = self->_externalDelegateImplements.asyncConfigurationForMenuAtLocation;
  double v15 = [(UITextContextMenuInteraction *)self externalContextMenuDelegate];
  double v16 = v15;
  if (asyncConfigurationForMenuAtLocation)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __98__UITextContextMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_3;
    v18[3] = &unk_1E530A6C0;
    v18[4] = self;
    id v19 = v13;
    objc_msgSend(v16, "_contextMenuInteraction:configurationForMenuAtLocation:completion:", v12, v18, x, y);
  }
  else
  {

    if (v16)
    {
      double v17 = [(UITextContextMenuInteraction *)self externalContextMenuDelegate];
      double v16 = objc_msgSend(v17, "contextMenuInteraction:configurationForMenuAtLocation:", v12, x, y);

      objc_storeStrong((id *)&self->_externallyManagedConfiguration, v16);
    }
    (*((void (**)(void *, void *))v13 + 2))(v13, v16);
  }
}

void __98__UITextContextMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __98__UITextContextMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_2;
    v9[3] = &unk_1E530A698;
    v9[4] = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    long long v12 = *(_OWORD *)(a1 + 56);
    [a2 _prepareWithCompletion:v9];
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = *(void **)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    double v7 = *(double *)(a1 + 56);
    double v8 = *(double *)(a1 + 64);
    [(UITextContextMenuInteraction *)v4 _defaultContextMenuInteraction:v6 configurationForMenuAtLocation:v7 completion:v8];
  }
}

void __98__UITextContextMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 176), a2);
  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    [(UITextContextMenuInteraction *)*(void **)(a1 + 32) _defaultContextMenuInteraction:*(void **)(a1 + 48) configurationForMenuAtLocation:*(double *)(a1 + 56) completion:*(double *)(a1 + 64)];
  }
}

- (void)_defaultContextMenuInteraction:(void *)a3 configurationForMenuAtLocation:(double)a4 completion:(double)a5
{
  id v9 = a3;
  id v10 = v9;
  if (a1)
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    double v24 = __105__UITextContextMenuInteraction__defaultContextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke;
    double v25 = &unk_1E530A6E8;
    id v26 = v9;
    id v11 = a2;
    long long v12 = &v22;
    if (objc_msgSend(v11, "menuAppearance", v22, v23) == 2)
    {
      if ([v11 _inputPrecision] == 2)
      {
        uint64_t v27 = MEMORY[0x1E4F143A8];
        uint64_t v28 = 3221225472;
        double v29 = __102__UITextContextMenuInteraction__textContextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke;
        double v30 = &unk_1E530A738;
        double v31 = a1;
        id v32 = v11;
        double v34 = a4;
        double v35 = a5;
        id v33 = v12;
        objc_msgSend(a1, "prepareForContextMenuAtLocationInView:completion:", &v27, a4, a5);
      }
      else
      {
        int v13 = [a1 assistantDelegate];
        double v14 = [v13 _editMenuAssistant];
        [v14 _editMenuTargetRect];
        double v17 = v16 + v15 * 0.5;
        double v20 = v19 + v18 * 0.5;

        uint64_t v27 = MEMORY[0x1E4F143A8];
        uint64_t v28 = 3221225472;
        double v29 = __102__UITextContextMenuInteraction__textContextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_3;
        double v30 = &unk_1E530A760;
        double v31 = a1;
        id v32 = v11;
        id v33 = *(id *)&v17;
        double v34 = v20;
        id v21 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:&v27];
        ((void (*)(uint64_t *, void *))v24)(v12, v21);
      }
    }
    else
    {
      ((void (*)(uint64_t *, void))v24)(v12, 0);
    }
  }
}

void __98__UITextContextMenuInteraction__contextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 176), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_contextMenuInteraction:(id)a3 shouldAttemptToPresentConfiguration:(id)a4
{
  if (!self->_externalDelegateImplements.shouldAttemptToPresent) {
    return 1;
  }
  id v6 = a4;
  id v7 = a3;
  double v8 = [(UITextContextMenuInteraction *)self externalContextMenuDelegate];
  char v9 = [v8 _contextMenuInteraction:v7 shouldAttemptToPresentConfiguration:v6];

  return v9;
}

- (id)_contextMenuInteraction:(id)a3 configuration:(id)a4 interactionEffectForTargetedPreview:(id)a5
{
  if (self->_externalDelegateImplements.interactionEffectForTargetedPreview)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id v11 = [(UITextContextMenuInteraction *)self externalContextMenuDelegate];
    long long v12 = [v11 _contextMenuInteraction:v10 configuration:v9 interactionEffectForTargetedPreview:v8];
  }
  else
  {
    long long v12 = 0;
  }
  return v12;
}

- (void)_contextMenuInteraction:(id)a3 didPerformMenuLeaf:(id)a4 target:(id)a5
{
}

uint64_t __105__UITextContextMenuInteraction__defaultContextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __102__UITextContextMenuInteraction__textContextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) assistantDelegate];
  id v7 = [v6 grabberSuppressionAssertion];
  if (!v7)
  {
    id v8 = [v6 activeSelection];
    id v9 = [v8 selectedRange];
    char v10 = [v9 isEmpty];

    if (v10) {
      goto LABEL_5;
    }
    id v7 = [v6 obtainSelectionGrabberSuppressionAssertion];
    [v6 setGrabberSuppressionAssertion:v7];
  }

LABEL_5:
  if (a2)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __102__UITextContextMenuInteraction__textContextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_2;
    v13[3] = &unk_1E530A710;
    id v11 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v11;
    long long v16 = *(_OWORD *)(a1 + 56);
    id v15 = v5;
    long long v12 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v13];
  }
  else
  {
    long long v12 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id __102__UITextContextMenuInteraction__textContextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_2(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_suggestedActionsForContextMenuInteraction:location:", *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64));
  id v3 = [*(id *)(a1 + 32) _editMenuForSuggestedActions:v2 rvItem:*(void *)(a1 + 48) isEditMenu:0];

  return v3;
}

id __102__UITextContextMenuInteraction__textContextMenuInteraction_configurationForMenuAtLocation_completion___block_invoke_3(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_suggestedActionsForContextMenuInteraction:location:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  id v3 = [*(id *)(a1 + 32) _editMenuForCurrentSelectionWithSuggestedActions:v2 isEditMenu:0];

  return v3;
}

- (id)_suggestedActionsForContextMenuInteraction:(id)a3 location:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = [v7 view];
  id v9 = [v7 view];

  char v10 = [(UITextContextMenuInteraction *)self editMenuInteraction];
  id v11 = +[_UIEditMenuProvider menuElementsFromResponderChain:atLocation:inCoordinateSpace:includeMenuControllerItems:](_UIEditMenuProvider, "menuElementsFromResponderChain:atLocation:inCoordinateSpace:includeMenuControllerItems:", v8, v9, [v10 _includeMenuControllerItems], x, y);

  return v11;
}

- (UIContextMenuInteractionDelegate)externalContextMenuDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_externalContextMenuDelegate);
  return (UIContextMenuInteractionDelegate *)WeakRetained;
}

- (UIContextMenuConfiguration)externallyManagedConfiguration
{
  return self->_externallyManagedConfiguration;
}

@end