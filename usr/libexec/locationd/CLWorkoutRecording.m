@interface CLWorkoutRecording
- (BOOL)setWorkingDirectory:(id)a3;
- (BOOL)start:(id)a3 recentLocation:(CLDaemonLocation *)a4 triggerDelay:(double)a5 recentWeatherData:(id)a6 maxFileCount:(unsigned int)a7;
- (CLDaemonLocation)getStartLocation;
- (CLWorkoutRecording)initWithDelegate:(id)a3 universe:(id)a4 moduleDictionary:(id)a5 setting:(SettingStructure *)a6;
- (NSArray)recordingURLs;
- (NSDictionary)metadata;
- (basic_string<char,)getStringSessionId:(std::allocator<char>> *__return_ptr)retstr;
- (double)makeSafeCFAbsoluteTime:(double)a3;
- (double)startTime;
- (double)stopTime;
- (id).cxx_construct;
- (id)getLocationBlock;
- (void)cleanup;
- (void)dealloc;
- (void)deleteWorkingDirectory;
- (void)initializeTheSettings:(SettingStructure *)a3;
- (void)recordWeatherData:(id)a3;
- (void)recordWorkoutEffort:(const Result *)a3;
- (void)recordWorkoutSessionEvent:(const WorkoutEvent *)a3;
- (void)recordWorkoutSessionPriors:(const void *)a3;
- (void)releaseBlocks;
- (void)setMotionStateFunction:(id)a3;
- (void)setupListeners;
- (void)setupModuleWriters;
- (void)stop;
- (void)teardownListeners;
- (void)updateMetadata;
- (void)writeStrideCalBins;
@end

@implementation CLWorkoutRecording

- (id)getLocationBlock
{
  return *(id *)&self->_startLocation.referenceFrame;
}

- (void)recordWorkoutSessionEvent:(const WorkoutEvent *)a3
{
  uint64_t v3 = *(void *)&self->_startLocation.floor;
  if (v3) {
    (*(void (**)(uint64_t, const WorkoutEvent *))(v3 + 16))(v3, a3);
  }
}

- (void)initializeTheSettings:(SettingStructure *)a3
{
  BYTE1(self->_fFileTimeInterval) = a3->disableWeatherData;
  BYTE2(self->_fFileTimeInterval) = a3->disableMeanMaxMets;
  LOBYTE(self->_fFileTimeInterval) = a3->disableStrideCalBins;
  self->_recordingType.var0 = a3->recordingType.var0;
  self->_recordingType.__r_.var0 = a3->recordingType.__r_.var0;
  self->_privacyTimeOffset = a3->privacyTimeOffset;
  std::string::operator=((std::string *)&self->_recordingType, (const std::string *)&a3->recordingType);
}

