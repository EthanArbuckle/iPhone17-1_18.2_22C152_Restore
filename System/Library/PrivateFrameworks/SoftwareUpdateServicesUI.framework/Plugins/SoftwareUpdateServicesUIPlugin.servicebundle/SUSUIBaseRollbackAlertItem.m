@interface SUSUIBaseRollbackAlertItem
+ (void)activateAlertItem:(id)a3;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)reappearsAfterLock;
- (BOOL)shouldShowInLockScreen;
- (BOOL)undimsScreen;
- (BOOL)unlocksScreen;
- (SURollbackDescriptor)rollbackDescriptor;
- (SUSUIBaseRollbackAlertItem)initWithRollbackDescriptor:(id)a3 softwareUpdateController:(id)a4;
- (SUSUISoftwareUpdateController)softwareUpdateController;
- (id)updateName;
- (void)dismissAlert;
@end

@implementation SUSUIBaseRollbackAlertItem

- (SUSUIBaseRollbackAlertItem)initWithRollbackDescriptor:(id)a3 softwareUpdateController:(id)a4
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = v12;
  v12 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)SUSUIBaseRollbackAlertItem;
  v8 = [(SUSUIBaseAlertItem *)&v9 init];
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8)
  {
    objc_storeStrong((id *)(&v12->super._isUILocked + 1), location[0]);
    objc_storeStrong((id *)((char *)&v12->_rollbackDescriptor + 1), v10);
  }
  v6 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

+ (void)activateAlertItem:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)dismissAlert
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)SUSUIBaseRollbackAlertItem;
  [(SUSUIBaseAlertItem *)&v2 dismissAlert];
}

- (id)updateName
{
  v7[2] = self;
  v7[1] = (id)a2;
  v7[0] = 0;
  id location = (id)_CFCopySupplementalVersionDictionary();
  if (location)
  {
    id v2 = [location objectForKeyedSubscript:_kCFSystemVersionShortVersionStringKey];
    id v3 = v7[0];
    v7[0] = v2;
  }
  id v5 = v7[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v7, 0);

  return v5;
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 0;
}

- (BOOL)unlocksScreen
{
  return [(SUSUIBaseRollbackAlertItem *)self undimsScreen];
}

- (BOOL)undimsScreen
{
  return 0;
}

- (BOOL)reappearsAfterLock
{
  return 0;
}

- (SURollbackDescriptor)rollbackDescriptor
{
  return *(SURollbackDescriptor **)(&self->super._isUILocked + 1);
}

- (SUSUISoftwareUpdateController)softwareUpdateController
{
  return *(SUSUISoftwareUpdateController **)((char *)&self->_rollbackDescriptor + 1);
}

- (void).cxx_destruct
{
}

@end