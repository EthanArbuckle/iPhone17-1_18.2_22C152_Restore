@interface JSAFoundation
- (JSAFoundation)init;
- (NSMutableDictionary)jsTimers;
- (OS_dispatch_queue)queue;
- (id)setInterval:(id)a3 timeInMS:(double)a4;
- (id)setTimeout:(id)a3 timeInMS:(double)a4;
- (void)_jsTimerFired:(id)a3;
- (void)clearInterval:(id)a3;
- (void)clearTimeout:(id)a3;
- (void)setJsTimers:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation JSAFoundation

- (JSAFoundation)init
{
  v10.receiver = self;
  v10.super_class = (Class)JSAFoundation;
  v2 = [(JSAFoundation *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    jsTimers = v2->_jsTimers;
    v2->_jsTimers = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.iBooks.JSAFoundation", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (id)setInterval:(id)a3 timeInMS:(double)a4
{
  return sub_108A8((uint64_t)self, a3, 1, a4);
}

- (void)clearInterval:(id)a3
{
}

- (id)setTimeout:(id)a3 timeInMS:(double)a4
{
  return sub_108A8((uint64_t)self, a3, 0, a4);
}

- (void)clearTimeout:(id)a3
{
}

- (void)_jsTimerFired:(id)a3
{
  id v4 = a3;
  v5 = +[NSString stringWithFormat:@"%p", v4];
  v6 = self->_jsTimers;
  objc_sync_enter(v6);
  dispatch_queue_t v7 = [(NSMutableDictionary *)self->_jsTimers objectForKey:v5];
  v8 = v7;
  if (v7 && ([v7 isRepeating] & 1) == 0) {
    [(NSMutableDictionary *)self->_jsTimers removeObjectForKey:v5];
  }
  objc_sync_exit(v6);

  v9 = JSALog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Timer fired: %@: %@", buf, 0x16u);
  }

  if (v8)
  {
    objc_super v10 = +[JSABridge sharedInstance];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_110BC;
    v11[3] = &unk_B2738;
    id v12 = v8;
    [v10 enqueueBlock:v11 file:@"JSAFoundation.m" line:186];
  }
}

- (NSMutableDictionary)jsTimers
{
  return self->_jsTimers;
}

- (void)setJsTimers:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_jsTimers, 0);
}

@end