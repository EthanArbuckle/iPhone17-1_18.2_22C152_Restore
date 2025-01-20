@interface NoteHTMLEditorView
+ (id)baseHTMLString;
- (BOOL)_webView:(id)a3 focusShouldStartInputSession:(id)a4;
- (BOOL)_webView:(id)a3 performDataInteractionOperationWithItemProviders:(id)a4;
- (BOOL)canBecomeFocused;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)hasAttachments;
- (BOOL)isEditable;
- (BOOL)isEditing;
- (BOOL)isFirstResponder;
- (BOOL)isInsideSiriSnippet;
- (BOOL)setSelectionToEndAfterLoad;
- (BOOL)startEditingAfterLoad;
- (BOOL)updatingContent;
- (ICSelectorDelayer)updateContentDelayer;
- (NSArray)attachmentContentIDs;
- (NSArray)attachmentsToLoad;
- (NSLayoutConstraint)contentSizeHeightConstraint;
- (NSLayoutConstraint)contentSizeWidthConstraint;
- (NSString)htmlString;
- (NSString)htmlStringToLoad;
- (NSString)text;
- (NSString)title;
- (NoteHTMLEditorView)initWithCoder:(id)a3;
- (NoteHTMLEditorView)initWithFrame:(CGRect)a3;
- (NoteHTMLEditorViewActionDelegate)actionDelegate;
- (NoteHTMLEditorViewDelegate)delegate;
- (NoteHTMLEditorViewLayoutDelegate)layoutDelegate;
- (NoteHTMLEditorViewScriptMessageHandler)scriptMessageHandler;
- (NoteHTMLEditorViewURLSchemeHandler)urlSchemeHandler;
- (NoteWKWebView)webView;
- (UIViewPrintFormatter)viewPrintFormatter;
- (WebArchive)webArchive;
- (double)textZoomFactor;
- (id)attachmentInfoDictionaryForAttachmentPresentation:(id)a3;
- (id)contextMenuConfigurationForElement:(id)a3 presentation:(id)a4;
- (id)jsonStringFromDictionaryOrArray:(id)a3;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (id)webViewConfiguration;
- (int64_t)_webView:(id)a3 dataOwnerForDragSession:(id)a4;
- (int64_t)_webView:(id)a3 dataOwnerForDropSession:(id)a4;
- (int64_t)selectionLength;
- (unsigned)listStyle;
- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5;
- (void)_webView:(id)a3 didInsertAttachment:(id)a4 withSource:(id)a5;
- (void)_webView:(id)a3 didStartInputSession:(id)a4;
- (void)adoptEditableState;
- (void)buildMenuWithBuilder:(id)a3;
- (void)copyNoteHTMLToPasteboard;
- (void)didReceiveScriptMessage:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)getRectForSelectionWithCompletion:(id)a3;
- (void)insertBulletedList:(id)a3;
- (void)insertDashedList:(id)a3;
- (void)insertHTMLString:(id)a3;
- (void)insertImage:(id)a3;
- (void)insertLinkWithURL:(id)a3 title:(id)a4;
- (void)insertLinksWithURLs:(id)a3 titles:(id)a4;
- (void)insertOrderedList:(id)a3;
- (void)loadAttachmentContentForURLSchemeTask:(id)a3;
- (void)removeScriptHandlers;
- (void)removeStyle:(id)a3;
- (void)replaceContentIDs:(id)a3;
- (void)replaceSelectionWithAttachmentPresentation:(id)a3;
- (void)scrollSelectionToVisible:(BOOL)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setActionDelegate:(id)a3;
- (void)setAttachmentContentIDs:(id)a3;
- (void)setAttachmentsToLoad:(id)a3;
- (void)setContentSizeHeightConstraint:(id)a3;
- (void)setContentSizeWidthConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEnableAttachments:(BOOL)a3;
- (void)setEnableShiftNewlinesInSmartLists:(BOOL)a3;
- (void)setEnableSmartLists:(BOOL)a3;
- (void)setHasAttachments:(BOOL)a3;
- (void)setHtmlString:(id)a3;
- (void)setHtmlString:(id)a3 attachments:(id)a4;
- (void)setHtmlStringToLoad:(id)a3;
- (void)setInsideSiriSnippet:(BOOL)a3;
- (void)setLayoutDelegate:(id)a3;
- (void)setListStyle:(unsigned __int16)a3;
- (void)setScriptMessageHandler:(id)a3;
- (void)setSelectionLength:(int64_t)a3;
- (void)setSelectionToEnd;
- (void)setSelectionToStart;
- (void)setSetSelectionToEndAfterLoad:(BOOL)a3;
- (void)setSourceURLForAttachmentIdentifier:(id)a3;
- (void)setStartEditingAfterLoad:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTextZoomFactor:(double)a3;
- (void)setTitle:(id)a3;
- (void)setUpdateContentDelayer:(id)a3;
- (void)setUpdatingContent:(BOOL)a3;
- (void)setUrlSchemeHandler:(id)a3;
- (void)setWebView:(id)a3;
- (void)setupWebView;
- (void)startEditing;
- (void)stopEditing;
- (void)stopEditingWithCompletion:(id)a3;
- (void)undoablyRemoveAttachmentPresentations:(id)a3 undoManager:(id)a4;
- (void)undoablyReplaceSelectionWithAttachmentPresentations:(id)a3 undoManager:(id)a4;
- (void)updateContent;
- (void)updateDataDetectors;
- (void)updateDataOwnerForCopyAndPaste;
- (void)updateWebViewEditability;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webViewWebContentProcessDidTerminate:(id)a3;
@end

@implementation NoteHTMLEditorView

+ (id)baseHTMLString
{
  v2 = NSString;
  v3 = _noteStyleSheet();
  v4 = [v2 stringWithFormat:@"<!DOCTYPE html><html>    <head>        <meta name=\"viewport\" content=\"initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0\" />        <style>            %@        </style>    </head>    <body id=\"editor\">    </body></html>", v3];

  return v4;
}

- (NoteHTMLEditorView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NoteHTMLEditorView;
  v3 = -[NoteHTMLEditorView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(NoteHTMLEditorView *)v3 setupWebView];
  }
  return v4;
}

- (NoteHTMLEditorView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NoteHTMLEditorView;
  v3 = [(NoteHTMLEditorView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(NoteHTMLEditorView *)v3 setupWebView];
  }
  return v4;
}

- (void)removeScriptHandlers
{
  id v4 = [(NoteHTMLEditorView *)self webView];
  v2 = [v4 configuration];
  v3 = [v2 userContentController];
  [v3 removeAllScriptMessageHandlers];
}

