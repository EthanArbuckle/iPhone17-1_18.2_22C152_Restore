@interface TLAlertPairedWatchPlaybackContext
- (NACAlertProxy)alertProxy;
- (TLAlert)alert;
- (TLAlertPairedWatchPlaybackContext)initWithAlert:(id)a3 completionHandler:(id)a4;
- (id)completionHandler;
- (void)setAlertProxy:(id)a3;
@end

@implementation TLAlertPairedWatchPlaybackContext

- (TLAlertPairedWatchPlaybackContext)initWithAlert:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TLAlertPairedWatchPlaybackContext;
  v9 = [(TLAlertPairedWatchPlaybackContext *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_alert, a3);
    uint64_t v11 = [v8 copy];
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = (id)v11;
  }
  return v10;
}

- (TLAlert)alert
{
  return self->_alert;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NACAlertProxy)alertProxy
{
  return self->_alertProxy;
}

- (void)setAlertProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertProxy, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_alert, 0);
}

@end