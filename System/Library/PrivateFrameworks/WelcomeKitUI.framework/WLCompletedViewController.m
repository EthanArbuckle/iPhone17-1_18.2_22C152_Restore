@interface WLCompletedViewController
- (WLCompletedViewController)initWithWelcomeController:(id)a3 context:(id)a4 imported:(BOOL)a5;
- (id)continueHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_continueTapped:(id)a3;
- (void)setContinueHandler:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation WLCompletedViewController

- (WLCompletedViewController)initWithWelcomeController:(id)a3 context:(id)a4 imported:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = WLLocalizedString();
  v11 = [v9 album];
  uint64_t v12 = [v11 importErrorCount];

  v13 = [v9 image];
  id obj = a3;
  v14 = (void *)v10;
  id v15 = v8;
  if ([v13 importErrorCount])
  {
    BOOL v16 = 1;
  }
  else
  {
    v17 = [v9 video];
    BOOL v16 = [v17 importErrorCount] != 0;
  }
  v18 = [v9 voiceMemo];
  uint64_t v19 = [v18 importErrorCount];

  v20 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"COMPLETED_DESCRIPTION"];
  v21 = WLLocalizedString();

  if (v12)
  {
    v22 = WLLocalizedString();
    uint64_t v23 = [v21 stringByAppendingFormat:@"\n\n%@", v22];

    v24 = @" ";
    v21 = (void *)v23;
    if (!v16) {
      goto LABEL_9;
    }
  }
  else
  {
    v24 = @"\n\n";
    if (!v16) {
      goto LABEL_9;
    }
  }
  if (v19)
  {
LABEL_13:
    v26 = v15;
    v27 = v14;
LABEL_14:
    v28 = WLLocalizedString();
    uint64_t v29 = [v21 stringByAppendingFormat:@"%@%@", v24, v28];

    v21 = (void *)v29;
    goto LABEL_15;
  }
LABEL_9:
  if (v19) {
    BOOL v25 = 0;
  }
  else {
    BOOL v25 = v16;
  }
  if (v25) {
    goto LABEL_13;
  }
  if (v19) {
    char v42 = v16;
  }
  else {
    char v42 = 1;
  }
  v26 = v15;
  v27 = v14;
  if ((v42 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_15:
  v30 = (void *)MEMORY[0x263F827E8];
  v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v32 = [v30 imageNamed:@"MoveToiOS" inBundle:v31];
  v44.receiver = self;
  v44.super_class = (Class)WLCompletedViewController;
  v33 = [(OBTableWelcomeController *)&v44 initWithTitle:v27 detailText:v21 icon:v32 adoptTableViewScrollView:1];

  if (v33)
  {
    objc_storeStrong((id *)&v33->_welcomeController, obj);
    if ([v9 isEnabled])
    {
      uint64_t v34 = +[WLDetailItem items:v9];
      items = v33->_items;
      v33->_items = (NSArray *)v34;
    }
    v36 = [MEMORY[0x263F5B898] boldButton];
    v37 = WLLocalizedString();
    [v36 setTitle:v37 forState:0];

    [v36 addTarget:v33 action:sel__continueTapped_ forControlEvents:64];
    v38 = [(WLCompletedViewController *)v33 buttonTray];
    [v38 addButton:v36];

    v39 = [(OBBaseWelcomeController *)v33 navigationItem];
    [v39 setTitle:&stru_26DDE7AC0];

    v40 = [(OBBaseWelcomeController *)v33 navigationItem];
    [v40 setHidesBackButton:1 animated:0];
  }
  return v33;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)WLCompletedViewController;
  [(OBTableWelcomeController *)&v11 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F82C78]);
  v4 = objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(OBTableWelcomeController *)self setTableView:v4];

  v5 = [(OBTableWelcomeController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"WLCompletedViewCell"];

  v6 = [(OBTableWelcomeController *)self tableView];
  v7 = [MEMORY[0x263F825C8] clearColor];
  [v6 setBackgroundColor:v7];

  id v8 = [(OBTableWelcomeController *)self tableView];
  [v8 setDataSource:self];

  id v9 = [(OBTableWelcomeController *)self tableView];
  [v9 setDelegate:self];

  uint64_t v10 = [(OBTableWelcomeController *)self tableView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)_continueTapped:(id)a3
{
  continueHandler = (void (**)(void))self->_continueHandler;
  if (continueHandler) {
    continueHandler[2]();
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_items count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"WLCompletedViewCell" forIndexPath:v6];
  items = self->_items;
  uint64_t v9 = [v6 row];

  uint64_t v10 = [(NSArray *)items objectAtIndexedSubscript:v9];
  [v7 setItem:v10];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  items = self->_items;
  uint64_t v8 = [v6 row];

  id v11 = [(NSArray *)items objectAtIndexedSubscript:v8];
  if ([v11 showDetailDiscloureButton])
  {
    uint64_t v9 = [[WLDetailWarningViewController alloc] initWithWLDetailItem:v11];
    uint64_t v10 = [(WLCompletedViewController *)self navigationController];
    [v10 pushViewController:v9 animated:1];
  }
}

- (id)continueHandler
{
  return self->_continueHandler;
}

- (void)setContinueHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_continueHandler, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
}

@end