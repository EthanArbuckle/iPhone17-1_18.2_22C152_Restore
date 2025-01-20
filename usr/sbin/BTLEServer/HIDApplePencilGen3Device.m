@interface HIDApplePencilGen3Device
+ (BOOL)hasWirelessCharging;
+ (unint64_t)btClockMask;
- (HIDApplePencilGen3Device)initWithProperties:(id)a3 reports:(id)a4;
- (float)preferredInterval;
- (id)desiredConnectionParameters;
- (id)newHapticsDevice:(id)a3 keyholeID:(unsigned __int8)a4;
- (id)newMotionDevice:(id)a3 keyholeID:(unsigned __int8)a4;
- (id)newUserDevices:(id)a3;
- (int)latency;
- (int)sendOutputReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5;
- (void)authCompleted:(BOOL)a3;
- (void)chargerStateChanged:(unsigned __int8)a3;
- (void)checkAndLogHostInputReportCollision:(unsigned __int8)a3 reportID:(unsigned __int8)a4;
- (void)notifyDownstreamOnChargerState:(BOOL)a3;
- (void)pairingInfoCompleted;
- (void)setChargingConnParamDefaults;
- (void)setLatency:(int)a3;
- (void)setNormalConnParamDefaults;
- (void)setPreferredInterval:(float)a3;
@end

@implementation HIDApplePencilGen3Device

+ (unint64_t)btClockMask
{
  return 0xFFFFFFFLL;
}

+ (BOOL)hasWirelessCharging
{
  return 1;
}

- (HIDApplePencilGen3Device)initWithProperties:(id)a3 reports:(id)a4
{
  v4 = [(HIDApplePencilGen2Device *)self initWithProperties:a3 reports:a4 loggingIdentifier:@"Pencil3"];
  LODWORD(v5) = 15.0;
  [(HIDApplePencilGen3Device *)v4 setPreferredInterval:v5];
  [(HIDApplePencilGen3Device *)v4 setLatency:65];
  [(HIDApplePencilGen2Device *)v4 publishProperties];

  return v4;
}

- (id)newUserDevices:(id)a3
{
  id v4 = a3;
  id v5 = [(HIDApplePencilGen2Device *)self newDeviceMgntDevice:v4 keyholeID:0];
  id v6 = [(HIDApplePencilGen2Device *)self newTouchDevice:v4 keyholeID:1];
  id v7 = [(HIDApplePencilGen3Device *)self newMotionDevice:v4 keyholeID:2];
  id v8 = [(HIDApplePencilGen3Device *)self newHapticsDevice:v4 keyholeID:3];
  id v9 = [(HIDApplePencilGen2p5Device *)self newFwUpgradeDevice:v4 keyholeID:5];
  id v10 = [(HIDApplePencilGen2Device *)self newForceDevice:v4 keyholeID:8];

  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006DCC4();
    }
    goto LABEL_21;
  }
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006DCF8();
    }
    goto LABEL_21;
  }
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006DD2C();
    }
    goto LABEL_21;
  }
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006DD60();
    }
    goto LABEL_21;
  }
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006DD94();
    }
    goto LABEL_21;
  }
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006DDC8();
    }
LABEL_21:
    v14 = 0;
    goto LABEL_8;
  }
  v16[0] = &off_1000B7458;
  v16[1] = &off_1000B7470;
  v17[0] = v5;
  v17[1] = v6;
  v16[2] = &off_1000B7488;
  v16[3] = &off_1000B74A0;
  v17[2] = v7;
  v17[3] = v8;
  v16[4] = &off_1000B74B8;
  v16[5] = &off_1000B74D0;
  v17[4] = v9;
  v17[5] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:6];
  [(HIDApplePencilGen2Device *)self setUserDevices:v11];

  v12 = [(HIDApplePencilGen2Device *)self userDevices];
  [v12 enumerateKeysAndObjectsUsingBlock:&stru_1000B1438];

  v13 = [(HIDApplePencilGen2Device *)self userDevices];
  v14 = [v13 allValues];

LABEL_8:
  return v14;
}

- (id)newMotionDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  v5[0] = xmmword_10008A669;
  *(_OWORD *)((char *)v5 + 12) = *(long long *)((char *)&xmmword_10008A669 + 12);
  return [(HIDApplePencilDevice *)self newUserDevice:a3 descriptor:v5 descriptorLength:28 keyholeID:a4];
}

- (id)newHapticsDevice:(id)a3 keyholeID:(unsigned __int8)a4
{
  v5[0] = xmmword_10008A685;
  *(_OWORD *)((char *)v5 + 14) = *(long long *)((char *)&xmmword_10008A685 + 14);
  return [(HIDApplePencilDevice *)self newUserDevice:a3 descriptor:v5 descriptorLength:30 keyholeID:a4];
}

- (int)sendOutputReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = v8;
  if (v6 == 3)
  {
    id v9 = v8;
    id v10 = [v9 bytes];
    if ((unint64_t)[v9 length] >= 9 && (*v10 & 0xFE) == 0x10)
    {
      id v11 = [v9 mutableCopy];
      v12 = (char *)[v11 mutableBytes];
      if (*(void *)(v12 + 1))
      {
        v13 = v12;
        v14 = (void *)qword_1000CD178;
        if (os_signpost_enabled((os_log_t)qword_1000CD178))
        {
          v15 = v14;
          v16 = [(HIDApplePencilGen2Device *)self timestampSync];
          id v17 = [v16 microsecToMachTime:*(void *)(v13 + 1)];
          *(_DWORD *)buf = 134349056;
          id v24 = v17;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SendPencilFeedback", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
        }
        v18 = [(HIDApplePencilGen2Device *)self timestampSync];
        *(void *)(v13 + 1) = [v18 applyInverseTimestampOffset:*(void *)(v13 + 1)];
      }
      id v19 = [v11 copy];

      id v9 = v19;
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)HIDApplePencilGen3Device;
  int v20 = [(HIDBluetoothDevice *)&v22 sendOutputReportData:v9 reportID:v6 reportType:v5];

  return v20;
}

