@interface CSAnomalyEventService
+ (id)generateMslUrl:(id)a3 andSessionType:(int)a4 ttrManagedMsl:(BOOL)a5;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)isKappaTrigger:(id)a3;
- (BOOL)isMartyTrigger:(id)a3;
- (BOOL)startRecordingWithTTRManagedMsl:(BOOL)a3 andPreempt:(BOOL)a4;
- (CSAnomalyEventService)init;
- (CSCompanionServiceProtocol)companionProxy;
- (id).cxx_construct;
- (void)abortSession;
- (void)beginService;
- (void)didInitWithUnprocessedCrash:(id)a3 withCompanionUUID:(id)a4;
- (void)didReceiveSOSAck:(int64_t)a3 forMode:(unsigned __int8)a4;
- (void)didReceiveSOSStatusUpdate:(id)a3 forMode:(unsigned __int8)a4;
- (void)endService;
- (void)feedSortedSamples:(id)a3;
- (void)finishSession;
- (void)handleConnection:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)onCompanionConnectionStatusUpdate:(int)a3 cftime:(double)a4 sputime:(unint64_t)a5;
- (void)onCompanionMessage:(int)a3 data:(id)a4 receivedTimestamp:(double)a5;
- (void)onCompanionStatusUpdate:(BOOL)a3 pairedDevice:(id)a4 updatedTimestamp:(double)a5;
- (void)replyToXPCMessage;
- (void)requestLocation:(int)a3;
- (void)setForcedCompanionTrigger:(unsigned __int8)a3;
- (void)setPreTriggerForcedCompanionTrigger;
- (void)setupXPCHandler;
- (void)sosActivated;
- (void)startIgneousUploader;
- (void)startUploader;
- (void)triggered:(id)a3;
- (void)uploadRecording:(id)a3;
@end

@implementation CSAnomalyEventService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v5 = a4 + 1;
  if (v5 < (unint64_t)[v6 count]) {
    [objc_msgSend(v6, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:v6 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1003DD710 != -1) {
    dispatch_once(&qword_1003DD710, &stru_1003B3DF0);
  }
  v2 = (void *)qword_1003DD708;

  return v2;
}

- (CSAnomalyEventService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSAnomalyEventService;
  return [(CSAnomalyEventService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CSAnomalyEventServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CSAnomalyEventServiceClientProtocol];
}

- (void)replyToXPCMessage
{
  if (qword_1003DB7F0 != -1) {
    dispatch_once(&qword_1003DB7F0, &stru_1003B3E38);
  }
  objc_super v3 = qword_1003DB7F8;
  if (os_log_type_enabled((os_log_t)qword_1003DB7F8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "replyToXPCMessage", buf, 2u);
  }
  while ([(NSMutableArray *)self->_replyList count])
  {
    v4 = [(NSMutableArray *)self->_replyList objectAtIndex:0];
    xpc_dictionary_send_reply();
    [(NSMutableArray *)self->_replyList removeObjectAtIndex:0];
    if (qword_1003DB7F0 != -1) {
      dispatch_once(&qword_1003DB7F0, &stru_1003B3E38);
    }
    unint64_t v5 = qword_1003DB7F8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7F8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "replying to xpc request", v8, 2u);
    }
  }
  [(NSMutableArray *)self->_connectionList removeAllObjects];
  if (self->_releasePowerAssertionXPCRefCount >= 1)
  {
    do
    {
      [(CSPower *)self->_powerAssertion releasePowerAssertion];
      int releasePowerAssertionXPCRefCount = self->_releasePowerAssertionXPCRefCount;
      BOOL v7 = __OFSUB__(releasePowerAssertionXPCRefCount--, 1);
      self->_int releasePowerAssertionXPCRefCount = releasePowerAssertionXPCRefCount;
    }
    while (!((releasePowerAssertionXPCRefCount < 0) ^ v7 | (releasePowerAssertionXPCRefCount == 0)));
  }
}

- (void)handleConnection:(id)a3
{
  v4 = (_xpc_connection_s *)a3;
  objc_initWeak(&location, self);
  if (qword_1003DB7F0 != -1) {
    dispatch_once(&qword_1003DB7F0, &stru_1003B3E38);
  }
  unint64_t v5 = qword_1003DB7F8;
  if (os_log_type_enabled((os_log_t)qword_1003DB7F8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "handleConnection", buf, 2u);
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1002965C4;
  handler[3] = &unk_1003B3E18;
  objc_copyWeak(&v7, &location);
  xpc_connection_set_event_handler(v4, handler);
  xpc_connection_activate(v4);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)setupXPCHandler
{
  if (qword_1003DB7F0 != -1) {
    dispatch_once(&qword_1003DB7F0, &stru_1003B3E38);
  }
  objc_super v3 = qword_1003DB7F8;
  if (os_log_type_enabled((os_log_t)qword_1003DB7F8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "setupXPCHandler", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  self->_int releasePowerAssertionXPCRefCount = 0;
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Anomalydetectiond", 0);
  triggerDispatchQueue = self->_triggerDispatchQueue;
  self->_triggerDispatchQueue = v4;

  mach_service = xpc_connection_create_mach_service("com.apple.anomalydetectiond.trigger", (dispatch_queue_t)self->_triggerDispatchQueue, 1uLL);
  triggerListener = self->_triggerListener;
  self->_triggerListener = mach_service;

  v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  replyList = self->_replyList;
  self->_replyList = v8;

  v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  connectionList = self->_connectionList;
  self->_connectionList = v10;

  v12 = self->_triggerListener;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100296AB0;
  handler[3] = &unk_1003B3E18;
  objc_copyWeak(&v14, buf);
  xpc_connection_set_event_handler(v12, handler);
  xpc_connection_activate(self->_triggerListener);
  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);
}

- (void)beginService
{
  if (qword_1003DB680 != -1) {
    dispatch_once(&qword_1003DB680, &stru_1003B3E58);
  }
  v2 = qword_1003DB688;
  if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "beginService", buf, 2u);
  }
  operator new();
}

- (void)endService
{
  if (qword_1003DB680 != -1) {
    dispatch_once(&qword_1003DB680, &stru_1003B3E58);
  }
  v2 = qword_1003DB688;
  if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "endService", v3, 2u);
  }
}

