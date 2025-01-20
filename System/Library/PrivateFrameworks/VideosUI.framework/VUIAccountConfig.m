@interface VUIAccountConfig
- (BOOL)showAccountSettingButtonOnLibraryTab;
- (BOOL)showAccountSettingOnSidebar;
- (VUIAccountConfig)init;
- (void)setShowAccountSettingButtonOnLibraryTab:(BOOL)a3;
- (void)setShowAccountSettingOnSidebar:(BOOL)a3;
@end

@implementation VUIAccountConfig

- (void)setShowAccountSettingOnSidebar:(BOOL)a3
{
  self->_showAccountSettingOnSidebar = a3;
}

- (void)setShowAccountSettingButtonOnLibraryTab:(BOOL)a3
{
  self->_showAccountSettingButtonOnLibraryTab = a3;
}

- (VUIAccountConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUIAccountConfig;
  result = [(VUIAccountConfig *)&v3 init];
  if (result) {
    *(_WORD *)&result->_showAccountSettingButtonOnLibraryTab = 257;
  }
  return result;
}

- (BOOL)showAccountSettingButtonOnLibraryTab
{
  return self->_showAccountSettingButtonOnLibraryTab;
}

- (BOOL)showAccountSettingOnSidebar
{
  return self->_showAccountSettingOnSidebar;
}

@end