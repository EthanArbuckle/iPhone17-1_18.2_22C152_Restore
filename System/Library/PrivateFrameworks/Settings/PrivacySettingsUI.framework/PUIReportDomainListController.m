@interface PUIReportDomainListController
+ (BOOL)domainSpecifiersWithLimit:(unint64_t)a3 showDates:(BOOL)a4 showAppAndWebsiteCounts:(BOOL)a5 showIPAddresses:(BOOL)a6 completion:(id)a7;
+ (id)domainSpecifiersFromResults:(id)a3 showDates:(BOOL)a4 showAppAndWebsiteCounts:(BOOL)a5 app:(id)a6 appOther:(id)a7 website:(id)a8;
- (BOOL)alphabeticalSort;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)showWebsiteAndAppCounts;
- (NSArray)cachedSpecifiers;
- (PUIReportDomainListController)init;
- (id)specifiers;
- (void)dataDidChange;
- (void)dealloc;
- (void)setAlphabeticalSort:(BOOL)a3;
- (void)setCachedSpecifiers:(id)a3;
- (void)setShowWebsiteAndAppCounts:(BOOL)a3;
- (void)sortByWasTapped;
@end

@implementation PUIReportDomainListController

+ (id)domainSpecifiersFromResults:(id)a3 showDates:(BOOL)a4 showAppAndWebsiteCounts:(BOOL)a5 app:(id)a6 appOther:(id)a7 website:(id)a8
{
  BOOL v11 = a4;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v54 = a6;
  id v53 = a7;
  id v52 = a8;
  BOOL v58 = v11;
  if (v11)
  {
    v13 = objc_opt_new();
    [v13 setTimeStyle:1];
    v55 = v13;
    [v13 setDateStyle:1];
  }
  else
  {
    v55 = 0;
  }
  v59 = objc_opt_new();
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v14 = v12;
  v51 = v14;
  uint64_t v61 = [v14 countByEnumeratingWithState:&v66 objects:v75 count:16];
  unint64_t v15 = 0;
  if (v61)
  {
    uint64_t v60 = *(void *)v67;
    uint64_t v56 = *MEMORY[0x1E4F930A8];
    do
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v67 != v60) {
          objc_enumerationMutation(v14);
        }
        v17 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        v18 = [v17 objectForKeyedSubscript:@"domain"];
        v19 = [v17 objectForKeyedSubscript:@"count"];

        if (v19) {
          v20 = @"count";
        }
        else {
          v20 = @"sumHits";
        }
        v21 = [v17 objectForKeyedSubscript:v20];
        unint64_t v22 = [v21 integerValue];

        v23 = [v17 objectForKeyedSubscript:@"domainOwner"];
        if (![v18 isEqualToString:@"unnamed_domains"])
        {
          v28 = (void *)MEMORY[0x1E4F92E70];
          v29 = [MEMORY[0x1E4F1CB10] URLWithString:v18];
          v30 = objc_msgSend(v29, "_lp_simplifiedDisplayString");
          v27 = [v28 preferenceSpecifierNamed:v30 target:a1 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

          goto LABEL_18;
        }
        v24 = _PUILoggingFacility();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v72 = "+[PUIReportDomainListController domainSpecifiersFromResults:showDates:showAppAndWebsiteCounts:app:appOther:website:]";
          __int16 v73 = 2112;
          v74 = v17;
          _os_log_impl(&dword_1E4AD5000, v24, OS_LOG_TYPE_DEFAULT, "%s: unnamed domains entry: %@", buf, 0x16u);
        }

        if (v22)
        {
          v25 = (void *)MEMORY[0x1E4F92E70];
          v26 = PUI_LocalizedStringForAppReport(@"UNNAMED_DOMAINS");
          v27 = [v25 preferenceSpecifierNamed:v26 target:a1 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

          [v27 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PUIReportDomainListShowIPAddresses"];
          [v27 setObject:v54 forKeyedSubscript:@"PUIReportDomainListEntries"];
          [v27 setObject:v53 forKeyedSubscript:@"PUIReportDomainListAppOther"];
          [v27 setObject:v52 forKeyedSubscript:@"PUIReportDomainListWebsite"];
LABEL_18:
          [v27 setIdentifier:v18];
          [v27 setObject:v18 forKeyedSubscript:@"PUIReportDomainKey"];
          v31 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v22];
          [v27 setObject:v31 forKeyedSubscript:@"PUITrackerBarValueKey"];

          v32 = [MEMORY[0x1E4FB1618] systemBlueColor];
          [v27 setObject:v32 forKeyedSubscript:@"PUITrackerBarColorKey"];

          [v27 setObject:objc_opt_class() forKeyedSubscript:v56];
          [v27 setObject:v23 forKeyedSubscript:@"PUIReportDomainDetailOwnerKey"];
          v33 = [v17 objectForKeyedSubscript:@"domainType"];
          [v27 setObject:v33 forKeyedSubscript:@"PUIReportDomainDetailTrackerTypeKey"];

          if (v58)
          {
            v34 = (void *)MEMORY[0x1E4F1C9C8];
            v35 = [v17 objectForKeyedSubscript:@"maxTimeStamp"];
            v36 = objc_msgSend(v34, "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v35, "integerValue"));

            v37 = [v55 stringFromDate:v36];
            if ([v23 length])
            {
              v38 = NSString;
              v39 = PUI_LocalizedStringForAppReport(@"TIME_AND_OWNER");
              objc_msgSend(v38, "stringWithFormat:", v39, v37, v23);
              v40 = (__CFString *)objc_claimAutoreleasedReturnValue();

              id v14 = v51;
            }
            else
            {
              v40 = v37;
            }
          }
          else
          {
            v40 = v23;
          }
          if ([(__CFString *)v40 length]) {
            v41 = v40;
          }
          else {
            v41 = &stru_1F4072988;
          }
          [v27 setObject:v41 forKeyedSubscript:@"PUITrackerBarDomainOwnerKey"];
          if (v22 > v15) {
            unint64_t v15 = v22;
          }
          [v59 addObject:v27];
        }
      }
      uint64_t v61 = [v14 countByEnumeratingWithState:&v66 objects:v75 count:16];
    }
    while (v61);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v42 = v59;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v63 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = *(void **)(*((void *)&v62 + 1) + 8 * j);
        v48 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v15];
        [v47 setObject:v48 forKeyedSubscript:@"PUITrackerBarCapacityKey"];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v44);
  }

  v49 = (void *)[v42 copy];
  return v49;
}

