@interface _UIKeyboardAsyncTextSelectionController
- (BOOL)cursorPositionIsContainedByRange:(id)a3;
- (BOOL)shouldAllowSelectionGestureWithTouchType:(int64_t)a3 atPoint:(CGPoint)a4 toProgressToState:(int64_t)a5;
- (CGRect)caretRectForLeftmostSelectedPosition;
- (CGRect)caretRectForRightmostSelectedPosition;
- (id)webInputDelegate;
- (void)beginFloatingCursorAtPoint:(CGPoint)a3;
- (void)beginSelectionWithBaseAtSelectionBoundaryInDirection:(int64_t)a3 initialExtentPoint:(CGPoint)a4 executionContext:(id)a5;
- (void)endFloatingCursor;
- (void)selectPositionAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 relativeToSelection:(id)a5 executionContext:(id)a6;
- (void)selectPositionAtPoint:(CGPoint)a3 completionHandler:(id)a4;
- (void)selectPositionAtPoint:(CGPoint)a3 executionContext:(id)a4;
- (void)selectPositionAtPoint:(CGPoint)a3 granularity:(int64_t)a4 completionHandler:(id)a5;
- (void)selectTextWithGranularity:(int64_t)a3 atPoint:(CGPoint)a4 completionHandler:(id)a5;
- (void)selectTextWithGranularity:(int64_t)a3 atPoint:(CGPoint)a4 executionContext:(id)a5;
- (void)setRangedSelectionShouldShowGrabbers:(BOOL)a3;
- (void)showSelectionCommands;
- (void)showSelectionView;
- (void)updateFloatingCursorAtPoint:(CGPoint)a3;
- (void)updateSelectionWithExtentPoint:(CGPoint)a3 executionContext:(id)a4;
- (void)updateSelectionWithExtentPoint:(CGPoint)a3 withBoundary:(int64_t)a4 executionContext:(id)a5;
@end

@implementation _UIKeyboardAsyncTextSelectionController

- (BOOL)cursorPositionIsContainedByRange:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_UIKeyboardTextSelectionController *)self cursorPosition];

  if (v5)
  {
    v6 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    v7 = [(_UIKeyboardTextSelectionController *)self cursorPosition];
    [v6 caretRectForPosition:v7];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    v28.origin.x = v9;
    v28.origin.y = v11;
    v28.size.width = v13;
    v28.size.height = v15;
    if (CGRectIsEmpty(v28))
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      v16 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
      v17 = [v16 selectionRectsForRange:v4];

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v18 = v17;
      v5 = (void *)[v18 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v5)
      {
        uint64_t v19 = *(void *)v23;
        while (2)
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v23 != v19) {
              objc_enumerationMutation(v18);
            }
            objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "rect", (void)v22);
            v30.origin.x = v9;
            v30.origin.y = v11;
            v30.size.width = v13;
            v30.size.height = v15;
            if (CGRectIntersectsRect(v29, v30))
            {
              LOBYTE(v5) = 1;
              goto LABEL_14;
            }
          }
          v5 = (void *)[v18 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
  }

  return (char)v5;
}

