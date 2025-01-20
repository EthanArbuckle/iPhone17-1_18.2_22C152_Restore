@interface _UIActivityUserDefaultsViewController
- (BOOL)isPresentedModally;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BSAuditToken)hostAuditToken;
- (NSArray)activities;
- (NSArray)applicationActivityTypes;
- (NSArray)excludedActivityTypes;
- (NSArray)favoritesProxies;
- (NSArray)orderedUUIDs;
- (NSArray)suggestionProxies;
- (NSDictionary)activitiesByUUID;
- (NSDiffableDataSourceSnapshot)currentSnapshot;
- (NSMutableDictionary)favoritesByUUID;
- (NSMutableDictionary)suggestionsByUUID;
- (NSString)bundleIdentifier;
- (SFUIActivityImageProvider)activityImageProvider;
- (UIImage)placeholderImage;
- (UITableView)tableView;
- (UIVisualEffectView)backgroundView;
- (_UIActivityUserDefaults)userDefaults;
- (_UIActivityUserDefaultsDataSource)diffableDataSource;
- (_UIActivityUserDefaultsViewController)initWithActivities:(id)a3 userDefaults:(id)a4;
- (_UIActivityUserDefaultsViewController)initWithFavoritesProxies:(id)a3 suggestionProxies:(id)a4 activitiesByUUID:(id)a5 applicationActivityTypes:(id)a6 orderedUUIDs:(id)a7 excludedActivityTypes:(id)a8 activityCategory:(int64_t)a9 isPresentedModally:(BOOL)a10;
- (_UIActivityUserDefaultsViewControllerDelegate)userDefaultsDelegate;
- (id)activityForRowAtIndexPath:(id)a3;
- (id)cellForItemIdentifier:(id)a3;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)titleForSection:(int64_t)a3;
- (int64_t)activityCategory;
- (int64_t)preferredActivityCategory;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)configureSwitchForCell:(id)a3 activityProxy:(id)a4;
- (void)dismissUserDefaults;
- (void)doneEditingUserDefaults;
- (void)editUserDefaults;
- (void)scrollViewDidScroll:(id)a3;
- (void)setActivities:(id)a3;
- (void)setActivitiesByUUID:(id)a3;
- (void)setActivityCategory:(int64_t)a3;
- (void)setApplicationActivityTypes:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCurrentSnapshot:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setExcludedActivityTypes:(id)a3;
- (void)setFavoritesByUUID:(id)a3;
- (void)setFavoritesProxies:(id)a3;
- (void)setHostAuditToken:(id)a3;
- (void)setIsPresentedModally:(BOOL)a3;
- (void)setOrderedUUIDs:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setSuggestionProxies:(id)a3;
- (void)setSuggestionsByUUID:(id)a3;
- (void)setTableView:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)setUserDefaultsDelegate:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)toggleActivityHiddenForControl:(id)a3;
- (void)toggleActivityHiddenForRowAtIndexPath:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateUserDefaultsAnimated:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation _UIActivityUserDefaultsViewController

- (_UIActivityUserDefaultsViewController)initWithActivities:(id)a3 userDefaults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_UIActivityUserDefaultsViewController;
  v8 = [(_UIActivityUserDefaultsViewController *)&v19 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v10 = [v9 bundleIdentifier];
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v10;

    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v12 = (void *)getSFUIActivityImageProviderClass_softClass;
    uint64_t v24 = getSFUIActivityImageProviderClass_softClass;
    if (!getSFUIActivityImageProviderClass_softClass)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __getSFUIActivityImageProviderClass_block_invoke;
      v20[3] = &unk_1E5A216E8;
      v20[4] = &v21;
      __getSFUIActivityImageProviderClass_block_invoke((uint64_t)v20);
      v12 = (void *)v22[3];
    }
    v13 = v12;
    _Block_object_dispose(&v21, 8);
    v14 = (SFUIActivityImageProvider *)objc_alloc_init(v13);
    activityImageProvider = v8->_activityImageProvider;
    v8->_activityImageProvider = v14;

    if (v7)
    {
      uint64_t v16 = [v7 activitiesOrderedByUserActivityOrderForActivities:v6];

      id v6 = (id)v16;
    }
    [(_UIActivityUserDefaultsViewController *)v8 setActivities:v6];
    [(_UIActivityUserDefaultsViewController *)v8 setUserDefaults:v7];
    -[_UIActivityUserDefaultsViewController setPreferredContentSize:](v8, "setPreferredContentSize:", 0.0, 184.0);
    v17 = v8;
  }

  return v8;
}

