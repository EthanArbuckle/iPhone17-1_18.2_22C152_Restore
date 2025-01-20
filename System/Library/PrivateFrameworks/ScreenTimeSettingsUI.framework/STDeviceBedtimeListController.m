@interface STDeviceBedtimeListController
- (BOOL)canAskForMoreTime;
- (BOOL)canBeShownFromSuspendedState;
- (NSArray)orderedLocalizedWeekdayNames;
- (NSArray)orderedWeekdayIndexes;
- (NSArray)weekdaySpecifiers;
- (NSTimer)downtimeScheduleRefreshTimer;
- (PSSpecifier)atBedtimeGroupSpecifier;
- (PSSpecifier)atBedtimeSpecifier;
- (PSSpecifier)customizeDaysSpecifier;
- (PSSpecifier)dailyScheduleSpecifier;
- (PSSpecifier)deviceBedtimeSpecifier;
- (PSSpecifier)downTimeGroupSpecifier;
- (PSSpecifier)everyDaySpecifier;
- (PSSpecifier)informativeTextGroupSpecifier;
- (PSSpecifier)scheduleSwitchGroupSpecifier;
- (PSSpecifier)scheduleTypeGroupSpecifier;
- (PSSpecifier)scheduledSwitchSpecifier;
- (PSSpecifier)timeGroupSpecifier;
- (STDeviceBedtime)bedtime;
- (STDeviceBedtimeListController)init;
- (STRootViewModelCoordinator)coordinator;
- (STUIUser)affectedUser;
- (id)_createDefaultCustomScheduleFromSimpleSchedule:(id)a3;
- (id)_customScheduleTime:(id)a3;
- (id)_deviceBedtimeSpecifierWithBedtime:(id)a3 downtimeGroupSpecifier:(id)a4;
- (id)_simpleScheduleTime:(id)a3;
- (id)askForMoreTime:(id)a3;
- (id)atDowntimeFooterText;
- (id)deviceBedtimeEnabled:(id)a3;
- (id)specifiers;
- (id)timeFooterText;
- (void)_actuallyToggleDowntimeEnabled;
- (void)_saveDowntimeAndReloadSpecifiers:(BOOL)a3;
- (void)_showCustomizeDailyScheduleListController:(id)a3;
- (void)_showEditSimpleScheduleListController:(id)a3;
- (void)_toggleDowntimeEnabled;
- (void)customizeDailyScheduleListController:(id)a3 didSaveDailySchedule:(id)a4 forWeekdayIndex:(unint64_t)a5;
- (void)customizeDailyScheduleListControllerDidCancel:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)scheduleDowntimeRefreshAndReloadSpecifiers;
- (void)scheduleDowntimeRefreshIfNeeded;
- (void)setAffectedUser:(id)a3;
- (void)setAskForMoreTime:(id)a3 specifier:(id)a4;
- (void)setAtBedtimeGroupSpecifier:(id)a3;
- (void)setAtBedtimeSpecifier:(id)a3;
- (void)setBedtime:(id)a3;
- (void)setCanAskForMoreTime:(BOOL)a3;
- (void)setCoordinator:(id)a3;
- (void)setCustomizeDaysSpecifier:(id)a3;
- (void)setDailyScheduleSpecifier:(id)a3;
- (void)setDeviceBedtimeEnabled:(id)a3 specifier:(id)a4;
- (void)setDeviceBedtimeSpecifier:(id)a3;
- (void)setDownTimeGroupSpecifier:(id)a3;
- (void)setDowntimeScheduleRefreshTimer:(id)a3;
- (void)setEveryDaySpecifier:(id)a3;
- (void)setInformativeTextGroupSpecifier:(id)a3;
- (void)setScheduleSwitchGroupSpecifier:(id)a3;
- (void)setScheduleTypeGroupSpecifier:(id)a3;
- (void)setScheduledSwitchSpecifier:(id)a3;
- (void)setTimeGroupSpecifier:(id)a3;
- (void)setWeekdaySpecifiers:(id)a3;
- (void)simpleScheduleListController:(id)a3 didSaveSimpleSchedule:(id)a4;
- (void)simpleScheduleListControllerDidCancel:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation STDeviceBedtimeListController

- (STDeviceBedtimeListController)init
{
  v26.receiver = self;
  v26.super_class = (Class)STDeviceBedtimeListController;
  v2 = [(STDeviceBedtimeListController *)&v26 init];
  if (v2)
  {
    v3 = +[STScreenTimeSettingsUIBundle bundle];
    v4 = [v3 localizedStringForKey:@"DeviceDowntimeSpecifierName" value:&stru_26D9391A8 table:0];
    [(STDeviceBedtimeListController *)v2 setTitle:v4];

    v5 = [MEMORY[0x263EFF8F0] currentCalendar];
    v6 = [v5 standaloneWeekdaySymbols];
    uint64_t v7 = [v6 count];
    v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v7];
    v9 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v7];
    uint64_t v10 = [v5 firstWeekday] - 1;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x263F088D0]), "initWithIndexesInRange:", 0, v7);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __37__STDeviceBedtimeListController_init__block_invoke;
    v20[3] = &unk_264767B60;
    uint64_t v24 = v10;
    uint64_t v25 = v7;
    v12 = v8;
    v21 = v12;
    v13 = v9;
    v22 = v13;
    id v23 = v6;
    id v14 = v6;
    [v11 enumerateIndexesUsingBlock:v20];
    orderedLocalizedWeekdayNames = v2->_orderedLocalizedWeekdayNames;
    v2->_orderedLocalizedWeekdayNames = v13;
    v16 = v13;

    orderedWeekdayIndexes = v2->_orderedWeekdayIndexes;
    v2->_orderedWeekdayIndexes = v12;
    v18 = v12;

    [(STDeviceBedtimeListController *)v2 scheduleDowntimeRefreshIfNeeded];
  }
  return v2;
}

void __37__STDeviceBedtimeListController_init__block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (unint64_t)(*(void *)(a1 + 56) + a2) % *(void *)(a1 + 64);
  v4 = *(void **)(a1 + 32);
  v5 = [NSNumber numberWithUnsignedInteger:v3];
  [v4 addObject:v5];

  v6 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 48) objectAtIndexedSubscript:v3];
  [v6 addObject:v7];
}

