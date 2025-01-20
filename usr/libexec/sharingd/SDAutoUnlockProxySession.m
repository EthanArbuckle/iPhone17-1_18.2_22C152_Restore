@interface SDAutoUnlockProxySession
- (BOOL)activeConnection;
- (BOOL)invalidated;
- (BOOL)notified;
- (NSDate)startDate;
- (NSString)model;
- (SDAutoUnlockProxySession)initWithDevice:(id)a3 sessionID:(id)a4 bleDevice:(id)a5;
- (SFBLEDevice)bleDevice;
- (double)connectionTime;
- (double)proxyDiscoveryTime;
- (id)results;
- (int)proxyRSSI;
- (int64_t)state;
- (void)_start;
- (void)addObservers;
- (void)deviceConnected:(id)a3;
- (void)handleFoundBLEDevice:(id)a3;
- (void)invalidate;
- (void)notifyDelegateWithError:(id)a3;
- (void)removeObservers;
- (void)sendProxyTrigger;
- (void)setActiveConnection:(BOOL)a3;
- (void)setBleDevice:(id)a3;
- (void)setConnectionTime:(double)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setNotified:(BOOL)a3;
- (void)setProxyDiscoveryTime:(double)a3;
- (void)setProxyRSSI:(int)a3;
- (void)setStartDate:(id)a3;
- (void)setState:(int64_t)a3;
- (void)start;
@end

@implementation SDAutoUnlockProxySession

- (SDAutoUnlockProxySession)initWithDevice:(id)a3 sessionID:(id)a4 bleDevice:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SDAutoUnlockProxySession;
  v10 = [(SDAutoUnlockPairingSession *)&v13 initWithDevice:a3 sessionID:a4];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_bleDevice, a5);
    [(SDAutoUnlockProxySession *)v11 addObservers];
  }

  return v11;
}

- (void)start
{
  v3 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DA850;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_start
{
  [(SDAutoUnlockProxySession *)self setActiveConnection:1];
  v3 = +[SDNearbyAgent sharedNearbyAgent];
  v4 = [(SDAutoUnlockProxySession *)self bleDevice];
  [v3 startUnlockBLEConnectionWithDevice:v4 encrypted:1];

  [(SDAutoUnlockProxySession *)self setState:1];

  [(SDAutoUnlockProxySession *)self sendProxyTrigger];
}

- (void)invalidate
{
  if (![(SDAutoUnlockProxySession *)self invalidated])
  {
    [(SDAutoUnlockProxySession *)self setInvalidated:1];
    v5.receiver = self;
    v5.super_class = (Class)SDAutoUnlockProxySession;
    [(SDAutoUnlockPairingSession *)&v5 invalidate];
    [(SDAutoUnlockProxySession *)self removeObservers];
    if ([(SDAutoUnlockProxySession *)self activeConnection])
    {
      v3 = +[SDNearbyAgent sharedNearbyAgent];
      v4 = [(SDAutoUnlockProxySession *)self bleDevice];
      [v3 stopUnlockBLEConnectionWithDevice:v4];
    }
  }
}

- (void)addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"deviceConnected:" name:SFBluetoothNotificationNameConnected object:0];
}

- (void)removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (id)results
{
  id v3 = objc_opt_new();
  [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:SDAutoUnlockManagerMetricUsingProxyDeviceKey];
  v4 = [(SDAutoUnlockProxySession *)self model];
  [v3 setObject:v4 forKeyedSubscript:SDAutoUnlockManagerMetricProxyDeviceModelKey];

  if ([(SDAutoUnlockProxySession *)self proxyRSSI])
  {
    objc_super v5 = +[NSNumber numberWithInt:[(SDAutoUnlockProxySession *)self proxyRSSI]];
    [v3 setObject:v5 forKeyedSubscript:SDAutoUnlockManagerMetricProxyDeviceRSSIKey];
  }
  [(SDAutoUnlockProxySession *)self proxyDiscoveryTime];
  if (v6 != 0.0)
  {
    [(SDAutoUnlockProxySession *)self proxyDiscoveryTime];
    v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setObject:v7 forKeyedSubscript:SDAutoUnlockManagerMetricBluetoothProxyDeviceDiscoveryKey];
  }

  return v3;
}

