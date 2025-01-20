@interface _UIKeyboardTextSelectionController
- (BOOL)beginLoupeGestureAtPoint:(CGPoint)a3 translation:(CGPoint)a4;
- (BOOL)cursorPositionIsContainedByRange:(id)a3;
- (BOOL)hasCaretSelection;
- (BOOL)hasRangedSelection;
- (CGPoint)boundedDeltaForTranslation:(CGPoint)a3 cursorLocationBase:(CGPoint)a4;
- (CGRect)caretRectForCursorPosition;
- (CGRect)caretRectForFirstSelectedPosition;
- (CGRect)caretRectForLastSelectedPosition;
- (CGRect)caretRectForLeftmostSelectedPosition;
- (CGRect)caretRectForRightmostSelectedPosition;
- (CGRect)selectedRectInLineWithPoint:(CGPoint)a3;
- (UISelectionInteractionAssistant)selectionInteractionAssistant;
- (UITextInput)inputDelegate;
- (UITextInteractionAssistant)interactionAssistant;
- (UITextPosition)cursorPosition;
- (UITextRange)initialSelection;
- (UITextRange)selectionBase;
- (UITextSelection)selection;
- (UIView)textInputView;
- (_UIKeyboardTextSelectionController)initWithInputDelegate:(id)a3;
- (int64_t)selectionGranularity;
- (void)beginFloatingCursorAtPoint:(CGPoint)a3;
- (void)beginLoupeMagnifierAtPoint:(CGPoint)a3;
- (void)beginRangedMagnifierAtPoint:(CGPoint)a3;
- (void)beginSelection;
- (void)beginSelectionChange;
- (void)beginSelectionWithBaseAtSelectionBoundaryInDirection:(int64_t)a3 initialExtentPoint:(CGPoint)a4 executionContext:(id)a5;
- (void)beginSelectionWithBasePositionAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 withInitialExtentPoint:(CGPoint)a5 executionContext:(id)a6;
- (void)endFloatingCursor;
- (void)endLoupeGestureAtPoint:(CGPoint)a3 translation:(CGPoint)a4;
- (void)endLoupeMagnifierAtPoint:(CGPoint)a3;
- (void)endRangedMagnifierAtPoint:(CGPoint)a3;
- (void)endSelection;
- (void)endSelectionChange;
- (void)modifySelectionWithExtentPoint:(CGPoint)a3 executionContext:(id)a4;
- (void)resetCursorPosition;
- (void)restartSelection;
- (void)scrollSelectionToVisible;
- (void)selectImmediatePositionAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 executionContext:(id)a5;
- (void)selectPositionAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 executionContext:(id)a5;
- (void)selectPositionAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 relativeToSelection:(id)a5 executionContext:(id)a6;
- (void)selectPositionAtPoint:(CGPoint)a3 executionContext:(id)a4;
- (void)selectPositionAtPoint:(CGPoint)a3 granularity:(int64_t)a4 completionHandler:(id)a5;
- (void)selectPositionAtPoint:(CGPoint)a3 granularity:(int64_t)a4 executionContext:(id)a5;
- (void)selectTextWithGranularity:(int64_t)a3 atPoint:(CGPoint)a4 completionHandler:(id)a5;
- (void)selectTextWithGranularity:(int64_t)a3 atPoint:(CGPoint)a4 executionContext:(id)a5;
- (void)selectionDidChange;
- (void)setCaretRectForCursorPosition:(CGRect)a3;
- (void)setCursorPosition:(id)a3;
- (void)setInitialSelection:(id)a3;
- (void)setRangedSelectionShouldShowGrabbers:(BOOL)a3;
- (void)setSelectedTextRange:(id)a3;
- (void)setSelectionBase:(id)a3;
- (void)setSelectionGranularity:(int64_t)a3;
- (void)showSelectionCommands;
- (void)switchToRangedSelection;
- (void)updateFloatingCursorAtPoint:(CGPoint)a3;
- (void)updateGestureRecognizers;
- (void)updateImmediateSelectionWithExtentAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 executionContext:(id)a5;
- (void)updateLoupeGestureAtPoint:(CGPoint)a3 translation:(CGPoint)a4 velocity:(CGPoint)a5;
- (void)updateLoupeMagnifierAtPoint:(CGPoint)a3;
- (void)updateRangedMagnifierAtPoint:(CGPoint)a3;
- (void)updateSelectionRects;
- (void)updateSelectionWithExtentAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 executionContext:(id)a5;
- (void)updateSelectionWithExtentAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 relativeToSelection:(id)a5 executionContext:(id)a6;
- (void)updateSelectionWithExtentPoint:(CGPoint)a3 andExtentPosition:(id)a4 executionContext:(id)a5;
- (void)updateSelectionWithExtentPoint:(CGPoint)a3 executionContext:(id)a4;
- (void)updateSelectionWithExtentPoint:(CGPoint)a3 withBoundary:(int64_t)a4 executionContext:(id)a5;
- (void)updateSelectionWithExtentPosition:(id)a3 executionContext:(id)a4;
- (void)willBeginFloatingCursor:(BOOL)a3;
- (void)willHandoffLoupeMagnifier;
@end

@implementation _UIKeyboardTextSelectionController

