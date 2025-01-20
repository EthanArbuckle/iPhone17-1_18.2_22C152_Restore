@interface ServerService
- (BOOL)restrictedMode;
- (CBMutableService)service;
- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5;
- (void)peripheralManagerDidUpdateState:(id)a3;
- (void)respondToRequest:(id)a3 withResult:(int64_t)a4;
- (void)setRestrictedMode:(BOOL)a3;
- (void)setService:(id)a3;
- (void)start;
- (void)stop;
- (void)updateValue:(id)a3 forCharacteristic:(id)a4 onSubscribedCentrals:(id)a5;
@end

@implementation ServerService

- (void)start
{
  id v4 = +[ServerServiceManager instance];
  v3 = [(ServerService *)self service];
  [v4 addService:v3];
}

- (void)stop
{
  id v4 = +[ServerServiceManager instance];
  v3 = [(ServerService *)self service];
  [v4 removeService:v3];
}

- (void)respondToRequest:(id)a3 withResult:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[ServerServiceManager instance];
  [v6 respondToRequest:v5 withResult:a4];
}

- (void)updateValue:(id)a3 forCharacteristic:(id)a4 onSubscribedCentrals:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[ServerServiceManager instance];
  [v10 updateValue:v9 forCharacteristic:v8 onSubscribedCentrals:v7];
}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  if ([a3 state] == (id)10)
  {
    id v4 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
      sub_1000737E0(v4);
    }
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }
  self->_restrictedMode = v5;
}

- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)qword_1000CD178;
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100073824(v10, v8, (uint64_t)v9);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = [v8 UUID];
    int v13 = 138412290;
    v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Service \"%@\" has been published", (uint8_t *)&v13, 0xCu);
  }
}

- (CBMutableService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (BOOL)restrictedMode
{
  return self->_restrictedMode;
}

- (void)setRestrictedMode:(BOOL)a3
{
  self->_restrictedMode = a3;
}

- (void).cxx_destruct
{
}

@end