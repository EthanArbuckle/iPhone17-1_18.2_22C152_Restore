@interface PUIReportWebsiteListController
+ (BOOL)websiteSpecifiersWithLimit:(unint64_t)a3 showDetail:(BOOL)a4 completion:(id)a5;
+ (id)websiteSpecifiersFromResults:(id)a3 showDetail:(BOOL)a4;
- (BOOL)alphabeticalSort;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (NSArray)cachedSpecifiers;
- (PUIReportWebsiteListController)init;
- (id)specifiers;
- (void)dataDidChange;
- (void)dealloc;
- (void)setAlphabeticalSort:(BOOL)a3;
- (void)setCachedSpecifiers:(id)a3;
- (void)sortByWasTapped;
@end

@implementation PUIReportWebsiteListController

+ (id)websiteSpecifiersFromResults:(id)a3 showDetail:(BOOL)a4
{
  BOOL v37 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38 = objc_opt_new();
  v5 = dispatch_group_create();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  unint64_t v7 = 0x1E4F28000uLL;
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = 0;
    uint64_t v35 = *(void *)v47;
    uint64_t v34 = *MEMORY[0x1E4F930A8];
    uint64_t v32 = *MEMORY[0x1E4FA9008];
    uint64_t v31 = *MEMORY[0x1E4FA9010];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v47 != v35) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v12 = [v11 objectForKeyedSubscript:@"context"];
        v13 = [v11 objectForKeyedSubscript:@"sumHits"];
        uint64_t v14 = [v13 integerValue];

        v15 = [v11 objectForKeyedSubscript:@"contextVerificationType"];
        BOOL v16 = [v15 integerValue] != 2;

        v17 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v12 target:a1 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
        [v17 setIdentifier:v12];
        [v17 setObject:v12 forKeyedSubscript:@"PUIReportWebsiteKey"];
        [v17 setObject:objc_opt_class() forKeyedSubscript:v34];
        [*(id *)(v7 + 3792) numberWithInteger:v14];
        v19 = unint64_t v18 = v7;
        [v17 setObject:v19 forKeyedSubscript:@"PUITrackerBarValueKey"];

        unint64_t v7 = v18;
        [v17 setObject:v12 forKeyedSubscript:@"PUITrackerBarIconLabelKey"];
        v20 = [*(id *)(v18 + 3792) numberWithInt:v16];
        [v17 setObject:v20 forKeyedSubscript:@"PUITrackerBarShowAppAttributedBadgeKey"];

        if (v14 > v9) {
          uint64_t v9 = v14;
        }
        if (v37)
        {
          v21 = objc_opt_new();
          [v21 setObject:&unk_1F4080638 forKeyedSubscript:v32];
          [v21 setObject:v12 forKeyedSubscript:v31];
          dispatch_group_enter(v5);
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __74__PUIReportWebsiteListController_websiteSpecifiersFromResults_showDetail___block_invoke;
          v43[3] = &unk_1E6E9DB08;
          id v44 = v17;
          v45 = v5;
          +[PUITrackingReportManager queryWithOptions:v21 reply:v43];
        }
        dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
        [v38 addObject:v17];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v22 = v38;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        v28 = [*(id *)(v7 + 3792) numberWithInteger:v9];
        [v27 setObject:v28 forKeyedSubscript:@"PUITrackerBarCapacityKey"];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v39 objects:v50 count:16];
    }
    while (v24);
  }

  v29 = (void *)[v22 copy];
  return v29;
}

void __74__PUIReportWebsiteListController_websiteSpecifiersFromResults_showDetail___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"result_count"];
  uint64_t v5 = [v4 integerValue];

  uint64_t v6 = [v3 objectForKeyedSubscript:@"result"];

  unint64_t v7 = [v6 firstObject];
  id v14 = [v7 objectForKeyedSubscript:@"domain"];

  if (v5 == 1)
  {
    [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:@"PUITrackerBarTertiaryLabelKey"];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28EE0];
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:v5 - 1];
    v10 = [v8 localizedStringFromNumber:v9 numberStyle:1];

    v11 = NSString;
    v12 = PUI_LocalizedStringForTrackers(@"%@_AND_%@_MORE");
    v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v14, v10);
    [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:@"PUITrackerBarTertiaryLabelKey"];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (BOOL)websiteSpecifiersWithLimit:(unint64_t)a3 showDetail:(BOOL)a4 completion:(id)a5
{
  id v7 = a5;
  uint64_t v8 = objc_opt_new();
  [v8 setObject:&unk_1F4080650 forKeyedSubscript:*MEMORY[0x1E4FA9008]];
  [v8 setObject:&unk_1F4080668 forKeyedSubscript:*MEMORY[0x1E4FA8FD8]];
  if (a3)
  {
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4FA8FE8]];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__PUIReportWebsiteListController_websiteSpecifiersWithLimit_showDetail_completion___block_invoke;
  v13[3] = &unk_1E6E9DE10;
  BOOL v15 = a4;
  id v14 = v7;
  id v10 = v7;
  BOOL v11 = +[PUITrackingReportManager queryWithOptions:v8 reply:v13];

  return v11;
}