- (UITextSelection)selection
{
  v3 = [(UITextSelection *)self->_selection document];
  v4 = [(_UIKeyboardTextSelectionController *)self inputDelegate];

  if (v3 != v4)
  {
    [(UITextSelection *)self->_selection invalidate];
    selection = self->_selection;
    self->_selection = 0;
  }
  v6 = self->_selection;
  if (!v6)
  {
    v7 = [UITextSelection alloc];
    v8 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    v9 = [(UITextSelection *)v7 initWithDocument:v8];
    v10 = self->_selection;
    self->_selection = v9;

    [(UITextSelection *)self->_selection selectionChanged];
    v6 = self->_selection;
  }
  return v6;
}

- (UITextInput)inputDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  return (UITextInput *)WeakRetained;
}

- (_UIKeyboardTextSelectionController)initWithInputDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIKeyboardTextSelectionController;
  v5 = [(_UIKeyboardTextSelectionController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_inputDelegate, v4);
    v6->_hasInteractionAssistant = objc_opt_respondsToSelector() & 1;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_inputDelegate);
    v6->_hasSelectionInteractionAssistant = objc_opt_respondsToSelector() & 1;

    id v9 = objc_loadWeakRetained((id *)&v6->_inputDelegate);
    v6->_hasTextInputView = objc_opt_respondsToSelector() & 1;

    CGSize v10 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v6->_caretRectForCursorPosition.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v6->_caretRectForCursorPosition.size = v10;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inputDelegate);
  objc_storeStrong((id *)&self->_selectionBase, 0);
  objc_storeStrong((id *)&self->_initialSelection, 0);
  objc_storeStrong((id *)&self->_selection, 0);
  objc_storeStrong((id *)&self->_cursorPosition, 0);
}

- (UITextInteractionAssistant)interactionAssistant
{
  if (self->_hasInteractionAssistant)
  {
    v2 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    v3 = [v2 interactionAssistant];
  }
  else
  {
    v3 = 0;
  }
  return (UITextInteractionAssistant *)v3;
}

- (UISelectionInteractionAssistant)selectionInteractionAssistant
{
  if (self->_hasSelectionInteractionAssistant)
  {
    v2 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    v3 = [v2 selectionInteractionAssistant];
  }
  else
  {
    v3 = 0;
  }
  return (UISelectionInteractionAssistant *)v3;
}

- (void)beginSelectionChange
{
  v3 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];

  if (v3)
  {
    id v6 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
    [v6 beginSelectionChange];
  }
  else
  {
    id v6 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    id v4 = [v6 inputDelegate];
    v5 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    [v4 selectionWillChange:v5];
  }
}

- (void)endSelectionChange
{
  v3 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];

  if (v3)
  {
    id v6 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
    [v6 endSelectionChange];
  }
  else
  {
    id v6 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    id v4 = [v6 inputDelegate];
    v5 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    [v4 selectionDidChange:v5];
  }
}

- (UITextPosition)cursorPosition
{
  cursorPosition = self->_cursorPosition;
  if (!cursorPosition)
  {
    id v4 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    v5 = [v4 selectedTextRange];
    id v6 = [v5 start];
    id v7 = self->_cursorPosition;
    self->_cursorPosition = v6;

    cursorPosition = self->_cursorPosition;
  }
  return cursorPosition;
}

- (void)setCursorPosition:(id)a3
{
  v5 = (UITextPosition *)a3;
  if (self->_cursorPosition != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_cursorPosition, a3);
    -[_UIKeyboardTextSelectionController setCaretRectForCursorPosition:](self, "setCaretRectForCursorPosition:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    v5 = v6;
  }
}

- (void)resetCursorPosition
{
}

- (void)setSelectedTextRange:(id)a3
{
  id v4 = a3;
  v5 = [(_UIKeyboardTextSelectionController *)self selection];
  int v6 = [v5 isValid];

  if (v6)
  {
    id v7 = [(_UIKeyboardTextSelectionController *)self selection];
    [v7 setSelectedRange:v4];

    id v9 = [(_UIKeyboardTextSelectionController *)self selection];
    [v9 commit];
  }
  else
  {
    v8 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    [v8 setSelectedTextRange:v4];

    [(_UIKeyboardTextSelectionController *)self updateSelectionRects];
  }
}

