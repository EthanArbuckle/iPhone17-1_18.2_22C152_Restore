@interface SDNotificationManager
+ (id)sharedManager;
- (NSSet)activeTVAutoFillPrompts;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (SDNotificationManager)init;
- (id)attachmentFromURL:(id)a3;
- (id)homePodHandoffContentForDevice:(id)a3 info:(id)a4;
- (id)riServerContentForDevice:(id)a3 backgroundAction:(BOOL)a4;
- (id)watchKeyboardContentForDevice:(id)a3;
- (void)_activate;
- (void)_addRequestWithID:(id)a3 content:(id)a4 type:(unsigned int)a5;
- (void)_addRequestWithID:(id)a3 content:(id)a4 type:(unsigned int)a5 isHomePodMini:(BOOL)a6;
- (void)_homePodEnsureStarted:(BOOL)a3 completion:(id)a4;
- (void)_homePodHandleResponse:(id)a3 completion:(id)a4;
- (void)_homePodHandoffPostIfNeeded:(id)a3 info:(id)a4;
- (void)_homePodHandoffRemove:(id)a3 reason:(int64_t)a4;
- (void)_homePodHandoffRemoveAll;
- (void)_homePodHandoffUpdateIfNeeded:(id)a3 info:(id)a4;
- (void)_invalidate;
- (void)_riServerEnsureStarted:(BOOL)a3 completion:(id)a4;
- (void)_riServerPostIfNeeded:(id)a3 backgroundAction:(BOOL)a4;
- (void)_riServerRemove:(id)a3;
- (void)_riServerRemoveAll;
- (void)_riServerUpdate:(id)a3 info:(id)a4;
- (void)_riServerUpdate:(id)a3 rtiData:(id)a4;
- (void)_tvAutoFillPostIfNeeded:(id)a3;
- (void)_tvAutoFillRemove:(id)a3;
- (void)_tvAutoFillRemoveAll;
- (void)_tvHandleResponse:(id)a3 completion:(id)a4;
- (void)_update;
- (void)_watchEnsureStarted:(BOOL)a3 completion:(id)a4;
- (void)_watchHandleResponse:(id)a3 completion:(id)a4;
- (void)_watchKeyboardPostIfNeeded:(id)a3;
- (void)_watchKeyboardRemove:(id)a3;
- (void)_watchKeyboardRemoveAll;
- (void)_watchKeyboardUpdate:(id)a3 info:(id)a4;
- (void)_watchKeyboardUpdate:(id)a3 rtiData:(id)a4;
- (void)activate;
- (void)homePodHandoffPostIfNeeded:(id)a3 info:(id)a4;
- (void)homePodHandoffRemove:(id)a3 reason:(int64_t)a4;
- (void)homePodHandoffRemoveAll;
- (void)homePodHandoffUpdateIfNeeded:(id)a3 info:(id)a4;
- (void)invalidate;
- (void)riServerPostIfNeeded:(id)a3 backgroundAction:(BOOL)a4;
- (void)riServerRemove:(id)a3;
- (void)riServerRemoveAll;
- (void)riServerUpdate:(id)a3 info:(id)a4;
- (void)riServerUpdate:(id)a3 rtiData:(id)a4;
- (void)setDispatchQueue:(id)a3;
- (void)testAutoFillRemove;
- (void)testAutofillPost;
- (void)testHandoffPost;
- (void)testKeyboardPost;
- (void)testKeyboardPostAutoFill;
- (void)testKeyboardRemove;
- (void)testKeyboardUpdate;
- (void)testPost:(id)a3;
- (void)testPostBasic;
- (void)testWatchKeyboard;
- (void)testWatchKeyboardAutoFill;
- (void)tvAutoFillPostIfNeeded:(id)a3;
- (void)tvAutoFillRemove:(id)a3;
- (void)tvAutoFillRemoveAll;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)watchKeyboardPostIfNeeded:(id)a3;
- (void)watchKeyboardRemove:(id)a3;
- (void)watchKeyboardRemoveAll;
- (void)watchKeyboardUpdate:(id)a3 info:(id)a4;
- (void)watchKeyboardUpdate:(id)a3 rtiData:(id)a4;
@end

@implementation SDNotificationManager

+ (id)sharedManager
{
  if (qword_100980148 != -1) {
    dispatch_once(&qword_100980148, &stru_1008CEEE0);
  }
  v2 = (void *)qword_100980150;

  return v2;
}

- (SDNotificationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDNotificationManager;
  v2 = [(SDNotificationManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (NSString)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"-- SDNotificationManager --\n"];
  if (self->_activated) {
    [v3 appendString:@"activated "];
  }
  if (self->_homePodNotifGranted) {
    [v3 appendString:@"HomePod granted "];
  }
  if (self->_tvNotifGranted) {
    [v3 appendString:@"TV granted "];
  }
  if (self->_watchNotifGranted) {
    [v3 appendString:@"Watch granted "];
  }
  if (self->_autoFillRequests)
  {
    [v3 appendString:@"AutoFill requests:\n"];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v4 = [(NSMutableDictionary *)self->_autoFillRequests allKeys];
    id v5 = [v4 countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v38;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v38 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 appendFormat:@" - %@\n", *(void *)(*((void *)&v37 + 1) + 8 * i)];
        }
        id v6 = [v4 countByEnumeratingWithState:&v37 objects:v44 count:16];
      }
      while (v6);
    }
  }
  [v3 appendString:@"\n"];
  if (self->_homePodRequests)
  {
    [v3 appendString:@"HomePod requests:\n"];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v9 = [(NSMutableDictionary *)self->_homePodRequests allKeys];
    id v10 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v34;
      do
      {
        for (j = 0; j != v11; j = (char *)j + 1)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          [v3 appendFormat:@" - %@\n", *(void *)(*((void *)&v33 + 1) + 8 * (void)j)];
        }
        id v11 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
      }
      while (v11);
    }
  }
  [v3 appendString:@"\n"];
  if (self->_tvKeyboardRequests)
  {
    [v3 appendString:@"TVKeyboard requests:\n"];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v14 = [(NSMutableDictionary *)self->_tvKeyboardRequests allKeys];
    id v15 = [v14 countByEnumeratingWithState:&v29 objects:v42 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        for (k = 0; k != v16; k = (char *)k + 1)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          [v3 appendFormat:@" - %@\n", *(void *)(*((void *)&v29 + 1) + 8 * (void)k)];
        }
        id v16 = [v14 countByEnumeratingWithState:&v29 objects:v42 count:16];
      }
      while (v16);
    }
  }
  [v3 appendString:@"\n"];
  if (self->_watchKeyboardRequests)
  {
    [v3 appendString:@"WatchKeyboard requests:\n"];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v19 = [(NSMutableDictionary *)self->_watchKeyboardRequests allKeys];
    id v20 = [v19 countByEnumeratingWithState:&v25 objects:v41 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v26;
      do
      {
        for (m = 0; m != v21; m = (char *)m + 1)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(v19);
          }
          [v3 appendFormat:@" - %@\n", *(void *)(*((void *)&v25 + 1) + 8 * (void)m)];
        }
        id v21 = [v19 countByEnumeratingWithState:&v25 objects:v41 count:16];
      }
      while (v21);
    }
  }

  return (NSString *)v3;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100180518;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_activated)
  {
    if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_activated = 1;
    [(SDNotificationManager *)self prefsChanged];
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018063C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_update
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activated)
  {
    [(SDNotificationManager *)self _homePodEnsureStarted:0 completion:0];
    [(SDNotificationManager *)self _riServerEnsureStarted:0 completion:0];
    [(SDNotificationManager *)self _watchEnsureStarted:0 completion:0];
  }
}

