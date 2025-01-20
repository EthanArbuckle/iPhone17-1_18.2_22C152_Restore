@interface CLMapsXPCServiceManager
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedInstance;
- (NSXPCConnection)connection;
- (void)clearMemoryAndExitHelperProcessCleanly;
- (void)collectMapDataOfType:(int64_t)a3 aroundCoordinate:(CLLocationCoordinate2D)a4 inRadius:(double)a5 allowNetwork:(BOOL)a6 isPedestrianOrCycling:(BOOL)a7 clearTiles:(BOOL)a8 callSynchronously:(BOOL)a9 WithReply:(id)a10;
- (void)createConnection;
- (void)dealloc;
- (void)onTimerFire:(id)a3;
- (void)releaseMapHelperServiceOSTransaction;
- (void)setConnection:(id)a3;
- (void)updateTimer;
@end

@implementation CLMapsXPCServiceManager

+ (id)sharedInstance
{
  if (!qword_102480A80)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100CAD904;
    block[3] = &unk_10229FED8;
    block[4] = a1;
    if (qword_102480A88 != -1) {
      dispatch_once(&qword_102480A88, block);
    }
    if (qword_102419440 != -1) {
      dispatch_once(&qword_102419440, &stru_1022F1550);
    }
    v2 = qword_102419448;
    if (os_log_type_enabled((os_log_t)qword_102419448, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,XPCManager allocate", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419440 != -1) {
        dispatch_once(&qword_102419440, &stru_1022F1550);
      }
      v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "+[CLMapsXPCServiceManager sharedInstance]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
  }
  return (id)qword_102480A80;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v3 = [a1 sharedInstance:a3];

  return v3;
}

- (void)createConnection
{
  connection = self->_connection;
  if (connection)
  {

    self->_connection = 0;
  }
  v4 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.corelocation.maphelperservice"];
  self->_connection = v4;
  if (v4)
  {
    self->fInactivityTimer = 0;
    self->fTimerUpdateMachContTime = -1.0;
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:+[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CLMapHelperServiceProtocol]];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
    [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:v8 forSelector:"fetchGEORoadDataAroundCoordinate:inRadius:allowNetwork:isPedestrianOrCycling:clearTiles:withReply:" argumentIndex:0 ofReply:1];
    [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:v8 forSelector:"fetchGEOBuildingDataAroundCoordinate:inRadius:tileSetStyle:allowNetwork:clearTiles:withReply:" argumentIndex:0 ofReply:1];
    [(NSXPCConnection *)self->_connection resume];
  }
  if (qword_102419440 != -1) {
    dispatch_once(&qword_102419440, &stru_1022F1550);
  }
  v9 = qword_102419448;
  if (os_log_type_enabled((os_log_t)qword_102419448, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,createConnection", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419440 != -1) {
      dispatch_once(&qword_102419440, &stru_1022F1550);
    }
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager createConnection]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
}

- (void)dealloc
{
  if (qword_102419440 != -1) {
    dispatch_once(&qword_102419440, &stru_1022F1550);
  }
  id v3 = qword_102419448;
  if (os_log_type_enabled((os_log_t)qword_102419448, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,dealloc", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419440 != -1) {
      dispatch_once(&qword_102419440, &stru_1022F1550);
    }
    __int16 v6 = 0;
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager dealloc]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLMapsXPCServiceManager *)self releaseMapHelperServiceOSTransaction];
  [(NSXPCConnection *)[(CLMapsXPCServiceManager *)self connection] invalidate];

  [(CLMapsXPCServiceManager *)self setConnection:0];
  v5.receiver = self;
  v5.super_class = (Class)CLMapsXPCServiceManager;
  [(CLMapsXPCServiceManager *)&v5 dealloc];
}

- (void)collectMapDataOfType:(int64_t)a3 aroundCoordinate:(CLLocationCoordinate2D)a4 inRadius:(double)a5 allowNetwork:(BOOL)a6 isPedestrianOrCycling:(BOOL)a7 clearTiles:(BOOL)a8 callSynchronously:(BOOL)a9 WithReply:(id)a10
{
  BOOL v11 = a9;
  BOOL v12 = a8;
  BOOL v13 = a7;
  BOOL v14 = a6;
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  [(CLMapsXPCServiceManager *)self updateTimer];
  connection = self->_connection;
  if (v11)
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100CAE0BC;
    v34[3] = &unk_1022C7578;
    v34[4] = a10;
    id v21 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v34];
  }
  else
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100CAE2FC;
    v33[3] = &unk_1022C7578;
    v33[4] = a10;
    id v21 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v33];
  }
  v22 = v21;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  double v32 = 0.0;
  double v32 = sub_10016C458();
  if (a3 == 2)
  {
    v23 = &v26;
    v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    uint64_t v24 = 1;
    v25 = sub_100CAEACC;
LABEL_10:
    v23[2] = (void **)v25;
    v23[3] = (void **)&unk_1022F14F0;
    *((double *)v23 + 6) = latitude;
    *((double *)v23 + 7) = longitude;
    *((double *)v23 + 8) = a5;
    *((unsigned char *)v23 + 72) = v11;
    v23[4] = (void **)a10;
    v23[5] = (void **)v31;
    [v22 fetchGEOBuildingDataAroundCoordinate:v24 inRadius:v14 tileSetStyle:v12 allowNetwork:latitude longitude:v26 clearTiles:v27 withReply:a5];
    goto LABEL_12;
  }
  if (a3 == 1)
  {
    uint64_t v24 = 0;
    v23 = (void ***)v28;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v25 = sub_100CAE804;
    goto LABEL_10;
  }
  if (a3)
  {
    (*((void (**)(id, void))a10 + 2))(a10, 0);
  }
  else
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100CAE53C;
    v29[3] = &unk_1022F14F0;
    *(double *)&v29[6] = latitude;
    *(double *)&v29[7] = longitude;
    *(double *)&v29[8] = a5;
    BOOL v30 = v11;
    v29[4] = a10;
    v29[5] = v31;
    [v22 fetchGEORoadDataAroundCoordinate:v14 inRadius:v13 allowNetwork:v29 isPedestrianOrCycling:v29 clearTiles:a5 withReply:latitude, longitude];
  }
