@interface ICTableColumnTextView
- (BOOL)_accessibilityCanDrag;
- (BOOL)_accessibilityScrollToVisible;
- (BOOL)atCellBoundaryForDirection:(unint64_t)a3;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)indirectScribbleInteraction:(id)a3 isElementFocused:(id)a4;
- (BOOL)isAccessibilityTableTextView;
- (BOOL)isChangingFont;
- (BOOL)isProcessingDelete;
- (BOOL)isResigningFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4;
- (BOOL)shouldShowFloatingSuggestions;
- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3;
- (CGRect)accessibilityFrame;
- (CGRect)indirectScribbleInteraction:(id)a3 frameForElement:(id)a4;
- (CGRect)selectionRect;
- (ICHashtagController)hashtagController;
- (ICMentionsController)mentionsController;
- (ICNAEventReporter)eventReporter;
- (ICTableColumnTextStorage)columnTextStorage;
- (ICTableColumnTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (ICTableColumnTextViewDelegate)cellDelegate;
- (ICTableSelectionDelegate)selectionDelegate;
- (NSUUID)columnID;
- (_NSRange)_accessibilitySelectedTextRange;
- (_NSRange)previousSelectedRange;
- (_NSRange)rangeInSelectedCellFromRangeInTextView:(_NSRange)a3;
- (_NSRange)rangeInTextViewFromRangeInSelectedCell:(_NSRange)a3;
- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3;
- (id)_icaxAccessibilityAttributedStringFromOriginalString:(id)a3;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityLabel;
- (id)baseAttributedStringForAccessibility;
- (id)closestPositionToPoint:(CGPoint)a3;
- (id)inputAssistantItem;
- (id)keyCommands;
- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5;
- (id)textDroppableView:(id)a3 proposalForDrop:(id)a4;
- (id)undoManager;
- (int64_t)returnKeyType;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)addColumnLeft:(id)a3;
- (void)addColumnRight:(id)a3;
- (void)addRowDown:(id)a3;
- (void)addRowUp:(id)a3;
- (void)altMoveDown:(id)a3;
- (void)altMoveUp:(id)a3;
- (void)createLink:(id)a3 title:(id)a4 textSelection:(id)a5 range:(_NSRange)a6 addApproach:(int64_t)a7;
- (void)createNoteLinkAttachment:(id)a3 textSelection:(id)a4 range:(_NSRange)a5 addApproach:(int64_t)a6;
- (void)dealloc;
- (void)deleteBackward;
- (void)didPasteOrDropText:(id)a3 toRange:(id)a4;
- (void)eventReporterLostSession:(id)a3;
- (void)finishProcessingDelete;
- (void)hashtagViewController:(id)a3 insertFutureHashtagWithText:(id)a4;
- (void)hashtagViewController:(id)a3 insertHashtagWithText:(id)a4;
- (void)hashtagViewController:(id)a3 insertUnknownInlineAttachmentWithText:(id)a4;
- (void)indirectScribbleInteraction:(id)a3 focusElementIfNeeded:(id)a4 referencePoint:(CGPoint)a5 completion:(id)a6;
- (void)indirectScribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5;
- (void)indirectScribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4;
- (void)insertInlineAttachment:(id)a3 saveAndResumeEditingForAttachment:(id)a4 inNote:(id)a5;
- (void)insertInlineAttachment:(id)a3 saveAndResumeEditingForAttachment:(id)a4 inNote:(id)a5 forRange:(_NSRange)a6;
- (void)moveDown:(id)a3;
- (void)moveLeft:(id)a3;
- (void)moveLeftCellAfterDelete;
- (void)moveRight:(id)a3;
- (void)moveToBeginningOfCell:(id)a3;
- (void)moveToBeginningOfCellAndModifySelection:(id)a3;
- (void)moveToEndOfCell:(id)a3;
- (void)moveToEndOfCellAndModifySelection:(id)a3;
- (void)moveUp:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openExperimentalHashtagUI:(id)a3;
- (void)openLinkEditor:(id)a3;
- (void)paste:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)removeLinksFromCurrentSelection;
- (void)removeLinksFromTextSelection:(id)a3 range:(_NSRange)a4;
- (void)select:(id)a3;
- (void)selectAll:(id)a3;
- (void)setCellDelegate:(id)a3;
- (void)setColumnID:(id)a3;
- (void)setEditorController:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setHashtagController:(id)a3;
- (void)setIsChangingFont:(BOOL)a3;
- (void)setIsProcessingDelete:(BOOL)a3;
- (void)setIsResigningFirstResponder:(BOOL)a3;
- (void)setMentionsController:(id)a3;
- (void)setPreviousSelectedRange:(_NSRange)a3;
- (void)setSelectionDelegate:(id)a3;
- (void)setupMenuController;
- (void)shiftReturn:(id)a3;
- (void)startEditingForTapGesture:(id)a3;
- (void)toggleBoldface:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleUnderline:(id)a3;
@end

@implementation ICTableColumnTextView

- (void)paste:(id)a3
{
  id v4 = a3;
  v5 = [(ICTableColumnTextView *)self cellDelegate];
  char v6 = [v5 pasteCellRange];

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)ICTableColumnTextView;
    [(ICBaseTextView *)&v7 paste:v4];
  }
}

- (ICTableColumnTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ICTableColumnTextView;
  id v4 = -[ICBaseTextView initWithFrame:textContainer:](&v9, sel_initWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    [(ICTableColumnTextView *)v4 setScrollEnabled:0];
    [(ICTableColumnTextView *)v5 setBackgroundColor:0];
    -[ICTableColumnTextView setTextContainerInset:](v5, "setTextContainerInset:", *MEMORY[0x263F5B188], 0.0, *MEMORY[0x263F5B170], 0.0);
    [(ICTableColumnTextView *)v5 setWritingToolsBehavior:-1];
    [(ICBaseTextView *)v5 setupTextViewDragAndDropDelegates];
    char v6 = (void *)[objc_alloc(MEMORY[0x263F82B78]) initWithDelegate:v5];
    [(ICTableColumnTextView *)v5 addInteraction:v6];
    objc_super v7 = (void *)[objc_alloc(MEMORY[0x263F82838]) initWithDelegate:v5];
    [(ICTableColumnTextView *)v5 addInteraction:v7];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [(ICBaseTextView *)self editorController];
  objc_msgSend(v3, "ic_removeObserver:forKeyPath:context:", self, @"textView.editable", &compoundliteral_5);

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)ICTableColumnTextView;
  [(ICBaseTextView *)&v5 dealloc];
}

- (void)setEditorController:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(ICBaseTextView *)self editorController];
  objc_msgSend(v5, "ic_removeObserver:forKeyPath:context:", self, @"textView.editable", &compoundliteral_5);

  v7.receiver = self;
  v7.super_class = (Class)ICTableColumnTextView;
  [(ICBaseTextView *)&v7 setEditorController:v4];

  char v6 = [(ICBaseTextView *)self editorController];
  objc_msgSend(v6, "ic_addObserver:forKeyPath:context:explicitOptions:", self, @"textView.editable", &compoundliteral_5, 4);
}

- (ICTableColumnTextStorage)columnTextStorage
{
  objc_opt_class();
  v3 = [(ICTableColumnTextView *)self textStorage];
  id v4 = ICDynamicCast();

  return (ICTableColumnTextStorage *)v4;
}

- (CGRect)selectionRect
{
  v3 = [(ICTableColumnTextView *)self selectedTextRange];
  int v4 = [v3 isEmpty];

  if (v4)
  {
    objc_super v5 = [(ICTableColumnTextView *)self selectedTextRange];
    char v6 = [v5 start];
    [(ICBaseTextView *)self caretRectForPosition:v6];
    CGFloat x = v7;
    CGFloat y = v9;
    CGFloat width = v11;
    CGFloat height = v13;
  }
  else
  {
    objc_super v5 = [(ICTableColumnTextView *)self layoutManager];
    uint64_t v15 = [(ICTableColumnTextView *)self selectedRange];
    uint64_t v17 = objc_msgSend(v5, "glyphRangeForCharacterRange:actualCharacterRange:", v15, v16, 0);
    uint64_t v19 = v18;
    v20 = [(ICTableColumnTextView *)self textContainer];
    objc_msgSend(v5, "boundingRectForGlyphRange:inTextContainer:", v17, v19, v20);
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;

    [(ICTableColumnTextView *)self textContainerInset];
    CGFloat v30 = v29;
    [(ICTableColumnTextView *)self textContainerInset];
    CGFloat v32 = v31;
    v37.origin.CGFloat x = v22;
    v37.origin.CGFloat y = v24;
    v37.size.CGFloat width = v26;
    v37.size.CGFloat height = v28;
    CGRect v38 = CGRectOffset(v37, v30, v32);
    CGFloat x = v38.origin.x;
    CGFloat y = v38.origin.y;
    CGFloat width = v38.size.width;
    CGFloat height = v38.size.height;
  }

  double v33 = x;
  double v34 = y;
  double v35 = width;
  double v36 = height;
  result.size.CGFloat height = v36;
  result.size.CGFloat width = v35;
  result.origin.CGFloat y = v34;
  result.origin.CGFloat x = v33;
  return result;
}