- (BOOL)cursorPositionIsContainedByRange:(id)a3
{
  id v4 = a3;
  v5 = [(_UIKeyboardTextSelectionController *)self cursorPosition];

  if (v5)
  {
    int v6 = [v4 start];
    if (!v6
      || ([(_UIKeyboardTextSelectionController *)self inputDelegate],
          id v7 = objc_claimAutoreleasedReturnValue(),
          [(_UIKeyboardTextSelectionController *)self cursorPosition],
          v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v7 comparePosition:v8 toPosition:v6],
          v8,
          v7,
          v9 == -1))
    {
      BOOL v13 = 0;
    }
    else
    {
      CGSize v10 = [v4 end];
      if (v10)
      {
        v11 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
        objc_super v12 = [(_UIKeyboardTextSelectionController *)self cursorPosition];
        BOOL v13 = [v11 comparePosition:v10 toPosition:v12] != -1;
      }
      else
      {
        BOOL v13 = 0;
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (CGRect)selectedRectInLineWithPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v6 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  id v7 = [v6 selectedTextRange];

  v8 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  uint64_t v9 = [v8 selectionRectsForRange:v7];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_msgSend(v15, "rect", (void)v28);
        v34.CGFloat x = x;
        v34.CGFloat y = y;
        if (CGRectContainsPoint(v35, v34))
        {
          [v15 rect];
          double v16 = v20;
          double v17 = v21;
          double v18 = v22;
          double v19 = v23;

          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  double v16 = *MEMORY[0x1E4F1DB20];
  double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v18 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v19 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_11:

  double v24 = v16;
  double v25 = v17;
  double v26 = v18;
  double v27 = v19;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (UIView)textInputView
{
  if (self->_hasTextInputView)
  {
    v2 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    v3 = [v2 textInputView];
  }
  else
  {
    v3 = 0;
  }
  return (UIView *)v3;
}

- (BOOL)hasCaretSelection
{
  v2 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  v3 = [v2 selectedTextRange];
  char v4 = [v3 isEmpty];

  return v4;
}

- (BOOL)hasRangedSelection
{
  v3 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  char v4 = [v3 selectedTextRange];
  if (v4)
  {
    v5 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    int v6 = [v5 selectedTextRange];
    int v7 = [v6 isEmpty] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (CGRect)caretRectForFirstSelectedPosition
{
  v3 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  char v4 = [v3 selectedTextRange];
  v5 = [v4 start];

  if (v5)
  {
    int v6 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    [v6 caretRectForPosition:v5];
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
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)caretRectForLastSelectedPosition
{
  v3 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  char v4 = [v3 selectedTextRange];
  v5 = [v4 end];

  if (v5)
  {
    int v6 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    [v6 caretRectForPosition:v5];
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
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)caretRectForLeftmostSelectedPosition
{
  v3 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  char v4 = [v3 selectedTextRange];

  if (v4
    && ([(_UIKeyboardTextSelectionController *)self inputDelegate],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 positionWithinRange:v4 farthestInDirection:3],
        int v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    double v7 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    [v7 caretRectForPosition:v6];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB20];
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGRect)caretRectForRightmostSelectedPosition
{
  v3 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  char v4 = [v3 selectedTextRange];

  if (v4
    && ([(_UIKeyboardTextSelectionController *)self inputDelegate],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 positionWithinRange:v4 farthestInDirection:2],
        int v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    double v7 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    [v7 caretRectForPosition:v6];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB20];
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGRect)caretRectForCursorPosition
{
  if (CGRectIsNull(self->_caretRectForCursorPosition))
  {
    v3 = [(_UIKeyboardTextSelectionController *)self cursorPosition];
    if (v3)
    {
      char v4 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
      [v4 caretRectForPosition:v3];
      self->_caretRectForCursorPosition.origin.double x = v5;
      self->_caretRectForCursorPosition.origin.double y = v6;
      self->_caretRectForCursorPosition.size.double width = v7;
      self->_caretRectForCursorPosition.size.double height = v8;
    }
  }
  double x = self->_caretRectForCursorPosition.origin.x;
  double y = self->_caretRectForCursorPosition.origin.y;
  double width = self->_caretRectForCursorPosition.size.width;
  double height = self->_caretRectForCursorPosition.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)selectionDidChange
{
  v3 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  char v4 = [v3 selectedTextRange];
  BOOL v5 = [(_UIKeyboardTextSelectionController *)self cursorPositionIsContainedByRange:v4];

  if (!v5) {
    [(_UIKeyboardTextSelectionController *)self resetCursorPosition];
  }
  CGFloat v6 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  CGFloat v7 = [v6 selectedTextRange];
  int v8 = [v7 isEmpty];

  if (v8) {
    [(_UIKeyboardTextSelectionController *)self setSelectionGranularity:0];
  }
  uint64_t v9 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  if (v9)
  {
    double v10 = (void *)v9;
    double v11 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    double v12 = [v11 selectedTextRange];
    int v13 = [v12 isEmpty];

    if (v13)
    {
      id v14 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
      [v14 setGrabberSuppressionAssertion:0];
    }
  }
}

- (void)showSelectionCommands
{
  v3 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  char v4 = [v3 selectedTextRange];
  char v5 = [v4 isEmpty];

  if ((v5 & 1) == 0)
  {
    id v7 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
    CGFloat v6 = [v7 _editMenuAssistant];
    [v6 showSelectionCommands];
  }
}

- (void)updateSelectionRects
{
  id v2 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  [v2 setNeedsSelectionDisplayUpdate];
}

- (void)switchToRangedSelection
{
  v3 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  [v3 setSelectionHighlightMode:0];

  [(_UIKeyboardTextSelectionController *)self updateSelectionRects];
}

- (void)setRangedSelectionShouldShowGrabbers:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  CGFloat v6 = [v5 activeSelection];
  int v7 = [v6 isValid];

  if (v7)
  {
    int v8 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
    [v8 setSelectionDisplayVisible:1];

    uint64_t v9 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
    [v9 activateSelection];

    id v11 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
    [v11 setSelectionHighlightMode:!v3];
  }
  else
  {
    double v10 = [(_UIKeyboardTextSelectionController *)self selectionInteractionAssistant];
    id v11 = v10;
    if (v3) {
      [v10 configureForSelectionMode];
    }
    else {
      [v10 configureForHighlightMode];
    }
  }
}

- (void)willHandoffLoupeMagnifier
{
  id v2 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  [v2 setWillHandoffLoupeMagnifier];
}

- (void)updateGestureRecognizers
{
  id v2 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  [v2 setGestureRecognizers];
}

- (void)scrollSelectionToVisible
{
  BOOL v3 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];

  if (v3) {
    [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  }
  else {
  id v4 = [(_UIKeyboardTextSelectionController *)self selectionInteractionAssistant];
  }
  [v4 scrollSelectionToVisible:0];
}

- (void)willBeginFloatingCursor:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  [v4 willBeginFloatingCursor:v3];
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  CGFloat v6 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    objc_msgSend(v8, "beginFloatingCursorAtPoint:", x, y);
  }
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  CGFloat v6 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    objc_msgSend(v8, "updateFloatingCursorAtPoint:", x, y);
  }
}

- (void)endFloatingCursor
{
  BOOL v3 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    [v5 endFloatingCursor];
  }
}

- (void)beginLoupeMagnifierAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  objc_msgSend(v5, "loupeMagnifierWithState:atPoint:", 1, x, y);
}

- (void)updateLoupeMagnifierAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  objc_msgSend(v5, "loupeMagnifierWithState:atPoint:", 2, x, y);
}

- (void)endLoupeMagnifierAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  objc_msgSend(v5, "loupeMagnifierWithState:atPoint:", 3, x, y);
}