- (_UIActivityUserDefaultsViewController)initWithFavoritesProxies:(id)a3 suggestionProxies:(id)a4 activitiesByUUID:(id)a5 applicationActivityTypes:(id)a6 orderedUUIDs:(id)a7 excludedActivityTypes:(id)a8 activityCategory:(int64_t)a9 isPresentedModally:(BOOL)a10
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  v22 = [(_UIActivityUserDefaultsViewController *)self initWithActivities:0 userDefaults:0];
  uint64_t v23 = v22;
  if (v22)
  {
    id v47 = v21;
    id v48 = v20;
    id v49 = v19;
    id v50 = v18;
    [(_UIActivityUserDefaultsViewController *)v22 setFavoritesProxies:v16];
    uint64_t v24 = objc_opt_new();
    [(_UIActivityUserDefaultsViewController *)v23 setFavoritesByUUID:v24];

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v25 = v16;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v56 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          v31 = [(_UIActivityUserDefaultsViewController *)v23 favoritesByUUID];
          v32 = [v30 identifier];
          [v31 setObject:v30 forKey:v32];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v55 objects:v60 count:16];
      }
      while (v27);
    }

    [(_UIActivityUserDefaultsViewController *)v23 setSuggestionProxies:v17];
    v33 = objc_opt_new();
    [(_UIActivityUserDefaultsViewController *)v23 setSuggestionsByUUID:v33];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v34 = v17;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v52 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v51 + 1) + 8 * j);
          v40 = [(_UIActivityUserDefaultsViewController *)v23 suggestionsByUUID];
          v41 = [v39 identifier];
          [v40 setObject:v39 forKey:v41];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v51 objects:v59 count:16];
      }
      while (v36);
    }

    id v18 = v50;
    [(_UIActivityUserDefaultsViewController *)v23 setActivitiesByUUID:v50];
    [(_UIActivityUserDefaultsViewController *)v23 setActivityCategory:a9];
    id v19 = v49;
    [(_UIActivityUserDefaultsViewController *)v23 setApplicationActivityTypes:v49];
    id v20 = v48;
    [(_UIActivityUserDefaultsViewController *)v23 setOrderedUUIDs:v48];
    id v21 = v47;
    [(_UIActivityUserDefaultsViewController *)v23 setExcludedActivityTypes:v47];
    [(_UIActivityUserDefaultsViewController *)v23 setIsPresentedModally:a10];
    v42 = _ShareSheetBundle();
    v43 = v42;
    if (a9 == 1) {
      v44 = @"Apps";
    }
    else {
      v44 = @"Actions";
    }
    v45 = [v42 localizedStringForKey:v44 value:v44 table:@"Localizable"];

    [(_UIActivityUserDefaultsViewController *)v23 setTitle:v45];
  }

  return v23;
}

- (void)setHostAuditToken:(id)a3
{
  v5 = (BSAuditToken *)a3;
  if (self->_hostAuditToken != v5)
  {
    objc_storeStrong((id *)&self->_hostAuditToken, a3);
    if (v5)
    {
      [(BSAuditToken *)v5 realToken];
      _ShareSheetBundleIDFromAuditToken();
      id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      bundleIdentifier = self->_bundleIdentifier;
      self->_bundleIdentifier = v6;
    }
  }
}

