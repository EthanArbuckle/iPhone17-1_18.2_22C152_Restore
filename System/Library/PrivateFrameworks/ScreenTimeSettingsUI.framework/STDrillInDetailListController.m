@interface STDrillInDetailListController
- (BOOL)canBeShownFromSuspendedState;
- (STAllowanceProgressGroupSpecifierProvider)allowanceProgressGroupSpecifierProvider;
- (STCategoryDetailsGroupSpecifierProvider)categoryDetailsGroupSpecifierProvider;
- (STDrillInDetailListController)initWithUsageItem:(id)a3 coordinator:(id)a4;
- (STDrillInItemInfoGroupSpecifierProvider)drillInItemInfoGroupSpecifierProvider;
- (STDrillInUsageGroupSpecifierProvider)screenTimeGroupSpecifierProvider;
- (STUsageItem)usageItem;
- (void)_didFetchAppInfo:(id)a3;
- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidLoad;
@end

@implementation STDrillInDetailListController

- (STDrillInDetailListController)initWithUsageItem:(id)a3 coordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)STDrillInDetailListController;
  v9 = [(STPINListViewController *)&v33 initWithRootViewModelCoordinator:v8];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_usageItem, a3);
    v11 = [[STDrillInUsageGroupSpecifierProvider alloc] initWithUsageItem:v7 coordinator:v8];
    screenTimeGroupSpecifierProvider = v10->_screenTimeGroupSpecifierProvider;
    v10->_screenTimeGroupSpecifierProvider = v11;

    v13 = [v7 budgetItemIdentifier];
    switch([v7 itemType])
    {
      case 2:
      case 6:
        v14 = [[STDrillInItemInfoGroupSpecifierProvider alloc] initWithUsageItem:v7];
        drillInItemInfoGroupSpecifierProvider = v10->_drillInItemInfoGroupSpecifierProvider;
        v10->_drillInItemInfoGroupSpecifierProvider = v14;

        goto LABEL_4;
      case 3:
        v17 = [[STCategoryDetailsGroupSpecifierProvider alloc] initWithCategoryUsageItem:v7 coordinator:v8];
        uint64_t v18 = 1440;
        goto LABEL_7;
      case 4:
        v17 = [[STDrillInItemInfoGroupSpecifierProvider alloc] initWithUsageItem:v7];
        uint64_t v18 = 1432;
LABEL_7:
        v16 = *(Class *)((char *)&v10->super.super.super.super.super.super.super.isa + v18);
        *(Class *)((char *)&v10->super.super.super.super.super.super.super.isa + v18) = (Class)v17;
        goto LABEL_8;
      case 5:
LABEL_4:
        v16 = [MEMORY[0x263F670A8] sharedCache];
        [v16 addObserver:v10 selector:sel__didFetchAppInfo_ bundleIdentifier:v13];
LABEL_8:

        break;
      default:
        break;
    }
    v19 = [MEMORY[0x263F318B0] systemUnblockableBundleIdentifiersForDeviceFamily:102];
    v20 = v19;
    if (v19) {
      id v21 = v19;
    }
    else {
      id v21 = (id)objc_opt_new();
    }
    v22 = v21;

    int v23 = [v22 containsObject:v13];
    v24 = [v7 categoryIdentifier];
    v25 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithObjects:", v13, 0);
    v26 = v25;
    if (v24) {
      [v25 addObject:v24];
    }
    v27 = [STAllowanceProgressGroupSpecifierProvider alloc];
    if (v23) {
      id v28 = 0;
    }
    else {
      id v28 = v7;
    }
    uint64_t v29 = [(STAllowanceProgressGroupSpecifierProvider *)v27 initWithBudgetedIdentifiers:v26 usageItem:v28];
    allowanceProgressGroupSpecifierProvider = v10->_allowanceProgressGroupSpecifierProvider;
    v10->_allowanceProgressGroupSpecifierProvider = (STAllowanceProgressGroupSpecifierProvider *)v29;

    [(STAllowanceProgressGroupSpecifierProvider *)v10->_allowanceProgressGroupSpecifierProvider setCoordinator:v8];
    v31 = [v7 displayName];
    [(STDrillInDetailListController *)v10 setTitle:v31];
  }
  return v10;
}

- (BOOL)canBeShownFromSuspendedState
{
  v2 = [(STPINListViewController *)self coordinator];
  char v3 = [v2 isPasscodeEnabled] ^ 1;

  return v3;
}

- (void)viewDidLoad
{
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  v4 = [(STDrillInDetailListController *)self screenTimeGroupSpecifierProvider];
  v5 = objc_msgSend(v3, "initWithObjects:", v4, 0);

  v6 = [(STDrillInDetailListController *)self drillInItemInfoGroupSpecifierProvider];
  if (v6) {
    [v5 addObject:v6];
  }
  id v7 = [(STDrillInDetailListController *)self categoryDetailsGroupSpecifierProvider];
  if (v7) {
    [v5 addObject:v7];
  }
  id v8 = [(STDrillInDetailListController *)self allowanceProgressGroupSpecifierProvider];
  [v5 addObject:v8];

  [(STListViewController *)self setSpecifierProviders:v5];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STDrillInDetailListController.viewDidLoad", buf, 2u);
  }
  v9.receiver = self;
  v9.super_class = (Class)STDrillInDetailListController;
  [(STDrillInDetailListController *)&v9 viewDidLoad];
}

- (void)_didFetchAppInfo:(id)a3
{
  id v5 = [(STDrillInDetailListController *)self usageItem];
  v4 = [v5 displayName];
  [(STDrillInDetailListController *)self setTitle:v4];
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v17 = a4;
  id v7 = [(STListViewController *)self specifierProviders];
  id v8 = [(STDrillInDetailListController *)self drillInItemInfoGroupSpecifierProvider];
  uint64_t v9 = [v7 indexOfObject:v8];

  if (v9 == a5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [MEMORY[0x263F827E8] systemImageNamed:@"exclamationmark.triangle"];
      v11 = [MEMORY[0x263F81678] textAttachmentWithImage:v10];
      v12 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v11];
      v13 = [v17 textLabel];
      id v14 = objc_alloc(MEMORY[0x263F089B8]);
      v15 = [v13 text];
      v16 = (void *)[v14 initWithString:v15];

      [v16 insertAttributedString:v12 atIndex:0];
      [v13 setAttributedText:v16];
    }
  }
}

- (STUsageItem)usageItem
{
  return self->_usageItem;
}

- (STDrillInUsageGroupSpecifierProvider)screenTimeGroupSpecifierProvider
{
  return self->_screenTimeGroupSpecifierProvider;
}

- (STDrillInItemInfoGroupSpecifierProvider)drillInItemInfoGroupSpecifierProvider
{
  return self->_drillInItemInfoGroupSpecifierProvider;
}

- (STCategoryDetailsGroupSpecifierProvider)categoryDetailsGroupSpecifierProvider
{
  return self->_categoryDetailsGroupSpecifierProvider;
}

- (STAllowanceProgressGroupSpecifierProvider)allowanceProgressGroupSpecifierProvider
{
  return self->_allowanceProgressGroupSpecifierProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowanceProgressGroupSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_categoryDetailsGroupSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_drillInItemInfoGroupSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_screenTimeGroupSpecifierProvider, 0);

  objc_storeStrong((id *)&self->_usageItem, 0);
}

@end