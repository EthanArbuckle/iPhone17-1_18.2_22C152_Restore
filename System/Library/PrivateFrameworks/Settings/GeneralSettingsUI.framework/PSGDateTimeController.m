@interface PSGDateTimeController
- (BOOL)shouldDisplayTimezoneSpinner;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CoreTelephonyClient)_client;
- (PSGDateTimeController)init;
- (PSGWallClockMinuteTimer)minuteTimer;
- (PSSpecifier)ampmToggleSpecifier;
- (PSSpecifier)currentTimeSpecifier;
- (PSSpecifier)timePickerSpecifier;
- (PSSpecifier)timeZoneSpecifier;
- (id)currentDateString;
- (id)currentTimeString;
- (id)is24HourTime:(id)a3;
- (id)isShowingAMPMInStatusBar:(id)a3;
- (id)isShowingDateInStatusBar:(id)a3;
- (id)makeCurrentTimeSpecifier;
- (id)makeTimePickerSpecifier;
- (id)specifiers;
- (id)timeZoneValue:(id)a3;
- (id)useAutomaticTime:(id)a3;
- (void)_createDateTimeFormatters;
- (void)_setSpecifier:(id)a3 valueEnabled:(BOOL)a4;
- (void)_updateCurrentTime;
- (void)carrierBundleChange:(id)a3;
- (void)datePickerChanged:(id)a3;
- (void)dealloc;
- (void)effectiveSettingsChanged:(id)a3;
- (void)loadTimeZoneController:(id)a3;
- (void)localeChanged:(id)a3;
- (void)reloadTimezone;
- (void)set24HourTime:(id)a3 specifier:(id)a4;
- (void)setAmpmToggleSpecifier:(id)a3;
- (void)setAutomaticTimeFooter;
- (void)setCurrentTimeSpecifier:(id)a3;
- (void)setMinuteTimer:(id)a3;
- (void)setShowAMPMInStatusBar:(id)a3 specifier:(id)a4;
- (void)setShowDateInStatusBar:(id)a3 specifier:(id)a4;
- (void)setTimePickerSpecifier:(id)a3;
- (void)setTimeZoneSpecifier:(id)a3;
- (void)setTimeZoneValue:(id)a3 specifier:(id)a4;
- (void)setUseAutomaticTime:(id)a3 specifier:(id)a4;
- (void)set_client:(id)a3;
- (void)significantTimeChange:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PSGDateTimeController

- (void)_setSpecifier:(id)a3 valueEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithBool:v4];
  [v7 setProperty:v8 forKey:*MEMORY[0x263F600A8]];

  id v9 = [v7 propertyForKey:*MEMORY[0x263F602B0]];
  [v9 setCellEnabled:v4];
  [v9 setNeedsDisplay];
  [(PSGDateTimeController *)self reloadSpecifier:v7];
}

- (void)dealloc
{
  v3 = [(PSGDateTimeController *)self minuteTimer];
  [v3 invalidate];

  BOOL v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  CFRelease(self->_timeFormatter);
  CFRelease(self->_dateFormatter);
  v6.receiver = self;
  v6.super_class = (Class)PSGDateTimeController;
  [(PSGDateTimeController *)&v6 dealloc];
}