- (BOOL)becomeFirstResponder
{
  UIAccessibilityPostNotification(*MEMORY[0x263F81438], self);
  v4.receiver = self;
  v4.super_class = (Class)ICTableColumnTextView;
  return [(ICBaseTextView *)&v4 becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
  BOOL v3 = 1;
  [(ICTableColumnTextView *)self setIsResigningFirstResponder:1];
  objc_super v4 = [(ICTableColumnTextView *)self cellDelegate];
  [v4 setPreventScrolling:1];

  if ([(ICTableColumnTextView *)self isFirstResponder])
  {
    objc_super v5 = [(ICBaseTextView *)self editorController];
    char v6 = [v5 textView];
    uint64_t v7 = [v6 shouldAvoidBecomingFirstResponder];

    v8 = [(ICBaseTextView *)self editorController];
    double v9 = [v8 textView];
    [v9 setShouldAvoidBecomingFirstResponder:1];

    -[ICTableColumnTextView setSelectedRange:](self, "setSelectedRange:", [(ICTableColumnTextView *)self selectedRange], 0);
    v14.receiver = self;
    v14.super_class = (Class)ICTableColumnTextView;
    BOOL v3 = [(ICBaseTextView *)&v14 resignFirstResponder];
    v10 = [(ICBaseTextView *)self editorController];
    double v11 = [v10 textView];
    [v11 setShouldAvoidBecomingFirstResponder:v7];
  }
  v12 = [(ICTableColumnTextView *)self cellDelegate];
  [v12 setPreventScrolling:0];

  [(ICTableColumnTextView *)self setIsResigningFirstResponder:0];
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)ICTableColumnTextView;
  if ([(ICBaseTextView *)&v15 canBecomeFirstResponder])
  {
    BOOL v3 = [(ICTableColumnTextView *)self cellDelegate];
    int v4 = [v3 containedInNoteSelection];

    if (v4)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      objc_super v5 = [(ICTableColumnTextView *)self gestureRecognizers];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v12;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v5);
            }
            if ([*(id *)(*((void *)&v11 + 1) + 8 * i) state] == 3)
            {
              objc_opt_class();
              double v9 = ICDynamicCast();

              if (v9)
              {
                LOBYTE(v6) = 1;
                goto LABEL_16;
              }
            }
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)ICTableColumnTextView;
  BOOL v6 = [(ICBaseTextView *)&v16 canPerformAction:a3 withSender:a4];
  if (sel_selectAll_ == a3 && v6)
  {
    objc_opt_class();
    double v9 = [(ICTableColumnTextView *)self textStorage];
    v10 = ICDynamicCast();

    uint64_t v15 = 0;
    id v11 = (id)objc_msgSend(v10, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange", 0), &v14);
    char v12 = v15 != 0;
LABEL_11:

    return v12;
  }
  if (sel_paste_ == a3 && v6)
  {
    v10 = [MEMORY[0x263F82A18] generalPasteboard];
    char v12 = [v10 hasStrings];
    goto LABEL_11;
  }
  return sel_shiftReturn_ == a3 || v6;
}

- (void)select:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_super v5 = [(ICTableColumnTextView *)self textStorage];
  BOOL v6 = ICDynamicCast();

  uint64_t v10 = 0;
  uint64_t v11 = 0;
  id v7 = (id)objc_msgSend(v6, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange"), &v10);
  if (v11)
  {
    v9.receiver = self;
    v9.super_class = (Class)ICTableColumnTextView;
    [(ICBaseTextView *)&v9 select:v4];
  }
  else
  {
    v8 = [(ICTableColumnTextView *)self cellDelegate];
    [v8 selectCell];
  }
}

- (void)selectAll:(id)a3
{
  objc_opt_class();
  id v4 = [(ICTableColumnTextView *)self textStorage];
  objc_super v5 = ICDynamicCast();

  uint64_t v10 = 0;
  uint64_t v11 = 0;
  id v6 = (id)objc_msgSend(v5, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange"), &v10);
  [(ICTableColumnTextView *)self selectedRange];
  if (v7 == v11)
  {
    v8 = [(ICTableColumnTextView *)self cellDelegate];
    [v8 selectTable];
  }
  else
  {
    [(ICTableColumnTextView *)self setSelectedRange:v10];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __35__ICTableColumnTextView_selectAll___block_invoke;
    v9[3] = &unk_2640B8140;
    v9[4] = self;
    [MEMORY[0x263F158F8] setCompletionBlock:v9];
  }
}

void __35__ICTableColumnTextView_selectAll___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F82950] sharedMenuController];
  v2 = *(void **)(a1 + 32);
  [v2 selectionRect];
  objc_msgSend(v3, "showMenuFromView:rect:", v2);
}

- (id)keyCommands
{
  v45.receiver = self;
  v45.super_class = (Class)ICTableColumnTextView;
  id v3 = [(ICTableColumnTextView *)&v45 keyCommands];
  id v4 = (void *)[v3 mutableCopy];
  objc_super v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF980] array];
  }
  uint64_t v7 = v6;

  if ([(ICTableColumnTextView *)self isFirstResponder])
  {
    v8 = [(ICTableColumnTextView *)self cellDelegate];
    int v9 = [v8 acceptsKeystrokes];

    if (v9)
    {
      [(ICTableColumnTextView *)self selectedRange];
      uint64_t v10 = (void *)MEMORY[0x263F83768];
      uint64_t v11 = (uint64_t *)MEMORY[0x263F83760];
      if (v12)
      {
        uint64_t v13 = *MEMORY[0x263F83770];
        uint64_t v14 = *MEMORY[0x263F83750];
      }
      else
      {
        if (![(ICTableColumnTextView *)self selectedRange])
        {
          uint64_t v15 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83770] modifierFlags:0 action:sel_moveUp_];
          [v7 addObject:v15];
        }
        uint64_t v16 = [(ICTableColumnTextView *)self selectedRange];
        uint64_t v17 = [(ICTableColumnTextView *)self textStorage];
        uint64_t v18 = [v17 length];

        uint64_t v14 = *MEMORY[0x263F83750];
        if (v16 == v18)
        {
          uint64_t v19 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83750] modifierFlags:0 action:sel_moveDown_];
          [v7 addObject:v19];
        }
        v20 = [MEMORY[0x263F82890] keyCommandWithInput:v14 modifierFlags:0x80000 action:sel_altMoveDown_];
        [v7 addObject:v20];

        uint64_t v13 = *MEMORY[0x263F83770];
        double v21 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83770] modifierFlags:0x80000 action:sel_altMoveUp_];
        [v7 addObject:v21];

        objc_opt_class();
        CGFloat v22 = [(ICTableColumnTextView *)self textStorage];
        double v23 = ICDynamicCast();

        uint64_t v44 = 0;
        id v24 = (id)objc_msgSend(v23, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange", 0), &v43);
        if ([(ICTableColumnTextView *)self atCellBoundaryForDirection:0])
        {
          uint64_t v25 = *v11;
          [MEMORY[0x263F82890] keyCommandWithInput:*v11 modifierFlags:0 action:sel_moveLeft_];
          v27 = CGFloat v26 = v10;
          [v7 addObject:v27];

          uint64_t v10 = v26;
          uint64_t v11 = (uint64_t *)MEMORY[0x263F83760];
          CGFloat v28 = [MEMORY[0x263F82890] keyCommandWithInput:v25 modifierFlags:0x80000 action:sel_moveLeft_];
          [v7 addObject:v28];
        }
        if ([(ICTableColumnTextView *)self atCellBoundaryForDirection:1])
        {
          uint64_t v29 = *v10;
          CGFloat v30 = [MEMORY[0x263F82890] keyCommandWithInput:*v10 modifierFlags:0 action:sel_moveRight_];
          [v7 addObject:v30];

          double v31 = [MEMORY[0x263F82890] keyCommandWithInput:v29 modifierFlags:0x80000 action:sel_moveRight_];
          [v7 addObject:v31];
        }
        if (!v44)
        {
          CGFloat v32 = [MEMORY[0x263F82890] keyCommandWithInput:@"\b" modifierFlags:0 action:sel_moveLeft_];
          [v7 addObject:v32];
        }
      }
      double v33 = [MEMORY[0x263F82890] keyCommandWithInput:v13 modifierFlags:0x100000 action:sel_moveToBeginningOfCell_];
      [v7 addObject:v33];

      double v34 = [MEMORY[0x263F82890] keyCommandWithInput:v14 modifierFlags:0x100000 action:sel_moveToEndOfCell_];
      [v7 addObject:v34];

      double v35 = [MEMORY[0x263F82890] keyCommandWithInput:v13 modifierFlags:1179648 action:sel_moveToBeginningOfCellAndModifySelection_];
      [v7 addObject:v35];

      double v36 = [MEMORY[0x263F82890] keyCommandWithInput:v14 modifierFlags:1179648 action:sel_moveToEndOfCellAndModifySelection_];
      [v7 addObject:v36];

      CGRect v37 = [MEMORY[0x263F82890] keyCommandWithInput:v13 modifierFlags:1572864 action:sel_addRowUp_];
      [v7 addObject:v37];

      CGRect v38 = [MEMORY[0x263F82890] keyCommandWithInput:v14 modifierFlags:1572864 action:sel_addRowDown_];
      [v7 addObject:v38];

      v39 = [MEMORY[0x263F82890] keyCommandWithInput:*v11 modifierFlags:1572864 action:sel_addColumnLeft_];
      [v7 addObject:v39];

      v40 = [MEMORY[0x263F82890] keyCommandWithInput:*v10 modifierFlags:1572864 action:sel_addColumnRight_];
      [v7 addObject:v40];

      v41 = [MEMORY[0x263F82890] keyCommandWithInput:@"\r" modifierFlags:0x80000 action:sel_shiftReturn_];
      [v7 addObject:v41];
    }
  }

  return v7;
}