- (CLWorkoutRecording)initWithDelegate:(id)a3 universe:(id)a4 moduleDictionary:(id)a5 setting:(SettingStructure *)a6
{
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234CDC0);
  }
  v11 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
  {
    BOOL hasSyncInWatch = a6->hasSyncInWatch;
    if (self)
    {
      [(CLWorkoutRecording *)self getStringSessionId:a6->workoutRecorderSessionId];
      v13 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
    }
    else
    {
      memset(__p, 0, 24);
      v13 = __p;
    }
    uint64_t v14 = *(void *)&a6[1].hasSyncInWatch;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = hasSyncInWatch;
    *(_WORD *)&buf[8] = 2080;
    *(void *)&buf[10] = v13;
    __int16 v47 = 2048;
    uint64_t v48 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecording: initWithDelegate, hasSync: %d and internal sessionID: %s and activity type: %ld", buf, 0x1Cu);
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234CDC0);
    }
    BOOL v28 = a6->hasSyncInWatch;
    if (self)
    {
      [(CLWorkoutRecording *)self getStringSessionId:a6->workoutRecorderSessionId];
      if (v37 >= 0) {
        v29 = v36;
      }
      else {
        v29 = (void **)v36[0];
      }
    }
    else
    {
      v36[0] = 0;
      v36[1] = 0;
      v29 = v36;
      uint64_t v37 = 0;
    }
    v32 = *(void **)&a6[1].hasSyncInWatch;
    LODWORD(__p[0]) = 67109634;
    HIDWORD(__p[0]) = v28;
    LOWORD(__p[1]) = 2080;
    *(void **)((char *)&__p[1] + 2) = v29;
    WORD1(__p[2]) = 2048;
    *(void **)((char *)&__p[2] + 4) = v32;
    v33 = (char *)_os_log_send_and_compose_impl();
    if (SHIBYTE(v37) < 0) {
      operator delete(v36[0]);
    }
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecording initWithDelegate:universe:moduleDictionary:setting:]", "%s\n", v33);
    if (v33 != buf) {
      free(v33);
    }
  }
  v35.receiver = self;
  v35.super_class = (Class)CLWorkoutRecording;
  v15 = [(CLWorkoutRecording *)&v35 init];
  v16 = v15;
  if (v15)
  {
    v15->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v15->_universe = (CLIntersiloUniverse *)a4;
    v15->_metadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    long long v17 = *(_OWORD *)&a6->privacyTimeOffset;
    v38[2] = *(_OWORD *)&a6->kPrivacyPressureMaxOffset;
    v38[3] = v17;
    long long v18 = *(_OWORD *)a6->workoutRecorderSessionId;
    v38[4] = *(_OWORD *)&a6->minimumPowerAssertionTimeSeconds;
    v38[5] = v18;
    long long v19 = *(_OWORD *)&a6->hasSyncInWatch;
    v38[0] = *(_OWORD *)&a6->disableAveragedALS;
    v38[1] = v19;
    if (*((char *)&a6->recordingType.__r_.__value_.var0.var1 + 23) < 0)
    {
      sub_1000DC48C(&v39, a6->recordingType.__r_.__value_.var0.var1.__data_, a6->recordingType.__r_.__value_.var0.var1.__size_);
    }
    else
    {
      long long v39 = *(_OWORD *)a6->recordingType.__r_.__value_.var0.var0.__data_;
      uint64_t v40 = *((void *)&a6->recordingType.__r_.__value_.var0.var1 + 2);
    }
    long long v41 = *(_OWORD *)&a6->recordingType.__r_.var0;
    long long v42 = *(_OWORD *)&a6[1].disableAveragedALS;
    long long v43 = *(_OWORD *)&a6[1].hasSyncInWatch;
    long long v44 = *(_OWORD *)&a6[1].kPrivacyPressureMaxOffset;
    [(CLWorkoutRecording *)v16 initializeTheSettings:v38];
    if (SHIBYTE(v40) < 0) {
      operator delete((void *)v39);
    }
    metadata = v16->_metadata;
    uint64_t v21 = sub_100103240();
    sub_10073B1A4(v21, (uint64_t)buf);
    if ((v48 & 0x80000000) == 0) {
      v22 = buf;
    }
    else {
      v22 = *(unsigned char **)buf;
    }
    [(NSMutableDictionary *)metadata setValue:+[NSString stringWithUTF8String:v22] forKey:@"HardwareType"];
    if (SBYTE3(v48) < 0) {
      operator delete(*(void **)buf);
    }
    [(NSMutableDictionary *)v16->_metadata setObject:+[NSNumber numberWithBool:sub_100A357C4()] forKeyedSubscript:@"FallNotifierAvailable"];
    p_recordingType = (__long *)&v16->_recordingType;
    if (*((char *)&v16->_recordingType.__r_.__value_.var0.var1 + 23) < 0) {
      p_recordingType = (__long *)p_recordingType->__data_;
    }
    [(NSMutableDictionary *)v16->_metadata setObject:+[NSString stringWithUTF8String:p_recordingType] forKeyedSubscript:@"RecordingType"];
    [(CLWorkoutRecording *)v16 getStringSessionId:a6->workoutRecorderSessionId];
    if ((v48 & 0x80000000) == 0) {
      v24 = buf;
    }
    else {
      v24 = *(unsigned char **)buf;
    }
    [(NSMutableDictionary *)v16->_metadata setObject:+[NSString stringWithUTF8String:v24] forKeyedSubscript:@"workoutRecorderSessionId"];
    if (SBYTE3(v48) < 0) {
      operator delete(*(void **)buf);
    }
    [(NSMutableDictionary *)v16->_metadata setObject:+[NSNumber numberWithBool:a6->hasSyncInWatch] forKeyedSubscript:@"hasCompanionPayload"];
    [(NSMutableDictionary *)v16->_metadata setObject:&off_102395620 forKeyedSubscript:@"MeanMaxMets"];
    [(NSMutableDictionary *)v16->_metadata setObject:&off_1023954C8 forKeyedSubscript:@"UniqueWorkoutActivityCount"];
    [(NSMutableDictionary *)v16->_metadata setObject:*(void *)&a6[1].accelIntervalSeconds forKeyedSubscript:@"ParticipantID"];
    if (a6->hasSyncInWatch) {
      [(NSMutableDictionary *)v16->_metadata setObject:+[NSNumber numberWithInteger:*(void *)&a6[1].hasSyncInWatch] forKeyedSubscript:@"WorkoutActivityType"];
    }
    sub_100103240();
    if (sub_10073E30C()) {
      [(NSMutableDictionary *)v16->_metadata setObject:&__kCFBooleanTrue forKeyedSubscript:@"InternalInstall"];
    }
    v16->_modulesDict = (NSMutableDictionary *)a5;
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234CDC0);
    }
    v25 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      id v26 = [[-[NSMutableDictionary allKeys](v16->_modulesDict, "allKeys") count];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "CLWorkoutRecording:initWithDelegate %lu", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234CDC0);
      }
      id v30 = [[-[NSMutableDictionary allKeys](v16->_modulesDict) allKeys] count];
      LODWORD(__p[0]) = 134217984;
      *(void **)((char *)__p + 4) = v30;
      v31 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecording initWithDelegate:universe:moduleDictionary:setting:]", "%s\n", v31);
      if (v31 != buf) {
        free(v31);
      }
    }
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 3221225472;
    aBlock[2] = sub_101A13E6C;
    aBlock[3] = &unk_10234CDA0;
    aBlock[4] = v16;
    *(void *)&v16->_startLocation.referenceFrame = _Block_copy(aBlock);
  }
  return v16;
}

- (basic_string<char,)getStringSessionId:(std::allocator<char>> *__return_ptr)retstr
{
  memset(v4, 0, sizeof(v4));
  uuid_unparse(v1, v4);
  return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_100134750(retstr, v4);
}

- (void)dealloc
{
  cntrl = self->_writer.__cntrl_;
  self->_writer.__ptr_ = 0;
  self->_writer.__cntrl_ = 0;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }

  self->_workingDirectory = 0;
  self->_metadata = 0;
  self->_delegate = 0;
  v6.receiver = self;
  v6.super_class = (Class)CLWorkoutRecording;
  [(CLWorkoutRecording *)&v6 dealloc];
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234CDC0);
  }
  v4 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecording deallocation is complete.", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234CDC0);
    }
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecording dealloc]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
}