void __83__PUIReportWebsiteListController_websiteSpecifiersWithLimit_showDetail_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"result"];
  id v7 = +[PUIReportWebsiteListController websiteSpecifiersFromResults:v3 showDetail:*(unsigned __int8 *)(a1 + 40)];

  BOOL v4 = [v7 count] != 0;
  uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v5 setBool:v4 forKey:@"PSUITrackerHasDataKey"];

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
}

- (PUIReportWebsiteListController)init
{
  v7.receiver = self;
  v7.super_class = (Class)PUIReportWebsiteListController;
  v2 = [(PUIReportWebsiteListController *)&v7 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_dataDidChange name:*MEMORY[0x1E4FB2628] object:0];

    BOOL v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    PUIAnalyticsLogView(v5, 0, 0);
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PUIReportWebsiteListController;
  [(PUIReportWebsiteListController *)&v4 dealloc];
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifiers
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    uint64_t v5 = PUI_LocalizedStringForAppReport(@"WEBSITE_NETWORK_ACTIVITY_TITLE");
    [(PUIReportWebsiteListController *)self setTitle:v5];

    id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
    objc_super v7 = PUI_LocalizedStringForAppReport(@"SORT_BY");
    uint64_t v8 = (void *)[v6 initWithTitle:v7 style:0 target:self action:sel_sortByWasTapped];
    uint64_t v9 = [(PUIReportWebsiteListController *)self navigationItem];
    [v9 setRightBarButtonItem:v8];

    id v10 = objc_opt_new();
    if ([(PUIReportWebsiteListController *)self alphabeticalSort])
    {
      BOOL v11 = &stru_1F4072988;
    }
    else
    {
      PUI_LocalizedStringForAppReport(@"MOST_ACTIVE_SITE");
      BOOL v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v12 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"HEADER_GROUP" name:v11];
    v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    uint64_t v15 = *MEMORY[0x1E4F93140];
    [v12 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F93140]];

    [v10 addObject:v12];
    BOOL v16 = [(PUIReportWebsiteListController *)self cachedSpecifiers];

    if (!v16)
    {
      v17 = [(PUIReportWebsiteListController *)self specifier];
      unint64_t v18 = [v17 objectForKeyedSubscript:@"PUIReportWebsiteListApp"];

      if ([v18 length])
      {
        v19 = objc_opt_new();
        [v19 setObject:&unk_1F4080680 forKeyedSubscript:*MEMORY[0x1E4FA9008]];
        [v19 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4FA8FD0]];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __44__PUIReportWebsiteListController_specifiers__block_invoke;
        v58[3] = &unk_1E6E9DE38;
        v58[4] = self;
        +[PUITrackingReportManager queryWithOptions:v19 reply:v58];
      }
      else
      {
        v20 = objc_opt_class();
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __44__PUIReportWebsiteListController_specifiers__block_invoke_3;
        v57[3] = &unk_1E6E9DB58;
        v57[4] = self;
        [v20 websiteSpecifiersWithLimit:0 showDetail:0 completion:v57];
      }
    }
    BOOL v21 = [(PUIReportWebsiteListController *)self alphabeticalSort];
    id v22 = [(PUIReportWebsiteListController *)self cachedSpecifiers];
    uint64_t v23 = v22;
    if (v21)
    {
      uint64_t v24 = [v22 sortedArrayUsingComparator:&__block_literal_global_21];

      uint64_t v23 = (void *)v24;
    }
    [v10 addObjectsFromArray:v23];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v25 = v23;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v53 objects:v59 count:16];
    v27 = v25;
    if (v26)
    {
      uint64_t v28 = v26;
      v50 = v11;
      v51 = v10;
      uint64_t v52 = v3;
      uint64_t v29 = *(void *)v54;
      while (2)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v54 != v29) {
            objc_enumerationMutation(v25);
          }
          uint64_t v31 = [*(id *)(*((void *)&v53 + 1) + 8 * i) objectForKeyedSubscript:@"PUITrackerBarShowAppAttributedBadgeKey"];
          char v32 = [v31 BOOLValue];

          if (v32)
          {

            v33 = (objc_class *)objc_opt_class();
            uint64_t v34 = NSStringFromClass(v33);
            [v12 setObject:v34 forKeyedSubscript:v15];

            uint64_t v35 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
            [v12 setObject:v35 forKeyedSubscript:@"PUIAttributedStringTextViewDelegateKey"];

            v36 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"appstore"];
            v27 = [v36 imageWithRenderingMode:2];

            BOOL v37 = NSString;
            v38 = PUI_LocalizedStringForAppReport(@"WEBSITE_UNVERIFIED_CONTEXT_FOOTER");
            long long v39 = objc_msgSend(v37, "stringWithFormat:", v38, @"SF_SYMBOL_APPSTORE");

            long long v40 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v39];
            id v41 = +[PUIAttributedStringFooter string:v40 replacingSubstring:@"SF_SYMBOL_APPSTORE" withImage:v27];
            id v42 = objc_alloc(MEMORY[0x1E4F28E48]);
            v43 = PUI_LocalizedStringForAppReport(@"WEBSITE_UNVERIFIED_CONTEXT_FOOTER_LINK");
            id v44 = (void *)[v42 initWithString:v43];

            uint64_t v45 = *MEMORY[0x1E4FB0720];
            long long v46 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1F4072988];
            objc_msgSend(v44, "addAttribute:value:range:", v45, v46, 0, objc_msgSend(v44, "length"));

            long long v47 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
            [v40 appendAttributedString:v47];

            [v40 appendAttributedString:v44];
            [v12 setObject:v40 forKeyedSubscript:@"PUIAttributedStringFooterStringKey"];

            goto LABEL_22;
          }
        }
        uint64_t v28 = [v25 countByEnumeratingWithState:&v53 objects:v59 count:16];
        if (v28) {
          continue;
        }
        break;
      }
      v27 = v25;