- (BOOL)isKappaTrigger:(id)a3
{
  id v3 = a3;
  if ((*((unsigned char *)objc_msgSend(v3, "c_struct") + 1) & 1) != 0
    || (*((unsigned char *)objc_msgSend(v3, "c_struct") + 1) & 2) != 0
    || (*((unsigned char *)objc_msgSend(v3, "c_struct") + 1) & 4) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    BOOL v4 = (((*((unsigned __int8 *)[v3 c_struct]) + 1) >> 3) & 1);
  }

  return v4;
}

- (BOOL)isMartyTrigger:(id)a3
{
  id v3 = a3;
  if ((*((unsigned char *)objc_msgSend(v3, "c_struct") + 46) & 4) != 0
    || (*((unsigned char *)objc_msgSend(v3, "c_struct") + 46) & 8) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v4 = *((unsigned char *)[v3 c_struct] + 46) & 1;
  }

  return v4;
}

+ (id)generateMslUrl:(id)a3 andSessionType:(int)a4 ttrManagedMsl:(BOOL)a5
{
  BOOL v5 = a5;
  char v6 = a4;
  id v7 = a3;
  if ((v6 & 3) != 0)
  {
    NSTemporaryDirectory();
    if (v5) {
      v8 = {;
    }
      v9 = +[NSURL URLWithString:v8];

      [v9 URLByAppendingPathComponent:@"kappaOutTTR"];
    }
    else {
      v11 = {;
    }
      v9 = +[NSURL URLWithString:v11];

      [v9 URLByAppendingPathComponent:@"kappaOut"];
    v10 = };
  }
  else
  {
    if ((v6 & 4) == 0)
    {
      v10 = 0;
      goto LABEL_10;
    }
    v12 = NSTemporaryDirectory();
    v13 = [v12 stringByAppendingPathComponent:@"igneousOut"];
    uint64_t v14 = +[NSURL URLWithString:v13];

    v9 = v12;
    v10 = (void *)v14;
  }

LABEL_10:
  v15 = [v10 URLByAppendingPathComponent:v7 isDirectory:0];
  v16 = [v15 URLByAppendingPathExtension:@"msl"];

  return v16;
}

- (BOOL)startRecordingWithTTRManagedMsl:(BOOL)a3 andPreempt:(BOOL)a4
{
  uint64_t mslRecording = 80;
  uuid = self->_uuid;
  if (!uuid)
  {
    sub_10029AD38();
    __break(1u);
    goto LABEL_22;
  }
  BOOL v8 = a3;
  if (!a4)
  {
    if (CSAOPSvc::isRecording((CSAOPSvc *)self->_aop))
    {
      if (qword_1003DB680 != -1) {
        dispatch_once(&qword_1003DB680, &stru_1003B3E58);
      }
      v9 = qword_1003DB688;
      if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v18) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "cannot start when a recording is already in progress", (uint8_t *)&v18, 2u);
      }
      BOOL v10 = 0;
      uint64_t mslRecording = (uint64_t)self->_mslRecording;
      self->_uint64_t mslRecording = 0;
      goto LABEL_20;
    }
    uuid = self->_uuid;
  }
  v11 = [(NSUUID *)uuid UUIDString];
  uint64_t mslRecording = +[CSAnomalyEventService generateMslUrl:v11 andSessionType:self->_sessionType ttrManagedMsl:v8];

  v12 = [[CSMSLDataRecording alloc] initWithURL:mslRecording];
  uint64_t v4 = 88;
  v13 = self->_mslRecording;
  self->_uint64_t mslRecording = v12;

  [(CSMSLDataRecording *)self->_mslRecording setTtrManagedMsl:v8];
  if (self->_mslRecording)
  {
    if (qword_1003DB680 == -1)
    {
LABEL_12:
      uint64_t v14 = qword_1003DB688;
      if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)&self->CLIntersiloService_opaque[v4];
        int v18 = 134218242;
        uint64_t v19 = v15;
        __int16 v20 = 2114;
        uint64_t v21 = mslRecording;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Recording to %p %{public}@", (uint8_t *)&v18, 0x16u);
      }
      BOOL v10 = 1;
      goto LABEL_20;
    }
LABEL_22:
    dispatch_once(&qword_1003DB680, &stru_1003B3E58);
    goto LABEL_12;
  }
  if (qword_1003DB680 != -1) {
    dispatch_once(&qword_1003DB680, &stru_1003B3E58);
  }
  v16 = qword_1003DB688;
  if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_FAULT))
  {
    int v18 = 138543362;
    uint64_t v19 = mslRecording;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "Unable to open msl recording at %{public}@", (uint8_t *)&v18, 0xCu);
  }
  BOOL v10 = 0;
LABEL_20:

  return v10;
}

