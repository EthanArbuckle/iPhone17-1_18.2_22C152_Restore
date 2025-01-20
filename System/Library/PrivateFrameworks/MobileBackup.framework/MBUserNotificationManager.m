@interface MBUserNotificationManager
+ (id)sharedManager;
- (BOOL)_shouldInformUserWithNotification:(id)a3 account:(id)a4;
- (MBUserNotificationManager)init;
- (__CFUserNotification)_createCFUserNotificationFromMBUserNotification:(id)a3;
- (id)_dateOfLastNagForIdentifier:(id)a3 account:(id)a4;
- (id)_descriptionForResponse:(unint64_t)a3;
- (id)_mbNotificationForCFNotification:(__CFUserNotification *)a3;
- (id)_mbNotificationForIdentifier:(id)a3;
- (id)_propertiesForMBUserNotification:(id)a3;
- (void)_setupIsDone;
- (void)_updateDidInformUserWithNotification:(id)a3 account:(id)a4;
- (void)_userDidRespondToNotification:(__CFUserNotification *)a3 withFlags:(unint64_t)a4;
- (void)cancelNotificationWithIdentifier:(id)a3 account:(id)a4;
- (void)clearDidInformUserWithNotificationIdentifier:(id)a3 account:(id)a4;
- (void)dealloc;
- (void)deferUntilAfterSetupIsDone:(id)a3;
- (void)presentUserNotification:(id)a3 account:(id)a4;
- (void)presentUserNotification:(id)a3 account:(id)a4 completion:(id)a5;
@end

@implementation MBUserNotificationManager

- (id)_descriptionForResponse:(unint64_t)a3
{
  CFStringRef v3 = @"Unknown";
  if (a3 == 1) {
    CFStringRef v3 = @"kMBAlternateButton";
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"kMBDefaultButton";
  }
}

+ (id)sharedManager
{
  if (qword_100482868 != -1) {
    dispatch_once(&qword_100482868, &stru_100417D38);
  }
  return (id)qword_100482860;
}

- (MBUserNotificationManager)init
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3052000000;
  v9[3] = sub_10029BE24;
  v9[4] = sub_10029BE34;
  v9[5] = self;
  v8.receiver = self;
  v8.super_class = (Class)MBUserNotificationManager;
  v2 = [(MBUserNotificationManager *)&v8 init];
  if (v2)
  {
    CFStringRef v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create(Name, 0);
    v2->_afterSetupIsDoneBlocks = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    queue = v2->_queue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10029BE40;
    handler[3] = &unk_1004167F8;
    handler[4] = v9;
    notify_register_dispatch("com.apple.purplebuddy.setupdone", &v2->_setupIsDoneNotificationToken, queue, handler);
    v2->_notifications = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->_runLoopSources = (NSMapTable *)objc_alloc_init((Class)NSMapTable);
  }
  _Block_object_dispose(v9, 8);
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_queue);

  notify_cancel(self->_setupIsDoneNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)MBUserNotificationManager;
  [(MBUserNotificationManager *)&v3 dealloc];
}

- (void)_setupIsDone
{
  objc_super v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(NSMutableArray *)self->_afterSetupIsDoneBlocks count];
    *(_DWORD *)buf = 134217984;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Buddy setup complete, sleeping for 1 second then running %lu deferred blocks", buf, 0xCu);
    id v10 = [(NSMutableArray *)self->_afterSetupIsDoneBlocks count];
    _MBLog();
  }
  sleep(1u);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  afterSetupIsDoneBlocks = self->_afterSetupIsDoneBlocks;
  id v6 = [(NSMutableArray *)afterSetupIsDoneBlocks countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(afterSetupIsDoneBlocks);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * i));
      }
      id v7 = [(NSMutableArray *)afterSetupIsDoneBlocks countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [(NSMutableArray *)self->_afterSetupIsDoneBlocks removeAllObjects];
}

- (void)deferUntilAfterSetupIsDone:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10029C0A0;
  v4[3] = &unk_100415DE8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)_propertiesForMBUserNotification:(id)a3
{
  id v4 = +[NSMutableDictionary dictionary];
  v6[0] = kCFUserNotificationAlertHeaderKey;
  v7[0] = [a3 title];
  v6[1] = kCFUserNotificationAlertMessageKey;
  v7[1] = [a3 body];
  v6[2] = kCFUserNotificationDefaultButtonTitleKey;
  v7[2] = [a3 button];
  v7[3] = &__kCFBooleanTrue;
  v6[3] = kCFUserNotificationAlertTopMostKey;
  v6[4] = SBUserNotificationDontDismissOnUnlock;
  v7[4] = &__kCFBooleanTrue;
  v7[5] = &__kCFBooleanTrue;
  v6[5] = SBUserNotificationPendInSetupIfNotAllowedKey;
  v6[6] = SBUserNotificationDismissOnLock;
  v7[6] = &__kCFBooleanFalse;
  objc_msgSend(v4, "addEntriesFromDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 7));
  if ([a3 alternateButton]) {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(a3, "alternateButton"), kCFUserNotificationAlternateButtonTitleKey);
  }
  return v4;
}

