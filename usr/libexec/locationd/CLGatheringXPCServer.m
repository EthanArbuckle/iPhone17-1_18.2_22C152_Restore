@interface CLGatheringXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CLGatheringXPCServer)initWithQueue:(id)a3 settings:(id)a4 advStore:(id)a5 btClient:(id)a6;
- (void)configure:(id)a3 withCompletion:(id)a4;
- (void)fetchAdvertisementsDetailedWithCompletion:(id)a3;
- (void)fetchAdvertisementsWithCompletion:(id)a3;
@end

@implementation CLGatheringXPCServer

- (CLGatheringXPCServer)initWithQueue:(id)a3 settings:(id)a4 advStore:(id)a5 btClient:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)CLGatheringXPCServer;
  v10 = [(CLGatheringXPCServer *)&v13 init];
  if (v10)
  {
    v10->_queue = (OS_dispatch_queue *)a3;
    v10->_advStore = (CLGatheringDiscoveryStore *)a5;
    v10->_btClient = (CLGatheringBluetoothClient *)a6;
    v10->_settings = (CLGatheringSettings *)a4;
    v11 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.locationd.gathering"];
    v10->_listener = v11;
    [(NSXPCListener *)v11 setDelegate:v10];
    [(NSXPCListener *)v10->_listener _setQueue:v10->_queue];
    [(NSXPCListener *)v10->_listener activate];
  }
  return v10;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  if (a4)
  {
    id v6 = [a4 valueForEntitlement:@"com.apple.locationd.adpd_gathering"];
    if (!v6
      || (v7 = v6, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || ([v7 BOOLValue] & 1) == 0)
    {
      unsigned int v8 = [a4 processIdentifier];
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022CEC18);
      }
      v9 = qword_1024194B8;
      if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289282;
        int v19 = 0;
        __int16 v20 = 2082;
        v21 = "";
        __int16 v22 = 1026;
        unsigned int v23 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"process is not entitled to use CLLocationManagerGathering\", \"pid\":%{public}d}", buf, 0x18u);
        if (qword_1024194B0 != -1) {
          dispatch_once(&qword_1024194B0, &stru_1022CEC18);
        }
      }
      v10 = qword_1024194B8;
      if (os_signpost_enabled((os_log_t)qword_1024194B8))
      {
        *(_DWORD *)buf = 68289282;
        int v19 = 0;
        __int16 v20 = 2082;
        v21 = "";
        __int16 v22 = 1026;
        unsigned int v23 = v8;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "process is not entitled to use CLLocationManagerGathering", "{\"msg%{public}.0s\":\"process is not entitled to use CLLocationManagerGathering\", \"pid\":%{public}d}", buf, 0x18u);
      }
    }
    [a4 setInterruptionHandler:&stru_1022CEBB0];
    [a4 setInvalidationHandler:&stru_1022CEBD0];
    [a4 setExportedInterface:[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CLLocationManagerGatheringServerInterface]];
    id v11 = [a4 exportedInterface];
    uint64_t v12 = objc_opt_class();
    [v11 setClasses:[+[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0)] forSelector:@"fetchAdvertisementsWithCompletion:" argumentIndex:0 ofReply:1];
    id v13 = [a4 exportedInterface];
    uint64_t v14 = objc_opt_class();
    [v13 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, objc_opt_class(), 0) forSelector:@"fetchAdvertisementsDetailedWithCompletion:" argumentIndex:0 ofReply:1];
    [a4 setExportedObject:self];
    [a4 activate];
  }
  else
  {
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022CEC18);
    }
    v15 = qword_1024194B8;
    if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Why didn't we get a connection?", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024194B0 != -1) {
        dispatch_once(&qword_1024194B0, &stru_1022CEC18);
      }
      v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGatheringXPCServer listener:shouldAcceptNewConnection:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
  }
  return a4 != 0;
}

- (void)fetchAdvertisementsWithCompletion:(id)a3
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022CEC18);
  }
  v5 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "fetching advertisements history", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022CEC18);
    }
    __int16 v9 = 0;
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringXPCServer fetchAdvertisementsWithCompletion:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100894A2C;
  block[3] = &unk_1022CEBF8;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

- (void)fetchAdvertisementsDetailedWithCompletion:(id)a3
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022CEC18);
  }
  v5 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "fetching detailed advertisements history", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022CEC18);
    }
    __int16 v9 = 0;
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringXPCServer fetchAdvertisementsDetailedWithCompletion:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100894E00;
  block[3] = &unk_1022CEBF8;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

- (void)configure:(id)a3 withCompletion:(id)a4
{
  int var0 = a3.var0;
  int var1 = a3.var1;
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022CEC18);
  }
  unsigned int v8 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v19 = var0;
    __int16 v20 = 1024;
    int v21 = var1;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "configure with adv: %d scan: %d", buf, 0xEu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022CEC18);
    }
    int v14 = 67109376;
    int v15 = var0;
    __int16 v16 = 1024;
    int v17 = var1;
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringXPCServer configure:withCompletion:]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008952F0;
  block[3] = &unk_1022ACE28;
  block[4] = self;
  block[5] = a4;
  int v12 = var0;
  int v13 = var1;
  dispatch_async(queue, block);
}

@end