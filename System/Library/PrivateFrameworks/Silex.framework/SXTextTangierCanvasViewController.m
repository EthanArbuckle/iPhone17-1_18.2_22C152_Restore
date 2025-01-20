@interface SXTextTangierCanvasViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)interactionShouldBegin:(id)a3 atPoint:(CGPoint)a4;
- (BOOL)selectAllEnabled;
- (BOOL)selectionEnabled;
- (id)actionForHyperlink:(id)a3 inRep:(id)a4 gesture:(id)a5;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (int64_t)overrideUserInterfaceStyle;
- (void)dealloc;
- (void)interactionDidEnd:(id)a3;
- (void)loadView;
- (void)selectAll:(id)a3;
- (void)setSelectAllEnabled:(BOOL)a3;
- (void)setSelectionEnabled:(BOOL)a3;
@end

@implementation SXTextTangierCanvasViewController

- (void)loadView
{
  v3 = objc_alloc_init(SXCanvasView);
  [(SXTextTangierCanvasViewController *)self setView:v3];
}

- (id)actionForHyperlink:(id)a3 inRep:(id)a4 gesture:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  v11 = [(TSWPiOSCanvasViewController *)self interactiveCanvasController];
  v12 = TSUDynamicCast();

  v13 = [v12 delegate];
  v14 = TSUProtocolCast();

  [v10 unscaledLocationForICC:v12];
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  v19 = [v10 gestureKind];
  v20 = (void *)*MEMORY[0x263F7C7C0];
  BOOL v21 = v19 == (void *)*MEMORY[0x263F7C7C0];

  if (([v10 isDone] & 1) != 0 || v19 == v20 && objc_msgSend(v10, "gestureState") == 1)
  {
    v22 = [v10 gestureKind];
    v23 = (void *)*MEMORY[0x263F7C7B8];

    if (v22 == v23)
    {
      v24 = &__block_literal_global_292;
    }
    else
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __70__SXTextTangierCanvasViewController_actionForHyperlink_inRep_gesture___block_invoke_3;
      v27[3] = &unk_2646525C8;
      id v28 = v14;
      id v29 = v9;
      id v30 = v12;
      id v31 = v8;
      uint64_t v32 = v16;
      uint64_t v33 = v18;
      BOOL v34 = v21;
      v24 = (void *)MEMORY[0x223CA5030](v27);
    }
  }
  else
  {
    v24 = &__block_literal_global_26;
  }
  v25 = [MEMORY[0x263F7C748] hyperlinkActionWithHyperlink:v8 inRep:v9 action:v24];
  [v25 setPerformImmediately:1];
  if ([v10 gestureState] == 2)
  {

    v25 = 0;
  }

  return v25;
}

void __70__SXTextTangierCanvasViewController_actionForHyperlink_inRep_gesture___block_invoke_2()
{
  id v0 = [MEMORY[0x263F7C758] sharedHyperlinkUIController];
  [v0 endUISession];
}

void __70__SXTextTangierCanvasViewController_actionForHyperlink_inRep_gesture___block_invoke_3(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    v2 = [*(id *)(a1 + 40) info];
    v3 = TSUProtocolCast();

    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    v6 = *(void **)(a1 + 56);
    uint64_t v7 = [v6 range];
    objc_msgSend(v4, "interactiveCanvasController:interactedWithHyperlink:info:range:touchPoint:touchAndHold:", v5, v6, v3, v7, v8, *(unsigned __int8 *)(a1 + 80), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
  id v9 = [MEMORY[0x263F7C758] sharedHyperlinkUIController];
  [v9 endUISession];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_delete_ != a3
    && (sel_selectAll_ != a3
     || [(SXTextTangierCanvasViewController *)self selectAllEnabled]
     && [(SXTextTangierCanvasViewController *)self selectionEnabled]))
  {
    v9.receiver = self;
    v9.super_class = (Class)SXTextTangierCanvasViewController;
    BOOL v7 = [(TSDiOSCanvasViewController *)&v9 canPerformAction:a3 withSender:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)selectAll:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(SXTextTangierCanvasViewController *)self selectionEnabled]
    && [(SXTextTangierCanvasViewController *)self selectAllEnabled])
  {
    uint64_t v5 = [(TSWPiOSCanvasViewController *)self interactiveCanvasController];
    id v6 = [v5 infosToDisplay];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v21 = v4;
      uint64_t v10 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v13 = [v12 storage];
          v14 = [v13 flowName];
          int v15 = [v14 isEqualToString:@"body"];

          if (v15)
          {
            id v16 = v12;
            goto LABEL_13;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      id v16 = 0;
LABEL_13:
      id v4 = v21;
    }
    else
    {
      id v16 = 0;
    }

    uint64_t v17 = [(TSWPiOSCanvasViewController *)self interactiveCanvasController];
    id v18 = (id)[v17 beginEditingRepForInfo:v16];

    v19 = [(TSWPiOSCanvasViewController *)self interactiveCanvasController];
    v20 = [v19 textInputResponder];
    [v20 selectAll:v4];
  }
}

