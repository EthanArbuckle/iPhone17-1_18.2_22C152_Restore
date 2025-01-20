@interface _SBSUICFUserNotificationContentHostViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (SBUserNotificationAlert)userNotification;
- (void)configureWithCompletion:(id)a3;
- (void)invalidateWithCompletion:(id)a3;
- (void)setUserNotification:(id)a3;
@end

@implementation _SBSUICFUserNotificationContentHostViewController

- (void)configureWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userNotification);
  v6 = SBLogCFUserNotifications();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v19 = WeakRetained;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "<%p> Configuring user notification content extension view controller.", buf, 0xCu);
  }

  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __77___SBSUICFUserNotificationContentHostViewController_configureWithCompletion___block_invoke;
  v15 = &unk_1E6AF6828;
  id v16 = WeakRetained;
  id v17 = v4;
  id v7 = v4;
  id v8 = WeakRetained;
  v9 = (void (**)(void))MEMORY[0x1D948C7A0](&v12);
  v10 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  v11 = v10;
  if (v10) {
    [v10 configureWithCompletion:v9];
  }
  else {
    v9[2](v9);
  }
}

- (void)invalidateWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_userNotification = &self->_userNotification;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_userNotification);
  id v7 = SBLogCFUserNotifications();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    id v10 = WeakRetained;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "<%p> Invalidating user notification content extension view controller.", (uint8_t *)&v9, 0xCu);
  }

  id v8 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v8 invalidateWithCompletion:v5];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34F88C8];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F35B1AC8];
}

- (SBUserNotificationAlert)userNotification
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userNotification);
  return (SBUserNotificationAlert *)WeakRetained;
}

- (void)setUserNotification:(id)a3
{
}

- (void).cxx_destruct
{
}

@end