@interface WFPickerViewController
- (BOOL)dismissed;
- (BOOL)shouldPromptWhenCarPlaySessionIsActive;
- (BOOL)shouldPromptWhenPersonalHotspotIsEnabled;
- (BOOL)showCurrentNetworkTop;
- (BOOL)showOtherNetwork;
- (NSArray)sortedNetworks;
- (UITableView)tableView;
- (WFNetworkListDelegate)listDelegate;
- (WFNetworkListRecord)currentNetwork;
- (WFPickerViewController)init;
- (float)currentNetworkScaledRSSI;
- (id)_cellForNetworkRecord:(id)a3 tableView:(id)a4 indexPath:(id)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)currentNetworkState;
- (int64_t)deviceCapability;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didReceiveMemoryWarning;
- (void)loadView;
- (void)refresh;
- (void)setCurrentNetwork:(id)a3;
- (void)setCurrentNetworkScaledRSSI:(float)a3;
- (void)setCurrentNetworkState:(int64_t)a3;
- (void)setDeviceCapability:(int64_t)a3;
- (void)setDismissed:(BOOL)a3;
- (void)setListDelegate:(id)a3;
- (void)setNetworks:(id)a3;
- (void)setShowCurrentNetworkTop:(BOOL)a3;
- (void)setSortedNetworks:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFPickerViewController

- (WFPickerViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)WFPickerViewController;
  result = [(WFPickerViewController *)&v3 init];
  result->_showCurrentNetworkTop = 0;
  result->_dismissed = 0;
  return result;
}

- (void)loadView
{
  v29.receiver = self;
  v29.super_class = (Class)WFPickerViewController;
  [(WFPickerViewController *)&v29 loadView];
  id v3 = objc_alloc(MEMORY[0x263F82C78]);
  v4 = [(WFPickerViewController *)self view];
  [v4 bounds];
  v5 = objc_msgSend(v3, "initWithFrame:style:", 0);

  [v5 setDelegate:self];
  [v5 setDataSource:self];
  v6 = [(WFPickerViewController *)self view];
  [v6 addSubview:v5];

  v7 = [(WFPickerViewController *)self view];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(WFPickerViewController *)self setTableView:v5];
  v8 = [(WFPickerViewController *)self tableView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = [(WFPickerViewController *)self tableView];
  v10 = [v9 leftAnchor];
  v11 = [(WFPickerViewController *)self view];
  v12 = [v11 leftAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  v14 = [(WFPickerViewController *)self tableView];
  v15 = [v14 topAnchor];
  v16 = [(WFPickerViewController *)self view];
  v17 = [v16 topAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  v19 = [(WFPickerViewController *)self tableView];
  v20 = [v19 rightAnchor];
  v21 = [(WFPickerViewController *)self view];
  v22 = [v21 rightAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  v24 = [(WFPickerViewController *)self tableView];
  v25 = [v24 bottomAnchor];
  v26 = [(WFPickerViewController *)self view];
  v27 = [v26 bottomAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  [v28 setActive:1];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)WFPickerViewController;
  [(WFPickerViewController *)&v8 viewDidLoad];
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [MEMORY[0x263F829D0] nibWithNibName:@"WFNetworkListCell" bundle:v3];
  v5 = [(WFPickerViewController *)self tableView];
  [v5 registerNib:v4 forCellReuseIdentifier:@"WFNetworkCell"];

  v6 = [MEMORY[0x263F829D0] nibWithNibName:@"WFHotspotCell" bundle:v3];
  v7 = [(WFPickerViewController *)self tableView];
  [v7 registerNib:v6 forCellReuseIdentifier:@"WFHotspotCell"];
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)WFPickerViewController;
  [(WFPickerViewController *)&v7 viewWillAppear:a3];
  [(WFPickerViewController *)self refresh];
  v4 = [(WFPickerViewController *)self listDelegate];
  [v4 networkListViewControllerDidAppear:self];

  v5 = WFLogForCategory(3uLL);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[WFPickerViewController viewWillAppear:]";
    __int16 v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_2257EC000, v5, v6, "%s: %@", buf, 0x16u);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)WFPickerViewController;
  [(WFPickerViewController *)&v7 viewDidDisappear:a3];
  v4 = [(WFPickerViewController *)self listDelegate];
  [v4 networkListViewControllerDidDisappear:self];

  v5 = WFLogForCategory(3uLL);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[WFPickerViewController viewDidDisappear:]";
    __int16 v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_2257EC000, v5, v6, "%s: %@", buf, 0x16u);
  }
}

