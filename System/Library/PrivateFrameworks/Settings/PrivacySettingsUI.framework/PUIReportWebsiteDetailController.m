@interface PUIReportWebsiteDetailController
- (NSArray)appRows;
- (NSArray)appRowsAwaitingDisplay;
- (NSArray)domainRows;
- (NSArray)domainRowsAwaitingDisplay;
- (NSString)context;
- (PSSpecifier)appHeader;
- (PSSpecifier)domainHeader;
- (PUIReportWebsiteDetailController)init;
- (id)appSpecifiersFromResults:(id)a3;
- (id)domainsSpecifiersFromResults:(id)a3;
- (id)iconForContext:(id)a3;
- (id)specifiers;
- (id)timeStringForDate:(id)a3;
- (id)valueForSpecifier:(id)a3;
- (void)dataDidChange;
- (void)reloadAsyncSpecifiers;
- (void)setAppHeader:(id)a3;
- (void)setAppRows:(id)a3;
- (void)setAppRowsAwaitingDisplay:(id)a3;
- (void)setContext:(id)a3;
- (void)setDomainHeader:(id)a3;
- (void)setDomainRows:(id)a3;
- (void)setDomainRowsAwaitingDisplay:(id)a3;
@end

@implementation PUIReportWebsiteDetailController

- (PUIReportWebsiteDetailController)init
{
  v7.receiver = self;
  v7.super_class = (Class)PUIReportWebsiteDetailController;
  v2 = [(PUIReportWebsiteDetailController *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_dataDidChange name:*MEMORY[0x1E4FB2628] object:0];

    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    PUIAnalyticsLogView(v5, 0, 0);
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = [(PUIReportWebsiteDetailController *)self context];

    if (!v6)
    {
      objc_super v7 = [(PUIReportWebsiteDetailController *)self specifier];
      v8 = [v7 objectForKeyedSubscript:@"PUIReportWebsiteKey"];
      [(PUIReportWebsiteDetailController *)self setContext:v8];
    }
    v9 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"CONTEXT_GROUP"];
    [v5 addObject:v9];
    v10 = (void *)MEMORY[0x1E4F92E70];
    v11 = [(PUIReportWebsiteDetailController *)self context];
    v12 = [v10 preferenceSpecifierNamed:v11 target:self set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];

    [v12 setIdentifier:@"CONTEXT"];
    [v12 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F930A8]];
    v13 = [(PUIReportWebsiteDetailController *)self context];
    v14 = [(PUIReportWebsiteDetailController *)self iconForContext:v13];
    [v12 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F93190]];

    [v5 addObject:v12];
    v15 = (void *)MEMORY[0x1E4F92E70];
    v16 = PUI_LocalizedStringForAppReport(@"DOMAINS_CONTACTED_BY_WEBSITE");
    v17 = [v15 groupSpecifierWithID:@"DOMAINS_GROUP" name:v16];
    [(PUIReportWebsiteDetailController *)self setDomainHeader:v17];

    v18 = (void *)MEMORY[0x1E4F92E70];
    v19 = PUI_LocalizedStringForAppReport(@"APPS_YOU_VIEWED_THIS_WEBSITE_IN");
    v20 = [v18 groupSpecifierWithID:@"APPS_GROUP" name:v19];
    [(PUIReportWebsiteDetailController *)self setAppHeader:v20];

    v21 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)dataDidChange
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _PUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[PUIReportWebsiteDetailController dataDidChange]";
    _os_log_impl(&dword_1E4AD5000, v3, OS_LOG_TYPE_DEFAULT, "%s: Starting page load", buf, 0xCu);
  }

  v4 = PUILogForCategory(1uLL);
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, "PUIReportWebsiteDetailController.load");

  v6 = PUILogForCategory(1uLL);
  objc_super v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E4AD5000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PUIReportWebsiteDetailController.load", "", buf, 2u);
  }

  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v9 = objc_opt_new();
  uint64_t v10 = *MEMORY[0x1E4FA9008];
  [v9 setObject:&unk_1F40805D8 forKeyedSubscript:*MEMORY[0x1E4FA9008]];
  v11 = [(PUIReportWebsiteDetailController *)self context];
  uint64_t v12 = *MEMORY[0x1E4FA9010];
  [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4FA9010]];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke;
  v25[3] = &unk_1E6E9DB08;
  v25[4] = self;
  v13 = v8;
  v26 = v13;
  +[PUITrackingReportManager queryWithOptions:v9 reply:v25];
  dispatch_group_enter(v13);
  v14 = objc_opt_new();
  [v14 setObject:&unk_1F40805F0 forKeyedSubscript:v10];
  [v14 setObject:&unk_1F4080608 forKeyedSubscript:*MEMORY[0x1E4FA8FE8]];
  v15 = [(PUIReportWebsiteDetailController *)self context];
  [v14 setObject:v15 forKeyedSubscript:v12];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_44;
  v23[3] = &unk_1E6E9DB08;
  v23[4] = self;
  v16 = v13;
  v24 = v16;
  +[PUITrackingReportManager queryWithOptions:v14 reply:v23];
  dispatch_group_enter(v16);
  v17 = objc_opt_new();
  [v17 setObject:&unk_1F4080620 forKeyedSubscript:v10];
  v18 = [(PUIReportWebsiteDetailController *)self context];
  [v17 setObject:v18 forKeyedSubscript:v12];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_48;
  v21[3] = &unk_1E6E9DB08;
  v21[4] = self;
  v22 = v16;
  v19 = v16;
  +[PUITrackingReportManager queryWithOptions:v17 reply:v21];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_3;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v5;
  dispatch_group_notify(v19, MEMORY[0x1E4F14428], block);
}

