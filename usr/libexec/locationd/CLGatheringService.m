@interface CLGatheringService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLGatheringService)init;
- (void)beginService;
- (void)endService;
@end

@implementation CLGatheringService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_102481C30 != -1) {
    dispatch_once(&qword_102481C30, &stru_1022FC178);
  }
  return (id)qword_102481C28;
}

+ (BOOL)isSupported
{
  if (qword_102481C40 != -1) {
    dispatch_once(&qword_102481C40, &stru_1022FC198);
  }
  return byte_102481C38;
}

- (CLGatheringService)init
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022FC1B8);
  }
  v3 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "init service", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022FC1B8);
    }
    __int16 v7 = 0;
    unint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringService init]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)CLGatheringService;
  return [(CLGatheringService *)&v6 initWithInboundProtocol:&OBJC_PROTOCOL___CLGatheringServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLGatheringClientProtocol];
}

- (void)beginService
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022FC1B8);
  }
  v3 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "begin service", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022FC1B8);
    }
    objc_super v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringService beginService]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  id v4 = [[-[CLGatheringService universe](self, "universe") silo] queue];
  self->_settings = [[CLGatheringSettings alloc] initWithUniverse:[(CLGatheringService *)self universe]];
  self->_bluetoothClient = [[CLGatheringBluetoothClient alloc] initWithQueue:v4 withSettings:self->_settings];
  self->_advStore = [[CLGatheringDiscoveryStore alloc] initWithQueue:v4 withSettings:self->_settings];
  self->_xpcServer = [[CLGatheringXPCServer alloc] initWithQueue:v4 settings:self->_settings advStore:self->_advStore btClient:self->_bluetoothClient];
  [(CLGatheringBluetoothClient *)self->_bluetoothClient setScannerDelegate:self->_advStore];
  [(CLGatheringBluetoothClient *)self->_bluetoothClient run];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CLLocationManagerGatheringCameUp, 0, 0, 0);
}

- (void)endService
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022FC1B8);
  }
  v3 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "end service", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022FC1B8);
    }
    id v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringService endService]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLGatheringBluetoothClient *)self->_bluetoothClient stop];
}

@end