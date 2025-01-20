@interface SUUISettingsGroupController
- (NSMutableArray)settingDescriptions;
- (SUUISettingsGroupControllerDelegate)delegate;
- (SUUISettingsGroupDescription)settingsGroupDescription;
- (id)_viewForSettingDescription:(id)a3;
- (void)_reloadSettingDescription:(id)a3;
- (void)attachSettingDescription:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSettingDescriptions:(id)a3;
- (void)setSettingsGroupDescription:(id)a3;
@end

@implementation SUUISettingsGroupController

- (void)attachSettingDescription:(id)a3
{
  id v4 = a3;
  settingDescriptions = self->_settingDescriptions;
  id v8 = v4;
  if (!settingDescriptions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_settingDescriptions;
    self->_settingDescriptions = v6;

    id v4 = v8;
    settingDescriptions = self->_settingDescriptions;
  }
  [(NSMutableArray *)settingDescriptions addObject:v4];
  if ([v8 conformsToProtocol:&unk_27066BFF8]) {
    [v8 setController:self];
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
    id v8 = [v7 settingsGroupController:self viewForSettingDescription:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (SUUISettingsGroupControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUISettingsGroupControllerDelegate *)WeakRetained;
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

- (SUUISettingsGroupDescription)settingsGroupDescription
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

@end