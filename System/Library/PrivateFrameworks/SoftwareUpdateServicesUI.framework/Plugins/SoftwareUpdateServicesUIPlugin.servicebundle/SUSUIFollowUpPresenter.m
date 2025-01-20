@interface SUSUIFollowUpPresenter
+ (id)sharedInstance;
- (BOOL)FollowUpWithIdentifierIsPresented:(id)a3;
- (BOOL)clearAllFollowUps;
- (BOOL)clearFollowUpWithIdentifiers:(id)a3;
- (BOOL)presentFollowUp:(id)a3 error:(id *)a4;
- (SUSUIFollowUpPresenter)init;
- (id)_followUpItemForSUSUIFollowUp:(id)a3;
@end

@implementation SUSUIFollowUpPresenter

+ (id)sharedInstance
{
  v5 = (dispatch_once_t *)&unk_70490;
  id location = 0;
  objc_storeStrong(&location, &stru_613F0);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)qword_70488;

  return v2;
}

- (SUSUIFollowUpPresenter)init
{
  SEL v10 = a2;
  v11 = 0;
  v9.receiver = self;
  v9.super_class = (Class)SUSUIFollowUpPresenter;
  v8 = [(SUSUIFollowUpPresenter *)&v9 init];
  v11 = v8;
  objc_storeStrong((id *)&v11, v8);
  if (v8)
  {
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.susui.followUpPresenterQueue", 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v2;

    v4 = (FLFollowUpController *)[objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.softwareupdateservicesui.followupclient"];
    followUpController = v11->_followUpController;
    v11->_followUpController = v4;
  }
  v7 = v11;
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (BOOL)presentFollowUp:(id)a3 error:(id *)a4
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  int v17 = 0x20000000;
  int v18 = 32;
  char v19 = 0;
  queue = v22->_queue;
  v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  v11 = sub_40820;
  v12 = &unk_61418;
  v13 = v22;
  v14[0] = location[0];
  v14[1] = &v15;
  v14[2] = v20;
  dispatch_sync(queue, &v8);
  char v7 = *((unsigned char *)v16 + 24);
  objc_storeStrong(v14, 0);
  objc_storeStrong((id *)&v13, 0);
  _Block_object_dispose(&v15, 8);
  objc_storeStrong(location, 0);
  return v7 & 1;
}

- (BOOL)clearFollowUpWithIdentifiers:(id)a3
{
  char v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v13 = 0;
  v14 = &v13;
  int v15 = 0x20000000;
  int v16 = 32;
  char v17 = 0;
  queue = v19->_queue;
  v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = sub_40AF0;
  int v10 = &unk_61440;
  v12[1] = &v13;
  v11 = v19;
  v12[0] = location[0];
  dispatch_sync(queue, &v6);
  char v5 = *((unsigned char *)v14 + 24);
  objc_storeStrong(v12, 0);
  objc_storeStrong((id *)&v11, 0);
  _Block_object_dispose(&v13, 8);
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)clearAllFollowUps
{
  char v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  queue = self->_queue;
  char v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = sub_40D60;
  int v9 = &unk_5FD38;
  v10[1] = &v11;
  v10[0] = self;
  dispatch_sync(queue, &v5);
  char v4 = *((unsigned char *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

- (BOOL)FollowUpWithIdentifierIsPresented:(id)a3
{
  char v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v13 = 0;
  int v14 = &v13;
  int v15 = 0x20000000;
  int v16 = 32;
  char v17 = 0;
  queue = v19->_queue;
  int v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = sub_41010;
  int v10 = &unk_61468;
  uint64_t v11 = v19;
  v12[0] = location[0];
  v12[1] = &v13;
  dispatch_sync(queue, &v6);
  char v5 = *((unsigned char *)v14 + 24);
  objc_storeStrong(v12, 0);
  objc_storeStrong((id *)&v11, 0);
  _Block_object_dispose(&v13, 8);
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (id)_followUpItemForSUSUIFollowUp:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v26 = objc_alloc_init((Class)FLFollowUpItem);
    id v14 = [location[0] title];
    objc_msgSend(v26, "setTitle:");

    id v15 = [location[0] informativeText];
    objc_msgSend(v26, "setInformativeText:");

    id v16 = [location[0] informativeFooterText];
    objc_msgSend(v26, "setInformativeFooterText:");

    id v17 = [(id)objc_opt_class() uniqueIdentifier];
    objc_msgSend(v26, "setUniqueIdentifier:");

    id v18 = [location[0] groupIdentifier];
    objc_msgSend(v26, "setGroupIdentifier:");

    id v19 = [location[0] targetBundleIdentifier];
    objc_msgSend(v26, "setTargetBundleIdentifier:");

    id v20 = [location[0] userInfo];
    objc_msgSend(v26, "setUserInfo:");

    objc_msgSend(v26, "setDisplayStyle:", objc_msgSend(location[0], "displayStyle"));
    id v21 = [location[0] actions];
    objc_msgSend(v26, "setActions:");

    if ([location[0] allowNotification])
    {
      id v25 = objc_alloc_init((Class)FLFollowUpNotification);
      id v8 = [location[0] notificationTitle];
      objc_msgSend(v25, "setTitle:");

      id v9 = [location[0] notificationInformativeText];
      objc_msgSend(v25, "setInformativeText:");

      id v10 = [location[0] notificationUnlockActionLabel];
      objc_msgSend(v25, "setUnlockActionLabel:");

      [location[0] notificationFrequency];
      objc_msgSend(v25, "setFrequency:");
      id v11 = [location[0] notificationActivateAction];
      objc_msgSend(v25, "setActivateAction:");

      id v12 = [location[0] notificationClearAction];
      objc_msgSend(v25, "setClearAction:");

      id v13 = [location[0] notificationOptions];
      if (v13)
      {
        id v5 = +[FLFollowUpNotification defaultOptions];
        v24 = +[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:");

        int v6 = v24;
        id v7 = [location[0] notificationOptions];
        -[NSMutableSet addObjectsFromArray:](v6, "addObjectsFromArray:");

        [v25 setOptions:v24];
        objc_storeStrong((id *)&v24, 0);
      }
      [v26 setNotification:v25];
      objc_storeStrong(&v25, 0);
    }
    id v32 = v26;
    int v27 = 1;
    objc_storeStrong(&v26, 0);
  }
  else
  {
    id v30 = (id)SUSUILog();
    os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v30;
      os_log_type_t v23 = v29;
      sub_5A1C(v28);
      _os_log_impl(&def_46F0, v22, v23, "Unable to create FLFollowUpItem with nil SUSUIFollowUpBase", v28, 2u);
    }
    objc_storeStrong(&v30, 0);
    id v32 = 0;
    int v27 = 1;
  }
  objc_storeStrong(location, 0);
  v3 = v32;

  return v3;
}

- (void).cxx_destruct
{
}

@end