@interface CLBackgroundInertialOdometryService
+ (BOOL)isAvailable;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLBackgroundInertialOdometryService)init;
- (NSArray)attitude;
- (NSMutableSet)activeClients;
- (id).cxx_construct;
- (id)sessionForClient:(id)a3;
- (void)beginService;
- (void)dealloc;
- (void)endService;
- (void)isAvailableWithReply:(id)a3;
- (void)onBackgroundBatchData:(const BackgroundInertialOdometryBatch *)a3;
- (void)setActiveClients:(id)a3;
- (void)setAttitude:(id)a3;
- (void)startBackgroundInertialOdometryUpdatesForClient:(id)a3 withIdentifier:(id)a4 usingReferenceFrame:(unint64_t)a5;
- (void)stopBackgroundInertialOdometryUpdatesForClient:(id)a3;
- (void)toggleUpdates;
@end

@implementation CLBackgroundInertialOdometryService

+ (BOOL)isAvailable
{
  uint64_t v2 = sub_100103240();
  char v3 = sub_10016CD00(v2);
  if ((v3 & 1) == 0)
  {
    if (qword_1024192E0 != -1) {
      dispatch_once(&qword_1024192E0, &stru_1022BEE00);
    }
    v4 = qword_1024192E8;
    if (os_log_type_enabled((os_log_t)qword_1024192E8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Background InertialOdometry not supported", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192E0 != -1) {
        dispatch_once(&qword_1024192E0, &stru_1022BEE00);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "+[CLBackgroundInertialOdometryService isAvailable]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
  return v3;
}

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
  if (qword_10247C7D0 != -1) {
    dispatch_once(&qword_10247C7D0, &stru_1022BEDC0);
  }
  return (id)qword_10247C7C8;
}

- (CLBackgroundInertialOdometryService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLBackgroundInertialOdometryService;
  return [(CLBackgroundInertialOdometryService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLBackgroundInertialOdometryServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLBackgroundInertialOdometryServiceClientProtocol];
}

- (void)dealloc
{
  self->_activeClients = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLBackgroundInertialOdometryService;
  [(CLBackgroundInertialOdometryService *)&v3 dealloc];
}

- (void)beginService
{
  [self universe].silo
  if (!self->_backgroundBatchDispatcher.__ptr_.__value_)
  {
    [self universe].silo
    operator new();
  }
  [(CLBackgroundInertialOdometryService *)self setActiveClients:objc_alloc_init((Class)NSMutableSet)];
  [(CLBackgroundInertialOdometryService *)self setAttitude:0];
  if (!self->_geomagneticModelClient.__ptr_.__value_)
  {
    [(CLBackgroundInertialOdometryService *)self universe];
    operator new();
  }
  self->_isStatic = 0;
  self->_rotationArbitraryToTrueNorth = 0.0;
  self->_double trajectorySampleInterval = 0.0;
  *(_DWORD *)buf = 0;
  sub_101A22680(v8, "BackgroundInertialOdometrySampleInterval", buf, 0);
  if (v9 >= 0.1 && v9 <= 10.0)
  {
    self->_double trajectorySampleInterval = v9;
    if (qword_1024192E0 != -1) {
      dispatch_once(&qword_1024192E0, &stru_1022BEE00);
    }
    v4 = qword_1024192E8;
    if (os_log_type_enabled((os_log_t)qword_1024192E8, OS_LOG_TYPE_DEFAULT))
    {
      double trajectorySampleInterval = self->_trajectorySampleInterval;
      *(_DWORD *)buf = 134217984;
      double v13 = trajectorySampleInterval;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Background InertialOdometry interval set to %f [s]", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192E0 != -1) {
        dispatch_once(&qword_1024192E0, &stru_1022BEE00);
      }
      double v6 = self->_trajectorySampleInterval;
      int v10 = 134217984;
      double v11 = v6;
      v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBackgroundInertialOdometryService beginService]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
  [(CLBackgroundInertialOdometryService *)self toggleUpdates];
}

- (void)endService
{
  [self.universe silo];
  if (self->_backgroundBatchDispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_10058D9A0(0);
    sub_1009D26C4(v3, 51, (uint64_t)self->_backgroundBatchDispatcher.__ptr_.__value_);
    value = self->_backgroundBatchDispatcher.__ptr_.__value_;
    self->_backgroundBatchDispatcher.__ptr_.__value_ = 0;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8))(value);
    }
  }

  [(CLBackgroundInertialOdometryService *)self toggleUpdates];
}

