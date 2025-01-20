@interface PXFeedbackFormUIViewController
- (BOOL)_isSelectedRow:(id)a3 inSection:(int64_t)a4;
- (PXFeedbackFormDelegate)delegate;
- (PXFeedbackFormUIViewController)initWithDelegate:(id)a3 positiveKeys:(id)a4 negativeKeys:(id)a5 wantsCustomFeedbackSection:(BOOL)a6;
- (UITableViewController)tableViewController;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_feedbackKeyForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)_feedbackFormSectionForSectionIndex:(int64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_handleDoneButtonWasPressedOnCustomFeedbackView;
- (void)_markCell:(id)a3 asSelected:(BOOL)a4;
- (void)_setSelectionStateForKey:(id)a3 inSection:(int64_t)a4 to:(BOOL)a5;
- (void)cancelFeedback:(id)a3;
- (void)finishWithSuccess:(BOOL)a3;
- (void)sendFeedback:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTableViewController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PXFeedbackFormUIViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_customFeedbackTextView, 0);
  objc_storeStrong((id *)&self->_negativeFeedbackValues, 0);
  objc_storeStrong((id *)&self->_negativeFeedbackKeys, 0);
  objc_storeStrong((id *)&self->_positiveFeedbackValues, 0);
  objc_storeStrong((id *)&self->_positiveFeedbackKeys, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PXFeedbackFormDelegate)delegate
{
  return self->_delegate;
}

- (void)setTableViewController:(id)a3
{
}

- (UITableViewController)tableViewController
{
  return self->_tableViewController;
}

- (int64_t)_feedbackFormSectionForSectionIndex:(int64_t)a3
{
  if (self->_wantsPositiveFeedbackSection) {
    return a3;
  }
  else {
    return a3 + 1;
  }
}

- (void)_markCell:(id)a3 asSelected:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = v5;
  if (v4)
  {
    [v5 setAccessoryType:3];
    [MEMORY[0x1E4FB1618] colorWithRed:0.298039216 green:0.631372549 blue:1.0 alpha:1.0];
  }
  else
  {
    [v5 setAccessoryType:0];
    [MEMORY[0x1E4FB1618] labelColor];
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = [v6 textLabel];

  [v7 setTextColor:v8];
}

- (id)_feedbackKeyForIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[PXFeedbackFormUIViewController _feedbackFormSectionForSectionIndex:](self, "_feedbackFormSectionForSectionIndex:", [v4 section]);
  v6 = &OBJC_IVAR___PXFeedbackFormUIViewController__negativeFeedbackKeys;
  if (!v5) {
    v6 = &OBJC_IVAR___PXFeedbackFormUIViewController__positiveFeedbackKeys;
  }
  v7 = *(Class *)((char *)&self->super.super.super.isa + *v6);
  uint64_t v8 = [v4 row];

  v9 = [v7 objectAtIndexedSubscript:v8];
  return v9;
}

- (void)_setSelectionStateForKey:(id)a3 inSection:(int64_t)a4 to:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  int64_t v9 = [(PXFeedbackFormUIViewController *)self _feedbackFormSectionForSectionIndex:a4];
  uint64_t v10 = [NSNumber numberWithBool:v5];
  id v12 = (id)v10;
  v11 = &OBJC_IVAR___PXFeedbackFormUIViewController__negativeFeedbackValues;
  if (!v9) {
    v11 = &OBJC_IVAR___PXFeedbackFormUIViewController__positiveFeedbackValues;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v11) setObject:v10 forKeyedSubscript:v8];
}

- (BOOL)_isSelectedRow:(id)a3 inSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(PXFeedbackFormUIViewController *)self _feedbackFormSectionForSectionIndex:a4];
  id v8 = &OBJC_IVAR___PXFeedbackFormUIViewController__negativeFeedbackValues;
  if (!v7) {
    id v8 = &OBJC_IVAR___PXFeedbackFormUIViewController__positiveFeedbackValues;
  }
  int64_t v9 = [*(id *)((char *)&self->super.super.super.isa + *v8) objectForKeyedSubscript:v6];

  char v10 = [v9 BOOLValue];
  return v10;
}