void __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_2;
  block[3] = &unk_1E6E9CCB8;
  v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_2(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) specifierForID:@"CONTEXT"];
  v2 = NSString;
  id v3 = PUI_LocalizedStringForAppReport(@"VISITED_N_TIMES");
  v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"result"];
  id v5 = [v4 firstObject];
  v6 = [v5 objectForKeyedSubscript:@"sumHits"];
  id v7 = objc_msgSend(v2, "localizedStringWithFormat:", v3, objc_msgSend(v6, "integerValue"));
  [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F93250]];

  [*(id *)(a1 + 32) reloadSpecifier:v8];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_44(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  v4 = [a2 objectForKeyedSubscript:@"result"];
  id v5 = [v3 domainsSpecifiersFromResults:v4];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_2_45;
  block[3] = &unk_1E6E9CCB8;
  v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_2_45(uint64_t a1)
{
  [*(id *)(a1 + 32) setDomainRowsAwaitingDisplay:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) reloadAsyncSpecifiers];
  v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

void __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_48(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  v4 = [a2 objectForKeyedSubscript:@"result"];
  id v5 = [v3 appSpecifiersFromResults:v4];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_2_49;
  block[3] = &unk_1E6E9CCB8;
  v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_2_49(uint64_t a1)
{
  [*(id *)(a1 + 32) setAppRowsAwaitingDisplay:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) reloadAsyncSpecifiers];
  v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

void __49__PUIReportWebsiteDetailController_dataDidChange__block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = PUILogForCategory(1uLL);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl(&dword_1E4AD5000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PUIReportWebsiteDetailController.load", "", (uint8_t *)&v6, 2u);
  }

  id v5 = _PUILoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[PUIReportWebsiteDetailController dataDidChange]_block_invoke";
    _os_log_impl(&dword_1E4AD5000, v5, OS_LOG_TYPE_DEFAULT, "%s: Finished page load", (uint8_t *)&v6, 0xCu);
  }
}

- (void)reloadAsyncSpecifiers
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PUIReportWebsiteDetailController *)self specifierForID:@"CONTEXT"];
  os_signpost_id_t v4 = [(PUIReportWebsiteDetailController *)self domainRows];
  id v5 = [(PUIReportWebsiteDetailController *)self domainRowsAwaitingDisplay];
  int v6 = [(PUIReportWebsiteDetailController *)self domainHeader];
  v17[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  uint64_t v8 = [(PSListController *)self pui_replaceRows:v4 withRows:v5 header:v7 insertPoint:v3];

  id v9 = [(PUIReportWebsiteDetailController *)self domainRowsAwaitingDisplay];
  [(PUIReportWebsiteDetailController *)self setDomainRows:v9];

  id v10 = [(PUIReportWebsiteDetailController *)self appRows];
  v11 = [(PUIReportWebsiteDetailController *)self appRowsAwaitingDisplay];
  uint64_t v12 = [(PUIReportWebsiteDetailController *)self appHeader];
  v16 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v14 = [(PSListController *)self pui_replaceRows:v10 withRows:v11 header:v13 insertPoint:v8];

  v15 = [(PUIReportWebsiteDetailController *)self appRowsAwaitingDisplay];
  [(PUIReportWebsiteDetailController *)self setAppRows:v15];
}

