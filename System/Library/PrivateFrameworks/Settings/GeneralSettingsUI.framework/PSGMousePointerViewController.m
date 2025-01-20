@interface PSGMousePointerViewController
- (PSGMousePointerViewController)init;
- (id)naturalScrolling:(id)a3;
- (id)secondaryClick:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tapToClick:(id)a3;
- (id)trackingSpeed:(id)a3;
- (id)twoFingerSecondaryClick:(id)a3;
- (void)dealloc;
- (void)pointerDevicesDidChange;
- (void)setNaturalScrolling:(id)a3 specifier:(id)a4;
- (void)setSecondaryClick:(id)a3 specifier:(id)a4;
- (void)setTapToClick:(id)a3 specifier:(id)a4;
- (void)setTrackingSpeed:(id)a3 specifier:(id)a4;
- (void)setTwoFingerSecondaryClick:(id)a3 specifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PSGMousePointerViewController

- (PSGMousePointerViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PSGMousePointerViewController;
  v2 = [(PSGMousePointerViewController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_pointerDevicesDidChange name:PSGPointerDevicesDidChangeNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSGMousePointerViewController;
  [(PSGMousePointerViewController *)&v4 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)PSGMousePointerViewController;
  [(PSGMousePointerViewController *)&v15 viewDidAppear:a3];
  objc_super v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/POINTERS"];
  objc_super v5 = +[PSGMousePointerController sharedInstance];
  int v6 = [v5 hasMouse];

  id v7 = objc_alloc(MEMORY[0x263F08DB0]);
  if (v6) {
    v8 = @"TRACKPAD_MOUSE";
  }
  else {
    v8 = @"TRACKPAD";
  }
  v9 = [MEMORY[0x263EFF960] currentLocale];
  v10 = PSG_BundleForGeneralSettingsUIFramework();
  v11 = [v10 bundleURL];
  v12 = (void *)[v7 initWithKey:v8 table:@"Pointers" locale:v9 bundleURL:v11];

  v13 = objc_msgSend(MEMORY[0x263F08DB0], "general_rootPaneComponent");
  v16[0] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [(PSGMousePointerViewController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.trackpad-and-mouse" title:v12 localizedNavigationComponents:v14 deepLink:v4];
}

- (void)pointerDevicesDidChange
{
  v3 = +[PSGMousePointerController sharedInstance];
  objc_super v4 = [v3 pointerDevices];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    [(PSGMousePointerViewController *)self reloadSpecifiers];
  }
  else
  {
    id v7 = [(PSGMousePointerViewController *)self navigationController];
    id v6 = (id)[v7 popViewControllerAnimated:1];
  }
}

- (id)specifiers
{
  v59[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    uint64_t v5 = +[PSGMousePointerController sharedInstance];
    int v6 = [v5 hasMouse];

    if (v6)
    {
      id v7 = PSG_LocalizedStringForPointers(@"TRACKPAD_MOUSE");
      [(PSGMousePointerViewController *)self setTitle:v7];
    }
    v8 = objc_opt_new();
    v9 = (void *)MEMORY[0x263F5FC40];
    v10 = PSG_LocalizedStringForPointers(@"TRACKING_SPEED");
    uint64_t v11 = [v9 groupSpecifierWithID:@"TRACKING_SPEED_GROUP" name:v10];

    v57 = (void *)v11;
    [v8 addObject:v11];
    v12 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:sel_setTrackingSpeed_specifier_ get:sel_trackingSpeed_ detail:0 cell:5 edit:0];
    [v12 setIdentifier:@"TRACKING_SPEED"];
    [v12 setProperty:&unk_26F103C28 forKey:*MEMORY[0x263F60258]];
    [v12 setProperty:&unk_26F103C40 forKey:*MEMORY[0x263F60038]];
    [v12 setProperty:&unk_26F103C28 forKey:*MEMORY[0x263F60030]];
    [v12 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F60230]];
    uint64_t v13 = MEMORY[0x263EFFA88];
    [v12 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60238]];
    [v12 setProperty:v13 forKey:*MEMORY[0x263F60248]];
    v14 = [MEMORY[0x263F827E8] systemImageNamed:@"tortoise.fill"];
    [v12 setProperty:v14 forKey:*MEMORY[0x263F60240]];

    objc_super v15 = [MEMORY[0x263F827E8] systemImageNamed:@"hare.fill"];
    [v12 setProperty:v15 forKey:*MEMORY[0x263F60250]];

    [v8 addObject:v12];
    v16 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SCROLLING_GROUP"];
    v17 = PSG_LocalizedStringForPointers(@"SCROLLING_FOOTER");
    [v16 setProperty:v17 forKey:*MEMORY[0x263F600F8]];

    v56 = v16;
    [v8 addObject:v16];
    v18 = (void *)MEMORY[0x263F5FC40];
    v19 = PSG_LocalizedStringForPointers(@"NATURAL_SCROLLING");
    v20 = [v18 preferenceSpecifierNamed:v19 target:self set:sel_setNaturalScrolling_specifier_ get:sel_naturalScrolling_ detail:0 cell:6 edit:0];

    [v20 setIdentifier:@"NATURAL_SCROLLING"];
    v55 = v20;
    [v8 addObject:v20];
    v21 = +[PSGMousePointerController sharedInstance];
    LODWORD(v16) = [v21 hasTrackpad];

    if (v16)
    {
      v22 = (void *)MEMORY[0x263F5FC40];
      v23 = PSG_LocalizedStringForPointers(@"TRACKPAD");
      uint64_t v24 = [v22 groupSpecifierWithID:@"TRACKPAD_GROUP" name:v23];

      v53 = (void *)v24;
      [v8 addObject:v24];
      v25 = (void *)MEMORY[0x263F5FC40];
      v26 = PSG_LocalizedStringForPointers(@"TAP_TO_CLICK");
      v27 = [v25 preferenceSpecifierNamed:v26 target:self set:sel_setTapToClick_specifier_ get:sel_tapToClick_ detail:0 cell:6 edit:0];

      [v27 setIdentifier:@"TAP_TO_CLICK"];
      [v8 addObject:v27];
      v28 = (void *)MEMORY[0x263F5FC40];
      v29 = PSG_LocalizedStringForPointers(@"TWO_FINGER_SECONDARY_CLICK");
      v30 = [v28 preferenceSpecifierNamed:v29 target:self set:sel_setTwoFingerSecondaryClick_specifier_ get:sel_twoFingerSecondaryClick_ detail:0 cell:6 edit:0];

      [v30 setIdentifier:@"TWO_FINGER_SECONDARY_CLICK"];
      [v8 addObject:v30];
      v31 = +[PSGMousePointerController sharedInstance];
      LODWORD(v23) = [v31 trackpadSupportsSystemHaptics];

      if (v23)
      {
        v32 = (void *)MEMORY[0x263F5FC40];
        v33 = PSG_LocalizedStringForPointersHiding(@"SYSTEM_HAPTICS");
        v34 = [v32 preferenceSpecifierNamed:v33 target:self set:sel_setPreferenceValue_specifier_ get:sel_readPreferenceValue_ detail:0 cell:6 edit:0];

        [v34 setIdentifier:@"SYSTEM_HAPTICS"];
        [v34 setObject:@"com.apple.preferences.sounds" forKeyedSubscript:*MEMORY[0x263F60070]];
        [v34 setObject:@"effects-trackpad-haptic" forKeyedSubscript:*MEMORY[0x263F60170]];
        [v34 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60068]];
        [v34 setObject:@"com.apple.preferences.sounds.changed" forKeyedSubscript:*MEMORY[0x263F60300]];
        [v8 addObject:v34];
      }
    }
    v35 = +[PSGMousePointerController sharedInstance];
    int v36 = [v35 hasMouse];

    if (v36)
    {
      v37 = +[PSGMousePointerController sharedInstance];
      int v38 = [v37 hasMagicMouse];

      v39 = (void *)MEMORY[0x263F5FC40];
      if (v38) {
        v40 = @"MAGIC_MOUSE";
      }
      else {
        v40 = @"MOUSE";
      }
      v41 = PSG_LocalizedStringForPointers(v40);
      uint64_t v42 = [v39 groupSpecifierWithID:@"MOUSE" name:v41];

      v54 = (void *)v42;
      [v8 addObject:v42];
      v43 = (void *)MEMORY[0x263F5FC40];
      v44 = PSG_LocalizedStringForPointers(@"SECONDARY_CLICK");
      v45 = [v43 preferenceSpecifierNamed:v44 target:self set:sel_setSecondaryClick_specifier_ get:sel_secondaryClick_ detail:objc_opt_class() cell:2 edit:0];

      [v45 setIdentifier:@"SECONDARY_CLICK"];
      if (v38)
      {
        v46 = PSG_LocalizedStringForPointers(@"SECONDARY_CLICK_OFF");
        v59[0] = v46;
        v47 = PSG_LocalizedStringForPointers(@"SECONDARY_CLICK_RIGHT");
        v59[1] = v47;
        v48 = PSG_LocalizedStringForPointers(@"SECONDARY_CLICK_LEFT");
        v59[2] = v48;
        v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:3];

        v50 = &unk_26F103D78;
      }
      else
      {
        v46 = PSG_LocalizedStringForPointers(@"SECONDARY_CLICK_RIGHT");
        v58[0] = v46;
        v47 = PSG_LocalizedStringForPointers(@"SECONDARY_CLICK_LEFT");
        v58[1] = v47;
        v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:2];
        v50 = &unk_26F103D90;
      }

      [v45 setValues:v50 titles:v49];
      [v8 addObject:v45];
    }
    v51 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v8;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)setSecondaryClick:(id)a3 specifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[PSGMousePointerController sharedInstance];
  int v6 = [v5 globalDevicePreferences];

  id v7 = +[PSGMousePointerController sharedInstance];
  int v8 = [v7 hasMagicMouse];

  uint64_t v9 = (int)[v4 intValue];
  if (v8) {
    [v6 setButtonConfigurationForVirtualButtonMice:v9];
  }
  else {
    [v6 setButtonConfigurationForHardwareButtonMice:v9];
  }
  v10 = +[PSGMousePointerController sharedInstance];
  [v10 setGlobalDevicePreferences:v6];

  uint64_t v11 = _PSGLoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    uint64_t v13 = "-[PSGMousePointerViewController setSecondaryClick:specifier:]";
    __int16 v14 = 2112;
    id v15 = v4;
    __int16 v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_23D28D000, v11, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v12, 0x20u);
  }
}