- (__CFUserNotification)_createCFUserNotificationFromMBUserNotification:(id)a3
{
  CFDictionaryRef v3 = [(MBUserNotificationManager *)self _propertiesForMBUserNotification:a3];
  return CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 2uLL, 0, v3);
}

- (id)_mbNotificationForCFNotification:(__CFUserNotification *)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  notifications = self->_notifications;
  id v5 = [(NSMutableArray *)notifications countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(notifications);
    }
    v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 cfUserNotification] == a3) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSMutableArray *)notifications countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)_mbNotificationForIdentifier:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  notifications = self->_notifications;
  id v5 = [(NSMutableArray *)notifications countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(notifications);
    }
    v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(objc_msgSend(v9, "identifier"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSMutableArray *)notifications countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)_userDidRespondToNotification:(__CFUserNotification *)a3 withFlags:(unint64_t)a4
{
  char v4 = a4;
  id v8 = -[MBUserNotificationManager _mbNotificationForCFNotification:](self, "_mbNotificationForCFNotification:");
  if ((v4 & 3) == 1)
  {
    uint64_t v10 = 1;
  }
  else
  {
    if ((v4 & 3) == 3)
    {
      v9 = MBGetDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = [v8 identifier];
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "User notification %@ canceled", buf, 0xCu);
        [v8 identifier];
        _MBLog();
      }
      goto LABEL_11;
    }
    uint64_t v10 = 0;
  }
  long long v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = [(MBUserNotificationManager *)self _descriptionForResponse:v10];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "User response: \"%@\"", buf, 0xCu);
    id v15 = [(MBUserNotificationManager *)self _descriptionForResponse:v10];
    _MBLog();
  }
  if (objc_msgSend(v8, "completionBlock", v15))
  {
    long long v12 = (void (**)(id, uint64_t))[v8 completionBlock];
    v12[2](v12, v10);
  }
LABEL_11:
  long long v13 = (__CFRunLoopSource *)NSMapGet(self->_runLoopSources, a3);
  Main = CFRunLoopGetMain();
  CFRunLoopRemoveSource(Main, v13, kCFRunLoopDefaultMode);
  NSMapRemove(self->_runLoopSources, a3);
  [(NSMutableArray *)self->_notifications removeObject:v8];
  [+[MBDaemon sharedDaemon] releaseWorkAssertion:a2];
}

- (void)presentUserNotification:(id)a3 account:(id)a4
{
}

- (void)presentUserNotification:(id)a3 account:(id)a4 completion:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10029C7AC;
  block[3] = &unk_100417D60;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)cancelNotificationWithIdentifier:(id)a3 account:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10029CE44;
  block[3] = &unk_100417D88;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_dateOfLastNagForIdentifier:(id)a3 account:(id)a4
{
  id v5 = [a4 persona];
  CFTypeRef v6 = (id)CFMakeCollectable(@"UserNotificationEvents");
  id v7 = [v5 copyPreferencesValueForKey:v6 class:objc_opt_class()];
  return [v7 objectForKeyedSubscript:a3];
}

- (BOOL)_shouldInformUserWithNotification:(id)a3 account:(id)a4
{
  id v5 = -[MBUserNotificationManager _dateOfLastNagForIdentifier:account:](self, "_dateOfLastNagForIdentifier:account:", [a3 identifier], a4);
  if (!v5) {
    return 1;
  }
  [+[NSDate date] timeIntervalSinceDate:v5];
  double v7 = v6;
  [a3 interval];
  return v7 > v8;
}

- (void)_updateDidInformUserWithNotification:(id)a3 account:(id)a4
{
  id v6 = [a4 persona];
  CFTypeRef v7 = (id)CFMakeCollectable(@"UserNotificationEvents");
  id v8 = objc_msgSend(objc_msgSend(v6, "copyPreferencesValueForKey:class:", v7, objc_opt_class()), "mutableCopy");
  if (!v8) {
    id v8 = +[NSMutableDictionary dictionary];
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", +[NSDate date](NSDate, "date"), objc_msgSend(a3, "identifier"));
  id v9 = [a4 persona];
  CFTypeRef v10 = (id)CFMakeCollectable(@"UserNotificationEvents");
  [v9 setPreferencesValue:v8 forKey:v10];
}

- (void)clearDidInformUserWithNotificationIdentifier:(id)a3 account:(id)a4
{
  id v6 = [a4 persona];
  CFTypeRef v7 = (id)CFMakeCollectable(@"UserNotificationEvents");
  id v8 = objc_msgSend(objc_msgSend(v6, "copyPreferencesValueForKey:class:", v7, objc_opt_class()), "mutableCopy");
  if (v8)
  {
    id v9 = v8;
    if ([v8 objectForKeyedSubscript:a3]) {
      [v9 removeObjectForKey:a3];
    }
  }
  else
  {
    id v9 = +[NSMutableDictionary dictionary];
  }
  id v10 = [a4 persona];
  CFTypeRef v11 = (id)CFMakeCollectable(@"UserNotificationEvents");
  [v10 setPreferencesValue:v9 forKey:v11];
}

@end