- (PSGDateTimeController)init
{
  v11.receiver = self;
  v11.super_class = (Class)PSGDateTimeController;
  v2 = [(PSGDateTimeController *)&v11 init];
  if (v2)
  {
    v3 = (CoreTelephonyClient *)objc_alloc_init(MEMORY[0x263F02D30]);
    client = v2->__client;
    v2->__client = v3;

    [(CoreTelephonyClient *)v2->__client setDelegate:v2];
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_significantTimeChange_ name:@"SignificantTimeChange" object:0];

    objc_super v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v2 selector:sel_localeChanged_ name:*MEMORY[0x263EFF458] object:0];

    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v2 selector:sel_effectiveSettingsChanged_ name:*MEMORY[0x263F536E0] object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)TimeZoneConfirmed, (CFStringRef)*MEMORY[0x263F38300], 0, CFNotificationSuspensionBehaviorCoalesce);
    [(PSGDateTimeController *)v2 _createDateTimeFormatters];
    id v9 = [[PSGWallClockMinuteTimer alloc] initWithTarget:v2 selector:sel__updateCurrentTime];
    [(PSGDateTimeController *)v2 setMinuteTimer:v9];
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)PSGDateTimeController;
  [(PSGDateTimeController *)&v12 viewDidAppear:a3];
  BOOL v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/DATE_AND_TIME"];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  objc_super v6 = [MEMORY[0x263EFF960] currentLocale];
  id v7 = PSG_BundleForGeneralSettingsUIFramework();
  v8 = [v7 bundleURL];
  id v9 = (void *)[v5 initWithKey:@"DATE_AND_TIME" table:@"General" locale:v6 bundleURL:v8];

  v10 = objc_msgSend(MEMORY[0x263F08DB0], "general_rootPaneComponent");
  v13[0] = v10;
  objc_super v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [(PSGDateTimeController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.date-and-time" title:v9 localizedNavigationComponents:v11 deepLink:v4];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  BOOL v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4) {
    goto LABEL_27;
  }
  id v5 = [(PSGDateTimeController *)self loadSpecifiersFromPlistName:@"Date & Time" target:self];
  objc_super v6 = [v5 specifierForID:@"TIME_ZONE"];
  [(PSGDateTimeController *)self setTimeZoneSpecifier:v6];

  id v7 = [(PSGDateTimeController *)self timeZoneSpecifier];
  [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];

  CFTimeZoneRef v8 = CFTimeZoneCopySystem();
  if (v8)
  {
    id v9 = PSCityForTimeZone();
  }
  else
  {
    id v9 = 0;
  }
  CFStringRef v10 = (const __CFString *)CFPreferencesCopyAppValue(@"AppleLocale", (CFStringRef)*MEMORY[0x263EFFE48]);
  if (v10)
  {
    CFStringRef v11 = v10;
    CFLocaleRef v12 = CFLocaleCreate(0, v10);
    CFRelease(v11);
    if (!v12) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  CFLocaleRef v12 = CFLocaleCopyCurrent();
  if (v12)
  {
LABEL_7:
    self->_localeForces24HourTime = PSLocaleUses24HourClock();
    CFRelease(v12);
  }
LABEL_8:
  v13 = [MEMORY[0x263F82670] currentDevice];
  char v14 = objc_msgSend(v13, "sf_isiPad");

  if ((v14 & 1) == 0)
  {
    v16 = [v5 specifierForID:@"SHOW_DATE_IN_STATUS_BAR"];
    v19 = [v5 specifierForID:@"SHOW_AMPM_IN_STATUS_BAR"];
    [v5 removeObject:v16];
    goto LABEL_12;
  }
  v15 = [v5 specifierForID:@"SHOW_AMPM_IN_STATUS_BAR"];
  [(PSGDateTimeController *)self setAmpmToggleSpecifier:v15];

  v16 = [v5 specifierForID:@"24_HOUR_TIME"];
  v17 = [v16 performGetter];
  int v18 = [v17 BOOLValue];

  if (v18)
  {
    v19 = [(PSGDateTimeController *)self ampmToggleSpecifier];
LABEL_12:
    [v5 removeObject:v19];
  }
  v20 = [(PSGDateTimeController *)self timeZoneSpecifier];
  if (v9)
  {
    [v20 setProperty:PSLegacyCityFromCity() forKey:*MEMORY[0x263F60068]];
  }
  else
  {
    v21 = [(__CFTimeZone *)v8 name];
    [v20 setProperty:v21 forKey:*MEMORY[0x263F60068]];
  }
  v22 = [v5 specifierForID:@"SET_AUTOMATICALLY"];
  v23 = [(PSGDateTimeController *)self useAutomaticTime:v22];
  int v24 = [v23 BOOLValue];

  if (v24)
  {
    v25 = NSNumber;
    v26 = [MEMORY[0x263F53C50] sharedConnection];
    v27 = objc_msgSend(v25, "numberWithBool:", objc_msgSend(v26, "isAutomaticDateAndTimeEnforced") ^ 1);

    v28 = [v5 specifierForID:@"SET_AUTOMATICALLY"];
    [v28 setProperty:v27 forKey:*MEMORY[0x263F600A8]];

    v29 = [(PSGDateTimeController *)self timeZoneSpecifier];
    [(PSGDateTimeController *)self _setSpecifier:v29 valueEnabled:0];

    v30 = [v5 specifierForID:@"SET_DATE_AND_TIME"];
    [v5 removeObject:v30];
  }
  else
  {
    v31 = [(PSGDateTimeController *)self timeZoneSpecifier];
    [(PSGDateTimeController *)self _setSpecifier:v31 valueEnabled:1];

    v32 = [MEMORY[0x263F82670] currentDevice];
    char v33 = objc_msgSend(v32, "sf_inRetailKioskMode");

    if ((v33 & 1) == 0)
    {
      v34 = [v5 specifierForID:@"TIME_ZONE"];
      uint64_t v35 = [v5 indexOfObject:v34];

      v36 = [(PSGDateTimeController *)self currentTimeSpecifier];

      if (!v36)
      {
        v37 = [(PSGDateTimeController *)self makeCurrentTimeSpecifier];
        [(PSGDateTimeController *)self setCurrentTimeSpecifier:v37];
      }
      v38 = [(PSGDateTimeController *)self currentTimeSpecifier];
      [v5 insertObject:v38 atIndex:v35 + 1];

      v39 = [(PSGDateTimeController *)self timePickerSpecifier];

      if (v39)
      {
        v40 = [(PSGDateTimeController *)self timePickerSpecifier];
        [v5 insertObject:v40 atIndex:v35 + 2];
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __35__PSGDateTimeController_specifiers__block_invoke;
      block[3] = &unk_264E8C8A0;
      block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
  v41 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

  [(PSGDateTimeController *)self setAutomaticTimeFooter];
  BOOL v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
LABEL_27:
  return v4;
}

void __35__PSGDateTimeController_specifiers__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) minuteTimer];
  [v1 startTimer];
}

- (void)setAutomaticTimeFooter
{
  int v3 = MGGetBoolAnswer();
  BOOL v4 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/LocationBundles/TimeZone.bundle"];
  int v5 = [MEMORY[0x263F00A60] authorizationStatusForBundle:v4];
  unsigned __int8 v6 = [MEMORY[0x263F00A60] locationServicesEnabled];
  if (v5 == 3) {
    unsigned __int8 v7 = v6;
  }
  else {
    unsigned __int8 v7 = 0;
  }
  if (v3)
  {
    if ((v7 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_8:
    id v8 = 0;
    goto LABEL_10;
  }
  if ([MEMORY[0x263F5FC90] wifiEnabled] & v7) {
    goto LABEL_8;
  }
LABEL_9:
  id v9 = SFLocalizableWAPIStringKeyForKey();
  PSG_LocalizedStringForDateAndTime(v9);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
  CFStringRef v10 = [MEMORY[0x263F8C870] sharedInstance];
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = __47__PSGDateTimeController_setAutomaticTimeFooter__block_invoke;
  v30 = &unk_264E8CB28;
  v32 = &v33;
  CFLocaleRef v12 = v11;
  v31 = v12;
  [v10 isUpdateWaitingWithCompletion:&v27];
  dispatch_time_t v13 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v12, v13);
  if (*((unsigned char *)v34 + 24))
  {
    char v14 = NSString;
    v15 = PSG_LocalizedStringForDateAndTime(@"%@_TZUPDATE_WAITING");
    v16 = [MEMORY[0x263F82670] currentDevice];
    v17 = [v16 localizedModel];
    int v18 = objc_msgSend(v14, "stringWithFormat:", v15, v17);

    if (v8)
    {
      uint64_t v19 = [NSString stringWithFormat:@"%@\n\n%@", v8, v18, v27, v28, v29, v30];

      id v8 = (id)v19;
    }
    else
    {
      id v8 = v18;
    }
  }
  v20 = [MEMORY[0x263F53C50] sharedConnection];
  int v21 = [v20 isAutomaticDateAndTimeEnforced];

  if (v21)
  {
    v22 = PSG_LocalizedStringForDateAndTime(@"AUTO_TIME_RESTRICTED_FOOTER");
    v23 = v22;
    if (v8)
    {
      uint64_t v24 = [NSString stringWithFormat:@"%@\n\n%@", v8, v22];

      id v8 = (id)v24;
    }
    else
    {
      id v8 = v22;
    }
  }
  v25 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) specifierForID:@"AUTOMATIC_GROUP"];
  v26 = v25;
  if (v8) {
    [v25 setProperty:v8 forKey:*MEMORY[0x263F600F8]];
  }
  else {
    [v25 removePropertyForKey:*MEMORY[0x263F600F8]];
  }

  _Block_object_dispose(&v33, 8);
}

