@interface BatteryClientService
+ (id)UUID;
- (BOOL)isAccessoryCategoryPencil:(id)a3;
- (BatteryClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5;
- (CBCharacteristic)batteryLevelCharacteristic;
- (CBCharacteristic)batteryPowerStateCharacteristic;
- (NSMutableDictionary)powerSourceDetails;
- (OpaqueIOPSPowerSourceID)powerSourceID;
- (id)batteryPowerStateString:(unsigned __int8)a3;
- (void)extractBatteryLevel;
- (void)extractBatteryPowerState;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)setBatteryLevelCharacteristic:(id)a3;
- (void)setBatteryPowerStateCharacteristic:(id)a3;
- (void)setPowerSourceDetails:(id)a3;
- (void)setPowerSourceID:(OpaqueIOPSPowerSourceID *)a3;
- (void)start;
- (void)stop;
- (void)updatePowerSource:(id)a3;
@end

@implementation BatteryClientService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:CBUUIDBatteryServiceString];
}

- (BatteryClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)BatteryClientService;
  return [(ClientService *)&v6 initWithManager:a3 peripheral:a4 service:a5];
}

- (void)start
{
  v8.receiver = self;
  v8.super_class = (Class)BatteryClientService;
  [(ClientService *)&v8 start];
  v3 = +[CBUUID UUIDWithString:CBUUIDBatteryLevelCharacteristicString];
  v9[0] = v3;
  v4 = +[CBUUID UUIDWithString:CBUUIDBatteryPowerStateCharacteristicString];
  v9[1] = v4;
  v5 = +[NSArray arrayWithObjects:v9 count:2];

  objc_super v6 = [(ClientService *)self peripheral];
  v7 = [(ClientService *)self service];
  [v6 discoverCharacteristics:v5 forService:v7];
}

- (void)stop
{
  if ([(BatteryClientService *)self powerSourceID])
  {
    [(BatteryClientService *)self powerSourceID];
    IOPSReleasePowerSource();
  }
  v3.receiver = self;
  v3.super_class = (Class)BatteryClientService;
  [(ClientService *)&v3 stop];
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  if (a5) {
    goto LABEL_23;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v9 = [a4 characteristics];
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v10) {
    goto LABEL_20;
  }
  id v11 = v10;
  uint64_t v12 = *(void *)v28;
  uint64_t v26 = CBUUIDBatteryLevelCharacteristicString;
  uint64_t v25 = CBUUIDBatteryPowerStateCharacteristicString;
  do
  {
    v13 = 0;
    do
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v13);
      v15 = [(BatteryClientService *)self batteryLevelCharacteristic];
      if (v15)
      {
      }
      else
      {
        v16 = [v14 UUID];
        v17 = +[CBUUID UUIDWithString:v26];
        unsigned int v18 = [v16 isEqual:v17];

        if (v18)
        {
          [(BatteryClientService *)self setBatteryLevelCharacteristic:v14];
LABEL_15:
          if (([v14 properties] & 0x10) != 0) {
            [v8 setNotifyValue:1 forCharacteristic:v14];
          }
          [v8 readValueForCharacteristic:v14];
          goto LABEL_18;
        }
      }
      v19 = [(BatteryClientService *)self batteryPowerStateCharacteristic];
      if (v19)
      {

        goto LABEL_18;
      }
      v20 = [v14 UUID];
      v21 = +[CBUUID UUIDWithString:v25];
      unsigned int v22 = [v20 isEqual:v21];

      if (v22)
      {
        [(BatteryClientService *)self setBatteryPowerStateCharacteristic:v14];
        goto LABEL_15;
      }
LABEL_18:
      v13 = (char *)v13 + 1;
    }
    while (v11 != v13);
    id v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v11);
LABEL_20:

  [(ClientService *)self notifyDidStart];
  v23 = [(BatteryClientService *)self batteryLevelCharacteristic];

  if (!v23)
  {
    v24 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100075CC8(v24);
    }
  }
LABEL_23:
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a4;
  if (!a5)
  {
    id v10 = v7;
    id v8 = [(BatteryClientService *)self batteryLevelCharacteristic];

    if (v8 == v10)
    {
      [(BatteryClientService *)self extractBatteryLevel];
    }
    else
    {
      id v9 = [(BatteryClientService *)self batteryPowerStateCharacteristic];

      id v7 = v10;
      if (v9 != v10) {
        goto LABEL_7;
      }
      [(BatteryClientService *)self extractBatteryPowerState];
    }
    id v7 = v10;
  }
LABEL_7:
}

- (void)extractBatteryLevel
{
  objc_super v3 = [(BatteryClientService *)self batteryLevelCharacteristic];
  v4 = [v3 value];
  v5 = +[DataInputStream inputStreamWithData:v4];

  unsigned __int8 v12 = 0;
  if ([v5 readUint8:&v12])
  {
    objc_super v6 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = [(ClientService *)self peripheral];
      id v9 = [v8 name];
      *(_DWORD *)buf = 138412546;
      v14 = v9;
      __int16 v15 = 1024;
      int v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Battery level for peripheral \"%@\": %u%%", buf, 0x12u);
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000613C4;
    v10[3] = &unk_1000B24D0;
    v10[4] = self;
    unsigned __int8 v11 = v12;
    [(BatteryClientService *)self updatePowerSource:v10];
  }
}