- (void)triggered:(id)a3
{
  id v4 = a3;
  int v5 = *((unsigned __int8 *)[v4 c_struct] + 1);
  int v6 = *((unsigned __int8 *)[v4 c_struct] + 46);
  int v7 = *((unsigned __int8 *)[v4 c_struct] + 64);
  [(CSAnomalyEventService *)self setPreTriggerForcedCompanionTrigger];
  if (qword_1003DB680 != -1) {
    dispatch_once(&qword_1003DB680, &stru_1003B3E58);
  }
  BOOL v8 = (id)qword_1003DB688;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v56 = v5;
    int v9 = v6;
    int v10 = v7;
    int v11 = *((unsigned __int8 *)[v4 c_struct] + 1);
    int v12 = *((unsigned __int8 *)[v4 c_struct] + 46);
    int v13 = *((unsigned __int8 *)[v4 c_struct] + 64);
    int v14 = *((unsigned __int8 *)[v4 c_struct] + 47);
    int v15 = *((unsigned __int8 *)[v4 c_struct] + 93);
    int v16 = *((unsigned __int8 *)[v4 c_struct] + 92);
    *(_DWORD *)buf = 67110400;
    LODWORD(v62) = v11;
    WORD2(v62) = 1024;
    *(_DWORD *)((char *)&v62 + 6) = v12;
    WORD5(v62) = 1024;
    HIDWORD(v62) = v13;
    __int16 v63 = 1024;
    int v64 = v14;
    __int16 v65 = 1024;
    int v66 = v15;
    __int16 v67 = 1024;
    int v68 = v16;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "triggered: trigger path %d marty path %d igneous path %d enabledMode %d overrideMode %d locallyArmed %d", buf, 0x26u);
    int v7 = v10;
    int v6 = v9;
    int v5 = v56;
  }

  v17 = +[CSPermissions sharedInstance];
  *((unsigned char *)self->_details.__ptr_.__value_ + 26) = [v17 isAuthorizedToCollectData];

  *((unsigned char *)self->_details.__ptr_.__value_ + 28) = *((unsigned char *)self->_details.__ptr_.__value_ + 26);
  int v18 = +[CSPlatformInfo sharedInstance];
  *((unsigned char *)self->_details.__ptr_.__value_ + 27) = [v18 isInternalInstall];

  if (v5 && [(CSAnomalyEventService *)self isKappaTrigger:v4])
  {
    uint64_t v19 = 0;
    uint64_t v20 = 1;
  }
  else if (v6)
  {
    value = self->_details.__ptr_.__value_;
    if (*((unsigned char *)value + 27))
    {
      uint64_t v19 = 1;
      *((unsigned char *)value + 26) = 1;
    }
    else
    {
      uint64_t v19 = 0;
    }
    uint64_t v20 = 2;
  }
  else if (v7)
  {
    uint64_t v19 = 0;
    uint64_t v20 = 4;
  }
  else
  {
    if (qword_1003DB680 != -1) {
      dispatch_once(&qword_1003DB680, &stru_1003B3E58);
    }
    v31 = qword_1003DB688;
    if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "no path set, invalid trigger", buf, 2u);
    }
    uint64_t v19 = 0;
    uint64_t v20 = 0;
  }
  v22 = self->_details.__ptr_.__value_;
  if (!*((unsigned char *)v22 + 25))
  {
LABEL_42:
    ++self->_sessionNum;
    *((unsigned char *)v22 + 25) = 1;
    self->_int sessionType = v20;
    if (qword_1003DB680 != -1) {
      dispatch_once(&qword_1003DB680, &stru_1003B3E58);
    }
    v33 = qword_1003DB688;
    if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
    {
      int sessionNum = self->_sessionNum;
      *(_DWORD *)buf = 67109376;
      LODWORD(v62) = sessionNum;
      WORD2(v62) = 1024;
      *(_DWORD *)((char *)&v62 + 6) = v20;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "starting session %d type=%d", buf, 0xEu);
    }
    v35 = +[NSUUID UUID];
    uuid = self->_uuid;
    self->_uuid = v35;

    if (v20 == 1)
    {
      if ([(CSKappaDetectionService *)self->_kappaDetectionService isIdle])
      {
        uint64_t v37 = 1;
        goto LABEL_55;
      }
    }
    else
    {
      if (v20 != 2)
      {
        if ((v20 - 1) >= 2)
        {
          if (v20 != 4)
          {
            uint64_t v37 = v20;
            goto LABEL_70;
          }
          int IgneousToken = getIgneousToken(0);
          BOOL v40 = IgneousToken != 0;
          if (!IgneousToken) {
            self->_stopClientCollection = 1;
          }
          self->_stopClientDetection = 1;
          self->_apTriggerTimestamp = CFAbsoluteTimeGetCurrent();
          uint64_t v37 = 4;
          if (!v40) {
            goto LABEL_70;
          }
LABEL_55:
          if (*((unsigned char *)self->_details.__ptr_.__value_ + 26)
            && [(CSAnomalyEventService *)self startRecordingWithTTRManagedMsl:v19 andPreempt:0])
          {
            if (v20 == 1)
            {
              v38 = &OBJC_IVAR___CSAnomalyEventService__kappaDetectionService;
            }
            else
            {
              if (v37 == 4)
              {
                if (*((unsigned char *)objc_msgSend(v4, "c_struct") + 64))
                {
                  v49 = sub_100297210();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                  {
                    int v50 = *((unsigned __int8 *)[v4 c_struct] + 64);
                    v51 = (char *)[v4 c_struct];
                    *(_DWORD *)buf = 67109378;
                    LODWORD(v62) = v50;
                    WORD2(v62) = 2080;
                    *(void *)((char *)&v62 + 6) = v51 + 65;
                    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "igneous trigger path %d with guid %s", buf, 0x12u);
                  }

                  uint64_t mslRecording = self->_mslRecording;
                  v59[0] = @"igneousGUID";
                  v53 = [NSString stringWithUTF8String:((char *)[v4 c_struct] + 65)];
                  v60[0] = v53;
                  v59[1] = @"igneousPath";
                  v54 = [NSNumber numberWithUnsignedChar:*((unsigned __int8 *)[v4 c_struct] + 64)];
                  v59[2] = @"shouldUploadIndependentlyOfSOS";
                  v60[1] = v54;
                  v60[2] = &off_1003C1A88;
                  v55 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:3];
                  [(CSMSLDataRecording *)mslRecording updateMetadata:v55];
                }
                goto LABEL_68;
              }
              if (v37 != 2)
              {
LABEL_68:
                CSAOPSvc::setRecording((id *)self->_aop, self->_mslRecording, self->_uuid, 0);
LABEL_75:
                [(CSAnomalyEventService *)self requestLocation:v37];
                v42 = self->_mslRecording;
                CFStringRef v57 = @"sessionType";
                v43 = +[NSNumber numberWithInt:self->_sessionType];
                v58 = v43;
                v44 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
                [(CSMSLDataRecording *)v42 updateMetadata:v44];

                if (qword_1003DB680 != -1) {
                  dispatch_once(&qword_1003DB680, &stru_1003B3E58);
                }
                v45 = (id)qword_1003DB688;
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                {
                  int v46 = *((unsigned __int8 *)[v4 c_struct] + 1);
                  *(_DWORD *)buf = 67109120;
                  LODWORD(v62) = v46;
                  _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "got a trigger path %d", buf, 8u);
                }

                goto LABEL_80;
              }
              v38 = &OBJC_IVAR___CSAnomalyEventService__martyDetectionService;
            }
            [*(id *)&self->CLIntersiloService_opaque[*v38] setRecording:self->_mslRecording withUUID:self->_uuid];
            goto LABEL_68;
          }
