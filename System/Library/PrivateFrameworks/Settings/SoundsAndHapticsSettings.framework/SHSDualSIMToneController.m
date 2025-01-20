@interface SHSDualSIMToneController
- (BOOL)isDefaultSIMLineController;
- (NSString)topic;
- (SHSDualSIMToneController)init;
- (SHSDualSIMToneTitleView)titleView;
- (id)_defaultVibrationIdentifierForVibrationPickerWithAlertType:(int64_t)a3 topic:(id)a4;
- (void)_updateReloadSpecifierInParentController;
- (void)setIsDefaultSIMLineController:(BOOL)a3;
- (void)setSpecifier:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setTopic:(id)a3;
- (void)tonePickerViewController:(id)a3 selectedToneWithIdentifier:(id)a4;
- (void)vibrationPickerViewController:(id)a3 selectedVibrationWithIdentifier:(id)a4;
@end

@implementation SHSDualSIMToneController

- (SHSDualSIMToneController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SHSDualSIMToneController;
  v2 = [(SHSToneController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SHSDualSIMToneController *)v2 setIsDefaultSIMLineController:0];
  }
  return v3;
}

- (void)setSpecifier:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [v4 propertyForKey:@"accountIdentifier"];
  v6 = SHSLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "-[SHSDualSIMToneController setSpecifier:]";
    __int16 v33 = 2112;
    v34 = v5;
    _os_log_impl(&dword_237305000, v6, OS_LOG_TYPE_DEFAULT, "%s with topic: %@", buf, 0x16u);
  }

  if (v5)
  {
    [(SHSDualSIMToneController *)self setTopic:v5];
    v7 = [v4 propertyForKey:*MEMORY[0x263F60290]];
    if (v7)
    {
      v8 = SHSLogForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v7;
        _os_log_impl(&dword_237305000, v8, OS_LOG_TYPE_DEFAULT, "SHSDualSIMToneController context:%@", buf, 0xCu);
      }

      v9 = [v7 userDefaultVoice];
      int v10 = [v9 BOOLValue];

      if (v10) {
        [(SHSDualSIMToneController *)self setIsDefaultSIMLineController:1];
      }
      v11 = [(SHSDualSIMToneController *)self titleView];

      if (!v11)
      {
        v12 = [v7 label];
        uint64_t v13 = [v4 propertyForKey:@"contextShortLabel"];
        v14 = (void *)v13;
        v15 = &stru_26EA42AA8;
        if (v13) {
          v15 = (__CFString *)v13;
        }
        v16 = v15;

        v17 = SHSLogForCategory(0);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v32 = v12;
          __int16 v33 = 2112;
          v34 = v16;
          _os_log_impl(&dword_237305000, v17, OS_LOG_TYPE_DEFAULT, "SHSDualSIMToneController creating titleView with simLabel: %@, simShortLabel: %@", buf, 0x16u);
        }

        if (v12)
        {
          v18 = objc_alloc_init(SHSDualSIMToneTitleView);
          titleView = self->_titleView;
          self->_titleView = v18;

          [(SHSDualSIMToneTitleView *)self->_titleView updateContentsWithTitle:v12 badgeText:v16];
        }
      }
      v20 = self->_titleView;
      v21 = [(SHSDualSIMToneController *)self navigationItem];
      [v21 setTitleView:v20];
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)SHSDualSIMToneController;
  [(SHSToneController *)&v30 setSpecifier:v4];
  uint64_t v22 = [(SHSToneController *)self tonePickerViewController];
  if (v22)
  {
    v23 = (void *)v22;
    BOOL v24 = [(SHSDualSIMToneController *)self isDefaultSIMLineController];

    if (v24)
    {
      v25 = [v4 propertyForKey:@"alertType"];
      if (v25)
      {
        uint64_t v26 = TLAlertTypeFromString();
        v27 = [(SHSToneController *)self tonePickerViewController];
        [v27 setTopic:0];

        v28 = [(SHSToneController *)self _defaultToneIdentifierForTonePickerWithAlertType:v26 topic:0];
        v29 = [(SHSToneController *)self tonePickerViewController];
        [v29 setDefaultToneIdentifier:v28];
      }
    }
  }
}

