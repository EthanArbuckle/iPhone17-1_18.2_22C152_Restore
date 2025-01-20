@interface CLSimulationControllerAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CLSimulationControllerAdapter)init;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (void)appendSimulatedLocations:(id)a3;
- (void)beginService;
- (void)clearSimulatedLocations;
- (void)controller;
- (void)endService;
- (void)getFencesForBundleID:(id)a3 withReply:(id)a4;
- (void)isInEmegencyState:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setController:(void *)a3;
- (void)setIntermediateLocationDistance:(double)a3;
- (void)setListener:(id)a3;
- (void)setLocationDeliveryBehavior:(unsigned __int8)a3;
- (void)setLocationInterval:(double)a3;
- (void)setLocationRepeatBehavior:(unsigned __int8)a3;
- (void)setLocationTravellingSpeed:(double)a3;
- (void)setSimulationScenario:(id)a3;
- (void)simulateBeaconWithProximityUUID:(id)a3 major:(int64_t)a4 minor:(int64_t)a5 eventType:(unsigned __int8)a6;
- (void)simulateFenceWithBundleID:(id)a3 andFenceID:(id)a4 eventType:(unsigned __int8)a5 atLocation:(id)a6;
- (void)simulateSignificantLocationChange:(id)a3;
- (void)simulateVisit:(id)a3;
- (void)startLocationSimulation;
- (void)stopLocationSimulation;
@end

@implementation CLSimulationControllerAdapter

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
  if (qword_102480920 != -1) {
    dispatch_once(&qword_102480920, &stru_1022EED28);
  }
  return (id)qword_102480918;
}

- (CLSimulationControllerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSimulationControllerAdapter;
  return [(CLSimulationControllerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLSimulationControllerProtocol outboundProtocol:&OBJC_PROTOCOL___CLSimulationControllerClientProtocol];
}

- (void)beginService
{
  if (qword_1024195A0 != -1) {
    dispatch_once(&qword_1024195A0, &stru_1022EED70);
  }
  v2 = qword_1024195A8;
  if (os_log_type_enabled((os_log_t)qword_1024195A8, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 68289026;
    v3[1] = 0;
    __int16 v4 = 2082;
    unint64_t v5 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Beginning Simulation Service\"}", (uint8_t *)v3, 0x12u);
  }
  operator new();
}

- (void)endService
{
  controller = self->_controller;
  if (controller)
  {
    sub_100C402E0((uint64_t)controller);
    operator delete();
  }
}

- (void)isInEmegencyState:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1024195A0 != -1) {
    dispatch_once(&qword_1024195A0, &stru_1022EED70);
  }
  unint64_t v5 = qword_1024195A8;
  if (os_log_type_enabled((os_log_t)qword_1024195A8, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    v8 = "";
    __int16 v9 = 1026;
    BOOL v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"received daemon-side update for isInEmegency\", \"isEmergencyState\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  sub_100C3DB74((uint64_t)self->_controller, v3);
}

- (void)stopLocationSimulation
{
  if (qword_1024195A0 != -1) {
    dispatch_once(&qword_1024195A0, &stru_1022EED70);
  }
  BOOL v3 = qword_1024195A8;
  if (os_log_type_enabled((os_log_t)qword_1024195A8, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"received daemon-side request to stop location simulation\"}", (uint8_t *)v4, 0x12u);
  }
  sub_100C3DCA4((uint64_t)self->_controller);
}

- (void)startLocationSimulation
{
  if (qword_1024195A0 != -1) {
    dispatch_once(&qword_1024195A0, &stru_1022EED70);
  }
  BOOL v3 = qword_1024195A8;
  if (os_log_type_enabled((os_log_t)qword_1024195A8, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"received daemon-side request to start location simulation\"}", (uint8_t *)v4, 0x12u);
  }
  sub_100C3DEA0((uint64_t)self->_controller);
}

- (void)setSimulationScenario:(id)a3
{
}

- (void)appendSimulatedLocations:(id)a3
{
  if (qword_1024195A0 != -1) {
    dispatch_once(&qword_1024195A0, &stru_1022EED70);
  }
  __int16 v5 = qword_1024195A8;
  if (os_log_type_enabled((os_log_t)qword_1024195A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(void *)&buf[10] = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Reveived daemon-side request to append simulated location\"}", buf, 0x12u);
  }
  v21[0] = v21;
  v21[1] = v21;
  uint64_t v22 = 0;
  if (a3)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = [a3 countByEnumeratingWithState:&v17 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(a3);
          }
          __int16 v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (v9)
          {
            [v9 clientLocation];
          }
          else
          {
            long long v29 = 0u;
            memset(v30, 0, 28);
            long long v27 = 0u;
            long long v28 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            long long v24 = 0u;
            memset(buf, 0, sizeof(buf));
          }
          BOOL v10 = operator new(0xB0uLL);
          long long v11 = v29;
          v10[7] = v28;
          v10[8] = v11;
          v10[9] = v30[0];
          *(_OWORD *)((char *)v10 + 156) = *(_OWORD *)((char *)v30 + 12);
          long long v12 = v25;
          v10[3] = v24;
          v10[4] = v12;
          long long v13 = v27;
          v10[5] = v26;
          v10[6] = v13;
          long long v14 = *(_OWORD *)&buf[16];
          v10[1] = *(_OWORD *)buf;
          v10[2] = v14;
          uint64_t v15 = v21[0];
          *(void *)BOOL v10 = v21[0];
          *((void *)v10 + 1) = v21;
          *(void *)(v15 + 8) = v10;
          v21[0] = v10;
          ++v22;
        }
        id v6 = [a3 countByEnumeratingWithState:&v17 objects:v31 count:16];
      }
      while (v6);
    }
  }
  controller = (uint64_t *)self->_controller;
  sub_100C41AEC((uint64_t)controller);
  sub_100C41644(controller, (uint64_t)v21);
  sub_1003B2350(v21);
}

