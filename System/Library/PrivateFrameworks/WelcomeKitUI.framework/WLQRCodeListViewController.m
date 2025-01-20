@interface WLQRCodeListViewController
- (NSArray)qrcodes;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setQrcodes:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WLQRCodeListViewController

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)WLQRCodeListViewController;
  [(OBTableWelcomeController *)&v10 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F82C78]);
  v4 = objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(OBTableWelcomeController *)self setTableView:v4];

  v5 = [(OBTableWelcomeController *)self tableView];
  v6 = [MEMORY[0x263F825C8] clearColor];
  [v5 setBackgroundColor:v6];

  v7 = [(OBTableWelcomeController *)self tableView];
  [v7 setDataSource:self];

  v8 = [(OBTableWelcomeController *)self tableView];
  [v8 setDelegate:self];

  v9 = [(OBTableWelcomeController *)self tableView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WLQRCodeListViewController;
  [(WLQRCodeListViewController *)&v5 viewWillDisappear:a3];
  if (!self->_attempts)
  {
    v4 = [MEMORY[0x263F862E0] sharedInstance];
    [v4 didLoadAndroidStore:0 selected:0 canceled:1 inAttempts:0];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_qrcodes count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"WLQRCodeListViewCell"];
  if (!v7)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:@"WLQRCodeListViewCell"];
    [v7 setAccessoryType:1];
    v8 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
    [v7 setBackgroundColor:v8];
  }
  v9 = -[NSArray objectAtIndex:](self->_qrcodes, "objectAtIndex:", [v6 row]);
  objc_super v10 = [v7 textLabel];
  v11 = [v9 name];
  [v10 setText:v11];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  qrcodes = self->_qrcodes;
  uint64_t v8 = [v6 row];

  id v18 = [(NSArray *)qrcodes objectAtIndex:v8];
  v9 = [v18 title];
  objc_super v10 = NSString;
  v11 = WLLocalizedString();
  v12 = [v18 name];
  v13 = objc_msgSend(v10, "stringWithFormat:", v11, v12);

  v14 = [[WLQRCodeViewController alloc] initWithTitle:v9 detailText:v13 symbolName:@"qrcode"];
  [(WLQRCodeViewController *)v14 setQrcode:v18];
  v15 = [(WLQRCodeListViewController *)self navigationController];
  [v15 pushViewController:v14 animated:1];

  v16 = [MEMORY[0x263F862E0] sharedInstance];
  v17 = [v18 code];
  [v16 didLoadAndroidStore:v17 selected:1 canceled:0 inAttempts:self->_attempts];

  ++self->_attempts;
}

- (NSArray)qrcodes
{
  return self->_qrcodes;
}

- (void)setQrcodes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end