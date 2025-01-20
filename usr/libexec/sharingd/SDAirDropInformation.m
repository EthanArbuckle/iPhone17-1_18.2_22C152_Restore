@interface SDAirDropInformation
- (BOOL)BOOLValue:(void *)a3;
- (SDAirDropInformation)init;
- (SDAirDropInformationDelegate)delegate;
- (void)addObservers;
- (void)dealloc;
- (void)removeObservers;
- (void)setDelegate:(id)a3;
- (void)setInformationAndNotify;
- (void)setProperty:(void *)a3 forKey:(id)a4;
- (void)somethingChanged:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDAirDropInformation

- (SDAirDropInformation)init
{
  v9.receiver = self;
  v9.super_class = (Class)SDAirDropInformation;
  v2 = [(SDAirDropInformation *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_started = 0;
    uint64_t v4 = objc_opt_new();
    properties = v3->_properties;
    v3->_properties = (NSMutableDictionary *)v4;

    uint64_t v6 = +[SDStatusMonitor sharedMonitor];
    monitor = v3->_monitor;
    v3->_monitor = (SDStatusMonitor *)v6;
  }
  return v3;
}

- (void)dealloc
{
  [(SDAirDropInformation *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropInformation;
  [(SDAirDropInformation *)&v3 dealloc];
}

- (BOOL)BOOLValue:(void *)a3
{
  if (!a3) {
    return 0;
  }
  CFTypeID v4 = CFGetTypeID(a3);
  return v4 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)a3) != 0;
}

- (void)setProperty:(void *)a3 forKey:(id)a4
{
  id v6 = a4;
  properties = self->_properties;
  id v9 = v6;
  if (a3) {
    [(NSMutableDictionary *)properties setObject:a3 forKeyedSubscript:v6];
  }
  else {
    [(NSMutableDictionary *)properties removeObjectForKey:v6];
  }
  if ([v9 isEqual:kSFOperationWirelessEnabledKey])
  {
    [(SDStatusMonitor *)self->_monitor setWirelessEnabled:[(SDAirDropInformation *)self BOOLValue:a3]];
  }
  else if ([v9 isEqual:kSFOperationBluetoothEnabledKey])
  {
    [(SDStatusMonitor *)self->_monitor setBluetoothEnabled:[(SDAirDropInformation *)self BOOLValue:a3]];
  }
  else if ([v9 isEqualToString:kSFOperationWirelessAccessPointKey])
  {
    v8 = +[SDHotspotAgent sharedAgent];
    [v8 disableTethering];
  }
  else if ([v9 isEqualToString:kSFOperationAirplaneModeEnabledKey])
  {
    [(SDStatusMonitor *)self->_monitor setAirplaneModeEnabled:[(SDAirDropInformation *)self BOOLValue:a3]];
  }
}

- (void)setInformationAndNotify
{
  [(NSMutableDictionary *)self->_properties removeAllObjects];
  [(NSMutableDictionary *)self->_properties setObject:&__kCFBooleanFalse forKeyedSubscript:kSFOperationLegacyDeviceKey];
  objc_super v3 = +[NSNumber numberWithBool:[(SDStatusMonitor *)self->_monitor wirelessCarPlay]];
  [(NSMutableDictionary *)self->_properties setObject:v3 forKeyedSubscript:kSFOperationWirelessCarPlayKey];

  CFTypeID v4 = +[NSNumber numberWithBool:[(SDStatusMonitor *)self->_monitor wirelessEnabled]];
  [(NSMutableDictionary *)self->_properties setObject:v4 forKeyedSubscript:kSFOperationWirelessEnabledKey];

  v5 = +[NSNumber numberWithBool:[(SDStatusMonitor *)self->_monitor bluetoothEnabledIncludingRestricted]];
  [(NSMutableDictionary *)self->_properties setObject:v5 forKeyedSubscript:kSFOperationBluetoothEnabledKey];

  id v6 = +[NSNumber numberWithBool:[(SDStatusMonitor *)self->_monitor airplaneModeEnabled]];
  [(NSMutableDictionary *)self->_properties setObject:v6 forKeyedSubscript:kSFOperationAirplaneModeEnabledKey];

  v7 = +[NSNumber numberWithUnsignedInteger:[(SDStatusMonitor *)self->_monitor ultraWideBandState]];
  [(NSMutableDictionary *)self->_properties setObject:v7 forKeyedSubscript:kSFOperationUltraWideBandEnabledKey];

  v8 = +[NSNumber numberWithBool:[(SDStatusMonitor *)self->_monitor computerToComputer]];
  [(NSMutableDictionary *)self->_properties setObject:v8 forKeyedSubscript:kSFOperationComputerToComputerKey];

  id v9 = +[NSNumber numberWithBool:[(SDStatusMonitor *)self->_monitor deviceSupportsWAPI]];
  [(NSMutableDictionary *)self->_properties setObject:v9 forKeyedSubscript:kSFOperationDeviceSupportsWAPIKey];

  v10 = +[NSNumber numberWithBool:[(SDStatusMonitor *)self->_monitor wirelessAccessPoint]];
  [(NSMutableDictionary *)self->_properties setObject:v10 forKeyedSubscript:kSFOperationWirelessAccessPointKey];

  v11 = [(SDStatusMonitor *)self->_monitor someComputerName];
  [(NSMutableDictionary *)self->_properties setObject:v11 forKeyedSubscript:kSFOperationReceiverComputerNameKey];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100100CA0;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)somethingChanged:(id)a3
{
}

- (void)addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.UserPictureChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.ComputerNameChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.WirelessModeChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.AirplaneModeChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.WirelessPowerChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.BluetoothPowerChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.HotspotMISStateChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.WirelessCarPlayChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.UltraWideBandStateChanged" object:0];
}

- (void)removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)start
{
  if (!self->_started)
  {
    self->_started = 1;
    [(SDAirDropInformation *)self addObservers];
    [(SDAirDropInformation *)self setInformationAndNotify];
  }
}

- (void)stop
{
  if (self->_started)
  {
    self->_started = 0;
    [(SDAirDropInformation *)self removeObservers];
  }
}

- (SDAirDropInformationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDAirDropInformationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_monitor, 0);
}

@end