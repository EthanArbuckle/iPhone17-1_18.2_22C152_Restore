@interface NoteHTMLEditorViewURLSchemeHandler
- (NoteHTMLEditorView)noteHTMLEditorView;
- (NoteHTMLEditorViewURLSchemeHandler)initWithNoteHMLEditorView:(id)a3;
- (void)setNoteHTMLEditorView:(id)a3;
- (void)webView:(id)a3 startURLSchemeTask:(id)a4;
- (void)webView:(id)a3 stopURLSchemeTask:(id)a4;
@end

@implementation NoteHTMLEditorViewURLSchemeHandler

- (NoteHTMLEditorViewURLSchemeHandler)initWithNoteHMLEditorView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NoteHTMLEditorViewURLSchemeHandler;
  v5 = [(NoteHTMLEditorViewURLSchemeHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_noteHTMLEditorView, v4);
  }

  return v6;
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v5 = a4;
  id v6 = [(NoteHTMLEditorViewURLSchemeHandler *)self noteHTMLEditorView];
  [v6 loadAttachmentContentForURLSchemeTask:v5];
}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  id v5 = a4;
  id v6 = [(NoteHTMLEditorViewURLSchemeHandler *)self noteHTMLEditorView];
  [v6 stopLoadingAttachmentContentForURLSchemeTask:v5];
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