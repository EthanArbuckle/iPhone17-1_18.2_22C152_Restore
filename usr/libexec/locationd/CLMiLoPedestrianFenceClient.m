@interface CLMiLoPedestrianFenceClient
- (BOOL)fenceActive;
- (BOOL)valid;
- (CLMiLoPedestrianFenceClient)init;
- (id)initInUniverse:(id)a3 andIdentifier:(id)a4 andRadiusInMeters:(float)a5 andCallback:(id)a6 andStatusCallback:(id)a7 andErrorCallback:(id)a8;
- (id)onMotionMeasurement;
- (void)clearFence;
- (void)dealloc;
- (void)didExitFence:(id)a3;
- (void)didFailWithError:(int64_t)a3;
- (void)endSession;
- (void)sessionStatusReport:(id)a3;
- (void)setFence;
- (void)setOnMotionMeasurement:(id)a3;
- (void)setValid:(BOOL)a3;
- (void)startSession;
@end

@implementation CLMiLoPedestrianFenceClient

- (CLMiLoPedestrianFenceClient)init
{
  return 0;
}

- (id)initInUniverse:(id)a3 andIdentifier:(id)a4 andRadiusInMeters:(float)a5 andCallback:(id)a6 andStatusCallback:(id)a7 andErrorCallback:(id)a8
{
  v17.receiver = self;
  v17.super_class = (Class)CLMiLoPedestrianFenceClient;
  v14 = [(CLMiLoPedestrianFenceClient *)&v17 init];
  if (v14)
  {
    v14->_universe = (CLIntersiloUniverse *)a3;
    v14->_delegateQueue = (OS_dispatch_queue *)[objc_msgSend(objc_msgSend(a3, "silo"), "queue")
    v14->_onMotionMeasurements = [a6 copy];
    v14->_onStatusReport = [a7 copy];
    v14->_onErrorIndication = [a8 copy];
    v15 = (CLPedestrianFenceServiceProtocol *)[[-[CLIntersiloUniverse vendor](v14->_universe, "vendor") proxyForService:@"CLPedestrianFenceService"];
    v14->_pedestrianFenceManager = v15;
    [(CLPedestrianFenceServiceProtocol *)v15 registerDelegate:v14 inSilo:[(CLIntersiloUniverse *)v14->_universe silo]];
    [(CLPedestrianFenceServiceProtocol *)v14->_pedestrianFenceManager setDelegateEntityName:"CLMiLoPedestrianFenceClient"];
    v14->_sessionActive = 0;
    v14->_fenceActive = 0;
    v14->_fenceIdStr = (NSString *)a4;
    v14->_valid = 1;
    v14->_radius = a5;
  }
  return v14;
}

- (void)dealloc
{
  [(CLPedestrianFenceServiceProtocol *)self->_pedestrianFenceManager endSessionForClient:self];
  v3.receiver = self;
  v3.super_class = (Class)CLMiLoPedestrianFenceClient;
  [(CLMiLoPedestrianFenceClient *)&v3 dealloc];
}

- (void)setFence
{
  sub_100134750(&__p, "");
  delegateQueue = self->_delegateQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100301D30;
  v4[3] = &unk_10229FED8;
  v4[4] = self;
  dispatch_async(delegateQueue, v4);
  if (v6 < 0) {
    operator delete(__p);
  }
}

- (void)clearFence
{
  delegateQueue = self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100302138;
  block[3] = &unk_10229FED8;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)startSession
{
  delegateQueue = self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100302490;
  block[3] = &unk_10229FED8;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)endSession
{
  delegateQueue = self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100302608;
  block[3] = &unk_10229FED8;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)didExitFence:(id)a3
{
  if ([a3 isEqualToString:self->_fenceIdStr])
  {
    self->_fenceActive = 0;
    delegateQueue = self->_delegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100302908;
    block[3] = &unk_10229FED8;
    block[4] = self;
    dispatch_async(delegateQueue, block);
  }
  else
  {
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022A58A8);
    }
    char v6 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289283;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = "";
      __int16 v14 = 2081;
      id v15 = [a3 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Got fence exit notification for an unknown fence\", \"fenceId\":%{private, location:escape_only}s}", buf, 0x1Cu);
      if (qword_102419450 != -1) {
        dispatch_once(&qword_102419450, &stru_1022A58A8);
      }
    }
    v7 = qword_102419458;
    if (os_signpost_enabled((os_log_t)qword_102419458))
    {
      id v8 = [a3 UTF8String];
      *(_DWORD *)buf = 68289283;
      int v11 = 0;
      __int16 v12 = 2082;
      v13 = "";
      __int16 v14 = 2081;
      id v15 = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Got fence exit notification for an unknown fence", "{\"msg%{public}.0s\":\"Got fence exit notification for an unknown fence\", \"fenceId\":%{private, location:escape_only}s}", buf, 0x1Cu);
    }
  }
}

- (void)didFailWithError:(int64_t)a3
{
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_1022A58A8);
  }
  v5 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68289283;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2049;
    int64_t v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Got Failure notification from Pedestrian Fence Manager with\", \"Error Code\":%{private}ld}", buf, 0x1Cu);
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022A58A8);
    }
  }
  char v6 = qword_102419458;
  if (os_signpost_enabled((os_log_t)qword_102419458))
  {
    *(_DWORD *)buf = 68289283;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2049;
    int64_t v14 = a3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Got Failure notification from Pedestrian Fence Manager with", "{\"msg%{public}.0s\":\"Got Failure notification from Pedestrian Fence Manager with\", \"Error Code\":%{private}ld}", buf, 0x1Cu);
  }
  delegateQueue = self->_delegateQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100302C5C;
  v8[3] = &unk_1022A56E0;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(delegateQueue, v8);
}

- (void)sessionStatusReport:(id)a3
{
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_1022A58A8);
  }
  v5 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2113;
    id v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMiLoPedestrianFenceClient: Received status report\", \"Status Report\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  if (self->_fenceActive)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100302EF4;
    block[3] = &unk_10229FEB0;
    block[4] = self;
    void block[5] = a3;
    dispatch_async(delegateQueue, block);
  }
  else
  {
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022A58A8);
    }
    v7 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Got status report when we didn't have an active fence -- ignoring notification", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419450 != -1) {
        dispatch_once(&qword_102419450, &stru_1022A58A8);
      }
      id v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMiLoPedestrianFenceClient sessionStatusReport:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BOOL)fenceActive
{
  return self->_fenceActive;
}

- (id)onMotionMeasurement
{
  return self->_onMotionMeasurement;
}

- (void)setOnMotionMeasurement:(id)a3
{
}

@end