- (void)scheduleDowntimeRefreshAndReloadSpecifiers
{
  [(STDeviceBedtimeListController *)self scheduleDowntimeRefreshIfNeeded];

  [(STDeviceBedtimeListController *)self reloadSpecifiers];
}

- (void)scheduleDowntimeRefreshIfNeeded
{
  unint64_t v3 = [(STDeviceBedtimeListController *)self downtimeScheduleRefreshTimer];

  if (v3)
  {
    v4 = [(STDeviceBedtimeListController *)self downtimeScheduleRefreshTimer];
    [v4 invalidate];

    [(STDeviceBedtimeListController *)self setDowntimeScheduleRefreshTimer:0];
  }
  v5 = [(STDeviceBedtimeListController *)self coordinator];
  v6 = [v5 timeAllowancesCoordinator];
  [v6 timeToNextExpectedStateChange];
  double v8 = v7;

  if (v8 >= 0.0)
  {
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x263EFFA20];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __64__STDeviceBedtimeListController_scheduleDowntimeRefreshIfNeeded__block_invoke;
    id v14 = &unk_264767200;
    objc_copyWeak(&v15, &location);
    uint64_t v10 = [v9 scheduledTimerWithTimeInterval:0 repeats:&v11 block:v8];
    -[STDeviceBedtimeListController setDowntimeScheduleRefreshTimer:](self, "setDowntimeScheduleRefreshTimer:", v10, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __64__STDeviceBedtimeListController_scheduleDowntimeRefreshIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained scheduleDowntimeRefreshAndReloadSpecifiers];
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8])) {
    [(STDeviceBedtimeListController *)self reloadSpecifiers];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STDeviceBedtimeListController.viewWillAppear", buf, 2u);
  }
  v5.receiver = self;
  v5.super_class = (Class)STDeviceBedtimeListController;
  [(STDeviceBedtimeListController *)&v5 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)STDeviceBedtimeListController;
  [(STDeviceBedtimeListController *)&v16 viewDidAppear:a3];
  v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.ScreenTime/DOWNTIME"];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  v6 = [MEMORY[0x263EFF960] currentLocale];
  double v7 = +[STScreenTimeSettingsUIBundle bundle];
  double v8 = [v7 bundleURL];
  v9 = (void *)[v5 initWithKey:@"DeviceDowntimeSpecifierName" table:@"Localizable" locale:v6 bundleURL:v8];

  id v10 = objc_alloc(MEMORY[0x263F08DB0]);
  uint64_t v11 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v12 = +[STScreenTimeSettingsUIBundle bundle];
  v13 = [v12 bundleURL];
  id v14 = (void *)[v10 initWithKey:@"ScreenTimeControllerTitle" table:@"Localizable" locale:v11 bundleURL:v13];

  v17[0] = v14;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [(STDeviceBedtimeListController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.screen-time" title:v9 localizedNavigationComponents:v15 deepLink:v4];
}

- (id)specifiers
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v87 = [(STDeviceBedtimeListController *)self bedtime];
    id v5 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
    v6 = +[STScreenTimeSettingsUIBundle bundle];
    double v7 = [v6 localizedStringForKey:@"DeviceDowntimeTitleFooterText" value:&stru_26D9391A8 table:0];
    uint64_t v8 = *MEMORY[0x263F600F8];
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x263F600F8]];

    [(STDeviceBedtimeListController *)self setInformativeTextGroupSpecifier:v5];
    v85 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
    -[STDeviceBedtimeListController setDownTimeGroupSpecifier:](self, "setDownTimeGroupSpecifier:");
    v9 = [(STDeviceBedtimeListController *)self bedtime];
    id v10 = [(STDeviceBedtimeListController *)self downTimeGroupSpecifier];
    uint64_t v11 = [(STDeviceBedtimeListController *)self _deviceBedtimeSpecifierWithBedtime:v9 downtimeGroupSpecifier:v10];

    v84 = (void *)v11;
    [(STDeviceBedtimeListController *)self setDeviceBedtimeSpecifier:v11];
    uint64_t v12 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
    v13 = [v6 localizedStringForKey:@"DeviceDowntimeScheduledFooterText" value:&stru_26D9391A8 table:0];
    [v12 setObject:v13 forKeyedSubscript:v8];

    [(STDeviceBedtimeListController *)self setScheduleSwitchGroupSpecifier:v12];
    v83 = [v6 localizedStringForKey:@"DeviceDowntimeScheduledSpecifierName" value:&stru_26D9391A8 table:0];
    v82 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    -[STDeviceBedtimeListController setScheduledSwitchSpecifier:](self, "setScheduledSwitchSpecifier:");
    id v14 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
    id v15 = [(STDeviceBedtimeListController *)self atDowntimeFooterText];
    [v14 setObject:v15 forKeyedSubscript:v8];

    v81 = v14;
    [(STDeviceBedtimeListController *)self setAtBedtimeGroupSpecifier:v14];
    v80 = [v6 localizedStringForKey:@"BlockAtDowntime" value:&stru_26D9391A8 table:0];
    objc_super v16 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    [v16 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
    v79 = v16;
    [(STDeviceBedtimeListController *)self setAtBedtimeSpecifier:v16];
    v86 = v6;
    if ([v87 deviceBedtimeEnabled])
    {
      v72 = v12;
      v73 = v5;
      uint64_t v74 = v3;
      v71 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
      -[STDeviceBedtimeListController setScheduleTypeGroupSpecifier:](self, "setScheduleTypeGroupSpecifier:");
      v70 = [v6 localizedStringForKey:@"DeviceDowntimeEveryDaySpecifierName" value:&stru_26D9391A8 table:0];
      v17 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
      uint64_t v18 = *MEMORY[0x263F600A8];
      uint64_t v19 = MEMORY[0x263EFFA88];
      [v17 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
      v69 = v17;
      [(STDeviceBedtimeListController *)self setEveryDaySpecifier:v17];
      v68 = [v6 localizedStringForKey:@"DeviceDowntimeCustomizeDaysSpecifierName" value:&stru_26D9391A8 table:0];
      v20 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
      uint64_t v88 = v18;
      [v20 setObject:v19 forKeyedSubscript:v18];
      v67 = v20;
      [(STDeviceBedtimeListController *)self setCustomizeDaysSpecifier:v20];
      v21 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
      v22 = [(STDeviceBedtimeListController *)self timeFooterText];
      [v21 setObject:v22 forKeyedSubscript:v8];

      v66 = v21;
      [(STDeviceBedtimeListController *)self setTimeGroupSpecifier:v21];
      v65 = [v6 localizedStringForKey:@"DeviceDowntimeDailyScheduleSpecifierName" value:&stru_26D9391A8 table:0];
      id v23 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
      [v23 setControllerLoadAction:sel__showEditSimpleScheduleListController_];
      v64 = v23;
      [(STDeviceBedtimeListController *)self setDailyScheduleSpecifier:v23];
      uint64_t v24 = [(STDeviceBedtimeListController *)self orderedLocalizedWeekdayNames];
      uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v24, "count"));
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id v26 = v24;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v93 objects:v98 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v94;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v94 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:*(void *)(*((void *)&v93 + 1) + 8 * i) target:self set:0 get:sel__customScheduleTime_ detail:0 cell:2 edit:0];
            [v31 setControllerLoadAction:sel__showCustomizeDailyScheduleListController_];
            [v25 addObject:v31];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v93 objects:v98 count:16];
        }
        while (v28);
      }

      [(STDeviceBedtimeListController *)self setWeekdaySpecifiers:v25];
      id v75 = objc_alloc(MEMORY[0x263EFF980]);
      v78 = [(STDeviceBedtimeListController *)self informativeTextGroupSpecifier];
      v77 = [(STDeviceBedtimeListController *)self downTimeGroupSpecifier];
      v32 = [(STDeviceBedtimeListController *)self deviceBedtimeSpecifier];
      v33 = [(STDeviceBedtimeListController *)self scheduleSwitchGroupSpecifier];
      v34 = [(STDeviceBedtimeListController *)self scheduledSwitchSpecifier];
      v35 = [(STDeviceBedtimeListController *)self scheduleTypeGroupSpecifier];
      v36 = [(STDeviceBedtimeListController *)self everyDaySpecifier];
      v37 = [(STDeviceBedtimeListController *)self customizeDaysSpecifier];
      v38 = [(STDeviceBedtimeListController *)self timeGroupSpecifier];
      v76 = objc_msgSend(v75, "initWithObjects:", v78, v77, v32, v33, v34, v35, v36, v37, v38, 0);

      v39 = v87;
      v40 = [v87 scheduleByWeekdayIndex];

      if (v40)
      {
        v41 = [(STDeviceBedtimeListController *)self weekdaySpecifiers];
        v42 = v76;
        [v76 addObjectsFromArray:v41];
      }
      else
      {
        v41 = [(STDeviceBedtimeListController *)self dailyScheduleSpecifier];
        v42 = v76;
        [v76 addObject:v41];
      }

      v53 = v86;
      uint64_t v12 = v72;
      if ([(STDeviceBedtimeListController *)self canAskForMoreTime])
      {
        v54 = [(STDeviceBedtimeListController *)self atBedtimeGroupSpecifier];
        [v42 addObject:v54];

        v55 = [(STDeviceBedtimeListController *)self atBedtimeSpecifier];
        [v42 addObject:v55];
      }
      if (([v87 shouldAllowEditing] & 1) == 0)
      {
        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        id v56 = v42;
        uint64_t v57 = [v56 countByEnumeratingWithState:&v89 objects:v97 count:16];
        if (v57)
        {
          uint64_t v58 = v57;
          uint64_t v59 = *(void *)v90;
          uint64_t v60 = MEMORY[0x263EFFA80];
          do
          {
            for (uint64_t j = 0; j != v58; ++j)
            {
              if (*(void *)v90 != v59) {
                objc_enumerationMutation(v56);
              }
              [*(id *)(*((void *)&v89 + 1) + 8 * j) setObject:v60 forKeyedSubscript:v88];
            }
            uint64_t v58 = [v56 countByEnumeratingWithState:&v89 objects:v97 count:16];
          }
          while (v58);
        }

        v53 = v86;
        v39 = v87;
        v42 = v76;
      }
      v62 = *(Class *)((char *)&self->super.super.super.super.super.isa + v74);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v74) = (Class)v42;
      uint64_t v3 = v74;

      id v5 = v73;
    }
    else
    {
      id v43 = objc_alloc(MEMORY[0x263EFF980]);
      v44 = [(STDeviceBedtimeListController *)self informativeTextGroupSpecifier];
      v45 = [(STDeviceBedtimeListController *)self downTimeGroupSpecifier];
      v46 = [(STDeviceBedtimeListController *)self deviceBedtimeSpecifier];
      v47 = [(STDeviceBedtimeListController *)self scheduleSwitchGroupSpecifier];
      v48 = [(STDeviceBedtimeListController *)self scheduledSwitchSpecifier];
      v49 = objc_msgSend(v43, "initWithObjects:", v44, v45, v46, v47, v48, 0);

      if ([(STDeviceBedtimeListController *)self canAskForMoreTime])
      {
        v50 = [(STDeviceBedtimeListController *)self atBedtimeGroupSpecifier];
        [v49 addObject:v50];

        v51 = [(STDeviceBedtimeListController *)self atBedtimeSpecifier];
        [v49 addObject:v51];
      }
      v52 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v49;

      v53 = v86;
      v39 = v87;
    }

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)_deviceBedtimeSpecifierWithBedtime:(id)a3 downtimeGroupSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[STScreenTimeSettingsUIBundle bundle];
  int v9 = [v7 deviceBedtimeEnabled];
  id v10 = [(STDeviceBedtimeListController *)self affectedUser];
  int v11 = [v10 isRemoteUser];
  int v12 = [v7 askForMoreTime];

  v13 = [(STDeviceBedtimeListController *)self coordinator];
  id v14 = [v13 timeAllowancesCoordinator];
  int v15 = [v14 isDowntimeActive];

  objc_super v16 = (void *)MEMORY[0x263F5FC40];
  if (v15)
  {
    if (v9) {
      v17 = @"DeviceDowntimeDisableButtonWithScheduleName";
    }
    else {
      v17 = @"DeviceDowntimeDisableButtonWithoutScheduleName";
    }
    if (v9) {
      uint64_t v18 = @"WithSchedule";
    }
    else {
      uint64_t v18 = @"WithoutSchedule";
    }
    uint64_t v19 = [v8 localizedStringForKey:v17 value:&stru_26D9391A8 table:0];
    v20 = [v16 deleteButtonSpecifierWithName:v19 target:self action:sel__toggleDowntimeEnabled];

    [v20 setObject:&unk_26D967048 forKeyedSubscript:*MEMORY[0x263F5FEF0]];
    v21 = @"RemoteUser";
    if (!v11) {
      v21 = @"LocalUser";
    }
    v22 = [NSString localizedStringWithFormat:@"DeviceDowntimeDisableButton%@%@Footer", v21, v18];
    id v23 = NSString;
    uint64_t v24 = [v8 localizedStringForKey:v22 value:&stru_26D9391A8 table:0];
    uint64_t v25 = [v10 givenName];
    id v26 = objc_msgSend(v23, "localizedStringWithFormat:", v24, v25);
    [v6 setObject:v26 forKeyedSubscript:*MEMORY[0x263F600F8]];
  }
  else
  {
    if (v9) {
      uint64_t v27 = @"DeviceDowntimeEnableButtonWithScheduleName";
    }
    else {
      uint64_t v27 = @"DeviceDowntimeEnableButtonWithoutScheduleName";
    }
    if (v9) {
      uint64_t v28 = @"WithSchedule";
    }
    else {
      uint64_t v28 = @"WithoutSchedule";
    }
    uint64_t v29 = [v8 localizedStringForKey:v27 value:&stru_26D9391A8 table:0];
    v20 = [v16 preferenceSpecifierNamed:v29 target:self set:0 get:0 detail:0 cell:13 edit:0];

    v30 = @"BlockedUser";
    if (!v12) {
      v30 = @"UnblockedUser";
    }
    v22 = [NSString localizedStringWithFormat:@"DeviceDowntimeEnableButton%@%@Footer", v30, v28];
    v31 = [v8 localizedStringForKey:v22 value:&stru_26D9391A8 table:0];
    [v6 setObject:v31 forKeyedSubscript:*MEMORY[0x263F600F8]];

    [v20 setButtonAction:sel__toggleDowntimeEnabled];
  }

  [v20 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];

  return v20;
}