- (void)_riServerEnsureStarted:(BOOL)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  if (self->_tvNotifCenter)
  {
LABEL_2:
    if (v6) {
      v6[2](v6);
    }
    goto LABEL_12;
  }
  if (a3)
  {
    CFPrefs_SetValue();
  }
  else if (!CFPrefs_GetInt64())
  {
    goto LABEL_2;
  }
  notify_post("com.apple.ContinuityKeyBoard.enabled");
  if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v7 = (UNUserNotificationCenter *)[objc_alloc(off_100968C30()) initWithBundleIdentifier:@"com.apple.Sharing.TVRemoteNotifications"];
  tvNotifCenter = self->_tvNotifCenter;
  self->_tvNotifCenter = v7;

  [(UNUserNotificationCenter *)self->_tvNotifCenter setDelegate:self];
  [(UNUserNotificationCenter *)self->_tvNotifCenter setWantsNotificationResponsesDelivered];
  v9 = self->_tvNotifCenter;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001808D8;
  v10[3] = &unk_1008CEF30;
  v10[4] = self;
  id v11 = v6;
  [(UNUserNotificationCenter *)v9 getNotificationSettingsWithCompletionHandler:v10];

LABEL_12:
}

- (void)_watchEnsureStarted:(BOOL)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  if (self->_watchNotifCenter)
  {
LABEL_2:
    if (v6) {
      v6[2](v6);
    }
    goto LABEL_12;
  }
  if (a3)
  {
    CFPrefs_SetValue();
  }
  else if (!CFPrefs_GetInt64())
  {
    goto LABEL_2;
  }
  if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v7 = (UNUserNotificationCenter *)[objc_alloc(off_100968C30()) initWithBundleIdentifier:@"com.apple.Sharing.WatchRemoteNotifications"];
  watchNotifCenter = self->_watchNotifCenter;
  self->_watchNotifCenter = v7;

  [(UNUserNotificationCenter *)self->_watchNotifCenter setDelegate:self];
  [(UNUserNotificationCenter *)self->_watchNotifCenter setWantsNotificationResponsesDelivered];
  v9 = self->_watchNotifCenter;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100180D24;
  v10[3] = &unk_1008CEF30;
  v10[4] = self;
  id v11 = v6;
  [(UNUserNotificationCenter *)v9 getNotificationSettingsWithCompletionHandler:v10];

LABEL_12:
}

- (void)_homePodEnsureStarted:(BOOL)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  if (a3)
  {
    CFPrefs_SetValue();
LABEL_4:
    uint64_t v7 = dispatch_group_create();
    if (!self->_homePodNotifCenter)
    {
      if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v8 = (UNUserNotificationCenter *)[objc_alloc(off_100968C30()) initWithBundleIdentifier:@"com.apple.Sharing.HomePodRemoteNotifications"];
      homePodNotifCenter = self->_homePodNotifCenter;
      self->_homePodNotifCenter = v8;

      [(UNUserNotificationCenter *)self->_homePodNotifCenter setDelegate:self];
      [(UNUserNotificationCenter *)self->_homePodNotifCenter setWantsNotificationResponsesDelivered];
      dispatch_group_enter(v7);
      id v10 = self->_homePodNotifCenter;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1001812F0;
      v19[3] = &unk_1008CEF80;
      v19[4] = self;
      id v20 = v7;
      [(UNUserNotificationCenter *)v10 getNotificationSettingsWithCompletionHandler:v19];
    }
    if (!self->_homePodMiniNotificationCenter)
    {
      if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v11 = (UNUserNotificationCenter *)[objc_alloc(off_100968C30()) initWithBundleIdentifier:@"com.apple.Sharing.b7ce1794a1c8766816fc7b7500742862"];
      homePodMiniNotificationCenter = self->_homePodMiniNotificationCenter;
      self->_homePodMiniNotificationCenter = v11;

      [(UNUserNotificationCenter *)self->_homePodMiniNotificationCenter setDelegate:self];
      [(UNUserNotificationCenter *)self->_homePodMiniNotificationCenter setWantsNotificationResponsesDelivered];
      dispatch_group_enter(v7);
      v13 = self->_homePodMiniNotificationCenter;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100181580;
      v17[3] = &unk_1008CEF80;
      v17[4] = self;
      v18 = v7;
      [(UNUserNotificationCenter *)v13 getNotificationSettingsWithCompletionHandler:v17];
    }
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100181810;
    block[3] = &unk_1008CCFF0;
    id v16 = v6;
    dispatch_group_notify(v7, dispatchQueue, block);

    goto LABEL_19;
  }
  if (CFPrefs_GetInt64()) {
    goto LABEL_4;
  }
  if (v6) {
    v6[2](v6);
  }
LABEL_19:
}

- (void)_addRequestWithID:(id)a3 content:(id)a4 type:(unsigned int)a5
{
}

