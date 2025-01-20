@interface SHSHeadphoneAudioAccessoriesController
- (ADASManager)audioSettingsManager;
- (SHSHeadphoneAudioAccessoriesController)init;
- (id)getConnectedToHeadphonesEnabled;
- (id)specifiers;
- (void)confirmForgetAudioAccessoriesAction;
- (void)dealloc;
- (void)deleteAllAudioAccessoryData;
- (void)loadView;
- (void)setAudioSettingsManager:(id)a3;
- (void)setConnectedToHeadphonesEnabled:(id)a3 forSpecifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SHSHeadphoneAudioAccessoriesController

- (SHSHeadphoneAudioAccessoriesController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SHSHeadphoneAudioAccessoriesController;
  v2 = [(SHSHeadphoneAudioAccessoriesController *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)unknownWiredDeviceStatusChanged, (CFStringRef)*MEMORY[0x263F28B80], 0, (CFNotificationSuspensionBehavior)0);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F28B80], 0);
  v4.receiver = self;
  v4.super_class = (Class)SHSHeadphoneAudioAccessoriesController;
  [(SHSHeadphoneAudioAccessoriesController *)&v4 dealloc];
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)SHSHeadphoneAudioAccessoriesController;
  [(SHSHeadphoneAudioAccessoriesController *)&v7 loadView];
  if (MGGetBoolAnswer()) {
    v3 = @"HEADPHONE_USB_AUDIO_ACCESSORIES";
  }
  else {
    v3 = @"HEADPHONE_LIGHTNING_ADAPTERS";
  }
  objc_super v4 = SHS_LocalizedStringForSounds(v3);
  [(SHSHeadphoneAudioAccessoriesController *)self setTitle:v4];

  objc_super v5 = (ADASManager *)objc_alloc_init(MEMORY[0x263F28C30]);
  audioSettingsManager = self->_audioSettingsManager;
  self->_audioSettingsManager = v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SHSHeadphoneAudioAccessoriesController;
  [(SHSHeadphoneAudioAccessoriesController *)&v4 viewWillAppear:a3];
  [(SHSHeadphoneAudioAccessoriesController *)self reloadSpecifiers];
}