- (void)setupWebView
{
  v58[4] = *MEMORY[0x1E4F143B8];
  v3 = [NoteWKWebView alloc];
  [(NoteHTMLEditorView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(NoteHTMLEditorView *)self webViewConfiguration];
  v13 = -[NoteWKWebView initWithFrame:configuration:](v3, "initWithFrame:configuration:", v12, v5, v7, v9, v11);
  [(NoteHTMLEditorView *)self setWebView:v13];

  v14 = [(NoteHTMLEditorView *)self webView];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [MEMORY[0x1E4FB1618] clearColor];
  v16 = [(NoteHTMLEditorView *)self webView];
  [v16 setBackgroundColor:v15];

  v17 = [(NoteHTMLEditorView *)self webView];
  [v17 setOpaque:0];

  v18 = [(NoteHTMLEditorView *)self webView];
  [v18 setAllowsLinkPreview:1];

  v19 = [(NoteHTMLEditorView *)self webView];
  v20 = [v19 scrollView];
  [v20 setShowsHorizontalScrollIndicator:0];

  v21 = [(NoteHTMLEditorView *)self webView];
  v22 = [v21 scrollView];
  [v22 setAlwaysBounceHorizontal:0];

  v23 = [(NoteHTMLEditorView *)self webView];
  v24 = [v23 scrollView];
  [v24 setDirectionalLockEnabled:1];

  v25 = [(NoteHTMLEditorView *)self webView];
  [v25 _setInputDelegate:self];

  v26 = [(NoteHTMLEditorView *)self webView];
  [v26 setUIDelegate:self];

  v27 = [(NoteHTMLEditorView *)self webView];
  [v27 setNavigationDelegate:self];

  v28 = [(NoteHTMLEditorView *)self webView];
  [v28 setNoteHTMLEditorView:self];

  v29 = [(NoteHTMLEditorView *)self webView];
  [(NoteHTMLEditorView *)self addSubview:v29];

  v30 = (void *)MEMORY[0x1E4F28E88];
  v31 = [MEMORY[0x1E4F1CB10] URLWithString:@"about:blank"];
  v32 = [v30 requestWithURL:v31];

  v57 = v32;
  [v32 _setNonAppInitiated:1];
  v33 = [(NoteHTMLEditorView *)self webView];
  v34 = NSString;
  v35 = _noteStyleSheet();
  v36 = [v34 stringWithFormat:@"<!DOCTYPE html><html>    <head>        <meta name=\"viewport\" content=\"initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0\" />        <style>            %@        </style>    </head>    <body id=\"editor\">    </body></html>", v35];
  id v37 = (id)[v33 loadSimulatedRequest:v32 responseHTMLString:v36];

  v38 = [(NoteHTMLEditorView *)self safeAreaLayoutGuide];
  v49 = (void *)MEMORY[0x1E4F28DC8];
  v56 = [(NoteHTMLEditorView *)self webView];
  v55 = [v56 leadingAnchor];
  v54 = [v38 leadingAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v58[0] = v53;
  v52 = [(NoteHTMLEditorView *)self webView];
  v51 = [v52 trailingAnchor];
  v50 = [v38 trailingAnchor];
  v48 = [v51 constraintEqualToAnchor:v50];
  v58[1] = v48;
  v39 = [(NoteHTMLEditorView *)self webView];
  v40 = [v39 topAnchor];
  v41 = [v38 topAnchor];
  v42 = [v40 constraintEqualToAnchor:v41];
  v58[2] = v42;
  v43 = [(NoteHTMLEditorView *)self webView];
  v44 = [v43 bottomAnchor];
  v45 = [v38 bottomAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  v58[3] = v46;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];
  [v49 activateConstraints:v47];
}

- (id)webViewConfiguration
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F466F8]);
  [v3 _setGroupIdentifier:@"com.apple.mobilenotes.text"];
  uint64_t v4 = *MEMORY[0x1E4F15A98];
  v34[0] = *MEMORY[0x1E4F15AA0];
  v34[1] = v4;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  [v3 _setAdditionalSupportedImageTypes:v5];

  [v3 _setAllowsJavaScriptMarkup:0];
  double v6 = [MEMORY[0x1E4F46710] nonPersistentDataStore];
  [v3 setWebsiteDataStore:v6];

  [v3 _setAllowUniversalAccessFromFileURLs:0];
  [v3 _setAttachmentElementEnabled:1];
  [v3 _setColorFilterEnabled:1];
  [v3 _setRespectsImageOrientation:1];
  [v3 _setNeedsStorageAccessFromFileURLsQuirk:0];
  [v3 _setInvisibleAutoplayNotPermitted:1];
  [v3 _setApplePayEnabled:0];
  [v3 _setAllowsMetaRefresh:0];
  [v3 setAllowsInlinePredictions:1];
  [v3 setIgnoresViewportScaleLimits:0];
  [v3 setSupportsAdaptiveImageGlyph:1];
  [v3 setWritingToolsBehavior:1];
  id v7 = objc_alloc_init(MEMORY[0x1E4F46688]);
  [v3 setPreferences:v7];

  double v8 = [v3 preferences];
  [v8 setJavaScriptCanOpenWindowsAutomatically:0];

  double v9 = [v3 preferences];
  [v9 _setColorFilterEnabled:1];

  double v10 = [v3 preferences];
  [v10 _setJavaScriptCanAccessClipboard:1];

  double v11 = [v3 preferences];
  [v11 _setEditableLinkBehavior:3];

  v12 = [[NoteHTMLEditorViewURLSchemeHandler alloc] initWithNoteHMLEditorView:self];
  [(NoteHTMLEditorView *)self setUrlSchemeHandler:v12];

  v13 = [[NoteHTMLEditorViewScriptMessageHandler alloc] initWithNoteHMLEditorView:self];
  [(NoteHTMLEditorView *)self setScriptMessageHandler:v13];

  v14 = [(NoteHTMLEditorView *)self urlSchemeHandler];
  [v3 setURLSchemeHandler:v14 forURLScheme:@"cid"];

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F466A8]) initWithSource:&cfstr_VarNotewkwebvi injectionTime:1 forMainFrameOnly:1];
  v16 = [v3 userContentController];
  [v16 addUserScript:v15];

  v17 = [v3 userContentController];
  v18 = [(NoteHTMLEditorView *)self scriptMessageHandler];
  [v17 addScriptMessageHandler:v18 name:@"textDidChange"];

  v19 = [v3 userContentController];
  v20 = [(NoteHTMLEditorView *)self scriptMessageHandler];
  [v19 addScriptMessageHandler:v20 name:@"attachmentsDidChange"];

  v21 = [v3 userContentController];
  v22 = [(NoteHTMLEditorView *)self scriptMessageHandler];
  [v21 addScriptMessageHandler:v22 name:@"titleDidChange"];

  v23 = [v3 userContentController];
  v24 = [(NoteHTMLEditorView *)self scriptMessageHandler];
  [v23 addScriptMessageHandler:v24 name:@"selectionDidChange"];

  v25 = [v3 userContentController];
  v26 = [(NoteHTMLEditorView *)self scriptMessageHandler];
  [v25 addScriptMessageHandler:v26 name:@"clickedAttachment"];

  v27 = [v3 userContentController];
  v28 = [(NoteHTMLEditorView *)self scriptMessageHandler];
  [v27 addScriptMessageHandler:v28 name:@"doubleClickedAttachment"];

  v29 = [v3 userContentController];
  v30 = [(NoteHTMLEditorView *)self scriptMessageHandler];
  [v29 addScriptMessageHandler:v30 name:@"editorDidBlur"];

  v31 = [v3 userContentController];
  v32 = [(NoteHTMLEditorView *)self scriptMessageHandler];
  [v31 addScriptMessageHandler:v32 name:@"anchorTouchesDidEnd"];

  return v3;
}

- (UIViewPrintFormatter)viewPrintFormatter
{
  v2 = [(NoteHTMLEditorView *)self webView];
  id v3 = [v2 viewPrintFormatter];

  return (UIViewPrintFormatter *)v3;
}

- (WebArchive)webArchive
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = [(NoteHTMLEditorView *)self htmlString];
  uint64_t v4 = [v3 dataUsingEncoding:4];

  id v5 = objc_alloc(MEMORY[0x1E4FB6DE8]);
  double v6 = [MEMORY[0x1E4F1CB10] URLWithString:@"file:///index.html"];
  v38 = (void *)v4;
  id v37 = (void *)[v5 initWithData:v4 URL:v6 MIMEType:@"text/html" textEncodingName:@"utf-8" frameName:0];

  id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
  double v8 = [(NoteHTMLEditorView *)self attachmentContentIDs];
  v42 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = [(NoteHTMLEditorView *)self attachmentContentIDs];
  uint64_t v9 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v43 = *(void *)v48;
    v39 = (void *)*MEMORY[0x1E4F44378];
    uint64_t v40 = *MEMORY[0x1E4F281F8];
    unint64_t v11 = 0x1E4F44000uLL;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v48 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        v14 = objc_msgSend(NSString, "ic_newURLForContentID:percentEscaped:", v13, 0);
        v15 = [(NoteHTMLEditorView *)self delegate];
        char v16 = objc_opt_respondsToSelector();

        if (v16)
        {
          v17 = [(NoteHTMLEditorView *)self delegate];
          id v18 = [v17 noteHTMLEditorView:self fileURLForAttachmentWithContentID:v13];

          if (v18)
          {
            v19 = *(void **)(v11 + 728);
            [v18 pathExtension];
            v21 = unint64_t v20 = v11;
            v22 = [v19 typeWithFilenameExtension:v21];
            v23 = [v22 identifier];

            if (v23)
            {
              v24 = [*(id *)(v20 + 728) typeWithIdentifier:v23];
              id v25 = [v24 preferredMIMEType];
            }
            else
            {
              id v25 = [v39 preferredMIMEType];
            }
            id v29 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v18];
            id v31 = objc_alloc(MEMORY[0x1E4FB6DE8]);
            id v32 = v29;
            v33 = v14;
            id v34 = v25;
            goto LABEL_18;
          }
        }
        v26 = [(NoteHTMLEditorView *)self delegate];
        char v27 = objc_opt_respondsToSelector();

        if ((v27 & 1) == 0
          || ([(NoteHTMLEditorView *)self delegate],
              v28 = objc_claimAutoreleasedReturnValue(),
              [v28 noteHTMLEditorView:self attachmentPresentationForContentID:v13],
              v23 = objc_claimAutoreleasedReturnValue(),
              v28,
              !v23))
        {
          id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:v40 code:4 userInfo:0];
          v30 = 0;
          goto LABEL_20;
        }
        id v45 = 0;
        id v46 = 0;
        id v44 = 0;
        [v23 getPresentationData:&v46 mimeType:&v45 error:&v44];
        id v25 = v46;
        id v29 = v45;
        id v18 = v44;
        v30 = 0;
        if (v25 && v29)
        {
          id v31 = objc_alloc(MEMORY[0x1E4FB6DE8]);
          id v32 = v25;
          v33 = v14;
          id v34 = v29;
LABEL_18:
          v30 = (void *)[v31 initWithData:v32 URL:v33 MIMEType:v34 textEncodingName:0 frameName:0];
        }

        unint64_t v11 = 0x1E4F44000;
LABEL_20:

        if (v30) {
          [v42 addObject:v30];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v10);
  }

  v35 = (void *)[objc_alloc(MEMORY[0x1E4FB6D88]) initWithMainResource:v37 subresources:v42 subframeArchives:0];
  return (WebArchive *)v35;
}

- (double)textZoomFactor
{
  v2 = [(NoteHTMLEditorView *)self webView];
  [v2 _textZoomFactor];
  double v4 = v3;

  return v4;
}

- (void)setTextZoomFactor:(double)a3
{
  id v4 = [(NoteHTMLEditorView *)self webView];
  [v4 _setTextZoomFactor:a3];
}

- (ICSelectorDelayer)updateContentDelayer
{
  updateContentDelayer = self->_updateContentDelayer;
  if (!updateContentDelayer)
  {
    id v4 = (ICSelectorDelayer *)[objc_alloc(MEMORY[0x1E4F837C8]) initWithTarget:self selector:sel_updateContent delay:1 waitToFireUntilRequestsStop:1 callOnMainThread:0.01];
    id v5 = self->_updateContentDelayer;
    self->_updateContentDelayer = v4;

    updateContentDelayer = self->_updateContentDelayer;
  }
  return updateContentDelayer;
}

