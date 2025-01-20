@interface IOSAltimeter
- (BOOL)sensorPresent;
- (IOSAltimeter)init;
- (IOSAltimeter)initWithOperationQueue:(id)a3;
- (id).cxx_construct;
- (void)getSensor;
- (void)start;
- (void)stop;
@end

@implementation IOSAltimeter

- (void)start
{
  queue = self->_queue;
  altimeter = self->_altimeter;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3321888768;
  v5[2] = sub_100345200;
  v5[3] = &unk_100468DB0;
  v4 = self;
  v6 = v4;
  [(CMAltimeter *)altimeter startRelativeAltitudeUpdatesToQueue:queue withHandler:v5];
}

- (IOSAltimeter)initWithOperationQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IOSAltimeter;
  v6 = [(IOSAltimeter *)&v13 init];
  if (v6)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_10047E370, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_10047E370))
    {
      qword_10047E368 = (uint64_t)objc_alloc_init((Class)CMAltimeter);
      __cxa_guard_release(&qword_10047E370);
    }
    objc_storeStrong((id *)&v6->_queue, a3);
    objc_storeStrong((id *)&v6->_altimeter, (id)qword_10047E368);
    v7 = v6;
    sub_100014998((uint64_t)&v14);
    v14 = (void (**)())off_100468DF0;
    objc_initWeak(&v18, v7);

    sub_10000A604((uint64_t)&v7->_sensor, (uint64_t)&v14);
    objc_destroyWeak(&v18);
    v14 = off_10046A518;
    v8 = (char *)__p;
    if (__p)
    {
      v9 = v17;
      v10 = __p;
      if (v17 != __p)
      {
        do
        {
          v11 = (std::__shared_weak_count *)*((void *)v9 - 1);
          if (v11) {
            std::__shared_weak_count::__release_weak(v11);
          }
          v9 -= 16;
        }
        while (v9 != v8);
        v10 = __p;
      }
      v17 = v8;
      operator delete(v10);
    }
    std::mutex::~mutex(&v15);
  }

  return v6;
}

- (BOOL)sensorPresent
{
  return +[CMAltimeter isRelativeAltitudeAvailable];
}

- (void)getSensor
{
  return (char *)&self->_sensor.m_storage.dummy_.aligner_ + 7;
}

- (id).cxx_construct
{
  *((unsigned char *)self + 24) = 0;
  return self;
}

- (IOSAltimeter)init
{
  return 0;
}

- (void)stop
{
}

- (void).cxx_destruct
{
  if (self->_sensor.m_initialized)
  {
    objc_destroyWeak((id *)&self[3]._queue);
    *(void *)((char *)&self->_sensor.m_storage.dummy_.aligner_ + 7) = off_10046A518;
    uint64_t v3 = *(void *)&self[2]._sensor.m_initialized;
    if (v3)
    {
      uint64_t v4 = *(void *)((char *)&self[2]._sensor.m_storage.dummy_.aligner_ + 7);
      id v5 = *(void **)&self[2]._sensor.m_initialized;
      if (v4 != v3)
      {
        do
        {
          v6 = *(std::__shared_weak_count **)(v4 - 8);
          if (v6) {
            std::__shared_weak_count::__release_weak(v6);
          }
          v4 -= 16;
        }
        while (v4 != v3);
        id v5 = *(void **)&self[2]._sensor.m_initialized;
      }
      *(void *)((char *)&self[2]._sensor.m_storage.dummy_.aligner_ + 7) = v3;
      operator delete(v5);
    }
    std::mutex::~mutex((std::mutex *)&self[1]);
    self->_sensor.m_initialized = 0;
  }
  objc_storeStrong((id *)&self->_altimeter, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end