- (BOOL)start:(id)a3 recentLocation:(CLDaemonLocation *)a4 triggerDelay:(double)a5 recentWeatherData:(id)a6 maxFileCount:(unsigned int)a7
{
  if ([(CLWorkoutRecording *)self setWorkingDirectory:a3])
  {
    self->_startLocation.ellipsoidalAltitude = CFAbsoluteTimeGetCurrent();
    long long v12 = *(_OWORD *)&a4->coordinate.longitude;
    *(_OWORD *)(&self->_fFileTimeInterval + 1) = *(_OWORD *)&a4->suitability;
    *(_OWORD *)(&self->_disableMeanMaxMets + 2) = v12;
    long long v13 = *(_OWORD *)&a4->course;
    long long v14 = *(_OWORD *)&a4->timestamp;
    long long v15 = *(_OWORD *)&a4->speed;
    *($AB5116BA7E623E054F959CECB034F4E7 *)((char *)&self->_startLocation.coordinate + 4) = *($AB5116BA7E623E054F959CECB034F4E7 *)&a4->altitude;
    *(_OWORD *)((char *)&self->_startLocation.speedAccuracy + 4) = v14;
    *(_OWORD *)((char *)&self->_startLocation.verticalAccuracy + 4) = v13;
    *(_OWORD *)((char *)&self->_startLocation.horizontalAccuracy + 4) = v15;
    $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = a4->rawCoordinate;
    long long v16 = *(_OWORD *)&a4->rawCourse;
    long long v18 = *(_OWORD *)&a4->integrity;
    *(_OWORD *)((char *)&self->_startLocation.courseAccuracy + 4) = *(_OWORD *)&a4->lifespan;
    *(_OWORD *)&self->_startLocation.rawCoordinate.longitude = v18;
    *(_OWORD *)(&self->_startLocation.type + 1) = v16;
    *($AB5116BA7E623E054F959CECB034F4E7 *)(&self->_startLocation.confidence + 1) = rawCoordinate;
    [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithDouble:a5] forKeyedSubscript:@"TriggerDelay"];
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234CDC0);
    }
    long long v19 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      workingDirectory = self->_workingDirectory;
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = workingDirectory;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "CLWorkoutRecording: Writing files to %@, maxFileCount %d.", buf, 0x12u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234CDC0);
      }
      LOWORD(v31) = HIWORD(a7);
      BOOL v28 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecording start:recentLocation:triggerDelay:recentWeatherData:maxFileCount:]", "%s\n", v28);
      if (v28 != buf) {
        free(v28);
      }
    }
    *(void *)&long long v30 = self->_recordingType.var0;
    DWORD2(v30) = self->_recordingType.__r_.var0;
    HIDWORD(v30) = a7;
    sub_100134750(&v31, (char *)[(NSURL *)self->_workingDirectory fileSystemRepresentation]);
    sub_100134750(&v33, "recording");
    sub_100134750(&v35, "msl");
    LODWORD(v37) = 2;
    *((void *)&v37 + 1) = 300;
    uint64_t v21 = (char *)operator new(0xB0uLL);
    *((void *)v21 + 1) = 0;
    *((void *)v21 + 2) = 0;
    *(void *)uint64_t v21 = off_10234CDF0;
    *(_OWORD *)buf = v30;
    if (SHIBYTE(v32) < 0)
    {
      sub_1000DC48C(&buf[16], (void *)v31, *((unint64_t *)&v31 + 1));
    }
    else
    {
      *(_OWORD *)&buf[16] = v31;
      uint64_t v39 = v32;
    }
    if (SHIBYTE(v34) < 0)
    {
      sub_1000DC48C(&v40, (void *)v33, *((unint64_t *)&v33 + 1));
    }
    else
    {
      long long v40 = v33;
      uint64_t v41 = v34;
    }
    if (SHIBYTE(v36) < 0)
    {
      sub_1000DC48C(&__p, (void *)v35, *((unint64_t *)&v35 + 1));
    }
    else
    {
      long long __p = v35;
      uint64_t v43 = v36;
    }
    ptr = (WriterManager *)(v21 + 24);
    long long v44 = v37;
    sub_1016F7EC4(v21 + 24, buf);
    if (SHIBYTE(v43) < 0) {
      operator delete((void *)__p);
    }
    if (SHIBYTE(v41) < 0) {
      operator delete((void *)v40);
    }
    if (SHIBYTE(v39) < 0) {
      operator delete(*(void **)&buf[16]);
    }
    cntrl = self->_writer.__cntrl_;
    self->_writer.__ptr_ = ptr;
    self->_writer.__cntrl_ = (__shared_weak_count *)v21;
    if (cntrl)
    {
      sub_1000DB0A0((std::__shared_weak_count *)cntrl);
      ptr = self->_writer.__ptr_;
    }
    BOOL v23 = *((unsigned char *)ptr + 136) != 0;
    if (*((unsigned char *)ptr + 136))
    {
      [(CLWorkoutRecording *)self setupModuleWriters];
      [(CLWorkoutRecording *)self setupListeners];
      [(CLWorkoutRecording *)self recordWeatherData:a6];
    }
    else
    {
      id v26 = self->_writer.__cntrl_;
      self->_writer.__ptr_ = 0;
      self->_writer.__cntrl_ = 0;
      if (v26) {
        sub_1000DB0A0((std::__shared_weak_count *)v26);
      }
    }
    if (SHIBYTE(v36) < 0) {
      operator delete((void *)v35);
    }
    if (SHIBYTE(v34) < 0) {
      operator delete((void *)v33);
    }
    if (SHIBYTE(v32) < 0) {
      operator delete((void *)v31);
    }
  }
  else
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234CDC0);
    }
    v22 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "CLWorkoutRecording: start, no working directory", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234CDC0);
      }
      v29 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecording start:recentLocation:triggerDelay:recentWeatherData:maxFileCount:]", "%s\n", v29);
      if (v29 != buf) {
        free(v29);
      }
    }
    return 0;
  }
  return v23;
}

