@interface ICNotePreviewController
- (BOOL)shouldForceLightContent;
- (ICNote)note;
- (ICNotePreviewController)initWithNote:(id)a3;
- (ICNotePreviewController)initWithNote:(id)a3 searchResult:(id)a4;
- (ICSearchResult)searchResult;
- (ICTextController)textController;
- (ICTextView)textView;
- (NotesBackgroundView)backgroundView;
- (id)createTextViewUsingTextController:(id)a3 stylingTextUsingSeparateTextStorageForRendering:(BOOL)a4;
- (void)addPasswordEntryViewController;
- (void)registerForTraitChanges;
- (void)scrollToSearchResultIfNeeded;
- (void)setNote:(id)a3;
- (void)setSearchResult:(id)a3;
- (void)setTextController:(id)a3;
- (void)setTextView:(id)a3;
- (void)setupPreview;
- (void)setupPreviewWithInitialFrame:(CGRect)a3;
- (void)updateForceLightContentIfNecessary;
- (void)viewDidLoad;
@end

@implementation ICNotePreviewController

- (ICNotePreviewController)initWithNote:(id)a3 searchResult:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICNotePreviewController;
  v9 = [(ICNotePreviewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_note, a3);
    objc_storeStrong((id *)&v10->_searchResult, a4);
  }

  return v10;
}

- (ICNotePreviewController)initWithNote:(id)a3
{
  return [(ICNotePreviewController *)self initWithNote:a3 searchResult:0];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)ICNotePreviewController;
  [(ICNotePreviewController *)&v4 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x263F5B540]);
  [(ICNotePreviewController *)self setView:v3];

  [(ICNotePreviewController *)self registerForTraitChanges];
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
  if (!CGRectIsEmpty(a3))
  {
    id v8 = [(ICNotePreviewController *)self view];
    objc_msgSend(v8, "setFrame:", x, y, width, height);
  }
  v9 = [(ICNotePreviewController *)self note];
  int v10 = [v9 isPasswordProtectedAndLocked];

  if (v10)
  {
    [(ICNotePreviewController *)self addPasswordEntryViewController];
  }
  else
  {
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      v11 = [(ICNotePreviewController *)self view];
      [v11 bounds];
      double v13 = v12;

      v14 = [ICTK2TextView alloc];
      v15 = [(ICNotePreviewController *)self note];
      v16 = -[ICTK2TextView initWithNote:size:insideSystemPaper:linkDelegate:insideSiriSnippet:](v14, "initWithNote:size:insideSystemPaper:linkDelegate:insideSiriSnippet:", v15, 0, 0, 0, v13, 1.79769313e308);
      [(ICNotePreviewController *)self setTextView:v16];

      v17 = [(ICNotePreviewController *)self textView];
      [v17 setDelegate:self];

      v18 = [(ICNotePreviewController *)self textView];
      v19 = [v18 dateView];
      [v19 setHidden:1];

      objc_opt_class();
      v20 = [(ICNotePreviewController *)self textView];
      v21 = [v20 textLayoutManager];
      v22 = [v21 textContainer];
      v23 = ICDynamicCast();

      [v23 setWidthTracksTextView:1];
      [v23 setInPreviewMode:1];
    }
    else
    {
      id v24 = objc_alloc_init(MEMORY[0x263F5B4E8]);
      [(ICNotePreviewController *)self setTextController:v24];

      v25 = [(ICNotePreviewController *)self textController];
      v26 = [(ICNotePreviewController *)self createTextViewUsingTextController:v25 stylingTextUsingSeparateTextStorageForRendering:0];
      [(ICNotePreviewController *)self setTextView:v26];

      v23 = [(ICNotePreviewController *)self textView];
      [v23 setDelegate:self];
    }

    int v27 = [MEMORY[0x263F5B468] isEnabled];
    v28 = [(ICNotePreviewController *)self textView];
    v29 = v28;
    if (v27) {
      [v28 setPaperEnabled:1];
    }
    else {
      [v28 setStylusDrawingEnabled:1];
    }

    v30 = [MEMORY[0x263F825C8] clearColor];
    v31 = [(ICNotePreviewController *)self textView];
    [v31 setBackgroundColor:v30];

    v32 = [(ICNotePreviewController *)self note];
    uint64_t v33 = objc_msgSend(v32, "ic_hasLightBackground");

    v34 = objc_msgSend(MEMORY[0x263F825C8], "ic_notePreviewBackgroundLightContent:", v33);
    v35 = [(ICNotePreviewController *)self backgroundView];
    [v35 setBackgroundColor:v34];

    v36 = [(ICNotePreviewController *)self backgroundView];
    v37 = [(ICNotePreviewController *)self textView];
    [v36 setContentView:v37 useSafeAreaLayoutGuide:0 topMargin:0 bottomMargin:0 leadingMargin:12.0 trailingMargin:0.0 standalone:0.0 force:0.0];

    v38 = [(ICNotePreviewController *)self textView];
    [v38 setDataDetectorTypes:-1];

    v39 = [(ICNotePreviewController *)self textView];
    [v39 setTranslatesAutoresizingMaskIntoConstraints:0];

    v40 = [(ICNotePreviewController *)self textView];
    v41 = [v40 textStorage];
    [v41 fixupAfterEditing];

    v42 = [(ICNotePreviewController *)self backgroundView];
    v43 = [(ICNotePreviewController *)self ic_safeAreaLayoutGuide];
    v44 = [(ICNotePreviewController *)self backgroundView];
    [v42 addConstraintsForSafeAreaLayoutGuide:v43 toContainer:v44];

    v45 = [(ICNotePreviewController *)self textView];
    [v45 setUserInteractionEnabled:0];
  }
  [(ICNotePreviewController *)self scrollToSearchResultIfNeeded];
  [(ICNotePreviewController *)self updateForceLightContentIfNecessary];
  id v46 = [MEMORY[0x263F08A00] defaultCenter];
  [v46 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x263F83318] object:0];
}