- (void)_saveDowntimeAndReloadSpecifiers:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(STDeviceBedtimeListController *)self coordinator];
  id v6 = [v5 timeAllowancesCoordinator];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(STDeviceBedtimeListController *)self coordinator];
    int v9 = [v8 timeAllowancesCoordinator];
    id v10 = [(STDeviceBedtimeListController *)self bedtime];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __66__STDeviceBedtimeListController__saveDowntimeAndReloadSpecifiers___block_invoke;
    v11[3] = &unk_264767588;
    BOOL v12 = v3;
    v11[4] = self;
    [v9 saveDeviceBedtime:v10 completionHandler:v11];
  }
  else if (v3)
  {
    [(STDeviceBedtimeListController *)self reloadSpecifiers];
  }
}

void __66__STDeviceBedtimeListController__saveDowntimeAndReloadSpecifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __66__STDeviceBedtimeListController__saveDowntimeAndReloadSpecifiers___block_invoke_cold_2((uint64_t)v3);
    }
  }
  else if (_os_feature_enabled_impl())
  {
    v4 = [MEMORY[0x263F67088] sharedController];
    id v5 = [MEMORY[0x263F67088] sharedController];
    id v6 = [v5 viewContext];
    id v9 = 0;
    char v7 = [v4 saveContext:v6 error:&v9];
    id v8 = v9;

    if ((v7 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __66__STDeviceBedtimeListController__saveDowntimeAndReloadSpecifiers___block_invoke_cold_1((uint64_t)v8);
    }
  }
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) reloadSpecifiers];
  }
}

