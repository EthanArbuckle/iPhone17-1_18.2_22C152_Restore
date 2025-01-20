@interface CHPKSettingsServer
+ (id)sharedSettingsServer;
+ (void)initialize;
+ (void)setupDefaults;
- (BOOL)getGlobalAutoRefineEnabled;
- (BOOL)isListening;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CHPKSettingsServer)init;
- (NSDate)queuedTimestampDate;
- (NSXPCListener)listener;
- (void)_enqueueTimestampUpdate;
- (void)_touchLastSessionTimestampIfNecessary;
- (void)dealloc;
- (void)getGlobalPrefersPencilHoverPreviewEnabledWithCompletion:(id)a3;
- (void)openPencilSettings;
- (void)resumeConnectionIfIdle;
- (void)sessionDidBegin;
- (void)sessionDidEnd;
- (void)setCurrentScribbleLanguageIdentifier:(id)a3;
- (void)setCurrentScribbleLanguageIdentifiers:(id)a3;
- (void)setGlobalAutoRefineEnabled:(BOOL)a3;
- (void)setGlobalAutoRefineEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)setGlobalPrefersPencilHoverPreviewEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)setGlobalPrefersPencilOnlyDrawing:(BOOL)a3;
- (void)setIsListening:(BOOL)a3;
- (void)setListener:(id)a3;
- (void)setQueuedTimestampDate:(id)a3;
@end

@implementation CHPKSettingsServer

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CHPKSettingsServer;
  [(CHPKSettingsServer *)&v3 dealloc];
}

+ (void)initialize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CHPKSettingsServer;
  [super initialize];
  if ((id)objc_opt_class() == a1) {
    +[CHPKSettingsServer setupDefaults];
  }
}

+ (void)setupDefaults
{
  if (qword_10002B098 != -1) {
    dispatch_once(&qword_10002B098, &stru_100024758);
  }
}

+ (id)sharedSettingsServer
{
  if (qword_10002B0A8 == -1)
  {
    v2 = (void *)qword_10002B0A0;
  }
  else
  {
    dispatch_once(&qword_10002B0A8, &stru_100024778);
    v2 = (void *)qword_10002B0A0;
  }
  return v2;
}

- (CHPKSettingsServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)CHPKSettingsServer;
  v2 = [(CHPKSettingsServer *)&v10 init];
  if (v2)
  {
    objc_super v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.handwritingd.CHPKSettings", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.handwritingd.pksettings"];
    listener = v2->_listener;
    v2->_listener = v7;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    v2->_isListening = 0;
  }
  return v2;
}

- (void)resumeConnectionIfIdle
{
  if (![(CHPKSettingsServer *)self isListening])
  {
    objc_super v3 = [(CHPKSettingsServer *)self listener];
    [v3 resume];

    [(CHPKSettingsServer *)self setIsListening:1];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  listener = self->_listener;
  if (listener == a3)
  {
    v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CHPKRemoteSettingsProtocol];
    [v6 setExportedInterface:v8];
  }
  [v6 setExportedObject:self];
  [v6 resume];

  return listener == a3;
}

- (void)setGlobalPrefersPencilOnlyDrawing:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.UIKit"];
  [v4 setBool:v3 forKey:@"UIPencilOnlyDrawWithPencilKey"];
  [v4 synchronize];
}

- (void)openPencilSettings
{
  v2 = +[NSURL URLWithString:@"prefs:root=Pencil"];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  BOOL v3 = (void *)qword_10002B0B0;
  uint64_t v11 = qword_10002B0B0;
  if (!qword_10002B0B0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100003838;
    v7[3] = &unk_1000247F0;
    v7[4] = &v8;
    sub_100003838((uint64_t)v7);
    BOOL v3 = (void *)v9[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  dispatch_queue_t v5 = [v4 defaultWorkspace];
  v12[0] = @"__UnlockDevice";
  v12[1] = @"__PromptUnlockDevice";
  v13[0] = &__kCFBooleanTrue;
  v13[1] = &__kCFBooleanTrue;
  id v6 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v5 openSensitiveURL:v2 withOptions:v6];
}

- (void)setCurrentScribbleLanguageIdentifier:(id)a3
{
  id v8 = a3;
  BOOL v3 = +[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:");
  if (+[CHRecognitionSession isLocaleSupported:v3])
  {
    id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.PencilKit"];
    [v4 setObject:v8 forKey:@"CurrentScribbleLanguageKey"];
    dispatch_queue_t v5 = +[NSDate date];
    [v5 timeIntervalSinceReferenceDate];
    id v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v4 setObject:v6 forKey:@"ScribbleLanguageTimestampKey"];

    [v4 synchronize];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.PencilKit", 0, 0, 1u);
  }
}

- (void)setCurrentScribbleLanguageIdentifiers:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
LABEL_4:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(id *)(*((void *)&v17 + 1) + 8 * v9);
      uint64_t v11 = +[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", v10, (void)v17);
      if ([v10 length])
      {
        if (+[CHRecognitionSession isLocaleSupported:v11])
        {
          if ((unint64_t)[v10 length] >= 0x10)
          {
            uint64_t v12 = [v10 substringWithRange:0, 15];

            id v10 = (id)v12;
          }
          [v4 addObject:v10];
          if ((unint64_t)[v4 count] >= 0xA) {
            break;
          }
        }
      }

      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (!v7) {
          goto LABEL_14;
        }
        goto LABEL_4;
      }
    }
  }
