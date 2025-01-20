@interface ICTK2TodoTextAttachmentViewProvider
- (BOOL)selectedRangesIntersectWithRange:(_NSRange)a3;
- (ICNAEventReporter)eventReporter;
- (ICTK2TextView)textView;
- (ICTK2TodoTextAttachment)todoTextAttachment;
- (ICTTTextStorage)textStorage;
- (ICTextController)textController;
- (ICTodoButton)todoButton;
- (void)dealloc;
- (void)didPressTodoButton:(id)a3;
- (void)eventReporterLostSession:(id)a3;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setEventReporter:(id)a3;
@end

@implementation ICTK2TodoTextAttachmentViewProvider

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F5B510]);
  v4 = [(ICTK2TodoTextAttachmentViewProvider *)self textView];
  v5 = [v4 textDragInteraction];
  v6 = [v5 delegate];
  id v27 = (id)[v3 initWithDragDelegate:v6];

  [v27 addTarget:self action:sel_didPressTodoButton_ forControlEvents:64];
  v7 = [(ICTK2TodoTextAttachmentViewProvider *)self todoTextAttachment];
  v8 = [v7 todo];

  v9 = [v8 uuid];

  if (v9)
  {
    v10 = [(ICTK2TodoTextAttachmentViewProvider *)self textController];
    v11 = [v10 trackedToDoParagraphs];
    v12 = [v8 uuid];
    v13 = [v11 objectForKeyedSubscript:v12];
    [v27 setTrackedParagraph:v13];
  }
  objc_msgSend(v27, "setDone:animated:", objc_msgSend(v8, "done"), 0);
  v14 = [(ICTK2TodoTextAttachmentViewProvider *)self todoTextAttachment];
  [v14 foregroundAlpha];
  if (v15 == 0.0) {
    double v15 = 1.0;
  }
  objc_msgSend(v27, "ic_setAlpha:", v15);

  v16 = [(ICTK2TodoTextAttachmentViewProvider *)self todoTextAttachment];
  v17 = [v16 highlightColor];
  [v27 setHighlightColor:v17];

  v18 = [(ICTK2TodoTextAttachmentViewProvider *)self todoTextAttachment];
  v19 = NSStringFromSelector(sel_highlightColor);
  objc_msgSend(v18, "ic_addObserver:forKeyPath:context:", self, v19, &compoundliteral_8);

  v20 = [(ICTK2TodoTextAttachmentViewProvider *)self todoTextAttachment];
  v21 = NSStringFromSelector(sel_foregroundAlpha);
  objc_msgSend(v20, "ic_addObserver:forKeyPath:context:", self, v21, &compoundliteral_8);

  objc_opt_class();
  v22 = [(ICTK2TodoTextAttachmentViewProvider *)self textView];
  v23 = [v22 textContainer];
  v24 = ICDynamicCast();
  int v25 = [v24 insideSiriSnippet];

  if (v25)
  {
    v26 = [MEMORY[0x263F825C8] ICTintColor];
    [v27 setOverrideTintColor:v26];
  }
  [(NSTextAttachmentViewProvider *)self setView:v27];
}

- (void)dealloc
{
  id v3 = [(ICTK2TodoTextAttachmentViewProvider *)self todoTextAttachment];
  v4 = NSStringFromSelector(sel_highlightColor);
  objc_msgSend(v3, "ic_removeObserver:forKeyPath:context:", self, v4, &compoundliteral_8);

  v5 = [(ICTK2TodoTextAttachmentViewProvider *)self todoTextAttachment];
  v6 = NSStringFromSelector(sel_foregroundAlpha);
  objc_msgSend(v5, "ic_removeObserver:forKeyPath:context:", self, v6, &compoundliteral_8);

  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)ICTK2TodoTextAttachmentViewProvider;
  [(NSTextAttachmentViewProvider *)&v8 dealloc];
}

- (ICTodoButton)todoButton
{
  objc_opt_class();
  id v3 = [(NSTextAttachmentViewProvider *)self view];
  v4 = ICCheckedDynamicCast();

  return (ICTodoButton *)v4;
}

- (ICTTTextStorage)textStorage
{
  objc_opt_class();
  id v3 = [(NSTextAttachmentViewProvider *)self textLayoutManager];
  v4 = ICDynamicCast();
  v5 = [v4 textContentStorage];

  objc_opt_class();
  v6 = [v5 textStorage];
  v7 = ICDynamicCast();

  return (ICTTTextStorage *)v7;
}

- (ICTextController)textController
{
  objc_opt_class();
  id v3 = [(NSTextAttachmentViewProvider *)self textLayoutManager];
  v4 = ICDynamicCast();
  v5 = [v4 textContentStorage];

  objc_opt_class();
  v6 = [v5 textStorage];
  v7 = ICDynamicCast();
  objc_super v8 = [v7 styler];

  return (ICTextController *)v8;
}