- (void)_addRequestWithID:(id)a3 content:(id)a4 type:(unsigned int)a5 isHomePodMini:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(objc_class *)off_100968C38() requestWithIdentifier:v10 content:v11 trigger:0];
  switch(a5)
  {
    case 2u:
    case 3u:
      v13 = [(NSMutableDictionary *)self->_homePodRequests objectForKeyedSubscript:v10];

      if (v13 && dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      homePodRequests = self->_homePodRequests;
      if (!homePodRequests)
      {
        v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v19 = self->_homePodRequests;
        self->_homePodRequests = v18;

        homePodRequests = self->_homePodRequests;
      }
      [(NSMutableDictionary *)homePodRequests setObject:v12 forKeyedSubscript:v10];
      id v20 = self->_homePodNotifCenter;
      if (v6)
      {
        id v21 = self->_homePodMiniNotificationCenter;

        id v20 = v21;
      }
      goto LABEL_40;
    case 4u:
      v14 = [(NSMutableDictionary *)self->_autoFillRequests objectForKeyedSubscript:v10];

      if (v14 && dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      autoFillRequests = self->_autoFillRequests;
      if (!autoFillRequests)
      {
        v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v24 = self->_autoFillRequests;
        self->_autoFillRequests = v23;

        autoFillRequests = self->_autoFillRequests;
      }
      goto LABEL_34;
    case 5u:
      id v15 = [(NSMutableDictionary *)self->_tvKeyboardRequests objectForKeyedSubscript:v10];

      if (v15 && dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      autoFillRequests = self->_tvKeyboardRequests;
      if (!autoFillRequests)
      {
        long long v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        tvKeyboardRequests = self->_tvKeyboardRequests;
        self->_tvKeyboardRequests = v25;

        autoFillRequests = self->_tvKeyboardRequests;
      }
LABEL_34:
      [(NSMutableDictionary *)autoFillRequests setObject:v12 forKeyedSubscript:v10];
      tvNotifCenter = self->_tvNotifCenter;
      goto LABEL_39;
    case 6u:
      id v16 = [(NSMutableDictionary *)self->_watchKeyboardRequests objectForKeyedSubscript:v10];

      if (v16 && dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      watchKeyboardRequests = self->_watchKeyboardRequests;
      if (!watchKeyboardRequests)
      {
        long long v29 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        long long v30 = self->_watchKeyboardRequests;
        self->_watchKeyboardRequests = v29;

        watchKeyboardRequests = self->_watchKeyboardRequests;
      }
      [(NSMutableDictionary *)watchKeyboardRequests setObject:v12 forKeyedSubscript:v10];
      tvNotifCenter = self->_watchNotifCenter;
LABEL_39:
      id v20 = tvNotifCenter;
LABEL_40:
      if (v20)
      {
        if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100181D48;
        v31[3] = &unk_1008CEFD0;
        id v32 = v12;
        id v33 = v11;
        long long v34 = self;
        id v35 = v10;
        unsigned int v36 = a5;
        BOOL v37 = v6;
        [(UNUserNotificationCenter *)v20 addNotificationRequest:v32 withCompletionHandler:v31];
      }
      else
      {
        if (dword_100968BC0 <= 90 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
LABEL_8:
        }
          LogPrintF();
LABEL_27:
        id v20 = 0;
      }

      return;
    default:
      if (dword_100968BC0 > 60 || dword_100968BC0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_27;
      }
      goto LABEL_8;
  }
}

- (id)attachmentFromURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[NSMutableDictionary dictionary];
    id v5 = off_100968C48();

    if (v5)
    {
      BOOL v6 = off_100968C48();
      [v4 setObject:kUTTypePNG forKey:v6];
    }
    uint64_t v7 = off_100968C50();

    if (v7)
    {
      v8 = +[NSNumber numberWithBool:1];
      v9 = off_100968C50();
      [v4 setObject:v8 forKey:v9];
    }
    Class v10 = off_100968C58();
    id v11 = [v4 copy];
    uint64_t v12 = [(objc_class *)v10 attachmentWithIdentifier:&stru_1008E7020 URL:v3 options:v11 error:0];

    if (!v12 && dword_100968BC0 <= 90 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)_tvHandleResponse:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1001826C0;
  v32[3] = &unk_1008CCFF0;
  id v6 = a4;
  id v33 = v6;
  uint64_t v7 = objc_retainBlock(v32);
  if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
  {
    id v30 = v5;
    LogPrintF();
  }
  v8 = [v5 notification:v30];
  v9 = [v8 request];
  Class v10 = [v9 identifier];

  if (v10)
  {
    id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v10];
    if (!v11)
    {
      if (dword_100968BC0 <= 90 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_50;
    }
    uint64_t v12 = [v5 actionIdentifier];
    v13 = off_100968C60();
    id v14 = v12;
    id v15 = v13;
    id v16 = v15;
    if (v14 == v15)
    {
      unsigned int v17 = 1;
    }
    else if ((v14 == 0) == (v15 != 0))
    {
      unsigned int v17 = 0;
    }
    else
    {
      unsigned int v17 = [v14 isEqual:v15];
    }

    v18 = [v5 actionIdentifier];
    v19 = off_100968C68();
    id v20 = v18;
    id v21 = v19;
    uint64_t v22 = v21;
    if (v20 == v21)
    {
      unsigned int v23 = 1;
    }
    else if ((v20 == 0) == (v21 != 0))
    {
      unsigned int v23 = 0;
    }
    else
    {
      unsigned int v23 = [v20 isEqual:v21];
    }

    id v24 = objc_alloc_init((Class)SFDevice);
    [v24 setIdentifier:v11];
    if (v23)
    {
      if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      long long v26 = [(NSMutableDictionary *)self->_autoFillRequests allKeys];
      unsigned int v27 = [v26 containsObject:v10];

      if (v27)
      {
        [(SDNotificationManager *)self tvAutoFillRemove:v24];
      }
      else
      {
        long long v28 = [(NSMutableDictionary *)self->_tvKeyboardRequests allKeys];
        unsigned int v29 = [v28 containsObject:v10];

        if (v29)
        {
          [(SDNotificationManager *)self riServerRemove:v24];
        }
        else if (dword_100968BC0 <= 60 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      goto LABEL_49;
    }
    if (v17)
    {
      if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      long long v25 = +[SDRemoteInteractionAgent sharedAgent];
      [v25 clientUserDidTapNotification:v11];
    }
    else
    {
      if (dword_100968BC0 > 90 || dword_100968BC0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_49;
      }
      long long v25 = [v5 actionIdentifier];
      LogPrintF();
    }

LABEL_49:
LABEL_50:

    goto LABEL_51;
  }
  if (dword_100968BC0 <= 90 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_51:

  ((void (*)(void *))v7[2])(v7);
}

- (id)riServerContentForDevice:(id)a3 backgroundAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [v5 identifier];
  uint64_t v7 = [v6 UUIDString];
  v8 = (void *)v7;
  id v9 = 0;
  Class v10 = 0;
  id v11 = 0;
  uint64_t v12 = 0;
  if (v6 && v7)
  {
    v13 = +[NSUUID UUID];
    id v11 = [v13 UUIDString];

    unsigned int v14 = [v5 deviceActionType];
    id v15 = @"REMOTE_BULLETIN_MESSAGE";
    if (v14 == 19)
    {
      id v15 = @"REMOTE_BULLETIN_MESSAGE_AUTOFILL";
      id v16 = @"REMOTE_BULLETIN_SUBTITLE_AUTOFILL";
    }
    else
    {
      id v16 = @"REMOTE_BULLETIN_SUBTITLE";
    }
    Class v10 = v15;
    uint64_t v12 = v16;
    id v9 = objc_alloc_init(off_100968C70());
    unsigned int v17 = SFLocalizedStringForKey();
    [v9 setBody:v17];

    [v9 setCategoryIdentifier:@"continuityRemoteCategory"];
    [v9 setShouldHideTime:1];
    [v9 setShouldHideDate:1];
    [v9 setShouldIgnoreDoNotDisturb:1];
    v18 = [(objc_class *)off_100968C78() soundWithAlertType:23];
    [v9 setSound:v18];

    v19 = SFLocalizedStringForKey();
    [v9 setSubtitle:v19];

    v23[0] = @"deviceIdentifier";
    v23[1] = @"sessionID";
    v24[0] = v8;
    v24[1] = v11;
    id v20 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    [v9 setUserInfo:v20];

    if (v4) {
      [v9 setShouldBackgroundDefaultAction:1];
    }
    else {
      [v9 setShouldSuppressDefaultAction:1];
    }
  }
  id v21 = v9;

  return v21;
}

- (void)riServerPostIfNeeded:(id)a3 backgroundAction:(BOOL)a4
{
  id v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001829D4;
  block[3] = &unk_1008CBB80;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_riServerPostIfNeeded:(id)a3 backgroundAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 identifier];
  id v8 = [v7 UUIDString];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v8)
  {
    uint64_t v9 = [(SDNotificationManager *)self riServerContentForDevice:v6 backgroundAction:v4];
    id v10 = (void *)v9;
    if (v9)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100182ADC;
      v11[3] = &unk_1008CEFF8;
      BOOL v12 = v4;
      v11[4] = v8;
      v11[5] = self;
      v11[6] = v9;
      [(SDNotificationManager *)self _riServerEnsureStarted:1 completion:v11];
    }
  }
}

- (void)riServerRemove:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100182C2C;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_riServerRemove:(id)a3
{
  id v4 = [a3 identifier];
  id v5 = [v4 UUIDString];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    if (v5)
    {
      id v6 = [(NSMutableDictionary *)self->_tvKeyboardRequests objectForKeyedSubscript:v5];

      if (v6)
      {
        if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v9 = v5;
          LogPrintF();
        }
        tvNotifCenter = self->_tvNotifCenter;
        id v10 = v5;
        id v8 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1, v9);
        [(UNUserNotificationCenter *)tvNotifCenter removeDeliveredNotificationsWithIdentifiers:v8];

        [(NSMutableDictionary *)self->_tvKeyboardRequests removeObjectForKey:v5];
      }
    }
  }
}