- (void)viewDidLoad
{
  v104.receiver = self;
  v104.super_class = (Class)_UIActivityUserDefaultsViewController;
  [(_UIActivityUserDefaultsViewController *)&v104 viewDidLoad];
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 != 6)
  {
    v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:9];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v5];
    [(_UIActivityUserDefaultsViewController *)self setBackgroundView:v6];
    id v7 = [(_UIActivityUserDefaultsViewController *)self backgroundView];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    v8 = [(_UIActivityUserDefaultsViewController *)self view];
    v9 = [(_UIActivityUserDefaultsViewController *)self backgroundView];
    [v8 addSubview:v9];
  }
  id v10 = objc_alloc(MEMORY[0x1E4FB1D00]);
  v11 = [(_UIActivityUserDefaultsViewController *)self view];
  [v11 bounds];
  v12 = objc_msgSend(v10, "initWithFrame:style:", 2);
  [(_UIActivityUserDefaultsViewController *)self setTableView:v12];

  v13 = [(_UIActivityUserDefaultsViewController *)self tableView];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  v14 = [(_UIActivityUserDefaultsViewController *)self tableView];
  [v14 setBackgroundColor:0];

  v15 = [(_UIActivityUserDefaultsViewController *)self tableView];
  [v15 setDelegate:self];

  id v16 = [(_UIActivityUserDefaultsViewController *)self view];
  id v17 = [(_UIActivityUserDefaultsViewController *)self tableView];
  [v16 addSubview:v17];

  id v18 = objc_opt_new();
  id v19 = [(_UIActivityUserDefaultsViewController *)self backgroundView];

  if (v19)
  {
    id v20 = [(_UIActivityUserDefaultsViewController *)self backgroundView];
    id v21 = [v20 leadingAnchor];
    v22 = [(_UIActivityUserDefaultsViewController *)self view];
    uint64_t v23 = [v22 leadingAnchor];
    uint64_t v24 = [v21 constraintEqualToAnchor:v23];
    [v18 addObject:v24];

    id v25 = [(_UIActivityUserDefaultsViewController *)self backgroundView];
    uint64_t v26 = [v25 trailingAnchor];
    uint64_t v27 = [(_UIActivityUserDefaultsViewController *)self view];
    uint64_t v28 = [v27 trailingAnchor];
    v29 = [v26 constraintEqualToAnchor:v28];
    [v18 addObject:v29];

    v30 = [(_UIActivityUserDefaultsViewController *)self backgroundView];
    v31 = [v30 topAnchor];
    v32 = [(_UIActivityUserDefaultsViewController *)self view];
    v33 = [v32 topAnchor];
    id v34 = [v31 constraintEqualToAnchor:v33];
    [v18 addObject:v34];

    uint64_t v35 = [(_UIActivityUserDefaultsViewController *)self backgroundView];
    uint64_t v36 = [v35 bottomAnchor];
    uint64_t v37 = [(_UIActivityUserDefaultsViewController *)self view];
    v38 = [v37 bottomAnchor];
    v39 = [v36 constraintEqualToAnchor:v38];
    [v18 addObject:v39];
  }
  v40 = [(_UIActivityUserDefaultsViewController *)self tableView];
  v41 = [v40 widthAnchor];
  v42 = [(_UIActivityUserDefaultsViewController *)self view];
  v43 = [v42 widthAnchor];
  v44 = [v41 constraintEqualToAnchor:v43];
  [v18 addObject:v44];

  v45 = [(_UIActivityUserDefaultsViewController *)self tableView];
  v46 = [v45 heightAnchor];
  id v47 = [(_UIActivityUserDefaultsViewController *)self view];
  id v48 = [v47 heightAnchor];
  id v49 = [v46 constraintEqualToAnchor:v48];
  [v18 addObject:v49];

  id v50 = [(_UIActivityUserDefaultsViewController *)self tableView];
  long long v51 = [v50 centerYAnchor];
  long long v52 = [(_UIActivityUserDefaultsViewController *)self view];
  long long v53 = [v52 centerYAnchor];
  long long v54 = [v51 constraintEqualToAnchor:v53];
  [v18 addObject:v54];

  long long v55 = [(_UIActivityUserDefaultsViewController *)self tableView];
  long long v56 = [v55 centerXAnchor];
  long long v57 = [(_UIActivityUserDefaultsViewController *)self view];
  long long v58 = [v57 centerXAnchor];
  v59 = [v56 constraintEqualToAnchor:v58];
  [v18 addObject:v59];

  [MEMORY[0x1E4F28DC8] activateConstraints:v18];
  v60 = [(_UIActivityUserDefaultsViewController *)self tableView];
  [v60 reloadData];

  double v61 = *MEMORY[0x1E4FB2F28];
  v62 = [(_UIActivityUserDefaultsViewController *)self tableView];
  [v62 setRowHeight:v61];

  v63 = [(_UIActivityUserDefaultsViewController *)self tableView];
  [v63 setEstimatedRowHeight:52.0];

  v64 = [(_UIActivityUserDefaultsViewController *)self tableView];
  [v64 setSectionHeaderHeight:v61];

  v65 = [(_UIActivityUserDefaultsViewController *)self tableView];
  [v65 setEstimatedSectionHeaderHeight:30.0];

  v66 = [MEMORY[0x1E4FB1618] clearColor];
  v67 = [(_UIActivityUserDefaultsViewController *)self view];
  [v67 setBackgroundColor:v66];

  int64_t v68 = [(_UIActivityUserDefaultsViewController *)self activityCategory];
  v69 = [(_UIActivityUserDefaultsViewController *)self tableView];
  [v69 setEditing:v68 == 0];

  v70 = [(_UIActivityUserDefaultsViewController *)self tableView];
  [v70 setBackgroundColor:0];

  v71 = objc_opt_new();
  v72 = [(_UIActivityUserDefaultsViewController *)self tableView];
  [v72 setTableFooterView:v71];

  v73 = [(_UIActivityUserDefaultsViewController *)self tableView];
  [v73 registerClass:objc_opt_class() forCellReuseIdentifier:@"userDefaultsCell"];

  id v74 = objc_alloc(MEMORY[0x1E4FB14A8]);
  if (v68)
  {
    v75 = (void *)[v74 initWithBarButtonSystemItem:2 target:self action:sel_editUserDefaults];
    v76 = [(_UIActivityUserDefaultsViewController *)self navigationItem];
    [v76 setRightBarButtonItem:v75];

    v77 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_dismissUserDefaults];
    v78 = [(_UIActivityUserDefaultsViewController *)self navigationItem];
    [v78 setLeftBarButtonItem:v77];
  }
  else
  {
    v77 = (void *)[v74 initWithBarButtonSystemItem:0 target:self action:sel_dismissUserDefaults];
    v78 = [(_UIActivityUserDefaultsViewController *)self navigationItem];
    [v78 setRightBarButtonItem:v77];
  }

  v79 = [(_UIActivityUserDefaultsViewController *)self navigationItem];
  [v79 _setManualScrollEdgeAppearanceEnabled:1];

  id v80 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v80 configureWithTransparentBackground];
  v81 = [MEMORY[0x1E4FB1618] separatorColor];
  [v80 setShadowColor:v81];

  v82 = [(_UIActivityUserDefaultsViewController *)self navigationItem];
  [v82 setScrollEdgeAppearance:v80];

  id v83 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v83 configureWithDefaultBackground];
  v84 = [MEMORY[0x1E4FB1618] separatorColor];
  [v83 setShadowColor:v84];

  v85 = [(_UIActivityUserDefaultsViewController *)self navigationItem];
  [v85 setStandardAppearance:v83];

  v86 = [(_UIActivityUserDefaultsViewController *)self navigationItem];
  [v86 _setManualScrollEdgeAppearanceProgress:1.0];

  v87 = [(_UIActivityUserDefaultsViewController *)self traitCollection];
  uint64_t v88 = [v87 layoutDirection];

  v89 = (id *)MEMORY[0x1E4F3A3E8];
  if (v88 != 1) {
    v89 = (id *)MEMORY[0x1E4F3A3C8];
  }
  id v90 = *v89;
  id location = 0;
  objc_initWeak(&location, self);
  v91 = [_UIActivityUserDefaultsDataSource alloc];
  v92 = [(_UIActivityUserDefaultsViewController *)self tableView];
  uint64_t v96 = MEMORY[0x1E4F143A8];
  uint64_t v97 = 3221225472;
  v98 = __52___UIActivityUserDefaultsViewController_viewDidLoad__block_invoke;
  v99 = &unk_1E5A21848;
  objc_copyWeak(&v102, &location);
  v100 = self;
  id v93 = v90;
  id v101 = v93;
  v94 = [(UITableViewDiffableDataSource *)v91 initWithTableView:v92 cellProvider:&v96];
  -[_UIActivityUserDefaultsViewController setDiffableDataSource:](self, "setDiffableDataSource:", v94, v96, v97, v98, v99, v100);

  v95 = [(_UIActivityUserDefaultsViewController *)self diffableDataSource];
  [v95 setDataSourceProxy:self];

  [(_UIActivityUserDefaultsViewController *)self updateUserDefaultsAnimated:0];
  objc_destroyWeak(&v102);
  objc_destroyWeak(&location);
}

