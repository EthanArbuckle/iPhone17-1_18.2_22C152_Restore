@interface SBModifierTimelineDetailViewController
- (SBSwitcherModifierTimelineEntry)entry;
- (id)_prettyStringForEventPredicateDetails:(id)a3;
- (id)_stackSnapshotAtIndex:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)_numberOfModifiersInStackSnapshot:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_done;
- (void)setEntry:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SBModifierTimelineDetailViewController

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)SBModifierTimelineDetailViewController;
  [(SBModifierTimelineDetailViewController *)&v13 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4F42E98]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  tableView = self->_tableView;
  self->_tableView = v4;

  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView contentInset];
  -[UITableView setContentInset:](self->_tableView, "setContentInset:");
  v6 = [(SBModifierTimelineDetailViewController *)self view];
  [v6 addSubview:self->_tableView];

  v7 = [[SBModifierTimelineModifierDetailViewController alloc] initWithNibName:0 bundle:0];
  modifierDetailViewController = self->_modifierDetailViewController;
  self->_modifierDetailViewController = v7;

  v9 = [[SBModifierTimelineTextDetailViewController alloc] initWithNibName:0 bundle:0];
  textDetailViewController = self->_textDetailViewController;
  self->_textDetailViewController = v9;

  v11 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithTitle:@"Done" style:2 target:self action:sel__done];
  v12 = [(SBModifierTimelineDetailViewController *)self navigationItem];
  [v12 setRightBarButtonItem:v11];
}

- (void)setEntry:(id)a3
{
  objc_storeStrong((id *)&self->_entry, a3);
  id v5 = a3;
  [(SBModifierTimelineDetailViewController *)self loadViewIfNeeded];
  [(UITableView *)self->_tableView reloadData];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SBModifierTimelineDetailViewController;
  [(SBModifierTimelineDetailViewController *)&v5 viewWillLayoutSubviews];
  tableView = self->_tableView;
  v4 = [(SBModifierTimelineDetailViewController *)self view];
  [v4 bounds];
  -[UITableView setFrame:](tableView, "setFrame:");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ((unint64_t)a4 > 2) {
    return &stru_1F3084718;
  }
  else {
    return off_1E6B0DB48[a4];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (a4 == 2)
    {
      v7 = [(SBSwitcherModifierTimelineEntry *)self->_entry responseSnapshot];
      v9 = [v7 responseNames];
      int64_t v8 = [v9 count];
    }
    else
    {
      if (a4 != 1)
      {
        int64_t v8 = 0;
        goto LABEL_9;
      }
      v7 = [(SBSwitcherModifierTimelineEntry *)self->_entry stackSnapshotAfterEvent];
      int64_t v8 = [(SBModifierTimelineDetailViewController *)self _numberOfModifiersInStackSnapshot:v7];
    }
  }
  else
  {
    int64_t v8 = 1;
  }
LABEL_9:

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"Cell"];
  if (!v7) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:1 reuseIdentifier:@"Cell"];
  }
  [v7 setAccessoryType:1];
  if (![v6 section])
  {
    int64_t v8 = [v7 textLabel];
    v9 = [(SBSwitcherModifierTimelineEntry *)self->_entry eventSnapshot];
    v10 = [v9 eventName];
    v11 = v8;
    goto LABEL_7;
  }
  if ([v6 section] == 1)
  {
    int64_t v8 = -[SBModifierTimelineDetailViewController _stackSnapshotAtIndex:](self, "_stackSnapshotAtIndex:", [v6 row]);
    v9 = [v7 textLabel];
    v10 = [v8 modifierName];
    v11 = v9;
LABEL_7:
    [v11 setText:v10];
LABEL_8:

    goto LABEL_9;
  }
  if ([v6 section] == 2)
  {
    int64_t v8 = [v7 textLabel];
    v9 = [(SBSwitcherModifierTimelineEntry *)self->_entry responseSnapshot];
    v10 = [v9 responseNames];
    objc_super v13 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v6, "row"));
    [v8 setText:v13];

    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v23 = a4;
  [a3 deselectRowAtIndexPath:v23 animated:1];
  if (![v23 section])
  {
    id v6 = [(SBSwitcherModifierTimelineEntry *)self->_entry eventSnapshot];
    uint64_t v7 = 992;
    [(SBModifierTimelineTextDetailViewController *)self->_textDetailViewController prepareForReuse];
    textDetailViewController = self->_textDetailViewController;
    v11 = [v6 eventName];
    [(SBModifierTimelineTextDetailViewController *)textDetailViewController setTitle:v11];

    v12 = self->_textDetailViewController;
    objc_super v13 = [(SBModifierTimelineDetailViewController *)self _prettyStringForEventPredicateDetails:v6];
    [(SBModifierTimelineTextDetailViewController *)v12 setAttributedText:v13];

    goto LABEL_5;
  }
  if ([v23 section] == 1)
  {
    id v6 = -[SBModifierTimelineDetailViewController _stackSnapshotAtIndex:](self, "_stackSnapshotAtIndex:", [v23 row]);
    uint64_t v7 = 984;
    modifierDetailViewController = self->_modifierDetailViewController;
    v9 = [v6 modifierName];
    [(SBModifierTimelineModifierDetailViewController *)modifierDetailViewController setTitle:v9];

    [(SBModifierTimelineModifierDetailViewController *)self->_modifierDetailViewController setStackSnapshot:v6];
LABEL_5:
    v14 = [(SBModifierTimelineDetailViewController *)self navigationController];
    [v14 pushViewController:*(Class *)((char *)&self->super.super.super.isa + v7) animated:1];

LABEL_6:
    goto LABEL_7;
  }
  if ([v23 section] == 2)
  {
    [(SBModifierTimelineTextDetailViewController *)self->_textDetailViewController prepareForReuse];
    v15 = self->_textDetailViewController;
    v16 = [(SBSwitcherModifierTimelineEntry *)self->_entry responseSnapshot];
    v17 = [v16 responseNames];
    v18 = objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v23, "row"));
    [(SBModifierTimelineTextDetailViewController *)v15 setTitle:v18];

    v19 = self->_textDetailViewController;
    v20 = [(SBSwitcherModifierTimelineEntry *)self->_entry responseSnapshot];
    v21 = [v20 responseDescriptions];
    v22 = objc_msgSend(v21, "objectAtIndex:", objc_msgSend(v23, "row"));
    [(SBModifierTimelineTextDetailViewController *)v19 setText:v22];

    id v6 = [(SBModifierTimelineDetailViewController *)self navigationController];
    [v6 pushViewController:self->_textDetailViewController animated:1];
    goto LABEL_6;
  }
