@interface _UIFindNavigatorResponder
- (BOOL)_alwaysRequireInlineCandidateView;
- (BOOL)_disallowsPresentationOfKeyboardShortcutHUD;
- (BOOL)acceptsInitialEmojiKeyboard;
- (BOOL)canBecomeFirstResponder;
- (BOOL)forceDisableDictation;
- (BOOL)hasText;
- (BOOL)isChangingInputModes;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)firstRectForRange:(id)a3;
- (NSDictionary)markedTextStyle;
- (UITextInputDelegate)inputDelegate;
- (UITextInputTokenizer)tokenizer;
- (UITextPosition)beginningOfDocument;
- (UITextPosition)endOfDocument;
- (UITextRange)markedTextRange;
- (UITextRange)selectedTextRange;
- (_UIFindNavigatorResponder)initWithFindNavigatorViewController:(id)a3;
- (_UIFindNavigatorViewController)findNavigatorViewController;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4;
- (id)closestPositionToPoint:(CGPoint)a3;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)inputAccessoryView;
- (id)inputAccessoryViewController;
- (id)inputDashboardViewController;
- (id)inputView;
- (id)nextFirstResponder;
- (id)nextResponder;
- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4;
- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4;
- (id)selectionRectsForRange:(id)a3;
- (id)textInRange:(id)a3;
- (id)textInputContextIdentifier;
- (id)textInputMode;
- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4;
- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4;
- (int64_t)comparePosition:(id)a3 toPosition:(id)a4;
- (int64_t)keyboardAppearance;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4;
- (unint64_t)hostingTypeForTraitCollection:(id)a3;
- (void)_didPersistFindUI:(id)a3;
- (void)_willPersistFindUI:(id)a3;
- (void)becomeFirstResponderAndFocusFindField;
- (void)setCanBecomeFirstResponder:(BOOL)a3;
- (void)setFindNavigatorViewController:(id)a3;
- (void)setInputDelegate:(id)a3;
- (void)setMarkedTextStyle:(id)a3;
- (void)setSelectedTextRange:(id)a3;
@end

@implementation _UIFindNavigatorResponder

- (_UIFindNavigatorResponder)initWithFindNavigatorViewController:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIFindNavigatorResponder;
  v6 = [(_UIFindNavigatorResponder *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_showsCollapsedInputView = 1;
    v6->_canBecomeFirstResponder = 1;
    objc_storeStrong((id *)&v6->_findNavigatorViewController, a3);
    [(_UIFindNavigatorViewController *)v7->_findNavigatorViewController setParentResponder:v7];
    v8 = [(UIResponder *)v7 inputAssistantItem];
    [v8 _setVisibleWhenMinimized:1];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v7 selector:sel__willPersistFindUI_ name:@"UITextInputWillPersistFindUINotification" object:0];

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__didPersistFindUI_ name:@"UITextInputDidPersistFindUINotification" object:0];
  }
  return v7;
}

- (unint64_t)hostingTypeForTraitCollection:(id)a3
{
  if ([a3 userInterfaceIdiom] != 1) {
    return 1;
  }
  v3 = +[UIKeyboardInputModeController sharedInputModeController];
  v4 = [v3 currentInputMode];

  if ([v4 isEmojiInputMode])
  {
    unint64_t v5 = 1;
  }
  else if ([v4 isHandwritingInputMode])
  {
    unint64_t v5 = 1;
  }
  else
  {
    unint64_t v5 = 2;
  }

  return v5;
}

- (id)nextResponder
{
  v2 = [(_UIFindNavigatorViewController *)self->_findNavigatorViewController findSession];
  v3 = [v2 divergentResponder];

  return v3;
}

