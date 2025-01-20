@interface PUIReportAppListController
+ (BOOL)appSpecifiersWithLimit:(unint64_t)a3 completion:(id)a4;
- (AnalyticsWorkspace)workspace;
- (BOOL)alphabeticalSort;
- (BOOL)shouldReloadSpecifiersOnResume;
- (NSArray)cachedSpecifiers;
- (PUIReportAppListController)init;
- (UsageFeed)feed;
- (id)specifiers;
- (void)dataDidChange;
- (void)dealloc;
- (void)setAlphabeticalSort:(BOOL)a3;
- (void)setCachedSpecifiers:(id)a3;
- (void)setFeed:(id)a3;
- (void)setWorkspace:(id)a3;
- (void)sortByWasTapped;
@end

@implementation PUIReportAppListController

+ (BOOL)appSpecifiersWithLimit:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setObject:&unk_1F4080518 forKeyedSubscript:*MEMORY[0x1E4FA9008]];
  if (a3)
  {
    v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4FA8FE8]];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__PUIReportAppListController_appSpecifiersWithLimit_completion___block_invoke;
  v12[3] = &unk_1E6E9DB30;
  id v13 = v6;
  id v14 = a1;
  id v9 = v6;
  BOOL v10 = +[PUITrackingReportManager queryWithOptions:v7 reply:v12];

  return v10;
}

void __64__PUIReportAppListController_appSpecifiersWithLimit_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v39 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v32 = v2;
  obuint64_t j = [v2 objectForKeyedSubscript:@"result"];
  unint64_t v3 = 0x1E4F28000;
  uint64_t v41 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  unint64_t v4 = 0;
  if (v41)
  {
    uint64_t v38 = *(void *)v47;
    uint64_t v37 = *MEMORY[0x1E4F931D0];
    uint64_t v36 = *MEMORY[0x1E4F930A8];
    uint64_t v34 = *MEMORY[0x1E4F931C0];
    uint64_t v33 = *MEMORY[0x1E4F931A0];
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v47 != v38) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v7 = [v6 objectForKeyedSubscript:@"bundleName"];
        v8 = [v6 objectForKeyedSubscript:@"count"];
        unint64_t v9 = [v8 integerValue];

        if ([(__CFString *)v7 isEqualToString:@"com.apple.mobilesafari"]
          && ([MEMORY[0x1E4F223E0] defaultWorkspace],
              BOOL v10 = objc_claimAutoreleasedReturnValue(),
              char v11 = [v10 applicationIsInstalled:@"com.apple.mobilesafari"],
              v10,
              (v11 & 1) == 0))
        {
          PUI_LocalizedStringForAppReport(@"IN_APP_WEB_BROWSING");
          id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          int v14 = 1;
          v15 = @"com.apple.graphic-icon.web-browsing";
        }
        else
        {
          v12 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v7 allowPlaceholder:0 error:0];
          id v13 = [v12 localizedName];

          int v14 = 0;
          v15 = 0;
        }
        v16 = (void *)MEMORY[0x1E4F92E70];
        if ([(__CFString *)v13 length]) {
          v17 = v13;
        }
        else {
          v17 = v7;
        }
        v18 = [v16 preferenceSpecifierNamed:v17 target:*(void *)(a1 + 40) set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
        [v18 setIdentifier:v7];
        [v18 setObject:v7 forKeyedSubscript:@"PUIReportAppIDKey"];
        [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v37];
        [v18 setObject:objc_opt_class() forKeyedSubscript:v36];
        unint64_t v3 = 0x1E4F28000uLL;
        v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v9];
        [v18 setObject:v19 forKeyedSubscript:@"PUITrackerBarValueKey"];

        if (v14)
        {
          v20 = v15;
          uint64_t v21 = v33;
        }
        else
        {
          v20 = v7;
          uint64_t v21 = v34;
        }
        [v18 setObject:v20 forKeyedSubscript:v21];
        [v39 addObject:v18];
        if (v9 > v4) {
          unint64_t v4 = v9;
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v41);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v22 = v39;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v43 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        v28 = [*(id *)(v3 + 3792) numberWithUnsignedInteger:v4];
        [v27 setObject:v28 forKeyedSubscript:@"PUITrackerBarCapacityKey"];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v24);
  }

  BOOL v29 = [v22 count] != 0;
  v30 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v30 setBool:v29 forKey:@"PSUITrackerHasDataKey"];

  uint64_t v31 = *(void *)(a1 + 32);
  if (v31) {
    (*(void (**)(uint64_t, id))(v31 + 16))(v31, v22);
  }
}

- (PUIReportAppListController)init
{
  v7.receiver = self;
  v7.super_class = (Class)PUIReportAppListController;
  id v2 = [(PUIReportAppListController *)&v7 init];
  if (v2)
  {
    unint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_dataDidChange name:*MEMORY[0x1E4FB2628] object:0];

    unint64_t v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    PUIAnalyticsLogView(v5, 0, 0);
  }
  return v2;
}

