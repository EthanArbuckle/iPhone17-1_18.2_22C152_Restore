@interface CLWMMotionState
- (CLDaemonLocation)getStartLocation;
- (CLWMMotionState)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (id)getRecordEventBlock;
- (id)metadata;
- (int)getSampleCount;
- (void)dealloc;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)recordWorkoutSessionEvent:(const WorkoutEvent *)a3;
- (void)releaseBlocks;
- (void)setBlockUpdateIsCycling:(id)a3;
- (void)setGetStartLocation:(id)a3;
- (void)setWorkoutCount:(int)a3;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
- (void)updateCyclingWorkout:(BOOL)a3;
- (void)writeWorkoutEvent:(const WorkoutEvent *)a3;
@end

@implementation CLWMMotionState

- (id)getRecordEventBlock
{
  return *(id *)&self->_startLocation.fromSimulationController;
}

- (CLWMMotionState)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v12.receiver = self;
  v12.super_class = (Class)CLWMMotionState;
  v8 = [(CLWMBase *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_metadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9->_disableLatLong = a5->disableLatLong;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 3221225472;
    aBlock[2] = sub_101A3377C;
    aBlock[3] = &unk_10234DA28;
    aBlock[4] = v9;
    *(void *)&v9->_startLocation.fromSimulationController = _Block_copy(aBlock);
    v9->_sampleCount = 0;
  }
  return v9;
}

- (void)setupListener
{
}

- (void)teardownListeners
{
  value = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }

  [(CLWMMotionState *)self releaseBlocks];
}

- (void)dealloc
{
  self->_metadata = 0;
  v5.receiver = self;
  v5.super_class = (Class)CLWMMotionState;
  [(CLWMBase *)&v5 dealloc];
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234DA48);
  }
  v3 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLWMMotionState deallocation is complete", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234DA48);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWMMotionState dealloc]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (id)metadata
{
  id v2 = [(NSMutableDictionary *)self->_metadata copy];

  return v2;
}

- (void)setGetStartLocation:(id)a3
{
  double ellipsoidalAltitude = self->_startLocation.ellipsoidalAltitude;
  if (ellipsoidalAltitude != 0.0) {
    _Block_release(*(const void **)&ellipsoidalAltitude);
  }
  *(void *)&self->_startLocation.double ellipsoidalAltitude = _Block_copy(a3);
}

- (void)setBlockUpdateIsCycling:(id)a3
{
  id getstartLocation = self->_getstartLocation;
  if (getstartLocation) {
    _Block_release(getstartLocation);
  }
  self->_id getstartLocation = _Block_copy(a3);
}

- (void)updateCyclingWorkout:(BOOL)a3
{
  id getstartLocation = (void (**)(id, BOOL))self->_getstartLocation;
  if (getstartLocation) {
    getstartLocation[2](getstartLocation, a3);
  }
}

