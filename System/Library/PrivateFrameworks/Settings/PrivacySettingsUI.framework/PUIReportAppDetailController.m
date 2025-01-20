@interface PUIReportAppDetailController
- (BOOL)shouldShowOtherContent;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (NSArray)domainRows;
- (NSArray)domainRowsAwaitingDisplay;
- (NSArray)otherRows;
- (NSArray)otherRowsAwaitingDisplay;
- (NSArray)websiteRows;
- (NSArray)websiteRowsAwaitingDisplay;
- (NSString)bundleID;
- (PSSpecifier)domainHeader;
- (PSSpecifier)otherHeader;
- (PSSpecifier)websiteHeader;
- (PUIReportAppDetailController)init;
- (id)domainsSpecifiersFromResults:(id)a3;
- (id)otherSpecifiersFromResults:(id)a3;
- (id)specifiers;
- (id)valueForSpecifier:(id)a3;
- (id)websiteSpecifiersFromResults:(id)a3;
- (void)dataDidChange;
- (void)reloadAsyncSpecifiers;
- (void)setBundleID:(id)a3;
- (void)setDomainHeader:(id)a3;
- (void)setDomainRows:(id)a3;
- (void)setDomainRowsAwaitingDisplay:(id)a3;
- (void)setOtherHeader:(id)a3;
- (void)setOtherRows:(id)a3;
- (void)setOtherRowsAwaitingDisplay:(id)a3;
- (void)setWebsiteHeader:(id)a3;
- (void)setWebsiteRows:(id)a3;
- (void)setWebsiteRowsAwaitingDisplay:(id)a3;
@end

@implementation PUIReportAppDetailController

