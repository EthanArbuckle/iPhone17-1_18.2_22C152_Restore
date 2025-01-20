@interface SAActivity
+ (id)newWithActivity:(id)a3 andCompletionHandler:(id)a4;
- (BOOL)deferActivity;
- (BOOL)shouldDefer;
- (BOOL)shouldStop;
- (NSBackgroundActivityScheduler)activity;
- (SAActivity)initWithActivity:(id)a3 completionHandler:(id)a4;
- (id)completionHandler;
- (void)setActivity:(id)a3;
- (void)setActivityResult:(int64_t)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDeferActivity:(BOOL)a3;
- (void)setShouldStop:(BOOL)a3;
@end

@implementation SAActivity

- (SAActivity)initWithActivity:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SAActivity;
  v9 = [(SAActivity *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activity, a3);
    id v11 = objc_retainBlock(v8);
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = v11;

    *(_WORD *)&v10->_shouldStop = 0;
  }

  return v10;
}

+ (id)newWithActivity:(id)a3 andCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithActivity:v7 completionHandler:v6];

  return v8;
}

- (void)setActivityResult:(int64_t)a3
{
  id completionHandler = (void (**)(id, int64_t))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, a3);
  }
}

- (BOOL)shouldDefer
{
  v2 = self;
  objc_sync_enter(v2);
  activity = v2->_activity;
  if (activity) {
    unsigned __int8 deferActivity = [(NSBackgroundActivityScheduler *)activity shouldDefer];
  }
  else {
    unsigned __int8 deferActivity = v2->_deferActivity;
  }
  objc_sync_exit(v2);

  return deferActivity;
}

- (BOOL)shouldStop
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL shouldStop = v2->_shouldStop;
  objc_sync_exit(v2);

  return shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL shouldStop = a3;
  objc_sync_exit(obj);
}

- (BOOL)deferActivity
{
  return self->_deferActivity;
}

- (void)setDeferActivity:(BOOL)a3
{
  self->_unsigned __int8 deferActivity = a3;
}

- (NSBackgroundActivityScheduler)activity
{
  return (NSBackgroundActivityScheduler *)objc_getProperty(self, a2, 16, 1);
}

- (void)setActivity:(id)a3
{
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end