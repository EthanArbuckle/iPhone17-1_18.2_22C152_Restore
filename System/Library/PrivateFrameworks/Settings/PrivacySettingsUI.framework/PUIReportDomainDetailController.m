@interface PUIReportDomainDetailController
- (NSArray)appRows;
- (NSArray)appRowsAwaitingDisplay;
- (NSArray)websiteRows;
- (NSArray)websiteRowsAwaitingDisplay;
- (NSString)domain;
- (PSSpecifier)appHeader;
- (PSSpecifier)websiteHeader;
- (PUIReportDomainDetailController)init;
- (id)appSpecifiersFromResults:(id)a3;
- (id)iconForContext:(id)a3;
- (id)nameForAppID:(id)a3;
- (id)specifiers;
- (id)timeStringForDate:(id)a3;
- (id)valueForSpecifier:(id)a3;
- (id)websiteSpecifiersFromResults:(id)a3;
- (void)dataDidChange;
- (void)didTapLearnMore;
- (void)reloadAsyncSpecifiers;
- (void)setAppHeader:(id)a3;
- (void)setAppRows:(id)a3;
- (void)setAppRowsAwaitingDisplay:(id)a3;
- (void)setDomain:(id)a3;
- (void)setWebsiteHeader:(id)a3;
- (void)setWebsiteRows:(id)a3;
- (void)setWebsiteRowsAwaitingDisplay:(id)a3;
@end

@implementation PUIReportDomainDetailController

- (PUIReportDomainDetailController)init
{
  v7.receiver = self;
  v7.super_class = (Class)PUIReportDomainDetailController;
  v2 = [(PUIReportDomainDetailController *)&v7 init];
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
    v6 = [(PUIReportDomainDetailController *)self domain];

    if (!v6)
    {
      objc_super v7 = [(PUIReportDomainDetailController *)self specifier];
      v8 = [v7 objectForKeyedSubscript:@"PUIReportDomainKey"];
      [(PUIReportDomainDetailController *)self setDomain:v8];
    }
    v9 = [(PUIReportDomainDetailController *)self specifier];
    v10 = [v9 objectForKeyedSubscript:@"PUIReportDomainDetailTrackerTypeKey"];
    uint64_t v11 = [v10 integerValue];

    v12 = [(PUIReportDomainDetailController *)self specifier];
    v39 = [v12 objectForKeyedSubscript:@"PUIReportDomainDetailOwnerKey"];

    v13 = [(PUIReportDomainDetailController *)self domain];
    v14 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"OWNED_BY_GROUP"];
    uint64_t v15 = PUI_LocalizedStringForAppReport(@"OWNED_BY_FOOTER_LINK");
    v16 = NSString;
    if (v11 == 1) {
      v17 = @"OWNED_BY_TRACKER_FOOTER";
    }
    else {
      v17 = @"OWNED_BY_FOOTER";
    }
    v18 = PUI_LocalizedStringForAppReport(v17);
    v19 = [v16 stringWithFormat:@"%@ %@", v18, v15];

    [v14 setProperty:v19 forKey:*MEMORY[0x1E4F93160]];
    v40 = (void *)v15;
    v42.location = [v19 rangeOfString:v15];
    v20 = NSStringFromRange(v42);
    [v14 setProperty:v20 forKey:*MEMORY[0x1E4F93150]];

    v21 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [v14 setProperty:v21 forKey:*MEMORY[0x1E4F93158]];

    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    [v14 setProperty:v23 forKey:*MEMORY[0x1E4F93140]];

    [v14 setProperty:@"didTapLearnMore" forKey:*MEMORY[0x1E4F93148]];
    [v14 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F93170]];
    v24 = v5;
    [v5 addObject:v14];
    v25 = (void *)MEMORY[0x1E4F92E70];
    v26 = PUI_LocalizedStringForAppReport(@"DOMAIN");
    v27 = [v25 preferenceSpecifierNamed:v26 target:self set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];

    [v27 setIdentifier:@"DOMAIN"];
    [v27 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F930A8]];
    [v27 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F93250]];
    if ([v39 length])
    {
      v28 = NSString;
      v29 = PUI_LocalizedStringForAppReport(@"OWNED_BY_%@");
      v30 = objc_msgSend(v28, "stringWithFormat:", v29, v39);
      [v27 setObject:v30 forKeyedSubscript:@"PUITrackerCellSubtitleTextKey"];
    }
    [v24 addObject:v27];
    v31 = (void *)MEMORY[0x1E4F92E70];
    v32 = PUI_LocalizedStringForAppReport(@"APPS_CONTACTING_DOMAIN");
    v33 = [v31 groupSpecifierWithID:@"APPS_CONTACTING_TRACKER_GROUP" name:v32];
    [(PUIReportDomainDetailController *)self setAppHeader:v33];

    v34 = (void *)MEMORY[0x1E4F92E70];
    v35 = PUI_LocalizedStringForAppReport(@"SITES_CONTACTING_DOMAIN");
    v36 = [v34 groupSpecifierWithID:@"SITES_CONTACTING_TRACKER_GROUP" name:v35];
    [(PUIReportDomainDetailController *)self setWebsiteHeader:v36];

    v37 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v24;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)dataDidChange
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _PUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[PUIReportDomainDetailController dataDidChange]";
    _os_log_impl(&dword_1E4AD5000, v3, OS_LOG_TYPE_DEFAULT, "%s: Starting page load", buf, 0xCu);
  }

  v4 = PUILogForCategory(1uLL);
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, "PUIReportDomainDetailController.load");

  v6 = PUILogForCategory(1uLL);
  objc_super v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E4AD5000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PUIReportDomainDetailController.load", "", buf, 2u);
  }

  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v9 = objc_opt_new();
  uint64_t v10 = *MEMORY[0x1E4FA9008];
  [v9 setObject:&unk_1F4080548 forKeyedSubscript:*MEMORY[0x1E4FA9008]];
  uint64_t v11 = [(PUIReportDomainDetailController *)self domain];
  uint64_t v12 = *MEMORY[0x1E4FA8FE0];
  [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4FA8FE0]];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __48__PUIReportDomainDetailController_dataDidChange__block_invoke;
  v20[3] = &unk_1E6E9DB08;
  v20[4] = self;
  v13 = v8;
  v21 = v13;
  +[PUITrackingReportManager queryWithOptions:v9 reply:v20];
  dispatch_group_enter(v13);
  v14 = objc_opt_new();
  [v14 setObject:&unk_1F4080560 forKeyedSubscript:v10];
  uint64_t v15 = [(PUIReportDomainDetailController *)self domain];
  [v14 setObject:v15 forKeyedSubscript:v12];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __48__PUIReportDomainDetailController_dataDidChange__block_invoke_92;
  v18[3] = &unk_1E6E9DB08;
  v18[4] = self;
  v19 = v13;
  v16 = v13;
  +[PUITrackingReportManager queryWithOptions:v14 reply:v18];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PUIReportDomainDetailController_dataDidChange__block_invoke_3;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v5;
  dispatch_group_notify(v16, MEMORY[0x1E4F14428], block);
}

