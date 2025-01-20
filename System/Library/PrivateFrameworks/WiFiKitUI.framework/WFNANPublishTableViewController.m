@interface WFNANPublishTableViewController
- (BOOL)isServiceSpecificInfoHex;
- (NSOrderedSet)sections;
- (NSString)instanceName;
- (NSString)passphrase;
- (NSString)portNumber;
- (NSString)serviceName;
- (NSString)serviceSpecificInfo;
- (WFNANPublishTableViewController)initWithContext:(id)a3;
- (WFNANPublishTableViewDataSource)dataSource;
- (WFNANTableViewContext)context;
- (WFNetworkSettingsCellFactory)cellFactory;
- (id)_defaultSections;
- (id)_identifierForSection:(unint64_t)a3;
- (id)createTextFieldCellWithTableView:(id)a3 indexPath:(id)a4 text:(id)a5 placeholder:(id)a6 keyboardType:(int64_t)a7 textChangedHandler:(id)a8;
- (id)serviceSpecificInfoFromString;
- (int64_t)protocolType;
- (int64_t)serviceType;
- (void)_configureDataSource;
- (void)_handleAddPublisher;
- (void)_handleDataSessionsChangedNotification:(id)a3;
- (void)_handlePublishersChangedNotification:(id)a3;
- (void)clearInputFields;
- (void)dismissKeyboard;
- (void)setCellFactory:(id)a3;
- (void)setContext:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setInstanceName:(id)a3;
- (void)setIsServiceSpecificInfoHex:(BOOL)a3;
- (void)setPassphrase:(id)a3;
- (void)setPortNumber:(id)a3;
- (void)setProtocolType:(int64_t)a3;
- (void)setSections:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setServiceSpecificInfo:(id)a3;
- (void)setServiceType:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation WFNANPublishTableViewController

- (WFNANPublishTableViewController)initWithContext:(id)a3
{
  id v5 = a3;
  v6 = +[WFAppearanceProxy defaultAppearanceProxy];
  v19.receiver = self;
  v19.super_class = (Class)WFNANPublishTableViewController;
  v7 = -[WFNANPublishTableViewController initWithStyle:](&v19, sel_initWithStyle_, [v6 tableViewStyle]);

  if (v7)
  {
    v8 = (void *)MEMORY[0x263EFF9D8];
    v9 = [(WFNANPublishTableViewController *)v7 _defaultSections];
    uint64_t v10 = [v8 orderedSetWithArray:v9];
    sections = v7->_sections;
    v7->_sections = (NSOrderedSet *)v10;

    objc_storeStrong((id *)&v7->_context, a3);
    v12 = [WFNetworkSettingsCellFactory alloc];
    v13 = [(WFNANPublishTableViewController *)v7 tableView];
    uint64_t v14 = [(WFNetworkSettingsCellFactory *)v12 initWithTableView:v13];
    cellFactory = v7->_cellFactory;
    v7->_cellFactory = (WFNetworkSettingsCellFactory *)v14;

    [(WFNANPublishTableViewController *)v7 clearInputFields];
    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v7 selector:sel__handlePublishersChangedNotification_ name:@"WFNANPublishersChangedNotification" object:0];

    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v7 selector:sel__handleDataSessionsChangedNotification_ name:@"WFNANDataSessionsForPublishChangedNotification" object:0];

    [(WFInsetTableViewController *)v7 setReloadDataOnUpdateSectionContentInset:0];
  }

  return v7;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)WFNANPublishTableViewController;
  [(WFNANPublishTableViewController *)&v9 viewDidLoad];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"kWFLocNANPublish" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  [(WFNANPublishTableViewController *)self setTitle:v4];

  id v5 = (void *)MEMORY[0x263F829D0];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v5 nibWithNibName:@"WFTextFieldCell" bundle:v6];

  v8 = [(WFNANPublishTableViewController *)self tableView];
  [v8 registerNib:v7 forCellReuseIdentifier:@"kWFTextFieldCellIdentifier"];

  [(WFNANPublishTableViewController *)self _configureDataSource];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WFNANPublishTableViewController;
  [(WFNANPublishTableViewController *)&v3 viewDidDisappear:a3];
}

