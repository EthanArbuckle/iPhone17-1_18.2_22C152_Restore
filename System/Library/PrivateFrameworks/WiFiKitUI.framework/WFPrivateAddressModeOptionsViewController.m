@interface WFPrivateAddressModeOptionsViewController
- (BOOL)isChinaDevice;
- (BOOL)isCurrentNetwork;
- (NSString)networkName;
- (NSString)originalSelection;
- (NSString)pendingSelection;
- (WFPrivateAddressModeOptionsViewController)initWithTitles:(id)a3 originalSelection:(id)a4 isCurrentNetwork:(BOOL)a5 currentNetworkName:(id)a6 isChinaDevice:(BOOL)a7;
- (void)_promptForAllowTrackingCurrentNetwork:(BOOL)a3 indexPath:(id)a4;
- (void)_promptForInterruptCurrentNetwork:(id)a3;
- (void)setIsChinaDevice:(BOOL)a3;
- (void)setIsCurrentNetwork:(BOOL)a3;
- (void)setNetworkName:(id)a3;
- (void)setOriginalSelection:(id)a3;
- (void)setPendingSelection:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation WFPrivateAddressModeOptionsViewController

- (WFPrivateAddressModeOptionsViewController)initWithTitles:(id)a3 originalSelection:(id)a4 isCurrentNetwork:(BOOL)a5 currentNetworkName:(id)a6 isChinaDevice:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WFPrivateAddressModeOptionsViewController;
  v14 = [(WFValueListViewController *)&v17 initWithTitles:a3 switchTitle:0];
  v15 = v14;
  if (v14)
  {
    [(WFPrivateAddressModeOptionsViewController *)v14 setOriginalSelection:v12];
    [(WFValueListViewController *)v15 setSelectedTitle:v12];
    [(WFPrivateAddressModeOptionsViewController *)v15 setIsCurrentNetwork:v9];
    [(WFPrivateAddressModeOptionsViewController *)v15 setNetworkName:v13];
    [(WFPrivateAddressModeOptionsViewController *)v15 setIsChinaDevice:v7];
  }

  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v21 = a4;
  [a3 deselectRowAtIndexPath:v21 animated:1];
  v6 = [(WFValueListViewController *)self titles];
  BOOL v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v21, "row"));

  v8 = [(WFValueListViewController *)self selectedTitle];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    [(WFPrivateAddressModeOptionsViewController *)self setPendingSelection:v7];
    pendingSelection = self->_pendingSelection;
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v12 = [v11 localizedStringForKey:@"kWFLocRandomMACOffOption" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    if (pendingSelection == v12)
    {
      [(WFPrivateAddressModeOptionsViewController *)self _promptForAllowTrackingCurrentNetwork:self->_isCurrentNetwork indexPath:v21];
    }
    else
    {
      originalSelection = self->_originalSelection;
      v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v15 = [v14 localizedStringForKey:@"kWFLocRandomMACOffOption" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

      if (originalSelection == v15 && self->_isCurrentNetwork)
      {
        [(WFPrivateAddressModeOptionsViewController *)self _promptForInterruptCurrentNetwork:v21];
      }
      else
      {
        [(WFValueListViewController *)self setSelectedTitle:self->_pendingSelection];
        v16 = [(WFPrivateAddressModeOptionsViewController *)self tableView];
        objc_super v17 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndex:", objc_msgSend(v21, "section"));
        [v16 reloadSections:v17 withRowAnimation:5];
      }
    }
  }
  v18 = [(WFValueListViewController *)self completionHandler];

  if (v18)
  {
    v19 = [(WFValueListViewController *)self completionHandler];
    v20 = [(WFValueListViewController *)self selectedTitle];
    ((void (**)(void, void *, uint64_t))v19)[2](v19, v20, 1);
  }
}

- (void)_promptForInterruptCurrentNetwork:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFPrivateAddressModeOptionsViewController *)self isChinaDevice];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v7 = v6;
  if (v5) {
    v8 = @"kWFLocPrivateAddressInterruptionAlertTile_CH";
  }
  else {
    v8 = @"kWFLocPrivateAddressInterruptionAlertTitle";
  }
  uint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", v9, self->_networkName);
  objc_initWeak(location, self);
  v11 = [MEMORY[0x263F82418] alertControllerWithTitle:v10 message:&stru_26D8F6070 preferredStyle:1];
  v23 = (void *)v10;
  id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:@"kWFLocPrivateAddressInterruptionAlertOK" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  v14 = (void *)MEMORY[0x263F82400];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __79__WFPrivateAddressModeOptionsViewController__promptForInterruptCurrentNetwork___block_invoke;
  v27[3] = &unk_264756888;
  objc_copyWeak(&v29, location);
  v27[4] = self;
  id v15 = v4;
  id v28 = v15;
  v16 = [v14 actionWithTitle:v13 style:0 handler:v27];
  v22 = (void *)v9;
  [v11 addAction:v16];
  objc_super v17 = (void *)MEMORY[0x263F82400];
  v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"kWFLocPrivateAddressInterruptionAlertCancel" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __79__WFPrivateAddressModeOptionsViewController__promptForInterruptCurrentNetwork___block_invoke_2;
  v24[3] = &unk_264756888;
  objc_copyWeak(&v26, location);
  v24[4] = self;
  id v20 = v15;
  id v25 = v20;
  id v21 = [v17 actionWithTitle:v19 style:1 handler:v24];

  [v11 addAction:v21];
  [(WFPrivateAddressModeOptionsViewController *)self presentViewController:v11 animated:1 completion:0];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v29);

  objc_destroyWeak(location);
}