- (void)simpleScheduleListControllerDidCancel:(id)a3
{
}

- (void)simpleScheduleListController:(id)a3 didSaveSimpleSchedule:(id)a4
{
  id v5 = a4;
  id v6 = [(STDeviceBedtimeListController *)self bedtime];
  [v6 setSimpleSchedule:v5];

  [(STDeviceBedtimeListController *)self _saveDowntimeAndReloadSpecifiers:1];

  [(STDeviceBedtimeListController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)customizeDailyScheduleListControllerDidCancel:(id)a3
{
}

- (void)customizeDailyScheduleListController:(id)a3 didSaveDailySchedule:(id)a4 forWeekdayIndex:(unint64_t)a5
{
  id v7 = a4;
  id v8 = [(STDeviceBedtimeListController *)self bedtime];
  id v9 = [v8 scheduleByWeekdayIndex];
  id v29 = (id)[v9 mutableCopy];

  if (!v29)
  {
    id v10 = [(STDeviceBedtimeListController *)self bedtime];
    int v11 = [v10 simpleSchedule];
    id v29 = [(STDeviceBedtimeListController *)self _createDefaultCustomScheduleFromSimpleSchedule:v11];
  }
  BOOL v12 = [NSNumber numberWithUnsignedInteger:a5];
  [v29 setObject:v7 forKeyedSubscript:v12];

  v13 = [(STDeviceBedtimeListController *)self orderedWeekdayIndexes];
  unint64_t v14 = [v13 count];
  int v15 = [NSNumber numberWithUnsignedInteger:(a5 + 1) % v14];
  objc_super v16 = [v7 endTime];
  v17 = [v7 startTime];

  uint64_t v18 = STCompareHourMinuteTimeComponents();
  if (v18 == 1)
  {
    uint64_t v19 = [v29 objectForKeyedSubscript:v15];
    v20 = v19;
    if (v19
      && ([v19 startTime],
          v21 = objc_claimAutoreleasedReturnValue(),
          uint64_t v22 = STCompareHourMinuteTimeComponents(),
          v21,
          v22 == 1))
    {
      [v20 setStartTime:v16];
      [v29 setObject:v20 forKeyedSubscript:v15];
    }
    else
    {
      LODWORD(v22) = 0;
    }
  }
  else
  {
    LODWORD(v22) = 0;
  }
  id v23 = [(STDeviceBedtimeListController *)self bedtime];
  [v23 setScheduleByWeekdayIndex:v29];

  uint64_t v24 = [(STDeviceBedtimeListController *)self weekdaySpecifiers];
  uint64_t v25 = [NSNumber numberWithUnsignedInteger:a5];
  uint64_t v26 = [v13 indexOfObject:v25];

  uint64_t v27 = [v24 objectAtIndexedSubscript:v26];
  [(STDeviceBedtimeListController *)self reloadSpecifier:v27];

  if (v22)
  {
    uint64_t v28 = objc_msgSend(v24, "objectAtIndexedSubscript:", objc_msgSend(v13, "indexOfObject:", v15));
    [(STDeviceBedtimeListController *)self reloadSpecifier:v28];
  }
  [(STDeviceBedtimeListController *)self _saveDowntimeAndReloadSpecifiers:1];
  [(STDeviceBedtimeListController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)dealloc
{
  [(STRootViewModelCoordinator *)self->_coordinator removeObserver:self forKeyPath:@"timeAllowancesCoordinator.viewModel.bedtime" context:@"TimeAllowanceViewModelBlueprintContext"];
  id v3 = [(STDeviceBedtimeListController *)self downtimeScheduleRefreshTimer];

  if (v3)
  {
    v4 = [(STDeviceBedtimeListController *)self downtimeScheduleRefreshTimer];
    [v4 invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)STDeviceBedtimeListController;
  [(STDeviceBedtimeListController *)&v5 dealloc];
}

- (void)setCoordinator:(id)a3
{
  objc_super v5 = (STRootViewModelCoordinator *)a3;
  coordinator = self->_coordinator;
  if (coordinator != v5)
  {
    id v7 = v5;
    [(STRootViewModelCoordinator *)coordinator removeObserver:self forKeyPath:@"timeAllowancesCoordinator.viewModel.bedtime" context:@"TimeAllowanceViewModelBlueprintContext"];
    objc_storeStrong((id *)&self->_coordinator, a3);
    coordinator = (STRootViewModelCoordinator *)[(STRootViewModelCoordinator *)self->_coordinator addObserver:self forKeyPath:@"timeAllowancesCoordinator.viewModel.bedtime" options:0 context:@"TimeAllowanceViewModelBlueprintContext"];
    objc_super v5 = v7;
  }

  MEMORY[0x270F9A758](coordinator, v5);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"TimeAllowanceViewModelBlueprintContext")
  {
    if ([(STDeviceBedtimeListController *)self isViewLoaded])
    {
      id v7 = [(STDeviceBedtimeListController *)self view];
      id v8 = [v7 window];

      if (v8)
      {
        id v9 = [(STDeviceBedtimeListController *)self coordinator];
        id v10 = [v9 timeAllowancesCoordinator];
        int v11 = [v10 viewModel];
        id v13 = [v11 bedtime];

        BOOL v12 = v13;
        if (v13)
        {
          [(STDeviceBedtimeListController *)self setBedtime:v13];
          [(STDeviceBedtimeListController *)self reloadSpecifiers];
          [(STDeviceBedtimeListController *)self scheduleDowntimeRefreshIfNeeded];
          BOOL v12 = v13;
        }
      }
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)STDeviceBedtimeListController;
    -[STDeviceBedtimeListController observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setDeviceBedtimeEnabled:(id)a3 specifier:(id)a4
{
  id v9 = a3;
  objc_super v5 = [(STDeviceBedtimeListController *)self bedtime];

  if (!v5)
  {
    id v6 = objc_opt_new();
    objc_msgSend(v6, "setAskForMoreTime:", -[STDeviceBedtimeListController canAskForMoreTime](self, "canAskForMoreTime"));
    [(STDeviceBedtimeListController *)self setBedtime:v6];
  }
  uint64_t v7 = [v9 BOOLValue];
  id v8 = [(STDeviceBedtimeListController *)self bedtime];
  [v8 setDeviceBedtimeEnabled:v7];

  [(STDeviceBedtimeListController *)self _saveDowntimeAndReloadSpecifiers:1];
}

- (id)deviceBedtimeEnabled:(id)a3
{
  id v3 = NSNumber;
  v4 = [(STDeviceBedtimeListController *)self bedtime];
  objc_super v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "deviceBedtimeEnabled"));

  return v5;
}

- (id)_createDefaultCustomScheduleFromSimpleSchedule:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [(STDeviceBedtimeListController *)self orderedWeekdayIndexes];
  id v6 = [v4 startTime];
  v17 = v4;
  uint64_t v7 = [v4 endTime];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_super v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v15 = objc_opt_new();
        [v15 setStartTime:v6];
        [v15 setEndTime:v7];
        objc_msgSend(v15, "setDay:", objc_msgSend(v14, "unsignedIntegerValue"));
        [v8 setObject:v15 forKeyedSubscript:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

- (void)_toggleDowntimeEnabled
{
  id v3 = [MEMORY[0x263F67088] sharedController];
  id v4 = [v3 viewContext];

  id v5 = objc_alloc(MEMORY[0x263F67288]);
  id v6 = [(STDeviceBedtimeListController *)self affectedUser];
  uint64_t v7 = [v6 dsid];
  id v8 = (void *)[v5 initWithDSID:v7];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__STDeviceBedtimeListController__toggleDowntimeEnabled__block_invoke;
  v11[3] = &unk_264767B88;
  id v12 = v8;
  id v13 = v4;
  objc_super v14 = self;
  id v9 = v4;
  id v10 = v8;
  [v9 performBlockAndWait:v11];
}

void __55__STDeviceBedtimeListController__toggleDowntimeEnabled__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F67168];
  id v3 = [*(id *)(a1 + 32) dsid];
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = 0;
  id v5 = [v2 fetchUserWithDSID:v3 inContext:v4 error:&v9];
  id v6 = v9;

  uint64_t v7 = [[STIOSAlertPresenter alloc] initWithPresentingViewController:*(void *)(a1 + 48)];
  if (v5)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__STDeviceBedtimeListController__toggleDowntimeEnabled__block_invoke_2;
    v8[3] = &unk_264766F30;
    v8[4] = *(void *)(a1 + 48);
    +[STTimeAllowancesCompatibilityController showOnDemandDowntimeCompatibilityAlertIfNeededForUser:v5 alertPresenter:v7 completionHandler:v8];
  }
  else
  {
    [*(id *)(a1 + 48) _actuallyToggleDowntimeEnabled];
  }
}

uint64_t __55__STDeviceBedtimeListController__toggleDowntimeEnabled__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _actuallyToggleDowntimeEnabled];
}

- (void)_actuallyToggleDowntimeEnabled
{
  id v3 = [(STDeviceBedtimeListController *)self coordinator];
  uint64_t v4 = [v3 timeAllowancesCoordinator];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(STDeviceBedtimeListController *)self coordinator];
    uint64_t v7 = [v6 timeAllowancesCoordinator];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __63__STDeviceBedtimeListController__actuallyToggleDowntimeEnabled__block_invoke;
    v8[3] = &unk_2647671B0;
    v8[4] = self;
    [v7 toggleDowntimeWithCompletionHandler:v8];
  }
  else
  {
    [(STDeviceBedtimeListController *)self reloadSpecifiers];
  }
}