- (void)setHtmlString:(id)a3 attachments:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(NoteHTMLEditorView *)self webView];
  int v9 = [v8 isLoading];

  if (v9)
  {
    [(NoteHTMLEditorView *)self setHtmlStringToLoad:v6];
    [(NoteHTMLEditorView *)self setAttachmentsToLoad:v7];
    uint64_t v10 = [v7 valueForKeyPath:@"cidURL.resourceSpecifier"];
    [(NoteHTMLEditorView *)self setAttachmentContentIDs:v10];

    -[NoteHTMLEditorView setHasAttachments:](self, "setHasAttachments:", [v7 count] != 0);
    goto LABEL_56;
  }
  htmlString = self->_htmlString;
  if (!htmlString
    || [(NSString *)htmlString isEqualToString:&stru_1F0973378]
    || ([v6 isEqualToString:self->_htmlString] & 1) == 0)
  {
    location = (id *)&self->_htmlString;
    v57 = self;
    [(NoteHTMLEditorView *)self updateDataOwnerForCopyAndPaste];
    id v56 = v6;
    uint64_t v53 = objc_msgSend(v6, "ic_htmlStringEscapingQuotesAndLineBreaks");
    unint64_t v12 = 0x1E4F1C000uLL;
    v63 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v55 = v7;
    id obj = v7;
    uint64_t v64 = [obj countByEnumeratingWithState:&v71 objects:v75 count:16];
    if (!v64) {
      goto LABEL_50;
    }
    uint64_t v13 = *(void *)v72;
    v62 = (void *)*MEMORY[0x1E4F44378];
    uint64_t v66 = *MEMORY[0x1E4F44400];
    uint64_t v59 = *MEMORY[0x1E4F1C5F8];
    uint64_t v60 = *(void *)v72;
    while (1)
    {
      for (uint64_t i = 0; i != v64; ++i)
      {
        if (*(void *)v72 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        id v16 = objc_alloc_init(*(Class *)(v12 + 2656));
        CFURLRef url = [v15 fileURL];
        v17 = [(__CFURL *)url pathExtension];
        id v18 = [v15 mimeType];
        if ([v18 length])
        {
          v19 = [MEMORY[0x1E4F442D8] typeWithMIMEType:v18];
          unint64_t v20 = [v19 identifier];
        }
        else
        {
          unint64_t v20 = 0;
        }
        v67 = v17;
        if ([v17 length])
        {
          v21 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v17];
          v22 = [v21 identifier];

          if (v22) {
            goto LABEL_24;
          }
        }
        else
        {
          v22 = 0;
        }
        if (v20)
        {
          v23 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v20];
          int v24 = [v23 isEqual:v62];

          if (v24 && (id v25 = CGImageSourceCreateWithURL(url, 0)) != 0)
          {
            v26 = v25;
            char v27 = CGImageSourceGetType(v25);
            v22 = v27;
            if (v27) {
              id v28 = v27;
            }
            CFRelease(v26);
          }
          else
          {
            v22 = 0;
          }
          goto LABEL_28;
        }
LABEL_24:
        if (!v20)
        {
          if (!v22) {
            goto LABEL_37;
          }
          goto LABEL_31;
        }
LABEL_28:
        id v29 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v20];
        v65 = v29;
        if ([v29 conformsToType:v66])
        {

LABEL_36:
          [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"image"];
          goto LABEL_46;
        }
        if (!v22)
        {

          v22 = 0;
          goto LABEL_37;
        }
LABEL_31:
        v30 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v22];
        int v31 = [v30 conformsToType:v66];

        if (v20)
        {

          if (v31) {
            goto LABEL_36;
          }
        }
        else if (v31)
        {
          goto LABEL_36;
        }
LABEL_37:
        id v70 = 0;
        [(__CFURL *)url getResourceValue:&v70 forKey:v59 error:0];
        id v32 = v70;
        v33 = [v15 fileURL];
        id v34 = [v33 lastPathComponent];
        v35 = [v34 stringByReplacingOccurrencesOfString:@"\" withString:@"\\\"];

        if (v22)
        {
          id v36 = v22;
        }
        else if (v20)
        {
          id v36 = v20;
        }
        else
        {
          id v36 = [v62 identifier];
        }
        id v37 = v36;
        if ([v32 longLongValue] < 1)
        {
          v38 = &stru_1F0973378;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", objc_msgSend(v32, "longLongValue"), 0);
          v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v16 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"image"];
        [v16 setObject:v35 forKeyedSubscript:@"title"];
        [v16 setObject:v38 forKeyedSubscript:@"subtitle"];
        [v16 setObject:v37 forKeyedSubscript:@"type"];

        unint64_t v12 = 0x1E4F1C000;
        uint64_t v13 = v60;
LABEL_46:
        v39 = [v15 cidURL];
        uint64_t v40 = [v39 absoluteString];

        if (v40) {
          [v63 setObject:v16 forKeyedSubscript:v40];
        }
      }
      uint64_t v64 = [obj countByEnumeratingWithState:&v71 objects:v75 count:16];
      if (!v64)
      {
LABEL_50:

        v41 = v57;
        v42 = [(NoteHTMLEditorView *)v57 jsonStringFromDictionaryOrArray:v63];
        objc_storeStrong(location, a3);
        if (v53) {
          uint64_t v43 = (__CFString *)v53;
        }
        else {
          uint64_t v43 = &stru_1F0973378;
        }
        id v44 = [obj valueForKeyPath:@"cidURL.resourceSpecifier"];
        [(NoteHTMLEditorView *)v57 setAttachmentContentIDs:v44];

        -[NoteHTMLEditorView setHasAttachments:](v57, "setHasAttachments:", [obj count] != 0);
        [(NoteHTMLEditorView *)v57 setEnableSmartLists:+[ICTextStyle autoListInsertionEnabled]];
        id v45 = [(NoteHTMLEditorView *)v57 delegate];
        char v46 = objc_opt_respondsToSelector();

        if (v46)
        {
          long long v47 = [(NoteHTMLEditorView *)v57 delegate];
          uint64_t v48 = [v47 allowsAttachmentsInNoteHTMLEditorView:v57];

          v41 = v57;
          [(NoteHTMLEditorView *)v57 setEnableAttachments:v48];
        }
        long long v49 = [(NoteHTMLEditorView *)v41 webView];
        long long v50 = [v49 findInteraction];
        [v50 dismissFindNavigator];

        v51 = [(NoteHTMLEditorView *)v41 webView];
        objc_msgSend(NSString, "stringWithFormat:", @"notewkwebview.setHTMLContentWithAttachmentInfos(\"%@\", %@);",
          v43,
        uint64_t v52 = v42);
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __48__NoteHTMLEditorView_setHtmlString_attachments___block_invoke;
        v69[3] = &unk_1E5FDBD40;
        v69[4] = v41;
        [v51 evaluateJavaScript:v52 completionHandler:v69];

        id v7 = v55;
        id v6 = v56;
        break;
      }
    }
  }
LABEL_56:
}

uint64_t __48__NoteHTMLEditorView_setHtmlString_attachments___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isInsideSiriSnippet])
  {
    v2 = [*(id *)(a1 + 32) webView];
    [v2 _doAfterNextPresentationUpdate:&__block_literal_global_48];
  }
  [*(id *)(a1 + 32) updateDataDetectors];
  double v3 = *(void **)(a1 + 32);
  return [v3 updateWebViewEditability];
}

void __48__NoteHTMLEditorView_setHtmlString_attachments___block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"SiriNoteTextViewSizeDidChangeNotification" object:0];
}

- (void)setEnableAttachments:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(NoteHTMLEditorView *)self webView];
  id v4 = @"false";
  if (v3) {
    id v4 = @"true";
  }
  id v5 = [NSString stringWithFormat:@"setEnableAttachments(%@);", v4];
  objc_msgSend(v6, "ic_evaluateJavaScript:", v5);
}

- (void)setEnableSmartLists:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(NoteHTMLEditorView *)self webView];
  id v4 = @"false";
  if (v3) {
    id v4 = @"true";
  }
  id v5 = [NSString stringWithFormat:@"setEnableSmartLists(%@);", v4];
  objc_msgSend(v6, "ic_evaluateJavaScript:", v5);
}

- (void)setEnableShiftNewlinesInSmartLists:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(NoteHTMLEditorView *)self webView];
  id v4 = @"false";
  if (v3) {
    id v4 = @"true";
  }
  id v5 = [NSString stringWithFormat:@"setEnableShiftNewLinesInSmartLists(%@);", v4];
  objc_msgSend(v6, "ic_evaluateJavaScript:", v5);
}

- (void)insertHTMLString:(id)a3
{
  objc_msgSend(a3, "ic_htmlStringEscapingQuotesAndLineBreaks");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [(NoteHTMLEditorView *)self webView];
  id v5 = [NSString stringWithFormat:@"notewkwebview.insertHTML(\"%@\"", v6];
  objc_msgSend(v4, "ic_evaluateJavaScript:", v5);
}

- (void)insertLinkWithURL:(id)a3 title:(id)a4
{
  id v6 = a4;
  id v7 = [a3 absoluteString];
  double v8 = objc_msgSend(v7, "ic_htmlStringEscapingQuotesAndLineBreaks");

  int v9 = objc_msgSend(v6, "ic_htmlStringEscapingQuotesAndLineBreaks");

  uint64_t v10 = [NSString stringWithFormat:@"notewkwebview.insertLink(\"%@\", \"%@\");", v8, v9];
  unint64_t v11 = [(NoteHTMLEditorView *)self webView];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__NoteHTMLEditorView_insertLinkWithURL_title___block_invoke;
  v12[3] = &unk_1E5FDBD40;
  v12[4] = self;
  [v11 evaluateJavaScript:v10 completionHandler:v12];
}

uint64_t __46__NoteHTMLEditorView_insertLinkWithURL_title___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateDataDetectors];
}

- (void)insertLinksWithURLs:(id)a3 titles:(id)a4
{
  id v6 = a4;
  id v7 = [a3 valueForKey:@"absoluteString"];
  double v8 = [(NoteHTMLEditorView *)self jsonStringFromDictionaryOrArray:v7];
  int v9 = [(NoteHTMLEditorView *)self jsonStringFromDictionaryOrArray:v6];

  uint64_t v10 = [NSString stringWithFormat:@"notewkwebview.insertLinks(%@, %@);", v8, v9];
  unint64_t v11 = [(NoteHTMLEditorView *)self webView];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__NoteHTMLEditorView_insertLinksWithURLs_titles___block_invoke;
  v12[3] = &unk_1E5FDBD40;
  v12[4] = self;
  [v11 evaluateJavaScript:v10 completionHandler:v12];
}

uint64_t __49__NoteHTMLEditorView_insertLinksWithURLs_titles___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateDataDetectors];
}

- (void)copyNoteHTMLToPasteboard
{
  id v2 = [(NoteHTMLEditorView *)self webView];
  objc_msgSend(v2, "ic_evaluateJavaScript:", @"notewkwebview.copyNoteHTMLToPasteboard()");
}

