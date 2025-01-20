@interface CLGnssProviderAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetActiveGnssBands:(void *)a3;
- (BOOL)syncgetControlPlaneStatusReport:(CLGnssControlPlaneStatusReport *)a3;
- (BOOL)syncgetIonosphereParameters:(ThinShellIonosphereParameters *)a3;
- (CLGnssProviderAdapter)init;
- (void)addRhythmicGnssClient:(int)a3;
- (void)beginService;
- (void)cacheEmergencyAWDStatistics:(CLDaemonLocation *)a3;
- (void)emergencySettingsChange:(id)a3 withReason:(int)a4;
- (void)emergencyStateChange:(id)a3;
- (void)endService;
- (void)fetchOdometryBatchedLocationsWithReply:(id)a3;
- (void)removeRhythmicGnssClient:(int)a3;
- (void)resetControlPlaneStatus;
- (void)setBarometricAltitudeAWDData:(BarometricAltitudeDriftRateInfo)a3;
- (void)setBarometricAltitudeData:(AltitudeUpdateData *)a3;
- (void)shouldLockoutNilr:(BOOL)a3;
- (void)updateRelayedLocation:(id)a3;
@end

@implementation CLGnssProviderAdapter

+ (BOOL)isSupported
{
  if (qword_102481FE8 != -1) {
    dispatch_once(&qword_102481FE8, &stru_1022FEF28);
  }
  return byte_102481FE0;
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
  if (qword_102481FF8 != -1) {
    dispatch_once(&qword_102481FF8, &stru_1022FEF48);
  }
  return (id)qword_102481FF0;
}

- (CLGnssProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLGnssProviderAdapter;
  return [(CLGnssProviderAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLGnssProviderProtocol outboundProtocol:&OBJC_PROTOCOL___CLGnssProviderClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A91A38();
  }
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)resetControlPlaneStatus
{
  v2 = [(CLNotifierServiceAdapter *)self notifier];
  if (v2) {
  objc_super v3 = v2 + 15;
  }

  sub_1008453E8(v3);
}

- (BOOL)syncgetControlPlaneStatusReport:(CLGnssControlPlaneStatusReport *)a3
{
  v4 = [(CLNotifierServiceAdapter *)self notifier];
  if (v4) {
  unint64_t v5 = v4 + 15;
  }

  return sub_10084580C(v5, (uint64_t)a3);
}

- (BOOL)syncgetActiveGnssBands:(void *)a3
{
  v4 = [(CLNotifierServiceAdapter *)self notifier];
  if (!v4) {
    return 0;
  }
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (uint64_t)v5 + 120;

  return sub_100845A7C(v6, (int **)a3);
}

- (void)cacheEmergencyAWDStatistics:(CLDaemonLocation *)a3
{
  v4 = [(CLNotifierServiceAdapter *)self notifier];
  if (v4) {
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = a3->rawCoordinate;
  }
  v9[6] = *(_OWORD *)&a3->lifespan;
  v9[7] = rawCoordinate;
  v10[0] = *(_OWORD *)&a3->rawCourse;
  *(_OWORD *)((char *)v10 + 12) = *(_OWORD *)&a3->integrity;
  long long v6 = *(_OWORD *)&a3->speed;
  v9[2] = *(_OWORD *)&a3->altitude;
  v9[3] = v6;
  long long v7 = *(_OWORD *)&a3->timestamp;
  v9[4] = *(_OWORD *)&a3->course;
  v9[5] = v7;
  long long v8 = *(_OWORD *)&a3->coordinate.longitude;
  v9[0] = *(_OWORD *)&a3->suitability;
  v9[1] = v8;
  sub_100845648((uint64_t)&v4[15], (uint64_t)v9);
}

- (void)fetchOdometryBatchedLocationsWithReply:(id)a3
{
  id v5 = +[NSMutableDictionary dictionary];
  sub_1000DB3D4((uint64_t)v16);
  long long v6 = [(CLNotifierServiceAdapter *)self notifier];
  if (v6)
  {
    if (v7)
    {
      sub_1008492C4((uint64_t)v7 + 120, (uint64_t)v16);
      long long v8 = v18;
      if (v18)
      {
        for (unint64_t i = 0; i < sub_1010FB9FC(v8); ++i)
        {
          sub_1010FB258((uint64_t)v18, i, (uint64_t)buf);
          id v10 = objc_alloc((Class)CLLocation);
          CLLocationCoordinate2D v11 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)&v27, v28);
          objc_msgSend(v5, "setValue:forKey:", objc_msgSend(objc_msgSend(v10, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:timestamp:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v36), v11.latitude, v11.longitude, v30, v29, v31, v34, v35, v32, v33),
              "jsonObject"),
            +[NSString stringWithFormat:@"%lu", i]);
          long long v8 = v18;
        }
        if (qword_102419520 != -1) {
          dispatch_once(&qword_102419520, &stru_1022FF128);
        }
        v12 = qword_102419528;
        if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v13 = sub_1010FB9FC(v18);
          *(_DWORD *)buf = 134349056;
          uint64_t v27 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "fetchOdometryBatchedLocations responding with dataCount,%{public}lu", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419520 != -1) {
            dispatch_once(&qword_102419520, &stru_1022FF128);
          }
          uint64_t v14 = sub_1010FB9FC(v18);
          int v24 = 134349056;
          uint64_t v25 = v14;
          v15 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGnssProviderAdapter fetchOdometryBatchedLocationsWithReply:]", "%s\n", v15);
          if (v15 != (char *)buf) {
            free(v15);
          }
        }
      }
    }
  }
  (*((void (**)(id, id))a3 + 2))(a3, v5);

  if (v22) {
    sub_1000DB0A0(v22);
  }
  if (v21 < 0) {
    operator delete(__p);
  }
  if (v19) {
    sub_1000DB0A0(v19);
  }
  if (v17) {
    sub_1000DB0A0(v17);
  }
}