uint64_t __63__STDeviceBedtimeListController__actuallyToggleDowntimeEnabled__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)_simpleScheduleTime:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F67108];
  char v5 = [(STDeviceBedtimeListController *)self bedtime];
  id v6 = [v5 simpleSchedule];
  uint64_t v7 = [v6 startTime];
  id v8 = [(STDeviceBedtimeListController *)self bedtime];
  id v9 = [v8 simpleSchedule];
  id v10 = [v9 endTime];
  uint64_t v11 = [v4 simpleScheduleTimeRangeWithStartTimeComponents:v7 endTimeComponents:v10];

  return v11;
}

- (void)_showEditSimpleScheduleListController:(id)a3
{
  id v4 = a3;
  id v11 = (id)objc_opt_new();
  [v11 setParentController:self];
  char v5 = [(STDeviceBedtimeListController *)self rootController];
  [v11 setRootController:v5];

  [v11 setSpecifier:v4];
  id v6 = [STSimpleScheduleListController alloc];
  uint64_t v7 = [(STDeviceBedtimeListController *)self bedtime];
  id v8 = [v7 simpleSchedule];
  id v9 = [(STSimpleScheduleListController *)v6 initWithSimpleSchedule:v8];

  [(STSimpleScheduleListController *)v9 setDelegate:self];
  [(STSimpleScheduleListController *)v9 setParentController:v11];
  id v10 = [v11 rootController];
  [(STSimpleScheduleListController *)v9 setRootController:v10];

  [(STSimpleScheduleListController *)v9 setSpecifier:v4];
  [v11 showController:v9];
  [(STDeviceBedtimeListController *)self showController:v11];
}

