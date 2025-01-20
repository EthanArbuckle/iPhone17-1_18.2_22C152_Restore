@interface WiFiNetworkDenyListManager
- (BOOL)isUserModeInteractive;
- (BOOL)retrieveBatteryInfo:(BOOL *)a3 batteryLevel:(unsigned int *)a4;
- (CWFNetworkDenyList)networkDenyList;
- (NSString)ifName;
- (WiFiNetworkDenyListManager)initWithArgs:(__WiFiDeviceManager *)a3 interfaceName:(id)a4;
- (__WiFiDeviceManager)deviceMgr;
- (void)dealloc;
- (void)denyListDidUpdate;
- (void)setDeviceMgr:(__WiFiDeviceManager *)a3;
- (void)setIfName:(id)a3;
- (void)setNetworkDenyList:(id)a3;
@end

@implementation WiFiNetworkDenyListManager

- (WiFiNetworkDenyListManager)initWithArgs:(__WiFiDeviceManager *)a3 interfaceName:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)WiFiNetworkDenyListManager;
  v6 = [(WiFiNetworkDenyListManager *)&v11 init];
  if (!v6)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s Failed to allocate", "-[WiFiNetworkDenyListManager initWithArgs:interfaceName:]");
    }
    goto LABEL_9;
  }
  id v7 = [objc_alloc((Class)CWFNetworkDenyList) initWithDenyListDeviceProfile:1];
  if (!v7)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4 message:@"%s deviceManager is nil" args:("-[WiFiNetworkDenyListManager initWithArgs:interfaceName:]")];
    }
LABEL_9:

    return 0;
  }
  v8 = v7;
  [(WiFiNetworkDenyListManager *)v6 setDeviceMgr:a3];
  [(WiFiNetworkDenyListManager *)v6 setIfName:a4];
  [v8 setEnabled:1];
  [(WiFiNetworkDenyListManager *)v6 setNetworkDenyList:v8];

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WiFiNetworkDenyListManager;
  [(WiFiNetworkDenyListManager *)&v3 dealloc];
}

- (BOOL)retrieveBatteryInfo:(BOOL *)a3 batteryLevel:(unsigned int *)a4
{
  unsigned __int8 v12 = 0;
  unsigned int v11 = 0;
  if (!a3 || !a4)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4, @"%s Batterylevel:%p. externalPowerSupply:%p", @"-[WiFiNetworkDenyListManager retrieveBatteryInfo:batteryLevel:]", a4, a3];
    }
    goto LABEL_11;
  }
  int v6 = sub_100123EA4((uint64_t)self->_deviceMgr, (uint64_t)&v12, (uint64_t)&v11);
  if (!v6)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:4 message:@"%s Callbacks not available " arguments:@"-[WiFiNetworkDenyListManager retrieveBatteryInfo:batteryLevel:]", v9, v10];
    }
LABEL_11:
    return 0;
  }
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s BatteryInfo. batterylevel:%u. externalPowerSupply:%u", "-[WiFiNetworkDenyListManager retrieveBatteryInfo:batteryLevel:]", v11, v12);
  }
  *a3 = v12 != 0;
  *a4 = v11;
  return 1;
}

- (BOOL)isUserModeInteractive
{
  return sub_100123EE8((uint64_t)self->_deviceMgr);
}

- (void)denyListDidUpdate
{
  sub_1000FF1EC((uint64_t)self->_deviceMgr);
  deviceMgr = self->_deviceMgr;

  sub_10012D6C8((uint64_t)deviceMgr);
}

- (CWFNetworkDenyList)networkDenyList
{
  return (CWFNetworkDenyList *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNetworkDenyList:(id)a3
{
}

- (__WiFiDeviceManager)deviceMgr
{
  return self->_deviceMgr;
}

- (void)setDeviceMgr:(__WiFiDeviceManager *)a3
{
  self->_deviceMgr = a3;
}

- (NSString)ifName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIfName:(id)a3
{
}

@end