- (void)beginRangedMagnifierAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  CGFloat v6 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];

  if (v6) {
    [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  }
  else {
  id v7 = [(_UIKeyboardTextSelectionController *)self selectionInteractionAssistant];
  }
  objc_msgSend(v7, "rangedMagnifierWithState:atPoint:", 1, x, y);
}

- (void)updateRangedMagnifierAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  CGFloat v6 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];

  if (v6) {
    [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  }
  else {
  id v7 = [(_UIKeyboardTextSelectionController *)self selectionInteractionAssistant];
  }
  objc_msgSend(v7, "rangedMagnifierWithState:atPoint:", 2, x, y);
}

- (void)endRangedMagnifierAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  CGFloat v6 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];

  if (v6) {
    [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  }
  else {
  id v7 = [(_UIKeyboardTextSelectionController *)self selectionInteractionAssistant];
  }
  objc_msgSend(v7, "rangedMagnifierWithState:atPoint:", 3, x, y);
}

- (BOOL)beginLoupeGestureAtPoint:(CGPoint)a3 translation:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v6 = a3.y;
  CGFloat v7 = a3.x;
  BOOL v12 = 0;
  id v8 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75___UIKeyboardTextSelectionController_beginLoupeGestureAtPoint_translation___block_invoke;
  v11[3] = &__block_descriptor_48_e16__CGPoint_dd_8__0l;
  *(CGFloat *)&v11[4] = v7;
  *(CGFloat *)&v11[5] = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75___UIKeyboardTextSelectionController_beginLoupeGestureAtPoint_translation___block_invoke_2;
  v10[3] = &__block_descriptor_48_e16__CGPoint_dd_8__0l;
  *(CGFloat *)&v10[4] = x;
  *(CGFloat *)&v10[5] = y;
  [v8 loupeGestureWithState:1 location:v11 translation:v10 velocity:&__block_literal_global_387 modifierFlags:0 shouldCancel:&v12];

  return v12;
}

- (void)updateLoupeGestureAtPoint:(CGPoint)a3 translation:(CGPoint)a4 velocity:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat v7 = a4.y;
  CGFloat v8 = a4.x;
  CGFloat v9 = a3.y;
  CGFloat v10 = a3.x;
  id v11 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85___UIKeyboardTextSelectionController_updateLoupeGestureAtPoint_translation_velocity___block_invoke;
  v14[3] = &__block_descriptor_48_e16__CGPoint_dd_8__0l;
  *(CGFloat *)&v14[4] = v10;
  *(CGFloat *)&v14[5] = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85___UIKeyboardTextSelectionController_updateLoupeGestureAtPoint_translation_velocity___block_invoke_2;
  v13[3] = &__block_descriptor_48_e16__CGPoint_dd_8__0l;
  *(CGFloat *)&v13[4] = v8;
  *(CGFloat *)&v13[5] = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85___UIKeyboardTextSelectionController_updateLoupeGestureAtPoint_translation_velocity___block_invoke_3;
  v12[3] = &__block_descriptor_48_e16__CGPoint_dd_8__0l;
  *(CGFloat *)&v12[4] = x;
  *(CGFloat *)&v12[5] = y;
  [v11 loupeGestureWithState:2 location:v14 translation:v13 velocity:v12 modifierFlags:0 shouldCancel:0];
}

- (void)endLoupeGestureAtPoint:(CGPoint)a3 translation:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v6 = a3.y;
  CGFloat v7 = a3.x;
  CGFloat v8 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73___UIKeyboardTextSelectionController_endLoupeGestureAtPoint_translation___block_invoke;
  v10[3] = &__block_descriptor_48_e16__CGPoint_dd_8__0l;
  *(CGFloat *)&v10[4] = v7;
  *(CGFloat *)&v10[5] = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73___UIKeyboardTextSelectionController_endLoupeGestureAtPoint_translation___block_invoke_2;
  v9[3] = &__block_descriptor_48_e16__CGPoint_dd_8__0l;
  *(CGFloat *)&v9[4] = x;
  *(CGFloat *)&v9[5] = y;
  [v8 loupeGestureWithState:3 location:v10 translation:v9 velocity:&__block_literal_global_14_6 modifierFlags:0 shouldCancel:0];
}

