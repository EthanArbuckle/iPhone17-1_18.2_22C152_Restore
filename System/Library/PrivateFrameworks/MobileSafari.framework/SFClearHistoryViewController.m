@interface SFClearHistoryViewController
- (SFClearHistoryViewController)initWithTabGroupManager:(id)a3 activeProfileIdentifier:(id)a4;
- (SFClearHistoryViewControllerDelegate)delegate;
- (id)_cellForActionItemIdentifier:(id)a3 indexPath:(id)a4;
- (id)_cellForAdditionalOptionsItemIdentifier:(id)a3 indexPath:(id)a4;
- (id)_cellForIdentifier:(id)a3 indexPath:(id)a4;
- (id)_cellForProfileItemIdentifier:(id)a3 indexPath:(id)a4;
- (id)_cellForTimeFrameItemIdentifier:(id)a3 indexPath:(id)a4;
- (id)_profileIdentifiersToBeClearedWithCurrentSelection;
- (id)dataSource:(id)a3 footerTextForSection:(int64_t)a4;
- (id)dataSource:(id)a3 headerTextForSection:(int64_t)a4;
- (void)_reloadDataAnimatingDifferences:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)submitButtonTapped:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)toggleSwitchChanged:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SFClearHistoryViewController

- (SFClearHistoryViewController)initWithTabGroupManager:(id)a3 activeProfileIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v54.receiver = self;
  v54.super_class = (Class)SFClearHistoryViewController;
  v8 = [(SFClearHistoryViewController *)&v54 initWithStyle:2];
  if (v8)
  {
    objc_initWeak(&location, v8);
    id v9 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v10 = _WBSLocalizedString();
    [v9 setText:v10];

    [v9 setAdjustsFontSizeToFitWidth:1];
    v11 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2998] weight:*MEMORY[0x1E4FB09E0]];
    [v9 setFont:v11];

    v12 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v9];
    v13 = [(SFClearHistoryViewController *)v8 navigationItem];
    [v13 setLeftBarButtonItem:v12];

    id v14 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v46 = v7;
    v15 = (void *)MEMORY[0x1E4FB13F0];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __80__SFClearHistoryViewController_initWithTabGroupManager_activeProfileIdentifier___block_invoke;
    v51[3] = &unk_1E54EA728;
    objc_copyWeak(&v52, &location);
    v16 = [v15 actionWithHandler:v51];
    v17 = (void *)[v14 initWithBarButtonSystemItem:24 primaryAction:v16];
    v18 = [(SFClearHistoryViewController *)v8 navigationItem];
    [v18 setRightBarButtonItem:v17];

    v19 = [v6 profiles];
    uint64_t v20 = [v19 copy];
    profiles = v8->_profiles;
    v8->_profiles = (NSArray *)v20;

    objc_storeStrong((id *)&v8->_activeProfileIdentifier, a4);
    if ([v6 hasMultipleProfiles]) {
      uint64_t v22 = [(NSArray *)v8->_profiles count] + 1;
    }
    else {
      uint64_t v22 = 0;
    }
    v8->_numberOfProfileRows = v22;
    v23 = [v6 tabCollection];
    v24 = [v23 allNamedTabGroupsUnsorted];
    v44 = v23;
    v8->_areTabGroupsInUse = [v24 count] != 0;

    v25 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    v26 = [v25 stringForKey:@"ClearHistoryLastSelectedTimeFrame"];

    int64_t v27 = +[SFClearHistoryUtilities clearHistoryTimeFrameItemTypeFromString:v26];
    uint64_t v28 = [MEMORY[0x1E4F28D58] indexPathForRow:v27 inSection:0];
    currentlySelectedTimeframeIndex = v8->_currentlySelectedTimeframeIndex;
    v8->_currentlySelectedTimeframeIndex = (NSIndexPath *)v28;

    if (v8->_numberOfProfileRows)
    {
      if (v8->_activeProfileIdentifier
        && (objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults", v23),
            v30 = objc_claimAutoreleasedReturnValue(),
            char v31 = [v30 BOOLForKey:@"ClearHistoryLastSelectedAllProfiles"],
            v30,
            (v31 & 1) == 0))
      {
        v33 = v8->_profiles;
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __80__SFClearHistoryViewController_initWithTabGroupManager_activeProfileIdentifier___block_invoke_2;
        v49[3] = &unk_1E54EC8B0;
        v50 = v8;
        uint64_t v34 = [(NSArray *)v33 indexOfObjectPassingTest:v49];
        if (v34 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v32 = 0;
        }
        else {
          uint64_t v32 = v34 + 1;
        }
      }
      else
      {
        uint64_t v32 = 0;
      }
      uint64_t v35 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v32, 1, v44);
      currentlySelectedProfileIndex = v8->_currentlySelectedProfileIndex;
      v8->_currentlySelectedProfileIndex = (NSIndexPath *)v35;
    }
    v37 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults", v44);
    v8->_closeAllTabsToggleEnabled = [v37 BOOLForKey:@"ClearHistoryLastEnabledCloseAllTabs"];

    v38 = [SFTableViewDiffableDataSource alloc];
    v39 = [(SFClearHistoryViewController *)v8 tableView];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __80__SFClearHistoryViewController_initWithTabGroupManager_activeProfileIdentifier___block_invoke_3;
    v47[3] = &unk_1E54EC8D8;
    objc_copyWeak(&v48, &location);
    uint64_t v40 = [(UITableViewDiffableDataSource *)v38 initWithTableView:v39 cellProvider:v47];
    dataSource = v8->_dataSource;
    v8->_dataSource = (SFTableViewDiffableDataSource *)v40;

    [(SFTableViewDiffableDataSource *)v8->_dataSource setDelegate:v8];
    id v7 = v46;
    v42 = v8;
    objc_destroyWeak(&v48);

    objc_destroyWeak(&v52);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __80__SFClearHistoryViewController_initWithTabGroupManager_activeProfileIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