- (void)dismissKeyboard
{
  id v2 = [(WFNANPublishTableViewController *)self view];
  [v2 endEditing:1];
}

- (id)_defaultSections
{
  return &unk_26D912328;
}

- (id)_identifierForSection:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"WFNANPublishSection_%lu", a3);
}

- (id)createTextFieldCellWithTableView:(id)a3 indexPath:(id)a4 text:(id)a5 placeholder:(id)a6 keyboardType:(int64_t)a7 textChangedHandler:(id)a8
{
  id v13 = a8;
  id v14 = a6;
  id v15 = a5;
  v16 = [a3 dequeueReusableCellWithIdentifier:@"kWFTextFieldCellIdentifier" forIndexPath:a4];
  [v16 setHideLabel:1];
  [v16 setEditable:1];
  v17 = [v16 textField];
  [v17 setText:v15];

  v18 = [v16 textField];
  [v18 setPlaceholder:v14];

  objc_super v19 = [v16 textField];
  [v19 setKeyboardType:a7];

  [v16 setTextChangeHandler:v13];
  return v16;
}

- (void)_configureDataSource
{
  v50[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [WFNANPublishTableViewDataSource alloc];
  v4 = [(WFNANPublishTableViewController *)self tableView];
  id v5 = [(WFNANPublishTableViewController *)self context];
  v6 = [(WFNANPublishTableViewController *)self sections];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __55__WFNANPublishTableViewController__configureDataSource__block_invoke;
  v40[3] = &unk_264756140;
  v40[4] = self;
  v7 = [(WFNANPublishTableViewDataSource *)v3 initWithTableView:v4 context:v5 sections:v6 cellProvider:v40];
  [(WFNANPublishTableViewController *)self setDataSource:v7];

  id v8 = objc_alloc_init(MEMORY[0x263F82358]);
  objc_super v9 = [MEMORY[0x263EFF980] array];
  uint64_t v10 = [(WFNANPublishTableViewController *)self sections];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    unint64_t v12 = 0;
    do
    {
      id v13 = [(WFNANPublishTableViewController *)self sections];
      id v14 = [v13 objectAtIndexedSubscript:v12];
      uint64_t v15 = [v14 unsignedIntegerValue];

      v16 = [(WFNANPublishTableViewController *)self _identifierForSection:v15];
      [v9 addObject:v16];

      ++v12;
      v17 = [(WFNANPublishTableViewController *)self sections];
      unint64_t v18 = [v17 count];
    }
    while (v18 > v12);
  }
  [v8 appendSectionsWithIdentifiers:v9];
  v50[0] = @"WFNANPublishServiceNameIdentifier";
  objc_super v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:1];
  v20 = [(WFNANPublishTableViewController *)self _identifierForSection:0];
  [v8 appendItemsWithIdentifiers:v19 intoSectionWithIdentifier:v20];

  v49 = @"WFNANPublishServiceTypeIdentifier";
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
  v22 = [(WFNANPublishTableViewController *)self _identifierForSection:0];
  [v8 appendItemsWithIdentifiers:v21 intoSectionWithIdentifier:v22];

  v48 = @"WFNANPublishInstanceNameIdentifier";
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
  v24 = [(WFNANPublishTableViewController *)self _identifierForSection:0];
  [v8 appendItemsWithIdentifiers:v23 intoSectionWithIdentifier:v24];

  v47 = @"WFNANPublishServiceSpecificInfoIdentifier";
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
  v26 = [(WFNANPublishTableViewController *)self _identifierForSection:0];
  [v8 appendItemsWithIdentifiers:v25 intoSectionWithIdentifier:v26];

  v46 = @"WFNANPublishServiceSpecificInfoTypeIdentifier";
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
  v28 = [(WFNANPublishTableViewController *)self _identifierForSection:0];
  [v8 appendItemsWithIdentifiers:v27 intoSectionWithIdentifier:v28];

  v45 = @"WFNANPublishPortNumberIdentifier";
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
  v30 = [(WFNANPublishTableViewController *)self _identifierForSection:0];
  [v8 appendItemsWithIdentifiers:v29 intoSectionWithIdentifier:v30];

  v44 = @"WFNANPublishProtocolTypeIdentifier";
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
  v32 = [(WFNANPublishTableViewController *)self _identifierForSection:0];
  [v8 appendItemsWithIdentifiers:v31 intoSectionWithIdentifier:v32];

  v43 = @"WFNANPublishPassphraseIdentifier";
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
  v34 = [(WFNANPublishTableViewController *)self _identifierForSection:0];
  [v8 appendItemsWithIdentifiers:v33 intoSectionWithIdentifier:v34];

  v42 = @"WFNANPublishAddIdentifier";
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
  v36 = [(WFNANPublishTableViewController *)self _identifierForSection:0];
  [v8 appendItemsWithIdentifiers:v35 intoSectionWithIdentifier:v36];

  if ([(WFNANTableViewContext *)self->_context getPublishersCount] <= 0)
  {
    v41 = @"WFNANPublishNoPublishersIdentifier";
    [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
  }
  else
  {
    [(WFNANTableViewContext *)self->_context getPublishers];
  v37 = };
  v38 = [(WFNANPublishTableViewController *)self _identifierForSection:1];
  [v8 appendItemsWithIdentifiers:v37 intoSectionWithIdentifier:v38];

  v39 = [(WFNANPublishTableViewController *)self dataSource];
  [v39 applySnapshot:v8 animatingDifferences:1];
}