- (void)_updateReloadSpecifierInParentController
{
  id v2 = [(SHSDualSIMToneController *)self parentController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v2 reloadSpecifiers];
  }
}

- (void)tonePickerViewController:(id)a3 selectedToneWithIdentifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = SHSLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315394;
    v20 = "-[SHSDualSIMToneController tonePickerViewController:selectedToneWithIdentifier:]";
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_237305000, v8, OS_LOG_TYPE_DEFAULT, "%s selectedToneWithIdentifier:%@", (uint8_t *)&v19, 0x16u);
  }

  v9 = [MEMORY[0x263F7FC90] sharedToneManager];
  uint64_t v10 = [v6 alertType];
  v11 = [(SHSDualSIMToneController *)self topic];
  [v9 setCurrentToneIdentifier:v7 forAlertType:v10 topic:v11];

  LODWORD(v11) = [(SHSDualSIMToneController *)self isDefaultSIMLineController];
  v12 = [MEMORY[0x263F7FC90] sharedToneManager];
  uint64_t v13 = [v6 alertType];
  if (v11)
  {
    [v12 setCurrentToneIdentifier:v7 forAlertType:v13 topic:0];
  }
  else
  {
    v14 = [(SHSDualSIMToneController *)self topic];
    uint64_t v15 = [v12 currentToneIdentifierForAlertType:v13 topic:v14];

    v16 = [MEMORY[0x263F7FC90] sharedToneManager];
    uint64_t v17 = [v6 alertType];
    v18 = [(SHSDualSIMToneController *)self topic];
    [v16 setCurrentToneIdentifier:v15 forAlertType:v17 topic:v18];

    v12 = (void *)v15;
  }

  [(SHSDualSIMToneController *)self _updateReloadSpecifierInParentController];
}

- (void)vibrationPickerViewController:(id)a3 selectedVibrationWithIdentifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = SHSLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315394;
    v20 = "-[SHSDualSIMToneController vibrationPickerViewController:selectedVibrationWithIdentifier:]";
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_237305000, v8, OS_LOG_TYPE_DEFAULT, "%s selectedToneWithIdentifier:%@", (uint8_t *)&v19, 0x16u);
  }

  v9 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
  uint64_t v10 = [v6 alertType];
  v11 = [(SHSDualSIMToneController *)self topic];
  [v9 setCurrentVibrationIdentifier:v7 forAlertType:v10 topic:v11];

  LODWORD(v11) = [(SHSDualSIMToneController *)self isDefaultSIMLineController];
  v12 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
  uint64_t v13 = [v6 alertType];
  if (v11)
  {
    [v12 setCurrentVibrationIdentifier:v7 forAlertType:v13 topic:0];
  }
  else
  {
    v14 = [(SHSDualSIMToneController *)self topic];
    uint64_t v15 = [v12 currentVibrationIdentifierForAlertType:v13 topic:v14];

    v16 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
    uint64_t v17 = [v6 alertType];
    v18 = [(SHSDualSIMToneController *)self topic];
    [v16 setCurrentVibrationIdentifier:v15 forAlertType:v17 topic:v18];

    v12 = (void *)v15;
  }

  [(SHSDualSIMToneController *)self _updateReloadSpecifierInParentController];
}

- (id)_defaultVibrationIdentifierForVibrationPickerWithAlertType:(int64_t)a3 topic:(id)a4
{
  BOOL v5 = [(SHSDualSIMToneController *)self isDefaultSIMLineController];
  id v6 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
  id v7 = v6;
  if (v5) {
    [v6 defaultVibrationIdentifierForAlertType:a3];
  }
  else {
  v8 = [v6 currentVibrationIdentifierForAlertType:a3];
  }

  return v8;
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (SHSDualSIMToneTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (BOOL)isDefaultSIMLineController
{
  return self->_isDefaultSIMLineController;
}

- (void)setIsDefaultSIMLineController:(BOOL)a3
{
  self->_isDefaultSIMLineController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end