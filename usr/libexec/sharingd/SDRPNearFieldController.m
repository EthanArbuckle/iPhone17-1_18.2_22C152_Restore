@interface SDRPNearFieldController
+ (BOOL)isAvailable;
+ (id)supportedApplicationLabels;
- (BOOL)supportsApplicationLabel:(id)a3;
- (NSString)currentApplicationLabel;
- (OS_dispatch_queue)dispatchQueue;
- (RPNearFieldController)nearFieldController;
- (SDRPNearFieldController)initWithDispatchQueue:(id)a3 delegate:(id)a4;
- (SDRPNearFieldControllerDelegate)delegate;
- (SDRPNearFieldTransaction)currentTransaction;
- (int64_t)currentPreferredPollingType;
- (void)invalidate;
- (void)invalidateTransaction:(id)a3 updatedPkData:(id)a4 bonjourListenerUUID:(id)a5;
- (void)setCurrentApplicationLabel:(id)a3;
- (void)startPolling:(int64_t)a3 applicationLabel:(id)a4 pkData:(id)a5 bonjourListenerUUID:(id)a6;
- (void)stop;
@end

@implementation SDRPNearFieldController

+ (BOOL)isAvailable
{
  return NSClassFromString(@"RPNearFieldController") != 0;
}

+ (id)supportedApplicationLabels
{
  if (qword_10097FE28 != -1) {
    dispatch_once(&qword_10097FE28, &stru_1008CC8C0);
  }
  v2 = (void *)qword_10097FE20;

  return v2;
}

- (BOOL)supportsApplicationLabel:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() supportedApplicationLabels];
  unsigned __int8 v5 = [v4 containsObject:v3];

  return v5;
}

- (SDRPNearFieldController)initWithDispatchQueue:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SDRPNearFieldController;
  v9 = [(SDRPNearFieldController *)&v15 init];
  if (v9)
  {
    v10 = airdrop_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SDRPNearFieldController init", v14, 2u);
    }

    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    v11 = (RPNearFieldController *)[objc_alloc((Class)RPNearFieldController) initWithDispatchQueue:v7 delegate:v8];
    nearFieldController = v9->_nearFieldController;
    v9->_nearFieldController = v11;
  }
  return v9;
}

- (SDRPNearFieldControllerDelegate)delegate
{
  v2 = [(SDRPNearFieldController *)self nearFieldController];
  id v3 = [v2 delegate];

  return (SDRPNearFieldControllerDelegate *)v3;
}

- (int64_t)currentPreferredPollingType
{
  v2 = [(SDRPNearFieldController *)self nearFieldController];
  id v3 = [v2 currentPreferredPollingType];

  return (int64_t)v3;
}

- (NSString)currentApplicationLabel
{
  v2 = [(SDRPNearFieldController *)self nearFieldController];
  id v3 = [v2 currentApplicationLabel];

  return (NSString *)v3;
}

- (SDRPNearFieldTransaction)currentTransaction
{
  v2 = [(SDRPNearFieldController *)self nearFieldController];
  id v3 = [v2 currentTransaction];

  return (SDRPNearFieldTransaction *)v3;
}

- (void)startPolling:(int64_t)a3 applicationLabel:(id)a4 pkData:(id)a5 bonjourListenerUUID:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  v13 = airdrop_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SDRPNearFieldController start", v18, 2u);
  }

  id v14 = objc_alloc((Class)RPNearFieldContext);
  if (objc_opt_respondsToSelector())
  {
    id v15 = v14;
    v16 = +[SDRPNearFieldController supportedApplicationLabels];
    id v17 = [v15 initWithApplicationLabel:v12 supportedApplicationLabels:v16 pkData:v10 bonjourListenerUUID:v11];
  }
  else
  {
    id v17 = [v14 initWithApplicationLabel:v12 pkData:v10 bonjourListenerUUID:v11];
  }
  [(SDRPNearFieldController *)self setCurrentApplicationLabel:v12];

  [(RPNearFieldController *)self->_nearFieldController startPolling:a3 context:v17];
}

- (void)stop
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v3 = airdrop_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SDRPNearFieldController stop", v4, 2u);
  }

  [(RPNearFieldController *)self->_nearFieldController stop];
  [(SDRPNearFieldController *)self setCurrentApplicationLabel:0];
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v3 = airdrop_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SDRPNearFieldController invalidate", v4, 2u);
  }

  [(RPNearFieldController *)self->_nearFieldController invalidate];
  [(SDRPNearFieldController *)self setCurrentApplicationLabel:0];
}

- (void)invalidateTransaction:(id)a3 updatedPkData:(id)a4 bonjourListenerUUID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)RPNearFieldContext);
  if (objc_opt_respondsToSelector())
  {
    id v12 = v11;
    uint64_t v13 = [(SDRPNearFieldController *)self currentApplicationLabel];
    uint64_t v14 = +[SDRPNearFieldController supportedApplicationLabels];
    id v17 = [v12 initWithApplicationLabel:v13 supportedApplicationLabels:v14 pkData:v9 bonjourListenerUUID:v8];

    id v15 = v9;
    id v8 = (id)v14;
    id v9 = (id)v13;
  }
  else
  {
    nearFieldController = self->_nearFieldController;
    id v15 = v11;
    id v12 = [(RPNearFieldController *)nearFieldController currentApplicationLabel];
    id v17 = [v15 initWithApplicationLabel:v12 pkData:v9 bonjourListenerUUID:v8];
  }

  [(RPNearFieldController *)self->_nearFieldController invalidateTransaction:v10 context:v17];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setCurrentApplicationLabel:(id)a3
{
}

- (RPNearFieldController)nearFieldController
{
  return self->_nearFieldController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearFieldController, 0);
  objc_storeStrong((id *)&self->_currentApplicationLabel, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end