- (void)moveUp:(id)a3
{
  id v3 = [(ICTableColumnTextView *)self cellDelegate];
  [v3 moveUpCell];
}

- (void)altMoveUp:(id)a3
{
  id v4 = a3;
  if ([(ICTableColumnTextView *)self selectedRange])
  {
    if ([(ICTableColumnTextView *)self atCellBoundaryForDirection:0]) {
      [(ICTableColumnTextView *)self moveUp:v4];
    }
    [(ICTableColumnTextView *)self moveToBeginningOfCell:v4];
  }
}

- (void)moveDown:(id)a3
{
  id v3 = [(ICTableColumnTextView *)self cellDelegate];
  [v3 moveDownCell];
}

- (void)altMoveDown:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(ICTableColumnTextView *)self selectedRange];
  objc_super v5 = [(ICTableColumnTextView *)self textStorage];
  uint64_t v6 = [v5 length];

  if (v4 != v6)
  {
    if ([(ICTableColumnTextView *)self atCellBoundaryForDirection:1]) {
      [(ICTableColumnTextView *)self moveDown:v7];
    }
    [(ICTableColumnTextView *)self moveToEndOfCell:v7];
  }
}

- (void)moveLeft:(id)a3
{
  id v3 = [(ICTableColumnTextView *)self cellDelegate];
  [v3 moveLeftCell];
}

- (void)moveRight:(id)a3
{
  id v3 = [(ICTableColumnTextView *)self cellDelegate];
  [v3 moveRightCell];
}

- (void)shiftReturn:(id)a3
{
}

- (void)addRowUp:(id)a3
{
  uint64_t v4 = [(ICTableColumnTextView *)self cellDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICTableColumnTextView *)self cellDelegate];
    [v6 addRowAboveSelection:self];
  }
}

- (void)addRowDown:(id)a3
{
  uint64_t v4 = [(ICTableColumnTextView *)self cellDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICTableColumnTextView *)self cellDelegate];
    [v6 addRowBelowSelection:self];
  }
}

- (void)addColumnLeft:(id)a3
{
  uint64_t v4 = [(ICTableColumnTextView *)self cellDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICTableColumnTextView *)self cellDelegate];
    [v6 addColumnLeftOfSelection:self];
  }
}

- (void)addColumnRight:(id)a3
{
  uint64_t v4 = [(ICTableColumnTextView *)self cellDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICTableColumnTextView *)self cellDelegate];
    [v6 addColumnRightOfSelection:self];
  }
}

- (void)deleteBackward
{
  objc_opt_class();
  id v3 = [(ICTableColumnTextView *)self textStorage];
  uint64_t v4 = ICDynamicCast();

  unint64_t v11 = 0;
  uint64_t v12 = 0;
  id v5 = (id)objc_msgSend(v4, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange"), &v11);
  if (v12
    || ([(ICTableColumnTextView *)self cellDelegate],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 acceptsKeystrokes],
        v6,
        !v7))
  {
    unint64_t v8 = [(ICTableColumnTextView *)self selectedRange];
    if (v8 > v11 || ([(ICTableColumnTextView *)self selectedRange], v9))
    {
      v10.receiver = self;
      v10.super_class = (Class)ICTableColumnTextView;
      [(ICBaseTextView *)&v10 deleteBackward];
    }
  }
  else if ([(ICTableColumnTextView *)self isProcessingDelete])
  {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_moveLeftCellAfterDelete object:0];
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_finishProcessingDelete object:0];
    [(ICTableColumnTextView *)self performSelector:sel_finishProcessingDelete withObject:0 afterDelay:0.5];
  }
  else
  {
    [(ICTableColumnTextView *)self performSelector:sel_moveLeftCellAfterDelete withObject:0 afterDelay:0.5];
    [(ICTableColumnTextView *)self setIsProcessingDelete:1];
  }
}

- (void)moveLeftCellAfterDelete
{
  [(ICTableColumnTextView *)self finishProcessingDelete];
  id v3 = [(ICTableColumnTextView *)self cellDelegate];
  [v3 moveLeftCell];
}

- (void)finishProcessingDelete
{
}

- (int64_t)returnKeyType
{
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isLargeiPad")) {
    return 0;
  }
  else {
    return 4;
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 _modifierFlags];
  uint64_t v9 = [v7 _modifiedInput];
  if ([v9 length] != 1) {
    goto LABEL_12;
  }
  if ((v8 & 0x180000) != 0) {
    goto LABEL_12;
  }
  objc_super v10 = [(ICTableColumnTextView *)self cellDelegate];
  int v11 = [v10 acceptsKeystrokes];

  if (!v11) {
    goto LABEL_12;
  }
  int v12 = [v9 characterAtIndex:0];
  int v13 = v12;
  if (v12 == 13 || v12 == 10)
  {
    uint64_t v16 = [(ICTableColumnTextView *)self markedTextRange];
    if (v16)
    {

      goto LABEL_12;
    }
    if (objc_msgSend(MEMORY[0x263F828A0], "ic_isShiftKeyPressed")) {
      goto LABEL_12;
    }
    if ((v8 & 0x20000) != 0)
    {
      uint64_t v15 = [(ICTableColumnTextView *)self cellDelegate];
      [v15 moveShiftReturnCell];
    }
    else
    {
      int v30 = [MEMORY[0x263F828A0] isInHardwareKeyboardMode];
      if (v13 == 13 && v30)
      {
        double v31 = [(ICTableColumnTextView *)self cellDelegate];
        uint64_t v15 = v31;
LABEL_39:
        [v31 moveReturnCell];
        goto LABEL_40;
      }
      int64_t v32 = [(ICTableColumnTextView *)self returnKeyType];
      double v31 = [(ICTableColumnTextView *)self cellDelegate];
      uint64_t v15 = v31;
      if (v32 != 4) {
        goto LABEL_39;
      }
      [v31 moveNextCell];
    }
LABEL_40:

    goto LABEL_28;
  }
  if (v12 == 9)
  {
    uint64_t v14 = [(ICTableColumnTextView *)self cellDelegate];
    uint64_t v15 = v14;
    if ((v8 & 0x20000) != 0) {
      [v14 movePrevCell];
    }
    else {
      [v14 moveTabCell];
    }
    goto LABEL_40;
  }