intptr_t __47__PSGDateTimeController_setAutomaticTimeFooter__block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)reloadTimezone
{
}

- (id)makeTimePickerSpecifier
{
  v2 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26F0FADC0 target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v2 setIdentifier:@"TIME_PICKER"];
  int v3 = NSNumber;
  [MEMORY[0x263F5FB58] preferredHeight];
  BOOL v4 = objc_msgSend(v3, "numberWithDouble:");
  [v2 setProperty:v4 forKey:*MEMORY[0x263F602A8]];

  [v2 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  return v2;
}

- (id)makeCurrentTimeSpecifier
{
  int v3 = (void *)MEMORY[0x263F5FC40];
  BOOL v4 = [(PSGDateTimeController *)self currentDateString];
  int v5 = [v3 preferenceSpecifierNamed:v4 target:self set:0 get:sel_valueForTime_ detail:0 cell:4 edit:0];

  [v5 setIdentifier:@"CURRENT_TIME"];
  [v5 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v12 = a4;
  unsigned __int8 v7 = [(PSGDateTimeController *)self specifierAtIndex:[(PSGDateTimeController *)self indexForIndexPath:a5]];
  id v8 = [v7 identifier];
  int v9 = [v8 isEqualToString:@"TIME_ZONE"];

  if (v9)
  {
    if ([(PSGDateTimeController *)self shouldDisplayTimezoneSpinner])
    {
      CFStringRef v10 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
      [v10 startAnimating];
      [v12 setAccessoryView:v10];
      dispatch_semaphore_t v11 = [v12 detailTextLabel];
      [v11 setText:&stru_26F0FADC0];
    }
    else if (([v12 cellEnabled] & 1) == 0)
    {
      [v12 setAccessoryType:0];
    }
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PSGDateTimeController *)self timePickerSpecifier];
  if (v8)
  {

LABEL_5:
    v14.receiver = self;
    v14.super_class = (Class)PSGDateTimeController;
    [(PSGDateTimeController *)&v14 tableView:v6 didSelectRowAtIndexPath:v7];
    goto LABEL_6;
  }
  int v9 = [(PSGDateTimeController *)self currentTimeSpecifier];
  CFStringRef v10 = [(PSGDateTimeController *)self indexPathForIndex:[(PSGDateTimeController *)self indexOfSpecifier:v9]];
  int v11 = [v7 isEqual:v10];

  if (!v11) {
    goto LABEL_5;
  }
  id v12 = [(PSGDateTimeController *)self makeTimePickerSpecifier];
  [(PSGDateTimeController *)self setTimePickerSpecifier:v12];

  dispatch_time_t v13 = [(PSGDateTimeController *)self timePickerSpecifier];
  [(PSGDateTimeController *)self insertSpecifier:v13 afterSpecifierID:@"CURRENT_TIME" animated:1];

LABEL_6:
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PSGDateTimeController *)self currentTimeSpecifier];
  id v7 = [(PSGDateTimeController *)self indexPathForIndex:[(PSGDateTimeController *)self indexOfSpecifier:v6]];
  int v8 = [v5 isEqual:v7];

  if (!v8) {
    return 1;
  }
  int v9 = [(PSGDateTimeController *)self timePickerSpecifier];
  BOOL v10 = v9 == 0;

  return v10;
}

