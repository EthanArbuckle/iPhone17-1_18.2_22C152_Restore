@interface TransparencyIDSConfigBag
+ (TransparencyIDSConfigBag)sharedInstance;
- (BOOL)ktDisable;
- (IDSServerBag)bag;
- (NSOperationQueue)operationQueue;
- (TransparencyIDSConfigBag)init;
- (id)kbInfoArticleUrl;
- (void)setBag:(id)a3;
- (void)setKtDisable:(BOOL)a3;
- (void)setOperationQueue:(id)a3;
@end

@implementation TransparencyIDSConfigBag

+ (TransparencyIDSConfigBag)sharedInstance
{
  if (qword_10032F318 != -1) {
    dispatch_once(&qword_10032F318, &stru_1002C96B0);
  }
  v2 = (void *)qword_10032F320;

  return (TransparencyIDSConfigBag *)v2;
}

- (TransparencyIDSConfigBag)init
{
  v8.receiver = self;
  v8.super_class = (Class)TransparencyIDSConfigBag;
  v2 = [(TransparencyIDSConfigBag *)&v8 init];
  if (v2)
  {
    v3 = +[IDSServerBag sharedInstance];
    [(TransparencyIDSConfigBag *)v2 setBag:v3];

    v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v4;

    v6 = v2;
  }

  return v2;
}

- (BOOL)ktDisable
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  v3 = [(TransparencyIDSConfigBag *)self bag];
  v4 = [v3 objectForKey:@"kt-min-idv-im"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = _IDSIDProtocolVersionNumber();
    [v5 doubleValue];
    double v7 = v6;
    [v4 doubleValue];
    BOOL v9 = v7 < v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)kbInfoArticleUrl
{
  v2 = [(TransparencyIDSConfigBag *)self bag];
  v3 = [v2 objectForKey:@"kt-disable-info-url"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)setKtDisable:(BOOL)a3
{
  self->ktDisable = a3;
}

- (IDSServerBag)bag
{
  return (IDSServerBag *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBag:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_bag, 0);
}

@end