void __48__PUIReportDomainDetailController_dataDidChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v4 = [a2 objectForKeyedSubscript:@"result"];
  os_signpost_id_t v5 = [v3 appSpecifiersFromResults:v4];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PUIReportDomainDetailController_dataDidChange__block_invoke_2;
  block[3] = &unk_1E6E9CCB8;
  v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __48__PUIReportDomainDetailController_dataDidChange__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAppRowsAwaitingDisplay:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) reloadAsyncSpecifiers];
  v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

void __48__PUIReportDomainDetailController_dataDidChange__block_invoke_92(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v4 = [a2 objectForKeyedSubscript:@"result"];
  os_signpost_id_t v5 = [v3 websiteSpecifiersFromResults:v4];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PUIReportDomainDetailController_dataDidChange__block_invoke_2_93;
  block[3] = &unk_1E6E9CCB8;
  v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __48__PUIReportDomainDetailController_dataDidChange__block_invoke_2_93(uint64_t a1)
{
  [*(id *)(a1 + 32) setWebsiteRowsAwaitingDisplay:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) reloadAsyncSpecifiers];
  v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

void __48__PUIReportDomainDetailController_dataDidChange__block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = PUILogForCategory(1uLL);
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl(&dword_1E4AD5000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PUIReportDomainDetailController.load", "", (uint8_t *)&v6, 2u);
  }

  os_signpost_id_t v5 = _PUILoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[PUIReportDomainDetailController dataDidChange]_block_invoke";
    _os_log_impl(&dword_1E4AD5000, v5, OS_LOG_TYPE_DEFAULT, "%s: Finished page load", (uint8_t *)&v6, 0xCu);
  }
}

- (void)reloadAsyncSpecifiers
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PUIReportDomainDetailController *)self specifierForID:@"DOMAIN"];
  os_signpost_id_t v4 = [(PUIReportDomainDetailController *)self appRows];
  os_signpost_id_t v5 = [(PUIReportDomainDetailController *)self appRowsAwaitingDisplay];
  int v6 = [(PUIReportDomainDetailController *)self appHeader];
  v17[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  uint64_t v8 = [(PSListController *)self pui_replaceRows:v4 withRows:v5 header:v7 insertPoint:v3];

  id v9 = [(PUIReportDomainDetailController *)self appRowsAwaitingDisplay];
  [(PUIReportDomainDetailController *)self setAppRows:v9];

  id v10 = [(PUIReportDomainDetailController *)self websiteRows];
  uint64_t v11 = [(PUIReportDomainDetailController *)self websiteRowsAwaitingDisplay];
  uint64_t v12 = [(PUIReportDomainDetailController *)self websiteHeader];
  v16 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v14 = [(PSListController *)self pui_replaceRows:v10 withRows:v11 header:v13 insertPoint:v8];

  uint64_t v15 = [(PUIReportDomainDetailController *)self websiteRowsAwaitingDisplay];
  [(PUIReportDomainDetailController *)self setWebsiteRows:v15];
}

