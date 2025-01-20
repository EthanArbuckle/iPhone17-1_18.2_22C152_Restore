@interface MSDPairedDeviceProxy
- (BOOL)canLockSnapshot;
- (BOOL)canRevertSnapshot;
- (BOOL)canUnenrollWithObliteration:(BOOL)a3;
- (BOOL)canUnlockSnapshot;
- (BOOL)canUpdateContent;
- (BOOL)lockSnapshot;
- (BOOL)paired;
- (BOOL)reachable;
- (BOOL)reboot;
- (BOOL)revertSnapshot;
- (BOOL)unenrollWithObliteration:(BOOL)a3 callUnregister:(BOOL)a4;
- (BOOL)unlockSnapshot;
- (BOOL)updateContentWithDeadline:(int)a3;
- (MSDPairedDeviceProxy)init;
- (NRDevice)device;
- (NRPairedDeviceRegistry)deviceRegistry;
- (NSString)lastSeenDate;
- (NSString)udid;
- (void)bootstrap;
- (void)didUpdateDeviceReachability:(BOOL)a3;
- (void)handleDeviceDidBeginPairingNotification:(id)a3;
- (void)handleDeviceDidBeginUnpairingNotification:(id)a3;
- (void)handleDeviceDidPairNotification:(id)a3;
- (void)handleDeviceDidUnpairNotification:(id)a3;
- (void)savePairedDeviceLastSeenDate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDeviceRegistry:(id)a3;
- (void)setPaired:(BOOL)a3;
- (void)setReachable:(BOOL)a3;
- (void)setUdid:(id)a3;
- (void)updatePairedDeviceInfo;
@end

@implementation MSDPairedDeviceProxy

- (MSDPairedDeviceProxy)init
{
  v17.receiver = self;
  v17.super_class = (Class)MSDPairedDeviceProxy;
  v2 = [(MSDPairedDeviceProxy *)&v17 init];
  if (v2)
  {
    v3 = +[NRPairedDeviceRegistry sharedInstance];
    [(MSDPairedDeviceProxy *)v2 setDeviceRegistry:v3];

    v4 = +[NSNotificationCenter defaultCenter];
    uint64_t v5 = NRPairedDeviceRegistryRemoteUnpairingDidBeginNotification;
    v6 = [(MSDPairedDeviceProxy *)v2 deviceRegistry];
    [v4 addObserver:v2 selector:"handleDeviceDidBeginUnpairingNotification:" name:v5 object:v6];

    v7 = +[NSNotificationCenter defaultCenter];
    uint64_t v8 = NRPairedDeviceRegistryDeviceDidUnpairNotification;
    v9 = [(MSDPairedDeviceProxy *)v2 deviceRegistry];
    [v7 addObserver:v2 selector:"handleDeviceDidUnpairNotification:" name:v8 object:v9];

    v10 = +[NSNotificationCenter defaultCenter];
    uint64_t v11 = NRPairedDeviceRegistryDeviceDidBeginPairingNotification;
    v12 = [(MSDPairedDeviceProxy *)v2 deviceRegistry];
    [v10 addObserver:v2 selector:"handleDeviceDidBeginPairingNotification:" name:v11 object:v12];

    v13 = +[NSNotificationCenter defaultCenter];
    uint64_t v14 = NRPairedDeviceRegistryDeviceDidPairNotification;
    v15 = [(MSDPairedDeviceProxy *)v2 deviceRegistry];
    [v13 addObserver:v2 selector:"handleDeviceDidPairNotification:" name:v14 object:v15];

    [(MSDPairedDeviceProxy *)v2 updatePairedDeviceInfo];
  }
  return v2;
}

- (void)bootstrap
{
  v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = (id)NSClassFromObject();
    id v3 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Bootstrapping %{public}@...", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)canUpdateContent
{
  return 0;
}

- (BOOL)canLockSnapshot
{
  return 0;
}

- (BOOL)canUnlockSnapshot
{
  return 0;
}

- (BOOL)canRevertSnapshot
{
  return 0;
}

- (BOOL)canUnenrollWithObliteration:(BOOL)a3
{
  return 0;
}

- (BOOL)updateContentWithDeadline:(int)a3
{
  return 1;
}

- (BOOL)lockSnapshot
{
  return 1;
}

- (BOOL)unlockSnapshot
{
  return 1;
}

- (BOOL)revertSnapshot
{
  return 1;
}

- (BOOL)reboot
{
  return 1;
}

- (BOOL)unenrollWithObliteration:(BOOL)a3 callUnregister:(BOOL)a4
{
  return 1;
}

- (void)didUpdateDeviceReachability:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = self;
  objc_sync_enter(v4);
  if ([(MSDPairedDeviceProxy *)v4 reachable] != v3)
  {
    id v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109376;
      v8[1] = [(MSDPairedDeviceProxy *)v4 reachable];
      __int16 v9 = 1024;
      BOOL v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Paired device reachability changed to from %{BOOL}d to %{BOOL}d", (uint8_t *)v8, 0xEu);
    }

    if (v3)
    {
      [(MSDPairedDeviceProxy *)v4 savePairedDeviceLastSeenDate:0];
    }
    else
    {
      v6 = +[NSDate now];
      v7 = [v6 toString];
      [(MSDPairedDeviceProxy *)v4 savePairedDeviceLastSeenDate:v7];
    }
    [(MSDPairedDeviceProxy *)v4 setReachable:v3];
  }
  objc_sync_exit(v4);
}