+ (BOOL)domainSpecifiersWithLimit:(unint64_t)a3 showDates:(BOOL)a4 showAppAndWebsiteCounts:(BOOL)a5 showIPAddresses:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  v13 = objc_opt_new();
  [v13 setObject:&unk_1F4080578 forKeyedSubscript:*MEMORY[0x1E4FA9008]];
  if (v7) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 1;
  }
  unint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithInteger:v14];
  [v13 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4FA9000]];
  if (a3)
  {
    v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    [v13 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4FA8FE8]];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __120__PUIReportDomainListController_domainSpecifiersWithLimit_showDates_showAppAndWebsiteCounts_showIPAddresses_completion___block_invoke;
  v20[3] = &unk_1E6E9DCE0;
  BOOL v23 = a4;
  BOOL v24 = a5;
  id v21 = v12;
  id v22 = a1;
  id v17 = v12;
  BOOL v18 = +[PUITrackingReportManager queryWithOptions:v13 reply:v20];

  return v18;
}

void __120__PUIReportDomainListController_domainSpecifiersWithLimit_showDates_showAppAndWebsiteCounts_showIPAddresses_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 40);
  v4 = [a2 objectForKeyedSubscript:@"result"];
  id v8 = [v3 domainSpecifiersFromResults:v4 showDates:*(unsigned __int8 *)(a1 + 48) showAppAndWebsiteCounts:*(unsigned __int8 *)(a1 + 49) app:0 appOther:0 website:0];

  BOOL v5 = [v8 count] != 0;
  v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v6 setBool:v5 forKey:@"PSUITrackerHasDataKey"];

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