- (CLDaemonLocation)getStartLocation
{
  result = *(CLDaemonLocation **)&self->_startLocation.ellipsoidalAltitude;
  if (result)
  {
    result = (CLDaemonLocation *)(*(void *(**)(_OWORD *__return_ptr))&result->coordinate.longitude)(v14);
    $AB5116BA7E623E054F959CECB034F4E7 v6 = ($AB5116BA7E623E054F959CECB034F4E7)v14[7];
    *(_OWORD *)&self->_startLocation.lifespan = v14[6];
    self->_startLocation.$AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = v6;
    *(_OWORD *)&self->_startLocation.rawCourse = *(_OWORD *)v15;
    *(_OWORD *)&self->_startLocation.integrity = *(_OWORD *)&v15[12];
    long long v7 = v14[3];
    *(_OWORD *)&self->_startLocation.altitude = v14[2];
    *(_OWORD *)&self->_startLocation.speed = v7;
    long long v8 = v14[5];
    *(_OWORD *)&self->_startLocation.course = v14[4];
    *(_OWORD *)&self->_startLocation.timestamp = v8;
    long long v9 = v14[1];
    *(_OWORD *)&self->_startLocation.suitability = v14[0];
    *(_OWORD *)&self->_startLocation.coordinate.longitude = v9;
  }
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = self->_startLocation.rawCoordinate;
  *(_OWORD *)&retstr->lifespan = *(_OWORD *)&self->_startLocation.lifespan;
  retstr->$AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = rawCoordinate;
  *(_OWORD *)&retstr->rawCourse = *(_OWORD *)&self->_startLocation.rawCourse;
  *(_OWORD *)&retstr->integrity = *(_OWORD *)&self->_startLocation.integrity;
  long long v11 = *(_OWORD *)&self->_startLocation.speed;
  *(_OWORD *)&retstr->altitude = *(_OWORD *)&self->_startLocation.altitude;
  *(_OWORD *)&retstr->speed = v11;
  long long v12 = *(_OWORD *)&self->_startLocation.timestamp;
  *(_OWORD *)&retstr->course = *(_OWORD *)&self->_startLocation.course;
  *(_OWORD *)&retstr->timestamp = v12;
  long long v13 = *(_OWORD *)&self->_startLocation.coordinate.longitude;
  *(_OWORD *)&retstr->suitability = *(_OWORD *)&self->_startLocation.suitability;
  *(_OWORD *)&retstr->coordinate.longitude = v13;
  return result;
}

- (void)writeWorkoutEvent:(const WorkoutEvent *)a3
{
  ptr = self->_writer.__ptr_;
  if (!ptr || !*((unsigned char *)ptr + 136)) {
    return;
  }
  ++self->_sampleCount;
  int64_t var2 = a3->var2;
  if ((unint64_t)(var2 - 8) < 2)
  {
    [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithInteger:a3->var5.var3] forKeyedSubscript:@"PredictedWorkoutType"];
    long long v7 = +[NSNumber numberWithInteger:a3->var5.var4];
    metadata = self->_metadata;
    CFStringRef v9 = @"PredictedWorkoutLocationType";
  }
  else if (var2)
  {
    if (var2 != 1 || (sub_101A34714((float *)&self->_activitySet, a3->var5.var3, a3->var5.var3) & 1) == 0) {
      goto LABEL_13;
    }
    long long v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[[self->_metadata objectForKeyedSubscript:@"UniqueWorkoutActivityCount"] integerValue]+ 1);
    metadata = self->_metadata;
    CFStringRef v9 = @"UniqueWorkoutActivityCount";
  }
  else
  {
    if (sub_101A34714((float *)&self->_activitySet, a3->var5.var3, a3->var5.var3)) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metadata, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[self->_metadata objectForKeyedSubscript:@"UniqueWorkoutActivityCount"]+ 1), @"UniqueWorkoutActivityCount");
    }
    [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithInteger:a3->var5.var3] forKeyedSubscript:@"WorkoutActivityType"];
    long long v7 = +[NSNumber numberWithInteger:a3->var5.var4];
    metadata = self->_metadata;
    CFStringRef v9 = @"WorkoutActivityLocationType";
  }
  [(NSMutableDictionary *)metadata setObject:v7 forKeyedSubscript:v9];