- (CGRect)caretRectForLeftmostSelectedPosition
{
  v3 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  id v4 = [v3 selectedTextRange];

  v5 = [v4 start];
  if (v5)
  {
    v6 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    v7 = [v4 start];
    [v6 caretRectForPosition:v7];
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

  v16 = [v4 end];
  if (v16)
  {
    v17 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    id v18 = [v4 end];
    [v17 caretRectForPosition:v18];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
  }
  else
  {
    double v20 = *MEMORY[0x1E4F1DB20];
    double v22 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v24 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v26 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  if (v9 >= v20)
  {
    double v9 = v20;
    double v11 = v22;
    double v13 = v24;
    double v15 = v26;
  }

  double v27 = v9;
  double v28 = v11;
  double v29 = v13;
  double v30 = v15;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (CGRect)caretRectForRightmostSelectedPosition
{
  v3 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  id v4 = [v3 selectedTextRange];

  v5 = [v4 start];
  if (v5)
  {
    v6 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    v7 = [v4 start];
    [v6 caretRectForPosition:v7];
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

  v16 = [v4 end];
  if (v16)
  {
    v17 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    id v18 = [v4 end];
    [v17 caretRectForPosition:v18];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
  }
  else
  {
    double v20 = *MEMORY[0x1E4F1DB20];
    double v22 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v24 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v26 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  if (v9 <= v20)
  {
    double v9 = v20;
    double v11 = v22;
    double v13 = v24;
    double v15 = v26;
  }

  double v27 = v9;
  double v28 = v11;
  double v29 = v13;
  double v30 = v15;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (BOOL)shouldAllowSelectionGestureWithTouchType:(int64_t)a3 atPoint:(CGPoint)a4 toProgressToState:(int64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  +[UIKBInputDelegateManager isAsyncTextInputEnabled];
  double v8 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  int v9 = objc_msgSend(v8, "hasSelectablePositionAtPoint:", x, y);
  if (v9) {
    [v8 _cancelLongPressGestureRecognizer];
  }

  return v9;
}

- (void)selectPositionAtPoint:(CGPoint)a3 executionContext:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82___UIKeyboardAsyncTextSelectionController_selectPositionAtPoint_executionContext___block_invoke;
  v11[3] = &unk_1E52E9D28;
  id v12 = v7;
  double v13 = self;
  id v14 = v8;
  double v15 = x;
  double v16 = y;
  id v9 = v8;
  id v10 = v7;
  -[_UIKeyboardAsyncTextSelectionController selectPositionAtPoint:completionHandler:](self, "selectPositionAtPoint:completionHandler:", v11, x, y);
}

- (void)selectPositionAtPoint:(CGPoint)a3 completionHandler:(id)a4
{
}

- (void)selectPositionAtPoint:(CGPoint)a3 granularity:(int64_t)a4 completionHandler:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v14 = a5;
  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled])
  {
    id v9 = [(_UIKeyboardAsyncTextSelectionController *)self webInputDelegate];

    id v10 = self;
    if (v9)
    {
      double v11 = [(_UIKeyboardAsyncTextSelectionController *)self webInputDelegate];
      id v12 = v11;
      if (a4)
      {
        objc_msgSend(v11, "updateCurrentSelectionTo:fromGesture:inState:", 1, 3, x, y);
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else
  {
    id v10 = self;
  }
  double v13 = [(_UIKeyboardTextSelectionController *)v10 inputDelegate];
  id v12 = v13;
  if (a4)
  {
    objc_msgSend(v13, "changeSelectionWithGestureAt:withGesture:withState:", 1, 3, x, y);
    goto LABEL_9;
  }
LABEL_8:
  objc_msgSend(v12, "selectPositionAtPoint:completionHandler:", v14, x, y);
LABEL_9:
}

- (void)selectPositionAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 relativeToSelection:(id)a5 executionContext:(id)a6
{
  id v9 = a6;
  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled])
  {
    id v12 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_9;
    v14[3] = &unk_1E52D9F98;
    id v15 = v9;
    double v16 = self;
    [v12 moveSelectionAtBoundary:a3 inDirection:a4 completionHandler:v14];
    double v13 = v15;
LABEL_6:

    goto LABEL_7;
  }
  id v10 = [(_UIKeyboardAsyncTextSelectionController *)self webInputDelegate];

  if (!v10)
  {
    id v12 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_5;
    v17[3] = &unk_1E52D9F98;
    id v18 = v9;
    double v19 = self;
    [v12 moveSelectionAtBoundary:a3 inDirection:a4 completionHandler:v17];
    double v13 = v18;
    goto LABEL_6;
  }
  double v11 = [(_UIKeyboardAsyncTextSelectionController *)self webInputDelegate];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke;
  v20[3] = &unk_1E52D9F98;
  id v21 = v9;
  double v22 = self;
  [v11 moveSelectionAtBoundary:a3 inStorageDirection:a4 completionHandler:v20];

  id v12 = v21;
LABEL_7:
}

- (void)setRangedSelectionShouldShowGrabbers:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];

  if (v5)
  {
    v6 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    uint64_t v7 = [v6 selectedTextRange];
    if (v7)
    {
      double v8 = (void *)v7;
      id v9 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
      id v10 = [v9 selectedTextRange];
      char v11 = [v10 isEmpty];

      if ((v11 & 1) == 0)
      {
        id v12 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
        [v12 setSelectionDisplayVisible:1];

        double v13 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
        [v13 activateSelection];

        id v14 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
        id v15 = v14;
        uint64_t v16 = 0;
LABEL_9:
        [v14 setShouldDelayActivatingSelectionView:v16];

        id v18 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
        [v18 setSelectionHighlightMode:!v3];
        goto LABEL_11;
      }
    }
    else
    {
    }
    id v14 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
    id v15 = v14;
    uint64_t v16 = 1;
    goto LABEL_9;
  }
  v17 = [(_UIKeyboardTextSelectionController *)self selectionInteractionAssistant];
  id v18 = v17;
  if (v3) {
    [v17 configureForSelectionMode];
  }
  else {
    [v17 configureForHighlightMode];
  }
LABEL_11:
}

- (void)showSelectionCommands
{
  BOOL v3 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  id v4 = [v3 selectedTextRange];
  char v5 = [v4 isEmpty];

  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v7 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
    [v7 showSelectionCommands];

    BOOL v6 = 0;
  }
  self->_shouldDelayShowSelectionCommands = v6;
}