- (PUIReportDomainListController)init
{
  v7.receiver = self;
  v7.super_class = (Class)PUIReportDomainListController;
  v2 = [(PUIReportDomainListController *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_dataDidChange name:*MEMORY[0x1E4FB2628] object:0];

    v4 = (objc_class *)objc_opt_class();
    BOOL v5 = NSStringFromClass(v4);
    PUIAnalyticsLogView(v5, 0, 0);
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PUIReportDomainListController;
  [(PUIReportDomainListController *)&v4 dealloc];
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4) {
    goto LABEL_22;
  }
  BOOL v5 = [(PUIReportDomainListController *)self specifier];
  v6 = [v5 objectForKeyedSubscript:@"PUIReportDomainListShowWebsiteAndAppCounts"];
  -[PUIReportDomainListController setShowWebsiteAndAppCounts:](self, "setShowWebsiteAndAppCounts:", [v6 BOOLValue]);

  objc_super v7 = PUI_LocalizedStringForAppReport(@"MOST_CONTACTED_DOMAINS_TITLE");
  [(PUIReportDomainListController *)self setTitle:v7];

  id v8 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v9 = PUI_LocalizedStringForAppReport(@"SORT_BY");
  v10 = (void *)[v8 initWithTitle:v9 style:0 target:self action:sel_sortByWasTapped];
  BOOL v11 = [(PUIReportDomainListController *)self navigationItem];
  [v11 setRightBarButtonItem:v10];

  id v12 = objc_opt_new();
  if ([(PUIReportDomainListController *)self alphabeticalSort])
  {
    v13 = &stru_1F4072988;
  }
  else
  {
    PUI_LocalizedStringForAppReport(@"MOST_ACTIVE_DOMAIN");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v14 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"HEADER_GROUP" name:v13];
  [v12 addObject:v14];
  unint64_t v15 = [(PUIReportDomainListController *)self cachedSpecifiers];

  if (!v15)
  {
    v16 = [(PUIReportDomainListController *)self specifier];
    id v17 = [v16 objectForKeyedSubscript:@"PUIReportDomainListEntries"];

    BOOL v18 = [(PUIReportDomainListController *)self specifier];
    v19 = [v18 objectForKeyedSubscript:@"PUIReportDomainListAppOther"];

    v20 = [(PUIReportDomainListController *)self specifier];
    id v21 = [v20 objectForKeyedSubscript:@"PUIReportDomainListWebsite"];

    v46 = v21;
    if ([v17 length])
    {
      id v22 = objc_opt_new();
      [v22 setObject:&unk_1F4080590 forKeyedSubscript:*MEMORY[0x1E4FA9008]];
      uint64_t v23 = *MEMORY[0x1E4FA8FD0];
      BOOL v24 = v22;
      v25 = v17;
    }
    else if ([v19 length])
    {
      id v22 = objc_opt_new();
      [v22 setObject:&unk_1F40805A8 forKeyedSubscript:*MEMORY[0x1E4FA9008]];
      uint64_t v23 = *MEMORY[0x1E4FA8FD0];
      BOOL v24 = v22;
      v25 = v19;
    }
    else
    {
      if (![v21 length]) {
        goto LABEL_17;
      }
      id v22 = objc_opt_new();
      [v22 setObject:&unk_1F40805C0 forKeyedSubscript:*MEMORY[0x1E4FA9008]];
      uint64_t v23 = *MEMORY[0x1E4FA9010];
      BOOL v24 = v22;
      v25 = v21;
    }
    [v24 setObject:v25 forKeyedSubscript:v23];
    if (v22)
    {
      [(PUIReportDomainListController *)self specifier];
      v26 = uint64_t v44 = v3;
      v27 = [v26 objectForKeyedSubscript:@"PUIReportDomainListShowIPAddresses"];
      int v28 = [v27 BOOLValue];

      if (v28) {
        uint64_t v29 = 3;
      }
      else {
        uint64_t v29 = 1;
      }
      v30 = [MEMORY[0x1E4F28ED0] numberWithInteger:v29];
      [v22 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4FA9000]];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __43__PUIReportDomainListController_specifiers__block_invoke;
      v48[3] = &unk_1E6E9DD08;
      v48[4] = self;
      id v49 = v17;
      id v50 = v19;
      v31 = v46;
      id v51 = v46;
      +[PUITrackingReportManager queryWithOptions:v22 reply:v48];

      uint64_t v3 = v44;
      goto LABEL_18;
    }
LABEL_17:
    v32 = objc_opt_class();
    BOOL v33 = [(PUIReportDomainListController *)self showWebsiteAndAppCounts];
    [(PUIReportDomainListController *)self specifier];
    uint64_t v45 = v19;
    v35 = uint64_t v34 = v3;
    v36 = [v35 objectForKeyedSubscript:@"PUIReportDomainListShowIPAddresses"];
    uint64_t v37 = [v36 BOOLValue];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __43__PUIReportDomainListController_specifiers__block_invoke_3;
    v47[3] = &unk_1E6E9DB58;
    v47[4] = self;
    [v32 domainSpecifiersWithLimit:100 showDates:0 showAppAndWebsiteCounts:v33 showIPAddresses:v37 completion:v47];

    uint64_t v3 = v34;
    v19 = v45;
    v31 = v46;
LABEL_18:
  }
  BOOL v38 = [(PUIReportDomainListController *)self alphabeticalSort];
  v39 = [(PUIReportDomainListController *)self cachedSpecifiers];
  v40 = v39;
  if (v38)
  {
    uint64_t v41 = [v39 sortedArrayUsingComparator:&__block_literal_global_16];

    v40 = (void *)v41;
  }
  [v12 addObjectsFromArray:v40];
  id v42 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v12;

  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