- (id)attachmentInfoDictionaryForAttachmentPresentation:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [v3 filename];
  id v6 = [v5 pathExtension];

  id v7 = [v3 mimeType];
  if ([v7 length])
  {
    double v8 = [MEMORY[0x1E4F442D8] typeWithMIMEType:v7];
    int v9 = [v8 identifier];
  }
  else
  {
    int v9 = 0;
  }
  if ([v6 length])
  {
    uint64_t v10 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v6];
    unint64_t v11 = [v10 identifier];
  }
  else
  {
    unint64_t v11 = 0;
  }
  unint64_t v12 = [v3 contentIDURL];
  uint64_t v13 = [v12 absoluteString];
  [v4 setObject:v13 forKeyedSubscript:@"contentIDURL"];

  v14 = (void *)MEMORY[0x1E4F44400];
  if (!v9)
  {
    if (v11)
    {
LABEL_13:
      v15 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v11];
      int v16 = [v15 conformsToType:*v14];

      if (v9)
      {

        if (v16) {
          goto LABEL_15;
        }
      }
      else if (v16)
      {
        goto LABEL_15;
      }
      v26 = v6;
      char v17 = 0;
LABEL_20:
      id v18 = [v3 dataSizeNumber];
      v19 = [v3 filename];
      unint64_t v20 = [v19 lastPathComponent];
      v21 = [v20 stringByReplacingOccurrencesOfString:@"\" withString:@"\\\"];

      if (v17)
      {
        if (v9)
        {
          id v22 = v9;
        }
        else
        {
          id v22 = [(id)*MEMORY[0x1E4F44378] identifier];
        }
      }
      else
      {
        id v22 = v11;
      }
      v23 = v22;
      if ([v18 longLongValue] < 1)
      {
        int v24 = &stru_1F0973378;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", objc_msgSend(v18, "longLongValue"), 0);
        int v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"image"];
      [v4 setObject:v21 forKeyedSubscript:@"title"];
      [v4 setObject:v24 forKeyedSubscript:@"subtitle"];
      [v4 setObject:v23 forKeyedSubscript:@"type"];

      id v6 = v26;
      goto LABEL_29;
    }
    v26 = v6;
LABEL_19:
    char v17 = 1;
    goto LABEL_20;
  }
  unint64_t v12 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v9];
  if (![v12 conformsToType:*v14])
  {
    if (v11) {
      goto LABEL_13;
    }
    v26 = v6;

    goto LABEL_19;
  }

LABEL_15:
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"image"];
LABEL_29:

  return v4;
}

- (id)jsonStringFromDictionaryOrArray:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v9 = 0;
    id v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:&v9];
    id v5 = v9;
    if (v5)
    {
      id v6 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[NoteHTMLEditorView jsonStringFromDictionaryOrArray:]();
      }
    }
    id v7 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  }
  else
  {
    id v4 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[NoteHTMLEditorView jsonStringFromDictionaryOrArray:](v3, v4);
    }

    id v7 = 0;
    id v5 = 0;
  }

  return v7;
}

- (void)replaceSelectionWithAttachmentPresentation:(id)a3
{
  id v7 = [(NoteHTMLEditorView *)self attachmentInfoDictionaryForAttachmentPresentation:a3];
  id v4 = [(NoteHTMLEditorView *)self jsonStringFromDictionaryOrArray:v7];
  id v5 = [(NoteHTMLEditorView *)self webView];
  id v6 = [NSString stringWithFormat:@"notewkwebview.insertAttachment(%@);", v4];
  objc_msgSend(v5, "ic_evaluateJavaScript:", v6);
}

- (void)undoablyReplaceSelectionWithAttachmentPresentations:(id)a3 undoManager:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [(NoteHTMLEditorView *)self attachmentInfoDictionaryForAttachmentPresentation:*(void *)(*((void *)&v19 + 1) + 8 * v13)];
        if (v14) {
          [v8 addObject:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  v15 = [v7 prepareWithInvocationTarget:self];
  [v15 undoablyRemoveAttachmentPresentations:v9 undoManager:v7];

  int v16 = [(NoteHTMLEditorView *)self jsonStringFromDictionaryOrArray:v8];
  char v17 = [(NoteHTMLEditorView *)self webView];
  id v18 = [NSString stringWithFormat:@"notewkwebview.insertAttachments(%@);", v16];
  objc_msgSend(v17, "ic_evaluateJavaScript:", v18);
}

- (void)undoablyRemoveAttachmentPresentations:(id)a3 undoManager:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [(NoteHTMLEditorView *)self attachmentInfoDictionaryForAttachmentPresentation:*(void *)(*((void *)&v19 + 1) + 8 * v13)];
        if (v14) {
          [v8 addObject:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  v15 = [v7 prepareWithInvocationTarget:self];
  [v15 undoablyReplaceSelectionWithAttachmentPresentations:v9 undoManager:v7];

  int v16 = [(NoteHTMLEditorView *)self jsonStringFromDictionaryOrArray:v8];
  char v17 = [(NoteHTMLEditorView *)self webView];
  id v18 = [NSString stringWithFormat:@"notewkwebview.removeAttachments(%@);", v16];
  objc_msgSend(v17, "ic_evaluateJavaScript:", v18);
}

- (void)replaceContentIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(NoteHTMLEditorView *)self jsonStringFromDictionaryOrArray:v4];
  id v6 = [(NoteHTMLEditorView *)self attachmentContentIDs];
  id v7 = (void *)[v6 copy];

  double v8 = (void *)MEMORY[0x1E4F1CA48];
  id v9 = [(NoteHTMLEditorView *)self attachmentContentIDs];
  uint64_t v10 = [v8 arrayWithArray:v9];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __40__NoteHTMLEditorView_replaceContentIDs___block_invoke;
  v17[3] = &unk_1E5FDBD68;
  id v18 = v10;
  id v11 = v10;
  [v4 enumerateKeysAndObjectsUsingBlock:v17];

  [(NoteHTMLEditorView *)self setAttachmentContentIDs:v11];
  uint64_t v12 = [NSString stringWithFormat:@"notewkwebview.replaceAttachmentContentIDs(%@);", v5];
  uint64_t v13 = [(NoteHTMLEditorView *)self webView];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __40__NoteHTMLEditorView_replaceContentIDs___block_invoke_2;
  v15[3] = &unk_1E5FDBD90;
  v15[4] = self;
  id v16 = v7;
  id v14 = v7;
  [v13 evaluateJavaScript:v12 completionHandler:v15];
}

void __40__NoteHTMLEditorView_replaceContentIDs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = a3;
  id v15 = [v5 URLWithString:a2];
  id v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];

  double v8 = [v15 resourceSpecifier];
  uint64_t v9 = [v7 resourceSpecifier];
  uint64_t v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    uint64_t v12 = [v15 scheme];
    if ([v12 isEqualToString:@"cid"])
    {
      uint64_t v13 = [v7 scheme];
      int v14 = [v13 isEqualToString:@"cid"];

      if (v14)
      {
        objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v8));
        [*(id *)(a1 + 32) addObject:v10];
      }
    }
    else
    {
    }
  }
}

void __40__NoteHTMLEditorView_replaceContentIDs___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __40__NoteHTMLEditorView_replaceContentIDs___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 32) setAttachmentContentIDs:*(void *)(a1 + 40)];
  }
}

- (void)setSourceURLForAttachmentIdentifier:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 firstObject];
  id v6 = ICDynamicCast();

  id v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
  objc_opt_class();
  double v8 = [v4 lastObject];
  uint64_t v9 = ICDynamicCast();

  if (v7) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    uint64_t v13 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[NoteHTMLEditorView setSourceURLForAttachmentIdentifier:](v13);
    }
  }
  else
  {
    uint64_t v24 = v6;
    BOOL v11 = [(NoteHTMLEditorView *)self attachmentContentIDs];
    uint64_t v12 = (void *)[v11 copy];

    uint64_t v13 = [(NoteHTMLEditorView *)self jsonStringFromDictionaryOrArray:v4];
    int v14 = (void *)MEMORY[0x1E4F1CA48];
    id v15 = [(NoteHTMLEditorView *)self attachmentContentIDs];
    id v16 = [v14 arrayWithArray:v15];

    uint64_t v17 = [v7 resourceSpecifier];
    id v18 = (void *)v17;
    if (v17)
    {
      long long v19 = [v7 scheme];
      int v20 = [v19 isEqualToString:@"cid"];

      if (v20) {
        [v16 addObject:v18];
      }
    }
    [(NoteHTMLEditorView *)self setAttachmentContentIDs:v16];
    objc_msgSend(NSString, "stringWithFormat:", @"notewkwebview.setSourceURLForAttachmentIdentifier(%@);",
    long long v21 = v13);
    long long v22 = [(NoteHTMLEditorView *)self webView];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __58__NoteHTMLEditorView_setSourceURLForAttachmentIdentifier___block_invoke;
    v25[3] = &unk_1E5FDBD90;
    v25[4] = self;
    id v26 = v12;
    id v23 = v12;
    [v22 evaluateJavaScript:v21 completionHandler:v25];

    id v6 = v24;
  }
}

void __58__NoteHTMLEditorView_setSourceURLForAttachmentIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __58__NoteHTMLEditorView_setSourceURLForAttachmentIdentifier___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) setAttachmentContentIDs:*(void *)(a1 + 40)];
  }
}

- (void)buildMenuWithBuilder:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)NoteHTMLEditorView;
  id v3 = a3;
  [(NoteHTMLEditorView *)&v11 buildMenuWithBuilder:v3];
  id v4 = objc_msgSend(MEMORY[0x1E4F83770], "localizedFrameworkStringForKey:value:table:allowSiri:", @"INSERT_PHOTO", @"Insert Photo", 0, 1, v11.receiver, v11.super_class);
  id v5 = (void *)MEMORY[0x1E4FB1638];
  id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"camera"];
  id v7 = [v5 commandWithTitle:v4 image:v6 action:sel_insertImage_ propertyList:0];

  double v8 = (void *)MEMORY[0x1E4FB1970];
  v12[0] = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  BOOL v10 = [v8 menuWithTitle:&stru_1F0973378 image:0 identifier:0 options:1 children:v9];

  [v3 insertChildMenu:v10 atEndOfMenuForIdentifier:*MEMORY[0x1E4FB2D50]];
  [v3 replaceChildrenOfMenuForIdentifier:*MEMORY[0x1E4FB2DC8] fromChildrenBlock:&__block_literal_global_241];
}

