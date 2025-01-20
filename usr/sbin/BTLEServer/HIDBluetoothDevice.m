@interface HIDBluetoothDevice
+ (BOOL)reportsHaveMultipleReportIDs:(id)a3;
+ (id)hidDeviceWithProperties:(id)a3 reports:(id)a4;
- (CBPeripheral)peripheral;
- (HIDBluetoothDevice)init;
- (HIDBluetoothDevice)initWithProperties:(id)a3 reports:(id)a4;
- (HIDServiceProtocol)service;
- (id)allocHIDQueue;
- (id)desiredConnectionParameters;
- (int)getReportData:(id *)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 error:(id *)a6;
- (int)sendOutputReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5;
- (int)setReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 error:(id *)a6;
- (unsigned)state;
- (void)dealloc;
- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5;
- (void)notifyDesiredConnectionParametersDidChange;
- (void)notifyDidStart;
- (void)notifyDidStop;
- (void)setPeripheral:(id)a3;
- (void)setService:(id)a3;
- (void)setState:(unsigned __int8)a3;
- (void)start;
- (void)stop;
@end

@implementation HIDBluetoothDevice

+ (id)hidDeviceWithProperties:(id)a3 reports:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"VendorIDSource"];
  if ([v8 unsignedCharValue] != 1)
  {

    goto LABEL_10;
  }
  v9 = [v6 objectForKeyedSubscript:@"VendorID"];
  unsigned int v10 = [v9 unsignedShortValue];

  if (v10 != 76)
  {
LABEL_10:
    [a1 reportsHaveMultipleReportIDs:v7];
    v15 = (objc_class *)objc_opt_class();
    goto LABEL_11;
  }
  v11 = [v6 objectForKeyedSubscript:@"ProductID"];
  int v12 = [v11 unsignedShortValue];

  if (v12 > 620)
  {
    if ((v12 - 788) >= 2)
    {
      if (v12 == 1106)
      {
        v22 = [v6 objectForKeyedSubscript:@"Authenticated"];
        unsigned int v23 = [v22 BOOLValue];

        if (v23) {
          goto LABEL_26;
        }
        goto LABEL_10;
      }
      if (v12 != 621) {
        goto LABEL_10;
      }
    }
LABEL_20:
    if (!MGGetBoolAnswer()) {
      goto LABEL_10;
    }
    v18 = [v6 objectForKeyedSubscript:@"Authenticated"];
    unsigned __int8 v19 = [v18 BOOLValue];

    if ((v19 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
  if (v12 > 545)
  {
    if (v12 == 546) {
      goto LABEL_26;
    }
    if (v12 != 614) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
  if (v12 == 332)
  {
    v20 = [v6 objectForKeyedSubscript:@"Authenticated"];
    unsigned __int8 v21 = [v20 BOOLValue];

    if (v21) {
      goto LABEL_26;
    }
    goto LABEL_10;
  }
  if (v12 != 482) {
    goto LABEL_10;
  }
  v13 = [v6 objectForKeyedSubscript:@"Authenticated"];
  unsigned __int8 v14 = [v13 BOOLValue];

  if ((v14 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_26:
  v15 = (objc_class *)objc_opt_class();
  if (!v15) {
    goto LABEL_10;
  }
LABEL_11:
  id v16 = [[v15 alloc] initWithProperties:v6 reports:v7];

  return v16;
}

- (void)start
{
  [(HIDBluetoothDevice *)self setState:1];
  id v2 = +[PolicyManager instance];
  [v2 setActiveHIDDeviceCount:((char *)[v2 activeHIDDeviceCount] + 1)];
}

- (void)stop
{
  [(HIDBluetoothDevice *)self setState:3];
  id v2 = +[PolicyManager instance];
  [v2 setActiveHIDDeviceCount:((char *)[v2 activeHIDDeviceCount]) - 1];
}

- (id)desiredConnectionParameters
{
  id v2 = objc_alloc_init(ConnectionParameters);
  LODWORD(v3) = 15.0;
  [(ConnectionParameters *)v2 setMinInterval:v3];
  LODWORD(v4) = 15.0;
  [(ConnectionParameters *)v2 setPreferredInterval:v4];
  LODWORD(v5) = 1140457472;
  [(ConnectionParameters *)v2 setMaxInterval:v5];
  [(ConnectionParameters *)v2 setMinCELength:2];
  [(ConnectionParameters *)v2 setMaxCELength:6];
  [(ConnectionParameters *)v2 setPreferredPeripheralLatency:4];
  [(ConnectionParameters *)v2 setMaxPeripheralLatency:4];
  [(ConnectionParameters *)v2 setTimeout:1000];

  return v2;
}

- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5
{
}

- (HIDBluetoothDevice)init
{
  double v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[HIDBluetoothDevice init]");
  +[NSException raise:NSInvalidArgumentException, @"Calling %@ is not allowed", v3 format];

  return 0;
}

- (HIDBluetoothDevice)initWithProperties:(id)a3 reports:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HIDBluetoothDevice;
  result = [(HIDBluetoothDevice *)&v5 init];
  if (result) {
    result->_state = 0;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)HIDBluetoothDevice;
  [(HIDBluetoothDevice *)&v2 dealloc];
}

- (void)notifyDidStart
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024870;
  block[3] = &unk_1000B1268;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)notifyDidStop
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024950;
  block[3] = &unk_1000B1268;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)notifyDesiredConnectionParametersDidChange
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024A20;
  block[3] = &unk_1000B1268;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (int)getReportData:(id *)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a4;
  unsigned int v10 = [(HIDBluetoothDevice *)self service];
  LODWORD(a6) = [v10 readReportData:a3 reportID:v8 reportType:v7 error:a6];

  return (int)a6;
}

- (int)setReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a4;
  id v10 = a3;
  v11 = [(HIDBluetoothDevice *)self service];
  LODWORD(a6) = [v11 writeReportData:v10 reportID:v8 reportType:v7 withResponse:1 error:a6];

  return (int)a6;
}

- (int)sendOutputReportData:(id)a3 reportID:(unsigned __int8)a4 reportType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = a4;
  id v8 = a3;
  v9 = [(HIDBluetoothDevice *)self service];
  LODWORD(v5) = [v9 writeReportData:v8 reportID:v6 reportType:v5 withResponse:0 error:0];

  return v5;
}

- (id)allocHIDQueue
{
  objc_super v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  id v3 = +[NSString stringWithFormat:@"com.apple.%@", objc_opt_class()];
  dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], v2);

  return v4;
}

+ (BOOL)reportsHaveMultipleReportIDs:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        unsigned int v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) ID:v10];
        if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v6 = v8;
        }
        else if (v6 != v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_13;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v4;
}

- (HIDServiceProtocol)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peripheral, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end