- (PUIReportAppDetailController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PUIReportAppDetailController;
  v2 = [(PUIReportAppDetailController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_dataDidChange name:*MEMORY[0x1E4FB2628] object:0];
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_super v5 = objc_opt_new();
    v6 = [(PUIReportAppDetailController *)self bundleID];

    if (!v6)
    {
      v7 = [(PUIReportAppDetailController *)self specifier];
      v8 = [v7 objectForKeyedSubscript:@"PUIReportAppIDKey"];
      [(PUIReportAppDetailController *)self setBundleID:v8];
    }
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = [(PUIReportAppDetailController *)self bundleID];
    PUIAnalyticsLogView(v10, v11, 0);

    id v12 = objc_alloc(MEMORY[0x1E4F223C8]);
    v13 = [(PUIReportAppDetailController *)self bundleID];
    v14 = (void *)[v12 initWithBundleIdentifier:v13 allowPlaceholder:0 error:0];

    v15 = [v14 localizedName];
    v16 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"APP_GROUP"];
    if (![(PUIReportAppDetailController *)self shouldShowOtherContent])
    {
      v17 = PUI_LocalizedStringForAppReport(@"APP_UPDATE_FOOTER");
      [v16 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F93170]];
    }
    [v5 addObject:v16];
    v18 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v19 = [v15 length];
    v20 = v15;
    if (!v19)
    {
      v20 = [(PUIReportAppDetailController *)self bundleID];
    }
    v21 = [v18 preferenceSpecifierNamed:v20 target:self set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];
    if (!v19) {

    }
    [v21 setIdentifier:@"APP"];
    v22 = [(PUIReportAppDetailController *)self bundleID];
    [v21 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F931C0]];

    [v21 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F931D0]];
    [v21 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F930A8]];
    v23 = [v14 iTunesMetadata];
    v24 = [v23 artistName];
    uint64_t v25 = [v24 length];

    if (v25)
    {
      v26 = NSString;
      v27 = PUI_LocalizedStringForAppReport(@"OWNED_BY_%@");
      v28 = [v14 iTunesMetadata];
      [v28 artistName];
      uint64_t v50 = v3;
      v29 = v14;
      v30 = v15;
      v31 = v16;
      v33 = v32 = v5;
      v34 = objc_msgSend(v26, "stringWithFormat:", v27, v33);
      [v21 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F93250]];

      objc_super v5 = v32;
      v16 = v31;
      v15 = v30;
      v14 = v29;
      uint64_t v3 = v50;
    }
    [v5 addObject:v21];
    if ([(PUIReportAppDetailController *)self shouldShowOtherContent]) {
      v35 = @"DOMAINS_CONTACTED_DIRECTLY_BY_APP";
    }
    else {
      v35 = @"DOMAINS_CONTACTED_BY_APP";
    }
    v36 = (void *)MEMORY[0x1E4F92E70];
    v37 = PUI_LocalizedStringForAppReport(v35);
    v38 = [v36 groupSpecifierWithID:@"DOMAINS_GROUP" name:v37];
    [(PUIReportAppDetailController *)self setDomainHeader:v38];

    v39 = (void *)MEMORY[0x1E4F92E70];
    v40 = PUI_LocalizedStringForAppReport(@"WEBSITES_VISITED_IN_APP");
    v41 = [v39 groupSpecifierWithID:@"WEBSITES_GROUP" name:v40];
    [(PUIReportAppDetailController *)self setWebsiteHeader:v41];

    v42 = (objc_class *)objc_opt_class();
    v43 = NSStringFromClass(v42);
    v44 = [(PUIReportAppDetailController *)self websiteHeader];
    [v44 setObject:v43 forKeyedSubscript:*MEMORY[0x1E4F93140]];

    v45 = (void *)MEMORY[0x1E4F92E70];
    v46 = PUI_LocalizedStringForAppReport(@"DOMAINS_CONTACTED_DIRECTLY_BY_OTHER_CONTENT");
    v47 = [v45 groupSpecifierWithID:@"OTHER_GROUP" name:v46];
    [(PUIReportAppDetailController *)self setOtherHeader:v47];

    v48 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)dataDidChange
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _PUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[PUIReportAppDetailController dataDidChange]";
    _os_log_impl(&dword_1E4AD5000, v3, OS_LOG_TYPE_DEFAULT, "%s: Starting page load", buf, 0xCu);
  }

  v4 = PUILogForCategory(1uLL);
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, "PUIReportAppDetailController.load");

  v6 = PUILogForCategory(1uLL);
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E4AD5000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PUIReportAppDetailController.load", "", buf, 2u);
  }
  os_signpost_id_t v21 = v5;

  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v9 = objc_opt_new();
  uint64_t v10 = *MEMORY[0x1E4FA9008];
  [v9 setObject:&unk_1F40804B8 forKeyedSubscript:*MEMORY[0x1E4FA9008]];
  uint64_t v11 = *MEMORY[0x1E4FA8FE8];
  [v9 setObject:&unk_1F40804D0 forKeyedSubscript:*MEMORY[0x1E4FA8FE8]];
  id v12 = [(PUIReportAppDetailController *)self bundleID];
  uint64_t v13 = *MEMORY[0x1E4FA8FD0];
  [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4FA8FD0]];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __45__PUIReportAppDetailController_dataDidChange__block_invoke;
  v27[3] = &unk_1E6E9DB08;
  v27[4] = self;
  v14 = v8;
  v28 = v14;
  +[PUITrackingReportManager queryWithOptions:v9 reply:v27];
  dispatch_group_enter(v14);
  v15 = objc_opt_new();
  uint64_t v16 = v10;
  [v15 setObject:&unk_1F40804E8 forKeyedSubscript:v10];
  [v15 setObject:&unk_1F40804D0 forKeyedSubscript:v11];
  v17 = [(PUIReportAppDetailController *)self bundleID];
  [v15 setObject:v17 forKeyedSubscript:v13];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __45__PUIReportAppDetailController_dataDidChange__block_invoke_55;
  v25[3] = &unk_1E6E9DB08;
  v25[4] = self;
  v18 = v14;
  v26 = v18;
  +[PUITrackingReportManager queryWithOptions:v15 reply:v25];
  if ([(PUIReportAppDetailController *)self shouldShowOtherContent])
  {
    dispatch_group_enter(v18);
    uint64_t v19 = objc_opt_new();
    [v19 setObject:&unk_1F4080500 forKeyedSubscript:v16];
    [v19 setObject:&unk_1F40804D0 forKeyedSubscript:v11];
    v20 = [(PUIReportAppDetailController *)self bundleID];
    [v19 setObject:v20 forKeyedSubscript:v13];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __45__PUIReportAppDetailController_dataDidChange__block_invoke_59;
    v23[3] = &unk_1E6E9DB08;
    v23[4] = self;
    v24 = v18;
    +[PUITrackingReportManager queryWithOptions:v19 reply:v23];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PUIReportAppDetailController_dataDidChange__block_invoke_3;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v21;
  dispatch_group_notify(v18, MEMORY[0x1E4F14428], block);
}