id __43__NoteHTMLEditorView_buildMenuWithBuilder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4FB1638];
  id v3 = (void *)MEMORY[0x1E4F83770];
  id v4 = a2;
  id v5 = [v3 localizedFrameworkStringForKey:@"Strikethrough" value:@"Strikethrough" table:0 allowSiri:1];
  id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"strikethrough"];
  id v7 = [v2 commandWithTitle:v5 image:v6 action:sel_strikethrough_ propertyList:0];

  double v8 = [v4 arrayByAddingObject:v7];

  return v8;
}

- (void)updateDataDetectors
{
  BOOL v3 = [(NoteHTMLEditorView *)self isEditing];
  id v4 = [(NoteHTMLEditorView *)self webView];
  id v5 = v4;
  if (v3)
  {
    [v4 _removeDataDetectedLinks:0];
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__NoteHTMLEditorView_updateDataDetectors__block_invoke;
    v6[3] = &unk_1E5FD8DF0;
    v6[4] = self;
    [v4 _detectDataWithTypes:-1 completionHandler:v6];
  }
}

void __41__NoteHTMLEditorView_updateDataDetectors__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) webView];
  objc_msgSend(v1, "ic_evaluateJavaScript:", @"notewkwebview.updateAnchorListeners();");
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
  id v4 = [(NoteHTMLEditorView *)self webView];
  char v5 = [v4 isLoading];

  if ((v5 & 1) == 0)
  {
    [(NoteHTMLEditorView *)self adoptEditableState];
  }
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
  [(NoteHTMLEditorView *)self updateDataDetectors];
  [(NoteHTMLEditorView *)self updateWebViewEditability];
}

- (void)updateWebViewEditability
{
  if (self->_editing)
  {
    uint64_t v3 = 1;
  }
  else
  {
    id v4 = [(NoteHTMLEditorView *)self webView];
    char v5 = [v4 findInteraction];
    uint64_t v3 = [v5 isFindNavigatorVisible];
  }
  id v6 = [(NoteHTMLEditorView *)self webView];
  int v7 = [v6 _isEditable];

  if (v3 != v7)
  {
    id v8 = [(NoteHTMLEditorView *)self webView];
    [v8 _setEditable:v3];
  }
}

- (void)adoptEditableState
{
  BOOL v3 = [(NoteHTMLEditorView *)self isEditable];
  id v4 = [(NoteHTMLEditorView *)self webView];
  id v6 = v4;
  if (v3) {
    char v5 = @"notewkwebview.enableEditor()";
  }
  else {
    char v5 = @"notewkwebview.disableEditor()";
  }
  objc_msgSend(v4, "ic_evaluateJavaScript:", v5);
}

- (void)startEditing
{
  BOOL v3 = [(NoteHTMLEditorView *)self webView];
  char v4 = [v3 isLoading];

  if (v4)
  {
    [(NoteHTMLEditorView *)self setStartEditingAfterLoad:1];
  }
  else
  {
    [(NoteHTMLEditorView *)self setEditing:1];
    id v5 = [(NoteHTMLEditorView *)self webView];
    objc_msgSend(v5, "ic_evaluateJavaScript:", @"notewkwebview.startEditing()");
  }
}

- (void)stopEditing
{
}

- (void)stopEditingWithCompletion:(id)a3
{
  id v4 = a3;
  [(NoteHTMLEditorView *)self setEditing:0];
  id v5 = [(NoteHTMLEditorView *)self webView];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__NoteHTMLEditorView_stopEditingWithCompletion___block_invoke;
  v7[3] = &unk_1E5FDBDD8;
  id v8 = @"notewkwebview.stopEditing()";
  id v9 = v4;
  id v6 = v4;
  [v5 evaluateJavaScript:@"notewkwebview.stopEditing()" completionHandler:v7];
}

void __48__NoteHTMLEditorView_stopEditingWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __48__NoteHTMLEditorView_stopEditingWithCompletion___block_invoke_cold_1();
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v6 == 0);
  }
}

- (void)setInsideSiriSnippet:(BOOL)a3
{
  self->_insideSiriSnippet = a3;
}

- (void)updateContent
{
  if ([(NoteHTMLEditorView *)self updatingContent])
  {
    id v7 = [(NoteHTMLEditorView *)self updateContentDelayer];
    [v7 requestFire];
  }
  else
  {
    BOOL v3 = [(NoteHTMLEditorView *)self delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [(NoteHTMLEditorView *)self delegate];
      [v5 noteHTMLEditorViewWillChange:self];
    }
    [(NoteHTMLEditorView *)self setUpdatingContent:1];
    objc_initWeak(&location, self);
    id v6 = [(NoteHTMLEditorView *)self webView];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __35__NoteHTMLEditorView_updateContent__block_invoke;
    v8[3] = &unk_1E5FDBE00;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    [v6 evaluateJavaScript:@"getHTMLContentAndAttachmentContentIDURLs();" completionHandler:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __35__NoteHTMLEditorView_updateContent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_opt_class();
    id v5 = ICDynamicCast();
    objc_opt_class();
    id v6 = [v5 objectForKeyedSubscript:@"htmlContent"];
    id v7 = ICDynamicCast();

    objc_opt_class();
    uint64_t v8 = [v5 objectForKeyedSubscript:@"attachmentContentIDURLs"];
    id v9 = ICDynamicCast();

    if (v9)
    {
      id v29 = v7;
      v30 = v5;
      uint64_t v31 = a1;
      id v32 = WeakRetained;
      id v33 = v3;
      BOOL v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v28 = v9;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v35;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v35 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v34 + 1) + 8 * v15);
            uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v16];
            id v18 = [v17 resourceSpecifier];
            if (v18)
            {
              [v10 addObject:v18];
            }
            else
            {
              long long v19 = os_log_create("com.apple.notes", "UI");
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v39 = v16;
                _os_log_debug_impl(&dword_1B08EB000, v19, OS_LOG_TYPE_DEBUG, "couldn't convert content ID URL string %@ to URL", buf, 0xCu);
              }
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v13);
      }

      WeakRetained = v32;
      [v32 setAttachmentContentIDs:v10];
      objc_msgSend(v32, "setHasAttachments:", objc_msgSend(v10, "count") != 0);
      id v3 = v33;
      id v5 = v30;
      a1 = v31;
      if ([v11 count])
      {
        int v20 = [*(id *)(v31 + 32) delegate];
        char v21 = objc_opt_respondsToSelector();

        if (v21)
        {
          long long v22 = [*(id *)(v31 + 32) delegate];
          id v23 = [v22 noteHTMLEditorView:*(void *)(v31 + 32) updateAttachments:v11];

          if ([v23 count]) {
            [*(id *)(v31 + 32) replaceContentIDs:v23];
          }
        }
      }

      id v9 = v28;
      id v7 = v29;
    }
    if (v7)
    {
      char v24 = [v7 isEqualToString:WeakRetained[59]];
      objc_storeStrong(WeakRetained + 59, v7);
      if ((v24 & 1) == 0)
      {
        id v25 = [WeakRetained delegate];
        char v26 = objc_opt_respondsToSelector();

        if (v26)
        {
          char v27 = [WeakRetained delegate];
          [v27 noteHTMLEditorViewDidChange:*(void *)(a1 + 32)];
        }
      }
    }
    objc_msgSend(WeakRetained, "setUpdatingContent:", 0, v28);
  }
}

- (void)insertImage:(id)a3
{
  id v4 = [(NoteHTMLEditorView *)self actionDelegate];
  [v4 insertImageInNoteHTMLEditorView:self];
}

- (void)insertBulletedList:(id)a3
{
  id v3 = [(NoteHTMLEditorView *)self webView];
  objc_msgSend(v3, "ic_evaluateJavaScript:", @"notewkwebview.insertBulletedList();");
}

- (void)insertDashedList:(id)a3
{
  id v3 = [(NoteHTMLEditorView *)self webView];
  objc_msgSend(v3, "ic_evaluateJavaScript:", @"notewkwebview.insertDashedList();");
}

- (void)insertOrderedList:(id)a3
{
  id v3 = [(NoteHTMLEditorView *)self webView];
  objc_msgSend(v3, "ic_evaluateJavaScript:", @"notewkwebview.insertNumberedList();");
}

- (void)removeStyle:(id)a3
{
  id v3 = [(NoteHTMLEditorView *)self webView];
  objc_msgSend(v3, "ic_evaluateJavaScript:", @"notewkwebview.removeStyle();");
}

- (void)scrollSelectionToVisible:(BOOL)a3
{
  id v3 = [(NoteHTMLEditorView *)self webView];
  objc_msgSend(v3, "ic_evaluateJavaScript:", @"notewkwebview.scrollSelectionToVisible()");
}

- (void)getRectForSelectionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NoteHTMLEditorView *)self webView];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__NoteHTMLEditorView_getRectForSelectionWithCompletion___block_invoke;
  v7[3] = &unk_1E5FDBE28;
  id v8 = v4;
  id v6 = v4;
  [v5 evaluateJavaScript:@"notewkwebview.getSelectionRects()" completionHandler:v7];
}