uint64_t __80__SFClearHistoryViewController_initWithTabGroupManager_activeProfileIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1080);
  v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

id __80__SFClearHistoryViewController_initWithTabGroupManager_activeProfileIdentifier___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v9 = [WeakRetained _cellForIdentifier:v6 indexPath:v7];

  return v9;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)SFClearHistoryViewController;
  [(SFClearHistoryViewController *)&v4 viewDidLoad];
  v3 = [(SFClearHistoryViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"cell"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"toggleCell"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"actionCell"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFClearHistoryViewController;
  [(SFClearHistoryViewController *)&v4 viewWillAppear:a3];
  [(SFClearHistoryViewController *)self _reloadDataAnimatingDifferences:0];
}

- (void)_reloadDataAnimatingDifferences:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v5 = [(SFClearHistoryViewController *)self delegate];
  id v6 = [(SFClearHistoryViewController *)self _profileIdentifiersToBeClearedWithCurrentSelection];
  self->_cachedTabCount = [v5 clearHistoryViewController:self numberOfTabsToBeClosedForProfilesWithIdentifiers:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  [v7 appendSectionsWithIdentifiers:&unk_1EDA42850];
  [v7 appendItemsWithIdentifiers:&unk_1EDA42868];
  if (self->_numberOfProfileRows)
  {
    [v7 appendSectionsWithIdentifiers:&unk_1EDA42880];
    [v7 appendItemsWithIdentifiers:&unk_1EDA42898];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v8 = self->_profiles;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v26 + 1) + 8 * v12) identifier];
          char v31 = v13;
          id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
          [v7 appendItemsWithIdentifiers:v14];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v10);
    }
  }
  [v7 appendSectionsWithIdentifiers:&unk_1EDA428B0];
  [v7 appendItemsWithIdentifiers:&unk_1EDA428C8];
  [v7 appendSectionsWithIdentifiers:&unk_1EDA428E0];
  [v7 appendItemsWithIdentifiers:&unk_1EDA428F8];
  [(UITableViewDiffableDataSource *)self->_dataSource applySnapshot:v7 animatingDifferences:v3];
  v15 = [(SFClearHistoryViewController *)self tableView];
  [v15 reloadData];

  v16 = [(SFClearHistoryViewController *)self tableView];
  [v16 layoutIfNeeded];

  v17 = [(SFClearHistoryViewController *)self navigationController];
  v18 = [v17 sheetPresentationController];

  [v18 invalidateDetents];
  id v19 = objc_alloc_init(MEMORY[0x1E4FB1D08]);
  uint64_t v20 = [v19 defaultContentConfiguration];
  [v19 setContentConfiguration:v20];

  objc_msgSend(v19, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __64__SFClearHistoryViewController__reloadDataAnimatingDifferences___block_invoke;
  v25[3] = &unk_1E54EC900;
  v25[4] = self;
  v25[5] = v21;
  uint64_t v22 = [MEMORY[0x1E4FB1C30] customDetentWithIdentifier:0 resolver:v25];
  v30[0] = v22;
  v23 = [MEMORY[0x1E4FB1C30] largeDetent];
  v30[1] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  [v18 setDetents:v24];
}