void __45__PUIReportAppDetailController_dataDidChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v4 = [a2 objectForKeyedSubscript:@"result"];
  os_signpost_id_t v5 = [v3 domainsSpecifiersFromResults:v4];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PUIReportAppDetailController_dataDidChange__block_invoke_2;
  block[3] = &unk_1E6E9CCB8;
  v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __45__PUIReportAppDetailController_dataDidChange__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setDomainRowsAwaitingDisplay:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) reloadAsyncSpecifiers];
  v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

void __45__PUIReportAppDetailController_dataDidChange__block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v4 = [a2 objectForKeyedSubscript:@"result"];
  os_signpost_id_t v5 = [v3 websiteSpecifiersFromResults:v4];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PUIReportAppDetailController_dataDidChange__block_invoke_2_56;
  block[3] = &unk_1E6E9CCB8;
  v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __45__PUIReportAppDetailController_dataDidChange__block_invoke_2_56(uint64_t a1)
{
  [*(id *)(a1 + 32) setWebsiteRowsAwaitingDisplay:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) reloadAsyncSpecifiers];
  v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

void __45__PUIReportAppDetailController_dataDidChange__block_invoke_59(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v4 = [a2 objectForKeyedSubscript:@"result"];
  os_signpost_id_t v5 = [v3 otherSpecifiersFromResults:v4];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PUIReportAppDetailController_dataDidChange__block_invoke_2_60;
  block[3] = &unk_1E6E9CCB8;
  v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __45__PUIReportAppDetailController_dataDidChange__block_invoke_2_60(uint64_t a1)
{
  [*(id *)(a1 + 32) setOtherRowsAwaitingDisplay:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) reloadAsyncSpecifiers];
  v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

void __45__PUIReportAppDetailController_dataDidChange__block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = PUILogForCategory(1uLL);
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl(&dword_1E4AD5000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PUIReportAppDetailController.load", "", (uint8_t *)&v6, 2u);
  }

  os_signpost_id_t v5 = _PUILoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[PUIReportAppDetailController dataDidChange]_block_invoke";
    _os_log_impl(&dword_1E4AD5000, v5, OS_LOG_TYPE_DEFAULT, "%s: Finished page load", (uint8_t *)&v6, 0xCu);
  }
}

- (void)reloadAsyncSpecifiers
{
  v55[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PUIReportAppDetailController *)self specifierForID:@"APP"];
  os_signpost_id_t v4 = [(PUIReportAppDetailController *)self domainRows];
  os_signpost_id_t v5 = [(PUIReportAppDetailController *)self domainRowsAwaitingDisplay];
  int v6 = [(PUIReportAppDetailController *)self domainHeader];
  v55[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
  uint64_t v8 = [(PSListController *)self pui_replaceRows:v4 withRows:v5 header:v7 insertPoint:v3];

  id v9 = [(PUIReportAppDetailController *)self domainRowsAwaitingDisplay];
  [(PUIReportAppDetailController *)self setDomainRows:v9];

  id v10 = [(PUIReportAppDetailController *)self websiteRows];
  uint64_t v11 = [(PUIReportAppDetailController *)self websiteRowsAwaitingDisplay];
  id v12 = [(PUIReportAppDetailController *)self websiteHeader];
  v54 = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
  v14 = [(PSListController *)self pui_replaceRows:v10 withRows:v11 header:v13 insertPoint:v8];

  v15 = [(PUIReportAppDetailController *)self websiteRowsAwaitingDisplay];
  [(PUIReportAppDetailController *)self setWebsiteRows:v15];

  if ([(PUIReportAppDetailController *)self shouldShowOtherContent])
  {
    uint64_t v16 = [(PUIReportAppDetailController *)self otherRows];
    v17 = [(PUIReportAppDetailController *)self otherRowsAwaitingDisplay];
    v18 = [(PUIReportAppDetailController *)self otherHeader];
    v53 = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
    uint64_t v20 = [(PSListController *)self pui_replaceRows:v16 withRows:v17 header:v19 insertPoint:v14];

    os_signpost_id_t v21 = [(PUIReportAppDetailController *)self otherRowsAwaitingDisplay];
    [(PUIReportAppDetailController *)self setOtherRows:v21];

    v14 = (void *)v20;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v22 = [(PUIReportAppDetailController *)self websiteRows];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v49;
    while (2)
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v49 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = [*(id *)(*((void *)&v48 + 1) + 8 * i) objectForKeyedSubscript:@"PUITrackerBarShowAppAttributedBadgeKey"];
        char v28 = [v27 BOOLValue];

        if (v28)
        {

          v29 = (objc_class *)objc_opt_class();
          v30 = NSStringFromClass(v29);
          uint64_t v31 = [(PUIReportAppDetailController *)self websiteHeader];
          [v31 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F93140]];

          v32 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
          v33 = [(PUIReportAppDetailController *)self websiteHeader];
          [v33 setObject:v32 forKeyedSubscript:@"PUIAttributedStringTextViewDelegateKey"];

          v34 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"appstore"];
          v22 = [v34 imageWithRenderingMode:2];

          v35 = NSString;
          v36 = PUI_LocalizedStringForAppReport(@"WEBSITE_UNVERIFIED_CONTEXT_FOOTER");
          v37 = objc_msgSend(v35, "stringWithFormat:", v36, @"SF_SYMBOL_APPSTORE");

          v38 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v37];
          id v39 = +[PUIAttributedStringFooter string:v38 replacingSubstring:@"SF_SYMBOL_APPSTORE" withImage:v22];
          id v40 = objc_alloc(MEMORY[0x1E4F28E48]);
          v41 = PUI_LocalizedStringForAppReport(@"WEBSITE_UNVERIFIED_CONTEXT_FOOTER_LINK");
          v42 = (void *)[v40 initWithString:v41];

          uint64_t v43 = *MEMORY[0x1E4FB0720];
          v44 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1F4072988];
          objc_msgSend(v42, "addAttribute:value:range:", v43, v44, 0, objc_msgSend(v42, "length"));

          v45 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
          [v38 appendAttributedString:v45];

          [v38 appendAttributedString:v42];
          v46 = [(PUIReportAppDetailController *)self websiteHeader];
          [v46 setObject:v38 forKeyedSubscript:@"PUIAttributedStringFooterStringKey"];

          goto LABEL_13;
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v24) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  v47 = [(PUIReportAppDetailController *)self websiteHeader];
  [(PUIReportAppDetailController *)self reloadSpecifier:v47];
}