LABEL_70:
          if (qword_1003DB680 != -1) {
            dispatch_once(&qword_1003DB680, &stru_1003B3E58);
          }
          v41 = qword_1003DB688;
          if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v62) = v37;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "cannot collect recording for %d", buf, 8u);
          }
          [(CSKappaDetectionService *)self->_kappaDetectionService setRecording:0 withUUID:self->_uuid];
          [(CSMartyDetectionService *)self->_martyDetectionService setRecording:0 withUUID:self->_uuid];
          CSAOPSvc::setRecording((id *)self->_aop, 0, self->_uuid, 0);
          goto LABEL_75;
        }
LABEL_54:
        uint64_t v37 = v20;
        goto LABEL_55;
      }
      if ([(CSMartyDetectionService *)self->_martyDetectionService isIdle])
      {
        uint64_t v37 = 2;
        goto LABEL_55;
      }
    }
    *((unsigned char *)self->_details.__ptr_.__value_ + 26) = 0;
    goto LABEL_54;
  }
  if ((v20 & 1) != 0 && self->_sessionType != 1 && !*((unsigned char *)v22 + 24))
  {
    if (qword_1003DB680 != -1) {
      dispatch_once(&qword_1003DB680, &stru_1003B3E58);
    }
    v23 = qword_1003DB688;
    if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEFAULT))
    {
      int sessionType = self->_sessionType;
      *(_DWORD *)buf = 67109120;
      LODWORD(v62) = sessionType;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "converting session %d into a kappa one", buf, 8u);
    }
    if (self->_sessionType == 2)
    {
      if (qword_1003DB680 != -1) {
        dispatch_once(&qword_1003DB680, &stru_1003B3E58);
      }
      v25 = qword_1003DB688;
      if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "aborting marty detection service", buf, 2u);
      }
      [(CSMartyDetectionService *)self->_martyDetectionService abortSession];
    }
    v26 = self->_mslRecording;
    self->_uint64_t mslRecording = 0;

    self->_int sessionType = 1;
    *((unsigned char *)self->_details.__ptr_.__value_ + 24) = 1;
    v27 = +[NSUUID UUID];
    v28 = self->_uuid;
    self->_uuid = v27;

    if (*((unsigned char *)self->_details.__ptr_.__value_ + 26))
    {
      [(CSAnomalyEventService *)self startRecordingWithTTRManagedMsl:v19 andPreempt:1];
      if (qword_1003DB680 != -1) {
        dispatch_once(&qword_1003DB680, &stru_1003B3E58);
      }
      v29 = qword_1003DB688;
      if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEFAULT))
      {
        v30 = self->_uuid;
        *(_DWORD *)buf = 138412290;
        *(void *)&long long v62 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "creating new recording for preemption %@", buf, 0xCu);
      }
    }
    else
    {
      v32 = self->_mslRecording;
      self->_uint64_t mslRecording = 0;
    }
    CSAOPSvc::restartSession((CSAOPSvc *)self->_aop, self->_mslRecording);
    [(CSKappaDetectionService *)self->_kappaDetectionService setRecording:self->_mslRecording withUUID:self->_uuid];
    v22 = self->_details.__ptr_.__value_;
    if (!*((unsigned char *)v22 + 25))
    {
      uint64_t v20 = 1;
      goto LABEL_42;
    }
  }
LABEL_80:
  int v47 = self->_sessionType;
  if (v47 == 1)
  {
    if ([(CSAnomalyEventService *)self isKappaTrigger:v4])
    {
      v48 = &OBJC_IVAR___CSAnomalyEventService__kappaDetectionService;
LABEL_87:
      [*(id *)&self->CLIntersiloService_opaque[*v48] triggered:v4];
      goto LABEL_88;
    }
    int v47 = self->_sessionType;
  }
  if (v47 == 2 && [(CSAnomalyEventService *)self isMartyTrigger:v4])
  {
    v48 = &OBJC_IVAR___CSAnomalyEventService__martyDetectionService;
    goto LABEL_87;
  }
LABEL_88:
}

- (void)sosActivated
{
  [(CSKappaDetectionService *)self->_kappaDetectionService sosActivated];
  martyDetectionService = self->_martyDetectionService;

  [(CSMartyDetectionService *)martyDetectionService sosActivated];
}

- (void)feedSortedSamples:(id)a3
{
  id v4 = a3;
  int sessionType = self->_sessionType;
  if (sessionType == 4)
  {
    CSAOPSvc::stopDetection((uint64_t)self->_aop);
  }
  else
  {
    if (sessionType == 2)
    {
      p_martyDetectionService = (id *)&self->_martyDetectionService;
      unsigned __int8 v7 = [(CSMartyDetectionService *)self->_martyDetectionService isIdle];
    }
    else
    {
      if (sessionType != 1) {
        goto LABEL_10;
      }
      p_martyDetectionService = (id *)&self->_kappaDetectionService;
      unsigned __int8 v7 = [(CSKappaDetectionService *)self->_kappaDetectionService isIdle];
    }
    if (v7) {
      self->_stopClientDetection = 1;
    }
    else {
      [*p_martyDetectionService feedSortedSamples:v4];
    }
  }
LABEL_10:
  if (self->_stopClientDetection)
  {
    if (qword_1003DB680 != -1) {
      dispatch_once(&qword_1003DB680, &stru_1003B3E58);
    }
    BOOL v8 = qword_1003DB688;
    if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "stopping detection", buf, 2u);
    }
    CSAOPSvc::stopDetection((uint64_t)self->_aop);
    self->_stopClientDetection = 0;
  }
  if (self->_stopClientCollection)
  {
    if (qword_1003DB680 != -1) {
      dispatch_once(&qword_1003DB680, &stru_1003B3E58);
    }
    int v9 = qword_1003DB688;
    if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "stopping collection", v10, 2u);
    }
    CSAOPSvc::stopCollection((uint64_t)self->_aop);
    self->_stopClientCollection = 0;
  }
}