- (void)riServerRemoveAll
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100182DF4;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_riServerRemoveAll
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100968BC0 <= 10 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(UNUserNotificationCenter *)self->_tvNotifCenter removeAllDeliveredNotifications];
  tvKeyboardRequests = self->_tvKeyboardRequests;

  [(NSMutableDictionary *)tvKeyboardRequests removeAllObjects];
}

- (void)riServerUpdate:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100182F54;
  block[3] = &unk_1008CAF18;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_riServerUpdate:(id)a3 info:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SDNotificationManager *)self riServerContentForDevice:v7 backgroundAction:0];
  id v9 = [v8 mutableCopy];

  id v10 = [v7 identifier];

  BOOL v11 = [v10 UUIDString];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_tvNotifCenter && v10 && v11 && v9)
  {
    id v12 = [(NSMutableDictionary *)self->_tvKeyboardRequests objectForKeyedSubscript:v11];

    if (v12)
    {
      id v13 = [v6 prompt];
      if (v13)
      {
        [v9 setBody:v13];
      }
      else
      {
        unsigned int v14 = SFLocalizedStringForKey();
        [v9 setBody:v14];
      }
      id v15 = [v6 title];
      if (v15)
      {
        [v9 setSubtitle:v15];
      }
      else
      {
        id v16 = SFLocalizedStringForKey();
        [v9 setSubtitle:v16];
      }
      if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
      {
        unsigned int v17 = [v6 prompt];
        [v6 title];
        v21 = id v20 = v17;
        v19 = v11;
        LogPrintF();
      }
      tvNotifCenter = self->_tvNotifCenter;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100183214;
      v22[3] = &unk_1008CA5A8;
      v22[4] = v11;
      -[UNUserNotificationCenter replaceContentForRequestWithIdentifier:replacementContent:completionHandler:](tvNotifCenter, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", v11, v9, v22, v19, v20, v21);
    }
    else if (dword_100968BC0 <= 60 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)riServerUpdate:(id)a3 rtiData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001833F0;
  block[3] = &unk_1008CAF18;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_riServerUpdate:(id)a3 rtiData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SDNotificationManager *)self riServerContentForDevice:v7 backgroundAction:0];
  id v9 = [v8 mutableCopy];

  id v10 = [v7 identifier];

  BOOL v11 = [v10 UUIDString];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v12 = 0;
  int v13 = -6705;
  if (v10 && v11)
  {
    if (v9)
    {
      id v12 = [(NSMutableDictionary *)self->_tvKeyboardRequests objectForKeyedSubscript:v11];

      if (v12)
      {
        id v12 = SFRTIDataPayloadForData();
        if (v12)
        {
          Class v14 = off_100968C80();
          id v15 = [v12 data];
          id v16 = -[objc_class payloadWithData:version:](v14, "payloadWithData:version:", v15, [v12 version]);

          if (v16)
          {
            if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            unsigned int v17 = [v16 documentTraits];
            v18 = [v17 prompt];

            v19 = [v16 documentTraits];
            id v20 = [v19 title];

            if (v18)
            {
              [v9 setBody:v18];
              if (v20)
              {
LABEL_13:
                [v9 setSubtitle:v20];
                goto LABEL_16;
              }
            }
            else
            {
              id v21 = SFLocalizedStringForKey();
              [v9 setBody:v21];

              if (v20) {
                goto LABEL_13;
              }
            }
            uint64_t v22 = SFLocalizedStringForKey();
            [v9 setSubtitle:v22];

LABEL_16:
            if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
            {
              long long v28 = v18;
              unsigned int v29 = v20;
              unsigned int v27 = v11;
              LogPrintF();
            }
            tvNotifCenter = self->_tvNotifCenter;
            v30[0] = _NSConcreteStackBlock;
            v30[1] = 3221225472;
            v30[2] = sub_100183860;
            v30[3] = &unk_1008CA5A8;
            v30[4] = v11;
            -[UNUserNotificationCenter replaceContentForRequestWithIdentifier:replacementContent:completionHandler:](tvNotifCenter, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", v11, v9, v30, v27, v28, v29);
LABEL_21:

            goto LABEL_22;
          }
          int v13 = -6733;
        }
        else
        {
          int v13 = -6742;
        }
      }
      else
      {
        int v13 = -6727;
      }
    }
    else
    {
      id v12 = 0;
      int v13 = -6737;
    }
  }
  if (dword_100968BC0 <= 60 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v24 = v13;
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    uint64_t v25 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    id v16 = (void *)v25;
    CFStringRef v26 = @"?";
    if (v25) {
      CFStringRef v26 = (const __CFString *)v25;
    }
    CFStringRef v32 = v26;
    v18 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    id v20 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v24 userInfo:v18];
    LogPrintF();
    goto LABEL_21;
  }
LABEL_22:
}

- (NSSet)activeTVAutoFillPrompts
{
  uint64_t v2 = [(NSMutableDictionary *)self->_autoFillRequests allKeys];
  id v3 = (void *)v2;
  if (v2) {
    id v4 = (void *)v2;
  }
  else {
    id v4 = &__NSArray0__struct;
  }
  id v5 = +[NSSet setWithArray:v4];

  return (NSSet *)v5;
}

- (void)tvAutoFillPostIfNeeded:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100183A7C;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_tvAutoFillPostIfNeeded:(id)a3
{
  id v4 = [a3 identifier];
  id v5 = [v4 UUIDString];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4 && v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100183B44;
    v6[3] = &unk_1008CA640;
    v6[4] = v5;
    v6[5] = self;
    [(SDNotificationManager *)self _riServerEnsureStarted:1 completion:v6];
  }
}