- (id)secondaryClick:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[PSGMousePointerController sharedInstance];
  int v4 = [v3 hasMagicMouse];

  uint64_t v5 = NSNumber;
  int v6 = +[PSGMousePointerController sharedInstance];
  id v7 = [v6 globalDevicePreferences];
  int v8 = v7;
  if (v4) {
    uint64_t v9 = [v7 buttonConfigurationForVirtualButtonMice];
  }
  else {
    uint64_t v9 = [v7 buttonConfigurationForHardwareButtonMice];
  }
  v10 = [v5 numberWithInteger:v9];

  uint64_t v11 = _PSGLoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    __int16 v14 = "-[PSGMousePointerViewController secondaryClick:]";
    __int16 v15 = 2112;
    __int16 v16 = v10;
    _os_log_impl(&dword_23D28D000, v11, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v13, 0x16u);
  }

  return v10;
}

- (void)setTrackingSpeed:(id)a3 specifier:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[PSGMousePointerController sharedInstance];
  objc_msgSend(v5, "setTrackingSpeedIndex:", objc_msgSend(v4, "intValue"));

  int v6 = _PSGLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[PSGMousePointerViewController setTrackingSpeed:specifier:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_23D28D000, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)trackingSpeed:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = NSNumber;
  id v4 = +[PSGMousePointerController sharedInstance];
  uint64_t v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "trackingSpeedIndex"));

  int v6 = _PSGLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    __int16 v9 = "-[PSGMousePointerViewController trackingSpeed:]";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_23D28D000, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v8, 0x16u);
  }

  return v5;
}