- (void)stop
{
  [(CLWorkoutRecording *)self teardownListeners];
  [(CLWorkoutRecording *)self writeStrideCalBins];
  *(CFAbsoluteTime *)&self->_startLocation.signalEnvironmentType = CFAbsoluteTimeGetCurrent();
  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    long long v9 = *(_OWORD *)ptr;
    if (*((char *)ptr + 39) < 0)
    {
      sub_1000DC48C(&v10, *((void **)ptr + 2), *((void *)ptr + 3));
    }
    else
    {
      long long v4 = *((_OWORD *)ptr + 1);
      uint64_t v11 = *((void *)ptr + 4);
      long long v10 = v4;
    }
    if (*((char *)ptr + 63) < 0)
    {
      sub_1000DC48C(&v12, *((void **)ptr + 5), *((void *)ptr + 6));
    }
    else
    {
      long long v5 = *(_OWORD *)((char *)ptr + 40);
      uint64_t v13 = *((void *)ptr + 7);
      long long v12 = v5;
    }
    if (*((char *)ptr + 87) < 0)
    {
      sub_1000DC48C(&__p, *((void **)ptr + 8), *((void *)ptr + 9));
    }
    else
    {
      long long v6 = *((_OWORD *)ptr + 4);
      uint64_t v15 = *((void *)ptr + 10);
      long long __p = v6;
    }
    long long v16 = *(_OWORD *)((char *)ptr + 88);
    double v7 = *(double *)&self->_startLocation.signalEnvironmentType - (double)(HIDWORD(v9) * DWORD2(v9));
    if (self->_startLocation.ellipsoidalAltitude < v7) {
      self->_startLocation.ellipsoidalAltitude = v7;
    }
    if (SHIBYTE(v15) < 0) {
      operator delete((void *)__p);
    }
    if (SHIBYTE(v13) < 0) {
      operator delete((void *)v12);
    }
    if (SHIBYTE(v11) < 0) {
      operator delete((void *)v10);
    }
  }
  cntrl = self->_writer.__cntrl_;
  self->_writer.__ptr_ = 0;
  self->_writer.__cntrl_ = 0;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
}

- (void)cleanup
{
}

- (BOOL)setWorkingDirectory:(id)a3
{
  v23[0] = [a3 path];
  v23[1] = [+[NSUUID UUID] UUIDString];
  long long v4 = +[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", +[NSArray arrayWithObjects:v23 count:2]);
  if ([+[NSFileManager defaultManager] fileExistsAtPath:[(NSURL *)v4 path]])
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234CDC0);
    }
    long long v5 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "CLWorkoutRecording: Recording working directory already exists. This should never happen.", buf, 2u);
    }
    BOOL v6 = 0;
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234CDC0);
      }
      LOWORD(v15) = 0;
      double v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutRecording setWorkingDirectory:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
      return 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
    [+[NSFileManager defaultManager] createDirectoryAtPath:[(NSURL *)v4 path] withIntermediateDirectories:1 attributes:0 error:&v14];
    BOOL v6 = v14 == 0;
    if (v14)
    {
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234CDC0);
      }
      v8 = qword_102419198;
      if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)long long v18 = v14;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "CLWorkoutRecording: Unable to create recording working directory, error: %{public}@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234CDC0);
        }
        int v15 = 138543362;
        uint64_t v16 = v14;
        long long v9 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutRecording setWorkingDirectory:]", "%s\n", v9);
        if (v9 != (char *)buf) {
          free(v9);
        }
      }
    }
    else
    {
      if (self->_workingDirectory)
      {
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234CDC0);
        }
        uint64_t v11 = qword_102419198;
        if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 68289539;
          *(_DWORD *)long long v18 = 0;
          *(_WORD *)&v18[4] = 2082;
          *(void *)&v18[6] = "";
          __int16 v19 = 2082;
          v20 = "assert";
          __int16 v21 = 2081;
          v22 = "!_workingDirectory";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLWorkoutRecording : Working directory should only ever be set once.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          if (qword_102419190 != -1) {
            dispatch_once(&qword_102419190, &stru_10234CDC0);
          }
        }
        long long v12 = qword_102419198;
        if (os_signpost_enabled((os_log_t)qword_102419198))
        {
          *(_DWORD *)buf = 68289539;
          *(_DWORD *)long long v18 = 0;
          *(_WORD *)&v18[4] = 2082;
          *(void *)&v18[6] = "";
          __int16 v19 = 2082;
          v20 = "assert";
          __int16 v21 = 2081;
          v22 = "!_workingDirectory";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLWorkoutRecording : Working directory should only ever be set once.", "{\"msg%{public}.0s\":\"CLWorkoutRecording : Working directory should only ever be set once.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          if (qword_102419190 != -1) {
            dispatch_once(&qword_102419190, &stru_10234CDC0);
          }
        }
        uint64_t v13 = qword_102419198;
        if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 68289539;
          *(_DWORD *)long long v18 = 0;
          *(_WORD *)&v18[4] = 2082;
          *(void *)&v18[6] = "";
          __int16 v19 = 2082;
          v20 = "assert";
          __int16 v21 = 2081;
          v22 = "!_workingDirectory";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLWorkoutRecording : Working directory should only ever be set once.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        }
        abort_report_np();
      }
      self->_workingDirectory = v4;
    }
  }
  return v6;
}