- (void)extractBatteryPowerState
{
  objc_super v3 = [(BatteryClientService *)self batteryPowerStateCharacteristic];
  v4 = [v3 value];
  v5 = +[DataInputStream inputStreamWithData:v4];

  unsigned __int8 v13 = 0;
  if ([v5 readUint8:&v13])
  {
    objc_super v6 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = [(ClientService *)self peripheral];
      id v9 = [v8 name];
      id v10 = [(BatteryClientService *)self batteryPowerStateString:v13];
      *(_DWORD *)buf = 138412546;
      __int16 v15 = v9;
      __int16 v16 = 2114;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Battery power state for peripheral \"%@\": %{public}@", buf, 0x16u);
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000615F4;
    v11[3] = &unk_1000B24D0;
    unsigned __int8 v12 = v13;
    v11[4] = self;
    [(BatteryClientService *)self updatePowerSource:v11];
  }
}

- (void)updatePowerSource:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = [(BatteryClientService *)self powerSourceDetails];

  if (!v5)
  {
    id v6 = objc_alloc((Class)NSMutableDictionary);
    v33[0] = @"Type";
    v33[1] = @"Transport Type";
    v34[0] = @"Accessory Source";
    v34[1] = @"Bluetooth LE";
    v34[2] = @"Battery Power";
    v33[2] = @"Power Source State";
    v33[3] = @"Accessory Identifier";
    id v7 = [(ClientService *)self peripheral];
    id v8 = [v7 identifier];
    id v9 = [v8 UUIDString];
    v34[3] = v9;
    v34[4] = &off_1000B7830;
    v33[4] = @"Max Capacity";
    v33[5] = @"Low Warn Level";
    v34[5] = &off_1000B7848;
    id v10 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:6];
    id v11 = [v6 initWithDictionary:v10];
    [(BatteryClientService *)self setPowerSourceDetails:v11];

    unsigned __int8 v12 = [(ClientService *)self peripheral];
    unsigned __int8 v13 = [v12 name];

    if (v13)
    {
      v14 = [(ClientService *)self peripheral];
      __int16 v15 = [v14 name];
      __int16 v16 = [(BatteryClientService *)self powerSourceDetails];
      [v16 setObject:v15 forKeyedSubscript:@"Name"];
    }
    v17 = [(ClientService *)self manager];
    unsigned int v18 = +[CBUUID UUIDWithString:CBUUIDDeviceInformationServiceString];
    v19 = [v17 clientServiceForUUID:v18];

    if ([v19 hasIDs])
    {
      v20 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v19 vendorIDSource]);
      v21 = [(BatteryClientService *)self powerSourceDetails];
      [v21 setObject:v20 forKeyedSubscript:@"Vendor ID Source"];

      unsigned int v22 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v19 vendorID]);
      v23 = [(BatteryClientService *)self powerSourceDetails];
      [v23 setObject:v22 forKeyedSubscript:@"Vendor ID"];

      v24 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v19 productID]);
      uint64_t v25 = [(BatteryClientService *)self powerSourceDetails];
      [v25 setObject:v24 forKeyedSubscript:@"Product ID"];

      if ([(BatteryClientService *)self isAccessoryCategoryPencil:v19])
      {
        uint64_t v26 = [(BatteryClientService *)self powerSourceDetails];
        [v26 setObject:@"Pencil" forKeyedSubscript:@"Accessory Category"];
      }
    }
  }
  v4[2](v4);
  if (![(BatteryClientService *)self powerSourceID])
  {
    long long v27 = +[ConnectionManager instance];
    long long v28 = [(ClientService *)self peripheral];
    unsigned int v29 = [v27 isAlwaysConnecting:v28];

    if (v29) {
      IOPSCreatePowerSource();
    }
  }
  if ([(BatteryClientService *)self powerSourceID])
  {
    [(BatteryClientService *)self powerSourceID];
    long long v30 = [(BatteryClientService *)self powerSourceDetails];
    int v31 = IOPSSetPowerSourceDetails();

    if (v31)
    {
      v32 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100075D0C(v32, self, v31);
      }
    }
  }
}

- (id)batteryPowerStateString:(unsigned __int8)a3
{
  return +[NSString stringWithFormat:@"%@ / %@ / %@ / %@", off_1000B24F0[a3 & 3], off_1000B2530[(a3 >> 2) & 3], off_1000B2510[(a3 >> 4) & 3], off_1000B2550[a3 >> 6]];
}

- (BOOL)isAccessoryCategoryPencil:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 productID] == 546
    || [v3 productID] == 332
    || [v3 productID] == 482
    || [v3 productID] == 1106;
  if ([v3 vendorIDSource] == 1)
  {
    if ([v3 vendorID] != 76) {
      BOOL v4 = 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (CBCharacteristic)batteryLevelCharacteristic
{
  return self->_batteryLevelCharacteristic;
}

- (void)setBatteryLevelCharacteristic:(id)a3
{
}

- (CBCharacteristic)batteryPowerStateCharacteristic
{
  return self->_batteryPowerStateCharacteristic;
}

- (void)setBatteryPowerStateCharacteristic:(id)a3
{
}

- (OpaqueIOPSPowerSourceID)powerSourceID
{
  return self->_powerSourceID;
}

- (void)setPowerSourceID:(OpaqueIOPSPowerSourceID *)a3
{
  self->_powerSourceID = a3;
}

- (NSMutableDictionary)powerSourceDetails
{
  return self->_powerSourceDetails;
}

- (void)setPowerSourceDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerSourceDetails, 0);
  objc_storeStrong((id *)&self->_batteryPowerStateCharacteristic, 0);

  objc_storeStrong((id *)&self->_batteryLevelCharacteristic, 0);
}

@end