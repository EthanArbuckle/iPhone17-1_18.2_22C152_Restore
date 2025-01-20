@interface ICNoteQuickLookViewController
+ (void)initialize;
- (UIView)notePreviewControllerView;
- (void)preparePreviewOfSearchableItemWithIdentifier:(id)a3 queryString:(id)a4 completionHandler:(id)a5;
- (void)setNotePreviewControllerView:(id)a3;
- (void)updateNotePreviewControllerFrame;
- (void)viewDidLayoutSubviews;
@end

@implementation ICNoteQuickLookViewController

+ (void)initialize
{
  +[ICNoteContext startSharedContextWithOptions:546];
  id v3 = objc_alloc_init((Class)ICHTMLSearchIndexerDataSource);
  v2 = +[ICSearchIndexer sharedIndexer];
  [v2 addDataSource:v3];

  +[NSTextAttachment registerTextAttachmentClass:objc_opt_class() forFileType:PKApplePaperTypeIdentifier];
}

- (void)preparePreviewOfSearchableItemWithIdentifier:(id)a3 queryString:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(id, void))a5;
  v9 = +[ICSearchIndexer sharedIndexer];
  v10 = [v9 mainContextObjectForObjectIDURIString:v7];

  if (v10)
  {
    objc_opt_class();
    v11 = ICDynamicCast();
    objc_opt_class();
    v12 = ICDynamicCast();
    objc_opt_class();
    v13 = ICDynamicCast();
    objc_opt_class();
    v14 = ICDynamicCast();
    if (v11)
    {
      uint64_t v15 = [v11 note];
      v16 = v13;
      v13 = (void *)v15;
    }
    else
    {
      if (!v12) {
        goto LABEL_10;
      }
      uint64_t v18 = [v12 note];
      v16 = v14;
      v14 = (void *)v18;
    }

LABEL_10:
    if (v13)
    {
      v25 = v12;
      id v19 = objc_alloc((Class)ICNotePreviewController);
      v20 = v13;
    }
    else
    {
      if (!v14)
      {
LABEL_15:

        goto LABEL_16;
      }
      v25 = v12;
      id v19 = objc_alloc((Class)NotePreviewController);
      v20 = v14;
    }
    id v21 = [v19 initWithNote:v20];
    [v21 setupPreviewWithInitialFrame:0.0, 0.0, 343.0, 490.0];
    v22 = [(ICNoteQuickLookViewController *)self view];
    v23 = [v21 view];
    [v22 addSubview:v23];

    v24 = [v21 view];
    [(ICNoteQuickLookViewController *)self setNotePreviewControllerView:v24];

    v12 = v25;
    goto LABEL_15;
  }
  v17 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to get searchIndexableObject for objectIDURI %@", buf, 0xCu);
  }

LABEL_16:
  v8[2](v8, 0);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ICNoteQuickLookViewController;
  [(ICNoteQuickLookViewController *)&v3 viewDidLayoutSubviews];
  [(ICNoteQuickLookViewController *)self updateNotePreviewControllerFrame];
}

- (void)updateNotePreviewControllerFrame
{
  if ([(ICNoteQuickLookViewController *)self _appearState] == 2
    || [(ICNoteQuickLookViewController *)self _appearState] == 1)
  {
    id v12 = [(ICNoteQuickLookViewController *)self view];
    [v12 bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    v11 = [(ICNoteQuickLookViewController *)self notePreviewControllerView];
    [v11 setFrame:v4, v6, v8, v10];
  }
}

- (UIView)notePreviewControllerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notePreviewControllerView);

  return (UIView *)WeakRetained;
}

- (void)setNotePreviewControllerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end