id __55__WFNANPublishTableViewController__configureDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v84 = a2;
  id v7 = a3;
  id v83 = a4;
  id v8 = [*(id *)(a1 + 32) sections];
  objc_super v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  uint64_t v10 = [v9 unsignedIntegerValue];

  objc_initWeak(location, *(id *)(a1 + 32));
  if (v10 == 1)
  {
    unint64_t v12 = [v84 dequeueReusableCellWithIdentifier:@"WFNANTableViewTextCellIdentifier"];
    if (!v12) {
      unint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:@"WFNANTableViewTextCellIdentifier"];
    }
    [v12 setSelectionStyle:0];
    if ([*(id *)(*(void *)(a1 + 32) + 1048) getPublishersCount])
    {
      uint64_t v82 = a1;
      v28 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1048), "getPublisherAtIndex:", objc_msgSend(v7, "row"));
      v29 = NSString;
      v30 = [v28 configuration];
      v31 = [v30 serviceName];
      v32 = [v28 configuration];
      v33 = [v32 serviceSpecificInfo];
      v34 = [v33 instanceName];
      v35 = [v29 stringWithFormat:@"%@ [%@]", v31, v34];
      v36 = [v12 textLabel];
      [v36 setText:v35];

      v37 = objc_msgSend(NSString, "stringWithFormat:", @"%ld sessions", objc_msgSend(*(id *)(*(void *)(v82 + 32) + 1048), "getDataSessionsCountForPublisher:", v28));
      v38 = [v12 detailTextLabel];
      [v38 setText:v37];

      [v12 setAccessoryType:1];
      [v12 setSelectionStyle:1];
    }
    else
    {
      v46 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v47 = [v46 localizedStringForKey:@"kWFLocNANNoPublishers" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v48 = [v12 textLabel];
      [v48 setText:v47];
    }
  }
  else
  {
    if (v10)
    {
      unint64_t v12 = 0;
      goto LABEL_19;
    }
    id v11 = v7;
    if (![v7 row])
    {
      v39 = *(void **)(a1 + 32);
      uint64_t v40 = v39[134];
      v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v42 = [v41 localizedStringForKey:@"kWFLocNANServiceName" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v96[0] = MEMORY[0x263EF8330];
      v96[1] = 3221225472;
      v96[2] = __55__WFNANPublishTableViewController__configureDataSource__block_invoke_2;
      v96[3] = &unk_264756118;
      v43 = &v97;
      objc_copyWeak(&v97, location);
      v44 = v39;
      id v7 = v11;
      uint64_t v45 = [v44 createTextFieldCellWithTableView:v84 indexPath:v11 text:v40 placeholder:v42 keyboardType:0 textChangedHandler:v96];
LABEL_18:
      unint64_t v12 = (void *)v45;

      objc_destroyWeak(v43);
      goto LABEL_19;
    }
    if ([v7 row] == 1)
    {
      unint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 1056) segmentedCellAtIndexPath:v7];
      id v13 = [v12 segmentedControl];
      [v13 removeAllSegments];

      id v14 = [v12 segmentedControl];
      uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v16 = [v15 localizedStringForKey:@"kWFLocNANServiceTypeAdaptive" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      [v14 insertSegmentWithTitle:v16 atIndex:0 animated:1];

      v17 = [v12 segmentedControl];
      unint64_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      objc_super v19 = [v18 localizedStringForKey:@"kWFLocNANServiceTypeRealtime" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      [v17 insertSegmentWithTitle:v19 atIndex:1 animated:1];

      v20 = [v12 segmentedControl];
      v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v22 = [v21 localizedStringForKey:@"kWFLocNANServiceTypeLowLatency" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      [v20 insertSegmentWithTitle:v22 atIndex:2 animated:1];

      v95[0] = MEMORY[0x263EF8330];
      v95[1] = 3221225472;
      v95[2] = __55__WFNANPublishTableViewController__configureDataSource__block_invoke_3;
      v95[3] = &unk_264756DD8;
      v95[4] = *(void *)(a1 + 32);
      [v12 setHandler:v95];
      v23 = [v12 segmentedControl];
      [v23 setSelectedSegmentIndex:0];

      v24 = [MEMORY[0x263F825C8] systemBackgroundColor];
      v25 = [v12 segmentedControl];
      [v25 setBackgroundColor:v24];

      v26 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
      v27 = [v12 contentView];
      [v27 setBackgroundColor:v26];
LABEL_6:

      goto LABEL_19;
    }
    if ([v7 row] == 2)
    {
      v49 = *(void **)(a1 + 32);
      uint64_t v50 = v49[136];
      v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v42 = [v41 localizedStringForKey:@"kWFLocNANInstanceName" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v93[0] = MEMORY[0x263EF8330];
      v93[1] = 3221225472;
      v93[2] = __55__WFNANPublishTableViewController__configureDataSource__block_invoke_4;
      v93[3] = &unk_264756118;
      v43 = &v94;
      objc_copyWeak(&v94, location);
      v51 = v49;
      id v7 = v11;
      uint64_t v45 = [v51 createTextFieldCellWithTableView:v84 indexPath:v11 text:v50 placeholder:v42 keyboardType:0 textChangedHandler:v93];
      goto LABEL_18;
    }
    if ([v7 row] == 3)
    {
      v52 = *(void **)(a1 + 32);
      uint64_t v53 = v52[137];
      v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v42 = [v41 localizedStringForKey:@"kWFLocNANServiceSpecificInfo" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v91[0] = MEMORY[0x263EF8330];
      v91[1] = 3221225472;
      v91[2] = __55__WFNANPublishTableViewController__configureDataSource__block_invoke_5;
      v91[3] = &unk_264756118;
      v43 = &v92;
      objc_copyWeak(&v92, location);
      v54 = v52;
      id v7 = v11;
      uint64_t v45 = [v54 createTextFieldCellWithTableView:v84 indexPath:v11 text:v53 placeholder:v42 keyboardType:0 textChangedHandler:v91];
      goto LABEL_18;
    }
    if ([v7 row] == 4)
    {
      unint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 1056) segmentedCellAtIndexPath:v7];
      v56 = [v12 segmentedControl];
      [v56 removeAllSegments];

      v57 = [v12 segmentedControl];
      [v57 insertSegmentWithTitle:@"Hex" atIndex:0 animated:1];

      v58 = [v12 segmentedControl];
      [v58 insertSegmentWithTitle:@"ASCII" atIndex:1 animated:1];

      v90[0] = MEMORY[0x263EF8330];
      v90[1] = 3221225472;
      v90[2] = __55__WFNANPublishTableViewController__configureDataSource__block_invoke_6;
      v90[3] = &unk_264756DD8;
      v90[4] = *(void *)(a1 + 32);
      [v12 setHandler:v90];
      v59 = [v12 segmentedControl];
      [v59 setSelectedSegmentIndex:0];

      v60 = [MEMORY[0x263F825C8] systemBackgroundColor];
      v61 = [v12 segmentedControl];
      [v61 setBackgroundColor:v60];

      v26 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
      v27 = [v12 contentView];
      [v27 setBackgroundColor:v26];
      goto LABEL_6;
    }
    if ([v7 row] == 5)
    {
      v62 = *(void **)(a1 + 32);
      uint64_t v63 = v62[138];
      v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v42 = [v41 localizedStringForKey:@"kWFLocNANPortNumber" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v88[0] = MEMORY[0x263EF8330];
      v88[1] = 3221225472;
      v88[2] = __55__WFNANPublishTableViewController__configureDataSource__block_invoke_7;
      v88[3] = &unk_264756118;
      v43 = &v89;
      objc_copyWeak(&v89, location);
      v64 = v62;
      id v7 = v11;
      uint64_t v45 = [v64 createTextFieldCellWithTableView:v84 indexPath:v11 text:v63 placeholder:v42 keyboardType:4 textChangedHandler:v88];
      goto LABEL_18;
    }
    if ([v7 row] == 6)
    {
      unint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 1056) segmentedCellAtIndexPath:v7];
      v65 = [v12 segmentedControl];
      [v65 removeAllSegments];

      v66 = [v12 segmentedControl];
      v67 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v68 = [v67 localizedStringForKey:@"kWFLocNANProtocolTypeTCP" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      [v66 insertSegmentWithTitle:v68 atIndex:0 animated:1];

      v69 = [v12 segmentedControl];
      v70 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v71 = [v70 localizedStringForKey:@"kWFLocNANProtocolTypeUDP" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      [v69 insertSegmentWithTitle:v71 atIndex:1 animated:1];

      v87[0] = MEMORY[0x263EF8330];
      v87[1] = 3221225472;
      v87[2] = __55__WFNANPublishTableViewController__configureDataSource__block_invoke_8;
      v87[3] = &unk_264756DD8;
      v87[4] = *(void *)(a1 + 32);
      [v12 setHandler:v87];
      v72 = [v12 segmentedControl];
      [v72 setSelectedSegmentIndex:0];

      v73 = [MEMORY[0x263F825C8] systemBackgroundColor];
      v74 = [v12 segmentedControl];
      [v74 setBackgroundColor:v73];

      v26 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
      v27 = [v12 contentView];
      [v27 setBackgroundColor:v26];
      goto LABEL_6;
    }
    if ([v7 row] == 7)
    {
      v75 = *(void **)(a1 + 32);
      uint64_t v76 = v75[140];
      v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v42 = [v41 localizedStringForKey:@"kWFLocNANPassphrase" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v85[0] = MEMORY[0x263EF8330];
      v85[1] = 3221225472;
      v85[2] = __55__WFNANPublishTableViewController__configureDataSource__block_invoke_9;
      v85[3] = &unk_264756118;
      v43 = &v86;
      objc_copyWeak(&v86, location);
      v77 = v75;
      id v7 = v11;
      uint64_t v45 = [v77 createTextFieldCellWithTableView:v84 indexPath:v11 text:v76 placeholder:v42 keyboardType:0 textChangedHandler:v85];
      goto LABEL_18;
    }
    if ([v7 row] == 8)
    {
      unint64_t v12 = [v84 dequeueReusableCellWithIdentifier:@"WFNANTableViewTextCellIdentifier"];
      if (!v12) {
        unint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:@"WFNANTableViewTextCellIdentifier"];
      }
      [v12 setSelectionStyle:0];
      v78 = [MEMORY[0x263F824E8] buttonWithType:1];
      [v78 setTitle:@"Add" forState:0];
      v79 = [v12 textLabel];
      v80 = [v79 font];
      v81 = [v78 titleLabel];
      [v81 setFont:v80];

      [v78 sizeToFit];
      [v78 addTarget:*(void *)(a1 + 32) action:sel__handleAddPublisher forControlEvents:64];
      [v12 setAccessoryView:v78];
    }
    else
    {
      unint64_t v12 = 0;
    }
  }
LABEL_19:
  objc_destroyWeak(location);

  return v12;
}

void __55__WFNANPublishTableViewController__configureDataSource__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setServiceName:v3];
}