- (void)_handleDoneButtonWasPressedOnCustomFeedbackView
{
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v4 = a4;
  if ([v4 section] == 2) {
    id v5 = 0;
  }
  else {
    id v5 = v4;
  }

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v13 = [a3 cellForRowAtIndexPath:v6];
  int64_t v7 = [(PXFeedbackFormUIViewController *)self _feedbackKeyForIndexPath:v6];
  BOOL v8 = -[PXFeedbackFormUIViewController _isSelectedRow:inSection:](self, "_isSelectedRow:inSection:", v7, [v6 section]);
  uint64_t v9 = [v6 section];

  if (v8)
  {
    [(PXFeedbackFormUIViewController *)self _setSelectionStateForKey:v7 inSection:v9 to:0];
    [v13 setSelected:0];
    char v10 = [MEMORY[0x1E4FB1618] labelColor];
    v11 = [v13 textLabel];
    [v11 setTextColor:v10];
    uint64_t v12 = 0;
  }
  else
  {
    [(PXFeedbackFormUIViewController *)self _setSelectionStateForKey:v7 inSection:v9 to:1];
    [v13 setSelected:1];
    char v10 = [MEMORY[0x1E4FB1618] colorWithRed:0.298039216 green:0.631372549 blue:1.0 alpha:1.0];
    v11 = [v13 textLabel];
    [v11 setTextColor:v10];
    uint64_t v12 = 3;
  }

  [v13 setAccessoryType:v12];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  if (-[PXFeedbackFormUIViewController _feedbackFormSectionForSectionIndex:](self, "_feedbackFormSectionForSectionIndex:", [a4 section]) == 2)
  {
    double v7 = 500.0;
  }
  else
  {
    BOOL v8 = [v6 dequeueReusableCellWithIdentifier:@"SwitchCell"];
    if (!v8)
    {
      BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"SwitchCell"];
      uint64_t v9 = [v8 textLabel];
      [v9 setLineBreakMode:0];

      char v10 = [v8 textLabel];
      [v10 setNumberOfLines:0];

      [v8 setSelectionStyle:0];
    }
    v11 = [v8 contentView];
    objc_msgSend(v11, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
    double v13 = v12;

    double v7 = v13 + 10.0;
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (-[PXFeedbackFormUIViewController _feedbackFormSectionForSectionIndex:](self, "_feedbackFormSectionForSectionIndex:", [v7 section]) == 2)
  {
    BOOL v8 = [v6 dequeueReusableCellWithIdentifier:@"OpenFeedbackCell"];
    if (v8) {
      goto LABEL_10;
    }
    BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"OpenFeedbackCell"];
    [v8 frame];
    double v10 = v9;
    [v8 frame];
    double v12 = v11;
    [v8 frame];
    objc_msgSend(v8, "setFrame:", v10, v12);
    if (!self->_customFeedbackTextView)
    {
      id v13 = objc_alloc(MEMORY[0x1E4FB1DD8]);
      [v8 frame];
      v14 = (UITextView *)objc_msgSend(v13, "initWithFrame:");
      customFeedbackTextView = self->_customFeedbackTextView;
      self->_customFeedbackTextView = v14;

      v16 = [MEMORY[0x1E4FB1618] labelColor];
      [(UITextView *)self->_customFeedbackTextView setTextColor:v16];

      [(UITextView *)self->_customFeedbackTextView setKeyboardType:0];
      [(UITextView *)self->_customFeedbackTextView setReturnKeyType:0];
      v17 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      [(UITextView *)self->_customFeedbackTextView setBackgroundColor:v17];

      [(UITextView *)self->_customFeedbackTextView setDelegate:self];
      v18 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0];
      [(UITextView *)self->_customFeedbackTextView setFont:v18];

      [(UITextView *)self->_customFeedbackTextView setUserInteractionEnabled:1];
      id v19 = objc_alloc(MEMORY[0x1E4FB1DF0]);
      v20 = objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [v20 sizeToFit];
      [v20 setBarStyle:0];
      v21 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
      v31[0] = v21;
      v22 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__handleDoneButtonWasPressedOnCustomFeedbackView];
      v31[1] = v22;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
      [v20 setItems:v23];

      [(UITextView *)self->_customFeedbackTextView setInputAccessoryView:v20];
    }
    v24 = [v8 contentView];
    [v24 addSubview:self->_customFeedbackTextView];
  }
  else
  {
    v24 = [(PXFeedbackFormUIViewController *)self _feedbackKeyForIndexPath:v7];
    v25 = PXLocalizedStringFromTable(v24, @"PXFeedbackCollection");
    BOOL v8 = [v6 dequeueReusableCellWithIdentifier:@"SwitchCell"];
    if (!v8)
    {
      BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"SwitchCell"];
      v26 = [v8 textLabel];
      [v26 setText:v25];

      objc_msgSend(v8, "setSelected:", -[PXFeedbackFormUIViewController _isSelectedRow:inSection:](self, "_isSelectedRow:inSection:", v24, objc_msgSend(v7, "section")));
    }
    -[PXFeedbackFormUIViewController _markCell:asSelected:](self, "_markCell:asSelected:", v8, -[PXFeedbackFormUIViewController _isSelectedRow:inSection:](self, "_isSelectedRow:inSection:", v24, [v7 section]));
    v27 = [v8 textLabel];
    [v27 setText:v25];
  }