- (void)isAvailableWithReply:(id)a3
{
  BOOL v4 = +[CLBackgroundInertialOdometryService isAvailable];
  unint64_t v5 = (void (*)(id, BOOL))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)startBackgroundInertialOdometryUpdatesForClient:(id)a3 withIdentifier:(id)a4 usingReferenceFrame:(unint64_t)a5
{
  if (+[CLBackgroundInertialOdometryService isAvailable])
  {
    if ([(CLBackgroundInertialOdometryService *)self sessionForClient:a3])
    {
      if (qword_1024192E0 != -1) {
        dispatch_once(&qword_1024192E0, &stru_1022BEE00);
      }
      float v9 = qword_1024192E8;
      if (os_log_type_enabled((os_log_t)qword_1024192E8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Client has already started background InertialOdometry updates", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024192E0 != -1) {
          dispatch_once(&qword_1024192E0, &stru_1022BEE00);
        }
        v21 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLBackgroundInertialOdometryService startBackgroundInertialOdometryUpdatesForClient:withIdentifier:usingReferenceFrame:]", "%s\n", v21);
        if (v21 != (char *)buf) {
          free(v21);
        }
      }
    }
    else
    {
      int v10 = [[CLBackgroundInertialOdometryClientSession alloc] initWithClient:a3 withIdentifier:a4 usingReferenceFrame:a5 atMachContinuousTime:sub_10016C458()];
      if (self->_isStatic && [(CLBackgroundInertialOdometryService *)self attitude])
      {
        double v11 = [CMOdometry alloc];
        id v12 = [(NSArray *)[(CLBackgroundInertialOdometryService *)self attitude] objectAtIndexedSubscript:0];
        id v13 = [(NSArray *)[(CLBackgroundInertialOdometryService *)self attitude] objectAtIndexedSubscript:1];
        id v14 = [(NSArray *)[(CLBackgroundInertialOdometryService *)self attitude] objectAtIndexedSubscript:2];
        id v15 = [(NSArray *)[(CLBackgroundInertialOdometryService *)self attitude] objectAtIndexedSubscript:3];
        float rotationArbitraryToTrueNorth = self->_rotationArbitraryToTrueNorth;
        double v17 = sub_10016C458();
        double v18 = v17;
        *(float *)&double v17 = rotationArbitraryToTrueNorth;
        v19 = [(CMOdometry *)v11 initWithDeltaPositionX:&off_102398238 deltaPositionY:&off_102398238 deltaPositionZ:&off_102398238 deltaVelocityX:&off_102398238 deltaVelocityY:&off_102398238 deltaVelocityZ:&off_102398238 quaternionX:v17 quaternionY:v18 quaternionZ:v12 quaternionW:v13 rotationArbitraryToTrueNorth:v14 staticFlag:v15 timestamp:1];
        v20 = v19;
        if (v10->_referenceFrame == 8) {
          [(CMOdometry *)v19 rotateArbitraryToTrueNorth];
        }
        [(CLBackgroundInertialOdometryServiceClientProtocol *)[(CLBackgroundInertialOdometryClientSession *)v10 client] onBackgroundInertialOdometryState:v20];
      }
      [(NSMutableSet *)[(CLBackgroundInertialOdometryService *)self activeClients] addObject:v10];

      [(CLBackgroundInertialOdometryService *)self toggleUpdates];
    }
  }
}

- (void)stopBackgroundInertialOdometryUpdatesForClient:(id)a3
{
  if (+[CLBackgroundInertialOdometryService isAvailable])
  {
    id v5 = [(CLBackgroundInertialOdometryService *)self sessionForClient:a3];
    if (v5)
    {
      [(NSMutableSet *)[(CLBackgroundInertialOdometryService *)self activeClients] removeObject:v5];
      [(CLBackgroundInertialOdometryService *)self toggleUpdates];
    }
    else
    {
      if (qword_1024192E0 != -1) {
        dispatch_once(&qword_1024192E0, &stru_1022BEE00);
      }
      double v6 = qword_1024192E8;
      if (os_log_type_enabled((os_log_t)qword_1024192E8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Client has not started background InertialOdometry updates", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024192E0 != -1) {
          dispatch_once(&qword_1024192E0, &stru_1022BEE00);
        }
        v7 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLBackgroundInertialOdometryService stopBackgroundInertialOdometryUpdatesForClient:]", "%s\n", v7);
        if (v7 != (char *)buf) {
          free(v7);
        }
      }
    }
  }
}