- (void)deviceConnected:(id)a3
{
  id v10 = [a3 userInfo];
  v4 = [v10 objectForKeyedSubscript:SFBluetoothNotificationKeyPeerDevice];
  objc_super v5 = [v4 identifier];
  double v6 = [(SDAutoUnlockProxySession *)self bleDevice];
  v7 = [v6 identifier];
  unsigned int v8 = [v5 isEqual:v7];

  if (v8)
  {
    id v9 = [v10 objectForKeyedSubscript:SFBluetoothNotificationKeyConnectTime];
    [v9 doubleValue];
    -[SDAutoUnlockProxySession setConnectionTime:](self, "setConnectionTime:");

    if ((id)[(SDAutoUnlockProxySession *)self state] == (id)1) {
      [(SDAutoUnlockProxySession *)self setState:2];
    }
  }
}

- (void)handleFoundBLEDevice:(id)a3
{
  id v4 = a3;
  -[SDAutoUnlockProxySession setProxyRSSI:](self, "setProxyRSSI:", [v4 rssi]);
  objc_super v5 = +[NSDate date];
  double v6 = [(SDAutoUnlockProxySession *)self startDate];
  [v5 timeIntervalSinceDate:v6];
  -[SDAutoUnlockProxySession setProxyDiscoveryTime:](self, "setProxyDiscoveryTime:");

  if (sub_1000D2254(v4))
  {
    v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Proxy available for unlock", v13, 2u);
    }

    unsigned int v8 = [(SDAutoUnlockPairingSession *)self delegate];
    [(__CFString *)v8 sessionDidStartConnection:self];
  }
  else
  {
    if (sub_1000D2284(v4))
    {
      SFLocalizedStringForKey();
      unsigned int v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = 135;
    }
    else
    {
      unsigned int v8 = @"Watch Not On Wrist";
      uint64_t v9 = 144;
    }
    uint64_t v10 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    v15 = v8;
    v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v12 = +[NSError errorWithDomain:v10 code:v9 userInfo:v11];
    [(SDAutoUnlockProxySession *)self notifyDelegateWithError:v12];
  }
}

- (void)notifyDelegateWithError:(id)a3
{
  id v7 = a3;
  if (![(SDAutoUnlockProxySession *)self notified])
  {
    id v4 = [(SDAutoUnlockPairingSession *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      double v6 = [(SDAutoUnlockPairingSession *)self delegate];
      [v6 session:self didCompleteWithError:v7];

      [(SDAutoUnlockProxySession *)self setNotified:1];
    }
  }
}

- (void)sendProxyTrigger
{
  id v3 = objc_opt_new();
  [v3 setVersion:1];
  id v4 = auto_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending SDAutoUnlockMessageTypeProxyTrigger", buf, 2u);
  }

  char v5 = [v3 data];
  double v6 = [(SDAutoUnlockPairingSession *)self wrapPayload:v5 withType:307];

  id v7 = +[SDNearbyAgent sharedNearbyAgent];
  unsigned int v8 = [(SDAutoUnlockProxySession *)self bleDevice];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000DB080;
  v9[3] = &unk_1008CA5A8;
  v9[4] = self;
  [v7 sendUnlockData:v6 toBLEDevice:v8 completion:v9];

  [(SDAutoUnlockPairingSession *)self restartResponseTimer:sub_1001B1AF8((double)35)];
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (int)proxyRSSI
{
  return self->_proxyRSSI;
}

- (void)setProxyRSSI:(int)a3
{
  self->_proxyRSSI = a3;
}

- (double)proxyDiscoveryTime
{
  return self->_proxyDiscoveryTime;
}

- (void)setProxyDiscoveryTime:(double)a3
{
  self->_proxyDiscoveryTime = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (SFBLEDevice)bleDevice
{
  return self->_bleDevice;
}

- (void)setBleDevice:(id)a3
{
}

- (double)connectionTime
{
  return self->_connectionTime;
}

- (void)setConnectionTime:(double)a3
{
  self->_connectionTime = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)activeConnection
{
  return self->_activeConnection;
}

- (void)setActiveConnection:(BOOL)a3
{
  self->_activeConnection = a3;
}

- (BOOL)notified
{
  return self->_notified;
}

- (void)setNotified:(BOOL)a3
{
  self->_notified = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bleDevice, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end