LABEL_7:
}

- (void)_done
{
}

- (int64_t)_numberOfModifiersInStackSnapshot:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  int64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__SBModifierTimelineDetailViewController__numberOfModifiersInStackSnapshot___block_invoke;
  v6[3] = &unk_1E6B0CA88;
  v6[4] = &v7;
  [v3 enumerateModifierSnapshots:v6];
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __76__SBModifierTimelineDetailViewController__numberOfModifiersInStackSnapshot___block_invoke(uint64_t result)
{
  return result;
}

- (id)_stackSnapshotAtIndex:(int64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__125;
  objc_super v13 = __Block_byref_object_dispose__125;
  id v14 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  int64_t v4 = [(SBSwitcherModifierTimelineEntry *)self->_entry stackSnapshotAfterEvent];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__SBModifierTimelineDetailViewController__stackSnapshotAtIndex___block_invoke;
  v7[3] = &unk_1E6B0DB28;
  v7[5] = &v9;
  v7[6] = a3;
  v7[4] = v8;
  [v4 enumerateModifierSnapshots:v7];

  id v5 = (id)v10[5];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __64__SBModifierTimelineDetailViewController__stackSnapshotAtIndex___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(a1[4] + 8);
  uint64_t v8 = *(void *)(v7 + 24);
  if (v8 == a1[6])
  {
    id v9 = v6;
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    id v6 = v9;
    *a3 = 1;
    uint64_t v7 = *(void *)(a1[4] + 8);
    uint64_t v8 = *(void *)(v7 + 24);
  }
  *(void *)(v7 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v8 + 1;
}

- (id)_prettyStringForEventPredicateDetails:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int64_t v4 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v19 = v3;
  id v5 = [v3 eventDescription];
  id v6 = [v5 componentsSeparatedByString:@"\n"];

  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    uint64_t v10 = *MEMORY[0x1E4F42510];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v12 hasSuffix:@"YES"]) {
          [MEMORY[0x1E4F428B8] systemGreenColor];
        }
        else {
        objc_super v13 = [MEMORY[0x1E4F428B8] labelColor];
        }
        id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
        uint64_t v25 = v10;
        v26 = v13;
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        v16 = (void *)[v14 initWithString:v12 attributes:v15];
        [v4 appendAttributedString:v16];

        v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
        [v4 appendAttributedString:v17];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v8);
  }

  return v4;
}

- (SBSwitcherModifierTimelineEntry)entry
{
  return self->_entry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_textDetailViewController, 0);
  objc_storeStrong((id *)&self->_modifierDetailViewController, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end