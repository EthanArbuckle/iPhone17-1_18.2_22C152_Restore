@interface CLWMHeadsetDeviceMotion
- (CLWMHeadsetDeviceMotion)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (id)metadata;
- (int)getSampleCount;
- (void)dealloc;
- (void)onAccessoryDeviceMotionConfig:(const void *)a3 buffersize:(unsigned int)a4;
- (void)onAccessoryDeviceMotionData:(const void *)a3 buffersize:(unsigned int)a4;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMHeadsetDeviceMotion

- (CLWMHeadsetDeviceMotion)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CLWMHeadsetDeviceMotion;
  v8 = [(CLWMBase *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_headsetDMupdateInterval = a5[1].kPrivacyPressureMaxOffset;
    v8->_lowLatencyMode = LOBYTE(a5[1].magIntervalSeconds);
    v8->_dmBufferSize = HIDWORD(a5[1].magIntervalSeconds);
    v8->_sampleCount = 0;
    v8->_metadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v9;
}

- (void)setupListener
{
  if (self->_headsetDMupdateInterval > 0.0 && sub_10150A86C())
  {
    if (self->_dmBufferSize)
    {
      BOOL lowLatencyMode = self->_lowLatencyMode;
      *(unsigned char *)(sub_10150A86C() + 28) = lowLatencyMode;
      [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithUnsignedInt:self->_dmBufferSize] forKeyedSubscript:@"HeadsetDMBufferSize"];
      [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithDouble:self->_headsetDMupdateInterval] forKeyedSubscript:@"HeadsetDMUpdateInterval"];
      [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithBool:self->_lowLatencyMode] forKeyedSubscript:@"HeadsetDMIsLowLatencyModeEnabled"];
      [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
      [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKeyedSubscript:@"HeadsetDMSetupTime"];
      [(CLWorkoutRecordingDelegate *)self->_delegate silo];
      operator new();
    }
  }
}

- (void)teardownListeners
{
  if (self->_accessoryDeviceMotionDispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_10150A86C();
    sub_1009D26C4(v3, 0, (uint64_t)self->_accessoryDeviceMotionDispatcher.__ptr_.__value_);
    value = self->_accessoryDeviceMotionDispatcher.__ptr_.__value_;
    self->_accessoryDeviceMotionDispatcher.__ptr_.__value_ = 0;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8))(value);
    }
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234CEE8);
    }
    v5 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Tearing down accessory DM", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234CEE8);
      }
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWMHeadsetDeviceMotion teardownListeners]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
  if (self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_)
  {
    uint64_t v6 = sub_10150A86C();
    sub_1009D26C4(v6, 1, (uint64_t)self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_);
    v7 = self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_;
    self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_ = 0;
    if (v7) {
      (*(void (**)(Dispatcher *))(*(void *)v7 + 8))(v7);
    }
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234CEE8);
    }
    v8 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Tearing down accessory DM config", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234CEE8);
      }
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWMHeadsetDeviceMotion teardownListeners]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
  }
}