- (id)domainsSpecifiersFromResults:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  int v6 = [(PUIReportWebsiteDetailController *)self context];
  id v7 = +[PUIReportDomainListController domainSpecifiersFromResults:v4 showDates:1 showAppAndWebsiteCounts:0 app:0 appOther:0 website:v6];

  uint64_t v8 = (void *)[v7 mutableCopy];
  unint64_t v9 = [v8 count];
  unint64_t v10 = [v8 count];
  if (v10 >= 5) {
    uint64_t v11 = 5;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = objc_msgSend(v8, "subarrayWithRange:", 0, v11);
  v13 = (void *)[v12 mutableCopy];

  if (v9 >= 6)
  {
    v14 = (void *)MEMORY[0x1E4F92E70];
    v15 = PUI_LocalizedStringForAppReport(@"SHOW_ALL");
    v16 = [v14 preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v16 setIdentifier:@"SHOW_ALL_DOMAIN"];
    v17 = [(PUIReportWebsiteDetailController *)self context];
    [v16 setObject:v17 forKeyedSubscript:@"PUIReportDomainListWebsite"];

    [v13 addObject:v16];
  }
  [v5 addObjectsFromArray:v13];
  v18 = (void *)[v5 copy];

  return v18;
}

- (id)appSpecifiersFromResults:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22 = objc_opt_new();
  v27 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v25 = *MEMORY[0x1E4F931C0];
    uint64_t v26 = *(void *)v29;
    uint64_t v24 = *MEMORY[0x1E4F931D0];
    uint64_t v7 = *MEMORY[0x1E4F93250];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(obj);
        }
        unint64_t v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        unint64_t v10 = [v9 objectForKeyedSubscript:@"bundleName"];
        uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v10 allowPlaceholder:0 error:0];
        uint64_t v12 = [v11 localizedName];

        v13 = (void *)MEMORY[0x1E4F92E70];
        if ([v12 length]) {
          v14 = v12;
        }
        else {
          v14 = v10;
        }
        v15 = [v13 preferenceSpecifierNamed:v14 target:self set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];
        [v15 setIdentifier:v10];
        [v15 setObject:v10 forKeyedSubscript:v25];
        [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v24];
        v16 = (void *)MEMORY[0x1E4F1C9C8];
        v17 = [v9 objectForKeyedSubscript:@"maxTimeStamp"];
        v18 = objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v17, "integerValue"));

        v19 = [(PUIReportWebsiteDetailController *)self timeStringForDate:v18];
        [v15 setObject:v19 forKeyedSubscript:v7];

        [v27 addObject:v15];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v6);
  }

  [v27 sortUsingComparator:&__block_literal_global_20];
  [v22 addObjectsFromArray:v27];
  v20 = (void *)[v22 copy];

  return v20;
}

uint64_t __61__PUIReportWebsiteDetailController_appSpecifiersFromResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *MEMORY[0x1E4F93250];
  id v5 = a2;
  uint64_t v6 = [a3 objectForKeyedSubscript:v4];
  uint64_t v7 = [v5 objectForKeyedSubscript:v4];

  uint64_t v8 = [v6 compare:v7];
  return v8;
}

- (id)timeStringForDate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  [v4 setTimeStyle:1];
  [v4 setDateStyle:1];
  id v5 = [v4 stringFromDate:v3];

  return v5;
}

- (id)valueForSpecifier:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F93250]];
}

- (id)iconForContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = PUIWebsiteIconView();
  id v5 = objc_msgSend(v3, "substringWithRange:", 0, 1);

  uint64_t v6 = [v5 localizedUppercaseString];
  [v4 setText:v6];

  uint64_t v7 = PUIImageFromLabel(v4);

  return v7;
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (PSSpecifier)domainHeader
{
  return self->_domainHeader;
}

- (void)setDomainHeader:(id)a3
{
}

- (NSArray)domainRows
{
  return self->_domainRows;
}

- (void)setDomainRows:(id)a3
{
}

- (NSArray)domainRowsAwaitingDisplay
{
  return self->_domainRowsAwaitingDisplay;
}

- (void)setDomainRowsAwaitingDisplay:(id)a3
{
}

- (PSSpecifier)appHeader
{
  return self->_appHeader;
}

- (void)setAppHeader:(id)a3
{
}

- (NSArray)appRows
{
  return self->_appRows;
}

- (void)setAppRows:(id)a3
{
}

- (NSArray)appRowsAwaitingDisplay
{
  return self->_appRowsAwaitingDisplay;
}

- (void)setAppRowsAwaitingDisplay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_appRows, 0);
  objc_storeStrong((id *)&self->_appHeader, 0);
  objc_storeStrong((id *)&self->_domainRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_domainRows, 0);
  objc_storeStrong((id *)&self->_domainHeader, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end