- (void)updatePairedDeviceInfo
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(MSDPairedDeviceProxy *)obj deviceRegistry];
  BOOL v3 = [v2 getActivePairedDevice];
  [(MSDPairedDeviceProxy *)obj setDevice:v3];

  int v4 = [(MSDPairedDeviceProxy *)obj device];

  if (v4)
  {
    [(MSDPairedDeviceProxy *)obj setPaired:1];
    id v5 = [(MSDPairedDeviceProxy *)obj device];
    v6 = [v5 valueForProperty:NRDevicePropertyUDID];
    [(MSDPairedDeviceProxy *)obj setUdid:v6];

    [(MSDPairedDeviceProxy *)obj setReachable:1];
  }
  else
  {
    [(MSDPairedDeviceProxy *)obj setPaired:0];
    [(MSDPairedDeviceProxy *)obj setUdid:0];
    [(MSDPairedDeviceProxy *)obj setReachable:0];
    [(MSDPairedDeviceProxy *)obj savePairedDeviceLastSeenDate:0];
  }
  objc_sync_exit(obj);
}

- (void)handleDeviceDidBeginPairingNotification:(id)a3
{
  BOOL v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[MSDPairedDeviceProxy handleDeviceDidBeginPairingNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s entered!", (uint8_t *)&v5, 0xCu);
  }

  int v4 = +[MSDProgressUpdater sharedInstance];
  [v4 updateStage:30];
}

- (void)handleDeviceDidPairNotification:(id)a3
{
  int v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[MSDPairedDeviceProxy handleDeviceDidPairNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s entered!", (uint8_t *)&v6, 0xCu);
  }

  [(MSDPairedDeviceProxy *)self updatePairedDeviceInfo];
  int v5 = +[MSDMailProcessor sharedInstance];
  [v5 sendImmediateDeviceInfoPing];
}

- (void)handleDeviceDidBeginUnpairingNotification:(id)a3
{
  BOOL v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[MSDPairedDeviceProxy handleDeviceDidBeginUnpairingNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s entered!", (uint8_t *)&v5, 0xCu);
  }

  int v4 = +[MSDProgressUpdater sharedInstance];
  [v4 updateStage:31];
}

- (void)handleDeviceDidUnpairNotification:(id)a3
{
  int v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[MSDPairedDeviceProxy handleDeviceDidUnpairNotification:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s entered!", (uint8_t *)&v7, 0xCu);
  }

  [(MSDPairedDeviceProxy *)self updatePairedDeviceInfo];
  int v5 = +[MSDProgressUpdater sharedInstance];
  [v5 updateStage:100];

  int v6 = +[MSDMailProcessor sharedInstance];
  [v6 sendImmediateDeviceInfoPing];
}

- (NSString)lastSeenDate
{
  v2 = +[MSDPreferencesFile sharedInstance];
  BOOL v3 = [v2 objectForKey:@"PairedDeviceLastSeenDate"];

  return (NSString *)v3;
}

- (void)savePairedDeviceLastSeenDate:(id)a3
{
  id v5 = a3;
  BOOL v3 = +[MSDPreferencesFile sharedInstance];
  int v4 = v3;
  if (v5) {
    [v3 setObject:v5 forKey:@"PairedDeviceLastSeenDate"];
  }
  else {
    [v3 removeObjectForKey:@"PairedDeviceLastSeenDate"];
  }
}

- (BOOL)paired
{
  return self->_paired;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (NSString)udid
{
  return self->_udid;
}

- (void)setUdid:(id)a3
{
  self->_udid = (NSString *)a3;
}

- (NRPairedDeviceRegistry)deviceRegistry
{
  return self->_deviceRegistry;
}

- (void)setDeviceRegistry:(id)a3
{
}

- (NRDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_deviceRegistry, 0);
}

@end