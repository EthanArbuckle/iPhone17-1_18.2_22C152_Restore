@interface SXTextTangierEditingController
- (BOOL)canAddOrShowComment;
- (BOOL)isParagraphModeWithSelection:(id)a3 onStorage:(id)a4;
- (BOOL)startingInitialSelectionDrag;
- (BOOL)wantsCaret;
- (BOOL)wantsKeyboard;
- (id)editingReps;
- (id)editorKeyboardLanguage;
- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (void)clearSelection;
- (void)copy:(id)a3;
- (void)setStartingInitialSelectionDrag:(BOOL)a3;
@end

@implementation SXTextTangierEditingController

- (BOOL)wantsCaret
{
  return 0;
}

- (BOOL)wantsKeyboard
{
  return 0;
}

- (BOOL)canAddOrShowComment
{
  return 0;
}

- (BOOL)isParagraphModeWithSelection:(id)a3 onStorage:(id)a4
{
  return 0;
}

- (void)copy:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  v4 = [(TSWPEditingController *)self selection];
  int v5 = [v4 isRange];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v7 = [(TSWPEditingController *)self storage];
    v8 = [v7 stylesheet];

    if (v8)
    {
      v9 = [(TSWPEditingController *)self selection];
      uint64_t v10 = [v9 range];
      uint64_t v12 = v11;

      v13 = [(TSWPEditingController *)self storage];
      v14 = objc_msgSend(v13, "nsAttributedSubstringFromRange:scale:", v10, v12, 1.0);

      uint64_t v22 = 0;
      [v14 tokenCountWithEnumerationOptions:1027 maxTokenCount:200 outLimitLength:&v22];
      v15 = [v14 stringByTruncatingToLength:v22 options:1027];

      v16 = objc_msgSend(v15, "tsu_RTFFromRange:documentAttributes:", 0, objc_msgSend(v15, "length"), 0);
      if (v16) {
        [v6 setObject:v16 forKey:*MEMORY[0x263F01B10]];
      }
    }
    v17 = [(TSWPEditingController *)self storage];
    v18 = [(TSWPEditingController *)self selection];
    v19 = [v17 substringWithSelection:v18];

    [v6 setObject:v19 forKey:*MEMORY[0x263F01B58]];
    v23[0] = v6;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    v21 = [MEMORY[0x263F1C840] generalPasteboard];
    [v21 setItems:v20];
  }
}

- (id)editingReps
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9C0] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = [(TSWPEditingController *)self interactiveCanvasController];
  int v5 = [v4 canvas];
  id v6 = [v5 topLevelReps];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_opt_class();
        uint64_t v11 = TSUDynamicCast();
        uint64_t v12 = [v11 storage];
        v13 = [(TSWPEditingController *)self storage];

        if (v12 == v13) {
          [v3 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v3;
}

- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  if (sel_selectAll_ == a3 || sel_copy_ == a3) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SXTextTangierEditingController;
  return -[TSWPEditingController canPerformEditorAction:withSender:](&v6, sel_canPerformEditorAction_withSender_);
}

- (id)editorKeyboardLanguage
{
  objc_opt_class();
  v3 = [(TSWPEditingController *)self storage];
  v4 = TSUDynamicCast();

  int v5 = [v4 locale];
  objc_super v6 = [v5 localeIdentifier];

  return v6;
}

- (void)clearSelection
{
  id v2 = [(TSWPEditingController *)self interactiveCanvasController];
  [v2 endEditing];
}

- (BOOL)startingInitialSelectionDrag
{
  return *(&self->super._canCoalesceBreakingCharacters + 1);
}

- (void)setStartingInitialSelectionDrag:(BOOL)a3
{
  *(&self->super._canCoalesceBreakingCharacters + 1) = a3;
}

@end