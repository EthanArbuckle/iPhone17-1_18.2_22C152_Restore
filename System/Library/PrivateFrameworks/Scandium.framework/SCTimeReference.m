@interface SCTimeReference
- (SCTimeReference)initWithRTPTicksPerSecond:(unsigned int)a3 onQueue:(id)a4;
- (double)timeIntervalSinceReferenceDateForRTPTimestamp:(unint64_t)a3;
- (id).cxx_construct;
- (id)dateForRTPTimestamp:(unint64_t)a3;
- (unint64_t)currentRTPTimestamp;
- (unsigned)rtpTicksPerSecond;
- (void)dealloc;
- (void)update;
@end

@implementation SCTimeReference

- (SCTimeReference)initWithRTPTicksPerSecond:(unsigned int)a3 onQueue:(id)a4
{
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SCTimeReference;
  v8 = [(SCTimeReference *)&v24 init];
  v9 = v8;
  if (v8)
  {
    v8->_significantTimeChangeNotificationToken = -1;
    v8->_rtpTicksPerSecond = a3;
    if (a3 == 0x8000)
    {
      int v10 = 1;
    }
    else
    {
      if (a3 != 24000000) {
        __assert_rtn("-[SCTimeReference initWithRTPTicksPerSecond:onQueue:]", "SCTimeReference.mm", 86, "false");
      }
      int v10 = 0;
    }
    v8->_timeReference.rtp_tick_duration.__impl_.__data.__head.__value.__rep_ = 1;
    v8->_timeReference.rtp_tick_duration.__impl_.__index = v10;
    objc_storeStrong((id *)&v8->_queue, a4);
    [(SCTimeReference *)v9 update];
    dispatch_source_t v11 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v9->_queue);
    timer = v9->_timer;
    v9->_timer = (OS_dispatch_source *)v11;

    v13 = v9->_timer;
    dispatch_time_t v14 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v13, v14, 0x34630B8A000uLL, 0x45D964B800uLL);
    objc_initWeak(&location, v9);
    v15 = v9->_timer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __53__SCTimeReference_initWithRTPTicksPerSecond_onQueue___block_invoke;
    handler[3] = &unk_2654A0558;
    objc_copyWeak(&v22, &location);
    dispatch_source_set_event_handler(v15, handler);
    dispatch_activate((dispatch_object_t)v9->_timer);
    queue = v9->_queue;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __53__SCTimeReference_initWithRTPTicksPerSecond_onQueue___block_invoke_2;
    v19[3] = &unk_2654A0580;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch("SignificantTimeChangeNotification", &v9->_significantTimeChangeNotificationToken, queue, v19);
    v17 = v9;
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __53__SCTimeReference_initWithRTPTicksPerSecond_onQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained update];
}

void __53__SCTimeReference_initWithRTPTicksPerSecond_onQueue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained update];
}

- (void)dealloc
{
  int significantTimeChangeNotificationToken = self->_significantTimeChangeNotificationToken;
  if (significantTimeChangeNotificationToken != -1) {
    notify_cancel(significantTimeChangeNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)SCTimeReference;
  [(SCTimeReference *)&v4 dealloc];
}

- (double)timeIntervalSinceReferenceDateForRTPTimestamp:(unint64_t)a3
{
  return (self->_timeReference.time_since_reference_date.__rep_ * 1000000000.0
        + (double)(ae::TimeReference::rtp_to_continuous_time_point((ae::TimeReference *)&self->_timeReference, a3)
                 - self->_timeReference.continuous_time_point.__d_.__rep_))
       / 1000000000.0;
}

- (id)dateForRTPTimestamp:(unint64_t)a3
{
  v3 = (void *)MEMORY[0x263EFF910];
  [(SCTimeReference *)self timeIntervalSinceReferenceDateForRTPTimestamp:a3];
  return (id)objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
}

- (unint64_t)currentRTPTimestamp
{
  uint64_t index = self->_timeReference.rtp_tick_duration.__impl_.__index;
  if (index == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  v5 = &v4;
  return ((uint64_t (*)(char **, TimeReference *))off_270933408[index])(&v5, &self->_timeReference);
}

- (void)update
{
  do
  {
    v3.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    double Current = CFAbsoluteTimeGetCurrent();
    v5.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  }
  while (v5.__d_.__rep_ - v3.__d_.__rep_ > 10000);
  self->_timeReference.continuous_time_point.__d_.__rep_ = v3.__d_.__rep_
                                                         + ((unint64_t)(v5.__d_.__rep_ < v3.__d_.__rep_) << 63)
                                                         + ((unint64_t)(v5.__d_.__rep_ - v3.__d_.__rep_) >> 1)
                                                         + ((v5.__d_.__rep_ - v3.__d_.__rep_) & (v5.__d_.__rep_ < v3.__d_.__rep_));
  self->_timeReference.time_since_reference_date.__rep_ = Current;
}

- (unsigned)rtpTicksPerSecond
{
  return self->_rtpTicksPerSecond;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((_DWORD *)self + 4) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end