double __64__SFClearHistoryViewController__reloadDataAnimatingDifferences___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) tableView];
  [v4 contentSize];
  double v6 = v5 + *(double *)(a1 + 40);
  [v3 maximumDetentValue];
  if (v6 >= v7)
  {
    [v3 maximumDetentValue];
    double v10 = v11;
  }
  else
  {
    v8 = [*(id *)(a1 + 32) tableView];
    [v8 contentSize];
    double v10 = v9 + *(double *)(a1 + 40);
  }
  return v10;
}

- (id)_cellForIdentifier:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[UITableViewDiffableDataSource sectionIdentifierForIndex:](self->_dataSource, "sectionIdentifierForIndex:", [v7 section]);
  uint64_t v9 = [v8 integerValue];

  switch(v9)
  {
    case 0:
      uint64_t v10 = [(SFClearHistoryViewController *)self _cellForTimeFrameItemIdentifier:v6 indexPath:v7];
      goto LABEL_7;
    case 1:
      uint64_t v10 = [(SFClearHistoryViewController *)self _cellForProfileItemIdentifier:v6 indexPath:v7];
      goto LABEL_7;
    case 2:
      uint64_t v10 = [(SFClearHistoryViewController *)self _cellForAdditionalOptionsItemIdentifier:v6 indexPath:v7];
      goto LABEL_7;
    case 3:
      uint64_t v10 = [(SFClearHistoryViewController *)self _cellForActionItemIdentifier:v6 indexPath:v7];
LABEL_7:
      uint64_t v12 = (void *)v10;
      break;
    default:
      double v11 = [(SFClearHistoryViewController *)self tableView];
      uint64_t v12 = [v11 dequeueReusableCellWithIdentifier:@"cell" forIndexPath:v7];

      break;
  }

  return v12;
}

- (id)_cellForTimeFrameItemIdentifier:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SFClearHistoryViewController *)self tableView];
  uint64_t v9 = [v8 dequeueReusableCellWithIdentifier:@"cell" forIndexPath:v6];

  uint64_t v10 = [v7 integerValue];
  switch(v10)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      double v11 = _WBSLocalizedString();
      uint64_t v12 = [v9 textLabel];
      [v12 setText:v11];

      break;
    default:
      break;
  }
  if ([v6 isEqual:self->_currentlySelectedTimeframeIndex]) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 0;
  }
  [v9 setAccessoryType:v13];

  return v9;
}

- (id)_cellForProfileItemIdentifier:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SFClearHistoryViewController *)self tableView];
  uint64_t v9 = [v8 dequeueReusableCellWithIdentifier:@"cell" forIndexPath:v6];

  if ([v6 isEqual:self->_currentlySelectedProfileIndex]) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 0;
  }
  [v9 setAccessoryType:v10];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v12 = -[NSArray objectAtIndexedSubscript:](self->_profiles, "objectAtIndexedSubscript:", [v6 row] - 1);
    uint64_t v13 = [v12 title];
    id v14 = [v9 textLabel];
    [v14 setText:v13];
  }
  else
  {
    uint64_t v12 = _WBSLocalizedString();
    uint64_t v13 = [v9 textLabel];
    [v13 setText:v12];
  }

  return v9;
}