- (CGPoint)boundedDeltaForTranslation:(CGPoint)a3 cursorLocationBase:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  CGFloat v9 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  CGFloat v10 = [v9 activeSelection];
  int v11 = [v10 isValid];

  if (v11)
  {
    if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
    {
      BOOL v12 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
      objc_msgSend(v12, "boundedDeltaForTranslation:cursorLocationBase:", v7, v6, x, y);
      double v14 = v13;
      double v16 = v15;
    }
    else
    {
      double v17 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
      double v18 = [v17 _legacySelectionView];
      double v19 = [(_UIKeyboardTextSelectionController *)self textInputView];
      objc_msgSend(v18, "convertPoint:fromView:", v19, v7 + x, v6 + y);
      double v21 = v20;
      double v23 = v22;

      double v24 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
      double v25 = [v24 _legacySelectionView];
      objc_msgSend(v25, "floatingCursorPositionForPoint:lineSnapping:", 0, v21, v23);
      double v27 = v26;
      double v29 = v28;

      double v14 = v27 - v21;
      double v16 = v29 - v23;
    }
  }
  else
  {
    double v14 = *MEMORY[0x1E4F1DAD8];
    double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v30 = v14;
  double v31 = v16;
  result.double y = v31;
  result.double x = v30;
  return result;
}

- (void)beginSelection
{
  BOOL v3 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  char v4 = [v3 selectedTextRange];
  [(_UIKeyboardTextSelectionController *)self setInitialSelection:v4];

  id v5 = [(_UIKeyboardTextSelectionController *)self initialSelection];
  [(_UIKeyboardTextSelectionController *)self setSelectionBase:v5];

  [(_UIKeyboardTextSelectionController *)self beginSelectionChange];
}

- (void)restartSelection
{
  BOOL v3 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  char v4 = [v3 selectedTextRange];
  [(_UIKeyboardTextSelectionController *)self setInitialSelection:v4];

  id v5 = [(_UIKeyboardTextSelectionController *)self initialSelection];
  [(_UIKeyboardTextSelectionController *)self setSelectionBase:v5];
}

- (void)selectPositionAtPoint:(CGPoint)a3 executionContext:(id)a4
{
}

- (void)selectPositionAtPoint:(CGPoint)a3 granularity:(int64_t)a4 executionContext:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89___UIKeyboardTextSelectionController_selectPositionAtPoint_granularity_executionContext___block_invoke;
  v11[3] = &unk_1E52D9F70;
  id v12 = v9;
  id v10 = v9;
  -[_UIKeyboardTextSelectionController selectPositionAtPoint:granularity:completionHandler:](self, "selectPositionAtPoint:granularity:completionHandler:", a4, v11, x, y);
}

- (void)selectPositionAtPoint:(CGPoint)a3 granularity:(int64_t)a4 completionHandler:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  double v30 = (void (**)(void))a5;
  id v9 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  id v10 = objc_msgSend(v9, "closestPositionToPoint:", x, y);

  int v11 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  id v12 = [v11 markedTextRange];

  if (v12)
  {
    double v13 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    double v14 = [v12 start];
    uint64_t v15 = [v13 comparePosition:v10 toPosition:v14];

    if (v15 == -1)
    {
      uint64_t v19 = [v12 start];
    }
    else
    {
      double v16 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
      double v17 = [v12 end];
      uint64_t v18 = [v16 comparePosition:v17 toPosition:v10];

      if (v18 != -1) {
        goto LABEL_7;
      }
      uint64_t v19 = [v12 end];
    }
    double v20 = (void *)v19;

    id v10 = v20;
  }
LABEL_7:
  double v21 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  double v22 = [v21 _findBoundaryPositionClosestToPosition:v10 withGranularity:a4];

  if (v22)
  {
    double v23 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    double v24 = [v23 textRangeFromPosition:v22 toPosition:v22];

    if (v24)
    {
      [(_UIKeyboardTextSelectionController *)self setSelectedTextRange:v24];
      [(_UIKeyboardTextSelectionController *)self setCursorPosition:v22];
      [(_UIKeyboardTextSelectionController *)self setSelectionGranularity:a4];
      [(_UIKeyboardTextSelectionController *)self scrollSelectionToVisible];
      if (v12)
      {
        double v25 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
        double v26 = [v25 inputDelegate];
        char v27 = objc_opt_respondsToSelector();

        if (v27)
        {
          double v28 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
          double v29 = [v28 inputDelegate];
          [v29 didChangePhraseBoundary];
        }
      }
    }
  }
  else
  {
    double v24 = 0;
  }
  if (v30) {
    v30[2]();
  }
}

- (void)selectPositionAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 executionContext:(id)a5
{
  id v8 = a5;
  id v9 = [(_UIKeyboardTextSelectionController *)self initialSelection];
  [(_UIKeyboardTextSelectionController *)self selectPositionAtBoundary:a3 inDirection:a4 relativeToSelection:v9 executionContext:v8];
}