- (void)registerForTraitChanges
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  id v4 = (id)[(ICNotePreviewController *)self registerForTraitChanges:v3 withAction:sel_updateForceLightContentIfNecessary];
}

- (NotesBackgroundView)backgroundView
{
  objc_opt_class();
  id v3 = [(ICNotePreviewController *)self view];
  id v4 = ICCheckedDynamicCast();

  return (NotesBackgroundView *)v4;
}

- (id)createTextViewUsingTextController:(id)a3 stylingTextUsingSeparateTextStorageForRendering:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(ICNotePreviewController *)self view];
  [v7 bounds];
  double v9 = v8;

  int v10 = objc_alloc_init(ICLayoutManager);
  [(ICLayoutManager *)v10 setAllowsNonContiguousLayout:1];
  v11 = [(ICNotePreviewController *)self note];
  [v6 setNote:v11 stylingTextUsingSeparateTextStorageForRendering:v4 withLayoutManager:v10];

  double v12 = objc_msgSend(objc_alloc(MEMORY[0x263F5B4E0]), "initWithSize:", v9, 1.79769313e308);
  [v12 setInPreviewMode:1];
  [v12 setWidthTracksTextView:1];
  [(ICLayoutManager *)v10 addTextContainer:v12];
  double v13 = [ICTextView alloc];
  v14 = -[ICTextView initWithFrame:textContainer:](v13, "initWithFrame:textContainer:", v12, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(ICBaseLayoutManager *)v10 setTextView:v14];
  v15 = [(ICNotePreviewController *)self note];
  v16 = [(ICTextView *)v14 dateView];
  [v16 setNote:v15];

  return v14;
}

- (void)addPasswordEntryViewController
{
  id v3 = objc_alloc(MEMORY[0x263F5B418]);
  BOOL v4 = [(ICNotePreviewController *)self note];
  id v19 = (id)[v3 initWithNibName:0 bundle:0 note:v4 intent:0];

  v5 = [v19 view];
  [v5 setAutoresizingMask:18];

  id v6 = [v19 view];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:1];

  id v7 = [(ICNotePreviewController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [v19 view];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  v17 = [(ICNotePreviewController *)self view];
  v18 = [v19 view];
  [v17 addSubview:v18];

  [(ICNotePreviewController *)self addChildViewController:v19];
}

- (void)scrollToSearchResultIfNeeded
{
  v2 = [(ICNotePreviewController *)self searchResult];

  if (v2) {
    performBlockOnMainThreadAndWait();
  }
}

void __55__ICNotePreviewController_scrollToSearchResultIfNeeded__block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) searchResult];
  id v3 = [v2 object];
  BOOL v4 = ICDynamicCast();

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3010000000;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  v23 = &unk_20C1E2BF2;
  if (v4)
  {
    v5 = [v4 note];
    id v6 = [v5 textStorage];

    uint64_t v7 = [v6 length];
    uint64_t v8 = *MEMORY[0x263F814A0];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __55__ICNotePreviewController_scrollToSearchResultIfNeeded__block_invoke_2;
    v17[3] = &unk_2640B9D58;
    id v18 = v4;
    id v19 = &v20;
    objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v7, 0, v17);
    double v9 = v18;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) searchResult];
    double v9 = [v6 firstMatchingRangeInNote];
    if (v9)
    {
      double v10 = [*(id *)(a1 + 32) searchResult];
      double v11 = [v10 firstMatchingRangeInNote];
      uint64_t v12 = [v11 rangeValue];
      double v13 = v21;
      v21[4] = v12;
      v13[5] = v14;
    }
    else
    {
      double v15 = v21;
      v21[4] = 0;
      v15[5] = 0;
    }
  }

  v16 = [*(id *)(a1 + 32) textView];
  objc_msgSend(v16, "ic_scrollRangeToVisible:consideringInsets:animated:", v21[4], v21[5], 1, 0);

  _Block_object_dispose(&v20, 8);
}

void __55__ICNotePreviewController_scrollToSearchResultIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v12 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v9 = [v12 attachment];
    double v10 = *(void **)(a1 + 32);

    if (v9 == v10)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      *(void *)(v11 + 32) = a3;
      *(void *)(v11 + 40) = a4;
      *a5 = 1;
    }
  }
}

- (BOOL)shouldForceLightContent
{
  v2 = [(ICNotePreviewController *)self note];
  char v3 = [v2 prefersLightBackground];

  if (v3) {
    return 1;
  }
  v5 = (void *)MEMORY[0x263F82DA0];

  return objc_msgSend(v5, "ic_alwaysShowLightContent");
}

- (void)updateForceLightContentIfNecessary
{
  BOOL v3 = [(ICNotePreviewController *)self shouldForceLightContent];
  BOOL v4 = v3;
  v5 = [(ICNotePreviewController *)self traitOverrides];
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
    id v6 = [(ICNotePreviewController *)self traitOverrides];
    [v6 removeTrait:objc_opt_class()];
  }

LABEL_6:
  uint64_t v8 = [(ICNotePreviewController *)self view];
  [v8 setOverrideUserInterfaceStyle:v4];

  double v9 = [(ICNotePreviewController *)self textView];
  [v9 setOverrideUserInterfaceStyle:v4];

  id v10 = [(ICNotePreviewController *)self textView];
  [v10 setNeedsDisplay];
}

- (ICTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (ICTextController)textController
{
  return self->_textController;
}

- (void)setTextController:(id)a3
{
}

- (ICNote)note
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_textController, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end