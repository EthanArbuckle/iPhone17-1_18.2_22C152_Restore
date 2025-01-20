@interface NoteWKWebView
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)supportsTextReplacement;
- (NoteHTMLEditorView)noteHTMLEditorView;
- (void)calloutOptionInvoked:(int64_t)a3 sender:(id)a4;
- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4;
- (void)findInteraction:(id)a3 didEndFindSession:(id)a4;
- (void)ic_evaluateJavaScript:(id)a3;
- (void)paste:(id)a3;
- (void)select:(id)a3;
- (void)selectAll:(id)a3;
- (void)setNoteHTMLEditorView:(id)a3;
- (void)strikethrough:(id)a3;
- (void)toggleBoldface:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleUnderline:(id)a3;
@end

@implementation NoteWKWebView

- (BOOL)supportsTextReplacement
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  v3 = [(NoteWKWebView *)self noteHTMLEditorView];
  int v4 = [v3 isEditable];

  if (v4)
  {
    v5 = [(NoteWKWebView *)self noteHTMLEditorView];
    v6 = [v5 delegate];
    char v7 = objc_opt_respondsToSelector();

    v8 = [(NoteWKWebView *)self noteHTMLEditorView];
    v9 = v8;
    if (v7)
    {
      v10 = [v8 delegate];
      v11 = [(NoteWKWebView *)self noteHTMLEditorView];
      char v12 = [v10 noteHTMLEditorViewShouldBeginEditing:v11 isUserInitiated:1];
    }
    else
    {
      if ([v8 isEditable])
      {
        char v12 = 1;
LABEL_9:

        return v12;
      }
      v10 = [(NoteWKWebView *)self noteHTMLEditorView];
      v11 = [v10 layoutDelegate];
      v13 = [(NoteWKWebView *)self noteHTMLEditorView];
      char v12 = [v11 isNoteHTMLEditorViewVisible:v13];
    }
    goto LABEL_9;
  }
  return 0;
}

- (BOOL)becomeFirstResponder
{
  BOOL v3 = [(NoteWKWebView *)self canBecomeFirstResponder];
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)NoteWKWebView;
    LOBYTE(v3) = [(NoteWKWebView *)&v5 becomeFirstResponder];
  }
  return v3;
}

- (void)toggleBoldface:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NoteWKWebView;
  id v4 = a3;
  [(NoteWKWebView *)&v5 toggleBoldface:v4];
  -[NoteWKWebView calloutOptionInvoked:sender:](self, "calloutOptionInvoked:sender:", 4, v4, v5.receiver, v5.super_class);
}

- (void)toggleItalics:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NoteWKWebView;
  id v4 = a3;
  [(NoteWKWebView *)&v5 toggleItalics:v4];
  -[NoteWKWebView calloutOptionInvoked:sender:](self, "calloutOptionInvoked:sender:", 5, v4, v5.receiver, v5.super_class);
}

- (void)toggleUnderline:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NoteWKWebView;
  id v4 = a3;
  [(NoteWKWebView *)&v5 toggleUnderline:v4];
  -[NoteWKWebView calloutOptionInvoked:sender:](self, "calloutOptionInvoked:sender:", 6, v4, v5.receiver, v5.super_class);
}

- (void)select:(id)a3
{
  id v4 = a3;
  [(NoteWKWebView *)self calloutOptionInvoked:0 sender:v4];
  v5.receiver = self;
  v5.super_class = (Class)NoteWKWebView;
  [(NoteWKWebView *)&v5 select:v4];
}

- (void)selectAll:(id)a3
{
  id v4 = a3;
  [(NoteWKWebView *)self calloutOptionInvoked:1 sender:v4];
  v5.receiver = self;
  v5.super_class = (Class)NoteWKWebView;
  [(NoteWKWebView *)&v5 selectAll:v4];
}