- (id)domainsSpecifiersFromResults:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = objc_opt_new();
  int v6 = [(PUIReportAppDetailController *)self bundleID];
  id v7 = +[PUIReportDomainListController domainSpecifiersFromResults:v4 showDates:1 showAppAndWebsiteCounts:0 app:v6 appOther:0 website:0];

  uint64_t v8 = (void *)[v7 mutableCopy];
  unint64_t v9 = [v8 count];
  unint64_t v10 = [v8 count];
  if (v10 >= 5) {
    uint64_t v11 = 5;
  }
  else {
    uint64_t v11 = v10;
  }
  id v12 = objc_msgSend(v8, "subarrayWithRange:", 0, v11);
  uint64_t v13 = (void *)[v12 mutableCopy];

  if (v9 >= 6)
  {
    v14 = (void *)MEMORY[0x1E4F92E70];
    v15 = PUI_LocalizedStringForAppReport(@"SHOW_ALL");
    uint64_t v16 = [v14 preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v16 setIdentifier:@"SHOW_ALL_DOMAIN"];
    v17 = [(PUIReportAppDetailController *)self bundleID];
    [v16 setObject:v17 forKeyedSubscript:@"PUIReportDomainListEntries"];

    [v13 addObject:v16];
  }
  [v5 addObjectsFromArray:v13];
  v18 = (void *)[v5 copy];

  return v18;
}

- (id)websiteSpecifiersFromResults:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = objc_opt_new();
  int v6 = +[PUIReportWebsiteListController websiteSpecifiersFromResults:v4 showDetail:1];

  id v7 = (void *)[v6 mutableCopy];
  unint64_t v8 = [v7 count];
  unint64_t v9 = [v7 count];
  if (v9 >= 5) {
    uint64_t v10 = 5;
  }
  else {
    uint64_t v10 = v9;
  }
  uint64_t v11 = objc_msgSend(v7, "subarrayWithRange:", 0, v10);
  id v12 = (void *)[v11 mutableCopy];

  if (v8 >= 6)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F92E70];
    v14 = PUI_LocalizedStringForAppReport(@"SHOW_ALL");
    v15 = [v13 preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v15 setIdentifier:@"SHOW_ALL_WEBSITE"];
    uint64_t v16 = [(PUIReportAppDetailController *)self bundleID];
    [v15 setObject:v16 forKeyedSubscript:@"PUIReportWebsiteListApp"];

    [v12 addObject:v15];
  }
  [v5 addObjectsFromArray:v12];
  v17 = (void *)[v5 copy];

  return v17;
}

