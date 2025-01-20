@interface MXMOSLogProbe
+ (MXMOSLogProbe)probeHostOSLog;
+ (MXMProbeableDevice)hostDevice;
+ (NSArray)connectedDevices;
- (BOOL)activityStream:(id)a3 results:(id)a4;
- (MXMOSLogProbe)initWithTargetDevice:(id)a3;
- (void)_beginUpdates;
- (void)_stopUpdates;
@end

@implementation MXMOSLogProbe

+ (MXMProbeableDevice)hostDevice
{
  v2 = +[MXMOSLogDeviceStore_Internal shared];
  v3 = [v2 hostDevice];

  return (MXMProbeableDevice *)v3;
}

+ (NSArray)connectedDevices
{
  v2 = +[MXMOSLogDeviceStore_Internal shared];
  v3 = [v2 devices];
  v4 = [v3 allValues];

  return (NSArray *)v4;
}

+ (MXMOSLogProbe)probeHostOSLog
{
  id v3 = objc_alloc((Class)a1);
  v4 = [a1 hostDevice];
  v5 = (void *)[v3 initWithTargetDevice:v4];

  return (MXMOSLogProbe *)v5;
}

- (MXMOSLogProbe)initWithTargetDevice:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXMOSLogProbe;
  v5 = [(MXMProbe *)&v11 init];
  if (v5)
  {
    v6 = (OSActivityStream *)objc_alloc_init(MEMORY[0x263F52728]);
    activityStream = v5->_activityStream;
    v5->_activityStream = v6;

    [(OSActivityStream *)v5->_activityStream setDelegate:v5];
    v8 = [(id)objc_opt_class() hostDevice];
    if ([v4 isEqual:v8]) {
      goto LABEL_6;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    v9 = [v4 rawDevice];

    if (v9)
    {
      v8 = [v4 rawDevice];
      [(OSActivityStream *)v5->_activityStream setDevice:v8];
LABEL_6:
    }
  }

  return v5;
}

- (void)_beginUpdates
{
}

- (void)_stopUpdates
{
  v3.receiver = self;
  v3.super_class = (Class)MXMOSLogProbe;
  [(MXMProbe *)&v3 _stopUpdates];
  [(OSActivityStream *)self->_activityStream stop];
}

- (BOOL)activityStream:(id)a3 results:(id)a4
{
  return 1;
}

- (void).cxx_destruct
{
}

@end