- (id)appSpecifiersFromResults:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v24 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v23 = *(void *)v26;
    uint64_t v22 = *MEMORY[0x1E4F931C0];
    uint64_t v7 = *MEMORY[0x1E4F931D0];
    uint64_t v8 = *MEMORY[0x1E4F93250];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = [v10 objectForKeyedSubscript:@"bundleName"];
        uint64_t v12 = (void *)MEMORY[0x1E4F92E70];
        v13 = [(PUIReportDomainDetailController *)self nameForAppID:v11];
        v14 = [v12 preferenceSpecifierNamed:v13 target:self set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];

        [v14 setIdentifier:v11];
        [v14 setObject:v11 forKeyedSubscript:v22];
        [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v7];
        uint64_t v15 = (void *)MEMORY[0x1E4F1C9C8];
        v16 = [v10 objectForKeyedSubscript:@"maxTimeStamp"];
        v17 = objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v16, "integerValue"));

        v18 = [(PUIReportDomainDetailController *)self timeStringForDate:v17];
        [v14 setObject:v18 forKeyedSubscript:v8];

        [v24 addObject:v14];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);
  }

  v19 = (void *)[v24 copy];
  return v19;
}

- (id)websiteSpecifiersFromResults:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v22 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v21 = *(void *)v24;
    uint64_t v7 = *MEMORY[0x1E4F93250];
    uint64_t v8 = *MEMORY[0x1E4F93190];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v11 = [v10 objectForKeyedSubscript:@"context"];
        uint64_t v12 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v11 target:self set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];
        [v12 setIdentifier:v11];
        v13 = (void *)MEMORY[0x1E4F1C9C8];
        v14 = [v10 objectForKeyedSubscript:@"maxTimeStamp"];
        uint64_t v15 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v14, "integerValue"));

        v16 = [(PUIReportDomainDetailController *)self timeStringForDate:v15];
        [v12 setObject:v16 forKeyedSubscript:v7];

        v17 = [(PUIReportDomainDetailController *)self iconForContext:v11];
        [v12 setObject:v17 forKeyedSubscript:v8];

        [v22 addObject:v12];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  v18 = (void *)[v22 copy];
  return v18;
}

- (void)didTapLearnMore
{
  id v3 = objc_alloc(MEMORY[0x1E4F83AE8]);
  id v4 = PUI_LocalizedStringForAppReport(@"LEARN_MORE_TITLE");
  uint64_t v5 = (void *)[v3 initWithTitle:v4 detailText:0 symbolName:0 contentLayout:2];

  uint64_t v6 = PUI_LocalizedStringForAppReport(@"LEARN_MORE_TEXT");
  [v5 addSectionWithHeader:0 content:v6];

  id v7 = objc_alloc(MEMORY[0x1E4FB14A8]);
  uint64_t v8 = (void *)MEMORY[0x1E4FB13F0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__PUIReportDomainDetailController_didTapLearnMore__block_invoke;
  v14[3] = &unk_1E6E9C708;
  id v15 = v5;
  id v9 = v5;
  id v10 = [v8 actionWithHandler:v14];
  uint64_t v11 = (void *)[v7 initWithBarButtonSystemItem:0 primaryAction:v10];

  uint64_t v12 = [v9 navigationItem];
  [v12 setRightBarButtonItem:v11];

  v13 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v9];
  [(PUIReportDomainDetailController *)self presentModalViewController:v13 withTransition:3];
}

void __50__PUIReportDomainDetailController_didTapLearnMore__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (id)nameForAppID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:0];
  if (!v4) {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifierOfSystemPlaceholder:v3 error:0];
  }
  id v5 = [v4 localizedName];
  if (!v5) {
    id v5 = v3;
  }

  return v5;
}

- (id)timeStringForDate:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
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
  id v4 = PUIWebsiteIconView();
  id v5 = objc_msgSend(v3, "substringWithRange:", 0, 1);

  uint64_t v6 = [v5 localizedUppercaseString];
  [v4 setText:v6];

  id v7 = PUIImageFromLabel(v4);

  return v7;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_websiteRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_websiteRows, 0);
  objc_storeStrong((id *)&self->_websiteHeader, 0);
  objc_storeStrong((id *)&self->_appRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_appRows, 0);
  objc_storeStrong((id *)&self->_appHeader, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end