- (void)updateUserDefaultsAnimated:(BOOL)a3
{
  BOOL v57 = a3;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  v5 = [(_UIActivityUserDefaultsViewController *)self bundleIdentifier];
  long long v55 = v5;
  if ([v5 isEqualToString:@"com.apple.mobilesafari"]) {
    int v59 = 1;
  }
  else {
    int v59 = objc_msgSend(v5, "isEqualToString:", @"com.apple.SafariViewService", v5);
  }
  int64_t v6 = [(_UIActivityUserDefaultsViewController *)self activityCategory];
  id v7 = [(_UIActivityUserDefaultsViewController *)self favoritesProxies];
  uint64_t v8 = [v7 count];

  if (v6 != 1)
  {
    if (v8)
    {
      [v4 appendSectionsWithIdentifiers:&unk_1EF3394F8];
      v15 = [(_UIActivityUserDefaultsViewController *)self favoritesProxies];
      id v16 = [v15 valueForKey:@"identifier"];
      [v4 appendItemsWithIdentifiers:v16 intoSectionWithIdentifier:@"SHARE_SHEET_EDIT_SECTION_TITLE_FAVORITES"];
    }
    [v4 appendSectionsWithIdentifiers:&unk_1EF339510];
    [v4 appendSectionsWithIdentifiers:&unk_1EF339528];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    obuint64_t j = [(_UIActivityUserDefaultsViewController *)self suggestionProxies];
    uint64_t v17 = [obj countByEnumeratingWithState:&v69 objects:v79 count:16];
    if (!v17)
    {
LABEL_41:

      goto LABEL_42;
    }
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v70;
    uint64_t v58 = *(void *)v70;
LABEL_13:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v70 != v19) {
        objc_enumerationMutation(obj);
      }
      id v21 = *(void **)(*((void *)&v69 + 1) + 8 * v20);
      v22 = [(_UIActivityUserDefaultsViewController *)self activitiesByUUID];
      uint64_t v23 = [v21 identifier];
      uint64_t v24 = [v22 objectForKeyedSubscript:v23];

      id v25 = [(_UIActivityUserDefaultsViewController *)self excludedActivityTypes];
      uint64_t v26 = [v24 activityType];
      char v27 = [v25 containsObject:v26];

      if (v27) {
        goto LABEL_39;
      }
      if (v59
        && ([v24 activityType],
            uint64_t v28 = objc_claimAutoreleasedReturnValue(),
            int v29 = [v28 isEqualToString:@"com.apple.UIKit.activity.AddToReadingList"],
            v28,
            v29))
      {
        v30 = [v21 identifier];
        v78 = v30;
        v31 = (void *)MEMORY[0x1E4F1C978];
        v32 = &v78;
      }
      else
      {
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        v33 = +[_UIActivityHelper builtinActivityClasses];
        uint64_t v34 = [v33 countByEnumeratingWithState:&v65 objects:v77 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v66;
          while (2)
          {
            for (uint64_t i = 0; i != v35; ++i)
            {
              if (*(void *)v66 != v36) {
                objc_enumerationMutation(v33);
              }
              if (objc_opt_isKindOfClass())
              {
                int v38 = 0;
                goto LABEL_30;
              }
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v65 objects:v77 count:16];
            if (v35) {
              continue;
            }
            break;
          }
          int v38 = 1;
LABEL_30:
          uint64_t v19 = v58;
        }
        else
        {
          int v38 = 1;
        }

        if (!v24) {
          goto LABEL_37;
        }
        v39 = [(_UIActivityUserDefaultsViewController *)self applicationActivityTypes];
        v40 = [v24 activityType];
        int v41 = v38 & [v39 containsObject:v40];

        BOOL v42 = v41 == 1;
        uint64_t v19 = v58;
        if (!v42)
        {
LABEL_37:
          v30 = [v21 identifier];
          v75 = v30;
          v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
          v44 = v4;
          v45 = v43;
          v46 = @"SHARE_SHEET_EDIT_SECTION_TITLE_OTHER";
          goto LABEL_38;
        }
        v30 = [v21 identifier];
        v76 = v30;
        v31 = (void *)MEMORY[0x1E4F1C978];
        v32 = &v76;
      }
      v43 = [v31 arrayWithObjects:v32 count:1];
      v44 = v4;
      v45 = v43;
      v46 = @"App Actions";
LABEL_38:
      [v44 appendItemsWithIdentifiers:v45 intoSectionWithIdentifier:v46];

LABEL_39:
      if (++v20 == v18)
      {
        uint64_t v18 = [obj countByEnumeratingWithState:&v69 objects:v79 count:16];
        if (!v18) {
          goto LABEL_41;
        }
        goto LABEL_13;
      }
    }
  }
  if (v8)
  {
    [v4 appendSectionsWithIdentifiers:&unk_1EF3394C8];
    v9 = [(_UIActivityUserDefaultsViewController *)self favoritesProxies];
    id v10 = [v9 valueForKey:@"identifier"];
    [v4 appendItemsWithIdentifiers:v10 intoSectionWithIdentifier:@"SHARE_SHEET_EDIT_SECTION_TITLE_FAVORITES"];
  }
  v11 = [(_UIActivityUserDefaultsViewController *)self suggestionProxies];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    [v4 appendSectionsWithIdentifiers:&unk_1EF3394E0];
    v13 = [(_UIActivityUserDefaultsViewController *)self suggestionProxies];
    v14 = [v13 valueForKey:@"identifier"];
    [v4 appendItemsWithIdentifiers:v14 intoSectionWithIdentifier:@"SHARE_SHEET_EDIT_SECTION_TITLE_SUGGESTIONS"];
  }
