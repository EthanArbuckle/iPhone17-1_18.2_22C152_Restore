@interface TSProximityWaitingViewController
- (BOOL)isStartOverRequiredOnBackButtonTapped;
- (SSProximityDevice)btServer;
- (TSProximityWaitingViewController)initWithBTServer:(id)a3 transferBackPhoneNumber:(id)a4;
- (TSSIMSetupFlowDelegate)delegate;
- (void)setBtServer:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TSProximityWaitingViewController

- (TSProximityWaitingViewController)initWithBTServer:(id)a3 transferBackPhoneNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = NSString;
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"PRX_TRANSFER_DETAIL_%@" value:&stru_26DBE8E78 table:@"Localizable"];
    v11 = objc_msgSend(v8, "stringWithFormat:", v10, v7);
  }
  else
  {
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v9 localizedStringForKey:@"PRX_TRANSFER_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];
  }

  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"PRX_TRANSFER_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
  v16.receiver = self;
  v16.super_class = (Class)TSProximityWaitingViewController;
  v14 = [(TSProximityWaitingViewController *)&v16 initWithTitle:v13 detailText:v11 symbolName:@"antenna.radiowaves.left.and.right"];

  if (v14) {
    objc_storeWeak((id *)&v14->_btServer, v6);
  }

  return v14;
}

- (BOOL)isStartOverRequiredOnBackButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_btServer);
  [WeakRetained invalidate:0];

  return 0;
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SSProximityDevice)btServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_btServer);
  return (SSProximityDevice *)WeakRetained;
}

- (void)setBtServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_btServer);
  objc_destroyWeak((id *)&self->_delegate);
}

@end