- (void)tvAutoFillRemove:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100183DF8;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_tvAutoFillRemove:(id)a3
{
  id v4 = [a3 identifier];
  id v5 = [v4 UUIDString];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    if (v5)
    {
      id v6 = [(NSMutableDictionary *)self->_autoFillRequests objectForKeyedSubscript:v5];

      if (v6)
      {
        if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
        {
          id v9 = v5;
          LogPrintF();
        }
        tvNotifCenter = self->_tvNotifCenter;
        id v10 = v5;
        id v8 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1, v9);
        [(UNUserNotificationCenter *)tvNotifCenter removeDeliveredNotificationsWithIdentifiers:v8];

        [(NSMutableDictionary *)self->_autoFillRequests removeObjectForKey:v5];
      }
    }
  }
}

- (void)tvAutoFillRemoveAll
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100183FC0;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_tvAutoFillRemoveAll
{
  if (self->_tvNotifCenter)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    if (dword_100968BC0 <= 10 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(UNUserNotificationCenter *)self->_tvNotifCenter removeAllDeliveredNotifications];
    autoFillRequests = self->_autoFillRequests;
    [(NSMutableDictionary *)autoFillRequests removeAllObjects];
  }
}

- (id)watchKeyboardContentForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];
  uint64_t v5 = [v4 UUIDString];
  id v6 = (void *)v5;
  id v7 = 0;
  id v8 = 0;
  id v9 = 0;
  id v10 = 0;
  if (v4 && v5)
  {
    BOOL v11 = +[NSUUID UUID];
    id v9 = [v11 UUIDString];

    unsigned int v12 = [v3 deviceActionType];
    int v13 = @"WATCH_KEYBOARD_MESSAGE";
    if (v12 == 19)
    {
      int v13 = @"WATCH_KEYBOARD_MESSAGE_AUTOFILL";
      Class v14 = @"WATCH_KEYBOARD_SUBTITLE_AUTOFILL";
    }
    else
    {
      Class v14 = @"WATCH_KEYBOARD_SUBTITLE";
    }
    id v8 = v13;
    id v10 = v14;
    id v7 = objc_alloc_init(off_100968C70());
    id v15 = SFLocalizedStringForKey();
    [v7 setBody:v15];

    [v7 setCategoryIdentifier:@"continuityRemoteCategory"];
    [v7 setShouldHideTime:1];
    [v7 setShouldHideDate:1];
    [v7 setShouldSuppressDefaultAction:1];
    [v7 setShouldIgnoreDoNotDisturb:1];
    id v16 = [(objc_class *)off_100968C78() soundWithAlertType:23];
    [v7 setSound:v16];

    unsigned int v17 = SFLocalizedStringForKey();
    [v7 setSubtitle:v17];

    v22[0] = @"deviceIdentifier";
    v22[1] = @"sessionID";
    v23[0] = v6;
    v23[1] = v9;
    v18 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    [v7 setUserInfo:v18];

    if (SFDeviceClassCodeGet() == 1)
    {
      v19 = +[UNNotificationIcon iconForApplicationIdentifier:@"com.apple.Bridge"];
      [v7 setIcon:v19];
    }
  }
  id v20 = v7;

  return v20;
}

- (void)watchKeyboardPostIfNeeded:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10018437C;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_watchKeyboardPostIfNeeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  id v6 = [v5 UUIDString];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v6)
  {
    uint64_t v7 = [(SDNotificationManager *)self watchKeyboardContentForDevice:v4];
    id v8 = (void *)v7;
    if (v7)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10018446C;
      v9[3] = &unk_1008CAF18;
      v9[4] = v6;
      v9[5] = self;
      v9[6] = v7;
      [(SDNotificationManager *)self _watchEnsureStarted:1 completion:v9];
    }
  }
}

- (void)watchKeyboardRemove:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001845A0;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_watchKeyboardRemove:(id)a3
{
  id v4 = [a3 identifier];
  uint64_t v5 = [v4 UUIDString];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    if (v5)
    {
      id v6 = [(NSMutableDictionary *)self->_watchKeyboardRequests objectForKeyedSubscript:v5];

      if (v6)
      {
        if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
        {
          id v9 = v5;
          LogPrintF();
        }
        watchNotifCenter = self->_watchNotifCenter;
        id v10 = v5;
        id v8 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1, v9);
        [(UNUserNotificationCenter *)watchNotifCenter removeDeliveredNotificationsWithIdentifiers:v8];

        [(NSMutableDictionary *)self->_watchKeyboardRequests removeObjectForKey:v5];
      }
    }
  }
}

- (void)watchKeyboardRemoveAll
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100184768;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_watchKeyboardRemoveAll
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100968BC0 <= 10 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(UNUserNotificationCenter *)self->_watchNotifCenter removeAllDeliveredNotifications];
  watchKeyboardRequests = self->_watchKeyboardRequests;

  [(NSMutableDictionary *)watchKeyboardRequests removeAllObjects];
}

