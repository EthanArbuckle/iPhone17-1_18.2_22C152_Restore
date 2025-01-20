@interface UISystemDefaultTextInputAssistantItem
- (BOOL)_isSystemItem;
- (BOOL)canPerformSystemButtonActionForStyle:(int64_t)a3;
- (BOOL)isKeyboardCameraItem;
- (NSArray)defaultSystemLeadingBarButtonGroups;
- (NSArray)defaultSystemTrailingBarButtonGroups;
- (SEL)_responderSelectorForSystemButtonStyle:(int64_t)a3;
- (UISystemDefaultTextInputAssistantItem)init;
- (UISystemDefaultTextInputAssistantItemDelegate)delegate;
- (void)_updateIsSystemItem;
- (void)analyticsDispatchWithActionStyle:(int64_t)a3;
- (void)assistantBold;
- (void)assistantCopy;
- (void)assistantCut;
- (void)assistantDictation;
- (void)assistantDictationMicOn;
- (void)assistantDismiss;
- (void)assistantEmoji;
- (void)assistantExpand;
- (void)assistantItalic;
- (void)assistantPaste:(id)a3 forEvent:(id)a4;
- (void)assistantRedo;
- (void)assistantReturnKey;
- (void)assistantShowKeyboard;
- (void)assistantTextAnimation;
- (void)assistantTextFormatting;
- (void)assistantUnderline;
- (void)assistantUndo;
- (void)assistantWriteboard;
- (void)performSystemButtonActionForStyle:(int64_t)a3;
- (void)setDefaultSystemLeadingBarButtonGroups:(id)a3;
- (void)setDefaultSystemTrailingBarButtonGroups:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLeadingBarButtonGroups:(id)a3;
- (void)setSystemItem:(BOOL)a3;
- (void)setTrailingBarButtonGroups:(id)a3;
@end

@implementation UISystemDefaultTextInputAssistantItem

- (UISystemDefaultTextInputAssistantItem)init
{
  v8.receiver = self;
  v8.super_class = (Class)UISystemDefaultTextInputAssistantItem;
  v2 = [(UITextInputAssistantItem *)&v8 init];
  if (v2)
  {
    if (+[UISystemInputAssistantViewController shouldShowSystemInputAssistantItems])
    {
      uint64_t v3 = +[UIAssistantBarButtonItemProvider defaultSystemLeadingBarButtonGroupsForItem:v2];
      defaultSystemLeadingBarButtonGroups = v2->_defaultSystemLeadingBarButtonGroups;
      v2->_defaultSystemLeadingBarButtonGroups = (NSArray *)v3;

      uint64_t v5 = +[UIAssistantBarButtonItemProvider defaultSystemTrailingBarButtonGroupsForItem:v2];
      defaultSystemTrailingBarButtonGroups = v2->_defaultSystemTrailingBarButtonGroups;
      v2->_defaultSystemTrailingBarButtonGroups = (NSArray *)v5;
    }
    [(UISystemDefaultTextInputAssistantItem *)v2 _updateIsSystemItem];
  }
  return v2;
}

- (void)_updateIsSystemItem
{
  id v6 = [(UISystemDefaultTextInputAssistantItem *)self defaultSystemLeadingBarButtonGroups];
  uint64_t v3 = [(UITextInputAssistantItem *)self leadingBarButtonGroups];
  if (_areBarButtonGroupsBasicallyEqualToSystemDefaults(v6, v3))
  {
    v4 = [(UISystemDefaultTextInputAssistantItem *)self defaultSystemTrailingBarButtonGroups];
    uint64_t v5 = [(UITextInputAssistantItem *)self trailingBarButtonGroups];
    self->_systemItem = _areBarButtonGroupsBasicallyEqualToSystemDefaults(v4, v5);
  }
  else
  {
    self->_systemItem = 0;
  }
}

- (void)setLeadingBarButtonGroups:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UISystemDefaultTextInputAssistantItem;
  [(UITextInputAssistantItem *)&v4 setLeadingBarButtonGroups:a3];
  [(UISystemDefaultTextInputAssistantItem *)self _updateIsSystemItem];
}

- (void)setTrailingBarButtonGroups:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UISystemDefaultTextInputAssistantItem;
  [(UITextInputAssistantItem *)&v4 setTrailingBarButtonGroups:a3];
  [(UISystemDefaultTextInputAssistantItem *)self _updateIsSystemItem];
}

- (void)assistantCut
{
}

