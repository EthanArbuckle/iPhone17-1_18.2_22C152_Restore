@interface NDOPairedDevicesMonitor
- (BOOL)isExecuting;
- (NDOAgent)agent;
- (NDOPairedDevicesMonitor)init;
- (NDOPairedDevicesMonitor)initWithAgent:(id)a3;
- (int)pairNotifyToken;
- (int)unpairNotifyToken;
- (void)_pairedOrActiveWatchesDidChange:(id)a3;
- (void)_updatePairedBTDevicesFollowUp;
- (void)dealloc;
- (void)fetchWarrantyForPairedBluetoothDevices;
- (void)setAgent:(id)a3;
- (void)setIsExecuting:(BOOL)a3;
- (void)setPairNotifyToken:(int)a3;
- (void)setUnpairNotifyToken:(int)a3;
- (void)start;
- (void)updatePairedWatchesFollowUp;
@end

@implementation NDOPairedDevicesMonitor

- (NDOPairedDevicesMonitor)init
{
  v3 = [[NDOAgent alloc] initWithCallingProcessBundleID:@"com.apple.ndoagent.paireddevices"];
  v4 = [(NDOPairedDevicesMonitor *)self initWithAgent:v3];

  return v4;
}

- (NDOPairedDevicesMonitor)initWithAgent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NDOPairedDevicesMonitor;
  v5 = [(NDOPairedDevicesMonitor *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(NDOPairedDevicesMonitor *)v5 setAgent:v4];
    [(NDOPairedDevicesMonitor *)v6 setPairNotifyToken:0];
    [(NDOPairedDevicesMonitor *)v6 setUnpairNotifyToken:0];
    v6->_threadLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)dealloc
{
  if ([(NDOPairedDevicesMonitor *)self pairNotifyToken]) {
    notify_cancel([(NDOPairedDevicesMonitor *)self pairNotifyToken]);
  }
  if ([(NDOPairedDevicesMonitor *)self unpairNotifyToken]) {
    notify_cancel([(NDOPairedDevicesMonitor *)self unpairNotifyToken]);
  }
  v3.receiver = self;
  v3.super_class = (Class)NDOPairedDevicesMonitor;
  [(NDOPairedDevicesMonitor *)&v3 dealloc];
}

- (void)start
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100002264;
  handler[3] = &unk_10001C550;
  handler[4] = self;
  notify_register_dispatch((const char *)[NRPairedDeviceRegistryDeviceDidPairDarwinNotification UTF8String], &self->_pairNotifyToken, (dispatch_queue_t)&_dispatch_main_q, handler);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100002270;
  v3[3] = &unk_10001C550;
  v3[4] = self;
  notify_register_dispatch((const char *)[NRPairedDeviceRegistryDeviceDidUnpairDarwinNotification UTF8String], &self->_unpairNotifyToken, (dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)updatePairedWatchesFollowUp
{
  objc_super v3 = _NDOLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    v5 = "-[NDOPairedDevicesMonitor updatePairedWatchesFollowUp]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: launched with a pairing event", (uint8_t *)&v4, 0xCu);
  }

  [(NDOPairedDevicesMonitor *)self _updatePairedBTDevicesFollowUp];
}

- (void)fetchWarrantyForPairedBluetoothDevices
{
  objc_super v3 = _NDOLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    v6 = "-[NDOPairedDevicesMonitor fetchWarrantyForPairedBluetoothDevices]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: launched with a bluetooth device pairing event", (uint8_t *)&v5, 0xCu);
  }

  [(NDOPairedDevicesMonitor *)self _updatePairedBTDevicesFollowUp];
  int v4 = [(NDOPairedDevicesMonitor *)self agent];
  [v4 getBTPioneerDeviceInfosUsingPolicy:2 updateFollowUps:0 withReply:&stru_10001C590];
}

- (void)_pairedOrActiveWatchesDidChange:(id)a3
{
  int v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[NDOPairedDevicesMonitor _pairedOrActiveWatchesDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(NDOPairedDevicesMonitor *)self _updatePairedBTDevicesFollowUp];
}

- (void)_updatePairedBTDevicesFollowUp
{
  if ([(NDOPairedDevicesMonitor *)self isExecuting])
  {
    objc_super v3 = _NDOLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Already executing with a pairing event", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    os_unfair_lock_lock(&self->_threadLock);
    [(NDOPairedDevicesMonitor *)self setIsExecuting:1];
    os_unfair_lock_unlock(&self->_threadLock);
    objc_initWeak(buf, self);
    int v4 = [(NDOPairedDevicesMonitor *)self agent];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000026C0;
    v5[3] = &unk_10001C5B8;
    v5[4] = self;
    objc_copyWeak(&v6, buf);
    [v4 getAllFUPEligibleDeviceInfosUsingPolicy:2 updateFollowUps:1 withReply:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

- (NDOAgent)agent
{
  return (NDOAgent *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAgent:(id)a3
{
}

- (int)pairNotifyToken
{
  return self->_pairNotifyToken;
}

- (void)setPairNotifyToken:(int)a3
{
  self->_pairNotifyToken = a3;
}

- (int)unpairNotifyToken
{
  return self->_unpairNotifyToken;
}

- (void)setUnpairNotifyToken:(int)a3
{
  self->_unpairNotifyToken = a3;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (void)setIsExecuting:(BOOL)a3
{
  self->_isExecuting = a3;
}

- (void).cxx_destruct
{
}

@end