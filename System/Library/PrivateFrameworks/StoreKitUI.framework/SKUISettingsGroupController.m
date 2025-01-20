@interface SKUISettingsGroupController
- (NSMutableArray)settingDescriptions;
- (SKUISettingsGroupControllerDelegate)delegate;
- (SKUISettingsGroupDescription)settingsGroupDescription;
- (id)_viewForSettingDescription:(id)a3;
- (void)_reloadSettingDescription:(id)a3;
- (void)attachSettingDescription:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSettingDescriptions:(id)a3;
- (void)setSettingsGroupDescription:(id)a3;
@end

@implementation SKUISettingsGroupController

- (void)attachSettingDescription:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISettingsGroupController attachSettingDescription:]();
  }
  settingDescriptions = self->_settingDescriptions;
  if (!settingDescriptions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_settingDescriptions;
    self->_settingDescriptions = v6;

    settingDescriptions = self->_settingDescriptions;
  }
  [(NSMutableArray *)settingDescriptions addObject:v4];
  if ([v4 conformsToProtocol:&unk_1F1E13DF8]) {
    [v4 setController:self];
  }
}

- (void)_reloadSettingDescription:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 settingsGroupController:self reloadSettingDescription:v7];
  }
}

- (id)_viewForSettingDescription:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = [v7 settingsGroupController:self viewForSettingDescription:v4];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (SKUISettingsGroupControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUISettingsGroupControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)settingDescriptions
{
  return self->_settingDescriptions;
}

- (void)setSettingDescriptions:(id)a3
{
}

- (SKUISettingsGroupDescription)settingsGroupDescription
{
  return self->_settingsGroupDescription;
}

- (void)setSettingsGroupDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsGroupDescription, 0);
  objc_storeStrong((id *)&self->_settingDescriptions, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)attachSettingDescription:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISettingsGroupController attachSettingDescription:]";
}

@end