- (void)showSelectionView
{
  id v2 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  if ([v2 shouldDelayActivatingSelectionView])
  {
    [v2 setSelectionDisplayVisible:1];
    [v2 activateSelection];
    [v2 setShouldDelayActivatingSelectionView:0];
  }
}

- (void)selectTextWithGranularity:(int64_t)a3 atPoint:(CGPoint)a4 executionContext:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94___UIKeyboardAsyncTextSelectionController_selectTextWithGranularity_atPoint_executionContext___block_invoke;
  aBlock[3] = &unk_1E52DA070;
  id v10 = v9;
  id v16 = v10;
  v17 = self;
  int64_t v18 = a3;
  char v11 = _Block_copy(aBlock);
  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled])
  {
    id v14 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    double v13 = v14;
LABEL_6:
    objc_msgSend(v14, "selectTextWithGranularity:atPoint:completionHandler:", a3, v11, x, y);
    goto LABEL_7;
  }
  double v13 = [(_UIKeyboardAsyncTextSelectionController *)self webInputDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_7;
    }
    id v14 = v13;
    goto LABEL_6;
  }
  objc_msgSend(v13, "selectTextInGranularity:atPoint:completionHandler:", a3, v11, x, y);
LABEL_7:
}

- (void)selectTextWithGranularity:(int64_t)a3 atPoint:(CGPoint)a4 completionHandler:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  if (a3 == 1)
  {
    id v10 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    char v11 = [v10 selectedTextRange];
  }
  else
  {
    char v11 = 0;
  }
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  double v20 = __95___UIKeyboardAsyncTextSelectionController_selectTextWithGranularity_atPoint_completionHandler___block_invoke;
  id v21 = &unk_1E52FE2B8;
  int64_t v25 = a3;
  id v12 = v11;
  id v22 = v12;
  double v23 = self;
  id v13 = v9;
  id v24 = v13;
  id v14 = _Block_copy(&v18);
  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled])
  {
    v17 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    id v16 = v17;
LABEL_9:
    objc_msgSend(v17, "selectTextWithGranularity:atPoint:completionHandler:", a3, v14, x, y);
    goto LABEL_10;
  }
  id v16 = [(_UIKeyboardAsyncTextSelectionController *)self webInputDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_10;
    }
    v17 = v16;
    goto LABEL_9;
  }
  objc_msgSend(v16, "selectTextInGranularity:atPoint:completionHandler:", a3, v14, x, y);