LABEL_22:
  return v4;
}

void __43__PUIReportDomainListController_specifiers__block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = objc_opt_class();
  BOOL v5 = [v3 objectForKeyedSubscript:@"result"];

  v6 = [v4 domainSpecifiersFromResults:v5 showDates:0 showAppAndWebsiteCounts:0 app:a1[5] appOther:a1[6] website:a1[7]];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__PUIReportDomainListController_specifiers__block_invoke_2;
  v8[3] = &unk_1E6E9CBA0;
  v8[4] = a1[4];
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __43__PUIReportDomainListController_specifiers__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setCachedSpecifiers:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 reloadSpecifiers];
}

void __43__PUIReportDomainListController_specifiers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PUIReportDomainListController_specifiers__block_invoke_4;
  v5[3] = &unk_1E6E9CBA0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __43__PUIReportDomainListController_specifiers__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setCachedSpecifiers:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) reloadSpecifiers];
  v2 = objc_opt_class();
  uint64_t v3 = [*(id *)(a1 + 32) showWebsiteAndAppCounts];
  id v4 = [*(id *)(a1 + 32) specifier];
  BOOL v5 = [v4 objectForKeyedSubscript:@"PUIReportDomainListShowIPAddresses"];
  uint64_t v6 = [v5 BOOLValue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__PUIReportDomainListController_specifiers__block_invoke_5;
  v7[3] = &unk_1E6E9DB58;
  v7[4] = *(void *)(a1 + 32);
  [v2 domainSpecifiersWithLimit:0 showDates:0 showAppAndWebsiteCounts:v3 showIPAddresses:v6 completion:v7];
}

void __43__PUIReportDomainListController_specifiers__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PUIReportDomainListController_specifiers__block_invoke_6;
  v5[3] = &unk_1E6E9CBA0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __43__PUIReportDomainListController_specifiers__block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) setCachedSpecifiers:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 reloadSpecifiers];
}

uint64_t __43__PUIReportDomainListController_specifiers__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (void)dataDidChange
{
  [(PUIReportDomainListController *)self setCachedSpecifiers:0];
  [(PUIReportDomainListController *)self reloadSpecifiers];
}

- (void)sortByWasTapped
{
  id v3 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  id v4 = (void *)MEMORY[0x1E4FB1410];
  BOOL v5 = PUI_LocalizedStringForAppReport(@"MOST_ACTIVE_DOMAIN");
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__PUIReportDomainListController_sortByWasTapped__block_invoke;
  v14[3] = &unk_1E6E9D610;
  v14[4] = self;
  id v6 = [v4 actionWithTitle:v5 style:0 handler:v14];

  objc_msgSend(v6, "_setChecked:", -[PUIReportDomainListController alphabeticalSort](self, "alphabeticalSort") ^ 1);
  [v3 addAction:v6];
  uint64_t v7 = (void *)MEMORY[0x1E4FB1410];
  id v8 = PUI_LocalizedStringForAppReport(@"ALPHABETICAL");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__PUIReportDomainListController_sortByWasTapped__block_invoke_2;
  v13[3] = &unk_1E6E9D610;
  v13[4] = self;
  id v9 = [v7 actionWithTitle:v8 style:0 handler:v13];

  objc_msgSend(v9, "_setChecked:", -[PUIReportDomainListController alphabeticalSort](self, "alphabeticalSort"));
  [v3 addAction:v9];
  v10 = (void *)MEMORY[0x1E4FB1410];
  BOOL v11 = PUI_LocalizedStringForAppReport(@"CANCEL");
  id v12 = [v10 actionWithTitle:v11 style:1 handler:0];

  [v3 addAction:v12];
  [(PUIReportDomainListController *)self presentViewController:v3 animated:1 completion:0];
}

uint64_t __48__PUIReportDomainListController_sortByWasTapped__block_invoke(uint64_t a1)
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

uint64_t __48__PUIReportDomainListController_sortByWasTapped__block_invoke_2(uint64_t a1)
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

- (BOOL)alphabeticalSort
{
  return self->_alphabeticalSort;
}

- (void)setAlphabeticalSort:(BOOL)a3
{
  self->_alphabeticalSort = a3;
}

- (BOOL)showWebsiteAndAppCounts
{
  return self->_showWebsiteAndAppCounts;
}

- (void)setShowWebsiteAndAppCounts:(BOOL)a3
{
  self->_showWebsiteAndAppCounts = a3;
}

- (void).cxx_destruct
{
}

@end