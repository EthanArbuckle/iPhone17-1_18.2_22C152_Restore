@interface TIKeyboardInputManagerServer
+ (id)sharedKeyboardInputManagerServer;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (TIKeyboardInputManagerServer)init;
- (id)reduceCacheToSize:(int)a3;
- (void)appleKeyboardsSettingsChanged:(id)a3;
- (void)checkAndFlushDynamicCaches;
- (void)dealloc;
- (void)handleMemoryPressureLevel:(unint64_t)a3 excessMemoryInBytes:(unint64_t)a4;
- (void)keyboardActivityDidTransition:(id)a3;
- (void)prepareForActivity;
- (void)prepareForInactivity;
@end

@implementation TIKeyboardInputManagerServer

- (void)keyboardActivityDidTransition:(id)a3
{
  id v4 = a3;
  if ([v4 toState] == (id)3)
  {
    [(TIKeyboardInputManagerServer *)self prepareForInactivity];
  }
  else if ([v4 fromState] == (id)3)
  {
    [(TIKeyboardInputManagerServer *)self prepareForActivity];
  }
}

- (void)prepareForActivity
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "-[TIKeyboardInputManagerServer prepareForActivity]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s  Preparing keyboard for activity", (uint8_t *)&v3, 0xCu);
  }
  +[TILanguageModelLoaderManager wireAllLanguageModelMemory];
  v2 = +[TIKeyboardInputManagerLoader sharedLoader];
  [v2 prepareForKeyboardActivity];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[TIKeyboardInputManagerServer listener:shouldAcceptNewConnection:]";
    __int16 v17 = 1024;
    unsigned int v18 = [v4 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s  Establishing connection with PID %d", buf, 0x12u);
  }
  v5 = objc_opt_new();
  v6 = +[TIKBDClientProxy KBDClientProxyWithConnection:v4];
  [v5 setClientProxy:v6];

  [v4 setExportedObject:v5];
  v7 = +[TIKeyboardInputManagerStub serverInterface];
  [v4 setExportedInterface:v7];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004C00;
  v13[3] = &unk_10001CA18;
  id v14 = v4;
  id v8 = v4;
  [v8 setInvalidationHandler:v13];
  v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TIKeyboardInputManagerToImplProtocol];
  [v8 setRemoteObjectInterface:v9];

  v10 = +[TIKeyboardInputManagerLoader sharedLoader];
  [v10 startSyncHelper];

  v11 = +[TIKeyboardInputManagerLoader sharedLoader];
  [v11 setInteractingConnection:v8];

  [v8 _setQueue:&_dispatch_main_q];
  [v8 resume];

  return 1;
}

+ (id)sharedKeyboardInputManagerServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A2AC;
  block[3] = &unk_10001C7E8;
  block[4] = a1;
  if (qword_100026E28 != -1) {
    dispatch_once(&qword_100026E28, block);
  }
  v2 = (void *)qword_100026E20;
  return v2;
}

- (void)dealloc
{
  int v3 = +[TIKeyboardActivityController sharedController];
  [v3 removeActivityObserver:self];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerServer;
  [(TIKeyboardInputManagerServer *)&v5 dealloc];
}

- (TIKeyboardInputManagerServer)init
{
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardInputManagerServer;
  v2 = [(TIKeyboardInputManagerServer *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[NSDate date];
    lastFlush = v2->_lastFlush;
    v2->_lastFlush = (NSDate *)v3;

    objc_super v5 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.TextInput"];
    listener = v2->_listener;
    v2->_listener = v5;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener _setQueue:&_dispatch_main_q];
    [(NSXPCListener *)v2->_listener resume];
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"appleKeyboardsSettingsChanged:" name:@"AppleKeyboardsContinuousPathSettingsChangedNotification" object:0];

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"appleKeyboardsSettingsChanged:" name:TIAppleKeyboardsPreferencesChangedNotification_Private object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"appleKeyboardsSettingsChanged:" name:@"AppleKeyboardsInternalSettingsChangedNotification" object:0];

    v10 = +[TIKeyboardActivityController sharedController];
    [v10 addActivityObserver:v2];
  }
  return v2;
}

- (void)appleKeyboardsSettingsChanged:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    objc_super v5 = "-[TIKeyboardInputManagerServer appleKeyboardsSettingsChanged:]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s  Keyboard settings changed. Releasing input managers.", (uint8_t *)&v4, 0xCu);
  }
  uint64_t v3 = +[TIKeyboardInputManagerLoader sharedLoader];
  [v3 releaseAllInputManagers];
}

- (id)reduceCacheToSize:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[TIKeyboardInputManagerServer reduceCacheToSize:]";
    __int16 v9 = 2048;
    uint64_t v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s  Reduce cache to size=%lu", (uint8_t *)&v7, 0x16u);
  }
  int v4 = +[TIKeyboardInputManagerLoader sharedLoader];
  [v4 reduceInputManagerCacheToSize:v3 switchingToInputMode:0];
  objc_super v5 = [v4 currentLoadedInputModes];
  +[TILanguageModelLoaderManager dropResourcesExcludingInputModes:v5];

  return v5;
}

- (void)handleMemoryPressureLevel:(unint64_t)a3 excessMemoryInBytes:(unint64_t)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[TIKeyboardInputManagerServer handleMemoryPressureLevel:excessMemoryInBytes:]";
    __int16 v9 = 2048;
    unint64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s  Received memory pressure level %ld", (uint8_t *)&v7, 0x16u);
  }
  if (a3 - 1 > 2)
  {
    v6 = 0;
  }
  else
  {
    v6 = [(TIKeyboardInputManagerServer *)self reduceCacheToSize:dword_100015638[a3 - 1]];
  }
  +[TILanguageModelLoaderManager flushDynamicResourcesForInputModes:v6];
}

- (void)prepareForInactivity
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[TIKeyboardInputManagerServer prepareForInactivity]";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s  Preparing keyboard for inactivity", (uint8_t *)&v5, 0xCu);
  }
  id v3 = [(TIKeyboardInputManagerServer *)self reduceCacheToSize:2];
  int v4 = +[TIKeyboardInputManagerLoader sharedLoader];
  [v4 prepareForKeyboardInactivity];
  [(TIKeyboardInputManagerServer *)self checkAndFlushDynamicCaches];
}

- (void)checkAndFlushDynamicCaches
{
  id v3 = +[NSDate date];
  [v3 timeIntervalSinceDate:self->_lastFlush];
  double v5 = v4;

  v6 = +[TIPreferencesController sharedPreferencesController];
  int v7 = [v6 valueForPreferenceKey:TIKeyboardFlushDynamicCachePeriodPreference];

  double v8 = 10800.0;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      double v8 = v9;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    v13 = "-[TIKeyboardInputManagerServer checkAndFlushDynamicCaches]";
    __int16 v14 = 2048;
    double v15 = v5;
    __int16 v16 = 2048;
    double v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s  Preparing keyboard for inactivity, last flush at %lf, flush period: %lf", (uint8_t *)&v12, 0x20u);
  }
  if (v5 > v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "-[TIKeyboardInputManagerServer checkAndFlushDynamicCaches]";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s  Flushing the dynamic resources on inactivity", (uint8_t *)&v12, 0xCu);
    }
    +[TILanguageModelLoaderManager flushDynamicLearningCaches];
    unint64_t v10 = +[NSDate date];
    lastFlush = self->_lastFlush;
    self->_lastFlush = v10;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFlush, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end