- (void)selectImmediatePositionAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 executionContext:(id)a5
{
  id v8 = a5;
  id v10 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  id v9 = [v10 selectedTextRange];
  [(_UIKeyboardTextSelectionController *)self selectPositionAtBoundary:a3 inDirection:a4 relativeToSelection:v9 executionContext:v8];
}

- (void)selectPositionAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 relativeToSelection:(id)a5 executionContext:(id)a6
{
  id v18 = a6;
  id v10 = a5;
  int v11 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  id v12 = [v11 _positionWithinRange:v10 farthestInDirection:a4];

  if (v12)
  {
    double v13 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    double v14 = [v13 _positionFromPosition:v12 pastTextUnit:a3 inDirection:a4];

    if (v14)
    {
      uint64_t v15 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
      double v16 = [v15 textRangeFromPosition:v14 toPosition:v14];

      if (v16)
      {
        double v17 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
        [v17 setSelectedTextRange:v16];

        [(_UIKeyboardTextSelectionController *)self setCursorPosition:v14];
        [(_UIKeyboardTextSelectionController *)self setSelectionGranularity:0];
        [(_UIKeyboardTextSelectionController *)self scrollSelectionToVisible];
      }
    }
  }
  else
  {
    double v14 = 0;
  }
  [v18 returnExecutionToParent];
}

- (void)selectTextWithGranularity:(int64_t)a3 atPoint:(CGPoint)a4 executionContext:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  int v11 = [v10 selectedTextRange];

  if ([(_UIKeyboardTextSelectionController *)self selectionGranularity] == a3 && v11)
  {
    id v12 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    double v13 = [v12 selectionRectsForRange:v11];

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v47;
      while (2)
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v47 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * v18), "rect", (void)v46);
          v52.double x = x;
          v52.double y = y;
          if (CGRectContainsPoint(v53, v52))
          {
            double v20 = v14;
            goto LABEL_33;
          }
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
  }
  uint64_t v19 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  double v20 = objc_msgSend(v19, "closestPositionToPoint:", x, y);

  if (v20)
  {
    double v21 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    id v14 = [v21 _rangeSpanningTextUnit:a3 andPosition:v20];

    if (a3 == 1 && v14)
    {
      double v23 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
      [v23 caretRectForPosition:v20];
      double v25 = v24;

      double v26 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
      [v26 firstRectForRange:v14];
      double v28 = v27;

      double v22 = v28 - v25;
      if (v28 - v25 <= 1.0) {
        goto LABEL_19;
      }
      double v29 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
      uint64_t v30 = [v29 positionFromPosition:v20 offset:-1];

      if (!v30)
      {
        double v20 = 0;
LABEL_33:

        goto LABEL_34;
      }
      double v31 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
      uint64_t v32 = [v31 _rangeSpanningTextUnit:1 andPosition:v30];

      double v20 = (void *)v30;
      id v14 = (id)v32;
    }
    if (v14)
    {
LABEL_19:
      uint64_t v33 = objc_msgSend(v14, "end", v22);
      CGPoint v34 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
      int v35 = [v34 _characterInRelationToPosition:v33 amount:0xFFFFFFFFLL];

      if (v35 == 10)
      {
        do
        {
          v36 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
          v37 = [v36 positionFromPosition:v33 offset:-1];

          v38 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
          LODWORD(v36) = [v38 _characterInRelationToPosition:v37 amount:0xFFFFFFFFLL];

          uint64_t v33 = v37;
        }
        while (v36 == 10);
        if (!v37)
        {
LABEL_29:
          if (a3 == 1 && [v11 isEmpty])
          {
            v44 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
            uint64_t v45 = [v44 _rangeOfSmartSelectionIncludingRange:v14];

            id v14 = (id)v45;
          }
          [(_UIKeyboardTextSelectionController *)self setSelectedTextRange:v14];
          [(_UIKeyboardTextSelectionController *)self setCursorPosition:v20];
          [(_UIKeyboardTextSelectionController *)self setSelectionGranularity:a3];
          [(_UIKeyboardTextSelectionController *)self scrollSelectionToVisible];

          goto LABEL_33;
        }
      }
      else
      {
        v37 = v33;
        if (!v33) {
          goto LABEL_29;
        }
      }
      v39 = [v14 end];

      if (v37 != v39)
      {
        v40 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
        v41 = [v14 start];
        v42 = [v40 textRangeFromPosition:v41 toPosition:v37];

        if (v42)
        {
          id v43 = v42;

          id v14 = v43;
        }
      }
      goto LABEL_29;
    }
  }
LABEL_34:
  [v9 returnExecutionToParent];
}

- (void)selectTextWithGranularity:(int64_t)a3 atPoint:(CGPoint)a4 completionHandler:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a5;
  -[_UIKeyboardTextSelectionController selectTextWithGranularity:atPoint:executionContext:](self, "selectTextWithGranularity:atPoint:executionContext:", a3, 0, x, y);
  id v9 = v10;
  if (v10)
  {
    (*((void (**)(id))v10 + 2))(v10);
    id v9 = v10;
  }
}

