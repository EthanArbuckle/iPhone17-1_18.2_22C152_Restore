@interface NoteHTMLEditorViewScriptMessageHandler
- (NoteHTMLEditorView)noteHTMLEditorView;
- (NoteHTMLEditorViewScriptMessageHandler)initWithNoteHMLEditorView:(id)a3;
- (void)setNoteHTMLEditorView:(id)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
@end

@implementation NoteHTMLEditorViewScriptMessageHandler

- (NoteHTMLEditorViewScriptMessageHandler)initWithNoteHMLEditorView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NoteHTMLEditorViewScriptMessageHandler;
  v5 = [(NoteHTMLEditorViewScriptMessageHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_noteHTMLEditorView, v4);
  }

  return v6;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v5 = a4;
  id v6 = [(NoteHTMLEditorViewScriptMessageHandler *)self noteHTMLEditorView];
  [v6 didReceiveScriptMessage:v5];
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

@end