- (double)stopTime
{
  [(CLWorkoutRecording *)self makeSafeCFAbsoluteTime:*(double *)&self->_startLocation.signalEnvironmentType];
  return result;
}

- (void)updateMetadata
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = self->_modulesDict;
  id v16 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v16)
  {
    int v3 = 0;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v6 = [[self->_modulesDict objectForKeyedSubscript:v5] metadata];
        if (v6)
        {
          double v7 = v6;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          id v8 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v8)
          {
            id v9 = v8;
            uint64_t v10 = *(void *)v18;
            do
            {
              for (j = 0; j != v9; j = (char *)j + 1)
              {
                if (*(void *)v18 != v10) {
                  objc_enumerationMutation(v7);
                }
                -[NSMutableDictionary setValue:forKey:](self->_metadata, "setValue:forKey:", [v7 objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * (void)j)], *(void *)(*((void *)&v17 + 1) + 8 * (void)j));
              }
              id v9 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v9);
          }
        }
        id v12 = [[self->_modulesDict objectForKeyedSubscript:v5] getSampleCount];
        if (v3 <= (int)v12) {
          int v3 = (int)v12;
        }
        [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v12) forKeyedSubscript:+[NSString stringWithFormat:@"%@SampleCount", v5]];
      }
      id v16 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v16);
    double v13 = (float)v3;
  }
  else
  {
    double v13 = 0.0;
  }
  [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithDouble:v13 / (*(double *)&self->_startLocation.signalEnvironmentType - self->_startLocation.ellipsoidalAltitude)] forKeyedSubscript:@"ActiveSamplePerSeconds"];
}

- (NSDictionary)metadata
{
  return &self->_metadata->super;
}

- (NSArray)recordingURLs
{
  workingDirectory = self->_workingDirectory;
  if (!workingDirectory) {
    return 0;
  }
  sub_100134750(buf, (char *)[(NSURL *)workingDirectory fileSystemRepresentation]);
  sub_100134750(__p, "msl");
  sub_1019F0180((uint64_t *)buf, (uint64_t *)__p, &v14);
  if (SHIBYTE(v13) < 0) {
    operator delete(__p[0]);
  }
  if (v19 < 0) {
    operator delete(*(void **)buf);
  }
  int v3 = +[NSMutableArray arrayWithCapacity:0xAAAAAAAAAAAAAAABLL * ((v15 - v14) >> 3)];
  uint64_t v4 = v14;
  for (uint64_t i = v15; v4 != i; v4 += 24)
  {
    if (*(char *)(v4 + 23) < 0)
    {
      sub_1000DC48C(__p, *(void **)v4, *(void *)(v4 + 8));
    }
    else
    {
      long long v6 = *(_OWORD *)v4;
      uint64_t v13 = *(void *)(v4 + 16);
      *(_OWORD *)long long __p = v6;
    }
    if (v13 >= 0) {
      double v7 = __p;
    }
    else {
      double v7 = (void **)__p[0];
    }
    id v8 = +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", +[NSString stringWithUTF8String:v7], 0);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234CDC0);
    }
    id v9 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Adding file to be sent: %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234CDC0);
      }
      int v16 = 138412290;
      long long v17 = v8;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecording recordingURLs]", "%s\n", v10);
      if (v10 != buf) {
        free(v10);
      }
    }
    [(NSMutableArray *)v3 addObject:v8];
    if (SHIBYTE(v13) < 0) {
      operator delete(__p[0]);
    }
  }
  *(void *)buf = &v14;
  sub_1000A7B4C((void ***)buf);
  return &v3->super;
}

- (void)setupListeners
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  modulesDict = self->_modulesDict;
  id v4 = [(NSMutableDictionary *)modulesDict countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(modulesDict);
        }
        [self->_modulesDict[v8] setupListener];
      }
      id v5 = [(NSMutableDictionary *)modulesDict countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)teardownListeners
{
  [(CLWorkoutRecording *)self updateMetadata];
  [(CLWorkoutRecording *)self releaseBlocks];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  modulesDict = self->_modulesDict;
  id v4 = [(NSMutableDictionary *)modulesDict countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(modulesDict);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        [[self->_modulesDict objectForKeyedSubscript:v8] teardownListeners];
      }
      id v5 = [(NSMutableDictionary *)modulesDict countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v5);
  }

  self->_modulesDict = 0;
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234CDC0);
  }
  long long v9 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Tearing down listeners.", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234CDC0);
    }
    long long v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecording teardownListeners]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
}