uint64_t __55__WFNANPublishTableViewController__configureDataSource__block_invoke_3(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(result + 32) + 1080) = a2;
  return result;
}

void __55__WFNANPublishTableViewController__configureDataSource__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setInstanceName:v3];
}

void __55__WFNANPublishTableViewController__configureDataSource__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setServiceSpecificInfo:v3];
}

uint64_t __55__WFNANPublishTableViewController__configureDataSource__block_invoke_6(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(result + 32) + 1032) = a2 == 0;
  return result;
}

void __55__WFNANPublishTableViewController__configureDataSource__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setPortNumber:v3];
}

uint64_t __55__WFNANPublishTableViewController__configureDataSource__block_invoke_8(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(result + 32) + 1112) = a2;
  return result;
}

void __55__WFNANPublishTableViewController__configureDataSource__block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setPassphrase:v3];
}

- (void)_handlePublishersChangedNotification:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFNANPublishTableViewController *)self dataSource];
  v6 = [v5 snapshot];

  id v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"WFNANTableViewContextChangedPublisherKey"];

  objc_super v9 = [v4 userInfo];

  uint64_t v10 = [v9 objectForKeyedSubscript:@"WFNANTableViewContextChangedOperationTypeKey"];

  if (v10) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    uint64_t v12 = [v10 unsignedIntegerValue];
    if (v12 == 1)
    {
      v21 = v8;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
      [v6 deleteItemsWithIdentifiers:v17];

      if (![(WFNANTableViewContext *)self->_context getPublishersCount])
      {
        v20 = @"WFNANPublishNoPublishersIdentifier";
        v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
        unint64_t v18 = [(WFNANPublishTableViewController *)self _identifierForSection:1];
        [v6 appendItemsWithIdentifiers:v16 intoSectionWithIdentifier:v18];

LABEL_12:
      }
    }
    else if (!v12)
    {
      v24[0] = v8;
      id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
      id v14 = [(WFNANPublishTableViewController *)self _identifierForSection:1];
      [v6 appendItemsWithIdentifiers:v13 intoSectionWithIdentifier:v14];

      if ([(WFNANTableViewContext *)self->_context getPublishersCount] == 1)
      {
        v23 = @"WFNANPublishNoPublishersIdentifier";
        uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
        [v6 deleteItemsWithIdentifiers:v15];
      }
      [(WFNANPublishTableViewController *)self clearInputFields];
      v22[0] = @"WFNANPublishServiceNameIdentifier";
      v22[1] = @"WFNANPublishServiceTypeIdentifier";
      v22[2] = @"WFNANPublishInstanceNameIdentifier";
      v22[3] = @"WFNANPublishServiceSpecificInfoIdentifier";
      v22[4] = @"WFNANPublishServiceSpecificInfoTypeIdentifier";
      v22[5] = @"WFNANPublishPortNumberIdentifier";
      v22[6] = @"WFNANPublishProtocolTypeIdentifier";
      v22[7] = @"WFNANPublishPassphraseIdentifier";
      v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:8];
      [v6 reconfigureItemsWithIdentifiers:v16];
      goto LABEL_12;
    }
    objc_super v19 = [(WFNANPublishTableViewController *)self dataSource];
    [v19 applySnapshot:v6 animatingDifferences:1];
  }
}

