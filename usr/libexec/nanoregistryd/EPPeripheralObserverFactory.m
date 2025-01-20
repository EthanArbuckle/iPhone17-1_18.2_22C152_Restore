@interface EPPeripheralObserverFactory
+ (Class)resourceClass;
- (CBPeripheral)peripheral;
- (EPPeripheralConnectorManager)connectorManager;
- (EPPeripheralObserverFactory)initWithPeripheral:(id)a3;
- (id)newConnectorWithDelegate:(id)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
@end

@implementation EPPeripheralObserverFactory

- (EPPeripheralObserverFactory)initWithPeripheral:(id)a3
{
  id v5 = a3;
  v6 = +[EPFactory queue];
  v9.receiver = self;
  v9.super_class = (Class)EPPeripheralObserverFactory;
  v7 = [(EPResourceManager *)&v9 initWithQueue:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_peripheral, a3);
    [v5 setDelegate:v7];
  }

  return v7;
}

+ (Class)resourceClass
{
  return (Class)objc_opt_class();
}

- (EPPeripheralConnectorManager)connectorManager
{
  connectorManager = self->_connectorManager;
  if (!connectorManager)
  {
    v4 = +[EPPeripheralConnectorManagerFactory sharedConnectorManagerFactory];
    id v5 = [(CBPeripheral *)self->_peripheral identifier];
    v6 = [v4 connectorManagerWithUuid:v5];
    v7 = self->_connectorManager;
    self->_connectorManager = v6;

    connectorManager = self->_connectorManager;
  }

  return connectorManager;
}

- (id)newConnectorWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(EPPeripheralObserverFactory *)self connectorManager];
  id v6 = [v5 newResourceWithDelegate:v4];

  return v6;
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000EF6C;
  v8[3] = &unk_100165908;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v8];
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000F058;
  v11[3] = &unk_100165930;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v11];
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000F148;
  v11[3] = &unk_100165930;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v11];
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_1000A3CF0();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = sub_1000A3CF0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "didUpdateValueForCharacteristic was called", buf, 2u);
    }
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000F2A8;
  v17[3] = &unk_100165930;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v17];
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peripheral, 0);

  objc_storeStrong((id *)&self->_connectorManager, 0);
}

@end