- (void)recordWorkoutSessionPriors:(const void *)a3
{
  __chkstk_darwin(self);
  uint64_t v5 = v3[5];
  if (v5)
  {
    if (*(unsigned char *)(v5 + 136))
    {
      uint64_t v6 = v4;
      if (v4[10])
      {
        double v7 = v3;
        sub_10170140C(v14);
        [v7 makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
        v15 |= 1u;
        v14[77] = v8;
        sub_1017256B8((uint64_t)v14);
        sub_101761E98(v14[449]);
        uint64_t v9 = v6[6];
        uint64_t v10 = v6[7];
        if (v10 == v9) {
          unint64_t v11 = 0;
        }
        else {
          unint64_t v11 = *(void *)(v9 + 8 * (v6[9] / 0x18uLL)) + 168 * (v6[9] % 0x18uLL);
        }
        if (v10 == v9)
        {
          unint64_t v13 = 0;
        }
        else
        {
          unint64_t v12 = v6[10] + v6[9];
          unint64_t v13 = *(void *)(v9 + 8 * (v12 / 0x18)) + 168 * (v12 % 0x18);
        }
        if (v11 != v13) {
          sub_101762424();
        }
        sub_1016F8A70(v7[5], (uint64_t)v14);
        sub_101706914((PB::Base *)v14);
      }
    }
  }
}

- (void)writeStrideCalBins
{
  double v3 = __chkstk_darwin(self);
  uint64_t v4 = *(void *)(v2 + 40);
  if (v4)
  {
    if (*(unsigned char *)(v4 + 136))
    {
      uint64_t v5 = (uint64_t *)v2;
      if (!*(unsigned char *)(v2 + 120))
      {
        id v54 = [objc_msgSend(*(id *)(v2 + 24), "vendor", v3) proxyForService:@"CLStepCountNotifier"];
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id obj = [v54 syncgetCopyRawSpeedToKValueBins];
        id v6 = [obj countByEnumeratingWithState:&v66 objects:v87 count:16];
        if (v6)
        {
          uint64_t v7 = *(void *)v67;
          do
          {
            uint64_t v8 = 0;
            do
            {
              if (*(void *)v67 != v7) {
                objc_enumerationMutation(obj);
              }
              uint64_t v9 = *(void **)(*((void *)&v66 + 1) + 8 * (void)v8);
              sub_10170140C(v61);
              [v5 makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
              v65 |= 1u;
              uint64_t v62 = v10;
              sub_101727998((uint64_t)v61);
              uint64_t v11 = v64;
              [v9 begin];
              *(unsigned char *)(v11 + 40) |= 1u;
              *(void *)(v11 + 8) = v12;
              uint64_t v13 = v64;
              [v9 end];
              *(unsigned char *)(v13 + 40) |= 2u;
              *(void *)(v13 + 16) = v14;
              uint64_t v15 = v64;
              [v9 valueOut];
              *(unsigned char *)(v15 + 40) |= 4u;
              *(void *)(v15 + 24) = v16;
              uint64_t v17 = v64;
              unsigned int v18 = [v9 state];
              *(unsigned char *)(v17 + 40) |= 0x10u;
              *(_DWORD *)(v17 + 36) = v18;
              if (qword_102419190 != -1) {
                dispatch_once(&qword_102419190, &stru_10234CDC0);
              }
              char v19 = qword_102419198;
              if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v20 = *(void *)(v64 + 8);
                uint64_t v21 = *(void *)(v64 + 16);
                uint64_t v22 = *(void *)(v64 + 24);
                int v23 = *(_DWORD *)(v64 + 36);
                *(_DWORD *)buf = 134218752;
                uint64_t v80 = v20;
                __int16 v81 = 2048;
                uint64_t v82 = v21;
                __int16 v83 = 2048;
                uint64_t v84 = v22;
                __int16 v85 = 1024;
                int v86 = v23;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "CLWorkoutRecording: RawSpeedToKValue entry,begin,%f,end,%f,kValue,%f,state,%d", buf, 0x26u);
              }
              if (sub_10013D1A0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_102419190 != -1) {
                  dispatch_once(&qword_102419190, &stru_10234CDC0);
                }
                uint64_t v24 = *(void *)(v64 + 8);
                uint64_t v25 = *(void *)(v64 + 16);
                uint64_t v26 = *(void *)(v64 + 24);
                int v27 = *(_DWORD *)(v64 + 36);
                int v71 = 134218752;
                uint64_t v72 = v24;
                __int16 v73 = 2048;
                uint64_t v74 = v25;
                __int16 v75 = 2048;
                uint64_t v76 = v26;
                __int16 v77 = 1024;
                int v78 = v27;
                BOOL v28 = (char *)_os_log_send_and_compose_impl();
                sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecording writeStrideCalBins]", "%s\n", v28);
                if (v28 != (char *)buf) {
                  free(v28);
                }
              }
              sub_1016F8A70(v5[5], (uint64_t)v61);
              sub_101706914((PB::Base *)v61);
              uint64_t v8 = (char *)v8 + 1;
            }
            while (v6 != v8);
            id v29 = [obj countByEnumeratingWithState:&v66 objects:v87 count:16];
            id v6 = v29;
          }
          while (v29);
        }
        id v55 = [v54 syncgetCopyStepCadenceToStrideLengthBins];
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v30 = [v55 countByEnumeratingWithState:&v57 objects:v70 count:16];
        if (v30)
        {
          uint64_t v31 = *(void *)v58;
          do
          {
            uint64_t v32 = 0;
            do
            {
              if (*(void *)v58 != v31) {
                objc_enumerationMutation(v55);
              }
              long long v33 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v32);
              sub_10170140C(v61);
              [v5 makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
              v65 |= 1u;
              uint64_t v62 = v34;
              sub_101727C68((uint64_t)v61);
              uint64_t v35 = v63;
              [v33 begin];
              *(unsigned char *)(v35 + 40) |= 1u;
              *(void *)(v35 + 8) = v36;
              uint64_t v37 = v63;
              [v33 end];
              *(unsigned char *)(v37 + 40) |= 2u;
              *(void *)(v37 + 16) = v38;
              uint64_t v39 = v63;
              [v33 valueOut];
              *(unsigned char *)(v39 + 40) |= 4u;
              *(void *)(v39 + 24) = v40;
              uint64_t v41 = v63;
              unsigned int v42 = [v33 state];
              *(unsigned char *)(v41 + 40) |= 0x10u;
              *(_DWORD *)(v41 + 36) = v42;
              if (qword_102419190 != -1) {
                dispatch_once(&qword_102419190, &stru_10234CDC0);
              }
              uint64_t v43 = qword_102419198;
              if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v44 = *(void *)(v63 + 8);
                uint64_t v45 = *(void *)(v63 + 16);
                uint64_t v46 = *(void *)(v63 + 24);
                int v47 = *(_DWORD *)(v63 + 36);
                *(_DWORD *)buf = 134218752;
                uint64_t v80 = v44;
                __int16 v81 = 2048;
                uint64_t v82 = v45;
                __int16 v83 = 2048;
                uint64_t v84 = v46;
                __int16 v85 = 1024;
                int v86 = v47;
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "CLWorkoutRecording: StepCadenceToStrideLength entry,begin,%f,end,%f,strideLength,%f,state,%d", buf, 0x26u);
              }
              if (sub_10013D1A0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_102419190 != -1) {
                  dispatch_once(&qword_102419190, &stru_10234CDC0);
                }
                uint64_t v48 = *(void *)(v63 + 8);
                uint64_t v49 = *(void *)(v63 + 16);
                uint64_t v50 = *(void *)(v63 + 24);
                int v51 = *(_DWORD *)(v63 + 36);
                int v71 = 134218752;
                uint64_t v72 = v48;
                __int16 v73 = 2048;
                uint64_t v74 = v49;
                __int16 v75 = 2048;
                uint64_t v76 = v50;
                __int16 v77 = 1024;
                int v78 = v51;
                v52 = (char *)_os_log_send_and_compose_impl();
                sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecording writeStrideCalBins]", "%s\n", v52);
                if (v52 != (char *)buf) {
                  free(v52);
                }
              }
              sub_1016F8A70(v5[5], (uint64_t)v61);
              sub_101706914((PB::Base *)v61);
              uint64_t v32 = (char *)v32 + 1;
            }
            while (v30 != v32);
            id v53 = [v55 countByEnumeratingWithState:&v57 objects:v70 count:16];
            id v30 = v53;
          }
          while (v53);
        }
      }
    }
  }
}