- (void)startUploader
{
  id v3 = +[NSFileManager defaultManager];
  id v4 = NSTemporaryDirectory();
  int v5 = [v4 stringByAppendingPathComponent:@"studiesServerUploaderSpooler"];
  [v3 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:0];

  int v6 = +[CSPersistentConfiguration sharedConfiguration];
  uint64_t v7 = (uint64_t)[v6 integerForKey:@"KappaDetectionServiceUploaderOverrideRetentionPeriod"];

  if (!v7) {
    uint64_t v7 = 2592000;
  }
  BOOL v8 = +[CSPersistentConfiguration sharedConfiguration];
  [v8 doubleForKey:@"KappaDetectionServiceOOBTimeoutOverride"];
  double v10 = v9;

  if (v10 == 0.0) {
    double v10 = 900.0;
  }
  int v11 = [CSStudiesServerUploader alloc];
  int v12 = NSTemporaryDirectory();
  int v13 = [v12 stringByAppendingPathComponent:@"studiesServerUploaderSpooler"];
  int v14 = +[CSStudiesServerConfiguration persistentConfiguration];
  int v15 = [(CSStudiesServerUploader *)v11 initWithSpoolerFolder:v13 serverConfiguration:v14 registrationPeriodInSeconds:v7 retentionPeriodInSeconds:v7 outOfBandMetadataTimeout:&stru_1003BC4E8 defaultsKeyPostfix:v10];
  uploader = self->_uploader;
  self->_uploader = v15;

  [(CSKappaDetectionService *)self->_kappaDetectionService setUploader:self->_uploader];
  [(CSMartyDetectionService *)self->_martyDetectionService setUploader:self->_uploader];
  v17 = self->_uploader;
  id v21 = 0;
  unsigned int v18 = [(CSStudiesServerUploader *)v17 startMonitoringWithError:&v21];
  id v19 = v21;
  if (qword_1003DB680 != -1) {
    dispatch_once(&qword_1003DB680, &stru_1003B3E58);
  }
  uint64_t v20 = qword_1003DB688;
  if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240450;
    unsigned int v23 = v18;
    __int16 v24 = 2114;
    id v25 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Start monitoring: %{public}d %{public}@", buf, 0x12u);
  }
}

- (void)startIgneousUploader
{
  id v3 = +[NSFileManager defaultManager];
  id v4 = NSTemporaryDirectory();
  int v5 = [v4 stringByAppendingPathComponent:@"studiesServerUploaderSpoolerIgneous"];
  [v3 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:0];

  int v6 = +[CSPersistentConfiguration sharedConfiguration];
  uint64_t v7 = (uint64_t)[v6 integerForKey:@"KappaDetectionServiceUploaderOverrideRetentionPeriod"];

  if (!v7) {
    uint64_t v7 = 2592000;
  }
  BOOL v8 = +[CSPersistentConfiguration sharedConfiguration];
  [v8 doubleForKey:@"KappaDetectionServiceOOBTimeoutOverride"];
  double v10 = v9;

  if (v10 == 0.0) {
    double v10 = 900.0;
  }
  int v11 = [CSStudiesServerUploader alloc];
  int v12 = NSTemporaryDirectory();
  int v13 = [v12 stringByAppendingPathComponent:@"studiesServerUploaderSpoolerIgneous"];
  int v14 = +[CSStudiesServerConfiguration persistentConfigurationIgneous];
  int v15 = [(CSStudiesServerUploader *)v11 initWithSpoolerFolder:v13 serverConfiguration:v14 registrationPeriodInSeconds:0 retentionPeriodInSeconds:v7 outOfBandMetadataTimeout:@"Igneous" defaultsKeyPostfix:v10];
  igneousUploader = self->_igneousUploader;
  self->_igneousUploader = v15;

  v17 = self->_igneousUploader;
  id v21 = 0;
  unsigned int v18 = [(CSStudiesServerUploader *)v17 startMonitoringWithError:&v21];
  id v19 = v21;
  if (qword_1003DB680 != -1) {
    dispatch_once(&qword_1003DB680, &stru_1003B3E58);
  }
  uint64_t v20 = qword_1003DB688;
  if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240450;
    unsigned int v23 = v18;
    __int16 v24 = 2114;
    id v25 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Start igneous monitoring: %{public}d %{public}@", buf, 0x12u);
  }
}

- (void)uploadRecording:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc((Class)NSMutableDictionary);
    int v5 = [v3 metadata];
    id v6 = [v4 initWithCapacity:[v5 count]];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v7 = [v3 metadata];
    id v8 = [v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v38;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v38 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          int v12 = [v3 metadata];
          int v13 = [v12 objectForKey:v11];
          int v14 = [v13 description];
          [v6 setObject:v14 forKeyedSubscript:v11];
        }
        id v8 = [v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v8);
    }

    int sessionType = self->_sessionType;
    if ((sessionType - 1) >= 2)
    {
      if (sessionType != 4)
      {
        if (qword_1003DB680 != -1) {
          dispatch_once(&qword_1003DB680, &stru_1003B3E58);
        }
        v29 = qword_1003DB688;
        if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "no metadata type specified", buf, 2u);
        }
        goto LABEL_42;
      }
      int v16 = [CSStudiesServerUploadMetadata alloc];
      CFStringRef v17 = @"IgneousDetectionService";
    }
    else
    {
      int v16 = [CSStudiesServerUploadMetadata alloc];
      CFStringRef v17 = @"DetectionService";
    }
    id v19 = [(CSStudiesServerUploadMetadata *)v16 initWithPayloadType:@"KappaMSL" channel:v17 keyValuePairs:v6];
    int v20 = self->_sessionType;
    if ((v20 - 1) >= 2)
    {
      if (v20 != 4)
      {
        id v28 = 0;
        unsigned int v27 = 0;
LABEL_32:
        if (qword_1003DB680 != -1) {
          dispatch_once(&qword_1003DB680, &stru_1003B3E58);
        }
        v32 = qword_1003DB688;
        if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67240450;
          LODWORD(v42[0]) = v27;
          WORD2(v42[0]) = 2114;
          *(void *)((char *)v42 + 6) = v28;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Enqueue for upload: success,%{public}d error,%{public}@", buf, 0x12u);
        }
        if (v28)
        {
          if (qword_1003DB680 != -1) {
            dispatch_once(&qword_1003DB680, &stru_1003B3E58);
          }
          v33 = qword_1003DB688;
          if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v42[0] = v28;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "error %{public}@", buf, 0xCu);
          }
        }