- (void)setTapToClick:(id)a3 specifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[PSGMousePointerController sharedInstance];
  int v6 = [v5 globalDevicePreferences];

  objc_msgSend(v6, "setEnableTapToClick:", objc_msgSend(v4, "BOOLValue"));
  int v7 = +[PSGMousePointerController sharedInstance];
  [v7 setGlobalDevicePreferences:v6];

  int v8 = _PSGLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    __int16 v10 = "-[PSGMousePointerViewController setTapToClick:specifier:]";
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    __int16 v14 = v6;
    _os_log_impl(&dword_23D28D000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v9, 0x20u);
  }
}

- (id)tapToClick:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = NSNumber;
  id v4 = +[PSGMousePointerController sharedInstance];
  uint64_t v5 = [v4 globalDevicePreferences];
  int v6 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "enableTapToClick"));

  int v7 = _PSGLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    __int16 v10 = "-[PSGMousePointerViewController tapToClick:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_23D28D000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (void)setTwoFingerSecondaryClick:(id)a3 specifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[PSGMousePointerController sharedInstance];
  int v6 = [v5 globalDevicePreferences];

  objc_msgSend(v6, "setEnableTwoFingerSecondaryClick:", objc_msgSend(v4, "BOOLValue"));
  int v7 = +[PSGMousePointerController sharedInstance];
  [v7 setGlobalDevicePreferences:v6];

  int v8 = _PSGLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    __int16 v10 = "-[PSGMousePointerViewController setTwoFingerSecondaryClick:specifier:]";
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    __int16 v14 = v6;
    _os_log_impl(&dword_23D28D000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v9, 0x20u);
  }
}

