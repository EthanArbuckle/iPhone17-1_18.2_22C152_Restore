@interface NSPUserEventAgentFileHandleMaintainer
+ (id)sharedEventAgentMaintainer;
- (BOOL)didInitialLaunch;
- (BOOL)receivedEventToken;
- (NSMutableArray)fileHandleReaderSources;
- (OS_dispatch_source)fileHandleReaderSettingTimer;
- (unint64_t)eventToken;
- (void)cancelFileHandleReaderSources;
- (void)checkDeviceFirstUnlock;
- (void)handleProviderAction:(int64_t)a3 token:(unint64_t)a4 event:(id)a5;
- (void)launchOwner;
- (void)provider;
- (void)setDidInitialLaunch:(BOOL)a3;
- (void)setEventToken:(unint64_t)a3;
- (void)setFileHandleReaderSettingTimer:(id)a3;
- (void)setFileHandleReaderSources:(id)a3;
- (void)setProvider:(void *)a3;
- (void)setReceivedEventToken:(BOOL)a3;
- (void)setupReadabilityHandlers;
- (void)startEventAgentModeWithEventName:(id)a3;
- (void)startFileHandleReader:(id)a3;
- (void)startFileHandleReaderSettingTimer;
- (void)stopFileHandleReaderSettingTimer;
@end

@implementation NSPUserEventAgentFileHandleMaintainer

- (void)checkDeviceFirstUnlock
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7064;
  block[3] = &unk_14930;
  block[4] = self;
  if (qword_17E20 != -1) {
    dispatch_once(&qword_17E20, block);
  }
}

+ (id)sharedEventAgentMaintainer
{
  if (qword_17E30 != -1) {
    dispatch_once(&qword_17E30, &stru_14950);
  }
  v2 = (void *)qword_17E28;

  return v2;
}

- (void)startEventAgentModeWithEventName:(id)a3
{
}

- (void)handleProviderAction:(int64_t)a3 token:(unint64_t)a4 event:(id)a5
{
  id v8 = a5;
  v9 = self;
  objc_sync_enter(v9);
  v10 = nplog_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_BB84(a3, a4, v10);
  }

  if (a3 == 1)
  {
    [(NSPUserEventAgentFileHandleMaintainer *)v9 setEventToken:a4];
    if ((int)xpc_dictionary_get_int64(v8, "PID") >= 1) {
      [(NSPUserEventAgentFileHandleMaintainer *)v9 launchOwner];
    }
    [(NSPUserEventAgentFileHandleMaintainer *)v9 stopFileHandleReaderSettingTimer];
    [(NSPUserEventAgentFileHandleMaintainer *)v9 resetFileHandlesFromEvent:v8];
    [(NSPUserEventAgentFileHandleMaintainer *)v9 cancelFileHandleReaderSources];
    [(NSPUserEventAgentFileHandleMaintainer *)v9 setupReadabilityHandlers];
    [(NSPUserEventAgentFileHandleMaintainer *)v9 checkDeviceFirstUnlock];
    [(NSPUserEventAgentFileHandleMaintainer *)v9 setReceivedEventToken:1];
  }
  objc_sync_exit(v9);
}

- (void)startFileHandleReaderSettingTimer
{
  v3 = [(NSPUserEventAgentFileHandleMaintainer *)self fileHandleReaderSettingTimer];

  if (!v3)
  {
    [(NSPUserEventAgentFileHandleMaintainer *)self provider];
    xpc_event_provider_get_queue();
  }
}

- (void)stopFileHandleReaderSettingTimer
{
  v3 = [(NSPUserEventAgentFileHandleMaintainer *)self fileHandleReaderSettingTimer];

  if (v3)
  {
    v4 = [(NSPUserEventAgentFileHandleMaintainer *)self fileHandleReaderSettingTimer];
    dispatch_source_cancel(v4);

    [(NSPUserEventAgentFileHandleMaintainer *)self setFileHandleReaderSettingTimer:0];
  }
}

- (void)cancelFileHandleReaderSources
{
  v3 = [(NSPUserEventAgentFileHandleMaintainer *)self fileHandleReaderSources];

  if (v3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v4 = [(NSPUserEventAgentFileHandleMaintainer *)self fileHandleReaderSources];
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v10 + 1) + 8 * (void)v8));
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    v9 = [(NSPUserEventAgentFileHandleMaintainer *)self fileHandleReaderSources];
    [v9 removeAllObjects];
  }
}

- (void)startFileHandleReader:(id)a3
{
}

- (void)setupReadabilityHandlers
{
  v2 = self;
  objc_sync_enter(v2);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_7B24;
  v3[3] = &unk_149A0;
  v3[4] = v2;
  [(NSPUserEventAgentFileHandleMaintainer *)v2 iterateFileHandlesWithBlock:v3];
  objc_sync_exit(v2);
}

- (void)launchOwner
{
  obj = self;
  objc_sync_enter(obj);
  if ([(NSPUserEventAgentFileHandleMaintainer *)obj receivedEventToken])
  {
    kdebug_trace();
    [(NSPUserEventAgentFileHandleMaintainer *)obj createEvent];
    objc_claimAutoreleasedReturnValue();
    [(NSPUserEventAgentFileHandleMaintainer *)obj provider];
    [(NSPUserEventAgentFileHandleMaintainer *)obj eventToken];
    xpc_event_provider_token_fire();
  }
  objc_sync_exit(obj);
}

- (BOOL)receivedEventToken
{
  return self->_receivedEventToken;
}

- (void)setReceivedEventToken:(BOOL)a3
{
  self->_receivedEventToken = a3;
}

- (void)provider
{
  return self->_provider;
}

- (void)setProvider:(void *)a3
{
  self->_provider = a3;
}

- (unint64_t)eventToken
{
  return self->_eventToken;
}

- (void)setEventToken:(unint64_t)a3
{
  self->_eventToken = a3;
}

- (BOOL)didInitialLaunch
{
  return self->_didInitialLaunch;
}

- (void)setDidInitialLaunch:(BOOL)a3
{
  self->_didInitialLaunch = a3;
}

- (OS_dispatch_source)fileHandleReaderSettingTimer
{
  return self->_fileHandleReaderSettingTimer;
}

- (void)setFileHandleReaderSettingTimer:(id)a3
{
}

- (NSMutableArray)fileHandleReaderSources
{
  return self->_fileHandleReaderSources;
}

- (void)setFileHandleReaderSources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandleReaderSources, 0);

  objc_storeStrong((id *)&self->_fileHandleReaderSettingTimer, 0);
}

@end