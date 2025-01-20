@interface RCShareTableViewController
- (UITextField)voiceMemoTitleText;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_setupTitleCellTextWithDefaultFileName:(id)a3;
- (void)loadView;
- (void)setSharedFileName:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RCShareTableViewController

- (void)loadView
{
  v14.receiver = self;
  v14.super_class = (Class)RCShareTableViewController;
  [(RCShareTableViewController *)&v14 loadView];
  v3 = +[UIColor secondarySystemBackgroundColor];
  v4 = [(RCShareTableViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = RCLocalizedFrameworkString();
  [(RCShareTableViewController *)self setTitle:v5];

  v6 = (UITableViewCell *)objc_alloc_init((Class)UITableViewCell);
  voiceMemoTitleCell = self->_voiceMemoTitleCell;
  self->_voiceMemoTitleCell = v6;

  v8 = +[UIColor systemBackgroundColor];
  [(UITableViewCell *)self->_voiceMemoTitleCell setBackgroundColor:v8];

  id v9 = objc_alloc((Class)UITextField);
  v10 = [(UITableViewCell *)self->_voiceMemoTitleCell contentView];
  [v10 bounds];
  CGRect v16 = CGRectInset(v15, 15.0, 0.0);
  v11 = [v9 initWithFrame:v16.origin.x, v16.origin.y, v16.size.width, v16.size.height];
  voiceMemoTitleText = self->_voiceMemoTitleText;
  self->_voiceMemoTitleText = v11;

  [(UITextField *)self->_voiceMemoTitleText setAutoresizingMask:18];
  v13 = [(UITableViewCell *)self->_voiceMemoTitleCell contentView];
  [v13 addSubview:self->_voiceMemoTitleText];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCShareTableViewController;
  [(RCShareTableViewController *)&v4 viewWillAppear:a3];
  if (self->_sharedFileName) {
    -[RCShareTableViewController _setupTitleCellTextWithDefaultFileName:](self, "_setupTitleCellTextWithDefaultFileName:");
  }
}

- (void)setSharedFileName:(id)a3
{
  objc_storeStrong((id *)&self->_sharedFileName, a3);
  id v5 = a3;
  [(RCShareTableViewController *)self _setupTitleCellTextWithDefaultFileName:v5];
}

- (void)_setupTitleCellTextWithDefaultFileName:(id)a3
{
  id v4 = a3;
  voiceMemoTitleText = self->_voiceMemoTitleText;
  if (voiceMemoTitleText && !self->_didSetupTitleCellText)
  {
    id v6 = v4;
    [(UITextField *)voiceMemoTitleText setText:v4];
    [(UITextField *)self->_voiceMemoTitleText setPlaceholder:v6];
    self->_didSetupTitleCellText = 1;
  }

  _objc_release_x1();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return self->_voiceMemoTitleCell;
}

- (UITextField)voiceMemoTitleText
{
  return self->_voiceMemoTitleText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceMemoTitleText, 0);
  objc_storeStrong((id *)&self->_sharedFileName, 0);

  objc_storeStrong((id *)&self->_voiceMemoTitleCell, 0);
}

@end