- (void)watchKeyboardUpdate:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001848C8;
  block[3] = &unk_1008CAF18;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_watchKeyboardUpdate:(id)a3 info:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SDNotificationManager *)self riServerContentForDevice:v7 backgroundAction:0];
  id v9 = [v8 mutableCopy];

  id v10 = [v7 identifier];

  BOOL v11 = [v10 UUIDString];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_watchNotifCenter && v10 && v11 && v9)
  {
    id v12 = [(NSMutableDictionary *)self->_watchKeyboardRequests objectForKeyedSubscript:v11];

    if (v12)
    {
      id v13 = [v6 prompt];
      if (v13)
      {
        [v9 setBody:v13];
      }
      else
      {
        Class v14 = SFLocalizedStringForKey();
        [v9 setBody:v14];
      }
      id v15 = [v6 title];
      if (v15)
      {
        [v9 setSubtitle:v15];
      }
      else
      {
        id v16 = SFLocalizedStringForKey();
        [v9 setSubtitle:v16];
      }
      if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
      {
        unsigned int v17 = [v6 prompt];
        [v6 title];
        v21 = id v20 = v17;
        v19 = v11;
        LogPrintF();
      }
      watchNotifCenter = self->_watchNotifCenter;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      void v22[2] = sub_100184B88;
      v22[3] = &unk_1008CA5A8;
      v22[4] = v11;
      -[UNUserNotificationCenter replaceContentForRequestWithIdentifier:replacementContent:completionHandler:](watchNotifCenter, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", v11, v9, v22, v19, v20, v21);
    }
    else if (dword_100968BC0 <= 60 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)watchKeyboardUpdate:(id)a3 rtiData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100184D64;
  block[3] = &unk_1008CAF18;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_watchKeyboardUpdate:(id)a3 rtiData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SDNotificationManager *)self watchKeyboardContentForDevice:v7];
  id v9 = [v8 mutableCopy];

  id v10 = [v7 identifier];

  BOOL v11 = [v10 UUIDString];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v12 = 0;
  int v13 = -6705;
  if (v10 && v11)
  {
    if (v9)
    {
      id v12 = [(NSMutableDictionary *)self->_watchKeyboardRequests objectForKeyedSubscript:v11];

      if (v12)
      {
        id v12 = SFRTIDataPayloadForData();
        if (v12)
        {
          Class v14 = off_100968C80();
          id v15 = [v12 data];
          id v16 = -[objc_class payloadWithData:version:](v14, "payloadWithData:version:", v15, [v12 version]);

          if (v16)
          {
            if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            unsigned int v17 = [v16 documentTraits];
            v18 = [v17 prompt];

            v19 = [v16 documentTraits];
            id v20 = [v19 title];

            if (v18)
            {
              [v9 setBody:v18];
              if (v20)
              {
LABEL_13:
                [v9 setSubtitle:v20];
                goto LABEL_16;
              }
            }
            else
            {
              id v21 = SFLocalizedStringForKey();
              [v9 setBody:v21];

              if (v20) {
                goto LABEL_13;
              }
            }
            uint64_t v22 = SFLocalizedStringForKey();
            [v9 setSubtitle:v22];

LABEL_16:
            if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
            {
              long long v28 = v18;
              unsigned int v29 = v20;
              unsigned int v27 = v11;
              LogPrintF();
            }
            watchNotifCenter = self->_watchNotifCenter;
            v30[0] = _NSConcreteStackBlock;
            v30[1] = 3221225472;
            v30[2] = sub_1001851D0;
            v30[3] = &unk_1008CA5A8;
            v30[4] = v11;
            -[UNUserNotificationCenter replaceContentForRequestWithIdentifier:replacementContent:completionHandler:](watchNotifCenter, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", v11, v9, v30, v27, v28, v29);
LABEL_21:

            goto LABEL_22;
          }
          int v13 = -6733;
        }
        else
        {
          int v13 = -6742;
        }
      }
      else
      {
        int v13 = -6727;
      }
    }
    else
    {
      id v12 = 0;
      int v13 = -6737;
    }
  }
  if (dword_100968BC0 <= 60 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v24 = v13;
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    uint64_t v25 = +[NSString stringWithUTF8String:DebugGetErrorString()];
    id v16 = (void *)v25;
    CFStringRef v26 = @"?";
    if (v25) {
      CFStringRef v26 = (const __CFString *)v25;
    }
    CFStringRef v32 = v26;
    v18 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    id v20 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v24 userInfo:v18];
    LogPrintF();
    goto LABEL_21;
  }
LABEL_22:
}

- (void)_watchHandleResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v5 = (void (**)(void))a4;
  if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v5) {
    v5[2](v5);
  }
}

- (id)homePodHandoffContentForDevice:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v7 notificationType];
  if (v8 == 2)
  {
    id v12 = [v7 body];
    int v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      SFLocalizedStringForKey();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v15 = v14;

    id v16 = [v7 title];
    if (!v16) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (v8 == 3)
  {
    id v9 = [v7 body];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      SFLocalizedStringForKey();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v15 = v11;

    id v16 = [v7 title];
    if (!v16)
    {
LABEL_16:
      SFLocalizedStringForKey();
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_15:
    id v17 = v16;
    id v16 = v17;
LABEL_17:
    v18 = v17;

    v19 = [v7 header];
    id v20 = v19;
    if (v19)
    {
      id v21 = v19;
    }
    else
    {
      SFLocalizedStringForKey();
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v22 = v21;

    unsigned int v23 = +[NSUUID UUID];
    uint64_t v24 = [v23 UUIDString];

    id v25 = objc_alloc_init(off_100968C70());
    [v25 setBody:v15];
    [v25 setCategoryIdentifier:@"HomePodHandoffCategory"];
    if ([v7 homePodType] == (id)2)
    {
      [v25 setCategoryIdentifier:@"60909dfe8f8c461e619cf5ffef54b503"];
      CFStringRef v26 = @"homepodmini.fill";
    }
    else
    {
      CFStringRef v26 = @"homepod.fill";
    }
    unsigned int v27 = +[UNNotificationIcon iconForSystemImageNamed:v26];
    [v25 setIcon:v27];

    [v25 setTitle:v22];
    [v25 setShouldBackgroundDefaultAction:1];
    [v25 setShouldHideTime:1];
    [v25 setShouldHideDate:1];
    [v25 setShouldIgnoreDoNotDisturb:1];
    [v25 setSound:0];
    [v25 setSubtitle:v18];
    v35[0] = @"deviceIdentifier";
    v35[1] = @"sessionID";
    v36[0] = v6;
    v36[1] = v24;
    long long v28 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
    [v25 setUserInfo:v28];

    unsigned int v29 = [v7 attachmentURL];
    id v30 = [(SDNotificationManager *)self attachmentFromURL:v29];

    if (v30)
    {
      long long v34 = v30;
      NSErrorUserInfoKey v31 = +[NSArray arrayWithObjects:&v34 count:1];
      [v25 setAttachments:v31];
    }
    else if (dword_100968BC0 <= 90 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v32 = v25;

    goto LABEL_32;
  }
  if (dword_100968BC0 <= 90 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
  {
    [v7 notificationType];
    LogPrintF();
  }
  id v32 = 0;
LABEL_32:

  return v32;
}

- (void)homePodHandoffPostIfNeeded:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100185890;
  block[3] = &unk_1008CAF18;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_homePodHandoffPostIfNeeded:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned int v8 = [(SDNotificationManager *)self homePodHandoffContentForDevice:v6 info:v7];
  if (v8)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100185990;
    v9[3] = &unk_1008CA770;
    id v10 = v7;
    id v11 = v6;
    id v12 = self;
    id v13 = v8;
    [(SDNotificationManager *)self _homePodEnsureStarted:1 completion:v9];
  }
}

- (void)homePodHandoffRemove:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100185B0C;
  block[3] = &unk_1008CBB30;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_homePodHandoffRemove:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v7 = [(NSMutableDictionary *)self->_homePodRequests objectForKeyedSubscript:v6];

  if (v7)
  {
    if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
    {
      if ((unint64_t)(a4 - 1) > 3) {
        CFStringRef v8 = @"?";
      }
      else {
        CFStringRef v8 = off_1008CF080[a4 - 1];
      }
      id v18 = v6;
      CFStringRef v19 = v8;
      LogPrintF();
    }
    homePodNotifCenter = self->_homePodNotifCenter;
    id v23 = v6;
    id v10 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1, v18, v19);
    [(UNUserNotificationCenter *)homePodNotifCenter removeDeliveredNotificationsWithIdentifiers:v10];

    int64_t v11 = self->_homePodNotifCenter;
    id v22 = v6;
    id v12 = +[NSArray arrayWithObjects:&v22 count:1];
    [(UNUserNotificationCenter *)v11 removePendingNotificationRequestsWithIdentifiers:v12];

    homePodMiniNotificationCenter = self->_homePodMiniNotificationCenter;
    id v21 = v6;
    id v14 = +[NSArray arrayWithObjects:&v21 count:1];
    [(UNUserNotificationCenter *)homePodMiniNotificationCenter removeDeliveredNotificationsWithIdentifiers:v14];

    id v15 = self->_homePodMiniNotificationCenter;
    id v20 = v6;
    id v16 = +[NSArray arrayWithObjects:&v20 count:1];
    [(UNUserNotificationCenter *)v15 removePendingNotificationRequestsWithIdentifiers:v16];

    [(NSMutableDictionary *)self->_homePodRequests removeObjectForKey:v6];
    id v17 = +[SDProxHandoffAgent sharedAgent];
    [v17 notificationDidDismiss:v6 reason:a4];
  }
}