LABEL_42:
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v47 = [v4 sectionIdentifiers];
  uint64_t v48 = [v47 countByEnumeratingWithState:&v61 objects:v74 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v49; ++j)
      {
        if (*(void *)v62 != v50) {
          objc_enumerationMutation(v47);
        }
        uint64_t v52 = *(void *)(*((void *)&v61 + 1) + 8 * j);
        if (![v4 numberOfItemsInSection:v52])
        {
          uint64_t v73 = v52;
          long long v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
          [v4 deleteSectionsWithIdentifiers:v53];
        }
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v61 objects:v74 count:16];
    }
    while (v49);
  }

  [(_UIActivityUserDefaultsViewController *)self setCurrentSnapshot:v4];
  long long v54 = [(_UIActivityUserDefaultsViewController *)self diffableDataSource];
  [v54 applySnapshot:v4 animatingDifferences:v57];
}

- (void)configureSwitchForCell:(id)a3 activityProxy:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(_UIActivityUserDefaultsViewController *)self favoritesByUUID];
  uint64_t v8 = [v6 identifier];
  v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    [v13 setEditingAccessoryView:0];
  }
  else
  {
    int v10 = [v6 canHide];
    v11 = [v13 editingAccessoryView];
    if (!v11 && v10)
    {
      id v12 = objc_alloc(MEMORY[0x1E4FB1CD0]);
      v11 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [v11 addTarget:self action:sel_toggleActivityHiddenForControl_ forControlEvents:4096];
      [v13 setEditingAccessoryView:v11];
    }
    if ((v10 & 1) == 0) {
      [v13 setEditingAccessoryView:0];
    }
    objc_msgSend(v11, "setOn:", objc_msgSend(v6, "isHidden") ^ 1);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIActivityUserDefaultsViewController;
  [(_UIActivityUserDefaultsViewController *)&v5 traitCollectionDidChange:a3];
  id v4 = [(_UIActivityUserDefaultsViewController *)self tableView];
  [v4 reloadData];
}

- (void)editUserDefaults
{
  v3 = [(_UIActivityUserDefaultsViewController *)self tableView];
  [v3 setEditing:1 animated:1];

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_doneEditingUserDefaults];
  objc_super v5 = [(_UIActivityUserDefaultsViewController *)self navigationItem];
  [v5 setRightBarButtonItem:v4];

  id v6 = [(_UIActivityUserDefaultsViewController *)self navigationItem];
  [v6 setLeftBarButtonItem:0];
}

- (void)doneEditingUserDefaults
{
  v3 = [(_UIActivityUserDefaultsViewController *)self tableView];
  [v3 setEditing:0 animated:1];

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:2 target:self action:sel_editUserDefaults];
  objc_super v5 = [(_UIActivityUserDefaultsViewController *)self navigationItem];
  [v5 setRightBarButtonItem:v4];

  id v7 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_dismissUserDefaults];
  id v6 = [(_UIActivityUserDefaultsViewController *)self navigationItem];
  [v6 setLeftBarButtonItem:v7];
}

- (void)dismissUserDefaults
{
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v10 = [a3 cellForRowAtIndexPath:v6];
  id v7 = [(_UIActivityUserDefaultsViewController *)self userDefaultsDelegate];
  uint64_t v8 = [(_UIActivityUserDefaultsViewController *)self diffableDataSource];
  v9 = [v8 itemIdentifierForIndexPath:v6];

  objc_msgSend(v7, "userDefaultsViewController:didSelectActivityWithIdentifier:activityCategory:disabled:", self, v9, -[_UIActivityUserDefaultsViewController activityCategory](self, "activityCategory"), objc_msgSend(v10, "isDisabled"));
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4 = [(_UIActivityUserDefaultsViewController *)self titleForSection:a4];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v5 setNumberOfLines:0];
  id v6 = (void *)MEMORY[0x1E4FB1798];
  uint64_t v7 = *MEMORY[0x1E4FB2998];
  uint64_t v8 = [MEMORY[0x1E4FB17A0] defaultFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2998] addingSymbolicTraits:2 options:0];
  v9 = [v6 fontWithDescriptor:v8 size:0.0];

  id v10 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:v7];
  v11 = [v10 scaledFontForFont:v9];
  [v5 setFont:v11];

  [v5 setText:v4];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v12 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v12 addSubview:v5];
  id v13 = objc_opt_new();
  v14 = [v5 leadingAnchor];
  v15 = [v12 layoutMarginsGuide];
  id v16 = [v15 leadingAnchor];
  uint64_t v17 = [v14 constraintEqualToAnchor:v16];
  [v13 addObject:v17];

  uint64_t v18 = [v5 trailingAnchor];
  uint64_t v19 = [v12 layoutMarginsGuide];
  uint64_t v20 = [v19 trailingAnchor];
  id v21 = [v18 constraintEqualToAnchor:v20];
  [v13 addObject:v21];

  v22 = [v5 topAnchor];
  uint64_t v23 = [v12 topAnchor];
  uint64_t v24 = [v22 constraintEqualToAnchor:v23 constant:26.0];
  [v13 addObject:v24];

  id v25 = [v5 bottomAnchor];
  uint64_t v26 = [v12 bottomAnchor];
  char v27 = [v25 constraintEqualToAnchor:v26 constant:-8.0];
  [v13 addObject:v27];

  [MEMORY[0x1E4F28DC8] activateConstraints:v13];
  return v12;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 section];
  if (v9 != [v8 section])
  {
    id v12 = v7;
    goto LABEL_5;
  }
  id v10 = [(_UIActivityUserDefaultsViewController *)self favoritesProxies];
  v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));

  if ([v11 canMove])
  {

    id v12 = v8;
LABEL_5:
    id v13 = v12;
    goto LABEL_7;
  }
  id v13 = v7;