LABEL_13:
  if (!self->_disableLatLong)
  {
    unint64_t v10 = a3->var2;
    if (v10 <= 0xD && ((1 << v10) & 0x2300) != 0)
    {
      [(CLWMMotionState *)self getStartLocation];
      [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithLong:llround(v43)] forKeyedSubscript:@"CoarseLatitude2"];
      [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithLong:llround(*(double *)v44)] forKeyedSubscript:@"CoarseLongitude2"];
    }
  }
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234DA48);
  }
  long long v11 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v12 = a3->var2;
    int64_t var3 = a3->var5.var3;
    int64_t var4 = a3->var5.var4;
    *(_DWORD *)buf = 134218496;
    double v43 = *(double *)&v12;
    *(_WORD *)v44 = 2048;
    *(void *)&v44[2] = var3;
    __int16 v45 = 2048;
    int64_t v46 = var4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received: WorkoutEventType: %ld WorkoutType: %ld Location: %ld", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234DA48);
    }
    int64_t v38 = a3->var2;
    int64_t v39 = a3->var5.var3;
    int64_t v40 = a3->var5.var4;
    int v50 = 134218496;
    int64_t v51 = v38;
    __int16 v52 = 2048;
    int64_t v53 = v39;
    __int16 v54 = 2048;
    int64_t v55 = v40;
    v41 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWMMotionState writeWorkoutEvent:]", "%s\n", v41);
    if (v41 != (char *)buf) {
      free(v41);
    }
  }
  sub_10170140C(buf);
  [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
  v49 |= 1u;
  uint64_t v47 = v15;
  sub_101724038((uint64_t)buf);
  sub_101761994(v48);
  uint64_t v16 = v48;
  uint64_t v17 = *(void *)(v48 + 8);
  int64_t v18 = a3->var5.var3;
  *(_WORD *)(v17 + 64) |= 0x200u;
  *(_DWORD *)(v17 + 60) = v18;
  uint64_t v19 = *(void *)(v16 + 8);
  int64_t v20 = a3->var2;
  *(_WORD *)(v19 + 64) |= 0x10u;
  *(_DWORD *)(v19 + 40) = v20;
  uint64_t v21 = *(void *)(v16 + 8);
  [(CLWMBase *)self makeSafeCFAbsoluteTime:a3->var3];
  *(_WORD *)(v21 + 64) |= 2u;
  *(void *)(v21 + 16) = v22;
  uint64_t v23 = *(void *)(v16 + 8);
  [(CLWMBase *)self makeSafeCFAbsoluteTime:a3->var0];
  *(_WORD *)(v23 + 64) |= 8u;
  *(void *)(v23 + 32) = v24;
  if (a3->var1 != 1.79769313e308)
  {
    uint64_t v25 = *(void *)(v16 + 8);
    -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:");
    *(_WORD *)(v25 + 64) |= 1u;
    *(void *)(v25 + 8) = v26;
  }
  uint64_t v27 = *(void *)(v16 + 8);
  int64_t v28 = a3->var5.var4;
  *(_WORD *)(v27 + 64) |= 0x80u;
  *(_DWORD *)(v27 + 52) = v28;
  uint64_t v29 = *(void *)(v16 + 8);
  unint64_t var7 = a3->var5.var7;
  *(_WORD *)(v29 + 64) |= 0x100u;
  *(_DWORD *)(v29 + 56) = var7;
  int64_t v31 = a3->var5.var3;
  if (v31 == 14)
  {
    uint64_t v36 = *(void *)(v16 + 8);
    int64_t var0 = a3->var5.var5.var0.var0;
    *(_WORD *)(v36 + 64) |= 0x20u;
    *(_DWORD *)(v36 + 44) = var0;
  }
  else if (v31 == 19)
  {
    uint64_t v32 = *(void *)(v16 + 8);
    int64_t v33 = a3->var5.var5.var0.var0;
    *(_WORD *)(v32 + 64) |= 0x40u;
    *(_DWORD *)(v32 + 48) = v33;
    uint64_t v34 = *(void *)(v16 + 8);
    double var1 = a3->var5.var5.var0.var1;
    *(_WORD *)(v34 + 64) |= 4u;
    *(double *)(v34 + 24) = var1;
  }
  sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)buf);
  sub_101706914((PB::Base *)buf);
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 2)
  {
    long long v8 = *((_OWORD *)a4 + 13);
    long long v29 = *((_OWORD *)a4 + 12);
    long long v30 = v8;
    uint64_t v31 = *((void *)a4 + 28);
    long long v9 = *((_OWORD *)a4 + 9);
    long long v25 = *((_OWORD *)a4 + 8);
    long long v26 = v9;
    long long v10 = *((_OWORD *)a4 + 11);
    long long v27 = *((_OWORD *)a4 + 10);
    long long v28 = v10;
    long long v11 = *((_OWORD *)a4 + 5);
    long long v21 = *((_OWORD *)a4 + 4);
    long long v22 = v11;
    long long v12 = *((_OWORD *)a4 + 7);
    long long v23 = *((_OWORD *)a4 + 6);
    long long v24 = v12;
    long long v13 = *((_OWORD *)a4 + 1);
    *(_OWORD *)buf = *(_OWORD *)a4;
    long long v18 = v13;
    long long v14 = *((_OWORD *)a4 + 3);
    long long v19 = *((_OWORD *)a4 + 2);
    long long v20 = v14;
    if (!sub_1010143E0((uint64_t)buf))
    {
      [(CLWMMotionState *)self writeWorkoutEvent:buf];
      if ((void)v18 == 18 || (void)v18 == 14) {
        [(CLWMMotionState *)self updateCyclingWorkout:sub_1010143C0(v24)];
      }
    }
  }
  else
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234DA48);
    }
    uint64_t v15 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled motion state mediator notification", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234DA48);
      }
      uint64_t v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWMMotionState onMotionStateMediatorNotification:data:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
  }
}