- (void)assistantCopy
{
}

- (void)assistantUndo
{
}

- (void)assistantRedo
{
}

- (void)assistantPaste:(id)a3 forEvent:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "_authenticationMessage", a3);
  +[UIPasteboard _attemptAuthenticationWithMessage:v5];

  [(UISystemDefaultTextInputAssistantItem *)self performSystemButtonActionForStyle:2];
}

- (void)assistantBold
{
}

- (void)assistantItalic
{
}

- (void)assistantUnderline
{
}

- (void)assistantTextFormatting
{
}

- (void)assistantEmoji
{
}

- (void)assistantDictation
{
}

- (void)assistantDictationMicOn
{
}

- (void)assistantReturnKey
{
}

- (void)assistantTextAnimation
{
}

- (void)assistantDismiss
{
}

- (void)assistantShowKeyboard
{
}

- (void)assistantWriteboard
{
}

- (void)assistantExpand
{
}

- (SEL)_responderSelectorForSystemButtonStyle:(int64_t)a3
{
  SEL result = 0;
  switch(a3)
  {
    case 0:
      SEL result = sel_cut_;
      break;
    case 1:
      SEL result = sel_copy_;
      break;
    case 2:
      SEL result = sel_paste_;
      break;
    case 5:
      SEL result = sel_toggleBoldface_;
      break;
    case 6:
      SEL result = sel_toggleItalics_;
      break;
    case 7:
      SEL result = sel_toggleUnderline_;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)canPerformSystemButtonActionForStyle:(int64_t)a3
{
  uint64_t v5 = +[UIKeyboardImpl activeInstance];
  id v6 = [v5 delegateAsResponder];
  v7 = [v6 _responderForEditing];

  objc_super v8 = [(UISystemDefaultTextInputAssistantItem *)self _responderSelectorForSystemButtonStyle:a3];
  if (v8) {
    char v9 = [v7 canPerformAction:v8 withSender:0];
  }
  else {
    char v9 = 1;
  }

  return v9;
}

- (void)analyticsDispatchWithActionStyle:(int64_t)a3
{
  if ((unint64_t)a3 <= 4) {
    +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:*off_1E530AB20[a3] trigger:@"UCB"];
  }
}