LABEL_12:
  uint64_t v17 = [(ICTableColumnTextView *)self selectedRange];
  uint64_t v19 = v18;
  v36.receiver = self;
  v36.super_class = (Class)ICTableColumnTextView;
  id v20 = v6;
  [(ICTableColumnTextView *)&v36 pressesBegan:v6 withEvent:v7];
  double v21 = [v7 _unmodifiedInput];
  int v22 = [v21 isEqualToString:*MEMORY[0x263F83760]];
  int v23 = [v21 isEqualToString:*MEMORY[0x263F83768]];
  if (![v7 _isKeyDown] || !(v22 | v23)) {
    goto LABEL_27;
  }
  if (v8 == 0x80000)
  {
    uint64_t v33 = v19;
    objc_opt_class();
    CGFloat v26 = [(ICTableColumnTextView *)self textStorage];
    uint64_t v25 = ICDynamicCast();

    v35[0] = 0;
    v35[1] = 0;
    id v27 = (id)[v25 rowAtIndex:v17 rowRange:v35];
    v34[0] = 0;
    v34[1] = 0;
    id v28 = (id)objc_msgSend(v25, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange"), v34);
    if (v35[0] != v34[0])
    {
      -[ICTableColumnTextView setSelectedRange:](self, "setSelectedRange:", v17, v33);
      if (v22)
      {
        uint64_t v29 = [(ICTableColumnTextView *)self cellDelegate];
        [v29 moveLeftCell];
      }
      else
      {
        if (!v23) {
          goto LABEL_26;
        }
        uint64_t v29 = [(ICTableColumnTextView *)self cellDelegate];
        [v29 moveRightCell];
      }
    }
  }
  else
  {
    if (v8 != 0x100000) {
      goto LABEL_27;
    }
    if ([(ICTableColumnTextView *)self selectedRange] != v17) {
      goto LABEL_27;
    }
    [(ICTableColumnTextView *)self selectedRange];
    if (v24 != v19) {
      goto LABEL_27;
    }
    if (v22)
    {
      uint64_t v25 = [(ICTableColumnTextView *)self cellDelegate];
      [v25 moveLeftCell];
    }
    else
    {
      if (!v23) {
        goto LABEL_27;
      }
      uint64_t v25 = [(ICTableColumnTextView *)self cellDelegate];
      [v25 moveRightCell];
    }
  }
LABEL_26:

LABEL_27:
  id v6 = v20;
LABEL_28:
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  id v8 = a3;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    uint64_t v9 = [(ICTableColumnTextView *)self beginningOfDocument];
    uint64_t v10 = [(ICTableColumnTextView *)self offsetFromPosition:v9 toPosition:v8];

    v43.receiver = self;
    v43.super_class = (Class)ICTableColumnTextView;
    int v11 = [(ICTableColumnTextView *)&v43 positionFromPosition:v8 inDirection:a4 offset:a5];
    int v12 = [(ICTableColumnTextView *)self beginningOfDocument];
    uint64_t v13 = [(ICTableColumnTextView *)self offsetFromPosition:v12 toPosition:v11];

    if (v13 == v10 && v13 >= 1)
    {
      uint64_t v13 = v10 - 1;
      uint64_t v15 = [(ICTableColumnTextView *)self beginningOfDocument];
      uint64_t v16 = [(ICTableColumnTextView *)self positionFromPosition:v15 offset:v10 - 1];

      int v11 = (void *)v16;
    }
    objc_opt_class();
    uint64_t v17 = [(ICTableColumnTextView *)self textStorage];
    uint64_t v18 = ICDynamicCast();

    v42[0] = 0;
    v42[1] = 0;
    id v19 = (id)[v18 rowAtIndex:v10 rowRange:v42];
    v41[0] = 0;
    v41[1] = 0;
    id v20 = (id)[v18 rowAtIndex:v13 rowRange:v41];
    if (v42[0] != v41[0])
    {
      [(ICBaseTextView *)self caretRectForPosition:v8];
      double MidX = CGRectGetMidX(v45);
      int v22 = [(ICTableColumnTextView *)self layoutManager];
      uint64_t v23 = [v22 glyphIndexForCharacterAtIndex:v13];

      uint64_t v24 = [(ICTableColumnTextView *)self layoutManager];
      [v24 lineFragmentRectForGlyphAtIndex:v23 effectiveRange:0 withoutAdditionalLayout:1];
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      CGFloat v32 = v31;

      v46.origin.CGFloat x = v26;
      v46.origin.CGFloat y = v28;
      v46.size.CGFloat width = v30;
      v46.size.CGFloat height = v32;
      if (!CGRectIsEmpty(v46))
      {
        uint64_t v33 = [(ICTableColumnTextView *)self layoutManager];
        v47.origin.CGFloat x = v26;
        v47.origin.CGFloat y = v28;
        v47.size.CGFloat width = v30;
        v47.size.CGFloat height = v32;
        double MidY = CGRectGetMidY(v47);
        double v35 = [(ICTableColumnTextView *)self textContainer];
        uint64_t v36 = objc_msgSend(v33, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v35, 0, MidX, MidY);

        if (v13 != v36)
        {
          CGRect v37 = [(ICTableColumnTextView *)self beginningOfDocument];
          uint64_t v38 = [(ICTableColumnTextView *)self positionFromPosition:v37 offset:v36];

          int v11 = (void *)v38;
        }
      }
    }
  }
  else
  {
    v40.receiver = self;
    v40.super_class = (Class)ICTableColumnTextView;
    int v11 = [(ICTableColumnTextView *)&v40 positionFromPosition:v8 inDirection:a4 offset:a5];
  }

  return v11;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v40 = *MEMORY[0x263EF8340];
  objc_opt_class();
  id v6 = [(ICTableColumnTextView *)self layoutManager];
  id v7 = ICDynamicCast();
  id v8 = [v7 tableLayoutManager];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v9 = [(ICTableColumnTextView *)self columnTextStorage];
  uint64_t v10 = [v9 populatedRows];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = 0;
    uint64_t v14 = *(void *)v36;
    while (2)
    {
      uint64_t v15 = 0;
      uint64_t v16 = v13;
      do
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void **)(*((void *)&v35 + 1) + 8 * v15);
        uint64_t v18 = [v8 rowPositions];
        id v19 = [v18 objectForKey:v17];
        [v19 doubleValue];
        double v21 = v20;

        if (y <= v21)
        {
          id v13 = v16;
          goto LABEL_12;
        }
        id v13 = v17;

        ++v15;
        uint64_t v16 = v13;
      }
      while (v12 != v15);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v13 = 0;
  }
LABEL_12:

  v34.receiver = self;
  v34.super_class = (Class)ICTableColumnTextView;
  int v22 = -[ICTableColumnTextView closestPositionToPoint:](&v34, sel_closestPositionToPoint_, x, y);
  if (v13)
  {
    uint64_t v23 = [(ICTableColumnTextView *)self columnTextStorage];
    unint64_t v24 = [v23 characterRangeForRowID:v13];
    uint64_t v26 = v25;

    double v27 = [(ICTableColumnTextView *)self beginningOfDocument];
    unint64_t v28 = [(ICTableColumnTextView *)self offsetFromPosition:v27 toPosition:v22];

    unint64_t v29 = v24 + v26;
    if (v28 < v24 + v26) {
      unint64_t v29 = v28;
    }
    if (v24 <= v29) {
      unint64_t v30 = v29;
    }
    else {
      unint64_t v30 = v24;
    }
    if (v28 != v30)
    {
      double v31 = [(ICTableColumnTextView *)self beginningOfDocument];
      uint64_t v32 = [(ICTableColumnTextView *)self positionFromPosition:v31 offset:v30];

      int v22 = (void *)v32;
    }
  }

  return v22;
}

- (id)undoManager
{
  v2 = [(ICBaseTextView *)self TTTextStorage];
  id v3 = [v2 undoManager];

  return v3;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICTableColumnTextView;
  id v3 = a3;
  unsigned __int8 v4 = [(ICBaseTextView *)&v7 gestureRecognizerShouldBegin:v3];
  NSClassFromString(&cfstr_Uitextselectio.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return v4 & ~isKindOfClass;
}

- (void)startEditingForTapGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTableColumnTextView *)self superview];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  id v10 = [(ICTableColumnTextView *)self cellDelegate];
  objc_msgSend(v10, "tappedTableAtLocation:", v7, v9);
}

- (void)didPasteOrDropText:(id)a3 toRange:(id)a4
{
  id v5 = [(ICTableColumnTextView *)self cellDelegate];
  [v5 didPasteOrDropTextForTableColumnTextView:self];
}

- (id)textDroppableView:(id)a3 proposalForDrop:(id)a4
{
  id v5 = a4;
  double v6 = [v5 dropSession];
  BOOL v7 = [(ICBaseTextView *)self shouldAcceptDropSession:v6];

  if (v7)
  {
    if ([v5 isSameView])
    {
      uint64_t v8 = [(ICTableColumnTextView *)self selectedRange];
      double v9 = [(ICTableColumnTextView *)self columnTextStorage];
      [v9 logicalRangeForLocation:v8];

      id v10 = [(ICTableColumnTextView *)self beginningOfDocument];
      uint64_t v11 = [v5 dropPosition];
      [(ICTableColumnTextView *)self offsetFromPosition:v10 toPosition:v11];

      uint64_t v12 = 3;
    }
    else
    {
      uint64_t v12 = 2;
    }
  }
  else
  {
    uint64_t v12 = 1;
  }
  id v13 = (void *)[objc_alloc(MEMORY[0x263F82CE0]) initWithDropOperation:v12];

  return v13;
}