LABEL_10:
  v28 = [v8 textLabel];
  [v28 setNumberOfLines:0];

  v29 = [v8 textLabel];
  [v29 setLineBreakMode:0];

  [v8 setSelectionStyle:0];
  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(PXFeedbackFormUIViewController *)self _feedbackFormSectionForSectionIndex:a4];
  if (v7 > 2) {
    BOOL v8 = &stru_1F00B0030;
  }
  else {
    BOOL v8 = off_1E5DB73F8[v7];
  }
  if ([(__CFString *)v8 isEqualToString:&stru_1F00B0030]) {
    objc_exception_throw( (id) [objc_alloc(MEMORY[0x1E4F1CA00]) initWithName:@"PXFeedbackFormSectionValueNotFound" reason:@"Unsupported PXFeedbackFormSection Value" userInfo:0]);
  }
  double v9 = PXLocalizedStringFromTable(v8, @"PXFeedbackCollection");

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(PXFeedbackFormUIViewController *)self _feedbackFormSectionForSectionIndex:a4];
  if (v7)
  {
    if (v7 == 2)
    {
      int64_t v9 = 1;
      goto LABEL_9;
    }
    if (v7 != 1) {
      goto LABEL_7;
    }
    BOOL v8 = &OBJC_IVAR___PXFeedbackFormUIViewController__negativeFeedbackKeys;
  }
  else
  {
    BOOL v8 = &OBJC_IVAR___PXFeedbackFormUIViewController__positiveFeedbackKeys;
  }
  int64_t v9 = [*(id *)((char *)&self->super.super.super.isa + *v8) count];
  if (!v9) {
LABEL_7:
  }
    objc_exception_throw( (id) [objc_alloc(MEMORY[0x1E4F1CA00]) initWithName:@"PXFeedbackFormSectionValueNotFound" reason:@"Unsupported PXFeedbackFormSection Value" userInfo:0]);
LABEL_9:

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = 2;
  if (self->_wantsCustomFeedbackSection) {
    uint64_t v3 = 3;
  }
  return self->_wantsPositiveFeedbackSection + v3 - 1;
}