LABEL_7:
  return v13;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [(_UIActivityUserDefaultsViewController *)self favoritesProxies];
  id v15 = (id)[v9 mutableCopy];

  id v10 = [(_UIActivityUserDefaultsViewController *)self favoritesProxies];
  v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));

  uint64_t v12 = [v8 row];
  [v15 removeObjectAtIndex:v12];
  uint64_t v13 = [v7 row];

  [v15 insertObject:v11 atIndex:v13];
  [(_UIActivityUserDefaultsViewController *)self setFavoritesProxies:v15];
  [(_UIActivityUserDefaultsViewController *)self updateUserDefaultsAnimated:1];
  v14 = [(_UIActivityUserDefaultsViewController *)self userDefaultsDelegate];
  objc_msgSend(v14, "userDefaultsViewController:didUpdateFavoritesProxies:activityCategory:", self, v15, -[_UIActivityUserDefaultsViewController activityCategory](self, "activityCategory"));
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (a4 == 2)
  {
    v39 = [(_UIActivityUserDefaultsViewController *)self diffableDataSource];
    v40 = [v39 itemIdentifierForIndexPath:v9];

    int v41 = [(_UIActivityUserDefaultsViewController *)self suggestionsByUUID];
    BOOL v42 = [v41 objectForKeyedSubscript:v40];

    v43 = [(_UIActivityUserDefaultsViewController *)self suggestionProxies];
    v44 = (void *)[v43 mutableCopy];

    [v44 removeObject:v42];
    [(_UIActivityUserDefaultsViewController *)self setSuggestionProxies:v44];
    v45 = [(_UIActivityUserDefaultsViewController *)self favoritesProxies];
    v46 = [v45 arrayByAddingObject:v42];
    [(_UIActivityUserDefaultsViewController *)self setFavoritesProxies:v46];

    id v47 = [(_UIActivityUserDefaultsViewController *)self suggestionsByUUID];
    uint64_t v48 = [v42 identifier];
    [v47 removeObjectForKey:v48];

    uint64_t v49 = [(_UIActivityUserDefaultsViewController *)self favoritesByUUID];
    uint64_t v50 = [v42 identifier];
    [v49 setObject:v42 forKeyedSubscript:v50];

    [(_UIActivityUserDefaultsViewController *)self updateUserDefaultsAnimated:1];
    long long v51 = [v42 identifier];
    uint64_t v52 = [(_UIActivityUserDefaultsViewController *)self cellForItemIdentifier:v51];
    [(_UIActivityUserDefaultsViewController *)self configureSwitchForCell:v52 activityProxy:v42];

    long long v53 = [(_UIActivityUserDefaultsViewController *)self userDefaultsDelegate];
    long long v54 = [v42 identifier];
    objc_msgSend(v53, "userDefaultsViewController:didFavoriteActivity:withIdentifier:activityCategory:", self, 1, v54, -[_UIActivityUserDefaultsViewController activityCategory](self, "activityCategory"));
  }
  else if (a4 == 1)
  {
    id v57 = v8;
    id v10 = [(_UIActivityUserDefaultsViewController *)self favoritesByUUID];
    v11 = [(_UIActivityUserDefaultsViewController *)self diffableDataSource];
    uint64_t v12 = [v11 itemIdentifierForIndexPath:v9];
    uint64_t v13 = [v10 objectForKeyedSubscript:v12];

    v14 = [(_UIActivityUserDefaultsViewController *)self favoritesProxies];
    id v15 = (void *)[v14 mutableCopy];

    id v56 = v9;
    objc_msgSend(v15, "removeObjectAtIndex:", objc_msgSend(v9, "row"));
    long long v55 = v15;
    [(_UIActivityUserDefaultsViewController *)self setFavoritesProxies:v15];
    id v16 = [(_UIActivityUserDefaultsViewController *)self favoritesByUUID];
    uint64_t v17 = [v13 identifier];
    [v16 removeObjectForKey:v17];

    uint64_t v18 = objc_opt_new();
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v19 = [(_UIActivityUserDefaultsViewController *)self orderedUUIDs];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v59;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v59 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v58 + 1) + 8 * v23);
          id v25 = [(_UIActivityUserDefaultsViewController *)self favoritesByUUID];
          uint64_t v26 = [v25 objectForKeyedSubscript:v24];

          if (!v26)
          {
            char v27 = [v13 identifier];
            int v28 = [v24 isEqual:v27];

            if (v28)
            {
              [v18 addObject:v13];
            }
            else
            {
              int v29 = [(_UIActivityUserDefaultsViewController *)self suggestionsByUUID];
              v30 = [v29 objectForKeyedSubscript:v24];

              if (v30)
              {
                v31 = [(_UIActivityUserDefaultsViewController *)self suggestionsByUUID];
                v32 = [v31 objectForKeyedSubscript:v24];
                [v18 addObject:v32];
              }
            }
          }
          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v58 objects:v62 count:16];
      }
      while (v21);
    }

    [(_UIActivityUserDefaultsViewController *)self setSuggestionProxies:v18];
    v33 = [(_UIActivityUserDefaultsViewController *)self suggestionsByUUID];
    uint64_t v34 = [v13 identifier];
    [v33 setObject:v13 forKeyedSubscript:v34];

    [(_UIActivityUserDefaultsViewController *)self updateUserDefaultsAnimated:1];
    uint64_t v35 = [v13 identifier];
    uint64_t v36 = [(_UIActivityUserDefaultsViewController *)self cellForItemIdentifier:v35];
    [(_UIActivityUserDefaultsViewController *)self configureSwitchForCell:v36 activityProxy:v13];

    uint64_t v37 = [(_UIActivityUserDefaultsViewController *)self userDefaultsDelegate];
    int v38 = [v13 identifier];
    objc_msgSend(v37, "userDefaultsViewController:didFavoriteActivity:withIdentifier:activityCategory:", self, 0, v38, -[_UIActivityUserDefaultsViewController activityCategory](self, "activityCategory"));

    id v9 = v56;
    id v8 = v57;
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIActivityUserDefaultsViewController *)self currentSnapshot];
  id v7 = [v6 sectionIdentifiers];
  id v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));

  if ([v8 isEqualToString:@"SHARE_SHEET_EDIT_SECTION_TITLE_FAVORITES"])
  {
    id v9 = [(_UIActivityUserDefaultsViewController *)self favoritesByUUID];
    id v10 = [(_UIActivityUserDefaultsViewController *)self diffableDataSource];
    v11 = [v10 itemIdentifierForIndexPath:v5];
    uint64_t v12 = [v9 objectForKeyedSubscript:v11];

    int64_t v13 = [v12 canEdit];
  }
  else
  {
    int64_t v13 = 2;
  }

  return v13;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIActivityUserDefaultsViewController *)self currentSnapshot];
  id v7 = [v6 sectionIdentifiers];
  id v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));

  if ([v8 isEqualToString:@"SHARE_SHEET_EDIT_SECTION_TITLE_FAVORITES"])
  {
    id v9 = [(_UIActivityUserDefaultsViewController *)self favoritesByUUID];
    id v10 = [(_UIActivityUserDefaultsViewController *)self diffableDataSource];
    v11 = [v10 itemIdentifierForIndexPath:v5];
    uint64_t v12 = [v9 objectForKeyedSubscript:v11];

    if ([v12 canEdit]) {
      char v13 = [v12 canMove];
    }
    else {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = [(_UIActivityUserDefaultsViewController *)self activityCategory] == 1;
  }

  return v13;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIActivityUserDefaultsViewController *)self activities];

  if (v6)
  {
    id v7 = [(_UIActivityUserDefaultsViewController *)self activityForRowAtIndexPath:v5];
    id v8 = [v7 activityType];
    if ([v8 isEqualToString:@"com.apple.UIKit.activity.AirDrop"])
    {
      LOBYTE(v9) = 0;
    }
    else
    {
      id v10 = [v7 activityType];
      int v9 = [v10 isEqualToString:@"com.apple.UIKit.activity.Share"] ^ 1;
    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIActivityUserDefaultsViewController *)self currentSnapshot];
  id v7 = [v6 sectionIdentifiers];
  id v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));

  if ([v8 isEqualToString:@"SHARE_SHEET_EDIT_SECTION_TITLE_FAVORITES"]
    && ([(_UIActivityUserDefaultsViewController *)self favoritesProxies],
        int v9 = objc_claimAutoreleasedReturnValue(),
        unint64_t v10 = [v9 count],
        v9,
        v10 >= 2))
  {
    v11 = [(_UIActivityUserDefaultsViewController *)self favoritesProxies];
    uint64_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));

    char v13 = [v12 canMove];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  id v7 = [a3 cellForRowAtIndexPath:a4];
  id v4 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
  id v5 = [v7 contentView];
  [v5 setBackgroundColor:v4];

  id v6 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
  [v7 setBackgroundColor:v6];
}

- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4
{
  id v7 = [a3 cellForRowAtIndexPath:a4];
  id v4 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  id v5 = [v7 contentView];
  [v5 setBackgroundColor:v4];

  id v6 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  [v7 setBackgroundColor:v6];
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v4 = _ShareSheetBundle();
  id v5 = [v4 localizedStringForKey:@"SHARE_SHEET_DEFAULTS_REMOVE_BUTTON_TITLE" value:&stru_1EF308000 table:@"Localizable"];

  return v5;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v15 = a3;
  id v4 = [(_UIActivityUserDefaultsViewController *)self tableView];
  if (v4 == v15)
  {
    int v5 = dyld_program_sdk_at_least();

    if (!v5) {
      goto LABEL_8;
    }
    id v6 = [(_UIActivityUserDefaultsViewController *)self navigationController];
    id v7 = [v6 navigationBar];
    [v7 frame];
    double v9 = v8;

    [v15 contentOffset];
    if (v10 <= -v9)
    {
      char v13 = [(_UIActivityUserDefaultsViewController *)self navigationItem];
      id v4 = v13;
      double v14 = 0.0;
    }
    else
    {
      [v15 contentOffset];
      double v12 = fmin((v9 + v11) * 10.0, 100.0) / 100.0;
      char v13 = [(_UIActivityUserDefaultsViewController *)self navigationItem];
      id v4 = v13;
      double v14 = v12;
    }
    [v13 _setManualScrollEdgeAppearanceProgress:v14];
  }

LABEL_8:
}

- (id)cellForItemIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(_UIActivityUserDefaultsViewController *)self tableView];
  id v6 = [(_UIActivityUserDefaultsViewController *)self diffableDataSource];
  id v7 = [v6 indexPathForItemIdentifier:v4];

  double v8 = [v5 cellForRowAtIndexPath:v7];

  return v8;
}

- (id)activityForRowAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 row];
  id v6 = [(_UIActivityUserDefaultsViewController *)self activities];
  unint64_t v7 = [v6 count];

  if (v5 >= v7)
  {
    double v9 = 0;
  }
  else
  {
    double v8 = [(_UIActivityUserDefaultsViewController *)self activities];
    double v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v4, "row"));
  }
  return v9;
}

