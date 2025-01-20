@interface EPPeripheralManagerManager
+ (Class)resourceClass;
- (CBPeripheralManager)manager;
- (EPPeripheralManagerManager)init;
- (void)createResource;
- (void)destroyResource;
- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5;
- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5;
- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4;
- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4;
- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)peripheralManagerIsReadyToUpdateSubscribers:(id)a3;
@end

@implementation EPPeripheralManagerManager

- (EPPeripheralManagerManager)init
{
  v3 = +[EPFactory queue];
  v6.receiver = self;
  v6.super_class = (Class)EPPeripheralManagerManager;
  v4 = [(EPResourceManager *)&v6 initWithQueue:v3];

  return v4;
}

- (void)createResource
{
  v7.receiver = self;
  v7.super_class = (Class)EPPeripheralManagerManager;
  [(EPResourceManager *)&v7 createResource];
  id v3 = objc_alloc((Class)CBPeripheralManager);
  v4 = [(EPResourceManager *)self queue];
  v5 = (CBPeripheralManager *)[v3 initWithDelegate:self queue:v4];
  manager = self->_manager;
  self->_manager = v5;
}

- (void)destroyResource
{
  v4.receiver = self;
  v4.super_class = (Class)EPPeripheralManagerManager;
  [(EPResourceManager *)&v4 destroyResource];
  manager = self->_manager;
  self->_manager = 0;
}

+ (Class)resourceClass
{
  return (Class)objc_opt_class();
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 0;
  objc_super v6 = 0;
  switch((unint64_t)[v4 state])
  {
    case 2uLL:
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      CFStringRef v16 = @"Bluetooth is not supported";
      objc_super v7 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      uint64_t v8 = 3;
      goto LABEL_5;
    case 3uLL:
      NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
      CFStringRef v14 = @"Bluetooth is unauthorized";
      objc_super v7 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      uint64_t v8 = 4;
LABEL_5:
      objc_super v6 = +[NSError errorWithDomain:@"com.apple.extensiblepair.corebluetooth.peripheralmanager" code:v8 userInfo:v7];

      uint64_t v5 = 2;
      break;
    case 4uLL:
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      CFStringRef v18 = @"Bluetooth is powered off";
      v9 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      uint64_t v5 = 2;
      objc_super v6 = +[NSError errorWithDomain:@"com.apple.extensiblepair.corebluetooth.peripheralmanager" code:2 userInfo:v9];

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
  v11[2] = sub_1000921A8;
  v11[3] = &unk_1001683F8;
  id v12 = v4;
  id v10 = v4;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v11];
}

- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100092294;
  v11[3] = &unk_100165930;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v11];
}

- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100092360;
  v8[3] = &unk_100165908;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v8];
}

- (void)peripheralManager:(id)a3 didReceiveWriteRequests:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100092428;
  v8[3] = &unk_100165908;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v8];
}

- (void)peripheralManagerDidStartAdvertising:(id)a3 error:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000924F0;
  v8[3] = &unk_100165908;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v8];
}

- (void)peripheralManagerIsReadyToUpdateSubscribers:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100092590;
  v5[3] = &unk_1001683F8;
  id v6 = a3;
  id v4 = v6;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v5];
}

- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009267C;
  v11[3] = &unk_100165930;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v11];
}

- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009276C;
  v11[3] = &unk_100165930;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v11];
}

- (CBPeripheralManager)manager
{
  return self->_manager;
}

- (void).cxx_destruct
{
}

@end