- (void)homePodHandoffRemoveAll
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100185D94;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_homePodHandoffRemoveAll
{
  if (self->_homePodNotifCenter)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    if (dword_100968BC0 <= 10 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(UNUserNotificationCenter *)self->_homePodNotifCenter removeAllDeliveredNotifications];
    [(UNUserNotificationCenter *)self->_homePodMiniNotificationCenter removeAllDeliveredNotifications];
    homePodRequests = self->_homePodRequests;
    [(NSMutableDictionary *)homePodRequests removeAllObjects];
  }
}

- (void)homePodHandoffUpdateIfNeeded:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100185F10;
  block[3] = &unk_1008CAF18;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_homePodHandoffUpdateIfNeeded:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  homePodRequests = self->_homePodRequests;
  if (homePodRequests)
  {
    id v9 = [(NSMutableDictionary *)homePodRequests objectForKeyedSubscript:v6];

    if (v9)
    {
      id v10 = [(SDNotificationManager *)self homePodHandoffContentForDevice:v6 info:v7];
      if (v10)
      {
        int64_t v11 = self->_homePodNotifCenter;
        if ([v7 homePodType] == (id)2)
        {
          id v12 = self->_homePodMiniNotificationCenter;

          int64_t v11 = v12;
        }
        if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_100186170;
        v13[3] = &unk_1008CA5D0;
        id v14 = v6;
        id v15 = v7;
        id v16 = self;
        [(UNUserNotificationCenter *)v11 replaceContentForRequestWithIdentifier:v14 replacementContent:v10 completionHandler:v13];
      }
      else if (dword_100968BC0 <= 90 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else if (dword_100968BC0 <= 90 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_homePodHandleResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1001867B0;
  v34[3] = &unk_1008CCFF0;
  id v7 = a4;
  id v35 = v7;
  CFStringRef v8 = objc_retainBlock(v34);
  if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
  {
    id v32 = v6;
    LogPrintF();
  }
  id v9 = [v6 notification:v32];
  id v10 = [v9 request];
  int64_t v11 = [v10 identifier];

  if (v11)
  {
    id v33 = self;
    id v12 = [v6 actionIdentifier];
    if (!v12)
    {
      if (dword_100968BC0 > 90 || dword_100968BC0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_49;
      }
      goto LABEL_15;
    }
    id v13 = off_100968C60();
    id v14 = v12;
    id v15 = v13;
    id v16 = v15;
    if (v14 == v15)
    {
      unsigned __int8 v17 = 1;
    }
    else if (v15)
    {
      unsigned __int8 v17 = [v14 isEqual:v15];
    }
    else
    {
      unsigned __int8 v17 = 0;
    }

    id v18 = off_100968C68();
    id v19 = v14;
    id v20 = v18;
    id v21 = v20;
    if (v19 == v20)
    {
      unsigned __int8 v22 = 1;
    }
    else
    {
      if (!v20)
      {

        if (v17)
        {
LABEL_26:
          LOBYTE(v23) = 1;
LABEL_36:
          CFStringRef v26 = off_100968C88();
          id v27 = v19;
          id v28 = v26;
          unsigned int v29 = v28;
          if (v27 == v28)
          {
            unsigned int v30 = 1;
          }
          else if (v28)
          {
            unsigned int v30 = [v27 isEqual:v28];
          }
          else
          {
            unsigned int v30 = 0;
          }

          if (v23) {
            goto LABEL_42;
          }
          if (v30) {
            goto LABEL_44;
          }
          if (dword_100968BC0 > 60 || dword_100968BC0 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_49;
          }
LABEL_15:
          LogPrintF();
LABEL_49:

          goto LABEL_50;
        }
        unsigned __int8 v22 = 0;
LABEL_30:
        uint64_t v24 = (__CFString *)v19;
        id v25 = v24;
        if (v24 == @"TRANSFER") {
          unsigned int v23 = 1;
        }
        else {
          unsigned int v23 = [(__CFString *)v24 isEqual:@"TRANSFER"];
        }

        if (v22)
        {
          if (v23)
          {
LABEL_42:
            NSErrorUserInfoKey v31 = +[SDProxHandoffAgent sharedAgent];
            [v31 userDidTapNotification:v11];

            goto LABEL_49;
          }
LABEL_44:
          [(SDNotificationManager *)v33 homePodHandoffRemove:v11 reason:2];
          goto LABEL_49;
        }
        goto LABEL_36;
      }
      unsigned __int8 v22 = [v19 isEqual:v20];
    }

    if (v17)
    {
      if (v22) {
        goto LABEL_42;
      }
      goto LABEL_26;
    }
    goto LABEL_30;
  }
  if (dword_100968BC0 <= 90 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_50:

  ((void (*)(void *))v8[2])(v8);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  homePodNotifCenter = self->_homePodNotifCenter;
  id v12 = (UNUserNotificationCenter *)v8;
  id v13 = homePodNotifCenter;
  if (v13 == v12) {
    goto LABEL_10;
  }
  id v14 = v13;
  if ((v12 == 0) != (v13 != 0))
  {
    unsigned __int8 v15 = [(UNUserNotificationCenter *)v12 isEqual:v13];

    if (v15) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  homePodMiniNotificationCenter = self->_homePodMiniNotificationCenter;
  unsigned __int8 v17 = v12;
  id v18 = homePodMiniNotificationCenter;
  if (v18 == v17)
  {
LABEL_10:

    goto LABEL_11;
  }
  id v19 = v18;
  if ((v12 == 0) == (v18 != 0))
  {

    goto LABEL_14;
  }
  unsigned __int8 v20 = [(UNUserNotificationCenter *)v17 isEqual:v18];

  if (v20)
  {
LABEL_11:
    id v21 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDNotificationManager/didReceiveNotificationResponse/homepod", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v21, &state);
    [(SDNotificationManager *)self _homePodHandleResponse:v9 completion:v10];
    os_activity_scope_leave(&state);

    goto LABEL_12;
  }
LABEL_14:
  tvNotifCenter = self->_tvNotifCenter;
  unsigned int v23 = v17;
  uint64_t v24 = tvNotifCenter;
  if (v24 == v23)
  {

    goto LABEL_19;
  }
  id v25 = v24;
  if ((v12 == 0) == (v24 != 0))
  {

    goto LABEL_21;
  }
  unsigned int v26 = [(UNUserNotificationCenter *)v23 isEqual:v24];

  if (v26)
  {
LABEL_19:
    id v27 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDNotificationManager/didReceiveNotificationResponse/tv", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v27, &state);
    [(SDNotificationManager *)self _tvHandleResponse:v9 completion:v10];
    os_activity_scope_leave(&state);

    goto LABEL_12;
  }
LABEL_21:
  watchNotifCenter = self->_watchNotifCenter;
  unsigned int v29 = v23;
  unsigned int v30 = watchNotifCenter;
  if (v30 == v29)
  {

    goto LABEL_26;
  }
  NSErrorUserInfoKey v31 = v30;
  if ((v12 == 0) != (v30 != 0))
  {
    unsigned int v32 = [(UNUserNotificationCenter *)v29 isEqual:v30];

    if (!v32) {
      goto LABEL_28;
    }
LABEL_26:
    id v33 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDNotificationManager/didReceiveNotificationResponse/watch", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v33, &state);
    [(SDNotificationManager *)self _watchHandleResponse:v9 completion:v10];
    os_activity_scope_leave(&state);

    goto LABEL_12;
  }

LABEL_28:
  if (dword_100968BC0 <= 60)
  {
    if (dword_100968BC0 != -1 || _LogCategory_Initialize())
    {
      long long v38 = v29;
      id v40 = v9;
      LogPrintF();
    }
    if (dword_100968BC0 <= 60 && (dword_100968BC0 != -1 || _LogCategory_Initialize()))
    {
      NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
      uint64_t v34 = +[NSString stringWithUTF8String:DebugGetErrorString()];
      id v35 = (void *)v34;
      CFStringRef v36 = @"?";
      if (v34) {
        CFStringRef v36 = (const __CFString *)v34;
      }
      CFStringRef v43 = v36;
      BOOL v37 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1, v38, v40);
      long long v39 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-6705 userInfo:v37];
      LogPrintF();
    }
  }
  if (v10) {
    v10[2](v10);
  }
LABEL_12:
}

- (void)testPost:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (dword_100968BC0 <= 30)
  {
    if (dword_100968BC0 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v6, v5))
    {
      LogPrintF();
      id v4 = v6;
    }
  }
  if (!self->_activated)
  {
    [(SDNotificationManager *)self _activate];
    id v4 = v6;
  }
  if ([v4 isEqual:@"-af"])
  {
    [(SDNotificationManager *)self testAutofillPost];
  }
  else if ([v6 isEqual:@"-afr"])
  {
    [(SDNotificationManager *)self testAutoFillRemove];
  }
  else if ([v6 isEqual:@"-ho"])
  {
    [(SDNotificationManager *)self testHandoffPost];
  }
  else if ([v6 isEqual:@"-kb"])
  {
    [(SDNotificationManager *)self testKeyboardPost];
  }
  else if ([v6 isEqual:@"-kba"])
  {
    [(SDNotificationManager *)self testKeyboardPostAutoFill];
  }
  else if ([v6 isEqual:@"-kbr"])
  {
    [(SDNotificationManager *)self testKeyboardRemove];
  }
  else if ([v6 isEqual:@"-kbu"])
  {
    [(SDNotificationManager *)self testKeyboardUpdate];
  }
  else if ([v6 isEqual:@"-wkb"])
  {
    [(SDNotificationManager *)self testWatchKeyboard];
  }
  else if ([v6 isEqual:@"-waf"])
  {
    [(SDNotificationManager *)self testWatchKeyboardAutoFill];
  }
  else
  {
    [(SDNotificationManager *)self testPostBasic];
  }
}

- (void)testPostBasic
{
  id v5 = objc_alloc_init(off_100968C70());
  [v5 setBody:@"This is a test user notification"];
  [v5 setCategoryIdentifier:@"continuityRemoteCategory"];
  [v5 setSubtitle:@"Example Subtitle"];
  [v5 setTitle:@"Notification Title"];
  if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = +[NSUUID UUID];
  id v4 = [v3 UUIDString];
  [(SDNotificationManager *)self _addRequestWithID:v4 content:v5 type:5];
}

- (void)testAutofillPost
{
  id v4 = objc_alloc_init((Class)SFDevice);
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  [v4 setIdentifier:v3];

  if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDNotificationManager *)self tvAutoFillPostIfNeeded:v4];
}