- (void)toggleBoldface:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ICTableColumnTextView;
  [(ICBaseTextView *)&v3 toggleBoldface:a3];
}

- (void)toggleItalics:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ICTableColumnTextView;
  [(ICBaseTextView *)&v3 toggleItalics:a3];
}

- (void)toggleUnderline:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ICTableColumnTextView;
  [(ICBaseTextView *)&v3 toggleUnderline:a3];
}

- (id)inputAssistantItem
{
  v2 = [(ICBaseTextView *)self editorController];
  objc_super v3 = [v2 textView];
  id v4 = [v3 inputAssistantItem];

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(ICTableColumnTextView *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/Common/TextAttachmentUI/ICTableColumnTextView_iOS.m"])
  {
    char v13 = [(ICTableColumnTextView *)self ic_shouldIgnoreObserveValue:v12 ofObject:v11 forKeyPath:v10];

    if ((v13 & 1) == 0)
    {
      id v14 = [(ICBaseTextView *)self editorController];
      if (v14 == v11)
      {
        int v15 = [v10 isEqual:@"textView.editable"];

        if (v15)
        {
          uint64_t v16 = [(ICBaseTextView *)self editorController];
          uint64_t v17 = [v16 textView];
          uint64_t v18 = [v17 isEditable];

          if (v18 != [(ICTableColumnTextView *)self isEditable])
          {
            id v19 = [(ICTableColumnTextView *)self columnTextStorage];
            [v19 setShouldPreventUndoCommands:1];

            double v20 = [(ICTableColumnTextView *)self columnTextStorage];
            [v20 beginPreventEditingUpdates];

            [(ICTableColumnTextView *)self setEditable:v18];
            double v21 = [(ICTableColumnTextView *)self columnTextStorage];
            [v21 endPreventEditingUpdates];

            int v22 = [(ICTableColumnTextView *)self columnTextStorage];
            [v22 setShouldPreventUndoCommands:0];
          }
        }
      }
      else
      {
      }
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)ICTableColumnTextView;
    [(ICTableColumnTextView *)&v23 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (BOOL)isAccessibilityTableTextView
{
  return 1;
}

- (id)baseAttributedStringForAccessibility
{
  objc_opt_class();
  objc_super v3 = [(ICTableColumnTextView *)self textStorage];
  id v4 = ICDynamicCast();

  uint64_t v9 = 0;
  uint64_t v10 = 0;
  id v5 = (id)objc_msgSend(v4, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange"), &v9);
  double v6 = [(ICTableColumnTextView *)self textStorage];
  BOOL v7 = objc_msgSend(v6, "attributedSubstringFromRange:", v9, v10);

  return v7;
}

- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3
{
  NSUInteger location = a3->location;
  NSUInteger length = a3->length;
  double v6 = [(ICTableColumnTextView *)self baseAttributedStringForAccessibility];
  BOOL v7 = [(ICTableColumnTextView *)self _icaxAccessibilityAttributedStringFromOriginalString:v6];

  if (location <= [v7 length])
  {
    uint64_t v9 = [v7 length];
    if (v9 - location >= length) {
      NSUInteger v10 = length;
    }
    else {
      NSUInteger v10 = v9 - location;
    }
    uint64_t v8 = objc_msgSend(v7, "attributedSubstringFromRange:", location, v10);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_icaxAccessibilityAttributedStringFromOriginalString:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F089B8];
  id v5 = a3;
  id v6 = [v4 alloc];
  BOOL v7 = [v5 string];
  uint64_t v8 = (void *)[v6 initWithString:v7];

  uint64_t v9 = *MEMORY[0x263F814A0];
  uint64_t v10 = [v5 length];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __78__ICTableColumnTextView__icaxAccessibilityAttributedStringFromOriginalString___block_invoke;
  uint64_t v17 = &unk_2640B8C78;
  uint64_t v18 = self;
  id v19 = v8;
  id v11 = v8;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v10, 0, &v14);

  id v12 = objc_msgSend(v11, "copy", v14, v15, v16, v17, v18);

  return v12;
}

void __78__ICTableColumnTextView__icaxAccessibilityAttributedStringFromOriginalString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [*(id *)(a1 + 32) layoutManager];
  uint64_t v9 = [v10 viewForLayoutManager:v8];

  if (v9) {
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x263F216E0], v9, a3, a4);
  }
}

- (_NSRange)_accessibilitySelectedTextRange
{
  uint64_t v4 = [(ICTableColumnTextView *)self selectedRange];

  NSUInteger v5 = -[ICTableColumnTextView rangeInSelectedCellFromRangeInTextView:](self, "rangeInSelectedCellFromRangeInTextView:", v4, v3);
  result.NSUInteger length = v6;
  result.NSUInteger location = v5;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v6 = a3.location + a3.length;
  id v7 = [(ICTableColumnTextView *)self baseAttributedStringForAccessibility];
  unint64_t v8 = [v7 length];

  if (v6 <= v8)
  {
    uint64_t v10 = -[ICTableColumnTextView rangeInTextViewFromRangeInSelectedCell:](self, "rangeInTextViewFromRangeInSelectedCell:", location, length);
    -[ICTableColumnTextView setSelectedRange:](self, "setSelectedRange:", v10, v9);
  }
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  uint64_t v4 = -[ICTableColumnTextView rangeInTextViewFromRangeInSelectedCell:](self, "rangeInTextViewFromRangeInSelectedCell:", a3.location, a3.length);
  v10.receiver = self;
  v10.super_class = (Class)ICTableColumnTextView;
  -[ICBaseTextView _accessibilityBoundsForRange:](&v10, sel__accessibilityBoundsForRange_, v4, v5);
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (_NSRange)rangeInSelectedCellFromRangeInTextView:(_NSRange)a3
{
  unint64_t v14 = 0;
  uint64_t v15 = 0;
  objc_opt_class();
  uint64_t v4 = [(ICTableColumnTextView *)self textStorage];
  uint64_t v5 = ICDynamicCast();

  double v6 = objc_msgSend(v5, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange"), &v14);
  if (v6)
  {
    unint64_t v7 = [(ICTableColumnTextView *)self selectedRange];
    if (v7 >= v14) {
      uint64_t v8 = v7 - v14;
    }
    else {
      uint64_t v8 = 0;
    }
    NSUInteger v9 = v15 - v8;
    [(ICTableColumnTextView *)self selectedRange];
    if (v9 >= v10) {
      NSUInteger v11 = v10;
    }
    else {
      NSUInteger v11 = v9;
    }
  }
  else
  {
    NSUInteger v11 = 0;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v12 = v8;
  NSUInteger v13 = v11;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (_NSRange)rangeInTextViewFromRangeInSelectedCell:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  objc_opt_class();
  double v6 = [(ICTableColumnTextView *)self textStorage];
  unint64_t v7 = ICDynamicCast();

  uint64_t v8 = objc_msgSend(v7, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange"), &v12);
  if (v8)
  {
    uint64_t v9 = v12 + location;
    if (v13 - location < length) {
      NSUInteger length = v13 - location;
    }
  }
  else
  {
    NSUInteger length = 0;
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v10 = v9;
  NSUInteger v11 = length;
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (id)accessibilityLabel
{
  return 0;
}

- (CGRect)accessibilityFrame
{
  objc_opt_class();
  uint64_t v3 = [(ICTableColumnTextView *)self cellDelegate];
  uint64_t v4 = ICDynamicCast();

  uint64_t v5 = [v4 tableAXController];
  double v6 = [v5 selectedCells];
  unint64_t v7 = [v6 firstObject];
  [v7 accessibilityFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (BOOL)_accessibilityScrollToVisible
{
  return 0;
}

- (BOOL)_accessibilityCanDrag
{
  return 0;
}

- (id)accessibilityDragSourceDescriptors
{
  return 0;
}

- (BOOL)scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  uint64_t v5 = [(ICTableColumnTextView *)self cellDelegate];
  if ([v5 isNoteEditable]) {
    BOOL v6 = [(ICTableColumnTextView *)self canBecomeFirstResponder];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)indirectScribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  id v5 = [(ICTableColumnTextView *)self cellDelegate];
  [v5 beginEditingSelectedRangeInTextView:self];
}

- (void)indirectScribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  double v10 = (void (**)(id, void *))a5;
  BOOL v6 = [(ICTableColumnTextView *)self columnTextStorage];
  unint64_t v7 = [v6 populatedRows];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    double v9 = [v6 populatedRows];
    v10[2](v10, v9);
  }
  else
  {
    v10[2](v10, (void *)MEMORY[0x263EFFA68]);
  }
}

- (BOOL)indirectScribbleInteraction:(id)a3 isElementFocused:(id)a4
{
  id v5 = a4;
  int v6 = [(ICTableColumnTextView *)self isFirstResponder];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"[elementIdentifier isKindOfClass:[NSUUID class]]" functionName:"-[ICTableColumnTextView indirectScribbleInteraction:isElementFocused:]" simulateCrash:1 showAlert:0 format:@"Expected NSUUID in indirectScribbleInteraction:isElementFocused:"];
  }
  objc_opt_class();
  unint64_t v7 = ICDynamicCast();
  if (v7) {
    int v8 = v6;
  }
  else {
    int v8 = 0;
  }
  if (v8 == 1)
  {
    double v9 = [(ICTableColumnTextView *)self columnTextStorage];
    double v10 = objc_msgSend(v9, "rowAtIndex:rowRange:", -[ICTableColumnTextView selectedRange](self, "selectedRange"), 0);
    LOBYTE(v6) = [v10 isEqual:v7];
  }
  return v6;
}

- (CGRect)indirectScribbleInteraction:(id)a3 frameForElement:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"[elementIdentifier isKindOfClass:[NSUUID class]]" functionName:"-[ICTableColumnTextView indirectScribbleInteraction:frameForElement:]" simulateCrash:1 showAlert:0 format:@"Expected NSUUID in indirectScribbleInteraction:frameForElement:"];
  }
  objc_opt_class();
  int v6 = ICDynamicCast();
  if (v6)
  {
    unint64_t v7 = [(ICTableColumnTextView *)self cellDelegate];
    [v7 frameOfCellForColumnTextView:self row:v6];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v9 = *MEMORY[0x263F001A0];
    double v11 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v13 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v15 = *(double *)(MEMORY[0x263F001A0] + 24);
  }

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (void)indirectScribbleInteraction:(id)a3 focusElementIfNeeded:(id)a4 referencePoint:(CGPoint)a5 completion:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  id v24 = a4;
  double v10 = (void (**)(id, ICTableColumnTextView *))a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"[elementIdentifier isKindOfClass:[NSUUID class]]" functionName:"-[ICTableColumnTextView indirectScribbleInteraction:focusElementIfNeeded:referencePoint:completion:]" simulateCrash:1 showAlert:0 format:@"Expected NSUUID in indirectScribbleInteraction:focusElementIfNeeded:..."];
  }
  objc_opt_class();
  double v11 = ICDynamicCast();
  double v12 = [(ICTableColumnTextView *)self columnTextStorage];
  double v13 = v12;
  if (v11
    && ([v12 populatedRows],
        double v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 containsObject:v11],
        v14,
        v15))
  {
    [(ICTableColumnTextView *)self becomeFirstResponder];
    NSUInteger v16 = [v13 characterRangeForRowID:v11];
    uint64_t v18 = v17;
    v20.NSUInteger location = [(ICTableColumnTextView *)self selectedRange];
    if (v19 <= 1) {
      v20.NSUInteger length = 1;
    }
    else {
      v20.NSUInteger length = v19;
    }
    v26.NSUInteger length = v18 + 1;
    v26.NSUInteger location = v16;
    if (!NSIntersectionRange(v26, v20).length)
    {
      double v21 = -[ICTableColumnTextView closestPositionToPoint:](self, "closestPositionToPoint:", x, y);
      if (v21)
      {
        int v22 = [(ICTableColumnTextView *)self beginningOfDocument];
        uint64_t v23 = [(ICTableColumnTextView *)self offsetFromPosition:v22 toPosition:v21];

        -[ICTableColumnTextView setSelectedRange:](self, "setSelectedRange:", v23, 0);
      }
    }
  }
  else
  {
    self = 0;
  }
  v10[2](v10, self);
}