LABEL_12:
  _Block_object_dispose(v31, 8);
}

- (void)clearMemoryAndExitHelperProcessCleanly
{
  if (qword_102480A80)
  {
    id v2 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_1022F1510];
    _[v2 clearMemoryAndExitCleanly];
  }
  else
  {
    if (qword_102419440 != -1) {
      dispatch_once(&qword_102419440, &stru_1022F1550);
    }
    id v3 = qword_102419448;
    if (os_log_type_enabled((os_log_t)qword_102419448, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,clearMemoryAndExitHelperProcessCleanly,sharedInstance is nil", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419440 != -1) {
        dispatch_once(&qword_102419440, &stru_1022F1550);
      }
      v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager clearMemoryAndExitHelperProcessCleanly]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
  }
}

- (void)updateTimer
{
  if (self->fTimerUpdateMachContTime <= 0.0 || vabdd_f64(sub_10016C458(), self->fTimerUpdateMachContTime) >= 60.0)
  {
    self->double fTimerUpdateMachContTime = sub_10016C458();
    fInactivityTimer = self->fInactivityTimer;
    if (fInactivityTimer)
    {
      [(NSTimer *)fInactivityTimer invalidate];
      self->fInactivityTimer = 0;
    }
    if (qword_102419440 != -1) {
      dispatch_once(&qword_102419440, &stru_1022F1550);
    }
    v4 = qword_102419448;
    if (os_log_type_enabled((os_log_t)qword_102419448, OS_LOG_TYPE_DEFAULT))
    {
      double fTimerUpdateMachContTime = self->fTimerUpdateMachContTime;
      *(_DWORD *)buf = 134349056;
      double v12 = fTimerUpdateMachContTime;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,Inactivity timer updated in XPC manager,updateTime,%{public}.2lf", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419440 != -1) {
        dispatch_once(&qword_102419440, &stru_1022F1550);
      }
      double v6 = self->fTimerUpdateMachContTime;
      int v9 = 134349056;
      double v10 = v6;
      uint64_t v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager updateTimer]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100CAF3E8;
    block[3] = &unk_10229FED8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)onTimerFire:(id)a3
{
  if (qword_102419440 != -1) {
    dispatch_once(&qword_102419440, &stru_1022F1550);
  }
  v4 = qword_102419448;
  if (os_log_type_enabled((os_log_t)qword_102419448, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,onTimerFire", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419440 != -1) {
      dispatch_once(&qword_102419440, &stru_1022F1550);
    }
    objc_super v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager onTimerFire:]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  [(CLMapsXPCServiceManager *)self releaseMapHelperServiceOSTransaction];
}

- (void)releaseMapHelperServiceOSTransaction
{
  if (qword_102419440 != -1) {
    dispatch_once(&qword_102419440, &stru_1022F1550);
  }
  id v3 = qword_102419448;
  if (os_log_type_enabled((os_log_t)qword_102419448, OS_LOG_TYPE_DEFAULT))
  {
    double fTimerUpdateMachContTime = self->fTimerUpdateMachContTime;
    *(_DWORD *)buf = 134349056;
    double v10 = fTimerUpdateMachContTime;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,releaseMapHelperServiceOSTransaction,lastTimerUpdateTime,%{public}.2lf", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419440 != -1) {
      dispatch_once(&qword_102419440, &stru_1022F1550);
    }
    uint64_t v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager releaseMapHelperServiceOSTransaction]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  fInactivityTimer = self->fInactivityTimer;
  if (fInactivityTimer)
  {
    [(NSTimer *)fInactivityTimer invalidate];
    self->fInactivityTimer = 0;
    self->double fTimerUpdateMachContTime = -1.0;
  }
  if (qword_102480A80)
  {
    [objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &stru_1022F1530), "releaseOSTransaction");
  }
  else
  {
    if (qword_102419440 != -1) {
      dispatch_once(&qword_102419440, &stru_1022F1550);
    }
    double v6 = qword_102419448;
    if (os_log_type_enabled((os_log_t)qword_102419448, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,clearMemoryAndExitHelperProcessCleanly,sharedInstance is nil", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419440 != -1) {
        dispatch_once(&qword_102419440, &stru_1022F1550);
      }
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager releaseMapHelperServiceOSTransaction]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

@end