- (void)datePickerChanged:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v6 = [v5 beginBackgroundTaskWithExpirationHandler:&__block_literal_global_2];

  id v7 = [v4 date];
  int v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__PSGDateTimeController_datePickerChanged___block_invoke_2;
  block[3] = &unk_264E8CB50;
  id v12 = self;
  uint64_t v13 = v6;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

void __43__PSGDateTimeController_datePickerChanged___block_invoke()
{
}

void __43__PSGDateTimeController_datePickerChanged___block_invoke_2(uint64_t a1)
{
  TMSetAutomaticTimeEnabled();
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  TMSetManualTime();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SignificantTimeChangeNotification", 0, 0, 1u);
  int v3 = [MEMORY[0x263F82438] sharedApplication];
  [v3 endBackgroundTask:*(void *)(a1 + 48)];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__PSGDateTimeController_datePickerChanged___block_invoke_3;
  block[3] = &unk_264E8C8A0;
  void block[4] = *(void *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __43__PSGDateTimeController_datePickerChanged___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) significantTimeChange:0];
}

- (void)significantTimeChange:(id)a3
{
  id v8 = [(PSGDateTimeController *)self specifierForID:@"24_HOUR_TIME"];
  id v4 = [(PSGDateTimeController *)self is24HourTime:v8];
  uint64_t v5 = [v4 BOOLValue];

  uint64_t v6 = [v8 propertyForKey:*MEMORY[0x263F60028]];
  if (v5 != [v6 isOn]) {
    [v6 setOn:v5 animated:1];
  }
  [MEMORY[0x263EFFA18] resetSystemTimeZone];
  [(PSGDateTimeController *)self reloadTimezone];
  [(PSGDateTimeController *)self _createDateTimeFormatters];
  [(PSGDateTimeController *)self _updateCurrentTime];
  id v7 = [(PSGDateTimeController *)self minuteTimer];
  [v7 startTimer];
}

