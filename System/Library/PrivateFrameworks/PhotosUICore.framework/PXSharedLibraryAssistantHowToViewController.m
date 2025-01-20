@interface PXSharedLibraryAssistantHowToViewController
- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate;
- (PXLibraryFilterState)libraryFilterState;
- (PXSharedLibraryAssistantHowToViewController)initWithLibraryFilterState:(id)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateIcon;
- (void)continueButtonTapped:(id)a3;
- (void)setAssistantViewControllerDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXSharedLibraryAssistantHowToViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void)setAssistantViewControllerDelegate:(id)a3
{
}

- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->assistantViewControllerDelegate);
  return (PXAssistantViewControllerDelegate *)WeakRetained;
}

- (void)continueButtonTapped:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v4 = [(PXSharedLibraryAssistantHowToViewController *)self assistantViewControllerDelegate];
  if (!v4) {
    PXAssertGetLog();
  }
  [v4 completeAssistantForAssistantViewController:self];
  v5 = [(PXSharedLibraryAssistantHowToViewController *)self libraryFilterState];
  PXSharedLibraryNavigateToLibraryViewInSharedLibraryViewMode(0, v5);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  return v4;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 1.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"PXSharedLibraryHowToPageReuseIdentifier"];
  if (v7)
  {
    v8 = v7;
    v9 = [v7 contentConfiguration];
    [v8 backgroundConfiguration];
  }
  else
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"PXSharedLibraryHowToPageReuseIdentifier"];
    v9 = [v8 defaultContentConfiguration];
    uint64_t v10 = *MEMORY[0x1E4FB2950];
    v11 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] weight:*MEMORY[0x1E4FB09B8]];
    v12 = [v9 textProperties];
    [v12 setFont:v11];

    v13 = [v9 textProperties];
    [v13 setAdjustsFontForContentSizeCategory:1];

    [v9 setImageToTextPadding:17.0];
    [v9 setTextToSecondaryTextVerticalPadding:2.0];
    v14 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v10];
    v15 = [v9 secondaryTextProperties];
    [v15 setFont:v14];

    v16 = [v9 secondaryTextProperties];
    [v16 setAdjustsFontForContentSizeCategory:1];

    v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v18 = [v9 secondaryTextProperties];
    [v18 setColor:v17];

    v19 = [v9 secondaryTextProperties];
    [v19 setNumberOfLines:0];

    [v8 defaultBackgroundConfiguration];
  v20 = };
  v21 = [v8 defaultContentConfiguration];
  [v21 directionalLayoutMargins];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  v30 = [(PXSharedLibraryAssistantHowToViewController *)self traitCollection];
  uint64_t v31 = [v30 horizontalSizeClass];

  if (v31 == 2) {
    double v32 = 54.0;
  }
  else {
    double v32 = v29;
  }
  if (v31 == 2) {
    double v33 = 54.0;
  }
  else {
    double v33 = v25;
  }
  objc_msgSend(v9, "setDirectionalLayoutMargins:", v23, v33, v27, v32);
  if (![v6 section])
  {
    v34 = @"photo.on.rectangle";
    v35 = @"PXSharedLibraryReplyAssistant_HowTo_LibraryView_Subtitle";
    v36 = @"PXSharedLibraryReplyAssistant_HowTo_LibraryView_Title";
    goto LABEL_16;
  }
  if ([v6 section] == 1)
  {
    v34 = @"heart.text.square.fill";
    v35 = @"PXSharedLibraryReplyAssistant_HowTo_Suggestions_Subtitle";
    v36 = @"PXSharedLibraryReplyAssistant_HowTo_Suggestions_Title";
LABEL_16:
    v37 = PXLocalizedSharedLibraryString(v36);
    v38 = PXLocalizedSharedLibraryString(v35);
    goto LABEL_17;
  }
  if ([v6 section] == 2)
  {
    v34 = @"slider.horizontal.3";
    v35 = @"PXSharedLibraryReplyAssistant_HowTo_Controls_Subtitle";
    v36 = @"PXSharedLibraryReplyAssistant_HowTo_Controls_Title";
    goto LABEL_16;
  }
  v37 = 0;
  v38 = 0;
  v34 = 0;
LABEL_17:
  v39 = (void *)MEMORY[0x1E4FB1818];
  v40 = [MEMORY[0x1E4FB1830] configurationWithPointSize:22.0];
  v41 = [v39 systemImageNamed:v34 withConfiguration:v40];

  [v9 setImage:v41];
  [v9 setText:v37];
  [v9 setSecondaryText:v38];
  [v8 setContentConfiguration:v9];
  v42 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v20 setBackgroundColor:v42];

  [v8 setBackgroundConfiguration:v20];
  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryAssistantHowToViewController;
  [(PXSharedLibraryAssistantHowToViewController *)&v10 traitCollectionDidChange:v4];
  v5 = [(PXSharedLibraryAssistantHowToViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  if (v6 != [v4 userInterfaceStyle]) {
    [(PXSharedLibraryAssistantHowToViewController *)self _updateIcon];
  }
  uint64_t v7 = [v5 horizontalSizeClass];
  if (v7 != [v4 horizontalSizeClass])
  {
    v8 = [(OBTableWelcomeController *)self tableView];
    v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, 3);
    [v8 reloadSections:v9 withRowAnimation:100];
  }
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryAssistantHowToViewController;
  [(OBTableWelcomeController *)&v10 viewDidLoad];
  [(PXSharedLibraryAssistantHowToViewController *)self _updateIcon];
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  id v4 = objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v4 setBackgroundColor:v5];

  [v4 setDelegate:self];
  [v4 setDataSource:self];
  [v4 setAllowsSelection:0];
  [(OBTableWelcomeController *)self setTableView:v4];
  uint64_t v6 = [MEMORY[0x1E4F83A80] boldButton];
  uint64_t v7 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_ButtonTitle_Done");
  [v6 setTitle:v7 forState:0];

  [v6 addTarget:self action:sel_continueButtonTapped_ forControlEvents:0x2000];
  v8 = [(PXSharedLibraryAssistantHowToViewController *)self buttonTray];
  [v8 addButton:v6];

  v9 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_continueButtonTapped_];
  [(PXSharedLibraryAssistantHowToViewController *)self addKeyCommand:v9];
}

- (void)_updateIcon
{
}

- (PXSharedLibraryAssistantHowToViewController)initWithLibraryFilterState:(id)a3
{
  id v5 = a3;
  uint64_t v6 = PXLocalizedSharedLibraryString(@"PXSharedLibraryReplyAssistant_HowTo_Title");
  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryAssistantHowToViewController;
  uint64_t v7 = [(OBTableWelcomeController *)&v10 initWithTitle:v6 detailText:0 icon:0 adoptTableViewScrollView:1];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_libraryFilterState, a3);
  }

  return v8;
}

@end