LABEL_42:
        goto LABEL_43;
      }
      igneousUploader = self->_igneousUploader;
      v22 = [v3 url];
      v26 = [v22 path];
      id v35 = 0;
      unsigned int v27 = [(CSStudiesServerUploader *)igneousUploader enqueueFileWithFilename:v26 andMetadata:v19 error:&v35];
      id v28 = v35;
    }
    else
    {
      id v21 = [v3 url];
      v22 = [v21 path];

      if (self->_sessionType == 2)
      {
        unsigned int v23 = [v3 urlToCopyToOnStop];
        if (v23) {
          [v3 urlToCopyToOnStop];
        }
        else {
        __int16 v24 = [v3 url];
        }
        uint64_t v30 = [v24 path];

        v22 = (void *)v30;
      }
      uploader = self->_uploader;
      id v36 = 0;
      unsigned int v27 = [(CSStudiesServerUploader *)uploader enqueueFileWithFilename:v22 andMetadata:v19 error:&v36];
      id v28 = v36;
    }

    goto LABEL_32;
  }
  if (qword_1003DB680 != -1) {
    dispatch_once(&qword_1003DB680, &stru_1003B3E58);
  }
  unsigned int v18 = qword_1003DB688;
  if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "cannot upload a nil recording", buf, 2u);
  }
LABEL_43:
}

- (void)abortSession
{
  if (qword_1003DB680 != -1) {
    dispatch_once(&qword_1003DB680, &stru_1003B3E58);
  }
  id v3 = qword_1003DB688;
  if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "aborting session", v5, 2u);
  }
  uint64_t mslRecording = self->_mslRecording;
  self->_uint64_t mslRecording = 0;
}

- (void)finishSession
{
  if (qword_1003DB680 != -1) {
    dispatch_once(&qword_1003DB680, &stru_1003B3E58);
  }
  id v3 = qword_1003DB688;
  if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
  {
    int sessionNum = self->_sessionNum;
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = sessionNum;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "finish session %d", buf, 8u);
  }
  if (self->_sessionType == 4)
  {
    uint64_t mslRecording = self->_mslRecording;
    CFStringRef v30 = @"apTriggerTimestamp";
    id v6 = +[NSNumber numberWithDouble:self->_apTriggerTimestamp];
    v31 = v6;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    [(CSMSLDataRecording *)mslRecording updateMetadata:v7];

    if ((int)getIgneousToken(0) >= 1)
    {
      if (qword_1003DB680 != -1) {
        dispatch_once(&qword_1003DB680, &stru_1003B3E58);
      }
      id v8 = qword_1003DB688;
      if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "acquiring igneous token", buf, 2u);
      }
      getIgneousToken(1);
    }
  }
  uint64_t v9 = +[CSPersistentConfiguration sharedConfiguration];
  id v10 = [v9 integerForKey:@"ServerConfigVersion"];

  value = self->_details.__ptr_.__value_;
  if (*((unsigned char *)value + 1)) {
    uint64_t v12 = *(unsigned char *)value | 2u;
  }
  else {
    uint64_t v12 = *(unsigned char *)value;
  }
  int v13 = self->_mslRecording;
  v28[0] = @"kappaTokenCount";
  int v14 = +[NSNumber numberWithInt:getKappaToken(0)];
  v29[0] = v14;
  v28[1] = @"martyTokenCount";
  id v25 = +[NSNumber numberWithInt:getMartyToken(0)];
  v29[1] = v25;
  v28[2] = @"igneousTokenCount";
  int v15 = +[NSNumber numberWithInt:getIgneousToken(0)];
  v29[2] = v15;
  v28[3] = @"configServerVersionNumber";
  int v16 = +[NSNumber numberWithInteger:v10];
  v29[3] = v16;
  v28[4] = @"convertToKappa";
  CFStringRef v17 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_details.__ptr_.__value_ + 24)];
  v29[4] = v17;
  v28[5] = @"companionForceTriggered";
  unsigned int v18 = +[NSNumber numberWithInt:v12];
  v29[5] = v18;
  id v19 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];
  [(CSMSLDataRecording *)v13 updateMetadata:v19];

  int v20 = self->_mslRecording;
  if (v20)
  {
    [(CSMSLDataRecording *)v20 stopAndKeep:1];
    [(CSMSLDataRecording *)self->_mslRecording dumpMetadata];
    if (*((unsigned char *)self->_details.__ptr_.__value_ + 28))
    {
      if ([(CSMSLDataRecording *)self->_mslRecording shouldUpload])
      {
        if (qword_1003DB680 != -1) {
          dispatch_once(&qword_1003DB680, &stru_1003B3E58);
        }
        id v21 = (id)qword_1003DB688;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = [(CSMSLDataRecording *)self->_mslRecording url];
          unsigned int v23 = [v22 path];
          *(_DWORD *)buf = 138412290;
          unsigned int v27 = v23;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "enqueuing recording %@", buf, 0xCu);
        }
        [(CSAnomalyEventService *)self uploadRecording:self->_mslRecording];
      }
    }
  }
  __int16 v24 = self->_mslRecording;
  self->_uint64_t mslRecording = 0;

  self->_int sessionType = 0;
  self->_stopClientDetection = 0;
  self->_stopClientCollection = 0;
  operator new();
}

- (void)onCompanionStatusUpdate:(BOOL)a3 pairedDevice:(id)a4 updatedTimestamp:(double)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  if (qword_1003DB680 != -1) {
    dispatch_once(&qword_1003DB680, &stru_1003B3E58);
  }
  id v8 = qword_1003DB688;
  if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 67109376;
    *(_DWORD *)int v16 = v6;
    *(_WORD *)&v16[4] = 2048;
    *(double *)&v16[6] = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "onCompanionStatusUpdate: isConnected: %d, updatedTimestamp: %f", (uint8_t *)&v15, 0x12u);
  }
  if (qword_1003DB680 != -1) {
    dispatch_once(&qword_1003DB680, &stru_1003B3E58);
  }
  uint64_t v9 = (id)qword_1003DB688;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = [v7 name];
    id v11 = [v10 UTF8String];
    unsigned int v12 = [v7 isNearby];
    unsigned int v13 = [v7 isDefaultPairedDevice];
    unsigned int v14 = [v7 isConnected];
    int v15 = 136315906;
    *(void *)int v16 = v11;
    *(_WORD *)&v16[8] = 1024;
    *(_DWORD *)&v16[10] = v12;
    __int16 v17 = 1024;
    unsigned int v18 = v13;
    __int16 v19 = 1024;
    unsigned int v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Paired device info: name %s, isNearby %d, isDefaultPairedDevice %d, isConnected %d", (uint8_t *)&v15, 0x1Eu);
  }
}