- (void)localeChanged:(id)a3
{
  [(PSGDateTimeController *)self _createDateTimeFormatters];
  [(PSGDateTimeController *)self _updateCurrentTime];
}

- (void)effectiveSettingsChanged:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__PSGDateTimeController_effectiveSettingsChanged___block_invoke;
  block[3] = &unk_264E8C8A0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __50__PSGDateTimeController_effectiveSettingsChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (BOOL)shouldDisplayTimezoneSpinner
{
  int v3 = [(PSGDateTimeController *)self specifierForID:@"SET_AUTOMATICALLY"];
  id v4 = [(PSGDateTimeController *)self useAutomaticTime:v3];
  if ([v4 BOOLValue]) {
    BOOL v5 = TMIsTimeZoneConfirmed() == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)useAutomaticTime:(id)a3
{
  int v3 = NSNumber;
  BOOL v4 = TMIsAutomaticTimeZoneEnabled() != 0;
  return (id)[v3 numberWithBool:v4];
}

- (void)setUseAutomaticTime:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  int v7 = [a3 BOOLValue];
  id v8 = [(PSGDateTimeController *)self useAutomaticTime:v6];

  LODWORD(v6) = [v8 BOOLValue];
  if (v7 != v6)
  {
    TMSetAutomaticTimeZoneEnabled();
    if (v7)
    {
      TMSetAutomaticTimeEnabled();
      id v9 = [(PSGDateTimeController *)self minuteTimer];
      [v9 invalidate];

      BOOL v10 = [(PSGDateTimeController *)self timeZoneSpecifier];
      [(PSGDateTimeController *)self _setSpecifier:v10 valueEnabled:0];

      [(PSGDateTimeController *)self reloadTimezone];
      id v24 = [MEMORY[0x263EFF980] array];
      id v11 = [(PSGDateTimeController *)self currentTimeSpecifier];

      if (v11)
      {
        id v12 = [(PSGDateTimeController *)self currentTimeSpecifier];
        [v24 addObject:v12];

        [(PSGDateTimeController *)self setCurrentTimeSpecifier:0];
      }
      uint64_t v13 = [(PSGDateTimeController *)self timePickerSpecifier];

      if (v13)
      {
        objc_super v14 = [(PSGDateTimeController *)self timePickerSpecifier];
        [v24 addObject:v14];

        [(PSGDateTimeController *)self setTimePickerSpecifier:0];
      }
      [(PSGDateTimeController *)self removeContiguousSpecifiers:v24 animated:1];
    }
    else
    {
      v15 = [(PSGDateTimeController *)self timeZoneSpecifier];
      PSCityForSpecifier();
      id v24 = (id)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v16 = [(PSGDateTimeController *)self timeZoneSpecifier];
        [(PSGDateTimeController *)self setTimeZoneValue:v24 specifier:v16];
      }
      v17 = [(PSGDateTimeController *)self timeZoneSpecifier];
      [(PSGDateTimeController *)self _setSpecifier:v17 valueEnabled:1];

      int v18 = [MEMORY[0x263F82670] currentDevice];
      char v19 = objc_msgSend(v18, "sf_inRetailKioskMode");

      if ((v19 & 1) == 0)
      {
        v20 = [(PSGDateTimeController *)self currentTimeSpecifier];

        if (!v20)
        {
          int v21 = [(PSGDateTimeController *)self makeCurrentTimeSpecifier];
          [(PSGDateTimeController *)self setCurrentTimeSpecifier:v21];
        }
        v22 = [(PSGDateTimeController *)self currentTimeSpecifier];
        [(PSGDateTimeController *)self insertSpecifier:v22 afterSpecifierID:@"TIME_ZONE" animated:1];

        v23 = [(PSGDateTimeController *)self minuteTimer];
        [v23 startTimer];
      }
    }
  }
}