- (void)_handleDataSessionsChangedNotification:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFNANPublishTableViewController *)self dataSource];
  v6 = [v5 snapshot];

  id v7 = [v4 userInfo];

  id v8 = [v7 objectForKeyedSubscript:@"WFNANTableViewContextChangedPublisherKey"];

  if (v8)
  {
    v11[0] = v8;
    objc_super v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    [v6 reconfigureItemsWithIdentifiers:v9];

    uint64_t v10 = [(WFNANPublishTableViewController *)self dataSource];
    [v10 applySnapshot:v6 animatingDifferences:1];
  }
}

- (void)clearInputFields
{
  serviceName = self->_serviceName;
  self->_serviceName = (NSString *)&stru_26D8F6070;

  self->_serviceType = 0;
  instanceName = self->_instanceName;
  self->_instanceName = (NSString *)&stru_26D8F6070;

  serviceSpecificInfo = self->_serviceSpecificInfo;
  self->_serviceSpecificInfo = (NSString *)&stru_26D8F6070;

  self->_isServiceSpecificInfoHex = 1;
  self->_portNumber = (NSString *)&stru_26D8F6070;
  self->_protocolType = 0;
  self->_passphrase = (NSString *)&stru_26D8F6070;
}

- (id)serviceSpecificInfoFromString
{
  if (self->_isServiceSpecificInfoHex)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF990]);
    id v4 = [(WFNANPublishTableViewController *)self serviceSpecificInfo];
    id v5 = [v4 lowercaseString];
    uint64_t v6 = [v5 UTF8String];

    id v7 = [(WFNANPublishTableViewController *)self serviceSpecificInfo];
    unint64_t v8 = [v7 length];

    if (v8 >= 2)
    {
      unint64_t v9 = 0;
      uint64_t v10 = (unsigned __int8 *)(v6 + 1);
      while (1)
      {
        char v19 = 0;
        int v11 = *(v10 - 1);
        int v12 = *v10;
        if ((v11 - 48) <= 9) {
          break;
        }
        if ((v11 - 97) <= 5)
        {
          char v13 = 16 * v11 - 112;
          goto LABEL_8;
        }
        char v13 = 0;
LABEL_10:
        if ((v12 - 48) <= 9)
        {
          char v14 = v13 | (v12 - 48);
LABEL_14:
          char v19 = v14;
          goto LABEL_15;
        }
        if ((v12 - 97) <= 5)
        {
          char v14 = v13 | (v12 - 87);
          goto LABEL_14;
        }
LABEL_15:
        v10 += 2;
        [v3 appendBytes:&v19 length:1];
        ++v9;
        uint64_t v15 = [(WFNANPublishTableViewController *)self serviceSpecificInfo];
        unint64_t v16 = [v15 length];

        if (v9 >= v16 >> 1) {
          goto LABEL_18;
        }
      }
      char v13 = 16 * v11;
LABEL_8:
      char v19 = v13;
      goto LABEL_10;
    }
  }
  else
  {
    v17 = [(WFNANPublishTableViewController *)self serviceSpecificInfo];
    id v3 = [v17 dataUsingEncoding:4];
  }
