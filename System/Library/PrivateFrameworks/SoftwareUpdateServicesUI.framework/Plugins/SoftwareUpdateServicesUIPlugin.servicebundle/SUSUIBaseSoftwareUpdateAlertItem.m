@interface SUSUIBaseSoftwareUpdateAlertItem
+ (void)activateAlertItem:(id)a3;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)reappearsAfterLock;
- (BOOL)shouldShowInLockScreen;
- (BOOL)undimsScreen;
- (BOOL)unlocksScreen;
- (SUDescriptor)descriptor;
- (SUSUIBaseSoftwareUpdateAlertItem)initWithDescriptor:(id)a3 softwareUpdateController:(id)a4;
- (SUSUISoftwareUpdateController)softwareUpdateController;
- (id)updateName;
- (void)activateDisplayWithURL:(id)a3;
- (void)activateSoftwareUpdateSettingsDisplay;
- (void)dismissAlert;
@end

@implementation SUSUIBaseSoftwareUpdateAlertItem

- (SUSUIBaseSoftwareUpdateAlertItem)initWithDescriptor:(id)a3 softwareUpdateController:(id)a4
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
  v9.super_class = (Class)SUSUIBaseSoftwareUpdateAlertItem;
  v8 = [(SUSUIBaseAlertItem *)&v9 init];
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8)
  {
    objc_storeStrong((id *)(&v12->super._isUILocked + 1), location[0]);
    objc_storeStrong((id *)((char *)&v12->_descriptor + 1), v10);
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
  v2.super_class = (Class)SUSUIBaseSoftwareUpdateAlertItem;
  [(SUSUIBaseAlertItem *)&v2 dismissAlert];
}

- (id)updateName
{
  return objc_msgSend(*(id *)(&self->super._isUILocked + 1), "humanReadableUpdateName", a2, self);
}

- (void)activateSoftwareUpdateSettingsDisplay
{
  SEL v3 = +[NSURL URLWithString:@"prefs:root=General&path=SOFTWARE_UPDATE_LINK"];
  -[SUSUIBaseSoftwareUpdateAlertItem activateDisplayWithURL:](self, "activateDisplayWithURL:");
}

- (void)activateDisplayWithURL:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = dispatch_get_global_queue(33, 0);
  v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_6BA8;
  v8 = &unk_5CC30;
  id v9 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
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
  return [(SUSUIBaseSoftwareUpdateAlertItem *)self undimsScreen];
}

- (BOOL)undimsScreen
{
  return 0;
}

- (BOOL)reappearsAfterLock
{
  return 0;
}

- (SUDescriptor)descriptor
{
  return *(SUDescriptor **)(&self->super._isUILocked + 1);
}

- (SUSUISoftwareUpdateController)softwareUpdateController
{
  return *(SUSUISoftwareUpdateController **)((char *)&self->_descriptor + 1);
}

- (void).cxx_destruct
{
}

@end