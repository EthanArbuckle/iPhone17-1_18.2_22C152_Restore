@interface TSDSystemTextInputResponder
- (void)cancelAutoscroll;
- (void)copy:(id)a3;
- (void)scrollSelectionToVisible:(BOOL)a3;
- (void)startAutoscroll:(CGPoint)a3;
@end

@implementation TSDSystemTextInputResponder

- (void)copy:(id)a3
{
  [(TSDTextInputResponder *)self editor];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [[(TSDTextInputResponder *)self editor] canPerformEditorAction:a2 withSender:a3] == 1)
  {
    [(TSDTextInputResponder *)self acceptAutocorrection];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C7B0], "sharedMenuController"), "hideMenu");
    v6 = [(TSDTextInputResponder *)self editor];
    [(TSDTextInput *)v6 copy:a3];
  }
}

- (void)startAutoscroll:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(TSDTextInputResponder *)self p_ICC];
  objc_msgSend(v5, "convertBoundsToUnscaledPoint:", x, y);
  double v7 = v6 + -10.0;
  double v9 = v8 + -10.0;

  objc_msgSend(v5, "scrollRectToVisible:animated:", 1, v7, v9, 20.0, 20.0);
}

- (void)cancelAutoscroll
{
  id v2 = [(TSDTextInputResponder *)self p_ICC];

  [v2 forceStopScrolling];
}

- (void)scrollSelectionToVisible:(BOOL)a3
{
  id v3 = [(TSDTextInputResponder *)self p_ICC];

  [v3 scrollCurrentSelectionToVisible];
}

@end