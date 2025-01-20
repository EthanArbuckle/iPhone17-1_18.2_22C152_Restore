@interface EPCentralManagerManager
+ (Class)resourceClass;
+ (id)stringForCBPeripheralState:(int64_t)a3;
- (CBCentralManager)manager;
- (EPCentralManagerManager)init;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)createResource;
- (void)destroyResource;
@end

@implementation EPCentralManagerManager

- (EPCentralManagerManager)init
{
  v3 = +[EPFactory queue];
  v6.receiver = self;
  v6.super_class = (Class)EPCentralManagerManager;
  v4 = [(EPResourceManager *)&v6 initWithQueue:v3];

  return v4;
}

- (void)createResource
{
  v12.receiver = self;
  v12.super_class = (Class)EPCentralManagerManager;
  [(EPResourceManager *)&v12 createResource];
  id v3 = objc_alloc((Class)CBCentralManager);
  v4 = [(EPResourceManager *)self queue];
  v5 = (CBCentralManager *)[v3 initWithDelegate:self queue:v4];
  manager = self->_manager;
  self->_manager = v5;

  v7 = sub_1000A3BC0();
  LODWORD(v4) = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v8 = sub_1000A3BC0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_manager;
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 134218754;
      v14 = self;
      __int16 v15 = 2048;
      v16 = v9;
      __int16 v17 = 2112;
      v18 = v11;
      __int16 v19 = 2048;
      v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "EPCentralManagerManager[%p]: Init CBCentralManager %p with delgate %@[%p]", buf, 0x2Au);
    }
  }
}

- (void)destroyResource
{
  v8.receiver = self;
  v8.super_class = (Class)EPCentralManagerManager;
  [(EPResourceManager *)&v8 destroyResource];
  id v3 = sub_1000A3BC0();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = sub_1000A3BC0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      manager = self->_manager;
      *(_DWORD *)buf = 134218240;
      v10 = self;
      __int16 v11 = 2048;
      objc_super v12 = manager;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "EPCentralManagerManager[%p]: Nilling CBCentralManager %p", buf, 0x16u);
    }
  }
  v7 = self->_manager;
  self->_manager = 0;
}

+ (Class)resourceClass
{
  return (Class)objc_opt_class();
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 0;
  objc_super v6 = 0;
  switch((unint64_t)[v4 state])
  {
    case 2uLL:
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      CFStringRef v16 = @"Bluetooth is not supported";
      v7 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      uint64_t v8 = 3;
      goto LABEL_5;
    case 3uLL:
      NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
      CFStringRef v14 = @"Bluetooth is unauthorized";
      v7 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      uint64_t v8 = 4;
LABEL_5:
      objc_super v6 = +[NSError errorWithDomain:@"com.apple.extensiblepair.corebluetooth.centralmanager" code:v8 userInfo:v7];

      uint64_t v5 = 2;
      break;
    case 4uLL:
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      CFStringRef v18 = @"Bluetooth is powered off";
      v9 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      uint64_t v5 = 2;
      objc_super v6 = +[NSError errorWithDomain:@"com.apple.extensiblepair.corebluetooth.centralmanager" code:2 userInfo:v9];

      break;
    case 5uLL:
    case 0xAuLL:
      objc_super v6 = 0;
      uint64_t v5 = 1;
      break;
    default:
      break;
  }
  [(EPResourceManager *)self setAvailability:v5 withError:v6];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008975C;
  v11[3] = &unk_1001683F8;
  id v12 = v4;
  id v10 = v4;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v11];
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_1000A3BC0();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = sub_1000A3BC0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = [v7 identifier];
      id v12 = [v11 UUIDString];
      *(_DWORD *)buf = 134218242;
      __int16 v19 = self;
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "EPCentralManagerManager[%p]: received centralManager:didConnectPeripheral: from CoreBluetooth for peripheral %@", buf, 0x16u);
    }
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000898FC;
  v15[3] = &unk_100165908;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v15];
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = sub_1000A3BC0();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = sub_1000A3BC0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v9 identifier];
      NSErrorUserInfoKey v15 = [v14 UUIDString];
      *(_DWORD *)buf = 134218242;
      v24 = self;
      __int16 v25 = 2112;
      v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "EPCentralManagerManager[%p]: received centralManager:didDisconnectPeripheral: from CoreBluetooth for peripheral %@", buf, 0x16u);
    }
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100089AC8;
  v19[3] = &unk_100165930;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v19];
}

+ (id)stringForCBPeripheralState:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return off_1001684D0[a3];
  }
}

- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000A3BC0();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = sub_1000A3BC0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = [v7 identifier];
      BOOL v12 = [v11 UUIDString];
      id v13 = [objc_opt_class() stringForCBPeripheralState:[v7 state]];
      *(_DWORD *)buf = 134218498;
      id v20 = self;
      __int16 v21 = 2112;
      id v22 = v12;
      __int16 v23 = 2112;
      v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "EPCentralManagerManager[%p]: received centralManager:didUpdatePeripheralConnectionState: from CoreBluetooth for peripheral %@ to connectivity state %@", buf, 0x20u);
    }
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100089CC8;
  v16[3] = &unk_100165908;
  id v17 = v6;
  id v18 = v7;
  id v14 = v7;
  id v15 = v6;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v16];
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100089DB4;
  v11[3] = &unk_100165930;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v11];
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100089ECC;
  v14[3] = &unk_1001684B0;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v10 = v18;
  id v11 = v17;
  id v12 = v16;
  id v13 = v15;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v14];
}

- (CBCentralManager)manager
{
  return self->_manager;
}

- (void).cxx_destruct
{
}

@end