- (void)setupMenuController
{
  v5[1] = *MEMORY[0x263EF8340];
  if (ICDebugModeEnabled())
  {
    v2 = [MEMORY[0x263F82950] sharedMenuController];
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F82968]) initWithTitle:@"Tags" action:sel_openExperimentalHashtagUI_];
    v5[0] = v3;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
    objc_msgSend(v2, "ic_addMenuItemsIfNecessary:", v4);
  }
}

- (void)openExperimentalHashtagUI:(id)a3
{
  if (ICDebugModeEnabled())
  {
    int v6 = objc_alloc_init(ICHashtagViewController);
    [(ICHashtagViewController *)v6 setDelegate:self];
    uint64_t v4 = [(ICTableColumnTextView *)self cellDelegate];
    id v5 = [v4 viewController];
    [v5 presentViewController:v6 animated:1 completion:0];
  }
}

- (void)hashtagViewController:(id)a3 insertHashtagWithText:(id)a4
{
  id v5 = a4;
  int v6 = [(ICTableColumnTextView *)self cellDelegate];
  id v15 = [v6 account];

  unint64_t v7 = [(ICTableColumnTextView *)self cellDelegate];
  double v8 = [v7 note];

  double v9 = [(ICTableColumnTextView *)self cellDelegate];
  double v10 = [v9 attachment];

  double v11 = [MEMORY[0x263F5AC50] hashtagWithDisplayText:v5 account:v15 createIfNecessary:1];

  if (!v11) {
    objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((hashtag) != nil)", "-[ICTableColumnTextView hashtagViewController:insertHashtagWithText:]", 1, 0, @"Expected non-nil value for '%s'", "hashtag");
  }
  double v12 = (void *)MEMORY[0x263F5AC68];
  double v13 = [v11 displayText];
  double v14 = [v12 createHashtagAttachmentIfApplicableWithHashtagText:v13 forHashtag:v11 note:v8 parentAttachment:v10];

  if (v14) {
    [(ICTableColumnTextView *)self insertInlineAttachment:v14 saveAndResumeEditingForAttachment:v10 inNote:v8];
  }
}

- (void)hashtagViewController:(id)a3 insertUnknownInlineAttachmentWithText:(id)a4
{
  id v5 = a4;
  int v6 = [(ICTableColumnTextView *)self cellDelegate];
  id v12 = [v6 note];

  unint64_t v7 = [(ICTableColumnTextView *)self cellDelegate];
  double v8 = [v7 attachment];

  double v9 = (void *)MEMORY[0x263F5AC68];
  double v10 = [(id)*MEMORY[0x263F5AAD0] stringByAppendingString:@".unknown"];
  double v11 = [v9 createInlineAttachmentIfApplicableWithTypeUTI:v10 altText:v5 tokenContentIdentifier:v5 note:v12 parentAttachment:v8];

  if (v11) {
    [(ICTableColumnTextView *)self insertInlineAttachment:v11 saveAndResumeEditingForAttachment:v8 inNote:v12];
  }
}

- (void)hashtagViewController:(id)a3 insertFutureHashtagWithText:(id)a4
{
  id v5 = a4;
  int v6 = [(ICTableColumnTextView *)self cellDelegate];
  id v15 = [v6 account];

  unint64_t v7 = [(ICTableColumnTextView *)self cellDelegate];
  double v8 = [v7 note];

  double v9 = [(ICTableColumnTextView *)self cellDelegate];
  double v10 = [v9 attachment];

  double v11 = [MEMORY[0x263F5AC50] hashtagWithDisplayText:v5 account:v15 createIfNecessary:1];

  if (!v11) {
    objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((hashtag) != nil)", "-[ICTableColumnTextView hashtagViewController:insertFutureHashtagWithText:]", 1, 0, @"Expected non-nil value for '%s'", "hashtag");
  }
  id v12 = (void *)MEMORY[0x263F5AC68];
  double v13 = [v11 displayText];
  double v14 = [v12 createHashtagAttachmentIfApplicableWithHashtagText:v13 forHashtag:v11 note:v8 parentAttachment:v10];

  if (v14)
  {
    objc_msgSend(v14, "requireMinimumSupportedVersionAndPropagateToChildObjects:", objc_msgSend(MEMORY[0x263F5ABF0], "currentNotesVersion") + 1);
    [(ICTableColumnTextView *)self insertInlineAttachment:v14 saveAndResumeEditingForAttachment:v10 inNote:v8];
  }
}

- (void)insertInlineAttachment:(id)a3 saveAndResumeEditingForAttachment:(id)a4 inNote:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v12 = a3;
  uint64_t v10 = [(ICTableColumnTextView *)self selectedRange];
  -[ICTableColumnTextView insertInlineAttachment:saveAndResumeEditingForAttachment:inNote:forRange:](self, "insertInlineAttachment:saveAndResumeEditingForAttachment:inNote:forRange:", v12, v9, v8, v10, v11);
}