void __79__WFPrivateAddressModeOptionsViewController__promptForInterruptCurrentNetwork___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 1120);
  v3 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setSelectedTitle:v2];

  id v7 = objc_loadWeakRetained(v3);
  BOOL v5 = [v7 tableView];
  v6 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  [v5 reloadSections:v6 withRowAnimation:5];
}

void __79__WFPrivateAddressModeOptionsViewController__promptForInterruptCurrentNetwork___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 1112);
  v3 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setSelectedTitle:v2];

  id v7 = objc_loadWeakRetained(v3);
  BOOL v5 = [v7 tableView];
  v6 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  [v5 reloadSections:v6 withRowAnimation:5];
}

- (void)_promptForAllowTrackingCurrentNetwork:(BOOL)a3 indexPath:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = [(WFPrivateAddressModeOptionsViewController *)self isChinaDevice];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = v8;
  if (v7) {
    uint64_t v10 = @"kWFLocPrivateAddressAllowTrackingAlertTitle_CH";
  }
  else {
    uint64_t v10 = @"kWFLocPrivateAddressAllowTrackingAlertTitle";
  }
  v11 = &stru_26D8F6070;
  uint64_t v12 = [v8 localizedStringForKey:v10 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", v12, self->_networkName);
  if (v4)
  {
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v14 localizedStringForKey:@"kWFLocPrivateAddressAllowTrackingAlertMessage" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  }
  objc_initWeak(location, self);
  id v15 = [MEMORY[0x263F82418] alertControllerWithTitle:v13 message:v11 preferredStyle:1];
  id v26 = (void *)v13;
  v27 = (void *)v12;
  v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v17 = [v16 localizedStringForKey:@"kWFLocPrivateAddressAllowTrackingAlertAllow" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  v18 = (void *)MEMORY[0x263F82400];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __93__WFPrivateAddressModeOptionsViewController__promptForAllowTrackingCurrentNetwork_indexPath___block_invoke;
  v31[3] = &unk_264756888;
  objc_copyWeak(&v33, location);
  v31[4] = self;
  id v19 = v6;
  id v32 = v19;
  id v20 = [v18 actionWithTitle:v17 style:0 handler:v31];
  [v15 addAction:v20];
  id v21 = (void *)MEMORY[0x263F82400];
  v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v23 = [v22 localizedStringForKey:@"kWFLocPrivateAddressAllowTrackingAlertCancel" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __93__WFPrivateAddressModeOptionsViewController__promptForAllowTrackingCurrentNetwork_indexPath___block_invoke_2;
  v28[3] = &unk_264756888;
  objc_copyWeak(&v30, location);
  v28[4] = self;
  id v24 = v19;
  id v29 = v24;
  id v25 = [v21 actionWithTitle:v23 style:1 handler:v28];

  [v15 addAction:v25];
  [(WFPrivateAddressModeOptionsViewController *)self presentViewController:v15 animated:1 completion:0];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v33);

  objc_destroyWeak(location);
}

void __93__WFPrivateAddressModeOptionsViewController__promptForAllowTrackingCurrentNetwork_indexPath___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 1120);
  v3 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setSelectedTitle:v2];

  id v7 = objc_loadWeakRetained(v3);
  BOOL v5 = [v7 tableView];
  id v6 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  [v5 reloadSections:v6 withRowAnimation:5];
}

void __93__WFPrivateAddressModeOptionsViewController__promptForAllowTrackingCurrentNetwork_indexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 1112);
  v3 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setSelectedTitle:v2];

  id v7 = objc_loadWeakRetained(v3);
  BOOL v5 = [v7 tableView];
  id v6 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  [v5 reloadSections:v6 withRowAnimation:5];
}

- (NSString)originalSelection
{
  return self->_originalSelection;
}

- (void)setOriginalSelection:(id)a3
{
}

- (NSString)pendingSelection
{
  return self->_pendingSelection;
}

- (void)setPendingSelection:(id)a3
{
}

- (BOOL)isCurrentNetwork
{
  return self->_isCurrentNetwork;
}

- (void)setIsCurrentNetwork:(BOOL)a3
{
  self->_isCurrentNetwork = a3;
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
}

- (BOOL)isChinaDevice
{
  return self->_isChinaDevice;
}

- (void)setIsChinaDevice:(BOOL)a3
{
  self->_isChinaDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_pendingSelection, 0);
  objc_storeStrong((id *)&self->_originalSelection, 0);
}

@end