- (void)setNormalConnParamDefaults
{
  id v8 = +[NSUserDefaults standardUserDefaults];
  v3 = [v8 objectForKey:@"NormalConnInterval"];

  if (v3) {
    float v4 = (float)(int)[v8 integerForKey:@"NormalConnInterval"];
  }
  else {
    float v4 = 15.0;
  }
  uint64_t v5 = [v8 objectForKey:@"NormalConnLatency"];

  if (v5) {
    uint64_t v7 = (uint64_t)[v8 integerForKey:@"NormalConnLatency"];
  }
  else {
    uint64_t v7 = 65;
  }
  *(float *)&double v6 = v4;
  [(HIDApplePencilGen3Device *)self setPreferredInterval:v6];
  [(HIDApplePencilGen3Device *)self setLatency:v7];
}

- (void)setChargingConnParamDefaults
{
  id v8 = +[NSUserDefaults standardUserDefaults];
  v3 = [v8 objectForKey:@"ChargingConnInterval"];

  if (v3) {
    float v4 = (float)(int)[v8 integerForKey:@"ChargingConnInterval"];
  }
  else {
    float v4 = 15.0;
  }
  uint64_t v5 = [v8 objectForKey:@"ChargingConnLatency"];

  if (v5) {
    uint64_t v7 = (uint64_t)[v8 integerForKey:@"ChargingConnLatency"];
  }
  else {
    uint64_t v7 = 7;
  }
  *(float *)&double v6 = v4;
  [(HIDApplePencilGen3Device *)self setPreferredInterval:v6];
  [(HIDApplePencilGen3Device *)self setLatency:v7];
}

- (id)desiredConnectionParameters
{
  v8.receiver = self;
  v8.super_class = (Class)HIDApplePencilGen3Device;
  v3 = [(HIDApplePencilGen2Device *)&v8 desiredConnectionParameters];
  [(HIDApplePencilGen3Device *)self preferredInterval];
  [v3 setMinInterval:];
  [(HIDApplePencilGen3Device *)self preferredInterval];
  [v3 setPreferredInterval:];
  [v3 setPreferredPeripheralLatency:-[HIDApplePencilGen3Device latency](self, "latency")];
  [v3 setMaxPeripheralLatency:-[HIDApplePencilGen3Device latency](self, "latency")];
  float v4 = (float)(int)([v3 preferredPeripheralLatency] + 1);
  [v3 preferredInterval];
  float v6 = (float)((float)(v5 * v4) * 4.0) + 1.0;
  if (v6 < 2000.0) {
    float v6 = 2000.0;
  }
  [v3 setTimeout:(int)v6];

  return v3;
}

- (void)chargerStateChanged:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  float v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    float v6 = v5;
    uint64_t v7 = [(HIDApplePencilDevice *)self loggingIdentifier];
    objc_super v8 = +[HIDChargerNotifier stateToStr:v3];
    *(_DWORD *)buf = 138412546;
    v12 = v7;
    __int16 v13 = 2112;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ received HID charger notification: %@", buf, 0x16u);
  }
  if (v3 == 1) {
    [(HIDApplePencilGen3Device *)self setChargingConnParamDefaults];
  }
  else {
    [(HIDApplePencilGen3Device *)self setNormalConnParamDefaults];
  }
  BOOL v9 = v3 == 1;
  [(HIDBluetoothDevice *)self notifyDesiredConnectionParametersDidChange];
  [(HIDApplePencilGen2Device *)self notifyPencilOnChargerState:v9];
  [(HIDApplePencilGen3Device *)self notifyDownstreamOnChargerState:v9];
  v10.receiver = self;
  v10.super_class = (Class)HIDApplePencilGen3Device;
  [(HIDApplePencilGen2Device *)&v10 chargeStateCollection:v9];
}

- (void)pairingInfoCompleted
{
  uint64_t v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    float v4 = v3;
    float v5 = [(HIDApplePencilDevice *)self loggingIdentifier];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ received pairing info", (uint8_t *)&v6, 0xCu);
  }
}

- (void)authCompleted:(BOOL)a3
{
  float v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_10006DDFC(v5, self, a3);
  }
}

- (void)notifyDownstreamOnChargerState:(BOOL)a3
{
  v4[0] = -1;
  v4[1] = a3;
  uint64_t v3 = [(HIDApplePencilGen2Device *)self deviceMgntUserDevice];
  [v3 handleInputReport:v4 reportLength:2];
}

- (void)checkAndLogHostInputReportCollision:(unsigned __int8)a3 reportID:(unsigned __int8)a4
{
  if (!a3 && a4 == 255)
  {
    float v4 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006DEC0(v4);
    }
  }
}

- (float)preferredInterval
{
  return self->_preferredInterval;
}

- (void)setPreferredInterval:(float)a3
{
  self->_preferredInterval = a3;
}

- (int)latency
{
  return self->_latency;
}

- (void)setLatency:(int)a3
{
  self->_latency = a3;
}

@end