LABEL_14:

  id v13 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.PencilKit"];
  [v13 setObject:v4 forKey:@"CurrentScribbleLanguages"];
  v14 = +[NSDate date];
  [v14 timeIntervalSinceReferenceDate];
  v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v13 setObject:v15 forKey:@"ScribbleLanguageTimestampKey"];

  [v13 synchronize];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.PencilKit", 0, 0, 1u);
}

- (void)getGlobalPrefersPencilHoverPreviewEnabledWithCompletion:(id)a3
{
  id v6 = a3;
  id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.UIKit"];
  id v4 = [v3 BOOLForKey:@"PKUIPencilHoverPreviewEnabledKey"];

  id v5 = v6;
  if (v6)
  {
    (*((void (**)(id, id))v6 + 2))(v6, v4);
    id v5 = v6;
  }
}

- (void)setGlobalPrefersPencilHoverPreviewEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.UIKit"];
  [v5 setBool:v4 forKey:@"PKUIPencilHoverPreviewEnabledKey"];
  [v5 setValue:&__kCFBooleanTrue forKey:@"PKHasUserChangedHoverPreviewEnabledSettingKey"];
  if (v6) {
    v6[2]();
  }
}

- (void)setGlobalAutoRefineEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.UIKit"];
  [v4 setBool:v3 forKey:@"UIAutoRefineEnabledKey"];
  [v4 synchronize];
}

- (BOOL)getGlobalAutoRefineEnabled
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.UIKit"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"UIAutoRefineEnabledKey"];

  return v3;
}

- (void)setGlobalAutoRefineEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.UIKit"];
  [v5 setBool:v4 forKey:@"UIAutoRefineEnabledKey"];
  [v5 synchronize];
  if (v6) {
    v6[2]();
  }
}

- (void)sessionDidBegin
{
}

- (void)sessionDidEnd
{
}

- (void)_enqueueTimestampUpdate
{
  objc_initWeak(&location, self);
  unsigned __int8 v3 = +[NSDate date];
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003514;
  v6[3] = &unk_1000247C8;
  objc_copyWeak(&v9, &location);
  id v7 = v3;
  uint64_t v8 = self;
  id v5 = v3;
  dispatch_sync((dispatch_queue_t)queue, v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_touchLastSessionTimestampIfNecessary
{
  id v2 = [(CHPKSettingsServer *)self queuedTimestampDate];
  unsigned __int8 v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[NSDate date];
  }
  id v12 = v4;

  id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.PencilKit"];
  id v6 = [v5 objectForKey:@"ScribbleLanguageTimestampKey"];
  id v7 = [v6 copy];

  if (!v7)
  {
    id v10 = 0;
LABEL_9:
    [v12 timeIntervalSinceReferenceDate];
    uint64_t v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v5 setObject:v11 forKey:@"ScribbleLanguageTimestampKey"];

    [v5 synchronize];
    goto LABEL_10;
  }
  [v7 doubleValue];
  uint64_t v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  id v9 = +[NSCalendar currentCalendar];
  id v10 = [v9 dateByAddingUnit:64 value:30 toDate:v8 options:0];

  if (!v10 || [v12 compare:v10] == (id)-1) {
    goto LABEL_9;
  }
LABEL_10:
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (NSDate)queuedTimestampDate
{
  return self->_queuedTimestampDate;
}

- (void)setQueuedTimestampDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedTimestampDate, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end