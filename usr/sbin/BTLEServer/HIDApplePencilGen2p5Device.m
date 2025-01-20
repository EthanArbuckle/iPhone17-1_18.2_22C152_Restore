@interface HIDApplePencilGen2p5Device
+ (BOOL)hasWirelessCharging;
- (HIDApplePencilGen2p5Device)initWithProperties:(id)a3 reports:(id)a4;
- (id)newFwUpgradeDevice:(id)a3 keyholeID:(unsigned __int8)a4;
- (id)newUserDevices:(id)a3;
@end

@implementation HIDApplePencilGen2p5Device

+ (BOOL)hasWirelessCharging
{
  return 0;
}

- (HIDApplePencilGen2p5Device)initWithProperties:(id)a3 reports:(id)a4
{
  return [(HIDApplePencilGen2Device *)self initWithProperties:a3 reports:a4 loggingIdentifier:@"Pencil2.5"];
}

- (id)newUserDevices:(id)a3
{
  id v4 = a3;
  id v5 = [(HIDApplePencilGen2Device *)self newDeviceMgntDevice:v4 keyholeID:0];
  id v6 = [(HIDApplePencilGen2Device *)self newWakeDevice:v4 keyholeID:4];
  id v7 = [(HIDApplePencilGen2p5Device *)self newFwUpgradeDevice:v4 keyholeID:5];
  id v8 = [(HIDApplePencilGen2Device *)self newForceDevice:v4 keyholeID:8];

  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006DCC4();
    }
    goto LABEL_15;
  }
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006F93C();
    }
    goto LABEL_15;
  }
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006F970();
    }
    goto LABEL_15;
  }
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006F9A4();
    }
LABEL_15:
    v12 = 0;
    goto LABEL_6;
  }
  v14[0] = &off_1000B7620;
  v14[1] = &off_1000B7638;
  v15[0] = v5;
  v15[1] = v6;
  v14[2] = &off_1000B7650;
  v14[3] = &off_1000B7668;
  v15[2] = v7;
  v15[3] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
  [(HIDApplePencilGen2Device *)self setUserDevices:v9];

  v10 = [(HIDApplePencilGen2Device *)self userDevices];
  [v10 enumerateKeysAndObjectsUsingBlock:&stru_1000B1938];

  v11 = [(HIDApplePencilGen2Device *)self userDevices];
  v12 = [v11 allValues];

LABEL_6:
  return v12;
}

- (id)newFwUpgradeDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  long long v5 = xmmword_10008A7A8;
  *(_OWORD *)id v6 = unk_10008A7B8;
  *(_DWORD *)&v6[15] = -1073573632;
  return [(HIDApplePencilDevice *)self newUserDevice:a3 descriptor:&v5 descriptorLength:35 keyholeID:a4];
}

@end