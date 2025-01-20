@interface CLTileDownloadSchedulingService
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)hasRegisteredForCellularConnectivity;
- (BOOL)hasRegisteredForWifiConnectivity;
- (CLTileDownloadSchedulingService)init;
- (NSMutableArray)clients;
- (void)beginService;
- (void)dealloc;
- (void)endService;
- (void)requestForSchedulingTileDownload:(id)a3;
- (void)scheduleDownloadsWithCellularConnectivity;
- (void)scheduleDownloadsWithWifiConnectivity;
- (void)setClients:(id)a3;
- (void)setHasRegisteredForCellularConnectivity:(BOOL)a3;
- (void)setHasRegisteredForWifiConnectivity:(BOOL)a3;
- (void)stopListeningForForScheduledTileDownload:(id)a3;
@end

@implementation CLTileDownloadSchedulingService

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
  if (qword_10247E740 != -1) {
    dispatch_once(&qword_10247E740, &stru_1022CEA60);
  }
  return (id)qword_10247E738;
}

- (CLTileDownloadSchedulingService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLTileDownloadSchedulingService;
  return [(CLTileDownloadSchedulingService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLTileDownloadSchedulingServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLTileDownloadSchedulingClientProtocol];
}

- (void)dealloc
{
  [(CLTileDownloadSchedulingService *)self setClients:0];
  xpc_activity_unregister("com.apple.locationd.TileDownloadWifiReachability");
  xpc_activity_unregister("com.apple.locationd.TileDownloadCellReachability");
  v3.receiver = self;
  v3.super_class = (Class)CLTileDownloadSchedulingService;
  [(CLTileDownloadSchedulingService *)&v3 dealloc];
}

- (void)beginService
{
  id v2 = [(CLTileDownloadSchedulingService *)self universe];

  [v2 silo];
}

- (void)endService
{
  id v2 = [(CLTileDownloadSchedulingService *)self universe];

  [v2 silo];
}

- (void)requestForSchedulingTileDownload:(id)a3
{
  if ([(NSMutableArray *)[(CLTileDownloadSchedulingService *)self clients] containsObject:a3])
  {
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022CEA80);
    }
    unint64_t v5 = qword_102419388;
    if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#tiledownloadscheduler, warning, client is re-subscribing", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419380 != -1) {
        dispatch_once(&qword_102419380, &stru_1022CEA80);
      }
LABEL_22:
      v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileDownloadSchedulingService requestForSchedulingTileDownload:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
  else
  {
    [(NSMutableArray *)[(CLTileDownloadSchedulingService *)self clients] addObject:a3];
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022CEA80);
    }
    v6 = qword_102419388;
    if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      id v9 = [(NSMutableArray *)[(CLTileDownloadSchedulingService *)self clients] count];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#tiledownloadscheduler, add client, count, %ld", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419380 != -1) {
        dispatch_once(&qword_102419380, &stru_1022CEA80);
      }
      [(NSMutableArray *)[(CLTileDownloadSchedulingService *)self clients] count];
      goto LABEL_22;
    }
  }
  if (![(CLTileDownloadSchedulingService *)self hasRegisteredForWifiConnectivity]) {
    [(CLTileDownloadSchedulingService *)self scheduleDownloadsWithWifiConnectivity];
  }
  if (![(CLTileDownloadSchedulingService *)self hasRegisteredForCellularConnectivity])[(CLTileDownloadSchedulingService *)self scheduleDownloadsWithCellularConnectivity]; {
}
  }

- (void)stopListeningForForScheduledTileDownload:(id)a3
{
  [(NSMutableArray *)[(CLTileDownloadSchedulingService *)self clients] removeObject:a3];
  if (qword_102419380 != -1) {
    dispatch_once(&qword_102419380, &stru_1022CEA80);
  }
  v4 = qword_102419388;
  if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    id v7 = [(NSMutableArray *)[(CLTileDownloadSchedulingService *)self clients] count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "#tiledownloadscheduler, client unsubscribe, count, %{public}ld", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022CEA80);
    }
    [(NSMutableArray *)[(CLTileDownloadSchedulingService *)self clients] count];
    unint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTileDownloadSchedulingService stopListeningForForScheduledTileDownload:]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
}

- (void)scheduleDownloadsWithWifiConnectivity
{
  if (![(CLTileDownloadSchedulingService *)self hasRegisteredForWifiConnectivity])
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    sub_10089226C(v3, 2);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10089236C;
    handler[3] = &unk_1022B9CD0;
    handler[4] = self;
    xpc_activity_register("com.apple.locationd.TileDownloadWifiReachability", v3, handler);
    xpc_release(v3);
    [(CLTileDownloadSchedulingService *)self setHasRegisteredForWifiConnectivity:1];
  }
}

- (void)scheduleDownloadsWithCellularConnectivity
{
  if (![(CLTileDownloadSchedulingService *)self hasRegisteredForCellularConnectivity])
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    sub_10089226C(v3, 1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100892A1C;
    handler[3] = &unk_1022B9CD0;
    handler[4] = self;
    xpc_activity_register("com.apple.locationd.TileDownloadCellReachability", v3, handler);
    xpc_release(v3);
    [(CLTileDownloadSchedulingService *)self setHasRegisteredForCellularConnectivity:1];
  }
}

- (NSMutableArray)clients
{
  result = self->_clients;
  if (!result)
  {
    result = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_clients = result;
  }
  return result;
}

- (void)setClients:(id)a3
{
}

- (BOOL)hasRegisteredForWifiConnectivity
{
  return self->_hasRegisteredForWifiConnectivity;
}

- (void)setHasRegisteredForWifiConnectivity:(BOOL)a3
{
  self->_hasRegisteredForWifiConnectivity = a3;
}

- (BOOL)hasRegisteredForCellularConnectivity
{
  return self->_hasRegisteredForCellularConnectivity;
}

- (void)setHasRegisteredForCellularConnectivity:(BOOL)a3
{
  self->_hasRegisteredForCellularConnectivity = a3;
}

@end