- (void)insertInlineAttachment:(id)a3 saveAndResumeEditingForAttachment:(id)a4 inNote:(id)a5 forRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  unint64_t location = a6.location;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  objc_opt_class();
  double v14 = [(ICTableColumnTextView *)self textStorage];
  id v15 = ICCheckedDynamicCast();

  if (v15)
  {
    if (location > [v15 length])
    {
      NSUInteger v16 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v21.unint64_t location = location;
        v21.NSUInteger length = length;
        -[ICTableColumnTextView insertInlineAttachment:saveAndResumeEditingForAttachment:inNote:forRange:](v21, v15, v16);
      }

      unint64_t location = [v15 length];
    }
    uint64_t v17 = [MEMORY[0x263F5B370] textAttachmentWithAttachment:v11];
    uint64_t v18 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v17];
    NSUInteger v19 = (void *)[v18 mutableCopy];

    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x263F814A0], v17, 0, objc_msgSend(v19, "length"));
    objc_msgSend(v15, "replaceCharactersInRange:withAttributedString:", location, length, v19);
    -[ICTableColumnTextView setSelectedRange:](self, "setSelectedRange:", location + length, 0);
    [v15 fixupAfterEditing];
    NSRange v20 = [(ICTableColumnTextView *)self cellDelegate];
    [v20 setNeedsSave];

    [v11 updateChangeCountWithReason:@"Inserted inline attachment in table"];
    [v12 updateChangeCountWithReason:@"Inserted inline attachment in table"];
    [v13 updateChangeCountWithReason:@"Inserted inline attachment in table"];
    [v13 save];
  }
}

- (void)openLinkEditor:(id)a3
{
  v31[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)MEMORY[0x263F5AB68];
  id v5 = [(ICTableColumnTextView *)self textStorage];
  uint64_t v6 = [(ICTableColumnTextView *)self selectedRange];
  id v8 = objc_msgSend(v4, "URLForAttributedString:range:", v5, v6, v7);

  id v9 = [(ICTableColumnTextView *)self selectedText];
  uint64_t v10 = [(ICTableColumnTextView *)self textStorage];
  uint64_t v11 = objc_msgSend(v10, "attribute:atIndex:effectiveRange:", *MEMORY[0x263F814A0], -[ICTableColumnTextView selectedRange](self, "selectedRange"), 0);

  objc_opt_class();
  id v12 = ICDynamicCast();
  long long v30 = xmmword_20C1794E0;
  unint64_t v29 = (void *)v11;
  if (!v8) {
    goto LABEL_5;
  }
  id v13 = [(ICTableColumnTextView *)self textStorage];
  uint64_t v14 = *MEMORY[0x263F81520];
  uint64_t v15 = [(ICTableColumnTextView *)self selectedRange];
  NSUInteger v16 = [(ICTableColumnTextView *)self textStorage];
  id v17 = (id)objc_msgSend(v13, "attribute:atIndex:longestEffectiveRange:inRange:", v14, v15, &v30, 0, objc_msgSend(v16, "length"));

  if ((void)v30 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_5;
  }
  if (*((void *)&v30 + 1))
  {
    uint64_t v18 = -[ICTableColumnTextView ic_textRangeFromCharacterRange:](self, "ic_textRangeFromCharacterRange:");
    uint64_t v19 = [(ICTableColumnTextView *)self textInRange:v18];

    id v9 = (void *)v19;
  }
  else
  {
LABEL_5:
    *(void *)&long long v30 = [(ICTableColumnTextView *)self selectedRange];
    *((void *)&v30 + 1) = v20;
  }
  NSRange v21 = [(ICTableColumnTextView *)self cellDelegate];
  int v22 = [v21 note];
  uint64_t v23 = [v22 mergeableString];
  id v24 = [MEMORY[0x263F08D40] valueWithRange:v30];
  v31[0] = v24;
  uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
  NSRange v26 = [v23 selectionForCharacterRanges:v25 selectionAffinity:1];

  double v27 = [(ICBaseTextView *)self editorController];
  id v28 = +[ICLinkEditorViewControllerHelper presentFromViewController:v27 delegate:self text:v9 url:v8 attachment:v12 stringSelection:v26 range:v30 addApproach:3];
}

- (void)createLink:(id)a3 title:(id)a4 textSelection:(id)a5 range:(_NSRange)a6 addApproach:(int64_t)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [(ICTableColumnTextView *)self textStorage];
  id v37 = [v14 attributesAtIndex:location effectiveRange:0];

  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v12];
  uint64_t v16 = objc_msgSend(v15, "ic_range");
  objc_msgSend(v15, "addAttributes:range:", v37, v16, v17);
  uint64_t v18 = *MEMORY[0x263F81520];
  uint64_t v19 = objc_msgSend(v15, "ic_range");
  objc_msgSend(v15, "addAttribute:value:range:", v18, v13, v19, v20);
  uint64_t v21 = *MEMORY[0x263F394D8];
  uint64_t v22 = objc_msgSend(v15, "ic_range");
  objc_msgSend(v15, "removeAttribute:range:", v21, v22, v23);
  id v24 = [(ICTableColumnTextView *)self textStorage];
  uint64_t v25 = (void *)[v15 copy];
  objc_msgSend(v24, "replaceCharactersInRange:withAttributedString:", location, length, v25);

  NSRange v26 = [(ICTableColumnTextView *)self cellDelegate];
  [v26 setNeedsSave];

  double v27 = [(ICTableColumnTextView *)self cellDelegate];
  id v28 = [v27 attachment];
  [v28 updateChangeCountWithReason:@"Created link in table"];

  unint64_t v29 = [(ICTableColumnTextView *)self cellDelegate];
  long long v30 = [v29 note];
  [v30 updateChangeCountWithReason:@"Created link in table"];

  double v31 = [(ICTableColumnTextView *)self cellDelegate];
  uint64_t v32 = [v31 note];
  [v32 save];

  uint64_t v33 = [(ICTableColumnTextView *)self eventReporter];
  objc_super v34 = [(ICTableColumnTextView *)self cellDelegate];
  long long v35 = [v34 note];
  [v33 submitAddLinkEvent:v35 addApproach:a7 url:v13];

  long long v36 = [(ICBaseTextView *)self editorController];
  [v36 startEditing];

  [(ICTableColumnTextView *)self becomeFirstResponder];
}

- (void)createNoteLinkAttachment:(id)a3 textSelection:(id)a4 range:(_NSRange)a5 addApproach:(int64_t)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v10 = (void *)MEMORY[0x263F5AC98];
  id v11 = a3;
  id v12 = [(ICTableColumnTextView *)self cellDelegate];
  id v13 = [v12 note];
  uint64_t v14 = [v13 managedObjectContext];
  uint64_t v15 = [v10 noteWithIdentifier:v11 context:v14];

  if (v15)
  {
    uint64_t v16 = (void *)MEMORY[0x263F5AC68];
    uint64_t v17 = [(ICTableColumnTextView *)self cellDelegate];
    uint64_t v18 = [v17 note];
    uint64_t v19 = (void *)[v16 newLinkAttachmentToNote:v15 fromNote:v18 parentAttachment:0];

    if (v19)
    {
      uint64_t v20 = [(ICTableColumnTextView *)self cellDelegate];
      uint64_t v21 = [v20 attachment];
      uint64_t v22 = [(ICTableColumnTextView *)self cellDelegate];
      uint64_t v23 = [v22 note];
      -[ICTableColumnTextView insertInlineAttachment:saveAndResumeEditingForAttachment:inNote:forRange:](self, "insertInlineAttachment:saveAndResumeEditingForAttachment:inNote:forRange:", v19, v21, v23, location, length);

      id v24 = [(ICTableColumnTextView *)self eventReporter];
      uint64_t v25 = [(ICTableColumnTextView *)self cellDelegate];
      NSRange v26 = [v25 note];
      [v24 submitAddLinkEvent:v26 addApproach:a6 contentType:1 isTokenized:1];

      double v27 = [(ICBaseTextView *)self editorController];
      [v27 startEditing];

      [(ICTableColumnTextView *)self becomeFirstResponder];
    }
  }
  else
  {
    id v28 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v29 = 0;
      _os_log_impl(&dword_20BE60000, v28, OS_LOG_TYPE_DEFAULT, "Attempted to create Note Link Attachment to nil Note", v29, 2u);
    }
  }
}

- (void)removeLinksFromTextSelection:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v7 = [(ICTableColumnTextView *)self textStorage];
  objc_msgSend(v7, "removeAttribute:range:", *MEMORY[0x263F81520], location, length);

  id v8 = [(ICTableColumnTextView *)self cellDelegate];
  [v8 setNeedsSave];

  id v9 = [(ICTableColumnTextView *)self cellDelegate];
  uint64_t v10 = [v9 attachment];
  [v10 updateChangeCountWithReason:@"Removed link from table"];

  id v11 = [(ICTableColumnTextView *)self cellDelegate];
  id v12 = [v11 note];
  [v12 updateChangeCountWithReason:@"Removed link from table"];

  id v14 = [(ICTableColumnTextView *)self cellDelegate];
  id v13 = [v14 note];
  [v13 save];
}

