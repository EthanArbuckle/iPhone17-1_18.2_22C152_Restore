@interface CLWMGymKit
- (CLWMGymKit)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (id)getBlockSetIsCycling;
- (id)metadata;
- (int)getSampleCount;
- (void)dealloc;
- (void)onFitnessMachineNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)releaseBlocks;
- (void)setIsCyclingWorkout:(BOOL)a3;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
- (void)writeClimbingGymkitData:(const _CLFitnessMachineData *)a3;
- (void)writeCyclingGymkitData:(const _CLFitnessMachineData *)a3;
- (void)writeTreadmillGymkitData:(const _CLFitnessMachineData *)a3;
@end

@implementation CLWMGymKit

- (void)setIsCyclingWorkout:(BOOL)a3
{
  self->_isCyclingWorkout = a3;
}

- (CLWMGymKit)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v15.receiver = self;
  v15.super_class = (Class)CLWMGymKit;
  v8 = [(CLWMBase *)&v15 init];
  if (v8)
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234CEC8);
    }
    v9 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "GymKit module is initialized.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234CEC8);
      }
      __int16 v14 = 0;
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWMGymKit initWithDelegate:universeCopy:settings:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    v8->_metadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_disableForceActiveListeners = a5->disableForceActiveListeners;
    v8->_sampleCount = 0;
    v8->_isCyclingWorkout = sub_1010143C0(*(void *)&a5[1].hasSyncInWatch);
    v8->_isTreadmillWorkout = sub_1010143D0(*(void *)&a5[1].hasSyncInWatch);
    uint64_t v10 = *(void *)&a5[1].hasSyncInWatch;
    v8->_isEllipticalWorkout = v10 == 9;
    v8->_isStairmillWorkout = v10 == 11;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 3221225472;
    aBlock[2] = sub_101A186A0;
    aBlock[3] = &unk_1022B7C20;
    aBlock[4] = v8;
    v8->_getBlockSetIsCycling = _Block_copy(aBlock);
  }
  return v8;
}

- (void)setupListener
{
  if (!self->_fitnessMachineClient.__ptr_.__value_) {
    sub_10117E410();
  }
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234CEC8);
  }
  v2 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    __int16 v6 = 2082;
    v7 = "";
    __int16 v8 = 2082;
    v9 = "assert";
    __int16 v10 = 2081;
    v11 = "!_fitnessMachineClient";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Duplicate creation of heart rate listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234CEC8);
    }
  }
  v3 = qword_102419198;
  if (os_signpost_enabled((os_log_t)qword_102419198))
  {
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    __int16 v6 = 2082;
    v7 = "";
    __int16 v8 = 2082;
    v9 = "assert";
    __int16 v10 = 2081;
    v11 = "!_fitnessMachineClient";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Duplicate creation of heart rate listener.", "{\"msg%{public}.0s\":\"Duplicate creation of heart rate listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234CEC8);
    }
  }
  v4 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    __int16 v6 = 2082;
    v7 = "";
    __int16 v8 = 2082;
    v9 = "assert";
    __int16 v10 = 2081;
    v11 = "!_fitnessMachineClient";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Duplicate creation of heart rate listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }
  abort_report_np();
}

- (void)teardownListeners
{
  value = self->_fitnessMachineClient.__ptr_.__value_;
  self->_fitnessMachineClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }

  [(CLWMGymKit *)self releaseBlocks];
}

- (void)onFitnessMachineNotification:(const int *)a3 data:(const NotificationData *)a4
{
  ptr = self->_writer.__ptr_;
  if (ptr && *((unsigned char *)ptr + 136))
  {
    int v5 = *((_DWORD *)a4 + 40);
    if (*a3) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = v5 == 1;
    }
    if (v6) {
      goto LABEL_10;
    }
    if (v5) {
      return;
    }
    if (self->_isCyclingWorkout)
    {
LABEL_10:
      [(CLWMGymKit *)self writeCyclingGymkitData:a4];
      return;
    }
    if (!*a3)
    {
      if (self->_isTreadmillWorkout)
      {
        [(CLWMGymKit *)self writeTreadmillGymkitData:a4];
      }
      else if (self->_isEllipticalWorkout || self->_isStairmillWorkout)
      {
        [(CLWMGymKit *)self writeClimbingGymkitData:a4];
      }
    }
  }
}

