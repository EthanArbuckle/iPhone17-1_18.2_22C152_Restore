@interface RPAppleTVDeviceInfoManager
- (BOOL)supportsFindMyRemote;
- (NSString)activeUserAltDSID;
- (RPAppleTVDeviceInfoManager)init;
- (RPAppleTVDeviceInfoManager)initWithQueue:(id)a3;
- (id)deviceInfoChangedHandler;
- (void)setDeviceInfoChangedHandler:(id)a3;
@end

@implementation RPAppleTVDeviceInfoManager

- (RPAppleTVDeviceInfoManager)init
{
  return [(RPAppleTVDeviceInfoManager *)self initWithQueue:&_dispatch_main_q];
}

- (RPAppleTVDeviceInfoManager)initWithQueue:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RPAppleTVDeviceInfoManager;
  return [(RPAppleTVDeviceInfoManager *)&v4 init];
}

- (id)deviceInfoChangedHandler
{
  return self->_deviceInfoChangedHandler;
}

- (void)setDeviceInfoChangedHandler:(id)a3
{
}

- (NSString)activeUserAltDSID
{
  return self->_activeUserAltDSID;
}

- (BOOL)supportsFindMyRemote
{
  return self->_supportsFindMyRemote;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeUserAltDSID, 0);

  objc_storeStrong(&self->_deviceInfoChangedHandler, 0);
}

@end