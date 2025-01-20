@interface CSDBluetoothHangupCommandObserver
- (CSDBluetoothHangupCommandObserver)initWithQueue:(id)a3;
- (void)_ensureStarted;
- (void)_ensureStopped;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)startObservingHangupCommands;
@end

@implementation CSDBluetoothHangupCommandObserver

- (CSDBluetoothHangupCommandObserver)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSDBluetoothHangupCommandObserver;
  v6 = [(CSDBluetoothHangupCommandObserver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)setDelegate:(id)a3
{
}

- (void)startObservingHangupCommands
{
  self->_observationStarted = 1;
  [(CSDBluetoothHangupCommandObserver *)self _ensureStarted];
}

- (void)dealloc
{
  if (self->_observationStarted) {
    sub_1003B26F8();
  }
  v2.receiver = self;
  v2.super_class = (Class)CSDBluetoothHangupCommandObserver;
  [(CSDBluetoothHangupCommandObserver *)&v2 dealloc];
}

- (void)_ensureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_btSession)
  {
    int v3 = 1;
  }
  else
  {
    v4 = self;
    v8 = sub_1001E74D0;
    int v3 = BTSessionAttachWithQueue();
    if (v3) {
      CFRelease(v4);
    }
  }
  if (!self->_btSessionAddedServiceCallback && self->_btSession)
  {
    int v3 = BTServiceAddCallbacksWithFilter();
    self->_btSessionAddedServiceCallback = 1;
    id v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Added BT handsfree callbacks", v7, 2u);
    }
  }
  if (v3)
  {
    v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1003B2724(v3, v6);
    }
  }
}

- (void)_ensureStopped
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_btSessionAddedServiceCallback)
  {
    if (self->_btSession) {
      BTServiceRemoveCallbacks();
    }
    self->_btSessionAddedServiceCallback = 0;
    int v3 = sub_100008DCC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "removed BT handsfree callbacks", buf, 2u);
    }
  }
  if (self->_btSession)
  {
    BTSessionDetachWithQueue();
    self->_btSession = 0;
    v4 = sub_100008DCC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "tore down _btSession", v5, 2u);
    }
  }
  self->_observationStarted = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end