- (id)isShowingDateInStatusBar:(id)a3
{
  int v3 = NSNumber;
  BOOL v4 = CFPreferencesGetAppBooleanValue(@"StatusBarHidesDate", @"com.apple.UIKit", 0) == 0;
  return (id)[v3 numberWithBool:v4];
}

- (void)setShowDateInStatusBar:(id)a3 specifier:(id)a4
{
  BOOL v4 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  int v5 = [a3 BOOLValue];
  id v6 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (v5) {
    id v6 = v4;
  }
  CFPreferencesSetAppValue(@"StatusBarHidesDate", *v6, @"com.apple.UIKit");
  CFPreferencesAppSynchronize(@"com.apple.UIKit");
}

- (id)isShowingAMPMInStatusBar:(id)a3
{
  int v3 = NSNumber;
  BOOL v4 = CFPreferencesGetAppBooleanValue(@"StatusBarHidesAMPM", @"com.apple.UIKit", 0) == 0;
  return (id)[v3 numberWithBool:v4];
}

- (void)setShowAMPMInStatusBar:(id)a3 specifier:(id)a4
{
  BOOL v4 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  int v5 = [a3 BOOLValue];
  id v6 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (v5) {
    id v6 = v4;
  }
  CFPreferencesSetAppValue(@"StatusBarHidesAMPM", *v6, @"com.apple.UIKit");
  CFPreferencesAppSynchronize(@"com.apple.UIKit");
}

- (id)is24HourTime:(id)a3
{
  int v3 = NSNumber;
  BOOL v4 = +[PSGDateTimeState is24HourTime];
  return (id)[v3 numberWithBool:v4];
}

- (void)set24HourTime:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  +[PSGDateTimeState set24HourTime:](PSGDateTimeState, "set24HourTime:", [v5 BOOLValue]);
  char v6 = [v5 BOOLValue];

  int v7 = [(PSGDateTimeController *)self ampmToggleSpecifier];
  if (v6) {
    [(PSGDateTimeController *)self removeSpecifier:v7 animated:1];
  }
  else {
    [(PSGDateTimeController *)self insertSpecifier:v7 afterSpecifierID:@"24_HOUR_TIME" animated:1];
  }

  [(PSGDateTimeController *)self _createDateTimeFormatters];
  [(PSGDateTimeController *)self _updateCurrentTime];
}

- (id)timeZoneValue:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CFTimeZoneResetSystem();
  CFTimeZoneRef v5 = CFTimeZoneCopySystem();
  char v6 = PSCityForSpecifier();

  int v7 = [(PSGDateTimeController *)self specifierForID:@"SET_AUTOMATICALLY"];
  id v8 = [(PSGDateTimeController *)self useAutomaticTime:v7];
  int v9 = [v8 BOOLValue];

  if (!v9)
  {
    if (v6)
    {
      v15 = [(__CFTimeZone *)v5 name];
      v16 = [v6 timeZone];
      int v17 = [v15 isEqualToString:v16];

      if (v17)
      {
        id v11 = [v6 name];
        if (v11) {
          goto LABEL_12;
        }
      }
    }
    goto LABEL_9;
  }
  BOOL v10 = PSCityForTimeZone();
  id v11 = [v10 name];

  id v12 = [(__CFTimeZone *)v5 name];
  int v13 = [v12 isEqualToString:@"Asia/Shanghai"];

  if (v13)
  {
    uint64_t v14 = PSG_LocalizedStringForDateAndTime(@"BEIJING");

    id v11 = (void *)v14;
  }
  if (!v11)
  {
LABEL_9:
    id v11 = [(__CFTimeZone *)v5 name];
    int v18 = _PSGLoggingFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543362;
      int v21 = v11;
      _os_log_impl(&dword_23D28D000, v18, OS_LOG_TYPE_DEFAULT, "Timezone is not in ALCityManager: %{public}@", (uint8_t *)&v20, 0xCu);
    }
  }
