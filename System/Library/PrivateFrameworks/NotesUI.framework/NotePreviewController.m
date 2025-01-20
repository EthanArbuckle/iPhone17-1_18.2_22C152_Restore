@interface NotePreviewController
- (ICSearchResult)searchResult;
- (NSArray)attachmentPresentations;
- (NoteContentLayer)contentLayer;
- (NoteObject)note;
- (NotePreviewController)initWithNote:(id)a3;
- (NotePreviewController)initWithNote:(id)a3 searchResult:(id)a4;
- (NotesBackgroundView)backgroundView;
- (id)attachmentContentIDs;
- (id)attachmentPresentationForContentID:(id)a3;
- (id)noteContentLayer:(id)a3 attachmentPresentationForContentID:(id)a4;
- (id)noteContentLayer:(id)a3 fileURLForAttachmentWithContentID:(id)a4;
- (void)dealloc;
- (void)registerForTraitChanges;
- (void)setAttachmentPresentations:(id)a3;
- (void)setContentLayer:(id)a3;
- (void)setNote:(id)a3;
- (void)setSearchResult:(id)a3;
- (void)setupPreview;
- (void)setupPreviewWithInitialFrame:(CGRect)a3;
- (void)updateForceLightContentIfNecessary;
@end

@implementation NotePreviewController

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NotePreviewController;
  [(NotePreviewController *)&v4 dealloc];
}

- (NotePreviewController)initWithNote:(id)a3 searchResult:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NotePreviewController;
  v9 = [(NotePreviewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_note, a3);
    objc_storeStrong((id *)&v10->_searchResult, a4);
    [(NotePreviewController *)v10 registerForTraitChanges];
  }

  return v10;
}

- (NotePreviewController)initWithNote:(id)a3
{
  return [(NotePreviewController *)self initWithNote:a3 searchResult:0];
}

- (void)setupPreview
{
}

- (void)setupPreviewWithInitialFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v77[4] = *MEMORY[0x1E4F143B8];
  id v8 = -[NotesBackgroundView initWithFrame:]([NotesBackgroundView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(NotePreviewController *)self setView:v8];

  v9 = [MEMORY[0x1E4FB1618] ICBackgroundColor];
  v10 = [(NotePreviewController *)self view];
  [v10 setBackgroundColor:v9];

  v11 = -[NoteContentLayer initWithFrame:forPreview:]([NoteContentLayer alloc], "initWithFrame:forPreview:", 1, x, y, width, height);
  [(NotePreviewController *)self setContentLayer:v11];

  objc_super v12 = [(NotePreviewController *)self contentLayer];
  [v12 setAttachmentPresentationDelegate:self];

  v13 = [(NotePreviewController *)self contentLayer];
  [v13 setAllowsAttachments:1];

  v14 = [(NotePreviewController *)self backgroundView];
  [v14 setPreviewing:1];

  v15 = [(NotePreviewController *)self backgroundView];
  v16 = [(NotePreviewController *)self contentLayer];
  [v15 setContentView:v16 useSafeAreaLayoutGuide:0 topMargin:0 bottomMargin:0 leadingMargin:0.0 trailingMargin:0.0 standalone:0.0 force:0.0];

  v17 = [(NotePreviewController *)self contentLayer];
  [v17 scrollToTopAnimated:0];

  v18 = [(NotePreviewController *)self contentLayer];
  v19 = [v18 noteHTMLEditorView];
  [v19 setUserInteractionEnabled:0];

  v20 = [(NotePreviewController *)self contentLayer];
  v21 = [v20 noteHTMLEditorView];
  v22 = [v21 webView];

  v23 = [v22 leftAnchor];
  v24 = [(NotePreviewController *)self view];
  v25 = [v24 leftAnchor];
  uint64_t v26 = [v23 constraintEqualToAnchor:v25];

  v27 = [v22 rightAnchor];
  v28 = [(NotePreviewController *)self view];
  v29 = [v28 rightAnchor];
  uint64_t v30 = [v27 constraintEqualToAnchor:v29];

  v31 = [v22 topAnchor];
  v32 = [(NotePreviewController *)self view];
  v33 = [v32 topAnchor];
  uint64_t v34 = [v31 constraintEqualToAnchor:v33];

  v35 = [v22 bottomAnchor];
  v36 = [(NotePreviewController *)self view];
  v37 = [v36 bottomAnchor];
  uint64_t v38 = [v35 constraintEqualToAnchor:v37];

  v39 = (void *)MEMORY[0x1E4F28DC8];
  v69 = (void *)v30;
  v70 = (void *)v26;
  v77[0] = v26;
  v77[1] = v30;
  v67 = (void *)v38;
  v68 = (void *)v34;
  v77[2] = v34;
  v77[3] = v38;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:4];
  [v39 activateConstraints:v40];

  v41 = [(NotePreviewController *)self note];
  unsigned int v65 = [v41 isPlainText];

  v42 = [(NotePreviewController *)self note];
  v66 = [v42 content];

  v43 = [(NotePreviewController *)self note];
  v44 = [v43 attachments];
  v45 = [v44 allObjects];
  v46 = +[NoteAttachmentPresentation attachmentPresentationsForAttachments:v45];
  [(NotePreviewController *)self setAttachmentPresentations:v46];

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v47 = [(NotePreviewController *)self attachmentPresentations];
  uint64_t v48 = [v47 countByEnumeratingWithState:&v72 objects:v76 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v73 != v50) {
          objc_enumerationMutation(v47);
        }
        v52 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        v53 = [v52 contentIDURL];
        +[NotesCIDURLProtocol registerDataProvider:v52 forCIDURL:v53];
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v72 objects:v76 count:16];
    }
    while (v49);
  }

  v54 = [(NotePreviewController *)self contentLayer];
  v55 = [(NotePreviewController *)self note];
  v56 = [v55 attachments];
  v57 = [v56 allObjects];
  [v54 setContent:v66 isPlainText:v65 attachments:v57];

  v58 = [(NotePreviewController *)self note];
  v59 = [v58 modificationDate];

  v60 = [(NotePreviewController *)self contentLayer];
  [v60 setTimestampDate:v59];

  v61 = [(NotePreviewController *)self attachmentContentIDs];
  v62 = [(NotePreviewController *)self attachmentPresentations];
  id v71 = 0;
  +[NoteAttachmentPresentation prepareDocumentForPresentationWithAttachmentContentIDs:v61 withAttachmentPresentations:v62 occurences:&v71];
  id v63 = v71;

  [(NotePreviewController *)self updateForceLightContentIfNecessary];
  v64 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v64 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x1E4FB2628] object:0];
}

