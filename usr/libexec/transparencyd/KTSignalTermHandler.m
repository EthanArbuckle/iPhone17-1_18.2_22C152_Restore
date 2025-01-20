@interface KTSignalTermHandler
+ (BOOL)terminated;
+ (void)reset;
+ (void)setTryExit:(id)a3;
+ (void)setup;
+ (void)signalEventHander;
- (KTSignalTermHandler)initWithSIGTERMNotification:(id)a3;
- (id)complete;
- (void)dealloc;
- (void)setComplete:(id)a3;
- (void)unregister;
@end

@implementation KTSignalTermHandler

+ (void)reset
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10032EEC8);
  source = (id)qword_10032EED0;
  v2 = (void *)qword_10032EED0;
  qword_10032EED0 = 0;

  v3 = (void *)qword_10032EED8;
  qword_10032EED8 = (uint64_t)&stru_1002C4C18;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10032EEC8);
  v4 = source;
  if (source)
  {
    dispatch_source_cancel(source);
    v4 = source;
  }
}

+ (void)setTryExit:(id)a3
{
  if (a3) {
    v3 = (Block_layout *)objc_retainBlock(a3);
  }
  else {
    v3 = &stru_1002C4C18;
  }
  qword_10032EED8 = (uint64_t)v3;

  _objc_release_x1();
}

+ (void)signalEventHander
{
  (*(void (**)(uint64_t, SEL))(qword_10032EED8 + 16))(qword_10032EED8, a2);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10032EEC8);
  id v2 = (id)qword_10032EEE0;
  v3 = (void *)qword_10032EEE0;
  qword_10032EEE0 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10032EEC8);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) complete:v10];
        v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v9[2]();

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

+ (BOOL)terminated
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10032EEC8);
  BOOL v2 = qword_10032EEE0 == 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10032EEC8);
  return v2;
}

+ (void)setup
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10032EEC8);
  if (!qword_10032EED0)
  {
    signal(15, (void (__cdecl *)(int))1);
    if (!qword_10032EED8)
    {
      qword_10032EED8 = (uint64_t)&stru_1002C4C18;
    }
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    id v4 = (void *)qword_10032EEE0;
    qword_10032EEE0 = v3;

    dispatch_queue_t v5 = dispatch_queue_create("KTSignalTermHandler", 0);
    id v6 = (void *)qword_10032EEE8;
    qword_10032EEE8 = (uint64_t)v5;

    dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)qword_10032EEE8);
    v8 = (void *)qword_10032EED0;
    qword_10032EED0 = (uint64_t)v7;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100198CDC;
    handler[3] = &unk_1002C4C38;
    handler[4] = a1;
    dispatch_source_set_event_handler((dispatch_source_t)qword_10032EED0, handler);
    dispatch_activate((dispatch_object_t)qword_10032EED0);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10032EEC8);
}

- (KTSignalTermHandler)initWithSIGTERMNotification:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KTSignalTermHandler;
  dispatch_queue_t v5 = [(KTSignalTermHandler *)&v11 init];
  if (v5)
  {
    [(id)objc_opt_class() setup];
    [(KTSignalTermHandler *)v5 setComplete:v4];
    os_unfair_lock_lock((os_unfair_lock_t)&unk_10032EEC8);
    if (qword_10032EEE0)
    {
      [(id)qword_10032EEE0 addObject:v5];
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_10032EEC8);
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_10032EEC8);
      id v6 = qword_10032EEE8;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100198E74;
      block[3] = &unk_1002BB048;
      id v10 = v4;
      dispatch_async(v6, block);
    }
    dispatch_source_t v7 = v5;
  }

  return v5;
}

- (void)unregister
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10032EEC8);
  [(id)qword_10032EEE0 removeObject:self];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10032EEC8);
}

- (void)dealloc
{
  [(KTSignalTermHandler *)self unregister];
  v3.receiver = self;
  v3.super_class = (Class)KTSignalTermHandler;
  [(KTSignalTermHandler *)&v3 dealloc];
}

- (id)complete
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setComplete:(id)a3
{
}

- (void).cxx_destruct
{
}

@end