- (void)writeCyclingGymkitData:(const _CLFitnessMachineData *)a3
{
  [(NSMutableDictionary *)self->_metadata setObject:&__kCFBooleanTrue forKeyedSubscript:@"HasCyclingMeterData"];
  ++self->_sampleCount;
  sub_10170140C(v26);
  [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
  v28 |= 1u;
  v26[77] = v5;
  sub_1017260D8((uint64_t)v26);
  sub_10175EB4C(v27);
  uint64_t v6 = v27;
  uint64_t v7 = *(void *)(v27 + 8);
  [(CLWMBase *)self makeSafeCFAbsoluteTime:a3->var0];
  *(_DWORD *)(v7 + 176) |= 0x800u;
  *(void *)(v7 + 96) = v8;
  uint64_t v9 = *(void *)(v6 + 8);
  double var14 = a3->var14;
  *(_DWORD *)(v9 + 176) |= 0x20u;
  *(double *)(v9 + 48) = var14;
  double var15 = a3->var15;
  uint64_t v12 = *(void *)(v6 + 8);
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  if (var15 > 0.0)
  {
    uint64_t v14 = 0;
    if (var15 != 1.79769313e308)
    {
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", var15, 0.0);
      uint64_t v14 = v15;
    }
  }
  *(_DWORD *)(v12 + 176) |= 0x80u;
  *(void *)(v12 + 64) = v14;
  uint64_t v16 = *(void *)(v6 + 8);
  double var11 = a3->var11;
  *(_DWORD *)(v16 + 176) |= 0x10u;
  *(double *)(v16 + 40) = var11;
  double var12 = a3->var12;
  uint64_t v19 = *(void *)(v6 + 8);
  if (var12 > 0.0 && var12 != 1.79769313e308)
  {
    -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:");
    uint64_t v13 = v20;
  }
  *(_DWORD *)(v19 + 176) |= 2u;
  *(void *)(v19 + 16) = v13;
  uint64_t v21 = *(void *)(v6 + 8);
  double var8 = a3->var8;
  *(_DWORD *)(v21 + 176) |= 0x40u;
  *(double *)(v21 + 56) = var8;
  double var9 = a3->var9;
  uint64_t v24 = *(void *)(v6 + 8);
  uint64_t v25 = 0;
  if (var9 > 0.0 && var9 != 1.79769313e308) {
    [(CLWMBase *)self makeSafeCFAbsoluteTime:var9];
  }
  *(_DWORD *)(v24 + 176) |= 0x400u;
  *(void *)(v24 + 88) = v25;
  sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)v26);
  sub_101706914((PB::Base *)v26);
}

- (void)writeTreadmillGymkitData:(const _CLFitnessMachineData *)a3
{
  [(NSMutableDictionary *)self->_metadata setObject:&__kCFBooleanTrue forKeyedSubscript:@"HasTreadmillData"];
  ++self->_sampleCount;
  sub_10170140C(v22);
  [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
  v24 |= 1u;
  v22[77] = v5;
  sub_1017260D8((uint64_t)v22);
  sub_10175EB4C(v23);
  uint64_t v6 = v23;
  uint64_t v7 = *(void *)(v23 + 8);
  [(CLWMBase *)self makeSafeCFAbsoluteTime:a3->var0];
  *(_DWORD *)(v7 + 176) |= 0x800u;
  *(void *)(v7 + 96) = v8;
  uint64_t v9 = *(void *)(v6 + 8);
  [(CLWMBase *)self makeSafeCFAbsoluteTime:a3->var1];
  *(_DWORD *)(v9 + 176) |= 4u;
  *(void *)(v9 + 24) = v10;
  uint64_t v11 = *(void *)(v6 + 8);
  double var17 = a3->var17;
  *(_DWORD *)(v11 + 176) |= 8u;
  *(double *)(v11 + 32) = var17;
  uint64_t v13 = *(void *)(v6 + 8);
  double var2 = a3->var2;
  *(_DWORD *)(v13 + 176) |= 0x8000u;
  *(double *)(v13 + 128) = var2;
  uint64_t v15 = *(void *)(v6 + 8);
  double var3 = a3->var3;
  *(_DWORD *)(v15 + 176) |= 0x2000u;
  *(double *)(v15 + 112) = var3;
  uint64_t v17 = *(void *)(v6 + 8);
  double var8 = a3->var8;
  *(_DWORD *)(v17 + 176) |= 0x40u;
  *(double *)(v17 + 56) = var8;
  double var9 = a3->var9;
  uint64_t v20 = *(void *)(v6 + 8);
  uint64_t v21 = 0;
  if (var9 > 0.0 && var9 != 1.79769313e308) {
    [(CLWMBase *)self makeSafeCFAbsoluteTime:var9];
  }
  *(_DWORD *)(v20 + 176) |= 0x400u;
  *(void *)(v20 + 88) = v21;
  sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)v22);
  sub_101706914((PB::Base *)v22);
}