- (void)setForcedCompanionTrigger:(unsigned __int8)a3
{
  int v3 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  if (*((unsigned char *)self->_details.__ptr_.__value_ + 25))
  {
    if (v3 != 2)
    {
      if (v3 == 1)
      {
        if (qword_1003DB680 != -1) {
          dispatch_once(&qword_1003DB680, &stru_1003B3E58);
        }
        BOOL v6 = qword_1003DB688;
        if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "setting forced kappa trigger", buf, 2u);
        }
        *(unsigned char *)self->_details.__ptr_.__value_ = 1;
        return;
      }
      sub_10029AF88();
LABEL_27:
      id v11 = (CSAnomalyEventService *)sub_10029AE64();
      [(CSAnomalyEventService *)v11 setPreTriggerForcedCompanionTrigger];
      return;
    }
    if (qword_1003DB680 != -1) {
      dispatch_once(&qword_1003DB680, &stru_1003B3E58);
    }
    uint64_t v9 = qword_1003DB688;
    if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "setting forced marty trigger", v15, 2u);
    }
    *((unsigned char *)self->_details.__ptr_.__value_ + 1) = 1;
  }
  else
  {
    double v7 = Current;
    if (v3 == 2)
    {
      if (qword_1003DB680 != -1) {
        dispatch_once(&qword_1003DB680, &stru_1003B3E58);
      }
      id v10 = qword_1003DB688;
      if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)unsigned int v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "setting forced marty trigger ts", v13, 2u);
      }
      *((double *)self->_details.__ptr_.__value_ + 2) = v7;
    }
    else
    {
      if (v3 != 1) {
        goto LABEL_27;
      }
      if (qword_1003DB680 != -1) {
        dispatch_once(&qword_1003DB680, &stru_1003B3E58);
      }
      id v8 = qword_1003DB688;
      if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)unsigned int v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "setting forced kappa trigger ts", v14, 2u);
      }
      *((double *)self->_details.__ptr_.__value_ + 1) = v7;
    }
  }
}

- (void)setPreTriggerForcedCompanionTrigger
{
  double Current = CFAbsoluteTimeGetCurrent();
  value = self->_details.__ptr_.__value_;
  double v5 = *((double *)value + 1);
  double v6 = Current - v5;
  if (v5 != 0.0 && v6 < 30.0)
  {
    if (qword_1003DB680 != -1) {
      dispatch_once(&qword_1003DB680, &stru_1003B3E58);
    }
    id v8 = qword_1003DB688;
    if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 134217984;
      double v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "setting pre-trigger kappa delta %f", (uint8_t *)&v13, 0xCu);
    }
    value = self->_details.__ptr_.__value_;
    *(unsigned char *)value = 1;
  }
  double v9 = *((double *)value + 2);
  double v10 = Current - v9;
  if (v9 != 0.0 && v10 < 30.0)
  {
    if (qword_1003DB680 != -1) {
      dispatch_once(&qword_1003DB680, &stru_1003B3E58);
    }
    SEL v12 = qword_1003DB688;
    if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 134217984;
      double v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "setting pre-trigger marty delta %f", (uint8_t *)&v13, 0xCu);
    }
    *((unsigned char *)self->_details.__ptr_.__value_ + 1) = 1;
  }
}

- (void)onCompanionMessage:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  if (qword_1003DB680 != -1) {
    dispatch_once(&qword_1003DB680, &stru_1003B3E58);
  }
  double v9 = qword_1003DB688;
  if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "onCompanionMessage anomaly event service", buf, 2u);
  }
  double v10 = &OBJC_IVAR___CSAnomalyEventService__kappaDetectionService;
  if ((int)v6 <= 201)
  {
    if (v6 >= 0xC && (v6 - 100) >= 3 && v6 != 201) {
      goto LABEL_14;
    }
    goto LABEL_25;
  }
  if ((int)v6 > 300)
  {
    if ((v6 - 302) >= 5)
    {
      switch((int)v6)
      {
        case 400:
          sub_10001AAF8(v8);
        case 401:
          sub_10001AE0C(v8, buf);
          if (!*(void *)buf) {
            goto LABEL_26;
          }
          aop = (id *)self->_aop;
          if (aop)
          {
            CSAOPSvc::onSafetyRemoteSample(aop, *(const CSRemoteSample_Struct **)buf);
            int v13 = *(const CSRemoteSample_Struct **)buf;
            *(void *)buf = 0;
            if (!v13) {
              goto LABEL_26;
            }
          }
          else
          {
            *(void *)buf = 0;
          }
          operator delete();
        case 402:
          sub_10001B208(v8);
        case 403:
          sub_10001B4DC(v8);
        default:
          if (v6 != 301) {
            goto LABEL_14;
          }
          [(CSAnomalyEventService *)self setForcedCompanionTrigger:2];
          goto LABEL_24;
      }
    }
    goto LABEL_24;
  }
  switch(v6)
  {
    case 0xCA:
      [(CSAnomalyEventService *)self setForcedCompanionTrigger:1];
      double v10 = &OBJC_IVAR___CSAnomalyEventService__kappaDetectionService;
      goto LABEL_25;
    case 0xCB:
LABEL_25:
      [*(id *)&self->CLIntersiloService_opaque[*v10] onCompanionMessage:v6 data:v8 receivedTimestamp:a5];
      goto LABEL_26;
    case 0x12C:
LABEL_24:
      double v10 = &OBJC_IVAR___CSAnomalyEventService__martyDetectionService;
      goto LABEL_25;
  }
LABEL_14:
  if (qword_1003DB680 != -1) {
    dispatch_once(&qword_1003DB680, &stru_1003B3E58);
  }
  id v11 = qword_1003DB688;
  if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "unhandled message %d", buf, 8u);
  }
LABEL_26:
}

- (void)onCompanionConnectionStatusUpdate:(int)a3 cftime:(double)a4 sputime:(unint64_t)a5
{
  aop = self->_aop;
  if (aop)
  {
    CSAOPSvc::onCompanionStatusUpdate((uint64_t)aop, *(uint64_t *)&a3, a5);
  }
  else
  {
    uint64_t v6 = (CSAnomalyEventService *)sub_10029B0AC();
    [(CSAnomalyEventService *)v6 requestLocation:v8];
  }
}