- (ICTK2TextView)textView
{
  objc_opt_class();
  id v3 = [(NSTextAttachmentViewProvider *)self textLayoutManager];
  v4 = ICDynamicCast();

  objc_opt_class();
  v5 = [v4 textContainer];
  v6 = ICDynamicCast();

  v7 = [v6 tk2TextView];

  return (ICTK2TextView *)v7;
}

- (ICTK2TodoTextAttachment)todoTextAttachment
{
  objc_opt_class();
  id v3 = [(NSTextAttachmentViewProvider *)self textAttachment];
  v4 = ICDynamicCast();

  return (ICTK2TodoTextAttachment *)v4;
}

- (void)didPressTodoButton:(id)a3
{
  id v4 = a3;
  v5 = [(ICTK2TodoTextAttachmentViewProvider *)self textView];
  char v6 = [v5 isDraggingChecklistItem];

  if ((v6 & 1) == 0)
  {
    v7 = [(ICTK2TodoTextAttachmentViewProvider *)self textView];
    objc_super v8 = [v7 delegate];
    v9 = [(ICTK2TodoTextAttachmentViewProvider *)self textView];
    int v10 = [v8 textViewShouldBeginEditing:v9];

    objc_opt_class();
    v11 = [(NSTextAttachmentViewProvider *)self textLayoutManager];
    v12 = ICDynamicCast();

    v13 = [(ICTK2TodoTextAttachmentViewProvider *)self todoTextAttachment];
    v14 = [v13 todo];

    double v15 = [v14 uuid];
    v16 = [v12 trackedTodoParagraphForTrackingUUID:v15];

    if (!v16)
    {
      v54 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        -[ICTK2TodoTextAttachmentViewProvider didPressTodoButton:](v14, v54);
      }

      v49 = [(ICTK2TodoTextAttachmentViewProvider *)self textController];
      id v52 = [(ICTK2TodoTextAttachmentViewProvider *)self textStorage];
      v53 = [(ICTK2TodoTextAttachmentViewProvider *)self textStorage];
      uint64_t v55 = objc_msgSend(v53, "ic_range");
      objc_msgSend(v49, "updateTrackedAttributesInTextStorage:range:changeInLength:", v52, v55, v56, 0);
      goto LABEL_24;
    }
    uint64_t v17 = [v16 characterRange];
    if (!v10)
    {
LABEL_26:

      goto LABEL_27;
    }
    uint64_t v19 = v17;
    uint64_t v20 = v18;
    v58 = v12;
    uint64_t v21 = [v4 isDone] ^ 1;
    v22 = [(ICTK2TodoTextAttachmentViewProvider *)self textController];
    v23 = [(ICTK2TodoTextAttachmentViewProvider *)self textStorage];
    int v24 = objc_msgSend(v22, "setDone:range:inTextStorage:", v21, v19, v20, v23);

    int v25 = v24;
    if (v24)
    {
      [v4 setDone:v21];
      [v4 wasPressed];
      v26 = [(ICTK2TodoTextAttachmentViewProvider *)self textView];
      [v26 icDelegate];
      id v57 = v4;
      id v27 = v16;
      uint64_t v28 = v19;
      v29 = v14;
      uint64_t v30 = v20;
      v32 = int v31 = v24;
      char v33 = objc_opt_respondsToSelector();

      int v25 = v31;
      uint64_t v20 = v30;
      v14 = v29;
      uint64_t v19 = v28;
      v16 = v27;
      id v4 = v57;

      if (v33)
      {
        v34 = [(ICTK2TodoTextAttachmentViewProvider *)self textView];
        v35 = [v34 icDelegate];
        [v35 didInvokeAnalyticsChecklistActionChecked:v21];
      }
    }
    v36 = [MEMORY[0x263F82950] sharedMenuController];
    int v37 = [v36 isMenuVisible];

    if (v37)
    {
      v38 = [MEMORY[0x263F82950] sharedMenuController];
      [v38 setMenuVisible:0 animated:1];
    }
    v39 = [(ICTK2TodoTextAttachmentViewProvider *)self textView];
    if ([v39 isFirstResponder])
    {
      BOOL v40 = -[ICTK2TodoTextAttachmentViewProvider selectedRangesIntersectWithRange:](self, "selectedRangesIntersectWithRange:", v19, v20);

      if (v40) {
        goto LABEL_16;
      }
      if (v19 <= v20 + v19 - 1) {
        uint64_t v41 = v20 + v19 - 1;
      }
      else {
        uint64_t v41 = v19;
      }
      v39 = [(ICTK2TodoTextAttachmentViewProvider *)self textView];
      objc_msgSend(v39, "setSelectedRange:", v41, 0);
    }

LABEL_16:
    v12 = v58;
    if (v25)
    {
      v42 = [(ICTK2TodoTextAttachmentViewProvider *)self textView];
      v43 = [v42 delegate];
      char v44 = objc_opt_respondsToSelector();

      if (v44)
      {
        v45 = [(ICTK2TodoTextAttachmentViewProvider *)self textView];
        v46 = [v45 delegate];
        v47 = [(ICTK2TodoTextAttachmentViewProvider *)self textView];
        [v46 textViewDidChange:v47];
      }
      objc_opt_class();
      v48 = [(ICTK2TodoTextAttachmentViewProvider *)self textView];
      v49 = ICDynamicCast();

      if (!v49) {
        goto LABEL_25;
      }
      v50 = [(ICTK2TodoTextAttachmentViewProvider *)self eventReporter];
      v51 = [(ICTK2TodoTextAttachmentViewProvider *)self textController];
      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 3221225472;
      v59[2] = __58__ICTK2TodoTextAttachmentViewProvider_didPressTodoButton___block_invoke;
      v59[3] = &unk_2640B93C0;
      v60 = v50;
      id v52 = v50;
      [v51 autoSortChecklistIfNecessaryForTrackedParagraph:v16 textView:v49 analyticsHandler:v59];

      dispatchMainAfterDelay();
      v53 = v60;
LABEL_24:

LABEL_25:
      goto LABEL_26;
    }
    goto LABEL_26;
  }