- (void)writeClimbingGymkitData:(const _CLFitnessMachineData *)a3
{
  if (self->_isEllipticalWorkout)
  {
    CFStringRef v5 = @"HasEllipticalData";
LABEL_5:
    [(NSMutableDictionary *)self->_metadata setObject:&__kCFBooleanTrue forKeyedSubscript:v5];
    goto LABEL_6;
  }
  if (self->_isStairmillWorkout)
  {
    CFStringRef v5 = @"HasStairMillData";
    goto LABEL_5;
  }
LABEL_6:
  ++self->_sampleCount;
  sub_10170140C(v29);
  [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
  v31 |= 1u;
  v29[77] = v6;
  sub_1017260D8((uint64_t)v29);
  sub_10175EB4C(v30);
  uint64_t v7 = v30;
  uint64_t v8 = *(void *)(v30 + 8);
  [(CLWMBase *)self makeSafeCFAbsoluteTime:a3->var0];
  *(_DWORD *)(v8 + 176) |= 0x800u;
  *(void *)(v8 + 96) = v9;
  uint64_t v10 = *(void *)(v7 + 8);
  [(CLWMBase *)self makeSafeCFAbsoluteTime:a3->var1];
  *(_DWORD *)(v10 + 176) |= 4u;
  *(void *)(v10 + 24) = v11;
  uint64_t v12 = *(void *)(v7 + 8);
  double var2 = a3->var2;
  *(_DWORD *)(v12 + 176) |= 0x8000u;
  *(double *)(v12 + 128) = var2;
  uint64_t v14 = *(void *)(v7 + 8);
  double var3 = a3->var3;
  *(_DWORD *)(v14 + 176) |= 0x2000u;
  *(double *)(v14 + 112) = var3;
  uint64_t v16 = *(void *)(v7 + 8);
  double var4 = a3->var4;
  *(_DWORD *)(v16 + 176) |= 0x4000u;
  *(double *)(v16 + 120) = var4;
  uint64_t v18 = *(void *)(v7 + 8);
  int64_t var7 = a3->var7;
  *(_DWORD *)(v18 + 176) |= 0x10000u;
  *(void *)(v18 + 136) = var7;
  uint64_t v20 = *(void *)(v7 + 8);
  int64_t var5 = a3->var5;
  *(_DWORD *)(v20 + 176) |= 0x20000u;
  *(void *)(v20 + 144) = var5;
  uint64_t v22 = *(void *)(v7 + 8);
  double var18 = a3->var18;
  *(_DWORD *)(v22 + 176) |= 0x100u;
  *(double *)(v22 + 72) = var18;
  uint64_t v24 = *(void *)(v7 + 8);
  double var14 = a3->var14;
  *(_DWORD *)(v24 + 176) |= 0x20u;
  *(double *)(v24 + 48) = var14;
  double var15 = a3->var15;
  uint64_t v27 = *(void *)(v7 + 8);
  uint64_t v28 = 0;
  if (var15 > 0.0 && var15 != 1.79769313e308) {
    [(CLWMBase *)self makeSafeCFAbsoluteTime:var15];
  }
  *(_DWORD *)(v27 + 176) |= 0x80u;
  *(void *)(v27 + 64) = v28;
  sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)v29);
  sub_101706914((PB::Base *)v29);
}

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
  p_writer = &self->_writer;
  CFStringRef v5 = *(WriterManager **)a3.__ptr_;
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

- (id)getBlockSetIsCycling
{
  return self->_getBlockSetIsCycling;
}

- (void)releaseBlocks
{
}

- (void)dealloc
{
  self->_metadata = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWMGymKit;
  [(CLWMBase *)&v3 dealloc];
}

- (id)metadata
{
  id v2 = [(NSMutableDictionary *)self->_metadata copy];

  return v2;
}

- (void).cxx_destruct
{
  cntrl = self->_writer.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  value = self->_fitnessMachineClient.__ptr_.__value_;
  self->_fitnessMachineClient.__ptr_.__value_ = 0;
  if (value)
  {
    CFStringRef v5 = *(void (**)(void))(*(void *)value + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end