void __56__NoteHTMLEditorView_getRectForSelectionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  id v6 = ICDynamicCast();
  id v7 = v6;
  if (v5)
  {
    id v8 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __56__NoteHTMLEditorView_getRectForSelectionWithCompletion___block_invoke_cold_1();
    }

    double x = *MEMORY[0x1E4F1DB28];
    double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    double x = *MEMORY[0x1E4F1DB20];
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v13 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v7);
          }
          uint64_t v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if ([v17 count] == 4)
          {
            id v18 = [v17 objectAtIndexedSubscript:0];
            [v18 doubleValue];
            CGFloat v20 = v19;
            char v21 = [v17 objectAtIndexedSubscript:1];
            [v21 doubleValue];
            CGFloat v23 = v22;
            char v24 = [v17 objectAtIndexedSubscript:2];
            [v24 doubleValue];
            CGFloat v26 = v25;
            char v27 = [v17 objectAtIndexedSubscript:3];
            [v27 doubleValue];
            CGFloat v29 = v28;

            v38.origin.double x = x;
            v38.origin.double y = y;
            v38.size.double width = width;
            v38.size.double height = height;
            v40.origin.double x = v20;
            v40.origin.double y = v23;
            v40.size.double width = v26;
            v40.size.double height = v29;
            CGRect v39 = CGRectUnion(v38, v40);
            double x = v39.origin.x;
            double y = v39.origin.y;
            double width = v39.size.width;
            double height = v39.size.height;
          }
        }
        uint64_t v14 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v14);
    }
  }
  uint64_t v30 = *(void *)(a1 + 32);
  if (v30) {
    (*(void (**)(uint64_t, id, double, double, double, double))(v30 + 16))(v30, v5, x, y, width, height);
  }
}

- (void)setSelectionToStart
{
  id v3 = [(NoteHTMLEditorView *)self webView];
  char v4 = [v3 isLoading];

  if ((v4 & 1) == 0)
  {
    id v5 = [(NoteHTMLEditorView *)self webView];
    objc_msgSend(v5, "ic_evaluateJavaScript:", @"notewkwebview.setSelectionToStart();");
  }
}

- (void)setSelectionToEnd
{
  id v3 = [(NoteHTMLEditorView *)self webView];
  char v4 = [v3 isLoading];

  if (v4)
  {
    [(NoteHTMLEditorView *)self setSetSelectionToEndAfterLoad:1];
  }
  else
  {
    id v5 = [(NoteHTMLEditorView *)self webView];
    objc_msgSend(v5, "ic_evaluateJavaScript:", @"notewkwebview.setSelectionToEnd();");
  }
}

- (BOOL)isFirstResponder
{
  id v2 = [(NoteHTMLEditorView *)self webView];
  char v3 = [v2 isFirstResponder];

  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_insertImage_ == a3)
  {
    if ([(NoteHTMLEditorView *)self isEditing])
    {
      id v8 = [(NoteHTMLEditorView *)self actionDelegate];
      unsigned __int8 v7 = [v8 canInsertImagesInNoteHTMLEditorView:self];

      goto LABEL_9;
    }
LABEL_8:
    unsigned __int8 v7 = 0;
    goto LABEL_9;
  }
  if (sel_strikethrough_ == a3)
  {
    if ([(NoteHTMLEditorView *)self isEditing])
    {
      unsigned __int8 v7 = [(NoteHTMLEditorView *)self selectionLength] > 0;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v10.receiver = self;
  v10.super_class = (Class)NoteHTMLEditorView;
  unsigned __int8 v7 = [(NoteHTMLEditorView *)&v10 canPerformAction:a3 withSender:v6];
LABEL_9:

  return v7;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ([(NoteHTMLEditorView *)self canPerformAction:a3 withSender:v6])
  {
    unsigned __int8 v7 = self;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NoteHTMLEditorView;
    unsigned __int8 v7 = [(NoteHTMLEditorView *)&v10 targetForAction:a3 withSender:v6];
  }
  id v8 = v7;

  return v8;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5 = [a3 nextFocusedItem];
  int v6 = [v5 isEqual:self];

  if (v6)
  {
    [(NoteHTMLEditorView *)self startEditing];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  if (v3 != 0.0)
  {
    [v4 contentOffset];
    [v4 setContentOffset:0.0];
  }
}

- (BOOL)_webView:(id)a3 focusShouldStartInputSession:(id)a4
{
  id v5 = a4;
  int v6 = [(NoteHTMLEditorView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(NoteHTMLEditorView *)self delegate];
    char v9 = objc_msgSend(v8, "noteHTMLEditorViewShouldBeginEditing:isUserInitiated:", self, objc_msgSend(v5, "isUserInitiated"));
  }
  else
  {
    char v9 = [(NoteHTMLEditorView *)self isEditable];
  }

  return v9;
}

- (void)_webView:(id)a3 didStartInputSession:(id)a4
{
  [a4 setAccessoryViewShouldNotShow:1];
  [(NoteHTMLEditorView *)self setEditing:1];
  id v5 = [(NoteHTMLEditorView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(NoteHTMLEditorView *)self delegate];
    [v7 noteHTMLEditorViewDidBeginEditing:self];
  }
}

- (int64_t)_webView:(id)a3 dataOwnerForDragSession:(id)a4
{
  id v5 = [(NoteHTMLEditorView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 1;
  }
  id v7 = [(NoteHTMLEditorView *)self delegate];
  int v8 = [v7 isNoteManagedForNoteHTMLEditorView:self];

  if (v8) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)_webView:(id)a3 dataOwnerForDropSession:(id)a4
{
  id v5 = [(NoteHTMLEditorView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 1;
  }
  id v7 = [(NoteHTMLEditorView *)self delegate];
  int v8 = [v7 isNoteManagedForNoteHTMLEditorView:self];

  if (v8) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)_webView:(id)a3 performDataInteractionOperationWithItemProviders:(id)a4
{
  id v5 = a4;
  char v6 = [(NoteHTMLEditorView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int v8 = [(NoteHTMLEditorView *)self delegate];
    int v9 = [v8 noteHTMLEditorView:self canAddAttachmentItemProviders:v5];

    if (!v9) {
      goto LABEL_5;
    }
  }
  objc_super v10 = [(NoteHTMLEditorView *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    uint64_t v12 = [(NoteHTMLEditorView *)self delegate];
    [v12 noteHTMLEditorView:self addAttachmentItemProviders:v5];

    BOOL v13 = 1;
  }
  else
  {
LABEL_5:
    BOOL v13 = 0;
  }

  return v13;
}

- (void)_webView:(id)a3 didInsertAttachment:(id)a4 withSource:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if ([v8 length])
  {
    int v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
  }
  else
  {
    int v9 = 0;
  }
  objc_super v10 = [v9 scheme];
  int v11 = [v10 isEqualToString:@"cid"];

  if (v11)
  {
    uint64_t v12 = [v9 resourceSpecifier];
    BOOL v13 = [(NoteHTMLEditorView *)self delegate];
    uint64_t v14 = [v13 noteHTMLEditorView:self attachmentPresentationForContentID:v12];

    if (v14)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F28CF0]);
      uint64_t v16 = [v14 dataFileURL];
      id v36 = 0;
      uint64_t v17 = (void *)[v15 initWithURL:v16 options:0 error:&v36];
      id v18 = v36;

      if (v18 || !v17)
      {
        CGFloat v20 = os_log_create("com.apple.notes", "HTML");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          long long v32 = [v14 dataFileURL];
          *(_DWORD *)buf = 138412802;
          CGRect v38 = v12;
          __int16 v39 = 2112;
          CGRect v40 = v32;
          __int16 v41 = 2112;
          id v42 = v18;
          _os_log_error_impl(&dword_1B08EB000, v20, OS_LOG_TYPE_ERROR, "Could not create file wrapper for content ID %@ and URL: %@ – %@", buf, 0x20u);
        }
      }
      else
      {
        double v19 = [v14 mimeType];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __62__NoteHTMLEditorView__webView_didInsertAttachment_withSource___block_invoke;
        v33[3] = &unk_1E5FDBE50;
        long long v34 = v14;
        id v35 = v12;
        [v7 setFileWrapper:v17 contentType:v19 completion:v33];

        CGFloat v20 = v34;
      }
    }
    goto LABEL_16;
  }
  char v21 = [(NoteHTMLEditorView *)self delegate];
  int v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    CGFloat v23 = [(NoteHTMLEditorView *)self delegate];
    char v24 = [v7 info];
    double v25 = [v24 fileWrapper];
    CGFloat v26 = [v7 info];
    char v27 = [v26 contentType];
    uint64_t v12 = [v23 noteHTMLEditorView:self createAttachmentPresentationWithFileWrapper:v25 mimeType:v27];

    double v28 = [v12 contentIDURL];
    CGFloat v29 = [v28 absoluteString];

    uint64_t v30 = [v7 uniqueIdentifier];
    uint64_t v31 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v29, v30, 0);
    [(NoteHTMLEditorView *)self performSelector:sel_setSourceURLForAttachmentIdentifier_ withObject:v31 afterDelay:0.0];

LABEL_16:
  }
}

void __62__NoteHTMLEditorView__webView_didInsertAttachment_withSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__NoteHTMLEditorView__webView_didInsertAttachment_withSource___block_invoke_cold_1(a1, v3, v4);
    }
  }
}

- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5
{
  id v18 = a4;
  id v7 = (void (**)(id, void *))a5;
  id v8 = [v18 _activatedElementInfo];
  if ([v8 type] == 1)
  {
    int v9 = [v8 imageURL];
  }
  else if ([v8 type] == 2)
  {
    objc_super v10 = (void *)MEMORY[0x1E4F1CB10];
    int v11 = [v8 ID];
    int v9 = [v10 URLWithString:v11];
  }
  else
  {
    int v9 = 0;
  }
  uint64_t v12 = [v9 scheme];
  int v13 = [v12 isEqualToString:@"cid"];

  if (v13)
  {
    uint64_t v14 = [v9 resourceSpecifier];
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = [(NoteHTMLEditorView *)self delegate];
  uint64_t v16 = [v15 noteHTMLEditorView:self attachmentPresentationForContentID:v14];

  if (v16)
  {
    uint64_t v17 = [(NoteHTMLEditorView *)self contextMenuConfigurationForElement:v18 presentation:v16];
    v7[2](v7, v17);
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v16 = a4;
  id v7 = (void (**)(id, uint64_t))a5;
  id v8 = [v16 request];
  int v9 = [v8 URL];

  objc_super v10 = [v9 absoluteString];
  if ([v10 isEqualToString:@"about:blank"])
  {
    uint64_t v11 = [v16 navigationType];

    if (v11 == -1)
    {
      uint64_t v12 = 1;
      goto LABEL_9;
    }
  }
  else
  {
  }
  if (([(NoteHTMLEditorView *)self performActionForDataDetectedInURL:v9] & 1) == 0)
  {
    int v13 = [(NoteHTMLEditorView *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = [(NoteHTMLEditorView *)self delegate];
      [v15 noteHTMLEditorView:self openURL:v9];
    }
  }
  uint64_t v12 = 0;
LABEL_9:
  v7[2](v7, v12);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v5 = [(NoteHTMLEditorView *)self htmlStringToLoad];

  if (v5)
  {
    char v6 = [(NoteHTMLEditorView *)self htmlStringToLoad];
    id v7 = [(NoteHTMLEditorView *)self attachmentsToLoad];
    [(NoteHTMLEditorView *)self setHtmlStringToLoad:0];
    [(NoteHTMLEditorView *)self setAttachmentsToLoad:0];
    [(NoteHTMLEditorView *)self setHtmlString:v6 attachments:v7];
  }
  [(NoteHTMLEditorView *)self adoptEditableState];
  id v8 = [(NoteHTMLEditorView *)self webView];
  int v9 = [v8 scrollView];
  [v9 setDelegate:self];

  [(NoteHTMLEditorView *)self setEnableShiftNewlinesInSmartLists:0];
  if ([(NoteHTMLEditorView *)self setSelectionToEndAfterLoad])
  {
    [(NoteHTMLEditorView *)self setSetSelectionToEndAfterLoad:0];
    [(NoteHTMLEditorView *)self setSelectionToEnd];
  }
  if ([(NoteHTMLEditorView *)self startEditingAfterLoad])
  {
    [(NoteHTMLEditorView *)self setStartEditingAfterLoad:0];
    [(NoteHTMLEditorView *)self startEditing];
  }
}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  htmlString = self->_htmlString;
  self->_htmlString = 0;

  [(NoteHTMLEditorView *)self setAttachmentContentIDs:0];
  id v5 = [(NoteHTMLEditorView *)self webView];
  [v5 removeFromSuperview];

  [(NoteHTMLEditorView *)self setupWebView];
  char v6 = [(NoteHTMLEditorView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(NoteHTMLEditorView *)self delegate];
    [v8 noteHTMLEditorViewNeedsContentReload:self];
  }
}

- (void)didReceiveScriptMessage:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 name];
  int v6 = [v5 isEqualToString:@"textDidChange"];

  if (v6)
  {
    char v7 = [(NoteHTMLEditorView *)self updateContentDelayer];
    [v7 requestFire];
LABEL_32:

    goto LABEL_33;
  }
  id v8 = [v4 name];
  int v9 = [v8 isEqualToString:@"attachmentsDidChange"];

  if (v9)
  {
    objc_opt_class();
    objc_super v10 = [v4 body];
    uint64_t v11 = ICDynamicCast();

    objc_opt_class();
    uint64_t v12 = [v4 body];
    int v13 = ICDynamicCast();

    if (v13) {
      -[NoteHTMLEditorView setHasAttachments:](self, "setHasAttachments:", [v13 BOOLValue]);
    }
    if (v11)
    {
      uint64_t v48 = v13;
      id v50 = v4;
      char v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v49 = v11;
      id v15 = v11;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v58 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v53;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v53 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v52 + 1) + 8 * v19);
            char v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v20];
            int v22 = [v21 resourceSpecifier];
            if (v22)
            {
              [v14 addObject:v22];
            }
            else
            {
              CGFloat v23 = os_log_create("com.apple.notes", "UI");
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v57 = v20;
                _os_log_debug_impl(&dword_1B08EB000, v23, OS_LOG_TYPE_DEBUG, "couldn't convert content ID URL string %@ to URL", buf, 0xCu);
              }
            }
            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v52 objects:v58 count:16];
        }
        while (v17);
      }

      [(NoteHTMLEditorView *)self setAttachmentContentIDs:v14];
      -[NoteHTMLEditorView setHasAttachments:](self, "setHasAttachments:", [v14 count] != 0);

      id v4 = v50;
      int v13 = v48;
      uint64_t v11 = v49;
    }
    else
    {
      uint64_t v37 = [(NoteHTMLEditorView *)self updateContentDelayer];
      [v37 requestFire];
    }
    goto LABEL_25;
  }
  char v24 = [v4 name];
  int v25 = [v24 isEqualToString:@"titleDidChange"];

  if (v25)
  {
    objc_opt_class();
    CGFloat v26 = [v4 body];
    char v27 = ICDynamicCast();

    double v28 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    CGFloat v29 = [v27 stringByTrimmingCharactersInSet:v28];

    char v7 = [v29 stringByReplacingOccurrencesOfString:@" " withString:@" "];

    [(NoteHTMLEditorView *)self setTitle:v7];
    goto LABEL_32;
  }
  uint64_t v30 = [v4 name];
  int v31 = [v30 isEqualToString:@"selectionDidChange"];

  if (v31)
  {
    objc_opt_class();
    long long v32 = [v4 body];
    uint64_t v11 = ICDynamicCast();

    objc_opt_class();
    long long v33 = [v11 objectForKeyedSubscript:@"selectionLength"];
    int v13 = ICDynamicCast();

    uint64_t v34 = [v13 integerValue];
    objc_opt_class();
    id v35 = [v11 objectForKeyedSubscript:@"listStyle"];
    id v36 = ICDynamicCast();

    [(NoteHTMLEditorView *)self setSelectionLength:v34];
    -[NoteHTMLEditorView setListStyle:](self, "setListStyle:", [v36 characterAtIndex:0]);

LABEL_25:
    goto LABEL_33;
  }
  CGRect v38 = [v4 name];
  int v39 = [v38 isEqualToString:@"editorDidBlur"];

  if (v39)
  {
    [(NoteHTMLEditorView *)self setEditing:0];
    char v7 = [(NoteHTMLEditorView *)self delegate];
    [v7 noteHTMLEditorViewDidEndEditing:self];
    goto LABEL_32;
  }
  CGRect v40 = [v4 name];
  int v41 = [v40 isEqualToString:@"anchorTouchesDidEnd"];

  if (v41)
  {
    dispatch_time_t v42 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__NoteHTMLEditorView_didReceiveScriptMessage___block_invoke;
    block[3] = &unk_1E5FD8DF0;
    block[4] = self;
    dispatch_after(v42, MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v43 = [v4 name];
    int v44 = [v43 isEqualToString:@"clickedAttachment"];

    if (v44)
    {
      objc_opt_class();
      id v45 = [v4 body];
      char v7 = ICDynamicCast();

      char v46 = [v7 scheme];
      long long v47 = [v46 lowercaseString];
      [v47 isEqualToString:@"cid"];

      goto LABEL_32;
    }
  }
LABEL_33:
}

uint64_t __46__NoteHTMLEditorView_didReceiveScriptMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) adoptEditableState];
}

- (void)loadAttachmentContentForURLSchemeTask:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4F28B48];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __60__NoteHTMLEditorView_loadAttachmentContentForURLSchemeTask___block_invoke;
  v12[3] = &unk_1E5FDA4E0;
  objc_copyWeak(&v14, &location);
  id v6 = v4;
  id v13 = v6;
  char v7 = [v5 blockOperationWithBlock:v12];
  id v8 = [v6 request];
  int v9 = [v8 URL];
  objc_super v10 = [v9 absoluteString];
  [v7 setName:v10];

  uint64_t v11 = [MEMORY[0x1E4F28F08] mainQueue];
  [v11 addOperation:v7];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __60__NoteHTMLEditorView_loadAttachmentContentForURLSchemeTask___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [*(id *)(a1 + 32) request];
  id v4 = [v3 URL];
  id v5 = [v4 scheme];
  id v6 = [v5 lowercaseString];
  int v7 = [v6 isEqualToString:@"cid"];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) request];
    uint64_t v9 = [v8 URL];
    objc_super v10 = [(id)v9 resourceSpecifier];

    uint64_t v11 = [WeakRetained delegate];
    LOBYTE(v9) = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0
      && ([WeakRetained delegate],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          [v12 noteHTMLEditorView:WeakRetained fileURLForAttachmentWithContentID:v10],
          id v13 = objc_claimAutoreleasedReturnValue(),
          v12,
          v13))
    {
      id v14 = (void *)MEMORY[0x1E4F442D8];
      id v15 = [v13 pathExtension];
      uint64_t v16 = [v14 typeWithFilenameExtension:v15];
      uint64_t v17 = [v16 identifier];

      if (v17)
      {
        uint64_t v18 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v17];
        uint64_t v19 = [v18 preferredMIMEType];
      }
      else
      {
        uint64_t v19 = [(id)*MEMORY[0x1E4F44378] preferredMIMEType];
      }
      int v31 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v13];
      id v32 = objc_alloc(MEMORY[0x1E4F290D8]);
      long long v33 = [*(id *)(a1 + 32) request];
      uint64_t v34 = [v33 URL];
      id v35 = objc_msgSend(v32, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v34, v19, objc_msgSend(v31, "length"), 0);

      [*(id *)(a1 + 32) didReceiveResponse:v35];
      [*(id *)(a1 + 32) didReceiveData:v31];
      [*(id *)(a1 + 32) didFinish];

      id v20 = 0;
    }
    else
    {
      char v21 = [WeakRetained delegate];
      char v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) != 0
        && ([WeakRetained delegate],
            CGFloat v23 = objc_claimAutoreleasedReturnValue(),
            [v23 noteHTMLEditorView:WeakRetained attachmentPresentationForContentID:v10],
            char v24 = objc_claimAutoreleasedReturnValue(),
            v23,
            v24))
      {
        id v37 = 0;
        id v38 = 0;
        id v36 = 0;
        [v24 getPresentationData:&v38 mimeType:&v37 error:&v36];
        id v25 = v38;
        id v26 = v37;
        id v20 = v36;
        id v27 = objc_alloc(MEMORY[0x1E4F290D8]);
        double v28 = [*(id *)(a1 + 32) request];
        CGFloat v29 = [v28 URL];
        uint64_t v30 = objc_msgSend(v27, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v29, v26, objc_msgSend(v25, "length"), 0);

        [*(id *)(a1 + 32) didReceiveResponse:v30];
        [*(id *)(a1 + 32) didReceiveData:v25];
        [*(id *)(a1 + 32) didFinish];
      }
      else
      {
        id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-1100 userInfo:0];
        [*(id *)(a1 + 32) didFailWithError:v20];
      }
    }
  }
  else
  {
    id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-1002 userInfo:0];
    [*(id *)(a1 + 32) didFailWithError:v20];
  }
}

