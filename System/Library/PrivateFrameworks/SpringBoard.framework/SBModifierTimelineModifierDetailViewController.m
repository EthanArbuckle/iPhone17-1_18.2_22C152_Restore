@interface SBModifierTimelineModifierDetailViewController
- (SBSwitcherModifierStackSnapshot)stackSnapshot;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setStackSnapshot:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SBModifierTimelineModifierDetailViewController

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)SBModifierTimelineModifierDetailViewController;
  [(SBModifierTimelineModifierDetailViewController *)&v9 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4F42E98]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  tableView = self->_tableView;
  self->_tableView = v4;

  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setDelegate:self];
  v6 = [(SBModifierTimelineModifierDetailViewController *)self view];
  [v6 addSubview:self->_tableView];

  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"NoValueCell"];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"ValueCell"];
  [(UITableView *)self->_tableView contentInset];
  -[UITableView setContentInset:](self->_tableView, "setContentInset:");
  v7 = [[SBModifierTimelineTextDetailViewController alloc] initWithNibName:0 bundle:0];
  textViewController = self->_textViewController;
  self->_textViewController = v7;
}

- (void)setStackSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_stackSnapshot, a3);
  id v5 = a3;
  [(SBModifierTimelineModifierDetailViewController *)self loadViewIfNeeded];
  [(UITableView *)self->_tableView reloadData];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SBModifierTimelineModifierDetailViewController;
  [(SBModifierTimelineModifierDetailViewController *)&v5 viewWillLayoutSubviews];
  tableView = self->_tableView;
  v4 = [(SBModifierTimelineModifierDetailViewController *)self view];
  [v4 bounds];
  -[UITableView setFrame:](tableView, "setFrame:");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = 1;
  switch(a4)
  {
    case 0:
      break;
    case 1:
      v8 = [(SBSwitcherModifierStackSnapshot *)self->_stackSnapshot querySnapshot];
      objc_super v9 = [v8 contextMethods];
      goto LABEL_6;
    case 2:
      v8 = [(SBSwitcherModifierStackSnapshot *)self->_stackSnapshot querySnapshot];
      objc_super v9 = [v8 implementingQueryMethods];
      goto LABEL_6;
    case 3:
      v8 = [(SBSwitcherModifierStackSnapshot *)self->_stackSnapshot querySnapshot];
      objc_super v9 = [v8 nonImplementingQueryMethods];
LABEL_6:
      v10 = v9;
      int64_t v7 = [v9 count];

      break;
    default:
      int64_t v7 = 0;
      break;
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 section]) {
    v8 = @"ValueCell";
  }
  else {
    v8 = @"NoValueCell";
  }
  objc_super v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  v10 = [v9 textLabel];
  v11 = [MEMORY[0x1E4F42A30] systemFontOfSize:13.0];
  [v10 setFont:v11];

  v12 = [v9 detailTextLabel];
  v13 = [MEMORY[0x1E4F42A30] systemFontOfSize:12.0];
  [v12 setFont:v13];

  v14 = [(SBSwitcherModifierStackSnapshot *)self->_stackSnapshot querySnapshot];
  if ([v6 section])
  {
    if ([v6 section] == 1)
    {
      v15 = [v14 contextMethods];
      v16 = objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v6, "row"));
      v17 = [v9 textLabel];
      [v17 setText:v16];

      v18 = [v14 contextMethodsToDescriptions];
LABEL_14:
      v22 = v18;
      v23 = [v18 objectForKey:v16];
      v24 = [v23 description];

      v25 = [v9 detailTextLabel];
      v26 = v25;
      if (v24)
      {
        v27 = [v24 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
        [v26 setText:v27];

        uint64_t v28 = 1;
      }
      else
      {
        [v25 setText:0];
        uint64_t v28 = 0;
      }

      [v9 setAccessoryType:v28];
      goto LABEL_18;
    }
    if ([v6 section] == 2 || objc_msgSend(v6, "section") == 3)
    {
      if ([v6 section] == 2) {
        [v14 implementingQueryMethods];
      }
      else {
      v15 = [v14 nonImplementingQueryMethods];
      }
      v16 = objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v6, "row"));
      v21 = [v9 textLabel];
      [v21 setText:v16];

      v18 = [v14 queryMethodsToDescriptions];
      goto LABEL_14;
    }
  }
  else
  {
    v19 = [v9 textLabel];
    v20 = [(SBSwitcherModifierStackSnapshot *)self->_stackSnapshot modifierDescription];
    [v19 setText:v20];

    [v9 setAccessoryType:1];
  }
LABEL_18:

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ((unint64_t)a4 > 3) {
    return &stru_1F3084718;
  }
  else {
    return off_1E6AF9128[a4];
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 30.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v16 = a4;
  [a3 deselectRowAtIndexPath:v16 animated:1];
  id v6 = [(SBSwitcherModifierStackSnapshot *)self->_stackSnapshot querySnapshot];
  if ([v16 section])
  {
    if ([v16 section] == 1)
    {
      id v7 = [v6 contextMethods];
      v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v16, "row"));

      objc_super v9 = [v6 contextMethodsToDescriptions];
      goto LABEL_11;
    }
    if ([v16 section] == 2)
    {
      v11 = [v6 implementingQueryMethods];
LABEL_10:
      v12 = v11;
      v8 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v16, "row"));

      objc_super v9 = [v6 queryMethodsToDescriptions];
LABEL_11:
      v13 = v9;
      v14 = [v9 objectForKey:v8];
      v10 = [v14 description];

      if (!v10) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    if ([v16 section] == 3)
    {
      v11 = [v6 nonImplementingQueryMethods];
      goto LABEL_10;
    }
    v8 = 0;
  }
  else
  {
    v8 = [(SBSwitcherModifierStackSnapshot *)self->_stackSnapshot modifierName];
    v10 = [(SBSwitcherModifierStackSnapshot *)self->_stackSnapshot modifierDescription];
    if (v10)
    {
LABEL_12:
      [(SBModifierTimelineTextDetailViewController *)self->_textViewController setTitle:v8];
      [(SBModifierTimelineTextDetailViewController *)self->_textViewController setText:v10];
      v15 = [(SBModifierTimelineModifierDetailViewController *)self navigationController];
      [v15 pushViewController:self->_textViewController animated:1];
    }
  }
LABEL_13:
}

- (SBSwitcherModifierStackSnapshot)stackSnapshot
{
  return self->_stackSnapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackSnapshot, 0);
  objc_storeStrong((id *)&self->_textViewController, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end