- (void)setBarometricAltitudeAWDData:(BarometricAltitudeDriftRateInfo)a3
{
  uint64_t v3 = *(void *)&a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  id v5 = [(CLNotifierServiceAdapter *)self notifier];
  if (v5)
  {
    if (v6)
    {
      v7[0] = v4;
      v7[1] = v3;
      sub_1008457EC((uint64_t)v6 + 120, (uint64_t)v7);
    }
  }
}

- (void)setBarometricAltitudeData:(AltitudeUpdateData *)a3
{
  uint64_t v4 = [(CLNotifierServiceAdapter *)self notifier];
  if (v4) {
  long long v5 = *(_OWORD *)&a3->var7.var1;
  }
  void v7[2] = *(_OWORD *)&a3->var4;
  v7[3] = v5;
  v7[4] = *(_OWORD *)&a3->var7.var3;
  long long v6 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0;
  v7[1] = v6;
  sub_1008457FC((uint64_t)&v4[15], (uint64_t)v7);
}

- (BOOL)syncgetIonosphereParameters:(ThinShellIonosphereParameters *)a3
{
  uint64_t v4 = [(CLNotifierServiceAdapter *)self notifier];
  if (!v4) {
    return 0;
  }
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (uint64_t)v5 + 120;

  return sub_100849294(v6, (uint64_t)a3);
}

- (void)emergencyStateChange:(id)a3
{
  (*((void (**)(long long *__return_ptr, id, SEL))a3 + 2))(&v11, a3, a2);
  if (qword_102419380 != -1) {
    dispatch_once(&qword_102419380, &stru_1022FF148);
  }
  uint64_t v4 = qword_102419388;
  if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEFAULT))
  {
    sub_100D335B8(&v11, __p);
    long long v5 = (__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
       ? __p
       : (std::string *)__p[0].__r_.__value_.__r.__words[0];
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "notifier adapter received emergency state %s", (uint8_t *)&buf, 0xCu);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022FF148);
    }
    sub_100D335B8(&v11, &buf);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_std::string buf = &buf;
    }
    else {
      p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    }
    int v14 = 136315138;
    v15 = p_buf;
    long long v8 = (std::string *)_os_log_send_and_compose_impl();
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGnssProviderAdapter emergencyStateChange:]", "%s\n", (const char *)v8);
    if (v8 != __p) {
      free(v8);
    }
  }
  uint64_t v6 = [(CLNotifierServiceAdapter *)self notifier];
  if (v6) {
  long long v9 = v11;
  }
  int v10 = v12;
  sub_100E8A4A0((uint64_t)v6, &v9);
}

- (void)emergencySettingsChange:(id)a3 withReason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  (*((void (**)(void *__return_ptr, id, SEL))a3 + 2))(v7, a3, a2);
  uint64_t v6 = [(CLNotifierServiceAdapter *)self notifier];
  if (v6) {
  sub_10083C24C((uint64_t *)&v6[15], (uint64_t)v7, v4);
  }
  sub_10084DD34((uint64_t)v7);
}

- (void)shouldLockoutNilr:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(CLNotifierServiceAdapter *)self notifier];
  if (v4) {
  long long v5 = v4 + 15;
  }

  sub_10083C870(v5, v3);
}

- (void)addRhythmicGnssClient:(int)a3
{
  uint64_t v4 = [(CLNotifierServiceAdapter *)self notifier];
  if (v4)
  {
    if (v5)
    {
      sub_100E8AB28((uint64_t)v5, a3);
    }
  }
}

- (void)removeRhythmicGnssClient:(int)a3
{
  uint64_t v4 = [(CLNotifierServiceAdapter *)self notifier];
  if (v4)
  {
    if (v5)
    {
      sub_100E8AFD4((uint64_t)v5, a3);
    }
  }
}

- (void)updateRelayedLocation:(id)a3
{
  (*((void (**)(unsigned char *__return_ptr, id, SEL))a3 + 2))(v9, a3, a2);
  if (qword_1024193D0 != -1) {
    dispatch_once(&qword_1024193D0, &stru_1022FF108);
  }
  uint64_t v4 = qword_1024193D8;
  if (os_log_type_enabled((os_log_t)qword_1024193D8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)std::string buf = 134283777;
    uint64_t v17 = v10;
    __int16 v18 = 2049;
    uint64_t v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "#updateRelayedLocation location,lat,%{private}+.6f,lon,%{private}.6f>", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193D0 != -1) {
      dispatch_once(&qword_1024193D0, &stru_1022FF108);
    }
    int v12 = 134283777;
    uint64_t v13 = v10;
    __int16 v14 = 2049;
    uint64_t v15 = v11;
    long long v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGnssProviderAdapter updateRelayedLocation:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  if (sub_1000E6DB4((uint64_t)v9))
  {
    long long v5 = [(CLNotifierServiceAdapter *)self notifier];
    if (v5) {
    sub_100E8B76C((uint64_t)v5, (uint64_t)v9);
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022FF168);
    }
    uint64_t v6 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#updateRelayedLocation,#warning.lastReceivedLocation is invalid.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022FF168);
      }
      LOWORD(v12) = 0;
      long long v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGnssProviderAdapter updateRelayedLocation:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

@end