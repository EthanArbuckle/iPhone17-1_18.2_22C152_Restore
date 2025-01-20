@interface MSDThisDeviceViewController
- (MSDThisDeviceViewController)init;
- (NSString)deviceModel;
- (NSString)osString;
- (NSString)serialNumber;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setDeviceModel:(id)a3;
- (void)setOsString:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)viewDidLoad;
@end

@implementation MSDThisDeviceViewController

- (MSDThisDeviceViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)MSDThisDeviceViewController;
  v2 = [(MSDThisDeviceViewController *)&v10 init];
  if (v2)
  {
    v3 = (void *)MGCopyAnswer();
    v4 = (void *)MGCopyAnswer();
    v5 = [NSString stringWithFormat:@"%@ %@", v3, v4];
    [(MSDThisDeviceViewController *)v2 setOsString:v5];

    v6 = (void *)MGCopyAnswer();
    [(MSDThisDeviceViewController *)v2 setSerialNumber:v6];

    v7 = (void *)MGCopyAnswer();
    [(MSDThisDeviceViewController *)v2 setDeviceModel:v7];

    v8 = +[MSDSetupUILocalization localizedStringForKey:@"THIS_DEVICE_HEADER"];
    [(MSDThisDeviceViewController *)v2 setTitle:v8];
  }
  return v2;
}

- (void)viewDidLoad
{
  v28[4] = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)MSDThisDeviceViewController;
  [(MSDThisDeviceViewController *)&v27 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F1CA40]);
  v4 = objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setDataSource:self];
  [v4 setScrollEnabled:0];
  [v4 setUserInteractionEnabled:0];
  v5 = [(MSDThisDeviceViewController *)self view];
  [v5 addSubview:v4];

  v25 = [v4 topAnchor];
  v26 = [(MSDThisDeviceViewController *)self view];
  v24 = [v26 safeAreaLayoutGuide];
  v23 = [v24 topAnchor];
  v22 = [v25 constraintEqualToAnchor:v23];
  v28[0] = v22;
  v20 = [v4 bottomAnchor];
  v21 = [(MSDThisDeviceViewController *)self view];
  v19 = [v21 safeAreaLayoutGuide];
  v18 = [v19 bottomAnchor];
  v17 = [v20 constraintEqualToAnchor:v18];
  v28[1] = v17;
  v15 = [v4 leftAnchor];
  v6 = [(MSDThisDeviceViewController *)self view];
  v7 = [v6 safeAreaLayoutGuide];
  v8 = [v7 leftAnchor];
  v9 = [v15 constraintEqualToAnchor:v8];
  v28[2] = v9;
  objc_super v10 = [v4 rightAnchor];
  v11 = [(MSDThisDeviceViewController *)self view];
  v12 = [v11 safeAreaLayoutGuide];
  v13 = [v12 rightAnchor];
  v14 = [v10 constraintEqualToAnchor:v13];
  v28[3] = v14;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];

  [MEMORY[0x263F08938] activateConstraints:v16];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"ThisDeviceViewTableCell"];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 row] > 2)
  {
    v6 = 0;
    goto LABEL_11;
  }
  v6 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:1 reuseIdentifier:@"ThisDeviceViewTableCell"];
  v7 = [v6 defaultContentConfiguration];
  if (![v5 row])
  {
    objc_super v10 = +[MSDSetupUILocalization localizedStringForKey:@"MODEL_OPTION"];
    [v7 setText:v10];

    uint64_t v9 = [(MSDThisDeviceViewController *)self deviceModel];
    goto LABEL_9;
  }
  if ([v5 row] == 1)
  {
    v8 = +[MSDSetupUILocalization localizedStringForKey:@"OS_OPTION"];
    [v7 setText:v8];

    uint64_t v9 = [(MSDThisDeviceViewController *)self osString];
LABEL_9:
    v12 = (void *)v9;
    [v7 setSecondaryText:v9];

    goto LABEL_10;
  }
  if ([v5 row] == 2)
  {
    v11 = +[MSDSetupUILocalization localizedStringForKey:@"SERIAL_NUMBER_OPTION"];
    [v7 setText:v11];

    uint64_t v9 = [(MSDThisDeviceViewController *)self serialNumber];
    goto LABEL_9;
  }
LABEL_10:
  [v6 setContentConfiguration:v7];

LABEL_11:
  return v6;
}

- (NSString)osString
{
  return self->_osString;
}

- (void)setOsString:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_osString, 0);
}

@end