- (id)_customScheduleTime:(id)a3
{
  id v4 = a3;
  char v5 = [(STDeviceBedtimeListController *)self weekdaySpecifiers];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v8 = +[STScreenTimeSettingsUIBundle bundle];
    id v9 = [(STDeviceBedtimeListController *)self orderedWeekdayIndexes];
    id v10 = [v9 objectAtIndexedSubscript:v6];
    uint64_t v11 = [v10 unsignedIntegerValue];

    id v12 = [(STDeviceBedtimeListController *)self bedtime];
    id v13 = [v12 scheduleByWeekdayIndex];
    objc_super v14 = [NSNumber numberWithUnsignedInteger:v11];
    int v15 = [v13 objectForKeyedSubscript:v14];

    if (v15)
    {
      objc_super v16 = (void *)MEMORY[0x263F67108];
      v17 = [v15 startTime];
      long long v18 = [v15 endTime];
      uint64_t v7 = [v16 simpleScheduleTimeRangeWithStartTimeComponents:v17 endTimeComponents:v18];
    }
    else
    {
      uint64_t v7 = [v8 localizedStringForKey:@"DeviceDowntimeDailyScheduleOff" value:&stru_26D9391A8 table:0];
    }
  }

  return v7;
}

- (void)_showCustomizeDailyScheduleListController:(id)a3
{
  id v26 = a3;
  id v4 = [(STDeviceBedtimeListController *)self weekdaySpecifiers];
  uint64_t v5 = [v4 indexOfObject:v26];

  uint64_t v6 = [(STDeviceBedtimeListController *)self orderedWeekdayIndexes];
  uint64_t v7 = [v6 objectAtIndexedSubscript:v5];
  id v8 = [(STDeviceBedtimeListController *)self bedtime];
  id v9 = [v8 scheduleByWeekdayIndex];

  uint64_t v24 = [v9 objectForKeyedSubscript:v7];
  uint64_t v10 = [v7 unsignedIntegerValue];
  uint64_t v11 = v10;
  if (!v10) {
    uint64_t v10 = [v6 count];
  }
  id v12 = [NSNumber numberWithUnsignedInteger:v10 - 1];
  id v13 = [v9 objectForKeyedSubscript:v12];

  objc_super v14 = [v13 endTime];
  uint64_t v25 = v6;
  if (v13
    && ([v13 startTime],
        int v15 = objc_claimAutoreleasedReturnValue(),
        uint64_t v16 = STCompareHourMinuteTimeComponents(),
        v15,
        v16 == 1))
  {
    id v17 = v14;
  }
  else
  {
    id v17 = 0;
  }
  long long v18 = objc_opt_new();
  [v18 setParentController:self];
  long long v19 = [(STDeviceBedtimeListController *)self rootController];
  [v18 setRootController:v19];

  [v18 setSpecifier:v26];
  long long v20 = [STCustomizeDailyScheduleListController alloc];
  long long v21 = [v26 name];
  uint64_t v22 = [(STCustomizeDailyScheduleListController *)v20 initWithDailySchedule:v24 weekdayIndex:v11 weekdayName:v21 minimumStartTime:v17];

  [(STCustomizeDailyScheduleListController *)v22 setDelegate:self];
  [(STCustomizeDailyScheduleListController *)v22 setParentController:v18];
  uint64_t v23 = [v18 rootController];
  [(STCustomizeDailyScheduleListController *)v22 setRootController:v23];

  [(STCustomizeDailyScheduleListController *)v22 setSpecifier:v26];
  [v18 showController:v22];
  [(STDeviceBedtimeListController *)self showController:v18];
}