- (id)_cellForAdditionalOptionsItemIdentifier:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  if ([a3 integerValue] == 5)
  {
    id v7 = [(SFClearHistoryViewController *)self tableView];
    v8 = [v7 dequeueReusableCellWithIdentifier:@"toggleCell" forIndexPath:v6];

    uint64_t v9 = _WBSLocalizedString();
    uint64_t v10 = [v8 textLabel];
    [v10 setText:v9];

    [v8 setSelectionStyle:0];
    id v11 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    [v11 setOn:self->_closeAllTabsToggleEnabled];
    [v11 setEnabled:self->_cachedTabCount != 0];
    [v11 setAccessibilityIdentifier:@"CloseAllTabsSwitch"];
    [v11 addTarget:self action:sel_toggleSwitchChanged_ forControlEvents:4096];
    [v8 setAccessoryView:v11];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_cellForActionItemIdentifier:(id)a3 indexPath:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([a3 integerValue] == 6)
  {
    id v7 = [(SFClearHistoryViewController *)self tableView];
    v8 = [v7 dequeueReusableCellWithIdentifier:@"actionCell" forIndexPath:v6];

    uint64_t v9 = [MEMORY[0x1E4FB14D8] borderedProminentButtonConfiguration];
    [v9 contentInsets];
    [v9 setContentInsets:v10 + 8.0];
    id v11 = [MEMORY[0x1E4FB1618] whiteColor];
    [v9 setBaseForegroundColor:v11];

    uint64_t v12 = [MEMORY[0x1E4FB1618] systemRedColor];
    [v9 setBaseBackgroundColor:v12];

    id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v14 = _WBSLocalizedString();
    uint64_t v25 = *MEMORY[0x1E4FB06F8];
    v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    v26[0] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    v17 = (void *)[v13 initWithString:v14 attributes:v16];
    [v9 setAttributedTitle:v17];

    v18 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v9 primaryAction:0];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v18 setAccessibilityIdentifier:@"ClearHistoryButton"];
    [v18 addTarget:self action:sel_submitButtonTapped_ forControlEvents:64];
    id v19 = [v8 contentView];
    [v19 addSubview:v18];

    uint64_t v20 = [MEMORY[0x1E4FB1618] clearColor];
    [v8 setBackgroundColor:v20];

    uint64_t v21 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v22 = [v8 contentView];
    v23 = objc_msgSend(v21, "safari_constraintsMatchingFrameOfView:withFrameOfView:", v18, v22);
    [v21 activateConstraints:v23];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)toggleSwitchChanged:(id)a3
{
  self->_closeAllTabsToggleEnabled = [a3 isOn];
}

- (id)_profileIdentifiersToBeClearedWithCurrentSelection
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  [v3 addObject:*MEMORY[0x1E4F980C8]];
  objc_super v4 = [(UITableViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:self->_currentlySelectedProfileIndex];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = [(NSArray *)self->_profiles objectAtIndexedSubscript:[(NSIndexPath *)self->_currentlySelectedProfileIndex row] - 1];
      id v6 = [(NSArray *)v5 identifier];
      [v3 addObject:v6];
    }
    else
    {
      if ([v4 integerValue] != 4) {
        goto LABEL_13;
      }
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      double v5 = self->_profiles;
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v5);
            }
            id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "identifier", (void)v13);
            [v3 addObject:v11];
          }
          uint64_t v8 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v8);
      }
    }
  }
LABEL_13:

  return v3;
}

- (void)submitButtonTapped:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  objc_super v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "now", a3);
  double v5 = [MEMORY[0x1E4F1C9C8] now];
  id v6 = [(UITableViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:self->_currentlySelectedTimeframeIndex];
  uint64_t v7 = [v6 integerValue];
  uint64_t v8 = +[SFClearHistoryUtilities clearHistoryTimeFrameStringFromItemType:v7];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v9 setObject:v8 forKey:@"ClearHistoryLastSelectedTimeFrame"];

  char v31 = v6;
  switch(v7)
  {
    case 0:
      uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-3600.0];
      goto LABEL_7;
    case 1:
      id v11 = (void *)MEMORY[0x1E4F1C9C8];
      uint64_t v12 = 0;
      goto LABEL_5;
    case 2:
      id v11 = (void *)MEMORY[0x1E4F1C9C8];
      uint64_t v12 = 1;
LABEL_5:
      uint64_t v10 = objc_msgSend(v11, "safari_dateOfMidnightNumberOfDaysAgo:", v12);
      goto LABEL_7;
    case 3:
      uint64_t v10 = [MEMORY[0x1E4F1C9C8] distantPast];