- (void)didReceiveMemoryWarning
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5.receiver = self;
  v5.super_class = (Class)WFPickerViewController;
  [(WFPickerViewController *)&v5 didReceiveMemoryWarning];
  id v3 = WFLogForCategory(3uLL);
  os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v7 = "-[WFPickerViewController didReceiveMemoryWarning]";
    __int16 v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_2257EC000, v3, v4, "%s: %@", buf, 0x16u);
  }
}

- (void)setNetworks:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = WFLogForCategory(3uLL);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5)
  {
    objc_super v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      int v18 = 136315650;
      v19 = "-[WFPickerViewController setNetworks:]";
      __int16 v20 = 2048;
      uint64_t v21 = [v4 count];
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_2257EC000, v7, v6, "%s: networks (%lu): %@", (uint8_t *)&v18, 0x20u);
    }
  }
  if ([(WFPickerViewController *)self dismissed])
  {
    __int16 v8 = WFLogForCategory(3uLL);
    os_log_type_t v9 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
    {
      int v18 = 136315138;
      v19 = "-[WFPickerViewController setNetworks:]";
      _os_log_impl(&dword_2257EC000, v8, v9, "%s: disregarding call to set networks, this view controller is no longer visible", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v10 = (NSArray *)[v4 mutableCopy];
      v11 = [(WFPickerViewController *)self currentNetwork];
      if (v11)
      {
        BOOL showCurrentNetworkTop = self->_showCurrentNetworkTop;

        if (!showCurrentNetworkTop)
        {
          v13 = [(WFPickerViewController *)self currentNetwork];
          [(NSArray *)v10 addObject:v13];
        }
      }
      v14 = [(NSArray *)v10 allObjects];
      v15 = WFScanRecordDefaultSortCompartor();
      v16 = [v14 sortedArrayUsingComparator:v15];
      sortedNetworks = self->_sortedNetworks;
      self->_sortedNetworks = v16;
    }
    else
    {
      uint64_t v10 = self->_sortedNetworks;
      self->_sortedNetworks = 0;
    }

    [(WFPickerViewController *)self refresh];
  }
}

- (void)setCurrentNetworkScaledRSSI:(float)a3
{
  self->_currentNetworkScaledRSSI = a3;
  [(WFPickerViewController *)self refresh];
}

- (void)setCurrentNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_currentNetwork, a3);
  id v5 = a3;
  [v5 scaledRSSI];
  float v7 = v6;

  self->_currentNetworkScaledRSSI = v7;
  self->_currentNetworkState = 0;
  [(WFPickerViewController *)self refresh];
}

- (void)setCurrentNetworkState:(int64_t)a3
{
  self->_currentNetworkState = a3;
  [(WFPickerViewController *)self refresh];
}

- (void)refresh
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    if ([(WFPickerViewController *)self dismissed])
    {
      id v3 = WFLogForCategory(3uLL);
      os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
      {
        *(_DWORD *)buf = 136315138;
        float v7 = "-[WFPickerViewController refresh]";
        _os_log_impl(&dword_2257EC000, v3, v4, "%s: disregarding call to refresh, this view controller is no longer visible", buf, 0xCu);
      }
    }
    else
    {
      id v5 = [(WFPickerViewController *)self tableView];
      [v5 reloadData];
    }
  }
  else
  {
    [(WFPickerViewController *)self performSelectorOnMainThread:sel_refresh withObject:0 waitUntilDone:0];
  }
}

- (BOOL)shouldPromptWhenPersonalHotspotIsEnabled
{
  return 1;
}

- (BOOL)shouldPromptWhenCarPlaySessionIsActive
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  os_log_type_t v4 = [(WFPickerViewController *)self listDelegate];
  int v5 = [v4 networkListViewControllerCurrentPowerState:self];

  if (!v5) {
    return 0;
  }
  float v6 = [(WFPickerViewController *)self currentNetwork];
  if (v6)
  {
    int64_t showCurrentNetworkTop = self->_showCurrentNetworkTop;
  }
  else
  {
    int64_t showCurrentNetworkTop = 0;
  }
  os_log_type_t v9 = [(WFPickerViewController *)self sortedNetworks];
  uint64_t v10 = [v9 count];

  if (v10) {
    return showCurrentNetworkTop + 1;
  }
  else {
    return showCurrentNetworkTop;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (!a4
    && ([(WFPickerViewController *)self currentNetwork],
        (v11 = objc_claimAutoreleasedReturnValue()) != 0)
    && (BOOL showCurrentNetworkTop = self->_showCurrentNetworkTop, v11, showCurrentNetworkTop))
  {
    int64_t v10 = 1;
  }
  else
  {
    float v7 = [(WFPickerViewController *)self sortedNetworks];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      os_log_type_t v9 = [(WFPickerViewController *)self sortedNetworks];
      int64_t v10 = [v9 count];
    }
    else
    {
      int64_t v10 = 0;
    }
  }

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(WFPickerViewController *)self sortedNetworks];
  os_log_type_t v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));

  int64_t v10 = [(WFPickerViewController *)self _cellForNetworkRecord:v9 tableView:v7 indexPath:v6];

  return v10;
}