- (id)timeFooterText
{
  id v3 = [(STDeviceBedtimeListController *)self affectedUser];
  if ([v3 isRemoteUser])
  {
    uint64_t v4 = [v3 givenName];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      uint64_t v6 = NSString;
      uint64_t v7 = +[STScreenTimeSettingsUIBundle bundle];
      id v8 = [v7 localizedStringForKey:@"DeviceDowntimeScheduleFooterTextRemote" value:&stru_26D9391A8 table:0];
      id v9 = objc_msgSend(v6, "localizedStringWithFormat:", v8, v5);

      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v10 = [(STDeviceBedtimeListController *)self coordinator];
    uint64_t v11 = [v10 viewModel];
    int v12 = [v11 isCloudSyncEnabled];

    if (!v12)
    {
      id v13 = +[STScreenTimeSettingsUIBundle bundle];
      uint64_t v5 = v13;
      objc_super v14 = @"DeviceDowntimeScheduleFooterTextLocal";
      goto LABEL_7;
    }
  }
  id v13 = +[STScreenTimeSettingsUIBundle bundle];
  uint64_t v5 = v13;
  objc_super v14 = @"DeviceDowntimeScheduleFooterTextCloud";
LABEL_7:
  id v9 = [v13 localizedStringForKey:v14 value:&stru_26D9391A8 table:0];
LABEL_8:

  return v9;
}

- (void)setAskForMoreTime:(id)a3 specifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  uint64_t v6 = [(STDeviceBedtimeListController *)self bedtime];
  [v6 setAskForMoreTime:v5];

  [(STDeviceBedtimeListController *)self _saveDowntimeAndReloadSpecifiers:1];
}

- (id)askForMoreTime:(id)a3
{
  id v3 = NSNumber;
  uint64_t v4 = [(STDeviceBedtimeListController *)self bedtime];
  uint64_t v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "askForMoreTime"));

  return v5;
}

- (id)atDowntimeFooterText
{
  v2 = [(STDeviceBedtimeListController *)self affectedUser];
  if ([v2 isRemoteUser])
  {
    id v3 = [v2 name];

    if (v3)
    {
      uint64_t v4 = objc_opt_new();
      uint64_t v5 = [v2 name];
      uint64_t v6 = [v4 personNameComponentsFromString:v5];

      uint64_t v7 = [v6 givenName];
      if ([v7 length])
      {
        id v8 = NSString;
        id v9 = +[STScreenTimeSettingsUIBundle bundle];
        uint64_t v10 = [v9 localizedStringForKey:@"AtDowntimeRemoteFooterText" value:&stru_26D9391A8 table:0];
        uint64_t v11 = [v6 givenName];
        int v12 = objc_msgSend(v8, "localizedStringWithFormat:", v10, v11);

        goto LABEL_9;
      }
    }
    id v13 = +[STScreenTimeSettingsUIBundle bundle];
    uint64_t v6 = v13;
    objc_super v14 = @"AtDowntimeRemoteGenericFooterText";
  }
  else
  {
    id v13 = +[STScreenTimeSettingsUIBundle bundle];
    uint64_t v6 = v13;
    objc_super v14 = @"AtDowntimeLocalFooterText";
  }
  int v12 = [v13 localizedStringForKey:v14 value:&stru_26D9391A8 table:0];
LABEL_9:

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v33[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(STDeviceBedtimeListController *)self indexForIndexPath:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndexedSubscript:v8];
  }
  uint64_t v10 = [(STDeviceBedtimeListController *)self dailyScheduleSpecifier];
  uint64_t v11 = [(STDeviceBedtimeListController *)self everyDaySpecifier];
  uint64_t v12 = [(STDeviceBedtimeListController *)self customizeDaysSpecifier];
  id v13 = (void *)v12;
  if (v9 == v11)
  {
    uint64_t v21 = *MEMORY[0x263F602B0];
    int v15 = [v9 objectForKeyedSubscript:*MEMORY[0x263F602B0]];
    if ([v15 accessoryType] != 3)
    {
      [v15 setAccessoryType:3];
      long long v20 = [v13 objectForKeyedSubscript:v21];
      [v20 setAccessoryType:0];
      uint64_t v22 = [(STDeviceBedtimeListController *)self weekdaySpecifiers];
      uint64_t v23 = v10;
      uint64_t v24 = (void *)v22;
      v30 = v23;
      v33[0] = v23;
      uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
      [(STDeviceBedtimeListController *)self replaceContiguousSpecifiers:v24 withSpecifiers:v25 animated:1];

      id v26 = [(STDeviceBedtimeListController *)self bedtime];
      [v26 setScheduleByWeekdayIndex:0];

      [(STDeviceBedtimeListController *)self _saveDowntimeAndReloadSpecifiers:0];
LABEL_12:

      uint64_t v10 = v30;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (v9 == (void *)v12)
  {
    uint64_t v14 = *MEMORY[0x263F602B0];
    int v15 = [v9 objectForKeyedSubscript:*MEMORY[0x263F602B0]];
    if ([v15 accessoryType] != 3)
    {
      [v15 setAccessoryType:3];
      uint64_t v27 = [v11 objectForKeyedSubscript:v14];
      [v27 setAccessoryType:0];
      uint64_t v28 = [(STDeviceBedtimeListController *)self bedtime];
      uint64_t v16 = [v28 scheduleByWeekdayIndex];

      if (!v16)
      {
        id v29 = [v28 simpleSchedule];
        id v17 = [(STDeviceBedtimeListController *)self _createDefaultCustomScheduleFromSimpleSchedule:v29];
        [v28 setScheduleByWeekdayIndex:v17];
      }
      v30 = v10;
      v32 = v10;
      long long v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
      long long v19 = [(STDeviceBedtimeListController *)self weekdaySpecifiers];
      [(STDeviceBedtimeListController *)self replaceContiguousSpecifiers:v18 withSpecifiers:v19 animated:1];

      long long v20 = v27;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
LABEL_14:
  v31.receiver = self;
  v31.super_class = (Class)STDeviceBedtimeListController;
  [(STDeviceBedtimeListController *)&v31 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v19 = a4;
  id v7 = a5;
  uint64_t v8 = [(STDeviceBedtimeListController *)self everyDaySpecifier];
  id v9 = [(STDeviceBedtimeListController *)self indexPathForSpecifier:v8];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = [(STDeviceBedtimeListController *)self bedtime];
    uint64_t v12 = [v11 scheduleByWeekdayIndex];

    if (v12) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 3;
    }
  }
  else
  {
    uint64_t v14 = [(STDeviceBedtimeListController *)self customizeDaysSpecifier];
    int v15 = [(STDeviceBedtimeListController *)self indexPathForSpecifier:v14];
    int v16 = [v7 isEqual:v15];

    if (!v16) {
      goto LABEL_10;
    }
    id v17 = [(STDeviceBedtimeListController *)self bedtime];
    long long v18 = [v17 scheduleByWeekdayIndex];

    if (v18) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = 0;
    }
  }
  [v19 setAccessoryType:v13];
LABEL_10:
}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (STDeviceBedtime)bedtime
{
  return self->_bedtime;
}

- (void)setBedtime:(id)a3
{
}

- (STUIUser)affectedUser
{
  return self->_affectedUser;
}

- (void)setAffectedUser:(id)a3
{
}

- (BOOL)canAskForMoreTime
{
  return self->_canAskForMoreTime;
}

- (void)setCanAskForMoreTime:(BOOL)a3
{
  self->_canAskForMoreTime = a3;
}

- (NSArray)orderedWeekdayIndexes
{
  return (NSArray *)objc_getProperty(self, a2, 1416, 1);
}

- (NSArray)orderedLocalizedWeekdayNames
{
  return (NSArray *)objc_getProperty(self, a2, 1424, 1);
}

- (PSSpecifier)deviceBedtimeSpecifier
{
  return self->_deviceBedtimeSpecifier;
}

- (void)setDeviceBedtimeSpecifier:(id)a3
{
}

- (PSSpecifier)downTimeGroupSpecifier
{
  return self->_downTimeGroupSpecifier;
}

- (void)setDownTimeGroupSpecifier:(id)a3
{
}

- (PSSpecifier)scheduledSwitchSpecifier
{
  return self->_scheduledSwitchSpecifier;
}

- (void)setScheduledSwitchSpecifier:(id)a3
{
}

- (PSSpecifier)scheduleSwitchGroupSpecifier
{
  return self->_scheduleSwitchGroupSpecifier;
}

- (void)setScheduleSwitchGroupSpecifier:(id)a3
{
}

- (PSSpecifier)scheduleTypeGroupSpecifier
{
  return self->_scheduleTypeGroupSpecifier;
}

- (void)setScheduleTypeGroupSpecifier:(id)a3
{
}

- (PSSpecifier)informativeTextGroupSpecifier
{
  return self->_informativeTextGroupSpecifier;
}

- (void)setInformativeTextGroupSpecifier:(id)a3
{
}

- (PSSpecifier)everyDaySpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1480, 1);
}