LABEL_7:
      long long v13 = (void *)v10;

      objc_super v4 = v13;
      break;
    default:
      break;
  }
  id v14 = (id)*MEMORY[0x1E4F980C8];
  long long v15 = [(UITableViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:self->_currentlySelectedProfileIndex];
  if (!v15)
  {
    v30 = v5;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = v5;
    long long v16 = [(NSArray *)self->_profiles objectAtIndexedSubscript:[(NSIndexPath *)self->_currentlySelectedProfileIndex row] - 1];
    uint64_t v17 = [v16 identifier];

    id v14 = (id)v17;
LABEL_12:
    long long v29 = v8;
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    id v19 = [NSNumber numberWithBool:0];
    [v18 setObject:v19 forKey:@"ClearHistoryLastSelectedAllProfiles"];

    uint64_t v20 = [NSString stringWithFormat:@"profile: %@", v15];
    goto LABEL_13;
  }
  if ([v15 integerValue] != 4) {
    goto LABEL_19;
  }
  long long v29 = v8;
  v30 = v5;
  BOOL v26 = [(NSArray *)self->_profiles count] > 1;
  long long v27 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  long long v28 = [NSNumber numberWithBool:v26];
  [v27 setObject:v28 forKey:@"ClearHistoryLastSelectedAllProfiles"];

  uint64_t v20 = @"All profiles";
LABEL_13:
  uint64_t v21 = WBS_LOG_CHANNEL_PREFIXProfiles();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    if (self->_closeAllTabsToggleEnabled) {
      uint64_t v22 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v22 = MEMORY[0x1E4F1CC28];
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v33 = v20;
    __int16 v34 = 2112;
    uint64_t v35 = v22;
    _os_log_impl(&dword_18C354000, v21, OS_LOG_TYPE_INFO, "Clearing history for %@; closeAllTabs: %@", buf, 0x16u);
  }
  v23 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  v24 = [NSNumber numberWithBool:self->_closeAllTabsToggleEnabled];
  [v23 setObject:v24 forKey:@"ClearHistoryLastEnabledCloseAllTabs"];

  uint64_t v25 = [(SFClearHistoryViewController *)self delegate];
  double v5 = v30;
  objc_msgSend(v25, "clearHistoryViewController:clearHistoryVisitsAddedAfterDate:beforeDate:profileIdentifier:clearAllProfiles:closeAllTabs:", self, v4);

  [(SFClearHistoryViewController *)self dismissViewControllerAnimated:1 completion:0];
  id v6 = v31;
  uint64_t v8 = v29;
LABEL_19:
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [v13 cellForRowAtIndexPath:v6];
  uint64_t v8 = -[UITableViewDiffableDataSource sectionIdentifierForIndex:](self->_dataSource, "sectionIdentifierForIndex:", [v6 section]);
  uint64_t v9 = [v8 integerValue];
  if (v9)
  {
    if (v9 != 1) {
      goto LABEL_6;
    }
    uint64_t v10 = &OBJC_IVAR___SFClearHistoryViewController__currentlySelectedProfileIndex;
  }
  else
  {
    uint64_t v10 = &OBJC_IVAR___SFClearHistoryViewController__currentlySelectedTimeframeIndex;
  }
  id v11 = (id *)((char *)&self->super.super.super.super.isa + *v10);
  uint64_t v12 = [v13 cellForRowAtIndexPath:*v11];
  [v12 setAccessoryType:0];
  [v7 setAccessoryType:3];
  objc_storeStrong(v11, a4);

LABEL_6:
  [v13 deselectRowAtIndexPath:v6 animated:1];
}

- (id)dataSource:(id)a3 headerTextForSection:(int64_t)a4
{
  objc_super v4 = [a3 sectionIdentifierForIndex:a4];
  if ((unint64_t)[v4 integerValue] > 2)
  {
    double v5 = 0;
  }
  else
  {
    double v5 = _WBSLocalizedString();
  }

  return v5;
}

- (id)dataSource:(id)a3 footerTextForSection:(int64_t)a4
{
  double v5 = [a3 sectionIdentifierForIndex:a4];
  if ([v5 integerValue] != 2)
  {
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  unint64_t cachedTabCount = self->_cachedTabCount;
  if (self->_areTabGroupsInUse)
  {
    if (cachedTabCount)
    {
      uint64_t v7 = NSString;
LABEL_8:
      uint64_t v9 = _WBSLocalizedString();
      uint64_t v8 = objc_msgSend(v7, "localizedStringWithFormat:", v9, self->_cachedTabCount);

      goto LABEL_10;
    }
  }
  else if (cachedTabCount)
  {
    uint64_t v7 = NSString;
    goto LABEL_8;
  }
  uint64_t v8 = _WBSLocalizedString();
LABEL_10:

  return v8;
}

- (SFClearHistoryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFClearHistoryViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_currentlySelectedProfileIndex, 0);

  objc_storeStrong((id *)&self->_currentlySelectedTimeframeIndex, 0);
}

@end