- (void)onBackgroundBatchData:(const BackgroundInertialOdometryBatch *)a3
{
  if ([(NSMutableSet *)[(CLBackgroundInertialOdometryService *)self activeClients] count]
    && a3->var14[1])
  {
    uint64_t v5 = 0;
    v68 = a3;
    do
    {
      double v6 = &a3->var0 + v5;
      int v7 = *((unsigned __int8 *)&a3->var12[4] + v5 + 1);
      v80[0] = _NSConcreteStackBlock;
      v80[1] = 3221225472;
      v81 = sub_100629648;
      v82 = &unk_1022BEDE0;
      char v83 = v7;
      if (v7)
      {
        if (qword_1024192E0 != -1) {
          dispatch_once(&qword_1024192E0, &stru_1022BEE00);
        }
        v8 = qword_1024192E8;
        if (os_log_type_enabled((os_log_t)qword_1024192E8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DeviceMotion uninitialized", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024192E0 != -1) {
            dispatch_once(&qword_1024192E0, &stru_1022BEE00);
          }
          __int16 v79 = 0;
          v53 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBackgroundInertialOdometryService onBackgroundBatchData:]", "%s\n", v53);
          if (v53 != (char *)buf) {
            free(v53);
          }
        }
      }
      uint64_t v9 = v6[201];
      BOOL v10 = v6[201] == 0;
      if (v6[201]) {
        BOOL isStatic = self->_isStatic;
      }
      else {
        BOOL isStatic = 1;
      }
      BOOL v12 = !self->_isStatic;
      uint64_t v13 = 2 * v10;
      self->_BOOL isStatic = v9;
      if (v12) {
        uint64_t v13 = v9;
      }
      uint64_t v67 = v13;
      uint64_t v54 = v5;
      id v14 = (char *)a3 + 4 * v5;
      LODWORD(v4) = *(_DWORD *)(v14 + 133);
      v65 = v14 + 133;
      v85[0] = +[NSNumber numberWithFloat:v4];
      LODWORD(v15) = *(_DWORD *)(v14 + 149);
      v64 = v14 + 149;
      v85[1] = +[NSNumber numberWithFloat:v15];
      LODWORD(v16) = *(_DWORD *)(v14 + 165);
      v63 = v14 + 165;
      v85[2] = +[NSNumber numberWithFloat:v16];
      LODWORD(v17) = *(_DWORD *)(v14 + 181);
      v66 = v14 + 181;
      v85[3] = +[NSNumber numberWithFloat:v17];
      [(CLBackgroundInertialOdometryService *)self setAttitude:+[NSArray arrayWithObjects:v85 count:4]];
      double v4 = *(float *)((char *)&a3->var12[2] + 1) - *((double *)self->_geomagneticModelClient.__ptr_.__value_ + 1);
      *(float *)&double v4 = v4;
      self->_float rotationArbitraryToTrueNorth = *(float *)&v4;
      if (!isStatic || !self->_isStatic)
      {
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        obj = [(CLBackgroundInertialOdometryService *)self activeClients];
        id v70 = [(NSMutableSet *)obj countByEnumeratingWithState:&v75 objects:v84 count:16];
        if (v70)
        {
          uint64_t v62 = *(void *)v76;
          double v18 = (char *)&v68->var4[2] + v54 + 1;
          v19 = (char *)v68 + 4 * v54;
          v57 = v19 + 33;
          v56 = v19 + 49;
          v55 = v19 + 65;
          v61 = v19 + 85;
          v59 = v19 + 117;
          v60 = v19 + 101;
          do
          {
            for (i = 0; i != v70; i = (char *)i + 1)
            {
              if (*(void *)v76 != v62) {
                objc_enumerationMutation(obj);
              }
              v21 = *(void **)(*((void *)&v75 + 1) + 8 * i);
              v73 = [CMOdometry alloc];
              if (*v18)
              {
                LODWORD(v22) = *v57;
                v23 = +[NSNumber numberWithFloat:v22];
              }
              else
              {
                v23 = 0;
              }
              uint64_t v72 = v81((uint64_t)v80, (uint64_t)v23);
              if ((*v18 & 2) != 0)
              {
                LODWORD(v24) = *v56;
                v25 = +[NSNumber numberWithFloat:v24];
              }
              else
              {
                v25 = 0;
              }
              v74 = v21;
              uint64_t v71 = v81((uint64_t)v80, (uint64_t)v25);
              if ((*v18 & 4) != 0)
              {
                LODWORD(v26) = *v55;
                v27 = +[NSNumber numberWithFloat:v26];
              }
              else
              {
                v27 = 0;
              }
              uint64_t v28 = v81((uint64_t)v80, (uint64_t)v27);
              LODWORD(v29) = *v61;
              v30 = +[NSNumber numberWithFloat:v29];
              uint64_t v31 = v81((uint64_t)v80, (uint64_t)v30);
              LODWORD(v32) = *v60;
              v33 = +[NSNumber numberWithFloat:v32];
              uint64_t v34 = v81((uint64_t)v80, (uint64_t)v33);
              LODWORD(v35) = *v59;
              v36 = +[NSNumber numberWithFloat:v35];
              uint64_t v37 = v81((uint64_t)v80, (uint64_t)v36);
              LODWORD(v38) = *v65;
              v39 = +[NSNumber numberWithFloat:v38];
              uint64_t v40 = v81((uint64_t)v80, (uint64_t)v39);
              LODWORD(v41) = *v64;
              v42 = +[NSNumber numberWithFloat:v41];
              uint64_t v43 = v81((uint64_t)v80, (uint64_t)v42);
              LODWORD(v44) = *v63;
              v45 = +[NSNumber numberWithFloat:v44];
              uint64_t v46 = v81((uint64_t)v80, (uint64_t)v45);
              LODWORD(v47) = *v66;
              v48 = +[NSNumber numberWithFloat:v47];
              uint64_t v49 = v81((uint64_t)v80, (uint64_t)v48);
              double v50 = *(float *)((char *)&v68->var12[2] + 1)
                  - *((double *)self->_geomagneticModelClient.__ptr_.__value_ + 1);
              *(float *)&double v50 = v50;
              v51 = [(CMOdometry *)v73 initWithDeltaPositionX:v72 deltaPositionY:v71 deltaPositionZ:v28 deltaVelocityX:v31 deltaVelocityY:v34 deltaVelocityZ:v37 quaternionX:v50 quaternionY:(double)*(unint64_t *)(&v68->var0 + 8 * v54 + 1) * 0.000001 quaternionZ:v40 quaternionW:v43 rotationArbitraryToTrueNorth:v46 staticFlag:v49 timestamp:v67];
              v52 = v51;
              if (v74[1] == 8) {
                [(CMOdometry *)v51 rotateArbitraryToTrueNorth];
              }
              [objc_msgSend(v74, "client") onBackgroundInertialOdometryState:v52];

              double v18 = (char *)&v68->var4[2] + v54 + 1;
            }
            id v70 = [(NSMutableSet *)obj countByEnumeratingWithState:&v75 objects:v84 count:16];
          }
          while (v70);
        }
      }
      uint64_t v5 = v54 + 1;
      a3 = v68;
    }
    while (v54 + 1 < (unint64_t)v68->var14[1]);
  }
}