- (id)attachmentContentIDs
{
  v2 = [(NotePreviewController *)self contentLayer];
  v3 = [v2 noteHTMLEditorView];
  objc_super v4 = [v3 attachmentContentIDs];

  return v4;
}

- (NotesBackgroundView)backgroundView
{
  objc_opt_class();
  v3 = [(NotePreviewController *)self view];
  objc_super v4 = ICCheckedDynamicCast();

  return (NotesBackgroundView *)v4;
}

- (void)registerForTraitChanges
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  id v4 = (id)[(NotePreviewController *)self registerForTraitChanges:v3 withAction:sel_updateForceLightContentIfNecessary];
}

- (id)noteContentLayer:(id)a3 fileURLForAttachmentWithContentID:(id)a4
{
  id v4 = [(NotePreviewController *)self attachmentPresentationForContentID:a4];
  v5 = [v4 dataFileURL];

  return v5;
}

- (id)noteContentLayer:(id)a3 attachmentPresentationForContentID:(id)a4
{
  return [(NotePreviewController *)self attachmentPresentationForContentID:a4];
}

- (id)attachmentPresentationForContentID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(NotePreviewController *)self attachmentPresentations];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 contentID];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)updateForceLightContentIfNecessary
{
  unsigned int v3 = objc_msgSend(MEMORY[0x1E4FB1E20], "ic_alwaysShowLightContent");
  uint64_t v4 = v3;
  v5 = [(NotePreviewController *)self traitOverrides];
  id v6 = v5;
  if (v3)
  {
    [v5 setUserInterfaceStyle:v3];
  }
  else
  {
    int v7 = [v5 containsTrait:objc_opt_class()];

    if (!v7) {
      goto LABEL_6;
    }
    id v6 = [(NotePreviewController *)self traitOverrides];
    [v6 removeTrait:objc_opt_class()];
  }

LABEL_6:
  id v8 = [(NotePreviewController *)self view];
  [v8 _setOverrideUserInterfaceStyle:v4];

  id v9 = [(NotePreviewController *)self contentLayer];
  [v9 _setOverrideUserInterfaceStyle:v4];
}

- (NoteContentLayer)contentLayer
{
  return self->_contentLayer;
}

- (void)setContentLayer:(id)a3
{
}

- (NoteObject)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (ICSearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
}

- (NSArray)attachmentPresentations
{
  return self->_attachmentPresentations;
}

- (void)setAttachmentPresentations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentPresentations, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
}

@end