- (void)beginSelectionWithBaseAtSelectionBoundaryInDirection:(int64_t)a3 initialExtentPoint:(CGPoint)a4 executionContext:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v18 = a5;
  [(_UIKeyboardTextSelectionController *)self beginSelection];
  id v9 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  id v10 = [v9 selectedTextRange];

  if (([v10 isEmpty] & 1) == 0)
  {
    if (v10)
    {
      int v11 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
      id v12 = [v11 positionWithinRange:v10 farthestInDirection:a3];

      if (v12)
      {
        double v13 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
        id v14 = v13;
        if ((unint64_t)(a3 - 2) <= 3) {
          a3 = qword_186B9AE08[a3 - 2];
        }
        uint64_t v15 = [v13 characterRangeByExtendingPosition:v12 inDirection:a3];
        if (v15)
        {
          uint64_t v16 = (void *)v15;

LABEL_10:
          [(_UIKeyboardTextSelectionController *)self setSelectionBase:v16];

          goto LABEL_11;
        }
        uint64_t v17 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
        uint64_t v16 = [v17 textRangeFromPosition:v12 toPosition:v12];

        if (v16) {
          goto LABEL_10;
        }
      }
    }
    else
    {
      id v12 = 0;
    }
LABEL_11:
  }
  -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:executionContext:](self, "updateSelectionWithExtentPoint:executionContext:", v18, x, y);
}

- (void)beginSelectionWithBasePositionAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 withInitialExtentPoint:(CGPoint)a5 executionContext:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  id v26 = a6;
  [(_UIKeyboardTextSelectionController *)self beginSelection];
  int v11 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  id v12 = objc_msgSend(v11, "closestPositionToPoint:", x, y);

  if (v12)
  {
    double v13 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    uint64_t v14 = [v13 _positionFromPosition:v12 pastTextUnit:a3 inDirection:a4];
    uint64_t v15 = (void *)v14;
    if (v14) {
      uint64_t v16 = (void *)v14;
    }
    else {
      uint64_t v16 = v12;
    }
    id v17 = v16;

    id v18 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    uint64_t v19 = [v18 textRangeFromPosition:v17 toPosition:v17];

    if (v19) {
      [(_UIKeyboardTextSelectionController *)self setSelectionBase:v19];
    }
    double v20 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    double v21 = v20;
    if (a4)
    {
      id v22 = v17;
      id v23 = v12;
    }
    else
    {
      id v22 = v12;
      id v23 = v17;
    }
    double v24 = [v20 textRangeFromPosition:v22 toPosition:v23];

    if (v24)
    {
      double v25 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
      [v25 setSelectedTextRange:v24];

      [(_UIKeyboardTextSelectionController *)self setCursorPosition:v12];
      [(_UIKeyboardTextSelectionController *)self setSelectionGranularity:a3];
    }
  }
  [v26 returnExecutionToParent];
}

- (void)updateSelectionWithExtentPosition:(id)a3 executionContext:(id)a4
{
}

- (void)updateSelectionWithExtentPoint:(CGPoint)a3 andExtentPosition:(id)a4 executionContext:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v24 = a4;
  id v9 = a5;
  id v10 = [(_UIKeyboardTextSelectionController *)self selectionBase];
  int v11 = [v10 start];

  id v12 = [(_UIKeyboardTextSelectionController *)self selectionBase];
  double v13 = [v12 end];

  if (!v24 || !v11 || !v13) {
    goto LABEL_14;
  }
  uint64_t v14 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  uint64_t v15 = [v14 comparePosition:v13 toPosition:v24];

  if (v15 == -1)
  {
    id v18 = v13;
    double v13 = v24;
    id v19 = v11;
  }
  else
  {
    uint64_t v16 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    uint64_t v17 = [v16 comparePosition:v24 toPosition:v11];

    id v18 = v11;
    id v19 = v24;
    if (v17 != -1) {
      goto LABEL_9;
    }
  }
  id v20 = v24;

  int v11 = v19;
LABEL_9:
  double v21 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  id v22 = [v21 textRangeFromPosition:v11 toPosition:v13];

  if (v22)
  {
    [(_UIKeyboardTextSelectionController *)self setSelectedTextRange:v22];
    [(_UIKeyboardTextSelectionController *)self setCursorPosition:v24];
    [(_UIKeyboardTextSelectionController *)self setSelectionGranularity:0];
    if (x != *MEMORY[0x1E4F1DAD8] || y != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
    {
      id v23 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
      objc_msgSend(v23, "startAutoscroll:", x, y);
    }
  }

LABEL_14:
  [v9 returnExecutionToParent];
}

- (void)updateSelectionWithExtentPoint:(CGPoint)a3 executionContext:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  objc_msgSend(v8, "closestPositionToPoint:", x, y);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [(_UIKeyboardTextSelectionController *)self updateSelectionWithExtentPosition:v9 executionContext:v7];
}

- (void)updateSelectionWithExtentAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 executionContext:(id)a5
{
  id v8 = a5;
  id v9 = [(_UIKeyboardTextSelectionController *)self initialSelection];
  [(_UIKeyboardTextSelectionController *)self updateSelectionWithExtentAtBoundary:a3 inDirection:a4 relativeToSelection:v9 executionContext:v8];
}

- (void)updateImmediateSelectionWithExtentAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 executionContext:(id)a5
{
  id v8 = a5;
  id v10 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  id v9 = [v10 selectedTextRange];
  [(_UIKeyboardTextSelectionController *)self updateSelectionWithExtentAtBoundary:a3 inDirection:a4 relativeToSelection:v9 executionContext:v8];
}

