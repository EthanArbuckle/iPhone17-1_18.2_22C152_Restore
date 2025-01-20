@interface THCanvasEditor
- (BOOL)p_canNavigateByBookDirection:(int)a3 bookGranularity:(int)a4;
- (BOOL)p_canNavigateByHistoryDirection:(int)a3;
- (BOOL)wantsKeyboard;
- (id)drawables;
- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (void)insertText:(id)a3 replacementRange:(_NSRange)a4;
- (void)moveBackward:(id)a3;
- (void)moveDown:(id)a3;
- (void)moveForward:(id)a3;
- (void)moveLeft:(id)a3;
- (void)moveLeftAndModifySelection:(id)a3;
- (void)moveRight:(id)a3;
- (void)moveRightAndModifySelection:(id)a3;
- (void)moveToLeftEndOfLine:(id)a3;
- (void)moveToRightEndOfLine:(id)a3;
- (void)moveUp:(id)a3;
- (void)p_navigateByBookDirection:(int)a3 bookGranularity:(int)a4;
- (void)p_navigateByHistoryDirection:(int)a3;
- (void)pageDown:(id)a3;
- (void)pageUp:(id)a3;
- (void)scrollPageDown:(id)a3;
- (void)scrollPageUp:(id)a3;
- (void)scrollToBeginningOfDocument:(id)a3;
- (void)scrollToEndOfDocument:(id)a3;
@end

@implementation THCanvasEditor

- (id)drawables
{
  return +[NSArray array];
}

- (BOOL)wantsKeyboard
{
  return 0;
}

- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  return "pageDown:" == a3
      || "pageUp:" == a3
      || "moveForward:" == a3
      || "moveRight:" == a3
      || "moveBackward:" == a3
      || "moveLeft:" == a3
      || "moveUp:" == a3
      || "moveDown:" == a3
      || "scrollPageUp:" == a3
      || "scrollPageDown:" == a3
      || "scrollToBeginningOfDocument:" == a3
      || "scrollToEndOfDocument:" == a3
      || "moveRightAndModifySelection:" == a3
      || "moveLeftAndModifySelection:" == a3
      || "moveWordRight:" == a3
      || "moveWordLeft:" == a3
      || "insertText:replacementRange:" == a3
      || "moveToLeftEndOfLine:" == a3
      || "moveToRightEndOfLine:" == a3;
}

- (void)pageDown:(id)a3
{
}

- (void)pageUp:(id)a3
{
}

- (void)moveForward:(id)a3
{
}

- (void)moveBackward:(id)a3
{
}

- (void)moveRight:(id)a3
{
}

- (void)moveLeft:(id)a3
{
}

- (void)moveUp:(id)a3
{
}

- (void)moveDown:(id)a3
{
}

- (void)scrollPageUp:(id)a3
{
}

- (void)scrollPageDown:(id)a3
{
}

- (void)scrollToBeginningOfDocument:(id)a3
{
}

- (void)scrollToEndOfDocument:(id)a3
{
}

- (void)moveRightAndModifySelection:(id)a3
{
}

- (void)moveLeftAndModifySelection:(id)a3
{
}

- (void)moveToLeftEndOfLine:(id)a3
{
}

- (void)moveToRightEndOfLine:(id)a3
{
}

- (void)insertText:(id)a3 replacementRange:(_NSRange)a4
{
  if ([a3 length] == (char *)&dword_0 + 1
    && [a3 characterAtIndex:0] == 32)
  {
    [(THCanvasEditor *)self p_navigateByBookDirection:1 bookGranularity:1];
  }
}

- (BOOL)p_canNavigateByBookDirection:(int)a3 bookGranularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  objc_opt_class();
  [(THCanvasEditor *)self interactiveCanvasController];
  v7 = (void *)TSUDynamicCast();
  id v8 = [v7 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v9 = [v8 documentNavigatorForInteractiveCanvasController:v7];
  if (!v9) {
    return 0;
  }

  return [v9 canNavigateByBookDirection:v5 bookGranularity:v4];
}

- (void)p_navigateByBookDirection:(int)a3 bookGranularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (-[THCanvasEditor p_canNavigateByBookDirection:bookGranularity:](self, "p_canNavigateByBookDirection:bookGranularity:"))
  {
    objc_opt_class();
    [(THCanvasEditor *)self interactiveCanvasController];
    v7 = (void *)TSUDynamicCast();
    id v8 = [v7 delegate];
    if (objc_opt_respondsToSelector())
    {
      id v9 = [v8 documentNavigatorForInteractiveCanvasController:v7];
      if (v9)
      {
        [v9 navigateByBookDirection:v5 bookGranularity:v4];
      }
    }
  }
}

- (BOOL)p_canNavigateByHistoryDirection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_opt_class();
  [(THCanvasEditor *)self interactiveCanvasController];
  uint64_t v5 = (void *)TSUDynamicCast();
  id v6 = [v5 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v7 = [v6 documentNavigatorForInteractiveCanvasController:v5];
  if (!v7) {
    return 0;
  }

  return [v7 canNavigateByHistoryDirection:v3];
}

- (void)p_navigateByHistoryDirection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (-[THCanvasEditor p_canNavigateByHistoryDirection:](self, "p_canNavigateByHistoryDirection:"))
  {
    objc_opt_class();
    [(THCanvasEditor *)self interactiveCanvasController];
    uint64_t v5 = (void *)TSUDynamicCast();
    id v6 = [v5 delegate];
    if (objc_opt_respondsToSelector())
    {
      id v7 = [v6 documentNavigatorForInteractiveCanvasController:v5];
      if (v7)
      {
        [v7 navigateByHistoryDirection:v3];
      }
    }
  }
}

@end