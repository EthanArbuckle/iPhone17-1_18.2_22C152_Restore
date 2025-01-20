@interface COSMigrationChoiceSetupController
+ (BOOL)controllerNeedsToRun;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (COSBuddyControllerDelegate)delegate;
- (COSMigrationChoiceDevicePickerViewCell)listCell;
- (COSMigrationChoiceFooterView)footerView;
- (COSMigrationChoiceHeaderView)headerView;
- (COSMigrationChoiceSetupController)init;
- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)controllerCancelled:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setListCell:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)userTappedContinue:(id)a3;
- (void)viewDidLoad;
@end

@implementation COSMigrationChoiceSetupController

+ (BOOL)controllerNeedsToRun
{
  v2 = BPSMigrationDevices();
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (COSMigrationChoiceSetupController)init
{
  v10.receiver = self;
  v10.super_class = (Class)COSMigrationChoiceSetupController;
  v2 = [(COSMigrationChoiceSetupController *)&v10 initWithStyle:1];
  if (v2)
  {
    id v3 = objc_alloc((Class)UIBarButtonItem);
    v4 = +[NSBundle mainBundle];
    v5 = [v4 localizedStringForKey:@"CANCEL" value:&stru_100249230 table:@"Localizable"];
    id v6 = [v3 initWithTitle:v5 style:0 target:v2 action:"controllerCancelled:"];

    v7 = [(COSMigrationChoiceSetupController *)v2 navigationItem];
    [v7 setRightBarButtonItem:v6];

    v8 = [(COSMigrationChoiceSetupController *)v2 tableView];
    [v8 setBouncesVertically:0];
  }
  return v2;
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)COSMigrationChoiceSetupController;
  [(COSMigrationChoiceSetupController *)&v18 viewDidLoad];
  id v3 = [(COSMigrationChoiceSetupController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"COSMigrationChoiceSetupCellID"];

  v4 = [COSMigrationChoiceHeaderView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v8 = -[COSMigrationChoiceHeaderView initWithFrame:](v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  headerView = self->_headerView;
  self->_headerView = v8;

  objc_super v10 = -[COSMigrationChoiceFooterView initWithFrame:]([COSMigrationChoiceFooterView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  footerView = self->_footerView;
  self->_footerView = v10;

  [(COSMigrationChoiceFooterView *)self->_footerView setUserInteractionEnabled:1];
  [(COSMigrationChoiceFooterView *)self->_footerView setDelegate:self];
  v12 = [(COSMigrationChoiceSetupController *)self tableView];
  v13 = BPSSeparatorColor();
  [v12 setSeparatorColor:v13];

  v14 = [(COSMigrationChoiceSetupController *)self view];
  v15 = +[UIColor clearColor];
  [v14 setBackgroundColor:v15];

  v16 = [(COSMigrationChoiceSetupController *)self view];
  v17 = BPSBridgeTintColor();
  [v16 setTintColor:v17];
}

- (void)controllerCancelled:(id)a3
{
}

- (void)userTappedContinue:(id)a3
{
  v4 = [(COSMigrationChoiceDevicePickerViewCell *)self->_listCell migrationPickerView];
  id v6 = [v4 selectedMigrationDevices];

  BPSMigrateDevices();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained buddyControllerDone:self];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v5 = [a3 dequeueReusableCellWithIdentifier:@"COSMigrationChoiceSetupCellID" a4];
  objc_storeStrong((id *)&self->_listCell, v5);

  return v5;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return self->_headerView;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return self->_footerView;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  -[COSMigrationChoiceHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", a3, a4, CGSizeZero.width, CGSizeZero.height);
  return v4;
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  -[COSMigrationChoiceFooterView sizeThatFits:](self->_footerView, "sizeThatFits:", a3, a4, CGSizeZero.width, CGSizeZero.height);
  return v4;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  -[COSMigrationChoiceDevicePickerViewCell sizeThatFits:](self->_listCell, "sizeThatFits:", a3, a4, CGSizeZero.width, CGSizeZero.height);
  return fmin(v4, 300.0);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (COSBuddyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSBuddyControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (COSMigrationChoiceHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (COSMigrationChoiceFooterView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (COSMigrationChoiceDevicePickerViewCell)listCell
{
  return self->_listCell;
}

- (void)setListCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listCell, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end