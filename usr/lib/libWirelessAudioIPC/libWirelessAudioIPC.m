uint64_t waipc::SampleTimeline::SampleTimeline(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  waipc::timesync::KalmanEstimator::fixed(a3, 0, 0, 0, a1 + 32, *(double *)(a2 + 16) / *(double *)(a2 + 24));
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 0;
  *(void *)(a1 + 160) = mach_absolute_time();
  return a1;
}

__n128 waipc::SampleTimeline::updateTimesync(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 160) = mach_absolute_time();
  }
  long long v5 = *(_OWORD *)(a2 + 8);
  long long v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v6;
  *(_OWORD *)(a1 + 40) = v5;
  __n128 result = *(__n128 *)(a2 + 56);
  long long v8 = *(_OWORD *)(a2 + 72);
  long long v9 = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 136) = *(void *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = v9;
  *(_OWORD *)(a1 + 104) = v8;
  *(__n128 *)(a1 + 88) = result;
  return result;
}

double waipc::SampleTimeline::deviceToSample(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(double *)a1
       * (*(double *)(a1 + 16)
        * (*(double *)&a3 - *(double *)(a1 + 152) + (double)(a2 - *(void *)(a1 + 144)))
        / 1000000000.0);
}

uint64_t waipc::SampleTimeline::sampleToDevice(waipc::SampleTimeline *this, double a2)
{
  return *((void *)this + 18);
}

double waipc::SampleTimeline::timestampFromHost@<D0>(waipc::SampleTimeline *this@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = waipc::timesync::KalmanEstimator::hostToDevice((uint64_t)this + 32);
  double result = v7;
  *(double *)a3 = *(double *)this
                * (*((double *)this + 2)
                 * (v7 - *((double *)this + 19) + (double)(v6 - *((void *)this + 18)))
                 / 1000000000.0);
  *(void *)(a3 + 8) = a2;
  *(void *)(a3 + 16) = v6 + llround(v7);
  *(void *)(a3 + 24) = *((void *)this + 20);
  return result;
}

double waipc::SampleTimeline::timestampFromDevice@<D0>(waipc::SampleTimeline *this@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  waipc::timesync::KalmanEstimator::deviceToHost((uint64_t)this + 32, a2, 0);
  double result = *(double *)this
         * (*((double *)this + 2)
          * (0.0 - *((double *)this + 19) + (double)(a2 - *((void *)this + 18)))
          / 1000000000.0);
  *(double *)a3 = result;
  *(void *)(a3 + 8) = v7 + llround(v6);
  *(void *)(a3 + 16) = a2;
  *(void *)(a3 + 24) = *((void *)this + 20);
  return result;
}

double waipc::SampleTimeline::timestampFromSample@<D0>(waipc::SampleTimeline *this@<X0>, double a2@<D0>, uint64_t a3@<X8>)
{
  uint64_t v6 = *((void *)this + 18);
  double v7 = *((double *)this + 19) + a2 / *(double *)this * 1000000000.0 / *((double *)this + 2);
  waipc::timesync::KalmanEstimator::deviceToHost((uint64_t)this + 32, v6, *(uint64_t *)&v7);
  double result = v8;
  *(double *)a3 = a2;
  *(void *)(a3 + 8) = v10 + llround(v8);
  *(void *)(a3 + 16) = v6 + llround(v7);
  *(void *)(a3 + 24) = *((void *)this + 20);
  return result;
}

double waipc::SampleTimeline::currentTimestamp@<D0>(waipc::SampleTimeline *this@<X0>, uint64_t a2@<X8>)
{
  v4 = (char *)this + 32;
  uint64_t v5 = waipc::timesync::KalmanEstimator::hostToDevice((uint64_t)this + 32);
  uint64_t v6 = *((void *)this + 18);
  double v7 = *((double *)this + 19);
  double v9 = *((double *)this + 2);
  double v10 = floor(*(double *)this* (v9* (v8 - v7 + (double)(v5 - v6))/ 1000000000.0)/ (double)*((unint64_t *)this + 1))* (double)*((unint64_t *)this + 1);
  double v11 = v7 + v10 / *(double *)this * 1000000000.0 / v9;
  waipc::timesync::KalmanEstimator::deviceToHost((uint64_t)v4, v6, *(uint64_t *)&v11);
  double result = v12;
  *(double *)a2 = v10;
  *(void *)(a2 + 8) = v14 + llround(v12);
  *(void *)(a2 + 16) = v6 + llround(v11);
  *(void *)(a2 + 24) = *((void *)this + 20);
  return result;
}

uint64_t waipc::SampleTimeline::nextHostTime(waipc::SampleTimeline *this)
{
  v2 = (char *)this + 32;
  uint64_t v3 = waipc::timesync::KalmanEstimator::hostToDevice((uint64_t)this + 32);
  waipc::timesync::KalmanEstimator::deviceToHost((uint64_t)v2, *((void *)this + 18), COERCE__INT64(*((double *)this + 19)+ (floor(*(double *)this* (*((double *)this + 2)* (v4 - *((double *)this + 19) + (double)(v3 - *((void *)this + 18)))/ 1000000000.0)/ (double)*((unint64_t *)this + 1))+ 1.0)* (double)*((unint64_t *)this + 1)/ *(double *)this* 1000000000.0/ *((double *)this + 2)));
  return v6 + vcvtpd_s64_f64(v5);
}

double waipc::SampleTimeline::nextHostVariance(waipc::SampleTimeline *this)
{
  v2 = (char *)this + 32;
  uint64_t v3 = waipc::timesync::KalmanEstimator::hostToDevice((uint64_t)this + 32);
  double v5 = v4;
  uint64_t v6 = *((void *)this + 18);
  double v7 = *((double *)this + 19)
     + (floor(*(double *)this* (*((double *)this + 2)* (v5 - *((double *)this + 19) + (double)(v3 - v6))/ 1000000000.0)/ (double)*((unint64_t *)this + 1))+ 1.0)* (double)*((unint64_t *)this + 1)/ *(double *)this* 1000000000.0/ *((double *)this + 2);

  return waipc::timesync::KalmanEstimator::deviceToHostVariance((uint64_t)v2, v6, *(uint64_t *)&v7);
}

uint64_t waipc::SampleTimeline::dumpState(waipc::SampleTimeline *this)
{
  v9[2] = *MEMORY[0x263EF8340];
  v6[0] = @"Estimator";
  v6[1] = waipc::timesync::KalmanEstimator::dumpState((waipc::SampleTimeline *)((char *)this + 32));
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v7, @"Zero Device Time Int", (uint64_t *)this + 18);
  waipc::util::_kv::_kv<double const&,void>(&v8, @"Zero Device Time Frac", (uint64_t *)this + 19);
  waipc::util::_kv::_kv<unsigned long long const&,void>(v9, @"Seed", (uint64_t *)this + 20);
  waipc::util::createCFDictDropNull<4l>((uint64_t)v6, (applesauce::CF::DictionaryRef *)&v5);
  for (uint64_t i = 7; i != -1; i -= 2)
  {
    uint64_t v3 = (const void *)v6[i];
    if (v3) {
      CFRelease(v3);
    }
  }
  return v5;
}

void sub_226DEF7DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<4l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3 = 0;
  CFIndex v4 = 0;
  uint64_t v12 = *MEMORY[0x263EF8340];
  *(_OWORD *)keys = 0u;
  long long v11 = 0u;
  memset(v9, 0, sizeof(v9));
  do
  {
    uint64_t v5 = *(void **)(a1 + v3);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((void *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 64);
  CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)v9, v4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

void waipc::util::_kv::~_kv(waipc::util::_kv *this)
{
  v1 = (const void *)*((void *)this + 1);
  if (v1) {
    CFRelease(v1);
  }
}

void applesauce::CF::TypeRef::~TypeRef(const void **this)
{
  v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void __clang_call_terminate(void *a1)
{
}

applesauce::CF::DictionaryRef *applesauce::CF::DictionaryRef::DictionaryRef(applesauce::CF::DictionaryRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFDictionaryGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x22A66A950](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  return this;
}

void sub_226DEFA18(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

void *waipc::util::_kv::_kv<unsigned long long const&,void>(void *a1, uint64_t a2, uint64_t *a3)
{
  *a1 = a2;
  uint64_t valuePtr = *a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x22A66A950](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_226DEFADC(_Unwind_Exception *exception_object)
{
  CFTypeID v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

void *waipc::util::_kv::_kv<double const&,void>(void *a1, uint64_t a2, uint64_t *a3)
{
  *a1 = a2;
  uint64_t valuePtr = *a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x22A66A950](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_226DEFB9C(_Unwind_Exception *exception_object)
{
  CFTypeID v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

void waipc::timesync::BasebandProvider::create(waipc::timesync::BasebandProvider *this@<X0>, os_unfair_lock_s **a2@<X8>)
{
  if (TelephonyRadiosGetRadio() == 4)
  {
    waipc::timesync::BasebandProvider::BasebandProvider((waipc::timesync::BasebandProvider *)v7, this);
    v7[0] = &unk_26DAF2C08;
    std::allocate_shared[abi:ne180100]<waipc::timesync::LegacyBasebandProvider,std::allocator<waipc::timesync::LegacyBasebandProvider>,waipc::timesync::LegacyBasebandProvider,void>((const waipc::timesync::BasebandProvider *)v7, &v8);
  }
  else
  {
    waipc::timesync::BasebandProvider::BasebandProvider((waipc::timesync::BasebandProvider *)v7, this);
    v7[0] = &unk_26DAF2B68;
    std::allocate_shared[abi:ne180100]<waipc::timesync::ModernBasebandProvider,std::allocator<waipc::timesync::ModernBasebandProvider>,waipc::timesync::ModernBasebandProvider,void>((const waipc::timesync::BasebandProvider *)v7, &v8);
  }
  uint64_t v6 = v8;
  uint64_t v5 = v9;
  uint64_t v8 = 0;
  double v9 = 0;
  waipc::timesync::BasebandProvider::~BasebandProvider((os_unfair_lock *)v7);
  if (v6 && waipc::timesync::BasebandProvider::init(v6))
  {
    *a2 = v6;
    a2[1] = (os_unfair_lock_s *)v5;
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
}

void sub_226DEFCBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_unfair_lock a9)
{
}

uint64_t waipc::timesync::BasebandProvider::init(os_unfair_lock_s *this)
{
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG)) {
    waipc::timesync::BasebandProvider::init();
  }
  os_unfair_lock_lock(this + 28);
  uint64_t v3 = waipc::timesync::BasebandProvider::setupTransport((waipc::timesync::BasebandProvider *)this);
  if ((v3 & 1) == 0) {
    waipc::timesync::BasebandProvider::stop_nl(this);
  }
  os_unfair_lock_unlock(this + 28);
  return v3;
}

void sub_226DEFD78(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

waipc::timesync::BasebandProvider *waipc::timesync::BasebandProvider::BasebandProvider(waipc::timesync::BasebandProvider *this, const waipc::timesync::BasebandProvider::config *a2)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = &unk_26DAF2A58;
  waipc::timesync::BasebandProvider::config::config((uint64_t)this + 24, (uint64_t)a2);
  *((_DWORD *)this + 28) = 0;
  *((_WORD *)this + 58) = 0;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 212) = 0u;
  *((void *)this + 30) = 0;
  *((void *)this + 31) = 0;
  *((void *)this + 29) = 0;
  *((_DWORD *)this + 64) = 0;
  *(_OWORD *)((char *)this + 264) = 0u;
  *(_OWORD *)((char *)this + 280) = 0u;
  *(_OWORD *)((char *)this + 296) = 0u;
  return this;
}

void sub_226DEFE14(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 16);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t waipc::timesync::BasebandProvider::setupTransport(waipc::timesync::BasebandProvider *this)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG)) {
    waipc::timesync::BasebandProvider::setupTransport();
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)this + 28);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3802000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v14, (void *)this + 1);
  uint64_t v3 = v15;
  v20[5] = v14;
  v21 = v15;
  if (v15)
  {
    atomic_fetch_add_explicit(&v15->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  TelephonyBasebandPCITransportInitParameters();
  v15 = (std::__shared_weak_count *)*((void *)this + 3);
  uint64_t v17 = *((void *)this + 10);
  v18 |= 4u;
  LODWORD(v14) = 12;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 0x40000000;
  v13[2] = ___ZN5waipc8timesync16BasebandProvider14setupTransportEv_block_invoke;
  v13[3] = &unk_2647E8018;
  v13[4] = v20;
  v13[5] = this;
  v16 = v13;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 0x40000000;
  v12[2] = ___ZN5waipc8timesync16BasebandProvider14setupTransportEv_block_invoke_2;
  v12[3] = &unk_2647E8040;
  v12[4] = v20;
  v12[5] = this;
  v19 = v12;
  if (((*(uint64_t (**)(waipc::timesync::BasebandProvider *, uint64_t *))(*(void *)this + 40))(this, &v14) & 1) == 0)
  {
    uint64_t v6 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      CFDictionaryRef v7 = "failed to configure PCI transport";
LABEL_13:
      uint64_t v8 = v6;
      uint32_t v9 = 2;
LABEL_16:
      _os_log_impl(&dword_226DEE000, v8, OS_LOG_TYPE_INFO, v7, buf, v9);
    }
LABEL_17:
    uint64_t v5 = 0;
    goto LABEL_18;
  }
  if ((TelephonyBasebandPCITransportCreate() & 1) == 0)
  {
    double v10 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v23 = 12;
      CFDictionaryRef v7 = "failed to create PCI transport for interface %d";
      uint64_t v8 = v10;
      uint32_t v9 = 8;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (((*(uint64_t (**)(waipc::timesync::BasebandProvider *))(*(void *)this + 48))(this) & 1) == 0)
  {
    uint64_t v6 = waipc::logging::getLogger(2u);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    CFDictionaryRef v7 = "failed to engage PCI transport";
    goto LABEL_13;
  }
  CFNumberRef v4 = (void *)*((void *)this + 5);
  if (v4) {
    dispatch_async(*((dispatch_queue_t *)this + 3), v4);
  }
  uint64_t v5 = 1;
LABEL_18:
  _Block_object_dispose(v20, 8);
  if (v21) {
    std::__shared_weak_count::__release_weak(v21);
  }
  return v5;
}

void sub_226DF0144(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 104), 8);
  uint64_t v3 = *(std::__shared_weak_count **)(v1 - 56);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandProvider::stop_nl(os_unfair_lock *this)
{
  os_unfair_lock_assert_owner(this + 28);
  if (!LOBYTE(this[29]._os_unfair_lock_opaque))
  {
    LOBYTE(this[29]._os_unfair_lock_opaque) = 1;
    waipc::timesync::BasebandProvider::clearTransport((waipc::timesync::BasebandProvider *)this);
  }
}

void waipc::timesync::BasebandProvider::~BasebandProvider(os_unfair_lock *this)
{
  *(void *)&this->_os_unfair_lock_opaque = &unk_26DAF2A58;
  waipc::timesync::BasebandProvider::stop(this);
  v2 = *(void **)&this[72]._os_unfair_lock_opaque;
  if (v2)
  {
    *(void *)&this[74]._os_unfair_lock_opaque = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)&this[66]._os_unfair_lock_opaque;
  if (v3)
  {
    *(void *)&this[68]._os_unfair_lock_opaque = v3;
    operator delete(v3);
  }
  CFNumberRef v4 = *(void **)&this[58]._os_unfair_lock_opaque;
  if (v4)
  {
    *(void *)&this[60]._os_unfair_lock_opaque = v4;
    operator delete(v4);
  }
  uint64_t v5 = *(const void **)&this[30]._os_unfair_lock_opaque;
  if (v5) {
    CFRelease(v5);
  }
  waipc::timesync::BasebandProvider::config::~config((waipc::timesync::BasebandProvider::config *)&this[6]);
  uint64_t v6 = *(std::__shared_weak_count **)&this[4]._os_unfair_lock_opaque;
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
}

{
  uint64_t vars8;

  waipc::timesync::BasebandProvider::~BasebandProvider(this);

  JUMPOUT(0x22A66A9D0);
}

void waipc::timesync::BasebandProvider::stop(os_unfair_lock *this)
{
  v2 = this + 28;
  os_unfair_lock_lock(this + 28);
  waipc::timesync::BasebandProvider::stop_nl(this);

  os_unfair_lock_unlock(v2);
}

void sub_226DF02BC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::StringRef::~StringRef(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void waipc::timesync::BasebandProvider::clearTransport(waipc::timesync::BasebandProvider *this)
{
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG)) {
    waipc::timesync::BasebandProvider::clearTransport();
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)this + 28);
  uint64_t v3 = (unsigned int (*)(char *))*((void *)this + 23);
  if (v3)
  {
    if (v3((char *)this + 128))
    {
      TelephonyUtilTransportFree();
      CFNumberRef v4 = (const void *)*((void *)this + 6);
      if (v4)
      {
        uint64_t v5 = _Block_copy(v4);
        uint64_t v6 = (const void *)*((void *)this + 15);
        if (v6) {
          CFRetain(*((CFTypeRef *)this + 15));
        }
        CFDictionaryRef v7 = *((void *)this + 3);
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 1174405120;
        _OWORD v9[2] = ___ZN5waipc8timesync16BasebandProvider14clearTransportEv_block_invoke;
        void v9[3] = &__block_descriptor_tmp_4_0;
        if (v5) {
          uint64_t v8 = _Block_copy(v5);
        }
        else {
          uint64_t v8 = 0;
        }
        aBlock = v8;
        if (v6) {
          CFRetain(v6);
        }
        CFTypeRef cf = v6;
        dispatch_async(v7, v9);
        if (cf) {
          CFRelease(cf);
        }
        if (aBlock) {
          _Block_release(aBlock);
        }
        if (v6) {
          CFRelease(v6);
        }
        if (v5) {
          _Block_release(v5);
        }
      }
    }
  }
}

void waipc::timesync::BasebandProvider::die(os_unfair_lock *this, const __CFString *a2)
{
  os_unfair_lock_assert_owner(this + 28);
  if (a2) {
    CFRetain(a2);
  }
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v5, a2);
  CFNumberRef v4 = *(const void **)&this[30]._os_unfair_lock_opaque;
  *(void *)&this[30]._os_unfair_lock_opaque = v5;
  uint64_t v5 = v4;
  if (v4) {
    CFRelease(v4);
  }
  waipc::timesync::BasebandProvider::stop_nl(this);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZN5waipc8timesync16BasebandProvider14setupTransportEv_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  CFNumberRef v4 = *(std::__shared_weak_count **)(v3 + 48);
  if (v4)
  {
    uint64_t v6 = *(os_unfair_lock **)(a1 + 40);
    CFDictionaryRef v7 = std::__shared_weak_count::lock(v4);
    if (v7)
    {
      uint64_t v8 = v7;
      if (*(void *)(v3 + 40))
      {
        os_unfair_lock_lock(v6 + 28);
        waipc::timesync::BasebandProvider::transportStatus(v6, a2);
        os_unfair_lock_unlock(v6 + 28);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
  }
}

void sub_226DF05E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandProvider::transportStatus(os_unfair_lock *a1, unsigned int a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(a1 + 28);
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_226DEE000, Logger, OS_LOG_TYPE_INFO, "got transport status %d", (uint8_t *)v5, 8u);
  }
  if (a2 <= 1) {
    waipc::timesync::BasebandProvider::die(a1, @"timesync failed to open PCI transport");
  }
}

void ___ZN5waipc8timesync16BasebandProvider14setupTransportEv_block_invoke_2(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v6 + 48))
  {
    uint64_t v8 = *(os_unfair_lock **)(a1 + 40);
    uint32_t v9 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(v6 + 48));
    if (v9 && *(void *)(v6 + 40))
    {
      os_unfair_lock_lock(v8 + 28);
      waipc::timesync::BasebandProvider::transportReadCompletion(v8, a2, a3, a4);
      os_unfair_lock_unlock(v8 + 28);
LABEL_10:
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
      return;
    }
  }
  else
  {
    uint32_t v9 = 0;
  }
  if (!a2 && a3) {
    free(a3);
  }
  if (v9) {
    goto LABEL_10;
  }
}

void sub_226DF0798(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandProvider::transportReadCompletion(os_unfair_lock *this, int a2, void *a3, uint64_t a4)
{
  os_unfair_lock_assert_owner(this + 28);
  if (a2)
  {
    Logger = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG)) {
      waipc::timesync::BasebandProvider::transportReadCompletion(a2, Logger);
    }
    waipc::timesync::BasebandProvider::die(this, @"timesync PCI read failed");
  }
  else
  {
    if (!a3) {
      waipc::timesync::BasebandProvider::transportReadCompletion();
    }
    (*(void (**)(os_unfair_lock *, void *, uint64_t))(*(void *)&this->_os_unfair_lock_opaque + 56))(this, a3, a4);
    free(a3);
  }
}

uint64_t ___ZN5waipc8timesync16BasebandProvider14clearTransportEv_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

const void *__copy_helper_block_e8_32c55_ZTSN10applesauce8dispatch2v15blockIFvPK10__CFStringEEE40c31_ZTSN10applesauce2CF9StringRefE(uint64_t a1, uint64_t a2)
{
  double result = *(const void **)(a2 + 32);
  if (result) {
    double result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  uint64_t v5 = *(const void **)(a2 + 40);
  if (v5) {
    double result = CFRetain(v5);
  }
  *(void *)(a1 + 40) = v5;
  return result;
}

void __destroy_helper_block_e8_32c55_ZTSN10applesauce8dispatch2v15blockIFvPK10__CFStringEEE40c31_ZTSN10applesauce2CF9StringRefE(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3) {
    _Block_release(v3);
  }
}

uint64_t waipc::timesync::BasebandProvider::configureTransport(const os_unfair_lock *a1)
{
  return 1;
}

uint64_t waipc::timesync::BasebandProvider::engageTransport(const os_unfair_lock *this)
{
  return 1;
}

void waipc::timesync::BasebandProvider::handleTransportRead(const os_unfair_lock *this, void *a2)
{
}

void waipc::timesync::BasebandProvider::triggerTimesyncMeasurement(const os_unfair_lock *this)
{
  uint64_t v2 = (os_unfair_lock_s *)&this[28];
  os_unfair_lock_lock((os_unfair_lock_t)&this[28]);
  LOBYTE(this[56]._os_unfair_lock_opaque) = 1;
  waipc::timesync::BasebandProvider::checkPendingTimesync(this);

  os_unfair_lock_unlock(v2);
}

void sub_226DF09C0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandProvider::checkPendingTimesync(const os_unfair_lock *this)
{
  os_unfair_lock_assert_owner(this + 28);
  if (LOBYTE(this[56]._os_unfair_lock_opaque)
    && !BYTE1(this[56]._os_unfair_lock_opaque)
    && !BYTE2(this[56]._os_unfair_lock_opaque))
  {
    BYTE1(this[56]._os_unfair_lock_opaque) = 1;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3802000000;
    v19[3] = __Block_byref_object_copy_;
    v19[4] = __Block_byref_object_dispose_;
    std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&info, &this[2]._os_unfair_lock_opaque);
    uint64_t v2 = v18;
    v19[5] = info;
    v20 = v18;
    if (v18)
    {
      atomic_fetch_add_explicit(&v18->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      std::__shared_weak_count::__release_shared[abi:ne180100](v2);
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 0x40000000;
    v16[2] = ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke;
    v16[3] = &unk_2647E8068;
    v16[4] = v19;
    v16[5] = this;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 0x40000000;
    uint64_t v12 = ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_17;
    v13 = &unk_2647E8090;
    uint64_t v14 = v16;
    v15 = this;
    uint64_t v3 = mach_absolute_time();
    mach_timebase_info(&info);
    uint64_t v5 = *(void *)&this[54]._os_unfair_lock_opaque;
    if (v5
      && (unint64_t v6 = (v3 - v5) * info.numer / info.denom,
          unint64_t v7 = 1000000 * this[23]._os_unfair_lock_opaque,
          int64_t v4 = v7 - v6,
          v7 > v6))
    {
      dispatch_time_t v8 = dispatch_time(0, v4);
      uint32_t v9 = *(NSObject **)&this[6]._os_unfair_lock_opaque;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 0x40000000;
      v10[2] = ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_25;
      v10[3] = &unk_2647E80B8;
      v10[5] = v19;
      v10[6] = this;
      v10[4] = v11;
      dispatch_after(v8, v9, v10);
    }
    else
    {
      ((void (*)(void *, int64_t))v12)(v11, v4);
    }
    _Block_object_dispose(v19, 8);
    if (v20) {
      std::__shared_weak_count::__release_weak(v20);
    }
  }
}

void sub_226DF0BE8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 104), 8);
  uint64_t v3 = *(std::__shared_weak_count **)(v1 - 56);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke(uint64_t a1, int a2, int a3, int *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(void *)(a1 + 40);
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG)) {
    ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_cold_1();
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v11 = *(std::__shared_weak_count **)(v10 + 48);
  if (v11)
  {
    uint64_t v12 = std::__shared_weak_count::lock(v11);
    if (v12)
    {
      v13 = v12;
      if (*(void *)(v10 + 40))
      {
        os_unfair_lock_lock((os_unfair_lock_t)(v8 + 112));
        if (!*(unsigned char *)(v8 + 226)) {
          __assert_rtn("checkPendingTimesync_block_invoke", "BasebandProvider.cpp", 303, "fTimesync.running");
        }
        if (a2)
        {
          uint64_t v14 = waipc::logging::getLogger(2u);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            v16[0] = 67109120;
            v16[1] = a2;
            _os_log_impl(&dword_226DEE000, v14, OS_LOG_TYPE_INFO, "time sync failed 0x%08x", (uint8_t *)v16, 8u);
          }
          if (a2 == -536870167 || a2 == -536870184)
          {
            v15 = waipc::logging::getLogger(2u);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              LOWORD(v16[0]) = 0;
              _os_log_impl(&dword_226DEE000, v15, OS_LOG_TYPE_INFO, "AP sleep, ignore time sync failure!", (uint8_t *)v16, 2u);
            }
          }
          else
          {
            waipc::timesync::BasebandProvider::die((os_unfair_lock *)v8, @"timesync measurement failed");
          }
        }
        else if (!*(unsigned char *)(v8 + 227) && !*(unsigned char *)(v8 + 117))
        {
          waipc::timesync::BasebandProvider::handleTimesync<PCITransportTimesyncMeasurement *>(v8, 0, a4, &a4[6 * a3]);
        }
        *(void *)(v8 + 216) = mach_absolute_time();
        *(_WORD *)(v8 + 226) = 0;
        waipc::timesync::BasebandProvider::checkPendingTimesync((waipc::timesync::BasebandProvider *)v8);
        os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 112));
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
  }
}

void sub_226DF0E18(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandProvider::handleTimesync<PCITransportTimesyncMeasurement *>(uint64_t a1, int a2, int *a3, int *a4)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 112));
  if (*(_DWORD *)(a1 + 256) != a2)
  {
    uint64_t v8 = *(void *)(a1 + 232);
    uint32_t v9 = (char *)v8;
    if (a3 != a4)
    {
      while (v9 != *(char **)(a1 + 240))
      {
        if (*a3 == *(_DWORD *)v9)
        {
          waipc::timesync::BasebandProvider::timesyncMeasurement::complete((uint64_t)v9, (uint64_t)a3);
          if (v9 != (char *)v8)
          {
            long long v10 = *(_OWORD *)v9;
            long long v11 = *((_OWORD *)v9 + 1);
            v35 = (void (*)(uint64_t))*((void *)v9 + 4);
            long long v33 = v10;
            long long v34 = v11;
            long long v12 = *(_OWORD *)v8;
            long long v13 = *(_OWORD *)(v8 + 16);
            *((void *)v9 + 4) = *(void *)(v8 + 32);
            *(_OWORD *)uint32_t v9 = v12;
            *((_OWORD *)v9 + 1) = v13;
            long long v14 = v33;
            long long v15 = v34;
            *(void *)(v8 + 32) = v35;
            *(_OWORD *)uint64_t v8 = v14;
            *(_OWORD *)(v8 + 16) = v15;
          }
          v8 += 40;
          v9 += 40;
          a3 += 6;
        }
        else if (*a3 - *(_DWORD *)v9 < 0)
        {
          a3 += 6;
        }
        else
        {
          v9 += 40;
        }
        if (a3 == a4)
        {
          a3 = a4;
          break;
        }
      }
    }
    if (!*(unsigned char *)(a1 + 116))
    {
      if (*(void *)(a1 + 56))
      {
        v26 = *(const void **)(a1 + 232);
        if ((const void *)v8 != v26)
        {
          *(void *)&long long v33 = 0;
          *((void *)&v33 + 1) = &v33;
          *(void *)&long long v34 = 0x4002000000;
          *((void *)&v34 + 1) = __Block_byref_object_copy__164;
          v35 = __Block_byref_object_dispose__165;
          __p = 0;
          v37 = 0;
          uint64_t v38 = 0;
          std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__init_with_size[abi:ne180100]<std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement*>,std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement*>>(&__p, v26, v8, 0xCCCCCCCCCCCCCCCDLL * ((v8 - (uint64_t)v26) >> 3));
          waipc::timesync::BasebandProvider::logMeasurements(a1, *(void *)(*((void *)&v33 + 1) + 40), *(char **)(*((void *)&v33 + 1) + 48));
          v27 = *(const void **)(a1 + 56);
          if (v27) {
            v28 = _Block_copy(v27);
          }
          else {
            v28 = 0;
          }
          v29 = *(NSObject **)(a1 + 24);
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 1174405120;
          v31[2] = ___ZN5waipc8timesync16BasebandProvider14handleTimesyncIP31PCITransportTimesyncMeasurementEEvNS1_16timesyncEndpointET_S6__block_invoke;
          v31[3] = &unk_26DAF2D08;
          if (v28) {
            v30 = _Block_copy(v28);
          }
          else {
            v30 = 0;
          }
          v31[4] = &v33;
          aBlock = v30;
          dispatch_async(v29, v31);
          if (aBlock) {
            _Block_release(aBlock);
          }
          if (v28) {
            _Block_release(v28);
          }
          _Block_object_dispose(&v33, 8);
          if (__p)
          {
            v37 = __p;
            operator delete(__p);
          }
        }
      }
    }
    v16 = *(char **)(a1 + 232);
    if (v16 != v9)
    {
      uint64_t v17 = *(unsigned char **)(a1 + 240);
      uint64_t v18 = v17 - v9;
      if (v17 != v9) {
        memmove(*(void **)(a1 + 232), v9, v17 - v9);
      }
      *(void *)(a1 + 240) = &v16[v18];
    }
  }
  if (a3 != a4)
  {
    if (*(_DWORD *)(a1 + 256) == a2)
    {
      v19 = *(char **)(a1 + 240);
    }
    else
    {
      v19 = *(char **)(a1 + 232);
      if (v19 != *(char **)(a1 + 240)) {
        waipc::timesync::BasebandProvider::handleTimesync<PCITransportTimesyncMeasurement *>();
      }
    }
    *(_DWORD *)(a1 + 256) = a2;
    std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__insert_with_size[abi:ne180100]<PCITransportTimesyncMeasurement *,PCITransportTimesyncMeasurement *>(a1 + 232, v19, a3, a4, 0xAAAAAAAAAAAAAAABLL * (((char *)a4 - (char *)a3) >> 3));
  }
  unint64_t v20 = (2 * *(_DWORD *)(a1 + 88));
  v22 = *(char **)(a1 + 232);
  v21 = *(char **)(a1 + 240);
  int v23 = &v21[-40 * v20];
  if (0xCCCCCCCCCCCCCCCDLL * ((v21 - v22) >> 3) > v20 && v22 != v23)
  {
    uint64_t v25 = 40 * v20;
    if (v21 != v23) {
      memmove(*(void **)(a1 + 232), v23, 40 * v20);
    }
    *(void *)(a1 + 240) = &v22[v25];
  }
}

void sub_226DF1170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  if (__p)
  {
    a21 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_17(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG)) {
    ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_17_cold_4();
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(v1 + 112));
  if (!*(unsigned char *)(v1 + 224)) {
    ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_17_cold_1();
  }
  if (!*(unsigned char *)(v1 + 225)) {
    ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_17_cold_2();
  }
  if (*(unsigned char *)(v1 + 226)) {
    ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_17_cold_3();
  }
  *(_WORD *)(v1 + 224) = 0;
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v1 + 184);
  if (v3 && (v3(v1 + 128) & 1) != 0)
  {
    if (TelephonyBasebandPCITransportTimesync())
    {
      *(unsigned char *)(v1 + 226) = 1;
    }
    else
    {
      uint64_t v5 = waipc::logging::getLogger(2u);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unint64_t v6 = 0;
        _os_log_impl(&dword_226DEE000, v5, OS_LOG_TYPE_INFO, "transport time sync start failed", v6, 2u);
      }
      waipc::timesync::BasebandProvider::die((os_unfair_lock *)v1, @"timesync measurement trigger failed");
    }
  }
  else
  {
    int64_t v4 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226DEE000, v4, OS_LOG_TYPE_INFO, "unable to trigger timesync measurement because transport is not valid", buf, 2u);
    }
  }
}

void ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_25(void *a1)
{
  uint64_t v2 = *(void *)(a1[5] + 8);
  uint64_t v3 = *(std::__shared_weak_count **)(v2 + 48);
  if (v3)
  {
    int64_t v4 = (os_unfair_lock_s *)a1[6];
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      unint64_t v6 = v5;
      if (*(void *)(v2 + 40))
      {
        os_unfair_lock_lock(v4 + 28);
        (*(void (**)(void))(a1[4] + 16))();
        os_unfair_lock_unlock(v4 + 28);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void sub_226DF1388(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandProvider::cancelTimesyncMeasurement(os_unfair_lock_s *this)
{
  uint64_t v2 = this + 28;
  os_unfair_lock_lock(this + 28);
  if (BYTE2(this[56]._os_unfair_lock_opaque)) {
    HIBYTE(this[56]._os_unfair_lock_opaque) = 1;
  }
  *(void *)&this[60]._os_unfair_lock_opaque = *(void *)&this[58]._os_unfair_lock_opaque;

  os_unfair_lock_unlock(v2);
}

void waipc::timesync::BasebandProvider::subscribe(os_unfair_lock_s *a1)
{
  uint64_t v1 = a1 + 28;
  os_unfair_lock_lock(a1 + 28);
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_226DEE000, Logger, OS_LOG_TYPE_INFO, "subscribe not supported", v3, 2u);
  }
  os_unfair_lock_unlock(v1);
}

void sub_226DF1474(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandProvider::mapBuffer(os_unfair_lock_s *a1)
{
  uint64_t v1 = a1 + 28;
  os_unfair_lock_lock(a1 + 28);
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_226DEE000, Logger, OS_LOG_TYPE_INFO, "buffer map not supported", v3, 2u);
  }
  os_unfair_lock_unlock(v1);
}

void sub_226DF1500(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandProvider::unmapBuffer(os_unfair_lock_s *a1)
{
  uint64_t v1 = a1 + 28;
  os_unfair_lock_lock(a1 + 28);
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_226DEE000, Logger, OS_LOG_TYPE_INFO, "buffer unmap not supported", v3, 2u);
  }
  os_unfair_lock_unlock(v1);
}

void sub_226DF158C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandProvider::logTimestamp(uint64_t a1, char a2, uint64_t a3, uint64_t a4, double a5)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 112));
  unint64_t v10 = *(void *)(a1 + 104);
  if (v10)
  {
    long long v11 = (char **)(a1 + 288);
    uint64_t v12 = *(void *)(a1 + 288);
    unint64_t v13 = 0xCCCCCCCCCCCCCCCDLL * ((*(void *)(a1 + 296) - v12) >> 3) + 1;
    BOOL v14 = v13 >= v10;
    unint64_t v15 = v13 - v10;
    if (v15 != 0 && v14) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::erase(a1 + 288, v12, v12 + 40 * v15);
    }
    uint64_t v16 = mach_absolute_time();
    uint64_t v17 = v16;
    unint64_t v19 = *(void *)(a1 + 296);
    unint64_t v18 = *(void *)(a1 + 304);
    if (v19 >= v18)
    {
      unint64_t v21 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v19 - (void)*v11) >> 3);
      unint64_t v22 = v21 + 1;
      if (v21 + 1 > 0x666666666666666) {
        std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v23 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v18 - (void)*v11) >> 3);
      if (2 * v23 > v22) {
        unint64_t v22 = 2 * v23;
      }
      if (v23 >= 0x333333333333333) {
        unint64_t v24 = 0x666666666666666;
      }
      else {
        unint64_t v24 = v22;
      }
      uint64_t v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>>(a1 + 304, v24);
      v26 = &v25[40 * v21];
      v28 = &v25[40 * v27];
      *(void *)v26 = v17;
      v26[8] = a2;
      *((void *)v26 + 2) = a3;
      *((double *)v26 + 3) = a5;
      *((void *)v26 + 4) = a4;
      unint64_t v20 = v26 + 40;
      v30 = *(char **)(a1 + 288);
      v29 = *(char **)(a1 + 296);
      if (v29 != v30)
      {
        do
        {
          long long v31 = *(_OWORD *)(v29 - 40);
          long long v32 = *(_OWORD *)(v29 - 24);
          *((void *)v26 - 1) = *((void *)v29 - 1);
          *(_OWORD *)(v26 - 24) = v32;
          *(_OWORD *)(v26 - 40) = v31;
          v26 -= 40;
          v29 -= 40;
        }
        while (v29 != v30);
        v29 = *v11;
      }
      *(void *)(a1 + 288) = v26;
      *(void *)(a1 + 296) = v20;
      *(void *)(a1 + 304) = v28;
      if (v29) {
        operator delete(v29);
      }
    }
    else
    {
      *(void *)unint64_t v19 = v16;
      *(unsigned char *)(v19 + 8) = a2;
      *(void *)(v19 + 16) = a3;
      *(double *)(v19 + 24) = a5;
      unint64_t v20 = (char *)(v19 + 40);
      *(void *)(v19 + 32) = a4;
    }
    *(void *)(a1 + 296) = v20;
  }
}

uint64_t std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::erase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 != a3)
  {
    uint64_t v3 = *(void *)(a1 + 8);
    uint64_t v4 = a2;
    if (a3 != v3)
    {
      uint64_t v5 = 8 * ((a3 - a2) >> 3);
      uint64_t v4 = a2;
      do
      {
        *(void *)uint64_t v4 = *(void *)(v4 + v5);
        long long v6 = *(_OWORD *)(v4 + v5 + 24);
        *(_OWORD *)(v4 + 8) = *(_OWORD *)(v4 + v5 + 8);
        *(_OWORD *)(v4 + 24) = v6;
        v4 += 40;
      }
      while (v4 + v5 != v3);
    }
    *(void *)(a1 + 8) = v4;
  }
  return a2;
}

char *waipc::timesync::BasebandProvider::logMeasurements(uint64_t a1, uint64_t a2, char *a3)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 112));
  unint64_t v6 = *(void *)(a1 + 96);
  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&a3[-a2] >> 3) >= v6) {
    unint64_t v7 = *(void *)(a1 + 96);
  }
  else {
    unint64_t v7 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&a3[-a2] >> 3);
  }
  uint32_t v9 = *(char **)(a1 + 264);
  uint64_t v8 = *(void *)(a1 + 272);
  if (v6 - v7 < 0xCCCCCCCCCCCCCCCDLL * ((v8 - (uint64_t)v9) >> 3))
  {
    unint64_t v10 = (char *)(v8 - 40 * (v6 - v7));
    if (v9 != v10)
    {
      size_t v11 = 40 * (v6 - v7);
      if ((char *)v8 != v10) {
        memmove(*(void **)(a1 + 264), v10, v11);
      }
      uint64_t v8 = (uint64_t)&v9[v11];
      *(void *)(a1 + 272) = &v9[v11];
    }
  }

  return std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__insert_with_size[abi:ne180100]<std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement const*>,std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement const*>>(a1 + 264, v8, &a3[-40 * v7], a3, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(40 * v7) >> 3));
}

CFTypeRef waipc::timesync::BasebandProvider::dumpState(waipc::timesync::BasebandProvider *this)
{
  v29[10] = *MEMORY[0x263EF8340];
  uint64_t v2 = (os_unfair_lock_s *)((char *)this + 112);
  os_unfair_lock_lock((os_unfair_lock_t)this + 28);
  memset(v25, 0, sizeof(v25));
  std::vector<applesauce::CF::DictionaryRef>::reserve(v25, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)this + 30) - *((void *)this + 29)) >> 3));
  uint64_t v3 = *((void *)this + 29);
  uint64_t v4 = *((void *)this + 30);
  v24[0] = v25;
  while (v3 != v4)
  {
    ___ZNK5waipc8timesync16BasebandProvider9dumpStateEv_block_invoke(v3, (applesauce::CF::DictionaryRef *)cf);
    std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>::operator=[abi:ne180100](v24, cf);
    if (cf[0]) {
      CFRelease(cf[0]);
    }
    v3 += 40;
  }
  memset(v24, 0, sizeof(v24));
  std::vector<applesauce::CF::DictionaryRef>::reserve((char **)v24, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)this + 34) - *((void *)this + 33)) >> 3));
  uint64_t v5 = *((void *)this + 33);
  uint64_t v6 = *((void *)this + 34);
  cf[0] = v24;
  while (v5 != v6)
  {
    ___ZNK5waipc8timesync16BasebandProvider9dumpStateEv_block_invoke(v5, (applesauce::CF::DictionaryRef *)&v27);
    std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>::operator=[abi:ne180100]((char ***)cf, &v27);
    if (v27) {
      CFRelease(v27);
    }
    v5 += 40;
  }
  memset(cf, 0, sizeof(cf));
  std::vector<applesauce::CF::DictionaryRef>::reserve((char **)cf, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)this + 37) - *((void *)this + 36)) >> 3));
  uint64_t v7 = *((void *)this + 36);
  uint64_t v8 = *((void *)this + 37);
  CFTypeRef v27 = cf;
  while (v7 != v8)
  {
    ___ZNK5waipc8timesync16BasebandProvider9dumpStateEv_block_invoke_2(v7, (applesauce::CF::DictionaryRef *)&v26);
    std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>::operator=[abi:ne180100]((char ***)&v27, &v26);
    if (v26) {
      CFRelease(v26);
    }
    v7 += 40;
  }
  uint32_t v9 = (void **)*MEMORY[0x263EFFB40];
  unint64_t v10 = (void **)*MEMORY[0x263EFFB38];
  if (*((unsigned char *)this + 116)) {
    size_t v11 = (void **)*MEMORY[0x263EFFB40];
  }
  else {
    size_t v11 = (void **)*MEMORY[0x263EFFB38];
  }
  v28[0] = (void **)@"Stopped";
  v28[1] = v11;
  v28[2] = (void **)@"Error Reason";
  uint64_t v12 = (void **)*((void *)this + 15);
  if (v12) {
    CFRetain(*((CFTypeRef *)this + 15));
  }
  v28[3] = v12;
  v28[4] = (void **)@"Timesync Pending";
  if (*((unsigned char *)this + 224)) {
    unint64_t v13 = v9;
  }
  else {
    unint64_t v13 = v10;
  }
  v28[5] = v13;
  v28[6] = (void **)@"Timesync Triggering";
  if (*((unsigned char *)this + 225)) {
    BOOL v14 = v9;
  }
  else {
    BOOL v14 = v10;
  }
  v28[7] = v14;
  v28[8] = (void **)@"Timesync Running";
  if (*((unsigned char *)this + 226)) {
    unint64_t v15 = v9;
  }
  else {
    unint64_t v15 = v10;
  }
  v28[9] = v15;
  v28[10] = (void **)@"Timesync Cancelled";
  if (*((unsigned char *)this + 227)) {
    uint64_t v16 = v9;
  }
  else {
    uint64_t v16 = v10;
  }
  v28[11] = v16;
  waipc::util::_kv::_kv<unsigned long long const&,void>(v29, @"Last Timesync Trigger", (uint64_t *)this + 27);
  v29[2] = @"Partial Measurements";
  CFArrayRef v17 = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>((uint64_t **)v25);
  if (*((_DWORD *)this + 64)) {
    unint64_t v18 = @"device";
  }
  else {
    unint64_t v18 = @"host";
  }
  v29[3] = v17;
  v29[4] = @"Partial Endpoint";
  CFRetain(v18);
  v29[5] = v18;
  v29[6] = @"Measurement Log";
  v29[7] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>((uint64_t **)v24);
  v29[8] = @"Timestamp Log";
  v29[9] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>((uint64_t **)cf);
  waipc::util::createCFDictDropNull<11l>((uint64_t)v28, (applesauce::CF::DictionaryRef *)&v27);
  for (uint64_t i = 21; i != -1; i -= 2)
  {
    unint64_t v20 = v28[i];
    if (v20) {
      CFRelease(v20);
    }
  }
  CFTypeRef v21 = v27;
  v28[0] = (void **)cf;
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](v28);
  v28[0] = (void **)v24;
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](v28);
  v28[0] = (void **)v25;
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](v28);
  os_unfair_lock_unlock(v2);
  return v21;
}

void sub_226DF1C00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, char a18, int a19, __int16 a20,char a21,char a22,uint64_t a23)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_226DF1CD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

void ___ZNK5waipc8timesync16BasebandProvider9dumpStateEv_block_invoke(uint64_t a1@<X1>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  v10[2] = *MEMORY[0x263EF8340];
  waipc::util::_kv::_kv<unsigned int const&,void>(v6, @"SEQ", (int *)a1);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v7, @"Host Begin", (uint64_t *)(a1 + 8));
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v8, @"Host Duration", (uint64_t *)(a1 + 16));
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v9, @"Device Time", (uint64_t *)(a1 + 24));
  waipc::util::_kv::_kv<double const&,void>(v10, @"Device Granularity", (uint64_t *)(a1 + 32));
  waipc::util::createCFDictDropNull<5l>((uint64_t)v6, a2);
  for (uint64_t i = 9; i != -1; i -= 2)
  {
    uint64_t v5 = (const void *)v6[i];
    if (v5) {
      CFRelease(v5);
    }
  }
}

void sub_226DF1DFC(_Unwind_Exception *a1)
{
  for (uint64_t i = 64; i != -16; i -= 16)
    waipc::util::_kv::~_kv((waipc::util::_kv *)(v1 + i));
  _Unwind_Resume(a1);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<5l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3 = 0;
  CFIndex v4 = 0;
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  *(_OWORD *)keys = 0u;
  long long v12 = 0u;
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  do
  {
    uint64_t v5 = *(void **)(a1 + v3);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((void *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 80);
  CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)v9, v4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

uint64_t std::vector<applesauce::CF::DictionaryRef>::reserve(char **a1, unint64_t a2)
{
  CFIndex v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    uint64_t v17 = result;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(result, a2);
    uint64_t v9 = *a1;
    uint64_t v8 = a1[1];
    if (v8 == *a1)
    {
      int64x2_t v12 = vdupq_n_s64((unint64_t)v8);
      uint64_t v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      uint64_t v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
      do
      {
        uint64_t v11 = *((void *)v8 - 1);
        v8 -= 8;
        *((void *)v10 - 1) = v11;
        v10 -= 8;
        *(void *)uint64_t v8 = 0;
      }
      while (v8 != v9);
      int64x2_t v12 = *(int64x2_t *)a1;
    }
    *a1 = v10;
    a1[1] = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    int64x2_t v15 = v12;
    uint64_t v13 = a1[2];
    a1[2] = &v6[8 * v7];
    uint64_t v16 = v13;
    uint64_t v14 = v12.i64[0];
    return std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)&v14);
  }
  return result;
}

void ___ZNK5waipc8timesync16BasebandProvider9dumpStateEv_block_invoke_2(uint64_t a1@<X1>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  void v11[2] = *MEMORY[0x263EF8340];
  waipc::util::_kv::_kv<unsigned long long const&,void>(v7, @"Mach Time", (uint64_t *)a1);
  char v6 = *(unsigned char *)(a1 + 8);
  waipc::util::_kv::_kv<unsigned char,void>(&v8, @"Type", &v6);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v9, @"Time", (uint64_t *)(a1 + 16));
  waipc::util::_kv::_kv<double const&,void>(&v10, @"Time Granularity", (uint64_t *)(a1 + 24));
  waipc::util::_kv::_kv<unsigned long long const&,void>(v11, @"Interval", (uint64_t *)(a1 + 32));
  waipc::util::createCFDictDropNull<5l>((uint64_t)v7, a2);
  for (uint64_t i = 9; i != -1; i -= 2)
  {
    uint64_t v5 = (const void *)v7[i];
    if (v5) {
      CFRelease(v5);
    }
  }
}

void sub_226DF2104(_Unwind_Exception *a1)
{
  for (uint64_t i = 64; i != -16; i -= 16)
    waipc::util::_kv::~_kv((waipc::util::_kv *)(v1 + i));
  _Unwind_Resume(a1);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<11l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3 = 0;
  CFIndex v4 = 0;
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  *(_OWORD *)keys = 0u;
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  do
  {
    uint64_t v5 = *(void **)(a1 + v3);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((void *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 176);
  CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)v9, v4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

void applesauce::CF::DictionaryRef::~DictionaryRef(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

__CFString *waipc::timesync::BasebandProvider::getTimestampName(int a1)
{
  if (a1) {
    return @"unknown";
  }
  else {
    return @"Network Uplink Schedule";
  }
}

__CFString *waipc::timesync::BasebandProvider::getBufferName(int a1)
{
  if (a1) {
    return @"unknown";
  }
  else {
    return @"Disco";
  }
}

void waipc::timesync::ModernBasebandProvider::mapBuffer(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 16777984;
    uint8_t buf[4] = a2;
    *(_WORD *)&buf[5] = 2048;
    *(void *)&buf[7] = a3;
    *(_WORD *)&buf[15] = 2048;
    *(void *)&buf[17] = a4;
    _os_log_debug_impl(&dword_226DEE000, Logger, OS_LOG_TYPE_DEBUG, "mapping buffer with id %hhu, addr %p, length %zu", buf, 0x19u);
  }
  if (a2)
  {
    uint64_t v9 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 16777472;
      uint8_t buf[4] = a2;
      _os_log_impl(&dword_226DEE000, v9, OS_LOG_TYPE_INFO, "unknown buffer id %hhu", buf, 5u);
    }
  }
  else
  {
    uint64_t v10 = (os_unfair_lock_s *)(a1 + 112);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    uint64_t v11 = *(uint64_t (**)(uint64_t))(a1 + 184);
    if (v11 && (v11(a1 + 128) & 1) != 0)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3802000000;
      *(void *)&buf[24] = __Block_byref_object_copy_;
      unint64_t v18 = __Block_byref_object_dispose_;
      std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(v15, (void *)(a1 + 8));
      long long v12 = v16;
      uint64_t v19 = *(void *)v15;
      unint64_t v20 = v16;
      if (v16)
      {
        atomic_fetch_add_explicit(&v16->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        std::__shared_weak_count::__release_shared[abi:ne180100](v12);
      }
      if ((TelephonyBasebandPCITransportMapRegion() & 1) == 0)
      {
        long long v13 = waipc::logging::getLogger(2u);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long v15 = 16777472;
          v15[4] = 0;
          _os_log_impl(&dword_226DEE000, v13, OS_LOG_TYPE_INFO, "buffer map for buffer %hhu failed", v15, 5u);
        }
        waipc::timesync::BasebandProvider::die((os_unfair_lock *)a1, @"buffer map failed");
      }
      _Block_object_dispose(buf, 8);
      if (v20) {
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    else
    {
      long long v14 = waipc::logging::getLogger(2u);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226DEE000, v14, OS_LOG_TYPE_INFO, "unable to map buffer because transport is not valid", buf, 2u);
      }
    }
    os_unfair_lock_unlock(v10);
  }
}

void sub_226DF2594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,std::__shared_weak_count *a25)
{
  _Block_object_dispose(&a19, 8);
  if (a25) {
    std::__shared_weak_count::__release_weak(a25);
  }
  os_unfair_lock_unlock(v25);
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync22ModernBasebandProvider9mapBufferENS0_16BasebandProvider8bufferIdEPvm_block_invoke(uint64_t a1, int a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 40);
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG)) {
    ___ZN5waipc8timesync22ModernBasebandProvider9mapBufferENS0_16BasebandProvider8bufferIdEPvm_block_invoke_cold_1();
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  CFDictionaryRef v7 = *(std::__shared_weak_count **)(v6 + 48);
  if (v7)
  {
    uint64_t v8 = std::__shared_weak_count::lock(v7);
    if (v8)
    {
      uint64_t v9 = v8;
      if (*(void *)(v6 + 40))
      {
        uint64_t v10 = (os_unfair_lock_s *)(v4 + 112);
        os_unfair_lock_lock((os_unfair_lock_t)(v4 + 112));
        if (!*(unsigned char *)(v4 + 116))
        {
          if (a2)
          {
            uint64_t v11 = waipc::logging::getLogger(2u);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              char v12 = *(unsigned char *)(a1 + 48);
              *(_DWORD *)buf = 16777728;
              char v22 = v12;
              __int16 v23 = 1024;
              int v24 = a2;
              _os_log_impl(&dword_226DEE000, v11, OS_LOG_TYPE_INFO, "buffer map for buffer %hhu failed 0x%08x", buf, 0xBu);
            }
            waipc::timesync::BasebandProvider::die((os_unfair_lock *)v4, @"buffer map failed");
          }
          else
          {
            long long v13 = *(const void **)(v4 + 72);
            if (v13)
            {
              long long v14 = _Block_copy(v13);
              long long v15 = v14;
              uint64_t v16 = *(NSObject **)(v4 + 24);
              v18[0] = MEMORY[0x263EF8330];
              v18[1] = 1174405120;
              v18[2] = ___ZN5waipc8timesync22ModernBasebandProvider9mapBufferENS0_16BasebandProvider8bufferIdEPvm_block_invoke_114;
              v18[3] = &__block_descriptor_tmp_115;
              if (v14) {
                uint64_t v17 = _Block_copy(v14);
              }
              else {
                uint64_t v17 = 0;
              }
              aBlock = v17;
              char v20 = *(unsigned char *)(a1 + 48);
              dispatch_async(v16, v18);
              if (aBlock) {
                _Block_release(aBlock);
              }
              if (v15) {
                _Block_release(v15);
              }
            }
          }
        }
        os_unfair_lock_unlock(v10);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
}

void sub_226DF27C8(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN5waipc8timesync22ModernBasebandProvider9mapBufferENS0_16BasebandProvider8bufferIdEPvm_block_invoke_114(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 1);
}

void *__copy_helper_block_e8_32c86_ZTSN10applesauce8dispatch2v15blockIFvN5waipc8timesync16BasebandProvider8bufferIdEbEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 32);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c86_ZTSN10applesauce8dispatch2v15blockIFvN5waipc8timesync16BasebandProvider8bufferIdEbEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void waipc::timesync::ModernBasebandProvider::unmapBuffer(uint64_t a1, int a2)
{
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG)) {
    waipc::timesync::ModernBasebandProvider::unmapBuffer(a2, Logger);
  }
  if (a2)
  {
    uint64_t v5 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 16777472;
      uint8_t buf[4] = a2;
      _os_log_impl(&dword_226DEE000, v5, OS_LOG_TYPE_INFO, "unknown buffer id %hhu", buf, 5u);
    }
  }
  else
  {
    uint64_t v6 = (os_unfair_lock_s *)(a1 + 112);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    CFDictionaryRef v7 = *(uint64_t (**)(uint64_t))(a1 + 184);
    if (v7 && (v7(a1 + 128) & 1) != 0)
    {
      *(void *)buf = 0;
      long long v14 = buf;
      uint64_t v15 = 0x3802000000;
      uint64_t v16 = __Block_byref_object_copy_;
      uint64_t v17 = __Block_byref_object_dispose_;
      std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(v11, (void *)(a1 + 8));
      uint64_t v8 = v12;
      uint64_t v18 = *(void *)v11;
      uint64_t v19 = v12;
      if (v12)
      {
        atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      }
      if ((TelephonyBasebandPCITransportUnmapRegion() & 1) == 0)
      {
        uint64_t v9 = waipc::logging::getLogger(2u);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t v11 = 16777472;
          v11[4] = 0;
          _os_log_impl(&dword_226DEE000, v9, OS_LOG_TYPE_INFO, "buffer unmap for buffer %hhu failed", v11, 5u);
        }
        waipc::timesync::BasebandProvider::die((os_unfair_lock *)a1, @"buffer unmap failed");
      }
      _Block_object_dispose(buf, 8);
      if (v19) {
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    else
    {
      uint64_t v10 = waipc::logging::getLogger(2u);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226DEE000, v10, OS_LOG_TYPE_INFO, "unable to unmap buffer because transport is not valid", buf, 2u);
      }
    }
    os_unfair_lock_unlock(v6);
  }
}

void sub_226DF2ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,std::__shared_weak_count *a25)
{
  _Block_object_dispose(&a19, 8);
  if (a25) {
    std::__shared_weak_count::__release_weak(a25);
  }
  os_unfair_lock_unlock(v25);
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync22ModernBasebandProvider11unmapBufferENS0_16BasebandProvider8bufferIdE_block_invoke(uint64_t a1, int a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 40);
  Logger = waipc::logging::getLogger(2u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG)) {
    ___ZN5waipc8timesync22ModernBasebandProvider11unmapBufferENS0_16BasebandProvider8bufferIdE_block_invoke_cold_1();
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  CFDictionaryRef v7 = *(std::__shared_weak_count **)(v6 + 48);
  if (v7)
  {
    uint64_t v8 = std::__shared_weak_count::lock(v7);
    if (v8)
    {
      uint64_t v9 = v8;
      if (*(void *)(v6 + 40))
      {
        uint64_t v10 = (os_unfair_lock_s *)(v4 + 112);
        os_unfair_lock_lock((os_unfair_lock_t)(v4 + 112));
        if (!*(unsigned char *)(v4 + 116))
        {
          if (a2)
          {
            uint64_t v11 = waipc::logging::getLogger(2u);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              char v12 = *(unsigned char *)(a1 + 48);
              *(_DWORD *)buf = 16777728;
              char v22 = v12;
              __int16 v23 = 1024;
              int v24 = a2;
              _os_log_impl(&dword_226DEE000, v11, OS_LOG_TYPE_INFO, "buffer unmap for buffer %hhu failed 0x%08x", buf, 0xBu);
            }
            waipc::timesync::BasebandProvider::die((os_unfair_lock *)v4, @"buffer unmap failed");
          }
          else
          {
            long long v13 = *(const void **)(v4 + 72);
            if (v13)
            {
              long long v14 = _Block_copy(v13);
              uint64_t v15 = v14;
              uint64_t v16 = *(NSObject **)(v4 + 24);
              v18[0] = MEMORY[0x263EF8330];
              v18[1] = 1174405120;
              v18[2] = ___ZN5waipc8timesync22ModernBasebandProvider11unmapBufferENS0_16BasebandProvider8bufferIdE_block_invoke_121;
              v18[3] = &__block_descriptor_tmp_124;
              if (v14) {
                uint64_t v17 = _Block_copy(v14);
              }
              else {
                uint64_t v17 = 0;
              }
              aBlock = v17;
              char v20 = *(unsigned char *)(a1 + 48);
              dispatch_async(v16, v18);
              if (aBlock) {
                _Block_release(aBlock);
              }
              if (v15) {
                _Block_release(v15);
              }
            }
          }
        }
        os_unfair_lock_unlock(v10);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
}

void sub_226DF2D08(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN5waipc8timesync22ModernBasebandProvider11unmapBufferENS0_16BasebandProvider8bufferIdE_block_invoke_121(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

uint64_t waipc::timesync::ModernBasebandProvider::configureTransport(const os_unfair_lock *a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 36) = 0;
  *(_DWORD *)(a2 + 40) = 0;
  return 1;
}

uint64_t waipc::timesync::ModernBasebandProvider::engageTransport(const os_unfair_lock *this)
{
  os_unfair_lock_assert_owner(this + 28);
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3802000000;
  void v10[3] = __Block_byref_object_copy_;
  v10[4] = __Block_byref_object_dispose_;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(buf, &this[2]._os_unfair_lock_opaque);
  uint64_t v2 = v9;
  v10[5] = *(void *)buf;
  uint64_t v11 = v9;
  if (v9)
  {
    atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = TelephonyBasebandPCITransportRegisterTimeEvent();
  if ((v3 & 1) == 0)
  {
    Logger = waipc::logging::getLogger(2u);
    if (!os_log_type_enabled(Logger, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    uint64_t v5 = "register time event failed";
    goto LABEL_13;
  }
  if (TelephonyBasebandPCITransportRegisterTimeEvent())
  {
    BYTE1(this[29]._os_unfair_lock_opaque) = 1;
  }
  else
  {
    uint64_t v6 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226DEE000, v6, OS_LOG_TYPE_INFO, "register host time event failed", buf, 2u);
    }
  }
  if ((TelephonyBasebandPCITransportRegisterTimeEvent() & 1) == 0)
  {
    Logger = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v5 = "register network time event failed";
LABEL_13:
      _os_log_impl(&dword_226DEE000, Logger, OS_LOG_TYPE_INFO, v5, buf, 2u);
    }
  }
LABEL_14:
  _Block_object_dispose(v10, 8);
  if (v11) {
    std::__shared_weak_count::__release_weak(v11);
  }
  return v3;
}

void sub_226DF2F98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24)
{
  if (a24) {
    std::__shared_weak_count::__release_weak(a24);
  }
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync22ModernBasebandProvider15engageTransportEv_block_invoke(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(std::__shared_weak_count **)(v3 + 48);
  if (v4)
  {
    uint64_t v6 = *(os_unfair_lock **)(a1 + 40);
    CFDictionaryRef v7 = std::__shared_weak_count::lock(v4);
    if (v7)
    {
      uint64_t v8 = v7;
      if (*(void *)(v3 + 40))
      {
        os_unfair_lock_lock(v6 + 28);
        waipc::timesync::ModernBasebandProvider::handleTimeEvent(v6, a2);
        os_unfair_lock_unlock(v6 + 28);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
  }
}

void sub_226DF3060(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::ModernBasebandProvider::handleTimeEvent(os_unfair_lock *a1, unsigned __int8 *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(a1 + 28);
  uint64_t v5 = a2 + 1;
  unint64_t v4 = (char)a2[1];
  if (v4 < 8 && ((0x8Fu >> v4) & 1) != 0)
  {
    uint64_t v8 = qword_226E08C40[v4];
    Logger = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG)) {
      waipc::timesync::ModernBasebandProvider::handleTimeEvent(a2, a2 + 1, Logger);
    }
    int v10 = *a2;
    if (v10 == 3)
    {
      uint64_t v13 = *((unsigned int *)a2 + 1);
      uint64_t v12 = *((void *)a2 + 1);
      uint64_t v14 = 0;
      uint64_t v15 = v12;
      waipc::timesync::BasebandProvider::handleTimesync<PCITransportTimesyncMeasurement *>((uint64_t)a1, 0, (int *)&v13, (int *)&v16);
    }
    else if (v10 == 1)
    {
      unsigned int v11 = *((_DWORD *)a2 + 1);
      uint64_t v14 = *((void *)a2 + 1);
      uint64_t v13 = v11;
      uint64_t v15 = v8;
      waipc::timesync::BasebandProvider::handleTimesync<waipc::timesync::BasebandProvider::deviceTimesyncMeasurement *>((uint64_t)a1, 1, &v13, (uint64_t)&v16);
    }
  }
  else
  {
    uint64_t v6 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = *v5;
      LODWORD(v13) = 67109120;
      HIDWORD(v13) = v7;
      _os_log_impl(&dword_226DEE000, v6, OS_LOG_TYPE_INFO, "got invalid timestamp unit (%u)", (uint8_t *)&v13, 8u);
    }
    waipc::timesync::BasebandProvider::die(a1, @"timesync got invalid timestamp unit");
  }
}

void waipc::timesync::BasebandProvider::handleTimesync<waipc::timesync::BasebandProvider::deviceTimesyncMeasurement *>(uint64_t a1, int a2, _DWORD *a3, uint64_t a4)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 112));
  if (*(_DWORD *)(a1 + 256) != a2)
  {
    uint64_t v8 = *(void *)(a1 + 232);
    uint64_t v9 = (char *)v8;
    if (a3 != (_DWORD *)a4)
    {
      while (v9 != *(char **)(a1 + 240))
      {
        if (*a3 == *(_DWORD *)v9)
        {
          waipc::timesync::BasebandProvider::timesyncMeasurement::complete((uint64_t)v9, (uint64_t)a3);
          if (v9 != (char *)v8)
          {
            long long v10 = *(_OWORD *)v9;
            long long v11 = *((_OWORD *)v9 + 1);
            v35 = (void (*)(uint64_t))*((void *)v9 + 4);
            long long v33 = v10;
            long long v34 = v11;
            long long v12 = *(_OWORD *)v8;
            long long v13 = *(_OWORD *)(v8 + 16);
            *((void *)v9 + 4) = *(void *)(v8 + 32);
            *(_OWORD *)uint64_t v9 = v12;
            *((_OWORD *)v9 + 1) = v13;
            long long v14 = v33;
            long long v15 = v34;
            *(void *)(v8 + 32) = v35;
            *(_OWORD *)uint64_t v8 = v14;
            *(_OWORD *)(v8 + 16) = v15;
          }
          v8 += 40;
          v9 += 40;
          a3 += 6;
        }
        else if (*a3 - *(_DWORD *)v9 < 0)
        {
          a3 += 6;
        }
        else
        {
          v9 += 40;
        }
        if (a3 == (_DWORD *)a4)
        {
          a3 = (_DWORD *)a4;
          break;
        }
      }
    }
    if (!*(unsigned char *)(a1 + 116))
    {
      if (*(void *)(a1 + 56))
      {
        CFTypeRef v26 = *(const void **)(a1 + 232);
        if ((const void *)v8 != v26)
        {
          *(void *)&long long v33 = 0;
          *((void *)&v33 + 1) = &v33;
          *(void *)&long long v34 = 0x4002000000;
          *((void *)&v34 + 1) = __Block_byref_object_copy__164;
          v35 = __Block_byref_object_dispose__165;
          __p = 0;
          v37 = 0;
          uint64_t v38 = 0;
          std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__init_with_size[abi:ne180100]<std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement*>,std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement*>>(&__p, v26, v8, 0xCCCCCCCCCCCCCCCDLL * ((v8 - (uint64_t)v26) >> 3));
          waipc::timesync::BasebandProvider::logMeasurements(a1, *(void *)(*((void *)&v33 + 1) + 40), *(char **)(*((void *)&v33 + 1) + 48));
          CFTypeRef v27 = *(const void **)(a1 + 56);
          if (v27) {
            v28 = _Block_copy(v27);
          }
          else {
            v28 = 0;
          }
          v29 = *(NSObject **)(a1 + 24);
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 1174405120;
          v31[2] = ___ZN5waipc8timesync16BasebandProvider14handleTimesyncIPNS1_25deviceTimesyncMeasurementEEEvNS1_16timesyncEndpointET_S6__block_invoke;
          v31[3] = &unk_26DAF2D40;
          if (v28) {
            v30 = _Block_copy(v28);
          }
          else {
            v30 = 0;
          }
          v31[4] = &v33;
          aBlock = v30;
          dispatch_async(v29, v31);
          if (aBlock) {
            _Block_release(aBlock);
          }
          if (v28) {
            _Block_release(v28);
          }
          _Block_object_dispose(&v33, 8);
          if (__p)
          {
            v37 = __p;
            operator delete(__p);
          }
        }
      }
    }
    uint64_t v16 = *(char **)(a1 + 232);
    if (v16 != v9)
    {
      uint64_t v17 = *(unsigned char **)(a1 + 240);
      uint64_t v18 = v17 - v9;
      if (v17 != v9) {
        memmove(*(void **)(a1 + 232), v9, v17 - v9);
      }
      *(void *)(a1 + 240) = &v16[v18];
    }
  }
  if (a3 != (_DWORD *)a4)
  {
    if (*(_DWORD *)(a1 + 256) == a2)
    {
      uint64_t v19 = *(char **)(a1 + 240);
    }
    else
    {
      uint64_t v19 = *(char **)(a1 + 232);
      if (v19 != *(char **)(a1 + 240)) {
        waipc::timesync::BasebandProvider::handleTimesync<PCITransportTimesyncMeasurement *>();
      }
    }
    *(_DWORD *)(a1 + 256) = a2;
    std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__insert_with_size[abi:ne180100]<waipc::timesync::BasebandProvider::deviceTimesyncMeasurement *,waipc::timesync::BasebandProvider::deviceTimesyncMeasurement *>(a1 + 232, v19, (uint64_t)a3, a4, 0xAAAAAAAAAAAAAAABLL * ((a4 - (uint64_t)a3) >> 3));
  }
  unint64_t v20 = (2 * *(_DWORD *)(a1 + 88));
  char v22 = *(char **)(a1 + 232);
  uint64_t v21 = *(char **)(a1 + 240);
  __int16 v23 = &v21[-40 * v20];
  if (0xCCCCCCCCCCCCCCCDLL * ((v21 - v22) >> 3) > v20 && v22 != v23)
  {
    uint64_t v25 = 40 * v20;
    if (v21 != v23) {
      memmove(*(void **)(a1 + 232), v23, 40 * v20);
    }
    *(void *)(a1 + 240) = &v22[v25];
  }
}

void sub_226DF353C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  if (__p)
  {
    a21 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void waipc::timesync::LegacyBasebandProvider::subscribe(os_unfair_lock *a1, int a2, unsigned __int8 a3)
{
  uint64_t v6 = a1 + 28;
  os_unfair_lock_lock(a1 + 28);
  if (a2) {
    __assert_rtn("subscribe", "BasebandProvider.cpp", 870, "type == timestampId::kNetworkUplinkSchedule");
  }
  waipc::timesync::LegacyBasebandProvider::sendSubscribeMessage(a1, a3);

  os_unfair_lock_unlock(v6);
}

void sub_226DF35E8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::LegacyBasebandProvider::sendSubscribeMessage(os_unfair_lock *this, unsigned __int8 a2)
{
  os_unfair_lock_assert_owner(this + 28);
  unint64_t v4 = *(uint64_t (**)(os_unfair_lock *))&this[46]._os_unfair_lock_opaque;
  if (v4 && (uint64_t v5 = this + 32, (v4(this + 32) & 1) != 0))
  {
    int v9 = 0;
    v10[0] = 1;
    v10[1] = a2 ^ 1;
    if (!*(void *)&v5->_os_unfair_lock_opaque
      || ((*(uint64_t (**)(os_unfair_lock *, _WORD *, uint64_t, int *, void, uint64_t, void))&v5->_os_unfair_lock_opaque)(this + 32, v10, 4, &v9, 0, 0xFFFFFFFFLL, 0) & 1) == 0)
    {
      Logger = waipc::logging::getLogger(2u);
      if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
      {
        __int16 v8 = 0;
        _os_log_impl(&dword_226DEE000, Logger, OS_LOG_TYPE_INFO, "failed to send subscribe message", (uint8_t *)&v8, 2u);
      }
      waipc::timesync::BasebandProvider::die(this, @"timesync PCI write failed");
    }
  }
  else
  {
    int v7 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226DEE000, v7, OS_LOG_TYPE_INFO, "unable to send subscribe message because transport is not valid", buf, 2u);
    }
  }
}

uint64_t waipc::timesync::LegacyBasebandProvider::configureTransport(const os_unfair_lock *a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 36) = a1[22]._os_unfair_lock_opaque + 1;
  *(_DWORD *)(a2 + 40) = 64;
  return 1;
}

void waipc::timesync::LegacyBasebandProvider::handleTransportRead(os_unfair_lock *this, char *a2, unsigned int a3)
{
  os_unfair_lock_assert_owner(this + 28);

  waipc::timesync::LegacyBasebandProvider::handleMessage(this, a2, a3);
}

void waipc::timesync::LegacyBasebandProvider::handleMessage(os_unfair_lock *this, char *a2, unint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(this + 28);
  if (a3 <= 1)
  {
    Logger = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
    {
      int v13 = 134217984;
      unint64_t v14 = a3;
      _os_log_impl(&dword_226DEE000, Logger, OS_LOG_TYPE_INFO, "got undersized message header (%zu)", (uint8_t *)&v13, 0xCu);
    }
    CFStringRef v7 = @"timesync got undersized message header";
LABEL_24:
    waipc::timesync::BasebandProvider::die(this, v7);
    return;
  }
  if (*a2)
  {
    __int16 v8 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      char v9 = *a2;
      int v13 = 16777472;
      LOBYTE(v14) = v9;
      _os_log_impl(&dword_226DEE000, v8, OS_LOG_TYPE_INFO, "got unrecognized message type (%hhu)", (uint8_t *)&v13, 5u);
    }
    CFStringRef v7 = @"timesync got unrecognized message type";
    goto LABEL_24;
  }
  if (a3 <= 0xF)
  {
    long long v10 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 134217984;
      unint64_t v14 = a3;
      _os_log_impl(&dword_226DEE000, v10, OS_LOG_TYPE_INFO, "got undersized time event (%zu)", (uint8_t *)&v13, 0xCu);
    }
    CFStringRef v7 = @"timesync got undersized time event";
    goto LABEL_24;
  }
  if (a2[2] == 1)
  {
    waipc::timesync::LegacyBasebandProvider::handleUplinkScheduleUpdate(this, a2, a3);
  }
  else
  {
    if (a2[2])
    {
      long long v11 = waipc::logging::getLogger(2u);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        char v12 = a2[2];
        int v13 = 16777472;
        LOBYTE(v14) = v12;
        _os_log_impl(&dword_226DEE000, v11, OS_LOG_TYPE_INFO, "got unrecognized time event type (%hhu)", (uint8_t *)&v13, 5u);
      }
      CFStringRef v7 = @"timesync got unrecognized time event type";
      goto LABEL_24;
    }
    waipc::timesync::LegacyBasebandProvider::handleDeviceTimesyncMeasurement(this, (uint64_t)a2);
  }
}

void waipc::timesync::LegacyBasebandProvider::handleDeviceTimesyncMeasurement(os_unfair_lock *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(a1 + 28);
  unint64_t v4 = *(char *)(a2 + 3);
  if (v4 >= 4)
  {
    Logger = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
    {
      char v9 = *(unsigned char *)(a2 + 3);
      LODWORD(v13) = 16777472;
      BYTE4(v13) = v9;
      _os_log_impl(&dword_226DEE000, Logger, OS_LOG_TYPE_INFO, "got invalid timestamp unit (%hhu)", (uint8_t *)&v13, 5u);
    }
    waipc::timesync::BasebandProvider::die(a1, @"timesync got invalid timestamp unit");
  }
  else if ((unint64_t)(*(void *)(a2 + 8) + 1) > 1)
  {
    uint64_t v10 = qword_226E08C80[v4];
    unsigned int v11 = *(_DWORD *)(a2 + 4);
    *(void *)&long long v14 = *(void *)(a2 + 8);
    uint64_t v13 = v11;
    *((void *)&v14 + 1) = v10;
    char v12 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      waipc::timesync::LegacyBasebandProvider::handleDeviceTimesyncMeasurement();
    }
    waipc::timesync::BasebandProvider::handleTimesync<waipc::timesync::BasebandProvider::deviceTimesyncMeasurement *>((uint64_t)a1, 1, &v13, (uint64_t)&v15);
  }
  else
  {
    uint64_t v5 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = *(_DWORD *)(a2 + 4);
      uint64_t v7 = *(void *)(a2 + 8);
      LODWORD(v13) = 67109376;
      HIDWORD(v13) = v6;
      LOWORD(v14) = 2048;
      *(void *)((char *)&v14 + 2) = v7;
      _os_log_impl(&dword_226DEE000, v5, OS_LOG_TYPE_INFO, "got invalid timesync measurement seq %u, payload %llu", (uint8_t *)&v13, 0x12u);
    }
  }
}

void waipc::timesync::LegacyBasebandProvider::handleUplinkScheduleUpdate(os_unfair_lock *this, unsigned char *a2, unint64_t a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(this + 28);
  Logger = waipc::logging::getLogger(2u);
  uint64_t v7 = Logger;
  if (a3 <= 0x17)
  {
    if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v25 = a3;
      _os_log_impl(&dword_226DEE000, v7, OS_LOG_TYPE_INFO, "got undersized uplink schedule (%zu)", buf, 0xCu);
    }
    CFStringRef v8 = @"timesync got invalid uplink schedule";
LABEL_15:
    waipc::timesync::BasebandProvider::die(this, v8);
    return;
  }
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEBUG)) {
    waipc::timesync::LegacyBasebandProvider::handleUplinkScheduleUpdate();
  }
  unint64_t v9 = (char)a2[3];
  if (v9 >= 4)
  {
    uint64_t v15 = waipc::logging::getLogger(2u);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      char v16 = a2[3];
      *(_DWORD *)buf = 16777472;
      LOBYTE(v25) = v16;
      _os_log_impl(&dword_226DEE000, v15, OS_LOG_TYPE_INFO, "got invalid timestamp unit (%hhu)", buf, 5u);
    }
    CFStringRef v8 = @"timesync got invalid timestamp unit";
    goto LABEL_15;
  }
  if (!LOBYTE(this[29]._os_unfair_lock_opaque) && *(void *)&this[16]._os_unfair_lock_opaque)
  {
    double v10 = *(double *)&qword_226E08C80[v9];
    uint64_t v12 = *((void *)a2 + 1);
    uint64_t v11 = *((void *)a2 + 2);
    waipc::timesync::BasebandProvider::logTimestamp((uint64_t)this, 0, v12, v11, v10);
    uint64_t v13 = *(const void **)&this[16]._os_unfair_lock_opaque;
    if (v13) {
      long long v14 = _Block_copy(v13);
    }
    else {
      long long v14 = 0;
    }
    uint64_t v17 = *(NSObject **)&this[6]._os_unfair_lock_opaque;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 1174405120;
    v19[2] = ___ZN5waipc8timesync22LegacyBasebandProvider26handleUplinkScheduleUpdateEPKvm_block_invoke;
    v19[3] = &__block_descriptor_tmp_150;
    if (v14) {
      uint64_t v18 = _Block_copy(v14);
    }
    else {
      uint64_t v18 = 0;
    }
    aBlock = v18;
    uint64_t v21 = v12;
    double v22 = v10;
    uint64_t v23 = v11;
    dispatch_async(v17, v19);
    if (aBlock) {
      _Block_release(aBlock);
    }
    if (v14) {
      _Block_release(v14);
    }
  }
}

void sub_226DF3E18(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t ___ZN5waipc8timesync22LegacyBasebandProvider26handleUplinkScheduleUpdateEPKvm_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(a1 + 40), *(void *)(a1 + 56), *(double *)(a1 + 48));
}

void *__copy_helper_block_e8_32c92_ZTSN10applesauce8dispatch2v15blockIFvN5waipc8timesync16BasebandProvider11timestampIdEydyEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 32);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c92_ZTSN10applesauce8dispatch2v15blockIFvN5waipc8timesync16BasebandProvider11timestampIdEydyEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void waipc::timesync::ModernBasebandProvider::~ModernBasebandProvider(os_unfair_lock *this)
{
  waipc::timesync::BasebandProvider::~BasebandProvider(this);

  JUMPOUT(0x22A66A9D0);
}

void waipc::timesync::LegacyBasebandProvider::~LegacyBasebandProvider(os_unfair_lock *this)
{
  waipc::timesync::BasebandProvider::~BasebandProvider(this);

  JUMPOUT(0x22A66A9D0);
}

uint64_t waipc::timesync::BasebandProvider::config::config(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(NSObject **)a2;
  *(void *)a1 = *(void *)a2;
  if (v4) {
    dispatch_retain(v4);
  }
  uint64_t v5 = *(NSObject **)(a2 + 8);
  *(void *)(a1 + 8) = v5;
  if (v5) {
    dispatch_retain(v5);
  }
  int v6 = *(void **)(a2 + 16);
  if (v6) {
    int v6 = _Block_copy(v6);
  }
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = *(void **)(a2 + 24);
  if (v7) {
    uint64_t v7 = _Block_copy(v7);
  }
  *(void *)(a1 + 24) = v7;
  CFStringRef v8 = *(void **)(a2 + 32);
  if (v8) {
    CFStringRef v8 = _Block_copy(v8);
  }
  *(void *)(a1 + 32) = v8;
  unint64_t v9 = *(void **)(a2 + 40);
  if (v9) {
    unint64_t v9 = _Block_copy(v9);
  }
  *(void *)(a1 + 40) = v9;
  double v10 = *(void **)(a2 + 48);
  if (v10) {
    double v10 = _Block_copy(v10);
  }
  *(void *)(a1 + 48) = v10;
  long long v11 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = v11;
  return a1;
}

void waipc::timesync::BasebandProvider::config::~config(waipc::timesync::BasebandProvider::config *this)
{
  uint64_t v2 = (const void *)*((void *)this + 6);
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = (const void *)*((void *)this + 5);
  if (v3) {
    _Block_release(v3);
  }
  unint64_t v4 = (const void *)*((void *)this + 4);
  if (v4) {
    _Block_release(v4);
  }
  uint64_t v5 = (const void *)*((void *)this + 3);
  if (v5) {
    _Block_release(v5);
  }
  int v6 = (const void *)*((void *)this + 2);
  if (v6) {
    _Block_release(v6);
  }
  uint64_t v7 = *((void *)this + 1);
  if (v7) {
    dispatch_release(v7);
  }
  if (*(void *)this) {
    dispatch_release(*(dispatch_object_t *)this);
  }
}

applesauce::CF::StringRef *applesauce::CF::StringRef::StringRef(applesauce::CF::StringRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFStringGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x22A66A950](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  return this;
}

void sub_226DF40F4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

void applesauce::CF::construct_error(applesauce::CF *this)
{
}

void std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2647E7F78, MEMORY[0x263F8C060]);
}

void sub_226DF4194(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(40 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

char *std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__insert_with_size[abi:ne180100]<std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement const*>,std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement const*>>(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  uint64_t v5 = (char *)__dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v7 = __src;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v11 - v12) >> 3)) < a5)
  {
    uint64_t v13 = *(void **)a1;
    unint64_t v14 = a5 - 0x3333333333333333 * ((uint64_t)(v12 - *(void *)a1) >> 3);
    if (v14 > 0x666666666666666) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v15 = 0xCCCCCCCCCCCCCCCDLL * ((__dst - (uint64_t)v13) >> 3);
    unint64_t v16 = 0xCCCCCCCCCCCCCCCDLL * ((v10 - (uint64_t)v13) >> 3);
    uint64_t v17 = 2 * v16;
    if (2 * v16 <= v14) {
      uint64_t v17 = v14;
    }
    if (v16 >= 0x333333333333333) {
      unint64_t v18 = 0x666666666666666;
    }
    else {
      unint64_t v18 = v17;
    }
    uint64_t v39 = v9;
    if (v18) {
      uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>>(v9, v18);
    }
    else {
      uint64_t v19 = 0;
    }
    v29 = &v19[40 * v15];
    __p = v19;
    v36 = v29;
    uint64_t v38 = &v19[40 * v18];
    v30 = &v29[40 * a5];
    uint64_t v31 = 40 * a5;
    do
    {
      long long v32 = *(_OWORD *)v7;
      long long v33 = *((_OWORD *)v7 + 1);
      *((void *)v29 + 4) = *((void *)v7 + 4);
      *(_OWORD *)v29 = v32;
      *((_OWORD *)v29 + 1) = v33;
      v29 += 40;
      v7 += 40;
      v31 -= 40;
    }
    while (v31);
    v37 = v30;
    uint64_t v5 = (char *)std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v37 != v36) {
      v37 = &v36[(v37 - v36 - 40) % 0x28uLL];
    }
    if (__p) {
      operator delete(__p);
    }
    return v5;
  }
  uint64_t v20 = v12 - __dst;
  if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v12 - __dst) >> 3)) >= a5)
  {
    uint64_t v21 = &__src[40 * a5];
    uint64_t v23 = *(char **)(v9 - 8);
LABEL_17:
    int v24 = &v5[40 * a5];
    unint64_t v25 = &v23[-40 * a5];
    uint64_t v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      uint64_t v26 = v23;
      do
      {
        long long v27 = *(_OWORD *)v25;
        long long v28 = *((_OWORD *)v25 + 1);
        *((void *)v26 + 4) = *((void *)v25 + 4);
        *(_OWORD *)uint64_t v26 = v27;
        *((_OWORD *)v26 + 1) = v28;
        v25 += 40;
        v26 += 40;
      }
      while ((unint64_t)v25 < v12);
    }
    *(void *)(a1 + 8) = v26;
    if (v23 != v24) {
      memmove(&v5[40 * a5], v5, v23 - v24);
    }
    if (v21 != v7) {
      memmove(v5, v7, v21 - v7);
    }
    return v5;
  }
  uint64_t v21 = &__src[8 * ((uint64_t)(v12 - __dst) >> 3)];
  int64_t v22 = a4 - v21;
  if (a4 != v21) {
    memmove(*(void **)(v9 - 8), &__src[8 * ((uint64_t)(v12 - __dst) >> 3)], a4 - v21);
  }
  uint64_t v23 = (char *)(v12 + v22);
  *(void *)(a1 + 8) = v12 + v22;
  if (v20 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void sub_226DF44B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  uint64_t v5 = *(void **)(a2 + 8);
  int v6 = (char *)*a1;
  uint64_t v7 = v5;
  if (*a1 != __src)
  {
    CFStringRef v8 = __src;
    uint64_t v9 = *(void *)(a2 + 8);
    do
    {
      long long v10 = *(_OWORD *)(v8 - 40);
      long long v11 = *(_OWORD *)(v8 - 24);
      uint64_t v7 = (void *)(v9 - 40);
      *(void *)(v9 - 8) = *((void *)v8 - 1);
      *(_OWORD *)(v9 - 24) = v11;
      *(_OWORD *)(v9 - 40) = v10;
      v8 -= 40;
      v9 -= 40;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  unint64_t v12 = a1[1];
  uint64_t v13 = *(void *)(a2 + 16);
  int64_t v14 = v12 - __src;
  if (v12 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v12 - __src);
    uint64_t v7 = *(void **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v13 + v14;
  unint64_t v15 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v15;
  unint64_t v16 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v16;
  uint64_t v17 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v17;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__destroy_at[abi:ne180100]<applesauce::CF::DictionaryRef,0>(const void **a1)
{
  uint64_t v1 = *a1;
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::CF::DictionaryRef,0>((const void **)(i - 8));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

char ***std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>::operator=[abi:ne180100](char ***a1, void *a2)
{
  unint64_t v4 = *a1;
  uint64_t v5 = (*a1)[1];
  int v6 = *a1;
  unint64_t v9 = (unint64_t)v6[2];
  uint64_t v7 = (uint64_t)(v6 + 2);
  unint64_t v8 = v9;
  if ((unint64_t)v5 >= v9)
  {
    long long v11 = *v4;
    uint64_t v12 = (v5 - *v4) >> 3;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 61) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v14 = v8 - (void)v11;
    if (v14 >> 2 > v13) {
      unint64_t v13 = v14 >> 2;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v13;
    }
    uint64_t v27 = v7;
    if (v15)
    {
      unint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(v7, v15);
      long long v11 = *v4;
      uint64_t v5 = v4[1];
    }
    else
    {
      unint64_t v16 = 0;
    }
    uint64_t v17 = &v16[8 * v12];
    unint64_t v18 = &v16[8 * v15];
    uint64_t v26 = v18;
    *(void *)uint64_t v17 = *a2;
    *a2 = 0;
    unint64_t v25 = v17 + 8;
    if (v5 == v11)
    {
      long long v10 = v17 + 8;
    }
    else
    {
      do
      {
        uint64_t v19 = *((void *)v5 - 1);
        v5 -= 8;
        *((void *)v17 - 1) = v19;
        v17 -= 8;
        *(void *)uint64_t v5 = 0;
      }
      while (v5 != v11);
      long long v10 = v25;
      unint64_t v18 = v26;
    }
    uint64_t v20 = *v4;
    const void *v4 = v17;
    v24[0] = v20;
    v24[1] = v20;
    uint64_t v21 = v4[1];
    v4[1] = v10;
    unint64_t v25 = v21;
    int64_t v22 = v4[2];
    v4[2] = v18;
    uint64_t v26 = v22;
    std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)v24);
  }
  else
  {
    *(void *)uint64_t v5 = *a2;
    long long v10 = v5 + 8;
    *a2 = 0;
  }
  v4[1] = v10;
  return a1;
}

void std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (const void **)**a1;
  if (v2)
  {
    unint64_t v4 = (const void **)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
        std::__destroy_at[abi:ne180100]<applesauce::CF::DictionaryRef,0>(--v4);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::allocate_shared[abi:ne180100]<waipc::timesync::LegacyBasebandProvider,std::allocator<waipc::timesync::LegacyBasebandProvider>,waipc::timesync::LegacyBasebandProvider,void>(const waipc::timesync::BasebandProvider *a1@<X1>, void *a2@<X8>)
{
  unint64_t v4 = operator new(0x150uLL);
  std::__shared_ptr_emplace<waipc::timesync::LegacyBasebandProvider>::__shared_ptr_emplace[abi:ne180100]<waipc::timesync::LegacyBasebandProvider,std::allocator<waipc::timesync::LegacyBasebandProvider>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;

  std::shared_ptr<waipc::timesync::LegacyBasebandProvider>::__enable_weak_this[abi:ne180100]<waipc::timesync::BasebandProvider,waipc::timesync::LegacyBasebandProvider,void>((uint64_t)a2, v4 + 4, (uint64_t)(v4 + 3));
}

void sub_226DF4920(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<waipc::timesync::LegacyBasebandProvider>::__shared_ptr_emplace[abi:ne180100]<waipc::timesync::LegacyBasebandProvider,std::allocator<waipc::timesync::LegacyBasebandProvider>,0>(void *a1, const waipc::timesync::BasebandProvider *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26DAF2C70;
  waipc::timesync::BasebandProvider::BasebandProvider((waipc::timesync::BasebandProvider *)(a1 + 3), a2);
  a1[3] = &unk_26DAF2C08;
  return a1;
}

void sub_226DF4998(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<waipc::timesync::LegacyBasebandProvider>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAF2C70;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<waipc::timesync::LegacyBasebandProvider>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAF2C70;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A66A9D0);
}

uint64_t std::__shared_ptr_emplace<waipc::timesync::LegacyBasebandProvider>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

waipc::timesync::BasebandProvider *waipc::timesync::BasebandProvider::BasebandProvider(waipc::timesync::BasebandProvider *this, const waipc::timesync::BasebandProvider *a2)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = &unk_26DAF2A58;
  waipc::timesync::BasebandProvider::config::config((uint64_t)this + 24, (uint64_t)a2 + 24);
  int v4 = *((_DWORD *)a2 + 28);
  *((_WORD *)this + 58) = *((_WORD *)a2 + 58);
  *((_DWORD *)this + os_unfair_lock_assert_owner(this + 28) = v4;
  uint64_t v5 = *((void *)a2 + 15);
  if (v5) {
    CFRetain(*((CFTypeRef *)a2 + 15));
  }
  *((void *)this + 15) = v5;
  long long v6 = *((_OWORD *)a2 + 12);
  long long v7 = *((_OWORD *)a2 + 13);
  uint64_t v8 = *((void *)a2 + 28);
  long long v9 = *((_OWORD *)a2 + 8);
  long long v10 = *((_OWORD *)a2 + 9);
  long long v12 = *((_OWORD *)a2 + 10);
  long long v11 = *((_OWORD *)a2 + 11);
  *((void *)this + 29) = 0;
  *((_OWORD *)this + 10) = v12;
  *((_OWORD *)this + 9) = v10;
  *((_OWORD *)this + 8) = v9;
  *((void *)this + os_unfair_lock_assert_owner(this + 28) = v8;
  *((_OWORD *)this + 13) = v7;
  *((_OWORD *)this + 12) = v6;
  *((_OWORD *)this + 11) = v11;
  *((void *)this + 30) = 0;
  *((void *)this + 31) = 0;
  std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__init_with_size[abi:ne180100]<waipc::timesync::BasebandProvider::timesyncMeasurement*,waipc::timesync::BasebandProvider::timesyncMeasurement*>((void *)this + 29, *((const void **)a2 + 29), *((void *)a2 + 30), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)a2 + 30) - *((void *)a2 + 29)) >> 3));
  *((_DWORD *)this + 64) = *((_DWORD *)a2 + 64);
  *((void *)this + 34) = 0;
  *((void *)this + 35) = 0;
  *((void *)this + 33) = 0;
  std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__init_with_size[abi:ne180100]<waipc::timesync::BasebandProvider::timesyncMeasurement*,waipc::timesync::BasebandProvider::timesyncMeasurement*>((void *)this + 33, *((const void **)a2 + 33), *((void *)a2 + 34), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)a2 + 34) - *((void *)a2 + 33)) >> 3));
  *((void *)this + 36) = 0;
  *((void *)this + 37) = 0;
  *((void *)this + 38) = 0;
  std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__init_with_size[abi:ne180100]<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>*,std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>*>((char *)this + 288, *((long long **)a2 + 36), *((long long **)a2 + 37), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)a2 + 37) - *((void *)a2 + 36)) >> 3));
  return this;
}

void sub_226DF4B84(_Unwind_Exception *a1)
{
  long long v6 = *v4;
  if (*v4)
  {
    *(void *)(v1 + 272) = v6;
    operator delete(v6);
  }
  long long v7 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 240) = v7;
    operator delete(v7);
  }
  applesauce::CF::StringRef::~StringRef((const void **)(v1 + 120));
  waipc::timesync::BasebandProvider::config::~config(v2);
  uint64_t v8 = *(std::__shared_weak_count **)(v1 + 16);
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
  _Unwind_Resume(a1);
}

void *std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__init_with_size[abi:ne180100]<waipc::timesync::BasebandProvider::timesyncMeasurement*,waipc::timesync::BasebandProvider::timesyncMeasurement*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    long long v6 = result;
    uint64_t result = std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_226DF4C44(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

char *std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__init_with_size[abi:ne180100]<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>*,std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>*>(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    long long v6 = result;
    uint64_t result = std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = *((void *)v6 + 1);
    while (a2 != a3)
    {
      long long v8 = *a2;
      long long v9 = a2[1];
      *(void *)(v7 + 32) = *((void *)a2 + 4);
      *(_OWORD *)uint64_t v7 = v8;
      *(_OWORD *)(v7 + 16) = v9;
      a2 = (long long *)((char *)a2 + 40);
      v7 += 40;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_226DF4D1C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::shared_ptr<waipc::timesync::LegacyBasebandProvider>::__enable_weak_this[abi:ne180100]<waipc::timesync::BasebandProvider,waipc::timesync::LegacyBasebandProvider,void>(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = (std::__shared_weak_count *)a2[1];
    if (!v4 || v4->__shared_owners_ == -1)
    {
      uint64_t v5 = *(std::__shared_weak_count **)(a1 + 8);
      if (v5)
      {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
        atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        uint64_t v4 = (std::__shared_weak_count *)a2[1];
      }
      *a2 = a3;
      a2[1] = v5;
      if (v4) {
        std::__shared_weak_count::__release_weak(v4);
      }
      if (v5)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v5);
      }
    }
  }
}

void std::allocate_shared[abi:ne180100]<waipc::timesync::ModernBasebandProvider,std::allocator<waipc::timesync::ModernBasebandProvider>,waipc::timesync::ModernBasebandProvider,void>(const waipc::timesync::BasebandProvider *a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0x150uLL);
  std::__shared_ptr_emplace<waipc::timesync::ModernBasebandProvider>::__shared_ptr_emplace[abi:ne180100]<waipc::timesync::ModernBasebandProvider,std::allocator<waipc::timesync::ModernBasebandProvider>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;

  std::shared_ptr<waipc::timesync::LegacyBasebandProvider>::__enable_weak_this[abi:ne180100]<waipc::timesync::BasebandProvider,waipc::timesync::LegacyBasebandProvider,void>((uint64_t)a2, v4 + 4, (uint64_t)(v4 + 3));
}

void sub_226DF4E20(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<waipc::timesync::ModernBasebandProvider>::__shared_ptr_emplace[abi:ne180100]<waipc::timesync::ModernBasebandProvider,std::allocator<waipc::timesync::ModernBasebandProvider>,0>(void *a1, const waipc::timesync::BasebandProvider *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26DAF2CC0;
  waipc::timesync::BasebandProvider::BasebandProvider((waipc::timesync::BasebandProvider *)(a1 + 3), a2);
  a1[3] = &unk_26DAF2B68;
  return a1;
}

void sub_226DF4E98(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<waipc::timesync::ModernBasebandProvider>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAF2CC0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<waipc::timesync::ModernBasebandProvider>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAF2CC0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A66A9D0);
}

uint64_t std::__shared_ptr_emplace<waipc::timesync::ModernBasebandProvider>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void *std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(void *a1, void *a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a2[1];
  *a1 = *a2;
  if (!v3)
  {
    a1[1] = 0;
LABEL_5:
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v4 = std::__shared_weak_count::lock(v3);
  a1[1] = v4;
  if (!v4) {
    goto LABEL_5;
  }
  return a1;
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C2D8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C198], MEMORY[0x263F8C0A0]);
}

uint64_t waipc::timesync::BasebandProvider::timesyncMeasurement::complete(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)result != *(_DWORD *)a2) {
    waipc::timesync::BasebandProvider::timesyncMeasurement::complete();
  }
  uint64_t v2 = *(unsigned int *)(a2 + 4);
  *(void *)(result + 8) = *(void *)(a2 + 16);
  *(void *)(result + 16) = v2;
  return result;
}

__n128 __Block_byref_object_copy__164(void *a1, uint64_t a2)
{
  a1[5] = 0;
  a1[6] = 0;
  a1[7] = 0;
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 5) = result;
  a1[7] = *(void *)(a2 + 56);
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  return result;
}

void __Block_byref_object_dispose__165(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

uint64_t ___ZN5waipc8timesync16BasebandProvider14handleTimesyncIP31PCITransportTimesyncMeasurementEEvNS1_16timesyncEndpointET_S6__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void *__copy_helper_block_e8_40c99_ZTSN10applesauce8dispatch2v15blockIFvPN5waipc8timesync16BasebandProvider19timesyncMeasurementEmEEE(uint64_t a1, uint64_t a2)
{
  __n128 result = *(void **)(a2 + 40);
  if (result) {
    __n128 result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c99_ZTSN10applesauce8dispatch2v15blockIFvPN5waipc8timesync16BasebandProvider19timesyncMeasurementEmEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

void *std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__init_with_size[abi:ne180100]<std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement*>,std::__wrap_iter<waipc::timesync::BasebandProvider::timesyncMeasurement*>>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    long long v6 = result;
    __n128 result = std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_226DF512C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__insert_with_size[abi:ne180100]<PCITransportTimesyncMeasurement *,PCITransportTimesyncMeasurement *>(uint64_t a1, char *__src, int *a3, int *a4, uint64_t a5)
{
  uint64_t v5 = __src;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v7 = a3;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v11 - v12) >> 3)) < a5)
  {
    unint64_t v13 = *(unsigned char **)a1;
    unint64_t v14 = a5 - 0x3333333333333333 * ((uint64_t)(v12 - *(void *)a1) >> 3);
    if (v14 > 0x666666666666666) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v15 = 0xCCCCCCCCCCCCCCCDLL * ((__src - v13) >> 3);
    unint64_t v16 = 0xCCCCCCCCCCCCCCCDLL * ((v10 - (uint64_t)v13) >> 3);
    if (2 * v16 > v14) {
      unint64_t v14 = 2 * v16;
    }
    if (v16 >= 0x333333333333333) {
      unint64_t v17 = 0x666666666666666;
    }
    else {
      unint64_t v17 = v14;
    }
    uint64_t v39 = v9;
    if (v17) {
      unint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>>(v9, v17);
    }
    else {
      unint64_t v18 = 0;
    }
    long long v32 = &v18[40 * v15];
    __p = v18;
    v36 = v32;
    uint64_t v38 = &v18[40 * v17];
    long long v33 = &v32[40 * a5];
    do
    {
      *(_DWORD *)long long v32 = *v7;
      *((void *)v32 + 1) = *((void *)v7 + 2);
      *((void *)v32 + 2) = v7[1];
      v32 += 40;
      v7 += 6;
    }
    while (v32 != v33);
    v37 = v33;
    uint64_t v5 = (char *)std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v37 != v36) {
      v37 = &v36[(v37 - v36 - 40) % 0x28uLL];
    }
    if (__p) {
      operator delete(__p);
    }
    return v5;
  }
  if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v12 - (void)__src) >> 3)) >= a5)
  {
    uint64_t v19 = &a3[6 * a5];
    uint64_t v20 = *(char **)(v9 - 8);
LABEL_18:
    uint64_t v23 = &__src[40 * a5];
    int v24 = &v20[-40 * a5];
    unint64_t v25 = v20;
    if ((unint64_t)v24 < v12)
    {
      unint64_t v25 = v20;
      do
      {
        long long v26 = *(_OWORD *)v24;
        long long v27 = *((_OWORD *)v24 + 1);
        *((void *)v25 + 4) = *((void *)v24 + 4);
        *(_OWORD *)unint64_t v25 = v26;
        *((_OWORD *)v25 + 1) = v27;
        v24 += 40;
        v25 += 40;
      }
      while ((unint64_t)v24 < v12);
    }
    *(void *)(a1 + 8) = v25;
    if (v20 != v23) {
      memmove(&__src[40 * a5], __src, v20 - v23);
    }
    if (v19 != v7)
    {
      long long v28 = v5;
      do
      {
        uint64_t v29 = *((void *)v7 + 2);
        int v30 = *v7;
        uint64_t v31 = v7[1];
        v7 += 6;
        *(_DWORD *)long long v28 = v30;
        *((void *)v28 + 1) = v29;
        *((void *)v28 + 2) = v31;
        v28 += 40;
      }
      while (v7 != v19);
    }
    return v5;
  }
  uint64_t v19 = &a3[0xCCCCCCCCCCCCCCELL * ((uint64_t)(v12 - (void)__src) >> 3)];
  uint64_t v20 = *(char **)(v9 - 8);
  if (v19 != a4)
  {
    uint64_t v21 = &a3[0xCCCCCCCCCCCCCCELL * ((uint64_t)(v12 - (void)__src) >> 3)];
    uint64_t v22 = *(void *)(v9 - 8);
    do
    {
      *(_DWORD *)uint64_t v22 = *v21;
      *(void *)(v22 + 8) = *((void *)v21 + 2);
      *(void *)(v22 + 16) = v21[1];
      v20 += 40;
      v21 += 6;
      v22 += 40;
    }
    while (v21 != a4);
  }
  *(void *)(a1 + 8) = v20;
  if ((uint64_t)(v12 - (void)__src) >= 1) {
    goto LABEL_18;
  }
  return v5;
}

void sub_226DF53C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *waipc::util::_kv::_kv<unsigned int const&,void>(void *a1, uint64_t a2, int *a3)
{
  *a1 = a2;
  int valuePtr = *a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x22A66A950](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_226DF54A8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

void *waipc::util::_kv::_kv<unsigned char,void>(void *a1, uint64_t a2, char *a3)
{
  *a1 = a2;
  char valuePtr = *a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x22A66A950](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_226DF5568(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>(uint64_t **a1)
{
  std::vector<void const*>::vector(__p, a1[1] - *a1);
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if (*a1 != v3)
  {
    CFNumberRef v4 = __p[0];
    do
    {
      uint64_t v5 = *v2++;
      *v4++ = v5;
    }
    while (v2 != v3);
  }
  CFArrayRef CFArray = applesauce::CF::details::make_CFArrayRef<void const*>((uint64_t)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return CFArray;
}

void sub_226DF5610(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<void const*>(uint64_t a1)
{
  CFArrayRef result = CFArrayCreate(0, *(const void ***)a1, (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3, MEMORY[0x263EFFF70]);
  if (!result)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  return result;
}

void sub_226DF567C()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_226DF569C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *std::vector<void const*>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<void const*>::__vallocate[abi:ne180100](a1, a2);
    CFNumberRef v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_226DF570C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<void const*>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
  }
  CFArrayRef result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

double waipc::timesync::BasebandProvider::timesyncMeasurement::complete(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 != *(_DWORD *)a2) {
    waipc::timesync::BasebandProvider::timesyncMeasurement::complete();
  }
  *(void *)(a1 + 24) = *(void *)(a2 + 8);
  double result = *(double *)(a2 + 16);
  *(double *)(a1 + 32) = result;
  return result;
}

uint64_t ___ZN5waipc8timesync16BasebandProvider14handleTimesyncIPNS1_25deviceTimesyncMeasurementEEEvNS1_16timesyncEndpointET_S6__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

char *std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__insert_with_size[abi:ne180100]<waipc::timesync::BasebandProvider::deviceTimesyncMeasurement *,waipc::timesync::BasebandProvider::deviceTimesyncMeasurement *>(uint64_t a1, char *__src, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = __src;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v7 = a3;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v11 - v12) >> 3)) < a5)
  {
    unint64_t v13 = *(unsigned char **)a1;
    unint64_t v14 = a5 - 0x3333333333333333 * ((uint64_t)(v12 - *(void *)a1) >> 3);
    if (v14 > 0x666666666666666) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v15 = 0xCCCCCCCCCCCCCCCDLL * ((__src - v13) >> 3);
    unint64_t v16 = 0xCCCCCCCCCCCCCCCDLL * ((v10 - (uint64_t)v13) >> 3);
    if (2 * v16 > v14) {
      unint64_t v14 = 2 * v16;
    }
    if (v16 >= 0x333333333333333) {
      unint64_t v17 = 0x666666666666666;
    }
    else {
      unint64_t v17 = v14;
    }
    uint64_t v38 = v9;
    if (v17) {
      unint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>>(v9, v17);
    }
    else {
      unint64_t v18 = 0;
    }
    uint64_t v31 = &v18[40 * v15];
    __p = v18;
    v35 = v31;
    v37 = &v18[40 * v17];
    long long v32 = &v31[40 * a5];
    do
    {
      *(_DWORD *)uint64_t v31 = *(_DWORD *)v7;
      *((void *)v31 + 3) = *(void *)(v7 + 8);
      *((void *)v31 + 4) = *(void *)(v7 + 16);
      v31 += 40;
      v7 += 24;
    }
    while (v31 != v32);
    v36 = v32;
    uint64_t v5 = (char *)std::vector<waipc::timesync::BasebandProvider::timesyncMeasurement>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v36 != v35) {
      v36 = &v35[(v36 - v35 - 40) % 0x28uLL];
    }
    if (__p) {
      operator delete(__p);
    }
    return v5;
  }
  if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v12 - (void)__src) >> 3)) >= a5)
  {
    uint64_t v19 = a3 + 24 * a5;
    uint64_t v20 = *(char **)(v9 - 8);
LABEL_18:
    uint64_t v23 = &__src[40 * a5];
    int v24 = &v20[-40 * a5];
    unint64_t v25 = v20;
    if ((unint64_t)v24 < v12)
    {
      unint64_t v25 = v20;
      do
      {
        long long v26 = *(_OWORD *)v24;
        long long v27 = *((_OWORD *)v24 + 1);
        *((void *)v25 + 4) = *((void *)v24 + 4);
        *(_OWORD *)unint64_t v25 = v26;
        *((_OWORD *)v25 + 1) = v27;
        v24 += 40;
        v25 += 40;
      }
      while ((unint64_t)v24 < v12);
    }
    *(void *)(a1 + 8) = v25;
    if (v20 != v23) {
      memmove(&__src[40 * a5], __src, v20 - v23);
    }
    if (v19 != v7)
    {
      long long v28 = v5;
      do
      {
        uint64_t v29 = *(void *)(v7 + 8);
        uint64_t v30 = *(void *)(v7 + 16);
        *(_DWORD *)long long v28 = *(_DWORD *)v7;
        *((void *)v28 + 3) = v29;
        *((void *)v28 + 4) = v30;
        v7 += 24;
        v28 += 40;
      }
      while (v7 != v19);
    }
    return v5;
  }
  uint64_t v19 = a3 + 0x3333333333333338 * ((uint64_t)(v12 - (void)__src) >> 3);
  uint64_t v20 = *(char **)(v9 - 8);
  if (v19 != a4)
  {
    uint64_t v21 = a3 + 0x3333333333333338 * ((uint64_t)(v12 - (void)__src) >> 3);
    uint64_t v22 = *(void *)(v9 - 8);
    do
    {
      *(_DWORD *)uint64_t v22 = *(_DWORD *)v21;
      *(void *)(v22 + 24) = *(void *)(v21 + 8);
      *(void *)(v22 + 32) = *(void *)(v21 + 16);
      v20 += 40;
      v21 += 24;
      v22 += 40;
    }
    while (v21 != a4);
  }
  *(void *)(a1 + 8) = v20;
  if ((uint64_t)(v12 - (void)__src) >= 1) {
    goto LABEL_18;
  }
  return v5;
}

void sub_226DF5A5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0xBu);
}

uint64_t waipc::logging::getLogger(unsigned int a1)
{
  if (waipc::logging::getLogger(waipc::logging::LoggerID)::sOnce != -1) {
    dispatch_once(&waipc::logging::getLogger(waipc::logging::LoggerID)::sOnce, &__block_literal_global);
  }
  if (a1 > 5) {
    return MEMORY[0x263EF8440];
  }
  else {
    return waipc::logging::getLogger(waipc::logging::LoggerID)::sLoggers[a1];
  }
}

os_log_t ___ZN5waipc7logging9getLoggerENS0_8LoggerIDE_block_invoke()
{
  for (uint64_t i = 0; i != 6; ++i)
  {
    os_log_t result = os_log_create("com.apple.WirelessIPC.audio", kWAIPCLogCategories[i]);
    waipc::logging::getLogger(waipc::logging::LoggerID)::sLoggers[i] = (uint64_t)result;
  }
  return result;
}

BOOL waipc::logging::EnableCache::init(waipc::logging::EnableCache *this)
{
  uint64_t v2 = 0;
  BOOL v3 = waipc::logging::getLogger(waipc::logging::LoggerID)::sOnce == -1;
  do
  {
    if (!v3) {
      dispatch_once(&waipc::logging::getLogger(waipc::logging::LoggerID)::sOnce, &__block_literal_global);
    }
    BOOL result = os_signpost_enabled((os_log_t)waipc::logging::getLogger(waipc::logging::LoggerID)::sLoggers[v2]);
    *((unsigned char *)this + v2++) = result;
    BOOL v3 = 1;
  }
  while (v2 != 6);
  return result;
}

void *waipc::FlatCircularBuffer::FlatCircularBuffer(void *this, uint64_t a2)
{
  if (a2) {
    operator new[]();
  }
  *this = 0;
  this[1] = 0;
  return this;
}

void **waipc::FlatCircularBuffer::write(void **this, char *a2, unint64_t a3, size_t a4)
{
  if (a4)
  {
    uint64_t v5 = this;
    size_t v6 = (size_t)this[1];
    if (v6 < a4) {
      waipc::FlatCircularBuffer::write();
    }
    size_t v8 = a3 % v6;
    size_t v9 = v6 - a3 % v6;
    if (v9 >= a4) {
      size_t v10 = a4;
    }
    else {
      size_t v10 = v9;
    }
    memcpy((char *)*this + v8, a2, v10);
    uint64_t v11 = *v5;
    return (void **)memcpy(v11, &a2[v10], a4 - v10);
  }
  return this;
}

const void **waipc::FlatCircularBuffer::read(const void **this, char *__dst, unint64_t a3, size_t a4)
{
  if (a4)
  {
    uint64_t v5 = this;
    size_t v6 = (size_t)this[1];
    if (v6 < a4) {
      waipc::FlatCircularBuffer::read();
    }
    size_t v8 = a3 % v6;
    size_t v9 = v6 - a3 % v6;
    if (v9 >= a4) {
      size_t v10 = a4;
    }
    else {
      size_t v10 = v9;
    }
    memcpy(__dst, (char *)*this + v8, v10);
    uint64_t v11 = *v5;
    return (const void **)memcpy(&__dst[v10], v11, a4 - v10);
  }
  return this;
}

void waipc::FlatCircularBuffer::set(waipc::FlatCircularBuffer *this, char a2, unint64_t a3, size_t a4)
{
  if (a4)
  {
    size_t v6 = *((void *)this + 1);
    if (v6 < a4) {
      waipc::FlatCircularBuffer::set();
    }
    size_t v7 = a3 % v6;
    size_t v8 = v6 - a3 % v6;
    if (v8 >= a4) {
      size_t v9 = a4;
    }
    else {
      size_t v9 = v8;
    }
    bzero((void *)(*(void *)this + v7), v9);
    size_t v10 = *(void **)this;
    bzero(v10, a4 - v9);
  }
}

uint64_t waipc::PCIeAudioLink::computeBufferLayout@<X0>(uint64_t result@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v2 = *(unsigned __int16 *)(result + 8) * (unint64_t)*(unsigned __int16 *)(result + 10) + 24;
  unint64_t v3 = v2 * *(unsigned int *)(result + 12);
  unint64_t v4 = v2 * *(unsigned int *)(result + 16);
  if (*(unsigned char *)(result + 64))
  {
    uint64_t v5 = ~*MEMORY[0x263EF8AE8];
    uint64_t v6 = v5 & (*MEMORY[0x263EF8AE8] + 40);
    unint64_t v3 = v5 & (*MEMORY[0x263EF8AE8] + v3);
    unint64_t v4 = v5 & (*MEMORY[0x263EF8AE8] + v4);
  }
  else
  {
    uint64_t v6 = 40;
  }
  *a2 = v2;
  a2[1] = 0;
  a2[2] = v6;
  a2[3] = v6;
  a2[4] = v3;
  a2[5] = v3 + v6;
  a2[6] = v4;
  a2[7] = v3 + v6 + v4;
  return result;
}

uint64_t waipc::PCIeAudioLink::computeBufferLength(uint64_t a1, uint64_t a2)
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  waipc::PCIeAudioLink::computeBufferLayout(a1, (unint64_t *)&v16);
  uint64_t v4 = *MEMORY[0x263EF8AE8];
  int v5 = ~*MEMORY[0x263EF8AE8];
  uint64_t v6 = v5;
  if (!*(unsigned char *)(a1 + 64))
  {
    int v14 = 0;
    uint64_t v12 = 0;
    uint64_t v11 = 0;
    int v13 = 0;
    uint64_t v10 = 0;
    uint64_t v9 = 0;
    uint64_t v7 = 0;
    unint64_t v8 = v5 & (unint64_t)(v4 + *((void *)&v19 + 1));
    if (!a2) {
      return *((void *)&v19 + 1);
    }
    goto LABEL_9;
  }
  uint64_t v7 = *((void *)&v16 + 1);
  if ((*((void *)&v16 + 1) & ~(uint64_t)v5) != 0) {
    waipc::PCIeAudioLink::computeBufferLength();
  }
  unint64_t v8 = v17;
  if ((((void)v17 + v4) & v6) != (void)v17) {
    waipc::PCIeAudioLink::computeBufferLength();
  }
  uint64_t v9 = *((void *)&v17 + 1);
  if ((*((void *)&v17 + 1) & ~v6) != 0) {
    waipc::PCIeAudioLink::computeBufferLength();
  }
  uint64_t v10 = v18;
  if ((((void)v18 + v4) & v6) != (void)v18) {
    waipc::PCIeAudioLink::computeBufferLength();
  }
  uint64_t v11 = *((void *)&v18 + 1);
  if ((*((void *)&v18 + 1) & ~v6) != 0) {
    waipc::PCIeAudioLink::computeBufferLength();
  }
  uint64_t v12 = v19;
  if ((((void)v19 + v4) & v6) != (void)v19) {
    waipc::PCIeAudioLink::computeBufferLength();
  }
  int v13 = 2;
  int v14 = 1;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = v7;
    *(void *)(a2 + 8) = v8;
    *(void *)(a2 + 16) = 3;
    *(void *)(a2 + 24) = v9;
    *(void *)(a2 + 32) = v10;
    *(_DWORD *)(a2 + 40) = v13;
    *(_DWORD *)(a2 + 44) = 0;
    *(void *)(a2 + 48) = v11;
    *(void *)(a2 + 56) = v12;
    *(_DWORD *)(a2 + 64) = v14;
    *(_DWORD *)(a2 + 68) = 0;
  }
  return *((void *)&v19 + 1);
}

void waipc::PCIeAudioLink::PCIeAudioLink(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  long long v6 = *(_OWORD *)(a2 + 32);
  long long v7 = *(_OWORD *)(a2 + 48);
  long long v8 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 64) = v8;
  *(_DWORD *)(a1 + 88) = 0;
  uint64_t v9 = (os_unfair_lock_s *)(a1 + 88);
  *(_OWORD *)(a1 + 32) = v6;
  *(_DWORD *)(a1 + 92) = 0;
  *(void *)(a1 + 96) = *a3;
  uint64_t v10 = a3[1];
  *(void *)(a1 + 104) = v10;
  if (v10) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
  }
  *(_OWORD *)(a1 + 144) = 0u;
  uint64_t v11 = (_OWORD *)(a1 + 144);
  *(void *)(a1 + 112) = a4;
  uint64_t v12 = (const double *)(a1 + 72);
  float64x2_t v13 = vld1q_dup_f64(v12);
  int8x16_t v14 = (int8x16_t)vcvtq_u64_f64(vdivq_f64(vmulq_f64(*(float64x2_t *)(a1 + 40), (float64x2_t)vdupq_n_s64(0x41CDCD6500000000uLL)), v13));
  *(int8x16_t *)(a1 + 120) = vextq_s8(v14, v14, 8uLL);
  *(void *)(a1 + 136) = (unint64_t)(*(double *)(a1 + 56) * 1000000000.0 / *(double *)(a1 + 80));
  *(_OWORD *)(a1 + 192) = 0u;
  unint64_t v15 = (_OWORD *)(a1 + 192);
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(void *)(a1 + 320) = mach_continuous_time();
  *(void *)(a1 + 3os_unfair_lock_assert_owner(this + 28) = mach_absolute_time();
  *(_OWORD *)(a1 + 336) = *(_OWORD *)(a1 + 312);
  *(void *)(a1 + 352) = *(void *)(a1 + 328);
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_OWORD *)(a1 + 420) = 0u;
  *(_WORD *)(a1 + 436) = 257;
  *(void *)(a1 + 440) = 0;
  *(void *)(a1 + 448) = 0;
  Logger = waipc::logging::getLogger(5u);
  long long v17 = waipc::logging::getLogger(5u);
  os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v17, (const void *)a1);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v19 = v18;
    if (os_signpost_enabled(Logger))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_226DEE000, Logger, OS_SIGNPOST_INTERVAL_BEGIN, v19, "PCIeAudioLink", (const char *)&unk_226E0CBC1, buf, 2u);
    }
  }
  os_unfair_lock_lock(v9);
  unint64_t v20 = *(void *)(a1 + 112);
  if (v20 < waipc::PCIeAudioLink::computeBufferLength(a1, 0))
  {
    v37 = "fBufferLength >= computeBufferLength( fConfig)";
    int v38 = 280;
  }
  else
  {
    unsigned int v21 = *(unsigned __int16 *)(a1 + 8);
    if (!(*(_DWORD *)(a1 + 28) % v21))
    {
      long long v44 = 0u;
      long long v45 = 0u;
      *(_OWORD *)buf = 0u;
      long long v43 = 0u;
      waipc::PCIeAudioLink::computeBufferLayout(a1, (unint64_t *)buf);
      uint64_t v22 = *(void *)(a1 + 96);
      uint64_t v23 = *((void *)&v43 + 1);
      uint64_t v24 = v22 + *(void *)&buf[8];
      unsigned int v25 = *(double *)a1;
      __int16 v26 = *(_WORD *)(a1 + 10);
      uint64_t v27 = *((void *)&v44 + 1);
      uint64_t v28 = v22 + *(void *)&buf[8] + 32;
      *(void *)uint64_t v24 = 0x504349415544494FLL;
      *(_WORD *)(v24 + 12) = v26;
      *(_WORD *)(v24 + 14) = v21;
      uint64_t v29 = *(void *)(a1 + 12);
      *(_DWORD *)(v24 + 8) = v25;
      *(void *)(v24 + 16) = v29;
      *(_DWORD *)(v24 + 24) = v23;
      *(_DWORD *)(v24 + os_unfair_lock_assert_owner(this + 28) = v27;
      uint64_t v30 = *(void *)buf;
      waipc::BlockRing::BlockRing(&v39, v28, v22 + v23, *(void *)buf, *(unsigned int *)(a1 + 12));
      long long v31 = v40;
      *uint64_t v11 = v39;
      *(_OWORD *)(a1 + 160) = v31;
      *(_OWORD *)(a1 + 176) = v41;
      waipc::BlockRing::BlockRing(&v39, v24 + 36, *(void *)(a1 + 96) + v27, v30, *(unsigned int *)(a1 + 16));
      long long v32 = v40;
      _OWORD *v15 = v39;
      *(_OWORD *)(a1 + 208) = v32;
      *(_OWORD *)(a1 + 224) = v41;
      uint64_t v33 = *(_DWORD *)(a1 + 20) * *(unsigned __int16 *)(a1 + 10);
      if (v33) {
        operator new[]();
      }
      uint64_t v34 = *(void *)(a1 + 240);
      *(void *)(a1 + 240) = 0;
      if (v34) {
        MEMORY[0x22A66A9B0](v34, 0x1000C8077774924);
      }
      *(void *)(a1 + 256) = 0;
      *(void *)(a1 + 264) = 0;
      *(void *)(a1 + 248) = v33;
      uint64_t v35 = *(_DWORD *)(a1 + 24) * *(unsigned __int16 *)(a1 + 10);
      if (v35) {
        operator new[]();
      }
      uint64_t v36 = *(void *)(a1 + 272);
      *(void *)(a1 + 272) = 0;
      if (v36) {
        MEMORY[0x22A66A9B0](v36, 0x1000C8077774924);
      }
      *(void *)(a1 + 288) = 0;
      *(void *)(a1 + 296) = 0;
      *(void *)(a1 + 280) = v35;
      operator new[]();
    }
    v37 = "fConfig.zeroTimestampInterval % fConfig.burstInterval == 0";
    int v38 = 281;
  }
  __assert_rtn("PCIeAudioLink", "PCIeAudioLink.cpp", v38, v37);
}

void sub_226DF65A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  std::unique_ptr<waipc::PCIeAudioLink::stateLogger>::reset[abi:ne180100](v3, 0);
  uint64_t v5 = v1[38];
  v1[38] = 0;
  if (v5) {
    MEMORY[0x22A66A9B0](v5, 0x1000C8077774924);
  }
  uint64_t v6 = v1[34];
  v1[34] = 0;
  if (v6) {
    MEMORY[0x22A66A9B0](v6, 0x1000C8077774924);
  }
  uint64_t v7 = v1[30];
  v1[30] = 0;
  if (v7) {
    MEMORY[0x22A66A9B0](v7, 0x1000C8077774924);
  }
  long long v8 = (std::__shared_weak_count *)v1[13];
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  _Unwind_Resume(a1);
}

void waipc::PCIeAudioLink::logDLStallBegin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 88));
  uint64_t v8 = *(void *)(a1 + 448);
  if (v8)
  {
    unint64_t v9 = *(void *)(v8 + 1872);
    uint64_t v10 = v8 + 88 * (v9 % 0xA);
    uint64_t v11 = *(void *)(a3 + 16);
    *(_OWORD *)(v10 + 992) = *(_OWORD *)a3;
    *(void *)(v10 + 1008) = a4;
    *(void *)(v10 + 1016) = v11;
    *(_OWORD *)(v10 + 1024) = 0u;
    *(_OWORD *)(v10 + 1040) = 0u;
    *(void *)(v10 + 1056) = a2;
    *(void *)(v10 + 1064) = 0;
    *(_WORD *)(v10 + 1072) = 1;
    unint64_t v12 = *(void *)(v8 + 1880);
    if (v12 <= 9) {
      *(void *)(v8 + 1880) = v12 + 1;
    }
    *(void *)(v8 + 1872) = (v9 + 1) % 0xA;
  }
}

void waipc::PCIeAudioLink::logDLUnderrunBegin(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 88));
  uint64_t v7 = *(void *)(a1 + 448);
  if (v7)
  {
    uint64_t v8 = *a3;
    uint64_t v9 = a3[1];
    uint64_t v10 = a3[2];
    uint64_t v11 = mach_continuous_time();
    unint64_t v12 = *(void *)(v7 + 2848);
    uint64_t v13 = v7 + 96 * (v12 % 0xA);
    *(void *)(v13 + 1888) = v8;
    *(void *)(v13 + 1896) = v9;
    *(void *)(v13 + 1904) = a4;
    *(void *)(v13 + 1912) = v10;
    *(_OWORD *)(v13 + 1920) = 0u;
    *(_OWORD *)(v13 + 1936) = 0u;
    *(void *)(v13 + 1952) = v11;
    *(void *)(v13 + 1968) = 0;
    *(void *)(v13 + 1960) = 0;
    *(_WORD *)(v13 + 1976) = 1;
    unint64_t v14 = *(void *)(v7 + 2856);
    if (v14 <= 9) {
      *(void *)(v7 + 2856) = v14 + 1;
    }
    *(void *)(v7 + 2848) = (v12 + 1) % 0xA;
  }
}

void waipc::PCIeAudioLink::updateLoggerState(waipc::PCIeAudioLink *this)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)this + 22);
  uint64_t v2 = *((void *)this + 56);
  if (v2)
  {
    *(_OWORD *)uint64_t v2 = *((_OWORD *)this + 16);
    *(_OWORD *)(v2 + 16) = *((_OWORD *)this + 18);
    long long v3 = *(_OWORD *)((char *)this + 312);
    *(void *)(v2 + 48) = *((void *)this + 41);
    *(_OWORD *)(v2 + 32) = v3;
    long long v4 = *((_OWORD *)this + 21);
    *(void *)(v2 + 72) = *((void *)this + 44);
    *(_OWORD *)(v2 + 56) = v4;
    *(void *)(v2 + 80) = *((void *)this + 45);
    long long v5 = *((_OWORD *)this + 23);
    *(void *)(v2 + 104) = *((void *)this + 48);
    *(_OWORD *)(v2 + 88) = v5;
    *(_DWORD *)(v2 + 112) = waipc::BlockRing::getCurrentIndex((os_unfair_lock_t)this + 36);
    uint64_t v6 = *((void *)this + 51);
    *(_OWORD *)(v2 + 116) = *(_OWORD *)((char *)this + 392);
    *(void *)(v2 + 132) = v6;
    *(_DWORD *)(v2 + 140) = waipc::BlockRing::getCurrentIndex((os_unfair_lock_t)this + 48);
    *(_OWORD *)(v2 + 144) = *((_OWORD *)this + 26);
    *(_DWORD *)(v2 + 160) = *((_DWORD *)this + 108);
    *(_WORD *)(v2 + 164) = *((_WORD *)this + 218);
    uint64_t v7 = (os_unfair_lock_s *)*((void *)this + 56);
    *(void *)(v2 + 168) = *((void *)this + 55);
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::put(v7 + 1444, v7);
  }
}

void waipc::PCIeAudioLink::~PCIeAudioLink(waipc::PCIeAudioLink *this)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 436))
  {
    if (*((unsigned char *)this + 461))
    {
      Logger = waipc::logging::getLogger(5u);
      long long v3 = waipc::logging::getLogger(5u);
      os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, this);
      if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v5 = v4;
        if (os_signpost_enabled(Logger))
        {
          int v19 = 67109120;
          int v20 = 0;
          _os_signpost_emit_with_name_impl(&dword_226DEE000, Logger, OS_SIGNPOST_INTERVAL_END, v5, "PCIeAudioLink_DLStall", "anomalous %{BOOL}d", (uint8_t *)&v19, 8u);
        }
      }
    }
  }
  if (*((unsigned char *)this + 437))
  {
    if (*((unsigned char *)this + 461))
    {
      uint64_t v6 = waipc::logging::getLogger(5u);
      uint64_t v7 = waipc::logging::getLogger(5u);
      os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, this);
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v9 = v8;
        if (os_signpost_enabled(v6))
        {
          uint64_t v10 = *((void *)this + 55);
          int v19 = 67109376;
          int v20 = 0;
          __int16 v21 = 2048;
          uint64_t v22 = v10;
          _os_signpost_emit_with_name_impl(&dword_226DEE000, v6, OS_SIGNPOST_INTERVAL_END, v9, "PCIeAudioLink_DLUnderrun", "anomalous %{BOOL}d, length %llu", (uint8_t *)&v19, 0x12u);
        }
      }
    }
  }
  uint64_t v11 = waipc::logging::getLogger(5u);
  unint64_t v12 = waipc::logging::getLogger(5u);
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, this);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v11))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_226DEE000, v11, OS_SIGNPOST_INTERVAL_END, v14, "PCIeAudioLink", (const char *)&unk_226E0CBC1, (uint8_t *)&v19, 2u);
    }
  }
  std::unique_ptr<waipc::PCIeAudioLink::stateLogger>::reset[abi:ne180100]((uint64_t *)this + 56, 0);
  uint64_t v15 = *((void *)this + 38);
  *((void *)this + 38) = 0;
  if (v15) {
    MEMORY[0x22A66A9B0](v15, 0x1000C8077774924);
  }
  uint64_t v16 = *((void *)this + 34);
  *((void *)this + 34) = 0;
  if (v16) {
    MEMORY[0x22A66A9B0](v16, 0x1000C8077774924);
  }
  uint64_t v17 = *((void *)this + 30);
  *((void *)this + 30) = 0;
  if (v17) {
    MEMORY[0x22A66A9B0](v17, 0x1000C8077774924);
  }
  os_signpost_id_t v18 = (std::__shared_weak_count *)*((void *)this + 13);
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
}

void sub_226DF6B60(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void waipc::PCIeAudioLink::sync(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v6 = (os_unfair_lock_s *)(a1 + 88);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if (*(unsigned char *)(a1 + 460))
  {
    Logger = waipc::logging::getLogger(4u);
    if (os_signpost_enabled(Logger))
    {
      int v8 = 134217984;
      unint64_t v9 = a3;
      _os_signpost_emit_with_name_impl(&dword_226DEE000, Logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_Sync", "currentTime: %llu", (uint8_t *)&v8, 0xCu);
    }
  }
  waipc::PCIeAudioLink::checkDownlink(a1, a2, a3);
  waipc::PCIeAudioLink::checkUplink(a1, a2);
  waipc::PCIeAudioLink::updateLoggerState((waipc::PCIeAudioLink *)a1);
  os_unfair_lock_unlock(v6);
}

void sub_226DF6C78(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::PCIeAudioLink::checkDownlink(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 88));
  os_signpost_id_t v5 = *(__n128 **)(a1 + 304);
  if (waipc::BlockRing::readNextBlock((waipc::BlockRing *)(a1 + 192), v5))
  {
    while (1)
    {
      uint64_t v6 = (*(uint64_t (**)(uint64_t, unint64_t, void))(*(void *)a2 + 32))(a2, v5->n128_u64[1], 0);
      unint64_t v8 = v6 + llround(v7);
      if (*(unsigned char *)(a1 + 460))
      {
        Logger = waipc::logging::getLogger(4u);
        if (os_signpost_enabled(Logger))
        {
          int CurrentIndex = waipc::BlockRing::getCurrentIndex((os_unfair_lock_t)(a1 + 192));
          unint64_t v11 = v5->n128_u64[0];
          unint64_t v12 = v5->n128_u64[1];
          unint64_t v13 = v5[1].n128_u64[0];
          *(_DWORD *)buf = 67110144;
          *(_DWORD *)v58 = CurrentIndex;
          *(_WORD *)&v58[4] = 2048;
          *(void *)&v58[6] = v11;
          __int16 v59 = 2048;
          unint64_t v60 = v12;
          __int16 v61 = 2048;
          unint64_t v62 = v13;
          __int16 v63 = 2048;
          unint64_t v64 = v8;
          _os_signpost_emit_with_name_impl(&dword_226DEE000, Logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_DLBlock", "id %u, sample %llu, deviceTime %llu, schedule %llu, hostTime %llu", buf, 0x30u);
        }
        if (*(unsigned char *)(a1 + 460))
        {
          os_signpost_id_t v14 = waipc::logging::getLogger(4u);
          if (os_signpost_enabled(v14))
          {
            int v15 = waipc::BlockRing::getCurrentIndex((os_unfair_lock_t)(a1 + 192));
            *(_DWORD *)buf = 134218240;
            *(void *)v58 = v8;
            *(_WORD *)&v58[8] = 1024;
            *(_DWORD *)&v58[10] = v15;
            _os_signpost_emit_with_name_impl(&dword_226DEE000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_DLBlockNominal", "%{signpost.description:event_time}llu id %u", buf, 0x12u);
          }
        }
      }
      uint64_t v16 = *(unsigned __int16 *)(a1 + 8);
      if (v5->n128_u64[0] != *(void *)(a1 + 392) + v16) {
        break;
      }
      double v17 = (double)v16 / *(double *)a1 * 1000000000.0 / *(double *)(a1 + 72);
      unint64_t v18 = *(void *)(a1 + 400) + (uint64_t)v17;
      unint64_t v19 = v5->n128_u64[1];
      if (v18 <= v19) {
        uint64_t v20 = v5->n128_i64[1];
      }
      else {
        uint64_t v20 = *(void *)(a1 + 400) + (uint64_t)v17;
      }
      if (v19 < v18) {
        unint64_t v18 = v5->n128_u64[1];
      }
      if (v20 - v18 > *(void *)(a1 + 120)) {
        break;
      }
      unint64_t v41 = *(void *)(a1 + 408) + (uint64_t)v17;
      unint64_t v42 = v5[1].n128_u64[0];
      if (v41 <= v42) {
        uint64_t v43 = v5[1].n128_i64[0];
      }
      else {
        uint64_t v43 = *(void *)(a1 + 408) + (uint64_t)v17;
      }
      if (v42 < v41) {
        unint64_t v41 = v5[1].n128_u64[0];
      }
      unint64_t v44 = v43 - v41;
      unint64_t v45 = *(void *)(a1 + 128);
      BOOL v21 = v44 > v45;
      if (*(unsigned char *)(a1 + 436) || v44 > v45) {
        goto LABEL_16;
      }
      BOOL v21 = 0;
LABEL_18:
      __n128 v23 = *v5;
      *(void *)(a1 + 408) = v5[1].n128_u64[0];
      *(__n128 *)(a1 + 392) = v23;
      *(void *)(a1 + 416) = v8;
      uint64_t v24 = *(void *)(a1 + 360);
      uint64_t v25 = v24 + v5->n128_u64[0];
      if (v25 >= 0)
      {
        waipc::PCIeAudioLink::updateTimeline((waipc::PCIeAudioLink *)a1, v24 + v5->n128_u64[0], v8, v23.n128_f64[0]);
        waipc::FlatCircularBuffer::write((void **)(a1 + 272), &v5[1].n128_i8[8], v25 * *(unsigned __int16 *)(a1 + 10), *(unsigned __int16 *)(a1 + 8) * (unint64_t)*(unsigned __int16 *)(a1 + 10));
        unint64_t v26 = *(void *)(a1 + 280) / (unint64_t)*(unsigned __int16 *)(a1 + 10);
        unint64_t v27 = v25 + *(unsigned __int16 *)(a1 + 8);
        BOOL v28 = v27 >= v26;
        unint64_t v29 = v27 - v26;
        if (!v28) {
          unint64_t v29 = 0;
        }
        if (*(void *)(a1 + 288) > v29) {
          unint64_t v29 = *(void *)(a1 + 288);
        }
        *(void *)(a1 + 288) = v29;
        *(void *)(a1 + 296) = v27;
      }
      if (*(unsigned char *)(a1 + 436))
      {
        *(unsigned char *)(a1 + 436) = 0;
        if (*(unsigned char *)(a1 + 461))
        {
          uint64_t v30 = waipc::logging::getLogger(5u);
          long long v31 = waipc::logging::getLogger(5u);
          os_signpost_id_t v32 = os_signpost_id_make_with_pointer(v31, (const void *)a1);
          if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v33 = v32;
            if (os_signpost_enabled(v30))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v58 = !v21;
              _os_signpost_emit_with_name_impl(&dword_226DEE000, v30, OS_SIGNPOST_INTERVAL_END, v33, "PCIeAudioLink_DLStall", "anomalous %{BOOL}d", buf, 8u);
            }
          }
        }
        waipc::PCIeAudioLink::logDLStallEnd(a1, !v21, a3, v5, v8);
        if (!v21)
        {
          uint64_t v34 = *(void *)(a1 + 448);
          if (v34) {
            ++*(_DWORD *)(v34 + 2864);
          }
        }
      }
      if (*(unsigned char *)(a1 + 437))
      {
        *(unsigned char *)(a1 + 437) = 0;
        if (*(unsigned char *)(a1 + 461))
        {
          uint64_t v35 = waipc::logging::getLogger(5u);
          uint64_t v36 = waipc::logging::getLogger(5u);
          os_signpost_id_t v37 = os_signpost_id_make_with_pointer(v36, (const void *)a1);
          if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v38 = v37;
            if (os_signpost_enabled(v35))
            {
              uint64_t v39 = *(void *)(a1 + 440);
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v58 = !v21;
              *(_WORD *)&v58[4] = 2048;
              *(void *)&v58[6] = v39;
              _os_signpost_emit_with_name_impl(&dword_226DEE000, v35, OS_SIGNPOST_INTERVAL_END, v38, "PCIeAudioLink_DLUnderrun", "anomalous %{BOOL}d, length %llu", buf, 0x12u);
            }
          }
        }
        waipc::PCIeAudioLink::logDLUnderrunEnd(a1, !v21, *(void *)(a1 + 440), v5, v8);
        if (!v21)
        {
          uint64_t v40 = *(void *)(a1 + 448);
          if (v40)
          {
            ++*(_DWORD *)(v40 + 2868);
            *(void *)(v40 + 2872) += *(void *)(a1 + 440);
          }
        }
      }
      if (!waipc::BlockRing::readNextBlock((waipc::BlockRing *)(a1 + 192), v5)) {
        goto LABEL_50;
      }
    }
    BOOL v21 = 1;
LABEL_16:
    waipc::PCIeAudioLink::reanchorDL((const os_unfair_lock *)a1, v5->n128_u64[0], v8);
    waipc::PCIeAudioLink::realignUL((const os_unfair_lock *)a1, *(void *)(a1 + 360)+ v5->n128_u64[0]+ (uint64_t)(*(double *)a1* (*(double *)(a1 + 72)* (double)(uint64_t)(v5[1].n128_u64[0] - v5->n128_u64[1])/ 1000000000.0)), *(void *)(a1 + 360)+ v5->n128_u64[0]+ (uint64_t)(*(double *)a1 * (*(double *)(a1 + 80) * (double)(uint64_t)(a3 - v8) / 1000000000.0)));
    waipc::PCIeAudioLink::logReanchor(a1, (uint64_t *)(a1 + 392), *(void *)(a1 + 416), (uint64_t *)v5, v8, *(void *)(a1 + 360));
    uint64_t v22 = *(void *)(a1 + 448);
    if (v22) {
      ++*(_DWORD *)(v22 + 2880);
    }
    goto LABEL_18;
  }
LABEL_50:
  if (!*(unsigned char *)(a1 + 436))
  {
    unint64_t v46 = (unint64_t)*(double *)(a1 + 312);
    uint64_t v47 = *(void *)(a1 + 320);
    double v48 = *(double *)a1;
    double v49 = *(double *)(a1 + 80);
    uint64_t v50 = v47
        + (uint64_t)((double)(uint64_t)(*(void *)(a1 + 392) + *(unsigned __int16 *)(a1 + 8) + *(void *)(a1 + 360) - v46)
                  / *(double *)a1
                  * 1000000000.0
                  / v49);
    if (v50 + *(void *)(a1 + 136) <= a3)
    {
      *(unsigned char *)(a1 + 436) = 1;
      double v51 = v48 * (v49 * (double)(uint64_t)(a3 - v47) / 1000000000.0);
      waipc::PCIeAudioLink::updateTimeline((waipc::PCIeAudioLink *)a1, (uint64_t)v51 + v46, a3, v51);
      if (*(unsigned char *)(a1 + 461))
      {
        v52 = waipc::logging::getLogger(5u);
        v53 = waipc::logging::getLogger(5u);
        os_signpost_id_t v54 = os_signpost_id_make_with_pointer(v53, (const void *)a1);
        if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v55 = v54;
          if (os_signpost_enabled(v52))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)v58 = v50;
            _os_signpost_emit_with_name_impl(&dword_226DEE000, v52, OS_SIGNPOST_INTERVAL_BEGIN, v55, "PCIeAudioLink_DLStall", "%{signpost.description:begin_time}llu", buf, 0xCu);
          }
        }
      }
      waipc::PCIeAudioLink::logDLStallBegin(a1, a3, a1 + 392, *(void *)(a1 + 416));
    }
  }
}

void waipc::PCIeAudioLink::checkUplink(uint64_t a1, uint64_t a2)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 88));
  unint64_t v4 = *(void *)(a1 + 424);
  unint64_t v5 = *(void *)(a1 + 256);
  if (v5 >= v4)
  {
    *(void *)(a1 + 424) = *(unsigned __int16 *)(a1 + 8)
                          + (v5 - v4) / *(unsigned __int16 *)(a1 + 8) * *(unsigned __int16 *)(a1 + 8)
                          + v4;
    if (*(unsigned char *)(a1 + 460))
    {
      Logger = waipc::logging::getLogger(4u);
      if (os_signpost_enabled(Logger))
      {
        uint64_t v7 = *(void *)(a1 + 424);
        *(_DWORD *)buf = 134218240;
        *(void *)double v48 = v4;
        *(_WORD *)&v48[8] = 2048;
        *(void *)&v48[10] = v7;
        _os_signpost_emit_with_name_impl(&dword_226DEE000, Logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ULSkip", "oldSchedule %llu, newSchedule %llu", buf, 0x16u);
      }
    }
    uint64_t v8 = *(void *)(a1 + 448);
    if (v8) {
      *(_DWORD *)(v8 + 2884) |= 1u;
    }
  }
  for (unint64_t i = *(void *)(a1 + 424); ; *(void *)(a1 + 424) = i)
  {
    unint64_t v10 = *(void *)(a1 + 264);
    BOOL v11 = i >= v10;
    unint64_t v12 = i - v10;
    if (v12 != 0 && v11 && v12 >= *(unsigned int *)(a1 + 432)) {
      break;
    }
    unint64_t v13 = *(unsigned __int16 *)(a1 + 8);
    if (i >= v13) {
      unint64_t v14 = i - v13;
    }
    else {
      unint64_t v14 = 0;
    }
    uint64_t v15 = *(void *)(a1 + 360);
    unint64_t v16 = i / v13 * v13;
    unint64_t v17 = (v15 + *(void *)(a1 + 392)) % v13;
    if (i % v13 <= v17) {
      unint64_t v13 = 0;
    }
    unint64_t v18 = v16 + v17 + v13;
    uint64_t v19 = i - v15;
    uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a2 + 24))(a2, *(void *)(a1 + 320)+ (uint64_t)((double)(uint64_t)(i - (unint64_t)*(double *)(a1 + 312))/ *(double *)a1* 1000000000.0/ *(double *)(a1 + 80)), 0);
    unint64_t v22 = v20 + llround(v21);
    uint64_t v23 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a2 + 24))(a2, *(void *)(a1 + 320)+ (uint64_t)((double)(uint64_t)(v18 - (unint64_t)*(double *)(a1 + 312))/ *(double *)a1* 1000000000.0/ *(double *)(a1 + 80)), 0);
    *(void *)(a1 + 368) = v19;
    *(void *)(a1 + 376) = v22;
    *(void *)(a1 + 384) = v23 + llround(v24);
    uint64_t v25 = waipc::BlockRing::getNextWriteBlock((os_unfair_lock_t)(a1 + 144));
    long long v26 = *(_OWORD *)(a1 + 368);
    *(void *)(v25 + 16) = *(void *)(a1 + 384);
    *(_OWORD *)uint64_t v25 = v26;
    unint64_t v27 = (char *)(v25 + 24);
    unint64_t v28 = *(unsigned __int16 *)(a1 + 8);
    unint64_t v29 = v28 - (i - v14);
    if (v28 > i - v14)
    {
      if (*(unsigned char *)(a1 + 460))
      {
        uint64_t v30 = waipc::logging::getLogger(4u);
        if (os_signpost_enabled(v30))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)double v48 = i;
          *(_WORD *)&v48[8] = 2048;
          *(void *)&v48[10] = v29;
          _os_signpost_emit_with_name_impl(&dword_226DEE000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ULEarlySilence", "requested %llu, length %llu", buf, 0x16u);
        }
      }
      if (v29 >= *(unsigned __int16 *)(a1 + 8)) {
        waipc::PCIeAudioLink::checkUplink();
      }
      bzero(v27, v29 * *(unsigned __int16 *)(a1 + 10));
      v27 += v29 * *(unsigned __int16 *)(a1 + 10);
    }
    unint64_t v31 = *(void *)(a1 + 256);
    unint64_t v32 = v31 - v14;
    if (v31 > v14)
    {
      if (*(unsigned char *)(a1 + 460))
      {
        os_signpost_id_t v33 = waipc::logging::getLogger(4u);
        if (os_signpost_enabled(v33))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)double v48 = v14;
          *(_WORD *)&v48[8] = 2048;
          *(void *)&v48[10] = v31 - v14;
          _os_signpost_emit_with_name_impl(&dword_226DEE000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ULPartialBlockFront", "begin %llu, length %llu", buf, 0x16u);
        }
      }
      if (v32 >= *(unsigned __int16 *)(a1 + 8)) {
        waipc::PCIeAudioLink::checkUplink();
      }
      bzero(v27, v32 * *(unsigned __int16 *)(a1 + 10));
      v27 += v32 * *(unsigned __int16 *)(a1 + 10);
      unint64_t v14 = v31;
    }
    unint64_t v34 = *(void *)(a1 + 264);
    if (v14 < v34)
    {
      if (v34 >= i) {
        unint64_t v35 = i;
      }
      else {
        unint64_t v35 = *(void *)(a1 + 264);
      }
      waipc::FlatCircularBuffer::read((const void **)(a1 + 240), v27, v14 * *(unsigned __int16 *)(a1 + 10), (v35 - v14) * *(unsigned __int16 *)(a1 + 10));
      v27 += (v35 - v14) * *(unsigned __int16 *)(a1 + 10);
      unint64_t v14 = v35;
    }
    if (i > v14)
    {
      if (*(unsigned char *)(a1 + 460))
      {
        uint64_t v36 = waipc::logging::getLogger(4u);
        if (os_signpost_enabled(v36))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)double v48 = v14;
          *(_WORD *)&v48[8] = 2048;
          *(void *)&v48[10] = i - v14;
          _os_signpost_emit_with_name_impl(&dword_226DEE000, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ULPartialBlockBack", "begin %llu, length %llu", buf, 0x16u);
        }
      }
      bzero(v27, (i - v14) * *(unsigned __int16 *)(a1 + 10));
    }
    waipc::BlockRing::commitWrite((os_unfair_lock_t)(a1 + 144));
    if (*(unsigned char *)(a1 + 460))
    {
      os_signpost_id_t v37 = waipc::logging::getLogger(4u);
      if (os_signpost_enabled(v37))
      {
        int CurrentIndex = waipc::BlockRing::getCurrentIndex((os_unfair_lock_t)(a1 + 144));
        uint64_t v39 = *(void *)(a1 + 376);
        uint64_t v40 = *(void *)(a1 + 384);
        uint64_t v41 = *(void *)(a1 + 368);
        uint64_t v42 = (uint64_t)((double)(uint64_t)(*(void *)(a1 + 360) + v41 - (unint64_t)*(double *)(a1 + 312))
                      / *(double *)a1
                      * 1000000000.0
                      / *(double *)(a1 + 80));
        uint64_t v43 = *(void *)(a1 + 320);
        *(_DWORD *)buf = 67110144;
        *(_DWORD *)double v48 = CurrentIndex;
        *(_WORD *)&v48[4] = 2048;
        *(void *)&v48[6] = v41;
        *(_WORD *)&v48[14] = 2048;
        *(void *)&v48[16] = v39;
        __int16 v49 = 2048;
        uint64_t v50 = v40;
        __int16 v51 = 2048;
        uint64_t v52 = v43 + v42;
        _os_signpost_emit_with_name_impl(&dword_226DEE000, v37, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ULBlock", "id %u, sample %llu, deviceTime %llu, schedule %llu, hostTime %llu", buf, 0x30u);
      }
      if (*(unsigned char *)(a1 + 460))
      {
        unint64_t v44 = waipc::logging::getLogger(4u);
        if (os_signpost_enabled(v44))
        {
          uint64_t v45 = *(void *)(a1 + 320)
              + (uint64_t)((double)(uint64_t)(*(void *)(a1 + 360)
                                          + *(void *)(a1 + 368)
                                          - (unint64_t)*(double *)(a1 + 312))
                        / *(double *)a1
                        * 1000000000.0
                        / *(double *)(a1 + 80));
          int v46 = waipc::BlockRing::getCurrentIndex((os_unfair_lock_t)(a1 + 144));
          *(_DWORD *)buf = 134218240;
          *(void *)double v48 = v45;
          *(_WORD *)&v48[8] = 1024;
          *(_DWORD *)&v48[10] = v46;
          _os_signpost_emit_with_name_impl(&dword_226DEE000, v44, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ULBlockNominal", "%{signpost.description:event_time}llu id %u", buf, 0x12u);
        }
      }
    }
    unint64_t i = *(void *)(a1 + 424) + *(unsigned __int16 *)(a1 + 8);
  }
}

uint64_t waipc::PCIeAudioLink::deviceTimeFromSample(waipc::PCIeAudioLink *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (uint64_t)((double)(a2 - a3) / *(double *)this * 1000000000.0 / *((double *)this + 9)) + a4;
}

uint64_t waipc::PCIeAudioLink::absoluteDifference(waipc::PCIeAudioLink *this, unint64_t a2)
{
  if ((unint64_t)this <= a2) {
    uint64_t v2 = (waipc::PCIeAudioLink *)a2;
  }
  else {
    uint64_t v2 = this;
  }
  if (a2 >= (unint64_t)this) {
    long long v3 = this;
  }
  else {
    long long v3 = (waipc::PCIeAudioLink *)a2;
  }
  return v2 - v3;
}

void waipc::PCIeAudioLink::reanchorDL(const os_unfair_lock *this, uint64_t a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(this + 22);
  uint64_t v6 = *(void *)&this[90]._os_unfair_lock_opaque;
  unint64_t v7 = (uint64_t)(*(double *)&this->_os_unfair_lock_opaque
               * (*(double *)&this[20]._os_unfair_lock_opaque
                * (double)(a3 - *(void *)&this[80]._os_unfair_lock_opaque)
                / 1000000000.0))
     + (unint64_t)*(double *)&this[78]._os_unfair_lock_opaque;
  *(void *)&this[90]._os_unfair_lock_opaque = v7 - a2;
  if (LOBYTE(this[115]._os_unfair_lock_opaque))
  {
    Logger = waipc::logging::getLogger(4u);
    if (os_signpost_enabled(Logger))
    {
      uint64_t v9 = *(void *)&this[90]._os_unfair_lock_opaque;
      int v15 = 134218752;
      uint64_t v16 = a2;
      __int16 v17 = 2048;
      unint64_t v18 = v7;
      __int16 v19 = 2048;
      uint64_t v20 = v6;
      __int16 v21 = 2048;
      uint64_t v22 = v9;
      _os_signpost_emit_with_name_impl(&dword_226DEE000, Logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_DLReanchor", "sample %llu, prevTimelineSample %lld, oldDeviceOffset %lld, newDeviceOffset %lld", (uint8_t *)&v15, 0x2Au);
    }
  }
  if ((v7 & 0x8000000000000000) != 0)
  {
    *(void *)&this[72]._os_unfair_lock_opaque = 0;
    *(void *)&this[74]._os_unfair_lock_opaque = 0;
  }
  else
  {
    unint64_t v10 = *(void *)&this[74]._os_unfair_lock_opaque;
    unint64_t v11 = v7 - v10;
    if (v7 >= v10)
    {
      unint64_t os_unfair_lock_opaque_high = HIWORD(this[2]._os_unfair_lock_opaque);
      unint64_t v14 = *(void *)&this[70]._os_unfair_lock_opaque / os_unfair_lock_opaque_high;
      if (v11 >= v14) {
        unint64_t v11 = *(void *)&this[70]._os_unfair_lock_opaque / os_unfair_lock_opaque_high;
      }
      waipc::FlatCircularBuffer::set((waipc::FlatCircularBuffer *)&this[68], 0, v10 * os_unfair_lock_opaque_high, v11 * os_unfair_lock_opaque_high);
      unint64_t v12 = v7 - v14;
      if (v7 < v14) {
        unint64_t v12 = 0;
      }
      if (*(void *)&this[72]._os_unfair_lock_opaque > v12) {
        unint64_t v12 = *(void *)&this[72]._os_unfair_lock_opaque;
      }
    }
    else
    {
      unint64_t v12 = *(void *)&this[72]._os_unfair_lock_opaque;
      if (v7 < v12) {
        unint64_t v12 = v7;
      }
    }
    *(void *)&this[72]._os_unfair_lock_opaque = v12;
    *(void *)&this[74]._os_unfair_lock_opaque = v7;
  }
}

uint64_t waipc::PCIeAudioLink::sampleFromDeviceTime(waipc::PCIeAudioLink *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (uint64_t)(*(double *)this * (*((double *)this + 9) * (double)(a2 - a4) / 1000000000.0)) + a3;
}

uint64_t waipc::PCIeAudioLink::sampleFromHostTime(waipc::PCIeAudioLink *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (uint64_t)(*(double *)this * (*((double *)this + 10) * (double)(a2 - a4) / 1000000000.0)) + a3;
}

void waipc::PCIeAudioLink::realignUL(const os_unfair_lock *this, unint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(this + 22);
  uint64_t v6 = *(void *)&this[106]._os_unfair_lock_opaque;
  *(void *)&this[106]._os_unfair_lock_opaque = a2;
  unint64_t v7 = this[8]._os_unfair_lock_opaque + a3;
  if (v7 > a2)
  {
    unint64_t os_unfair_lock_opaque_low = LOWORD(this[2]._os_unfair_lock_opaque);
    unint64_t v9 = v7 / os_unfair_lock_opaque_low * os_unfair_lock_opaque_low;
    if (v7 % os_unfair_lock_opaque_low <= a2 % os_unfair_lock_opaque_low) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = LOWORD(this[2]._os_unfair_lock_opaque);
    }
    *(void *)&this[106]._os_unfair_lock_opaque = v9 + a2 % os_unfair_lock_opaque_low + v10;
  }
  if (LOBYTE(this[115]._os_unfair_lock_opaque))
  {
    Logger = waipc::logging::getLogger(4u);
    if (os_signpost_enabled(Logger))
    {
      uint64_t v12 = *(void *)&this[106]._os_unfair_lock_opaque;
      int v13 = 134218240;
      uint64_t v14 = v6;
      __int16 v15 = 2048;
      uint64_t v16 = v12;
      _os_signpost_emit_with_name_impl(&dword_226DEE000, Logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ULRealign", "oldSchedule %llu, newSchedule %llu", (uint8_t *)&v13, 0x16u);
    }
  }
}

void waipc::PCIeAudioLink::logReanchor(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 88));
  uint64_t v12 = *(void *)(a1 + 448);
  if (v12)
  {
    uint64_t v13 = *a2;
    uint64_t v14 = a2[1];
    uint64_t v15 = a2[2];
    uint64_t v16 = *a4;
    uint64_t v17 = a4[1];
    uint64_t v18 = a4[2];
    uint64_t v19 = mach_continuous_time();
    unint64_t v20 = *(void *)(v12 + 976);
    __int16 v21 = (void *)(v12 + 80 * (v20 % 0xA));
    v21[22] = v13;
    v21[23] = v14;
    v21[24] = a3;
    v21[25] = v15;
    v21[26] = v16;
    v21[27] = v17;
    v21[28] = a5;
    v21[29] = v18;
    v21[30] = v19;
    v21[31] = a6;
    unint64_t v22 = *(void *)(v12 + 984);
    if (v22 <= 9) {
      *(void *)(v12 + 984) = v22 + 1;
    }
    *(void *)(v12 + 976) = (v20 + 1) % 0xA;
  }
}

double waipc::PCIeAudioLink::updateTimeline(waipc::PCIeAudioLink *this, unint64_t a2, uint64_t a3, double result)
{
  if ((a2 & 0x8000000000000000) == 0)
  {
    BOOL result = *((double *)this + 42);
    unint64_t v4 = *((unsigned int *)this + 7);
    if (result + (double)v4 <= (double)a2)
    {
      unint64_t v5 = *((void *)this + 43);
      double v6 = (double)a2 - result;
      double v7 = (double)(uint64_t)(a3 - v5) / v6;
      double v8 = (double)((unint64_t)v6 / v4 * v4);
      *((double *)this + 39) = result + v8;
      BOOL result = (double)v5 + v8 * v7;
      *((void *)this + 40) = (unint64_t)result;
    }
  }
  return result;
}

__n128 waipc::PCIeAudioLink::logDLStallEnd(uint64_t a1, char a2, uint64_t a3, __n128 *a4, uint64_t a5)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 88));
  uint64_t v11 = *(void *)(a1 + 448);
  if (v11)
  {
    if (!*(void *)(v11 + 1880)) {
      waipc::PCIeAudioLink::logDLStallEnd();
    }
    uint64_t v12 = waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::stallReport,10ul>::back(v11 + 992);
    if (!*(unsigned char *)(v12 + 80)) {
      waipc::PCIeAudioLink::logDLStallEnd();
    }
    *(unsigned char *)(v12 + 80) = 0;
    *(void *)(v12 + 72) = a3;
    unint64_t v13 = a4[1].n128_u64[0];
    __n128 result = *a4;
    *(__n128 *)(v12 + 32) = *a4;
    *(void *)(v12 + 48) = a5;
    *(void *)(v12 + 56) = v13;
    *(unsigned char *)(v12 + 81) = a2;
  }
  return result;
}

__n128 waipc::PCIeAudioLink::logDLUnderrunEnd(uint64_t a1, unsigned __int8 a2, unint64_t a3, __n128 *a4, unint64_t a5)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 88));
  uint64_t v11 = *(void *)(a1 + 448);
  if (v11)
  {
    if (!*(void *)(v11 + 2856)) {
      waipc::PCIeAudioLink::logDLUnderrunEnd();
    }
    uint64_t v12 = waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::underrunReport,10ul>::back(v11 + 1888);
    if (!*(unsigned char *)(v12 + 88)) {
      waipc::PCIeAudioLink::logDLUnderrunEnd();
    }
    unint64_t v13 = (__n128 *)v12;
    *(unsigned char *)(v12 + 88) = 0;
    *(void *)(v12 + 72) = mach_continuous_time();
    unint64_t v14 = a4[1].n128_u64[0];
    __n128 result = *a4;
    v13[2] = *a4;
    v13[3].n128_u64[0] = a5;
    v13[3].n128_u64[1] = v14;
    v13[5].n128_u8[9] = a2;
    v13[5].n128_u64[0] = a3;
  }
  return result;
}

uint64_t waipc::PCIeAudioLink::hostTimeFromSample(waipc::PCIeAudioLink *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (uint64_t)((double)(a2 - a3) / *(double *)this * 1000000000.0 / *((double *)this + 10)) + a4;
}

unint64_t waipc::PCIeAudioLink::increaseUntilEqualModulo(unint64_t this, unint64_t a2, unint64_t a3)
{
  if (this % a3 <= a2 % a3) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = a3;
  }
  return this / a3 * a3 + a2 % a3 + v3;
}

unint64_t waipc::PCIeAudioLink::roundDown(unint64_t this, unint64_t a2)
{
  return this / a2 * a2;
}

uint64_t waipc::PCIeAudioLink::signedDifference(waipc::PCIeAudioLink *this, uint64_t a2)
{
  return (uint64_t)this - a2;
}

void waipc::PCIeAudioLink::readInput(waipc::PCIeAudioLink *this, unint64_t a2, char *a3, unsigned int a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  double v8 = (os_unfair_lock_s *)((char *)this + 88);
  os_unfair_lock_lock((os_unfair_lock_t)this + 22);
  unint64_t v10 = a4 / *((unsigned __int16 *)this + 5) + a2;
  if (*((unsigned char *)this + 460))
  {
    Logger = waipc::logging::getLogger(4u);
    if (os_signpost_enabled(Logger))
    {
      uint64_t v12 = *((void *)this + 36);
      uint64_t v13 = *((void *)this + 37);
      int v27 = 134218752;
      uint64_t v28 = a2;
      __int16 v29 = 2048;
      unint64_t v30 = v10;
      __int16 v31 = 2048;
      uint64_t v32 = v12;
      __int16 v33 = 2048;
      uint64_t v34 = v13;
      _os_signpost_emit_with_name_impl(&dword_226DEE000, Logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ReadInput", "range [%llu, %llu), available [%llu, %llu)", (uint8_t *)&v27, 0x2Au);
    }
  }
  unint64_t v14 = *((void *)this + 36);
  if (v14 > a2)
  {
    if (v14 >= v10) {
      unint64_t v15 = v10;
    }
    else {
      unint64_t v15 = *((void *)this + 36);
    }
    unint64_t v16 = v15 - a2;
    if (*((unsigned char *)this + 460))
    {
      uint64_t v17 = waipc::logging::getLogger(4u);
      if (os_signpost_enabled(v17))
      {
        int v27 = 134218240;
        uint64_t v28 = a2;
        __int16 v29 = 2048;
        unint64_t v30 = v15 - a2;
        _os_signpost_emit_with_name_impl(&dword_226DEE000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_DLOverflow", "begin %llu, length %llu", (uint8_t *)&v27, 0x16u);
      }
    }
    uint64_t v18 = *((void *)this + 56);
    if (v18) {
      *(_DWORD *)(v18 + 2884) |= 2u;
    }
    bzero(a3, v16 * *((unsigned __int16 *)this + 5));
    a3 += v16 * *((unsigned __int16 *)this + 5);
    a2 = v15;
  }
  unint64_t v19 = *((void *)this + 37);
  if (a2 < v19)
  {
    if (v19 >= v10) {
      unint64_t v20 = v10;
    }
    else {
      unint64_t v20 = *((void *)this + 37);
    }
    waipc::FlatCircularBuffer::read((const void **)this + 34, a3, a2 * *((unsigned __int16 *)this + 5), (v20 - a2) * *((unsigned __int16 *)this + 5));
    a3 += (v20 - a2) * *((unsigned __int16 *)this + 5);
    a2 = v20;
  }
  unint64_t v21 = v10 - a2;
  if (v10 > a2)
  {
    if (!*((unsigned char *)this + 437))
    {
      *((unsigned char *)this + 437) = 1;
      *((void *)this + 55) = 0;
      if (*((unsigned char *)this + 461))
      {
        unint64_t v22 = waipc::logging::getLogger(5u);
        uint64_t v23 = waipc::logging::getLogger(5u);
        os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v23, this);
        if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v25 = v24;
          if (os_signpost_enabled(v22))
          {
            uint64_t v26 = *((void *)this + 40)
                + (uint64_t)((double)(uint64_t)(a2 - (unint64_t)*((double *)this + 39))
                          / *(double *)this
                          * 1000000000.0
                          / *((double *)this + 10));
            int v27 = 134217984;
            uint64_t v28 = v26;
            _os_signpost_emit_with_name_impl(&dword_226DEE000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v25, "PCIeAudioLink_DLUnderrun", "%{signpost.description:begin_time}llu", (uint8_t *)&v27, 0xCu);
          }
        }
      }
      waipc::PCIeAudioLink::logDLUnderrunBegin((uint64_t)this, v9, (uint64_t *)this + 49, *((void *)this + 52));
    }
    *((void *)this + 55) += v21;
    bzero(a3, v21 * *((unsigned __int16 *)this + 5));
  }
  waipc::PCIeAudioLink::updateLoggerState(this);
  os_unfair_lock_unlock(v8);
}

void sub_226DF82F4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::PCIeAudioLink::writeMix(os_unfair_lock_s *this, unint64_t a2, char *a3, unsigned int a4, uint32_t a5)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  unint64_t v10 = this + 22;
  os_unfair_lock_lock(this + 22);
  unint64_t os_unfair_lock_opaque_high = HIWORD(this[2]._os_unfair_lock_opaque);
  unint64_t v12 = *(void *)&this[62]._os_unfair_lock_opaque / os_unfair_lock_opaque_high;
  unint64_t v13 = a4 / os_unfair_lock_opaque_high;
  unint64_t v14 = v13 - v12;
  lock = v10;
  if (v13 <= v12)
  {
    uint32_t v16 = a5;
    unint64_t v18 = a2;
  }
  else
  {
    if (LOBYTE(this[115]._os_unfair_lock_opaque))
    {
      Logger = waipc::logging::getLogger(4u);
      if (os_signpost_enabled(Logger))
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v39 = a2;
        __int16 v40 = 2048;
        unint64_t v41 = v13 - v12;
        _os_signpost_emit_with_name_impl(&dword_226DEE000, Logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ULOverflow", "begin %llu, length %llu", buf, 0x16u);
      }
    }
    uint32_t v16 = a5;
    uint64_t v17 = *(void *)&this[112]._os_unfair_lock_opaque;
    if (v17) {
      *(_DWORD *)(v17 + 2884) |= 4u;
    }
    unint64_t v18 = v14 + a2;
    unint64_t os_unfair_lock_opaque_high = HIWORD(this[2]._os_unfair_lock_opaque);
    a3 += v14 * os_unfair_lock_opaque_high;
  }
  unint64_t v19 = v13 + a2;
  unint64_t v20 = *(void *)&this[66]._os_unfair_lock_opaque;
  unint64_t v21 = v18 - v20;
  if (v18 != v20)
  {
    unint64_t v22 = *(void *)&this[106]._os_unfair_lock_opaque;
    if (v18 >= v20)
    {
      if (v19 - v20 < v12 && *(void *)&this[64]._os_unfair_lock_opaque != v20)
      {
        if (v21 > v12) {
          __assert_rtn("writeMix", "PCIeAudioLink.cpp", 776, "skip <= capacity");
        }
        waipc::FlatCircularBuffer::set((waipc::FlatCircularBuffer *)&this[60], 0, v20 * os_unfair_lock_opaque_high, v21 * os_unfair_lock_opaque_high);
        unint64_t v35 = v18 - v12;
        if (v18 >= v12) {
          unint64_t v36 = v18 - v12;
        }
        else {
          unint64_t v36 = 0;
        }
        if (*(void *)&this[64]._os_unfair_lock_opaque >= v36) {
          unint64_t v35 = *(void *)&this[64]._os_unfair_lock_opaque;
        }
        *(void *)&this[64]._os_unfair_lock_opaque = v35;
        *(void *)&this[66]._os_unfair_lock_opaque = v18;
        goto LABEL_22;
      }
      *(void *)&this[64]._os_unfair_lock_opaque = v18;
      *(void *)&this[66]._os_unfair_lock_opaque = v18;
    }
    else
    {
      unint64_t v23 = *(void *)&this[64]._os_unfair_lock_opaque;
      if (v23 >= v18) {
        unint64_t v23 = v18;
      }
      *(void *)&this[64]._os_unfair_lock_opaque = v23;
      *(void *)&this[66]._os_unfair_lock_opaque = v18;
      if (v22 <= v18) {
        goto LABEL_22;
      }
    }
    unint64_t os_unfair_lock_opaque_low = LOWORD(this[2]._os_unfair_lock_opaque);
    if ((v18 + 1) % os_unfair_lock_opaque_low <= v22 % os_unfair_lock_opaque_low) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = LOWORD(this[2]._os_unfair_lock_opaque);
    }
    *(void *)&this[106]._os_unfair_lock_opaque = (v18 + 1) / os_unfair_lock_opaque_low * os_unfair_lock_opaque_low
                                                 + v22 % os_unfair_lock_opaque_low
                                                 + v25;
LABEL_22:
    if (LOBYTE(this[115]._os_unfair_lock_opaque))
    {
      uint64_t v26 = waipc::logging::getLogger(4u);
      if (os_signpost_enabled(v26))
      {
        uint64_t v27 = *(void *)&this[106]._os_unfair_lock_opaque;
        *(_DWORD *)buf = 134218752;
        unint64_t v39 = v18;
        __int16 v40 = 2048;
        unint64_t v41 = v20;
        __int16 v42 = 2048;
        unint64_t v43 = v22;
        __int16 v44 = 2048;
        uint64_t v45 = v27;
        _os_signpost_emit_with_name_impl(&dword_226DEE000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_ULJump", "begin %llu, expected %llu, oldSchedule %llu, newSchedule %llu", buf, 0x2Au);
      }
    }
  }
  waipc::FlatCircularBuffer::write((void **)&this[60], a3, v18 * HIWORD(this[2]._os_unfair_lock_opaque), (v19 - v18) * HIWORD(this[2]._os_unfair_lock_opaque));
  unint64_t v28 = v19 - v12;
  if (v19 >= v12) {
    unint64_t v29 = v19 - v12;
  }
  else {
    unint64_t v29 = 0;
  }
  if (*(void *)&this[64]._os_unfair_lock_opaque >= v29) {
    unint64_t v28 = *(void *)&this[64]._os_unfair_lock_opaque;
  }
  *(void *)&this[64]._os_unfair_lock_opaque = v28;
  *(void *)&this[66]._os_unfair_lock_opaque = v19;
  this[108]._os_unfair_lock_opaque = v16;
  if (LOBYTE(this[115]._os_unfair_lock_opaque))
  {
    unint64_t v30 = waipc::logging::getLogger(4u);
    if (os_signpost_enabled(v30))
    {
      unint64_t v31 = *(void *)&this[64]._os_unfair_lock_opaque;
      uint64_t v32 = *(void *)&this[66]._os_unfair_lock_opaque;
      uint64_t v33 = *(void *)&this[106]._os_unfair_lock_opaque;
      uint64_t v34 = v33 - LOWORD(this[2]._os_unfair_lock_opaque);
      *(_DWORD *)buf = 134219264;
      unint64_t v39 = v18;
      __int16 v40 = 2048;
      unint64_t v41 = v19;
      __int16 v42 = 2048;
      unint64_t v43 = v31;
      __int16 v44 = 2048;
      uint64_t v45 = v32;
      __int16 v46 = 2048;
      uint64_t v47 = v34;
      __int16 v48 = 2048;
      uint64_t v49 = v33;
      _os_signpost_emit_with_name_impl(&dword_226DEE000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_WriteMix", "range [%llu, %llu), available [%llu, %llu), scheduled [%llu, %llu)", buf, 0x3Eu);
    }
  }
  waipc::PCIeAudioLink::updateLoggerState((waipc::PCIeAudioLink *)this);
  os_unfair_lock_unlock(lock);
}

void sub_226DF86B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void waipc::PCIeAudioLink::getZeroTimestamp(waipc::PCIeAudioLink *this@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  double v6 = (os_unfair_lock_s *)((char *)this + 88);
  os_unfair_lock_lock((os_unfair_lock_t)this + 22);
  if (*((unsigned char *)this + 436))
  {
    double v8 = *((double *)this + 39);
    LODWORD(v7) = *((_DWORD *)this + 7);
    unint64_t v9 = (unint64_t)(v8 + (double)v7);
    double v10 = (double)(uint64_t)(v9 - (unint64_t)v8) / *(double *)this * 1000000000.0 / *((double *)this + 10);
    unint64_t v11 = *((void *)this + 40) + (uint64_t)v10;
    if (v11 <= a2) {
      waipc::PCIeAudioLink::updateTimeline(this, v9, v11, v10);
    }
  }
  if (*((void *)this + 40) <= a2)
  {
    *((void *)this + 44) = *((void *)this + 41);
    *((_OWORD *)this + 21) = *(_OWORD *)((char *)this + 312);
  }
  if (*((unsigned char *)this + 460))
  {
    Logger = waipc::logging::getLogger(4u);
    if (os_signpost_enabled(Logger))
    {
      uint64_t v13 = *((void *)this + 42);
      uint64_t v14 = *((void *)this + 43);
      uint64_t v15 = *((void *)this + 44);
      int v16 = 134218496;
      uint64_t v17 = v13;
      __int16 v18 = 2048;
      uint64_t v19 = v14;
      __int16 v20 = 2048;
      uint64_t v21 = v15;
      _os_signpost_emit_with_name_impl(&dword_226DEE000, Logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PCIeAudioLink_GetZeroTimestamp", "sample %lf, host %llu, seed %llu", (uint8_t *)&v16, 0x20u);
    }
  }
  waipc::PCIeAudioLink::updateLoggerState(this);
  *(_OWORD *)a3 = *((_OWORD *)this + 21);
  *(void *)(a3 + 16) = *((void *)this + 44);
  os_unfair_lock_unlock(v6);
}

void sub_226DF886C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL waipc::PCIeAudioLink::isPeripheralActive(os_unfair_lock_s *this)
{
  uint64_t v2 = this + 22;
  os_unfair_lock_lock(this + 22);
  BOOL v3 = waipc::BlockRing::getLiveIndex(this + 48) != 0;
  os_unfair_lock_unlock(v2);
  return v3;
}

void sub_226DF88CC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::PCIeAudioLink::getDLState(waipc::PCIeAudioLink *this@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4 = (os_unfair_lock_s *)((char *)this + 88);
  os_unfair_lock_lock((os_unfair_lock_t)this + 22);
  *(_DWORD *)a2 = waipc::BlockRing::getCurrentIndex((os_unfair_lock_t)this + 48) - 1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)((char *)this + 392);
  *(void *)(a2 + 24) = *((void *)this + 51);

  os_unfair_lock_unlock(v4);
}

void sub_226DF8950(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::PCIeAudioLink::getULState(os_unfair_lock_s *this@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4 = this + 22;
  os_unfair_lock_lock(this + 22);
  *(_DWORD *)a2 = waipc::BlockRing::getCurrentIndex(this + 36) - 1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)&this[92]._os_unfair_lock_opaque;
  *(void *)(a2 + 24) = *(void *)&this[96]._os_unfair_lock_opaque;

  os_unfair_lock_unlock(v4);
}

void sub_226DF89D0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

double waipc::PCIeAudioLink::getDLAlignmentAnchor(os_unfair_lock_s *this)
{
  uint64_t v2 = this + 22;
  os_unfair_lock_lock(this + 22);
  double v3 = (double)(unint64_t)(*(void *)&this[90]._os_unfair_lock_opaque
                                + *(void *)&this[98]._os_unfair_lock_opaque);
  os_unfair_lock_unlock(v2);
  return v3;
}

double waipc::PCIeAudioLink::getULAlignmentAnchor(os_unfair_lock_s *this)
{
  uint64_t v2 = this + 22;
  os_unfair_lock_lock(this + 22);
  double v3 = (double)*(unint64_t *)&this[106]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(v2);
  return v3;
}

unint64_t waipc::PCIeAudioLink::roundUp(waipc::PCIeAudioLink *this, unint64_t a2)
{
  return ((unint64_t)this + a2 - 1) / a2 * a2;
}

uint64_t waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::stallReport,10ul>::back(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 888);
  if (!v1) {
    waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::stallReport,10ul>::back();
  }
  if (*(void *)(a1 + 880)) {
    uint64_t v1 = *(void *)(a1 + 880);
  }
  return a1 + 88 * ((v1 - 1) % 0xAuLL);
}

uint64_t waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::underrunReport,10ul>::back(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 968);
  if (!v1) {
    waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::stallReport,10ul>::back();
  }
  if (*(void *)(a1 + 960)) {
    uint64_t v1 = *(void *)(a1 + 960);
  }
  return a1 + 96 * ((v1 - 1) % 0xAuLL);
}

void waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::put(os_unfair_lock_t lock, const void *a2)
{
  if (lock) {
    os_unfair_lock_lock(lock);
  }
  unint64_t v4 = (void *)waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::takeIdle((uint64_t)lock);
  memcpy(v4, a2, 0xB48uLL);
  unint64_t v5 = atomic_exchange((atomic_ullong *volatile)&lock[2168], (unint64_t)v4);
  if (v5) {
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::putIdle((uint64_t)lock, v5);
  }
  if (lock)
  {
    os_unfair_lock_unlock(lock);
  }
}

void sub_226DF8BC0(_Unwind_Exception *exception_object)
{
  if (v1) {
    os_unfair_lock_unlock(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t waipc::PCIeAudioLink::dumpState(waipc::PCIeAudioLink *this)
{
  v69[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = (os_unfair_lock_s *)((char *)this + 92);
  os_unfair_lock_lock((os_unfair_lock_t)this + 23);
  uint64_t v3 = *((void *)this + 56);
  if (v3)
  {
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::take(v3 + 5776, (void *)(v3 + 2888));
    uint64_t v4 = *((void *)this + 56);
    uint64_t v39 = 0;
    __int16 v40 = (uint64_t **)&v39;
    uint64_t v41 = 0x4002000000;
    __int16 v42 = __Block_byref_object_copy__0;
    unint64_t v43 = __Block_byref_object_dispose__0;
    memset(v44, 0, sizeof(v44));
    std::vector<applesauce::CF::DictionaryRef>::reserve(v44, *(void *)(v4 + 3872));
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 0x40000000;
    v38[2] = ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_43;
    v38[3] = &unk_2647E81C8;
    v38[4] = &__block_literal_global_39;
    v38[5] = &v39;
    waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::reanchorReport,10ul>::for_each<void({block_pointer})(waipc::PCIeAudioLink::reanchorReport const&)>(v4 + 3064, (uint64_t)v38);
    uint64_t v32 = 0;
    uint64_t v33 = (uint64_t **)&v32;
    uint64_t v34 = 0x4002000000;
    unint64_t v35 = __Block_byref_object_copy__0;
    unint64_t v36 = __Block_byref_object_dispose__0;
    memset(v37, 0, sizeof(v37));
    std::vector<applesauce::CF::DictionaryRef>::reserve(v37, *(void *)(v4 + 4768));
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 0x40000000;
    v31[2] = ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_2_58;
    v31[3] = &unk_2647E81F0;
    v31[4] = &__block_literal_global_39;
    void v31[5] = &v32;
    waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::stallReport,10ul>::for_each<void({block_pointer})(waipc::PCIeAudioLink::stallReport const&)>(v4 + 3880, (uint64_t)v31);
    uint64_t v25 = 0;
    uint64_t v26 = (uint64_t **)&v25;
    uint64_t v27 = 0x4002000000;
    unint64_t v28 = __Block_byref_object_copy__0;
    unint64_t v29 = __Block_byref_object_dispose__0;
    memset(v30, 0, sizeof(v30));
    std::vector<applesauce::CF::DictionaryRef>::reserve(v30, *(void *)(v4 + 5744));
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 0x40000000;
    void v24[2] = ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_3_79;
    v24[3] = &unk_2647E8218;
    v24[4] = &__block_literal_global_39;
    v24[5] = &v25;
    waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::underrunReport,10ul>::for_each<void({block_pointer})(waipc::PCIeAudioLink::underrunReport const&)>(v4 + 4776, (uint64_t)v24);
    waipc::util::_kv::_kv<double const&,void>(v45, @"Sample Rate", (uint64_t *)this);
    waipc::util::_kv::_kv<unsigned short const&,void>(&v46, @"Burst Interval", (__int16 *)this + 4);
    waipc::util::_kv::_kv<unsigned short const&,void>(&v47, @"Sample Width", (__int16 *)this + 5);
    waipc::util::_kv::_kv<unsigned int const&,void>(&v48, @"UL Scratch Size", (int *)this + 5);
    waipc::util::_kv::_kv<unsigned int const&,void>(&v49, @"DL Scratch Size", (int *)this + 6);
    waipc::util::_kv::_kv<unsigned int const&,void>(&v50, @"Timestamp Interval", (int *)this + 7);
    waipc::util::_kv::_kv<double const&,void>(&v51, @"UL Reanchor Threshold", (uint64_t *)this + 5);
    waipc::util::_kv::_kv<double const&,void>(&v52, @"DL Reanchor Threshold", (uint64_t *)this + 6);
    waipc::util::_kv::_kv<double const&,void>(v53, @"DL Stall Detect Threshold", (uint64_t *)this + 7);
    uint64_t v5 = waipc::BlockRing::dumpState((waipc::PCIeAudioLink *)((char *)this + 144));
    v53[2] = @"UL Ring";
    v53[3] = v5;
    cf[2] = 0;
    uint64_t v6 = waipc::BlockRing::dumpState((waipc::PCIeAudioLink *)((char *)this + 192));
    v53[4] = @"DL Ring";
    v53[5] = v6;
    cf[1] = 0;
    waipc::util::_kv::_kv<unsigned long long &,void>(&v54, @"UL Scratch Head", (uint64_t *)(v4 + 2888));
    waipc::util::_kv::_kv<unsigned long long &,void>(&v55, @"UL Scratch Tail", (uint64_t *)(v4 + 2896));
    waipc::util::_kv::_kv<unsigned long long &,void>(&v56, @"DL Scratch Head", (uint64_t *)(v4 + 2904));
    waipc::util::_kv::_kv<unsigned long long &,void>(v57, @"DL Scratch Tail", (uint64_t *)(v4 + 2912));
    ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke((uint64_t *)(v4 + 2920), (applesauce::CF::DictionaryRef *)cf);
    v57[2] = @"Current Timestamp";
    CFTypeRef v7 = cf[0];
    if (cf[0]) {
      CFRetain(cf[0]);
    }
    v57[3] = v7;
    ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke((uint64_t *)(v4 + 2944), (applesauce::CF::DictionaryRef *)&v21);
    v57[4] = @"Last Timestamp";
    CFTypeRef v8 = v21;
    if (v21) {
      CFRetain(v21);
    }
    v57[5] = v8;
    waipc::util::_kv::_kv<unsigned long long &,void>(v58, @"Device Timeline Offset", (uint64_t *)(v4 + 2968));
    ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_2((uint64_t *)(v4 + 2976), (applesauce::CF::DictionaryRef *)&v20);
    v58[2] = @"UL Last Header";
    CFTypeRef v9 = v20;
    if (v20) {
      CFRetain(v20);
    }
    v58[3] = v9;
    waipc::util::_kv::_kv<unsigned int &,void>(v59, @"UL Last Index", (int *)(v4 + 3000));
    ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_2((uint64_t *)(v4 + 3004), (applesauce::CF::DictionaryRef *)&v19);
    v59[2] = @"DL Last Header";
    CFTypeRef v10 = v19;
    if (v19) {
      CFRetain(v19);
    }
    v59[3] = v10;
    waipc::util::_kv::_kv<unsigned int &,void>(&v60, @"DL Last Index", (int *)(v4 + 3028));
    waipc::util::_kv::_kv<unsigned long long &,void>(&v61, @"DL Last Host Timestamp", (uint64_t *)(v4 + 3032));
    waipc::util::_kv::_kv<unsigned long long &,void>(&v62, @"UL Next Block", (uint64_t *)(v4 + 3040));
    waipc::util::_kv::_kv<unsigned int &,void>(v63, @"UL Tardiness", (int *)(v4 + 3048));
    uint64_t v11 = *MEMORY[0x263EFFB40];
    uint64_t v12 = *MEMORY[0x263EFFB38];
    if (*(unsigned char *)(v4 + 3052)) {
      uint64_t v13 = *MEMORY[0x263EFFB40];
    }
    else {
      uint64_t v13 = *MEMORY[0x263EFFB38];
    }
    v63[2] = @"DL Stalled";
    v63[3] = v13;
    if (*(unsigned char *)(v4 + 3053)) {
      uint64_t v14 = v11;
    }
    else {
      uint64_t v14 = v12;
    }
    v63[4] = @"DL Underrun";
    v63[5] = v14;
    waipc::util::_kv::_kv<unsigned long long &,void>(v64, @"DL Underrun Length", (uint64_t *)(v4 + 3056));
    v64[2] = @"Reanchor Log";
    v64[3] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>(v40 + 5);
    v64[4] = @"DL Stall Log";
    v64[5] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>(v33 + 5);
    v64[6] = @"DL Underrun Log";
    v64[7] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>(v26 + 5);
    waipc::util::_kv::_kv<unsigned int &,void>(&v65, @"DL Stall Anomaly Count", (int *)(v4 + 5752));
    waipc::util::_kv::_kv<unsigned int &,void>(&v66, @"DL Underrun Anomalies", (int *)(v4 + 5756));
    waipc::util::_kv::_kv<unsigned long long &,void>(&v67, @"DL Underrun Anomaly Length", (uint64_t *)(v4 + 5760));
    waipc::util::_kv::_kv<unsigned int &,void>(&v68, @"Reanchor Count", (int *)(v4 + 5768));
    waipc::util::_kv::_kv<unsigned int &,void>(v69, @"Exotic Errors", (int *)(v4 + 5772));
    waipc::util::createCFDictDropNull<36l>((uint64_t)v45, (applesauce::CF::DictionaryRef *)&v23);
    for (uint64_t i = 71; i != -1; i -= 2)
    {
      int v16 = v45[i];
      if (v16) {
        CFRelease(v16);
      }
    }
    if (v19) {
      CFRelease(v19);
    }
    if (v20) {
      CFRelease(v20);
    }
    if (v21) {
      CFRelease(v21);
    }
    if (cf[0]) {
      CFRelease(cf[0]);
    }
    uint64_t v17 = v23;
    _Block_object_dispose(&v25, 8);
    v45[0] = (void **)v30;
    std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](v45);
    _Block_object_dispose(&v32, 8);
    v45[0] = (void **)v37;
    std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](v45);
    _Block_object_dispose(&v39, 8);
    v45[0] = (void **)v44;
    std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](v45);
  }
  else
  {
    uint64_t v17 = 0;
  }
  os_unfair_lock_unlock(v2);
  return v17;
}

void sub_226DF937C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

BOOL waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::take(uint64_t a1, void *a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 4));
  uint64_t v5 = (const void *)atomic_exchange((atomic_ullong *volatile)(a1 + 8672), 0);
  if (v5)
  {
    if (a2) {
      memcpy(a2, v5, 0xB48uLL);
    }
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::putIdle(a1, (unint64_t)v5);
  }
  os_unfair_lock_unlock(v4);
  return v5 != 0;
}

void sub_226DF9584(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke(uint64_t *a1@<X1>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  v8[2] = *MEMORY[0x263EF8340];
  waipc::util::_kv::_kv<double const&,void>(v6, @"Sample", a1);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v7, @"Host", a1 + 1);
  waipc::util::_kv::_kv<unsigned long long const&,void>(v8, @"Seed", a1 + 2);
  waipc::util::createCFDictDropNull<3l>((uint64_t)v6, a2);
  for (uint64_t i = 5; i != -1; i -= 2)
  {
    uint64_t v5 = (const void *)v6[i];
    if (v5) {
      CFRelease(v5);
    }
  }
}

void sub_226DF9670(_Unwind_Exception *a1)
{
  for (uint64_t i = 32; i != -16; i -= 16)
    waipc::util::_kv::~_kv((waipc::util::_kv *)(v1 + i));
  _Unwind_Resume(a1);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<3l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3 = 0;
  CFIndex v4 = 0;
  keys[3] = *(void **)MEMORY[0x263EF8340];
  memset(keys, 0, 24);
  memset(values, 0, sizeof(values));
  do
  {
    uint64_t v5 = *(void **)(a1 + v3);
    if (v5)
    {
      uint64_t v6 = *(void **)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        values[v4++] = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 48);
  CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)values, v4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

void ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_2(uint64_t *a1@<X1>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  v8[2] = *MEMORY[0x263EF8340];
  waipc::util::_kv::_kv<unsigned long long const&,void>(v6, @"Sample", a1);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v7, @"Timestamp", a1 + 1);
  waipc::util::_kv::_kv<unsigned long long const&,void>(v8, @"Schedule", a1 + 2);
  waipc::util::createCFDictDropNull<3l>((uint64_t)v6, a2);
  for (uint64_t i = 5; i != -1; i -= 2)
  {
    uint64_t v5 = (const void *)v6[i];
    if (v5) {
      CFRelease(v5);
    }
  }
}

void sub_226DF987C(_Unwind_Exception *a1)
{
  for (uint64_t i = 32; i != -16; i -= 16)
    waipc::util::_kv::~_kv((waipc::util::_kv *)(v1 + i));
  _Unwind_Resume(a1);
}

void ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_3(uint64_t *a1@<X1>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  _OWORD v9[2] = *MEMORY[0x263EF8340];
  waipc::util::_kv::_kv<unsigned long long const&,void>(v6, @"Sample", a1);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v7, @"Device", a1 + 1);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v8, @"Host", a1 + 2);
  waipc::util::_kv::_kv<unsigned long long const&,void>(v9, @"Schedule", a1 + 3);
  waipc::util::createCFDictDropNull<4l>((uint64_t)v6, a2);
  for (uint64_t i = 7; i != -1; i -= 2)
  {
    uint64_t v5 = (const void *)v6[i];
    if (v5) {
      CFRelease(v5);
    }
  }
}

void sub_226DF99CC(_Unwind_Exception *a1)
{
  for (uint64_t i = 48; i != -16; i -= 16)
    waipc::util::_kv::~_kv((waipc::util::_kv *)(v1 + i));
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__0(void *a1, uint64_t a2)
{
  a1[5] = 0;
  a1[6] = 0;
  a1[7] = 0;
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 5) = result;
  a1[7] = *(void *)(a2 + 56);
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 40);
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::reanchorReport,10ul>::for_each<void({block_pointer})(waipc::PCIeAudioLink::reanchorReport const&)>(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 800);
  uint64_t v5 = v4 - 10;
  if (v4 != 10 && v4 != *(void *)(result + 808))
  {
    uint64_t v7 = result + 80 * v4;
    do
    {
      __n128 result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v7);
      v7 += 80;
    }
    while (!__CFADD__(v5++, 1));
  }
  if (v4)
  {
    uint64_t v9 = 80 * v4;
    do
    {
      __n128 result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v3);
      v3 += 80;
      v9 -= 80;
    }
    while (v9);
  }
  return result;
}

void ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_43(uint64_t a1, uint64_t a2)
{
  v32[6] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 8);
  waipc::util::_kv::_kv<unsigned long long const&,void>(v31, @"Time", (uint64_t *)(a2 + 64));
  waipc::util::_kv::_kv<unsigned long long const&,void>(v32, @"Offset", (uint64_t *)(a2 + 72));
  (*(void (**)(CFTypeRef *__return_ptr))(*(void *)(a1 + 32) + 16))(&cf);
  v32[2] = @"Before";
  CFTypeRef v5 = cf;
  if (cf) {
    CFRetain(cf);
  }
  v32[3] = v5;
  (*(void (**)(CFTypeRef *__return_ptr))(*(void *)(a1 + 32) + 16))(&v24);
  v32[4] = @"After";
  CFTypeRef v6 = v24;
  if (v24) {
    CFRetain(v24);
  }
  v32[5] = v6;
  waipc::util::createCFDictDropNull<4l>((uint64_t)v31, (applesauce::CF::DictionaryRef *)&v26);
  unint64_t v7 = v4[7];
  uint64_t v8 = (CFTypeRef *)v4[6];
  if ((unint64_t)v8 >= v7)
  {
    uint64_t v9 = (void *)v4[5];
    uint64_t v10 = v8 - (CFTypeRef *)v9;
    if ((unint64_t)(v10 + 1) >> 61) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v11 = v7 - (void)v9;
    unint64_t v12 = (uint64_t)(v7 - (void)v9) >> 2;
    if (v12 <= v10 + 1) {
      unint64_t v12 = v10 + 1;
    }
    if (v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    unint64_t v30 = v4 + 7;
    if (v13)
    {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>((uint64_t)(v4 + 7), v13);
      uint64_t v9 = (void *)v4[5];
      uint64_t v8 = (CFTypeRef *)v4[6];
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v15 = (CFTypeRef *)&v14[8 * v10];
    int v16 = &v14[8 * v13];
    unint64_t v29 = v16;
    CFTypeRef *v15 = v26;
    uint64_t v17 = v15 + 1;
    CFTypeRef v26 = 0;
    *((void *)&v28 + 1) = v15 + 1;
    if (v8 != v9)
    {
      do
      {
        __int16 v18 = *--v8;
        *--uint64_t v15 = v18;
        *uint64_t v8 = 0;
      }
      while (v8 != v9);
      uint64_t v17 = (void *)*((void *)&v28 + 1);
      int v16 = v29;
    }
    long long v19 = *(_OWORD *)(v4 + 5);
    v4[5] = v15;
    v4[6] = v17;
    long long v28 = v19;
    CFTypeRef v20 = (char *)v4[7];
    v4[7] = v16;
    unint64_t v29 = v20;
    uint64_t v27 = v19;
    std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)&v27);
    CFTypeRef v21 = v26;
    v4[6] = v17;
    if (v21) {
      CFRelease(v21);
    }
  }
  else
  {
    *uint64_t v8 = v26;
    CFTypeRef v26 = 0;
    v4[6] = v8 + 1;
  }
  for (uint64_t i = 7; i != -1; i -= 2)
  {
    uint64_t v23 = (const void *)v31[i];
    if (v23) {
      CFRelease(v23);
    }
  }
  if (v24) {
    CFRelease(v24);
  }
  if (cf) {
    CFRelease(cf);
  }
}

void sub_226DF9D68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::stallReport,10ul>::for_each<void({block_pointer})(waipc::PCIeAudioLink::stallReport const&)>(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 880);
  uint64_t v5 = v4 - 10;
  if (v4 != 10 && v4 != *(void *)(result + 888))
  {
    uint64_t v7 = result + 88 * v4;
    do
    {
      __n128 result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v7);
      v7 += 88;
    }
    while (!__CFADD__(v5++, 1));
  }
  if (v4)
  {
    uint64_t v9 = 88 * v4;
    do
    {
      __n128 result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v3);
      v3 += 88;
      v9 -= 88;
    }
    while (v9);
  }
  return result;
}

void ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_2_58(uint64_t a1, uint64_t a2)
{
  v37[6] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *MEMORY[0x263EFFB40];
  uint64_t v6 = *MEMORY[0x263EFFB38];
  if (*(unsigned char *)(a2 + 80)) {
    uint64_t v7 = *MEMORY[0x263EFFB40];
  }
  else {
    uint64_t v7 = *MEMORY[0x263EFFB38];
  }
  v35[0] = @"Active";
  v35[1] = v7;
  if (*(unsigned char *)(a2 + 81)) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v6;
  }
  v35[2] = @"Anomalous";
  v35[3] = v8;
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v36, @"Begin Time", (uint64_t *)(a2 + 64));
  waipc::util::_kv::_kv<unsigned long long const&,void>(v37, @"End Time", (uint64_t *)(a2 + 72));
  (*(void (**)(CFTypeRef *__return_ptr))(*(void *)(a1 + 32) + 16))(&cf);
  v37[2] = @"Begin";
  CFTypeRef v9 = cf;
  if (cf) {
    CFRetain(cf);
  }
  v37[3] = v9;
  (*(void (**)(CFTypeRef *__return_ptr))(*(void *)(a1 + 32) + 16))(&v28);
  v37[4] = @"End";
  CFTypeRef v10 = v28;
  if (v28) {
    CFRetain(v28);
  }
  v37[5] = v10;
  waipc::util::createCFDictDropNull<6l>((uint64_t)v35, (applesauce::CF::DictionaryRef *)&v30);
  unint64_t v11 = v4[7];
  unint64_t v12 = (CFTypeRef *)v4[6];
  if ((unint64_t)v12 >= v11)
  {
    unint64_t v13 = (void *)v4[5];
    uint64_t v14 = v12 - (CFTypeRef *)v13;
    if ((unint64_t)(v14 + 1) >> 61) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v15 = v11 - (void)v13;
    unint64_t v16 = (uint64_t)(v11 - (void)v13) >> 2;
    if (v16 <= v14 + 1) {
      unint64_t v16 = v14 + 1;
    }
    if (v15 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v17 = v16;
    }
    uint64_t v34 = v4 + 7;
    if (v17)
    {
      __int16 v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>((uint64_t)(v4 + 7), v17);
      unint64_t v13 = (void *)v4[5];
      unint64_t v12 = (CFTypeRef *)v4[6];
    }
    else
    {
      __int16 v18 = 0;
    }
    long long v19 = (CFTypeRef *)&v18[8 * v14];
    CFTypeRef v20 = &v18[8 * v17];
    uint64_t v33 = v20;
    CFTypeRef *v19 = v30;
    CFTypeRef v21 = v19 + 1;
    CFTypeRef v30 = 0;
    *((void *)&v32 + 1) = v19 + 1;
    if (v12 != v13)
    {
      do
      {
        uint64_t v22 = *--v12;
        *--long long v19 = v22;
        *unint64_t v12 = 0;
      }
      while (v12 != v13);
      CFTypeRef v21 = (void *)*((void *)&v32 + 1);
      CFTypeRef v20 = v33;
    }
    long long v23 = *(_OWORD *)(v4 + 5);
    v4[5] = v19;
    v4[6] = v21;
    long long v32 = v23;
    CFTypeRef v24 = (char *)v4[7];
    v4[7] = v20;
    uint64_t v33 = v24;
    uint64_t v31 = v23;
    std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)&v31);
    CFTypeRef v25 = v30;
    v4[6] = v21;
    if (v25) {
      CFRelease(v25);
    }
  }
  else
  {
    *unint64_t v12 = v30;
    CFTypeRef v30 = 0;
    v4[6] = v12 + 1;
  }
  for (uint64_t i = 11; i != -1; i -= 2)
  {
    uint64_t v27 = (const void *)v35[i];
    if (v27) {
      CFRelease(v27);
    }
  }
  if (v28) {
    CFRelease(v28);
  }
  if (cf) {
    CFRelease(cf);
  }
}

void sub_226DFA174(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<6l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3 = 0;
  CFIndex v4 = 0;
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  *(_OWORD *)keys = 0u;
  memset(v9, 0, sizeof(v9));
  do
  {
    uint64_t v5 = *(void **)(a1 + v3);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((void *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 96);
  CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)v9, v4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

uint64_t waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::underrunReport,10ul>::for_each<void({block_pointer})(waipc::PCIeAudioLink::underrunReport const&)>(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 960);
  uint64_t v5 = v4 - 10;
  if (v4 != 10 && v4 != *(void *)(result + 968))
  {
    uint64_t v7 = result + 96 * v4;
    do
    {
      __n128 result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v7);
      v7 += 96;
    }
    while (!__CFADD__(v5++, 1));
  }
  if (v4)
  {
    uint64_t v9 = 96 * v4;
    do
    {
      __n128 result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v3);
      v3 += 96;
      v9 -= 96;
    }
    while (v9);
  }
  return result;
}

void ___ZNK5waipc13PCIeAudioLink9dumpStateEv_block_invoke_3_79(uint64_t a1, uint64_t a2)
{
  void v38[6] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *MEMORY[0x263EFFB40];
  uint64_t v6 = *MEMORY[0x263EFFB38];
  if (*(unsigned char *)(a2 + 88)) {
    uint64_t v7 = *MEMORY[0x263EFFB40];
  }
  else {
    uint64_t v7 = *MEMORY[0x263EFFB38];
  }
  v35[0] = @"Active";
  v35[1] = v7;
  if (*(unsigned char *)(a2 + 89)) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v6;
  }
  v35[2] = @"Anomalous";
  v35[3] = v8;
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v36, @"Length", (uint64_t *)(a2 + 80));
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v37, @"Begin Time", (uint64_t *)(a2 + 64));
  waipc::util::_kv::_kv<unsigned long long const&,void>(v38, @"End Time", (uint64_t *)(a2 + 72));
  (*(void (**)(CFTypeRef *__return_ptr))(*(void *)(a1 + 32) + 16))(&cf);
  v38[2] = @"Begin";
  CFTypeRef v9 = cf;
  if (cf) {
    CFRetain(cf);
  }
  v38[3] = v9;
  (*(void (**)(CFTypeRef *__return_ptr))(*(void *)(a1 + 32) + 16))(&v28);
  v38[4] = @"End";
  CFTypeRef v10 = v28;
  if (v28) {
    CFRetain(v28);
  }
  v38[5] = v10;
  waipc::util::createCFDictDropNull<7l>((uint64_t)v35, (applesauce::CF::DictionaryRef *)&v30);
  unint64_t v11 = v4[7];
  long long v12 = (CFTypeRef *)v4[6];
  if ((unint64_t)v12 >= v11)
  {
    uint64_t v13 = (void *)v4[5];
    uint64_t v14 = v12 - (CFTypeRef *)v13;
    if ((unint64_t)(v14 + 1) >> 61) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v15 = v11 - (void)v13;
    unint64_t v16 = (uint64_t)(v11 - (void)v13) >> 2;
    if (v16 <= v14 + 1) {
      unint64_t v16 = v14 + 1;
    }
    if (v15 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v17 = v16;
    }
    uint64_t v34 = v4 + 7;
    if (v17)
    {
      __int16 v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>((uint64_t)(v4 + 7), v17);
      uint64_t v13 = (void *)v4[5];
      long long v12 = (CFTypeRef *)v4[6];
    }
    else
    {
      __int16 v18 = 0;
    }
    long long v19 = (CFTypeRef *)&v18[8 * v14];
    CFTypeRef v20 = &v18[8 * v17];
    uint64_t v33 = v20;
    CFTypeRef *v19 = v30;
    CFTypeRef v21 = v19 + 1;
    CFTypeRef v30 = 0;
    *((void *)&v32 + 1) = v19 + 1;
    if (v12 != v13)
    {
      do
      {
        uint64_t v22 = *--v12;
        *--long long v19 = v22;
        *long long v12 = 0;
      }
      while (v12 != v13);
      CFTypeRef v21 = (void *)*((void *)&v32 + 1);
      CFTypeRef v20 = v33;
    }
    long long v23 = *(_OWORD *)(v4 + 5);
    v4[5] = v19;
    v4[6] = v21;
    long long v32 = v23;
    CFTypeRef v24 = (char *)v4[7];
    v4[7] = v20;
    uint64_t v33 = v24;
    uint64_t v31 = v23;
    std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)&v31);
    CFTypeRef v25 = v30;
    v4[6] = v21;
    if (v25) {
      CFRelease(v25);
    }
  }
  else
  {
    *long long v12 = v30;
    CFTypeRef v30 = 0;
    v4[6] = v12 + 1;
  }
  for (uint64_t i = 13; i != -1; i -= 2)
  {
    uint64_t v27 = (const void *)v35[i];
    if (v27) {
      CFRelease(v27);
    }
  }
  if (v28) {
    CFRelease(v28);
  }
  if (cf) {
    CFRelease(cf);
  }
}

void sub_226DFA64C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<7l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3 = 0;
  CFIndex v4 = 0;
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  *(_OWORD *)keys = 0u;
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  do
  {
    uint64_t v5 = *(void **)(a1 + v3);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((void *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 112);
  CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)v9, v4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<36l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3 = 0;
  CFIndex v4 = 0;
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  *(_OWORD *)keys = 0u;
  long long v11 = 0u;
  memset(v9, 0, sizeof(v9));
  do
  {
    uint64_t v5 = *(void **)(a1 + v3);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((void *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 576);
  CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)v9, v4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

uint64_t *std::unique_ptr<waipc::PCIeAudioLink::stateLogger>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *__n128 result = a2;
  if (v2)
  {
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::~StateStash(v2 + 5776);
    JUMPOUT(0x22A66A9D0);
  }
  return result;
}

uint64_t waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::~StateStash(uint64_t a1)
{
  unint64_t v2 = atomic_exchange((atomic_ullong *volatile)(a1 + 8672), 0);
  if (v2) {
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::putIdle(a1, v2);
  }
  return a1;
}

uint64_t waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::putIdle(uint64_t result, unint64_t a2)
{
  if (!a2) {
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::putIdle();
  }
  uint64_t v2 = a2 - result - 8;
  if (v2 < -2887 || (unint64_t v3 = 0xF99E237502209ED9 * (v2 >> 3), v3 >= 3)) {
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::putIdle();
  }
  if (atomic_exchange((atomic_ullong *volatile)(result + 8 * v3 + 8680), a2)) {
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::putIdle();
  }
  return result;
}

unint64_t waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::takeIdle(uint64_t a1)
{
  unint64_t v1 = 0;
  uint64_t v2 = a1 + 8680;
  do
  {
    unint64_t result = atomic_exchange((atomic_ullong *volatile)(v2 + 8 * v1), 0);
    if (result) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = v1 >= 2;
    }
    ++v1;
  }
  while (!v4);
  if (!result) {
    waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::takeIdle();
  }
  return result;
}

void *waipc::util::_kv::_kv<unsigned short const&,void>(void *a1, uint64_t a2, __int16 *a3)
{
  *a1 = a2;
  __int16 valuePtr = *a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberShortType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x22A66A950](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_226DFAAC0(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

void *waipc::util::_kv::_kv<unsigned long long &,void>(void *a1, uint64_t a2, uint64_t *a3)
{
  *a1 = a2;
  uint64_t valuePtr = *a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x22A66A950](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_226DFAB80(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

void *waipc::util::_kv::_kv<unsigned int &,void>(void *a1, uint64_t a2, int *a3)
{
  *a1 = a2;
  int valuePtr = *a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x22A66A950](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_226DFAC40(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

double waipc::timesync::BasebandConfig::getDefault@<D0>(uint64_t a1@<X8>)
{
  RadioVendor = (waipc::util::TimestampConverter *)TelephonyRadiosGetRadioVendor();
  *(_OWORD *)a1 = xmmword_226E08CE0;
  *(_OWORD *)(a1 + 16) = xmmword_226E08CF0;
  double v4 = 52.0833333;
  if (RadioVendor != 1) {
    double v4 = 1.0;
  }
  *(double *)(a1 + 32) = v4;
  *(double *)(a1 + 40) = waipc::util::TimestampConverter::defaultHostPeriod(RadioVendor);
  *(void *)&double result = 0x200002710;
  *(_OWORD *)(a1 + 48) = xmmword_226E08D00;
  *(unsigned char *)(a1 + 64) = 0;
  return result;
}

uint64_t waipc::timesync::LinearEstimator::LinearEstimator(uint64_t a1, long long *a2, _OWORD *a3)
{
  *(void *)a1 = &unk_26DAF2DC0;
  long long v5 = *a2;
  *(_OWORD *)(a1 + 24) = 0u;
  uint64_t v6 = (char **)(a1 + 24);
  *(_OWORD *)(a1 + 8) = v5;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  std::vector<std::pair<waipc::timesync::Estimator::timestamp,waipc::timesync::Estimator::timestamp>>::reserve((void **)(a1 + 24), *(void *)(a1 + 8));
  CFDictionaryRef v7 = a3 + 1;
  unint64_t v8 = *(void *)(a1 + 40);
  CFTypeRef v9 = *(_OWORD **)(a1 + 32);
  if ((unint64_t)v9 >= v8)
  {
    uint64_t v11 = ((char *)v9 - *v6) >> 5;
    unint64_t v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 59) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v13 = v8 - (void)*v6;
    if (v13 >> 4 > v12) {
      unint64_t v12 = v13 >> 4;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v14 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v12;
    }
    if (v14) {
      long long v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<waipc::timesync::Estimator::timestamp,waipc::timesync::Estimator::timestamp>>>(a1 + 40, v14);
    }
    else {
      long long v15 = 0;
    }
    long long v16 = &v15[32 * v11];
    long long v17 = &v15[32 * v14];
    *(_OWORD *)long long v16 = *a3;
    *((_OWORD *)v16 + 1) = *v7;
    uint64_t v10 = v16 + 32;
    long long v19 = *(char **)(a1 + 24);
    long long v18 = *(char **)(a1 + 32);
    if (v18 != v19)
    {
      do
      {
        long long v20 = *((_OWORD *)v18 - 1);
        *((_OWORD *)v16 - 2) = *((_OWORD *)v18 - 2);
        *((_OWORD *)v16 - 1) = v20;
        v16 -= 32;
        v18 -= 32;
      }
      while (v18 != v19);
      long long v18 = *v6;
    }
    *(void *)(a1 + 24) = v16;
    *(void *)(a1 + 32) = v10;
    *(void *)(a1 + 40) = v17;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    *CFTypeRef v9 = *a3;
    v9[1] = *v7;
    uint64_t v10 = v9 + 2;
  }
  *(void *)(a1 + 32) = v10;
  waipc::timesync::LinearEstimator::updateEstimate((waipc::timesync::LinearEstimator *)a1);
  return a1;
}

void sub_226DFAE34(_Unwind_Exception *exception_object)
{
  double v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 32) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<std::pair<waipc::timesync::Estimator::timestamp,waipc::timesync::Estimator::timestamp>>::reserve(void **a1, unint64_t a2)
{
  double v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 5)
  {
    if (a2 >> 59) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<waipc::timesync::Estimator::timestamp,waipc::timesync::Estimator::timestamp>>>(v3, a2);
    CFDictionaryRef v7 = &v6[v5 & 0xFFFFFFFFFFFFFFE0];
    CFTypeRef v9 = &v6[32 * v8];
    uint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    unint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v12 - 1) = v13;
        v12 -= 32;
        v10 -= 32;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

double waipc::timesync::LinearEstimator::updateEstimate(waipc::timesync::LinearEstimator *this)
{
  uint64_t v2 = *((void *)this + 3);
  uint64_t v1 = *((void *)this + 4);
  double result = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = (double)(unint64_t)((v1 - v2) >> 5);
  if (v1 != v2)
  {
    uint64_t v7 = *((void *)this + 3);
    do
    {
      double v5 = v5 + (double)(*(void *)v7 + vcvtmd_s64_f64(*(double *)(v7 + 8)));
      double v4 = v4 + (double)(*(void *)(v7 + 16) + vcvtmd_s64_f64(*(double *)(v7 + 24)));
      v7 += 32;
    }
    while (v7 != v1);
  }
  unint64_t v8 = (unint64_t)(v5 / v6);
  *((void *)this + 7) = v8;
  *((void *)this + 8) = 0;
  unint64_t v9 = (unint64_t)(v4 / v6);
  *((void *)this + 9) = v9;
  *((void *)this + 10) = 0;
  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  if (v2 != v1)
  {
    double result = 0.0;
    do
    {
      double v13 = *(double *)(v2 + 8) + (double)(uint64_t)(*(void *)v2 - v8);
      double v14 = *(double *)(v2 + 24) + (double)(uint64_t)(*(void *)(v2 + 16) - v9);
      double v12 = v12 + v13;
      double result = result + v14;
      double v10 = v10 + v14 * v14;
      double v11 = v11 + v13 * v14;
      v2 += 32;
    }
    while (v2 != v1);
  }
  double v15 = 1.0 / (v6 * v10 - result * result);
  double v16 = -(result * v15);
  double v17 = v10 * v15 * v12 + 0.0 + v16 * v11;
  double v18 = v16 * v12 + 0.0 + v15 * v6 * v11;
  *((double *)this + 11) = v17 + v12 / v6 - v18 * (result / v6);
  *((double *)this + 12) = v18;
  return result;
}

double waipc::timesync::LinearEstimator::update(waipc::timesync::LinearEstimator *this, _OWORD *a2)
{
  uint64_t v4 = *((void *)this + 3);
  double v5 = (_OWORD *)*((void *)this + 4);
  double v6 = (void **)((char *)this + 24);
  unint64_t v7 = ((uint64_t)v5 - v4) >> 5;
  if (v7 >= *((void *)this + 1))
  {
    double v12 = (_OWORD *)(v4 + 32 * *((void *)this + 6));
    long long v13 = a2[1];
    *double v12 = *a2;
    v12[1] = v13;
    *((void *)this + 6) = (*((void *)this + 6) + 1)
                          % (unint64_t)((uint64_t)(*((void *)this + 4) - *((void *)this + 3)) >> 5);
  }
  else
  {
    unint64_t v8 = a2 + 1;
    unint64_t v9 = (char *)this + 40;
    unint64_t v10 = *((void *)this + 5);
    if ((unint64_t)v5 >= v10)
    {
      unint64_t v14 = v7 + 1;
      if ((v7 + 1) >> 59) {
        std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v15 = v10 - v4;
      if (v15 >> 4 > v14) {
        unint64_t v14 = v15 >> 4;
      }
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v16 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v16 = v14;
      }
      if (v16) {
        double v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<waipc::timesync::Estimator::timestamp,waipc::timesync::Estimator::timestamp>>>((uint64_t)v9, v16);
      }
      else {
        double v17 = 0;
      }
      double v18 = &v17[32 * v7];
      long long v19 = &v17[32 * v16];
      *(_OWORD *)double v18 = *a2;
      *((_OWORD *)v18 + 1) = *v8;
      double v11 = v18 + 32;
      long long v21 = (char *)*((void *)this + 3);
      long long v20 = (char *)*((void *)this + 4);
      if (v20 != v21)
      {
        do
        {
          long long v22 = *((_OWORD *)v20 - 1);
          *((_OWORD *)v18 - 2) = *((_OWORD *)v20 - 2);
          *((_OWORD *)v18 - 1) = v22;
          v18 -= 32;
          v20 -= 32;
        }
        while (v20 != v21);
        long long v20 = (char *)*v6;
      }
      *((void *)this + 3) = v18;
      *((void *)this + 4) = v11;
      *((void *)this + 5) = v19;
      if (v20) {
        operator delete(v20);
      }
    }
    else
    {
      *double v5 = *a2;
      v5[1] = *v8;
      double v11 = v5 + 2;
    }
    *((void *)this + 4) = v11;
  }

  return waipc::timesync::LinearEstimator::updateEstimate(this);
}

uint64_t waipc::timesync::LinearEstimator::deviceToHost(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

double waipc::timesync::LinearEstimator::hostToDevice(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(double *)(a1 + 80)
       + (*(double *)&a3 - *(double *)(a1 + 64) + (double)(a2 - *(void *)(a1 + 56)) - *(double *)(a1 + 88))
       / *(double *)(a1 + 96);
}

char **waipc::timesync::LinearEstimator::dumpState(waipc::timesync::LinearEstimator *this)
{
  v17[5] = *MEMORY[0x263EF8340];
  memset(v7, 0, sizeof(v7));
  long long v10 = *(_OWORD *)((char *)this + 88);
  std::vector<applesauce::CF::NumberRef>::reserve(v7, 2uLL);
  uint64_t v2 = 0;
  unint64_t v9 = v7;
  do
  {
    ___ZNK5waipc8timesync15LinearEstimator9dumpStateEv_block_invoke((CFNumberRef *)&cf, *(double *)((char *)&v10 + v2));
    std::back_insert_iterator<std::vector<applesauce::CF::NumberRef>>::operator=[abi:ne180100](&v9, &cf);
    if (cf) {
      CFRelease(cf);
    }
    v2 += 8;
  }
  while (v2 != 16);
  *(void *)&long long v10 = @"Base";
  *((void *)&v10 + 1) = 0;
  CFTypeRef cf = 0;
  waipc::util::_kv::_kv<unsigned long const&,void>(&v11, @"Limit", (uint64_t *)this + 1);
  waipc::util::_kv::_kv<double const&,void>(&v12, @"Nominal Rate", (uint64_t *)this + 2);
  waipc::util::_kv::_kv<unsigned long const&,void>(&v13, @"Index", (uint64_t *)this + 6);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v14, @"Norm Host Int", (uint64_t *)this + 7);
  waipc::util::_kv::_kv<double const&,void>(&v15, @"Norm Host Frac", (uint64_t *)this + 8);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v16, @"Norm Device Int", (uint64_t *)this + 9);
  waipc::util::_kv::_kv<double const&,void>(v17, @"Norm Device Frac", (uint64_t *)this + 10);
  v17[2] = @"Estimate";
  v17[3] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::NumberRef>((uint64_t **)v7);
  waipc::util::createCFDictDropNull<9l>((uint64_t)&v10, (applesauce::CF::DictionaryRef *)&v9);
  for (uint64_t i = 136; i != -8; i -= 16)
  {
    uint64_t v4 = *(const void **)((char *)&v10 + i);
    if (v4) {
      CFRelease(v4);
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  double v5 = v9;
  *(void *)&long long v10 = v7;
  std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&v10);
  return v5;
}

void sub_226DFB408(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

CFNumberRef ___ZNK5waipc8timesync15LinearEstimator9dumpStateEv_block_invoke@<X0>(CFNumberRef *a1@<X8>, double a2@<D0>)
{
  double valuePtr = a2;
  CFNumberRef result = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  *a1 = result;
  if (!result)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x22A66A950](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return result;
}

void sub_226DFB518(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<applesauce::CF::NumberRef>::reserve(char **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    uint64_t v17 = result;
    double v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(result, a2);
    unint64_t v9 = *a1;
    unint64_t v8 = a1[1];
    if (v8 == *a1)
    {
      int64x2_t v12 = vdupq_n_s64((unint64_t)v8);
      long long v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      long long v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
      do
      {
        uint64_t v11 = *((void *)v8 - 1);
        v8 -= 8;
        *((void *)v10 - 1) = v11;
        v10 -= 8;
        *(void *)unint64_t v8 = 0;
      }
      while (v8 != v9);
      int64x2_t v12 = *(int64x2_t *)a1;
    }
    *a1 = v10;
    a1[1] = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    int64x2_t v15 = v12;
    uint64_t v13 = a1[2];
    a1[2] = &v6[8 * v7];
    uint64_t v16 = v13;
    uint64_t v14 = v12.i64[0];
    return std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer((uint64_t)&v14);
  }
  return result;
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<9l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3 = 0;
  CFIndex v4 = 0;
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  *(_OWORD *)keys = 0u;
  long long v12 = 0u;
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  do
  {
    uint64_t v5 = *(void **)(a1 + v3);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((void *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 144);
  CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)v9, v4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

double waipc::timesync::KalmanEstimator::KalmanEstimator(uint64_t a1, long long *a2, uint64_t a3)
{
  *(void *)a1 = &unk_26DAF2E08;
  long long v3 = *a2;
  *(void *)(a1 + 24) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)a3;
  *(void *)&long long v3 = *(void *)a2;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = v3;
  double result = *(double *)(a3 + 32);
  uint64_t v5 = *((void *)a2 + 1);
  *(double *)(a1 + 80) = result;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = v5;
  return result;
}

{
  long long v3;
  double result;
  uint64_t v5;

  *(void *)a1 = &unk_26DAF2E08;
  long long v3 = *a2;
  *(void *)(a1 + 24) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)a3;
  *(void *)&long long v3 = *(void *)a2;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = v3;
  double result = *(double *)(a3 + 32);
  uint64_t v5 = *((void *)a2 + 1);
  *(double *)(a1 + 80) = result;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = v5;
  return result;
}

long double waipc::timesync::KalmanEstimator::computeEstimate@<D0>(waipc::timesync::KalmanEstimator *this@<X0>, long double a2@<D0>, double *a3@<X8>)
{
  long double v6 = pow(a2, 3.0);
  double v7 = *((double *)this + 8);
  double v8 = *((double *)this + 9);
  *a3 = v7 + 0.0 + a2 * v8;
  a3[1] = v8 + v7 * 0.0 + 0.0;
  double v9 = *((double *)this + 10);
  double v10 = *((double *)this + 11);
  double v11 = *((double *)this + 12);
  double v12 = *((double *)this + 13);
  long double v13 = v9 + 0.0 + a2 * v11;
  long double v14 = v10 + 0.0 + a2 * v12;
  double v15 = v11 + v9 * 0.0 + 0.0;
  double v16 = v12 + v10 * 0.0 + 0.0;
  long double v17 = v13 + 0.0 + v14 * a2;
  long double v18 = v13 * 0.0 + 0.0 + v14;
  long double v19 = v15 + 0.0 + v16 * a2;
  double v20 = v15 * 0.0 + 0.0 + v16;
  double v21 = *((double *)this + 3);
  long double v22 = a2 * a2 * 0.5 * v21;
  a3[2] = v17 + v6 / 3.0 * v21;
  a3[3] = v18 + v22;
  long double result = v20 + v21 * a2;
  a3[4] = v19 + v22;
  a3[5] = result;
  return result;
}

double waipc::timesync::KalmanEstimator::computeGain@<D0>(double *a1@<X0>, double *a2@<X8>, double a3@<D0>)
{
  double v3 = a1[1];
  double v4 = *a1 + 0.0;
  double v5 = a1[2];
  double v6 = a1[3];
  double v7 = v4 + v5 * 0.0 + 0.0 + (v3 + 0.0 + v6 * 0.0) * 0.0 + a3;
  double v8 = (v4 + v3 * 0.0) / v7;
  double v9 = (v5 + 0.0 + v6 * 0.0) / v7;
  *a2 = v8;
  a2[1] = v9;
  double v10 = 0.0 - (v9 + 0.0);
  a2[2] = 1.0 - (v8 + 0.0);
  a2[3] = 0.0 - (v8 * 0.0 + 0.0);
  double result = 1.0 - (v9 * 0.0 + 0.0);
  a2[4] = v10;
  a2[5] = result;
  return result;
}

void waipc::timesync::KalmanEstimator::update(uint64_t a1, uint64_t a2)
{
  double v4 = (_OWORD *)(a2 + 16);
  double v5 = (_OWORD *)(a1 + 32);
  if (waipc::timesync::operator<(a2 + 16, a1 + 32))
  {
    Logger = waipc::logging::getLogger(0);
    if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
    {
      LOWORD(vos_unfair_lock_assert_owner(this + 28) = 0;
      _os_log_impl(&dword_226DEE000, Logger, OS_LOG_TYPE_INFO, "out-of-order time sync measurement", (uint8_t *)&v28, 2u);
    }
  }
  else
  {
    double v7 = *(double *)(a2 + 8) - *(double *)(a1 + 56) + (double)(uint64_t)(*(void *)a2 - *(void *)(a1 + 48));
    waipc::timesync::KalmanEstimator::computeEstimate((waipc::timesync::KalmanEstimator *)a1, *(double *)(a2 + 24) - *(double *)(a1 + 40) + (double)(uint64_t)(*(void *)(a2 + 16) - *(void *)(a1 + 32)), &v28);
    double v8 = *(double *)(a2 + 32);
    double v9 = v8 + v30 + 0.0 + v32 * 0.0 + 0.0 + (v31 + 0.0 + v33 * 0.0) * 0.0;
    double v10 = (v30 + 0.0 + v31 * 0.0) / v9;
    double v11 = (v32 + 0.0 + v33 * 0.0) / v9;
    double v12 = 1.0 - (v10 + 0.0);
    double v13 = 0.0 - (v10 * 0.0 + 0.0);
    double v14 = 0.0 - (v11 + 0.0);
    double v15 = 1.0 - (v11 * 0.0 + 0.0);
    double v16 = v7 - (v28 + 0.0 + v29 * 0.0);
    double v17 = v28 + v10 * v16;
    double v18 = v29 + v11 * v16;
    double v19 = v12 * v30 + 0.0 + v13 * v32;
    double v20 = v12 * v31 + 0.0 + v13 * v33;
    double v21 = v14 * v30 + 0.0 + v15 * v32;
    double v22 = v14 * v31 + 0.0 + v15 * v33;
    double v23 = v19 * v12 + 0.0 + v20 * v13;
    double v24 = v21 * v12 + 0.0 + v22 * v13;
    double v25 = v21 * v14 + 0.0 + v22 * v15;
    double v26 = v8 * v10;
    double v27 = v8 * v11;
    *(double *)(a1 + 64) = v17;
    *(double *)(a1 + 72) = v18;
    *(double *)(a1 + 80) = v26 * v10 + 0.0 + v23;
    *(double *)(a1 + 88) = v26 * v11 + 0.0 + v19 * v14 + 0.0 + v20 * v15;
    *(double *)(a1 + 96) = v27 * v10 + 0.0 + v24;
    *(double *)(a1 + 104) = v27 * v11 + 0.0 + v25;
    *double v5 = *v4;
    *(_OWORD *)(a1 + 48) = *(_OWORD *)a2;
    *(double *)(a1 + 64) = v17 - v7;
  }
}

BOOL waipc::timesync::operator<(uint64_t a1, uint64_t a2)
{
  waipc::timesync::Estimator::timestamp::normalize(a1);
  unint64_t v4 = v3;
  double v6 = v5;
  waipc::timesync::Estimator::timestamp::normalize(a2);
  if (v6 == v8) {
    char v9 = 0;
  }
  else {
    char v9 = -127;
  }
  if (v6 > v8) {
    char v9 = 1;
  }
  if (v6 < v8) {
    char v9 = -1;
  }
  if (v4 < v7) {
    char v10 = -1;
  }
  else {
    char v10 = 1;
  }
  if (v4 != v7) {
    char v9 = v10;
  }
  return v9 != 129 && v9 < 0;
}

uint64_t waipc::timesync::KalmanEstimator::hostToDevice(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

double waipc::timesync::KalmanEstimator::deviceToHost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(double *)(a1 + 64)
       + *(double *)(a1 + 72) * (*(double *)&a3 - *(double *)(a1 + 40) + (double)(a2 - *(void *)(a1 + 32)))
       + *(double *)(a1 + 56);
}

double waipc::timesync::KalmanEstimator::deviceToHostVariance(uint64_t a1, uint64_t a2, uint64_t a3)
{
  waipc::timesync::KalmanEstimator::computeEstimate((waipc::timesync::KalmanEstimator *)a1, *(double *)&a3 - *(double *)(a1 + 40) + (double)(a2 - *(void *)(a1 + 32)), v4);
  return v4[2];
}

CFTypeRef waipc::timesync::KalmanEstimator::dumpState(waipc::timesync::KalmanEstimator *this)
{
  v24[7] = *MEMORY[0x263EF8340];
  memset(v14, 0, sizeof(v14));
  long long v17 = *((_OWORD *)this + 4);
  std::vector<applesauce::CF::NumberRef>::reserve(v14, 2uLL);
  uint64_t v2 = 0;
  v13[0] = v14;
  do
  {
    ___ZNK5waipc8timesync15KalmanEstimator9dumpStateEv_block_invoke((CFNumberRef *)&cf, *(double *)((char *)&v17 + v2));
    std::back_insert_iterator<std::vector<applesauce::CF::NumberRef>>::operator=[abi:ne180100](v13, &cf);
    if (cf) {
      CFRelease(cf);
    }
    v2 += 8;
  }
  while (v2 != 16);
  memset(v13, 0, sizeof(v13));
  long long v3 = *((_OWORD *)this + 6);
  long long v17 = *((_OWORD *)this + 5);
  long long v18 = v3;
  std::vector<applesauce::CF::ArrayRef>::reserve((char **)v13, 2uLL);
  uint64_t v4 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 0x40000000;
  char v10 = ___ZNK5waipc8timesync15KalmanEstimator9dumpStateEv_block_invoke_2;
  double v11 = &unk_2647E8260;
  double v12 = &__block_literal_global_28;
  CFTypeRef cf = v13;
  do
  {
    ((void (*)(CFTypeRef *__return_ptr, void *, char *))v10)(&v15, v9, (char *)&v17 + v4);
    std::back_insert_iterator<std::vector<applesauce::CF::ArrayRef>>::operator=[abi:ne180100]((char ***)&cf, &v15);
    if (v15) {
      CFRelease(v15);
    }
    v4 += 16;
  }
  while (v4 != 32);
  *(void *)&long long v17 = @"Base";
  *((void *)&v17 + 1) = 0;
  CFTypeRef v15 = 0;
  waipc::util::_kv::_kv<double const&,void>(&v18, @"Nominal Rate", (uint64_t *)this + 1);
  waipc::util::_kv::_kv<double const&,void>(&v19, @"Rate Variance", (uint64_t *)this + 2);
  waipc::util::_kv::_kv<double const&,void>(&v20, @"Process Variance", (uint64_t *)this + 3);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v21, @"Base Host Int", (uint64_t *)this + 6);
  waipc::util::_kv::_kv<double const&,void>(&v22, @"Base Host Frac", (uint64_t *)this + 7);
  waipc::util::_kv::_kv<unsigned long long const&,void>(&v23, @"Base Device Int", (uint64_t *)this + 4);
  waipc::util::_kv::_kv<double const&,void>(v24, @"Base Device Frac", (uint64_t *)this + 5);
  void v24[2] = @"Estimate State";
  v24[3] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::NumberRef>((uint64_t **)v14);
  v24[4] = @"Estimate Covariance";
  v24[5] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::ArrayRef>((uint64_t **)v13);
  waipc::util::createCFDictDropNull<10l>((uint64_t)&v17, (applesauce::CF::DictionaryRef *)&cf);
  for (uint64_t i = 152; i != -8; i -= 16)
  {
    double v6 = *(const void **)((char *)&v17 + i);
    if (v6) {
      CFRelease(v6);
    }
  }
  if (v15) {
    CFRelease(v15);
  }
  CFTypeRef v7 = cf;
  *(void *)&long long v17 = v13;
  std::vector<applesauce::CF::ArrayRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
  *(void *)&long long v17 = v14;
  std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
  return v7;
}

void sub_226DFBED0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,char a21,int a22,__int16 a23,char a24,char a25,uint64_t a26)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

CFNumberRef ___ZNK5waipc8timesync15KalmanEstimator9dumpStateEv_block_invoke@<X0>(CFNumberRef *a1@<X8>, double a2@<D0>)
{
  double valuePtr = a2;
  CFNumberRef result = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  *a1 = result;
  if (!result)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x22A66A950](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return result;
}

void sub_226DFC010(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<applesauce::CF::ArrayRef>::reserve(char **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    uint64_t v17 = result;
    double v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(result, a2);
    char v9 = *a1;
    double v8 = a1[1];
    if (v8 == *a1)
    {
      int64x2_t v12 = vdupq_n_s64((unint64_t)v8);
      char v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      char v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
      do
      {
        uint64_t v11 = *((void *)v8 - 1);
        v8 -= 8;
        *((void *)v10 - 1) = v11;
        v10 -= 8;
        *(void *)double v8 = 0;
      }
      while (v8 != v9);
      int64x2_t v12 = *(int64x2_t *)a1;
    }
    *a1 = v10;
    a1[1] = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    int64x2_t v15 = v12;
    double v13 = a1[2];
    a1[2] = &v6[8 * v7];
    double v16 = v13;
    uint64_t v14 = v12.i64[0];
    return std::__split_buffer<applesauce::CF::ArrayRef>::~__split_buffer((uint64_t)&v14);
  }
  return result;
}

void ___ZNK5waipc8timesync15KalmanEstimator9dumpStateEv_block_invoke_2(uint64_t a1@<X0>, uint64_t a2@<X1>, CFArrayRef *a3@<X8>)
{
  memset(v8, 0, sizeof(v8));
  std::vector<applesauce::CF::NumberRef>::reserve(v8, 2uLL);
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)(a1 + 32);
  char v10 = v8;
  do
  {
    (*(void (**)(CFTypeRef *__return_ptr, uint64_t, double))(v7 + 16))(&cf, v7, *(double *)(a2 + v6));
    std::back_insert_iterator<std::vector<applesauce::CF::NumberRef>>::operator=[abi:ne180100](&v10, &cf);
    if (cf) {
      CFRelease(cf);
    }
    v6 += 8;
  }
  while (v6 != 16);
  *a3 = applesauce::CF::details::make_CFArrayRef<applesauce::CF::NumberRef>((uint64_t **)v8);
  uint64_t v11 = v8;
  std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&v11);
}

void sub_226DFC19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void **a14)
{
  a14 = (void **)&a9;
  std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100](&a14);
  _Unwind_Resume(a1);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<10l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3 = 0;
  CFIndex v4 = 0;
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  *(_OWORD *)keys = 0u;
  memset(v9, 0, sizeof(v9));
  do
  {
    uint64_t v5 = *(void **)(a1 + v3);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((void *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 160);
  CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)v9, v4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

double waipc::timesync::KalmanEstimator::fixed@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>)
{
  *(void *)a5 = &unk_26DAF2E08;
  *(double *)(a5 + 8) = a6;
  *(void *)(a5 + 16) = 0;
  *(void *)(a5 + 24) = 0;
  *(void *)(a5 + 32) = a3;
  *(void *)(a5 + 40) = a4;
  *(void *)(a5 + 48) = a1;
  *(void *)(a5 + 56) = a2;
  *(void *)(a5 + 64) = 0;
  *(double *)(a5 + 72) = a6;
  double result = 0.0;
  *(_OWORD *)(a5 + 80) = 0u;
  *(_OWORD *)(a5 + 96) = 0u;
  return result;
}

void waipc::timesync::LinearEstimator::~LinearEstimator(waipc::timesync::LinearEstimator *this)
{
  uint64_t v2 = (void *)*((void *)this + 3);
  if (v2)
  {
    *((void *)this + 4) = v2;
    operator delete(v2);
  }
}

{
  void *v2;
  uint64_t vars8;

  uint64_t v2 = (void *)*((void *)this + 3);
  if (v2)
  {
    *((void *)this + 4) = v2;
    operator delete(v2);
  }

  JUMPOUT(0x22A66A9D0);
}

uint64_t waipc::timesync::LinearEstimator::baseDeviceTime(waipc::timesync::LinearEstimator *this)
{
  return *((void *)this + 9);
}

void waipc::timesync::KalmanEstimator::~KalmanEstimator(waipc::timesync::KalmanEstimator *this)
{
}

uint64_t waipc::timesync::KalmanEstimator::baseDeviceTime(waipc::timesync::KalmanEstimator *this)
{
  return *((void *)this + 4);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<waipc::timesync::Estimator::timestamp,waipc::timesync::Estimator::timestamp>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

void std::__destroy_at[abi:ne180100]<applesauce::CF::NumberRef,0>(const void **a1)
{
  uint64_t v1 = *a1;
  if (v1) {
    CFRelease(v1);
  }
}

void applesauce::CF::NumberRef::~NumberRef(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::CF::NumberRef,0>((const void **)(i - 8));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

char ***std::back_insert_iterator<std::vector<applesauce::CF::NumberRef>>::operator=[abi:ne180100](char ***a1, void *a2)
{
  CFIndex v4 = *a1;
  uint64_t v5 = (*a1)[1];
  uint64_t v6 = *a1;
  unint64_t v9 = (unint64_t)v6[2];
  uint64_t v7 = (uint64_t)(v6 + 2);
  unint64_t v8 = v9;
  if ((unint64_t)v5 >= v9)
  {
    long long v11 = *v4;
    uint64_t v12 = (v5 - *v4) >> 3;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 61) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v14 = v8 - (void)v11;
    if (v14 >> 2 > v13) {
      unint64_t v13 = v14 >> 2;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v13;
    }
    uint64_t v27 = v7;
    if (v15)
    {
      double v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(v7, v15);
      long long v11 = *v4;
      uint64_t v5 = v4[1];
    }
    else
    {
      double v16 = 0;
    }
    uint64_t v17 = &v16[8 * v12];
    long long v18 = &v16[8 * v15];
    double v26 = v18;
    *(void *)uint64_t v17 = *a2;
    *a2 = 0;
    double v25 = v17 + 8;
    if (v5 == v11)
    {
      char v10 = v17 + 8;
    }
    else
    {
      do
      {
        uint64_t v19 = *((void *)v5 - 1);
        v5 -= 8;
        *((void *)v17 - 1) = v19;
        v17 -= 8;
        *(void *)uint64_t v5 = 0;
      }
      while (v5 != v11);
      char v10 = v25;
      long long v18 = v26;
    }
    uint64_t v20 = *v4;
    char *v4 = v17;
    v24[0] = v20;
    v24[1] = v20;
    uint64_t v21 = v4[1];
    v4[1] = v10;
    double v25 = v21;
    uint64_t v22 = v4[2];
    v4[2] = v18;
    double v26 = v22;
    std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer((uint64_t)v24);
  }
  else
  {
    *(void *)uint64_t v5 = *a2;
    char v10 = v5 + 8;
    *a2 = 0;
  }
  v4[1] = v10;
  return a1;
}

void std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (const void **)**a1;
  if (v2)
  {
    CFIndex v4 = (const void **)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
        std::__destroy_at[abi:ne180100]<applesauce::CF::NumberRef,0>(--v4);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

double waipc::timesync::Estimator::timestamp::normalize(uint64_t a1)
{
  long double v1 = *(double *)(a1 + 8);
  double __y = 0.0;
  double v2 = modf(v1, &__y);
  double v3 = 0.0;
  if (v2 < 0.0) {
    double v3 = 1.0;
  }
  return v2 + v3;
}

void std::__destroy_at[abi:ne180100]<applesauce::CF::ArrayRef,0>(const void **a1)
{
  long double v1 = *a1;
  if (v1) {
    CFRelease(v1);
  }
}

void applesauce::CF::ArrayRef::~ArrayRef(const void **this)
{
  long double v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t std::__split_buffer<applesauce::CF::ArrayRef>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::CF::ArrayRef,0>((const void **)(i - 8));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

char ***std::back_insert_iterator<std::vector<applesauce::CF::ArrayRef>>::operator=[abi:ne180100](char ***a1, void *a2)
{
  CFIndex v4 = *a1;
  uint64_t v5 = (*a1)[1];
  uint64_t v6 = *a1;
  unint64_t v9 = (unint64_t)v6[2];
  uint64_t v7 = (uint64_t)(v6 + 2);
  unint64_t v8 = v9;
  if ((unint64_t)v5 >= v9)
  {
    long long v11 = *v4;
    uint64_t v12 = (v5 - *v4) >> 3;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 61) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v14 = v8 - (void)v11;
    if (v14 >> 2 > v13) {
      unint64_t v13 = v14 >> 2;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v13;
    }
    uint64_t v27 = v7;
    if (v15)
    {
      double v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(v7, v15);
      long long v11 = *v4;
      uint64_t v5 = v4[1];
    }
    else
    {
      double v16 = 0;
    }
    uint64_t v17 = &v16[8 * v12];
    long long v18 = &v16[8 * v15];
    double v26 = v18;
    *(void *)uint64_t v17 = *a2;
    *a2 = 0;
    double v25 = v17 + 8;
    if (v5 == v11)
    {
      char v10 = v17 + 8;
    }
    else
    {
      do
      {
        uint64_t v19 = *((void *)v5 - 1);
        v5 -= 8;
        *((void *)v17 - 1) = v19;
        v17 -= 8;
        *(void *)uint64_t v5 = 0;
      }
      while (v5 != v11);
      char v10 = v25;
      long long v18 = v26;
    }
    uint64_t v20 = *v4;
    char *v4 = v17;
    v24[0] = v20;
    v24[1] = v20;
    uint64_t v21 = v4[1];
    v4[1] = v10;
    double v25 = v21;
    uint64_t v22 = v4[2];
    v4[2] = v18;
    double v26 = v22;
    std::__split_buffer<applesauce::CF::ArrayRef>::~__split_buffer((uint64_t)v24);
  }
  else
  {
    *(void *)uint64_t v5 = *a2;
    char v10 = v5 + 8;
    *a2 = 0;
  }
  v4[1] = v10;
  return a1;
}

void std::vector<applesauce::CF::ArrayRef>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  long double v1 = *a1;
  double v2 = (const void **)**a1;
  if (v2)
  {
    CFIndex v4 = (const void **)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
        std::__destroy_at[abi:ne180100]<applesauce::CF::ArrayRef,0>(--v4);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *waipc::util::_kv::_kv<unsigned long const&,void>(void *a1, uint64_t a2, uint64_t *a3)
{
  *a1 = a2;
  uint64_t valuePtr = *a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x22A66A950](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_226DFC99C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<applesauce::CF::NumberRef>(uint64_t **a1)
{
  std::vector<void const*>::vector(__p, a1[1] - *a1);
  double v2 = *a1;
  uint64_t v3 = a1[1];
  if (*a1 != v3)
  {
    CFNumberRef v4 = __p[0];
    do
    {
      uint64_t v5 = *v2++;
      *v4++ = v5;
    }
    while (v2 != v3);
  }
  CFArrayRef CFArray = applesauce::CF::details::make_CFArrayRef<void const*>((uint64_t)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return CFArray;
}

void sub_226DFCA44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<applesauce::CF::ArrayRef>(uint64_t **a1)
{
  std::vector<void const*>::vector(__p, a1[1] - *a1);
  double v2 = *a1;
  uint64_t v3 = a1[1];
  if (*a1 != v3)
  {
    CFNumberRef v4 = __p[0];
    do
    {
      uint64_t v5 = *v2++;
      *v4++ = v5;
    }
    while (v2 != v3);
  }
  CFArrayRef CFArray = applesauce::CF::details::make_CFArrayRef<void const*>((uint64_t)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return CFArray;
}

void sub_226DFCADC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double waipc::util::TimestampConverter::defaultHostPeriod(waipc::util::TimestampConverter *this)
{
  if (waipc::util::TimestampConverter::defaultHostPeriod(void)::sOnce != -1) {
    dispatch_once(&waipc::util::TimestampConverter::defaultHostPeriod(void)::sOnce, &__block_literal_global_0);
  }
  return *(double *)&waipc::util::TimestampConverter::defaultHostPeriod(void)::result;
}

double ___ZN5waipc4util18TimestampConverter17defaultHostPeriodEv_block_invoke()
{
  mach_timebase_info(&info);
  LODWORD(v0) = info.numer;
  LODWORD(v1) = info.denom;
  double result = (double)v0 / (double)v1;
  waipc::util::TimestampConverter::defaultHostPeriod(void)::double result = *(void *)&result;
  return result;
}

void waipc::util::createSerialQueueWithQosAndTarget(waipc::util *this@<X0>, const char *a2@<X1>, NSObject *a3@<X2>, NSObject **a4@<X8>)
{
  unint64_t v8 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a2, 0);
  unint64_t v9 = dispatch_queue_create_with_target_V2((const char *)this, v8, a3);
  char v10 = v9;
  if (v9) {
    dispatch_retain(v9);
  }
  *a4 = v10;

  dispatch_release(v10);
}

char *waipc::util::createStateData(CFPropertyListRef propertyList, const char *a2, CFErrorRef *error, __CFError **a4)
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x263EFFB08], propertyList, kCFPropertyListBinaryFormat_v1_0, 0, error);
  applesauce::CF::DataRef::DataRef((applesauce::CF::DataRef *)&theData, Data);
  if (!theData) {
    return 0;
  }
  CFIndex Length = CFDataGetLength(theData);
  size_t v9 = Length;
  if (Length <= 0x8000)
  {
    uint64_t v12 = (char *)malloc_type_malloc(Length + 200, 0xB8BABC0CuLL);
    long long v11 = v12;
    if (v12)
    {
      *(_DWORD *)uint64_t v12 = 1;
      *((_DWORD *)v12 + 1) = v9;
      *(_OWORD *)(v12 + 8) = 0u;
      *(_OWORD *)(v12 + 24) = 0u;
      *(_OWORD *)(v12 + 40) = 0u;
      *(_OWORD *)(v12 + 56) = 0u;
      *(_OWORD *)(v12 + 72) = 0u;
      *(_OWORD *)(v12 + 88) = 0u;
      *(_OWORD *)(v12 + 104) = 0u;
      *(_OWORD *)(v12 + 120) = 0u;
      *(_OWORD *)(v12 + 152) = 0u;
      *(_OWORD *)(v12 + 168) = 0u;
      *(_OWORD *)(v12 + 184) = 0u;
      *(_OWORD *)(v12 + 136) = 0u;
      strlcpy(v12 + 136, a2, 0x40uLL);
      BytePtr = CFDataGetBytePtr(theData);
      memcpy(v11 + 200, BytePtr, v9);
      goto LABEL_12;
    }
    if (error)
    {
      char v10 = CFErrorCreate(v6, (CFErrorDomain)*MEMORY[0x263EFFC58], -536870211, 0);
      goto LABEL_10;
    }
  }
  else if (error)
  {
    char v10 = CFErrorCreate(v6, (CFErrorDomain)*MEMORY[0x263EFFC58], -536870206, 0);
LABEL_10:
    long long v11 = 0;
    *error = v10;
    goto LABEL_12;
  }
  long long v11 = 0;
LABEL_12:
  if (theData) {
    CFRelease(theData);
  }
  return v11;
}

void sub_226DFCD68(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::DataRef::~DataRef((const void **)va);
  _Unwind_Resume(a1);
}

void applesauce::CF::DataRef::~DataRef(const void **this)
{
  unint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void *waipc::util::NonblockingEventSource::NonblockingEventSource(void *context)
{
  *context = 0;
  context[1] = 0;
  mach_port_name_t name = 0;
  options.8 = 0uLL;
  *(void *)&options.flags = 0x100000033;
  if (!mach_port_construct(*MEMORY[0x263EF8960], &options, (mach_port_context_t)context, &name)) {
    operator new();
  }
  return context;
}

void sub_226DFCFB0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    _Block_release(v3);
  }
  if (*(void *)v1) {
    dispatch_release(*(dispatch_object_t *)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN5waipc4util22NonblockingEventSourceC2EP16dispatch_queue_sU13block_pointerFvjEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  while (1)
  {
    memset(v4, 0, sizeof(v4));
    uint64_t result = mach_msg((mach_msg_header_t *)v4, 258, 0, 0x20u, *(_DWORD *)(a1 + 48), 0, 0);
    if ((result & 0xFFFFC1FF) != 0) {
      break;
    }
    atomic_exchange(*(atomic_uint *volatile *)(a1 + 40), 0);
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
  }
  if ((result & 0xFFFFC1FF) != 0x10004003) {
    ___ZN5waipc4util22NonblockingEventSourceC2EP16dispatch_queue_sU13block_pointerFvjEU13block_pointerFvvE_block_invoke_cold_1(result);
  }
  return result;
}

uint64_t ___ZN5waipc4util22NonblockingEventSourceC2EP16dispatch_queue_sU13block_pointerFvjEU13block_pointerFvvE_block_invoke_2(uint64_t a1)
{
  free(*(void **)(a1 + 40));
  mach_port_destruct(*MEMORY[0x263EF8960], *(_DWORD *)(a1 + 56), -1, *(void *)(a1 + 48));
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

intptr_t ___ZN5waipc4util22NonblockingEventSourceC2EP16dispatch_queue_sU13block_pointerFvjEU13block_pointerFvvE_block_invoke_3(uint64_t a1, unsigned int a2)
{
  intptr_t result = dispatch_source_testcancel(**(dispatch_source_t **)(a1 + 32));
  if (!result)
  {
    atomic_fetch_or(*(atomic_uint *volatile *)(a1 + 40), a2);
    *(void *)&msg.msgh_voucher_port = 0;
    msg.msgh_remote_port = *(_DWORD *)(a1 + 48);
    msg.msgh_local_port = 0;
    *(void *)&msg.msgh_bits = 0x1800000013;
    intptr_t result = mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0);
    if ((result & 0xFFFFC1FF) != 0 && (result & 0xFFFFC1FF) != 0x10000004) {
      ___ZN5waipc4util22NonblockingEventSourceC2EP16dispatch_queue_sU13block_pointerFvjEU13block_pointerFvvE_block_invoke_3_cold_1(result);
    }
  }
  return result;
}

void waipc::util::NonblockingEventSource::~NonblockingEventSource(NSObject **this)
{
  double v2 = *this;
  if (v2) {
    dispatch_source_cancel(v2);
  }
  uint64_t v3 = this[1];
  if (v3) {
    _Block_release(v3);
  }
  if (*this) {
    dispatch_release(*this);
  }
}

void waipc::util::NonblockingEventSource::cancel(NSObject **this)
{
  uint64_t v1 = *this;
  if (v1) {
    dispatch_source_cancel(v1);
  }
}

uint64_t waipc::util::NonblockingEventSource::trigger(waipc::util::NonblockingEventSource *this)
{
  if (!*(void *)this) {
    waipc::util::NonblockingEventSource::trigger();
  }
  uint64_t v1 = *(uint64_t (**)(void))(*((void *)this + 1) + 16);

  return v1();
}

BOOL waipc::util::NonblockingEventSource::operator BOOL(void *a1)
{
  return *a1 != 0;
}

BOOL waipc::util::NonblockingEventSource::testcancel(NSObject **this)
{
  uint64_t v1 = *this;
  if (!v1) {
    waipc::util::NonblockingEventSource::testcancel();
  }
  return dispatch_source_testcancel(v1) != 0;
}

void *waipc::util::GroupErrorTimer::GroupErrorTimer(void *a1, dispatch_object_t object, uint64_t a3, NSObject *a4, void *a5)
{
  *a1 = 0;
  a1[1] = 0;
  if (!object)
  {
    unint64_t v13 = "queue";
    int v14 = 225;
    goto LABEL_10;
  }
  if (!a4)
  {
    unint64_t v13 = "group";
    int v14 = 226;
LABEL_10:
    __assert_rtn("GroupErrorTimer", "Util.cpp", v14, v13);
  }
  int v15 = 0;
  dispatch_retain(object);
  dispatch_object_t v16 = object;
  uint64_t v17 = a3;
  dispatch_retain(a4);
  *(void *)&long long v18 = a4;
  if (a5) {
    a5 = _Block_copy(a5);
  }
  char v20 = 0;
  char v10 = (char *)operator new(0x60uLL);
  *(_OWORD *)(v10 + 8) = 0u;
  *(void *)char v10 = &unk_26DAF2ED0;
  *((_DWORD *)v10 + 6) = 0;
  dispatch_object_t v16 = 0;
  *((void *)v10 + 4) = object;
  *((void *)v10 + 5) = a3;
  *((void *)v10 + 6) = a4;
  *((void *)v10 + 7) = a5;
  long long v18 = 0u;
  long long v19 = 0u;
  *((_OWORD *)v10 + 4) = 0u;
  v10[80] = 0;
  *((void *)v10 + 11) = 0;
  uint64_t v21 = 0;
  long long v11 = (std::__shared_weak_count *)a1[1];
  *a1 = v10 + 24;
  a1[1] = v10;
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  waipc::util::GroupErrorTimer::state::~state((waipc::util::GroupErrorTimer::state *)&v15);
  return a1;
}

void sub_226DFD388(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  waipc::util::GroupErrorTimer::state::~state((waipc::util::GroupErrorTimer::state *)va);
  CFNumberRef v4 = *(std::__shared_weak_count **)(v2 + 8);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  _Unwind_Resume(a1);
}

void waipc::util::GroupErrorTimer::~GroupErrorTimer(os_unfair_lock_t *this)
{
  uint64_t v2 = *this;
  if (*this)
  {
    os_unfair_lock_lock(*this);
    waipc::util::GroupErrorTimer::stopTimer((const os_unfair_lock **)this);
    os_unfair_lock_unlock(v2);
  }
  else
  {
    waipc::util::GroupErrorTimer::stopTimer((const os_unfair_lock **)this);
  }
  uint64_t v3 = (std::__shared_weak_count *)this[1];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void waipc::util::GroupErrorTimer::stopTimer(const os_unfair_lock **a1)
{
  os_unfair_lock_assert_owner(*a1);
  uint64_t v2 = *(NSObject **)&(*a1)[10]._os_unfair_lock_opaque;
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(NSObject **)&(*a1)[10]._os_unfair_lock_opaque;
    *(void *)&(*a1)[10]._os_unfair_lock_opaque = 0;
    if (v3)
    {
      dispatch_release(v3);
    }
  }
}

void waipc::util::GroupErrorTimer::start(os_unfair_lock_t *this, const __CFString *a2)
{
  CFNumberRef v4 = *this;
  if (*this) {
    os_unfair_lock_lock(*this);
  }
  waipc::util::GroupErrorTimer::start_nl((uint64_t)this, a2);
  if (v4)
  {
    os_unfair_lock_unlock(v4);
  }
}

void sub_226DFD4E8(_Unwind_Exception *exception_object)
{
  if (v1) {
    os_unfair_lock_unlock(v1);
  }
  _Unwind_Resume(exception_object);
}

void waipc::util::GroupErrorTimer::start_nl(uint64_t a1, const void *a2)
{
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)a1);
  CFNumberRef v4 = *(const os_unfair_lock **)a1;
  if (*(void *)(*(void *)a1 + 40))
  {
    if (!LOBYTE(v4[14]._os_unfair_lock_opaque))
    {
      LOBYTE(v4[14]._os_unfair_lock_opaque) = 1;
      if (a2) {
        CFRetain(a2);
      }
      applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)v12, a2);
      uint64_t v5 = *(const void **)(*(void *)a1 + 64);
      *(void *)(*(void *)a1 + 64) = v12[0];
      v12[0] = v5;
      if (v5) {
        CFRelease(v5);
      }
    }
  }
  else
  {
    if (a2) {
      CFRetain(a2);
    }
    applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)v12, a2);
    CFAllocatorRef v6 = *(const void **)(*(void *)a1 + 48);
    *(void *)(*(void *)a1 + 48) = v12[0];
    v12[0] = v6;
    if (v6) {
      CFRelease(v6);
    }
    waipc::util::GroupErrorTimer::startTimer(a1);
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3802000000;
    v12[3] = __Block_byref_object_copy__1;
    uint64_t v7 = *(const os_unfair_lock **)a1;
    unint64_t v8 = *(std::__shared_weak_count **)(a1 + 8);
    v12[4] = __Block_byref_object_dispose__1;
    v12[5] = v7;
    unint64_t v13 = v8;
    if (v8)
    {
      atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      uint64_t v7 = *(const os_unfair_lock **)a1;
    }
    size_t v9 = *(NSObject **)&v7[6]._os_unfair_lock_opaque;
    char v10 = *(NSObject **)&v7[2]._os_unfair_lock_opaque;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 0x40000000;
    void v11[2] = ___ZN5waipc4util15GroupErrorTimer8start_nlERKNSt3__110shared_ptrINS1_5stateEEEPK10__CFString_block_invoke;
    void v11[3] = &unk_2647E8318;
    v11[4] = v12;
    dispatch_group_notify(v9, v10, v11);
    _Block_object_dispose(v12, 8);
    if (v13) {
      std::__shared_weak_count::__release_weak(v13);
    }
  }
}

void waipc::util::GroupErrorTimer::startTimer(uint64_t a1)
{
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)a1);
  uint64_t v2 = *(const os_unfair_lock **)a1;
  if (*(void *)(*(void *)a1 + 40)) {
    waipc::util::GroupErrorTimer::startTimer();
  }
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3802000000;
  v17[3] = __Block_byref_object_copy__1;
  v17[4] = __Block_byref_object_dispose__1;
  v17[5] = v2;
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 8);
  long long v18 = v3;
  if (v3)
  {
    atomic_fetch_add_explicit(&v3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    uint64_t v2 = *(const os_unfair_lock **)a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3002000000;
  int v14 = __Block_byref_object_copy__13;
  int v15 = __Block_byref_object_dispose__14;
  dispatch_object_t object = dispatch_source_create(MEMORY[0x263EF8400], 1uLL, 0, *(dispatch_queue_t *)&v2[2]._os_unfair_lock_opaque);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = ___ZN5waipc4util15GroupErrorTimer10startTimerERKNSt3__110shared_ptrINS1_5stateEEE_block_invoke;
  handler[3] = &unk_2647E8340;
  handler[4] = v17;
  handler[5] = &v11;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 0x40000000;
  void v9[2] = ___ZN5waipc4util15GroupErrorTimer10startTimerERKNSt3__110shared_ptrINS1_5stateEEE_block_invoke_2;
  _OWORD v9[3] = &unk_2647E8368;
  _OWORD v9[4] = &v11;
  CFNumberRef v4 = *(const os_unfair_lock **)a1;
  uint64_t v5 = v12[5];
  if (v5) {
    dispatch_retain((dispatch_object_t)v12[5]);
  }
  CFAllocatorRef v6 = *(NSObject **)&v4[10]._os_unfair_lock_opaque;
  *(void *)&v4[10]._os_unfair_lock_opaque = v5;
  if (v6) {
    dispatch_release(v6);
  }
  dispatch_source_set_event_handler(*(dispatch_source_t *)(*(void *)a1 + 40), handler);
  dispatch_source_set_cancel_handler(*(dispatch_source_t *)(*(void *)a1 + 40), v9);
  uint64_t v7 = *(NSObject **)(*(void *)a1 + 40);
  dispatch_time_t v8 = dispatch_time(0, *(void *)(*(void *)a1 + 16));
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, *(void *)(*(void *)a1 + 16));
  dispatch_activate(*(dispatch_object_t *)(*(void *)a1 + 40));
  _Block_object_dispose(&v11, 8);
  if (object) {
    dispatch_release(object);
  }
  _Block_object_dispose(v17, 8);
  if (v18) {
    std::__shared_weak_count::__release_weak(v18);
  }
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZN5waipc4util15GroupErrorTimer8start_nlERKNSt3__110shared_ptrINS1_5stateEEEPK10__CFString_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(std::__shared_weak_count **)(v1 + 48);
  if (v2)
  {
    uint64_t v3 = std::__shared_weak_count::lock(v2);
    v8[1] = (const os_unfair_lock *)v3;
    if (v3)
    {
      CFNumberRef v4 = v3;
      uint64_t v5 = *(void *)(v1 + 40);
      v8[0] = (const os_unfair_lock *)v5;
      if (v5)
      {
        os_unfair_lock_lock((os_unfair_lock_t)v5);
        waipc::util::GroupErrorTimer::stopTimer(v8);
        CFAllocatorRef v6 = *(const void **)(v5 + 48);
        *(void *)(v5 + 48) = 0;
        if (v6) {
          CFRelease(v6);
        }
        if (*(unsigned char *)(v5 + 56))
        {
          *(unsigned char *)(v5 + 56) = 0;
          uint64_t v7 = *(const void **)(v5 + 64);
          *(void *)(v5 + 64) = 0;
          if (*(void *)(v5 + 40)) {
            __assert_rtn("start_nl_block_invoke", "Util.cpp", 288, "!s->source");
          }
          waipc::util::GroupErrorTimer::start_nl(v8, v7);
          if (v7) {
            CFRelease(v7);
          }
        }
        os_unfair_lock_unlock((os_unfair_lock_t)v5);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
}

void sub_226DFDA10(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  os_unfair_lock_unlock(v3);
  std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

void ___ZN5waipc4util15GroupErrorTimer10startTimerERKNSt3__110shared_ptrINS1_5stateEEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(std::__shared_weak_count **)(v2 + 48);
  if (v3)
  {
    CFNumberRef v4 = std::__shared_weak_count::lock(v3);
    v10[1] = (const os_unfair_lock *)v4;
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)(v2 + 40);
      v10[0] = (const os_unfair_lock *)v6;
      if (v6)
      {
        os_unfair_lock_lock((os_unfair_lock_t)v6);
        if (dispatch_source_testcancel(*(dispatch_source_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)))
        {
          os_unfair_lock_unlock((os_unfair_lock_t)v6);
        }
        else
        {
          uint64_t v7 = *(const void **)(v6 + 32);
          if (v7) {
            dispatch_time_t v8 = (void (**)(void *, const void *))_Block_copy(v7);
          }
          else {
            dispatch_time_t v8 = 0;
          }
          size_t v9 = *(const void **)(v6 + 48);
          if (v9) {
            CFRetain(*(CFTypeRef *)(v6 + 48));
          }
          waipc::util::GroupErrorTimer::stopTimer(v10);
          os_unfair_lock_unlock((os_unfair_lock_t)v6);
          if (v8) {
            v8[2](v8, v9);
          }
          if (v9) {
            CFRelease(v9);
          }
          if (v8) {
            _Block_release(v8);
          }
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
}

void sub_226DFDB74(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  _Block_release(v3);
  std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  _Unwind_Resume(a1);
}

void ___ZN5waipc4util15GroupErrorTimer10startTimerERKNSt3__110shared_ptrINS1_5stateEEE_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(NSObject **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
  if (v2) {
    dispatch_release(v2);
  }
}

BOOL waipc::util::GroupErrorTimer::isRunning(os_unfair_lock_t *this)
{
  uint64_t v1 = *this;
  if (*this)
  {
    os_unfair_lock_lock(*this);
    uint64_t v3 = *(void *)&(*this)[10]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v1);
  }
  else
  {
    uint64_t v3 = MEMORY[0x28];
  }
  return v3 != 0;
}

CFTypeRef waipc::util::GroupErrorTimer::copyReason(os_unfair_lock_t *this)
{
  uint64_t v2 = *this;
  os_unfair_lock_lock(*this);
  uint64_t v3 = *(const void **)&(*this)[12]._os_unfair_lock_opaque;
  if (v3) {
    CFTypeRef v4 = CFRetain(v3);
  }
  else {
    CFTypeRef v4 = 0;
  }
  os_unfair_lock_unlock(v2);
  return v4;
}

void sub_226DFDC68(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

applesauce::CF::DataRef *applesauce::CF::DataRef::DataRef(applesauce::CF::DataRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFDataGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x22A66A950](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  return this;
}

void sub_226DFDD04(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

void waipc::util::GroupErrorTimer::state::~state(waipc::util::GroupErrorTimer::state *this)
{
  uint64_t v2 = (const void *)*((void *)this + 8);
  if (v2) {
    CFRelease(v2);
  }
  CFTypeID v3 = (const void *)*((void *)this + 6);
  if (v3) {
    CFRelease(v3);
  }
  CFTypeRef v4 = *((void *)this + 5);
  if (v4) {
    dispatch_release(v4);
  }
  uint64_t v5 = (const void *)*((void *)this + 4);
  if (v5) {
    _Block_release(v5);
  }
  uint64_t v6 = *((void *)this + 3);
  if (v6) {
    dispatch_release(v6);
  }
  uint64_t v7 = *((void *)this + 1);
  if (v7) {
    dispatch_release(v7);
  }
}

void std::__shared_ptr_emplace<waipc::util::GroupErrorTimer::state>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAF2ED0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<waipc::util::GroupErrorTimer::state>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAF2ED0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A66A9D0);
}

void std::__shared_ptr_emplace<waipc::util::GroupErrorTimer::state>::__on_zero_shared(uint64_t a1)
{
}

uint64_t waipc::BlockRing::BlockRing(uint64_t result, unsigned int *a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  *(_DWORD *)intptr_t result = 0;
  *(void *)(result + 8) = a2;
  *(void *)(result + 16) = a3;
  *(void *)(result + 24) = a4;
  *(_DWORD *)(result + 32) = a5;
  unsigned int v5 = atomic_load(a2);
  unsigned int v6 = a5 + a5 * (-a5 / a5) - 1;
  *(_DWORD *)(result + 36) = v5;
  *(_DWORD *)(result + 40) = v6;
  if (!a5) {
    waipc::BlockRing::BlockRing();
  }
  if (a5 > v6 >> 1) {
    waipc::BlockRing::BlockRing();
  }
  return result;
}

uint64_t waipc::BlockRing::getBlock(const os_unfair_lock *this, unsigned int a2)
{
  return *(void *)&this[4]._os_unfair_lock_opaque
       + *(void *)&this[6]._os_unfair_lock_opaque * (a2 % this[8]._os_unfair_lock_opaque);
}

uint64_t waipc::BlockRing::getNextWriteBlock_nl(const os_unfair_lock *this)
{
  os_unfair_lock_assert_owner(this);
  uint32_t os_unfair_lock_opaque = this[9]._os_unfair_lock_opaque;
  os_unfair_lock_assert_owner(this);
  return *(void *)&this[4]._os_unfair_lock_opaque
       + *(void *)&this[6]._os_unfair_lock_opaque * (os_unfair_lock_opaque % this[8]._os_unfair_lock_opaque);
}

uint64_t waipc::BlockRing::getNextWriteBlock(os_unfair_lock_t lock)
{
  if (lock) {
    os_unfair_lock_lock(lock);
  }
  os_unfair_lock_assert_owner(lock);
  uint32_t os_unfair_lock_opaque = lock[9]._os_unfair_lock_opaque;
  os_unfair_lock_assert_owner(lock);
  uint64_t v3 = *(void *)&lock[4]._os_unfair_lock_opaque
     + *(void *)&lock[6]._os_unfair_lock_opaque * (os_unfair_lock_opaque % lock[8]._os_unfair_lock_opaque);
  os_unfair_lock_unlock(lock);
  return v3;
}

void waipc::BlockRing::commitWrite_nl(waipc::BlockRing *this)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)this);
  unsigned int v2 = waipc::BlockRing::addWrapped(this, *((_DWORD *)this + 9), 1u);
  *((_DWORD *)this + 9) = v2;
  atomic_store(v2, *((unsigned int **)this + 1));
}

uint64_t waipc::BlockRing::addWrapped(waipc::BlockRing *this, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = *((_DWORD *)this + 10);
  if (v3 < a2) {
    waipc::BlockRing::addWrapped();
  }
  if (v3 < a3) {
    waipc::BlockRing::addWrapped();
  }
  if (v3 - a3 + 1 < a2) {
    int v4 = ~v3;
  }
  else {
    int v4 = 0;
  }
  return a3 + a2 + v4;
}

void waipc::BlockRing::commitWrite(os_unfair_lock_t lock)
{
  if (lock) {
    os_unfair_lock_lock(lock);
  }
  os_unfair_lock_assert_owner(lock);
  uint32_t v2 = waipc::BlockRing::addWrapped((waipc::BlockRing *)lock, lock[9]._os_unfair_lock_opaque, 1u);
  lock[9]._uint32_t os_unfair_lock_opaque = v2;
  atomic_store(v2, *(unsigned int **)&lock[2]._os_unfair_lock_opaque);

  os_unfair_lock_unlock(lock);
}

void sub_226DFE04C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::BlockRing::writeBlock(os_unfair_lock_t lock, void *a2)
{
  if (lock) {
    os_unfair_lock_lock(lock);
  }
  os_unfair_lock_assert_owner(lock);
  uint32_t os_unfair_lock_opaque = lock[9]._os_unfair_lock_opaque;
  os_unfair_lock_assert_owner(lock);
  memcpy((void *)(*(void *)&lock[4]._os_unfair_lock_opaque+ *(void *)&lock[6]._os_unfair_lock_opaque * (os_unfair_lock_opaque % lock[8]._os_unfair_lock_opaque)), a2, *(void *)&lock[6]._os_unfair_lock_opaque);
  os_unfair_lock_assert_owner(lock);
  uint32_t v5 = waipc::BlockRing::addWrapped((waipc::BlockRing *)lock, lock[9]._os_unfair_lock_opaque, 1u);
  lock[9]._uint32_t os_unfair_lock_opaque = v5;
  atomic_store(v5, *(unsigned int **)&lock[2]._os_unfair_lock_opaque);

  os_unfair_lock_unlock(lock);
}

void sub_226DFE100(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL waipc::BlockRing::readNextBlock(waipc::BlockRing *this, void *a2)
{
  if (this) {
    os_unfair_lock_lock((os_unfair_lock_t)this);
  }
  unsigned int v4 = atomic_load(*((unsigned int **)this + 1));
  BOOL isWrappedLE = waipc::BlockRing::isWrappedLE(this, v4, *((_DWORD *)this + 9));
  if (!isWrappedLE)
  {
    for (unsigned int i = *((_DWORD *)this + 9); ; *((_DWORD *)this + 9) = i)
    {
      os_unfair_lock_assert_owner((const os_unfair_lock *)this);
      memcpy(a2, (const void *)(*((void *)this + 2) + *((void *)this + 3) * (i % *((_DWORD *)this + 8))), *((void *)this + 3));
      unsigned int v7 = atomic_load(*((unsigned int **)this + 1));
      unsigned int v8 = waipc::BlockRing::subWrapped(this, v7, *((_DWORD *)this + 8));
      if (!waipc::BlockRing::isWrappedLE(this, *((_DWORD *)this + 9), v8)) {
        break;
      }
      unsigned int i = waipc::BlockRing::addWrapped(this, v8, 1u);
    }
    *((_DWORD *)this + 9) = waipc::BlockRing::addWrapped(this, *((_DWORD *)this + 9), 1u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)this);
  return !isWrappedLE;
}

void sub_226DFE1FC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL waipc::BlockRing::isWrappedLE(waipc::BlockRing *this, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = *((_DWORD *)this + 10);
  if (v3 < a2) {
    waipc::BlockRing::isWrappedLE();
  }
  if (v3 < a3) {
    waipc::BlockRing::isWrappedLE();
  }
  unsigned int v4 = a3 - a2;
  if (a3 < a2) {
    unsigned int v4 = a3 - a2 + v3 + 1;
  }
  return v4 < v3 >> 1;
}

uint64_t waipc::BlockRing::subWrapped(waipc::BlockRing *this, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = *((_DWORD *)this + 10);
  if (v3 < a2) {
    waipc::BlockRing::subWrapped();
  }
  if (v3 < a3) {
    waipc::BlockRing::subWrapped();
  }
  if (a2 < a3) {
    unsigned int v4 = v3 + 1;
  }
  else {
    unsigned int v4 = 0;
  }
  return a2 - a3 + v4;
}

BOOL waipc::BlockRing::isWrappedGT(waipc::BlockRing *this, unsigned int a2, unsigned int a3)
{
  return !waipc::BlockRing::isWrappedLE(this, a2, a3);
}

BOOL waipc::BlockRing::readLatestBlock(waipc::BlockRing *this, void *a2)
{
  if (this) {
    os_unfair_lock_lock((os_unfair_lock_t)this);
  }
  unsigned int v4 = atomic_load(*((unsigned int **)this + 1));
  BOOL isWrappedLE = waipc::BlockRing::isWrappedLE(this, v4, *((_DWORD *)this + 9));
  if (!isWrappedLE)
  {
    do
    {
      unsigned int v6 = waipc::BlockRing::subWrapped(this, v4, 1u);
      *((_DWORD *)this + 9) = v6;
      os_unfair_lock_assert_owner((const os_unfair_lock *)this);
      memcpy(a2, (const void *)(*((void *)this + 2) + *((void *)this + 3) * (v6 % *((_DWORD *)this + 8))), *((void *)this + 3));
      unsigned int v4 = atomic_load(*((unsigned int **)this + 1));
      unsigned int v7 = waipc::BlockRing::subWrapped(this, v4, *((_DWORD *)this + 8));
    }
    while (waipc::BlockRing::isWrappedLE(this, *((_DWORD *)this + 9), v7));
    *((_DWORD *)this + 9) = waipc::BlockRing::addWrapped(this, *((_DWORD *)this + 9), 1u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)this);
  return !isWrappedLE;
}

void sub_226DFE3B0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL waipc::BlockRing::isWrappedGE(waipc::BlockRing *this, unsigned int a2, unsigned int a3)
{
  return waipc::BlockRing::isWrappedLE(this, a3, a2);
}

BOOL waipc::BlockRing::isWrappedLT(waipc::BlockRing *this, unsigned int a2, unsigned int a3)
{
  return !waipc::BlockRing::isWrappedLE(this, a3, a2);
}

uint64_t waipc::BlockRing::getCurrentIndex(os_unfair_lock_t lock)
{
  if (lock) {
    os_unfair_lock_lock(lock);
  }
  uint64_t os_unfair_lock_opaque = lock[9]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(lock);
  return os_unfair_lock_opaque;
}

uint64_t waipc::BlockRing::getLiveIndex(os_unfair_lock_t lock)
{
  if (lock) {
    os_unfair_lock_lock(lock);
  }
  uint64_t v2 = atomic_load(*(unsigned int **)&lock[2]._os_unfair_lock_opaque);
  os_unfair_lock_unlock(lock);
  return v2;
}

uint64_t waipc::BlockRing::dumpState(waipc::BlockRing *this)
{
  void v11[2] = *MEMORY[0x263EF8340];
  unsigned int v2 = atomic_load(*((unsigned int **)this + 1));
  unsigned int v6 = v2;
  waipc::util::_kv::_kv<unsigned int,void>(v8, @"Live Index", (int *)&v6);
  waipc::util::_kv::_kv<unsigned long const&,void>(&v9, @"Block Size", (uint64_t *)this + 3);
  waipc::util::_kv::_kv<unsigned int const&,void>(&v10, @"Block Count", (int *)this + 8);
  waipc::util::_kv::_kv<unsigned int const&,void>(v11, @"Wrap Index", (int *)this + 10);
  waipc::util::createCFDictDropNull<4l>((uint64_t)v8, (applesauce::CF::DictionaryRef *)&v7);
  for (uint64_t i = 7; i != -1; i -= 2)
  {
    unsigned int v4 = (const void *)v8[i];
    if (v4) {
      CFRelease(v4);
    }
  }
  return v7;
}

void sub_226DFE57C(_Unwind_Exception *a1)
{
  for (uint64_t i = 48; i != -16; i -= 16)
    waipc::util::_kv::~_kv((waipc::util::_kv *)(v1 + i));
  _Unwind_Resume(a1);
}

void *waipc::util::_kv::_kv<unsigned int,void>(void *a1, uint64_t a2, int *a3)
{
  *a1 = a2;
  int valuePtr = *a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x22A66A950](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_226DFE670(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

void NetworkUplinkClock_setTimesyncOverride(uint64_t *a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&sTimesyncOverrideLock);
  unsigned int v2 = timesyncOverrideStorage();
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  uint32_t v5 = (std::__shared_weak_count *)v2[1];
  uint64_t *v2 = v4;
  v2[1] = v3;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&sTimesyncOverrideLock);
}

uint64_t *timesyncOverrideStorage(void)
{
  {
    timesyncOverrideStorage(void)::sInstance = 0;
    unk_26815E4A0 = 0;
  }
  return &timesyncOverrideStorage(void)::sInstance;
}

{
  {
    timesyncOverrideStorage(void)::sInstance = 0;
    unk_26815E4C0 = 0;
  }
  return &timesyncOverrideStorage(void)::sInstance;
}

void NetworkUplinkClock_getTimesyncOverride(uint64_t *a1@<X8>)
{
  os_unfair_lock_lock((os_unfair_lock_t)&sTimesyncOverrideLock);
  unsigned int v2 = timesyncOverrideStorage();
  uint64_t v3 = v2[1];
  *a1 = *v2;
  a1[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&sTimesyncOverrideLock);
}

void waipc::timesync::BasebandService::create()
{
}

void sub_226DFE864(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t waipc::timesync::BasebandService::init(os_unfair_lock *this)
{
  unsigned int v2 = this + 8;
  os_unfair_lock_lock(this + 8);
  waipc::timesync::BasebandService::setupProvider(this);
  os_unfair_lock_unlock(v2);
  return 1;
}

void sub_226DFE8E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t waipc::timesync::BasebandService::BasebandService(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  waipc::util::createSerialQueueWithQosAndTarget((waipc::util *)"com.apple.WirelessIPC.timesync.baseband", (const char *)0x15, a3, (NSObject **)(a1 + 16));
  *(void *)(a1 + 24) = a3;
  if (a3) {
    dispatch_retain(a3);
  }
  *(_DWORD *)(a1 + 32) = 0;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)a2;
  long long v8 = *(_OWORD *)(a2 + 16);
  long long v9 = *(_OWORD *)(a2 + 32);
  long long v10 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 104) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 88) = v10;
  *(_OWORD *)(a1 + 72) = v9;
  *(_OWORD *)(a1 + 56) = v8;
  long long v11 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 1os_unfair_lock_assert_owner(this + 28) = v11;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 0;
  waipc::timesync::KalmanEstimator::fixed(a4, 0, 0, 0, a1 + 160, *(double *)(a2 + 32) / *(double *)(a2 + 40));
  *(unsigned char *)(a1 + 272) = 0;
  CFRetain(@"not started");
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)(a1 + 280), @"not started");
  *(unsigned char *)(a1 + 288) = 1;
  _ZNSt3__115allocate_sharedB8ne180100IN5waipc4util11BroadcasterIFvPKNS1_8timesync16BasebandProvider19timesyncMeasurementEmEE7contextENS_9allocatorISB_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((void *)(a1 + 296));
  _ZNSt3__115allocate_sharedB8ne180100IN5waipc4util11BroadcasterIFvbPK10__CFStringEE7contextENS_9allocatorIS9_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((void *)(a1 + 312));
  _ZNSt3__115allocate_sharedB8ne180100IN5waipc4util11BroadcasterIFvRKNS1_8timesync15KalmanEstimatorEbEE7contextENS_9allocatorISA_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((void *)(a1 + 328));
  *(void *)(a1 + 344) = a1 + 352;
  *(void *)(a1 + 352) = 0;
  *(void *)(a1 + 376) = 0;
  *(void *)(a1 + 384) = 0;
  *(void *)(a1 + 360) = 0;
  *(void *)(a1 + 368) = a1 + 376;
  *(void *)(a1 + 400) = 0;
  *(void *)(a1 + 408) = 0;
  *(void *)(a1 + 392) = 0;
  uint64_t v12 = dispatch_group_create();
  *(void *)(a1 + 416) = v12;
  *(void *)(a1 + 424) = v12;
  if (v12)
  {
    uint64_t v13 = v12;
    dispatch_retain(v12);
    dispatch_group_enter(v13);
    int v14 = *(NSObject **)(a1 + 416);
    *(void *)(a1 + 432) = v14;
    if (v14)
    {
      dispatch_retain(v14);
      dispatch_group_enter(v14);
    }
  }
  else
  {
    *(void *)(a1 + 432) = 0;
  }
  *(_DWORD *)(a1 + 440) = 0;
  return a1;
}

void sub_226DFEA6C(_Unwind_Exception *a1)
{
  uint32_t v5 = (std::__shared_weak_count *)v1[40];
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  unsigned int v6 = (std::__shared_weak_count *)v1[38];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  applesauce::CF::StringRef::~StringRef(v3);
  uint64_t v7 = (std::__shared_weak_count *)v1[19];
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  long long v8 = v1[3];
  if (v8) {
    dispatch_release(v8);
  }
  if (*v2) {
    dispatch_release(*v2);
  }
  long long v9 = (std::__shared_weak_count *)v1[1];
  if (v9) {
    std::__shared_weak_count::__release_weak(v9);
  }
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandService::~BasebandService(const os_unfair_lock *this)
{
  os_unfair_lock_assert_not_owner(this + 8);
  if (LOBYTE(this[68]._os_unfair_lock_opaque))
  {
    if (!*(void *)&this[36]._os_unfair_lock_opaque) {
      __assert_rtn("~BasebandService", "BasebandService.cpp", 76, "fProvider");
    }
    unsigned int v2 = *(waipc::timesync::BasebandService **)&this[86]._os_unfair_lock_opaque;
    if (v2 != (waipc::timesync::BasebandService *)&this[88])
    {
      do
      {
        uint64_t v3 = (std::__shared_weak_count *)*((void *)v2 + 6);
        if (v3)
        {
          uint64_t v4 = *((unsigned __int8 *)v2 + 32);
          uint64_t v5 = *((void *)v2 + 5);
          atomic_fetch_add_explicit(&v3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
          unsigned int v6 = std::__shared_weak_count::lock(v3);
          if (v6)
          {
            uint64_t v7 = v6;
            if (v5)
            {
              (*(void (**)(void, uint64_t, void))(**(void **)&this[36]._os_unfair_lock_opaque + 16))(*(void *)&this[36]._os_unfair_lock_opaque, v4, 0);
              long long v8 = *(NSObject **)(v5 + 56);
              *(void *)(v5 + 56) = 0;
              if (v8)
              {
                dispatch_group_leave(v8);
                dispatch_release(v8);
              }
            }
            std::__shared_weak_count::__release_shared[abi:ne180100](v7);
          }
          std::__shared_weak_count::__release_weak(v3);
        }
        long long v9 = (waipc::timesync::BasebandService *)*((void *)v2 + 1);
        if (v9)
        {
          do
          {
            long long v10 = v9;
            long long v9 = *(waipc::timesync::BasebandService **)v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            long long v10 = (waipc::timesync::BasebandService *)*((void *)v2 + 2);
            BOOL v11 = *(void *)v10 == (void)v2;
            unsigned int v2 = v10;
          }
          while (!v11);
        }
        unsigned int v2 = v10;
      }
      while (v10 != (waipc::timesync::BasebandService *)&this[88]);
    }
    uint64_t v12 = *(char **)&this[92]._os_unfair_lock_opaque;
    uint64_t v13 = (char *)&this[94];
    if (v12 != (char *)&this[94])
    {
      do
      {
        if (!v12[72])
        {
          v12[72] = 1;
          (*(void (**)(void, void))(**(void **)&this[36]._os_unfair_lock_opaque + 32))(*(void *)&this[36]._os_unfair_lock_opaque, v12[32]);
        }
        int v14 = (char *)*((void *)v12 + 1);
        int v15 = v12;
        if (v14)
        {
          do
          {
            dispatch_object_t v16 = v14;
            int v14 = *(char **)v14;
          }
          while (v14);
        }
        else
        {
          do
          {
            dispatch_object_t v16 = (char *)*((void *)v15 + 2);
            BOOL v11 = *(void *)v16 == (void)v15;
            int v15 = v16;
          }
          while (!v11);
        }
        if (v16 == v13) {
          break;
        }
        int v17 = v12[32];
        uint64_t v12 = v16;
        while (v12[32] == v17)
        {
          long long v18 = (char *)*((void *)v12 + 1);
          if (v18)
          {
            do
            {
              long long v19 = v18;
              long long v18 = *(char **)v18;
            }
            while (v18);
          }
          else
          {
            do
            {
              long long v19 = (char *)*((void *)v12 + 2);
              BOOL v11 = *(void *)v19 == (void)v12;
              uint64_t v12 = v19;
            }
            while (!v11);
          }
          uint64_t v12 = v19;
          if (v19 == v13) {
            goto LABEL_36;
          }
        }
      }
      while (v12 != v13);
    }
  }
LABEL_36:
  char v20 = *(NSObject **)&this[108]._os_unfair_lock_opaque;
  if (v20)
  {
    dispatch_group_leave(v20);
    uint64_t v21 = *(NSObject **)&this[108]._os_unfair_lock_opaque;
    if (v21) {
      dispatch_release(v21);
    }
  }
  uint64_t v22 = *(NSObject **)&this[106]._os_unfair_lock_opaque;
  if (v22)
  {
    dispatch_group_leave(v22);
    uint64_t v23 = *(NSObject **)&this[106]._os_unfair_lock_opaque;
    if (v23) {
      dispatch_release(v23);
    }
  }
  double v24 = *(NSObject **)&this[104]._os_unfair_lock_opaque;
  if (v24) {
    dispatch_release(v24);
  }
  double v25 = *(void **)&this[98]._os_unfair_lock_opaque;
  if (v25)
  {
    *(void *)&this[100]._uint64_t os_unfair_lock_opaque = v25;
    operator delete(v25);
  }
  std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::destroy((uint64_t)&this[92], *(void **)&this[94]._os_unfair_lock_opaque);
  std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::destroy((uint64_t)&this[86], *(void **)&this[88]._os_unfair_lock_opaque);
  double v26 = *(std::__shared_weak_count **)&this[84]._os_unfair_lock_opaque;
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
  uint64_t v27 = *(std::__shared_weak_count **)&this[80]._os_unfair_lock_opaque;
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
  double v28 = *(std::__shared_weak_count **)&this[76]._os_unfair_lock_opaque;
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
  }
  double v29 = *(const void **)&this[70]._os_unfair_lock_opaque;
  if (v29) {
    CFRelease(v29);
  }
  double v30 = *(std::__shared_weak_count **)&this[38]._os_unfair_lock_opaque;
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  double v31 = *(NSObject **)&this[6]._os_unfair_lock_opaque;
  if (v31) {
    dispatch_release(v31);
  }
  double v32 = *(NSObject **)&this[4]._os_unfair_lock_opaque;
  if (v32) {
    dispatch_release(v32);
  }
  double v33 = *(std::__shared_weak_count **)&this[2]._os_unfair_lock_opaque;
  if (v33) {
    std::__shared_weak_count::__release_weak(v33);
  }
}

void applesauce::dispatch::v1::group_session::~group_session(dispatch_object_t *this)
{
  unsigned int v2 = *this;
  if (v2)
  {
    dispatch_group_leave(v2);
    if (*this) {
      dispatch_release(*this);
    }
  }
}

uint64_t waipc::timesync::BasebandService::setupProvider(os_unfair_lock *this)
{
  os_unfair_lock_assert_owner(this + 8);
  if (*(void *)&this[36]._os_unfair_lock_opaque) {
    waipc::timesync::BasebandService::setupProvider();
  }
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3802000000;
  v13[3] = __Block_byref_object_copy__2;
  v13[4] = __Block_byref_object_dispose__2;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v11, this);
  unsigned int v2 = v12;
  v13[5] = v11;
  int v14 = v12;
  if (v12)
  {
    atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 0x40000000;
  _WORD v10[2] = ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke;
  void v10[3] = &unk_2647E8390;
  v10[4] = v13;
  v10[5] = this;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 0x40000000;
  void v9[2] = ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_2;
  _OWORD v9[3] = &unk_2647E83B8;
  _OWORD v9[4] = v13;
  void v9[5] = this;
  v7[5] = this;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  void v8[2] = ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_10;
  void v8[3] = &unk_2647E83E0;
  v8[4] = v13;
  v8[5] = this;
  v6[5] = this;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 0x40000000;
  void v7[2] = ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_2_15;
  v7[3] = &unk_2647E8408;
  v7[4] = v13;
  v5[10] = this;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 0x40000000;
  void v6[2] = ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_3;
  v6[3] = &unk_2647E8430;
  v6[4] = v13;
  uint64_t v3 = *(NSObject **)&this[4]._os_unfair_lock_opaque;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  _DWORD v5[2] = ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_4;
  v5[3] = &unk_2647E8458;
  v5[4] = v10;
  v5[5] = v9;
  v5[6] = v8;
  v5[7] = v7;
  v5[8] = v6;
  v5[9] = v13;
  dispatch_async(v3, v5);
  _Block_object_dispose(v13, 8);
  if (v14) {
    std::__shared_weak_count::__release_weak(v14);
  }
  return 1;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  Logger = waipc::logging::getLogger(1u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226DEE000, Logger, OS_LOG_TYPE_INFO, "provider connected", buf, 2u);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(std::__shared_weak_count **)(v4 + 48);
  if (v5)
  {
    unsigned int v6 = std::__shared_weak_count::lock(v5);
    if (v6)
    {
      uint64_t v7 = v6;
      if (*(void *)(v4 + 40))
      {
        os_unfair_lock_lock((os_unfair_lock_t)(v2 + 32));
        if (*(void *)(v2 + 144))
        {
          if (!*(unsigned char *)(v2 + 272))
          {
            *(unsigned char *)(v2 + 272) = 1;
            long long v8 = *(const void **)(v2 + 280);
            *(void *)(v2 + 280) = 0;
            if (v8) {
              CFRelease(v8);
            }
            long long v9 = *(NSObject **)(v2 + 424);
            *(void *)(v2 + 424) = 0;
            long long v10 = *(void **)(v2 + 344);
            if (v10 != (void *)(v2 + 352))
            {
              do
              {
                uint64_t v11 = *((unsigned __int8 *)v10 + 32);
                uint64_t v12 = (std::__shared_weak_count *)v10[6];
                if (v12)
                {
                  uint64_t v13 = v10[5];
                  atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
                  int v14 = std::__shared_weak_count::lock(v12);
                  if (v14) {
                    uint64_t v15 = v13;
                  }
                  else {
                    uint64_t v15 = 0;
                  }
                }
                else
                {
                  uint64_t v15 = 0;
                  int v14 = 0;
                }
                (*(void (**)(void, uint64_t, BOOL))(**(void **)(v2 + 144) + 16))(*(void *)(v2 + 144), v11, v15 != 0);
                if (v14) {
                  std::__shared_weak_count::__release_shared[abi:ne180100](v14);
                }
                if (v12) {
                  std::__shared_weak_count::__release_weak(v12);
                }
                dispatch_object_t v16 = (void *)v10[1];
                if (v16)
                {
                  do
                  {
                    int v17 = v16;
                    dispatch_object_t v16 = (void *)*v16;
                  }
                  while (v16);
                }
                else
                {
                  do
                  {
                    int v17 = (void *)v10[2];
                    BOOL v18 = *v17 == (void)v10;
                    long long v10 = v17;
                  }
                  while (!v18);
                }
                long long v10 = v17;
              }
              while (v17 != (void *)(v2 + 352));
            }
            long long v19 = *(void **)(v2 + 368);
            char v20 = (void *)(v2 + 376);
            while (v19 != v20)
            {
              if (*((unsigned char *)v19 + 72)) {
                __assert_rtn("setupProvider_block_invoke", "BasebandService.cpp", 158, "!info.awaitingRemoval");
              }
              (*(void (**)(void, void, void, void))(**(void **)(v2 + 144) + 24))(*(void *)(v2 + 144), *((unsigned __int8 *)v19 + 32), v19[5], v19[7]);
              uint64_t v21 = (void *)v19[1];
              uint64_t v22 = v19;
              if (v21)
              {
                do
                {
                  uint64_t v23 = v21;
                  uint64_t v21 = (void *)*v21;
                }
                while (v21);
              }
              else
              {
                do
                {
                  uint64_t v23 = (void *)v22[2];
                  BOOL v18 = *v23 == (void)v22;
                  uint64_t v22 = v23;
                }
                while (!v18);
              }
              if (v23 == v20) {
                break;
              }
              int v24 = *((unsigned __int8 *)v19 + 32);
              long long v19 = v23;
              while (*((unsigned __int8 *)v19 + 32) == v24)
              {
                double v25 = (void *)v19[1];
                if (v25)
                {
                  do
                  {
                    double v26 = v25;
                    double v25 = (void *)*v25;
                  }
                  while (v25);
                }
                else
                {
                  do
                  {
                    double v26 = (void *)v19[2];
                    BOOL v18 = *v26 == (void)v19;
                    long long v19 = v26;
                  }
                  while (!v18);
                }
                long long v19 = v26;
                if (v26 == v20) {
                  goto LABEL_43;
                }
              }
            }
LABEL_43:
            if (waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::hasObservers(*(void *)(v2 + 328))) {
              waipc::timesync::BasebandProvider::triggerTimesyncMeasurement(*(const os_unfair_lock **)(v2 + 144));
            }
            os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
            waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::broadcast<BOOL,decltype(nullptr)>(*(void *)(v2 + 312), 1);
            if (v9)
            {
              dispatch_group_leave(v9);
              dispatch_release(v9);
            }
            goto LABEL_47;
          }
          uint64_t v27 = "!fConnected";
          int v28 = 140;
        }
        else
        {
          uint64_t v27 = "fProvider";
          int v28 = 139;
        }
        __assert_rtn("setupProvider_block_invoke", "BasebandService.cpp", v28, v27);
      }
LABEL_47:
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
}

void sub_226DFF3EC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::dispatch::v1::group_session::~group_session((dispatch_object_t *)va);
  std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_2(uint64_t a1, const void *a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  Logger = waipc::logging::getLogger(1u);
  if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226DEE000, Logger, OS_LOG_TYPE_INFO, " provider disconnectedBlock", buf, 2u);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(std::__shared_weak_count **)(v6 + 48);
  if (v7)
  {
    long long v8 = std::__shared_weak_count::lock(v7);
    if (v8)
    {
      long long v9 = v8;
      if (*(void *)(v6 + 40))
      {
        os_unfair_lock_lock((os_unfair_lock_t)(v4 + 32));
        *(unsigned char *)(v4 + 272) = 0;
        if (a2) {
          CFRetain(a2);
        }
        uint64_t v36 = v9;
        applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v37, a2);
        long long v10 = *(const void **)(v4 + 280);
        *(void *)(v4 + 280) = v37;
        uint64_t v37 = v10;
        if (v10) {
          CFRelease(v10);
        }
        uint64_t v11 = *(NSObject **)(v4 + 416);
        if (v11)
        {
          dispatch_retain(*(dispatch_object_t *)(v4 + 416));
          dispatch_group_enter(v11);
        }
        uint64_t v12 = *(NSObject **)(v4 + 424);
        *(void *)(v4 + 424) = v11;
        if (v12)
        {
          dispatch_group_leave(v12);
          dispatch_release(v12);
        }
        *(unsigned char *)(v4 + 288) = 1;
        uint64_t v13 = *(NSObject **)(v4 + 416);
        if (v13)
        {
          dispatch_retain(*(dispatch_object_t *)(v4 + 416));
          dispatch_group_enter(v13);
        }
        int v14 = *(NSObject **)(v4 + 432);
        *(void *)(v4 + 432) = v13;
        if (v14)
        {
          dispatch_group_leave(v14);
          dispatch_release(v14);
        }
        uint64_t v15 = *(void **)(v4 + 344);
        if (v15 != (void *)(v4 + 352))
        {
          while (1)
          {
            dispatch_object_t v16 = (std::__shared_weak_count *)v15[6];
            if (v16) {
              break;
            }
LABEL_29:
            uint64_t v22 = (void *)v15[1];
            if (v22)
            {
              do
              {
                uint64_t v23 = v22;
                uint64_t v22 = (void *)*v22;
              }
              while (v22);
            }
            else
            {
              do
              {
                uint64_t v23 = (void *)v15[2];
                BOOL v24 = *v23 == (void)v15;
                uint64_t v15 = v23;
              }
              while (!v24);
            }
            uint64_t v15 = v23;
            if (v23 == (void *)(v4 + 352)) {
              goto LABEL_38;
            }
          }
          uint64_t v17 = v15[5];
          atomic_fetch_add_explicit(&v16->__shared_weak_owners_, 1uLL, memory_order_relaxed);
          BOOL v18 = std::__shared_weak_count::lock(v16);
          if (!v18)
          {
LABEL_28:
            std::__shared_weak_count::__release_weak(v16);
            goto LABEL_29;
          }
          long long v19 = v18;
          if (v17)
          {
            *(unsigned char *)uint64_t v17 = 0;
            if (*(unsigned char *)(v17 + 64))
            {
              char v20 = *(NSObject **)(v4 + 416);
              if (v20)
              {
                dispatch_retain(*(dispatch_object_t *)(v4 + 416));
                dispatch_group_enter(v20);
              }
              uint64_t v21 = *(NSObject **)(v17 + 56);
              *(void *)(v17 + 56) = v20;
              if (!v21) {
                goto LABEL_27;
              }
            }
            else
            {
              uint64_t v21 = *(NSObject **)(v17 + 56);
              *(void *)(v17 + 56) = 0;
              if (!v21) {
                goto LABEL_27;
              }
            }
            dispatch_group_leave(v21);
            dispatch_release(v21);
          }
LABEL_27:
          std::__shared_weak_count::__release_shared[abi:ne180100](v19);
          goto LABEL_28;
        }
LABEL_38:
        double v25 = *(uint64_t **)(v4 + 368);
        double v26 = (uint64_t *)(v4 + 376);
        while (v25 != v26)
        {
          uint64_t v27 = v25;
          int v28 = (uint64_t *)v25[1];
          double v29 = v25;
          if (v28)
          {
            do
            {
              double v30 = v28;
              int v28 = (uint64_t *)*v28;
            }
            while (v28);
          }
          else
          {
            do
            {
              double v30 = (uint64_t *)v29[2];
              BOOL v24 = *v30 == (void)v29;
              double v29 = v30;
            }
            while (!v24);
          }
          double v25 = (uint64_t *)(v4 + 376);
          if (v30 != v26)
          {
            while (*((unsigned __int8 *)v30 + 32) == *((unsigned __int8 *)v27 + 32))
            {
              double v31 = (uint64_t *)v30[1];
              if (v31)
              {
                do
                {
                  double v32 = v31;
                  double v31 = (uint64_t *)*v31;
                }
                while (v31);
              }
              else
              {
                do
                {
                  double v32 = (uint64_t *)v30[2];
                  BOOL v24 = *v32 == (void)v30;
                  double v30 = v32;
                }
                while (!v24);
              }
              double v30 = v32;
              if (v32 == v26)
              {
                double v25 = (uint64_t *)(v4 + 376);
                goto LABEL_54;
              }
            }
            double v25 = v30;
          }
LABEL_54:
          if (*((unsigned char *)v27 + 72))
          {
            std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__remove_node_pointer((uint64_t **)(v4 + 368), v27);
            std::__destroy_at[abi:ne180100]<std::pair<waipc::timesync::BasebandProvider::bufferId const,waipc::timesync::BasebandService::bufferInfo>,0>((uint64_t)(v27 + 4));
            operator delete(v27);
          }
          else
          {
            double v33 = *(NSObject **)(v4 + 416);
            if (v33)
            {
              dispatch_retain(*(dispatch_object_t *)(v4 + 416));
              dispatch_group_enter(v33);
            }
            uint64_t v34 = v27[8];
            v27[8] = (uint64_t)v33;
            if (v34)
            {
              dispatch_group_leave(v34);
              dispatch_release(v34);
            }
          }
        }
        unint64_t v35 = *(std::__shared_weak_count **)(v4 + 152);
        *(void *)(v4 + 144) = 0;
        *(void *)(v4 + 152) = 0;
        if (v35) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v35);
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 32));
        long long v9 = v36;
        waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::broadcast<BOOL,__CFString const*>(*(void *)(v4 + 312), 0, (uint64_t)a2);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
}

void sub_226DFF7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11)
{
}

void ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  if (!*(void *)(v3 + 48)) {
    return;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(v3 + 48));
  if (!v7) {
    return;
  }
  long long v8 = v7;
  if (!*(void *)(v3 + 40)) {
    goto LABEL_23;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 32));
  if (!a3) {
    __assert_rtn("setupProvider_block_invoke", "BasebandService.cpp", 251, "count > 0");
  }
  char v35 = 0;
  long long v9 = (_OWORD *)(v6 + 168);
  uint64_t v33 = a2;
  uint64_t v34 = a3;
  do
  {
    memset(v36, 0, sizeof(v36));
    waipc::timesync::BasebandService::timesyncMeasurementAdapter::measurementFrom((double *)(v6 + 112), a2, (uint64_t)v36);
    if (*(unsigned char *)(v6 + 288)) {
      goto LABEL_12;
    }
    *(_OWORD *)buf = *(_OWORD *)(v6 + 192);
    if (waipc::timesync::operator<((uint64_t)&v36[16], (uint64_t)buf))
    {
      Logger = waipc::logging::getLogger(1u);
      if (os_log_type_enabled(Logger, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v11 = *(void *)(v6 + 192) + vcvtmd_s64_f64(*(double *)(v6 + 200));
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = *(void *)&v36[16] + vcvtmd_s64_f64(*(double *)&v36[24]);
        _os_log_impl(&dword_226DEE000, Logger, OS_LOG_TYPE_DEFAULT, "out-of-order time sync measurement prev=%llu new=%llu", buf, 0x16u);
      }
      *(unsigned char *)(v6 + 288) = 1;
LABEL_12:
      double v12 = *(double *)(v6 + 128);
      double v13 = v12 / *(double *)(v6 + 136) * (v12 / *(double *)(v6 + 136));
      double v14 = *(double *)(v6 + 48);
      double v15 = *(double *)(v6 + 40) * v13;
      *(double *)&long long v42 = v12 / *(double *)(v6 + 136);
      *((double *)&v42 + 1) = v15;
      double v43 = v13 * v14 / (1.0 / v12 * 1000000000.0);
      waipc::timesync::KalmanEstimator::KalmanEstimator((uint64_t)buf, &v42, (uint64_t)v36);
      long long v16 = v48;
      *(_OWORD *)(v6 + 232) = v47;
      *(_OWORD *)(v6 + 248) = v16;
      *(void *)(v6 + 264) = v49;
      long long v17 = *(_OWORD *)v45;
      *long long v9 = *(_OWORD *)&buf[8];
      *(_OWORD *)(v6 + 184) = v17;
      long long v18 = v46;
      *(_OWORD *)(v6 + 200) = *(_OWORD *)&v45[16];
      *(_OWORD *)(v6 + 216) = v18;
      waipc::timesync::BasebandService::logEstimator((waipc::timesync::BasebandService *)v6, (const waipc::timesync::KalmanEstimator *)(v6 + 160));
      *(unsigned char *)(v6 + 288) = 0;
      char v35 = 1;
      goto LABEL_13;
    }
    if (*(unsigned char *)(v6 + 288)) {
      goto LABEL_12;
    }
    waipc::timesync::KalmanEstimator::deviceToHost(v6 + 160, *(uint64_t *)&v36[16], *(uint64_t *)&v36[24]);
    uint64_t v20 = v19;
    double v22 = v21;
    long long v23 = *(_OWORD *)v36;
    double v24 = waipc::timesync::KalmanEstimator::deviceToHostVariance(v6 + 160, *(uint64_t *)&v36[16], *(uint64_t *)&v36[24]);
    double v25 = v22;
    double v26 = sqrt(v24 + *(double *)&v36[32]) * 3.0;
    if (fabs(v22 - *((double *)&v23 + 1) + (double)(v20 - v23)) >= v26)
    {
      uint64_t v27 = waipc::logging::getLogger(1u);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        *(void *)&uint8_t buf[4] = *(void *)&v36[16] + vcvtmd_s64_f64(*(double *)&v36[24]);
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = *(void *)v36 + vcvtmd_s64_f64(*(double *)&v36[8]);
        *(_WORD *)&buf[22] = 2048;
        *(void *)uint64_t v45 = v20 + vcvtmd_s64_f64(v25);
        *(_WORD *)&v45[8] = 2048;
        *(double *)&v45[10] = v26;
        _os_log_impl(&dword_226DEE000, v27, OS_LOG_TYPE_DEFAULT, "rejected outlier time sync measurement device=%llu host=%llu expectedHost=%llu limit=%lf", buf, 0x2Au);
      }
      ++*(_DWORD *)(v6 + 440);
    }
    else
    {
      waipc::timesync::KalmanEstimator::update(v6 + 160, (uint64_t)v36);
      waipc::timesync::BasebandService::logEstimator((waipc::timesync::BasebandService *)v6, (const waipc::timesync::KalmanEstimator *)(v6 + 160));
    }
LABEL_13:
    a2 += 40;
    --a3;
  }
  while (a3);
  if (*(unsigned char *)(v6 + 288)) {
    __assert_rtn("setupProvider_block_invoke", "BasebandService.cpp", 299, "!fReset");
  }
  *(void *)&long long v42 = *(void *)(v6 + 432);
  int v28 = v42;
  *(void *)(v6 + 432) = 0;
  long long v29 = *(_OWORD *)(v6 + 200);
  long long v38 = *(_OWORD *)(v6 + 216);
  long long v30 = *(_OWORD *)(v6 + 248);
  long long v39 = *(_OWORD *)(v6 + 232);
  long long v40 = v30;
  long long v31 = *(_OWORD *)(v6 + 184);
  *(_OWORD *)&v36[8] = *v9;
  *(_OWORD *)&v36[24] = v31;
  *(void *)uint64_t v36 = &unk_26DAF2E08;
  uint64_t v41 = *(void *)(v6 + 264);
  long long v37 = v29;
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 32));
  waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context::broadcast<waipc::timesync::BasebandProvider::timesyncMeasurement*,unsigned long>(*(void *)(v6 + 296), v33, v34);
  uint64_t v32 = *(void *)(v6 + 328);
  long long v46 = v38;
  long long v47 = v39;
  long long v48 = v40;
  *(_OWORD *)&uint8_t buf[8] = *(_OWORD *)&v36[8];
  *(_OWORD *)uint64_t v45 = *(_OWORD *)&v36[24];
  *(void *)buf = &unk_26DAF2E08;
  uint64_t v49 = v41;
  *(_OWORD *)&v45[16] = v37;
  waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::broadcast<waipc::timesync::KalmanEstimator,BOOL>(v32, (uint64_t)buf, v35 & 1);
  if (v28)
  {
    dispatch_group_leave(v28);
    dispatch_release(v28);
  }
LABEL_23:
  std::__shared_weak_count::__release_shared[abi:ne180100](v8);
}

void sub_226DFFCF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,dispatch_object_t a48)
{
}

long double waipc::timesync::BasebandService::timesyncMeasurementAdapter::measurementFrom@<D0>(double *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 + 8);
  long double v7 = (double)*(unint64_t *)(a2 + 16);
  double v8 = 0.5;
  double v9 = v7 * 0.5 + 0.5;
  double v10 = a1[1];
  double v11 = v10 * pow(v7, (double)2) / (double)4;
  double v12 = a1[2];
  double v13 = *(double *)(a2 + 32) / v12;
  double v14 = (double)1;
  if (v13 == (double)1)
  {
    unint64_t v15 = *(void *)(a2 + 24);
  }
  else
  {
    feclearexcept(159);
    long double v16 = (double)*(unint64_t *)(a2 + 24);
    errIfInexact(v16);
    double v18 = (double)0 + v17;
    feclearexcept(159);
    long double v19 = v16 * v13;
    errIfInexact(v19);
    double v21 = (double)0 + v20;
    double __y = 0.0;
    long double v22 = modf(v19, &__y);
    unint64_t v15 = (unint64_t)__y;
    double v8 = v22 + v13 / (double)2;
    double v14 = v21 + ((double)1 + v18) * v13;
    double v12 = a1[2];
  }
  long double v23 = pow(v14, (double)2);
  double v24 = a1[3];
  long double v25 = v12 / v24 * (v12 / v24) * (v23 / (double)12);
  double v26 = 1.0 / v24 * (1.0 / v24) * *a1 + v11;
  *(void *)a3 = v6;
  *(double *)(a3 + 8) = v9;
  *(void *)(a3 + 16) = v15;
  long double result = v26 + v25;
  *(double *)(a3 + 24) = v8;
  *(long double *)(a3 + 32) = result;
  return result;
}

void waipc::timesync::BasebandService::logEstimator(waipc::timesync::BasebandService *this, const waipc::timesync::KalmanEstimator *a2)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)this + 8);
  if (*((unsigned char *)this + 104))
  {
    uint64_t v4 = *((void *)this + 49);
    if (0xEEEEEEEEEEEEEEEFLL * ((*((void *)this + 50) - v4) >> 3) - 20 <= 0xFFFFFFFFFFFFFFEALL) {
      std::vector<std::pair<unsigned long long,waipc::timesync::KalmanEstimator>>::erase((uint64_t)this + 392, v4, v4 + 8 * ((*((void *)this + 50) - v4) >> 3) - 2280);
    }
    uint64_t v5 = mach_absolute_time();
    uint64_t v13 = v5;
    unint64_t v6 = *((void *)this + 50);
    if (v6 >= *((void *)this + 51))
    {
      uint64_t v12 = std::vector<std::pair<unsigned long long,waipc::timesync::KalmanEstimator>>::__emplace_back_slow_path<unsigned long long,waipc::timesync::KalmanEstimator const&>((uint64_t *)this + 49, &v13, (uint64_t)a2);
    }
    else
    {
      *(void *)unint64_t v6 = v5;
      *(void *)(v6 + 8) = &unk_26DAF2E08;
      long long v7 = *(_OWORD *)((char *)a2 + 8);
      long long v8 = *(_OWORD *)((char *)a2 + 40);
      *(_OWORD *)(v6 + 32) = *(_OWORD *)((char *)a2 + 24);
      *(_OWORD *)(v6 + 48) = v8;
      *(_OWORD *)(v6 + 16) = v7;
      long long v9 = *(_OWORD *)((char *)a2 + 56);
      long long v10 = *(_OWORD *)((char *)a2 + 72);
      long long v11 = *(_OWORD *)((char *)a2 + 88);
      *(void *)(v6 + 112) = *((void *)a2 + 13);
      *(_OWORD *)(v6 + 80) = v10;
      *(_OWORD *)(v6 + 96) = v11;
      *(_OWORD *)(v6 + 64) = v9;
      uint64_t v12 = v6 + 120;
    }
    *((void *)this + 50) = v12;
  }
}

void ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_2_15(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v7 = *(std::__shared_weak_count **)(v6 + 48);
  if (v7)
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = std::__shared_weak_count::lock(v7);
    if (v13)
    {
      double v14 = v13;
      if (*(void *)(v6 + 40))
      {
        unint64_t v15 = (os_unfair_lock_s *)(v12 + 32);
        os_unfair_lock_lock((os_unfair_lock_t)(v12 + 32));
        uint64_t v16 = *(void *)(v12 + 352);
        if (!v16) {
          goto LABEL_21;
        }
        uint64_t v17 = v12 + 352;
        uint64_t v18 = v12 + 352;
        do
        {
          unsigned int v19 = *(unsigned __int8 *)(v16 + 32);
          BOOL v20 = v19 >= a2;
          if (v19 >= a2) {
            double v21 = (uint64_t *)v16;
          }
          else {
            double v21 = (uint64_t *)(v16 + 8);
          }
          if (v20) {
            uint64_t v18 = v16;
          }
          uint64_t v16 = *v21;
        }
        while (*v21);
        if (v18 != v17
          && *(unsigned __int8 *)(v18 + 32) <= a2
          && (long double v22 = *(std::__shared_weak_count **)(v18 + 48)) != 0
          && (long double v23 = std::__shared_weak_count::lock(v22)) != 0)
        {
          double v24 = v23;
          uint64_t v25 = *(void *)(v18 + 40);
          if (v25)
          {
            *(unsigned char *)uint64_t v25 = 1;
            *(void *)(v25 + 8) = a3;
            *(double *)(v25 + 16) = a5;
            *(void *)(v25 + 24) = a4;
            double v26 = *(NSObject **)(v25 + 56);
            *(void *)(v25 + 56) = 0;
            os_unfair_lock_unlock(v15);
            waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context::broadcast<unsigned long long,double,unsigned long long>(*(void *)(v25 + 32), a3, a4, a5);
            if (v26)
            {
              dispatch_group_leave(v26);
              dispatch_release(v26);
            }
          }
          else
          {
            os_unfair_lock_unlock(v15);
          }
          std::__shared_weak_count::__release_shared[abi:ne180100](v24);
        }
        else
        {
LABEL_21:
          os_unfair_lock_unlock(v15);
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
  }
}

void sub_226E00148(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::dispatch::v1::group_session::~group_session((dispatch_object_t *)va);
  std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_3(uint64_t a1, unsigned __int8 a2, int a3)
{
  unsigned __int8 v16 = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v3 + 48))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(v3 + 48));
    if (v6)
    {
      long long v7 = v6;
      if (!*(void *)(v3 + 40))
      {
LABEL_18:
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
        return;
      }
      os_unfair_lock_lock((os_unfair_lock_t)(v5 + 32));
      long long v8 = std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__equal_range_multi<waipc::timesync::BasebandProvider::bufferId>(v5 + 368, &v16);
      long long v9 = v8;
      long long v11 = v10;
      if (v8 != v10)
      {
        if (a3)
        {
          uint64_t v12 = v8[8];
          v8[8] = 0;
          if (!v12) {
            goto LABEL_17;
          }
        }
        else
        {
          if (*((unsigned char *)v8 + 72))
          {
            uint64_t v13 = std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__remove_node_pointer((uint64_t **)(v5 + 368), v8);
            std::__destroy_at[abi:ne180100]<std::pair<waipc::timesync::BasebandProvider::bufferId const,waipc::timesync::BasebandService::bufferInfo>,0>((uint64_t)(v9 + 4));
            operator delete(v9);
            if (v13 != v11 && *(unsigned char *)(v5 + 272))
            {
              uint64_t v14 = *(void *)(v5 + 144);
              if (!v14) {
                __assert_rtn("setupProvider_block_invoke_3", "BasebandService.cpp", 381, "fProvider");
              }
              (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)v14 + 24))(v14, v16, v13[5], v13[7]);
            }
            goto LABEL_17;
          }
          unint64_t v15 = *(NSObject **)(v5 + 416);
          if (v15)
          {
            dispatch_retain(*(dispatch_object_t *)(v5 + 416));
            dispatch_group_enter(v15);
          }
          uint64_t v12 = v9[8];
          v9[8] = (uint64_t)v15;
          if (!v12) {
            goto LABEL_17;
          }
        }
        dispatch_group_leave(v12);
        dispatch_release(v12);
      }
LABEL_17:
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 32));
      goto LABEL_18;
    }
  }
}

void sub_226E002FC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync15BasebandService13setupProviderEv_block_invoke_4(void *a1)
{
  uint64_t v2 = *(void *)(a1[9] + 8);
  uint64_t v3 = *(std::__shared_weak_count **)(v2 + 48);
  if (v3)
  {
    uint64_t v4 = a1[10];
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      uint64_t v6 = v5;
      if (*(void *)(v2 + 40))
      {
        long long v7 = *(NSObject **)(v4 + 16);
        v17[0] = v7;
        if (v7) {
          dispatch_retain(v7);
        }
        long long v8 = *(NSObject **)(v4 + 24);
        v17[1] = v8;
        if (v8) {
          dispatch_retain(v8);
        }
        long long v9 = (void *)a1[4];
        if (v9) {
          long long v9 = _Block_copy(v9);
        }
        v17[2] = v9;
        long long v10 = (void *)a1[5];
        if (v10) {
          long long v10 = _Block_copy(v10);
        }
        v17[3] = v10;
        long long v11 = (void *)a1[6];
        if (v11) {
          long long v11 = _Block_copy(v11);
        }
        v17[4] = v11;
        uint64_t v12 = (void *)a1[7];
        if (v12) {
          uint64_t v12 = _Block_copy(v12);
        }
        v17[5] = v12;
        uint64_t v13 = (void *)a1[8];
        if (v13) {
          uint64_t v13 = _Block_copy(v13);
        }
        void v17[6] = v13;
        long long v18 = *(_OWORD *)(v4 + 88);
        uint64_t v14 = 20;
        if (!*(unsigned char *)(v4 + 104)) {
          uint64_t v14 = 0;
        }
        uint64_t v19 = v14;
        uint64_t v20 = v14;
        waipc::timesync::BasebandProvider::create((waipc::timesync::BasebandProvider *)v17, (os_unfair_lock_s **)&v21);
        waipc::timesync::BasebandProvider::config::~config((waipc::timesync::BasebandProvider::config *)v17);
        if ((void)v21)
        {
          os_unfair_lock_lock((os_unfair_lock_t)(v4 + 32));
          long long v15 = v21;
          long long v21 = 0uLL;
          unsigned __int8 v16 = *(std::__shared_weak_count **)(v4 + 152);
          *(_OWORD *)(v4 + 144) = v15;
          if (v16) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v16);
          }
          os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 32));
        }
        else
        {
          (*(void (**)(void))(a1[5] + 16))();
        }
        if (*((void *)&v21 + 1)) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v21 + 1));
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void sub_226E00478(_Unwind_Exception *a1)
{
  uint64_t v4 = *(std::__shared_weak_count **)(v2 - 40);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandService::addMeasurementObserver(uint64_t a1@<X0>, const void *a2@<X1>, void **a3@<X8>)
{
  uint64_t v6 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context::addObserver(*(void *)(a1 + 296), a2, a3);

  os_unfair_lock_unlock(v6);
}

void sub_226E0051C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandService::addConnectionObserver(uint64_t a1@<X0>, uint64_t a2@<X1>, void **a3@<X8>)
{
  uint64_t v6 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3802000000;
  v12[3] = __Block_byref_object_copy__24;
  v12[4] = __Block_byref_object_dispose__25;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v13, (void *)a1);
  v10[0] = 0;
  v10[1] = v10;
  _WORD v10[2] = 0x2000000000;
  char v11 = 0;
  long long v7 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN5waipc8timesync15BasebandService21addConnectionObserverEU13block_pointerFvbPK10__CFStringE_block_invoke;
  block[3] = &unk_2647E8480;
  block[6] = v10;
  block[7] = a1;
  block[4] = a2;
  block[5] = v12;
  dispatch_async(v7, block);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  void v8[2] = ___ZN5waipc8timesync15BasebandService21addConnectionObserverEU13block_pointerFvbPK10__CFStringE_block_invoke_2;
  void v8[3] = &unk_2647E84A8;
  v8[4] = a2;
  v8[5] = v10;
  waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::addObserver(*(void *)(a1 + 312), v8, a3);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v12, 8);
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  os_unfair_lock_unlock(v6);
}

void sub_226E006C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 136), 8);
  uint64_t v19 = *(std::__shared_weak_count **)(v17 - 88);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  os_unfair_lock_unlock(v16);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __Block_byref_object_dispose__25(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void ___ZN5waipc8timesync15BasebandService21addConnectionObserverEU13block_pointerFvbPK10__CFStringE_block_invoke(void *a1)
{
  uint64_t v2 = a1[7];
  uint64_t v3 = (os_unfair_lock_s *)(v2 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 32));
  uint64_t v4 = *(const void **)(v2 + 280);
  if (v4) {
    CFRetain(v4);
  }
  os_unfair_lock_unlock(v3);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  (*(void (**)(void))(a1[4] + 16))();
  if (v4) {
    CFRelease(v4);
  }
}

void sub_226E007D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ___ZN5waipc8timesync15BasebandService21addConnectionObserverEU13block_pointerFvbPK10__CFStringE_block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void waipc::timesync::BasebandService::addTimesyncObserver(uint64_t a1@<X0>, uint64_t a2@<X1>, void **a3@<X8>)
{
  uint64_t v6 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3802000000;
  v12[3] = __Block_byref_object_copy__24;
  v12[4] = __Block_byref_object_dispose__25;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v13, (void *)a1);
  v10[0] = 0;
  v10[1] = v10;
  _WORD v10[2] = 0x2000000000;
  char v11 = 0;
  long long v7 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN5waipc8timesync15BasebandService19addTimesyncObserverEU13block_pointerFvRKNS0_15KalmanEstimatorEbE_block_invoke;
  block[3] = &unk_2647E84D0;
  block[6] = v10;
  block[7] = a1;
  block[4] = a2;
  block[5] = v12;
  dispatch_async(v7, block);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  void v8[2] = ___ZN5waipc8timesync15BasebandService19addTimesyncObserverEU13block_pointerFvRKNS0_15KalmanEstimatorEbE_block_invoke_2;
  void v8[3] = &unk_2647E84F8;
  v8[4] = a2;
  v8[5] = v10;
  waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::addObserver(*(void *)(a1 + 328), v8, a3);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v12, 8);
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  os_unfair_lock_unlock(v6);
}

void sub_226E00998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 136), 8);
  uint64_t v19 = *(std::__shared_weak_count **)(v17 - 88);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  os_unfair_lock_unlock(v16);
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync15BasebandService19addTimesyncObserverEU13block_pointerFvRKNS0_15KalmanEstimatorEbE_block_invoke(void *a1)
{
  uint64_t v2 = a1[7];
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 32));
  long long v9 = &unk_26DAF2E08;
  long long v13 = *(_OWORD *)(v2 + 216);
  long long v14 = *(_OWORD *)(v2 + 232);
  long long v15 = *(_OWORD *)(v2 + 248);
  uint64_t v16 = *(void *)(v2 + 264);
  long long v10 = *(_OWORD *)(v2 + 168);
  long long v11 = *(_OWORD *)(v2 + 184);
  long long v12 = *(_OWORD *)(v2 + 200);
  if (*(unsigned char *)(v2 + 288))
  {
    if (*(unsigned char *)(v2 + 272))
    {
      uint64_t v3 = *(const os_unfair_lock **)(v2 + 144);
      if (!v3) {
        ___ZN5waipc8timesync15BasebandService19addTimesyncObserverEU13block_pointerFvRKNS0_15KalmanEstimatorEbE_block_invoke_cold_1();
      }
      waipc::timesync::BasebandProvider::triggerTimesyncMeasurement(v3);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    (*(void (**)(void, void **, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1[4] + 16))(a1[4], &v9, 1, v4, v5, v6, v7, v8);
  }
}

uint64_t ___ZN5waipc8timesync15BasebandService19addTimesyncObserverEU13block_pointerFvRKNS0_15KalmanEstimatorEbE_block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void waipc::timesync::BasebandService::addTimestampObserver(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X2>, void **a4@<X8>)
{
  uint64_t v8 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3802000000;
  v22[3] = __Block_byref_object_copy__24;
  v22[4] = __Block_byref_object_dispose__25;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v23, (void *)a1);
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3802000000;
  long long v18 = __Block_byref_object_copy__32;
  uint64_t v19 = __Block_byref_object_dispose__33;
  waipc::timesync::BasebandService::getTimestampSubscription(a1, a2, &v20);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2000000000;
  char v14 = 0;
  long long v9 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN5waipc8timesync15BasebandService20addTimestampObserverENS0_16BasebandProvider11timestampIdEU13block_pointerFvydyE_block_invoke;
  block[3] = &unk_2647E8520;
  block[7] = v13;
  void block[8] = a1;
  block[5] = v22;
  block[6] = &v15;
  block[4] = a3;
  dispatch_async(v9, block);
  uint64_t v10 = v16[5];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 0x40000000;
  void v11[2] = ___ZN5waipc8timesync15BasebandService20addTimestampObserverENS0_16BasebandProvider11timestampIdEU13block_pointerFvydyE_block_invoke_2;
  void v11[3] = &unk_2647E8548;
  void v11[5] = &v15;
  v11[6] = v13;
  v11[4] = a3;
  waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context::addObserver(*(void *)(v10 + 32), v11, a4);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  _Block_object_dispose(v22, 8);
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  os_unfair_lock_unlock(v8);
}

void sub_226E00D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,std::__shared_weak_count *a35)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  if (a35) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a35);
  }
  _Block_object_dispose((const void *)(v36 - 136), 8);
  long long v38 = *(std::__shared_weak_count **)(v36 - 88);
  if (v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v38);
  }
  os_unfair_lock_unlock(v35);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __Block_byref_object_dispose__33(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void waipc::timesync::BasebandService::getTimestampSubscription(uint64_t a1@<X0>, unsigned int a2@<W1>, void *a3@<X8>)
{
  unsigned __int8 v32 = a2;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
  uint64_t v6 = *(void *)(a1 + 352);
  if (v6)
  {
    uint64_t v7 = a1 + 352;
    do
    {
      unsigned int v8 = *(unsigned __int8 *)(v6 + 32);
      BOOL v9 = v8 >= a2;
      if (v8 >= a2) {
        uint64_t v10 = (uint64_t *)v6;
      }
      else {
        uint64_t v10 = (uint64_t *)(v6 + 8);
      }
      if (v9) {
        uint64_t v7 = v6;
      }
      uint64_t v6 = *v10;
    }
    while (*v10);
    if (v7 != a1 + 352 && *(unsigned __int8 *)(v7 + 32) <= a2)
    {
      *a3 = 0;
      a3[1] = 0;
      long long v11 = *(std::__shared_weak_count **)(v7 + 48);
      if (v11)
      {
        long long v12 = std::__shared_weak_count::lock(v11);
        a3[1] = v12;
        if (v12)
        {
          uint64_t v13 = *(void *)(v7 + 40);
          *a3 = v13;
          if (v13) {
            return;
          }
          std::__shared_weak_count::__release_shared[abi:ne180100](v12);
        }
      }
    }
  }
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3802000000;
  v30[3] = __Block_byref_object_copy__2;
  v30[4] = __Block_byref_object_dispose__2;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v23, (void *)a1);
  char v14 = (std::__shared_weak_count *)*((void *)&v23 + 1);
  long long v31 = v23;
  if (*((void *)&v23 + 1))
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v23 + 1) + 16), 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN5waipc8timesync15BasebandService24getTimestampSubscriptionENS0_16BasebandProvider11timestampIdE_block_invoke;
  aBlock[3] = &unk_2647E8570;
  aBlock[4] = v30;
  aBlock[5] = a1;
  char v29 = a2;
  LOBYTE(v23) = 0;
  long long v24 = 0uLL;
  *((void *)&v23 + 1) = 0;
  _ZNSt3__115allocate_sharedB8ne180100IN5waipc4util11BroadcasterIFvydyEE7contextENS_9allocatorIS6_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v25);
  uint64_t v15 = _Block_copy(aBlock);
  uint64_t v16 = *(NSObject **)(a1 + 416);
  *(void *)&long long v26 = v15;
  *((void *)&v26 + 1) = v16;
  if (v16)
  {
    dispatch_retain(v16);
    dispatch_group_enter(v16);
  }
  char v27 = 1;
  uint64_t v17 = (char *)operator new(0x60uLL);
  long long v18 = v24;
  *(_OWORD *)(v17 + 24) = v23;
  *(_OWORD *)(v17 + 40) = v18;
  long long v19 = v26;
  *(_OWORD *)(v17 + 56) = v25;
  *((void *)v17 + 1) = 0;
  *((void *)v17 + 2) = 0;
  *(void *)uint64_t v17 = &unk_26DAF3148;
  long long v25 = 0uLL;
  *(_OWORD *)(v17 + 72) = v19;
  long long v26 = 0uLL;
  v17[88] = 1;
  *a3 = v17 + 24;
  a3[1] = v17;
  waipc::util::GuardBlock::~GuardBlock((const void **)&v26);
  if (*((void *)&v25 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v25 + 1));
  }
  *(void *)&long long v23 = &v32;
  uint64_t v20 = std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::__emplace_unique_key_args<waipc::timesync::BasebandProvider::timestampId,std::piecewise_construct_t const&,std::tuple<waipc::timesync::BasebandProvider::timestampId const&>,std::tuple<>>((uint64_t **)(a1 + 344), &v32, (uint64_t)&std::piecewise_construct, (unsigned char **)&v23);
  atomic_fetch_add_explicit((atomic_ullong *volatile)v17 + 2, 1uLL, memory_order_relaxed);
  long long v21 = (std::__shared_weak_count *)v20[6];
  v20[5] = (uint64_t *)(v17 + 24);
  void v20[6] = (uint64_t *)v17;
  if (v21) {
    std::__shared_weak_count::__release_weak(v21);
  }
  if (*(unsigned char *)(a1 + 272))
  {
    uint64_t v22 = *(void *)(a1 + 144);
    if (!v22) {
      __assert_rtn("getTimestampSubscription", "BasebandService.cpp", 625, "fProvider");
    }
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)v22 + 16))(v22, v32, 1);
  }
  _Block_object_dispose(v30, 8);
  if (*((void *)&v31 + 1)) {
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v31 + 1));
  }
}

void sub_226E01078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,std::__shared_weak_count *a31)
{
  if (a31) {
    std::__shared_weak_count::__release_weak(a31);
  }
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync15BasebandService20addTimestampObserverENS0_16BasebandProvider11timestampIdEU13block_pointerFvydyE_block_invoke(void *a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1[8] + 32);
  os_unfair_lock_lock(v2);
  uint64_t v3 = *(unsigned __int8 **)(*(void *)(a1[6] + 8) + 40);
  int v4 = *v3;
  unint64_t v5 = *((void *)v3 + 2);
  os_unfair_lock_unlock(v2);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  if (v4)
  {
    uint64_t v7 = *(void (**)(__n128))(a1[4] + 16);
    v6.n128_u64[0] = v5;
    v7(v6);
  }
}

uint64_t ___ZN5waipc8timesync15BasebandService20addTimestampObserverENS0_16BasebandProvider11timestampIdEU13block_pointerFvydyE_block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void waipc::timesync::BasebandService::setTimestampRequiredForReady(uint64_t a1, unsigned int a2, int a3)
{
  __n128 v6 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  waipc::timesync::BasebandService::getTimestampSubscription(a1, a2, &v10);
  uint64_t v7 = v10;
  *(unsigned char *)(v10 + 64) = a3;
  if (!a3 || *(unsigned char *)v7)
  {
    unsigned int v8 = *(NSObject **)(v7 + 56);
    *(void *)(v7 + 56) = 0;
    if (!v8) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  BOOL v9 = *(NSObject **)(a1 + 416);
  if (v9)
  {
    dispatch_retain(*(dispatch_object_t *)(a1 + 416));
    dispatch_group_enter(v9);
  }
  unsigned int v8 = *(NSObject **)(v7 + 56);
  *(void *)(v7 + 56) = v9;
  if (v8)
  {
LABEL_4:
    dispatch_group_leave(v8);
    dispatch_release(v8);
  }
LABEL_5:
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }

  os_unfair_lock_unlock(v6);
}

void sub_226E01270(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ___ZN5waipc8timesync15BasebandService24getTimestampSubscriptionENS0_16BasebandProvider11timestampIdE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(std::__shared_weak_count **)(v2 + 48);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    unint64_t v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      __n128 v6 = v5;
      uint64_t v7 = *(void *)(v2 + 40);
      if (v7)
      {
        unsigned int v8 = *(NSObject **)(v4 + 16);
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 1174405120;
        void v9[2] = ___ZN5waipc8timesync15BasebandService24getTimestampSubscriptionENS0_16BasebandProvider11timestampIdE_block_invoke_2;
        _OWORD v9[3] = &__block_descriptor_tmp_37_0;
        _OWORD v9[4] = v4;
        void v9[5] = v7;
        uint64_t v10 = v6;
        atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
        char v11 = *(unsigned char *)(a1 + 48);
        dispatch_async(v8, v9);
        if (v10) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v10);
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void ___ZN5waipc8timesync15BasebandService24getTimestampSubscriptionENS0_16BasebandProvider11timestampIdE_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 32));
  uint64_t v3 = *(void *)(v2 + 352);
  if (v3)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v5 = v2 + 352;
    do
    {
      unsigned int v6 = *(unsigned __int8 *)(v3 + 32);
      BOOL v7 = v6 >= v4;
      if (v6 >= v4) {
        unsigned int v8 = (uint64_t *)v3;
      }
      else {
        unsigned int v8 = (uint64_t *)(v3 + 8);
      }
      if (v7) {
        uint64_t v5 = v3;
      }
      uint64_t v3 = *v8;
    }
    while (*v8);
    if (v5 != v2 + 352 && v4 >= *(unsigned __int8 *)(v5 + 32))
    {
      BOOL v9 = *(std::__shared_weak_count **)(v5 + 48);
      if (v9)
      {
        uint64_t v10 = std::__shared_weak_count::lock(v9);
        if (v10 && *(void *)(v5 + 40))
        {
LABEL_21:
          std::__shared_weak_count::__release_shared[abi:ne180100](v10);
          goto LABEL_22;
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
      if (*(unsigned char *)(v2 + 272))
      {
        uint64_t v11 = *(void *)(v2 + 144);
        if (!v11) {
          __assert_rtn("getTimestampSubscription_block_invoke_2", "BasebandService.cpp", 607, "fProvider");
        }
        (*(void (**)(uint64_t, void, void))(*(void *)v11 + 16))(v11, *(unsigned __int8 *)(a1 + 56), 0);
      }
      std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::erase((uint64_t **)(v2 + 344), (uint64_t *)v5);
      if (v10) {
        goto LABEL_21;
      }
    }
  }
LABEL_22:

  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
}

void sub_226E01494(_Unwind_Exception *a1)
{
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c61_ZTSKNSt3__110shared_ptrIN5waipc8timesync15BasebandServiceEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c61_ZTSKNSt3__110shared_ptrIN5waipc8timesync15BasebandServiceEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void waipc::timesync::BasebandService::timestampSubscription::~timestampSubscription(waipc::timesync::BasebandService::timestampSubscription *this)
{
  uint64_t v2 = *((void *)this + 7);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *((void *)this + 7);
    if (v3) {
      dispatch_release(v3);
    }
  }
  waipc::util::GuardBlock::~GuardBlock((const void **)this + 6);
  unsigned int v4 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

void waipc::timesync::BasebandService::triggerMeasurement(os_unfair_lock_s *this)
{
  uint64_t v2 = this + 8;
  os_unfair_lock_lock(this + 8);
  if (LOBYTE(this[68]._os_unfair_lock_opaque))
  {
    uint64_t v3 = *(const os_unfair_lock **)&this[36]._os_unfair_lock_opaque;
    if (!v3) {
      __assert_rtn("triggerMeasurement", "BasebandService.cpp", 638, "fProvider");
    }
    waipc::timesync::BasebandProvider::triggerTimesyncMeasurement(v3);
  }

  os_unfair_lock_unlock(v2);
}

void sub_226E015A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandService::triggerReset(waipc::timesync::BasebandService *this)
{
  uint64_t v2 = (os_unfair_lock_s *)((char *)this + 32);
  os_unfair_lock_lock((os_unfair_lock_t)this + 8);
  *((unsigned char *)this + 288) = 1;
  uint64_t v3 = *((void *)this + 52);
  if (v3)
  {
    dispatch_retain(*((dispatch_object_t *)this + 52));
    dispatch_group_enter(v3);
  }
  unsigned int v4 = *((void *)this + 54);
  *((void *)this + 54) = v3;
  if (v4)
  {
    dispatch_group_leave(v4);
    dispatch_release(v4);
  }
  uint64_t v5 = (os_unfair_lock_s *)*((void *)this + 18);
  if (v5) {
    waipc::timesync::BasebandProvider::cancelTimesyncMeasurement(v5);
  }
  if (*((unsigned char *)this + 272))
  {
    unsigned int v6 = (const os_unfair_lock *)*((void *)this + 18);
    if (!v6) {
      __assert_rtn("triggerReset", "BasebandService.cpp", 655, "fProvider");
    }
    waipc::timesync::BasebandProvider::triggerTimesyncMeasurement(v6);
  }

  os_unfair_lock_unlock(v2);
}

void sub_226E01684(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void waipc::timesync::BasebandService::mapBuffer(uint64_t a1@<X0>, unsigned __int8 a2@<W1>, uint64_t **a3@<X2>, uint64_t (*a4)(uint64_t result, uint64_t a2)@<X3>, void **a5@<X8>)
{
  v33[0] = a2;
  unsigned int v8 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  BOOL v9 = std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__equal_range_multi<waipc::timesync::BasebandProvider::bufferId>(a1 + 368, v33);
  uint64_t v11 = v10;
  long long v12 = *a3;
  uint64_t v13 = (std::__shared_weak_count *)a3[1];
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  long long v30 = a4;
  char v14 = *(NSObject **)(a1 + 416);
  if (v14)
  {
    dispatch_retain(*(dispatch_object_t *)(a1 + 416));
    dispatch_group_enter(v14);
  }
  char v32 = 0;
  LOBYTE(v21) = v33[0];
  uint64_t v22 = v12;
  uint64_t v23 = (uint64_t)v13;
  uint64_t v28 = 0;
  char v29 = 0;
  long long v24 = a4;
  dispatch_group_t group = v14;
  uint64_t v31 = 0;
  LOBYTE(v26) = 0;
  uint64_t v15 = std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__emplace_hint_multi<std::pair<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>((void *)(a1 + 368), v11, (uint64_t)&v21);
  if (group)
  {
    dispatch_group_leave(group);
    if (group) {
      dispatch_release(group);
    }
  }
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v23);
  }
  if (v9 == v11 && *(unsigned char *)(a1 + 272))
  {
    uint64_t v16 = *(void *)(a1 + 144);
    if (!v16) {
      __assert_rtn("mapBuffer", "BasebandService.cpp", 675, "fProvider");
    }
    (*(void (**)(uint64_t, void, uint64_t *, uint64_t (*)(uint64_t, uint64_t)))(*(void *)v16 + 24))(v16, v33[0], *a3, a4);
  }
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3802000000;
  long long v24 = __Block_byref_object_copy__2;
  dispatch_group_t group = (dispatch_group_t)__Block_byref_object_dispose__2;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v28, (void *)a1);
  uint64_t v17 = v29;
  uint64_t v26 = v28;
  char v27 = v29;
  if (v29)
  {
    atomic_fetch_add_explicit(&v29->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN5waipc8timesync15BasebandService9mapBufferENS0_16BasebandProvider8bufferIdERKNSt3__110shared_ptrIvEEm_block_invoke;
  aBlock[3] = &unk_2647E8598;
  aBlock[4] = &v21;
  aBlock[5] = a1;
  unsigned __int8 v20 = v33[0];
  void aBlock[6] = v15;
  *a5 = _Block_copy(aBlock);
  _Block_object_dispose(&v21, 8);
  if (v27) {
    std::__shared_weak_count::__release_weak(v27);
  }
  os_unfair_lock_unlock(v8);
}

void sub_226E018F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  os_unfair_lock_unlock(v26);
  _Unwind_Resume(a1);
}

uint64_t std::pair<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>::~pair(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *(NSObject **)(a1 + 32);
    if (v3) {
      dispatch_release(v3);
    }
  }
  unsigned int v4 = *(std::__shared_weak_count **)(a1 + 16);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return a1;
}

void waipc::timesync::BasebandService::bufferInfo::~bufferInfo(waipc::timesync::BasebandService::bufferInfo *this)
{
  uint64_t v2 = *((void *)this + 3);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *((void *)this + 3);
    if (v3) {
      dispatch_release(v3);
    }
  }
  unsigned int v4 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

void ___ZN5waipc8timesync15BasebandService9mapBufferENS0_16BasebandProvider8bufferIdERKNSt3__110shared_ptrIvEEm_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(std::__shared_weak_count **)(v2 + 48);
  if (!v3) {
    return;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = std::__shared_weak_count::lock(v3);
  if (!v5) {
    return;
  }
  unsigned int v6 = v5;
  if (*(void *)(v2 + 40))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v4 + 32));
    uint64_t v7 = *(void *)(v4 + 376);
    if (!v7) {
      goto LABEL_15;
    }
    unsigned int v8 = *(unsigned __int8 *)(a1 + 56);
    BOOL v9 = (unsigned __int8 *)(v4 + 376);
    do
    {
      unsigned int v10 = *(unsigned __int8 *)(v7 + 32);
      BOOL v11 = v10 >= v8;
      if (v10 >= v8) {
        long long v12 = (uint64_t *)v7;
      }
      else {
        long long v12 = (uint64_t *)(v7 + 8);
      }
      if (v11) {
        BOOL v9 = (unsigned __int8 *)v7;
      }
      uint64_t v7 = *v12;
    }
    while (*v12);
    if (v9 == (unsigned __int8 *)(v4 + 376) || v8 < v9[32]) {
LABEL_15:
    }
      BOOL v9 = (unsigned __int8 *)(v4 + 376);
    uint64_t v13 = *(unsigned __int8 **)(a1 + 48);
    if (v9 == v13 && *(unsigned char *)(v4 + 272))
    {
      if (v9[72])
      {
        uint64_t v15 = "!it->second.awaitingRemoval";
        int v16 = 694;
      }
      else
      {
        v9[72] = 1;
        uint64_t v14 = *(void *)(v4 + 144);
        if (v14)
        {
          (*(void (**)(uint64_t, void))(*(void *)v14 + 32))(v14, *(unsigned __int8 *)(a1 + 56));
          goto LABEL_23;
        }
        uint64_t v15 = "fProvider";
        int v16 = 697;
      }
      __assert_rtn("mapBuffer_block_invoke", "BasebandService.cpp", v16, v15);
    }
    std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__remove_node_pointer((uint64_t **)(v4 + 368), *(uint64_t **)(a1 + 48));
    std::__destroy_at[abi:ne180100]<std::pair<waipc::timesync::BasebandProvider::bufferId const,waipc::timesync::BasebandService::bufferInfo>,0>((uint64_t)(v13 + 32));
    operator delete(v13);
LABEL_23:
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 32));
  }

  std::__shared_weak_count::__release_shared[abi:ne180100](v6);
}

void sub_226E01B40(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::pair<unsigned long long,waipc::timesync::KalmanEstimator>>::erase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 != a3)
  {
    uint64_t v3 = *(void *)(a1 + 8);
    uint64_t v4 = a2;
    if (a3 != v3)
    {
      uint64_t v5 = 8 * ((a3 - a2) >> 3);
      uint64_t v4 = a2;
      do
      {
        *(void *)uint64_t v4 = *(void *)(v4 + v5);
        long long v7 = *(_OWORD *)(v4 + v5 + 32);
        long long v6 = *(_OWORD *)(v4 + v5 + 48);
        *(_OWORD *)(v4 + 16) = *(_OWORD *)(v4 + v5 + 16);
        *(_OWORD *)(v4 + 32) = v7;
        *(_OWORD *)(v4 + 48) = v6;
        long long v9 = *(_OWORD *)(v4 + v5 + 80);
        long long v8 = *(_OWORD *)(v4 + v5 + 96);
        long long v10 = *(_OWORD *)(v4 + v5 + 64);
        *(void *)(v4 + 112) = *(void *)(v4 + v5 + 112);
        *(_OWORD *)(v4 + 80) = v9;
        *(_OWORD *)(v4 + 96) = v8;
        *(_OWORD *)(v4 + 64) = v10;
        v4 += 120;
      }
      while (v4 + v5 != v3);
    }
    *(void *)(a1 + 8) = v4;
  }
  return a2;
}

char **waipc::timesync::BasebandService::dumpState(waipc::timesync::BasebandService *this)
{
  v38[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = (os_unfair_lock_s *)((char *)this + 32);
  os_unfair_lock_lock((os_unfair_lock_t)this + 8);
  memset(v25, 0, sizeof(v25));
  std::vector<applesauce::CF::DictionaryRef>::reserve(v25, *((void *)this + 45));
  std::transform[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,void *> *,long>>,std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>,applesauce::CF::DictionaryRef({block_pointer})(std::pair<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>> const&)>(*((void **)this + 43), (void *)this + 44, v25, (uint64_t)&__block_literal_global_1);
  memset(v24, 0, sizeof(v24));
  std::vector<applesauce::CF::DictionaryRef>::reserve(v24, *((void *)this + 48));
  std::transform[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,void *> *,long>>,std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>,applesauce::CF::DictionaryRef({block_pointer})(std::pair<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo> const&)>(*((void **)this + 46), (void *)this + 47, v24, (uint64_t)&__block_literal_global_66);
  memset(v23, 0, sizeof(v23));
  std::vector<applesauce::CF::DictionaryRef>::reserve(v23, 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(*((void *)this + 50) - *((void *)this + 49)) >> 3));
  uint64_t v3 = (uint64_t *)*((void *)this + 49);
  uint64_t v4 = (uint64_t *)*((void *)this + 50);
  char v27 = v23;
  while (v3 != v4)
  {
    ___ZNK5waipc8timesync15BasebandService9dumpStateEv_block_invoke_3(v3, (applesauce::CF::DictionaryRef *)&cf);
    std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>::operator=[abi:ne180100](&v27, &cf);
    if (cf) {
      CFRelease(cf);
    }
    v3 += 15;
  }
  waipc::util::_kv::_kv<double const&,void>(v28, @"Rate Variance", (uint64_t *)this + 5);
  waipc::util::_kv::_kv<double const&,void>(&v29, @"Process Variance", (uint64_t *)this + 6);
  waipc::util::_kv::_kv<double const&,void>(&v30, @"Extra Sync Variance", (uint64_t *)this + 7);
  waipc::util::_kv::_kv<double const&,void>(&v31, @"Host Variance Weight", (uint64_t *)this + 8);
  CFTypeRef cf = (CFTypeRef)*((void *)this + 9);
  waipc::util::_kv::_kv<double,void>(&v32, @"Nominal Device Tick", (uint64_t *)&cf);
  uint64_t v22 = *((void *)this + 10);
  waipc::util::_kv::_kv<double,void>(&v33, @"Nominal Host Tick", &v22);
  waipc::util::_kv::_kv<unsigned int const&,void>(&v34, @"Open Timeout", (int *)this + 22);
  waipc::util::_kv::_kv<unsigned int const&,void>(&v35, @"Open Retry", (int *)this + 23);
  waipc::util::_kv::_kv<unsigned int const&,void>(&v36, @"Measurement Burst", (int *)this + 24);
  waipc::util::_kv::_kv<unsigned int const&,void>(v37, @"Measurement Min Interval", (int *)this + 25);
  uint64_t v5 = (waipc::timesync::BasebandProvider *)*((void *)this + 18);
  if (v5) {
    uint64_t v5 = (waipc::timesync::BasebandProvider *)waipc::timesync::BasebandProvider::dumpState(v5);
  }
  v37[2] = @"Provider";
  v37[3] = v5;
  CFTypeRef v6 = waipc::timesync::KalmanEstimator::dumpState((waipc::timesync::BasebandService *)((char *)this + 160));
  v37[4] = @"Estimator";
  v37[5] = v6;
  uint64_t v7 = *MEMORY[0x263EFFB40];
  uint64_t v8 = *MEMORY[0x263EFFB38];
  if (*((unsigned char *)this + 272)) {
    uint64_t v9 = *MEMORY[0x263EFFB40];
  }
  else {
    uint64_t v9 = *MEMORY[0x263EFFB38];
  }
  v37[6] = @"Connected";
  void v37[7] = v9;
  v37[8] = @"Disconnect Reason";
  uint64_t v10 = *((void *)this + 35);
  if (v10) {
    CFRetain(*((CFTypeRef *)this + 35));
  }
  v37[9] = v10;
  v37[10] = @"Reset";
  if (*((unsigned char *)this + 288)) {
    uint64_t v11 = v7;
  }
  else {
    uint64_t v11 = v8;
  }
  v37[11] = v11;
  if (waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::hasObservers(*((void *)this + 37))) {
    uint64_t v12 = v7;
  }
  else {
    uint64_t v12 = v8;
  }
  v37[12] = @"Measurement Observers Present";
  v37[13] = v12;
  if (waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::hasObservers(*((void *)this + 39))) {
    uint64_t v13 = v7;
  }
  else {
    uint64_t v13 = v8;
  }
  v37[14] = @"Connection Observers Present";
  v37[15] = v13;
  if (waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::hasObservers(*((void *)this + 41))) {
    uint64_t v14 = v7;
  }
  else {
    uint64_t v14 = v8;
  }
  v37[16] = @"Timesync Observers Present";
  v37[17] = v14;
  v37[18] = @"Timestamp Contexts";
  v37[19] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>((uint64_t **)v25);
  v37[20] = @"Mapped Buffers";
  v37[21] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>((uint64_t **)v24);
  v37[22] = @"Estimator Log";
  v37[23] = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>((uint64_t **)v23);
  v37[24] = @"Connection Ready";
  uint64_t v15 = *((void *)this + 54);
  if (*((void *)this + 53)) {
    uint64_t v16 = v8;
  }
  else {
    uint64_t v16 = v7;
  }
  v37[25] = v16;
  v37[26] = @"Estimator Ready";
  if (v15) {
    uint64_t v17 = v8;
  }
  else {
    uint64_t v17 = v7;
  }
  v37[27] = v17;
  waipc::util::_kv::_kv<unsigned int const&,void>(v38, @"Timesync Outlier Count", (int *)this + 110);
  waipc::util::createCFDictDropNull<24l>((uint64_t)v28, (applesauce::CF::DictionaryRef *)&v27);
  for (uint64_t i = 47; i != -1; i -= 2)
  {
    long long v19 = v28[i];
    if (v19) {
      CFRelease(v19);
    }
  }
  unsigned __int8 v20 = v27;
  v28[0] = (void **)v23;
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](v28);
  v28[0] = (void **)v24;
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](v28);
  v28[0] = (void **)v25;
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](v28);
  os_unfair_lock_unlock(v2);
  return v20;
}

void sub_226E02044(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

char **std::transform[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,void *> *,long>>,std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>,applesauce::CF::DictionaryRef({block_pointer})(std::pair<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>> const&)>(void *a1, void *a2, char **a3, uint64_t a4)
{
  uint64_t v16 = a3;
  if (a1 != a2)
  {
    CFTypeRef v6 = a1;
    do
    {
      v12[0] = *((unsigned char *)v6 + 32);
      uint64_t v7 = (std::__shared_weak_count *)v6[6];
      uint64_t v13 = v6[5];
      uint64_t v14 = v7;
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      }
      (*(void (**)(CFTypeRef *__return_ptr, uint64_t, char *))(a4 + 16))(&cf, a4, v12);
      std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>::operator=[abi:ne180100](&v16, &cf);
      if (cf) {
        CFRelease(cf);
      }
      if (v14) {
        std::__shared_weak_count::__release_weak(v14);
      }
      uint64_t v8 = (void *)v6[1];
      if (v8)
      {
        do
        {
          uint64_t v9 = v8;
          uint64_t v8 = (void *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          uint64_t v9 = (void *)v6[2];
          BOOL v10 = *v9 == (void)v6;
          CFTypeRef v6 = v9;
        }
        while (!v10);
      }
      CFTypeRef v6 = v9;
    }
    while (v9 != a2);
    return v16;
  }
  return a3;
}

void sub_226E0224C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, const void *a13)
{
  if (a12) {
    std::__shared_weak_count::__release_weak(a12);
  }
  _Unwind_Resume(a1);
}

void ___ZNK5waipc8timesync15BasebandService9dumpStateEv_block_invoke(unsigned __int8 *a1@<X1>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v4 = (std::__shared_weak_count *)*((void *)a1 + 2);
  if (v4)
  {
    uint64_t v5 = std::__shared_weak_count::lock(v4);
    if (v5) {
      CFTypeRef v6 = (void *)*((void *)a1 + 1);
    }
    else {
      CFTypeRef v6 = 0;
    }
  }
  else
  {
    CFTypeRef v6 = 0;
    uint64_t v5 = 0;
  }
  TimestampName = waipc::timesync::BasebandProvider::getTimestampName(*a1);
  uint64_t v8 = TimestampName;
  v27[0] = @"Name";
  if (TimestampName) {
    CFRetain(TimestampName);
  }
  v27[1] = v8;
  if (v6)
  {
    long long v25 = v5;
    BOOL hasObservers = waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::hasObservers(v6[4]);
    BOOL v10 = (const void *)*MEMORY[0x263EFFB40];
    uint64_t v11 = (const void *)*MEMORY[0x263EFFB38];
    if (hasObservers) {
      uint64_t v12 = (const void *)*MEMORY[0x263EFFB40];
    }
    else {
      uint64_t v12 = (const void *)*MEMORY[0x263EFFB38];
    }
    uint64_t v28 = @"Observers Present";
    if (v12) {
      CFRetain(v12);
    }
    uint64_t v29 = v12;
    if (*(unsigned char *)v6) {
      uint64_t v13 = v10;
    }
    else {
      uint64_t v13 = v11;
    }
    uint64_t v30 = @"Latest Valid";
    if (v13) {
      CFRetain(v13);
    }
    uint64_t v31 = v13;
    int valuePtr = (void *)v6[1];
    CFNumberRef v14 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
    CFNumberRef v15 = v14;
    if (!v14)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x22A66A950](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    uint64_t v32 = @"Latest Timestamp";
    CFRetain(v14);
    CFNumberRef v33 = v15;
    int valuePtr = (void *)v6[2];
    CFNumberRef v16 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
    CFNumberRef v17 = v16;
    if (!v16)
    {
      uint64_t v23 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x22A66A950](v23, "Could not construct");
      __cxa_throw(v23, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    uint64_t v34 = @"Latest Timestamp Granularity";
    CFRetain(v16);
    CFNumberRef v35 = v17;
    int valuePtr = (void *)v6[3];
    CFNumberRef v18 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
    CFNumberRef v19 = v18;
    if (!v18)
    {
      long long v24 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x22A66A950](v24, "Could not construct");
      __cxa_throw(v24, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    uint64_t v36 = @"Latest Interval";
    CFRetain(v18);
    CFNumberRef v37 = v19;
    if (v6[7]) {
      CFTypeRef v6 = v11;
    }
    else {
      CFTypeRef v6 = v10;
    }
    int valuePtr = v6;
    long long v38 = @"Ready";
    if (v6) {
      CFRetain(v6);
    }
    uint64_t v5 = v25;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    CFNumberRef v15 = 0;
    CFNumberRef v17 = 0;
    CFNumberRef v19 = 0;
    uint64_t v28 = @"Observers Present";
    uint64_t v29 = 0;
    uint64_t v30 = @"Latest Valid";
    uint64_t v31 = 0;
    uint64_t v32 = @"Latest Timestamp";
    CFNumberRef v33 = 0;
    uint64_t v34 = @"Latest Timestamp Granularity";
    CFNumberRef v35 = 0;
    CFNumberRef v37 = 0;
    long long v38 = @"Ready";
    uint64_t v36 = @"Latest Interval";
    int valuePtr = 0;
  }
  long long v39 = v6;
  waipc::util::createCFDictDropNull<7l>((uint64_t)v27, a2);
  for (uint64_t i = 13; i != -1; i -= 2)
  {
    uint64_t v21 = (const void *)v27[i];
    if (v21) {
      CFRelease(v21);
    }
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v17) {
    CFRelease(v17);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

void sub_226E02674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, const void *a12, const void *a13, const void *a14, const void *a15, uint64_t a16, char a17)
{
  applesauce::CF::NumberRef::~NumberRef(&a12);
  applesauce::CF::NumberRef::~NumberRef(&a13);
  applesauce::CF::BooleanRef::~BooleanRef(&a14);
  applesauce::CF::BooleanRef::~BooleanRef(&a15);
  while (v17 != (waipc::util::_kv *)&a17)
  {
    CFNumberRef v17 = (waipc::util::_kv *)((char *)v17 - 16);
    waipc::util::_kv::~_kv(v17);
  }
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(a1);
}

void applesauce::CF::BooleanRef::~BooleanRef(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

char **std::transform[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,void *> *,long>>,std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>,applesauce::CF::DictionaryRef({block_pointer})(std::pair<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo> const&)>(void *a1, void *a2, char **a3, uint64_t a4)
{
  CFNumberRef v15 = a3;
  if (a1 != a2)
  {
    CFTypeRef v6 = a1;
    do
    {
      std::pair<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>::pair[abi:ne180100]<waipc::timesync::BasebandProvider::bufferId const,waipc::timesync::BasebandService::bufferInfo,0>((uint64_t)v11, (uint64_t)(v6 + 4));
      (*(void (**)(CFTypeRef *__return_ptr, uint64_t, unsigned char *))(a4 + 16))(&cf, a4, v11);
      std::back_insert_iterator<std::vector<applesauce::CF::DictionaryRef>>::operator=[abi:ne180100](&v15, &cf);
      if (cf) {
        CFRelease(cf);
      }
      if (group)
      {
        dispatch_group_leave(group);
        if (group) {
          dispatch_release(group);
        }
      }
      if (v12) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v12);
      }
      uint64_t v7 = (void *)v6[1];
      if (v7)
      {
        do
        {
          uint64_t v8 = v7;
          uint64_t v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          uint64_t v8 = (void *)v6[2];
          BOOL v9 = *v8 == (void)v6;
          CFTypeRef v6 = v8;
        }
        while (!v9);
      }
      CFTypeRef v6 = v8;
    }
    while (v8 != a2);
    return v15;
  }
  return a3;
}

void sub_226E028E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, const void *a15)
{
}

void ___ZNK5waipc8timesync15BasebandService9dumpStateEv_block_invoke_2(uint64_t *a1@<X1>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  void v13[6] = *MEMORY[0x263EF8340];
  BufferName = waipc::timesync::BasebandProvider::getBufferName(*(unsigned __int8 *)a1);
  uint64_t v5 = BufferName;
  v12[0] = @"Name";
  if (BufferName) {
    CFRetain(BufferName);
  }
  v12[1] = v5;
  waipc::util::_kv::_kv<unsigned long const&,void>(v13, @"Length", a1 + 3);
  uint64_t v6 = *MEMORY[0x263EFFB40];
  uint64_t v7 = *MEMORY[0x263EFFB38];
  if (a1[4]) {
    uint64_t v8 = *MEMORY[0x263EFFB38];
  }
  else {
    uint64_t v8 = *MEMORY[0x263EFFB40];
  }
  v13[2] = @"Ready";
  void v13[3] = v8;
  if (*((unsigned char *)a1 + 40)) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = v7;
  }
  v13[4] = @"Awaiting Removal";
  v13[5] = v9;
  waipc::util::createCFDictDropNull<4l>((uint64_t)v12, a2);
  for (uint64_t i = 7; i != -1; i -= 2)
  {
    uint64_t v11 = (const void *)v12[i];
    if (v11) {
      CFRelease(v11);
    }
  }
}

void sub_226E02A20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void ___ZNK5waipc8timesync15BasebandService9dumpStateEv_block_invoke_3(uint64_t *a1@<X1>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  v7[4] = *MEMORY[0x263EF8340];
  waipc::util::_kv::_kv<unsigned long long const&,void>(v7, @"Mach Time", a1);
  CFTypeRef v4 = waipc::timesync::KalmanEstimator::dumpState((waipc::timesync::KalmanEstimator *)(a1 + 1));
  void v7[2] = @"Estimator";
  v7[3] = v4;
  waipc::util::createCFDictDropNull<2l>((uint64_t)v7, a2);
  for (uint64_t i = 3; i != -1; i -= 2)
  {
    uint64_t v6 = (const void *)v7[i];
    if (v6) {
      CFRelease(v6);
    }
  }
}

void sub_226E02B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  for (uint64_t i = 16; i != -16; i -= 16)
    waipc::util::_kv::~_kv((waipc::util::_kv *)(v9 + i));
  applesauce::CF::TypeRef::~TypeRef(&a9);
  _Unwind_Resume(a1);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<2l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3 = 0;
  CFIndex v4 = 0;
  keys[2] = *(void **)MEMORY[0x263EF8340];
  keys[0] = 0;
  keys[1] = 0;
  values[0] = 0;
  values[1] = 0;
  do
  {
    uint64_t v5 = *(void **)(a1 + v3);
    if (v5)
    {
      uint64_t v6 = *(void **)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        values[v4++] = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 32);
  CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)values, v4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

applesauce::CF::DictionaryRef *waipc::util::createCFDictDropNull<24l>@<X0>(uint64_t a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  uint64_t v3 = 0;
  CFIndex v4 = 0;
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  *(_OWORD *)keys = 0u;
  long long v11 = 0u;
  memset(v9, 0, sizeof(v9));
  do
  {
    uint64_t v5 = *(void **)(a1 + v3);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((void *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 384);
  CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)v9, v4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v7);
}

void errIfInexact(long double a1)
{
  if (fetestexcept(16))
  {
    nextafter(a1, -INFINITY);
    nextafter(a1, INFINITY);
  }
}

void waipc::util::GuardBlock::~GuardBlock(const void **this)
{
  uint64_t v2 = (void (**)(void))*this;
  if (v2)
  {
    v2[2]();
    if (*this) {
      _Block_release(*this);
    }
  }
}

uint64_t std::vector<std::pair<unsigned long long,waipc::timesync::KalmanEstimator>>::__emplace_back_slow_path<unsigned long long,waipc::timesync::KalmanEstimator const&>(uint64_t *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  unint64_t v5 = 0xEEEEEEEEEEEEEEEFLL * ((a1[1] - *a1) >> 3);
  unint64_t v6 = v5 + 1;
  if (v5 + 1 > 0x222222222222222) {
    std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v9 = (uint64_t)(a1 + 2);
  unint64_t v10 = 0xEEEEEEEEEEEEEEEFLL * ((a1[2] - v4) >> 3);
  if (2 * v10 > v6) {
    unint64_t v6 = 2 * v10;
  }
  if (v10 >= 0x111111111111111) {
    unint64_t v11 = 0x222222222222222;
  }
  else {
    unint64_t v11 = v6;
  }
  long long v25 = a1 + 2;
  if (v11) {
    long long v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long long,waipc::timesync::KalmanEstimator>>>(v9, v11);
  }
  else {
    long long v12 = 0;
  }
  long long v13 = &v12[120 * v5];
  __p = v12;
  uint64_t v22 = v13;
  long long v24 = &v12[120 * v11];
  *(void *)long long v13 = *a2;
  *((void *)v13 + 1) = &unk_26DAF2E08;
  long long v14 = *(_OWORD *)(a3 + 56);
  long long v15 = *(_OWORD *)(a3 + 72);
  long long v16 = *(_OWORD *)(a3 + 88);
  *((void *)v13 + 14) = *(void *)(a3 + 104);
  *((_OWORD *)v13 + 5) = v15;
  *((_OWORD *)v13 + 6) = v16;
  *((_OWORD *)v13 + 4) = v14;
  long long v17 = *(_OWORD *)(a3 + 8);
  long long v18 = *(_OWORD *)(a3 + 40);
  *((_OWORD *)v13 + 2) = *(_OWORD *)(a3 + 24);
  *((_OWORD *)v13 + 3) = v18;
  *((_OWORD *)v13 + 1) = v17;
  uint64_t v23 = v13 + 120;
  std::vector<std::pair<unsigned long long,waipc::timesync::KalmanEstimator>>::__swap_out_circular_buffer(a1, &__p);
  uint64_t v19 = a1[1];
  if (v23 != v22) {
    uint64_t v23 = &v22[(v23 - v22 - 120) % 0x78uLL];
  }
  if (__p) {
    operator delete(__p);
  }
  return v19;
}

void sub_226E02F70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::vector<std::pair<unsigned long long,waipc::timesync::KalmanEstimator>>::__swap_out_circular_buffer(uint64_t *result, void *a2)
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  uint64_t v4 = a2[1];
  if (v2 != *result)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = v4 + v5;
      *(void *)(v6 - 120) = *(void *)(v2 + v5 - 120);
      *(void *)(v6 - 112) = &unk_26DAF2E08;
      long long v7 = *(_OWORD *)(v2 + v5 - 104);
      long long v8 = *(_OWORD *)(v2 + v5 - 88);
      *(_OWORD *)(v6 - 72) = *(_OWORD *)(v2 + v5 - 72);
      *(_OWORD *)(v6 - 88) = v8;
      *(_OWORD *)(v6 - 104) = v7;
      long long v9 = *(_OWORD *)(v2 + v5 - 56);
      long long v10 = *(_OWORD *)(v2 + v5 - 40);
      long long v11 = *(_OWORD *)(v2 + v5 - 24);
      *(void *)(v6 - 8) = *(void *)(v2 + v5 - 8);
      *(_OWORD *)(v6 - 24) = v11;
      *(_OWORD *)(v6 - 40) = v10;
      *(_OWORD *)(v6 - 56) = v9;
      v5 -= 120;
    }
    while (v2 + v5 != v3);
    v4 += v5;
  }
  a2[1] = v4;
  uint64_t v12 = *result;
  *long double result = v4;
  a2[1] = v12;
  uint64_t v13 = result[1];
  result[1] = a2[2];
  a2[2] = v13;
  uint64_t v14 = result[2];
  result[2] = a2[3];
  a2[3] = v14;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long long,waipc::timesync::KalmanEstimator>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x222222222222223) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(120 * a2);
}

uint64_t std::pair<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>::pair[abi:ne180100]<waipc::timesync::BasebandProvider::bufferId const,waipc::timesync::BasebandService::bufferInfo,0>(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = *(NSObject **)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  if (v5)
  {
    dispatch_retain(v5);
    uint64_t v6 = *(NSObject **)(a1 + 32);
    if (v6) {
      dispatch_group_enter(v6);
    }
  }
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

void std::shared_ptr<waipc::timesync::BasebandService>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandService,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_226E031C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<waipc::timesync::BasebandService>::reset[abi:ne180100]((const os_unfair_lock **)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<waipc::timesync::BasebandService *,std::shared_ptr<waipc::timesync::BasebandService>::__shared_ptr_default_delete<waipc::timesync::BasebandService,waipc::timesync::BasebandService>,std::allocator<waipc::timesync::BasebandService>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A66A9D0);
}

const os_unfair_lock *std::__shared_ptr_pointer<waipc::timesync::BasebandService *,std::shared_ptr<waipc::timesync::BasebandService>::__shared_ptr_default_delete<waipc::timesync::BasebandService,waipc::timesync::BasebandService>,std::allocator<waipc::timesync::BasebandService>>::__on_zero_shared(uint64_t a1)
{
  long double result = *(const os_unfair_lock **)(a1 + 24);
  if (result)
  {
    waipc::timesync::BasebandService::~BasebandService(result);
    JUMPOUT(0x22A66A9D0);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<waipc::timesync::BasebandService *,std::shared_ptr<waipc::timesync::BasebandService>::__shared_ptr_default_delete<waipc::timesync::BasebandService,waipc::timesync::BasebandService>,std::allocator<waipc::timesync::BasebandService>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

const os_unfair_lock *std::unique_ptr<waipc::timesync::BasebandService>::reset[abi:ne180100](const os_unfair_lock **a1, const os_unfair_lock *a2)
{
  long double result = *a1;
  *a1 = a2;
  if (result)
  {
    waipc::timesync::BasebandService::~BasebandService(result);
    JUMPOUT(0x22A66A9D0);
  }
  return result;
}

void _ZNSt3__115allocate_sharedB8ne180100IN5waipc4util11BroadcasterIFvbPK10__CFStringEE7contextENS_9allocatorIS9_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(void *a1@<X8>)
{
  uint64_t v2 = (char *)operator new(0x60uLL);
  *((void *)v2 + 1) = 0;
  *((void *)v2 + 2) = 0;
  *(void *)uint64_t v2 = &unk_26DAF3008;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *((void *)v2 + 11) = 0;
  *(_OWORD *)(v2 + 24) = 0u;
  *a1 = v2 + 24;
  a1[1] = v2;

  std::shared_ptr<waipc::timesync::LegacyBasebandProvider>::__enable_weak_this[abi:ne180100]<waipc::timesync::BasebandProvider,waipc::timesync::LegacyBasebandProvider,void>((uint64_t)a1, (void *)v2 + 3, (uint64_t)(v2 + 24));
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context,std::allocator<waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAF3008;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context,std::allocator<waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAF3008;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A66A9D0);
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context,std::allocator<waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context>>::__on_zero_shared(uint64_t a1)
{
}

void std::__destroy_at[abi:ne180100]<waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context,0>(uint64_t a1)
{
  uint64_t v3 = (void **)(a1 + 48);
  std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v3 = (void **)(a1 + 24);
  std::vector<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
}

void std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 16;
        std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>,0>(v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>,0>(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 8);
  if (v1) {
    _Block_release(v1);
  }
}

void std::vector<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (const void **)**a1;
  if (v2)
  {
    uint64_t v4 = (const void **)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
        std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>,0>(--v4);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>,0>(const void **a1)
{
  uint64_t v1 = *a1;
  if (v1) {
    _Block_release(v1);
  }
}

void _ZNSt3__115allocate_sharedB8ne180100IN5waipc4util11BroadcasterIFvPKNS1_8timesync16BasebandProvider19timesyncMeasurementEmEE7contextENS_9allocatorISB_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(void *a1@<X8>)
{
  uint64_t v2 = (char *)operator new(0x60uLL);
  *((void *)v2 + 1) = 0;
  *((void *)v2 + 2) = 0;
  *(void *)uint64_t v2 = &unk_26DAF3058;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *((void *)v2 + 11) = 0;
  *(_OWORD *)(v2 + 24) = 0u;
  *a1 = v2 + 24;
  a1[1] = v2;

  std::shared_ptr<waipc::timesync::LegacyBasebandProvider>::__enable_weak_this[abi:ne180100]<waipc::timesync::BasebandProvider,waipc::timesync::LegacyBasebandProvider,void>((uint64_t)a1, (void *)v2 + 3, (uint64_t)(v2 + 24));
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context,std::allocator<waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAF3058;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context,std::allocator<waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAF3058;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A66A9D0);
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context,std::allocator<waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context>>::__on_zero_shared(uint64_t a1)
{
}

void std::__destroy_at[abi:ne180100]<waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context,0>(uint64_t a1)
{
  uint64_t v3 = (void **)(a1 + 48);
  std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v3 = (void **)(a1 + 24);
  std::vector<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
}

void std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 16;
        std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>,0>(v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>,0>(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 8);
  if (v1) {
    _Block_release(v1);
  }
}

void std::vector<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (const void **)**a1;
  if (v2)
  {
    uint64_t v4 = (const void **)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
        std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>,0>(--v4);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>,0>(const void **a1)
{
  uint64_t v1 = *a1;
  if (v1) {
    _Block_release(v1);
  }
}

void _ZNSt3__115allocate_sharedB8ne180100IN5waipc4util11BroadcasterIFvRKNS1_8timesync15KalmanEstimatorEbEE7contextENS_9allocatorISA_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(void *a1@<X8>)
{
  uint64_t v2 = (char *)operator new(0x60uLL);
  *((void *)v2 + 1) = 0;
  *((void *)v2 + 2) = 0;
  *(void *)uint64_t v2 = &unk_26DAF30A8;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *((void *)v2 + 11) = 0;
  *(_OWORD *)(v2 + 24) = 0u;
  *a1 = v2 + 24;
  a1[1] = v2;

  std::shared_ptr<waipc::timesync::LegacyBasebandProvider>::__enable_weak_this[abi:ne180100]<waipc::timesync::BasebandProvider,waipc::timesync::LegacyBasebandProvider,void>((uint64_t)a1, (void *)v2 + 3, (uint64_t)(v2 + 24));
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context,std::allocator<waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAF30A8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context,std::allocator<waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAF30A8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A66A9D0);
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context,std::allocator<waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context>>::__on_zero_shared(uint64_t a1)
{
}

void std::__destroy_at[abi:ne180100]<waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context,0>(uint64_t a1)
{
  uint64_t v3 = (void **)(a1 + 48);
  std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v3 = (void **)(a1 + 24);
  std::vector<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
}

void std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 16;
        std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>,0>(v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>,0>(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 8);
  if (v1) {
    _Block_release(v1);
  }
}

void std::vector<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (const void **)**a1;
  if (v2)
  {
    uint64_t v4 = (const void **)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
        std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>,0>(--v4);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>,0>(const void **a1)
{
  uint64_t v1 = *a1;
  if (v1) {
    _Block_release(v1);
  }
}

void std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::destroy(a1, a2[1]);
    uint64_t v4 = (std::__shared_weak_count *)a2[6];
    if (v4) {
      std::__shared_weak_count::__release_weak(v4);
    }
    operator delete(a2);
  }
}

void std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<waipc::timesync::BasebandProvider::bufferId const,waipc::timesync::BasebandService::bufferInfo>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<waipc::timesync::BasebandProvider::bufferId const,waipc::timesync::BasebandService::bufferInfo>,0>(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *(NSObject **)(a1 + 32);
    if (v3) {
      dispatch_release(v3);
    }
  }
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 16);
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

BOOL waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::hasObservers(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  uint64_t v3 = (uint64_t)(*(void *)(a1 + 32) - *(void *)(a1 + 24)) >> 3;
  for (uint64_t i = *(unsigned __int8 **)(a1 + 48); i != *(unsigned __int8 **)(a1 + 56); i += 16)
  {
    if (*i) {
      ++v3;
    }
    else {
      --v3;
    }
  }
  BOOL v6 = v3 != 0;
  os_unfair_lock_unlock(v2);
  return v6;
}

void waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::broadcast<BOOL,decltype(nullptr)>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  uint64_t v5 = *(void **)(a1 + 24);
  BOOL v6 = *(void **)(a1 + 32);
  while (v5 != v6)
  {
    if (*v5) {
      (*(void (**)(void, uint64_t, void))(*v5 + 16))(*v5, a2, 0);
    }
    ++v5;
  }
  os_unfair_lock_unlock(v4);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  os_unfair_lock_lock(v4);
  waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates(a1);
  os_unfair_lock_unlock(v4);

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
}

void sub_226E03D64(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  os_unfair_lock_unlock(v2);
  _Unwind_Resume(a1);
}

void waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates(uint64_t a1)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 20));
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  if (v2 != v3)
  {
    do
    {
      if (*(unsigned char *)v2)
      {
        std::vector<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>::push_back[abi:ne180100]((char **)(a1 + 24), (void **)(v2 + 8));
      }
      else
      {
        uint64_t v5 = *(const void ***)(a1 + 24);
        uint64_t v4 = *(const void ***)(a1 + 32);
        if (v5 != v4)
        {
          while (*v5 != *(const void **)(v2 + 8))
          {
            if (++v5 == v4)
            {
              uint64_t v5 = *(const void ***)(a1 + 32);
              break;
            }
          }
        }
        if (v5 == v4) {
          waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates();
        }
        std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> *,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> *,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> *>((uint64_t)&v10, v5 + 1, v4, v5);
        long long v7 = v6;
        long long v8 = *(const void ***)(a1 + 32);
        if (v8 != v6)
        {
          do
            std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>,0>(--v8);
          while (v8 != v7);
        }
        *(void *)(a1 + 32) = v7;
      }
      v2 += 16;
    }
    while (v2 != v3);
    uint64_t v2 = *(void *)(a1 + 48);
    for (uint64_t i = *(void *)(a1 + 56);
          i != v2;
          std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>,0>(i))
    {
      i -= 16;
    }
  }
  *(void *)(a1 + 56) = v2;
}

uint64_t std::vector<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>::push_back[abi:ne180100](char **a1, void **a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - (void)*a1) >> 3;
    if ((unint64_t)(v10 + 1) >> 61) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - (void)*a1;
    uint64_t v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    v24[4] = v4;
    if (v13)
    {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(v4, v13);
      uint64_t v16 = v15;
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v16 = 0;
    }
    long long v17 = &v14[8 * v10];
    std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> const&,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>*>(v17, a2);
    uint64_t v19 = *a1;
    long long v18 = a1[1];
    if (v18 == *a1)
    {
      long long v21 = v17;
    }
    else
    {
      long long v20 = a1[1];
      long long v21 = v17;
      do
      {
        uint64_t v22 = *((void *)v20 - 1);
        v20 -= 8;
        *((void *)v21 - 1) = v22;
        v21 -= 8;
        *(void *)long long v20 = 0;
      }
      while (v20 != v19);
    }
    long long v9 = v17 + 8;
    *a1 = v21;
    a1[1] = v17 + 8;
    uint64_t v23 = a1[2];
    a1[2] = &v14[8 * v16];
    void v24[2] = v18;
    v24[3] = v23;
    v24[0] = v19;
    v24[1] = v19;
    uint64_t result = std::__split_buffer<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>::~__split_buffer((uint64_t)v24);
  }
  else
  {
    uint64_t result = (uint64_t)std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> const&,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>*>(*(void **)(v4 - 8), a2);
    long long v9 = (char *)(v7 + 8);
  }
  a1[1] = v9;
  return result;
}

void *std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> const&,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>*>(void *a1, void **a2)
{
  uint64_t v3 = *a2;
  if (*a2) {
    uint64_t v3 = _Block_copy(v3);
  }
  *a1 = v3;
  return a1;
}

uint64_t std::__split_buffer<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>,0>((const void **)(i - 8));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

const void **std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> *,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> *,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> *>(uint64_t a1, const void **a2, const void **a3, const void **a4)
{
  unint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      unint64_t v7 = *v5;
      *unint64_t v5 = 0;
      long long v8 = *a4;
      *a4 = v7;
      if (v8) {
        _Block_release(v8);
      }
      ++v5;
      ++a4;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

uint64_t *std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      uint64_t v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      uint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  unint64_t v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      uint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  unint64_t v6 = (uint64_t **)v3[2];
  unint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *unint64_t v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      unint64_t v7 = 0;
      uint64_t result = (uint64_t *)v2;
    }
    else
    {
      unint64_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    *uint64_t v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      unint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      uint64_t *v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        uint64_t result = v7;
      }
      unint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    uint64_t v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      uint64_t v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *unint64_t v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        void v7[2] = (uint64_t)v15;
        uint64_t v16 = v7;
      }
      else
      {
        uint64_t v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      long long v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      void v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      *long long v24 = v23;
      goto LABEL_72;
    }
    uint64_t v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    long long v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      long long v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    unint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    void v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      uint64_t result = v7;
    }
    unint64_t v7 = *(uint64_t **)v12;
  }
  uint64_t v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  long long v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    long long v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    long long v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    uint64_t *v20 = (uint64_t)v7;
    void v7[2] = (uint64_t)v20;
    uint64_t v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  long long v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  void v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

void waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::broadcast<BOOL,__CFString const*>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  unint64_t v7 = *(void **)(a1 + 24);
  int v8 = *(void **)(a1 + 32);
  while (v7 != v8)
  {
    if (*v7) {
      (*(void (**)(void, uint64_t, uint64_t))(*v7 + 16))(*v7, a2, a3);
    }
    ++v7;
  }
  os_unfair_lock_unlock(v6);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  os_unfair_lock_lock(v6);
  waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates(a1);
  os_unfair_lock_unlock(v6);

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
}

void sub_226E04554(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  os_unfair_lock_unlock(v2);
  _Unwind_Resume(a1);
}

void waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context::broadcast<waipc::timesync::BasebandProvider::timesyncMeasurement*,unsigned long>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  unint64_t v7 = *(void **)(a1 + 24);
  int v8 = *(void **)(a1 + 32);
  while (v7 != v8)
  {
    if (*v7) {
      (*(void (**)(void, uint64_t, uint64_t))(*v7 + 16))(*v7, a2, a3);
    }
    ++v7;
  }
  os_unfair_lock_unlock(v6);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  os_unfair_lock_lock(v6);
  waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context::applyUpdates(a1);
  os_unfair_lock_unlock(v6);

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
}

void sub_226E04624(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  os_unfair_lock_unlock(v2);
  _Unwind_Resume(a1);
}

void waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context::applyUpdates(uint64_t a1)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 20));
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  if (v2 != v3)
  {
    do
    {
      if (*(unsigned char *)v2)
      {
        std::vector<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>::push_back[abi:ne180100]((char **)(a1 + 24), (void **)(v2 + 8));
      }
      else
      {
        int v5 = *(const void ***)(a1 + 24);
        uint64_t v4 = *(const void ***)(a1 + 32);
        if (v5 != v4)
        {
          while (*v5 != *(const void **)(v2 + 8))
          {
            if (++v5 == v4)
            {
              int v5 = *(const void ***)(a1 + 32);
              break;
            }
          }
        }
        if (v5 == v4) {
          waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates();
        }
        std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> *,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> *,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> *>((uint64_t)&v10, v5 + 1, v4, v5);
        unint64_t v7 = v6;
        int v8 = *(const void ***)(a1 + 32);
        if (v8 != v6)
        {
          do
            std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>,0>(--v8);
          while (v8 != v7);
        }
        *(void *)(a1 + 32) = v7;
      }
      v2 += 16;
    }
    while (v2 != v3);
    uint64_t v2 = *(void *)(a1 + 48);
    for (uint64_t i = *(void *)(a1 + 56);
          i != v2;
          std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>,0>(i))
    {
      i -= 16;
    }
  }
  *(void *)(a1 + 56) = v2;
}

uint64_t std::vector<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>::push_back[abi:ne180100](char **a1, void **a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - (void)*a1) >> 3;
    if ((unint64_t)(v10 + 1) >> 61) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - (void)*a1;
    uint64_t v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    v24[4] = v4;
    if (v13)
    {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(v4, v13);
      uint64_t v16 = v15;
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v16 = 0;
    }
    long long v17 = &v14[8 * v10];
    std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> const&,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>*>(v17, a2);
    uint64_t v19 = *a1;
    uint64_t v18 = a1[1];
    if (v18 == *a1)
    {
      BOOL v21 = v17;
    }
    else
    {
      long long v20 = a1[1];
      BOOL v21 = v17;
      do
      {
        uint64_t v22 = *((void *)v20 - 1);
        v20 -= 8;
        *((void *)v21 - 1) = v22;
        v21 -= 8;
        *(void *)long long v20 = 0;
      }
      while (v20 != v19);
    }
    uint64_t v9 = v17 + 8;
    *a1 = v21;
    a1[1] = v17 + 8;
    uint64_t v23 = a1[2];
    a1[2] = &v14[8 * v16];
    void v24[2] = v18;
    v24[3] = v23;
    v24[0] = v19;
    v24[1] = v19;
    uint64_t result = std::__split_buffer<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>::~__split_buffer((uint64_t)v24);
  }
  else
  {
    uint64_t result = (uint64_t)std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> const&,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>*>(*(void **)(v4 - 8), a2);
    uint64_t v9 = (char *)(v7 + 8);
  }
  a1[1] = v9;
  return result;
}

void *std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> const&,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>*>(void *a1, void **a2)
{
  uint64_t v3 = *a2;
  if (*a2) {
    uint64_t v3 = _Block_copy(v3);
  }
  *a1 = v3;
  return a1;
}

uint64_t std::__split_buffer<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>,0>((const void **)(i - 8));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

const void **std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> *,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> *,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> *>(uint64_t a1, const void **a2, const void **a3, const void **a4)
{
  unint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      unint64_t v7 = *v5;
      *unint64_t v5 = 0;
      int v8 = *a4;
      *a4 = v7;
      if (v8) {
        _Block_release(v8);
      }
      ++v5;
      ++a4;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::broadcast<waipc::timesync::KalmanEstimator,BOOL>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  unint64_t v7 = *(void **)(a1 + 24);
  int v8 = *(void **)(a1 + 32);
  while (v7 != v8)
  {
    if (*v7) {
      (*(void (**)(void, uint64_t, uint64_t))(*v7 + 16))(*v7, a2, a3);
    }
    ++v7;
  }
  os_unfair_lock_unlock(v6);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  os_unfair_lock_lock(v6);
  waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::applyUpdates(a1);
  os_unfair_lock_unlock(v6);

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
}

void sub_226E04A1C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  os_unfair_lock_unlock(v2);
  _Unwind_Resume(a1);
}

void waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::applyUpdates(uint64_t a1)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 20));
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  if (v2 != v3)
  {
    do
    {
      if (*(unsigned char *)v2)
      {
        std::vector<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>::push_back[abi:ne180100]((char **)(a1 + 24), (void **)(v2 + 8));
      }
      else
      {
        unint64_t v5 = *(const void ***)(a1 + 24);
        uint64_t v4 = *(const void ***)(a1 + 32);
        if (v5 != v4)
        {
          while (*v5 != *(const void **)(v2 + 8))
          {
            if (++v5 == v4)
            {
              unint64_t v5 = *(const void ***)(a1 + 32);
              break;
            }
          }
        }
        if (v5 == v4) {
          waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates();
        }
        std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> *,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> *,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> *>((uint64_t)&v10, v5 + 1, v4, v5);
        unint64_t v7 = v6;
        int v8 = *(const void ***)(a1 + 32);
        if (v8 != v6)
        {
          do
            std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>,0>(--v8);
          while (v8 != v7);
        }
        *(void *)(a1 + 32) = v7;
      }
      v2 += 16;
    }
    while (v2 != v3);
    uint64_t v2 = *(void *)(a1 + 48);
    for (uint64_t i = *(void *)(a1 + 56);
          i != v2;
          std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>,0>(i))
    {
      i -= 16;
    }
  }
  *(void *)(a1 + 56) = v2;
}

uint64_t std::vector<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>::push_back[abi:ne180100](char **a1, void **a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - (void)*a1) >> 3;
    if ((unint64_t)(v10 + 1) >> 61) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - (void)*a1;
    uint64_t v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    v24[4] = v4;
    if (v13)
    {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(v4, v13);
      uint64_t v16 = v15;
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v16 = 0;
    }
    long long v17 = &v14[8 * v10];
    std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> const&,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>*>(v17, a2);
    uint64_t v19 = *a1;
    uint64_t v18 = a1[1];
    if (v18 == *a1)
    {
      BOOL v21 = v17;
    }
    else
    {
      long long v20 = a1[1];
      BOOL v21 = v17;
      do
      {
        uint64_t v22 = *((void *)v20 - 1);
        v20 -= 8;
        *((void *)v21 - 1) = v22;
        v21 -= 8;
        *(void *)long long v20 = 0;
      }
      while (v20 != v19);
    }
    uint64_t v9 = v17 + 8;
    *a1 = v21;
    a1[1] = v17 + 8;
    uint64_t v23 = a1[2];
    a1[2] = &v14[8 * v16];
    void v24[2] = v18;
    v24[3] = v23;
    v24[0] = v19;
    v24[1] = v19;
    uint64_t result = std::__split_buffer<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>::~__split_buffer((uint64_t)v24);
  }
  else
  {
    uint64_t result = (uint64_t)std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> const&,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>*>(*(void **)(v4 - 8), a2);
    uint64_t v9 = (char *)(v7 + 8);
  }
  a1[1] = v9;
  return result;
}

void *std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> const&,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>*>(void *a1, void **a2)
{
  uint64_t v3 = *a2;
  if (*a2) {
    uint64_t v3 = _Block_copy(v3);
  }
  *a1 = v3;
  return a1;
}

uint64_t std::__split_buffer<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>,0>((const void **)(i - 8));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

const void **std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> *,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> *,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> *>(uint64_t a1, const void **a2, const void **a3, const void **a4)
{
  unint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      unint64_t v7 = *v5;
      *unint64_t v5 = 0;
      int v8 = *a4;
      *a4 = v7;
      if (v8) {
        _Block_release(v8);
      }
      ++v5;
      ++a4;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context::broadcast<unsigned long long,double,unsigned long long>(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  int v8 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  uint64_t v9 = *(void **)(a1 + 24);
  uint64_t v10 = *(void **)(a1 + 32);
  while (v9 != v10)
  {
    if (*v9) {
      (*(void (**)(void, uint64_t, uint64_t, double))(*v9 + 16))(*v9, a2, a3, a4);
    }
    ++v9;
  }
  os_unfair_lock_unlock(v8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  os_unfair_lock_lock(v8);
  waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context::applyUpdates(a1);
  os_unfair_lock_unlock(v8);

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
}

void sub_226E04E24(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  os_unfair_lock_unlock(v2);
  _Unwind_Resume(a1);
}

void waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context::applyUpdates(uint64_t a1)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 20));
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  if (v2 != v3)
  {
    do
    {
      if (*(unsigned char *)v2)
      {
        std::vector<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>::push_back[abi:ne180100]((char **)(a1 + 24), (void **)(v2 + 8));
      }
      else
      {
        unint64_t v5 = *(const void ***)(a1 + 24);
        uint64_t v4 = *(const void ***)(a1 + 32);
        if (v5 != v4)
        {
          while (*v5 != *(const void **)(v2 + 8))
          {
            if (++v5 == v4)
            {
              unint64_t v5 = *(const void ***)(a1 + 32);
              break;
            }
          }
        }
        if (v5 == v4) {
          waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates();
        }
        std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> *,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> *,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> *>((uint64_t)&v10, v5 + 1, v4, v5);
        unint64_t v7 = v6;
        int v8 = *(const void ***)(a1 + 32);
        if (v8 != v6)
        {
          do
            std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>,0>(--v8);
          while (v8 != v7);
        }
        *(void *)(a1 + 32) = v7;
      }
      v2 += 16;
    }
    while (v2 != v3);
    uint64_t v2 = *(void *)(a1 + 48);
    for (uint64_t i = *(void *)(a1 + 56);
          i != v2;
          std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>,0>(i))
    {
      i -= 16;
    }
  }
  *(void *)(a1 + 56) = v2;
}

uint64_t std::vector<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>::push_back[abi:ne180100](char **a1, void **a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - (void)*a1) >> 3;
    if ((unint64_t)(v10 + 1) >> 61) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - (void)*a1;
    uint64_t v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    v24[4] = v4;
    if (v13)
    {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::DictionaryRef>>(v4, v13);
      uint64_t v16 = v15;
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v16 = 0;
    }
    long long v17 = &v14[8 * v10];
    std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> const&,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>*>(v17, a2);
    uint64_t v19 = *a1;
    uint64_t v18 = a1[1];
    if (v18 == *a1)
    {
      BOOL v21 = v17;
    }
    else
    {
      long long v20 = a1[1];
      BOOL v21 = v17;
      do
      {
        uint64_t v22 = *((void *)v20 - 1);
        v20 -= 8;
        *((void *)v21 - 1) = v22;
        v21 -= 8;
        *(void *)long long v20 = 0;
      }
      while (v20 != v19);
    }
    uint64_t v9 = v17 + 8;
    *a1 = v21;
    a1[1] = v17 + 8;
    uint64_t v23 = a1[2];
    a1[2] = &v14[8 * v16];
    void v24[2] = v18;
    v24[3] = v23;
    v24[0] = v19;
    v24[1] = v19;
    uint64_t result = std::__split_buffer<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>::~__split_buffer((uint64_t)v24);
  }
  else
  {
    uint64_t result = (uint64_t)std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> const&,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>*>(*(void **)(v4 - 8), a2);
    uint64_t v9 = (char *)(v7 + 8);
  }
  a1[1] = v9;
  return result;
}

void *std::construct_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> const&,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>*>(void *a1, void **a2)
{
  uint64_t v3 = *a2;
  if (*a2) {
    uint64_t v3 = _Block_copy(v3);
  }
  *a1 = v3;
  return a1;
}

void std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>,0>(const void **a1)
{
  uint64_t v1 = *a1;
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t std::__split_buffer<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>,0>((const void **)(i - 8));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

const void **std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> *,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> *,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> *>(uint64_t a1, const void **a2, const void **a3, const void **a4)
{
  unint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      unint64_t v7 = *v5;
      *unint64_t v5 = 0;
      int v8 = *a4;
      *a4 = v7;
      if (v8) {
        _Block_release(v8);
      }
      ++v5;
      ++a4;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>,0>(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 8);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t *std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__equal_range_multi<waipc::timesync::BasebandProvider::bufferId>(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2 = (uint64_t *)(a1 + 8);
  uint64_t v3 = *(uint64_t **)(a1 + 8);
  if (!v3) {
    return v2;
  }
  unsigned int v4 = *a2;
  while (1)
  {
    unsigned int v5 = *((unsigned __int8 *)v3 + 32);
    if (v4 >= v5) {
      break;
    }
    uint64_t v2 = v3;
LABEL_7:
    uint64_t v3 = (uint64_t *)*v3;
    if (!v3) {
      return v2;
    }
  }
  if (v5 < v4)
  {
    ++v3;
    goto LABEL_7;
  }
  unint64_t v7 = (uint64_t **)*v3;
  uint64_t result = v3;
  if (*v3)
  {
    uint64_t result = v3;
    do
    {
      unsigned int v8 = *((unsigned __int8 *)v7 + 32);
      BOOL v9 = v8 >= v4;
      if (v8 >= v4) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      if (v9) {
        uint64_t result = (uint64_t *)v7;
      }
      unint64_t v7 = (uint64_t **)*v10;
    }
    while (*v10);
  }
  uint64_t v11 = v3[1];
  if (v11)
  {
    do
    {
      if (v4 >= *(unsigned __int8 *)(v11 + 32)) {
        uint64_t v12 = (uint64_t *)(v11 + 8);
      }
      else {
        uint64_t v12 = (uint64_t *)v11;
      }
      uint64_t v11 = *v12;
    }
    while (*v12);
  }
  return result;
}

void waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context::addObserver(uint64_t a1@<X0>, const void *a2@<X1>, void **a3@<X8>)
{
  v16[0] = 0;
  v16[1] = v16;
  _DWORD v16[2] = 0x3802000000;
  v16[3] = __Block_byref_object_copy__166;
  v16[4] = __Block_byref_object_dispose__167;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v10, (void *)a1);
  unint64_t v6 = (std::__shared_weak_count *)v11;
  v16[5] = v10;
  long long v17 = (std::__shared_weak_count *)v11;
  if (v11)
  {
    atomic_fetch_add_explicit(v11 + 2, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3002000000;
  unint64_t v13 = __Block_byref_object_copy__168;
  uint64_t v14 = __Block_byref_object_dispose__169;
  if (a2) {
    unint64_t v7 = _Block_copy(a2);
  }
  else {
    unint64_t v7 = 0;
  }
  uint64_t v15 = v7;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  char v9 = 1;
  std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> const&>((uint64_t *)(a1 + 48), &v9, (void **)v11 + 5);
  if (os_unfair_lock_trylock((os_unfair_lock_t)(a1 + 20)))
  {
    waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context::applyUpdates(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN5waipc4util11BroadcasterIFvPKNS_8timesync16BasebandProvider19timesyncMeasurementEmEE7context11addObserverEU13block_pointerS7__block_invoke;
  aBlock[3] = &unk_2647E8600;
  aBlock[4] = v16;
  aBlock[5] = &v10;
  void aBlock[6] = a1;
  *a3 = _Block_copy(aBlock);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  _Block_object_dispose(&v10, 8);
  if (v15) {
    _Block_release(v15);
  }
  _Block_object_dispose(v16, 8);
  if (v17) {
    std::__shared_weak_count::__release_weak(v17);
  }
}

void sub_226E05418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *aBlock)
{
  os_unfair_lock_unlock(v23);
  _Block_object_dispose(&a18, 8);
  if (aBlock) {
    _Block_release(aBlock);
  }
  _Block_object_dispose((const void *)(v24 - 88), 8);
  uint64_t v26 = *(std::__shared_weak_count **)(v24 - 40);
  if (v26) {
    std::__shared_weak_count::__release_weak(v26);
  }
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__166(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __Block_byref_object_dispose__167(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void *__Block_byref_object_copy__168(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 40);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__169(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> const&>(uint64_t *a1, unsigned char *a2, void **a3)
{
  unint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  unint64_t v7 = v8;
  unint64_t v9 = *(void *)(v6 - 8);
  if (v9 >= v8)
  {
    uint64_t v11 = (uint64_t)(v9 - *a1) >> 4;
    if ((unint64_t)(v11 + 1) >> 60) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v7 - *a1;
    uint64_t v13 = v12 >> 3;
    if (v12 >> 3 <= (unint64_t)(v11 + 1)) {
      uint64_t v13 = v11 + 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    v26[4] = v6;
    if (v14)
    {
      uint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>>(v6, v14);
      uint64_t v17 = v16;
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v17 = 0;
    }
    uint64_t v18 = std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> const&,0>((uint64_t)&v15[16 * v11], a2, a3);
    uint64_t v20 = *a1;
    uint64_t v19 = a1[1];
    if (v19 == *a1)
    {
      uint64_t v22 = v18;
    }
    else
    {
      uint64_t v21 = a1[1];
      uint64_t v22 = v18;
      do
      {
        char v23 = *(unsigned char *)(v21 - 16);
        v21 -= 16;
        *(unsigned char *)(v22 - 16) = v23;
        v22 -= 16;
        *(void *)(v22 + 8) = *(void *)(v21 + 8);
        *(void *)(v21 + 8) = 0;
      }
      while (v21 != v20);
    }
    uint64_t v10 = v18 + 16;
    *a1 = v22;
    a1[1] = v18 + 16;
    uint64_t v24 = a1[2];
    a1[2] = (uint64_t)&v15[16 * v17];
    v26[2] = v19;
    v26[3] = v24;
    v26[0] = v20;
    v26[1] = v20;
    std::__split_buffer<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>::~__split_buffer((uint64_t)v26);
  }
  else
  {
    std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> const&,0>(*(void *)(v6 - 8), a2, a3);
    uint64_t v10 = v9 + 16;
  }
  a1[1] = v10;
  return v10 - 16;
}

void ___ZN5waipc4util11BroadcasterIFvPKNS_8timesync16BasebandProvider19timesyncMeasurementEmEE7context11addObserverEU13block_pointerS7__block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 8);
  uint64_t v3 = *(std::__shared_weak_count **)(v2 + 48);
  if (v3)
  {
    uint64_t v4 = a1[6];
    unsigned int v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      uint64_t v6 = v5;
      if (*(void *)(v2 + 40))
      {
        os_unfair_lock_lock((os_unfair_lock_t)(v4 + 16));
        char v7 = 0;
        std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> const&>((uint64_t *)(v4 + 48), &v7, (void **)(*(void *)(a1[5] + 8) + 40));
        if (os_unfair_lock_trylock((os_unfair_lock_t)(v4 + 20)))
        {
          waipc::util::Broadcaster<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>::context::applyUpdates(v4);
          os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 20));
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 16));
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void sub_226E056E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)> const&,0>(uint64_t a1, unsigned char *a2, void **a3)
{
  *(unsigned char *)a1 = *a2;
  uint64_t v4 = *a3;
  if (*a3) {
    uint64_t v4 = _Block_copy(v4);
  }
  *(void *)(a1 + 8) = v4;
  return a1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

uint64_t std::__split_buffer<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 16;
    std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>,0>(i - 16);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::addObserver(uint64_t a1@<X0>, const void *a2@<X1>, void **a3@<X8>)
{
  v16[0] = 0;
  v16[1] = v16;
  _DWORD v16[2] = 0x3802000000;
  v16[3] = __Block_byref_object_copy__171;
  v16[4] = __Block_byref_object_dispose__172;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v10, (void *)a1);
  uint64_t v6 = (std::__shared_weak_count *)v11;
  v16[5] = v10;
  uint64_t v17 = (std::__shared_weak_count *)v11;
  if (v11)
  {
    atomic_fetch_add_explicit(v11 + 2, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3002000000;
  uint64_t v13 = __Block_byref_object_copy__173;
  unint64_t v14 = __Block_byref_object_dispose__174;
  if (a2) {
    char v7 = _Block_copy(a2);
  }
  else {
    char v7 = 0;
  }
  uint64_t v15 = v7;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  char v9 = 1;
  std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> const&>((uint64_t *)(a1 + 48), &v9, (void **)v11 + 5);
  if (os_unfair_lock_trylock((os_unfair_lock_t)(a1 + 20)))
  {
    waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN5waipc4util11BroadcasterIFvbPK10__CFStringEE7context11addObserverEU13block_pointerS5__block_invoke;
  aBlock[3] = &unk_2647E8628;
  aBlock[4] = v16;
  aBlock[5] = &v10;
  void aBlock[6] = a1;
  *a3 = _Block_copy(aBlock);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  _Block_object_dispose(&v10, 8);
  if (v15) {
    _Block_release(v15);
  }
  _Block_object_dispose(v16, 8);
  if (v17) {
    std::__shared_weak_count::__release_weak(v17);
  }
}

void sub_226E05998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *aBlock)
{
  os_unfair_lock_unlock(v23);
  _Block_object_dispose(&a18, 8);
  if (aBlock) {
    _Block_release(aBlock);
  }
  _Block_object_dispose((const void *)(v24 - 88), 8);
  uint64_t v26 = *(std::__shared_weak_count **)(v24 - 40);
  if (v26) {
    std::__shared_weak_count::__release_weak(v26);
  }
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__171(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __Block_byref_object_dispose__172(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void *__Block_byref_object_copy__173(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 40);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__174(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> const&>(uint64_t *a1, unsigned char *a2, void **a3)
{
  unint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  unint64_t v7 = v8;
  unint64_t v9 = *(void *)(v6 - 8);
  if (v9 >= v8)
  {
    uint64_t v11 = (uint64_t)(v9 - *a1) >> 4;
    if ((unint64_t)(v11 + 1) >> 60) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v7 - *a1;
    uint64_t v13 = v12 >> 3;
    if (v12 >> 3 <= (unint64_t)(v11 + 1)) {
      uint64_t v13 = v11 + 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    v26[4] = v6;
    if (v14)
    {
      uint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>>(v6, v14);
      uint64_t v17 = v16;
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v17 = 0;
    }
    uint64_t v18 = std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> const&,0>((uint64_t)&v15[16 * v11], a2, a3);
    uint64_t v20 = *a1;
    uint64_t v19 = a1[1];
    if (v19 == *a1)
    {
      uint64_t v22 = v18;
    }
    else
    {
      uint64_t v21 = a1[1];
      uint64_t v22 = v18;
      do
      {
        char v23 = *(unsigned char *)(v21 - 16);
        v21 -= 16;
        *(unsigned char *)(v22 - 16) = v23;
        v22 -= 16;
        *(void *)(v22 + 8) = *(void *)(v21 + 8);
        *(void *)(v21 + 8) = 0;
      }
      while (v21 != v20);
    }
    uint64_t v10 = v18 + 16;
    *a1 = v22;
    a1[1] = v18 + 16;
    uint64_t v24 = a1[2];
    a1[2] = (uint64_t)&v15[16 * v17];
    v26[2] = v19;
    v26[3] = v24;
    v26[0] = v20;
    v26[1] = v20;
    std::__split_buffer<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>>::~__split_buffer((uint64_t)v26);
  }
  else
  {
    std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> const&,0>(*(void *)(v6 - 8), a2, a3);
    uint64_t v10 = v9 + 16;
  }
  a1[1] = v10;
  return v10 - 16;
}

void ___ZN5waipc4util11BroadcasterIFvbPK10__CFStringEE7context11addObserverEU13block_pointerS5__block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 8);
  uint64_t v3 = *(std::__shared_weak_count **)(v2 + 48);
  if (v3)
  {
    uint64_t v4 = a1[6];
    unsigned int v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      uint64_t v6 = v5;
      if (*(void *)(v2 + 40))
      {
        os_unfair_lock_lock((os_unfair_lock_t)(v4 + 16));
        char v7 = 0;
        std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> const&>((uint64_t *)(v4 + 48), &v7, (void **)(*(void *)(a1[5] + 8) + 40));
        if (os_unfair_lock_trylock((os_unfair_lock_t)(v4 + 20)))
        {
          waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates(v4);
          os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 20));
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 16));
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void sub_226E05C60(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)> const&,0>(uint64_t a1, unsigned char *a2, void **a3)
{
  *(unsigned char *)a1 = *a2;
  uint64_t v4 = *a3;
  if (*a3) {
    uint64_t v4 = _Block_copy(v4);
  }
  *(void *)(a1 + 8) = v4;
  return a1;
}

uint64_t std::__split_buffer<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 16;
    std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(BOOL,__CFString const*)>>,0>(i - 16);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::addObserver(uint64_t a1@<X0>, const void *a2@<X1>, void **a3@<X8>)
{
  v16[0] = 0;
  v16[1] = v16;
  _DWORD v16[2] = 0x3802000000;
  v16[3] = __Block_byref_object_copy__176;
  v16[4] = __Block_byref_object_dispose__177;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v10, (void *)a1);
  uint64_t v6 = (std::__shared_weak_count *)v11;
  v16[5] = v10;
  uint64_t v17 = (std::__shared_weak_count *)v11;
  if (v11)
  {
    atomic_fetch_add_explicit(v11 + 2, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3002000000;
  uint64_t v13 = __Block_byref_object_copy__178;
  unint64_t v14 = __Block_byref_object_dispose__179;
  if (a2) {
    char v7 = _Block_copy(a2);
  }
  else {
    char v7 = 0;
  }
  uint64_t v15 = v7;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  char v9 = 1;
  std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> const&>((uint64_t *)(a1 + 48), &v9, (void **)v11 + 5);
  if (os_unfair_lock_trylock((os_unfair_lock_t)(a1 + 20)))
  {
    waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::applyUpdates(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN5waipc4util11BroadcasterIFvRKNS_8timesync15KalmanEstimatorEbEE7context11addObserverEU13block_pointerS6__block_invoke;
  aBlock[3] = &unk_2647E8650;
  aBlock[4] = v16;
  aBlock[5] = &v10;
  void aBlock[6] = a1;
  *a3 = _Block_copy(aBlock);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  _Block_object_dispose(&v10, 8);
  if (v15) {
    _Block_release(v15);
  }
  _Block_object_dispose(v16, 8);
  if (v17) {
    std::__shared_weak_count::__release_weak(v17);
  }
}

void sub_226E05EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *aBlock)
{
  os_unfair_lock_unlock(v23);
  _Block_object_dispose(&a18, 8);
  if (aBlock) {
    _Block_release(aBlock);
  }
  _Block_object_dispose((const void *)(v24 - 88), 8);
  uint64_t v26 = *(std::__shared_weak_count **)(v24 - 40);
  if (v26) {
    std::__shared_weak_count::__release_weak(v26);
  }
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__176(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __Block_byref_object_dispose__177(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void *__Block_byref_object_copy__178(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 40);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__179(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> const&>(uint64_t *a1, unsigned char *a2, void **a3)
{
  unint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  unint64_t v7 = v8;
  unint64_t v9 = *(void *)(v6 - 8);
  if (v9 >= v8)
  {
    uint64_t v11 = (uint64_t)(v9 - *a1) >> 4;
    if ((unint64_t)(v11 + 1) >> 60) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v7 - *a1;
    uint64_t v13 = v12 >> 3;
    if (v12 >> 3 <= (unint64_t)(v11 + 1)) {
      uint64_t v13 = v11 + 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    v26[4] = v6;
    if (v14)
    {
      uint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>>(v6, v14);
      uint64_t v17 = v16;
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v17 = 0;
    }
    uint64_t v18 = std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> const&,0>((uint64_t)&v15[16 * v11], a2, a3);
    uint64_t v20 = *a1;
    uint64_t v19 = a1[1];
    if (v19 == *a1)
    {
      uint64_t v22 = v18;
    }
    else
    {
      uint64_t v21 = a1[1];
      uint64_t v22 = v18;
      do
      {
        char v23 = *(unsigned char *)(v21 - 16);
        v21 -= 16;
        *(unsigned char *)(v22 - 16) = v23;
        v22 -= 16;
        *(void *)(v22 + 8) = *(void *)(v21 + 8);
        *(void *)(v21 + 8) = 0;
      }
      while (v21 != v20);
    }
    uint64_t v10 = v18 + 16;
    *a1 = v22;
    a1[1] = v18 + 16;
    uint64_t v24 = a1[2];
    a1[2] = (uint64_t)&v15[16 * v17];
    v26[2] = v19;
    v26[3] = v24;
    v26[0] = v20;
    v26[1] = v20;
    std::__split_buffer<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>>::~__split_buffer((uint64_t)v26);
  }
  else
  {
    std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> const&,0>(*(void *)(v6 - 8), a2, a3);
    uint64_t v10 = v9 + 16;
  }
  a1[1] = v10;
  return v10 - 16;
}

void ___ZN5waipc4util11BroadcasterIFvRKNS_8timesync15KalmanEstimatorEbEE7context11addObserverEU13block_pointerS6__block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 8);
  uint64_t v3 = *(std::__shared_weak_count **)(v2 + 48);
  if (v3)
  {
    uint64_t v4 = a1[6];
    unsigned int v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      uint64_t v6 = v5;
      if (*(void *)(v2 + 40))
      {
        os_unfair_lock_lock((os_unfair_lock_t)(v4 + 16));
        char v7 = 0;
        std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> const&>((uint64_t *)(v4 + 48), &v7, (void **)(*(void *)(a1[5] + 8) + 40));
        if (os_unfair_lock_trylock((os_unfair_lock_t)(v4 + 20)))
        {
          waipc::util::Broadcaster<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>::context::applyUpdates(v4);
          os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 20));
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 16));
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void sub_226E061A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)> const&,0>(uint64_t a1, unsigned char *a2, void **a3)
{
  *(unsigned char *)a1 = *a2;
  uint64_t v4 = *a3;
  if (*a3) {
    uint64_t v4 = _Block_copy(v4);
  }
  *(void *)(a1 + 8) = v4;
  return a1;
}

uint64_t std::__split_buffer<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 16;
    std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::KalmanEstimator const&,BOOL)>>,0>(i - 16);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context::addObserver(uint64_t a1@<X0>, const void *a2@<X1>, void **a3@<X8>)
{
  v16[0] = 0;
  v16[1] = v16;
  _DWORD v16[2] = 0x3802000000;
  v16[3] = __Block_byref_object_copy__181;
  v16[4] = __Block_byref_object_dispose__182;
  std::shared_ptr<waipc::timesync::BasebandProvider>::shared_ptr[abi:ne180100]<waipc::timesync::BasebandProvider,void>(&v10, (void *)a1);
  uint64_t v6 = (std::__shared_weak_count *)v11;
  v16[5] = v10;
  uint64_t v17 = (std::__shared_weak_count *)v11;
  if (v11)
  {
    atomic_fetch_add_explicit(v11 + 2, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3002000000;
  uint64_t v13 = __Block_byref_object_copy__183;
  unint64_t v14 = __Block_byref_object_dispose__184;
  if (a2) {
    char v7 = _Block_copy(a2);
  }
  else {
    char v7 = 0;
  }
  uint64_t v15 = v7;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  char v9 = 1;
  std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> const&>((uint64_t *)(a1 + 48), &v9, (void **)v11 + 5);
  if (os_unfair_lock_trylock((os_unfair_lock_t)(a1 + 20)))
  {
    waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context::applyUpdates(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN5waipc4util11BroadcasterIFvydyEE7context11addObserverEU13block_pointerS2__block_invoke;
  aBlock[3] = &unk_2647E8678;
  aBlock[4] = v16;
  aBlock[5] = &v10;
  void aBlock[6] = a1;
  *a3 = _Block_copy(aBlock);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  _Block_object_dispose(&v10, 8);
  if (v15) {
    _Block_release(v15);
  }
  _Block_object_dispose(v16, 8);
  if (v17) {
    std::__shared_weak_count::__release_weak(v17);
  }
}

void sub_226E06428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *aBlock)
{
  os_unfair_lock_unlock(v23);
  _Block_object_dispose(&a18, 8);
  if (aBlock) {
    _Block_release(aBlock);
  }
  _Block_object_dispose((const void *)(v24 - 88), 8);
  uint64_t v26 = *(std::__shared_weak_count **)(v24 - 40);
  if (v26) {
    std::__shared_weak_count::__release_weak(v26);
  }
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__181(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __Block_byref_object_dispose__182(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void *__Block_byref_object_copy__183(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 40);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__184(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> const&>(uint64_t *a1, unsigned char *a2, void **a3)
{
  unint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  unint64_t v7 = v8;
  unint64_t v9 = *(void *)(v6 - 8);
  if (v9 >= v8)
  {
    uint64_t v11 = (uint64_t)(v9 - *a1) >> 4;
    if ((unint64_t)(v11 + 1) >> 60) {
      std::vector<std::pair<unsigned long long,waipc::timesync::BasebandProvider::deviceTimestamp>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v7 - *a1;
    uint64_t v13 = v12 >> 3;
    if (v12 >> 3 <= (unint64_t)(v11 + 1)) {
      uint64_t v13 = v11 + 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    v26[4] = v6;
    if (v14)
    {
      uint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(waipc::timesync::BasebandProvider::timesyncMeasurement const*,unsigned long)>>>>(v6, v14);
      uint64_t v17 = v16;
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v17 = 0;
    }
    uint64_t v18 = std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> const&,0>((uint64_t)&v15[16 * v11], a2, a3);
    uint64_t v20 = *a1;
    uint64_t v19 = a1[1];
    if (v19 == *a1)
    {
      uint64_t v22 = v18;
    }
    else
    {
      uint64_t v21 = a1[1];
      uint64_t v22 = v18;
      do
      {
        char v23 = *(unsigned char *)(v21 - 16);
        v21 -= 16;
        *(unsigned char *)(v22 - 16) = v23;
        v22 -= 16;
        *(void *)(v22 + 8) = *(void *)(v21 + 8);
        *(void *)(v21 + 8) = 0;
      }
      while (v21 != v20);
    }
    uint64_t v10 = v18 + 16;
    *a1 = v22;
    a1[1] = v18 + 16;
    uint64_t v24 = a1[2];
    a1[2] = (uint64_t)&v15[16 * v17];
    v26[2] = v19;
    v26[3] = v24;
    v26[0] = v20;
    v26[1] = v20;
    std::__split_buffer<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>>::~__split_buffer((uint64_t)v26);
  }
  else
  {
    std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> const&,0>(*(void *)(v6 - 8), a2, a3);
    uint64_t v10 = v9 + 16;
  }
  a1[1] = v10;
  return v10 - 16;
}

void ___ZN5waipc4util11BroadcasterIFvydyEE7context11addObserverEU13block_pointerS2__block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 8);
  uint64_t v3 = *(std::__shared_weak_count **)(v2 + 48);
  if (v3)
  {
    uint64_t v4 = a1[6];
    unsigned int v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      uint64_t v6 = v5;
      if (*(void *)(v2 + 40))
      {
        os_unfair_lock_lock((os_unfair_lock_t)(v4 + 16));
        char v7 = 0;
        std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>>::emplace_back<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> const&>((uint64_t *)(v4 + 48), &v7, (void **)(*(void *)(a1[5] + 8) + 40));
        if (os_unfair_lock_trylock((os_unfair_lock_t)(v4 + 20)))
        {
          waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context::applyUpdates(v4);
          os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 20));
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 16));
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void sub_226E066F0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>::pair[abi:ne180100]<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)> const&,0>(uint64_t a1, unsigned char *a2, void **a3)
{
  *(unsigned char *)a1 = *a2;
  uint64_t v4 = *a3;
  if (*a3) {
    uint64_t v4 = _Block_copy(v4);
  }
  *(void *)(a1 + 8) = v4;
  return a1;
}

uint64_t std::__split_buffer<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 16;
    std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>,0>(i - 16);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t *std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::erase(uint64_t **a1, uint64_t *a2)
{
  uint64_t v3 = std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__remove_node_pointer(a1, a2);
  uint64_t v4 = (std::__shared_weak_count *)a2[6];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  operator delete(a2);
  return v3;
}

void _ZNSt3__115allocate_sharedB8ne180100IN5waipc4util11BroadcasterIFvydyEE7contextENS_9allocatorIS6_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(void *a1@<X8>)
{
  uint64_t v2 = (char *)operator new(0x60uLL);
  *((void *)v2 + 1) = 0;
  *((void *)v2 + 2) = 0;
  *(void *)uint64_t v2 = &unk_26DAF30F8;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *((void *)v2 + 11) = 0;
  *(_OWORD *)(v2 + 24) = 0u;
  *a1 = v2 + 24;
  a1[1] = v2;

  std::shared_ptr<waipc::timesync::LegacyBasebandProvider>::__enable_weak_this[abi:ne180100]<waipc::timesync::BasebandProvider,waipc::timesync::LegacyBasebandProvider,void>((uint64_t)a1, (void *)v2 + 3, (uint64_t)(v2 + 24));
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context,std::allocator<waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAF30F8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context,std::allocator<waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAF30F8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A66A9D0);
}

void std::__shared_ptr_emplace<waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context,std::allocator<waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context>>::__on_zero_shared(uint64_t a1)
{
}

void std::__destroy_at[abi:ne180100]<waipc::util::Broadcaster<void ()(unsigned long long,double,unsigned long long)>::context,0>(uint64_t a1)
{
  uint64_t v3 = (void **)(a1 + 48);
  std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v3 = (void **)(a1 + 24);
  std::vector<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
}

void std::vector<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unsigned int v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 16;
        std::__destroy_at[abi:ne180100]<std::pair<BOOL,applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>,0>(v4);
      }
      while ((void *)v4 != v2);
      unsigned int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (const void **)**a1;
  if (v2)
  {
    uint64_t v4 = (const void **)v1[1];
    unsigned int v5 = **a1;
    if (v4 != v2)
    {
      do
        std::__destroy_at[abi:ne180100]<applesauce::dispatch::v1::block<void ()(unsigned long long,double,unsigned long long)>,0>(--v4);
      while (v4 != v2);
      unsigned int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__shared_ptr_emplace<waipc::timesync::BasebandService::timestampSubscription>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAF3148;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<waipc::timesync::BasebandService::timestampSubscription>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26DAF3148;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x22A66A9D0);
}

void std::__shared_ptr_emplace<waipc::timesync::BasebandService::timestampSubscription>::__on_zero_shared(uint64_t a1)
{
}

void std::__destroy_at[abi:ne180100]<waipc::timesync::BasebandService::timestampSubscription,0>(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 56);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *(NSObject **)(a1 + 56);
    if (v3) {
      dispatch_release(v3);
    }
  }
  waipc::util::GuardBlock::~GuardBlock((const void **)(a1 + 48));
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 40);
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

uint64_t **std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::__emplace_unique_key_args<waipc::timesync::BasebandProvider::timestampId,std::piecewise_construct_t const&,std::tuple<waipc::timesync::BasebandProvider::timestampId const&>,std::tuple<>>(uint64_t **a1, unsigned __int8 *a2, uint64_t a3, unsigned char **a4)
{
  char v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    unsigned int v8 = *a2;
    while (1)
    {
      while (1)
      {
        unint64_t v9 = (uint64_t **)v6;
        unsigned int v10 = *((unsigned __int8 *)v6 + 32);
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        char v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        char v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    unint64_t v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = operator new(0x38uLL);
    v11[32] = **a4;
    *((void *)v11 + 5) = 0;
    *((void *)v11 + 6) = 0;
    std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t *std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  unsigned int v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), unsigned int v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            unint64_t v9 = (uint64_t **)v2[1];
            unsigned int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              _WORD v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            void v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *unint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *uint64_t v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), unsigned int v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *unsigned int v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__emplace_hint_multi<std::pair<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>(void *a1, void *a2, uint64_t a3)
{
  int v6 = a1 + 1;
  uint64_t v7 = (char *)operator new(0x50uLL);
  char v8 = *(unsigned char *)a3;
  *(_OWORD *)(v7 + 40) = *(_OWORD *)(a3 + 8);
  uint64_t v9 = *(void *)(a3 + 32);
  *((void *)v7 + 7) = *(void *)(a3 + 24);
  *((void *)v7 + 8) = v9;
  v7[72] = *(unsigned char *)(a3 + 40);
  v7[32] = v8;
  v14[0] = (uint64_t *)v7;
  v14[1] = v6;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 32) = 0;
  char v15 = 1;
  leaf = (uint64_t **)std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__find_leaf(a1, a2, &v13, (unsigned __int8 *)v7 + 32);
  std::__tree<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::__map_value_compare<waipc::timesync::BasebandProvider::timestampId,std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>,std::less<waipc::timesync::BasebandProvider::timestampId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::timestampId,std::weak_ptr<waipc::timesync::BasebandService::timestampSubscription>>>>::__insert_node_at((uint64_t **)a1, v13, leaf, v14[0]);
  uint64_t v11 = v14[0];
  v14[0] = 0;
  std::unique_ptr<std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,void *>>>>::reset[abi:ne180100]((uint64_t)v14, 0);
  return v11;
}

void sub_226E06E88(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void *std::__tree<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::__map_value_compare<waipc::timesync::BasebandProvider::bufferId,std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,std::less<waipc::timesync::BasebandProvider::bufferId>,true>,std::allocator<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>>>::__find_leaf(void *a1, void *a2, void *a3, unsigned __int8 *a4)
{
  uint64_t v4 = a1 + 1;
  if (a1 + 1 != a2)
  {
    unsigned int v5 = *a4;
    if (*((unsigned __int8 *)a2 + 32) < v5)
    {
      while (1)
      {
        uint64_t v6 = *v4;
        a2 = v4;
        if (!*v4) {
          break;
        }
        while (1)
        {
          uint64_t v4 = (void *)v6;
          if (*(unsigned __int8 *)(v6 + 32) >= v5) {
            break;
          }
          uint64_t v6 = *(void *)(v6 + 8);
          if (!v6) {
            goto LABEL_19;
          }
        }
      }
LABEL_20:
      *a3 = v4;
      return a2;
    }
  }
  uint64_t v7 = *a2;
  if ((void *)*a1 == a2)
  {
    uint64_t v9 = a2;
  }
  else
  {
    if (v7)
    {
      char v8 = (void *)*a2;
      do
      {
        uint64_t v9 = v8;
        char v8 = (void *)v8[1];
      }
      while (v8);
    }
    else
    {
      unsigned int v10 = a2;
      do
      {
        uint64_t v9 = (void *)v10[2];
        BOOL v11 = *v9 == (void)v10;
        unsigned int v10 = v9;
      }
      while (v11);
    }
    unsigned int v12 = *a4;
    if (v12 < *((unsigned __int8 *)v9 + 32))
    {
      while (1)
      {
        uint64_t v13 = *v4;
        a2 = v4;
        if (!*v4) {
          goto LABEL_20;
        }
        while (1)
        {
          uint64_t v4 = (void *)v13;
          if (v12 < *(unsigned __int8 *)(v13 + 32)) {
            break;
          }
          uint64_t v13 = *(void *)(v13 + 8);
          if (!v13)
          {
LABEL_19:
            a2 = v4 + 1;
            goto LABEL_20;
          }
        }
      }
    }
  }
  if (v7)
  {
    *a3 = v9;
    return v9 + 1;
  }
  else
  {
    *a3 = a2;
  }
  return a2;
}

void std::unique_ptr<std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<waipc::timesync::BasebandProvider::bufferId,waipc::timesync::BasebandService::bufferInfo>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<waipc::timesync::BasebandProvider::bufferId const,waipc::timesync::BasebandService::bufferInfo>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void *waipc::util::_kv::_kv<double,void>(void *a1, uint64_t a2, uint64_t *a3)
{
  *a1 = a2;
  uint64_t valuePtr = *a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x22A66A950](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_226E07074(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

mach_vm_address_t *waipc::MappableBuffer::MappableBuffer(mach_vm_address_t *this, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  unint64_t v2 = ~*MEMORY[0x263EF8AE8] & (unint64_t)(*MEMORY[0x263EF8AE8] + a2);
  v4[0] = 0;
  v4[1] = v2;
  int v5 = 0;
  return waipc::MappableBuffer::MappableBuffer(this, a2, (uint64_t)v4, 1);
}

{
  unint64_t v2;
  void v4[2];
  int v5;
  uint64_t v6;

  uint64_t v6 = *MEMORY[0x263EF8340];
  unint64_t v2 = ~*MEMORY[0x263EF8AE8] & (unint64_t)(*MEMORY[0x263EF8AE8] + a2);
  v4[0] = 0;
  v4[1] = v2;
  int v5 = 0;
  return waipc::MappableBuffer::MappableBuffer(this, a2, (uint64_t)v4, 1);
}

mach_vm_address_t *waipc::MappableBuffer::MappableBuffer(mach_vm_address_t *this, uint64_t a2, int a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  unint64_t v3 = ~*MEMORY[0x263EF8AE8] & (unint64_t)(*MEMORY[0x263EF8AE8] + a2);
  v5[0] = 0;
  v5[1] = v3;
  int v6 = a3;
  return waipc::MappableBuffer::MappableBuffer(this, a2, (uint64_t)v5, 1);
}

{
  unint64_t v3;
  void v5[2];
  int v6;
  uint64_t v7;

  uint64_t v7 = *MEMORY[0x263EF8340];
  unint64_t v3 = ~*MEMORY[0x263EF8AE8] & (unint64_t)(*MEMORY[0x263EF8AE8] + a2);
  v5[0] = 0;
  v5[1] = v3;
  int v6 = a3;
  return waipc::MappableBuffer::MappableBuffer(this, a2, (uint64_t)v5, 1);
}

mach_vm_address_t *waipc::MappableBuffer::MappableBuffer(mach_vm_address_t *address, uint64_t a2, uint64_t a3, uint64_t a4)
{
  kern_return_t v10;
  kern_return_t v11;
  NSObject *Logger;
  const char *v13;
  mach_vm_address_t v14;
  uint64_t v15;
  vm_prot_t *v16;
  uint64_t v17;
  uint64_t v18;
  mach_vm_size_t v19;
  kern_return_t v20;
  kern_return_t v21;
  kern_return_t v22;
  kern_return_t v23;
  int v25;
  kern_return_t v26;
  uint64_t v27;

  uint64_t v27 = *MEMORY[0x263EF8340];
  *address = 0;
  address[1] = 0;
  address[2] = 0;
  uint64_t v7 = (uint64_t *)MEMORY[0x263EF8AE8];
  mach_vm_size_t v8 = ~*MEMORY[0x263EF8AE8] & (unint64_t)(*MEMORY[0x263EF8AE8] + a2);
  uint64_t v9 = (vm_map_t *)MEMORY[0x263EF8960];
  unsigned int v10 = mach_vm_allocate(*MEMORY[0x263EF8960], address, v8, 1);
  if (v10)
  {
    BOOL v11 = v10;
    Logger = waipc::logging::getLogger(3u);
    if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = 67109120;
      uint64_t v26 = v11;
      uint64_t v13 = "failed to allocate shared memory region 0x%08x";
      goto LABEL_22;
    }
    return address;
  }
  unint64_t v14 = *address;
  char v15 = *v7;
  if ((*address & ~(uint64_t)~*(_DWORD *)v7) != 0) {
    waipc::MappableBuffer::MappableBuffer();
  }
  address[1] = v8;
  if (a4)
  {
    uint64_t v16 = (vm_prot_t *)(a3 + 16);
    while (1)
    {
      uint64_t v17 = *((void *)v16 - 2);
      uint64_t v18 = ~v15;
      if ((v17 & ~v18) != 0) {
        waipc::MappableBuffer::MappableBuffer();
      }
      uint64_t v19 = *((void *)v16 - 1);
      if (((v19 + v15) & v18) != v19) {
        waipc::MappableBuffer::MappableBuffer();
      }
      if (*v16 >= 8) {
        waipc::MappableBuffer::MappableBuffer();
      }
      if (v19 + v17 > v8) {
        waipc::MappableBuffer::MappableBuffer();
      }
      if (v19)
      {
        uint64_t v20 = mach_vm_protect(*v9, *address + v17, v19, 0, *v16);
        if (v20)
        {
          char v23 = v20;
          Logger = waipc::logging::getLogger(3u);
          if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
          {
            uint64_t v25 = 67109120;
            uint64_t v26 = v23;
            uint64_t v13 = "failed to set protection attributes for shared memory region 0x%08x";
LABEL_22:
            _os_log_impl(&dword_226DEE000, Logger, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v25, 8u);
          }
          return address;
        }
        char v15 = *v7;
      }
      v16 += 6;
      if (!--a4)
      {
        unint64_t v14 = *address;
        break;
      }
    }
  }
  uint64_t v21 = mach_vm_inherit(*v9, v14, v8, 2u);
  if (v21)
  {
    uint64_t v22 = v21;
    Logger = waipc::logging::getLogger(3u);
    if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = 67109120;
      uint64_t v26 = v22;
      uint64_t v13 = "failed to set inheritance attributes for shared memory region 0x%08x";
      goto LABEL_22;
    }
  }
  else
  {
    address[2] = *address;
  }
  return address;
}

void waipc::MappableBuffer::~MappableBuffer(mach_vm_address_t *this)
{
  kern_return_t v1;
  NSObject *Logger;
  _DWORD v3[2];
  uint64_t v4;

  CFNumberRef v4 = *MEMORY[0x263EF8340];
  if (*this)
  {
    uint64_t v1 = mach_vm_deallocate(*MEMORY[0x263EF8960], *this, this[1]);
    if (v1)
    {
      Logger = waipc::logging::getLogger(3u);
      if (os_log_type_enabled(Logger, OS_LOG_TYPE_INFO))
      {
        v3[0] = 67109120;
        v3[1] = v1;
        _os_log_impl(&dword_226DEE000, Logger, OS_LOG_TYPE_INFO, "failed to deallocate shared memory region 0x%08x", (uint8_t *)v3, 8u);
      }
    }
  }
}

void sub_226E075A8(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void BasebandVoice_setTimesyncOverride(uint64_t *a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&sTimesyncOverrideLock);
  unint64_t v2 = timesyncOverrideStorage();
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  int v5 = (std::__shared_weak_count *)v2[1];
  uint64_t *v2 = v4;
  v2[1] = v3;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&sTimesyncOverrideLock);
}

void BasebandVoice_getTimesyncOverride(uint64_t *a1@<X8>)
{
  os_unfair_lock_lock((os_unfair_lock_t)&sTimesyncOverrideLock);
  unint64_t v2 = timesyncOverrideStorage();
  uint64_t v3 = v2[1];
  *a1 = *v2;
  a1[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&sTimesyncOverrideLock);
}

void waipc::timesync::BasebandProvider::init()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226DEE000, v0, v1, "BasebandProvider::init", v2, v3, v4, v5, v6);
}

void waipc::timesync::BasebandProvider::setupTransport()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226DEE000, v0, v1, "BasebandProvider::setupTransport", v2, v3, v4, v5, v6);
}

void waipc::timesync::BasebandProvider::clearTransport()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226DEE000, v0, v1, "BasebandProvider::clearTransport", v2, v3, v4, v5, v6);
}

void waipc::timesync::BasebandProvider::transportReadCompletion()
{
}

void waipc::timesync::BasebandProvider::transportReadCompletion(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_226DEE000, a2, OS_LOG_TYPE_DEBUG, "read failed 0x%08x", (uint8_t *)v2, 8u);
}

void ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226DEE000, v0, v1, "time sync completion", v2, v3, v4, v5, v6);
}

void waipc::timesync::BasebandProvider::handleTimesync<PCITransportTimesyncMeasurement *>()
{
  __assert_rtn("handleTimesync", "BasebandProvider.cpp", 482, "fTimesyncEndpoint == endpoint || fTimesyncMeasurements.empty()");
}

void ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_17_cold_1()
{
}

void ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_17_cold_2()
{
}

void ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_17_cold_3()
{
}

void ___ZN5waipc8timesync16BasebandProvider20checkPendingTimesyncEv_block_invoke_17_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226DEE000, v0, v1, "time sync start", v2, v3, v4, v5, v6);
}

void ___ZN5waipc8timesync22ModernBasebandProvider9mapBufferENS0_16BasebandProvider8bufferIdEPvm_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_226DEE000, v0, v1, "mapBuffer callback for id %hhu, status: 0x%08x", v2, v3);
}

float waipc::timesync::ModernBasebandProvider::unmapBuffer(char a1, NSObject *a2)
{
  int v3 = 16777472;
  char v4 = a1;
  _os_log_debug_impl(&dword_226DEE000, a2, OS_LOG_TYPE_DEBUG, "unmapBuffer() -  buffer id %hhu", (uint8_t *)&v3, 5u);
  return result;
}

void ___ZN5waipc8timesync22ModernBasebandProvider11unmapBufferENS0_16BasebandProvider8bufferIdE_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_226DEE000, v0, v1, "unmapBuffer callback - buffer map for buffer %hhu, status: 0x%08x", v2, v3);
}

float waipc::timesync::ModernBasebandProvider::handleTimeEvent(unsigned __int8 *a1, unsigned __int8 *a2, os_log_t log)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  int v4 = *((_DWORD *)a1 + 1);
  uint64_t v5 = *((void *)a1 + 1);
  int v6 = *a2;
  v8[0] = 67109888;
  v8[1] = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  __int16 v11 = 2048;
  uint64_t v12 = v5;
  __int16 v13 = 1024;
  int v14 = v6;
  _os_log_debug_impl(&dword_226DEE000, log, OS_LOG_TYPE_DEBUG, "got timesync measurement domain %d seq %u, payload %llu, unit %u\n", (uint8_t *)v8, 0x1Eu);
  return result;
}

void waipc::timesync::LegacyBasebandProvider::handleDeviceTimesyncMeasurement()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_226DEE000, v0, OS_LOG_TYPE_DEBUG, "got timesync measurement seq %u, payload %llu", v1, 0x12u);
}

void waipc::timesync::LegacyBasebandProvider::handleUplinkScheduleUpdate()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_226DEE000, v0, OS_LOG_TYPE_DEBUG, "got uplink schedule seq %u, payload %llu", v1, 0x12u);
}

void waipc::timesync::BasebandProvider::timesyncMeasurement::complete()
{
  __assert_rtn("complete", "BasebandProvider.h", 52, "seq == host.seq");
}

{
  __assert_rtn("complete", "BasebandProvider.h", 53, "seq == device.seq");
}

void waipc::FlatCircularBuffer::write()
{
  __assert_rtn("write", "PCIeAudioLink.cpp", 37, "length <= fLength");
}

void waipc::FlatCircularBuffer::read()
{
  __assert_rtn("read", "PCIeAudioLink.cpp", 51, "length <= fLength");
}

void waipc::FlatCircularBuffer::set()
{
  __assert_rtn("set", "PCIeAudioLink.cpp", 65, "length <= fLength");
}

void waipc::PCIeAudioLink::computeBufferLength()
{
  __assert_rtn("computeBufferLength", "PCIeAudioLink.cpp", 223, "mach_vm_round_page( layout.ringLengthDL) == layout.ringLengthDL");
}

{
  __assert_rtn("computeBufferLength", "PCIeAudioLink.cpp", 222, "mach_vm_trunc_page( layout.ringOffsetDL) == layout.ringOffsetDL");
}

{
  __assert_rtn("computeBufferLength", "PCIeAudioLink.cpp", 221, "mach_vm_round_page( layout.ringLengthUL) == layout.ringLengthUL");
}

{
  __assert_rtn("computeBufferLength", "PCIeAudioLink.cpp", 220, "mach_vm_trunc_page( layout.ringOffsetUL) == layout.ringOffsetUL");
}

{
  __assert_rtn("computeBufferLength", "PCIeAudioLink.cpp", 219, "mach_vm_round_page( layout.headerLength) == layout.headerLength");
}

{
  __assert_rtn("computeBufferLength", "PCIeAudioLink.cpp", 218, "mach_vm_trunc_page( layout.headerOffset) == layout.headerOffset");
}

void waipc::PCIeAudioLink::checkUplink()
{
}

{
  __assert_rtn("checkUplink", "PCIeAudioLink.cpp", 603, "skip < fConfig.burstInterval");
}

void waipc::PCIeAudioLink::logDLStallEnd()
{
}

{
  __assert_rtn("logDLStallEnd", "PCIeAudioLink.cpp", 1041, "entry.active");
}

void waipc::PCIeAudioLink::logDLUnderrunEnd()
{
}

{
  __assert_rtn("logDLUnderrunEnd", "PCIeAudioLink.cpp", 1085, "entry.active");
}

void waipc::PCIeAudioLink::ramlog<waipc::PCIeAudioLink::stallReport,10ul>::back()
{
}

void waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::putIdle()
{
}

{
  __assert_rtn("putIdle", "Util.h", 426, "i >= 0 && i < kStashCount");
}

{
  __assert_rtn("putIdle", "Util.h", 429, "!prev");
}

void waipc::util::StateStash<waipc::PCIeAudioLink::stateLogger::state>::takeIdle()
{
}

void ___ZN5waipc4util22NonblockingEventSourceC2EP16dispatch_queue_sU13block_pointerFvjEU13block_pointerFvvE_block_invoke_cold_1(int a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    v2[0] = 67109120;
    v2[1] = a1;
    _os_log_impl(&dword_226DEE000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "unexpected error in mach_msg receive: 0x%08x", (uint8_t *)v2, 8u);
  }
  __assert_rtn("NonblockingEventSource_block_invoke", "Util.cpp", 135, "false");
}

void ___ZN5waipc4util22NonblockingEventSourceC2EP16dispatch_queue_sU13block_pointerFvjEU13block_pointerFvvE_block_invoke_3_cold_1(int a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    v2[0] = 67109120;
    v2[1] = a1;
    _os_log_impl(&dword_226DEE000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "unexpected error in mach_msg send: 0x%08x", (uint8_t *)v2, 8u);
  }
  __assert_rtn("NonblockingEventSource_block_invoke", "Util.cpp", 185, "false");
}

void waipc::util::NonblockingEventSource::trigger()
{
}

void waipc::util::NonblockingEventSource::testcancel()
{
}

void waipc::util::GroupErrorTimer::startTimer()
{
}

void waipc::BlockRing::BlockRing()
{
}

{
  __assert_rtn("BlockRing", "BlockRing.cpp", 28, "fBlockCount <= fWrapIndex / 2");
}

void waipc::BlockRing::addWrapped()
{
  __assert_rtn("addWrapped", "BlockRing.cpp", 132, "lhs <= fWrapIndex");
}

{
  __assert_rtn("addWrapped", "BlockRing.cpp", 133, "rhs <= fWrapIndex");
}

void waipc::BlockRing::isWrappedLE()
{
  __assert_rtn("isWrappedLE", "BlockRing.cpp", 158, "lhs <= fWrapIndex");
}

{
  __assert_rtn("isWrappedLE", "BlockRing.cpp", 159, "rhs <= fWrapIndex");
}

void waipc::BlockRing::subWrapped()
{
  __assert_rtn("subWrapped", "BlockRing.cpp", 145, "lhs <= fWrapIndex");
}

{
  __assert_rtn("subWrapped", "BlockRing.cpp", 146, "rhs <= fWrapIndex");
}

void waipc::timesync::BasebandService::setupProvider()
{
}

void ___ZN5waipc8timesync15BasebandService19addTimesyncObserverEU13block_pointerFvRKNS0_15KalmanEstimatorEbE_block_invoke_cold_1()
{
}

void waipc::util::Broadcaster<void ()(BOOL,__CFString const*)>::context::applyUpdates()
{
  __assert_rtn("applyUpdates", "Util.h", 246, "it != fCallbacks.end()");
}

void waipc::MappableBuffer::MappableBuffer()
{
  __assert_rtn("MappableBuffer", "MappableBuffer.cpp", 51, "( protect[i].prot & VM_PROT_ALL) == protect[i].prot");
}

{
  __assert_rtn("MappableBuffer", "MappableBuffer.cpp", 52, "protect[i].offset + protect[i].size <= length");
}

{
  __assert_rtn("MappableBuffer", "MappableBuffer.cpp", 50, "mach_vm_round_page( protect[i].size) == protect[i].size");
}

{
  __assert_rtn("MappableBuffer", "MappableBuffer.cpp", 49, "mach_vm_trunc_page( protect[i].offset) == protect[i].offset");
}

{
  __assert_rtn("MappableBuffer", "MappableBuffer.cpp", 44, "mach_vm_trunc_page( fAddress) == fAddress");
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t TelephonyBasebandPCITransportCreate()
{
  return MEMORY[0x270F964F0]();
}

uint64_t TelephonyBasebandPCITransportInitParameters()
{
  return MEMORY[0x270F964F8]();
}

uint64_t TelephonyBasebandPCITransportMapRegion()
{
  return MEMORY[0x270F96500]();
}

uint64_t TelephonyBasebandPCITransportRegisterTimeEvent()
{
  return MEMORY[0x270F96510]();
}

uint64_t TelephonyBasebandPCITransportTimesync()
{
  return MEMORY[0x270F96518]();
}

uint64_t TelephonyBasebandPCITransportUnmapRegion()
{
  return MEMORY[0x270F96520]();
}

uint64_t TelephonyRadiosGetRadio()
{
  return MEMORY[0x270F97160]();
}

uint64_t TelephonyRadiosGetRadioVendor()
{
  return MEMORY[0x270F97168]();
}

uint64_t TelephonyUtilTransportFree()
{
  return MEMORY[0x270F97228]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x270ED9580](source);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int feclearexcept(int a1)
{
  return MEMORY[0x270ED98F8](*(void *)&a1);
}

int fetestexcept(int a1)
{
  return MEMORY[0x270ED9930](*(void *)&a1);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

kern_return_t mach_port_construct(ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return MEMORY[0x270EDA1B8](*(void *)&task, options, context, name);
}

kern_return_t mach_port_destruct(ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x270EDA1D8](*(void *)&task, *(void *)&name, *(void *)&srdelta, guard);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x270EDA290](*(void *)&target, address, size, *(void *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x270EDA298](*(void *)&target, address, size);
}

kern_return_t mach_vm_inherit(vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, vm_inherit_t new_inheritance)
{
  return MEMORY[0x270EDA2A0](*(void *)&target_task, address, size, *(void *)&new_inheritance);
}

kern_return_t mach_vm_protect(vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return MEMORY[0x270EDA2B8](*(void *)&target_task, address, size, *(void *)&set_maximum, *(void *)&new_protection);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x270EDA5A8](__y, __x);
  return result;
}

long double nextafter(long double __x, long double __y)
{
  MEMORY[0x270EDA710](__x, __y);
  return result;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x270EDAAD8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}