- (id)otherSpecifiersFromResults:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = objc_opt_new();
  int v6 = [(PUIReportAppDetailController *)self bundleID];
  id v7 = +[PUIReportDomainListController domainSpecifiersFromResults:v4 showDates:1 showAppAndWebsiteCounts:0 app:0 appOther:v6 website:0];

  unint64_t v8 = (void *)[v7 mutableCopy];
  unint64_t v9 = [v8 count];
  unint64_t v10 = [v8 count];
  if (v10 >= 5) {
    uint64_t v11 = 5;
  }
  else {
    uint64_t v11 = v10;
  }
  id v12 = objc_msgSend(v8, "subarrayWithRange:", 0, v11);
  uint64_t v13 = (void *)[v12 mutableCopy];

  if (v9 >= 6)
  {
    v14 = (void *)MEMORY[0x1E4F92E70];
    v15 = PUI_LocalizedStringForAppReport(@"SHOW_ALL");
    uint64_t v16 = [v14 preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v16 setIdentifier:@"SHOW_ALL_OTHER"];
    v17 = [(PUIReportAppDetailController *)self bundleID];
    [v16 setObject:v17 forKeyedSubscript:@"PUIReportDomainListAppOther"];

    [v13 addObject:v16];
  }
  [v5 addObjectsFromArray:v13];
  v18 = (void *)[v5 copy];

  return v18;
}

- (id)valueForSpecifier:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F93250]];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7 = objc_alloc(MEMORY[0x1E4F83AE8]);
  unint64_t v8 = PUI_LocalizedStringForAppReport(@"LEARN_MORE_TITLE");
  unint64_t v9 = (void *)[v7 initWithTitle:v8 detailText:0 symbolName:0 contentLayout:2];

  unint64_t v10 = PUI_LocalizedStringForAppReport(@"LEARN_MORE_TEXT");
  [v9 addSectionWithHeader:0 content:v10];

  id v11 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v12 = (void *)MEMORY[0x1E4FB13F0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__PUIReportAppDetailController_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
  v19[3] = &unk_1E6E9C708;
  id v20 = v9;
  id v13 = v9;
  v14 = [v12 actionWithHandler:v19];
  v15 = (void *)[v11 initWithBarButtonSystemItem:0 primaryAction:v14];

  uint64_t v16 = [v13 navigationItem];
  [v16 setRightBarButtonItem:v15];

  v17 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v13];
  [(PUIReportAppDetailController *)self presentModalViewController:v17 withTransition:3];

  return 0;
}

void __83__PUIReportAppDetailController_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)shouldShowOtherContent
{
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  id v4 = [(PUIReportAppDetailController *)self bundleID];
  os_signpost_id_t v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];
  int v6 = [v5 SDKVersion];

  uint64_t v7 = [v6 compare:@"15.0" options:64];
  return v7 >= 0;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
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

- (PSSpecifier)websiteHeader
{
  return self->_websiteHeader;
}

- (void)setWebsiteHeader:(id)a3
{
}

- (NSArray)websiteRows
{
  return self->_websiteRows;
}

- (void)setWebsiteRows:(id)a3
{
}

- (NSArray)websiteRowsAwaitingDisplay
{
  return self->_websiteRowsAwaitingDisplay;
}

- (void)setWebsiteRowsAwaitingDisplay:(id)a3
{
}

- (PSSpecifier)otherHeader
{
  return self->_otherHeader;
}

- (void)setOtherHeader:(id)a3
{
}

- (NSArray)otherRows
{
  return self->_otherRows;
}

- (void)setOtherRows:(id)a3
{
}

- (NSArray)otherRowsAwaitingDisplay
{
  return self->_otherRowsAwaitingDisplay;
}

- (void)setOtherRowsAwaitingDisplay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_otherRows, 0);
  objc_storeStrong((id *)&self->_otherHeader, 0);
  objc_storeStrong((id *)&self->_websiteRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_websiteRows, 0);
  objc_storeStrong((id *)&self->_websiteHeader, 0);
  objc_storeStrong((id *)&self->_domainRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_domainRows, 0);
  objc_storeStrong((id *)&self->_domainHeader, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end