- (void)dealloc
{
  unint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PUIReportAppListController;
  [(PUIReportAppListController *)&v4 dealloc];
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = PUI_LocalizedStringForAppReport(@"APP_NETWORK_ACTIVITY");
    [(PUIReportAppListController *)self setTitle:v5];

    id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
    objc_super v7 = PUI_LocalizedStringForAppReport(@"SORT_BY");
    v8 = (void *)[v6 initWithTitle:v7 style:0 target:self action:sel_sortByWasTapped];
    unint64_t v9 = [(PUIReportAppListController *)self navigationItem];
    [v9 setRightBarButtonItem:v8];

    BOOL v10 = [(PUIReportAppListController *)self cachedSpecifiers];

    if (!v10)
    {
      char v11 = objc_opt_class();
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __40__PUIReportAppListController_specifiers__block_invoke;
      v21[3] = &unk_1E6E9DB58;
      v21[4] = self;
      [v11 appSpecifiersWithLimit:0 completion:v21];
    }
    v12 = objc_opt_new();
    if ([(PUIReportAppListController *)self alphabeticalSort])
    {
      id v13 = &stru_1F4072988;
    }
    else
    {
      PUI_LocalizedStringForAppReport(@"MOST_ACTIVE_APP");
      id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    int v14 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"HEADER_GROUP" name:v13];
    [v12 addObject:v14];
    BOOL v15 = [(PUIReportAppListController *)self alphabeticalSort];
    v16 = [(PUIReportAppListController *)self cachedSpecifiers];
    v17 = v16;
    if (v15)
    {
      uint64_t v18 = [v16 sortedArrayUsingComparator:&__block_literal_global_14];

      v17 = (void *)v18;
    }
    [v12 addObjectsFromArray:v17];
    v19 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v12;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

void __40__PUIReportAppListController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PUIReportAppListController_specifiers__block_invoke_2;
  v5[3] = &unk_1E6E9CBA0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __40__PUIReportAppListController_specifiers__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setCachedSpecifiers:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  return [v2 reloadSpecifiers];
}

uint64_t __40__PUIReportAppListController_specifiers__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (void)dataDidChange
{
  [(PUIReportAppListController *)self setCachedSpecifiers:0];
  [(PUIReportAppListController *)self reloadSpecifiers];
}

- (void)sortByWasTapped
{
  id v3 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  id v4 = (void *)MEMORY[0x1E4FB1410];
  v5 = PUI_LocalizedStringForAppReport(@"MOST_ACTIVE_APP");
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__PUIReportAppListController_sortByWasTapped__block_invoke;
  v14[3] = &unk_1E6E9D610;
  v14[4] = self;
  id v6 = [v4 actionWithTitle:v5 style:0 handler:v14];

  objc_msgSend(v6, "_setChecked:", -[PUIReportAppListController alphabeticalSort](self, "alphabeticalSort") ^ 1);
  [v3 addAction:v6];
  uint64_t v7 = (void *)MEMORY[0x1E4FB1410];
  v8 = PUI_LocalizedStringForAppReport(@"ALPHABETICAL");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__PUIReportAppListController_sortByWasTapped__block_invoke_2;
  v13[3] = &unk_1E6E9D610;
  v13[4] = self;
  unint64_t v9 = [v7 actionWithTitle:v8 style:0 handler:v13];

  objc_msgSend(v9, "_setChecked:", -[PUIReportAppListController alphabeticalSort](self, "alphabeticalSort"));
  [v3 addAction:v9];
  BOOL v10 = (void *)MEMORY[0x1E4FB1410];
  char v11 = PUI_LocalizedStringForAppReport(@"CANCEL");
  v12 = [v10 actionWithTitle:v11 style:1 handler:0];

  [v3 addAction:v12];
  [(PUIReportAppListController *)self presentViewController:v3 animated:1 completion:0];
}

uint64_t __45__PUIReportAppListController_sortByWasTapped__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) alphabeticalSort];
  if (result)
  {
    [*(id *)(a1 + 32) setAlphabeticalSort:0];
    id v3 = *(void **)(a1 + 32);
    return [v3 reloadSpecifiers];
  }
  return result;
}

uint64_t __45__PUIReportAppListController_sortByWasTapped__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) alphabeticalSort];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setAlphabeticalSort:1];
    id v3 = *(void **)(a1 + 32);
    return [v3 reloadSpecifiers];
  }
  return result;
}

- (NSArray)cachedSpecifiers
{
  return self->_cachedSpecifiers;
}

- (void)setCachedSpecifiers:(id)a3
{
}

- (UsageFeed)feed
{
  return self->_feed;
}

- (void)setFeed:(id)a3
{
}

- (AnalyticsWorkspace)workspace
{
  return self->_workspace;
}

- (void)setWorkspace:(id)a3
{
}

- (BOOL)alphabeticalSort
{
  return self->_alphabeticalSort;
}

- (void)setAlphabeticalSort:(BOOL)a3
{
  self->_alphabeticalSort = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_feed, 0);
  objc_storeStrong((id *)&self->_cachedSpecifiers, 0);
}

@end