- (void)removeLinksFromCurrentSelection
{
  uint64_t v3 = [(ICTableColumnTextView *)self textStorage];
  uint64_t v4 = [(ICTableColumnTextView *)self selectedRange];
  uint64_t v6 = v5;
  objc_msgSend(v3, "removeAttribute:range:", *MEMORY[0x263F81520], v4, v5);
  uint64_t v7 = *MEMORY[0x263F814A0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__ICTableColumnTextView_removeLinksFromCurrentSelection__block_invoke;
  v9[3] = &unk_2640B89D0;
  id v10 = v3;
  id v8 = v3;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v7, v4, v6, 0, v9);
}

void __56__ICTableColumnTextView_removeLinksFromCurrentSelection__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = [v14 attachment];
  id v9 = [v8 typeUTI];
  int v10 = [v9 isEqualToString:*MEMORY[0x263F5AAD8]];

  if (v10)
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = [v14 attachment];
    id v13 = [v12 displayText];
    objc_msgSend(v11, "replaceCharactersInRange:withString:", a3, a4, v13);
  }
}

- (BOOL)shouldShowFloatingSuggestions
{
  v2 = [(ICTableColumnTextView *)self traitCollection];
  if (objc_msgSend(v2, "ic_hasCompactSize")) {
    char v3 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter && [MEMORY[0x263F5A768] isOptedInForAnalytics])
  {
    id v3 = objc_alloc(MEMORY[0x263F5A768]);
    uint64_t v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    uint64_t v6 = (ICNAEventReporter *)[v3 initWithSubTrackerName:v5 view:self];
    eventReporter = self->_eventReporter;
    self->_eventReporter = v6;

    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:self selector:sel_eventReporterLostSession_ name:*MEMORY[0x263F5A750] object:self->_eventReporter];
  }
  id v9 = self->_eventReporter;

  return v9;
}

- (void)eventReporterLostSession:(id)a3
{
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  id v5 = a3;

  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v6 = *MEMORY[0x263F5A750];
  id v7 = [v5 object];

  [v8 removeObserver:self name:v6 object:v7];
}

- (NSUUID)columnID
{
  return self->_columnID;
}

- (void)setColumnID:(id)a3
{
}

- (ICTableColumnTextViewDelegate)cellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cellDelegate);

  return (ICTableColumnTextViewDelegate *)WeakRetained;
}

- (void)setCellDelegate:(id)a3
{
}

- (ICTableSelectionDelegate)selectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);

  return (ICTableSelectionDelegate *)WeakRetained;
}

- (void)setSelectionDelegate:(id)a3
{
}

- (BOOL)isChangingFont
{
  return self->_isChangingFont;
}

- (void)setIsChangingFont:(BOOL)a3
{
  self->_isChangingFont = a3;
}

- (BOOL)isResigningFirstResponder
{
  return self->_isResigningFirstResponder;
}

- (void)setIsResigningFirstResponder:(BOOL)a3
{
  self->_isResigningFirstResponder = a3;
}

- (_NSRange)previousSelectedRange
{
  p_previousSelectedRange = &self->_previousSelectedRange;
  NSUInteger location = self->_previousSelectedRange.location;
  NSUInteger length = p_previousSelectedRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setPreviousSelectedRange:(_NSRange)a3
{
  self->_previousSelectedRange = a3;
}

- (ICHashtagController)hashtagController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hashtagController);

  return (ICHashtagController *)WeakRetained;
}

- (void)setHashtagController:(id)a3
{
}

- (ICMentionsController)mentionsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mentionsController);

  return (ICMentionsController *)WeakRetained;
}

- (void)setMentionsController:(id)a3
{
}

- (BOOL)isProcessingDelete
{
  return self->_isProcessingDelete;
}

- (void)setIsProcessingDelete:(BOOL)a3
{
  self->_isProcessingDelete = a3;
}

- (void)setEventReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_destroyWeak((id *)&self->_mentionsController);
  objc_destroyWeak((id *)&self->_hashtagController);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_destroyWeak((id *)&self->_cellDelegate);

  objc_storeStrong((id *)&self->_columnID, 0);
}

- (void)moveToBeginningOfCell:(id)a3
{
  uint64_t v4 = [(ICTableColumnTextView *)self selectedRange];
  id v5 = [(ICBaseTextView *)self TTTextStorage];
  uint64_t v6 = [v5 logicalRangeForLocation:v4];

  if (v4 == v6)
  {
    id v7 = [(ICTableColumnTextView *)self cellDelegate];
    [v7 moveUpCell];
  }
  else
  {
    -[ICTableColumnTextView setSelectedRange:](self, "setSelectedRange:", v6, 0);
  }
}

- (void)moveToEndOfCell:(id)a3
{
  uint64_t v4 = [(ICTableColumnTextView *)self selectedRange];
  uint64_t v6 = v4 + v5;
  id v7 = [(ICBaseTextView *)self TTTextStorage];
  uint64_t v8 = [v7 logicalRangeForLocation:v6];
  uint64_t v10 = v9;

  if (v6 == v8 + v10)
  {
    id v11 = [(ICTableColumnTextView *)self cellDelegate];
    [v11 moveDownCell];
  }
  else
  {
    -[ICTableColumnTextView setSelectedRange:](self, "setSelectedRange:");
  }
}

- (void)moveToBeginningOfCellAndModifySelection:(id)a3
{
  NSUInteger v4 = [(ICTableColumnTextView *)self selectedRange];
  NSUInteger v6 = v5;
  id v7 = [(ICBaseTextView *)self TTTextStorage];
  NSUInteger v8 = [v7 logicalRangeForLocation:v4];

  v11.NSUInteger location = v8;
  v11.NSUInteger length = 0;
  v12.NSUInteger location = v4;
  v12.NSUInteger length = v6;
  NSRange v9 = NSUnionRange(v11, v12);

  -[ICTableColumnTextView setSelectedRange:](self, "setSelectedRange:", v9.location, v9.length);
}

- (void)moveToEndOfCellAndModifySelection:(id)a3
{
  NSUInteger v4 = [(ICTableColumnTextView *)self selectedRange];
  NSUInteger v6 = v5;
  id v7 = [(ICBaseTextView *)self TTTextStorage];
  uint64_t v8 = [v7 logicalRangeForLocation:v4];
  uint64_t v10 = v9;

  v13.NSUInteger location = v8 + v10;
  v13.NSUInteger length = 0;
  v14.NSUInteger location = v4;
  v14.NSUInteger length = v6;
  NSRange v11 = NSUnionRange(v13, v14);

  -[ICTableColumnTextView setSelectedRange:](self, "setSelectedRange:", v11.location, v11.length);
}

- (BOOL)atCellBoundaryForDirection:(unint64_t)a3
{
  uint64_t v5 = [(ICTableColumnTextView *)self selectedRange];
  uint64_t v7 = v6;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v8 = [(ICTableColumnTextView *)self columnTextStorage];
  id v9 = (id)[v8 rowAtIndex:v5 rowRange:&v20];
  uint64_t v10 = v20;
  uint64_t v11 = v21;
  if (v21) {
    BOOL v12 = v5 == v20;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    NSRange v13 = [(ICTableColumnTextView *)self textStorage];
    uint64_t v14 = objc_msgSend(v13, "ic_writingDirectionAtIndex:", v5);

    if (!(a3 | v14) || a3 == 1 && v14 == 1) {
      goto LABEL_16;
    }
    uint64_t v10 = v20;
    uint64_t v11 = v21;
  }
  else if (!v21)
  {
LABEL_16:
    BOOL v18 = 1;
    goto LABEL_18;
  }
  uint64_t v15 = v5 + v7;
  if (v15 != v11 + v10)
  {
    BOOL v18 = 0;
    goto LABEL_18;
  }
  uint64_t v16 = [(ICTableColumnTextView *)self textStorage];
  uint64_t v17 = objc_msgSend(v16, "ic_writingDirectionAtIndex:", v15 - 1);

  if (!a3 && v17 == 1) {
    goto LABEL_16;
  }
  BOOL v18 = 0;
  if (a3 == 1 && !v17) {
    goto LABEL_16;
  }
LABEL_18:

  return v18;
}

- (void)insertInlineAttachment:(NSObject *)a3 saveAndResumeEditingForAttachment:inNote:forRange:.cold.1(NSRange a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = NSStringFromRange(a1);
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2048;
  uint64_t v9 = [a2 length];
  _os_log_error_impl(&dword_20BE60000, a3, OS_LOG_TYPE_ERROR, "Attempted to addInlineAttachment:atTextRange: with an out of bound range: %@. Adding inline attachment to the end of text storage instead, %lu.", (uint8_t *)&v6, 0x16u);
}

@end