- (void)recordWorkoutSessionEvent:(const WorkoutEvent *)a3
{
  if (sub_1010143E0((uint64_t)a3))
  {
    [(CLWMMotionState *)self writeWorkoutEvent:a3];
  }
}

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
  p_writer = &self->_writer;
  objc_super v5 = *(WriterManager **)a3.__ptr_;
  uint64_t v4 = *((void *)a3.__ptr_ + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_writer.__cntrl_;
  p_writer->__ptr_ = v5;
  p_writer->__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
}

- (int)getSampleCount
{
  return self->_sampleCount;
}

- (void)setWorkoutCount:(int)a3
{
  uint64_t v4 = +[NSNumber numberWithInt:*(void *)&a3];
  metadata = self->_metadata;

  [(NSMutableDictionary *)metadata setObject:v4 forKeyedSubscript:@"UniqueWorkoutActivityCount"];
}

- (void)releaseBlocks
{
  _Block_release(*(const void **)&self->_startLocation.ellipsoidalAltitude);
  _Block_release(*(const void **)&self->_startLocation.fromSimulationController);
  id getstartLocation = self->_getstartLocation;

  _Block_release(getstartLocation);
}

- (void).cxx_destruct
{
  p_activitySet = &self->_activitySet;
  next = self->_activitySet.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      objc_super v5 = (void *)*next;
      operator delete(next);
      next = v5;
    }
    while (v5);
  }
  value = p_activitySet->__table_.__bucket_list_.__ptr_.__value_;
  p_activitySet->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  cntrl = self->_writer.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  long long v8 = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = 0;
  if (v8)
  {
    long long v9 = *(void (**)(void))(*(void *)v8 + 8);
    v9();
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  *((_DWORD *)self + 28) = 0xFFFF;
  *(void *)((char *)self + 116) = 0;
  *(void *)((char *)self + 124) = 0;
  *(_OWORD *)((char *)self + 132) = xmmword_101D1C320;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)((char *)self + 148) = _Q0;
  *(_OWORD *)((char *)self + 164) = _Q0;
  *(_OWORD *)((char *)self + 180) = _Q0;
  *((_DWORD *)self + 49) = 0;
  *((_DWORD *)self + 56) = 0;
  *((void *)self + 25) = 0xBFF0000000000000;
  *((void *)self + 26) = 0;
  *((void *)self + 27) = 0;
  *(void *)((char *)self + 228) = 0xBFF0000000000000;
  *((_DWORD *)self + 59) = 0x7FFFFFFF;
  *((void *)self + 31) = 0;
  *((void *)self + 32) = 0;
  *((void *)self + 30) = 0;
  *((unsigned char *)self + 264) = 0;
  return self;
}

@end