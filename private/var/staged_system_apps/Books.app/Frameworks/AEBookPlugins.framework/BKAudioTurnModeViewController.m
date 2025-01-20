@interface BKAudioTurnModeViewController
- (BKAudioControllerDelegate)delegate;
- (BKAudioTurnModeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)releaseViews;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BKAudioTurnModeViewController

- (BKAudioTurnModeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BKAudioTurnModeViewController;
  return [(BKViewController *)&v5 initWithNibName:a3 bundle:a4];
}

- (void)dealloc
{
  [(BKAudioTurnModeViewController *)self releaseViews];
  v3.receiver = self;
  v3.super_class = (Class)BKAudioTurnModeViewController;
  [(BKViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)BKAudioTurnModeViewController;
  [(BKAudioTurnModeViewController *)&v5 viewDidLoad];
  objc_super v3 = AEBundle();
  v4 = [v3 localizedStringForKey:@"Turn Pages" value:&stru_1DF0D8 table:0];
  [(BKAudioTurnModeViewController *)self setTitle:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKAudioTurnModeViewController;
  [(BKAudioTurnModeViewController *)&v4 viewWillAppear:a3];
  [(UITableView *)self->_tableView reloadData];
}

- (void)releaseViews
{
  v4.receiver = self;
  v4.super_class = (Class)BKAudioTurnModeViewController;
  [(BKViewController *)&v4 releaseViews];
  [(UITableView *)self->_tableView setDelegate:0];
  [(UITableView *)self->_tableView setDataSource:0];
  tableView = self->_tableView;
  self->_tableView = 0;
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)BKAudioTurnModeViewController;
  [(BKAudioTurnModeViewController *)&v2 didReceiveMemoryWarning];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"BKAudioController"];
  if (!v7) {
    id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"BKAudioController"];
  }
  v8 = [(BKAudioTurnModeViewController *)self delegate];
  unsigned __int8 v9 = [v8 turnState];

  id v10 = [v6 row];
  v11 = AEBundle();
  v12 = v11;
  if (v10)
  {
    v13 = [v11 localizedStringForKey:@"Manually" value:&stru_1DF0D8 table:0];
    v14 = [v7 textLabel];
    [v14 setText:v13];

    if (v9) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v17 = [v11 localizedStringForKey:@"Automatically" value:&stru_1DF0D8 table:0];
  v18 = [v7 textLabel];
  [v18 setText:v17];

  if (v9) {
LABEL_5:
  }
    [v7 setAccessoryType:3];
LABEL_6:
  v15 = +[UIColor whiteColor];
  [v7 setBackgroundColor:v15];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  BOOL v5 = [a4 row] == 0;
  id v6 = [(BKAudioTurnModeViewController *)self delegate];
  [v6 setTurnState:v5];

  id v7 = [(BKAudioTurnModeViewController *)self delegate];
  LODWORD(v6) = [v7 readAloudState];

  if (v6)
  {
    id v9 = [(BKAudioTurnModeViewController *)self delegate];
    [v9 dismissPopover];
  }
  else
  {
    id v9 = [(BKAudioTurnModeViewController *)self navigationController];
    id v8 = [v9 popViewControllerAnimated:1];
  }
}

- (BKAudioControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKAudioControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end