- (void)viewDidAppear:(BOOL)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)SHSHeadphoneAudioAccessoriesController;
  [(SHSHeadphoneAudioAccessoriesController *)&v24 viewDidAppear:a3];
  objc_super v4 = NSURL;
  objc_super v5 = NSString;
  v6 = [(SHSHeadphoneAudioAccessoriesController *)self specifier];
  objc_super v7 = [v6 identifier];
  v8 = [v5 stringWithFormat:@"settings-navigation://com.apple.Settings.Sounds/HEADPHONE_LEVEL_LIMIT_SETTING/%@", v7];
  v9 = [v4 URLWithString:v8];

  id v10 = objc_alloc(MEMORY[0x263F08DB0]);
  v11 = [(SHSHeadphoneAudioAccessoriesController *)self specifier];
  v12 = [v11 identifier];
  v13 = [MEMORY[0x263EFF960] currentLocale];
  v14 = SHS_BundleForSoundsAndHapticsSettingsFramework();
  v15 = [v14 bundleURL];
  v16 = (void *)[v10 initWithKey:v12 table:@"Sounds" locale:v13 bundleURL:v15];

  id v17 = objc_alloc(MEMORY[0x263F08DB0]);
  v18 = [MEMORY[0x263EFF960] currentLocale];
  v19 = SHS_BundleForSoundsAndHapticsSettingsFramework();
  v20 = [v19 bundleURL];
  v21 = (void *)[v17 initWithKey:@"HEADPHONE_HEARING_PROTECTION" table:@"Sounds" locale:v18 bundleURL:v20];

  v22 = objc_msgSend(MEMORY[0x263F08DB0], "shs_rootPaneComponent");
  v25[0] = v22;
  v25[1] = v21;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  [(SHSHeadphoneAudioAccessoriesController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.sound" title:v16 localizedNavigationComponents:v23 deepLink:v9];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_super v5 = objc_opt_new();
    v6 = [(SHSHeadphoneAudioAccessoriesController *)self audioSettingsManager];
    uint64_t v7 = *MEMORY[0x263F28BA0];
    v8 = [v6 getPreferenceFor:*MEMORY[0x263F28BA0]];

    if (v8)
    {
      if (MGGetBoolAnswer()) {
        v9 = @"HEADPHONE_CURRENT_USB_AUDIO_ACCESSORY_GROUP";
      }
      else {
        v9 = @"HEADPHONE_CURRENT_LIGHTNING_ADAPTER_GROUP";
      }
      id v10 = (void *)MEMORY[0x263F5FC40];
      v11 = SHS_LocalizedStringForSounds(v9);
      v12 = [v10 groupSpecifierWithID:@"SHSCurrentAudioAccessoryKey" name:v11];

      [v5 addObject:v12];
      v13 = [(SHSHeadphoneAudioAccessoriesController *)self audioSettingsManager];
      v14 = [v13 getPreferenceFor:v7];
      int v15 = [v14 BOOLValue];

      if (v15) {
        v16 = @"HEADPHONE_CURRENT_DEVICE_HEADPHONE_FOOTER";
      }
      else {
        v16 = @"HEADPHONE_CURRENT_DEVICE_OTHER_DEVICE_FOOTER";
      }
      id v17 = SHS_LocalizedStringForSounds(v16);
      [v12 setProperty:v17 forKey:*MEMORY[0x263F600F8]];

      v18 = (void *)MEMORY[0x263F5FC40];
      v19 = SHS_LocalizedStringForSounds(@"CONNECTED_TO_HEADPHONES_SWITCH");
      v20 = [v18 preferenceSpecifierNamed:v19 target:self set:sel_setConnectedToHeadphonesEnabled_forSpecifier_ get:sel_getConnectedToHeadphonesEnabled detail:0 cell:6 edit:0];

      [v5 addObject:v20];
    }
    v21 = [(SHSHeadphoneAudioAccessoriesController *)self audioSettingsManager];
    v22 = [v21 getPreferenceFor:*MEMORY[0x263F28BD0]];
    uint64_t v23 = [v22 count];

    if (v23)
    {
      objc_super v24 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SHSForgetAudioAccessoryKey"];
      [v5 addObject:v24];
      if (MGGetBoolAnswer()) {
        v25 = @"FORGET_USB_AUDIO_ACCESSORIES_BUTTON";
      }
      else {
        v25 = @"FORGET_LIGHTNING_ADAPTERS_BUTTON";
      }
      v26 = (void *)MEMORY[0x263F5FC40];
      v27 = SHS_LocalizedStringForSounds(v25);
      v28 = [v26 preferenceSpecifierNamed:v27 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v28 setButtonAction:sel_confirmForgetAudioAccessoriesAction];
      [v5 addObject:v28];
    }
    v29 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)confirmForgetAudioAccessoriesAction
{
  objc_initWeak(&location, self);
  int v3 = MGGetBoolAnswer();
  int v4 = v3;
  if (v3) {
    objc_super v5 = @"FORGET_USB_AUDIO_ACCESSORIES_CONFIRMATION_BUTTON";
  }
  else {
    objc_super v5 = @"FORGET_LIGHTNING_ADAPTERS_CONFIRMATION_BUTTON";
  }
  if (v3) {
    v6 = @"FORGET_USB_AUDIO_ACCESSORIES_CONFIRMATION_TITLE";
  }
  else {
    v6 = @"FORGET_LIGHTNING_ADAPTERS_CONFIRMATION_TITLE";
  }
  uint64_t v7 = (void *)MEMORY[0x263F82418];
  v8 = SHS_LocalizedStringForSounds(v6);
  if (v4) {
    v9 = @"FORGET_USB_AUDIO_ACCESSORIES_CONFIRMATION_MESSAGE";
  }
  else {
    v9 = @"FORGET_LIGHTNING_ADAPTERS_CONFIRMATION_MESSAGE";
  }
  id v10 = SHS_LocalizedStringForSounds(v9);
  v11 = [v7 alertControllerWithTitle:v8 message:v10 preferredStyle:1];

  v12 = (void *)MEMORY[0x263F82400];
  v13 = SHS_LocalizedStringForSounds(@"FORGET_AUDIO_ACCESSORIES_CANCEL_BUTTON");
  v14 = [v12 actionWithTitle:v13 style:1 handler:0];
  [v11 addAction:v14];

  int v15 = (void *)MEMORY[0x263F82400];
  v16 = SHS_LocalizedStringForSounds(v5);
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __77__SHSHeadphoneAudioAccessoriesController_confirmForgetAudioAccessoriesAction__block_invoke;
  v21 = &unk_264CD0270;
  objc_copyWeak(&v22, &location);
  id v17 = [v15 actionWithTitle:v16 style:2 handler:&v18];
  objc_msgSend(v11, "addAction:", v17, v18, v19, v20, v21);

  [(SHSHeadphoneAudioAccessoriesController *)self presentViewController:v11 animated:1 completion:0];
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

void __77__SHSHeadphoneAudioAccessoriesController_confirmForgetAudioAccessoriesAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained deleteAllAudioAccessoryData];
}

- (void)deleteAllAudioAccessoryData
{
  [(SHSHeadphoneAudioAccessoriesController *)self removeSpecifierID:@"SHSForgetAudioAccessoryKey" animated:1];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F28B60], 0, 0, 1u);
  int v4 = [(SHSHeadphoneAudioAccessoriesController *)self audioSettingsManager];
  objc_super v5 = [v4 getPreferenceFor:*MEMORY[0x263F28BA0]];

  if (!v5)
  {
    id v7 = [MEMORY[0x263F01880] defaultWorkspace];
    v6 = [NSURL URLWithString:@"prefs:root=Sounds&path=HEADPHONE_LEVEL_LIMIT_SETTING"];
    [v7 openSensitiveURL:v6 withOptions:0];
  }
}

- (void)setConnectedToHeadphonesEnabled:(id)a3 forSpecifier:(id)a4
{
  id v7 = a3;
  objc_super v5 = [(SHSHeadphoneAudioAccessoriesController *)self audioSettingsManager];
  id v6 = (id)[v5 setPreferenceFor:*MEMORY[0x263F28BA0] value:v7];
}

- (id)getConnectedToHeadphonesEnabled
{
  v2 = [(SHSHeadphoneAudioAccessoriesController *)self audioSettingsManager];
  int v3 = [v2 getPreferenceFor:*MEMORY[0x263F28BA0]];

  return v3;
}

- (ADASManager)audioSettingsManager
{
  return self->_audioSettingsManager;
}

- (void)setAudioSettingsManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end