LABEL_12:

  return v11;
}

- (void)setTimeZoneValue:(id)a3 specifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  int v7 = [v10 properties];
  [v6 setProperty:v7 forKey:*MEMORY[0x263F60308]];

  CFPreferencesSetAppValue(@"timezone", (CFPropertyListRef)[v10 classicIdentifier], @"com.apple.preferences.datetime");
  CFPreferencesSetAppValue(@"timezoneset", (CFPropertyListRef)*MEMORY[0x263EFFB40], @"com.apple.preferences.datetime");
  CFPreferencesAppSynchronize(@"com.apple.preferences.datetime");
  id v8 = (void *)MEMORY[0x263F5FCD0];
  int v9 = [v10 timeZone];
  [v8 setTimeZone:v9];

  [MEMORY[0x263EFFA18] resetSystemTimeZone];
  [(PSGDateTimeController *)self _createDateTimeFormatters];
  [(PSGDateTimeController *)self _updateCurrentTime];
}

- (void)loadTimeZoneController:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_opt_new();
  [v6 setSpecifier:v4];

  [v6 setParentController:self];
  CFTimeZoneRef v5 = [(PSGDateTimeController *)self navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (void)_updateCurrentTime
{
  id v4 = [(PSGDateTimeController *)self specifierForID:@"CURRENT_TIME"];
  int v3 = [(PSGDateTimeController *)self currentDateString];
  [v4 setName:v3];

  [(PSGDateTimeController *)self reloadSpecifier:v4 animated:0];
}

- (void)_createDateTimeFormatters
{
  dateFormatter = self->_dateFormatter;
  if (dateFormatter) {
    CFRelease(dateFormatter);
  }
  timeFormatter = self->_timeFormatter;
  if (timeFormatter) {
    CFRelease(timeFormatter);
  }
  CFLocaleRef v5 = CFLocaleCopyCurrent();
  self->_dateFormatter = CFDateFormatterCreate(0, v5, kCFDateFormatterMediumStyle, kCFDateFormatterNoStyle);
  self->_timeFormatter = CFDateFormatterCreate(0, v5, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
  CFRelease(v5);
}

- (id)currentTimeString
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  StringWithAbsoluteTime = (__CFString *)CFDateFormatterCreateStringWithAbsoluteTime(0, self->_timeFormatter, Current);
  return StringWithAbsoluteTime;
}

- (id)currentDateString
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  StringWithAbsoluteTime = (__CFString *)CFDateFormatterCreateStringWithAbsoluteTime(0, self->_dateFormatter, Current);
  return StringWithAbsoluteTime;
}

- (void)carrierBundleChange:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    [(PSGDateTimeController *)self reloadSpecifiers];
  }
  else
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __45__PSGDateTimeController_carrierBundleChange___block_invoke;
    v5[3] = &unk_264E8C9C8;
    v5[4] = self;
    id v6 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

uint64_t __45__PSGDateTimeController_carrierBundleChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) carrierBundleChange:*(void *)(a1 + 40)];
}

- (PSSpecifier)timeZoneSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setTimeZoneSpecifier:(id)a3
{
}

- (PSSpecifier)timePickerSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setTimePickerSpecifier:(id)a3
{
}

- (PSSpecifier)currentTimeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1440, 1);
}

- (void)setCurrentTimeSpecifier:(id)a3
{
}

- (PSGWallClockMinuteTimer)minuteTimer
{
  return self->_minuteTimer;
}

- (void)setMinuteTimer:(id)a3
{
}

- (PSSpecifier)ampmToggleSpecifier
{
  return self->_ampmToggleSpecifier;
}

- (void)setAmpmToggleSpecifier:(id)a3
{
}

- (CoreTelephonyClient)_client
{
  return self->__client;
}

- (void)set_client:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__client, 0);
  objc_storeStrong((id *)&self->_ampmToggleSpecifier, 0);
  objc_storeStrong((id *)&self->_minuteTimer, 0);
  objc_storeStrong((id *)&self->_currentTimeSpecifier, 0);
  objc_storeStrong((id *)&self->_timePickerSpecifier, 0);
  objc_storeStrong((id *)&self->_timeZoneSpecifier, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_setDateAndTimeIndexPath, 0);
}

@end