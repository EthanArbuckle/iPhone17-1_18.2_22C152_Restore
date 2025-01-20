@interface MSDStoreInfoListViewController
- (MSDStoreInfoListViewController)initWithStoreInfoList:(id)a3 andDelegate:(id)a4;
- (MSDStoreInfoListViewControllerDelegate)delegate;
- (NSArray)storeList;
- (UITableView)tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_close:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStoreList:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation MSDStoreInfoListViewController

- (MSDStoreInfoListViewController)initWithStoreInfoList:(id)a3 andDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MSDStoreInfoListViewController;
  v8 = [(MSDStoreInfoListViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(MSDStoreInfoListViewController *)v8 setStoreList:v6];
    [(MSDStoreInfoListViewController *)v9 setDelegate:v7];
    [(MSDStoreInfoListViewController *)v9 setTableView:0];
  }

  return v9;
}

- (void)viewDidLoad
{
  v84[2] = *MEMORY[0x263EF8340];
  v81.receiver = self;
  v81.super_class = (Class)MSDStoreInfoListViewController;
  [(MSDStoreInfoListViewController *)&v81 viewDidLoad];
  v3 = [MEMORY[0x263F1C550] systemBackgroundColor];
  v4 = [(MSDStoreInfoListViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [MEMORY[0x263F1C488] buttonWithType:1];
  v79 = [MEMORY[0x263F1C6B0] systemImageNamed:@"xmark"];
  [v5 setImage:v79 forState:0];
  id v6 = [MEMORY[0x263F1C550] systemGrayColor];
  [v5 setTintColor:v6];

  [v5 addTarget:self action:sel__close_ forControlEvents:64];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = [(MSDStoreInfoListViewController *)self view];
  [v7 addSubview:v5];

  v80 = v5;
  v74 = [v5 trailingAnchor];
  v76 = [(MSDStoreInfoListViewController *)self view];
  v8 = [v76 safeAreaLayoutGuide];
  v9 = [v8 trailingAnchor];
  v10 = [v74 constraintEqualToAnchor:v9 constant:-30.0];
  v84[0] = v10;
  objc_super v11 = [v5 topAnchor];
  v12 = [(MSDStoreInfoListViewController *)self view];
  v13 = [v12 safeAreaLayoutGuide];
  v14 = [v13 topAnchor];
  v15 = [v11 constraintEqualToAnchor:v14 constant:30.0];
  v84[1] = v15;
  v78 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:2];

  [MEMORY[0x263F08938] activateConstraints:v78];
  id v16 = objc_alloc(MEMORY[0x263F1C768]);
  double v17 = *MEMORY[0x263F001A8];
  double v18 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v19 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v20 = *(double *)(MEMORY[0x263F001A8] + 24);
  v21 = objc_msgSend(v16, "initWithFrame:", *MEMORY[0x263F001A8], v18, v19, v20);
  [v21 setNumberOfLines:0];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  v22 = NSString;
  v23 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/MobileStoreDemoSetupUI.framework"];
  v24 = [v23 localizedStringForKey:@"STORE_COUNT" value:&stru_26EC8FB50 table:@"Localizable"];
  v25 = [(MSDStoreInfoListViewController *)self storeList];
  v26 = objc_msgSend(v22, "localizedStringWithFormat:", v24, objc_msgSend(v25, "count"));
  [v21 setText:v26];

  v27 = [MEMORY[0x263F81708] boldSystemFontOfSize:17.0];
  [v21 setFont:v27];

  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  v28 = [(MSDStoreInfoListViewController *)self view];
  [v28 addSubview:v21];

  v70 = [v21 leadingAnchor];
  v72 = [(MSDStoreInfoListViewController *)self view];
  v68 = [v72 safeAreaLayoutGuide];
  v66 = [v68 leadingAnchor];
  v64 = [v70 constraintEqualToAnchor:v66 constant:30.0];
  v83[0] = v64;
  v62 = [v21 trailingAnchor];
  v60 = [v80 leadingAnchor];
  v58 = [v62 constraintEqualToAnchor:v60];
  v83[1] = v58;
  v77 = v21;
  v29 = [v21 topAnchor];
  v30 = [(MSDStoreInfoListViewController *)self view];
  v31 = [v30 safeAreaLayoutGuide];
  v32 = [v31 topAnchor];
  v33 = [v29 constraintEqualToAnchor:v32];
  v83[2] = v33;
  v34 = [v21 centerYAnchor];
  v35 = [v80 centerYAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  v83[3] = v36;
  v75 = [MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:4];

  [MEMORY[0x263F08938] activateConstraints:v75];
  v37 = objc_msgSend(objc_alloc(MEMORY[0x263F1CA40]), "initWithFrame:style:", 0, v17, v18, v19, v20);
  [(MSDStoreInfoListViewController *)self setTableView:v37];

  v38 = [(MSDStoreInfoListViewController *)self tableView];
  [v38 setDataSource:self];

  v39 = [(MSDStoreInfoListViewController *)self tableView];
  [v39 setDelegate:self];

  v40 = [(MSDStoreInfoListViewController *)self tableView];
  [v40 setTranslatesAutoresizingMaskIntoConstraints:0];

  v41 = [(MSDStoreInfoListViewController *)self view];
  v42 = [(MSDStoreInfoListViewController *)self tableView];
  [v41 addSubview:v42];

  v73 = [(MSDStoreInfoListViewController *)self tableView];
  v71 = [v73 topAnchor];
  v69 = [v80 bottomAnchor];
  v67 = [v71 constraintEqualToAnchor:v69 constant:15.0];
  v82[0] = v67;
  v65 = [(MSDStoreInfoListViewController *)self tableView];
  v61 = [v65 bottomAnchor];
  v63 = [(MSDStoreInfoListViewController *)self view];
  v59 = [v63 bottomAnchor];
  v57 = [v61 constraintEqualToAnchor:v59];
  v82[1] = v57;
  v56 = [(MSDStoreInfoListViewController *)self tableView];
  v54 = [v56 leadingAnchor];
  v55 = [(MSDStoreInfoListViewController *)self view];
  v43 = [v55 safeAreaLayoutGuide];
  v44 = [v43 leadingAnchor];
  v45 = [v54 constraintEqualToAnchor:v44];
  v82[2] = v45;
  v46 = [(MSDStoreInfoListViewController *)self tableView];
  v47 = [v46 trailingAnchor];
  v48 = [(MSDStoreInfoListViewController *)self view];
  v49 = [v48 safeAreaLayoutGuide];
  v50 = [v49 trailingAnchor];
  v51 = [v47 constraintEqualToAnchor:v50];
  v82[3] = v51;
  v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:4];

  [MEMORY[0x263F08938] activateConstraints:v53];
  v52 = [(MSDStoreInfoListViewController *)self tableView];
  [v52 registerClass:objc_opt_class() forCellReuseIdentifier:@"StoreInfoCell"];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(MSDStoreInfoListViewController *)self storeList];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(MSDStoreInfoListViewController *)self storeList];
  uint64_t v7 = [v5 row];

  v8 = [v6 objectAtIndex:v7];

  if ([v8 isHQ]) {
    v9 = @"building.2.crop.circle.fill";
  }
  else {
    v9 = @"mappin.circle.fill";
  }
  v10 = [MEMORY[0x263F1C6B0] systemImageNamed:v9];
  objc_super v11 = [MSDStoreInfoTableViewCell alloc];
  v12 = [v8 storeName];
  v13 = [v8 storeDescription];
  v14 = [MEMORY[0x263F1C550] systemRedColor];
  v15 = [(MSDStoreInfoTableViewCell *)v11 initWithTitle:v12 description:v13 image:v10 imageColor:v14 reuseIdentifier:@"StoreInfoCell"];

  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v15 = a4;
  uint64_t v5 = [v15 row];
  id v6 = [(MSDStoreInfoListViewController *)self tableView];
  uint64_t v7 = [v6 numberOfRowsInSection:0];

  if (v5 < v7)
  {
    v8 = [(MSDStoreInfoListViewController *)self storeList];
    v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v15, "row"));

    v10 = [MSDStoreInfoViewController alloc];
    objc_super v11 = [(MSDStoreInfoListViewController *)self delegate];
    v12 = [(MSDStoreInfoViewController *)v10 initWithStoreInfo:v9 andDelegate:v11];

    v13 = [(MSDStoreInfoListViewController *)self navigationController];
    [v13 pushViewController:v12 animated:1];

    v14 = [(MSDStoreInfoListViewController *)self tableView];
    [v14 deselectRowAtIndexPath:v15 animated:1];
  }
}

- (void)_close:(id)a3
{
  v4 = [(MSDStoreInfoListViewController *)self navigationController];
  id v5 = (id)[v4 popViewControllerAnimated:1];

  id v6 = [(MSDStoreInfoListViewController *)self delegate];
  [v6 listViewDidClose:self];
}

- (MSDStoreInfoListViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)storeList
{
  return self->_storeList;
}

- (void)setStoreList:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_storeList, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end