- (void)toggleActivityHiddenForControl:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_UIActivityUserDefaultsViewController *)self tableView];
  [v4 bounds];
  objc_msgSend(v5, "convertPoint:fromView:", v4);
  double v7 = v6;
  double v9 = v8;

  double v10 = [(_UIActivityUserDefaultsViewController *)self tableView];
  objc_msgSend(v10, "indexPathForRowAtPoint:", v7, v9);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  double v11 = [(_UIActivityUserDefaultsViewController *)self diffableDataSource];
  double v12 = [v11 itemIdentifierForIndexPath:v16];

  char v13 = [(_UIActivityUserDefaultsViewController *)self suggestionsByUUID];
  double v14 = [v13 objectForKeyedSubscript:v12];

  objc_msgSend(v14, "setIsHidden:", objc_msgSend(v14, "isHidden") ^ 1);
  id v15 = [(_UIActivityUserDefaultsViewController *)self userDefaultsDelegate];
  objc_msgSend(v15, "userDefaultsViewController:didToggleActivityWithIdentifier:activityCategory:", self, v12, -[_UIActivityUserDefaultsViewController activityCategory](self, "activityCategory"));
}

- (void)toggleActivityHiddenForRowAtIndexPath:(id)a3
{
  id v7 = [(_UIActivityUserDefaultsViewController *)self activityForRowAtIndexPath:a3];
  if (v7)
  {
    id v4 = [(_UIActivityUserDefaultsViewController *)self userDefaults];
    uint64_t v5 = [v4 activityIsHidden:v7] ^ 1;

    double v6 = [(_UIActivityUserDefaultsViewController *)self userDefaults];
    [v6 setActivity:v7 asHidden:v5];
  }
}

- (int64_t)preferredActivityCategory
{
  v2 = [(_UIActivityUserDefaultsViewController *)self activities];
  v3 = [v2 firstObject];

  int64_t v4 = [(id)objc_opt_class() activityCategory];
  return v4;
}

- (id)titleForSection:(int64_t)a3
{
  uint64_t v5 = [(_UIActivityUserDefaultsViewController *)self currentSnapshot];
  double v6 = [v5 sectionIdentifiers];
  id v7 = [v6 objectAtIndexedSubscript:a3];

  if (![v7 isEqualToString:@"App Actions"])
  {
    char v13 = _ShareSheetBundle();
    double v9 = [v13 localizedStringForKey:v7 value:&stru_1EF308000 table:@"Localizable"];
    goto LABEL_10;
  }
  double v8 = [MEMORY[0x1E4F28B50] mainBundle];
  double v9 = [v8 objectForInfoDictionaryKey:@"CFBundleDisplayName"];

  double v10 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v11 = [v10 keyWindow];
  double v12 = [v11 rootViewController];
  char v13 = [v12 childViewControllers];

  if (![v13 count]) {
    goto LABEL_10;
  }
  double v14 = [v13 objectAtIndexedSubscript:0];
  uint64_t v15 = [v14 _hostApplicationBundleIdentifier];
  if (v15)
  {
    id v16 = (void *)v15;

    goto LABEL_7;
  }
  id v16 = [(_UIActivityUserDefaultsViewController *)self bundleIdentifier];

  if (v16)
  {
LABEL_7:
    if ([v16 length])
    {
      uint64_t v17 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v16];
      uint64_t v18 = [v17 localizedNameForContext:0];

      double v9 = (void *)v18;
    }
  }

LABEL_10:
  return v9;
}

- (_UIActivityUserDefaultsViewControllerDelegate)userDefaultsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userDefaultsDelegate);
  return (_UIActivityUserDefaultsViewControllerDelegate *)WeakRetained;
}

- (void)setUserDefaultsDelegate:(id)a3
{
}

- (BSAuditToken)hostAuditToken
{
  return self->_hostAuditToken;
}

- (SFUIActivityImageProvider)activityImageProvider
{
  return self->_activityImageProvider;
}

- (NSArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
}

- (NSArray)favoritesProxies
{
  return self->_favoritesProxies;
}

- (void)setFavoritesProxies:(id)a3
{
}

- (NSMutableDictionary)favoritesByUUID
{
  return self->_favoritesByUUID;
}

- (void)setFavoritesByUUID:(id)a3
{
}

- (NSArray)suggestionProxies
{
  return self->_suggestionProxies;
}

- (void)setSuggestionProxies:(id)a3
{
}

- (NSMutableDictionary)suggestionsByUUID
{
  return self->_suggestionsByUUID;
}

- (void)setSuggestionsByUUID:(id)a3
{
}

- (NSDictionary)activitiesByUUID
{
  return self->_activitiesByUUID;
}

- (void)setActivitiesByUUID:(id)a3
{
}

- (NSArray)applicationActivityTypes
{
  return self->_applicationActivityTypes;
}

- (void)setApplicationActivityTypes:(id)a3
{
}

- (NSArray)orderedUUIDs
{
  return self->_orderedUUIDs;
}

- (void)setOrderedUUIDs:(id)a3
{
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(id)a3
{
}

- (int64_t)activityCategory
{
  return self->_activityCategory;
}

- (void)setActivityCategory:(int64_t)a3
{
  self->_activityCategory = a3;
}

- (_UIActivityUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
}

- (_UIActivityUserDefaultsDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (NSDiffableDataSourceSnapshot)currentSnapshot
{
  return self->_currentSnapshot;
}

- (void)setCurrentSnapshot:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)isPresentedModally
{
  return self->_isPresentedModally;
}

- (void)setIsPresentedModally:(BOOL)a3
{
  self->_isPresentedModally = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_orderedUUIDs, 0);
  objc_storeStrong((id *)&self->_applicationActivityTypes, 0);
  objc_storeStrong((id *)&self->_activitiesByUUID, 0);
  objc_storeStrong((id *)&self->_suggestionsByUUID, 0);
  objc_storeStrong((id *)&self->_suggestionProxies, 0);
  objc_storeStrong((id *)&self->_favoritesByUUID, 0);
  objc_storeStrong((id *)&self->_favoritesProxies, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_activityImageProvider, 0);
  objc_storeStrong((id *)&self->_hostAuditToken, 0);
  objc_destroyWeak((id *)&self->_userDefaultsDelegate);
}

@end