- (void)setEveryDaySpecifier:(id)a3
{
}

- (PSSpecifier)customizeDaysSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1488, 1);
}

- (void)setCustomizeDaysSpecifier:(id)a3
{
}

- (PSSpecifier)timeGroupSpecifier
{
  return self->_timeGroupSpecifier;
}

- (void)setTimeGroupSpecifier:(id)a3
{
}

- (PSSpecifier)dailyScheduleSpecifier
{
  return self->_dailyScheduleSpecifier;
}

- (void)setDailyScheduleSpecifier:(id)a3
{
}

- (NSArray)weekdaySpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1512, 1);
}

- (void)setWeekdaySpecifiers:(id)a3
{
}

- (PSSpecifier)atBedtimeGroupSpecifier
{
  return self->_atBedtimeGroupSpecifier;
}

- (void)setAtBedtimeGroupSpecifier:(id)a3
{
}

- (PSSpecifier)atBedtimeSpecifier
{
  return self->_atBedtimeSpecifier;
}

- (void)setAtBedtimeSpecifier:(id)a3
{
}

- (NSTimer)downtimeScheduleRefreshTimer
{
  return self->_downtimeScheduleRefreshTimer;
}

- (void)setDowntimeScheduleRefreshTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downtimeScheduleRefreshTimer, 0);
  objc_storeStrong((id *)&self->_atBedtimeSpecifier, 0);
  objc_storeStrong((id *)&self->_atBedtimeGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_weekdaySpecifiers, 0);
  objc_storeStrong((id *)&self->_dailyScheduleSpecifier, 0);
  objc_storeStrong((id *)&self->_timeGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_customizeDaysSpecifier, 0);
  objc_storeStrong((id *)&self->_everyDaySpecifier, 0);
  objc_storeStrong((id *)&self->_informativeTextGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_scheduleTypeGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_scheduleSwitchGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_scheduledSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_downTimeGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_deviceBedtimeSpecifier, 0);
  objc_storeStrong((id *)&self->_orderedLocalizedWeekdayNames, 0);
  objc_storeStrong((id *)&self->_orderedWeekdayIndexes, 0);
  objc_storeStrong((id *)&self->_affectedUser, 0);
  objc_storeStrong((id *)&self->_bedtime, 0);

  objc_storeStrong((id *)&self->_coordinator, 0);
}

void __66__STDeviceBedtimeListController__saveDowntimeAndReloadSpecifiers___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error saving managed object contet: %@", (uint8_t *)&v1, 0xCu);
}

void __66__STDeviceBedtimeListController__saveDowntimeAndReloadSpecifiers___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error saving device bedtime: %@", (uint8_t *)&v1, 0xCu);
}

@end