- (id)_cellForNetworkRecord:(id)a3 tableView:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 title];
  [0 setTitle:v11];

  if ([v8 isInstantHotspot])
  {
    uint64_t v12 = [v10 dequeueReusableCellWithIdentifier:@"WFHotspotCell" forIndexPath:v9];

    v13 = [v8 title];
    [v12 setTitle:v13];

    v14 = [v12 hotspotDetails];

    if (!v14)
    {
      v15 = objc_alloc_init(WFHotspotDetails);
      v16 = [v8 hotspotBatteryLife];
      [(WFHotspotDetails *)v15 setBatteryLife:v16];

      v17 = [v8 hotspotCellularProtocol];
      [(WFHotspotDetails *)v15 setCellularProtocolString:v17];

      int v18 = [v8 hotspotSignalStrength];
      [(WFHotspotDetails *)v15 setSignalStrength:v18];

      [v12 setHotspotDetails:v15];
    }
  }
  else
  {
    uint64_t v12 = [v10 dequeueReusableCellWithIdentifier:@"WFNetworkCell" forIndexPath:v9];

    v19 = [v8 title];
    [v12 setTitle:v19];

    [v12 setSubtitle:0];
    objc_msgSend(v12, "setPersonalHotspot:", objc_msgSend(v8, "iOSHotspot"));
    objc_msgSend(v12, "setSecure:", objc_msgSend(v8, "isSecure"));
    [v8 scaledRSSI];
    [v12 setBars:WFSignalBarsFromScaledRSSI(v20)];
    objc_msgSend(v12, "setLayoutMargins:", 0.0, 0.0, 0.0, 60.0);
  }
  uint64_t v21 = [(WFPickerViewController *)self currentNetwork];
  int v22 = [v8 isEqual:v21];

  if (v22)
  {
    [(WFPickerViewController *)self currentNetworkScaledRSSI];
    [v12 setBars:WFSignalBarsFromScaledRSSI(v23)];
    [v12 setState:self->_currentNetworkState];
  }
  [v12 setAccessoryType:0];

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(WFPickerViewController *)self listDelegate];
  id v8 = [(WFPickerViewController *)self sortedNetworks];
  id v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));

  [v7 networkListViewController:self didTapRecord:v9];
  if (self->_showCurrentNetworkTop)
  {
    id v10 = [(WFPickerViewController *)self tableView];
    v11 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
    [v10 scrollToRowAtIndexPath:v11 atScrollPosition:1 animated:1];
  }
  [v12 deselectRowAtIndexPath:v6 animated:1];
}

- (WFNetworkListRecord)currentNetwork
{
  return (WFNetworkListRecord *)objc_getProperty(self, a2, 984, 1);
}

- (int64_t)currentNetworkState
{
  return self->_currentNetworkState;
}

- (float)currentNetworkScaledRSSI
{
  return self->_currentNetworkScaledRSSI;
}

- (BOOL)showOtherNetwork
{
  return self->showOtherNetwork;
}

- (int64_t)deviceCapability
{
  return self->_deviceCapability;
}

- (void)setDeviceCapability:(int64_t)a3
{
  self->_deviceCapability = a3;
}

- (BOOL)dismissed
{
  return self->_dismissed;
}

- (void)setDismissed:(BOOL)a3
{
  self->_dismissed = a3;
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  return (UITableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (NSArray)sortedNetworks
{
  return self->_sortedNetworks;
}

- (void)setSortedNetworks:(id)a3
{
}

- (WFNetworkListDelegate)listDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listDelegate);
  return (WFNetworkListDelegate *)WeakRetained;
}

- (void)setListDelegate:(id)a3
{
}

- (BOOL)showCurrentNetworkTop
{
  return self->_showCurrentNetworkTop;
}

- (void)setShowCurrentNetworkTop:(BOOL)a3
{
  self->_BOOL showCurrentNetworkTop = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listDelegate);
  objc_storeStrong((id *)&self->_sortedNetworks, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_currentNetwork, 0);
}

@end