@interface RadioTS
+ (id)sharedInstance;
- (BOOL)hasBaseBandTempSensors;
- (RadioTS)init;
- (RadioTSInternal)radioTSInternal;
- (id).cxx_construct;
- (void)queryThermalSensorInfo;
- (void)registerForThermalReport;
- (void)setRadioTSInternal:(RadioTSInternal *)a3;
@end

@implementation RadioTS

+ (id)sharedInstance
{
  if (qword_1000AA0C8 != -1) {
    dispatch_once(&qword_1000AA0C8, &stru_100085E38);
  }
  return (id)qword_1000AA0D0;
}

- (RadioTS)init
{
  v8.receiver = self;
  v8.super_class = (Class)RadioTS;
  v2 = [(RadioTS *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_hasBaseBandTempSensors = 0;
    v2->_sensorIndexTB0R = [+[HidSensors sharedInstance] getSensorIndexFrom4CC:@"TB0R"];
    v3->_sensorIndexTB1R = [+[HidSensors sharedInstance] getSensorIndexFrom4CC:@"TB1R"];
    v3->_sensorIndexTB2R = [+[HidSensors sharedInstance] getSensorIndexFrom4CC:@"TB2R"];
    if (v3->_sensorIndexTB0R < 0 && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_1000571D0();
    }
    if (v3->_sensorIndexTB1R < 0 && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005719C();
    }
    if (v3->_sensorIndexTB2R < 0)
    {
      v4 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> Sensor TB2R index not set!", buf, 2u);
      }
    }
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002F494;
    v6[3] = &unk_100085E60;
    v6[4] = v3;
    sub_10002DAB0((uint64_t *)&v3->_radioTSInternal, (uint64_t)v6);
    [(RadioTS *)v3 registerForThermalReport];
  }
  return v3;
}

- (void)queryThermalSensorInfo
{
  p_radioTSInternal = (uint64_t *)&self->_radioTSInternal;
  if (sub_10002E6B0((uint64_t)&self->_radioTSInternal))
  {
    sub_10002DFB8(p_radioTSInternal);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_100057204();
  }
}

- (void)registerForThermalReport
{
}

- (BOOL)hasBaseBandTempSensors
{
  return self->_hasBaseBandTempSensors;
}

- (RadioTSInternal)radioTSInternal
{
  ptr = self[1].abmManager.__ptr_;
  retstr->abmManager.__ptr_ = (Manager *)self->radioSensorQueue;
  retstr->abmManager.__cntrl_ = (__shared_weak_count *)ptr;
  if (ptr) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)ptr + 1, 1uLL, memory_order_relaxed);
  }
  *(_OWORD *)&retstr->bbIsready = *(_OWORD *)&self[1].abmManager.__cntrl_;
  return self;
}

- (void)setRadioTSInternal:(RadioTSInternal *)a3
{
  ptr = a3->abmManager.__ptr_;
  cntrl = a3->abmManager.__cntrl_;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  v7 = self->_radioTSInternal.abmManager.__cntrl_;
  self->_radioTSInternal.abmManager.__ptr_ = ptr;
  self->_radioTSInternal.abmManager.__cntrl_ = cntrl;
  if (v7) {
    sub_10002E848((std::__shared_weak_count *)v7);
  }
  *(_OWORD *)&self->_radioTSInternal.bbIsready = *(_OWORD *)&a3->bbIsready;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end