- (void)onAccessoryDeviceMotionData:(const void *)a3 buffersize:(unsigned int)a4
{
  ptr = self->_writer.__ptr_;
  if (ptr && a4 && *((unsigned char *)ptr + 136))
  {
    uint64_t v7 = 0;
    uint64_t v8 = 144 * a4;
    do
    {
      ++self->_sampleCount;
      [(NSMutableDictionary *)self->_metadata setObject:&__kCFBooleanTrue forKeyedSubscript:@"HeadsetDMIsPresent"];
      sub_10170140C(v36);
      sub_101724788((uint64_t)v36);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      v39 |= 1u;
      CFAbsoluteTime v38 = Current;
      sub_1016CA3F4(v37);
      uint64_t v10 = *(void *)(v37 + 72);
      uint64_t v11 = *(void *)((char *)a3 + v7 + 64);
      *(unsigned char *)(v10 + 152) |= 2u;
      *(void *)(v10 + 136) = v11;
      [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
      [(NSMutableDictionary *)self->_metadata setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:") forKeyedSubscript:@"HeadsetDMLastTimestamp"];
      long long __src = *(_OWORD *)((char *)a3 + v7);
      sub_1000FB43C((char *)(*(void *)(v37 + 72) + 56), (char *)&__src, (uint64_t)&v41, 4uLL);
      *(void *)&long long __src = *(void *)((char *)a3 + v7 + 16);
      DWORD2(__src) = *(_DWORD *)((char *)a3 + v7 + 24);
      sub_1000FB43C((char *)(*(void *)(v37 + 72) + 80), (char *)&__src, (uint64_t)&__src + 12, 3uLL);
      *(void *)&long long __src = *(void *)((char *)a3 + v7 + 28);
      DWORD2(__src) = *(_DWORD *)((char *)a3 + v7 + 36);
      sub_1000FB43C((char *)(*(void *)(v37 + 72) + 32), (char *)&__src, (uint64_t)&__src + 12, 3uLL);
      *(void *)&long long __src = *(void *)((char *)a3 + v7 + 40);
      DWORD2(__src) = *(_DWORD *)((char *)a3 + v7 + 48);
      sub_1000FB43C((char *)(*(void *)(v37 + 72) + 104), (char *)&__src, (uint64_t)&__src + 12, 3uLL);
      uint64_t v12 = *(void *)(v37 + 72);
      int v13 = *(unsigned __int16 *)((char *)a3 + v7 + 52);
      *(unsigned char *)(v12 + 152) |= 4u;
      *(_DWORD *)(v12 + 144) = v13;
      uint64_t v14 = *(void *)(v37 + 72);
      uint64_t v15 = *(void *)((char *)a3 + v7 + 56);
      *(unsigned char *)(v14 + 152) |= 1u;
      *(void *)(v14 + 128) = v15;
      *(void *)&long long __src = *(void *)((char *)a3 + v7 + 80);
      DWORD2(__src) = *(_DWORD *)((char *)a3 + v7 + 88);
      sub_1000FB43C((char *)(v37 + 8), (char *)&__src, (uint64_t)&__src + 12, 3uLL);
      uint64_t v16 = v37;
      v17 = (char *)a3 + v7;
      int v18 = *(_DWORD *)((char *)a3 + v7 + 92);
      *(_WORD *)(v37 + 116) |= 0x40u;
      *(_DWORD *)(v16 + 96) = v18;
      uint64_t v19 = v37;
      int v20 = *(_DWORD *)((char *)a3 + v7 + 96);
      *(_WORD *)(v37 + 116) |= 0x20u;
      *(_DWORD *)(v19 + 92) = v20;
      uint64_t v21 = v37;
      int v22 = *(_DWORD *)((char *)a3 + v7 + 100);
      *(_WORD *)(v37 + 116) |= 0x100u;
      *(_DWORD *)(v21 + 104) = v22;
      uint64_t v23 = v37;
      if (*(_DWORD *)((char *)a3 + v7 + 104) == 2) {
        int v24 = 1;
      }
      else {
        int v24 = 2;
      }
      *(_WORD *)(v37 + 116) |= 0x10u;
      *(_DWORD *)(v23 + 88) = v24;
      uint64_t v25 = v37;
      int v26 = *((_DWORD *)v17 + 27);
      *(_WORD *)(v37 + 116) |= 0x200u;
      *(_DWORD *)(v25 + 108) = v26;
      uint64_t v27 = v37;
      uint64_t v28 = *((void *)v17 + 14);
      *(_WORD *)(v37 + 116) |= 1u;
      *(void *)(v27 + 56) = v28;
      uint64_t v29 = v37;
      float v30 = *((double *)v17 + 9);
      *(_WORD *)(v37 + 116) |= 8u;
      *(float *)(v29 + 84) = v30;
      uint64_t v31 = v37;
      float v32 = *((double *)v17 + 15);
      *(_WORD *)(v37 + 116) |= 0x80u;
      *(float *)(v31 + 100) = v32;
      uint64_t v33 = v37;
      LOBYTE(v28) = v17[143];
      *(_WORD *)(v37 + 116) |= 0x400u;
      *(unsigned char *)(v33 + 112) = v28;
      if (v17[140])
      {
        *(void *)&long long __src = *((void *)v17 + 16);
        DWORD2(__src) = *((_DWORD *)v17 + 34);
        sub_1000FB43C((char *)(v37 + 32), (char *)&__src, (uint64_t)&__src + 12, 3uLL);
      }
      if (v17[142])
      {
        uint64_t v34 = v37;
        int v35 = *((unsigned __int8 *)a3 + v7 + 141);
        *(_WORD *)(v37 + 116) |= 4u;
        *(_DWORD *)(v34 + 80) = v35;
      }
      sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)v36);
      sub_101706914((PB::Base *)v36);
      v7 += 144;
    }
    while (v8 != v7);
  }
}