- (void)requestLocation:(int)a3
{
  id v17 = +[CSPermissions sharedInstance];
  unsigned __int8 v4 = [v17 isAuthorizedToCollectData];

  if (v4)
  {
    if (self->_sessionType == 4) {
      double v5 = 1000.0;
    }
    else {
      double v5 = (double)(int)kCLLocationAccuracyPrecisionLimitation;
    }
    uint64_t v6 = +[NSFileManager defaultManager];
    SEL v7 = [v6 URLsForDirectory:5 inDomains:8];
    id v18 = [v7 objectAtIndexedSubscript:0];

    int v8 = [v18 URLByAppendingPathComponent:@"LocationBundles"];
    double v9 = [v8 URLByAppendingPathComponent:@"Emergency SOS.bundle"];
    id v10 = objc_alloc((Class)CLLocationManager);
    id v11 = +[NSBundle bundleWithURL:v9];
    SEL v12 = [(CSAnomalyEventService *)self silo];
    int v13 = [v12 queue];
    double v14 = (CLLocationManager *)[v10 initWithEffectiveBundle:v11 delegate:self onQueue:v13];
    locationManager = self->_locationManager;
    self->_locationManager = v14;

    [(CLLocationManager *)self->_locationManager setDesiredAccuracy:v5];
    [(CLLocationManager *)self->_locationManager requestLocation];
  }
  else
  {
    if (qword_1003DB680 != -1) {
      dispatch_once(&qword_1003DB680, &stru_1003B3E58);
    }
    int v16 = qword_1003DB688;
    if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "not authorized to collect", buf, 2u);
    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1003DB680 != -1) {
    dispatch_once(&qword_1003DB680, &stru_1003B3E58);
  }
  int v8 = (id)qword_1003DB688;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    double v9 = [v7 firstObject];
    *(_DWORD *)buf = 138412290;
    v29 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Received location update: %@", buf, 0xCu);
  }
  int sessionType = self->_sessionType;
  switch(sessionType)
  {
    case 2:
      SEL v12 = &OBJC_IVAR___CSAnomalyEventService__martyDetectionService;
      goto LABEL_14;
    case 1:
      SEL v12 = &OBJC_IVAR___CSAnomalyEventService__kappaDetectionService;
LABEL_14:
      [*(id *)&self->CLIntersiloService_opaque[*v12] feedLocationManagerResults:v7];
      break;
    case 0:
      if (qword_1003DB680 != -1) {
        dispatch_once(&qword_1003DB680, &stru_1003B3E58);
      }
      id v11 = qword_1003DB688;
      if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "ignoring gps when not in a session", buf, 2u);
      }
      goto LABEL_18;
  }
  int v13 = [v7 firstObject];
  [v13 coordinate];
  double v15 = v14;

  int v16 = [v7 firstObject];
  [v16 coordinate];
  double v18 = v17;

  *(float *)&double v19 = v15;
  float v20 = v18;
  if (self->_sessionType == 4)
  {
    *(float *)&double v19 = roundf(*(float *)&v19 / 0.014) * 0.014;
    float v20 = roundf(v20 / 0.014) * 0.014;
  }
  uint64_t mslRecording = self->_mslRecording;
  v22 = +[NSNumber numberWithFloat:v19, @"coarseLat"];
  v26[1] = @"coarseLong";
  v27[0] = v22;
  *(float *)&double v23 = v20;
  __int16 v24 = +[NSNumber numberWithFloat:v23];
  v27[1] = v24;
  id v25 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  [(CSMSLDataRecording *)mslRecording updateMetadata:v25];

LABEL_18:
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1003DB680 != -1) {
    dispatch_once(&qword_1003DB680, &stru_1003B3E58);
  }
  id v7 = qword_1003DB688;
  if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error updating location: %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)didInitWithUnprocessedCrash:(id)a3 withCompanionUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1003DB680 != -1) {
    dispatch_once(&qword_1003DB680, &stru_1003B3E58);
  }
  id v7 = qword_1003DB688;
  if (os_log_type_enabled((os_log_t)qword_1003DB688, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "didInitWithUnprocessedCrash recoveredLocalUUID:%@ recoveredCompanionUUID:%@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)didReceiveSOSAck:(int64_t)a3 forMode:(unsigned __int8)a4
{
  if (a4 == 2)
  {
    martyDetectionService = self->_martyDetectionService;
    if (martyDetectionService)
    {
      uint64_t v5 = 2;
      goto LABEL_5;
    }
  }
  else if (a4 == 1)
  {
    martyDetectionService = self->_kappaDetectionService;
    if (martyDetectionService)
    {
      uint64_t v5 = 1;
LABEL_5:
      [martyDetectionService didReceiveSOSAck:a3 forMode:v5];
    }
  }
}

- (void)didReceiveSOSStatusUpdate:(id)a3 forMode:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v8 = a3;
  if (v4 == 2)
  {
    uint64_t v6 = 32;
  }
  else
  {
    if (v4 != 1) {
      goto LABEL_7;
    }
    uint64_t v6 = 24;
  }
  id v7 = *(void **)&self->CLIntersiloService_opaque[v6];
  if (v7) {
    [v7 didReceiveSOSStatusUpdate:v8 forMode:v4];
  }
LABEL_7:
}

- (CSCompanionServiceProtocol)companionProxy
{
  return self->_companionProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionProxy, 0);
  objc_storeStrong((id *)&self->_replyObject, 0);
  objc_storeStrong((id *)&self->_triggerListener, 0);
  objc_storeStrong((id *)&self->_triggerDispatchQueue, 0);
  objc_storeStrong((id *)&self->_connectionList, 0);
  objc_storeStrong((id *)&self->_replyList, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_mslRecording, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  value = self->_details.__ptr_.__value_;
  self->_details.__ptr_.__value_ = 0;
  if (value) {
    operator delete();
  }
  objc_storeStrong((id *)&self->_igneousUploader, 0);
  objc_storeStrong((id *)&self->_uploader, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_coreAnalytics, 0);
  objc_storeStrong((id *)&self->_martyDetectionService, 0);
  objc_storeStrong((id *)&self->_kappaDetectionService, 0);

  objc_storeStrong((id *)&self->_sosSM, 0);
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  return self;
}

@end