- (id)twoFingerSecondaryClick:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = NSNumber;
  id v4 = +[PSGMousePointerController sharedInstance];
  uint64_t v5 = [v4 globalDevicePreferences];
  int v6 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "enableTwoFingerSecondaryClick"));

  int v7 = _PSGLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    __int16 v10 = "-[PSGMousePointerViewController twoFingerSecondaryClick:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_23D28D000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (void)setNaturalScrolling:(id)a3 specifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[PSGMousePointerController sharedInstance];
  int v6 = [v5 globalDevicePreferences];

  objc_msgSend(v6, "setEnableNaturalScrolling:", objc_msgSend(v4, "BOOLValue"));
  int v7 = +[PSGMousePointerController sharedInstance];
  [v7 setGlobalDevicePreferences:v6];

  int v8 = _PSGLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    __int16 v10 = "-[PSGMousePointerViewController setNaturalScrolling:specifier:]";
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    __int16 v14 = v6;
    _os_log_impl(&dword_23D28D000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v9, 0x20u);
  }
}

- (id)naturalScrolling:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = NSNumber;
  id v4 = +[PSGMousePointerController sharedInstance];
  uint64_t v5 = [v4 globalDevicePreferences];
  int v6 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "enableNaturalScrolling"));

  int v7 = _PSGLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    __int16 v10 = "-[PSGMousePointerViewController naturalScrolling:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_23D28D000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)PSGMousePointerViewController;
  id v6 = a4;
  int v7 = [(PSGMousePointerViewController *)&v20 tableView:a3 cellForRowAtIndexPath:v6];
  uint64_t v8 = -[PSGMousePointerViewController indexForIndexPath:](self, "indexForIndexPath:", v6, v20.receiver, v20.super_class);

  int v9 = [(PSGMousePointerViewController *)self specifierAtIndex:v8];
  __int16 v10 = [v9 identifier];
  LODWORD(v6) = [v10 isEqualToString:@"TRACKING_SPEED"];

  if (v6)
  {
    id v11 = v7;
    id v12 = [v11 control];
    uint64_t v13 = [MEMORY[0x263F5FBC0] appearance];
    __int16 v14 = [v13 segmentedSliderTrackColor];

    if (v14)
    {
      uint64_t v15 = [v11 _accessibilityHigherContrastTintColorForColor:v14];
    }
    else
    {
      __int16 v16 = [MEMORY[0x263F825C8] colorWithWhite:0.596078431 alpha:1.0];
      uint64_t v15 = [v11 _accessibilityHigherContrastTintColorForColor:v16];
    }
    uint64_t v17 = [v12 _minValueView];
    [v17 setTintColor:v15];

    uint64_t v18 = [v12 _maxValueView];
    [v18 setTintColor:v15];
  }
  return v7;
}

@end