- (id)inputView
{
  if (self->_showsCollapsedInputView)
  {
    collapsedInputView = self->_collapsedInputView;
    if (!collapsedInputView)
    {
      v4 = [UIView alloc];
      unint64_t v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v6 = self->_collapsedInputView;
      self->_collapsedInputView = v5;

      collapsedInputView = self->_collapsedInputView;
    }
    v7 = collapsedInputView;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)inputDashboardViewController
{
  v3 = [(UIViewController *)self->_findNavigatorViewController traitCollection];
  unint64_t v4 = [(_UIFindNavigatorResponder *)self hostingTypeForTraitCollection:v3];

  if (v4 == 2) {
    unint64_t v5 = self->_findNavigatorViewController;
  }
  else {
    unint64_t v5 = 0;
  }
  return v5;
}

- (id)inputAccessoryView
{
  return 0;
}

- (id)inputAccessoryViewController
{
  v3 = [(UIViewController *)self->_findNavigatorViewController traitCollection];
  unint64_t v4 = [(_UIFindNavigatorResponder *)self hostingTypeForTraitCollection:v3];

  if (v4 == 1) {
    unint64_t v5 = self->_findNavigatorViewController;
  }
  else {
    unint64_t v5 = 0;
  }
  return v5;
}

- (void)becomeFirstResponderAndFocusFindField
{
  self->_showsCollapsedInputView = 0;
  v3 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66___UIFindNavigatorResponder_becomeFirstResponderAndFocusFindField__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [v3 performBlock:v4];

  [(UIResponder *)self becomeFirstResponder];
}

- (id)nextFirstResponder
{
  v2 = [(_UIFindNavigatorViewController *)self->_findNavigatorViewController findSession];
  v3 = [v2 searchableResponder];

  return v3;
}

- (id)textInputContextIdentifier
{
  return 0;
}

- (id)textInputMode
{
  return 0;
}

- (void)_willPersistFindUI:(id)a3
{
  self->_isChangingInputModes = 1;
}

- (void)_didPersistFindUI:(id)a3
{
  unint64_t v4 = [(_UIFindNavigatorViewController *)self->_findNavigatorViewController findNavigatorView];
  if (self->_isChangingInputModes)
  {
    id v8 = v4;
    unint64_t v5 = [v4 firstResponder];
    int v6 = [v8 _containsResponder:v5];

    unint64_t v4 = v8;
    if (v6)
    {
      v7 = [v8 firstResponder];
      [v7 reloadInputViews];

      unint64_t v4 = v8;
    }
  }
  self->_isChangingInputModes = 0;
}

- (BOOL)_disallowsPresentationOfKeyboardShortcutHUD
{
  return 1;
}

- (BOOL)_alwaysRequireInlineCandidateView
{
  v2 = [(_UIFindNavigatorResponder *)self inputDashboardViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasText
{
  return 0;
}

- (BOOL)forceDisableDictation
{
  return 1;
}

- (BOOL)acceptsInitialEmojiKeyboard
{
  return 1;
}

- (int64_t)keyboardAppearance
{
  v2 = [(_UIFindNavigatorViewController *)self->_findNavigatorViewController findSession];
  BOOL v3 = [v2 searchableResponderAsView];
  unint64_t v4 = [v3 traitCollection];

  if ([v4 userInterfaceStyle] == 2) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = 2 * ([v4 userInterfaceStyle] == 1);
  }

  return v5;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return -1;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  return 0;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  return 0;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  return 0;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (CGRect)firstRectForRange:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  return 0;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  return 0;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  return 0;
}

- (id)selectionRectsForRange:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)textInRange:(id)a3
{
  return 0;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  return self->_canBecomeFirstResponder;
}

- (void)setCanBecomeFirstResponder:(BOOL)a3
{
  self->_canBecomeFirstResponder = a3;
}

- (UITextPosition)beginningOfDocument
{
  return self->beginningOfDocument;
}

- (UITextPosition)endOfDocument
{
  return self->endOfDocument;
}

- (UITextInputDelegate)inputDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->inputDelegate);
  return (UITextInputDelegate *)WeakRetained;
}

- (void)setInputDelegate:(id)a3
{
}

- (UITextRange)markedTextRange
{
  return self->markedTextRange;
}

- (NSDictionary)markedTextStyle
{
  return self->markedTextStyle;
}

- (void)setMarkedTextStyle:(id)a3
{
}

- (UITextRange)selectedTextRange
{
  return (UITextRange *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSelectedTextRange:(id)a3
{
}

- (UITextInputTokenizer)tokenizer
{
  return self->tokenizer;
}

- (_UIFindNavigatorViewController)findNavigatorViewController
{
  return self->_findNavigatorViewController;
}

- (void)setFindNavigatorViewController:(id)a3
{
}

- (BOOL)isChangingInputModes
{
  return self->_isChangingInputModes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findNavigatorViewController, 0);
  objc_storeStrong((id *)&self->tokenizer, 0);
  objc_storeStrong((id *)&self->selectedTextRange, 0);
  objc_storeStrong((id *)&self->markedTextStyle, 0);
  objc_storeStrong((id *)&self->markedTextRange, 0);
  objc_destroyWeak((id *)&self->inputDelegate);
  objc_storeStrong((id *)&self->endOfDocument, 0);
  objc_storeStrong((id *)&self->beginningOfDocument, 0);
  objc_storeStrong((id *)&self->_collapsedInputView, 0);
}

@end