- (void)calloutOptionInvoked:(int64_t)a3 sender:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [(NoteWKWebView *)self noteHTMLEditorView];
    v9 = [v8 delegate];
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0) {
      return;
    }
    id v16 = [(NoteWKWebView *)self noteHTMLEditorView];
    v11 = [v16 delegate];
    char v12 = [(NoteWKWebView *)self noteHTMLEditorView];
    [v11 noteHTMLEditorView:v12 didInvokeFormattingCalloutOption:a3];
  }
  else
  {
    if (v6) {
      return;
    }
    v13 = [(NoteWKWebView *)self noteHTMLEditorView];
    v14 = [v13 delegate];
    char v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) == 0) {
      return;
    }
    id v16 = [(NoteWKWebView *)self noteHTMLEditorView];
    v11 = [v16 delegate];
    char v12 = [(NoteWKWebView *)self noteHTMLEditorView];
    [v11 noteHTMLEditorView:v12 didInvokeStyleFormattingOption:a3];
  }
}

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NoteWKWebView;
  [(NoteWKWebView *)&v6 findInteraction:a3 didBeginFindSession:a4];
  self->_hasActiveFindSession = 1;
  objc_super v5 = [(NoteWKWebView *)self noteHTMLEditorView];
  [v5 updateWebViewEditability];
}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NoteWKWebView;
  [(NoteWKWebView *)&v7 findInteraction:a3 didEndFindSession:a4];
  if (self->_hasActiveFindSession)
  {
    objc_super v5 = [(NoteWKWebView *)self noteHTMLEditorView];
    [v5 setSelectionToEnd];

    self->_hasActiveFindSession = 0;
  }
  objc_super v6 = [(NoteWKWebView *)self noteHTMLEditorView];
  [v6 updateWebViewEditability];
}

- (void)strikethrough:(id)a3
{
  id v4 = a3;
  [(NoteWKWebView *)self ic_evaluateJavaScript:@"document.execCommand(\"strikethrough\", false, null)"];
  [(NoteWKWebView *)self calloutOptionInvoked:7 sender:v4];
}

- (void)paste:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1E4FB1A78];
  uint64_t v6 = [(NoteWKWebView *)self _dataOwnerForPaste];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __23__NoteWKWebView_paste___block_invoke;
  v8[3] = &unk_1E5FD91D0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 _performAsDataOwner:v6 block:v8];
}

uint64_t __23__NoteWKWebView_paste___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) noteHTMLEditorView];
  BOOL v3 = [v2 actionDelegate];

  if (!v3) {
    goto LABEL_3;
  }
  id v4 = [*(id *)(a1 + 32) noteHTMLEditorView];
  objc_super v5 = [v4 actionDelegate];
  uint64_t v6 = [*(id *)(a1 + 32) noteHTMLEditorView];
  int v7 = [v5 noteHTMLEditorViewShouldPaste:v6];

  if (v7)
  {
LABEL_3:
    uint64_t v8 = *(void *)(a1 + 40);
    v10.receiver = *(id *)(a1 + 32);
    v10.super_class = (Class)NoteWKWebView;
    objc_msgSendSuper2(&v10, sel_paste_, v8);
  }
  return [*(id *)(a1 + 32) calloutOptionInvoked:2 sender:*(void *)(a1 + 40)];
}

- (void)ic_evaluateJavaScript:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__NoteWKWebView_ic_evaluateJavaScript___block_invoke;
  v6[3] = &unk_1E5FDBD40;
  id v7 = v4;
  id v5 = v4;
  [(NoteWKWebView *)self evaluateJavaScript:v5 completionHandler:v6];
}

void __39__NoteWKWebView_ic_evaluateJavaScript___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __39__NoteWKWebView_ic_evaluateJavaScript___block_invoke_cold_1();
    }
  }
}

- (NoteHTMLEditorView)noteHTMLEditorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_noteHTMLEditorView);
  return (NoteHTMLEditorView *)WeakRetained;
}

- (void)setNoteHTMLEditorView:(id)a3
{
}

- (void).cxx_destruct
{
}

void __39__NoteWKWebView_ic_evaluateJavaScript___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_2(&dword_1B08EB000, v0, v1, "failed to execute JavaScript: %@\nJavaScript error: %@");
}

@end