LABEL_22:
      id v10 = v51;
      uint64_t v3 = v52;
      BOOL v11 = v50;
    }

    long long v48 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v10;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

void __44__PUIReportWebsiteListController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = objc_opt_class();
  uint64_t v5 = [v3 objectForKeyedSubscript:@"result"];

  id v6 = [v4 websiteSpecifiersFromResults:v5 showDetail:0];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__PUIReportWebsiteListController_specifiers__block_invoke_2;
  v8[3] = &unk_1E6E9CBA0;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __44__PUIReportWebsiteListController_specifiers__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setCachedSpecifiers:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 reloadSpecifiers];
}

void __44__PUIReportWebsiteListController_specifiers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PUIReportWebsiteListController_specifiers__block_invoke_4;
  v5[3] = &unk_1E6E9CBA0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __44__PUIReportWebsiteListController_specifiers__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setCachedSpecifiers:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 reloadSpecifiers];
}

uint64_t __44__PUIReportWebsiteListController_specifiers__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (void)dataDidChange
{
  [(PUIReportWebsiteListController *)self setCachedSpecifiers:0];
  [(PUIReportWebsiteListController *)self reloadSpecifiers];
}

- (void)sortByWasTapped
{
  id v3 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  id v4 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v5 = PUI_LocalizedStringForAppReport(@"MOST_ACTIVE_SITE");
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__PUIReportWebsiteListController_sortByWasTapped__block_invoke;
  v14[3] = &unk_1E6E9D610;
  v14[4] = self;
  id v6 = [v4 actionWithTitle:v5 style:0 handler:v14];

  objc_msgSend(v6, "_setChecked:", -[PUIReportWebsiteListController alphabeticalSort](self, "alphabeticalSort") ^ 1);
  [v3 addAction:v6];
  uint64_t v7 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v8 = PUI_LocalizedStringForAppReport(@"ALPHABETICAL");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__PUIReportWebsiteListController_sortByWasTapped__block_invoke_2;
  v13[3] = &unk_1E6E9D610;
  void v13[4] = self;
  id v9 = [v7 actionWithTitle:v8 style:0 handler:v13];

  objc_msgSend(v9, "_setChecked:", -[PUIReportWebsiteListController alphabeticalSort](self, "alphabeticalSort"));
  [v3 addAction:v9];
  id v10 = (void *)MEMORY[0x1E4FB1410];
  BOOL v11 = PUI_LocalizedStringForAppReport(@"CANCEL");
  v12 = [v10 actionWithTitle:v11 style:1 handler:0];

  [v3 addAction:v12];
  [(PUIReportWebsiteListController *)self presentViewController:v3 animated:1 completion:0];
}

uint64_t __49__PUIReportWebsiteListController_sortByWasTapped__block_invoke(uint64_t a1)
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

uint64_t __49__PUIReportWebsiteListController_sortByWasTapped__block_invoke_2(uint64_t a1)
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

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7 = objc_alloc(MEMORY[0x1E4F83AE8]);
  uint64_t v8 = PUI_LocalizedStringForAppReport(@"LEARN_MORE_TITLE");
  id v9 = (void *)[v7 initWithTitle:v8 detailText:0 symbolName:0 contentLayout:2];

  id v10 = PUI_LocalizedStringForAppReport(@"LEARN_MORE_TEXT");
  [v9 addSectionWithHeader:0 content:v10];

  id v11 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v12 = (void *)MEMORY[0x1E4FB13F0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __85__PUIReportWebsiteListController_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
  v19[3] = &unk_1E6E9C708;
  id v20 = v9;
  id v13 = v9;
  id v14 = [v12 actionWithHandler:v19];
  uint64_t v15 = (void *)[v11 initWithBarButtonSystemItem:0 primaryAction:v14];

  BOOL v16 = [v13 navigationItem];
  [v16 setRightBarButtonItem:v15];

  v17 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v13];
  [(PUIReportWebsiteListController *)self presentModalViewController:v17 withTransition:3];

  return 0;
}

void __85__PUIReportWebsiteListController_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (NSArray)cachedSpecifiers
{
  return self->_cachedSpecifiers;
}

- (void)setCachedSpecifiers:(id)a3
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
}

@end