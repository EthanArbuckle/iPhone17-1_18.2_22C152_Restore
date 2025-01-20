@interface TransparencyTranscript
- (NSMutableArray)_events;
- (NSString)context;
- (TransparencySettingsProtocol)settings;
- (TransparencyTranscript)initWithContext:(id)a3 settings:(id)a4;
- (id)serialize;
- (void)addEvent:(id)a3;
- (void)setContext:(id)a3;
- (void)setSettings:(id)a3;
- (void)set_events:(id)a3;
- (void)startEvent:(id)a3;
- (void)stopEventWithFailure:(id)a3 error:(id)a4;
- (void)stopEventWithSuccess:(id)a3;
@end

@implementation TransparencyTranscript

- (TransparencyTranscript)initWithContext:(id)a3 settings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TransparencyTranscript;
  v8 = [(TransparencyTranscript *)&v11 init];
  if (v8)
  {
    id v9 = objc_alloc_init((Class)NSMutableArray);
    [(TransparencyTranscript *)v8 set_events:v9];

    [(TransparencyTranscript *)v8 setContext:v6];
    [(TransparencyTranscript *)v8 setSettings:v7];
  }

  return v8;
}

- (void)addEvent:(id)a3
{
  id v12 = a3;
  v4 = [(TransparencyTranscript *)self settings];
  if ([v4 allowsInternalSecurityPolicies])
  {
    v5 = [(TransparencyTranscript *)self settings];
    unsigned int v6 = [v5 getBool:kTransparencyFlagEnableTranscript];

    if (!v6) {
      goto LABEL_7;
    }
    v4 = [(TransparencyTranscript *)self _events];
    objc_sync_enter(v4);
    id v7 = [(TransparencyTranscript *)self _events];
    v8 = [[TransparencyTranscriptEvent alloc] initWithName:v12];
    [v7 insertObject:v8 atIndex:0];

    id v9 = [(TransparencyTranscript *)self _events];
    id v10 = [v9 count];

    if ((unint64_t)v10 >= 0x101)
    {
      objc_super v11 = [(TransparencyTranscript *)self _events];
      [v11 removeLastObject];
    }
    objc_sync_exit(v4);
  }

LABEL_7:
}

- (void)startEvent:(id)a3
{
  id v4 = a3;
  if (qword_10032F428 != -1) {
    dispatch_once(&qword_10032F428, &stru_1002CA7F8);
  }
  v5 = qword_10032F430;
  if (os_log_type_enabled((os_log_t)qword_10032F430, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Event start: %@", buf, 0xCu);
  }
  unsigned int v6 = +[NSString stringWithFormat:@"%@-Start", v4];
  [(TransparencyTranscript *)self addEvent:v6];
}

- (void)stopEventWithSuccess:(id)a3
{
  id v4 = a3;
  if (qword_10032F428 != -1) {
    dispatch_once(&qword_10032F428, &stru_1002CA818);
  }
  v5 = qword_10032F430;
  if (os_log_type_enabled((os_log_t)qword_10032F430, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Event success: %@", buf, 0xCu);
  }
  unsigned int v6 = +[NSString stringWithFormat:@"%@-Stop-Success", v4];
  [(TransparencyTranscript *)self addEvent:v6];
}

- (void)stopEventWithFailure:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  if (qword_10032F428 != -1) {
    dispatch_once(&qword_10032F428, &stru_1002CA838);
  }
  id v8 = qword_10032F430;
  if (os_log_type_enabled((os_log_t)qword_10032F430, OS_LOG_TYPE_ERROR))
  {
    CFStringRef v9 = &stru_1002CE4C0;
    if (v7) {
      CFStringRef v9 = v7;
    }
    *(_DWORD *)buf = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    CFStringRef v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Event failure: %@ %@", buf, 0x16u);
  }
  id v10 = +[NSString stringWithFormat:@"%@-Stop-Failure", v6];
  [(TransparencyTranscript *)self addEvent:v10];
}

- (id)serialize
{
  v3 = [(TransparencyTranscript *)self _events];
  objc_sync_enter(v3);
  id v4 = [(TransparencyTranscript *)self _events];
  v5 = +[NSArray arrayWithArray:v4];

  objc_sync_exit(v3);
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_100216ED8;
  __int16 v13 = &unk_1002CA860;
  id v14 = objc_alloc_init((Class)NSMutableArray);
  id v6 = v14;
  [v5 enumerateObjectsUsingBlock:&v10];
  id v7 = [(TransparencyTranscript *)self context];
  v15 = v7;
  id v16 = v6;
  id v8 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

  return v8;
}

- (NSString)context
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContext:(id)a3
{
}

- (NSMutableArray)_events
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)set_events:(id)a3
{
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->__events, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end