- (void)recordWeatherData:(id)a3
{
  if (a3 && !BYTE1(self->_fFileTimeInterval))
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234CDC0);
    }
    uint64_t v5 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
    {
      [a3 timestamp];
      uint64_t v7 = v6;
      [a3 weatherPressure];
      double v9 = v8;
      id v10 = [[objc_msgSend(a3, "precipitationType") UTF8String];
      [a3 temperature];
      double v12 = v11;
      [a3 feelsLikeTemperature];
      *(_DWORD *)buf = 134350082;
      uint64_t v18 = v7;
      __int16 v19 = 2048;
      double v20 = v9;
      __int16 v21 = 2080;
      id v22 = v10;
      __int16 v23 = 2048;
      double v24 = v12;
      __int16 v25 = 2048;
      double v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "WeatherDataUpdate,timestamp,%{public}f,weatherPressure,%f,precipitationType,%s,temperature,%f,feelsLikeTemperature,%f", buf, 0x34u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234CDC0);
      }
      [a3 timestamp];
      [a3 weatherPressure];
      [objc_msgSend(a3, "precipitationType") UTF8String];
      [a3 temperature];
      [a3 feelsLikeTemperature];
      uint64_t v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecording recordWeatherData:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
    [a3 timestamp];
    [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKeyedSubscript:@"WeatherDataTimestamp"];
    [a3 weatherPressure];
    [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:") forKeyedSubscript:@"WeatherDataPressure"];
    [self->_metadata setObject:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(objc_msgSend(a3, "precipitationType"), "UTF8String")) forKeyedSubscript:@"WeatherDataPrecipitationType"];
    [a3 temperature];
    [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithDouble:sub_10126D934(v14)] forKeyedSubscript:@"WeatherDataTemperature"];
    [a3 feelsLikeTemperature];
    [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithDouble:sub_10126D934(v15)] forKeyedSubscript:@"WeatherDataFeelsLikeTemperature"];
  }
}

- (double)makeSafeCFAbsoluteTime:(double)a3
{
  if (a3 == 0.0) {
    return 0.0;
  }
  else {
    return self->_privacyTimeOffset + a3;
  }
}

- (void)recordWorkoutEffort:(const Result *)a3
{
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234CDC0);
  }
  uint64_t v5 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)a3;
    uint64_t v7 = *((void *)a3 + 1);
    double v8 = *((float *)a3 + 4);
    double v9 = *((float *)a3 + 5);
    int v10 = *((unsigned __int8 *)a3 + 24);
    *(_DWORD *)buf = 134219008;
    uint64_t v15 = v6;
    __int16 v16 = 2048;
    uint64_t v17 = v7;
    __int16 v18 = 2048;
    double v19 = v8;
    __int16 v20 = 2048;
    double v21 = v9;
    __int16 v22 = 1024;
    int v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "WorkoutRecorder CM Effort, Writing estimated workout effort to workout recorder startTime,%f,endTime,%f,estimatedWorkoutEffort,%f,estimatedWorkoutEffortPreBiasCorrection,%f,isTransient,%d", buf, 0x30u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234CDC0);
    }
    float v13 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecording recordWorkoutEffort:]", "%s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithDouble:*(double *)a3] forKeyedSubscript:@"estimatedWorkoutEffortStartTime"];
  [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithDouble:*((double *)a3 + 1)] forKeyedSubscript:@"estimatedWorkoutEffortEndTime"];
  LODWORD(v11) = *((_DWORD *)a3 + 4);
  [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithFloat:v11] forKeyedSubscript:@"estimatedWorkoutEffort"];
  LODWORD(v12) = *((_DWORD *)a3 + 5);
  [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithFloat:v12] forKeyedSubscript:@"estimatedWorkoutEffortPreBiasCorrection"];
  [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithBool:*((unsigned __int8 *)a3 + 24)] forKeyedSubscript:@"estimatedWorkoutEffortIsTransient"];
}

