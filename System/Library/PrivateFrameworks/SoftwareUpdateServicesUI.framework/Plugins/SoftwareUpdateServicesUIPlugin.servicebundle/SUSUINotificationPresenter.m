@interface SUSUINotificationPresenter
- (BOOL)presentAlert;
- (SUSUIBaseAlertItem)alertItem;
- (SUSUINotificationPresenter)init;
- (SUSUINotificationPresenter)initWithQueue:(id)a3 alert:(id)a4;
- (id)_notificationButtonActions;
- (id)_notificationButtons;
- (id)_notificationOptions;
- (int)_SBPresentationStyleForSUSPresentationStyle:(unint64_t)a3;
- (unint64_t)_notificationFlags;
- (void)dismissAlert;
- (void)updateAlert;
@end

@implementation SUSUINotificationPresenter

- (SUSUINotificationPresenter)init
{
  id location = self;
  objc_storeStrong(&location, 0);
  return 0;
}

- (SUSUINotificationPresenter)initWithQueue:(id)a3 alert:(id)a4
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
  v9.super_class = (Class)SUSUINotificationPresenter;
  v8 = [(SUSUINotificationPresenter *)&v9 init];
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8)
  {
    objc_storeStrong((id *)&v12->_alertItem, v10);
    objc_storeStrong((id *)&v12->_queue, location[0]);
    v12->_notification = 0;
    objc_storeStrong((id *)&v12->_buttonActions, 0);
  }
  v6 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

- (BOOL)presentAlert
{
  v20 = self;
  SEL v19 = a2;
  [(SUSUIBaseAlertItem *)self->_alertItem willPresentAlert];
  unint64_t v18 = [(SUSUINotificationPresenter *)v20 _notificationFlags];
  id v17 = [(SUSUINotificationPresenter *)v20 _notificationOptions];
  id v16 = [(SUSUINotificationPresenter *)v20 _notificationButtonActions];
  SInt32 error = -1;
  CFUserNotificationRef v2 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, v18, &error, (CFDictionaryRef)v17);
  v20->_notification = v2;
  if (v20->_notification && !error)
  {
    queue = dispatch_get_global_queue(33, 0);
    v5 = _NSConcreteStackBlock;
    int v6 = -1073741824;
    int v7 = 0;
    v8 = sub_39094;
    objc_super v9 = &unk_5CFB0;
    id v10 = v20;
    id v11 = v16;
    dispatch_async(queue, &v5);

    char v21 = 1;
    int v12 = 1;
    objc_storeStrong(&v11, 0);
    objc_storeStrong((id *)&v10, 0);
  }
  else
  {
    id location = (id)SUSUILog();
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      sub_16030((uint64_t)v22, error);
      _os_log_impl(&def_46F0, (os_log_t)location, v13, "failed to display notification: %ld", v22, 0xCu);
    }
    objc_storeStrong(&location, 0);
    char v21 = 0;
    int v12 = 1;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  return v21 & 1;
}

- (void)dismissAlert
{
  if (self->_notification) {
    CFUserNotificationCancel(self->_notification);
  }
}

- (void)updateAlert
{
  v5 = self;
  SEL v4 = a2;
  CFOptionFlags flags = [(SUSUINotificationPresenter *)self _notificationFlags];
  CFDictionaryRef dictionary = (CFDictionaryRef)[(SUSUINotificationPresenter *)v5 _notificationOptions];
  if (v5->_notification) {
    CFUserNotificationUpdate(v5->_notification, 0.0, flags, dictionary);
  }
  objc_storeStrong((id *)&dictionary, 0);
}