- (void)finishWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PXFeedbackFormUIViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(PXFeedbackFormUIViewController *)self delegate];
    [v7 userDidFinish:v3];
  }
  else
  {
    [(PXFeedbackFormUIViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)sendFeedback:(id)a3
{
  id v9 = a3;
  if (self->_wantsCustomFeedbackSection)
  {
    id v4 = [(UITextView *)self->_customFeedbackTextView text];
  }
  else
  {
    id v4 = &stru_1F00B0030;
  }
  id v5 = [(PXFeedbackFormUIViewController *)self delegate];
  [v5 userSentPositiveFeedback:self->_positiveFeedbackValues negativeFeedback:self->_negativeFeedbackValues customFeedback:v4];

  char v6 = [(PXFeedbackFormUIViewController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_8;
  }
  id v7 = [(PXFeedbackFormUIViewController *)self delegate];
  char v8 = [v7 shouldContinuePresentingFormAfterFeedback];

  if ((v8 & 1) == 0) {
LABEL_8:
  }
    [(PXFeedbackFormUIViewController *)self finishWithSuccess:1];
}

- (void)cancelFeedback:(id)a3
{
}

- (void)viewDidLoad
{
  v32[2] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)PXFeedbackFormUIViewController;
  [(PXFeedbackFormUIViewController *)&v30 viewDidLoad];
  BOOL v3 = [MEMORY[0x1E4FB1618] whiteColor];
  id v4 = [(PXFeedbackFormUIViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = [(PXFeedbackFormUIViewController *)self tableViewController];
  char v6 = [v5 view];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = [(PXFeedbackFormUIViewController *)self view];
  [v7 addSubview:v6];

  char v8 = [(PXFeedbackFormUIViewController *)self view];
  id v9 = [v8 safeAreaLayoutGuide];

  double v10 = (void *)MEMORY[0x1E4F28DC8];
  v29 = v9;
  double v11 = [v9 topAnchor];
  double v12 = [v6 topAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12];
  v32[0] = v13;
  v14 = [v9 bottomAnchor];
  v15 = [v6 bottomAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v32[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  [v10 activateConstraints:v17];

  v28 = _NSDictionaryOfVariableBindings(&cfstr_Feedbacktablev.isa, v6, 0);
  v18 = [(PXFeedbackFormUIViewController *)self view];
  id v19 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-0-[feedbackTableView]-0-|" options:0 metrics:0 views:v28];
  [v18 addConstraints:v19];

  v20 = PXLocalizedStringFromTable(@"FeedbackFormPanel.sendButton.title", @"PXFeedbackCollection");
  v21 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v20 style:0 target:self action:sel_sendFeedback_];
  v22 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  v23 = PXLocalizedStringFromTable(@"FeedbackCollectionPanel.cancelButton.title", @"PXFeedbackCollection");
  v24 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v23 style:0 target:self action:sel_cancelFeedback_];
  v31 = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v26 = [(PXFeedbackFormUIViewController *)self navigationItem];
  [v26 setLeftBarButtonItems:v25];

  v27 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v22, v21, 0);
  [(PXFeedbackFormUIViewController *)self setToolbarItems:v27];
}

- (PXFeedbackFormUIViewController)initWithDelegate:(id)a3 positiveKeys:(id)a4 negativeKeys:(id)a5 wantsCustomFeedbackSection:(BOOL)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v52.receiver = self;
  v52.super_class = (Class)PXFeedbackFormUIViewController;
  id v13 = [(PXFeedbackFormUIViewController *)&v52 init];
  v14 = v13;
  if (v13)
  {
    id v41 = v12;
    id v42 = v11;
    id v43 = v10;
    v13->_userLikedIt = 0;
    v13->_wantsCustomFeedbackSection = a6;
    objc_storeStrong((id *)&v13->_positiveFeedbackKeys, a4);
    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    positiveFeedbackValues = v14->_positiveFeedbackValues;
    v14->_positiveFeedbackValues = (NSMutableDictionary *)v15;

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v17 = v14->_positiveFeedbackKeys;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v49;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v49 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v48 + 1) + 8 * v21);
          v23 = [NSNumber numberWithBool:0];
          [(NSMutableDictionary *)v14->_positiveFeedbackValues setObject:v23 forKeyedSubscript:v22];

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v19);
    }

    objc_storeStrong((id *)&v14->_negativeFeedbackKeys, a5);
    uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
    negativeFeedbackValues = v14->_negativeFeedbackValues;
    v14->_negativeFeedbackValues = (NSMutableDictionary *)v24;

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v26 = v14->_negativeFeedbackKeys;
    uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v45;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v45 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v44 + 1) + 8 * v30);
          v32 = [NSNumber numberWithBool:0];
          [(NSMutableDictionary *)v14->_negativeFeedbackValues setObject:v32 forKeyedSubscript:v31];

          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v28);
    }

    v33 = objc_opt_new();
    [(PXFeedbackFormUIViewController *)v14 setTableViewController:v33];

    v34 = [(PXFeedbackFormUIViewController *)v14 tableViewController];
    v35 = [v34 view];
    [v35 setDataSource:v14];

    v36 = [(PXFeedbackFormUIViewController *)v14 tableViewController];
    uint64_t v37 = [v36 view];
    [(id)v37 setDelegate:v14];

    id v10 = v43;
    [(PXFeedbackFormUIViewController *)v14 setDelegate:v43];
    v14->_wantsPositiveFeedbackSection = 1;
    v38 = [(PXFeedbackFormUIViewController *)v14 delegate];
    LOBYTE(v37) = objc_opt_respondsToSelector();

    id v12 = v41;
    id v11 = v42;
    if (v37)
    {
      v39 = [(PXFeedbackFormUIViewController *)v14 delegate];
      v14->_wantsPositiveFeedbackSection = [v39 wantsPositiveFeedbackSection];
    }
  }

  return v14;
}

@end