- (void)clearSimulatedLocations
{
}

- (void)setLocationDeliveryBehavior:(unsigned __int8)a3
{
}

- (void)setLocationRepeatBehavior:(unsigned __int8)a3
{
}

- (void)setIntermediateLocationDistance:(double)a3
{
  double v3 = a3;
  sub_100C3E518((uint64_t)self->_controller, &v3);
}

- (void)setLocationInterval:(double)a3
{
  double v3 = a3;
  sub_100C3E64C((uint64_t)self->_controller, &v3);
}

- (void)setLocationTravellingSpeed:(double)a3
{
  double v3 = a3;
  sub_100C3E780((uint64_t)self->_controller, &v3);
}

- (void)simulateVisit:(id)a3
{
}

- (void)simulateSignificantLocationChange:(id)a3
{
}

- (void)getFencesForBundleID:(id)a3 withReply:(id)a4
{
}

- (void)simulateFenceWithBundleID:(id)a3 andFenceID:(id)a4 eventType:(unsigned __int8)a5 atLocation:(id)a6
{
}

- (void)simulateBeaconWithProximityUUID:(id)a3 major:(int64_t)a4 minor:(int64_t)a5 eventType:(unsigned __int8)a6
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  if (qword_1024195A0 != -1) {
    dispatch_once(&qword_1024195A0, &stru_1022EED70);
  }
  id v6 = qword_1024195A8;
  if (os_log_type_enabled((os_log_t)qword_1024195A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v16 = 0;
    __int16 v17 = 2082;
    long long v18 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Should accept incoming connection?\"}", buf, 0x12u);
  }
  id v7 = [a4 valueForEntitlement:@"com.apple.locationd.simulation"];
  if (v7
    && (v8 = v7, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    [(CLSimulationControllerAdapter *)self setConnection:a4];
    __int16 v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CLSimulationXPCServerInterface];
    uint64_t v10 = objc_opt_class();
    [(NSXPCInterface *)v9 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0) forSelector:"appendSimulatedLocations:" argumentIndex:0 ofReply:0];
    [a4 _setQueue:[-[CLSimulationControllerAdapter silo](self, "silo") queue]];
    [a4 setExportedInterface:v9];
    [a4 setExportedObject:self];
    [a4 resume];
    LOBYTE(v11) = 1;
  }
  else
  {
    if (qword_1024195A0 != -1) {
      dispatch_once(&qword_1024195A0, &stru_1022EED70);
    }
    long long v12 = qword_1024195A8;
    if (os_log_type_enabled((os_log_t)qword_1024195A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"unentitled client attempting to simulate location\"}", buf, 0x12u);
      if (qword_1024195A0 != -1) {
        dispatch_once(&qword_1024195A0, &stru_1022EED70);
      }
    }
    long long v13 = qword_1024195A8;
    BOOL v11 = os_signpost_enabled((os_log_t)qword_1024195A8);
    if (v11)
    {
      *(_DWORD *)buf = 68289026;
      int v16 = 0;
      __int16 v17 = 2082;
      long long v18 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "unentitled client attempting to simulate location", "{\"msg%{public}.0s\":\"unentitled client attempting to simulate location\"}", buf, 0x12u);
      LOBYTE(v11) = 0;
    }
  }
  return v11;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void)controller
{
  return self->_controller;
}

- (void)setController:(void *)a3
{
  self->_controller = a3;
}

@end