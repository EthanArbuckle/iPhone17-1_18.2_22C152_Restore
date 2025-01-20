@interface CLWMAccelerometer800
- (CLWMAccelerometer800)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (id)metadata;
- (int)getSampleCount;
- (void)dealloc;
- (void)onAccelerometer800Data:(const void *)a3 count:(unsigned int)a4;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMAccelerometer800

- (CLWMAccelerometer800)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CLWMAccelerometer800;
  v7 = [(CLWMBase *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v7->_universe = (CLIntersiloUniverse *)a4;
    v7->_metadata = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->_sampleCount = 0;
  }
  return v8;
}

- (void)setupListener
{
  if (!self->_accel800Dispatcher.__ptr_.__value_)
  {
    [(CLWorkoutRecordingDelegate *)self->_delegate silo];
    operator new();
  }
}

- (void)teardownListeners
{
  if (self->_accel800Dispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_1000D2E34(0);
    sub_1009D26C4(v3, 15, (uint64_t)self->_accel800Dispatcher.__ptr_.__value_);
    value = self->_accel800Dispatcher.__ptr_.__value_;
    self->_accel800Dispatcher.__ptr_.__value_ = 0;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8))(value);
    }
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234DB40);
    }
    v5 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Recording fast accelerometer stopped.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234DB40);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWMAccelerometer800 teardownListeners]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (void)dealloc
{
  self->_metadata = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWMAccelerometer800;
  [(CLWMBase *)&v3 dealloc];
}

- (id)metadata
{
  id v2 = [(NSMutableDictionary *)self->_metadata copy];

  return v2;
}

- (void)onAccelerometer800Data:(const void *)a3 count:(unsigned int)a4
{
  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((unsigned char *)ptr + 136))
    {
      LODWORD(v5) = a4;
      ++self->_sampleCount;
      [(NSMutableDictionary *)self->_metadata setObject:&__kCFBooleanTrue forKeyedSubscript:@"ContainsFastAccelData"];
      if (v5)
      {
        uint64_t v8 = *(void *)((char *)a3 + 224 * (v5 - 1) + 33);
        uint64_t v5 = v5;
        v9 = (char *)a3 + 33;
        do
        {
          sub_10170140C(v17);
          [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
          v19 |= 1u;
          v17[77] = v10;
          sub_101724818((uint64_t)v17);
          sub_101651C5C(v18);
          uint64_t v11 = v18;
          double v12 = *(double *)((char *)v9 - 25) + (double)(unint64_t)(v8 - *v9) / -1000000.0;
          uint64_t v13 = *(void *)(v18 + 8);
          *(unsigned char *)(v13 + 32) |= 1u;
          *(double *)(v13 + 8) = v12;
          uint64_t v14 = *(void *)(v11 + 8);
          LODWORD(v12) = *((_DWORD *)v9 - 4);
          *(unsigned char *)(v14 + 32) |= 4u;
          *(_DWORD *)(v14 + 20) = LODWORD(v12);
          uint64_t v15 = *(void *)(v11 + 8);
          LODWORD(v12) = *((_DWORD *)v9 - 3);
          *(unsigned char *)(v15 + 32) |= 8u;
          *(_DWORD *)(v15 + 24) = LODWORD(v12);
          uint64_t v16 = *(void *)(v11 + 8);
          LODWORD(v12) = *((_DWORD *)v9 - 2);
          *(unsigned char *)(v16 + 32) |= 0x10u;
          *(_DWORD *)(v16 + 28) = LODWORD(v12);
          sub_1016F8A70((uint64_t)self->_writer.__ptr_, (uint64_t)v17);
          sub_101706914((PB::Base *)v17);
          v9 += 28;
          --v5;
        }
        while (v5);
      }
    }
  }
}

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
  p_writer = &self->_writer;
  uint64_t v5 = *(WriterManager **)a3.__ptr_;
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

- (void).cxx_destruct
{
  cntrl = self->_writer.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  value = self->_accel800Dispatcher.__ptr_.__value_;
  self->_accel800Dispatcher.__ptr_.__value_ = 0;
  if (value)
  {
    uint64_t v5 = *(void (**)(void))(*(void *)value + 8);
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