LABEL_18:
  return v3;
}

- (void)_handleAddPublisher
{
  v20[1] = *MEMORY[0x263EF8340];
  passphrase = self->_passphrase;
  if (passphrase && [(NSString *)passphrase length])
  {
    id v4 = objc_alloc(MEMORY[0x263F86440]);
    v20[0] = self->_passphrase;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    uint64_t v6 = (void *)[v4 initWithPMKList:MEMORY[0x263EFFA68] passphraseList:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x263F86438]), "initWithServiceType:securityConfiguration:", -[WFNANPublishTableViewController serviceType](self, "serviceType"), v6);
  id v8 = objc_alloc(MEMORY[0x263F86448]);
  int64_t v9 = [(WFNANPublishTableViewController *)self protocolType];
  uint64_t v10 = [(WFNANPublishTableViewController *)self portNumber];
  int v11 = objc_msgSend(v8, "initWithProtocolType:servicePort:", v9, (unsigned __int16)objc_msgSend(v10, "integerValue"));

  [v7 setServiceSpecificInfo:v11];
  id v12 = objc_alloc_init(MEMORY[0x263F86450]);
  char v13 = [(WFNANPublishTableViewController *)self instanceName];
  [v12 setInstanceName:v13];

  char v14 = [(WFNANPublishTableViewController *)self serviceSpecificInfoFromString];
  [v12 setBlob:v14];

  id v15 = objc_alloc(MEMORY[0x263F86430]);
  unint64_t v16 = [(WFNANPublishTableViewController *)self serviceName];
  v17 = (void *)[v15 initWithServiceName:v16];

  [v17 setDatapathConfiguration:v7];
  [v17 setServiceSpecificInfo:v12];
  [v17 setAuthenticationType:0];
  unint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F86458]) initWithConfiguration:v17];
  [v18 setDelegate:self->_context];
  [(WFNANPublishTableViewController *)self clearInputFields];
  char v19 = [(WFNANPublishTableViewController *)self context];
  [v19 addPublisher:v18];

  [(WFNANPublishTableViewController *)self dismissKeyboard];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a4;
  id v5 = [(WFNANPublishTableViewController *)self sections];
  uint64_t v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v13, "section"));
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (v7 == 1 && [(WFNANTableViewContext *)self->_context getPublishersCount] >= 1)
  {
    id v8 = [WFNANDataSessionsTableViewController alloc];
    context = self->_context;
    uint64_t v10 = -[WFNANTableViewContext getPublisherAtIndex:](context, "getPublisherAtIndex:", [v13 row]);
    int v11 = [(WFNANDataSessionsTableViewController *)v8 initWithContext:context forPublisher:v10];

    id v12 = [(WFNANPublishTableViewController *)self navigationController];
    [v12 pushViewController:v11 animated:1];
  }
}

- (NSOrderedSet)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (WFNANTableViewContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (WFNetworkSettingsCellFactory)cellFactory
{
  return self->_cellFactory;
}

- (void)setCellFactory:(id)a3
{
}

- (WFNANPublishTableViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (NSString)instanceName
{
  return self->_instanceName;
}

- (void)setInstanceName:(id)a3
{
}

- (NSString)serviceSpecificInfo
{
  return self->_serviceSpecificInfo;
}

- (void)setServiceSpecificInfo:(id)a3
{
}

- (BOOL)isServiceSpecificInfoHex
{
  return self->_isServiceSpecificInfoHex;
}

- (void)setIsServiceSpecificInfoHex:(BOOL)a3
{
  self->_isServiceSpecificInfoHex = a3;
}

- (NSString)portNumber
{
  return self->_portNumber;
}

- (void)setPortNumber:(id)a3
{
  self->_portNumber = (NSString *)a3;
}

- (int64_t)protocolType
{
  return self->_protocolType;
}

- (void)setProtocolType:(int64_t)a3
{
  self->_protocolType = a3;
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (void)setPassphrase:(id)a3
{
  self->_passphrase = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceSpecificInfo, 0);
  objc_storeStrong((id *)&self->_instanceName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_cellFactory, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end