- (void)deleteWorkingDirectory
{
  if (self->_workingDirectory)
  {
    uint64_t v4 = 0;
    [+[NSFileManager defaultManager] removeItemAtURL:self->_workingDirectory error:&v4];
    if (v4)
    {
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234CDC0);
      }
      uint64_t v2 = qword_102419198;
      if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v8 = v4;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Unable to delete recording working directory, error: %{public}@", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234CDC0);
        }
        int v5 = 138543362;
        uint64_t v6 = v4;
        double v3 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutRecording deleteWorkingDirectory]", "%s\n", v3);
        if (v3 != (char *)buf) {
          free(v3);
        }
      }
    }
  }
}

- (CLDaemonLocation)getStartLocation
{
  $AB5116BA7E623E054F959CECB034F4E7 v3 = *($AB5116BA7E623E054F959CECB034F4E7 *)((char *)&self[1].speedAccuracy + 4);
  *(_OWORD *)&retstr->lifespan = *(_OWORD *)((char *)&self[1].verticalAccuracy + 4);
  retstr->$AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = v3;
  *(_OWORD *)&retstr->rawCourse = *(_OWORD *)((char *)&self[1].courseAccuracy + 4);
  long long v4 = *(_OWORD *)(&self->fromSimulationController + 4);
  *(_OWORD *)&retstr->altitude = *(_OWORD *)(&self->signalEnvironmentType + 1);
  *(_OWORD *)&retstr->speed = v4;
  long long v5 = *(_OWORD *)((char *)&self[1].horizontalAccuracy + 4);
  *($AB5116BA7E623E054F959CECB034F4E7 *)&retstr->course = *($AB5116BA7E623E054F959CECB034F4E7 *)((char *)&self[1].coordinate
                                                                                               + 4);
  *(_OWORD *)&retstr->timestamp = v5;
  long long v6 = *(_OWORD *)&self->integrity;
  *(_OWORD *)&retstr->suitability = *(_OWORD *)((char *)&self->rawCoordinate.longitude + 4);
  *(_OWORD *)&retstr->coordinate.longitude = v6;
  *(_OWORD *)&retstr->integrity = *(_OWORD *)&self[1].confidence;
  return self;
}

- (void)setupModuleWriters
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  modulesDict = self->_modulesDict;
  id v4 = [(NSMutableDictionary *)modulesDict countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(modulesDict);
        }
        id v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_modulesDict, "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * i), ptr);
        cntrl = self->_writer.__cntrl_;
        ptr = self->_writer.__ptr_;
        int v10 = cntrl;
        if (cntrl) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
        }
        [v7 setWriter:&ptr];
        if (v10) {
          sub_1000DB0A0((std::__shared_weak_count *)v10);
        }
      }
      id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](modulesDict, "countByEnumeratingWithState:objects:count:", &v11, v15, 16, ptr);
    }
    while (v4);
  }
}

- (void)setMotionStateFunction:(id)a3
{
  uint64_t v5 = *(const void **)&self->_startLocation.floor;
  if (v5) {
    _Block_release(v5);
  }
  *(void *)&self->_startLocation.floor = _Block_copy(a3);
}

- (void)releaseBlocks
{
  _Block_release(*(const void **)&self->_startLocation.floor);
  $AB5116BA7E623E054F959CECB034F4E7 v3 = *(const void **)&self->_startLocation.referenceFrame;

  _Block_release(v3);
}

- (double)startTime
{
  return self->_startLocation.ellipsoidalAltitude;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_recordingType.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->_recordingType.__r_.__value_.var0.var1.__data_);
  }
  cntrl = self->_writer.__cntrl_;
  if (cntrl)
  {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *(_OWORD *)((char *)self + 88) = 0uLL;
  *((void *)self + 10) = 0;
  *((_DWORD *)self + 31) = 0xFFFF;
  *((void *)self + 16) = 0;
  *((void *)self + 17) = 0;
  __asm { FMOV            V1.2D, #-1.0 }
  *((_OWORD *)self + 9) = xmmword_101D1C320;
  *((_OWORD *)self + 10) = _Q1;
  *((_OWORD *)self + 11) = _Q1;
  *((_OWORD *)self + 12) = _Q1;
  *((_DWORD *)self + 52) = 0;
  *(void *)((char *)self + 212) = 0xBFF0000000000000;
  *(void *)((char *)self + 228) = 0;
  *(void *)((char *)self + 220) = 0;
  *((_DWORD *)self + 59) = 0;
  *((void *)self + 30) = 0xBFF0000000000000;
  *((_DWORD *)self + 62) = 0x7FFFFFFF;
  *(void *)((char *)self + 260) = 0;
  *((unsigned char *)self + 276) = 0;
  *(void *)((char *)self + 252) = 0;
  *(void *)((char *)self + 268) = 0;
  return self;
}

@end