- (void)testAutoFillRemove
{
  id v4 = objc_alloc_init((Class)SFDevice);
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  [v4 setIdentifier:v3];

  if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDNotificationManager *)self tvAutoFillRemove:v4];
}

- (void)testHandoffPost
{
  SFDeviceClassCodeGet();
  SFLocalizedStringForKey();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = +[NSString stringWithFormat:@"John Appleseed"];
  id v4 = objc_alloc_init((Class)SFNotificationInfo);
  [v4 setNotificationType:3];
  [v4 setBody:v3];
  id v5 = SFHomePodDisplayNameForDeviceName();
  [v4 setHeader:v5];

  id v6 = SFLocalizedStringForKey();
  [v4 setTitle:v6];

  if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDNotificationManager *)self homePodHandoffPostIfNeeded:@"00000000-0000-0000-0000-000000000000" info:v4];
}

- (void)testKeyboardPost
{
  id v4 = objc_alloc_init((Class)SFDevice);
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  [v4 setIdentifier:v3];

  if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDNotificationManager *)self riServerPostIfNeeded:v4 backgroundAction:0];
}

- (void)testKeyboardPostAutoFill
{
  id v4 = objc_alloc_init((Class)SFDevice);
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  [v4 setIdentifier:v3];

  [v4 setDeviceActionType:19];
  if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDNotificationManager *)self riServerPostIfNeeded:v4 backgroundAction:0];
}

- (void)testKeyboardRemove
{
  id v4 = objc_alloc_init((Class)SFDevice);
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  [v4 setIdentifier:v3];

  if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDNotificationManager *)self riServerRemove:v4];
}

- (void)testKeyboardUpdate
{
  id v5 = objc_alloc_init((Class)SFDevice);
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  [v5 setIdentifier:v3];

  id v4 = objc_alloc_init((Class)SFRemoteTextSessionInfo);
  [v4 setPrompt:@"Updated prompt"];
  [v4 setTitle:@"Updated Title"];
  [(SDNotificationManager *)self riServerUpdate:v5 info:v4];
}

- (void)testWatchKeyboard
{
  id v4 = objc_alloc_init((Class)SFDevice);
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  [v4 setIdentifier:v3];

  if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDNotificationManager *)self watchKeyboardPostIfNeeded:v4];
}

- (void)testWatchKeyboardAutoFill
{
  id v4 = objc_alloc_init((Class)SFDevice);
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  [v4 setIdentifier:v3];

  [v4 setDeviceActionType:19];
  if (dword_100968BC0 <= 30 && (dword_100968BC0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SDNotificationManager *)self watchKeyboardPostIfNeeded:v4];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_watchNotifCenter, 0);
  objc_storeStrong((id *)&self->_watchKeyboardRequests, 0);
  objc_storeStrong((id *)&self->_tvNotifCenter, 0);
  objc_storeStrong((id *)&self->_tvKeyboardRequests, 0);
  objc_storeStrong((id *)&self->_homePodRequests, 0);
  objc_storeStrong((id *)&self->_homePodMiniNotificationCenter, 0);
  objc_storeStrong((id *)&self->_homePodNotifCenter, 0);

  objc_storeStrong((id *)&self->_autoFillRequests, 0);
}

@end