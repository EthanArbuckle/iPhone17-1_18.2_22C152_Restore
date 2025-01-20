@interface SHSKeyboardClicksControllerViewController
+ (NSString)combinedDescription;
- (id)_hapticValue:(id)a3;
- (id)specifiers;
- (void)_setHapticValue:(id)a3 specifier:(id)a4;
- (void)_setSoundValue:(id)a3 specifier:(id)a4;
- (void)_updateReloadSpecifierInParentController;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SHSKeyboardClicksControllerViewController

+ (NSString)combinedDescription
{
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL v2 = CFPreferencesGetAppBooleanValue(@"keyboard-audio", @"com.apple.preferences.sounds", &keyExistsAndHasValidFormat) == 0;
  BOOL v3 = keyExistsAndHasValidFormat != 0;
  v4 = [MEMORY[0x263F828C8] sharedPreferencesController];
  uint64_t v5 = [v4 visceral];
  v6 = @"HAPTIC";
  if (!v5) {
    v6 = @"NONE";
  }
  if (v3 && v2 || v5 == 0) {
    v7 = @"SOUND";
  }
  else {
    v7 = @"SOUND_AND_HAPTIC";
  }
  if (v3 && v2) {
    v8 = v6;
  }
  else {
    v8 = v7;
  }

  v9 = SHS_LocalizedStringForSounds(v8);
  return (NSString *)v9;
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)SHSKeyboardClicksControllerViewController;
  [(SHSKeyboardClicksControllerViewController *)&v4 loadView];
  BOOL v3 = SHS_LocalizedStringForSounds(@"KEYBOARD_FEEDBACK");
  [(SHSKeyboardClicksControllerViewController *)self setTitle:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SHSKeyboardClicksControllerViewController;
  [(SHSKeyboardClicksControllerViewController *)&v4 viewWillAppear:a3];
  [(SHSKeyboardClicksControllerViewController *)self reloadSpecifiers];
}

- (void)viewDidAppear:(BOOL)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)SHSKeyboardClicksControllerViewController;
  [(SHSKeyboardClicksControllerViewController *)&v12 viewDidAppear:a3];
  id v4 = objc_alloc(MEMORY[0x263F08DB0]);
  uint64_t v5 = [MEMORY[0x263EFF960] currentLocale];
  v6 = SHS_BundleForSoundsAndHapticsSettingsFramework();
  v7 = [v6 bundleURL];
  v8 = (void *)[v4 initWithKey:@"KEYBOARD_FEEDBACK" table:@"Sounds" locale:v5 bundleURL:v7];

  v9 = objc_msgSend(MEMORY[0x263F08DB0], "shs_rootPaneComponent");
  v13[0] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  v11 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Sounds/KEYBOARD_FEEDBACK"];
  [(SHSKeyboardClicksControllerViewController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.sound" title:v8 localizedNavigationComponents:v10 deepLink:v11];
}

- (id)specifiers
{
  v14[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    uint64_t v5 = (void *)MEMORY[0x263F5FC40];
    v6 = SHS_LocalizedStringForSounds(@"SOUND");
    v7 = [v5 preferenceSpecifierNamed:v6 target:self set:sel__setSoundValue_specifier_ get:sel_readPreferenceValue_ detail:0 cell:6 edit:0];

    [v7 setProperty:@"com.apple.preferences.sounds" forKey:*MEMORY[0x263F60070]];
    [v7 setProperty:@"keyboard-audio" forKey:*MEMORY[0x263F60170]];
    [v7 setProperty:@"com.apple.preferences.sounds.changed" forKey:*MEMORY[0x263F60300]];
    [v7 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60068]];
    v8 = (void *)MEMORY[0x263F5FC40];
    v9 = SHS_LocalizedStringForSounds(@"HAPTIC");
    v10 = [v8 preferenceSpecifierNamed:v9 target:self set:sel__setHapticValue_specifier_ get:sel__hapticValue_ detail:0 cell:6 edit:0];

    v14[0] = v7;
    v14[1] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
    objc_super v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v11;

    id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)_setSoundValue:(id)a3 specifier:(id)a4
{
  [(SHSKeyboardClicksControllerViewController *)self setPreferenceValue:a3 specifier:a4];
  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v6 = *MEMORY[0x263F08660];
  v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v5 postNotificationName:v6 object:v7];

  [(SHSKeyboardClicksControllerViewController *)self _updateReloadSpecifierInParentController];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.preferences.sounds.keyboard-audio.changed", 0, 0, 1u);
}

- (id)_hapticValue:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F828C8], "sharedPreferencesController", a3);
  BOOL v4 = [v3 visceral] != 0;
  uint64_t v5 = [NSNumber numberWithInt:v4];

  return v5;
}

- (void)_setHapticValue:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  id v7 = [MEMORY[0x263F828C8] sharedPreferencesController];
  [v7 setVisceral:v5];
  [(SHSKeyboardClicksControllerViewController *)self _updateReloadSpecifierInParentController];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.keyboard.preferences.haptic-feedback.changed", 0, 0, 1u);
}

- (void)_updateReloadSpecifierInParentController
{
  id v5 = [(SHSKeyboardClicksControllerViewController *)self parentController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v5;
    BOOL v4 = [(SHSKeyboardClicksControllerViewController *)self specifier];
    [v3 reloadSpecifier:v4];
  }
}

@end