- (id)contextMenuConfigurationForElement:(id)a3 presentation:(id)a4
{
  id v6 = a4;
  int v7 = [a3 _activatedElementInfo];
  id v8 = (void *)MEMORY[0x1E4FB1678];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__NoteHTMLEditorView_contextMenuConfigurationForElement_presentation___block_invoke_2;
  v13[3] = &unk_1E5FDBEE8;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = self;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = [v8 configurationWithIdentifier:0 previewProvider:&__block_literal_global_346 actionProvider:v13];

  return v11;
}

uint64_t __70__NoteHTMLEditorView_contextMenuConfigurationForElement_presentation___block_invoke()
{
  return 0;
}

id __70__NoteHTMLEditorView_contextMenuConfigurationForElement_presentation___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = (void *)MEMORY[0x1E4FB13F0];
  id v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Copy" value:@"Copy" table:0 allowSiri:1];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __70__NoteHTMLEditorView_contextMenuConfigurationForElement_presentation___block_invoke_3;
  v20[3] = &unk_1E5FDBE98;
  id v21 = *(id *)(a1 + 32);
  id v5 = objc_msgSend(v3, "ic_actionWithTitle:imageName:handler:", v4, @"doc.on.doc", v20);

  [v2 addObject:v5];
  id v6 = (void *)MEMORY[0x1E4FB13F0];
  int v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Share" value:@"Share" table:0 allowSiri:1];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __70__NoteHTMLEditorView_contextMenuConfigurationForElement_presentation___block_invoke_4;
  uint64_t v16 = &unk_1E5FDBEC0;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v17 = v8;
  uint64_t v18 = v9;
  id v19 = *(id *)(a1 + 32);
  id v10 = objc_msgSend(v6, "ic_actionWithTitle:imageName:handler:", v7, @"square.and.arrow.up", &v13);

  objc_msgSend(v2, "addObject:", v10, v13, v14, v15, v16);
  uint64_t v11 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F0973378 image:0 identifier:0 options:0 children:v2];

  return v11;
}

void __70__NoteHTMLEditorView_contextMenuConfigurationForElement_presentation___block_invoke_3(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) mimeType];
  if (v2)
  {
    id v3 = (void *)MEMORY[0x1E4F442D8];
    id v4 = [*(id *)(a1 + 32) mimeType];
    id v5 = [v3 typeWithMIMEType:v4];
    id v6 = [v5 identifier];
  }
  else
  {
    id v6 = [(id)*MEMORY[0x1E4F44378] identifier];
  }

  int v7 = (void *)MEMORY[0x1E4F1C9B8];
  id v8 = [*(id *)(a1 + 32) dataFileURL];
  uint64_t v9 = [v7 dataWithContentsOfURL:v8];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithItem:v9 typeIdentifier:v6];
  uint64_t v11 = [*(id *)(a1 + 32) filename];
  [v10 setSuggestedName:v11];

  [v10 setPreferredPresentationStyle:2];
  uint64_t v12 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  v14[0] = v10;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v12 setItemProviders:v13];
}

void __70__NoteHTMLEditorView_contextMenuConfigurationForElement_presentation___block_invoke_4(id *a1)
{
  [a1[4] boundingRect];
  double MidX = CGRectGetMidX(v8);
  [a1[4] boundingRect];
  double MidY = CGRectGetMidY(v9);
  id v6 = [a1[5] actionDelegate];
  id v4 = a1[5];
  id v5 = [a1[6] contentID];
  objc_msgSend(v6, "noteHTMLEditorView:showShareSheetForAttachment:atPoint:", v4, v5, MidX, MidY);
}

- (void)updateDataOwnerForCopyAndPaste
{
  id v3 = [(NoteHTMLEditorView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(NoteHTMLEditorView *)self delegate];
    int v6 = [v5 isNoteManagedForNoteHTMLEditorView:self];

    if (v6) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }
  [(NoteHTMLEditorView *)self _setDataOwnerForCopy:v7];
  [(NoteHTMLEditorView *)self _setDataOwnerForPaste:v7];
  CGRect v8 = [(NoteHTMLEditorView *)self webView];
  [v8 _setDataOwnerForCopy:v7];

  id v9 = [(NoteHTMLEditorView *)self webView];
  [v9 _setDataOwnerForPaste:v7];
}

- (NoteHTMLEditorViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NoteHTMLEditorViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NoteHTMLEditorViewActionDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
  return (NoteHTMLEditorViewActionDelegate *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (NoteHTMLEditorViewLayoutDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  return (NoteHTMLEditorViewLayoutDelegate *)WeakRetained;
}

- (void)setLayoutDelegate:(id)a3
{
}

- (NSLayoutConstraint)contentSizeHeightConstraint
{
  return self->_contentSizeHeightConstraint;
}

- (void)setContentSizeHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentSizeWidthConstraint
{
  return self->_contentSizeWidthConstraint;
}

- (void)setContentSizeWidthConstraint:(id)a3
{
}

- (NoteWKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (NSString)htmlString
{
  return self->_htmlString;
}

- (void)setHtmlString:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSArray)attachmentContentIDs
{
  return self->_attachmentContentIDs;
}

- (void)setAttachmentContentIDs:(id)a3
{
}

- (BOOL)hasAttachments
{
  return self->_hasAttachments;
}

- (void)setHasAttachments:(BOOL)a3
{
  self->_hasAttachments = a3;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (int64_t)selectionLength
{
  return self->_selectionLength;
}

- (void)setSelectionLength:(int64_t)a3
{
  self->_selectionLength = a3;
}

- (unsigned)listStyle
{
  return self->_listStyle;
}

- (void)setListStyle:(unsigned __int16)a3
{
  self->_listStyle = a3;
}

- (BOOL)isInsideSiriSnippet
{
  return self->_insideSiriSnippet;
}

- (NSString)htmlStringToLoad
{
  return self->_htmlStringToLoad;
}

- (void)setHtmlStringToLoad:(id)a3
{
}

- (NSArray)attachmentsToLoad
{
  return self->_attachmentsToLoad;
}

- (void)setAttachmentsToLoad:(id)a3
{
}

- (void)setUpdateContentDelayer:(id)a3
{
}

- (BOOL)updatingContent
{
  return self->_updatingContent;
}

- (void)setUpdatingContent:(BOOL)a3
{
  self->_updatingContent = a3;
}

- (BOOL)setSelectionToEndAfterLoad
{
  return self->_setSelectionToEndAfterLoad;
}

- (void)setSetSelectionToEndAfterLoad:(BOOL)a3
{
  self->_setSelectionToEndAfterLoad = a3;
}

- (BOOL)startEditingAfterLoad
{
  return self->_startEditingAfterLoad;
}

- (void)setStartEditingAfterLoad:(BOOL)a3
{
  self->_startEditingAfterLoad = a3;
}

- (NoteHTMLEditorViewURLSchemeHandler)urlSchemeHandler
{
  return self->_urlSchemeHandler;
}

- (void)setUrlSchemeHandler:(id)a3
{
}

- (NoteHTMLEditorViewScriptMessageHandler)scriptMessageHandler
{
  return self->_scriptMessageHandler;
}

- (void)setScriptMessageHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptMessageHandler, 0);
  objc_storeStrong((id *)&self->_urlSchemeHandler, 0);
  objc_storeStrong((id *)&self->_updateContentDelayer, 0);
  objc_storeStrong((id *)&self->_attachmentsToLoad, 0);
  objc_storeStrong((id *)&self->_htmlStringToLoad, 0);
  objc_storeStrong((id *)&self->_attachmentContentIDs, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_htmlString, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_contentSizeWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentSizeHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_layoutDelegate);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)jsonStringFromDictionaryOrArray:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B08EB000, v0, v1, "Error converting object to JSON: %@", v2, v3, v4, v5, v6);
}

- (void)jsonStringFromDictionaryOrArray:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 className];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Trying to convert an object to JSON which is not an array or dictionary, class: %@", v4, 0xCu);
}

void __40__NoteHTMLEditorView_replaceContentIDs___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B08EB000, v0, v1, "Could not replace attachment content IDs: %@", v2, v3, v4, v5, v6);
}

- (void)setSourceURLForAttachmentIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "sourceURL or attachmentIdentifier missing", v1, 2u);
}

void __58__NoteHTMLEditorView_setSourceURLForAttachmentIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B08EB000, v0, v1, "Could not set attachment content IDs: %@", v2, v3, v4, v5, v6);
}

void __48__NoteHTMLEditorView_stopEditingWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_2(&dword_1B08EB000, v0, v1, "failed to execute JavaScriptString: %@ - JavaScript error: %@");
}

void __56__NoteHTMLEditorView_getRectForSelectionWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B08EB000, v0, v1, "can't get selection rect from NoteWKWebView, error: %@", v2, v3, v4, v5, v6);
}

void __62__NoteHTMLEditorView__webView_didInsertAttachment_withSource___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = [*(id *)(a1 + 32) mimeType];
  uint64_t v7 = *(void *)(a1 + 40);
  CGRect v8 = [a2 localizedDescription];
  int v9 = 138412802;
  id v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  _os_log_error_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_ERROR, "Could not set file wrapper with mime type %@ for attachment %@ – %@", (uint8_t *)&v9, 0x20u);
}

@end