LABEL_27:
}

uint64_t __58__ICTK2TodoTextAttachmentViewProvider_didPressTodoButton___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) submitMoveCheckedItemsToBottomSwitchEventWithNewState:a2 isInApp:1];
}

void __58__ICTK2TodoTextAttachmentViewProvider_didPressTodoButton___block_invoke_2()
{
}

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter && [MEMORY[0x263F5A768] isOptedInForAnalytics])
  {
    id v3 = objc_alloc(MEMORY[0x263F5A768]);
    id v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    char v6 = [(ICTK2TodoTextAttachmentViewProvider *)self textView];
    v7 = (ICNAEventReporter *)[v3 initWithSubTrackerName:v5 view:v6];
    eventReporter = self->_eventReporter;
    self->_eventReporter = v7;

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:self selector:sel_eventReporterLostSession_ name:*MEMORY[0x263F5A750] object:self->_eventReporter];
  }
  int v10 = self->_eventReporter;

  return v10;
}

- (void)eventReporterLostSession:(id)a3
{
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  id v5 = a3;

  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v6 = *MEMORY[0x263F5A750];
  v7 = [v5 object];

  [v8 removeObserver:self name:v6 object:v7];
}

- (BOOL)selectedRangesIntersectWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(ICTK2TodoTextAttachmentViewProvider *)self textView];
  uint64_t v6 = objc_msgSend(v5, "ic_selectedRanges");

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        NSUInteger v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) rangeValue];
        v13.NSUInteger location = v11;
        v13.NSUInteger length = v12;
        if (v12 || (v11 >= location ? (BOOL v14 = v11 - location >= length) : (BOOL v14 = 1), v14))
        {
          v23.NSUInteger location = location;
          v23.NSUInteger length = length;
          if (!NSIntersectionRange(v23, v13).length) {
            continue;
          }
        }
        BOOL v15 = 1;
        goto LABEL_17;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_17:

  return v15;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  if ([(ICTK2TodoTextAttachmentViewProvider *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/Common/TextAttachmentUI/ICTK2TodoTextAttachmentViewProvider.m"])
  {
    char v13 = [(ICTK2TodoTextAttachmentViewProvider *)self ic_shouldIgnoreObserveValue:v11 ofObject:v10 forKeyPath:v12];

    if (a6 == &compoundliteral_8 && (v13 & 1) == 0)
    {
      id v14 = [(ICTK2TodoTextAttachmentViewProvider *)self todoTextAttachment];

      if (v14 == v10)
      {
        BOOL v15 = [(ICTK2TodoTextAttachmentViewProvider *)self todoButton];
        v16 = [(ICTK2TodoTextAttachmentViewProvider *)self todoTextAttachment];
        [v16 foregroundAlpha];
        if (v17 == 0.0) {
          double v17 = 1.0;
        }
        objc_msgSend(v15, "ic_setAlpha:", v17);

        long long v18 = [(ICTK2TodoTextAttachmentViewProvider *)self todoTextAttachment];
        long long v19 = [v18 highlightColor];
        long long v20 = [(ICTK2TodoTextAttachmentViewProvider *)self todoButton];
        [v20 setHighlightColor:v19];
      }
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)ICTK2TodoTextAttachmentViewProvider;
    [(ICTK2TodoTextAttachmentViewProvider *)&v21 observeValueForKeyPath:v12 ofObject:v10 change:v11 context:a6];
  }
}

- (void)setEventReporter:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)didPressTodoButton:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 uuid];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_20BE60000, a2, OS_LOG_TYPE_ERROR, "No tracked paragraph found for uuid: %@. Attempting to recover, but checklist button press will be ignored.", (uint8_t *)&v4, 0xCu);
}

@end