- (void)performSystemButtonActionForStyle:(int64_t)a3
{
  uint64_t v5 = +[UIKeyboardImpl activeInstance];
  id v6 = v5;
  switch(a3)
  {
    case 9:
      v7 = _getResponderForEditing();
      objc_super v8 = [(UITextInputAssistantItem *)self trailingBarButtonGroups];
      char v9 = [v8 lastObject];
      v10 = -[UIBarButtonItemGroup _items](v9);
      v11 = [v10 firstObject];

      if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && v11) {
        [v7 performSelector:sel__showTextFormattingOptions_ withObject:v11];
      }
      goto LABEL_27;
    case 11:
      [v5 presentEmojiPopoverViaTrigger:@"ucb" completion:0];
      goto LABEL_33;
    case 12:
      v14 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      v15 = [v14 responder];
      v16 = [v15 inputAssistantItem];
      v7 = [v16 _dictationReplacementAction];

      if (v7)
      {
        v11 = [v7 sender];
        [v7 performWithSender:v11 target:0];
      }
      else if (+[UIDictationController isRunning])
      {
        v24 = +[UIDictationController sharedInstance];
        [v24 setReasonType:12];

        v11 = +[UIDictationController sharedInstance];
        [v11 stopDictation];
      }
      else
      {
        v11 = +[UIKeyboardInputModeController sharedInputModeController];
        v25 = +[UIDictationInputModeOptions dictationInputModeOptionsWithInvocationSource:@"UIDictationInputModeInvocationSourceUCBBar"];
        [v11 switchToDictationInputModeWithOptions:v25];
      }
LABEL_27:

      goto LABEL_32;
    case 13:
      v17 = +[UIDictationController sharedInstance];
      [v17 setReasonType:12];

      v7 = +[UIDictationController sharedInstance];
      [v7 stopDictation];
      goto LABEL_32;
    case 14:
      if (![v5 isMinimized]) {
        goto LABEL_33;
      }
      v18 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      [v18 setHideSystemInputAssistantView:1];

      v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      [v7 minimize];
      goto LABEL_32;
    case 15:
      v19 = [v5 delegateAsResponder];
      int v20 = [v19 _suppressSoftwareKeyboard];

      if (v20)
      {
        v7 = [v6 delegateAsResponder];
        [v7 _setSuppressSoftwareKeyboard:0];
        goto LABEL_32;
      }
      if ([v6 isMinimized]) {
        [v6 showKeyboardWithoutSuppressionPolicy];
      }
      goto LABEL_33;
    case 18:
      [v5 lookUpResponderChainForCustomInputView];
      goto LABEL_33;
    case 21:
      [v5 performReturn];
      goto LABEL_33;
    case 22:
      v21 = _getResponderForEditing();
      char v22 = objc_opt_respondsToSelector();

      if (v22)
      {
        v23 = _getResponderForEditing();
        [v23 performSelector:sel__showTextFormattingAnimationOptions_ withObject:0];
      }
      goto LABEL_33;
    default:
      if (![(UISystemDefaultTextInputAssistantItem *)self canPerformSystemButtonActionForStyle:a3])goto LABEL_33; {
      v12 = _getResponderForEditing();
      }
      v7 = v12;
      if (a3 == 4)
      {
        v13 = [v12 undoManager];
        [v13 redo];
        goto LABEL_29;
      }
      if (a3 == 3)
      {
        v13 = [v12 undoManager];
        [v13 undo];
LABEL_29:

        goto LABEL_31;
      }
      v26 = [(UISystemDefaultTextInputAssistantItem *)self _responderSelectorForSystemButtonStyle:a3];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __75__UISystemDefaultTextInputAssistantItem_performSystemButtonActionForStyle___block_invoke;
      v37[3] = &unk_1E52DA070;
      v39 = self;
      v40 = v26;
      id v38 = v7;
      +[UIPasteboard _performAsDataOwnerForAction:v26 responder:v38 block:v37];
      v27 = UIKeyboardGetCurrentInputMode();
      v28 = TIStatisticGetKeyForInputMode();
      TIStatisticScalarIncrement();

LABEL_31:
      +[UIUndoGestureInteraction presentProductivityGestureTutorialInlineWithCompletion:0];
LABEL_32:

LABEL_33:
      if (+[UIKeyboard isKeyboardProcess])
      {
        if (+[UIKeyboard isInputSystemUI]) {
          uint64_t v29 = 1;
        }
        else {
          uint64_t v29 = 12;
        }
      }
      else
      {
        uint64_t v29 = 1;
      }
      v30 = +[UIKeyboardImpl activeInstance];
      v31 = [v30 feedbackGenerator];
      [v31 actionOccurred:v29];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained)
      {
        v33 = WeakRetained;
        id v34 = objc_loadWeakRetained((id *)&self->_delegate);
        char v35 = objc_opt_respondsToSelector();

        if (v35)
        {
          id v36 = objc_loadWeakRetained((id *)&self->_delegate);
          [v36 didPerformSystemButtonActionForStyle:a3];
        }
      }
      [(UISystemDefaultTextInputAssistantItem *)self analyticsDispatchWithActionStyle:a3];

      return;
  }
}

id __75__UISystemDefaultTextInputAssistantItem_performSystemButtonActionForStyle___block_invoke(void *a1)
{
  v2 = (const char *)a1[5];
  v1 = (const char *)a1[6];
  uint64_t v3 = (void *)a1[4];
  if (dyld_program_sdk_at_least())
  {
    objc_super v4 = v3;
    uint64_t v5 = v1;
    id v6 = v2;
  }
  else
  {
    uint64_t v5 = sel_performSelector_withObject_;
    objc_super v4 = v3;
    id v6 = v1;
  }
  return objc_msgSend(v4, v5, v6);
}

- (BOOL)_isSystemItem
{
  return self->_systemItem;
}

- (void)setSystemItem:(BOOL)a3
{
  self->_systemItem = a3;
}

- (UISystemDefaultTextInputAssistantItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UISystemDefaultTextInputAssistantItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isKeyboardCameraItem
{
  return self->_isKeyboardCameraItem;
}

- (NSArray)defaultSystemLeadingBarButtonGroups
{
  return self->_defaultSystemLeadingBarButtonGroups;
}

- (void)setDefaultSystemLeadingBarButtonGroups:(id)a3
{
}

- (NSArray)defaultSystemTrailingBarButtonGroups
{
  return self->_defaultSystemTrailingBarButtonGroups;
}

- (void)setDefaultSystemTrailingBarButtonGroups:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSystemTrailingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_defaultSystemLeadingBarButtonGroups, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end