LABEL_10:
}

- (void)beginSelectionWithBaseAtSelectionBoundaryInDirection:(int64_t)a3 initialExtentPoint:(CGPoint)a4 executionContext:(id)a5
{
  id v7 = a5;
  [(_UIKeyboardTextSelectionController *)self beginSelection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __132___UIKeyboardAsyncTextSelectionController_beginSelectionWithBaseAtSelectionBoundaryInDirection_initialExtentPoint_executionContext___block_invoke;
  id v14 = &unk_1E52DA660;
  id v8 = v7;
  id v15 = v8;
  id v16 = self;
  id v9 = _Block_copy(&v11);
  +[UIKBInputDelegateManager isAsyncTextInputEnabled];
  id v10 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  [v10 beginSelectionInDirection:a3 completionHandler:v9];
}

- (void)updateSelectionWithExtentPoint:(CGPoint)a3 executionContext:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __91___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_executionContext___block_invoke;
  v17 = &unk_1E52DA660;
  id v8 = v7;
  id v18 = v8;
  uint64_t v19 = self;
  id v9 = _Block_copy(&v14);
  BOOL v10 = +[UIKBInputDelegateManager isAsyncTextInputEnabled];
  uint64_t v11 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  uint64_t v12 = v11;
  if (v10
    && (int v13 = [v11 conformsToProtocolCached:&unk_1ED7009A0],
        v12,
        [(_UIKeyboardTextSelectionController *)self inputDelegate],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        v13))
  {
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend(v12, "updateSelectionWithExtentPoint:boundary:completionHandler:", 0, v9, x, y);
    }
    else if (objc_opt_respondsToSelector())
    {
      objc_msgSend(v12, "updateSelectionWithExtentPoint:withBoundary:completionHandler:", 0, v9, x, y);
    }
  }
  else
  {
    objc_msgSend(v12, "updateSelectionWithExtentPoint:completionHandler:", v9, x, y);
  }
}

- (void)updateSelectionWithExtentPoint:(CGPoint)a3 withBoundary:(int64_t)a4 executionContext:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a5;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __104___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_withBoundary_executionContext___block_invoke;
  double v23 = &unk_1E52DA660;
  id v10 = v9;
  id v24 = v10;
  int64_t v25 = self;
  uint64_t v11 = _Block_copy(&v20);
  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled])
  {
    id v16 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    v17 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
    objc_msgSend(v17, "startAutoscroll:", x, y);

LABEL_6:
    id v18 = v16;
LABEL_7:
    objc_msgSend(v18, "updateSelectionWithExtentPoint:withBoundary:completionHandler:", a4, v11, x, y);
    goto LABEL_8;
  }
  uint64_t v12 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  objc_msgSend(v12, "startAutoscroll:", x, y);

  int v13 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  int v14 = [v13 conformsToProtocol:&unk_1ED7009A0];

  uint64_t v15 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  id v16 = v15;
  if (!v14)
  {
    int v19 = [v15 conformsToProtocol:&unk_1ED700940];

    if (!v19) {
      goto LABEL_9;
    }
    id v18 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
    id v16 = v18;
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  objc_msgSend(v16, "updateSelectionWithExtentPoint:boundary:completionHandler:", a4, v11, x, y);
LABEL_8:

LABEL_9:
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  objc_msgSend(v5, "beginFloatingCursorAtPoint:", x, y);
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  objc_msgSend(v5, "updateFloatingCursorAtPoint:", x, y);
}

- (void)endFloatingCursor
{
  id v2 = [(_UIKeyboardTextSelectionController *)self interactionAssistant];
  [v2 endFloatingCursor];
}

- (id)webInputDelegate
{
  BOOL v3 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  int v4 = [v3 conformsToProtocolCached:&unk_1ED7009A0];

  if (v4)
  {
    id v5 = [(_UIKeyboardTextSelectionController *)self inputDelegate];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

@end