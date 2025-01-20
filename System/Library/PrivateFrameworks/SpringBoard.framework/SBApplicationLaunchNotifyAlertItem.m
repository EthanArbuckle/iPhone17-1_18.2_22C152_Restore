@interface SBApplicationLaunchNotifyAlertItem
- (BOOL)dismissOnLock;
- (SBApplication)application;
- (SBApplicationLaunchNotifyAlertItem)initWithApplication:(id)a3;
@end

@implementation SBApplicationLaunchNotifyAlertItem

- (SBApplicationLaunchNotifyAlertItem)initWithApplication:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBApplicationLaunchNotifyAlertItem.m", 21, @"Invalid parameter not satisfying: %@", @"application" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBApplicationLaunchNotifyAlertItem;
  v7 = [(SBAlertItem *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_application, a3);
    [(SBAlertItem *)v8 setAllowInCar:0];
    [(SBAlertItem *)v8 setAllowMessageInCar:0];
  }

  return v8;
}

- (BOOL)dismissOnLock
{
  return 1;
}

- (SBApplication)application
{
  return self->_application;
}

- (void).cxx_destruct
{
}

@end