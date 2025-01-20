@interface _SUSUIPostUpdateAlertController
- (BOOL)_isUILocked;
- (_SUSUIPostUpdateAlertController)initWithLayoutStateMonitor:(id)a3 alertPresentationManager:(id)a4;
- (id)_initWithLayoutStateMonitor:(id)a3 alertPresentationManager:(id)a4 inSetupModeProvider:(id)a5;
- (void)_dismissAlertForReason:(id)a3;
- (void)_noteAlertAcknowledgedWithReason:(id)a3;
- (void)_setupAssistantFinished;
- (void)_showStartupAlertItemForReason:(id)a3;
- (void)_uiLockStateChanged:(BOOL)a3;
- (void)layoutStateMonitorStateDidChange:(id)a3;
- (void)layoutStateMonitorUILockStateDidChange:(id)a3;
@end

@implementation _SUSUIPostUpdateAlertController

- (_SUSUIPostUpdateAlertController)initWithLayoutStateMonitor:(id)a3 alertPresentationManager:(id)a4
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  v4 = v10;
  v10 = 0;
  v10 = [(_SUSUIPostUpdateAlertController *)v4 _initWithLayoutStateMonitor:location[0] alertPresentationManager:v8 inSetupModeProvider:&stru_61360];
  v7 = v10;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v10, 0);
  return v7;
}

- (id)_initWithLayoutStateMonitor:(id)a3 alertPresentationManager:(id)a4 inSetupModeProvider:(id)a5
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  v5 = v25;
  v25 = 0;
  v21.receiver = v5;
  v21.super_class = (Class)_SUSUIPostUpdateAlertController;
  v11 = [(_SUSUIPostUpdateAlertController *)&v21 init];
  v25 = v11;
  objc_storeStrong((id *)&v25, v11);
  if (v11)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.softwareupdateservices._SUSUIPostUpdateAlertController", 0);
    controllerQueue = v25->_controllerQueue;
    v25->_controllerQueue = (OS_dispatch_queue *)v6;

    objc_storeStrong((id *)&v25->_alertPresentationManager, v23);
    objc_storeStrong((id *)&v25->_layoutStateMonitor, location[0]);
    v25->_showingAlert = 0;
    queue = v25->_controllerQueue;
    v14 = _NSConcreteStackBlock;
    int v15 = -1073741824;
    int v16 = 0;
    v17 = sub_3DD74;
    v18 = &unk_601E8;
    v19 = v25;
    id v20 = v22;
    dispatch_async(queue, &v14);
    objc_storeStrong(&v20, 0);
    objc_storeStrong((id *)&v19, 0);
  }
  v9 = v25;
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v25, 0);
  return v9;
}

- (void)_noteAlertAcknowledgedWithReason:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_controllerQueue;
  v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_3E3D0;
  id v8 = &unk_5CFB0;
  id v9 = location[0];
  v10 = v12;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_uiLockStateChanged:(BOOL)a3
{
  v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  queue = self->_controllerQueue;
  v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_3E6C8;
  id v8 = &unk_5F378;
  id v9 = self;
  BOOL v10 = v11;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

- (void)_setupAssistantFinished
{
  v8[2] = self;
  v8[1] = (id)a2;
  queue = self->_controllerQueue;
  v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = sub_3E9A4;
  v7 = &unk_5CC30;
  v8[0] = self;
  dispatch_async(queue, &v3);
  objc_storeStrong(v8, 0);
}

- (BOOL)_isUILocked
{
  return self->_isUILocked;
}

- (void)layoutStateMonitorStateDidChange:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)layoutStateMonitorUILockStateDidChange:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = [location[0] isUILocked];
  [(_SUSUIPostUpdateAlertController *)v5 _uiLockStateChanged:v3 & 1];
  objc_storeStrong(location, 0);
}

- (void)_showStartupAlertItemForReason:(id)a3
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = (id)SUSUILogPostUpdateAlert();
  os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
  {
    sub_548C((uint64_t)v26, (uint64_t)location[0]);
    _os_log_impl(&def_46F0, (os_log_t)v23, v22, "Showing alert item for reason: %@", v26, 0xCu);
  }
  objc_storeStrong(&v23, 0);
  objc_initWeak(&from, v25);
  int v6 = [SUSUISetupUpgradeAlertItem alloc];
  BOOL inSetupMode = v25->_inSetupMode;
  BOOL isUILocked = v25->_isUILocked;
  v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  v17 = sub_3EEF8;
  v18 = &unk_61388;
  objc_copyWeak(v19, &from);
  id v20 = [(SUSUISetupUpgradeAlertItem *)v6 initWithGoingToSetup:inSetupMode isLocked:isUILocked withAcknowledgementBlock:&v14];
  v25->_showingAlert = 1;
  queue = [(SUSUIAlertPresentationManager *)v25->_alertPresentationManager queue];
  v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  BOOL v10 = sub_3EF40;
  BOOL v11 = &unk_5CFB0;
  SEL v12 = v25;
  id v13 = v20;
  dispatch_async(queue, &v7);

  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v20, 0);
  objc_destroyWeak(v19);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

- (void)_dismissAlertForReason:(id)a3
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = (id)SUSUILogPostUpdateAlert();
  os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    sub_548C((uint64_t)v14, (uint64_t)location[0]);
    _os_log_impl(&def_46F0, (os_log_t)v11, v10, "Dismissing alert for reason: %@", v14, 0xCu);
  }
  objc_storeStrong(&v11, 0);
  [(_SUSUIPostUpdateAlertController *)v13 _noteAlertAcknowledgedWithReason:location[0]];
  queue = [(SUSUIAlertPresentationManager *)v13->_alertPresentationManager queue];
  int v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_3F19C;
  int v8 = &unk_5CC30;
  int v9 = v13;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
}

@end