- (id)_notificationOptions
{
  v32 = self;
  v31[1] = (id)a2;
  v31[0] = +[NSMutableDictionary dictionary];
  id v30 = [(SUSUIBaseAlertItem *)v32->_alertItem buildAlertItemDefinition];
  id v25 = [v30 title];

  if (v25)
  {
    id v24 = [v30 title];
    objc_msgSend(v31[0], "setObject:forKeyedSubscript:");
  }
  CFUserNotificationRef v2 = [(SUSUIBaseAlertItem *)v32->_alertItem contentExtensionID];
  BOOL v23 = v2 != 0;

  if (v23)
  {
    SEL v19 = [(SUSUIBaseAlertItem *)v32->_alertItem contentExtensionID];
    objc_msgSend(v31[0], "setObject:forKeyedSubscript:");

    v20 = [(SUSUIBaseAlertItem *)v32->_alertItem extensionDictionary];
    if (v20)
    {
      id v29 = objc_alloc_init((Class)NSExtensionItem);
      id v17 = [(SUSUIBaseAlertItem *)v32->_alertItem extensionDictionary];
      objc_msgSend(v29, "setUserInfo:");

      id v34 = v29;
      unint64_t v18 = +[NSArray arrayWithObjects:&v34 count:1];
      id location = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:");

      if (location) {
        [v31[0] setObject:location forKeyedSubscript:SBUserNotificationExtensionItemsKey];
      }
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v29, 0);
    }
  }
  else
  {
    id v22 = [v30 message];

    if (v22)
    {
      id v21 = [v30 message];
      objc_msgSend(v31[0], "setObject:forKeyedSubscript:");
    }
  }
  id v27 = [(SUSUINotificationPresenter *)v32 _notificationButtons];
  if (v27 && [v27 count])
  {
    id v16 = [(SUSUINotificationPresenter *)v32 _notificationButtons];
    objc_msgSend(v31[0], "setObject:forKeyedSubscript:");
  }
  int v6 = +[NSNumber numberWithBool:[(SUSUIBaseAlertItem *)v32->_alertItem shouldShowInLockScreen]];
  objc_msgSend(v31[0], "setObject:forKeyedSubscript:");

  int v7 = +[NSNumber numberWithInt:![(SUSUIBaseAlertItem *)v32->_alertItem reappearsAfterLock]];
  objc_msgSend(v31[0], "setObject:forKeyedSubscript:");

  v8 = +[NSNumber numberWithBool:[(SUSUIBaseAlertItem *)v32->_alertItem reappearsAfterUnlock]];
  objc_msgSend(v31[0], "setObject:forKeyedSubscript:");

  objc_super v9 = +[NSNumber numberWithBool:[(SUSUIBaseAlertItem *)v32->_alertItem forcesModalAlertAppearance]];
  objc_msgSend(v31[0], "setObject:forKeyedSubscript:");

  id v10 = +[NSNumber numberWithBool:[(SUSUIBaseAlertItem *)v32->_alertItem showButtonsOnLockScreen]];
  objc_msgSend(v31[0], "setObject:forKeyedSubscript:");

  id v11 = +[NSNumber numberWithBool:[(SUSUIBaseAlertItem *)v32->_alertItem allowInSetup]];
  objc_msgSend(v31[0], "setObject:forKeyedSubscript:");

  int v12 = +[NSNumber numberWithBool:[(SUSUIBaseAlertItem *)v32->_alertItem undimsScreen]];
  objc_msgSend(v31[0], "setObject:forKeyedSubscript:");

  os_log_type_t v13 = +[NSNumber numberWithBool:[(SUSUIBaseAlertItem *)v32->_alertItem allowLockScreenDismissal]];
  objc_msgSend(v31[0], "setObject:forKeyedSubscript:");

  v14 = +[NSNumber numberWithBool:[(SUSUIBaseAlertItem *)v32->_alertItem allowMenuButtonDismissal]];
  objc_msgSend(v31[0], "setObject:forKeyedSubscript:");

  v15 = [(SUSUIBaseAlertItem *)v32->_alertItem allowedApps];
  if (v15)
  {
    v5 = [(SUSUIBaseAlertItem *)v32->_alertItem allowedApps];
    objc_msgSend(v31[0], "setObject:forKeyedSubscript:");
  }
  id v26 = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
  {
    sub_548C((uint64_t)v33, (uint64_t)v31[0]);
    _os_log_impl(&def_46F0, (os_log_t)v26, OS_LOG_TYPE_DEFAULT, "notificationOptions %@", v33, 0xCu);
  }
  objc_storeStrong(&v26, 0);
  id v4 = v31[0];
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(v31, 0);

  return v4;
}

- (unint64_t)_notificationFlags
{
  unint64_t v3 = 3;
  if ([(SUSUIBaseAlertItem *)self->_alertItem allowNoButton]) {
    return 35;
  }
  return v3;
}

- (id)_notificationButtons
{
  SEL v19 = self;
  v18[1] = (id)a2;
  v18[0] = +[NSMutableArray array];
  id v17 = [(SUSUIBaseAlertItem *)v19->_alertItem buildAlertItemDefinition];
  memset(__b, 0, sizeof(__b));
  id obj = [v17 buttons];
  id v13 = [obj countByEnumeratingWithState:__b objects:v20 count:16];
  if (v13)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    id v11 = v13;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(id *)(__b[1] + 8 * v10);
      id v4 = objc_alloc((Class)SBSMutableUserNotificationButtonDefinition);
      id v5 = [v16 label];
      id v14 = objc_msgSend(v4, "initWithTitle:");

      objc_msgSend(v14, "setPresentationStyle:", -[SUSUINotificationPresenter _SBPresentationStyleForSUSPresentationStyle:](v19, "_SBPresentationStyleForSUSPresentationStyle:", objc_msgSend(v16, "presentationStyle")));
      objc_msgSend(v14, "setIsPreferredButton:", (unint64_t)objc_msgSend(v16, "isPreferredButton") & 1);
      id v6 = v18[0];
      id v7 = [v14 build];
      objc_msgSend(v6, "addObject:");

      objc_storeStrong(&v14, 0);
      ++v10;
      if (v8 + 1 >= (unint64_t)v11)
      {
        uint64_t v10 = 0;
        id v11 = [obj countByEnumeratingWithState:__b objects:v20 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  id v3 = [v18[0] copy];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);

  return v3;
}

- (id)_notificationButtonActions
{
  id v16 = self;
  v15[1] = (id)a2;
  v15[0] = +[NSMutableArray array];
  id location = [(SUSUIBaseAlertItem *)v16->_alertItem buildAlertItemDefinition];
  memset(__b, 0, sizeof(__b));
  id obj = [location buttons];
  id v11 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0;
    id v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(id *)(__b[1] + 8 * v8);
      id v4 = v15[0];
      id v5 = [v13 handler];
      objc_msgSend(v4, "addObject:");

      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0;
        id v9 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  id v3 = [v15[0] copy];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v15, 0);

  return v3;
}

- (int)_SBPresentationStyleForSUSPresentationStyle:(unint64_t)a3
{
  if (!a3) {
    return 0;
  }
  if (a3 == 1) {
    return 1;
  }
  if (a3 != 2) {
    return 0;
  }
  return 2;
}

- (SUSUIBaseAlertItem)alertItem
{
  return self->_alertItem;
}

- (void).cxx_destruct
{
}

@end