- (BOOL)interactionShouldBegin:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  uint64_t v8 = [(TSWPiOSCanvasViewController *)self interactiveCanvasController];
  uint64_t v9 = [v8 delegate];
  uint64_t v10 = TSUProtocolCast();

  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(TSWPiOSCanvasViewController *)self interactiveCanvasController],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = objc_msgSend(v10, "interactiveCanvasController:shouldBeginInteraction:atPoint:", v11, v7, x, y),
        v11,
        !v12))
  {
    BOOL v13 = 0;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SXTextTangierCanvasViewController;
    if ([(TSDiOSCanvasViewController *)&v16 respondsToSelector:sel_interactionShouldBegin_atPoint_])
    {
      v15.receiver = self;
      v15.super_class = (Class)SXTextTangierCanvasViewController;
      BOOL v13 = -[TSWPiOSCanvasViewController interactionShouldBegin:atPoint:](&v15, sel_interactionShouldBegin_atPoint_, v7, x, y);
    }
    else
    {
      BOOL v13 = 1;
    }
  }

  return v13;
}

- (void)interactionDidEnd:(id)a3
{
  id v4 = [(TSWPiOSCanvasViewController *)self interactiveCanvasController];
  v3 = [v4 textInputResponder];
  [v3 resignFirstResponder];
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (NSSelectorFromString(&cfstr_Accessibilitys.isa) == a3 || NSSelectorFromString(&cfstr_Accessibilityp.isa) == a3)
  {
    uint64_t v8 = [(TSWPiOSCanvasViewController *)self interactiveCanvasController];
    uint64_t v9 = [v8 textInputResponder];

    id v7 = [v9 targetForAction:a3 withSender:v6];
  }
  else if (NSSelectorFromString(&cfstr_Delete.isa) == a3)
  {
    id v7 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SXTextTangierCanvasViewController;
    id v7 = [(SXTextTangierCanvasViewController *)&v11 targetForAction:a3 withSender:v6];
  }

  return v7;
}

- (void)dealloc
{
  [(TSWPiOSCanvasViewController *)self cancelDelayedTapAction];
  v3.receiver = self;
  v3.super_class = (Class)SXTextTangierCanvasViewController;
  [(TSWPiOSCanvasViewController *)&v3 dealloc];
}

- (int64_t)overrideUserInterfaceStyle
{
  v2 = [(SXTextTangierCanvasViewController *)self view];
  objc_super v3 = [v2 window];
  id v4 = [v3 screen];
  uint64_t v5 = [v4 traitCollection];
  int64_t v6 = [v5 userInterfaceStyle];

  return v6;
}

- (BOOL)selectionEnabled
{
  return self->_selectionEnabled;
}

- (void)setSelectionEnabled:(BOOL)a3
{
  self->_selectionEnabled = a3;
}

- (BOOL)selectAllEnabled
{
  return self->_selectAllEnabled;
}

- (void)setSelectAllEnabled:(BOOL)a3
{
  self->_selectAllEnabled = a3;
}

@end