- (void)onAccessoryDeviceMotionConfig:(const void *)a3 buffersize:(unsigned int)a4
{
  ptr = self->_writer.__ptr_;
  if (ptr && a4 && *((unsigned char *)ptr + 136))
  {
    uint64_t v6 = a4;
    uint64_t v7 = (char *)a3 + 80;
    do
    {
      sub_10170140C(v16);
      sub_101728178((uint64_t)v16);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      v19 |= 1u;
      CFAbsoluteTime v18 = Current;
      sub_1016BA840(v17);
      uint64_t v9 = *(void *)(v17 + 32);
      int v10 = *((_DWORD *)v7 - 20);
      *(unsigned char *)(v9 + 32) |= 2u;
      *(_DWORD *)(v9 + 28) = v10;
      uint64_t v11 = *(void *)(v17 + 32);
      sub_100AE479C(v11);
      std::string::operator=(*(std::string **)(v11 + 8), (const std::string *)v7 - 3);
      uint64_t v12 = *(void *)(v17 + 32);
      sub_100C31F08(v12);
      std::string::operator=(*(std::string **)(v12 + 16), (const std::string *)v7 - 2);
      uint64_t v13 = *(void *)(v17 + 32);
      int v14 = *((_DWORD *)v7 - 6);
      *(unsigned char *)(v13 + 32) |= 1u;
      *(_DWORD *)(v13 + 24) = v14;
      uint64_t v15 = v17;
      LOBYTE(v14) = *((unsigned char *)v7 - 4);
      *(unsigned char *)(v17 + 44) |= 1u;
      *(unsigned char *)(v15 + 40) = v14;
      long long __src = *v7;
      sub_1000FB43C((char *)(v17 + 8), (char *)&__src, (uint64_t)&v21, 4uLL);
      sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)v16);
      sub_101706914((PB::Base *)v16);
      v7 += 6;
      --v6;
    }
    while (v6);
  }
}

- (int)getSampleCount
{
  return self->_sampleCount;
}

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
  p_writer = &self->_writer;
  v5 = *(WriterManager **)a3.__ptr_;
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

- (id)metadata
{
  id v2 = [(NSMutableDictionary *)self->_metadata copy];

  return v2;
}

- (void)dealloc
{
  self->_metadata = 0;
  v5.receiver = self;
  v5.super_class = (Class)CLWMHeadsetDeviceMotion;
  [(CLWMBase *)&v5 dealloc];
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234CEE8);
  }
  uint64_t v3 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLWMHeadsetDeviceMotion deallocation is complete", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234CEE8);
    }
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWMHeadsetDeviceMotion dealloc]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void).cxx_destruct
{
  cntrl = self->_writer.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  value = self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_;
  self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Dispatcher *, SEL))(*(void *)value + 8))(value, a2);
  }
  objc_super v5 = self->_accessoryDeviceMotionDispatcher.__ptr_.__value_;
  self->_accessoryDeviceMotionDispatcher.__ptr_.__value_ = 0;
  if (v5)
  {
    uint64_t v6 = *(void (**)(void))(*(void *)v5 + 8);
    v6();
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end