- (void)toggleUpdates
{
  id v3 = [(NSMutableSet *)[(CLBackgroundInertialOdometryService *)self activeClients] count];
  if (qword_1024192E0 != -1) {
    dispatch_once(&qword_1024192E0, &stru_1022BEE00);
  }
  double v4 = qword_1024192E8;
  if (os_log_type_enabled((os_log_t)qword_1024192E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    unsigned int v9 = [(NSMutableSet *)[(CLBackgroundInertialOdometryService *)self activeClients] count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Number of BIO clients: %{public}d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024192E0 != -1) {
      dispatch_once(&qword_1024192E0, &stru_1022BEE00);
    }
    [(NSMutableSet *)[(CLBackgroundInertialOdometryService *)self activeClients] count];
    int v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBackgroundInertialOdometryService toggleUpdates]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  uint64_t v5 = sub_10058D9A0(0);
  sub_100595AA4(v5, v3 != 0, self->_trajectorySampleInterval);
  value = self->_geomagneticModelClient.__ptr_.__value_;
  if (v3)
  {
    sub_100F618F8((uint64_t)value);
  }
  else
  {
    sub_100F61D28((uint64_t)value);
    self->_BOOL isStatic = 0;
    [(CLBackgroundInertialOdometryService *)self setAttitude:0];
    self->_float rotationArbitraryToTrueNorth = 0.0;
  }
}

- (id)sessionForClient:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v4 = [(CLBackgroundInertialOdometryService *)self activeClients];
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    unsigned int v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 client] == a3) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (NSMutableSet)activeClients
{
  return self->_activeClients;
}

- (void)setActiveClients:(id)a3
{
}

- (NSArray)attitude
{
  return self->_attitude;
}

- (void)setAttitude:(id)a3
{
}

- (void).cxx_destruct
{
  p_geomagneticModelClient = &self->_geomagneticModelClient;
  uint64_t value = (uint64_t)p_geomagneticModelClient->__ptr_.__value_;
  p_geomagneticModelClient->__ptr_.__value_ = 0;
  if (value) {
    sub_100629AA4((uint64_t)p_geomagneticModelClient, value);
  }
  id v5 = self->_backgroundBatchDispatcher.__ptr_.__value_;
  self->_backgroundBatchDispatcher.__ptr_.__value_ = 0;
  if (v5)
  {
    id v6 = *(void (**)(void))(*(void *)v5 + 8);
    v6();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end