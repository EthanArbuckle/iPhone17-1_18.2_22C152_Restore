@interface MZTaskAssertion
+ (id)newBackgroundTaskWithExpirationHandler:(id)a3 debugInfo:(id)a4;
- (MZTaskAssertion)initWithExpirationHandler:(id)a3 debugInfo:(id)a4;
- (id)description;
- (void)dealloc;
- (void)invalidate;
- (void)performExpirationHandler;
@end

@implementation MZTaskAssertion

- (MZTaskAssertion)initWithExpirationHandler:(id)a3 debugInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MZTaskAssertion;
  v8 = [(MZTaskAssertion *)&v20 init];
  if (v8)
  {
    id v9 = [v6 copy];
    id expireHandler = v8->_expireHandler;
    v8->_id expireHandler = v9;

    v11 = (NSString *)[v7 copy];
    debugInfo = v8->_debugInfo;
    v8->_debugInfo = v11;

    v13 = [MZProcessAssertion alloc];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000CF578;
    v18[3] = &unk_10054D570;
    v14 = v8;
    v19 = v14;
    v15 = [(MZProcessAssertion *)v13 initWithExpirationBlock:v18 debugDescription:v8->_debugInfo];
    id v16 = v14[3];
    v14[3] = v15;

    [v14[3] identifier];
  }

  return v8;
}

+ (id)newBackgroundTaskWithExpirationHandler:(id)a3 debugInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[MZTaskAssertion alloc] initWithExpirationHandler:v6 debugInfo:v5];

  return v7;
}

- (void)dealloc
{
  [(MZTaskAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MZTaskAssertion;
  [(MZTaskAssertion *)&v3 dealloc];
}

- (void)performExpirationHandler
{
  objc_super v3 = _MTLogCategoryAsyncTask();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Background time expired. App will sleep soon. Assertion: %@", buf, 0xCu);
  }

  id expireHandler = (void (**)(void))self->_expireHandler;
  if (expireHandler)
  {
    if (self->_processAssertion)
    {
      expireHandler[2]();
      dispatch_time_t v5 = dispatch_time(0, 100000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000CF754;
      block[3] = &unk_10054D570;
      block[4] = self;
      dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)invalidate
{
  processAssertion = self->_processAssertion;
  if (processAssertion)
  {
    [(MZProcessAssertion *)processAssertion identifier];
    [(MZProcessAssertion *)self->_processAssertion invalidate];
    v4 = self->_processAssertion;
    self->_processAssertion = 0;
  }
  id expireHandler = self->_expireHandler;
  self->_id expireHandler = 0;
}

- (id)description
{
  processAssertion = self->_processAssertion;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = (void *)v5;
  CFStringRef v7 = @"YES";
  if (!processAssertion) {
    CFStringRef v7 = @"NO ";
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@:%p; held=%@; info='%@', underlying assertion = %@>",
    v5,
    self,
    v7,
    self->_debugInfo,
  v8 = self->_processAssertion);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_debugInfo, 0);

  objc_storeStrong(&self->_expireHandler, 0);
}

@end