- (void)updateSelectionWithExtentAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 relativeToSelection:(id)a5 executionContext:(id)a6
{
  id v15 = a5;
  id v10 = a6;
  if (v15)
  {
    int v11 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    id v12 = [v11 positionWithinRange:v15 farthestInDirection:a4];

    if (v12)
    {
      double v13 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
      uint64_t v14 = [v13 _positionFromPosition:v12 pastTextUnit:a3 inDirection:a4];
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
    id v12 = 0;
  }
  [(_UIKeyboardTextSelectionController *)self updateSelectionWithExtentPosition:v14 executionContext:v10];
}

- (void)updateSelectionWithExtentPoint:(CGPoint)a3 withBoundary:(int64_t)a4 executionContext:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v24 = a5;
  id v9 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  id v10 = objc_msgSend(v9, "closestPositionToPoint:", x, y);

  if (!v10)
  {
    [v24 returnExecutionToParent];
    goto LABEL_11;
  }
  int v11 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  id v12 = [v11 _rangeOfTextUnit:a4 enclosingPosition:v10];

  if (v12)
  {
    double v13 = [(_UIKeyboardTextSelectionController *)self initialSelection];

    if (v13)
    {
      uint64_t v14 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
      id v15 = [(_UIKeyboardTextSelectionController *)self initialSelection];
      uint64_t v16 = [v15 start];
      uint64_t v17 = [v14 comparePosition:v10 toPosition:v16];

      if (v17 == -1)
      {
        uint64_t v22 = [v12 start];
        goto LABEL_9;
      }
      id v18 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
      id v19 = [(_UIKeyboardTextSelectionController *)self initialSelection];
      id v20 = [v19 end];
      uint64_t v21 = [v18 comparePosition:v20 toPosition:v10];

      if (v21 == -1)
      {
        uint64_t v22 = [v12 end];
LABEL_9:
        id v23 = (void *)v22;

        id v10 = v23;
      }
    }
  }
  -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:andExtentPosition:executionContext:](self, "updateSelectionWithExtentPoint:andExtentPosition:executionContext:", v10, v24, x, y);

LABEL_11:
}

- (void)modifySelectionWithExtentPoint:(CGPoint)a3 executionContext:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v29 = a4;
  id v7 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  id v8 = [v7 selectedTextRange];

  id v9 = [v8 start];
  id v10 = [v8 end];
  int v11 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  id v12 = objc_msgSend(v11, "closestPositionToPoint:", x, y);

  if (!v12 || !v9 || !v10) {
    goto LABEL_16;
  }
  double v13 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  uint64_t v14 = [v13 comparePosition:v10 toPosition:v12];

  if (v14 == -1)
  {
    id v18 = v10;
    id v19 = v12;
LABEL_12:
    id v26 = v12;

    id v10 = v19;
    goto LABEL_13;
  }
  id v15 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  uint64_t v16 = [v15 comparePosition:v12 toPosition:v9];

  if (v16 == -1) {
    goto LABEL_10;
  }
  uint64_t v17 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  if ([v17 comparePosition:v9 toPosition:v12] != -1)
  {

    goto LABEL_11;
  }
  id v20 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  uint64_t v21 = [(_UIKeyboardTextSelectionController *)self selectionBase];
  uint64_t v22 = [v21 start];
  uint64_t v23 = [v20 comparePosition:v22 toPosition:v12];

  if (v23 == 1)
  {
LABEL_10:
    id v18 = v9;
    id v19 = v10;
    id v9 = v12;
    goto LABEL_12;
  }
LABEL_11:
  id v24 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  uint64_t v25 = [v24 comparePosition:v12 toPosition:v10];

  id v18 = v10;
  id v19 = v12;
  if (v25 == -1) {
    goto LABEL_12;
  }
LABEL_13:
  double v27 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  double v28 = [v27 textRangeFromPosition:v9 toPosition:v10];

  if (v28) {
    [(_UIKeyboardTextSelectionController *)self setSelectedTextRange:v28];
  }

LABEL_16:
  [v29 returnExecutionToParent];
}

- (void)endSelection
{
  [(_UIKeyboardTextSelectionController *)self setInitialSelection:0];
  [(_UIKeyboardTextSelectionController *)self setSelectionBase:0];
  BOOL v3 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  [v3 cancelAutoscroll];

  [(_UIKeyboardTextSelectionController *)self updateSelectionRects];
  [(_UIKeyboardTextSelectionController *)self endSelectionChange];
  id v4 = +[UIKeyboardImpl activeInstance];
  [v4 updateDictationPopoverLocationIfNeeded];
}

- (UITextRange)initialSelection
{
  return self->_initialSelection;
}

- (void)setInitialSelection:(id)a3
{
}

- (void)setCaretRectForCursorPosition:(CGRect)a3
{
  self->_caretRectForCursorPosition = a3;
}

- (int64_t)selectionGranularity
{
  return self->_selectionGranularity;
}

- (void)setSelectionGranularity:(int64_t)a3
{
  self->_selectionGranularitdouble y = a3;
}

- (UITextRange)selectionBase
{
  return self->_selectionBase;
}

- (void)setSelectionBase:(id)a3
{
}

@end