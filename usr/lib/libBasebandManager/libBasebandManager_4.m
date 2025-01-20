void sub_1C594D3E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  const void *v5;
  va_list va;
  const void *v7;
  va_list va1;
  va_list va2;

  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  v5 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v7 = va_arg(va2, const void *);
  pthread_mutex_unlock(&ctu::Singleton<SharedData,SharedData,ctu::PthreadMutexGuardPolicy<SharedData>>::sInstance);
  ctu::cf::CFSharedRef<__CFArray>::~CFSharedRef((const void **)va);
  ctu::cf::CFSharedRef<__CFArray>::~CFSharedRef((const void **)va1);
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef((const void **)va2);
  _Unwind_Resume(a1);
}

uint64_t HealthEventDB::addHealthEvent(HealthEventDB *a1, char a2)
{
  memset(v8, 170, sizeof(v8));
  Timestamp::Timestamp((Timestamp *)v5);
  Timestamp::asString((uint64_t)v5, 0, 9, &__p);
  v8[0] = &unk_1F20F9640;
  LOBYTE(v8[1]) = a2;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v9, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string v9 = __p;
  }
  v8[2] = Timestamp::convert((uint64_t)&v9);
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v9.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_6;
    }
LABEL_8:
    operator delete(__p.__r_.__value_.__l.__data_);
    goto LABEL_6;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_8;
  }
LABEL_6:
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy((uint64_t)v5, v6);
  HealthEventDB::addHealthEvent(a1, (const HealthEvent *)v8);
  return 1;
}

void sub_1C594D5C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if ((a18 & 0x80000000) == 0)
  {
    std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy((uint64_t)&a10, a11);
    _Unwind_Resume(a1);
  }
  operator delete(__p);
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy((uint64_t)&a10, a11);
  _Unwind_Resume(a1);
}

void sub_1C594D624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, void *a11)
{
}

uint64_t HealthEventDB::getHealthEvents(HealthEventDB *this)
{
  return (uint64_t)this + 80;
}

void HealthEventDB::HealthEventDB(HealthEventDB *this)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v19, "com.apple.telephony.abm", "HealthEventDB");
  GetABMLogServer(&v17);
  *(void *)this = &unk_1F20FEF80;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)__p);
  *((void *)this + 1) = &unk_1F20F0070;
  v2 = v18;
  *((void *)this + 7) = v17;
  *((void *)this + 8) = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v20);
  v3 = v18;
  if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v19);
  *(void *)this = &unk_1F20FEED8;
  *((_DWORD *)this + 18) = 128;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((void *)this + 18) = 0;
  *((_DWORD *)this + 38) = 1065353216;
  HealthEventDB::initFromDisk(this);
  v4 = (char *)operator new(0x28uLL);
  *(void *)v4 = &unk_1F20F0580;
  *(_OWORD *)(v4 + 8) = 0u;
  *(_OWORD *)(v4 + 24) = 0u;
  v20 = v4;
  v5 = (std::__shared_weak_count *)operator new(0x20uLL);
  v5->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20FEFC0;
  v5->__shared_owners_ = 0;
  v5->__shared_weak_owners_ = 0;
  v5[1].__vftable = (std::__shared_weak_count_vtbl *)v4;
  v21 = v5;
  char v23 = 16;
  strcpy(__p, "KeyBasebandStats");
  v19[0] = (long long *)__p;
  v6 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t *)this + 15, (uint64_t)__p, v19);
  v20 = 0;
  v21 = 0;
  v7 = (std::__shared_weak_count *)*((void *)v6 + 6);
  *((void *)v6 + 5) = v4;
  *((void *)v6 + 6) = v5;
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
    if ((v23 & 0x80000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v23 < 0) {
LABEL_9:
  }
    operator delete(*(void **)__p);
LABEL_10:
  v8 = v21;
  if (v21 && !atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
  std::string v9 = (char *)operator new(0x20uLL);
  *(void *)std::string v9 = &unk_1F20F0630;
  *((void *)v9 + 1) = 0;
  *((void *)v9 + 2) = 0;
  *((void *)v9 + 3) = 0;
  v20 = v9;
  v10 = (std::__shared_weak_count *)operator new(0x20uLL);
  v10->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20FF010;
  v10->__shared_owners_ = 0;
  v10->__shared_weak_owners_ = 0;
  v10[1].__vftable = (std::__shared_weak_count_vtbl *)v9;
  v21 = v10;
  char v23 = 18;
  strcpy(__p, "KeyCommCenterStats");
  v19[0] = (long long *)__p;
  v11 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t *)this + 15, (uint64_t)__p, v19);
  v20 = 0;
  v21 = 0;
  v12 = (std::__shared_weak_count *)*((void *)v11 + 6);
  *((void *)v11 + 5) = v9;
  *((void *)v11 + 6) = v10;
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
    if ((v23 & 0x80000000) == 0)
    {
LABEL_16:
      v13 = v21;
      if (!v21) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((v23 & 0x80000000) == 0)
  {
    goto LABEL_16;
  }
  operator delete(*(void **)__p);
  v13 = v21;
  if (!v21) {
    goto LABEL_23;
  }
LABEL_22:
  if (!atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
    v14 = (uint64_t *)*((void *)this + 17);
    if (!v14) {
      return;
    }
    goto LABEL_27;
  }
LABEL_23:
  v14 = (uint64_t *)*((void *)this + 17);
  if (!v14) {
    return;
  }
  do
  {
LABEL_27:
    if (((**(uint64_t (***)(uint64_t))v14[5])(v14[5]) & 1) == 0)
    {
      v15 = *((void *)this + 5);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = v14 + 2;
        if (*((char *)v14 + 39) < 0) {
          v16 = (void *)*v16;
        }
        *(_DWORD *)std::string __p = 136315138;
        *(void *)&__p[4] = v16;
        _os_log_error_impl(&dword_1C5767000, v15, OS_LOG_TYPE_ERROR, "failed to init %s from disk", (uint8_t *)__p, 0xCu);
      }
    }
    v14 = (uint64_t *)*v14;
  }
  while (v14);
}

void sub_1C594DB64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  std::unordered_map<std::string,std::shared_ptr<HealthStats>>::~unordered_map[abi:ne180100](v26);
  boost::circular_buffer<HealthEvent,std::allocator<HealthEvent>>::~circular_buffer(v25);
  void *v22 = v24;
  MEMORY[0x1C8790F40](v23);
  _Unwind_Resume(a1);
}

void HealthEventDB::initFromDisk(HealthEventDB *this)
{
  uint64_t v2 = *((unsigned int *)this + 18);
  if (v2) {
    v3 = (char *)operator new(24 * v2);
  }
  else {
    v3 = 0;
  }
  v4 = &v3[24 * v2];
  v5 = (void (***)(void))*((void *)this + 10);
  v6 = (void (***)(void))*((void *)this + 11);
  *((void *)this + 10) = v3;
  *((void *)this + 11) = v4;
  v7 = (void (***)(void))*((void *)this + 12);
  *((void *)this + 12) = v3;
  *((void *)this + 13) = v3;
  uint64_t v8 = *((void *)this + 14);
  for (*((void *)this + 14) = 0; v8; --v8)
  {
    std::string v9 = v7 + 3;
    (**v7)(v7);
    if (v9 == v6) {
      v7 = v5;
    }
    else {
      v7 = v9;
    }
  }
  if (v5) {
    operator delete(v5);
  }
  CFTypeRef cf = 0;
  pthread_mutex_lock(&ctu::Singleton<SharedData,SharedData,ctu::PthreadMutexGuardPolicy<SharedData>>::sInstance);
  uint64_t v10 = off_1EBBDD340;
  if (!off_1EBBDD340)
  {
    SharedData::create_default_global(__p);
    long long v11 = *(_OWORD *)__p;
    *(void *)std::string __p = 0;
    *(void *)&__p[8] = 0;
    v12 = (std::__shared_weak_count *)*(&off_1EBBDD340 + 1);
    off_1EBBDD340 = v11;
    if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    v13 = *(std::__shared_weak_count **)&__p[8];
    if (*(void *)&__p[8]
      && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&__p[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
    uint64_t v10 = off_1EBBDD340;
  }
  v14 = (std::__shared_weak_count *)*(&off_1EBBDD340 + 1);
  if (*(&off_1EBBDD340 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EBBDD340 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SharedData,SharedData,ctu::PthreadMutexGuardPolicy<SharedData>>::sInstance);
  __p[23] = 13;
  strcpy(__p, "HealthEventDB");
  os_unfair_lock_lock((os_unfair_lock_t)(v10 + 40));
  Preferences::getPreference<__CFDictionary const*>((uint64_t (***)(void, uint64_t))v10, __p, &cf);
  os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 40));
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  if (!v14 || atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    CFTypeRef v15 = cf;
    CFTypeRef v41 = cf;
    if (!cf) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
  std::__shared_weak_count::__release_weak(v14);
  CFTypeRef v15 = cf;
  CFTypeRef v41 = cf;
  if (cf) {
LABEL_26:
  }
    CFRetain(v15);
LABEL_27:
  v40[0] = 0xAAAAAAAAAAAAAAAALL;
  v40[1] = 0xAAAAAAAAAAAAAAAALL;
  ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v40, (const __CFDictionary *)v15);
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)__p, "HealthEventTypes");
  CFArrayRef v16 = (const __CFArray *)ctu::cf::map_adapter::copyCFArrayRef((ctu::cf::map_adapter *)v40, *(const __CFString **)__p);
  MEMORY[0x1C8791110](__p);
  CFArrayRef v39 = v16;
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)__p, "HealthEventTimes");
  CFArrayRef v17 = (const __CFArray *)ctu::cf::map_adapter::copyCFArrayRef((ctu::cf::map_adapter *)v40, *(const __CFString **)__p);
  MEMORY[0x1C8791110](__p);
  CFArrayRef v38 = v17;
  if (v16) {
    v18 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
  }
  else {
    v18 = 0;
  }
  if (v18)
  {
    unsigned int Count = CFArrayGetCount(v16);
    unsigned int v20 = CFArrayGetCount(v17);
    uint64_t v21 = v20 >= Count ? Count : v20;
    if (v21)
    {
      for (CFIndex i = 0; i != v21; ++i)
      {
        char v37 = 0;
        uint64_t v36 = 0;
        ValueAtIndex = (signed __int8 *)CFArrayGetValueAtIndex(v16, i);
        uint64_t v26 = ValueAtIndex;
        if (ValueAtIndex)
        {
          CFTypeID v27 = CFGetTypeID(ValueAtIndex);
          if (v27 == CFNumberGetTypeID() && (ctu::cf::assign((ctu::cf *)&v37, v26, v28) & 1) != 0)
          {
            v29 = (uint64_t *)CFArrayGetValueAtIndex(v17, i);
            v30 = v29;
            if (v29)
            {
              CFTypeID v31 = CFGetTypeID(v29);
              if (v31 == CFNumberGetTypeID())
              {
                if (ctu::cf::assign((ctu::cf *)&v36, v30, v32))
                {
                  *(void *)std::string __p = &unk_1F20F9640;
                  __p[8] = v37;
                  *(void *)&__p[16] = v36;
                  uint64_t v34 = *((void *)this + 10);
                  uint64_t v33 = *((void *)this + 11);
                  if (0xAAAAAAAAAAAAAAABLL * ((v33 - v34) >> 3) == *((void *)this + 14))
                  {
                    if (v33 != v34)
                    {
                      *(_OWORD *)(*((void *)this + 13) + 8) = *(_OWORD *)&__p[8];
                      uint64_t v35 = *((void *)this + 13) + 24;
                      *((void *)this + 13) = v35;
                      if (v35 == *((void *)this + 11))
                      {
                        uint64_t v35 = *((void *)this + 10);
                        *((void *)this + 13) = v35;
                      }
                      *((void *)this + 12) = v35;
                    }
                  }
                  else
                  {
                    uint64_t v23 = *((void *)this + 13);
                    *(void *)uint64_t v23 = &unk_1F20F9640;
                    *(_OWORD *)(v23 + 8) = *(_OWORD *)&__p[8];
                    uint64_t v24 = *((void *)this + 13) + 24;
                    *((void *)this + 13) = v24;
                    if (v24 == *((void *)this + 11)) {
                      *((void *)this + 13) = *((void *)this + 10);
                    }
                    ++*((void *)this + 14);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (v17) {
    CFRelease(v17);
  }
  if (v16) {
    CFRelease(v16);
  }
  MEMORY[0x1C8791160](v40);
  if (v15) {
    CFRelease(v15);
  }
}

void sub_1C594E14C(_Unwind_Exception *a1)
{
}

void sub_1C594E174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va3, a4);
  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  v5 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v7 = va_arg(va2, const void *);
  va_copy(va3, va2);
  uint64_t v9 = va_arg(va3, void);
  uint64_t v11 = va_arg(va3, void);
  ctu::cf::CFSharedRef<__CFArray const>::~CFSharedRef((const void **)va);
  ctu::cf::CFSharedRef<__CFArray const>::~CFSharedRef((const void **)va1);
  MEMORY[0x1C8791160]((uint64_t *)va2);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va3);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<std::string,std::shared_ptr<HealthStats>>::~unordered_map[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      while (1)
      {
        v3 = (void **)*v2;
        v4 = (std::__shared_weak_count *)v2[6];
        if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
          std::__shared_weak_count::__release_weak(v4);
        }
        if (*((char *)v2 + 39) < 0) {
          break;
        }
        operator delete(v2);
        uint64_t v2 = v3;
        if (!v3) {
          goto LABEL_9;
        }
      }
      operator delete(v2[2]);
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
LABEL_9:
  v5 = *(void **)a1;
  *(void *)a1 = 0;
  if (v5) {
    operator delete(v5);
  }
  return a1;
}

void HealthEventDB::clearDB(HealthEventDB *this)
{
  CFTypeRef cf = 0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable) {
    CFTypeRef cf = Mutable;
  }
  pthread_mutex_lock(&ctu::Singleton<SharedData,SharedData,ctu::PthreadMutexGuardPolicy<SharedData>>::sInstance);
  v3 = (os_unfair_lock_s *)off_1EBBDD340;
  if (!off_1EBBDD340)
  {
    SharedData::create_default_global(buf);
    long long v4 = *(_OWORD *)buf;
    memset(buf, 0, sizeof(buf));
    v5 = (std::__shared_weak_count *)*(&off_1EBBDD340 + 1);
    off_1EBBDD340 = v4;
    if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    v6 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8]
      && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
    v3 = (os_unfair_lock_s *)off_1EBBDD340;
  }
  v7 = (std::__shared_weak_count *)*(&off_1EBBDD340 + 1);
  if (*(&off_1EBBDD340 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EBBDD340 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<SharedData,SharedData,ctu::PthreadMutexGuardPolicy<SharedData>>::sInstance);
  char v13 = 13;
  strcpy((char *)__p, "HealthEventDB");
  CFTypeRef v17 = cf;
  *(void *)buf = __p;
  *(void *)&buf[8] = &v17;
  CFArrayRef v16 = v3;
  ctu::SharedLockable<SharedData>::execute_sync<BOOL SharedData::setPreference<__CFDictionary *>(std::string const&,__CFDictionary *)::{lambda(void)#1}>(v3 + 6, (uint64_t *)buf);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  if (*((void *)this + 14))
  {
    unint64_t v8 = 0;
    uint64_t v9 = (void (***)(void))*((void *)this + 12);
    do
    {
      (**v9)(v9);
      uint64_t v10 = (void (***)(void))*((void *)this + 11);
      uint64_t v9 = (void (***)(void))(*((void *)this + 12) + 24);
      *((void *)this + 12) = v9;
      if (v9 == v10)
      {
        uint64_t v9 = (void (***)(void))*((void *)this + 10);
        *((void *)this + 12) = v9;
      }
      ++v8;
    }
    while (v8 < *((void *)this + 14));
  }
  *((void *)this + 14) = 0;
  uint64_t v11 = *((void *)this + 5);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C5767000, v11, OS_LOG_TYPE_DEFAULT, "#I Health DB is cleared", buf, 2u);
  }
  if (cf) {
    CFRelease(cf);
  }
}

void sub_1C594E584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  pthread_mutex_unlock(&ctu::Singleton<SharedData,SharedData,ctu::PthreadMutexGuardPolicy<SharedData>>::sInstance);
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void HealthEventDB::getHealthInfo(HealthEventDB *this@<X0>, xpc_object_t *a2@<X8>)
{
  *a2 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v5 = v4;
  uint64_t v6 = MEMORY[0x1E4F14590];
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      xpc_object_t v7 = xpc_null_create();
      xpc_object_t v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C8792D30](v5) == v6)
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v7 = xpc_null_create();
LABEL_8:
  *a2 = v7;
LABEL_9:
  xpc_release(v5);
  if (MEMORY[0x1C8792D30](*a2) == v6)
  {
    for (CFIndex i = (uint64_t *)*((void *)this + 17); i; CFIndex i = (uint64_t *)*i)
    {
      (*(void (**)(CFTypeRef *__return_ptr))(*(void *)i[5] + 24))(&cf);
      ctu::cf_to_xpc((uint64_t *)&value, (ctu *)cf, v10);
      uint64_t v11 = (const char *)(i + 2);
      if (*((char *)i + 39) < 0) {
        uint64_t v11 = *(const char **)v11;
      }
      xpc_dictionary_set_value(*a2, v11, value);
      xpc_object_t v12 = value;
      xpc_object_t value = xpc_null_create();
      xpc_release(v12);
      xpc_release(value);
      xpc_object_t value = 0;
      if (cf) {
        CFRelease(cf);
      }
    }
  }
  else
  {
    unint64_t v8 = *((void *)this + 5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(cf) = 0;
      _os_log_error_impl(&dword_1C5767000, v8, OS_LOG_TYPE_ERROR, "Failed to create dictionary to collect health info", (uint8_t *)&cf, 2u);
    }
  }
}

void sub_1C594E764(_Unwind_Exception *a1)
{
  xpc::dict::~dict(v1);
  _Unwind_Resume(a1);
}

void sub_1C594E798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(&a9);
  xpc::dict::~dict(v9);
  _Unwind_Resume(a1);
}

void sub_1C594E7B4(_Unwind_Exception *a1)
{
  xpc::dict::~dict(v1);
  _Unwind_Resume(a1);
}

uint64_t HealthEventDB::updateBootStats(uint64_t *a1, void **a2)
{
  char v9 = 16;
  strcpy(__p, "KeyBasebandStats");
  uint64_t v11 = __p;
  uint64_t v4 = *((void *)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(a1 + 15, (uint64_t)__p, (long long **)&v11)+ 5);
  xpc_object_t v5 = *a2;
  xpc_object_t object = v5;
  if (v5) {
    xpc_retain(v5);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  (*(void (**)(CFTypeRef *__return_ptr, uint64_t, xpc_object_t *))(*(void *)v4 + 32))(&cf, v4, &object);
  if (cf) {
    CFRelease(cf);
  }
  xpc_release(object);
  xpc_object_t object = 0;
  if (v9 < 0) {
    operator delete(*(void **)__p);
  }
  HealthEventDB::commitToDisk((HealthEventDB *)a1);
  return 1;
}

void sub_1C594E8BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t HealthEventDB::updateCommCenterStats(uint64_t *a1, void **a2)
{
  char v9 = 18;
  strcpy(__p, "KeyCommCenterStats");
  uint64_t v11 = __p;
  uint64_t v4 = *((void *)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(a1 + 15, (uint64_t)__p, (long long **)&v11)+ 5);
  xpc_object_t v5 = *a2;
  xpc_object_t object = v5;
  if (v5) {
    xpc_retain(v5);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  (*(void (**)(CFTypeRef *__return_ptr, uint64_t, xpc_object_t *))(*(void *)v4 + 32))(&cf, v4, &object);
  if (cf) {
    CFRelease(cf);
  }
  xpc_release(object);
  xpc_object_t object = 0;
  if (v9 < 0) {
    operator delete(*(void **)__p);
  }
  HealthEventDB::commitToDisk((HealthEventDB *)a1);
  return 1;
}

void sub_1C594E9F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void HealthEventDB::~HealthEventDB(HealthEventDB *this)
{
  HealthEventDB::~HealthEventDB(this);

  operator delete(v1);
}

{
  void **v2;
  void **v3;
  std::__shared_weak_count *v4;
  void *v5;
  unint64_t v6;
  void (***v7)(void);
  void (***v8)(void);
  void *v9;

  *(void *)this = &unk_1F20FEED8;
  uint64_t v2 = (void **)*((void *)this + 17);
  if (v2)
  {
    do
    {
      while (1)
      {
        v3 = (void **)*v2;
        uint64_t v4 = (std::__shared_weak_count *)v2[6];
        if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
          std::__shared_weak_count::__release_weak(v4);
        }
        if (*((char *)v2 + 39) < 0) {
          break;
        }
        operator delete(v2);
        uint64_t v2 = v3;
        if (!v3) {
          goto LABEL_9;
        }
      }
      operator delete(v2[2]);
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
LABEL_9:
  xpc_object_t v5 = (void *)*((void *)this + 15);
  *((void *)this + 15) = 0;
  if (v5) {
    operator delete(v5);
  }
  if (*((void *)this + 14))
  {
    uint64_t v6 = 0;
    xpc_object_t v7 = (void (***)(void))*((void *)this + 12);
    do
    {
      (**v7)(v7);
      unint64_t v8 = (void (***)(void))*((void *)this + 11);
      xpc_object_t v7 = (void (***)(void))(*((void *)this + 12) + 24);
      *((void *)this + 12) = v7;
      if (v7 == v8)
      {
        xpc_object_t v7 = (void (***)(void))*((void *)this + 10);
        *((void *)this + 12) = v7;
      }
      ++v6;
    }
    while (v6 < *((void *)this + 14));
  }
  char v9 = (void *)*((void *)this + 10);
  if (v9) {
    operator delete(v9);
  }
  *(void *)this = &unk_1F20FEF80;
  MEMORY[0x1C8790F40]((char *)this + 8);
}

uint64_t ctu::Loggable<HealthEventDB,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x1F417DA50](a1 + 8);
}

size_t ctu::Loggable<HealthEventDB,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v3 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 48))(a1);
  size_t result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v6 = result | 7;
    }
    uint64_t v7 = v6 + 1;
    unint64_t v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((unsigned char *)a2 + 23) = result;
    if (!result)
    {
      *(unsigned char *)a2 = 0;
      return result;
    }
  }
  size_t result = (size_t)memmove(a2, v3, v5);
  *((unsigned char *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<HealthEventDB,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x1F417DD10](a1 + 8);
}

void *ctu::Loggable<HealthEventDB,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F20FEF80;
  MEMORY[0x1C8790F40](a1 + 1);
  return a1;
}

void ctu::Loggable<HealthEventDB,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F20FEF80;
  MEMORY[0x1C8790F40](a1 + 1);

  operator delete(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t *a1, uint64_t a2, long long **a3)
{
  uint64_t v4 = (unsigned char *)a2;
  unint64_t v6 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v7 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v7 = v6;
  }
  unint64_t v8 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)v56, (uint64_t *)a2, v7);
  unint64_t v9 = v8;
  unint64_t v10 = a1[1];
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v12 = v8;
      if (v8 >= v10) {
        unint64_t v12 = v8 % v10;
      }
    }
    else
    {
      unint64_t v12 = (v10 - 1) & v8;
    }
    char v13 = *(void ***)(*a1 + 8 * v12);
    if (v13)
    {
      v14 = (unsigned __int8 *)*v13;
      if (*v13)
      {
        char v15 = v4[23];
        if (v15 >= 0) {
          uint64_t v16 = v4[23];
        }
        else {
          uint64_t v16 = *((void *)v4 + 1);
        }
        if (v15 < 0) {
          uint64_t v4 = *(unsigned char **)v4;
        }
        if (v11.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v21 = *((void *)v14 + 1);
            if (v21 == v9)
            {
              uint64_t v22 = v14[39];
              if ((v22 & 0x80u) == 0) {
                uint64_t v23 = v14[39];
              }
              else {
                uint64_t v23 = *((void *)v14 + 3);
              }
              if (v23 == v16)
              {
                if ((v22 & 0x80) != 0)
                {
                  if (!memcmp(*((const void **)v14 + 2), v4, *((void *)v14 + 3))) {
                    return v14;
                  }
                }
                else
                {
                  if (!v14[39]) {
                    return v14;
                  }
                  uint64_t v24 = 0;
                  while (v14[v24 + 16] == v4[v24])
                  {
                    if (v22 == ++v24) {
                      return v14;
                    }
                  }
                }
              }
            }
            else if ((v21 & (v10 - 1)) != v12)
            {
              goto LABEL_51;
            }
            v14 = *(unsigned __int8 **)v14;
            if (!v14) {
              goto LABEL_51;
            }
          }
        }
        do
        {
          unint64_t v17 = *((void *)v14 + 1);
          if (v17 == v9)
          {
            uint64_t v18 = v14[39];
            if ((v18 & 0x80u) == 0) {
              uint64_t v19 = v14[39];
            }
            else {
              uint64_t v19 = *((void *)v14 + 3);
            }
            if (v19 == v16)
            {
              if ((v18 & 0x80) != 0)
              {
                if (!memcmp(*((const void **)v14 + 2), v4, *((void *)v14 + 3))) {
                  return v14;
                }
              }
              else
              {
                if (!v14[39]) {
                  return v14;
                }
                uint64_t v20 = 0;
                while (v14[v20 + 16] == v4[v20])
                {
                  if (v18 == ++v20) {
                    return v14;
                  }
                }
              }
            }
          }
          else
          {
            if (v17 >= v10) {
              v17 %= v10;
            }
            if (v17 != v12) {
              break;
            }
          }
          v14 = *(unsigned __int8 **)v14;
        }
        while (v14);
      }
    }
  }
  else
  {
    unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  }
LABEL_51:
  uint64_t v25 = a1 + 2;
  v56[2] = 0xAAAAAAAAAAAAAA01;
  v14 = (unsigned __int8 *)operator new(0x38uLL);
  v56[0] = v14;
  v56[1] = a1 + 2;
  *(void *)v14 = 0;
  *((void *)v14 + 1) = v9;
  uint64_t v26 = *a3;
  long long v27 = **a3;
  *((void *)v14 + 4) = *((void *)*a3 + 2);
  *((_OWORD *)v14 + 1) = v27;
  *((void *)v26 + 1) = 0;
  *((void *)v26 + 2) = 0;
  *(void *)uint64_t v26 = 0;
  *((void *)v14 + 5) = 0;
  *((void *)v14 + 6) = 0;
  float v28 = (float)(unint64_t)(a1[3] + 1);
  float v29 = *((float *)a1 + 8);
  if (!v10 || (float)(v29 * (float)v10) < v28)
  {
    BOOL v32 = 1;
    if (v10 >= 3) {
      BOOL v32 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v33 = v32 | (2 * v10);
    unint64_t v34 = vcvtps_u32_f32(v28 / v29);
    if (v33 <= v34) {
      size_t prime = v34;
    }
    else {
      size_t prime = v33;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    unint64_t v10 = a1[1];
    if (prime > v10)
    {
LABEL_65:
      if (prime >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v36 = operator new(8 * prime);
      char v37 = (void *)*a1;
      *a1 = (uint64_t)v36;
      if (v37) {
        operator delete(v37);
      }
      uint64_t v38 = 0;
      a1[1] = prime;
      do
        *(void *)(*a1 + 8 * v38++) = 0;
      while (prime != v38);
      CFArrayRef v39 = (void *)*v25;
      if (!*v25) {
        goto LABEL_97;
      }
      size_t v40 = v39[1];
      size_t v41 = prime - 1;
      if ((prime & (prime - 1)) == 0)
      {
        size_t v42 = v40 & v41;
        *(void *)(*a1 + 8 * v42) = v25;
        for (CFIndex i = (void *)*v39; *v39; CFIndex i = (void *)*v39)
        {
          size_t v44 = i[1] & v41;
          if (v44 == v42)
          {
            CFArrayRef v39 = i;
          }
          else if (*(void *)(*a1 + 8 * v44))
          {
            *CFArrayRef v39 = *i;
            uint64_t v45 = 8 * v44;
            *CFIndex i = **(void **)(*a1 + v45);
            **(void **)(*a1 + v45) = i;
          }
          else
          {
            *(void *)(*a1 + 8 * v44) = v39;
            CFArrayRef v39 = i;
            size_t v42 = v44;
          }
        }
        goto LABEL_97;
      }
      if (v40 >= prime) {
        v40 %= prime;
      }
      *(void *)(*a1 + 8 * v40) = v25;
      v49 = (void *)*v39;
      if (!*v39)
      {
LABEL_97:
        unint64_t v10 = prime;
        uint64_t v52 = prime - 1;
        if ((prime & (prime - 1)) != 0) {
          goto LABEL_98;
        }
        goto LABEL_113;
      }
      while (1)
      {
        size_t v51 = v49[1];
        if (v51 >= prime) {
          v51 %= prime;
        }
        if (v51 == v40) {
          goto LABEL_91;
        }
        if (*(void *)(*a1 + 8 * v51))
        {
          *CFArrayRef v39 = *v49;
          uint64_t v50 = 8 * v51;
          void *v49 = **(void **)(*a1 + v50);
          **(void **)(*a1 + v50) = v49;
          v49 = v39;
LABEL_91:
          CFArrayRef v39 = v49;
          v49 = (void *)*v49;
          if (!v49) {
            goto LABEL_97;
          }
        }
        else
        {
          *(void *)(*a1 + 8 * v51) = v39;
          CFArrayRef v39 = v49;
          v49 = (void *)*v49;
          size_t v40 = v51;
          if (!v49) {
            goto LABEL_97;
          }
        }
      }
    }
    if (prime < v10)
    {
      unint64_t v46 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
      if (v10 < 3 || (uint8x8_t v47 = (uint8x8_t)vcnt_s8((int8x8_t)v10), v47.i16[0] = vaddlv_u8(v47), v47.u32[0] > 1uLL))
      {
        unint64_t v46 = std::__next_prime(v46);
      }
      else
      {
        uint64_t v48 = 1 << -(char)__clz(v46 - 1);
        if (v46 >= 2) {
          unint64_t v46 = v48;
        }
      }
      if (prime <= v46) {
        size_t prime = v46;
      }
      if (prime < v10)
      {
        if (!prime)
        {
          v53 = (void *)*a1;
          *a1 = 0;
          if (v53) {
            operator delete(v53);
          }
          unint64_t v10 = 0;
          a1[1] = 0;
          uint64_t v52 = -1;
          goto LABEL_113;
        }
        goto LABEL_65;
      }
      unint64_t v10 = a1[1];
    }
    uint64_t v52 = v10 - 1;
    if ((v10 & (v10 - 1)) != 0)
    {
LABEL_98:
      if (v9 >= v10)
      {
        unint64_t v12 = v9 % v10;
        uint64_t v30 = *a1;
        CFTypeID v31 = *(void **)(*a1 + 8 * (v9 % v10));
        if (v31) {
          goto LABEL_54;
        }
      }
      else
      {
        unint64_t v12 = v9;
        uint64_t v30 = *a1;
        CFTypeID v31 = *(void **)(*a1 + 8 * v9);
        if (v31) {
          goto LABEL_54;
        }
      }
      goto LABEL_114;
    }
LABEL_113:
    unint64_t v12 = v52 & v9;
    uint64_t v30 = *a1;
    CFTypeID v31 = *(void **)(*a1 + 8 * (v52 & v9));
    if (v31) {
      goto LABEL_54;
    }
    goto LABEL_114;
  }
  uint64_t v30 = *a1;
  CFTypeID v31 = *(void **)(*a1 + 8 * v12);
  if (v31)
  {
LABEL_54:
    *(void *)v14 = *v31;
LABEL_120:
    *CFTypeID v31 = v14;
    goto LABEL_121;
  }
LABEL_114:
  *(void *)v14 = *v25;
  *uint64_t v25 = v14;
  *(void *)(v30 + 8 * v12) = v25;
  if (*(void *)v14)
  {
    unint64_t v54 = *(void *)(*(void *)v14 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v54 >= v10) {
        v54 %= v10;
      }
    }
    else
    {
      v54 &= v10 - 1;
    }
    CFTypeID v31 = (void *)(*a1 + 8 * v54);
    goto LABEL_120;
  }
LABEL_121:
  ++a1[3];
  return v14;
}

void sub_1C594F310(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>,void *>>>>::~unique_ptr[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<HealthStats>>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16))
    {
      v3 = *(std::__shared_weak_count **)(v2 + 48);
      if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
        if ((*(char *)(v2 + 39) & 0x80000000) == 0) {
          goto LABEL_7;
        }
        goto LABEL_6;
      }
      if (*(char *)(v2 + 39) < 0) {
LABEL_6:
      }
        operator delete(*(void **)(v2 + 16));
    }
LABEL_7:
    operator delete((void *)v2);
  }
  return a1;
}

void std::__shared_ptr_pointer<BasebandStats *,std::shared_ptr<BasebandStats>::__shared_ptr_default_delete<BasebandStats,BasebandStats>,std::allocator<BasebandStats>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<BasebandStats *,std::shared_ptr<BasebandStats>::__shared_ptr_default_delete<BasebandStats,BasebandStats>,std::allocator<BasebandStats>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 16))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<BasebandStats *,std::shared_ptr<BasebandStats>::__shared_ptr_default_delete<BasebandStats,BasebandStats>,std::allocator<BasebandStats>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000001C59A6F1BLL) {
    return a1 + 24;
  }
  if (((v3 & 0x80000001C59A6F1BLL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001C59A6F1BLL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001C59A6F1BLL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void std::__shared_ptr_pointer<CommCenterStats *,std::shared_ptr<CommCenterStats>::__shared_ptr_default_delete<CommCenterStats,CommCenterStats>,std::allocator<CommCenterStats>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<CommCenterStats *,std::shared_ptr<CommCenterStats>::__shared_ptr_default_delete<CommCenterStats,CommCenterStats>,std::allocator<CommCenterStats>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 16))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<CommCenterStats *,std::shared_ptr<CommCenterStats>::__shared_ptr_default_delete<CommCenterStats,CommCenterStats>,std::allocator<CommCenterStats>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000001C59A6FE6) {
    return a1 + 24;
  }
  if (((v3 & 0x80000001C59A6FE6 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001C59A6FE6)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001C59A6FE6 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void ctu::cf::insert<char const*,__CFArray *>(__CFDictionary *a1, const __CFString **a2, const void *a3, uint64_t a4, const __CFAllocator *a5)
{
  CFTypeRef cf = 0;
  ctu::cf::convert_copy((ctu::cf *)&cf, a2, (const char *)0x8000100, a4, a5);
  CFTypeRef v7 = cf;
  CFTypeRef cf = a3;
  if (a3)
  {
    CFRetain(a3);
    if (v7) {
      CFDictionaryAddValue(a1, v7, a3);
    }
    CFRelease(a3);
  }
  if (v7) {
    CFRelease(v7);
  }
}

void sub_1C594F618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

void sub_1C594F63C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

void AppleBasebandManagerInitServer(const char *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  size_t v5 = (std::__shared_weak_count *)a2[1];
  uint64_t v31 = *a2;
  BOOL v32 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unint64_t v6 = (std::__shared_weak_count *)a2[3];
  uint64_t v29 = a2[2];
  uint64_t v30 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CFTypeRef v7 = (std::__shared_weak_count *)a2[5];
  v27[2] = a2[4];
  float v28 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v4)
  {
    v27[0] = v4;
    v27[1] = (uint64_t)v5;
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    abm::AWDHelperSetConnection(v27);
    if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutex_lock(&ctu::Singleton<ABMServer,ABMServer,ctu::PthreadMutexGuardPolicy<ABMServer>>::sInstance);
  unint64_t v8 = (uint64_t *)off_1EBBDCFD0;
  if (!off_1EBBDCFD0)
  {
    ABMServer::create_default_global(&v33);
    long long v9 = *(_OWORD *)&v33.__r_.__value_.__l.__data_;
    *(_OWORD *)&v33.__r_.__value_.__l.__data_ = 0uLL;
    unint64_t v10 = (std::__shared_weak_count *)*(&off_1EBBDCFD0 + 1);
    off_1EBBDCFD0 = v9;
    if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    size = (std::__shared_weak_count *)v33.__r_.__value_.__l.__size_;
    if (v33.__r_.__value_.__l.__size_
      && !atomic_fetch_add((atomic_ullong *volatile)(v33.__r_.__value_.__l.__size_ + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
    unint64_t v8 = (uint64_t *)off_1EBBDCFD0;
  }
  unint64_t v25 = (unint64_t)v8;
  unint64_t v26 = *(&off_1EBBDCFD0 + 1);
  if (*(&off_1EBBDCFD0 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EBBDCFD0 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ABMServer,ABMServer,ctu::PthreadMutexGuardPolicy<ABMServer>>::sInstance);
  if (!v8) {
    goto LABEL_36;
  }
  size_t v12 = strlen(a1);
  if (v12 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  std::string::size_type v13 = v12;
  if (v12 >= 0x17)
  {
    uint64_t v17 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v12 | 7) != 0x17) {
      uint64_t v17 = v12 | 7;
    }
    uint64_t v18 = v17 + 1;
    p_dst = (std::string *)operator new(v17 + 1);
    __dst.__r_.__value_.__l.__size_ = v13;
    __dst.__r_.__value_.__r.__words[2] = v18 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
LABEL_32:
    memcpy(p_dst, a1, v13);
    p_dst->__r_.__value_.__s.__data_[v13] = 0;
    uint64_t v15 = *v8;
    int v16 = SHIBYTE(__dst.__r_.__value_.__r.__words[2]);
    if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_28;
    }
LABEL_33:
    std::string::__init_copy_ctor_external(&v33, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
    goto LABEL_34;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v12;
  p_dst = &__dst;
  if (v12) {
    goto LABEL_32;
  }
  __dst.__r_.__value_.__s.__data_[0] = 0;
  uint64_t v15 = *v8;
  int v16 = SHIBYTE(__dst.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_33;
  }
LABEL_28:
  std::string v33 = __dst;
LABEL_34:
  ABMServerInternal::init(v15, (uint64_t)&v33, (uint64_t)a2);
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v33.__r_.__value_.__l.__data_);
    if ((v16 & 0x80000000) == 0) {
      goto LABEL_36;
    }
  }
  else if ((v16 & 0x80000000) == 0)
  {
    goto LABEL_36;
  }
  operator delete(__dst.__r_.__value_.__l.__data_);
LABEL_36:
  abm::asString();
  if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v19 = &v33;
  }
  else {
    uint64_t v19 = (std::string *)v33.__r_.__value_.__r.__words[0];
  }
  syslog(5, "%s hosting ABM with profile: %s", a1, (const char *)v19);
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v33.__r_.__value_.__l.__data_);
  }
  uint64_t v20 = (std::__shared_weak_count *)v26;
  if (v26 && !atomic_fetch_add((atomic_ullong *volatile)(v26 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
  }
  uint64_t v21 = v28;
  if (v28 && !atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
  }
  uint64_t v22 = v30;
  if (v30 && !atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v22);
    uint64_t v23 = v32;
    if (!v32) {
      return;
    }
  }
  else
  {
    uint64_t v23 = v32;
    if (!v32) {
      return;
    }
  }
  if (!atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
  }
}

void sub_1C594FADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, char a15, uint64_t a16, char a17, uint64_t a18, char a19, uint64_t a20,char a21)
{
  operator delete(__p);
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100]((uint64_t)&a21);
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100](v21 - 96);
  _Unwind_Resume(a1);
}

BOOL AppleBasebandManagerStartServer(NSObject *a1)
{
  pthread_mutex_lock(&ctu::Singleton<ABMServer,ABMServer,ctu::PthreadMutexGuardPolicy<ABMServer>>::sInstance);
  uint64_t v2 = (ABMServerInternal **)off_1EBBDCFD0;
  if (!off_1EBBDCFD0)
  {
    ABMServer::create_default_global(&v9);
    long long v3 = v9;
    long long v9 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_1EBBDCFD0 + 1);
    off_1EBBDCFD0 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    size_t v5 = (std::__shared_weak_count *)*((void *)&v9 + 1);
    if (*((void *)&v9 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v9 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = (ABMServerInternal **)off_1EBBDCFD0;
  }
  unint64_t v6 = (std::__shared_weak_count *)*(&off_1EBBDCFD0 + 1);
  if (*(&off_1EBBDCFD0 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EBBDCFD0 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ABMServer,ABMServer,ctu::PthreadMutexGuardPolicy<ABMServer>>::sInstance);
  BOOL result = ABMServerInternal::start(*v2, a1);
  BOOL v8 = result;
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
      return v8;
    }
  }
  return result;
}

void sub_1C594FD00(_Unwind_Exception *a1)
{
}

BOOL AppleBasebandManagerStopServer(NSObject *a1)
{
  pthread_mutex_lock(&ctu::Singleton<ABMServer,ABMServer,ctu::PthreadMutexGuardPolicy<ABMServer>>::sInstance);
  uint64_t v2 = (ABMServerInternal **)off_1EBBDCFD0;
  if (!off_1EBBDCFD0)
  {
    ABMServer::create_default_global(&v9);
    long long v3 = v9;
    long long v9 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_1EBBDCFD0 + 1);
    off_1EBBDCFD0 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    size_t v5 = (std::__shared_weak_count *)*((void *)&v9 + 1);
    if (*((void *)&v9 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v9 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = (ABMServerInternal **)off_1EBBDCFD0;
  }
  unint64_t v6 = (std::__shared_weak_count *)*(&off_1EBBDCFD0 + 1);
  if (*(&off_1EBBDCFD0 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EBBDCFD0 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ABMServer,ABMServer,ctu::PthreadMutexGuardPolicy<ABMServer>>::sInstance);
  BOOL result = ABMServerInternal::stop(*v2, a1);
  BOOL v8 = result;
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
      return v8;
    }
  }
  return result;
}

void sub_1C594FEA0(_Unwind_Exception *a1)
{
}

BOOL AppleBasebandManagerShutdownServer(NSObject *a1)
{
  pthread_mutex_lock(&ctu::Singleton<ABMServer,ABMServer,ctu::PthreadMutexGuardPolicy<ABMServer>>::sInstance);
  uint64_t v2 = (ABMServerInternal **)off_1EBBDCFD0;
  if (!off_1EBBDCFD0)
  {
    ABMServer::create_default_global(&v9);
    long long v3 = v9;
    long long v9 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_1EBBDCFD0 + 1);
    off_1EBBDCFD0 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    size_t v5 = (std::__shared_weak_count *)*((void *)&v9 + 1);
    if (*((void *)&v9 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v9 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = (ABMServerInternal **)off_1EBBDCFD0;
  }
  unint64_t v6 = (std::__shared_weak_count *)*(&off_1EBBDCFD0 + 1);
  if (*(&off_1EBBDCFD0 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EBBDCFD0 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ABMServer,ABMServer,ctu::PthreadMutexGuardPolicy<ABMServer>>::sInstance);
  BOOL result = ABMServerInternal::shutdown(*v2, a1);
  BOOL v8 = result;
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
      return v8;
    }
  }
  return result;
}

void sub_1C5950040(_Unwind_Exception *a1)
{
}

uint64_t AppleBasebandManagerGetProfile()
{
  return 3;
}

uint64_t TransportService::create@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, void *a5@<X8>)
{
  GetABMLogServer(&v28);
  unint64_t v10 = *((void *)GetGlobalLogger(&v28) + 4);
  uint8x8_t v11 = v29;
  if (!v29 || atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
  std::__shared_weak_count::__release_weak(v11);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
LABEL_4:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C5767000, v10, OS_LOG_TYPE_DEFAULT, "#I IPC: Creating QMI transport service...", buf, 2u);
  }
LABEL_5:
  *a5 = 0xAAAAAAAAAAAAAAAALL;
  a5[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v13 = *a1;
  size_t v12 = (std::__shared_weak_count *)a1[1];
  v14 = (std::__shared_weak_count *)operator new(0x1D0uLL);
  uint64_t v15 = v14;
  v14->__shared_owners_ = 0;
  p_shared_owners = &v14->__shared_owners_;
  v14->__shared_weak_owners_ = 0;
  v14->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20FF490;
  *(void *)buf = v13;
  uint64_t v36 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v17 = (std::__shared_weak_count *)a2[1];
  uint64_t v33 = *a2;
  unint64_t v34 = v17;
  if (v17) {
    atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v18 = (std::__shared_weak_count_vtbl *)&v14[1];
  uint64_t v19 = *a3;
  uint64_t v20 = (std::__shared_weak_count *)a3[1];
  uint64_t v31 = v19;
  BOOL v32 = v20;
  if (v20) {
    atomic_fetch_add_explicit(&v20->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v21 = *a4;
  uint64_t v22 = (std::__shared_weak_count *)a4[1];
  v30[0] = v21;
  v30[1] = (uint64_t)v22;
  if (v22) {
    atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  QMITransportService::QMITransportService((uint64_t)&v14[1], buf, &v33, &v31, v30);
  if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v22);
  }
  if (v32) {
    std::__shared_weak_count::__release_weak(v32);
  }
  uint64_t v23 = v34;
  if (v34 && !atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
  }
  uint64_t v24 = v36;
  if (v36 && !atomic_fetch_add(&v36->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
    std::__shared_weak_count::__release_weak(v24);
    shared_owners = (std::__shared_weak_count *)v15[4].__shared_owners_;
    if (shared_owners) {
      goto LABEL_24;
    }
  }
  else
  {
    shared_owners = (std::__shared_weak_count *)v15[4].__shared_owners_;
    if (shared_owners)
    {
LABEL_24:
      if (shared_owners->__shared_owners_ == -1)
      {
        atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
        atomic_fetch_add_explicit(&v15->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        v15[4].__vftable = v18;
        v15[4].__shared_owners_ = (uint64_t)v15;
        std::__shared_weak_count::__release_weak(shared_owners);
        if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
          goto LABEL_31;
        }
      }
      goto LABEL_32;
    }
  }
  atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(&v15->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  v15[4].__vftable = v18;
  v15[4].__shared_owners_ = (uint64_t)v15;
  if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL))
  {
LABEL_31:
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
LABEL_32:
  uint64_t v26 = v15[5].__shared_owners_;
  *a5 = (char *)v15 + 128;
  a5[1] = v15;
  return (*(uint64_t (**)(void))(v26 + 96))();
}

void sub_1C5950400(_Unwind_Exception *a1)
{
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void sub_1C5950414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v12 = va_arg(va2, void);
  uint64_t v14 = va_arg(va2, void);
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va2);
  std::__shared_weak_count::~__shared_weak_count(v3);
  operator delete(v6);
  _Unwind_Resume(a1);
}

void sub_1C5950450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t QMITransportService::QMITransportService(uint64_t a1, void *a2, void *a3, void *a4, uint64_t *a5)
{
  *(void *)a1 = &unk_1F20FF060;
  *(void *)(a1 + 104) = &unk_1F20FF110;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v18, "com.apple.telephony.abm", "ipc.svc.qmi");
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  uint64_t v11 = dispatch_queue_create_with_target_V2("ipc.svc.qmi", initially_inactive, 0);
  dispatch_set_qos_class_floor(v11, QOS_CLASS_DEFAULT, 0);
  dispatch_activate(v11);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = v11;
  if (v11)
  {
    dispatch_retain(v11);
    *(void *)(a1 + 96) = 0;
    dispatch_release(v11);
  }
  else
  {
    *(void *)(a1 + 96) = 0;
  }
  *(void *)a1 = &unk_1F20FF450;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v20);
  *(void *)(a1 + 8) = &unk_1F20F0070;
  *(void *)(a1 + 56) = *a2;
  uint64_t v12 = a2[1];
  *(void *)(a1 + 64) = v12;
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v19);
  *(void *)a1 = &unk_1F20FF4E0;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v18);
  uint64_t v13 = *a5;
  uint64_t v14 = (std::__shared_weak_count *)a5[1];
  if (v14)
  {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    *(void *)(a1 + 104) = &unk_1F20FF3D0;
    *(void *)(a1 + 112) = v13;
    *(void *)(a1 + 120) = v14;
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    if (!atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  else
  {
    *(void *)(a1 + 104) = &unk_1F20FF3D0;
    *(void *)(a1 + 112) = v13;
    *(void *)(a1 + 120) = 0;
  }
  *(void *)a1 = &unk_1F20FF060;
  *(void *)(a1 + 104) = &unk_1F20FF110;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  QMux::QMux((QMux *)(a1 + 176));
  *(void *)(a1 + 192) = 0;
  *(void *)(a1 + 200) = 0;
  *(void *)(a1 + 224) = 0;
  *(void *)(a1 + 208) = 0;
  *(void *)(a1 + 216) = a1 + 224;
  *(void *)(a1 + 248) = 0;
  *(void *)(a1 + 256) = 0;
  *(void *)(a1 + 264) = 0;
  *(void *)(a1 + 232) = 0;
  *(void *)(a1 + 240) = a1 + 248;
  *(void *)(a1 + 272) = 0;
  *(void *)(a1 + 280) = 0;
  *(void *)(a1 + 288) = *a3;
  uint64_t v15 = a3[1];
  *(void *)(a1 + 296) = v15;
  if (v15) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 304) = *a4;
  uint64_t v16 = a4[1];
  *(void *)(a1 + 312) = v16;
  if (v16) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v16 + 16), 1uLL, memory_order_relaxed);
  }
  *(unsigned char *)(a1 + 432) = 0;
  *(_OWORD *)(a1 + 400) = 0u;
  *(_OWORD *)(a1 + 416) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  std::string::append((std::string *)(a1 + 408), 0x100uLL, 0);
  return a1;
}

void sub_1C59507B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, uint64_t a13, QMux *a14, uint64_t a15, uint64_t a16, uint64_t a17, TransportService *a18)
{
  if (*(char *)(v18 + 431) < 0) {
    operator delete(*v20);
  }
  uint64_t v28 = *(NSObject **)(v18 + 400);
  if (v28) {
    dispatch_release(v28);
  }
  dispatch::callback<void({block_pointer})(WakeReason)>::~callback(v25);
  std::unique_ptr<support::misc::Watchdog>::~unique_ptr[abi:ne180100](v24);
  std::unique_ptr<support::misc::Watchdog>::~unique_ptr[abi:ne180100](v23);
  std::deque<dispatch::group_session>::~deque[abi:ne180100](v21);
  uint64_t v29 = *(std::__shared_weak_count **)(v18 + 312);
  if (v29) {
    std::__shared_weak_count::__release_weak(v29);
  }
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100](a13);
  std::vector<std::shared_ptr<qmi::ServerAccepter>>::~vector[abi:ne180100](v27);
  std::__tree<QMux>::destroy(*v22);
  std::__tree<QMux>::destroy(*v19);
  std::vector<QMux>::~vector[abi:ne180100](v26);
  QMux::~QMux(a14);
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100](a15);
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100](a16);
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100](a17);
  TransportService::~TransportService(a18);
  ctu::SharedLoggable<QMITransportService,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable((void *)v18);
  _Unwind_Resume(a1);
}

void sub_1C595086C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,char a21)
{
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)(v22 - 96));
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a21);
  ctu::SharedSynchronizable<DataStallDetection>::~SharedSynchronizable(v21);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a19);
  _Unwind_Resume(a1);
}

const char *QMITransportService::getName(QMITransportService *this)
{
  return "ipc.svc.qmi";
}

void **std::vector<std::shared_ptr<qmi::ServerAccepter>>::~vector[abi:ne180100](void **a1)
{
  uint64_t v2 = (char *)*a1;
  if (*a1)
  {
    long long v3 = (char *)a1[1];
    uint64_t v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        size_t v5 = (std::__shared_weak_count *)*((void *)v3 - 1);
        if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
        v3 -= 16;
      }
      while (v3 != v2);
      uint64_t v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void **std::vector<QMux>::~vector[abi:ne180100](void **a1)
{
  uint64_t v2 = (char *)*a1;
  if (*a1)
  {
    long long v3 = (char *)a1[1];
    uint64_t v4 = v2;
    if (v3 != v2)
    {
      do
        QMux::~QMux((QMux *)(v3 - 16));
      while (v3 != v2);
      uint64_t v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void TransportService::~TransportService(TransportService *this)
{
  *(void *)this = &unk_1F20FF3D0;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1)
  {
    if (!atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

void *ctu::SharedLoggable<QMITransportService,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_1F20FF450;
  MEMORY[0x1C8790F40](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  long long v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = &unk_1F20FF450;
  MEMORY[0x1C8790F40](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  long long v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void QMITransportService::~QMITransportService(QMITransportService *this)
{
  *(void *)this = &unk_1F20FF060;
  *((void *)this + 13) = &unk_1F20FF110;
  QMITransportService::shutdown_sync(this);
  uint64_t v2 = *((void *)this + 5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl(&dword_1C5767000, v2, OS_LOG_TYPE_DEFAULT, "#I Gone!", v24, 2u);
    if ((*((char *)this + 431) & 0x80000000) == 0)
    {
LABEL_3:
      long long v3 = *((void *)this + 50);
      if (!v3) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((char *)this + 431) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(*((void **)this + 51));
  long long v3 = *((void *)this + 50);
  if (v3) {
LABEL_4:
  }
    dispatch_release(v3);
LABEL_5:
  uint64_t v4 = *((void *)this + 49);
  if (v4) {
    dispatch_release(v4);
  }
  size_t v5 = (const void *)*((void *)this + 48);
  if (v5) {
    _Block_release(v5);
  }
  unint64_t v6 = (void *)*((void *)this + 47);
  *((void *)this + 47) = 0;
  if (v6)
  {
    TelephonyBasebandWatchdogStop();
    operator delete(v6);
  }
  uint64_t v7 = (void *)*((void *)this + 46);
  *((void *)this + 46) = 0;
  if (v7)
  {
    TelephonyBasebandWatchdogStop();
    operator delete(v7);
  }
  std::deque<dispatch::group_session>::~deque[abi:ne180100]((uint64_t)this + 320);
  BOOL v8 = (std::__shared_weak_count *)*((void *)this + 39);
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
  uint64_t v9 = (std::__shared_weak_count *)*((void *)this + 37);
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  uint64_t v10 = *((void *)this + 33);
  if (v10)
  {
    uint64_t v11 = *((void *)this + 34);
    uint64_t v12 = (void *)*((void *)this + 33);
    if (v11 != v10)
    {
      do
      {
        uint64_t v13 = *(std::__shared_weak_count **)(v11 - 8);
        if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
        v11 -= 16;
      }
      while (v11 != v10);
      uint64_t v12 = (void *)*((void *)this + 33);
    }
    *((void *)this + 34) = v10;
    operator delete(v12);
  }
  std::__tree<QMux>::destroy(*((void **)this + 31));
  std::__tree<QMux>::destroy(*((void **)this + 28));
  uint64_t v14 = *((void *)this + 24);
  if (v14)
  {
    uint64_t v15 = *((void *)this + 25);
    uint64_t v16 = (void *)*((void *)this + 24);
    if (v15 != v14)
    {
      do
        QMux::~QMux((QMux *)(v15 - 16));
      while (v15 != v14);
      uint64_t v16 = (void *)*((void *)this + 24);
    }
    *((void *)this + 25) = v14;
    operator delete(v16);
  }
  QMux::~QMux((QMITransportService *)((char *)this + 176));
  uint64_t v17 = (std::__shared_weak_count *)*((void *)this + 21);
  if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
  }
  uint64_t v18 = (std::__shared_weak_count *)*((void *)this + 19);
  if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
  uint64_t v19 = (std::__shared_weak_count *)*((void *)this + 17);
  if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
  *((void *)this + 13) = &unk_1F20FF3D0;
  uint64_t v20 = (std::__shared_weak_count *)*((void *)this + 15);
  if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
  }
  *(void *)this = &unk_1F20FF450;
  MEMORY[0x1C8790F40]((char *)this + 8);
  uint64_t v21 = *((void *)this + 12);
  if (v21) {
    dispatch_release(v21);
  }
  uint64_t v22 = *((void *)this + 11);
  if (v22) {
    dispatch_release(v22);
  }
  uint64_t v23 = (std::__shared_weak_count *)*((void *)this + 10);
  if (v23) {
    std::__shared_weak_count::__release_weak(v23);
  }
}

{
  void *v1;
  uint64_t vars8;

  QMITransportService::~QMITransportService(this);

  operator delete(v1);
}

void QMITransportService::shutdown_sync(QMITransportService *this)
{
  QMITransportService::cancelWakeRequest_sync(this);
  uint64_t v2 = (char *)*((void *)this + 27);
  long long v3 = (char *)this + 224;
  if (v2 != (char *)this + 224)
  {
    do
    {
      uint64_t v4 = *((void *)v2 + 5);
      v14[0] = *((void *)v2 + 4);
      v14[1] = v4;
      if (v4) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
      }
      QMux::shutdown((QMux *)v14);
      QMux::~QMux((QMux *)v14);
      size_t v5 = (char *)*((void *)v2 + 1);
      if (v5)
      {
        do
        {
          unint64_t v6 = v5;
          size_t v5 = *(char **)v5;
        }
        while (v5);
      }
      else
      {
        do
        {
          unint64_t v6 = (char *)*((void *)v2 + 2);
          BOOL v7 = *(void *)v6 == (void)v2;
          uint64_t v2 = v6;
        }
        while (!v7);
      }
      uint64_t v2 = v6;
    }
    while (v6 != v3);
  }
  uint64_t v8 = *((void *)this + 20);
  if (v8)
  {
    (*(void (**)(uint64_t))(*(void *)v8 + 24))(v8);
    uint64_t v9 = (std::__shared_weak_count *)*((void *)this + 21);
    *((void *)this + 20) = 0;
    *((void *)this + 21) = 0;
    if (v9)
    {
      if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
  if (*((void *)this + 18))
  {
    uint64_t v10 = (std::__shared_weak_count *)*((void *)this + 19);
    *((void *)this + 18) = 0;
    *((void *)this + 19) = 0;
    if (v10)
    {
      if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
  uint64_t v12 = *((void *)this + 24);
  for (uint64_t i = *((void *)this + 25); i != v12; QMux::~QMux((QMux *)(i - 16)))
    ;
  *((void *)this + 25) = v12;
  std::__tree<QMux>::destroy(*((void **)this + 28));
  uint64_t v13 = (void *)*((void *)this + 31);
  *((void *)this + 27) = v3;
  *((void *)this + 28) = 0;
  *((void *)this + 29) = 0;
  std::__tree<QMux>::destroy(v13);
  *((void *)this + 30) = (char *)this + 248;
  *((void *)this + 31) = 0;
  *((void *)this + 32) = 0;
}

void sub_1C5951074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

const char *non-virtual thunk to'QMITransportService::getName(QMITransportService *this)
{
  return "ipc.svc.qmi";
}

void QMITransportService::cancelWakeRequest_sync(QMITransportService *this)
{
  uint64_t v2 = *((void *)this + 50);
  if (v2)
  {
    dispatch_source_cancel(v2);
    long long v3 = *((void *)this + 50);
    *((void *)this + 50) = 0;
    if (v3) {
      dispatch_release(v3);
    }
    if (*((void *)this + 48) && *((void *)this + 49))
    {
      if (*((char *)this + 431) < 0)
      {
        if (*((void *)this + 52)) {
          goto LABEL_8;
        }
      }
      else if (*((unsigned char *)this + 431))
      {
LABEL_8:
        xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
        if (v4 || (xpc_object_t v4 = xpc_null_create()) != 0)
        {
          if (MEMORY[0x1C8792D30](v4) == MEMORY[0x1E4F14590])
          {
            xpc_retain(v4);
            xpc_object_t v5 = v4;
          }
          else
          {
            xpc_object_t v5 = xpc_null_create();
          }
        }
        else
        {
          xpc_object_t v5 = xpc_null_create();
          xpc_object_t v4 = 0;
        }
        xpc_release(v4);
        xpc_object_t v10 = xpc_string_create((const char *)*MEMORY[0x1E4F4C610]);
        if (!v10) {
          xpc_object_t v10 = xpc_null_create();
        }
        xpc_dictionary_set_value(v5, (const char *)*MEMORY[0x1E4F4C408], v10);
        xpc_object_t v11 = xpc_null_create();
        xpc_release(v10);
        xpc_release(v11);
        uint64_t v12 = (char *)this + 408;
        if (*((char *)this + 431) < 0) {
          uint64_t v12 = *(const char **)v12;
        }
        xpc_object_t v13 = xpc_string_create(v12);
        if (!v13) {
          xpc_object_t v13 = xpc_null_create();
        }
        xpc_dictionary_set_value(v5, (const char *)*MEMORY[0x1E4F4C5B0], v13);
        xpc_object_t v14 = xpc_null_create();
        xpc_release(v13);
        xpc_release(v14);
        xpc_object_t v15 = xpc_BOOL_create(*((unsigned char *)this + 432));
        if (!v15) {
          xpc_object_t v15 = xpc_null_create();
        }
        xpc_dictionary_set_value(v5, (const char *)*MEMORY[0x1E4F4CF80], v15);
        xpc_object_t v16 = xpc_null_create();
        xpc_release(v15);
        xpc_release(v16);
        if (v5)
        {
          xpc_retain(v5);
          xpc_object_t v17 = v5;
          uint64_t v18 = (const void *)*((void *)this + 48);
          if (v18)
          {
LABEL_38:
            uint64_t v19 = _Block_copy(v18);
            goto LABEL_41;
          }
        }
        else
        {
          xpc_object_t v17 = xpc_null_create();
          uint64_t v18 = (const void *)*((void *)this + 48);
          if (v18) {
            goto LABEL_38;
          }
        }
        uint64_t v19 = 0;
LABEL_41:
        uint64_t v20 = *((void *)this + 49);
        uint64_t block = MEMORY[0x1E4F143A8];
        uint64_t v22 = 1174405120;
        uint64_t v23 = ___ZNK8dispatch8callbackIU13block_pointerFv10WakeReasonEEclIJS1_EEEvDpT__block_invoke;
        uint64_t v24 = &__block_descriptor_tmp_168_0;
        if (v19)
        {
          aBlock = _Block_copy(v19);
          int v26 = 3;
          xpc_object_t object = v17;
          if (v17)
          {
LABEL_43:
            xpc_retain(v17);
LABEL_46:
            dispatch_async(v20, &block);
            xpc_release(object);
            xpc_object_t object = 0;
            if (aBlock) {
              _Block_release(aBlock);
            }
            if (v19) {
              _Block_release(v19);
            }
            xpc_release(v17);
            xpc_release(v5);
            return;
          }
        }
        else
        {
          aBlock = 0;
          int v26 = 3;
          xpc_object_t object = v17;
          if (v17) {
            goto LABEL_43;
          }
        }
        xpc_object_t object = xpc_null_create();
        goto LABEL_46;
      }
      xpc_object_t v6 = xpc_null_create();
      BOOL v7 = (const void *)*((void *)this + 48);
      if (v7) {
        uint64_t v8 = _Block_copy(v7);
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v9 = *((void *)this + 49);
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v22 = 1174405120;
      uint64_t v23 = ___ZNK8dispatch8callbackIU13block_pointerFv10WakeReasonEEclIJS1_EEEvDpT__block_invoke;
      uint64_t v24 = &__block_descriptor_tmp_168_0;
      if (v8)
      {
        aBlock = _Block_copy(v8);
        int v26 = 4;
        xpc_object_t object = v6;
        if (v6)
        {
LABEL_19:
          xpc_retain(v6);
LABEL_22:
          dispatch_async(v9, &block);
          xpc_release(object);
          xpc_object_t object = 0;
          if (aBlock) {
            _Block_release(aBlock);
          }
          if (v8) {
            _Block_release(v8);
          }
          xpc_release(v6);
          return;
        }
      }
      else
      {
        aBlock = 0;
        int v26 = 4;
        xpc_object_t object = v6;
        if (v6) {
          goto LABEL_19;
        }
      }
      xpc_object_t object = xpc_null_create();
      goto LABEL_22;
    }
  }
}

void QMITransportService::shutdown(QMITransportService *this)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  v3[2] = ___ZN19QMITransportService8shutdownEv_block_invoke;
  v3[3] = &__block_descriptor_tmp_21;
  v3[4] = this;
  xpc_object_t v4 = v3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_112_0;
  block[4] = (char *)this + 72;
  block[5] = &v4;
  uint64_t v2 = (char *)this + 88;
  uint64_t v1 = *((void *)this + 11);
  if (*((void *)v2 + 1)) {
    dispatch_async_and_wait(v1, block);
  }
  else {
    dispatch_sync(v1, block);
  }
}

void ___ZN19QMITransportService8shutdownEv_block_invoke(uint64_t a1)
{
}

void non-virtual thunk to'QMITransportService::shutdown(QMITransportService *this)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  v3[2] = ___ZN19QMITransportService8shutdownEv_block_invoke;
  v3[3] = &__block_descriptor_tmp_21;
  v3[4] = (char *)this - 104;
  xpc_object_t v4 = v3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_112_0;
  block[4] = (char *)this - 32;
  block[5] = &v4;
  uint64_t v2 = (char *)this - 16;
  uint64_t v1 = *((void *)this - 2);
  if (*((void *)v2 + 1)) {
    dispatch_async_and_wait(v1, block);
  }
  else {
    dispatch_sync(v1, block);
  }
}

void QMITransportService::init(QMITransportService *this)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 0x40000000;
  v1[2] = ___ZN19QMITransportService4initEv_block_invoke;
  v1[3] = &__block_descriptor_tmp_11;
  v1[4] = this;
  ctu::SharedSynchronizable<QMITransportService>::execute_wrapped((uint64_t *)this + 9, (uint64_t)v1);
}

void ___ZN19QMITransportService4initEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = v1[5];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C5767000, v2, OS_LOG_TYPE_DEFAULT, "#I ----------------- Setting up ----------------", buf, 2u);
  }
  long long v3 = (std::__shared_weak_count *)operator new(0x30uLL);
  v3->__shared_owners_ = 0;
  v3->__shared_weak_owners_ = 0;
  v3->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20FF520;
  xpc_object_t v4 = v3 + 1;
  uint64_t v6 = v1[38];
  xpc_object_t v5 = (std::__shared_weak_count *)v1[39];
  if (v5)
  {
    atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v3[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20FF570;
    v3[1].__shared_owners_ = v6;
    v3[1].__shared_weak_owners_ = (uint64_t)v5;
    atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_weak(v5);
    BOOL v7 = (std::__shared_weak_count *)v1[17];
    v1[16] = v4;
    v1[17] = v3;
    if (v7) {
      goto LABEL_5;
    }
LABEL_10:
    v193 = v3 + 1;
    v194 = v3;
LABEL_11:
    atomic_fetch_add_explicit(&v3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    goto LABEL_12;
  }
  v3[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20FF570;
  v3[1].__shared_owners_ = v6;
  v3[1].__shared_weak_owners_ = 0;
  BOOL v7 = (std::__shared_weak_count *)v1[17];
  v1[16] = v4;
  v1[17] = v3;
  if (!v7) {
    goto LABEL_10;
  }
LABEL_5:
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  long long v3 = (std::__shared_weak_count *)v1[17];
  v193 = (std::__shared_weak_count *)v1[16];
  v194 = v3;
  if (v3) {
    goto LABEL_11;
  }
LABEL_12:
  RouterIPCController::create((uint64_t *)&v193, (uint64_t *)buf);
  long long v8 = *(_OWORD *)buf;
  memset(buf, 0, sizeof(buf));
  uint64_t v9 = (std::__shared_weak_count *)v1[19];
  *((_OWORD *)v1 + 9) = v8;
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  xpc_object_t v10 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8]
    && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  xpc_object_t v11 = (capabilities::ipc *)v194;
  if (v194) {
    std::__shared_weak_count::__release_weak(v194);
  }
  uint64_t v12 = (capabilities::pci *)capabilities::ipc::supportsPCI(v11);
  v182 = v1;
  if (v12)
  {
    unsigned int v13 = capabilities::pci::controlChannelCount(v12);
    if (v13)
    {
      v185 = (uint64_t **)(v1 + 27);
      v180 = (uint64_t **)(v1 + 30);
      uint64_t v183 = *(void *)(MEMORY[0x1E4FBA418] + 24);
      uint64_t v184 = *MEMORY[0x1E4FBA418];
      unsigned int v14 = 1;
      while (1)
      {
        *(void *)&long long v213 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v211 = v15;
        long long v212 = v15;
        long long v209 = v15;
        long long v210 = v15;
        long long v207 = v15;
        long long v208 = v15;
        long long v205 = v15;
        long long v206 = v15;
        long long v203 = v15;
        long long v204 = v15;
        *(_OWORD *)std::string __p = v15;
        *(_OWORD *)v202 = v15;
        long long v199 = v15;
        long long v200 = v15;
        *(_OWORD *)buf = v15;
        long long v198 = v15;
        std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)buf);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"qmux", 4);
        std::ostream::operator<<();
        memset(__dst, 170, 24);
        if ((BYTE8(v203) & 0x10) != 0)
        {
          uint64_t v18 = v203;
          uint64_t v19 = (const void **)&v200;
          if ((unint64_t)v203 < *((void *)&v200 + 1))
          {
            *(void *)&long long v203 = *((void *)&v200 + 1);
            uint64_t v18 = *((void *)&v200 + 1);
            uint64_t v19 = (const void **)&v200;
          }
        }
        else
        {
          if ((BYTE8(v203) & 8) == 0)
          {
            std::string::size_type v16 = 0;
            *((unsigned char *)&__dst[0].__r_.__value_.__s + 23) = 0;
            xpc_object_t v17 = __dst;
            goto LABEL_38;
          }
          uint64_t v18 = *((void *)&v199 + 1);
          uint64_t v19 = (const void **)&v198 + 1;
        }
        uint64_t v20 = *v19;
        std::string::size_type v16 = v18 - (void)*v19;
        if (v16 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v16 >= 0x17) {
          break;
        }
        *((unsigned char *)&__dst[0].__r_.__value_.__s + 23) = v18 - *(unsigned char *)v19;
        xpc_object_t v17 = __dst;
        if (v16) {
          goto LABEL_37;
        }
LABEL_38:
        v17->__r_.__value_.__s.__data_[v16] = 0;
        v219.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
        v219.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
        QMux::QMux((QMux *)&v219);
        RouterIPCController::createQMuxChannels(v1[18], (uint64_t)__dst, 1, (QMux *)&v217);
        long long v23 = v217;
        if (*((void *)&v217 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v217 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        size = (std::__shared_weak_count *)v219.__r_.__value_.__l.__size_;
        *(_OWORD *)&v219.__r_.__value_.__l.__data_ = v23;
        if (size && !atomic_fetch_add(&size->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
          std::__shared_weak_count::__release_weak(size);
          QMux::~QMux((QMux *)&v217);
          int v26 = (char *)v1[25];
          unint64_t v25 = v1[26];
          std::string::size_type v27 = v219.__r_.__value_.__r.__words[0];
          if ((unint64_t)v26 >= v25)
          {
LABEL_47:
            uint64_t v30 = (char *)v1[24];
            uint64_t v31 = (v26 - v30) >> 4;
            unint64_t v32 = v31 + 1;
            if ((unint64_t)(v31 + 1) >> 60) {
              std::vector<std::string>::__throw_length_error[abi:ne180100]();
            }
            std::string::size_type v33 = v219.__r_.__value_.__l.__size_;
            uint64_t v34 = v25 - (void)v30;
            if (v34 >> 3 > v32) {
              unint64_t v32 = v34 >> 3;
            }
            if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v35 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v35 = v32;
            }
            if (v35)
            {
              if (v35 >> 60) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              uint64_t v36 = (char *)operator new(16 * v35);
              char v37 = (std::string::size_type *)&v36[16 * v31];
              *char v37 = v27;
              v37[1] = v33;
              if (v33)
              {
LABEL_56:
                atomic_fetch_add_explicit((atomic_ullong *volatile)(v33 + 8), 1uLL, memory_order_relaxed);
                uint64_t v1 = v182;
                uint64_t v30 = (char *)v182[24];
                int v26 = (char *)v182[25];
                uint64_t v38 = &v36[16 * v35];
                uint64_t v29 = v37 + 2;
                if (v26 == v30)
                {
LABEL_60:
                  v1[24] = v37;
                  v1[25] = v29;
                  v1[26] = v38;
LABEL_66:
                  if (v30) {
                    operator delete(v30);
                  }
                  goto LABEL_68;
                }
                do
                {
LABEL_62:
                  std::string::size_type v39 = *((void *)v26 - 2);
                  v26 -= 16;
                  *(v37 - 2) = v39;
                  v37 -= 2;
                  std::string::size_type v40 = *((void *)v26 + 1);
                  v37[1] = v40;
                  if (v40) {
                    atomic_fetch_add_explicit((atomic_ullong *volatile)(v40 + 8), 1uLL, memory_order_relaxed);
                  }
                }
                while (v26 != v30);
                uint64_t v30 = (char *)v1[24];
                size_t v41 = (char *)v1[25];
                v1[24] = v37;
                v1[25] = v29;
                v1[26] = v38;
                while (v41 != v30)
                  QMux::~QMux((QMux *)(v41 - 16));
                goto LABEL_66;
              }
            }
            else
            {
              uint64_t v36 = 0;
              char v37 = (std::string::size_type *)(16 * v31);
              *char v37 = v27;
              v37[1] = v33;
              if (v33) {
                goto LABEL_56;
              }
            }
            uint64_t v1 = v182;
            uint64_t v38 = &v36[16 * v35];
            uint64_t v29 = v37 + 2;
            if (v26 == v30) {
              goto LABEL_60;
            }
            goto LABEL_62;
          }
        }
        else
        {
          QMux::~QMux((QMux *)&v217);
          int v26 = (char *)v1[25];
          unint64_t v25 = v1[26];
          std::string::size_type v27 = v219.__r_.__value_.__r.__words[0];
          if ((unint64_t)v26 >= v25) {
            goto LABEL_47;
          }
        }
        *(void *)int v26 = v27;
        std::string::size_type v28 = v219.__r_.__value_.__l.__size_;
        *((void *)v26 + 1) = v219.__r_.__value_.__l.__size_;
        if (v28) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v28 + 8), 1uLL, memory_order_relaxed);
        }
        uint64_t v29 = v26 + 16;
LABEL_68:
        v1[25] = v29;
        std::__tree<QMux>::__emplace_unique_key_args<QMux,QMux const&>(v185, (QMux *)&v219, (uint64_t *)&v219);
        if (v14 != v13) {
          std::__tree<QMux>::__emplace_unique_key_args<QMux,QMux const&>(v180, (QMux *)&v219, (uint64_t *)&v219);
        }
        QMux::~QMux((QMux *)&v219);
        if (SHIBYTE(__dst[0].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__dst[0].__r_.__value_.__l.__data_);
        }
        *(void *)buf = v184;
        *(void *)&buf[*(void *)(v184 - 24)] = v183;
        *(void *)&uint8_t buf[8] = MEMORY[0x1E4FBA470] + 16;
        if (SHIBYTE(v202[1]) < 0) {
          operator delete(__p[1]);
        }
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        MEMORY[0x1C8791FB0](&v204);
        ++v14;
        uint64_t v1 = v182;
        if (v14 > v13) {
          goto LABEL_74;
        }
      }
      uint64_t v21 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v16 | 7) != 0x17) {
        uint64_t v21 = v16 | 7;
      }
      uint64_t v22 = v21 + 1;
      xpc_object_t v17 = (std::string *)operator new(v21 + 1);
      __dst[0].__r_.__value_.__l.__size_ = v16;
      __dst[0].__r_.__value_.__r.__words[2] = v22 | 0x8000000000000000;
      __dst[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v17;
LABEL_37:
      memmove(v17, v20, v16);
      goto LABEL_38;
    }
LABEL_74:
    uint64_t v42 = v1[18];
    BYTE7(v198) = 12;
    strcpy((char *)buf, "qmux_control");
    RouterIPCController::createQMuxChannels(v42, (uint64_t)buf, 1, (QMux *)__dst);
    long long v43 = *(_OWORD *)&__dst[0].__r_.__value_.__l.__data_;
    if (__dst[0].__r_.__value_.__l.__size_) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(__dst[0].__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
    }
    size_t v44 = (std::__shared_weak_count *)v1[23];
    *((_OWORD *)v1 + 11) = v43;
    if (v44 && !atomic_fetch_add(&v44->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
      QMux::~QMux((QMux *)__dst);
      if ((SBYTE7(v198) & 0x80000000) == 0) {
        goto LABEL_80;
      }
    }
    else
    {
      QMux::~QMux((QMux *)__dst);
      if ((SBYTE7(v198) & 0x80000000) == 0)
      {
LABEL_80:
        std::__tree<QMux>::__emplace_unique_key_args<QMux,QMux const&>((uint64_t **)v1 + 27, (QMux *)(v1 + 22), v1 + 22);
        std::__tree<QMux>::__emplace_unique_key_args<QMux,QMux const&>((uint64_t **)v1 + 30, (QMux *)(v1 + 22), v1 + 22);
        goto LABEL_81;
      }
    }
    operator delete(*(void **)buf);
    goto LABEL_80;
  }
LABEL_81:
  uint64_t v45 = v1[5];
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C5767000, v45, OS_LOG_TYPE_DEFAULT, "#I ----------------- QMux channels created ----------------", buf, 2u);
  }
  RouterIPCController::activate((RouterIPCController *)v1[18]);
  unint64_t v46 = (Registry *)v1[14];
  if (v46)
  {
    ServerConnection = Registry::getServerConnection((uint64_t *)buf, v46);
    long long v48 = *(_OWORD *)buf;
    memset(buf, 0, sizeof(buf));
    v49 = (std::__shared_weak_count *)v1[21];
    *((_OWORD *)v1 + 10) = v48;
    if (v49 && !atomic_fetch_add(&v49->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
      uint64_t v50 = *(std::__shared_weak_count **)&buf[8];
      if (!*(void *)&buf[8]) {
        goto LABEL_88;
      }
    }
    else
    {
      uint64_t v50 = *(std::__shared_weak_count **)&buf[8];
      if (!*(void *)&buf[8]) {
        goto LABEL_88;
      }
    }
    if (!atomic_fetch_add(&v50->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
      if (v1[20]) {
        goto LABEL_110;
      }
LABEL_89:
      size_t v51 = v1[5];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C5767000, v51, OS_LOG_TYPE_ERROR, "No QMI server connection exists in the registry, creating one to ensure XPC server functionality", buf, 2u);
      }
      _ZNSt3__115allocate_sharedB8ne180100I19QMIServerConnectionNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((uint64_t *)buf);
      long long v52 = *(_OWORD *)buf;
      memset(buf, 0, sizeof(buf));
      v53 = (std::__shared_weak_count *)v1[21];
      *((_OWORD *)v1 + 10) = v52;
      if (v53 && !atomic_fetch_add(&v53->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
        std::__shared_weak_count::__release_weak(v53);
        unint64_t v54 = *(std::__shared_weak_count **)&buf[8];
        if (!*(void *)&buf[8]) {
          goto LABEL_95;
        }
      }
      else
      {
        unint64_t v54 = *(std::__shared_weak_count **)&buf[8];
        if (!*(void *)&buf[8]) {
          goto LABEL_95;
        }
      }
      if (!atomic_fetch_add(&v54->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
        std::__shared_weak_count::__release_weak(v54);
        if (!v1[20])
        {
LABEL_96:
          v55 = v1[5];
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v56 = "Unable to allocate a QMI Server Connection, exiting QMI Server setup";
LABEL_100:
            _os_log_error_impl(&dword_1C5767000, v55, OS_LOG_TYPE_ERROR, v56, buf, 2u);
            return;
          }
          return;
        }
LABEL_110:
        v191 = 0;
        uint64_t v192 = 0;
        v190 = &v191;
        v57 = (void *)v1[27];
        v58 = v1 + 28;
        v181 = v1 + 28;
        if (v57 != v1 + 28)
        {
          do
          {
            QMux::getName((uint64_t *)buf, (QMux *)(v57 + 4));
            v59 = v191;
            v60 = &v191;
            v61 = &v191;
            if (!v191)
            {
LABEL_140:
              v72 = (char *)operator new(0x48uLL);
              *((_OWORD *)v72 + 2) = *(_OWORD *)buf;
              *((void *)v72 + 6) = v198;
              *(void *)&long long v198 = 0;
              memset(buf, 0, sizeof(buf));
              QMux::QMux((QMux *)(v72 + 56));
              *(void *)v72 = 0;
              *((void *)v72 + 1) = 0;
              *((void *)v72 + 2) = v60;
              *v61 = (uint64_t *)v72;
              v73 = (uint64_t *)v72;
              if (*v190)
              {
                v190 = (uint64_t **)*v190;
                v73 = *v61;
              }
              ServerConnection = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v191, v73);
              ++v192;
              v58 = v1 + 28;
              uint64_t v75 = v57[4];
              uint64_t v74 = v57[5];
              if (v74) {
                goto LABEL_143;
              }
              goto LABEL_144;
            }
            if ((SBYTE7(v198) & 0x80u) == 0) {
              v62 = buf;
            }
            else {
              v62 = *(uint8_t **)buf;
            }
            if ((SBYTE7(v198) & 0x80u) == 0) {
              unint64_t v63 = BYTE7(v198);
            }
            else {
              unint64_t v63 = *(void *)&buf[8];
            }
            while (1)
            {
              while (1)
              {
                v60 = (uint64_t **)v59;
                uint64_t v66 = v59[4];
                v64 = v59 + 4;
                v65 = (uint64_t *)v66;
                int v67 = *((char *)v64 + 23);
                v68 = v67 >= 0 ? v64 : v65;
                unint64_t v69 = v67 >= 0 ? *((unsigned __int8 *)v64 + 23) : v64[1];
                size_t v70 = v69 >= v63 ? v63 : v69;
                int v71 = memcmp(v62, v68, v70);
                if (v71) {
                  break;
                }
                if (v63 >= v69) {
                  goto LABEL_134;
                }
LABEL_120:
                v59 = *v60;
                v61 = v60;
                if (!*v60) {
                  goto LABEL_140;
                }
              }
              if (v71 < 0) {
                goto LABEL_120;
              }
LABEL_134:
              ServerConnection = (uint64_t *)memcmp(v68, v62, v70);
              if (!ServerConnection) {
                break;
              }
              if ((ServerConnection & 0x80000000) == 0) {
                goto LABEL_156;
              }
LABEL_138:
              v59 = v60[1];
              if (!v59)
              {
                v61 = v60 + 1;
                goto LABEL_140;
              }
            }
            if (v69 < v63) {
              goto LABEL_138;
            }
LABEL_156:
            v72 = (char *)v60;
            v58 = v1 + 28;
            uint64_t v75 = v57[4];
            uint64_t v74 = v57[5];
            if (!v74) {
              goto LABEL_144;
            }
LABEL_143:
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v74 + 8), 1uLL, memory_order_relaxed);
LABEL_144:
            v76 = (std::__shared_weak_count *)*((void *)v72 + 8);
            *((void *)v72 + 7) = v75;
            *((void *)v72 + 8) = v74;
            if (v76 && !atomic_fetch_add(&v76->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
              std::__shared_weak_count::__release_weak(v76);
              if (SBYTE7(v198) < 0) {
                goto LABEL_150;
              }
LABEL_147:
              v77 = (void *)v57[1];
              if (!v77) {
                goto LABEL_153;
              }
              do
              {
LABEL_151:
                v78 = v77;
                v77 = (void *)*v77;
              }
              while (v77);
            }
            else
            {
              if ((SBYTE7(v198) & 0x80000000) == 0) {
                goto LABEL_147;
              }
LABEL_150:
              operator delete(*(void **)buf);
              v77 = (void *)v57[1];
              if (v77) {
                goto LABEL_151;
              }
              do
              {
LABEL_153:
                v78 = (void *)v57[2];
                BOOL v95 = *v78 == (void)v57;
                v57 = v78;
              }
              while (!v95);
            }
            v57 = v78;
          }
          while (v78 != v58);
        }
        CFTypeRef cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
        *((void *)&v217 + 1) = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v218 = 0x5AAAAAAAAAAAAAALL;
        *(void *)&long long v217 = 0xAAAA003278756D71;
        memset(&v216[4], 170, 7);
        v79 = (config::hw *)capabilities::ipc::supportsPCI((capabilities::ipc *)ServerConnection);
        if ((v79 & 1) != 0 || config::hw::watch(v79))
        {
          if ((SHIBYTE(v218) & 0x80000000) == 0)
          {
            uint64_t v80 = 0x3178756D71;
LABEL_165:
            unint64_t v82 = v80 & 0xFFFFFFFFFFFFLL | 0xAAAA000000000000;
            HIBYTE(v218) = 12;
            v83 = (char *)&v217;
            goto LABEL_168;
          }
          uint64_t v81 = 0x3178756D71;
        }
        else
        {
          if ((SHIBYTE(v218) & 0x80000000) == 0)
          {
            uint64_t v80 = 0x3278756D71;
            goto LABEL_165;
          }
          uint64_t v81 = 0x3278756D71;
        }
        unint64_t v82 = v81 & 0xFFFFFFFFFFFFLL | 0xAAAA000000000000;
        *((void *)&v217 + 1) = 12;
        v83 = (char *)v217;
LABEL_168:
        strcpy(v83, "qmux_control");
        memset(v216, 170, 24);
        v84 = (void *)*v58;
        if (*v58)
        {
          do
          {
            v85 = v84;
            v84 = (void *)v84[1];
          }
          while (v84);
        }
        else
        {
          v86 = v58;
          do
          {
            v85 = (void *)v86[2];
            BOOL v95 = *v85 == (void)v86;
            v86 = v85;
          }
          while (v95);
        }
        QMux::getName(v216, (QMux *)(v85 + 4));
        if (v58 != (void *)v182[27])
        {
          v87 = v58;
          do
          {
            v88 = (void *)*v87;
            v89 = v87;
            if (*v87)
            {
              do
              {
                v90 = v88;
                v88 = (void *)v88[1];
              }
              while (v88);
            }
            else
            {
              do
              {
                v90 = (void *)v89[2];
                BOOL v95 = *v90 == (void)v89;
                v89 = v90;
              }
              while (v95);
            }
            QMux::getName((uint64_t *)buf, (QMux *)(v90 + 4));
            if (SHIBYTE(v216[2]) < 0) {
              operator delete((void *)v216[0]);
            }
            v216[2] = v198;
            *(_OWORD *)v216 = *(_OWORD *)buf;
            unint64_t v91 = BYTE7(v198);
            if (SBYTE7(v198) < 0) {
              unint64_t v91 = v216[1];
            }
            if (v91 != 12) {
              break;
            }
            v92 = (SBYTE7(v198) & 0x80u) == 0 ? v216 : (void *)v216[0];
            uint64_t v93 = *v92;
            int v94 = *((_DWORD *)v92 + 2);
            BOOL v95 = v93 == 0x6E6F635F78756D71 && v94 == 1819243124;
            if (!v95) {
              break;
            }
            v96 = (void *)*v87;
            if (*v87)
            {
              do
              {
                v97 = v96;
                v96 = (void *)v96[1];
              }
              while (v96);
            }
            else
            {
              do
              {
                v97 = (void *)v87[2];
                BOOL v95 = *v97 == (void)v87;
                v87 = v97;
              }
              while (v95);
            }
            v87 = v97;
          }
          while (v97 != (void *)v182[27]);
        }
        v215 = 0;
        uint64_t v98 = *MEMORY[0x1E4F1CF80];
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        v101 = v182;
        v102 = Mutable;
        if (Mutable) {
          v215 = Mutable;
        }
        if (SHIBYTE(v218) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
        }
        else
        {
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
        }
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"cellmonitor", (uint64_t)buf, v98, v100);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_205;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_205:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_208;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_208:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"radio", (uint64_t)buf, v98, v103);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_210;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_210:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_213;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_213:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"audio", (uint64_t)buf, v98, v104);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_215;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_215:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_218;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_218:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"voice", (uint64_t)buf, v98, v105);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v216[2]) & 0x80000000) == 0) {
            goto LABEL_220;
          }
        }
        else if ((SHIBYTE(v216[2]) & 0x80000000) == 0)
        {
LABEL_220:
          *(_OWORD *)buf = *(_OWORD *)v216;
          *(void *)&long long v198 = v216[2];
          goto LABEL_223;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v216[0], v216[1]);
LABEL_223:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"sms", (uint64_t)buf, v98, v106);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_225;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_225:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_228;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_228:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"location", (uint64_t)buf, v98, v107);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_230;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_230:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_233;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_233:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"sim", (uint64_t)buf, v98, v108);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_235;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_235:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_238;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_238:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"ims", (uint64_t)buf, v98, v109);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_240;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_240:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_243;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_243:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"coex", (uint64_t)buf, v98, v110);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_245;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_245:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_248;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_248:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"phonebook", (uint64_t)buf, v98, v111);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_250;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_250:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_253;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_253:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"vinyl", (uint64_t)buf, v98, v112);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_255;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_255:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_258;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_258:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"eos", (uint64_t)buf, v98, v113);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_260;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_260:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_263;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_263:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"diag", (uint64_t)buf, v98, v114);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_265;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_265:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_268;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_268:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"bsp", (uint64_t)buf, v98, v115);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_270;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_270:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_273;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_273:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"dms", (uint64_t)buf, v98, v116);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_275;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_275:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_278;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_278:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"awd", (uint64_t)buf, v98, v117);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_280;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_280:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_283;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_283:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"cat", (uint64_t)buf, v98, v118);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_285;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_285:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_288;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_288:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"elqm", (uint64_t)buf, v98, v119);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_290;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_290:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_293;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_293:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"pdc", (uint64_t)buf, v98, v120);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_295;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_295:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_298;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_298:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"dsd", (uint64_t)buf, v98, v121);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_300;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_300:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_303;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_303:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"antenna", (uint64_t)buf, v98, v122);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_305;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_305:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_308;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_308:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"p2p", (uint64_t)buf, v98, v123);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_310;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_310:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_313;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_313:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"at", (uint64_t)buf, v98, v124);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_315;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_315:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_318;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_318:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"media", (uint64_t)buf, v98, v125);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_320;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_320:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_323;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_323:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"wda", (uint64_t)buf, v98, v126);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_325;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_325:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_328;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_328:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"dfs", (uint64_t)buf, v98, v127);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_330;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_330:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_333;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_333:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"ssctl", (uint64_t)buf, v98, v128);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_335;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_335:
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
          goto LABEL_338;
        }
        std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
LABEL_338:
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"stw", (uint64_t)buf, v98, v129);
        if (SBYTE7(v198) < 0) {
          operator delete(*(void **)buf);
        }
        *(void *)buf = v82;
        *(void *)&uint8_t buf[8] = 0xAAAAAAAAAAAAAAAALL;
        LODWORD(v198) = v216[4];
        *(_DWORD *)((char *)&v198 + 3) = *(_DWORD *)((char *)&v216[4] + 3);
        BYTE7(v198) = 5;
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"registration", (uint64_t)buf, v98, v130);
        if (SBYTE7(v198) < 0) {
          operator delete(*(void **)buf);
        }
        *(void *)buf = v82;
        *(void *)&uint8_t buf[8] = 0xAAAAAAAAAAAAAAAALL;
        LODWORD(v198) = v216[4];
        *(_DWORD *)((char *)&v198 + 3) = *(_DWORD *)((char *)&v216[4] + 3);
        BYTE7(v198) = 5;
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"ussd", (uint64_t)buf, v98, v131);
        if (SBYTE7(v198) < 0) {
          operator delete(*(void **)buf);
        }
        *(void *)buf = v82;
        *(void *)&uint8_t buf[8] = 0xAAAAAAAAAAAAAAAALL;
        LODWORD(v198) = v216[4];
        *(_DWORD *)((char *)&v198 + 3) = *(_DWORD *)((char *)&v216[4] + 3);
        BYTE7(v198) = 5;
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"supp", (uint64_t)buf, v98, v132);
        if (SBYTE7(v198) < 0) {
          operator delete(*(void **)buf);
        }
        *(void *)buf = v82;
        *(void *)&uint8_t buf[8] = 0xAAAAAAAAAAAAAAAALL;
        LODWORD(v198) = v216[4];
        *(_DWORD *)((char *)&v198 + 3) = *(_DWORD *)((char *)&v216[4] + 3);
        BYTE7(v198) = 5;
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"settings", (uint64_t)buf, v98, v133);
        if (SBYTE7(v198) < 0) {
          operator delete(*(void **)buf);
        }
        *(void *)buf = v82;
        *(void *)&uint8_t buf[8] = 0xAAAAAAAAAAAAAAAALL;
        LODWORD(v198) = v216[4];
        *(_DWORD *)((char *)&v198 + 3) = *(_DWORD *)((char *)&v216[4] + 3);
        BYTE7(v198) = 5;
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"desense", (uint64_t)buf, v98, v134);
        if (SBYTE7(v198) < 0) {
          operator delete(*(void **)buf);
        }
        ctu::cf::insert<char const*,char const*>(v102, (const __CFString **)"logchan", (const __CFString **)"qmux1", v98, v135);
        ctu::cf::insert<char const*,char const*>(v102, (const __CFString **)"dormancy", (const __CFString **)"qmux1", v98, v136);
        ctu::cf::insert<char const*,char const*>(v102, (const __CFString **)"aqm", (const __CFString **)"qmux1", v98, v137);
        v139 = (capabilities::ipc *)ctu::cf::insert<char const*,char const*>(v102, (const __CFString **)"subscriber", (const __CFString **)"qmux1", v98, v138);
        if (!capabilities::ipc::supportsPCI(v139)) {
          goto LABEL_355;
        }
        if (SHIBYTE(v218) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)buf, (const std::string::value_type *)v217, *((std::string::size_type *)&v217 + 1));
        }
        else
        {
          *(_OWORD *)buf = v217;
          *(void *)&long long v198 = v218;
        }
        ctu::cf::insert<char const*,std::string>(v102, (const __CFString **)"debug_ipc", (uint64_t)buf, v98, v140);
        if (SBYTE7(v198) < 0)
        {
          operator delete(*(void **)buf);
          v141 = (void *)v182[27];
          if (v141 != v58) {
            goto LABEL_356;
          }
        }
        else
        {
LABEL_355:
          v141 = (void *)v182[27];
          if (v141 != v58)
          {
LABEL_356:
            int v142 = 0;
            uint64_t v178 = *(void *)(MEMORY[0x1E4FBA408] + 64);
            uint64_t v179 = *MEMORY[0x1E4FBA408];
            uint64_t v177 = *(void *)(MEMORY[0x1E4FBA408] + 72);
            while (1)
            {
              unint64_t v214 = 0xAAAAAAAAAAAAAAAALL;
              *(void *)&long long v143 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v143 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v212 = v143;
              long long v213 = v143;
              long long v210 = v143;
              long long v211 = v143;
              long long v208 = v143;
              long long v209 = v143;
              long long v206 = v143;
              long long v207 = v143;
              long long v204 = v143;
              long long v205 = v143;
              *(_OWORD *)v202 = v143;
              long long v203 = v143;
              long long v200 = v143;
              *(_OWORD *)std::string __p = v143;
              long long v198 = v143;
              long long v199 = v143;
              *(_OWORD *)buf = v143;
              std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)buf);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v198, (uint64_t)"coredump_", 9);
              ++v142;
              std::ostream::operator<<();
              if ((BYTE8(v204) & 0x10) != 0)
              {
                v146 = (unsigned char *)v204;
                v147 = __p;
                if ((void *)v204 < __p[1])
                {
                  *(void **)&long long v204 = __p[1];
                  v146 = __p[1];
                  v147 = __p;
                }
              }
              else
              {
                if ((BYTE8(v204) & 8) == 0)
                {
                  std::string::size_type v144 = 0;
                  *((unsigned char *)&v196.__r_.__value_.__s + 23) = 0;
                  v145 = &v196;
                  goto LABEL_372;
                }
                v146 = (unsigned char *)*((void *)&v200 + 1);
                v147 = (void **)&v199 + 1;
              }
              v148 = *v147;
              std::string::size_type v144 = v146 - (unsigned char *)*v147;
              if (v144 > 0x7FFFFFFFFFFFFFF7) {
                std::string::__throw_length_error[abi:ne180100]();
              }
              if (v144 >= 0x17) {
                break;
              }
              *((unsigned char *)&v196.__r_.__value_.__s + 23) = (_BYTE)v146 - *(unsigned char *)v147;
              v145 = &v196;
              if (v144) {
                goto LABEL_371;
              }
LABEL_372:
              v145->__r_.__value_.__s.__data_[v144] = 0;
              QMux::getName((uint64_t *)&v195, (QMux *)(v141 + 4));
              int v151 = SHIBYTE(v196.__r_.__value_.__r.__words[2]);
              if (SHIBYTE(v196.__r_.__value_.__r.__words[2]) < 0) {
                std::string::__init_copy_ctor_external(__dst, v196.__r_.__value_.__l.__data_, v196.__r_.__value_.__l.__size_);
              }
              else {
                __dst[0] = v196;
              }
              if (SHIBYTE(v195.__r_.__value_.__r.__words[2]) < 0) {
                std::string::__init_copy_ctor_external(&v219, v195.__r_.__value_.__l.__data_, v195.__r_.__value_.__l.__size_);
              }
              else {
                std::string v219 = v195;
              }
              ctu::cf::insert<std::string,std::string>();
              if (SHIBYTE(v219.__r_.__value_.__r.__words[2]) < 0)
              {
                operator delete(v219.__r_.__value_.__l.__data_);
                if ((SHIBYTE(__dst[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                {
LABEL_380:
                  if (SHIBYTE(v195.__r_.__value_.__r.__words[2]) < 0) {
                    goto LABEL_391;
                  }
                  goto LABEL_381;
                }
              }
              else if ((SHIBYTE(__dst[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              {
                goto LABEL_380;
              }
              operator delete(__dst[0].__r_.__value_.__l.__data_);
              if (SHIBYTE(v195.__r_.__value_.__r.__words[2]) < 0)
              {
LABEL_391:
                operator delete(v195.__r_.__value_.__l.__data_);
                if ((v151 & 0x80000000) == 0) {
                  goto LABEL_382;
                }
                goto LABEL_392;
              }
LABEL_381:
              if ((v151 & 0x80000000) == 0) {
                goto LABEL_382;
              }
LABEL_392:
              operator delete(v196.__r_.__value_.__l.__data_);
LABEL_382:
              *(void *)buf = v179;
              *(void *)&buf[*(void *)(v179 - 24)] = v178;
              *(void *)&long long v198 = v177;
              *((void *)&v198 + 1) = MEMORY[0x1E4FBA470] + 16;
              if (SHIBYTE(v203) < 0) {
                operator delete(v202[1]);
              }
              std::streambuf::~streambuf();
              std::iostream::~basic_iostream();
              MEMORY[0x1C8791FB0](&v205);
              unint64_t v214 = 0xAAAAAAAAAAAAAAAALL;
              *(void *)&long long v152 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v152 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v212 = v152;
              long long v213 = v152;
              long long v210 = v152;
              long long v211 = v152;
              long long v208 = v152;
              long long v209 = v152;
              long long v206 = v152;
              long long v207 = v152;
              long long v204 = v152;
              long long v205 = v152;
              *(_OWORD *)v202 = v152;
              long long v203 = v152;
              long long v200 = v152;
              *(_OWORD *)std::string __p = v152;
              long long v198 = v152;
              long long v199 = v152;
              *(_OWORD *)buf = v152;
              std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)buf);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v198, (uint64_t)"data_", 5);
              std::ostream::operator<<();
              if ((BYTE8(v204) & 0x10) != 0)
              {
                v155 = (unsigned char *)v204;
                v156 = __p;
                if ((void *)v204 < __p[1])
                {
                  *(void **)&long long v204 = __p[1];
                  v155 = __p[1];
                  v156 = __p;
                }
              }
              else
              {
                if ((BYTE8(v204) & 8) == 0)
                {
                  std::string::size_type v153 = 0;
                  *((unsigned char *)&v196.__r_.__value_.__s + 23) = 0;
                  v154 = &v196;
                  goto LABEL_402;
                }
                v155 = (unsigned char *)*((void *)&v200 + 1);
                v156 = (void **)&v199 + 1;
              }
              v157 = *v156;
              std::string::size_type v153 = v155 - (unsigned char *)*v156;
              if (v153 > 0x7FFFFFFFFFFFFFF7) {
                std::string::__throw_length_error[abi:ne180100]();
              }
              if (v153 >= 0x17)
              {
                uint64_t v158 = (v153 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v153 | 7) != 0x17) {
                  uint64_t v158 = v153 | 7;
                }
                uint64_t v159 = v158 + 1;
                v154 = (std::string *)operator new(v158 + 1);
                v196.__r_.__value_.__l.__size_ = v153;
                v196.__r_.__value_.__r.__words[2] = v159 | 0x8000000000000000;
                v196.__r_.__value_.__r.__words[0] = (std::string::size_type)v154;
LABEL_401:
                memmove(v154, v157, v153);
                goto LABEL_402;
              }
              *((unsigned char *)&v196.__r_.__value_.__s + 23) = (_BYTE)v155 - *(unsigned char *)v156;
              v154 = &v196;
              if (v153) {
                goto LABEL_401;
              }
LABEL_402:
              v154->__r_.__value_.__s.__data_[v153] = 0;
              QMux::getName((uint64_t *)&v195, (QMux *)(v141 + 4));
              int v160 = SHIBYTE(v196.__r_.__value_.__r.__words[2]);
              if (SHIBYTE(v196.__r_.__value_.__r.__words[2]) < 0) {
                std::string::__init_copy_ctor_external(__dst, v196.__r_.__value_.__l.__data_, v196.__r_.__value_.__l.__size_);
              }
              else {
                __dst[0] = v196;
              }
              if (SHIBYTE(v195.__r_.__value_.__r.__words[2]) < 0) {
                std::string::__init_copy_ctor_external(&v219, v195.__r_.__value_.__l.__data_, v195.__r_.__value_.__l.__size_);
              }
              else {
                std::string v219 = v195;
              }
              ctu::cf::insert<std::string,std::string>();
              if (SHIBYTE(v219.__r_.__value_.__r.__words[2]) < 0)
              {
                operator delete(v219.__r_.__value_.__l.__data_);
                if ((SHIBYTE(__dst[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                {
LABEL_410:
                  if (SHIBYTE(v195.__r_.__value_.__r.__words[2]) < 0) {
                    goto LABEL_421;
                  }
                  goto LABEL_411;
                }
              }
              else if ((SHIBYTE(__dst[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              {
                goto LABEL_410;
              }
              operator delete(__dst[0].__r_.__value_.__l.__data_);
              if (SHIBYTE(v195.__r_.__value_.__r.__words[2]) < 0)
              {
LABEL_421:
                operator delete(v195.__r_.__value_.__l.__data_);
                if ((v160 & 0x80000000) == 0) {
                  goto LABEL_412;
                }
                goto LABEL_422;
              }
LABEL_411:
              if ((v160 & 0x80000000) == 0) {
                goto LABEL_412;
              }
LABEL_422:
              operator delete(v196.__r_.__value_.__l.__data_);
LABEL_412:
              *(void *)buf = v179;
              *(void *)&buf[*(void *)(v179 - 24)] = v178;
              *(void *)&long long v198 = v177;
              *((void *)&v198 + 1) = MEMORY[0x1E4FBA470] + 16;
              if (SHIBYTE(v203) < 0) {
                operator delete(v202[1]);
              }
              std::streambuf::~streambuf();
              std::iostream::~basic_iostream();
              MEMORY[0x1C8791FB0](&v205);
              unint64_t v214 = 0xAAAAAAAAAAAAAAAALL;
              *(void *)&long long v161 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v161 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v212 = v161;
              long long v213 = v161;
              long long v210 = v161;
              long long v211 = v161;
              long long v208 = v161;
              long long v209 = v161;
              long long v206 = v161;
              long long v207 = v161;
              long long v204 = v161;
              long long v205 = v161;
              *(_OWORD *)v202 = v161;
              long long v203 = v161;
              long long v200 = v161;
              *(_OWORD *)std::string __p = v161;
              long long v198 = v161;
              long long v199 = v161;
              *(_OWORD *)buf = v161;
              std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)buf);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v198, (uint64_t)"qos_", 4);
              std::ostream::operator<<();
              if ((BYTE8(v204) & 0x10) != 0)
              {
                v164 = (unsigned char *)v204;
                v165 = __p;
                if ((void *)v204 < __p[1])
                {
                  *(void **)&long long v204 = __p[1];
                  v164 = __p[1];
                  v165 = __p;
                }
              }
              else
              {
                if ((BYTE8(v204) & 8) == 0)
                {
                  std::string::size_type v162 = 0;
                  *((unsigned char *)&v196.__r_.__value_.__s + 23) = 0;
                  v163 = &v196;
                  goto LABEL_432;
                }
                v164 = (unsigned char *)*((void *)&v200 + 1);
                v165 = (void **)&v199 + 1;
              }
              v166 = *v165;
              std::string::size_type v162 = v164 - (unsigned char *)*v165;
              if (v162 > 0x7FFFFFFFFFFFFFF7) {
                std::string::__throw_length_error[abi:ne180100]();
              }
              if (v162 >= 0x17)
              {
                uint64_t v167 = (v162 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v162 | 7) != 0x17) {
                  uint64_t v167 = v162 | 7;
                }
                uint64_t v168 = v167 + 1;
                v163 = (std::string *)operator new(v167 + 1);
                v196.__r_.__value_.__l.__size_ = v162;
                v196.__r_.__value_.__r.__words[2] = v168 | 0x8000000000000000;
                v196.__r_.__value_.__r.__words[0] = (std::string::size_type)v163;
LABEL_431:
                memmove(v163, v166, v162);
                goto LABEL_432;
              }
              *((unsigned char *)&v196.__r_.__value_.__s + 23) = (_BYTE)v164 - *(unsigned char *)v165;
              v163 = &v196;
              if (v162) {
                goto LABEL_431;
              }
LABEL_432:
              v163->__r_.__value_.__s.__data_[v162] = 0;
              QMux::getName((uint64_t *)&v195, (QMux *)(v141 + 4));
              v102 = v215;
              int v169 = SHIBYTE(v196.__r_.__value_.__r.__words[2]);
              if (SHIBYTE(v196.__r_.__value_.__r.__words[2]) < 0) {
                std::string::__init_copy_ctor_external(__dst, v196.__r_.__value_.__l.__data_, v196.__r_.__value_.__l.__size_);
              }
              else {
                __dst[0] = v196;
              }
              if (SHIBYTE(v195.__r_.__value_.__r.__words[2]) < 0) {
                std::string::__init_copy_ctor_external(&v219, v195.__r_.__value_.__l.__data_, v195.__r_.__value_.__l.__size_);
              }
              else {
                std::string v219 = v195;
              }
              ctu::cf::insert<std::string,std::string>();
              if (SHIBYTE(v219.__r_.__value_.__r.__words[2]) < 0)
              {
                operator delete(v219.__r_.__value_.__l.__data_);
                if ((SHIBYTE(__dst[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                {
LABEL_440:
                  if ((SHIBYTE(v195.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                    goto LABEL_441;
                  }
                  goto LABEL_452;
                }
              }
              else if ((SHIBYTE(__dst[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              {
                goto LABEL_440;
              }
              operator delete(__dst[0].__r_.__value_.__l.__data_);
              if ((SHIBYTE(v195.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              {
LABEL_441:
                if (v169 < 0) {
                  goto LABEL_453;
                }
                goto LABEL_442;
              }
LABEL_452:
              operator delete(v195.__r_.__value_.__l.__data_);
              if (v169 < 0) {
LABEL_453:
              }
                operator delete(v196.__r_.__value_.__l.__data_);
LABEL_442:
              *(void *)buf = v179;
              *(void *)&buf[*(void *)(v179 - 24)] = v178;
              *(void *)&long long v198 = v177;
              *((void *)&v198 + 1) = MEMORY[0x1E4FBA470] + 16;
              if (SHIBYTE(v203) < 0) {
                operator delete(v202[1]);
              }
              std::streambuf::~streambuf();
              std::iostream::~basic_iostream();
              MEMORY[0x1C8791FB0](&v205);
              v170 = (void *)v141[1];
              v101 = v182;
              if (v170)
              {
                do
                {
                  v171 = v170;
                  v170 = (void *)*v170;
                }
                while (v170);
              }
              else
              {
                do
                {
                  v171 = (void *)v141[2];
                  BOOL v95 = *v171 == (void)v141;
                  v141 = v171;
                }
                while (!v95);
              }
              v141 = v171;
              if (v171 == v181) {
                goto LABEL_455;
              }
            }
            uint64_t v149 = (v144 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v144 | 7) != 0x17) {
              uint64_t v149 = v144 | 7;
            }
            uint64_t v150 = v149 + 1;
            v145 = (std::string *)operator new(v149 + 1);
            v196.__r_.__value_.__l.__size_ = v144;
            v196.__r_.__value_.__r.__words[2] = v150 | 0x8000000000000000;
            v196.__r_.__value_.__r.__words[0] = (std::string::size_type)v145;
LABEL_371:
            memmove(v145, v148, v144);
            goto LABEL_372;
          }
        }
LABEL_455:
        if (v102)
        {
          CFTypeID v172 = CFGetTypeID(v102);
          if (v172 == CFDictionaryGetTypeID())
          {
            CFTypeRef cf = v102;
            CFRetain(v102);
            CFDictionaryRef v173 = v102;
          }
          else
          {
            CFDictionaryRef v173 = 0;
            CFTypeRef cf = 0;
          }
          CFRelease(v102);
        }
        else
        {
          CFDictionaryRef v173 = 0;
          CFTypeRef cf = 0;
        }
        if (SHIBYTE(v216[2]) < 0)
        {
          operator delete((void *)v216[0]);
          if ((SHIBYTE(v218) & 0x80000000) == 0) {
            goto LABEL_463;
          }
        }
        else if ((SHIBYTE(v218) & 0x80000000) == 0)
        {
LABEL_463:
          v186[0] = MEMORY[0x1E4F143A8];
          v186[1] = 1174405120;
          v186[2] = ___ZN19QMITransportService4initEv_block_invoke_7;
          v186[3] = &__block_descriptor_tmp_9_5;
          v188[0] = 0;
          v188[1] = 0;
          v186[4] = v101;
          v187 = v188;
          v174 = v190;
          if (v190 != &v191)
          {
            do
            {
              std::__tree<std::__value_type<std::string,QMux>,std::__map_value_compare<std::string,std::__value_type<std::string,QMux>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,QMux>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,QMux> const&>((uint64_t *)&v187, (uint64_t)v188, (const void **)v174 + 4, (uint64_t)(v174 + 4));
              v175 = v174[1];
              if (v175)
              {
                do
                {
                  v176 = (uint64_t **)v175;
                  v175 = (uint64_t *)*v175;
                }
                while (v175);
              }
              else
              {
                do
                {
                  v176 = (uint64_t **)v174[2];
                  BOOL v95 = *v176 == (uint64_t *)v174;
                  v174 = v176;
                }
                while (!v95);
              }
              v174 = v176;
            }
            while (v176 != &v191);
          }
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&uint8_t buf[8] = 0x40000000;
          *(void *)&long long v198 = ___ZN3ctu2cf8for_eachINSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEES8_EEvPK14__CFDictionaryU13block_pointerFvRKT_RKT0_E_block_invoke;
          *((void *)&v198 + 1) = &unk_1E6518520;
          *(void *)&long long v199 = v186;
          __dst[0].__r_.__value_.__r.__words[0] = (std::string::size_type)buf;
          CFDictionaryApplyFunction(v173, (CFDictionaryApplierFunction)ctu::cf::DictApplyFunction, __dst);
          *(void *)buf = xpc_connection_create_mach_service("com.apple.commcenter.atcs.xpc", *(dispatch_queue_t *)(v182[20] + 24), 1uLL);
          if (!*(void *)buf) {
            *(void *)buf = xpc_null_create();
          }
          (*(void (**)(void, void *, uint8_t *))(*(void *)v182[20] + 16))(v182[20], v182 + 33, buf);
          xpc_release(*(xpc_object_t *)buf);
          std::__tree<std::__value_type<std::string,QMux>,std::__map_value_compare<std::string,std::__value_type<std::string,QMux>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,QMux>>>::destroy(v188[0]);
          if (cf) {
            CFRelease(cf);
          }
          std::__tree<std::__value_type<std::string,QMux>,std::__map_value_compare<std::string,std::__value_type<std::string,QMux>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,QMux>>>::destroy((char *)v191);
          return;
        }
        operator delete((void *)v217);
        goto LABEL_463;
      }
LABEL_95:
      if (!v1[20]) {
        goto LABEL_96;
      }
      goto LABEL_110;
    }
LABEL_88:
    if (v1[20]) {
      goto LABEL_110;
    }
    goto LABEL_89;
  }
  v55 = v1[5];
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v56 = "Invalid registry, skipping QMI Server setup";
    goto LABEL_100;
  }
}

void sub_1C5953CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,char *a33,uint64_t a34,uint64_t a35,std::__shared_weak_count *a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,void *a43,uint64_t a44,int a45,__int16 a46,char a47,char a48,void *__p,uint64_t a50,int a51,__int16 a52,char a53,char a54)
{
  if (a54 < 0) {
    operator delete(__p);
  }
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef((const void **)(v54 - 232));
  if (*(char *)(v54 - 201) < 0) {
    operator delete(*(void **)(v54 - 224));
  }
  if (*(char *)(v54 - 161) < 0) {
    operator delete(*(void **)(v54 - 184));
  }
  std::__tree<std::__value_type<std::string,QMux>,std::__map_value_compare<std::string,std::__value_type<std::string,QMux>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,QMux>>>::destroy(a33);
  _Unwind_Resume(a1);
}

void ___ZN19QMITransportService4initEv_block_invoke_7(void *a1, uint64_t **a2, const void **a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  xpc_object_t v5 = a1 + 6;
  uint64_t v6 = (uint64_t *)a1[6];
  BOOL v7 = (void *)a1[4];
  if (!v6) {
    goto LABEL_36;
  }
  int v8 = *((char *)a3 + 23);
  if (v8 >= 0) {
    uint64_t v9 = a3;
  }
  else {
    uint64_t v9 = *a3;
  }
  if (v8 >= 0) {
    size_t v10 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v10 = (size_t)a3[1];
  }
  xpc_object_t v11 = a1 + 6;
  do
  {
    while (1)
    {
      int v12 = *((char *)v6 + 55);
      unsigned int v13 = v12 >= 0 ? v6 + 4 : (uint64_t *)v6[4];
      size_t v14 = v12 >= 0 ? *((unsigned __int8 *)v6 + 55) : v6[5];
      size_t v15 = v10 >= v14 ? v14 : v10;
      int v16 = memcmp(v13, v9, v15);
      if (v16) {
        break;
      }
      if (v14 >= v10) {
        goto LABEL_23;
      }
LABEL_9:
      uint64_t v6 = (uint64_t *)v6[1];
      if (!v6) {
        goto LABEL_24;
      }
    }
    if (v16 < 0) {
      goto LABEL_9;
    }
LABEL_23:
    xpc_object_t v11 = v6;
    uint64_t v6 = (uint64_t *)*v6;
  }
  while (v6);
LABEL_24:
  if (v11 == v5) {
    goto LABEL_36;
  }
  int v17 = *((char *)v11 + 55);
  if (v17 >= 0) {
    uint64_t v18 = v11 + 4;
  }
  else {
    uint64_t v18 = (const void *)v11[4];
  }
  if (v17 >= 0) {
    size_t v19 = *((unsigned __int8 *)v11 + 55);
  }
  else {
    size_t v19 = v11[5];
  }
  if (v19 >= v10) {
    size_t v20 = v10;
  }
  else {
    size_t v20 = v19;
  }
  int v21 = memcmp(v9, v18, v20);
  if (!v21)
  {
    if (v10 >= v19) {
      goto LABEL_37;
    }
LABEL_36:
    xpc_object_t v11 = (void *)a1[5];
    goto LABEL_37;
  }
  if (v21 < 0) {
    goto LABEL_36;
  }
LABEL_37:
  uint64_t v22 = v11[8];
  v49[0] = v11[7];
  v49[1] = v22;
  if (v22) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v22 + 8), 1uLL, memory_order_relaxed);
  }
  long long v23 = v7[5];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = *((char *)a2 + 23);
    unint64_t v25 = (uint64_t **)*a2;
    QMux::getName((uint64_t *)&__p, (QMux *)v49);
    uint64_t v26 = (uint64_t)(v24 >= 0 ? a2 : v25);
    std::string::size_type v27 = v48 >= 0 ? &__p : (void **)__p;
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = v26;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v27;
    _os_log_impl(&dword_1C5767000, v23, OS_LOG_TYPE_DEFAULT, "#I Mapping service %s to QMux %s", buf, 0x16u);
    if (v48 < 0) {
      operator delete(__p);
    }
  }
  *(void *)buf = *(void *)(v7[20] + 24);
  std::string::size_type v28 = (std::__shared_weak_count *)operator new(0x30uLL);
  v28->__shared_owners_ = 0;
  v28->__shared_weak_owners_ = 0;
  v28->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20FF5C8;
  uint64_t v29 = &v28[1].__vftable;
  qmi::QMuxServerAccepter::QMuxServerAccepter();
  std::string __p = &v28[1];
  uint8x8_t v47 = v28;
  v50[0] = &unk_1F20FF618;
  v50[1] = sValidateConnection;
  size_t v51 = v50;
  qmi::QMuxServerAccepter::setValidationStrategy();
  if (v51 == v50)
  {
    (*(void (**)(void *))(v50[0] + 32))(v50);
  }
  else if (v51)
  {
    (*(void (**)(void))(*v51 + 40))();
  }
  *(void *)buf = v28 + 1;
  *(void *)&uint8_t buf[8] = v28;
  atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v31 = (char *)v7[34];
  unint64_t v30 = v7[35];
  if ((unint64_t)v31 >= v30)
  {
    unint64_t v32 = (char *)v7[33];
    uint64_t v33 = (v31 - v32) >> 4;
    unint64_t v34 = v33 + 1;
    if ((unint64_t)(v33 + 1) >> 60) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v35 = v30 - (void)v32;
    if (v35 >> 3 > v34) {
      unint64_t v34 = v35 >> 3;
    }
    if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v36 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v36 = v34;
    }
    if (v36 >> 60) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    char v37 = (char *)operator new(16 * v36);
    uint64_t v38 = &v37[16 * v33];
    *(void *)uint64_t v38 = v29;
    *((void *)v38 + 1) = v28;
    std::string::size_type v39 = &v37[16 * v36];
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = 0;
    std::string::size_type v40 = v38 + 16;
    if (v31 == v32)
    {
      v7[33] = v38;
      v7[34] = v40;
      v7[35] = v39;
    }
    else
    {
      do
      {
        long long v41 = *((_OWORD *)v31 - 1);
        v31 -= 16;
        *((_OWORD *)v38 - 1) = v41;
        v38 -= 16;
        *(void *)uint64_t v31 = 0;
        *((void *)v31 + 1) = 0;
      }
      while (v31 != v32);
      uint64_t v31 = (char *)v7[33];
      uint64_t v42 = (char *)v7[34];
      v7[33] = v38;
      v7[34] = v40;
      for (v7[35] = v39; v42 != v31; v42 -= 16)
      {
        long long v43 = (std::__shared_weak_count *)*((void *)v42 - 1);
        if (v43 && !atomic_fetch_add(&v43->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
          std::__shared_weak_count::__release_weak(v43);
        }
      }
    }
    if (v31) {
      operator delete(v31);
    }
    size_t v44 = *(std::__shared_weak_count **)&buf[8];
    v7[34] = v40;
    if (v44 && !atomic_fetch_add(&v44->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  else
  {
    *(void *)uint64_t v31 = v29;
    *((void *)v31 + 1) = v28;
    v7[34] = v31 + 16;
  }
  uint64_t v45 = v47;
  if (v47 && !atomic_fetch_add(&v47->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
    std::__shared_weak_count::__release_weak(v45);
  }
  QMux::~QMux((QMux *)v49);
}

void sub_1C595455C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  QMux::~QMux((QMux *)va);
  _Unwind_Resume(a1);
}

void sub_1C5954570(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v7 = va_arg(va2, void);
  uint64_t v9 = va_arg(va2, void);
  std::function<BOOL ()(void *)>::~function((uint64_t *)va2);
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  QMux::~QMux((QMux *)va1);
  _Unwind_Resume(a1);
}

void sub_1C5954594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  std::__shared_weak_count::~__shared_weak_count(v13);
  operator delete(v15);
  QMux::~QMux((QMux *)&a13);
  _Unwind_Resume(a1);
}

void sub_1C59545B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  QMux::~QMux((QMux *)va);
  _Unwind_Resume(a1);
}

void sub_1C59545C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v7 = va_arg(va2, void);
  uint64_t v9 = va_arg(va2, void);
  uint64_t v10 = va_arg(va2, void);
  uint64_t v11 = va_arg(va2, void);
  uint64_t v12 = va_arg(va2, void);
  uint64_t v13 = va_arg(va2, void);
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100]((uint64_t)va2);
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  QMux::~QMux((QMux *)va1);
  _Unwind_Resume(a1);
}

uint64_t sValidateConnection(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    xpc_object_t v1 = a1;
    xpc_retain(a1);
    xpc_object_t xdict = v1;
  }
  else
  {
    xpc_object_t v1 = xpc_null_create();
    xpc_object_t xdict = v1;
    if (!v1)
    {
      xpc_object_t v2 = xpc_null_create();
      xpc_object_t v1 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C8792D30](v1) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v1);
    goto LABEL_9;
  }
  xpc_object_t v2 = xpc_null_create();
LABEL_8:
  xpc_object_t xdict = v2;
LABEL_9:
  xpc_release(v1);
  xpc_object_t v3 = xdict;
  remote_connection = xpc_dictionary_get_remote_connection(xdict);
  pid_t pid = xpc_connection_get_pid(remote_connection);
  pid_t v6 = getpid();
  if (v6 != pid)
  {
    memset(v16, 170, sizeof(v16));
    xpc_object_t value = xpc_dictionary_get_value(xdict, (const char *)*MEMORY[0x1E4FB8C20]);
    xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    memset(__p, 0, sizeof(__p));
    xpc::dyn_cast_or_default();
    xpc_release(object);
    xpc_object_t v9 = xpc_dictionary_get_value(xdict, (const char *)*MEMORY[0x1E4FB8C28]);
    __p[0] = v9;
    if (v9) {
      xpc_retain(v9);
    }
    else {
      __p[0] = xpc_null_create();
    }
    char v10 = xpc::dyn_cast_or_default((xpc *)__p, 0);
    xpc_release(__p[0]);
    uint64_t v7 = hasBasebandEntitlement(&xdict, v10 == 3);
    if ((v7 & 1) == 0 && (uint64_t v11 = GetOsLogContext()[1], os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)))
    {
      uint64_t v13 = (void *)qmi::asShortString();
      size_t v14 = v16;
      LODWORD(__p[0]) = 136446978;
      if (SHIBYTE(v16[2]) < 0) {
        size_t v14 = (void **)v16[0];
      }
      *(void **)((char *)__p + 4) = v14;
      WORD2(__p[1]) = 2080;
      *(void **)((char *)&__p[1] + 6) = v13;
      HIWORD(__p[2]) = 1024;
      pid_t v19 = pid;
      __int16 v20 = 1024;
      pid_t v21 = v6;
      _os_log_fault_impl(&dword_1C5767000, v11, OS_LOG_TYPE_FAULT, "QMI client '%{public}s' lacks entitlements for svc '%s', remote pid_t pid = %d our pid_t pid = %d", (uint8_t *)__p, 0x22u);
      if ((SHIBYTE(v16[2]) & 0x80000000) == 0) {
        goto LABEL_21;
      }
    }
    else if ((SHIBYTE(v16[2]) & 0x80000000) == 0)
    {
LABEL_21:
      xpc_object_t v3 = xdict;
      goto LABEL_22;
    }
    operator delete(v16[0]);
    goto LABEL_21;
  }
  uint64_t v7 = 1;
LABEL_22:
  xpc_release(v3);
  return v7;
}

void sub_1C5954860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, xpc_object_t object, xpc_object_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  xpc_release(object);
  _Unwind_Resume(a1);
}

void *std::function<BOOL ()(void *)>::~function(void *a1)
{
  xpc_object_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
    return a1;
  }
  else
  {
    if (v2) {
      (*(void (**)(void *))(*v2 + 40))(v2);
    }
    return a1;
  }
}

uint64_t *__copy_helper_block_e8_40c120_ZTSNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE4QMuxNS_4lessIS6_EENS4_INS_4pairIKS6_S7_EEEEEE(uint64_t *result, uint64_t a2)
{
  result[6] = 0;
  uint64_t v2 = (uint64_t)(result + 6);
  result[5] = (uint64_t)(result + 6);
  xpc_object_t v3 = result + 5;
  result[7] = 0;
  xpc_object_t v4 = *(const void ***)(a2 + 40);
  uint64_t v5 = (const void ***)(a2 + 48);
  if (v4 != (const void **)(a2 + 48))
  {
    do
    {
      BOOL result = std::__tree<std::__value_type<std::string,QMux>,std::__map_value_compare<std::string,std::__value_type<std::string,QMux>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,QMux>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,QMux> const&>(v3, v2, v4 + 4, (uint64_t)(v4 + 4));
      pid_t v6 = (const void **)v4[1];
      if (v6)
      {
        do
        {
          uint64_t v7 = (const void ***)v6;
          pid_t v6 = (const void **)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          uint64_t v7 = (const void ***)v4[2];
          BOOL v8 = *v7 == v4;
          xpc_object_t v4 = (const void **)v7;
        }
        while (!v8);
      }
      xpc_object_t v4 = (const void **)v7;
    }
    while (v7 != v5);
  }
  return result;
}

void sub_1C5954A40(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<std::string,QMux>,std::__map_value_compare<std::string,std::__value_type<std::string,QMux>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,QMux>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_40c120_ZTSNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE4QMuxNS_4lessIS6_EENS4_INS_4pairIKS6_S7_EEEEEE(uint64_t a1)
{
}

void non-virtual thunk to'QMITransportService::init(QMITransportService *this)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 0x40000000;
  v1[2] = ___ZN19QMITransportService4initEv_block_invoke;
  v1[3] = &__block_descriptor_tmp_11;
  v1[4] = (char *)this - 104;
  ctu::SharedSynchronizable<QMITransportService>::execute_wrapped((uint64_t *)this - 4, (uint64_t)v1);
}

BOOL QMITransportService::engage(QMITransportService *this)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v43 = 0;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v42 = 0;
  uint64_t v2 = dispatch_group_create();
  xpc_object_t v3 = v2;
  dispatch_group_t group = v2;
  if (v2)
  {
    dispatch_retain(v2);
    dispatch_group_enter(v3);
  }
  unint64_t v5 = *((void *)this + 9);
  xpc_object_t v4 = (std::__shared_weak_count *)*((void *)this + 10);
  unint64_t v38 = 0xAAAAAAAAAAAAAAAALL;
  std::string::size_type v39 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  if (!v4 || (pid_t v6 = std::__shared_weak_count::lock(v4)) == 0) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v7 = v6;
  unint64_t v38 = v5;
  std::string::size_type v39 = v6;
  atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
  uint64_t v33 = this;
  unint64_t v34 = &v38;
  p_dispatch_group_t group = &group;
  unint64_t v36 = (void **)&v43;
  char v37 = __p;
  *(void *)&long long block = MEMORY[0x1E4F143A8];
  *((void *)&block + 1) = 0x40000000;
  uint64_t v45 = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZNS1_6engageEvE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS5__block_invoke;
  unint64_t v46 = &__block_descriptor_tmp_128;
  uint8x8_t v47 = (char *)this + 72;
  char v48 = &v33;
  BOOL v8 = *((void *)this + 11);
  if (!*((void *)this + 12))
  {
    dispatch_sync(v8, &block);
    xpc_object_t v9 = v39;
    if (!v39) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  dispatch_async_and_wait(v8, &block);
  xpc_object_t v9 = v39;
  if (v39) {
LABEL_9:
  }
    std::__shared_weak_count::__release_weak(v9);
LABEL_10:
  char v10 = (capabilities::abs *)group;
  if (group)
  {
    dispatch_group_leave(group);
    char v10 = (capabilities::abs *)group;
    if (group) {
      dispatch_release(group);
    }
  }
  unint64_t v11 = capabilities::abs::engageTimeoutScalingFactor(v10);
  int64_t v12 = 27000000000;
  if (is_mul_ok(v11, 0x649534E00uLL))
  {
    int64_t v12 = 27000000000 * v11;
  }
  else
  {
    uint64_t v13 = *((void *)this + 5);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(block) = 134217984;
      *(void *)((char *)&block + 4) = 27000000000;
      _os_log_error_impl(&dword_1C5767000, v13, OS_LOG_TYPE_ERROR, "Scaled transport timeout overflowed, falling back to unscaled value %llu", (uint8_t *)&block, 0xCu);
    }
  }
  LOBYTE(v38) = -86;
  dispatch_time_t v14 = dispatch_time(0, v12);
  intptr_t v15 = dispatch_group_wait(v3, v14);
  LOBYTE(v38) = v15 != 0;
  if (v15)
  {
    int v16 = *((void *)this + 5);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(block) = 0;
      _os_log_error_impl(&dword_1C5767000, v16, OS_LOG_TYPE_ERROR, "----------------- Timeout ----------------", (uint8_t *)&block, 2u);
    }
  }
  uint64_t v33 = (QMITransportService *)&v43;
  unint64_t v34 = &v38;
  p_dispatch_group_t group = (dispatch_group_t *)this;
  unint64_t v36 = __p;
  *(void *)&long long block = MEMORY[0x1E4F143A8];
  *((void *)&block + 1) = 0x40000000;
  uint64_t v45 = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZNS1_6engageEvE3__1EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS5__block_invoke;
  unint64_t v46 = &__block_descriptor_tmp_138_0;
  uint8x8_t v47 = (char *)this + 72;
  char v48 = &v33;
  int v17 = *((void *)this + 11);
  if (*((void *)this + 12))
  {
    dispatch_async_and_wait(v17, &block);
    if (v43)
    {
LABEL_22:
      long long block = 0uLL;
      uint64_t v18 = (std::__shared_weak_count *)*((void *)this + 39);
      if (!v18) {
        goto LABEL_44;
      }
      *((void *)&block + 1) = std::__shared_weak_count::lock(v18);
      if (!*((void *)&block + 1)) {
        goto LABEL_47;
      }
      uint64_t v19 = *((void *)this + 38);
      *(void *)&long long block = v19;
      if (!v19)
      {
LABEL_44:
        std::string::size_type v27 = (std::__shared_weak_count *)*((void *)&block + 1);
        if (*((void *)&block + 1)
          && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&block + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
        }
LABEL_47:
        int v24 = v43;
        if (!v3) {
          goto LABEL_49;
        }
        goto LABEL_48;
      }
      __int16 v20 = abm::kEventTransportIsReady[0];
      size_t v21 = strlen(abm::kEventTransportIsReady[0]);
      if (v21 >= 0x7FFFFFFFFFFFFFF8) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      uint64_t v22 = (void *)v21;
      if (v21 >= 0x17)
      {
        uint64_t v25 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v21 | 7) != 0x17) {
          uint64_t v25 = v21 | 7;
        }
        uint64_t v26 = v25 + 1;
        long long v23 = (void **)operator new(v25 + 1);
        __dst[1] = v22;
        unint64_t v32 = v26 | 0x8000000000000000;
        __dst[0] = v23;
      }
      else
      {
        HIBYTE(v32) = v21;
        long long v23 = __dst;
        if (!v21) {
          goto LABEL_38;
        }
      }
      memmove(v23, v20, (size_t)v22);
LABEL_38:
      *((unsigned char *)v22 + (void)v23) = 0;
      aBlock = 0;
      CFTypeRef cf = 0;
      Service::broadcastEvent(v19, (uint64_t)__dst, &cf, (const void **)&aBlock);
      if (aBlock) {
        _Block_release(aBlock);
      }
      if (cf) {
        CFRelease(cf);
      }
      if (SHIBYTE(v32) < 0) {
        operator delete(__dst[0]);
      }
      goto LABEL_44;
    }
  }
  else
  {
    dispatch_sync(v17, &block);
    if (v43) {
      goto LABEL_22;
    }
  }
  int v24 = 0;
  if (v3) {
LABEL_48:
  }
    dispatch_release(v3);
LABEL_49:
  if (SHIBYTE(v42) < 0) {
    operator delete(__p[0]);
  }
  return v24 != 0;
}

void sub_1C5954F54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *aBlock, char a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,dispatch_group_t group,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,char a33)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

BOOL non-virtual thunk to'QMITransportService::engage(QMITransportService *this)
{
  return QMITransportService::engage((QMITransportService *)((char *)this - 104));
}

BOOL QMITransportService::recover(QMITransportService *this)
{
  unsigned __int8 v19 = 0;
  uint64_t v18 = 0x10AAAAAAAAAAAA00;
  *(_OWORD *)std::string __p = *(_OWORD *)"Recovery failure";
  uint64_t v2 = dispatch_group_create();
  xpc_object_t v3 = v2;
  dispatch_group_t group = v2;
  if (v2)
  {
    dispatch_retain(v2);
    dispatch_group_enter(v3);
  }
  int64_t v12 = this;
  p_dispatch_group_t group = &group;
  dispatch_time_t v14 = (QMITransportService *)&v19;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v21 = 0x40000000;
  uint64_t v22 = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZNS1_7recoverEvE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS5__block_invoke;
  long long v23 = &__block_descriptor_tmp_139;
  int v24 = (char *)this + 72;
  uint64_t v25 = &v12;
  xpc_object_t v4 = *((void *)this + 11);
  if (*((void *)this + 12))
  {
    dispatch_async_and_wait(v4, &block);
    unint64_t v5 = group;
    if (!group) {
      goto LABEL_9;
    }
  }
  else
  {
    dispatch_sync(v4, &block);
    unint64_t v5 = group;
    if (!group) {
      goto LABEL_9;
    }
  }
  dispatch_group_leave(v5);
  if (group) {
    dispatch_release(group);
  }
LABEL_9:
  dispatch_time_t v6 = dispatch_time(0, 27000000000);
  intptr_t v7 = dispatch_group_wait(v3, v6);
  LOBYTE(group) = v7 != 0;
  if (v7)
  {
    BOOL v8 = *((void *)this + 5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(block) = 0;
      _os_log_error_impl(&dword_1C5767000, v8, OS_LOG_TYPE_ERROR, "----------------- Timeout ----------------", (uint8_t *)&block, 2u);
    }
  }
  int64_t v12 = (QMITransportService *)&v19;
  p_dispatch_group_t group = &group;
  dispatch_time_t v14 = this;
  intptr_t v15 = __p;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v21 = 0x40000000;
  uint64_t v22 = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZNS1_7recoverEvE3__1EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS5__block_invoke;
  long long v23 = &__block_descriptor_tmp_148;
  int v24 = (char *)this + 72;
  uint64_t v25 = &v12;
  xpc_object_t v9 = *((void *)this + 11);
  if (*((void *)this + 12))
  {
    dispatch_async_and_wait(v9, &block);
    int v10 = v19;
    if (!v3) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  dispatch_sync(v9, &block);
  int v10 = v19;
  if (v3) {
LABEL_14:
  }
    dispatch_release(v3);
LABEL_15:
  if (SHIBYTE(v18) < 0) {
    operator delete(__p[0]);
  }
  return v10 != 0;
}

BOOL non-virtual thunk to'QMITransportService::recover(QMITransportService *this)
{
  return QMITransportService::recover((QMITransportService *)((char *)this - 104));
}

void QMITransportService::enterLowPower(uint64_t a1, NSObject **a2)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1174405120;
  v8[2] = ___ZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionE_block_invoke;
  void v8[3] = &__block_descriptor_tmp_13_8;
  xpc_object_t v3 = *a2;
  v8[4] = a1;
  dispatch_group_t group = v3;
  if (v3)
  {
    dispatch_retain(v3);
    dispatch_group_enter(group);
  }
  int v10 = v8;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v12 = 0x40000000;
  uint64_t v13 = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  dispatch_time_t v14 = &__block_descriptor_tmp_112_0;
  uint64_t v15 = a1 + 72;
  int v16 = &v10;
  xpc_object_t v4 = *(NSObject **)(a1 + 88);
  if (*(void *)(a1 + 96)) {
    dispatch_async_and_wait(v4, &block);
  }
  else {
    dispatch_sync(v4, &block);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 0x40000000;
  v7[2] = ___ZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionE_block_invoke_14;
  v7[3] = &__block_descriptor_tmp_22;
  v7[4] = a1;
  int v10 = v7;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v12 = 0x40000000;
  uint64_t v13 = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  dispatch_time_t v14 = &__block_descriptor_tmp_112_0;
  uint64_t v15 = a1 + 72;
  int v16 = &v10;
  unint64_t v5 = *(NSObject **)(a1 + 88);
  if (*(void *)(a1 + 96))
  {
    dispatch_async_and_wait(v5, &block);
    dispatch_time_t v6 = group;
    if (!group) {
      return;
    }
  }
  else
  {
    dispatch_sync(v5, &block);
    dispatch_time_t v6 = group;
    if (!group) {
      return;
    }
  }
  dispatch_group_leave(v6);
  if (group) {
    dispatch_release(group);
  }
}

void ___ZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionE_block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void **)(a1 + 32);
  xpc_object_t v4 = (char *)v2[41];
  xpc_object_t v3 = (char *)v2[42];
  uint64_t v5 = v3 - v4;
  dispatch_time_t v6 = v4;
  if (v3 == v4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = ((v3 - v4) << 6) - 1;
  }
  unint64_t v8 = v2[44];
  unint64_t v9 = v2[45] + v8;
  if (v7 == v9)
  {
    if (v8 >= 0x200)
    {
      v2[44] = v8 - 512;
      int v10 = v4 + 8;
      uint64_t v11 = *(void *)v4;
      v2[41] = v4 + 8;
      if (v3 != (char *)v2[43])
      {
LABEL_93:
        *(void *)xpc_object_t v3 = v11;
        goto LABEL_94;
      }
      uint64_t v12 = (char *)v2[40];
      if (v10 > v12)
      {
        uint64_t v13 = (v10 - v12) >> 3;
        if (v13 >= -1) {
          uint64_t v14 = v13 + 1;
        }
        else {
          uint64_t v14 = v13 + 2;
        }
        uint64_t v15 = v14 >> 1;
        uint64_t v16 = -v15;
        int v17 = &v10[-8 * v15];
        int64_t v18 = v3 - v10;
        if (v3 != v10)
        {
          memmove(&v10[-8 * v15], v10, v3 - v10);
          xpc_object_t v3 = (char *)v2[41];
        }
        unsigned __int8 v19 = &v3[8 * v16];
        xpc_object_t v3 = &v17[v18];
        v2[41] = v19;
        v2[42] = &v17[v18];
        goto LABEL_93;
      }
      unint64_t v31 = (v3 - v12) >> 2;
      if (v3 == v12) {
        unint64_t v31 = 1;
      }
      if (!(v31 >> 61))
      {
        unint64_t v32 = v31 >> 2;
        uint64_t v33 = 8 * v31;
        unint64_t v34 = (char *)operator new(8 * v31);
        uint64_t v35 = &v34[8 * v32];
        int64_t v37 = v3 - v10;
        BOOL v36 = v3 == v10;
        xpc_object_t v3 = v35;
        if (v36) {
          goto LABEL_91;
        }
        xpc_object_t v3 = &v35[v37 & 0xFFFFFFFFFFFFFFF8];
        unint64_t v38 = v37 - 8;
        if ((unint64_t)(v37 - 8) >= 0x38)
        {
          v90 = &v34[8 * v32];
          std::string::size_type v39 = v90;
          if ((unint64_t)(v90 - v10) >= 0x20)
          {
            uint64_t v91 = (v38 >> 3) + 1;
            uint64_t v92 = 8 * (v91 & 0x3FFFFFFFFFFFFFFCLL);
            std::string::size_type v39 = &v35[v92];
            v10 += v92;
            uint64_t v93 = (long long *)(v4 + 24);
            int v94 = v90 + 16;
            uint64_t v95 = v91 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v96 = *v93;
              *(v94 - 1) = *(v93 - 1);
              *int v94 = v96;
              v93 += 2;
              v94 += 2;
              v95 -= 4;
            }
            while (v95);
            if (v91 == (v91 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_91:
              v2[40] = v34;
              v2[41] = v35;
              v2[42] = v3;
              v2[43] = &v34[v33];
              if (v12)
              {
                operator delete(v12);
                xpc_object_t v3 = (char *)v2[42];
              }
              goto LABEL_93;
            }
          }
        }
        else
        {
          std::string::size_type v39 = &v34[8 * v32];
        }
        do
        {
          uint64_t v97 = *(void *)v10;
          v10 += 8;
          *(void *)std::string::size_type v39 = v97;
          v39 += 8;
        }
        while (v39 != v3);
        goto LABEL_91;
      }
LABEL_123:
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    __int16 v20 = (char *)v2[43];
    uint64_t v21 = (char *)v2[40];
    if (v5 >> 3 >= (unint64_t)((v20 - v21) >> 3))
    {
      uint64_t v125 = v5 >> 3;
      if (v20 == v21) {
        unint64_t v24 = 1;
      }
      else {
        unint64_t v24 = (v20 - v21) >> 2;
      }
      if (!(v24 >> 61))
      {
        uint64_t v25 = (char *)operator new(8 * v24);
        uint64_t v26 = operator new(0x1000uLL);
        std::string::size_type v27 = &v25[8 * v125];
        std::string::size_type v28 = &v25[8 * v24];
        if (v125 == v24)
        {
          uint64_t v29 = v26;
          if (v5 < 1)
          {
            if (v3 == v4) {
              unint64_t v41 = 1;
            }
            else {
              unint64_t v41 = v5 >> 2;
            }
            if (v41 >> 61) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            std::string::size_type v27 = (char *)operator new(8 * v41);
            std::string::size_type v28 = &v27[8 * v41];
            operator delete(v25);
            dispatch_time_t v6 = (char *)v2[41];
            xpc_object_t v3 = (char *)v2[42];
            uint64_t v25 = v27;
          }
          else
          {
            unint64_t v30 = v125 + 2;
            if (v125 >= -1) {
              unint64_t v30 = v125 + 1;
            }
            v27 -= 8 * (v30 >> 1);
          }
          uint64_t v26 = v29;
        }
        *(void *)std::string::size_type v27 = v26;
        uint64_t v42 = v27 + 8;
        if (v3 != v6)
        {
          do
          {
            if (v27 == v25)
            {
              if (v42 >= v28)
              {
                if (v28 == v25) {
                  unint64_t v49 = 1;
                }
                else {
                  unint64_t v49 = (v28 - v25) >> 2;
                }
                if (v49 >> 61) {
                  std::__throw_bad_array_new_length[abi:ne180100]();
                }
                uint64_t v50 = (char *)operator new(8 * v49);
                size_t v51 = v50;
                unint64_t v52 = (v49 + 3) >> 2;
                std::string::size_type v27 = &v50[8 * v52];
                int64_t v53 = v42 - v25;
                BOOL v36 = v42 == v25;
                uint64_t v42 = v27;
                if (!v36)
                {
                  uint64_t v42 = &v27[v53 & 0xFFFFFFFFFFFFFFF8];
                  unint64_t v54 = v53 - 8;
                  v55 = &v50[8 * v52];
                  v56 = v25;
                  if (v54 < 0x38) {
                    goto LABEL_127;
                  }
                  uint64_t v57 = 8 * v52;
                  v55 = &v50[8 * v52];
                  v56 = v25;
                  if ((unint64_t)(v55 - v25) < 0x20) {
                    goto LABEL_127;
                  }
                  uint64_t v58 = (v54 >> 3) + 1;
                  uint64_t v59 = 8 * (v58 & 0x3FFFFFFFFFFFFFFCLL);
                  v55 = &v27[v59];
                  v56 = &v25[v59];
                  v60 = (long long *)(v25 + 16);
                  v61 = &v50[v57 + 16];
                  uint64_t v62 = v58 & 0x3FFFFFFFFFFFFFFCLL;
                  do
                  {
                    long long v63 = *v60;
                    *((_OWORD *)v61 - 1) = *(v60 - 1);
                    *(_OWORD *)v61 = v63;
                    v60 += 2;
                    v61 += 32;
                    v62 -= 4;
                  }
                  while (v62);
                  if (v58 != (v58 & 0x3FFFFFFFFFFFFFFCLL))
                  {
LABEL_127:
                    do
                    {
                      uint64_t v64 = *(void *)v56;
                      v56 += 8;
                      *(void *)v55 = v64;
                      v55 += 8;
                    }
                    while (v55 != v42);
                  }
                }
                std::string::size_type v28 = &v50[8 * v49];
                operator delete(v25);
                uint64_t v25 = v51;
              }
              else
              {
                uint64_t v45 = (v28 - v42) >> 3;
                if (v45 >= -1) {
                  uint64_t v46 = v45 + 1;
                }
                else {
                  uint64_t v46 = v45 + 2;
                }
                uint64_t v47 = v46 >> 1;
                std::string::size_type v27 = &v25[8 * (v46 >> 1)];
                char v48 = v25;
                if (v42 != v25)
                {
                  memmove(v27, v25, v42 - v25);
                  char v48 = v42;
                }
                uint64_t v42 = (char *)v48 + 8 * v47;
              }
            }
            uint64_t v44 = *((void *)v3 - 1);
            v3 -= 8;
            *((void *)v27 - 1) = v44;
            v27 -= 8;
          }
          while (v3 != (char *)v2[41]);
        }
        unsigned __int8 v43 = (void *)v2[40];
        v2[40] = v25;
        v2[41] = v27;
        v2[42] = v42;
        v2[43] = v28;
        uint64_t v1 = a1;
        if (v43) {
          operator delete(v43);
        }
        goto LABEL_95;
      }
      goto LABEL_123;
    }
    uint64_t v22 = operator new(0x1000uLL);
    long long v23 = v22;
    if (v20 != v3)
    {
      *(void *)xpc_object_t v3 = v22;
LABEL_94:
      v2[42] += 8;
LABEL_95:
      dispatch_time_t v6 = (char *)v2[41];
      unint64_t v9 = v2[45] + v2[44];
      goto LABEL_96;
    }
    if (v4 == v21)
    {
      unint64_t v65 = (v20 - v4) >> 2;
      if (v3 == v4) {
        unint64_t v65 = 1;
      }
      if (v65 >> 61) {
        goto LABEL_123;
      }
      unint64_t v66 = (v65 + 3) >> 2;
      uint64_t v67 = 8 * v65;
      v68 = (char *)operator new(8 * v65);
      std::string::size_type v40 = &v68[8 * v66];
      unint64_t v69 = v40;
      if (v3 != v4)
      {
        unint64_t v69 = &v40[8 * (v5 >> 3)];
        size_t v70 = &v68[8 * v66];
        int v71 = v4;
        if ((unint64_t)(v5 - 8) < 0x38) {
          goto LABEL_128;
        }
        v72 = &v68[8 * v66];
        size_t v70 = v72;
        int v71 = v4;
        if ((unint64_t)(v72 - v4) < 0x20) {
          goto LABEL_128;
        }
        unint64_t v73 = ((unint64_t)(v5 - 8) >> 3) + 1;
        uint64_t v74 = 8 * (v73 & 0x3FFFFFFFFFFFFFFCLL);
        size_t v70 = &v40[v74];
        int v71 = &v4[v74];
        uint64_t v75 = (long long *)(v4 + 16);
        v76 = v72 + 16;
        uint64_t v77 = v73 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v78 = *v75;
          *(v76 - 1) = *(v75 - 1);
          _OWORD *v76 = v78;
          v75 += 2;
          v76 += 2;
          v77 -= 4;
        }
        while (v77);
        if (v73 != (v73 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_128:
          do
          {
            uint64_t v79 = *(void *)v71;
            v71 += 8;
            *(void *)size_t v70 = v79;
            v70 += 8;
          }
          while (v70 != v69);
        }
      }
      v2[40] = v68;
      v2[41] = v40;
      v2[42] = v69;
      v2[43] = &v68[v67];
      if (v4)
      {
        operator delete(v4);
        std::string::size_type v40 = (char *)v2[41];
      }
    }
    else
    {
      std::string::size_type v40 = v4;
    }
    *((void *)v40 - 1) = v23;
    uint64_t v80 = (char *)v2[41];
    uint64_t v81 = (char *)v2[42];
    v2[41] = v80 - 8;
    uint64_t v82 = *((void *)v80 - 1);
    v2[41] = v80;
    if (v81 != (char *)v2[43])
    {
LABEL_78:
      *(void *)uint64_t v81 = v82;
      goto LABEL_94;
    }
    v83 = (char *)v2[40];
    if (v80 > v83)
    {
      uint64_t v84 = (v80 - v83) >> 3;
      if (v84 >= -1) {
        uint64_t v85 = v84 + 1;
      }
      else {
        uint64_t v85 = v84 + 2;
      }
      uint64_t v86 = v85 >> 1;
      uint64_t v87 = -v86;
      v88 = &v80[-8 * v86];
      int64_t v89 = v81 - v80;
      if (v81 != v80)
      {
        memmove(&v80[-8 * v86], v80, v81 - v80);
        uint64_t v80 = (char *)v2[41];
      }
      v2[41] = &v80[8 * v87];
      v2[42] = &v88[v89];
      *(void *)&v88[v89] = v82;
      goto LABEL_94;
    }
    unint64_t v107 = (v81 - v83) >> 2;
    if (v81 == v83) {
      unint64_t v107 = 1;
    }
    if (v107 >> 61) {
      goto LABEL_123;
    }
    unint64_t v108 = v107 >> 2;
    uint64_t v109 = 8 * v107;
    CFAllocatorRef v110 = (char *)operator new(8 * v107);
    CFAllocatorRef v111 = &v110[8 * v108];
    int64_t v112 = v81 - v80;
    BOOL v36 = v81 == v80;
    uint64_t v81 = v111;
    if (!v36)
    {
      uint64_t v81 = &v111[v112 & 0xFFFFFFFFFFFFFFF8];
      unint64_t v113 = v112 - 8;
      if ((unint64_t)(v112 - 8) < 0x38)
      {
        CFAllocatorRef v114 = &v110[8 * v108];
        do
        {
LABEL_119:
          uint64_t v123 = *(void *)v80;
          v80 += 8;
          *(void *)CFAllocatorRef v114 = v123;
          v114 += 8;
        }
        while (v114 != v81);
        goto LABEL_120;
      }
      CFAllocatorRef v115 = &v110[8 * v108];
      CFAllocatorRef v114 = v115;
      if ((unint64_t)(v115 - v80) < 0x20) {
        goto LABEL_119;
      }
      uint64_t v116 = (v113 >> 3) + 1;
      uint64_t v117 = 8 * (v116 & 0x3FFFFFFFFFFFFFFCLL);
      CFAllocatorRef v114 = &v111[v117];
      CFAllocatorRef v118 = &v80[v117];
      CFAllocatorRef v119 = (long long *)(v80 + 16);
      CFAllocatorRef v120 = v115 + 16;
      uint64_t v121 = v116 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v122 = *v119;
        *(v120 - 1) = *(v119 - 1);
        *CFAllocatorRef v120 = v122;
        v119 += 2;
        v120 += 2;
        v121 -= 4;
      }
      while (v121);
      uint64_t v80 = v118;
      if (v116 != (v116 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_119;
      }
    }
LABEL_120:
    v2[40] = v110;
    v2[41] = v111;
    v2[42] = v81;
    v2[43] = &v110[v109];
    if (v83)
    {
      operator delete(v83);
      uint64_t v81 = (char *)v2[42];
    }
    goto LABEL_78;
  }
LABEL_96:
  uint64_t v98 = *(void *)&v6[(v9 >> 6) & 0x3FFFFFFFFFFFFF8];
  unint64_t v99 = v9 & 0x1FF;
  CFAllocatorRef v100 = *(NSObject **)(v1 + 40);
  *(void *)(v98 + 8 * v99) = v100;
  if (v100)
  {
    dispatch_retain(v100);
    v101 = *(NSObject **)(v98 + 8 * v99);
    if (v101) {
      dispatch_group_enter(v101);
    }
  }
  ++v2[45];
  v102 = (const void *)v2[48];
  if (v102 && v2[49])
  {
    CFAllocatorRef v103 = _Block_copy(v102);
    CFAllocatorRef v104 = v103;
    CFAllocatorRef v105 = v2[49];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 1174405120;
    block[2] = ___ZNK8dispatch8callbackIU13block_pointerFv10WakeReasonEEclIJNS1_6StatusEEEEvDpT__block_invoke;
    block[3] = &__block_descriptor_tmp_149;
    if (v103) {
      CFAllocatorRef v106 = _Block_copy(v103);
    }
    else {
      CFAllocatorRef v106 = 0;
    }
    aBlock = v106;
    int v128 = 2;
    dispatch_async(v105, block);
    if (aBlock) {
      _Block_release(aBlock);
    }
    if (v104) {
      _Block_release(v104);
    }
  }
}

void sub_1C5955B78(_Unwind_Exception *a1)
{
  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void ___ZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionE_block_invoke_14(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C5767000, v2, OS_LOG_TYPE_DEFAULT, "#I ----------------- Entering Low Power ----------------", buf, 2u);
  }
  *(unsigned char *)(v1 + 432) = 0;
  if (*(char *)(v1 + 431) < 0)
  {
    *(void *)(v1 + 416) = 0;
    xpc_object_t v3 = *(unsigned char **)(v1 + 408);
  }
  else
  {
    xpc_object_t v3 = (unsigned char *)(v1 + 408);
    *(unsigned char *)(v1 + 431) = 0;
  }
  unsigned char *v3 = 0;
  xpc_object_t v4 = dispatch_group_create();
  uint64_t v5 = v4;
  dispatch_time_t v6 = *(void **)(v1 + 240);
  uint64_t v7 = (void *)(v1 + 248);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1174405120;
  uint64_t v14 = ___ZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionE_block_invoke_16;
  uint64_t v15 = &__block_descriptor_tmp_18_3;
  uint64_t v16 = v1;
  dispatch_object_t object = v4;
  if (v4) {
    dispatch_retain(v4);
  }
  if (v6 != v7)
  {
    do
    {
      v14((uint64_t)v13, (QMux *)(v6 + 4));
      unint64_t v9 = (void *)v6[1];
      if (v9)
      {
        do
        {
          int v10 = v9;
          unint64_t v9 = (void *)*v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          int v10 = (void *)v6[2];
          BOOL v11 = *v10 == (void)v6;
          dispatch_time_t v6 = v10;
        }
        while (!v11);
      }
      dispatch_time_t v6 = v10;
    }
    while (v10 != v7);
  }
  unint64_t v8 = *(NSObject **)(v1 + 88);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionE_block_invoke_19;
  block[3] = &__block_descriptor_tmp_21_2;
  void block[4] = v1;
  dispatch_group_notify(v5, v8, block);
  if (object) {
    dispatch_release(object);
  }
  if (v5) {
    dispatch_release(v5);
  }
}

void sub_1C5955D7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, dispatch_object_t object)
{
  if (object)
  {
    dispatch_release(object);
    if (!v20) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if (!v20)
  {
    goto LABEL_3;
  }
  dispatch_release(v20);
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionE_block_invoke_16(uint64_t a1, QMux *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    QMux::getName((uint64_t *)__p, a2);
    if (v7 >= 0) {
      xpc_object_t v4 = __p;
    }
    else {
      xpc_object_t v4 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315394;
    unint64_t v9 = "enterLowPower_block_invoke";
    __int16 v10 = 2080;
    BOOL v11 = v4;
    _os_log_impl(&dword_1C5767000, v3, OS_LOG_TYPE_DEFAULT, "#I %s: Power Down %s", buf, 0x16u);
    if (v7 < 0) {
      operator delete(__p[0]);
    }
  }
  return QMux::enterPowerMode();
}

void ___ZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionE_block_invoke_19(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = &v21;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2000000000;
  uint64_t v24 = 0;
  xpc_object_t v3 = (void *)v1[30];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 0x40000000;
  int64_t v18 = ___ZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionE_block_invoke_2;
  unsigned __int8 v19 = &unk_1E6518458;
  __int16 v20 = &v21;
  if (v3 == v1 + 31)
  {
    xpc_object_t v4 = v1[5];
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  do
  {
    v18((uint64_t)v17, (QMux *)(v3 + 4));
    uint64_t v14 = (void *)v3[1];
    if (v14)
    {
      do
      {
        uint64_t v15 = v14;
        uint64_t v14 = (void *)*v14;
      }
      while (v14);
    }
    else
    {
      do
      {
        uint64_t v15 = (void *)v3[2];
        BOOL v16 = *v15 == (void)v3;
        xpc_object_t v3 = v15;
      }
      while (!v16);
    }
    xpc_object_t v3 = v15;
  }
  while (v15 != v1 + 31);
  uint64_t v2 = v22;
  xpc_object_t v4 = v1[5];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
LABEL_3:
    uint64_t v5 = v2[3];
    uint64_t v6 = v1[32];
    *(_DWORD *)buf = 134218240;
    uint64_t v28 = v5;
    __int16 v29 = 2048;
    uint64_t v30 = v6;
    _os_log_impl(&dword_1C5767000, v4, OS_LOG_TYPE_DEFAULT, "#I QMux powered down %zd of %zd QMux's", buf, 0x16u);
    uint64_t v2 = v22;
  }
LABEL_4:
  if (v1[32] == v2[3])
  {
    char v7 = (std::__shared_weak_count *)v1[10];
    if (!v7 || (v8 = v1[9], (unint64_t v9 = std::__shared_weak_count::lock(v7)) == 0)) {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    __int16 v10 = v9;
    p_shared_weak_owners = &v9->__shared_weak_owners_;
    atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v10);
    }
    uint64_t v12 = (void *)v1[18];
    atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
    uint64_t v26 = 0;
    uint64_t v13 = operator new(0x20uLL);
    void *v13 = &unk_1F20FF840;
    v13[1] = v1;
    void v13[2] = v8;
    v13[3] = v10;
    uint64_t v26 = v13;
    RouterIPCController::sleep(v12, v25);
    if (v26 == v25)
    {
      (*(void (**)(void *))(v25[0] + 32))(v25);
    }
    else if (v26)
    {
      (*(void (**)(void))(*v26 + 40))();
    }
    std::__shared_weak_count::__release_weak(v10);
  }
  _Block_object_dispose(&v21, 8);
}

void sub_1C595618C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  std::function<void ()(BOOL)>::~function((uint64_t *)va1);
  std::__shared_weak_count::__release_weak(v7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C59561C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C59561DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionE_block_invoke_2(uint64_t a1, QMux *this)
{
  uint64_t result = QMux::isPoweredDown(this);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

void non-virtual thunk to'QMITransportService::enterLowPower(uint64_t a1, NSObject **a2)
{
}

BOOL QMITransportService::tearDown(QMITransportService *this)
{
  unsigned __int8 v22 = 0;
  uint64_t v21 = 0x11AAAAAAAAAA0065;
  *(_OWORD *)std::string __p = *(_OWORD *)"Tear down failure";
  uint64_t v2 = (char *)this + 72;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 0x40000000;
  v19[2] = ___ZN19QMITransportService8tearDownEv_block_invoke;
  v19[3] = &__block_descriptor_tmp_24;
  v19[4] = this;
  uint64_t v14 = (QMITransportService *)v19;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v24 = 0x40000000;
  uint64_t v25 = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  uint64_t v26 = &__block_descriptor_tmp_112_0;
  std::string::size_type v27 = (char *)this + 72;
  uint64_t v28 = &v14;
  xpc_object_t v4 = (char *)this + 88;
  xpc_object_t v3 = *((void *)this + 11);
  if (*((void *)v4 + 1))
  {
    dispatch_async_and_wait(v3, &block);
    uint64_t v5 = dispatch_group_create();
    dispatch_group_t group = v5;
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_sync(v3, &block);
  uint64_t v5 = dispatch_group_create();
  dispatch_group_t group = v5;
  if (v5)
  {
LABEL_3:
    dispatch_retain(v5);
    dispatch_group_enter(v5);
  }
LABEL_4:
  uint64_t v14 = this;
  p_dispatch_group_t group = &group;
  BOOL v16 = (QMITransportService *)&v22;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v24 = 0x40000000;
  uint64_t v25 = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZNS1_8tearDownEvE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS5__block_invoke;
  uint64_t v26 = &__block_descriptor_tmp_151;
  std::string::size_type v27 = v2;
  uint64_t v28 = &v14;
  uint64_t v6 = *((void *)this + 11);
  if (*((void *)this + 12))
  {
    dispatch_async_and_wait(v6, &block);
    char v7 = group;
    if (!group) {
      goto LABEL_12;
    }
  }
  else
  {
    dispatch_sync(v6, &block);
    char v7 = group;
    if (!group) {
      goto LABEL_12;
    }
  }
  dispatch_group_leave(v7);
  if (group) {
    dispatch_release(group);
  }
LABEL_12:
  dispatch_time_t v8 = dispatch_time(0, 27000000000);
  intptr_t v9 = dispatch_group_wait(v5, v8);
  LOBYTE(group) = v9 != 0;
  if (v9)
  {
    __int16 v10 = *((void *)this + 5);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(block) = 0;
      _os_log_error_impl(&dword_1C5767000, v10, OS_LOG_TYPE_ERROR, "----------------- Timeout ----------------", (uint8_t *)&block, 2u);
    }
  }
  uint64_t v14 = (QMITransportService *)&v22;
  p_dispatch_group_t group = &group;
  BOOL v16 = this;
  int v17 = __p;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v24 = 0x40000000;
  uint64_t v25 = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZNS1_8tearDownEvE3__1EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS5__block_invoke;
  uint64_t v26 = &__block_descriptor_tmp_153;
  std::string::size_type v27 = v2;
  uint64_t v28 = &v14;
  uint64_t v11 = *((void *)this + 11);
  if (*((void *)this + 12))
  {
    dispatch_async_and_wait(v11, &block);
    int v12 = v22;
    if (!v5) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  dispatch_sync(v11, &block);
  int v12 = v22;
  if (v5) {
LABEL_17:
  }
    dispatch_release(v5);
LABEL_18:
  if (SHIBYTE(v21) < 0) {
    operator delete(__p[0]);
  }
  return v12 != 0;
}

void ___ZN19QMITransportService8tearDownEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  QMITransportService::cancelWakeRequest_sync((QMITransportService *)v1);
  if (*(void *)(v1 + 360))
  {
    uint64_t v2 = *(void *)(*(void *)(v1 + 328) + ((*(void *)(v1 + 352) >> 6) & 0x3FFFFFFFFFFFFF8));
    uint64_t v3 = *(void *)(v1 + 352) & 0x1FFLL;
    xpc_object_t v4 = *(NSObject **)(v2 + 8 * v3);
    if (v4)
    {
      dispatch_group_leave(v4);
      uint64_t v5 = *(NSObject **)(v2 + 8 * v3);
      if (v5) {
        dispatch_release(v5);
      }
    }
    int64x2_t v6 = vaddq_s64(*(int64x2_t *)(v1 + 352), (int64x2_t)xmmword_1C59A7040);
    *(int64x2_t *)(v1 + 352) = v6;
    if (v6.i64[0] >= 0x400uLL)
    {
      operator delete(**(void ***)(v1 + 328));
      *(void *)(v1 + 328) += 8;
      *(void *)(v1 + 352) -= 512;
    }
    char v7 = *(void **)(v1 + 368);
    *(void *)(v1 + 368) = 0;
    if (v7)
    {
      TelephonyBasebandWatchdogStop();
      operator delete(v7);
    }
    dispatch_time_t v8 = *(void **)(v1 + 376);
    *(void *)(v1 + 376) = 0;
    if (v8)
    {
      TelephonyBasebandWatchdogStop();
      operator delete(v8);
    }
  }
}

BOOL non-virtual thunk to'QMITransportService::tearDown(QMITransportService *this)
{
  return QMITransportService::tearDown((QMITransportService *)((char *)this - 104));
}

void QMITransportService::exitLowPower(uint64_t a1, NSObject **a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1174405120;
  v6[2] = ___ZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionE_block_invoke;
  v6[3] = &__block_descriptor_tmp_27_3;
  uint64_t v3 = *a2;
  v6[4] = a1;
  dispatch_group_t group = v3;
  if (v3)
  {
    dispatch_retain(v3);
    dispatch_group_enter(group);
  }
  dispatch_time_t v8 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_112_0;
  void block[4] = a1 + 72;
  void block[5] = &v8;
  xpc_object_t v4 = *(NSObject **)(a1 + 88);
  if (*(void *)(a1 + 96))
  {
    dispatch_async_and_wait(v4, block);
    uint64_t v5 = group;
    if (!group) {
      return;
    }
  }
  else
  {
    dispatch_sync(v4, block);
    uint64_t v5 = group;
    if (!group) {
      return;
    }
  }
  dispatch_group_leave(v5);
  if (group) {
    dispatch_release(group);
  }
}

void ___ZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionE_block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(QMITransportService **)(a1 + 32);
  uint64_t v3 = *((void *)v2 + 5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C5767000, v3, OS_LOG_TYPE_DEFAULT, "#I ----------------- Exiting Low Power ----------------", buf, 2u);
  }
  QMITransportService::updateWakeReason_sync(v2);
  xpc_object_t v4 = dispatch_group_create();
  uint64_t v5 = (std::__shared_weak_count *)*((void *)v2 + 10);
  if (!v5 || (uint64_t v6 = *((void *)v2 + 9), (v7 = std::__shared_weak_count::lock(v5)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  dispatch_time_t v8 = v7;
  p_shared_weak_owners = &v7->__shared_weak_owners_;
  atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v8);
  }
  __int16 v10 = (void *)*((void *)v2 + 18);
  atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
  uint64_t v11 = *(NSObject **)(a1 + 40);
  if (v11)
  {
    dispatch_retain(v11);
    dispatch_group_enter(v11);
  }
  if (v4) {
    dispatch_retain(v4);
  }
  BOOL v16 = 0;
  int v12 = operator new(0x30uLL);
  void *v12 = &unk_1F20FF940;
  v12[1] = v2;
  v12[2] = v6;
  v12[3] = v8;
  v12[4] = v11;
  if (v11)
  {
    dispatch_retain(v11);
    uint64_t v13 = v12[4];
    if (v13) {
      dispatch_group_enter(v13);
    }
  }
  v12[5] = v4;
  BOOL v16 = v12;
  RouterIPCController::wake(v10, v15);
  if (v16 == v15)
  {
    (*(void (**)(void *))(v15[0] + 32))(v15);
    if (v11)
    {
LABEL_18:
      dispatch_group_leave(v11);
      dispatch_release(v11);
    }
  }
  else
  {
    if (v16) {
      (*(void (**)(void))(*v16 + 40))();
    }
    if (v11) {
      goto LABEL_18;
    }
  }
  std::__shared_weak_count::__release_weak(v8);
  if (v4) {
    dispatch_release(v4);
  }
}

void sub_1C59569B4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  std::function<void ()(BOOL)>::~function((uint64_t *)va1);
  _ZZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_EN3__7D1Ev((uint64_t *)va);
  std::__shared_weak_count::__release_weak(v3);
  if (!v2) {
    _Unwind_Resume(a1);
  }
  dispatch_release(v2);
  _Unwind_Resume(a1);
}

void QMITransportService::updateWakeReason_sync(QMITransportService *this)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)((char *)this + 408);
  if ((*((char *)this + 431) & 0x80000000) == 0)
  {
    char SystemWakeReason = TelephonyUtilGetSystemWakeReason();
    xpc_object_t v4 = *((void *)this + 5);
    if (SystemWakeReason) {
      goto LABEL_3;
    }
LABEL_9:
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v6) = 0;
      _os_log_error_impl(&dword_1C5767000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch system wake reason", (uint8_t *)&v6, 2u);
      if (!*((void *)this + 48)) {
        return;
      }
      goto LABEL_11;
    }
LABEL_10:
    if (!*((void *)this + 48)) {
      return;
    }
    goto LABEL_11;
  }
  char v5 = TelephonyUtilGetSystemWakeReason();
  xpc_object_t v4 = *((void *)this + 5);
  if ((v5 & 1) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_10;
  }
  if (*((char *)this + 431) < 0) {
    uint64_t v2 = (void *)*v2;
  }
  int v6 = 136315138;
  uint64_t v7 = v2;
  _os_log_impl(&dword_1C5767000, v4, OS_LOG_TYPE_DEFAULT, "#I System wake reason: %s", (uint8_t *)&v6, 0xCu);
  if (*((void *)this + 48))
  {
LABEL_11:
    if (*((void *)this + 49)) {
      QMITransportService::getWakeReason_sync(this, 2);
    }
  }
}

void *_ZZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_EN3__7D1Ev(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[3];
  if (v3)
  {
    dispatch_group_leave(v3);
    xpc_object_t v4 = a1[3];
    if (v4) {
      dispatch_release(v4);
    }
  }
  char v5 = (std::__shared_weak_count *)a1[2];
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  return a1;
}

void non-virtual thunk to'QMITransportService::exitLowPower(uint64_t a1, NSObject **a2)
{
}

void QMITransportService::dumpState(QMITransportService *this)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  v3[2] = ___ZN19QMITransportService9dumpStateEv_block_invoke;
  v3[3] = &__block_descriptor_tmp_29;
  v3[4] = this;
  xpc_object_t v4 = v3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_112_0;
  void block[4] = (char *)this + 72;
  void block[5] = &v4;
  uint64_t v2 = (char *)this + 88;
  uint64_t v1 = *((void *)this + 11);
  if (*((void *)v2 + 1)) {
    dispatch_async_and_wait(v1, block);
  }
  else {
    dispatch_sync(v1, block);
  }
}

void ___ZN19QMITransportService9dumpStateEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 216);
  if (v2 != (void *)(v1 + 224))
  {
    do
    {
      QMux::dumpState((QMux *)(v2 + 4));
      xpc_object_t v4 = (void *)v2[1];
      if (v4)
      {
        do
        {
          char v5 = v4;
          xpc_object_t v4 = (void *)*v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          char v5 = (void *)v2[2];
          BOOL v6 = *v5 == (void)v2;
          uint64_t v2 = v5;
        }
        while (!v6);
      }
      uint64_t v2 = v5;
    }
    while (v5 != (void *)(v1 + 224));
  }
  uint64_t v3 = *(NSObject **)(v1 + 40);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1C5767000, v3, OS_LOG_TYPE_DEFAULT, "#I ----------------- Dump State ----------------", v7, 2u);
  }
}

void non-virtual thunk to'QMITransportService::dumpState(QMITransportService *this)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  v3[2] = ___ZN19QMITransportService9dumpStateEv_block_invoke;
  v3[3] = &__block_descriptor_tmp_29;
  v3[4] = (char *)this - 104;
  xpc_object_t v4 = v3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_112_0;
  void block[4] = (char *)this - 32;
  void block[5] = &v4;
  uint64_t v2 = (char *)this - 16;
  uint64_t v1 = *((void *)this - 2);
  if (*((void *)v2 + 1)) {
    dispatch_async_and_wait(v1, block);
  }
  else {
    dispatch_sync(v1, block);
  }
}

void QMITransportService::reportPowerDownMessages_sync(QMITransportService *this)
{
  xpc_object_t v2 = xpc_array_create(0, 0);
  uint64_t v3 = MEMORY[0x1E4F14568];
  if (v2 || (xpc_object_t v2 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C8792D30](v2) == v3)
    {
      xpc_retain(v2);
      xpc_object_t v4 = v2;
    }
    else
    {
      xpc_object_t v4 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v2 = 0;
  }
  xpc_release(v2);
  char v5 = (char *)*((void *)this + 30);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 1174405120;
  uint64_t v31 = ___ZN19QMITransportService28reportPowerDownMessages_syncEv_block_invoke;
  unint64_t v32 = &__block_descriptor_tmp_30_2;
  xpc_object_t object = v4;
  if (v4)
  {
    xpc_retain(v4);
    BOOL v6 = (char *)this + 248;
    if (v5 == (char *)this + 248) {
      goto LABEL_11;
    }
  }
  else
  {
    xpc_object_t object = xpc_null_create();
    BOOL v6 = (char *)this + 248;
    if (v5 == (char *)this + 248) {
      goto LABEL_11;
    }
  }
  do
  {
    v31((uint64_t)v30, (QMux *)(v5 + 32));
    uint64_t v7 = (char *)*((void *)v5 + 1);
    if (v7)
    {
      do
      {
        uint64_t v8 = v7;
        uint64_t v7 = *(char **)v7;
      }
      while (v7);
    }
    else
    {
      do
      {
        uint64_t v8 = (char *)*((void *)v5 + 2);
        BOOL v9 = *(void *)v8 == (void)v5;
        char v5 = v8;
      }
      while (!v9);
    }
    char v5 = v8;
  }
  while (v8 != v6);
LABEL_11:
  if (MEMORY[0x1C8792D30](v4) != v3) {
    goto LABEL_12;
  }
  if (!xpc_array_get_count(v4)) {
    goto LABEL_12;
  }
  uint64_t v10 = (std::__shared_weak_count *)*((void *)this + 39);
  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v11 = std::__shared_weak_count::lock(v10);
  __int16 v29 = v11;
  if (!v11) {
    goto LABEL_12;
  }
  uint64_t v28 = *((void *)this + 38);
  if (!v28)
  {
    uint64_t v14 = v11;
LABEL_48:
    if (!atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
    goto LABEL_12;
  }
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  if (v12 || (xpc_object_t v12 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C8792D30](v12) == MEMORY[0x1E4F14590])
    {
      xpc_retain(v12);
      xpc_object_t v13 = v12;
    }
    else
    {
      xpc_object_t v13 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v13 = xpc_null_create();
    xpc_object_t v12 = 0;
  }
  xpc_release(v12);
  if (v4)
  {
    xpc_retain(v4);
    xpc_object_t v15 = v4;
  }
  else
  {
    xpc_object_t v15 = xpc_null_create();
  }
  xpc_dictionary_set_value(v13, abm::kKeyPowerDownMessageList[0], v15);
  xpc_object_t v16 = xpc_null_create();
  xpc_release(v15);
  xpc_release(v16);
  uint64_t v17 = v28;
  int64_t v18 = abm::kCommandSetPowerDownMessageList[0];
  size_t v19 = strlen(abm::kCommandSetPowerDownMessageList[0]);
  if (v19 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  __int16 v20 = (void *)v19;
  if (v19 >= 0x17)
  {
    uint64_t v22 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17) {
      uint64_t v22 = v19 | 7;
    }
    uint64_t v23 = v22 + 1;
    uint64_t v21 = (void **)operator new(v22 + 1);
    __dst[1] = v20;
    unint64_t v27 = v23 | 0x8000000000000000;
    __dst[0] = v21;
    goto LABEL_41;
  }
  HIBYTE(v27) = v19;
  uint64_t v21 = __dst;
  if (v19) {
LABEL_41:
  }
    memmove(v21, v18, (size_t)v20);
  *((unsigned char *)v20 + (void)v21) = 0;
  xpc_object_t v25 = v13;
  if (v13) {
    xpc_retain(v13);
  }
  else {
    xpc_object_t v25 = xpc_null_create();
  }
  uint64_t v24 = 0;
  Service::runCommand(v17, (uint64_t)__dst, &v25, &v24);
  xpc_release(v25);
  xpc_object_t v25 = 0;
  if (SHIBYTE(v27) < 0) {
    operator delete(__dst[0]);
  }
  xpc_release(v13);
  uint64_t v14 = v29;
  if (v29) {
    goto LABEL_48;
  }
LABEL_12:
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v4);
}

void sub_1C59571DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,xpc_object_t a23)
{
  xpc_release(object);
  if (a16 < 0) {
    operator delete(__p);
  }
  xpc_release(v24);
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100]((uint64_t)&a17);
  xpc_release(a23);
  a23 = 0;
  xpc_release(v23);
  _Unwind_Resume(a1);
}

void ___ZN19QMITransportService28reportPowerDownMessages_syncEv_block_invoke(uint64_t a1, QMux *this)
{
  memset(v16, 170, sizeof(v16));
  QMux::getQMIPowerDownMessages(v16, this);
  uint64_t v3 = v16[0];
  if ((uint64_t *)v16[0] != &v16[1])
  {
    uint64_t v4 = MEMORY[0x1E4F14590];
    do
    {
      int64_t v5 = *(unsigned __int8 *)(v3 + 26);
      int64_t v6 = *(unsigned __int16 *)(v3 + 28);
      xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
      if (v7 || (xpc_object_t v7 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x1C8792D30](v7) == v4)
        {
          xpc_retain(v7);
          xpc_object_t v8 = v7;
        }
        else
        {
          xpc_object_t v8 = xpc_null_create();
        }
      }
      else
      {
        xpc_object_t v8 = xpc_null_create();
        xpc_object_t v7 = 0;
      }
      xpc_release(v7);
      xpc_object_t v9 = xpc_int64_create(v5);
      if (!v9) {
        xpc_object_t v9 = xpc_null_create();
      }
      xpc_dictionary_set_value(v8, abm::kKeyPowerDownMessageQMISvc[0], v9);
      xpc_object_t v10 = xpc_null_create();
      xpc_release(v9);
      xpc_release(v10);
      xpc_object_t v11 = xpc_int64_create(v6);
      if (!v11) {
        xpc_object_t v11 = xpc_null_create();
      }
      xpc_dictionary_set_value(v8, abm::kKeyPowerDownMessageId[0], v11);
      xpc_object_t v12 = xpc_null_create();
      xpc_release(v11);
      xpc_release(v12);
      xpc_array_append_value(*(xpc_object_t *)(a1 + 32), v8);
      xpc_release(v8);
      xpc_object_t v13 = *(uint64_t **)(v3 + 8);
      if (v13)
      {
        do
        {
          uint64_t v14 = v13;
          xpc_object_t v13 = (uint64_t *)*v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          uint64_t v14 = *(uint64_t **)(v3 + 16);
          BOOL v15 = *v14 == v3;
          uint64_t v3 = (uint64_t)v14;
        }
        while (!v15);
      }
      uint64_t v3 = (uint64_t)v14;
    }
    while (v14 != &v16[1]);
  }
  std::__tree<std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>>>::destroy((void *)v16[1]);
}

void sub_1C5957480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11)
{
  xpc_release(v11);
  std::__tree<std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,radio::HealthCommandDriver::LinkStats>>>::destroy(a11);
  _Unwind_Resume(a1);
}

void non-virtual thunk to'QMITransportService::reportPowerDownMessages_sync(QMITransportService *this)
{
}

uint64_t QMITransportService::enableBypass(QMITransportService *this)
{
  return 0;
}

uint64_t non-virtual thunk to'QMITransportService::enableBypass(QMITransportService *this)
{
  return 0;
}

void QMITransportService::registerForWakeReason(uint64_t a1, uint64_t a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1174405120;
  v7[2] = ___ZN19QMITransportService21registerForWakeReasonEN8dispatch8callbackIU13block_pointerFv10WakeReasonEEE_block_invoke;
  v7[3] = &__block_descriptor_tmp_31_4;
  v7[4] = a1;
  uint64_t v4 = *(void **)a2;
  if (*(void *)a2) {
    uint64_t v4 = _Block_copy(v4);
  }
  int64_t v5 = (uint64_t *)(a1 + 72);
  int64_t v6 = *(NSObject **)(a2 + 8);
  aBlock = v4;
  dispatch_object_t object = v6;
  if (v6) {
    dispatch_retain(v6);
  }
  ctu::SharedSynchronizable<QMITransportService>::execute_wrapped(v5, (uint64_t)v7);
  if (object) {
    dispatch_release(object);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
}

void ___ZN19QMITransportService21registerForWakeReasonEN8dispatch8callbackIU13block_pointerFv10WakeReasonEEE_block_invoke(void *a1)
{
  uint64_t v3 = a1[4];
  xpc_object_t v2 = (void *)a1[5];
  if (v2) {
    xpc_object_t v2 = _Block_copy(v2);
  }
  uint64_t v4 = *(const void **)(v3 + 384);
  *(void *)(v3 + 384) = v2;
  if (v4) {
    _Block_release(v4);
  }
  int64_t v5 = a1[6];
  if (v5) {
    dispatch_retain(v5);
  }
  int64_t v6 = *(NSObject **)(v3 + 392);
  *(void *)(v3 + 392) = v5;
  if (v6)
  {
    dispatch_release(v6);
  }
}

void __copy_helper_block_e8_40c57_ZTSN8dispatch8callbackIU13block_pointerFv10WakeReasonEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 40);
  if (v4) {
    uint64_t v4 = _Block_copy(v4);
  }
  int64_t v5 = *(NSObject **)(a2 + 48);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = v5;
  if (v5)
  {
    dispatch_retain(v5);
  }
}

void __destroy_helper_block_e8_40c57_ZTSN8dispatch8callbackIU13block_pointerFv10WakeReasonEEE(uint64_t a1)
{
  xpc_object_t v2 = *(NSObject **)(a1 + 48);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 40);
  if (v3) {
    _Block_release(v3);
  }
}

void non-virtual thunk to'QMITransportService::registerForWakeReason(uint64_t a1, uint64_t a2)
{
}

void QMITransportService::getWakeReason_sync(QMITransportService *this, int a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 10);
  if (!v3 || (uint64_t v5 = *((void *)this + 9), (v6 = std::__shared_weak_count::lock(v3)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  xpc_object_t v7 = v6;
  atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v30 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v8 = (CommandDriverFactory *)pthread_mutex_lock(&ctu::Singleton<CommandDriverFactory,CommandDriverFactory,ctu::PthreadMutexGuardPolicy<CommandDriverFactory>>::sInstance);
  uint64_t v9 = off_1EBBDD2A0;
  if (!off_1EBBDD2A0)
  {
    CommandDriverFactory::create_default_global((uint64_t *)buf, v8);
    long long v10 = *(_OWORD *)buf;
    memset(buf, 0, sizeof(buf));
    xpc_object_t v11 = (std::__shared_weak_count *)*(&off_1EBBDD2A0 + 1);
    off_1EBBDD2A0 = v10;
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    xpc_object_t v12 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8]
      && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    uint64_t v9 = off_1EBBDD2A0;
  }
  xpc_object_t v13 = (std::__shared_weak_count *)*(&off_1EBBDD2A0 + 1);
  uint64_t v25 = v9;
  uint64_t v26 = *(&off_1EBBDD2A0 + 1);
  if (*(&off_1EBBDD2A0 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EBBDD2A0 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<CommandDriverFactory,CommandDriverFactory,ctu::PthreadMutexGuardPolicy<CommandDriverFactory>>::sInstance);
  (*(void (**)(unint64_t *__return_ptr, uint64_t))(*(void *)v9 + 16))(&v27, v9);
  unint64_t v29 = 0;
  uint64_t v30 = 0;
  if (v28)
  {
    uint64_t v30 = std::__shared_weak_count::lock(v28);
    if (v30) {
      unint64_t v29 = v27;
    }
    if (v28) {
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
    unint64_t v14 = v29;
    BOOL v15 = *((void *)this + 5);
    xpc_object_t v16 = v15;
    if (v29)
    {
LABEL_23:
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        --a2;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = a2;
        _os_log_impl(&dword_1C5767000, v15, OS_LOG_TYPE_DEFAULT, "#I Sending request to get wake reason. Remaining-attempts=%u", buf, 8u);
      }
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 1174405120;
      v20[2] = ___ZN19QMITransportService18getWakeReason_syncEj_block_invoke;
      v20[3] = &__block_descriptor_tmp_36_5;
      v20[4] = this;
      v20[5] = v5;
      uint64_t v21 = v7;
      atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      int v22 = a2;
      uint64_t v17 = _Block_copy(v20);
      int64_t v18 = *((void *)this + 11);
      if (v18) {
        dispatch_retain(v18);
      }
      aBlock = v17;
      dispatch_object_t object = v18;
      (*(void (**)(unint64_t, void **))(*(void *)v14 + 136))(v14, &aBlock);
      if (object) {
        dispatch_release(object);
      }
      if (aBlock) {
        _Block_release(aBlock);
      }
      if (v21)
      {
        std::__shared_weak_count::__release_weak(v21);
        size_t v19 = v30;
        if (!v30) {
          goto LABEL_39;
        }
        goto LABEL_37;
      }
LABEL_36:
      size_t v19 = v30;
      if (!v30) {
        goto LABEL_39;
      }
      goto LABEL_37;
    }
  }
  else
  {
    unint64_t v14 = v29;
    BOOL v15 = *((void *)this + 5);
    xpc_object_t v16 = v15;
    if (v29) {
      goto LABEL_23;
    }
  }
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    goto LABEL_36;
  }
  *(_WORD *)buf = 0;
  _os_log_error_impl(&dword_1C5767000, v15, OS_LOG_TYPE_ERROR, "Failed to get radio command driver!", buf, 2u);
  size_t v19 = v30;
  if (!v30) {
    goto LABEL_39;
  }
LABEL_37:
  if (!atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
LABEL_39:
  std::__shared_weak_count::__release_weak(v7);
}

void sub_1C5957AF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, char a17, uint64_t a18, char a19)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN19QMITransportService18getWakeReason_syncEj_block_invoke(uint64_t a1, void *a2, ctu **a3)
{
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 48);
  if (v4)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    xpc_object_t v8 = std::__shared_weak_count::lock(v4);
    uint64_t v47 = v8;
    if (v8)
    {
      if (!*(void *)(a1 + 40))
      {
        xpc_object_t v12 = v8;
LABEL_82:
        if (!atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
        return;
      }
      xpc_object_t xdict = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
      xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
      xpc_object_t v10 = v9;
      uint64_t v11 = MEMORY[0x1E4F14590];
      if (v9)
      {
        xpc_object_t xdict = v9;
      }
      else
      {
        xpc_object_t v10 = xpc_null_create();
        xpc_object_t xdict = v10;
        if (!v10)
        {
          xpc_object_t v13 = xpc_null_create();
          xpc_object_t v10 = 0;
          goto LABEL_12;
        }
      }
      if (MEMORY[0x1C8792D30](v10) == v11)
      {
        xpc_retain(v10);
        goto LABEL_13;
      }
      xpc_object_t v13 = xpc_null_create();
LABEL_12:
      xpc_object_t xdict = v13;
LABEL_13:
      xpc_release(v10);
      xpc_object_t v14 = xpc_string_create((const char *)*MEMORY[0x1E4F4C610]);
      if (!v14) {
        xpc_object_t v14 = xpc_null_create();
      }
      xpc_dictionary_set_value(xdict, (const char *)*MEMORY[0x1E4F4C408], v14);
      xpc_object_t v15 = xpc_null_create();
      xpc_release(v14);
      xpc_release(v15);
      xpc_object_t v16 = (const char *)(v7 + 408);
      if (*(char *)(v7 + 431) < 0) {
        xpc_object_t v16 = *(const char **)v16;
      }
      xpc_object_t v17 = xpc_string_create(v16);
      if (!v17) {
        xpc_object_t v17 = xpc_null_create();
      }
      xpc_dictionary_set_value(xdict, (const char *)*MEMORY[0x1E4F4C5B0], v17);
      xpc_object_t v18 = xpc_null_create();
      xpc_release(v17);
      xpc_release(v18);
      xpc_object_t v19 = xpc_BOOL_create(*(unsigned char *)(v7 + 432));
      if (!v19) {
        xpc_object_t v19 = xpc_null_create();
      }
      xpc_dictionary_set_value(xdict, (const char *)*MEMORY[0x1E4F4CF80], v19);
      xpc_object_t v20 = xpc_null_create();
      xpc_release(v19);
      xpc_release(v20);
      if (*a2) {
        int v22 = ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::get;
      }
      else {
        int v22 = 0;
      }
      if (v22
        || (*a3
          ? (uint64_t v30 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get)
          : (uint64_t v30 = 0),
            !v30))
      {
        int v23 = *(_DWORD *)(a1 + 56);
        if (v23)
        {
          uint64_t v24 = dispatch_source_create(MEMORY[0x1E4F14490], 1uLL, 0, *(dispatch_queue_t *)(v7 + 88));
          uint64_t v25 = *(NSObject **)(v7 + 400);
          *(void *)(v7 + 400) = v24;
          if (v25)
          {
            dispatch_release(v25);
            uint64_t v24 = *(NSObject **)(v7 + 400);
          }
          if (v24)
          {
            dispatch_time_t v26 = dispatch_time(0, 1000000000);
            dispatch_source_set_timer(v24, v26, 0xFFFFFFFFFFFFFFFFLL, 0xBEBC200uLL);
            unint64_t v27 = *(NSObject **)(v7 + 400);
            handler[0] = MEMORY[0x1E4F143A8];
            handler[1] = 1174405120;
            handler[2] = ___ZN19QMITransportService18getWakeReason_syncEj_block_invoke_2;
            handler[3] = &__block_descriptor_tmp_32_4;
            uint64_t v29 = *(void *)(a1 + 40);
            uint64_t v28 = *(std::__shared_weak_count **)(a1 + 48);
            handler[4] = v7;
            handler[5] = v29;
            uint64_t v42 = v28;
            if (v28) {
              atomic_fetch_add_explicit(&v28->__shared_weak_owners_, 1uLL, memory_order_relaxed);
            }
            int v43 = *(_DWORD *)(a1 + 56);
            dispatch_source_set_event_handler(v27, handler);
            dispatch_activate(*(dispatch_object_t *)(v7 + 400));
            if (v42) {
              std::__shared_weak_count::__release_weak(v42);
            }
          }
          goto LABEL_81;
        }
      }
      else
      {
        ctu::cf_to_xpc((uint64_t *)&object, *a3, v21);
        xpc_object_t v31 = object;
        if (object && MEMORY[0x1C8792D30](object) == v11) {
          xpc_retain(v31);
        }
        else {
          xpc_object_t v31 = xpc_null_create();
        }
        xpc_release(object);
        xpc_object_t v44 = v31;
        if (v31) {
          xpc_retain(v31);
        }
        else {
          xpc_object_t v44 = xpc_null_create();
        }
        abm::ParseWakeDataEureka(&v44, &xdict);
        xpc_release(v44);
        xpc_object_t v44 = 0;
        xpc_release(v31);
        int v23 = 1;
      }
      if (*(void *)(v7 + 384) && *(void *)(v7 + 392))
      {
        if (*(char *)(v7 + 431) < 0)
        {
          if (((*(void *)(v7 + 416) == 0) & ~v23) == 0) {
            goto LABEL_49;
          }
        }
        else if (((*(unsigned char *)(v7 + 431) == 0) & ~v23) == 0)
        {
LABEL_49:
          xpc_object_t v32 = xdict;
          if (xdict) {
            xpc_retain(xdict);
          }
          else {
            xpc_object_t v32 = xpc_null_create();
          }
          uint64_t v35 = *(const void **)(v7 + 384);
          if (v35) {
            BOOL v36 = _Block_copy(v35);
          }
          else {
            BOOL v36 = 0;
          }
          std::string::size_type v39 = *(NSObject **)(v7 + 392);
          xpc_object_t object = (xpc_object_t)MEMORY[0x1E4F143A8];
          uint64_t v49 = 1174405120;
          uint64_t v50 = ___ZNK8dispatch8callbackIU13block_pointerFv10WakeReasonEEclIJS1_EEEvDpT__block_invoke;
          size_t v51 = &__block_descriptor_tmp_168_0;
          if (v36) {
            std::string::size_type v40 = _Block_copy(v36);
          }
          else {
            std::string::size_type v40 = 0;
          }
          aBlock = v40;
          int v53 = 3;
          xpc_object_t v54 = v32;
          if (v32) {
            xpc_retain(v32);
          }
          else {
            xpc_object_t v54 = xpc_null_create();
          }
          dispatch_async(v39, &object);
          xpc_release(v54);
          xpc_object_t v54 = 0;
          if (aBlock) {
            _Block_release(aBlock);
          }
          if (v36) {
            _Block_release(v36);
          }
LABEL_80:
          xpc_release(v32);
          goto LABEL_81;
        }
        xpc_object_t v32 = xpc_null_create();
        uint64_t v33 = *(const void **)(v7 + 384);
        if (v33) {
          unint64_t v34 = _Block_copy(v33);
        }
        else {
          unint64_t v34 = 0;
        }
        int64_t v37 = *(NSObject **)(v7 + 392);
        xpc_object_t object = (xpc_object_t)MEMORY[0x1E4F143A8];
        uint64_t v49 = 1174405120;
        uint64_t v50 = ___ZNK8dispatch8callbackIU13block_pointerFv10WakeReasonEEclIJS1_EEEvDpT__block_invoke;
        size_t v51 = &__block_descriptor_tmp_168_0;
        if (v34) {
          unint64_t v38 = _Block_copy(v34);
        }
        else {
          unint64_t v38 = 0;
        }
        aBlock = v38;
        int v53 = 4;
        xpc_object_t v54 = v32;
        if (v32) {
          xpc_retain(v32);
        }
        else {
          xpc_object_t v54 = xpc_null_create();
        }
        dispatch_async(v37, &object);
        xpc_release(v54);
        xpc_object_t v54 = 0;
        if (aBlock) {
          _Block_release(aBlock);
        }
        if (v34) {
          _Block_release(v34);
        }
        goto LABEL_80;
      }
LABEL_81:
      xpc_release(xdict);
      xpc_object_t v12 = v47;
      if (!v47) {
        return;
      }
      goto LABEL_82;
    }
  }
}

void sub_1C595819C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, xpc_object_t object, xpc_object_t a19, char a20)
{
  xpc_release(object);
  xpc_release(v20);
  xpc_release(a19);
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100]((uint64_t)&a20);
  _Unwind_Resume(a1);
}

void ___ZN19QMITransportService18getWakeReason_syncEj_block_invoke_2(uint64_t a1)
{
  xpc_object_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
  {
    uint64_t v3 = *(dispatch_source_t **)(a1 + 32);
    uint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      uint64_t v5 = v4;
      if (*(void *)(a1 + 40))
      {
        dispatch_source_cancel(v3[50]);
        int64_t v6 = v3[50];
        v3[50] = 0;
        if (v6) {
          dispatch_release(v6);
        }
        QMITransportService::getWakeReason_sync((QMITransportService *)v3, *(_DWORD *)(a1 + 56));
      }
      if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
}

void sub_1C5958324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t __copy_helper_block_e8_40c44_ZTSNSt3__18weak_ptrI19QMITransportServiceEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c44_ZTSNSt3__18weak_ptrI19QMITransportServiceEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

uint64_t QMITransportService::shouldTeardownOnWillReset(QMITransportService *this)
{
  return 0;
}

uint64_t non-virtual thunk to'QMITransportService::shouldTeardownOnWillReset(QMITransportService *this)
{
  return 0;
}

uint64_t ctu::Loggable<QMITransportService,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x1F417DA50](a1 + 8);
}

void ctu::Loggable<QMITransportService,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(char *a1@<X8>)
{
  a1[23] = 11;
  strcpy(a1, "ipc.svc.qmi");
}

uint64_t ctu::Loggable<QMITransportService,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x1F417DD10](a1 + 8);
}

void ATCSAssertsToABMAssert(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  GetABMLogServer(&v9);
  uint64_t v2 = *((void *)GetGlobalLogger(&v9) + 4);
  uint64_t v3 = v10;
  if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
    *(_DWORD *)buf = 136315138;
    xpc_object_t v12 = (const char *)v4;
    _os_log_fault_impl(&dword_1C5767000, v2, OS_LOG_TYPE_FAULT, "%s", buf, 0xCu);
  }
  GetABMLogServer(&v7);
  uint64_t v5 = *((void *)GetGlobalLogger(&v7) + 4);
  int64_t v6 = v8;
  if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315906;
    xpc_object_t v12 = "ABM ASSERT";
    __int16 v13 = 2080;
    xpc_object_t v14 = "false";
    __int16 v15 = 2080;
    xpc_object_t v16 = "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices_Manager/AppleBasebandManager/BasebandManager/Serve"
          "r/Transport/QMI/Service/QMITransportService.cpp";
    __int16 v17 = 1024;
    int v18 = 63;
    _os_log_fault_impl(&dword_1C5767000, v5, OS_LOG_TYPE_FAULT, "%s (%s): File: %s Line: %d", buf, 0x26u);
  }
  __break(1u);
}

void sub_1C5958588(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, uint64_t a12)
{
  if (a10)
  {
    if (!atomic_fetch_add(&a10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))a10->__on_zero_shared)(a10);
      std::__shared_weak_count::__release_weak(a10);
      _Unwind_Resume(exception_object);
    }
  }
  _Unwind_Resume(exception_object);
}

void QMIParserErrorToABMAssert(int a1, int a2, const unsigned __int8 *a3, int a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  GetABMLogServer(&v13);
  uint64_t v7 = *((void *)GetGlobalLogger(&v13) + 4);
  xpc_object_t v8 = v14;
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)xpc_object_t v16 = a1;
    *(_WORD *)&v16[4] = 1024;
    *(_DWORD *)&v16[6] = a2;
    LOWORD(v17) = 1024;
    *(_DWORD *)((char *)&v17 + 2) = a4;
    _os_log_fault_impl(&dword_1C5767000, v7, OS_LOG_TYPE_FAULT, "QMI parsing error in message with msgId=0x%04x during tlvId=0x%02x (tlv_len=%u)", buf, 0x14u);
  }
  GetABMLogServer(&v11);
  uint64_t v9 = *((void *)GetGlobalLogger(&v11) + 4);
  xpc_object_t v10 = v12;
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)xpc_object_t v16 = "ABM ASSERT";
    *(_WORD *)&v16[8] = 2080;
    __int16 v17 = "false";
    __int16 v18 = 2080;
    uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices_Manager/AppleBasebandManager/BasebandManager/Serve"
          "r/Transport/QMI/Service/QMITransportService.cpp";
    __int16 v20 = 1024;
    int v21 = 68;
    _os_log_fault_impl(&dword_1C5767000, v9, OS_LOG_TYPE_FAULT, "%s (%s): File: %s Line: %d", buf, 0x26u);
  }
  __break(1u);
}

void sub_1C59587C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, uint64_t a12)
{
  if (a10)
  {
    if (!atomic_fetch_add(&a10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))a10->__on_zero_shared)(a10);
      std::__shared_weak_count::__release_weak(a10);
      _Unwind_Resume(exception_object);
    }
  }
  _Unwind_Resume(exception_object);
}

void QMIWriteErrorToABMAssert(int a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  GetABMLogServer(&v13);
  int64_t v6 = *((void *)GetGlobalLogger(&v13) + 4);
  uint64_t v7 = v14;
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v8 = a2[2] - *a2;
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)xpc_object_t v16 = a1;
    *(_WORD *)&v16[4] = 2048;
    *(void *)&v16[6] = a3;
    *(_WORD *)&v16[14] = 1024;
    *(_DWORD *)&v16[16] = v8;
    _os_log_fault_impl(&dword_1C5767000, v6, OS_LOG_TYPE_FAULT, "QMI serialization error in message with msgId=0x%04x (%td bytes written to buf of size %u bytes)", buf, 0x18u);
  }
  GetABMLogServer(&v11);
  uint64_t v9 = *((void *)GetGlobalLogger(&v11) + 4);
  xpc_object_t v10 = v12;
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)xpc_object_t v16 = "ABM ASSERT";
    *(_WORD *)&v16[8] = 2080;
    *(void *)&unsigned char v16[10] = "false";
    *(_WORD *)&v16[18] = 2080;
    __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices_Manager/AppleBasebandManager/BasebandManager/Serve"
          "r/Transport/QMI/Service/QMITransportService.cpp";
    __int16 v18 = 1024;
    int v19 = 74;
    _os_log_fault_impl(&dword_1C5767000, v9, OS_LOG_TYPE_FAULT, "%s (%s): File: %s Line: %d", buf, 0x26u);
  }
  __break(1u);
}

void sub_1C5958A08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, uint64_t a12)
{
  if (a10)
  {
    if (!atomic_fetch_add(&a10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))a10->__on_zero_shared)(a10);
      std::__shared_weak_count::__release_weak(a10);
      _Unwind_Resume(exception_object);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::deque<dispatch::group_session>::~deque[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 8);
  uint64_t v3 = *(void ***)(a1 + 16);
  if (v3 == v2)
  {
    uint64_t v3 = *(void ***)(a1 + 8);
    *(void *)(a1 + 40) = 0;
    unint64_t v9 = 0;
  }
  else
  {
    unint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = &v2[v4 >> 9];
    int64_t v6 = (dispatch_group_t *)((char *)*v5 + 8 * (v4 & 0x1FF));
    uint64_t v7 = *(uint64_t *)((char *)v2 + (((*(void *)(a1 + 40) + v4) >> 6) & 0x3FFFFFFFFFFFFF8))
       + 8 * ((*(void *)(a1 + 40) + v4) & 0x1FF);
    if (v6 != (dispatch_group_t *)v7)
    {
      do
      {
        if (*v6)
        {
          dispatch_group_leave(*v6);
          if (*v6) {
            dispatch_release(*v6);
          }
        }
        if ((char *)++v6 - (unsigned char *)*v5 == 4096)
        {
          int v8 = (dispatch_group_t *)v5[1];
          ++v5;
          int64_t v6 = v8;
        }
      }
      while (v6 != (dispatch_group_t *)v7);
      uint64_t v2 = *(void ***)(a1 + 8);
      uint64_t v3 = *(void ***)(a1 + 16);
    }
    *(void *)(a1 + 40) = 0;
    unint64_t v9 = (char *)v3 - (char *)v2;
    if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
    {
      do
      {
        operator delete(*v2);
        uint64_t v3 = *(void ***)(a1 + 16);
        uint64_t v2 = (void **)(*(void *)(a1 + 8) + 8);
        *(void *)(a1 + 8) = v2;
        unint64_t v9 = (char *)v3 - (char *)v2;
      }
      while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
    }
  }
  unint64_t v10 = v9 >> 3;
  if (v10 == 1)
  {
    uint64_t v11 = 256;
    goto LABEL_18;
  }
  if (v10 == 2)
  {
    uint64_t v11 = 512;
LABEL_18:
    *(void *)(a1 + 32) = v11;
  }
  if (v2 != v3)
  {
    do
    {
      xpc_object_t v12 = *v2++;
      operator delete(v12);
    }
    while (v2 != v3);
    uint64_t v14 = *(void *)(a1 + 8);
    uint64_t v13 = *(void *)(a1 + 16);
    if (v13 != v14) {
      *(void *)(a1 + 16) = v13 + ((v14 - v13 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *ctu::Loggable<QMITransportService,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F20FF450;
  MEMORY[0x1C8790F40](a1 + 1);
  return a1;
}

void ctu::Loggable<QMITransportService,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F20FF450;
  MEMORY[0x1C8790F40](a1 + 1);

  operator delete(a1);
}

void ctu::cf::insert<std::string,std::string>()
{
}

void sub_1C5958D38(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, const void *);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va1);
  _Unwind_Resume(a1);
}

void sub_1C5958D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<QMITransportService>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20FF490;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<QMITransportService>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20FF490;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<QMITransportService>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void ctu::SharedLoggable<QMITransportService,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_1F20FF450;
  MEMORY[0x1C8790F40](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  unint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

void std::__tree<QMux>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<QMux>::destroy(*a1);
    std::__tree<QMux>::destroy(a1[1]);
    QMux::~QMux((QMux *)(a1 + 4));
    operator delete(a1);
  }
}

void *___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

void std::__shared_ptr_emplace<ABMResetInvoker>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20FF520;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ABMResetInvoker>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20FF520;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<ABMResetInvoker>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void ABMResetInvoker::~ABMResetInvoker(ABMResetInvoker *this)
{
  *(void *)this = &unk_1F20FF570;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

{
  std::__shared_weak_count *v2;
  uint64_t vars8;

  *(void *)this = &unk_1F20FF570;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }

  operator delete(this);
}

void ABMResetInvoker::reset(std::__shared_weak_count **this, const char *a2, int a3)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  capabilities::coredump::recoveryForControlMessageTimeout((capabilities::coredump *)this);
  int64_t v6 = (capabilities::coredump *)capabilities::coredump::operator&();
  if (!v6) {
    goto LABEL_85;
  }
  xpc_object_t v90 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v8 = v7;
  uint64_t v9 = MEMORY[0x1E4F14590];
  if (v7)
  {
    xpc_object_t v90 = v7;
  }
  else
  {
    xpc_object_t v8 = xpc_null_create();
    xpc_object_t v90 = v8;
    if (!v8)
    {
      xpc_object_t v10 = xpc_null_create();
      xpc_object_t v8 = 0;
      goto LABEL_9;
    }
  }
  if (MEMORY[0x1C8792D30](v8) == v9)
  {
    xpc_retain(v8);
    goto LABEL_10;
  }
  xpc_object_t v10 = xpc_null_create();
LABEL_9:
  xpc_object_t v90 = v10;
LABEL_10:
  xpc_release(v8);
  uint64_t v11 = MEMORY[0x1C8792D30](v90);
  if (v11 != v9) {
    goto LABEL_84;
  }
  memset(buf, 170, sizeof(buf));
  Timestamp::Timestamp((Timestamp *)buf);
  xpc_object_t v12 = xpc_string_create(a2);
  if (!v12) {
    xpc_object_t v12 = xpc_null_create();
  }
  xpc_dictionary_set_value(v90, (const char *)*MEMORY[0x1E4F47160], v12);
  xpc_object_t v13 = xpc_null_create();
  xpc_release(v12);
  xpc_release(v13);
  uint64_t v14 = *MEMORY[0x1E4F470A8];
  *(void *)&long long v87 = &v90;
  *((void *)&v87 + 1) = v14;
  xpc::dict::object_proxy::operator=((uint64_t)&v87, &v89);
  xpc_release(v89);
  xpc_object_t v89 = 0;
  __int16 v15 = (const void *)*MEMORY[0x1E4F4F928];
  size_t v16 = strlen((const char *)*MEMORY[0x1E4F4F928]);
  if (v16 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  std::string::size_type v17 = v16;
  if (v16 >= 0x17)
  {
    uint64_t v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v19 = v16 | 7;
    }
    uint64_t v20 = v19 + 1;
    p_dst = (std::string *)operator new(v19 + 1);
    __dst.__r_.__value_.__l.__size_ = v17;
    __dst.__r_.__value_.__r.__words[2] = v20 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_20;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v16;
  p_dst = &__dst;
  if (v16) {
LABEL_20:
  }
    memmove(p_dst, v15, v17);
  p_dst->__r_.__value_.__s.__data_[v17] = 0;
  int v21 = (const void *)*MEMORY[0x1E4F4F918];
  size_t v22 = strlen((const char *)*MEMORY[0x1E4F4F918]);
  if (v22 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v23 = v22;
  if (v22 >= 0x17)
  {
    uint64_t v25 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v22 | 7) != 0x17) {
      uint64_t v25 = v22 | 7;
    }
    uint64_t v26 = v25 + 1;
    uint64_t v24 = operator new(v25 + 1);
    size_t v82 = v23;
    int64_t v83 = v26 | 0x8000000000000000;
    uint64_t v81 = v24;
    goto LABEL_28;
  }
  HIBYTE(v83) = v22;
  uint64_t v24 = &v81;
  if (v22) {
LABEL_28:
  }
    memmove(v24, v21, v23);
  *((unsigned char *)v24 + v23) = 0;
  if (v83 >= 0) {
    unint64_t v27 = (const std::string::value_type *)&v81;
  }
  else {
    unint64_t v27 = (const std::string::value_type *)v81;
  }
  if (v83 >= 0) {
    std::string::size_type v28 = HIBYTE(v83);
  }
  else {
    std::string::size_type v28 = v82;
  }
  uint64_t v29 = std::string::append(&__dst, v27, v28);
  long long v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
  v85.__r_.__value_.__r.__words[2] = v29->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v85.__r_.__value_.__l.__data_ = v30;
  v29->__r_.__value_.__l.__size_ = 0;
  v29->__r_.__value_.__r.__words[2] = 0;
  v29->__r_.__value_.__r.__words[0] = 0;
  Timestamp::asString((uint64_t)buf, 0, 9, v79);
  if ((v80 & 0x80u) == 0) {
    xpc_object_t v31 = v79;
  }
  else {
    xpc_object_t v31 = (void **)v79[0];
  }
  if ((v80 & 0x80u) == 0) {
    std::string::size_type v32 = v80;
  }
  else {
    std::string::size_type v32 = (std::string::size_type)v79[1];
  }
  uint64_t v33 = std::string::append(&v85, (const std::string::value_type *)v31, v32);
  long long v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
  v86.__r_.__value_.__r.__words[2] = v33->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v86.__r_.__value_.__l.__data_ = v34;
  v33->__r_.__value_.__l.__size_ = 0;
  v33->__r_.__value_.__r.__words[2] = 0;
  v33->__r_.__value_.__r.__words[0] = 0;
  uint64_t v35 = (const void *)*MEMORY[0x1E4F4F908];
  size_t v36 = strlen((const char *)*MEMORY[0x1E4F4F908]);
  if (v36 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v37 = v36;
  if (v36 >= 0x17)
  {
    uint64_t v39 = (v36 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v36 | 7) != 0x17) {
      uint64_t v39 = v36 | 7;
    }
    uint64_t v40 = v39 + 1;
    p_p = operator new(v39 + 1);
    size_t v77 = v37;
    int64_t v78 = v40 | 0x8000000000000000;
    std::string __p = p_p;
    goto LABEL_48;
  }
  HIBYTE(v78) = v36;
  p_p = &__p;
  if (v36) {
LABEL_48:
  }
    memmove(p_p, v35, v37);
  *((unsigned char *)p_p + v37) = 0;
  if (v78 >= 0) {
    unint64_t v41 = (const std::string::value_type *)&__p;
  }
  else {
    unint64_t v41 = (const std::string::value_type *)__p;
  }
  if (v78 >= 0) {
    std::string::size_type v42 = HIBYTE(v78);
  }
  else {
    std::string::size_type v42 = v77;
  }
  int v43 = std::string::append(&v86, v41, v42);
  long long v44 = *(_OWORD *)&v43->__r_.__value_.__l.__data_;
  int64_t v88 = v43->__r_.__value_.__r.__words[2];
  long long v87 = v44;
  v43->__r_.__value_.__l.__size_ = 0;
  v43->__r_.__value_.__r.__words[2] = 0;
  v43->__r_.__value_.__r.__words[0] = 0;
  if (v88 >= 0) {
    uint64_t v45 = (const char *)&v87;
  }
  else {
    uint64_t v45 = (const char *)v87;
  }
  xpc_object_t v46 = xpc_string_create(v45);
  if (!v46) {
    xpc_object_t v46 = xpc_null_create();
  }
  xpc_dictionary_set_value(v90, (const char *)*MEMORY[0x1E4F47098], v46);
  xpc_object_t v47 = xpc_null_create();
  xpc_release(v46);
  xpc_release(v47);
  if (SHIBYTE(v88) < 0)
  {
    operator delete((void *)v87);
    if ((SHIBYTE(v78) & 0x80000000) == 0)
    {
LABEL_62:
      if ((SHIBYTE(v86.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_63;
      }
      goto LABEL_73;
    }
  }
  else if ((SHIBYTE(v78) & 0x80000000) == 0)
  {
    goto LABEL_62;
  }
  operator delete(__p);
  if ((SHIBYTE(v86.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_63:
    if (((char)v80 & 0x80000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_74;
  }
LABEL_73:
  operator delete(v86.__r_.__value_.__l.__data_);
  if (((char)v80 & 0x80000000) == 0)
  {
LABEL_64:
    if ((SHIBYTE(v85.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_75;
  }
LABEL_74:
  operator delete(v79[0]);
  if ((SHIBYTE(v85.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_65:
    if ((SHIBYTE(v83) & 0x80000000) == 0) {
      goto LABEL_66;
    }
LABEL_76:
    operator delete(v81);
    if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_67;
    }
LABEL_77:
    operator delete(__dst.__r_.__value_.__l.__data_);
    goto LABEL_67;
  }
LABEL_75:
  operator delete(v85.__r_.__value_.__l.__data_);
  if (SHIBYTE(v83) < 0) {
    goto LABEL_76;
  }
LABEL_66:
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_77;
  }
LABEL_67:
  *(void *)&long long v87 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v87 + 1) = 0xAAAAAAAAAAAAAAAALL;
  GetABMLogServer(&v74);
  abm::HelperClient::create();
  char v48 = v75;
  if (v75 && !atomic_fetch_add(&v75->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
    std::__shared_weak_count::__release_weak(v48);
    xpc_object_t v49 = v90;
    xpc_object_t v73 = v90;
    if (v90) {
      goto LABEL_70;
    }
  }
  else
  {
    xpc_object_t v49 = v90;
    xpc_object_t v73 = v90;
    if (v90)
    {
LABEL_70:
      xpc_retain(v49);
      goto LABEL_80;
    }
  }
  xpc_object_t v73 = xpc_null_create();
LABEL_80:
  v72[1] = 0;
  v72[2] = 0;
  abm::HelperClient::perform();
  xpc_release(v73);
  xpc_object_t v73 = 0;
  uint64_t v50 = (std::__shared_weak_count *)*((void *)&v87 + 1);
  if (*((void *)&v87 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v87 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
    std::__shared_weak_count::__release_weak(v50);
  }
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy((uint64_t)buf, *(void **)&buf[8]);
LABEL_84:
  xpc_release(v90);
  if (v11 != v9) {
    return;
  }
LABEL_85:
  capabilities::coredump::recoveryForControlMessageTimeout(v6);
  if (!capabilities::coredump::operator&())
  {
    v55 = GetOsLogContext()[1];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = a2;
      _os_log_error_impl(&dword_1C5767000, v55, OS_LOG_TYPE_ERROR, "WARNING! A MESSAGE TIMED OUT BUT WE'RE SKIPPING MODEM RESET: %s", buf, 0xCu);
    }
    return;
  }
  size_t v51 = this[2];
  if (!v51) {
    return;
  }
  unint64_t v52 = std::__shared_weak_count::lock(v51);
  *((void *)&v87 + 1) = v52;
  if (!v52) {
    return;
  }
  *(void *)&long long v87 = this[1];
  if (!(void)v87)
  {
    v56 = v52;
LABEL_120:
    if (!atomic_fetch_add(&v56->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
      std::__shared_weak_count::__release_weak(v56);
    }
    return;
  }
  xpc_object_t v53 = xpc_dictionary_create(0, 0, 0);
  if (v53 || (xpc_object_t v53 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C8792D30](v53) == MEMORY[0x1E4F14590])
    {
      xpc_retain(v53);
      xpc_object_t v54 = v53;
    }
    else
    {
      xpc_object_t v54 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v54 = xpc_null_create();
    xpc_object_t v53 = 0;
  }
  xpc_release(v53);
  uint64_t v57 = (const char **)MEMORY[0x1E4F4C6E8];
  if (!a3) {
    uint64_t v57 = (const char **)MEMORY[0x1E4F4C6F0];
  }
  xpc_object_t v58 = xpc_string_create(*v57);
  if (!v58) {
    xpc_object_t v58 = xpc_null_create();
  }
  xpc_dictionary_set_value(v54, (const char *)*MEMORY[0x1E4F4C690], v58);
  xpc_object_t v59 = xpc_null_create();
  xpc_release(v58);
  xpc_release(v59);
  xpc_object_t v60 = xpc_string_create((const char *)*MEMORY[0x1E4F4D1A0]);
  if (!v60) {
    xpc_object_t v60 = xpc_null_create();
  }
  xpc_dictionary_set_value(v54, (const char *)*MEMORY[0x1E4F4CA38], v60);
  xpc_object_t v61 = xpc_null_create();
  xpc_release(v60);
  xpc_release(v61);
  xpc_object_t v62 = xpc_string_create(a2);
  if (!v62) {
    xpc_object_t v62 = xpc_null_create();
  }
  xpc_dictionary_set_value(v54, (const char *)*MEMORY[0x1E4F4C8F0], v62);
  xpc_object_t v63 = xpc_null_create();
  xpc_release(v62);
  xpc_release(v63);
  uint64_t v64 = v87;
  unint64_t v65 = (const void *)*MEMORY[0x1E4F4C638];
  size_t v66 = strlen((const char *)*MEMORY[0x1E4F4C638]);
  if (v66 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v67 = v66;
  if (v66 >= 0x17)
  {
    uint64_t v69 = (v66 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v66 | 7) != 0x17) {
      uint64_t v69 = v66 | 7;
    }
    uint64_t v70 = v69 + 1;
    v68 = operator new(v69 + 1);
    *(void *)&uint8_t buf[8] = v67;
    *(void *)&uint8_t buf[16] = v70 | 0x8000000000000000;
    *(void *)buf = v68;
    goto LABEL_113;
  }
  buf[23] = v66;
  v68 = buf;
  if (v66) {
LABEL_113:
  }
    memmove(v68, v65, v67);
  *((unsigned char *)v68 + v67) = 0;
  v72[0] = v54;
  if (v54) {
    xpc_retain(v54);
  }
  else {
    v72[0] = xpc_null_create();
  }
  int v71 = 0;
  Service::runCommand(v64, (uint64_t)buf, v72, &v71);
  xpc_release(v72[0]);
  v72[0] = 0;
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  xpc_release(v54);
  v56 = (std::__shared_weak_count *)*((void *)&v87 + 1);
  if (*((void *)&v87 + 1)) {
    goto LABEL_120;
  }
}

void sub_1C59599F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, char a12, uint64_t a13, xpc_object_t a14, char a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46,uint64_t a47,void *a48,uint64_t a49,int a50,__int16 a51,char a52,char a53)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void ABMResetInvoker::dumpSystemLogOnly(ABMResetInvoker *this, const char *a2)
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (v3 || (xpc_object_t v3 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C8792D30](v3) == MEMORY[0x1E4F14590])
    {
      xpc_retain(v3);
      xpc_object_t v4 = v3;
    }
    else
    {
      xpc_object_t v4 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v3 = 0;
  }
  xpc_release(v3);
  v31[0] = 0;
  v31[1] = 0;
  uint64_t v32 = 0;
  uint64_t v5 = (const void *)*MEMORY[0x1E4F4C2E0];
  size_t v6 = strlen((const char *)*MEMORY[0x1E4F4C2E0]);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    p_dst = (void **)operator new(v9 + 1);
    unint64_t v29 = v7;
    int64_t v30 = v10 | 0x8000000000000000;
    std::string __dst = p_dst;
    goto LABEL_14;
  }
  HIBYTE(v30) = v6;
  p_dst = (void **)&__dst;
  if (v6) {
LABEL_14:
  }
    memmove(p_dst, v5, v7);
  *((unsigned char *)p_dst + v7) = 0;
  prop::systemlogs::get((char *)&__dst, (uint64_t)v31);
  if (SHIBYTE(v30) < 0) {
    operator delete(__dst);
  }
  if (v32 >= 0) {
    uint64_t v11 = (const char *)v31;
  }
  else {
    uint64_t v11 = (const char *)v31[0];
  }
  xpc_object_t v12 = xpc_string_create(v11);
  if (!v12) {
    xpc_object_t v12 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x1E4F47090], v12);
  xpc_object_t v13 = xpc_null_create();
  xpc_release(v12);
  xpc_release(v13);
  Timestamp::Timestamp((Timestamp *)v26);
  Timestamp::asString((uint64_t)v26, 0, 9, &__dst);
  if (v30 >= 0) {
    uint64_t v14 = (const char *)&__dst;
  }
  else {
    uint64_t v14 = (const char *)__dst;
  }
  xpc_object_t v15 = xpc_string_create(v14);
  if (!v15) {
    xpc_object_t v15 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x1E4F47178], v15);
  xpc_object_t v16 = xpc_null_create();
  xpc_release(v15);
  xpc_release(v16);
  if (SHIBYTE(v30) < 0) {
    operator delete(__dst);
  }
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy((uint64_t)v26, v27);
  xpc_object_t v17 = xpc_string_create(a2);
  if (!v17) {
    xpc_object_t v17 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x1E4F47160], v17);
  xpc_object_t v18 = xpc_null_create();
  xpc_release(v17);
  xpc_release(v18);
  xpc_object_t v19 = xpc_BOOL_create(0);
  if (!v19) {
    xpc_object_t v19 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x1E4F47220], v19);
  xpc_object_t v20 = xpc_null_create();
  xpc_release(v19);
  xpc_release(v20);
  std::string __dst = (void **)0xAAAAAAAAAAAAAAAALL;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  GetABMLogServer(&v24);
  abm::HelperClient::create();
  int v21 = v25;
  if (v25 && !atomic_fetch_add(&v25->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
    xpc_object_t v23 = v4;
    if (v4) {
      goto LABEL_36;
    }
LABEL_38:
    xpc_object_t v23 = xpc_null_create();
    goto LABEL_39;
  }
  xpc_object_t v23 = v4;
  if (!v4) {
    goto LABEL_38;
  }
LABEL_36:
  xpc_retain(v4);
LABEL_39:
  abm::HelperClient::perform();
  xpc_release(v23);
  size_t v22 = (std::__shared_weak_count *)v29;
  if (v29 && !atomic_fetch_add((atomic_ullong *volatile)(v29 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v22);
    if ((SHIBYTE(v32) & 0x80000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  if (SHIBYTE(v32) < 0) {
LABEL_42:
  }
    operator delete(v31[0]);
LABEL_43:
  xpc_release(v4);
}

void sub_1C595A098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, char a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a9);
  xpc_release(object);
  xpc_object_t object = 0;
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100]((uint64_t)&__p);
  if (*(char *)(v23 - 49) < 0) {
    operator delete(*(void **)(v23 - 72));
  }
  xpc_release(v22);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<QMux>::__emplace_unique_key_args<QMux,QMux const&>(uint64_t **a1, QMux *a2, uint64_t *a3)
{
  size_t v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (!v5)
  {
    xpc_object_t v8 = a1 + 1;
LABEL_10:
    uint64_t v11 = (uint64_t *)operator new(0x30uLL);
    xpc_object_t v12 = v11;
    uint64_t v13 = a3[1];
    v11[4] = *a3;
    v11[5] = v13;
    if (v13) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t *v11 = 0;
    v11[1] = 0;
    v11[2] = (uint64_t)v8;
    capabilities::coredump *v6 = v11;
    uint64_t v14 = (uint64_t *)**a1;
    if (v14)
    {
      *a1 = v14;
      xpc_object_t v12 = *v6;
    }
    uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    return result;
  }
  while (1)
  {
    while (1)
    {
      xpc_object_t v8 = (uint64_t **)v5;
      uint64_t v9 = (QMux *)(v5 + 4);
      if (!QMux::operator<(a2, (QMux *)(v5 + 4))) {
        break;
      }
      uint64_t v5 = *v8;
      size_t v6 = v8;
      if (!*v8) {
        goto LABEL_10;
      }
    }
    uint64_t result = (uint64_t *)QMux::operator<(v9, a2);
    if (!result) {
      break;
    }
    size_t v6 = v8 + 1;
    uint64_t v5 = v8[1];
    if (!v5) {
      goto LABEL_10;
    }
  }
  if (!*v6) {
    goto LABEL_10;
  }
  return result;
}

BOOL QMux::operator<(QMux *a1, QMux *a2)
{
  QMux::getName((uint64_t *)__p, a1);
  QMux::getName(v13, a2);
  int v3 = (char)v14;
  xpc_object_t v4 = (void *)v13[0];
  unsigned __int8 v5 = v16;
  if ((v16 & 0x80u) == 0) {
    size_t v6 = v16;
  }
  else {
    size_t v6 = (size_t)__p[1];
  }
  if ((v16 & 0x80u) == 0) {
    size_t v7 = __p;
  }
  else {
    size_t v7 = (void **)__p[0];
  }
  if ((v14 & 0x80u) == 0) {
    unint64_t v8 = v14;
  }
  else {
    unint64_t v8 = v13[1];
  }
  if ((v14 & 0x80u) == 0) {
    uint64_t v9 = v13;
  }
  else {
    uint64_t v9 = (uint64_t *)v13[0];
  }
  if (v8 >= v6) {
    size_t v10 = v6;
  }
  else {
    size_t v10 = v8;
  }
  int v11 = memcmp(v7, v9, v10);
  if (v3 < 0)
  {
    operator delete(v4);
    if ((v16 & 0x80) == 0) {
      goto LABEL_18;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_18;
  }
  operator delete(__p[0]);
LABEL_18:
  if (v11) {
    return v11 < 0;
  }
  else {
    return v6 < v8;
  }
}

void sub_1C595A368(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__tree<std::__value_type<std::string,QMux>,std::__map_value_compare<std::string,std::__value_type<std::string,QMux>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,QMux>>>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,QMux>,std::__map_value_compare<std::string,std::__value_type<std::string,QMux>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,QMux>>>::destroy(*(void *)a1);
    std::__tree<std::__value_type<std::string,QMux>,std::__map_value_compare<std::string,std::__value_type<std::string,QMux>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,QMux>>>::destroy(*((void *)a1 + 1));
    QMux::~QMux((QMux *)(a1 + 56));
    if (a1[55] < 0)
    {
      operator delete(*((void **)a1 + 4));
      uint64_t v2 = a1;
    }
    else
    {
      uint64_t v2 = a1;
    }
    operator delete(v2);
  }
}

void std::__shared_ptr_emplace<qmi::QMuxServerAccepter>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20FF5C8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<qmi::QMuxServerAccepter>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20FF5C8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<qmi::QMuxServerAccepter>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void *std::__function::__func<BOOL (*)(void *),std::allocator<BOOL (*)(void *)>,BOOL ()(void *)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1F20FF618;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<BOOL (*)(void *),std::allocator<BOOL (*)(void *)>,BOOL ()(void *)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1F20FF618;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<BOOL (*)(void *),std::allocator<BOOL (*)(void *)>,BOOL ()(void *)>::operator()(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(void))(a1 + 8))(*a2);
}

uint64_t std::__function::__func<BOOL (*)(void *),std::allocator<BOOL (*)(void *)>,BOOL ()(void *)>::target(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000001C59A7305) {
    return a1 + 8;
  }
  if (((v3 & 0x80000001C59A7305 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001C59A7305)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001C59A7305 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 8;
  }
  return 0;
}

void *std::__function::__func<BOOL (*)(void *),std::allocator<BOOL (*)(void *)>,BOOL ()(void *)>::target_type()
{
}

uint64_t *std::__tree<std::__value_type<std::string,QMux>,std::__map_value_compare<std::string,std::__value_type<std::string,QMux>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,QMux>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,QMux> const&>(uint64_t *result, uint64_t a2, const void **a3, uint64_t a4)
{
  size_t v6 = (uint64_t **)a2;
  size_t v7 = result;
  unint64_t v8 = (uint64_t **)(result + 1);
  if (result + 1 == (uint64_t *)a2) {
    goto LABEL_23;
  }
  int v9 = *((char *)a3 + 23);
  if (v9 >= 0) {
    size_t v10 = a3;
  }
  else {
    size_t v10 = *a3;
  }
  if (v9 >= 0) {
    size_t v11 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v11 = (size_t)a3[1];
  }
  int v12 = *(char *)(a2 + 55);
  if (v12 >= 0) {
    uint64_t v13 = (const void *)(a2 + 32);
  }
  else {
    uint64_t v13 = *(const void **)(a2 + 32);
  }
  if (v12 >= 0) {
    size_t v14 = *(unsigned __int8 *)(a2 + 55);
  }
  else {
    size_t v14 = *(void *)(a2 + 40);
  }
  if (v14 >= v11) {
    size_t v15 = v11;
  }
  else {
    size_t v15 = v14;
  }
  uint64_t result = (uint64_t *)memcmp(v10, v13, v15);
  if (!result)
  {
    if (v11 >= v14) {
      goto LABEL_19;
    }
LABEL_23:
    unsigned __int8 v16 = *v6;
    if ((uint64_t **)*v7 == v6)
    {
      xpc_object_t v18 = v6;
    }
    else
    {
      if (v16)
      {
        xpc_object_t v17 = *v6;
        do
        {
          xpc_object_t v18 = (uint64_t **)v17;
          xpc_object_t v17 = (uint64_t *)v17[1];
        }
        while (v17);
      }
      else
      {
        xpc_object_t v19 = v6;
        do
        {
          xpc_object_t v18 = (uint64_t **)v19[2];
          BOOL v20 = *v18 == (uint64_t *)v19;
          xpc_object_t v19 = v18;
        }
        while (v20);
      }
      int v21 = *((char *)v18 + 55);
      if (v21 >= 0) {
        size_t v22 = (uint64_t *)(v18 + 4);
      }
      else {
        size_t v22 = v18[4];
      }
      if (v21 >= 0) {
        size_t v23 = *((unsigned __int8 *)v18 + 55);
      }
      else {
        size_t v23 = (size_t)v18[5];
      }
      int v24 = *((char *)a3 + 23);
      if (v24 >= 0) {
        uint64_t v25 = a3;
      }
      else {
        uint64_t v25 = *a3;
      }
      if (v24 >= 0) {
        size_t v26 = *((unsigned __int8 *)a3 + 23);
      }
      else {
        size_t v26 = (size_t)a3[1];
      }
      if (v26 >= v23) {
        size_t v27 = v23;
      }
      else {
        size_t v27 = v26;
      }
      uint64_t result = (uint64_t *)memcmp(v22, v25, v27);
      if (result)
      {
        if ((result & 0x80000000) == 0) {
          goto LABEL_48;
        }
      }
      else if (v23 >= v26)
      {
LABEL_48:
        std::string::size_type v28 = *v8;
        unint64_t v29 = v8;
        size_t v6 = v8;
        if (!*v8) {
          goto LABEL_100;
        }
        while (1)
        {
          size_t v6 = (uint64_t **)v28;
          uint64_t v32 = (const void *)v28[4];
          int64_t v30 = v28 + 4;
          xpc_object_t v31 = v32;
          int v33 = *((char *)v30 + 23);
          if (v33 >= 0) {
            long long v34 = v30;
          }
          else {
            long long v34 = v31;
          }
          if (v33 >= 0) {
            size_t v35 = *((unsigned __int8 *)v30 + 23);
          }
          else {
            size_t v35 = v30[1];
          }
          if (v35 >= v26) {
            size_t v36 = v26;
          }
          else {
            size_t v36 = v35;
          }
          int v37 = memcmp(v25, v34, v36);
          if (v37)
          {
            if (v37 < 0) {
              goto LABEL_50;
            }
LABEL_64:
            uint64_t result = (uint64_t *)memcmp(v34, v25, v36);
            if (result)
            {
              if ((result & 0x80000000) == 0) {
                return result;
              }
            }
            else if (v35 >= v26)
            {
              return result;
            }
            std::string::size_type v28 = v6[1];
            if (!v28)
            {
LABEL_69:
              unint64_t v29 = v6 + 1;
              goto LABEL_100;
            }
          }
          else
          {
            if (v26 >= v35) {
              goto LABEL_64;
            }
LABEL_50:
            std::string::size_type v28 = *v6;
            unint64_t v29 = v6;
            if (!*v6) {
              goto LABEL_100;
            }
          }
        }
      }
    }
    if (v16) {
      unint64_t v38 = v18;
    }
    else {
      unint64_t v38 = v6;
    }
    if (v16) {
      unint64_t v29 = v18 + 1;
    }
    else {
      unint64_t v29 = v6;
    }
    if (*v29) {
      return result;
    }
    size_t v6 = v38;
    goto LABEL_100;
  }
  if ((result & 0x80000000) != 0) {
    goto LABEL_23;
  }
LABEL_19:
  uint64_t result = (uint64_t *)memcmp(v13, v10, v15);
  if (result)
  {
    if ((result & 0x80000000) == 0) {
      return result;
    }
  }
  else if (v14 >= v11)
  {
    return result;
  }
  unint64_t v29 = v6 + 1;
  uint64_t v39 = v6[1];
  if (v39)
  {
    do
    {
      unint64_t v29 = (uint64_t **)v39;
      uint64_t v39 = (uint64_t *)*v39;
      size_t v6 = v29;
      uint64_t v40 = v29;
    }
    while (v39);
  }
  else
  {
    uint64_t v40 = v6;
    do
    {
      unint64_t v41 = (uint64_t *)v40;
      uint64_t v40 = (uint64_t **)v40[2];
    }
    while (*v40 != v41);
  }
  if (v40 == v8) {
    goto LABEL_100;
  }
  long long v44 = v40[4];
  std::string::size_type v42 = (uint64_t *)(v40 + 4);
  int v43 = v44;
  int v45 = *((char *)v42 + 23);
  if (v45 >= 0) {
    xpc_object_t v46 = v42;
  }
  else {
    xpc_object_t v46 = v43;
  }
  if (v45 >= 0) {
    size_t v47 = *((unsigned __int8 *)v42 + 23);
  }
  else {
    size_t v47 = v42[1];
  }
  if (v47 >= v11) {
    size_t v48 = v11;
  }
  else {
    size_t v48 = v47;
  }
  int v49 = memcmp(v10, v46, v48);
  if (v49)
  {
    if (v49 < 0) {
      goto LABEL_100;
    }
LABEL_99:
    uint64_t v50 = *v8;
    unint64_t v29 = v8;
    size_t v6 = v8;
    if (!*v8) {
      goto LABEL_100;
    }
    while (1)
    {
      size_t v6 = (uint64_t **)v50;
      v55 = (const void *)v50[4];
      xpc_object_t v53 = v50 + 4;
      xpc_object_t v54 = v55;
      int v56 = *((char *)v53 + 23);
      if (v56 >= 0) {
        uint64_t v57 = v53;
      }
      else {
        uint64_t v57 = v54;
      }
      if (v56 >= 0) {
        size_t v58 = *((unsigned __int8 *)v53 + 23);
      }
      else {
        size_t v58 = v53[1];
      }
      if (v58 >= v11) {
        size_t v59 = v11;
      }
      else {
        size_t v59 = v58;
      }
      int v60 = memcmp(v10, v57, v59);
      if (v60)
      {
        if (v60 < 0) {
          goto LABEL_102;
        }
LABEL_116:
        uint64_t result = (uint64_t *)memcmp(v57, v10, v59);
        if (result)
        {
          if ((result & 0x80000000) == 0) {
            return result;
          }
        }
        else if (v58 >= v11)
        {
          return result;
        }
        uint64_t v50 = v6[1];
        if (!v50) {
          goto LABEL_69;
        }
      }
      else
      {
        if (v11 >= v58) {
          goto LABEL_116;
        }
LABEL_102:
        uint64_t v50 = *v6;
        unint64_t v29 = v6;
        if (!*v6) {
          goto LABEL_100;
        }
      }
    }
  }
  if (v11 >= v47) {
    goto LABEL_99;
  }
LABEL_100:
  size_t v51 = (uint64_t *)operator new(0x48uLL);
  unint64_t v52 = (std::string *)(v51 + 4);
  if (*(char *)(a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v52, *(const std::string::value_type **)a4, *(void *)(a4 + 8));
  }
  else
  {
    *(_OWORD *)&v52->__r_.__value_.__l.__data_ = *(_OWORD *)a4;
    v51[6] = *(void *)(a4 + 16);
  }
  uint64_t v61 = *(void *)(a4 + 32);
  v51[7] = *(void *)(a4 + 24);
  v51[8] = v61;
  if (v61) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v61 + 8), 1uLL, memory_order_relaxed);
  }
  *size_t v51 = 0;
  v51[1] = 0;
  v51[2] = (uint64_t)v6;
  std::string *v29 = v51;
  uint64_t v62 = *(void *)*v7;
  if (v62)
  {
    uint64_t *v7 = v62;
    size_t v51 = *v29;
  }
  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v7[1], v51);
  ++v7[2];
  return result;
}

void sub_1C595A984(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void ___ZN3ctu2cf8for_eachINSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEES8_EEvPK14__CFDictionaryU13block_pointerFvRKT_RKT0_E_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  ctu::cf::assign();
  *(_OWORD *)xpc_object_t v4 = 0uLL;
  uint64_t v5 = 0;
  long long v6 = 0uLL;
  uint64_t v7 = 0;
  ctu::cf::assign();
  uint64_t v3 = 0;
  *(_OWORD *)std::string __p = 0uLL;
  (*(void (**)(uint64_t, void **, void **))(v1 + 16))(v1, v4, __p);
  if ((SHIBYTE(v3) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v5) & 0x80000000) == 0) {
      return;
    }
LABEL_5:
    operator delete(v4[0]);
    return;
  }
  operator delete(__p[0]);
  if (SHIBYTE(v5) < 0) {
    goto LABEL_5;
  }
}

void sub_1C595AA58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a14 < 0) {
    operator delete(a9);
  }
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ctu::cf::DictApplyFunction(ctu::cf *this, const void *a2, const void *a3, void *a4)
{
  return (*(uint64_t (**)(void))(*(void *)a3 + 16))();
}

void ctu::SharedSynchronizable<QMITransportService>::execute_wrapped(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a1[1];
  if (!v3 || (uint64_t v5 = *a1, (v6 = std::__shared_weak_count::lock(v3)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v7 = v6;
  unint64_t v8 = a1[2];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &unk_1F20FF6C0;
  void block[5] = v5;
  int v12 = v7;
  p_shared_owners = &v7->__shared_owners_;
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  void block[4] = a2;
  dispatch_async(v8, block);
  size_t v10 = v12;
  if (!v12 || atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
LABEL_8:
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
    return;
  }
  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
  std::__shared_weak_count::__release_weak(v10);
  if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_8;
  }
}

uint64_t ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE15execute_wrappedEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __copy_helper_block_e8_40c48_ZTSNSt3__110shared_ptrIK19QMITransportServiceEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c48_ZTSNSt3__110shared_ptrIK19QMITransportServiceEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

uint64_t ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZNS1_6engageEvE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS5__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(uint64_t **)(a1 + 40);
  uint64_t v2 = *v1;
  uint64_t v3 = *(NSObject **)(*v1 + 40);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C5767000, v3, OS_LOG_TYPE_DEFAULT, "#I ----------------- Engaging ----------------", buf, 2u);
  }
  xpc_object_t v4 = *(void **)(v2 + 144);
  uint64_t v5 = (uint64_t *)v1[1];
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 16), 1uLL, memory_order_relaxed);
  }
  unint64_t v8 = (dispatch_object_t *)v1[2];
  int v9 = *v8;
  if (*v8)
  {
    dispatch_retain(*v8);
    dispatch_group_enter(v9);
  }
  long long v12 = *(_OWORD *)(v1 + 3);
  size_t v10 = (char *)operator new(0x38uLL);
  *(void *)size_t v10 = &unk_1F20FF700;
  *((void *)v10 + 1) = v2;
  *((void *)v10 + 2) = v7;
  *((void *)v10 + 3) = v6;
  *((void *)v10 + 4) = v9;
  *(_OWORD *)(v10 + 40) = v12;
  size_t v14 = (uint8_t *)v10;
  RouterIPCController::engage(v4, buf);
  uint64_t result = (uint64_t)v14;
  if (v14 == buf) {
    return (*(uint64_t (**)(uint8_t *))(*(void *)buf + 32))(buf);
  }
  if (v14) {
    return (*(uint64_t (**)(void))(*(void *)v14 + 40))();
  }
  return result;
}

void sub_1C595AE64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (a14 == v14)
  {
    (*(void (**)(uint64_t *))(a11 + 32))(&a11);
    _Unwind_Resume(exception_object);
  }
  if (a14)
  {
    (*(void (**)(void))(*(void *)a14 + 40))();
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *std::__function::__func<QMITransportService::engage(void)::$_0::operator() const(void)::{lambda(BOOL,std::string)#1},std::allocator<QMITransportService::engage(void)::$_0::operator() const(void)::{lambda(BOOL,std::string)#1}>,void ()(BOOL,std::string)>::~__func(void *a1)
{
  *a1 = &unk_1F20FF700;
  uint64_t v2 = a1[4];
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = a1[4];
    if (v3) {
      dispatch_release(v3);
    }
  }
  xpc_object_t v4 = (std::__shared_weak_count *)a1[3];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void std::__function::__func<QMITransportService::engage(void)::$_0::operator() const(void)::{lambda(BOOL,std::string)#1},std::allocator<QMITransportService::engage(void)::$_0::operator() const(void)::{lambda(BOOL,std::string)#1}>,void ()(BOOL,std::string)>::~__func(void *__p)
{
  *std::string __p = &unk_1F20FF700;
  uint64_t v2 = __p[4];
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = __p[4];
    if (v3) {
      dispatch_release(v3);
    }
  }
  xpc_object_t v4 = (std::__shared_weak_count *)__p[3];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(__p);
}

char *std::__function::__func<QMITransportService::engage(void)::$_0::operator() const(void)::{lambda(BOOL,std::string)#1},std::allocator<QMITransportService::engage(void)::$_0::operator() const(void)::{lambda(BOOL,std::string)#1}>,void ()(BOOL,std::string)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x38uLL);
  *(void *)uint64_t v2 = &unk_1F20FF700;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)v2 + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  xpc_object_t v4 = *(NSObject **)(a1 + 32);
  *((void *)v2 + 4) = v4;
  if (v4)
  {
    dispatch_retain(v4);
    uint64_t v5 = *((void *)v2 + 4);
    if (v5) {
      dispatch_group_enter(v5);
    }
  }
  *(_OWORD *)(v2 + 40) = *(_OWORD *)(a1 + 40);
  return v2;
}

__n128 std::__function::__func<QMITransportService::engage(void)::$_0::operator() const(void)::{lambda(BOOL,std::string)#1},std::allocator<QMITransportService::engage(void)::$_0::operator() const(void)::{lambda(BOOL,std::string)#1}>,void ()(BOOL,std::string)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1F20FF700;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = *(NSObject **)(a1 + 32);
  *(void *)(a2 + 32) = v5;
  if (v5)
  {
    dispatch_retain(v5);
    uint64_t v6 = *(NSObject **)(a2 + 32);
    if (v6) {
      dispatch_group_enter(v6);
    }
  }
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(a2 + 40) = result;
  return result;
}

void std::__function::__func<QMITransportService::engage(void)::$_0::operator() const(void)::{lambda(BOOL,std::string)#1},std::allocator<QMITransportService::engage(void)::$_0::operator() const(void)::{lambda(BOOL,std::string)#1}>,void ()(BOOL,std::string)>::destroy(uint64_t a1)
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
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 24);
  if (v4)
  {
    std::__shared_weak_count::__release_weak(v4);
  }
}

void std::__function::__func<QMITransportService::engage(void)::$_0::operator() const(void)::{lambda(BOOL,std::string)#1},std::allocator<QMITransportService::engage(void)::$_0::operator() const(void)::{lambda(BOOL,std::string)#1}>,void ()(BOOL,std::string)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = __p[4];
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = __p[4];
    if (v3) {
      dispatch_release(v3);
    }
  }
  uint64_t v4 = (std::__shared_weak_count *)__p[3];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(__p);
}

void std::__function::__func<QMITransportService::engage(void)::$_0::operator() const(void)::{lambda(BOOL,std::string)#1},std::allocator<QMITransportService::engage(void)::$_0::operator() const(void)::{lambda(BOOL,std::string)#1}>,void ()(BOOL,std::string)>::operator()(void *a1, char *a2, uint64_t a3)
{
  char v4 = *a2;
  *(_OWORD *)std::string __p = *(_OWORD *)a3;
  uint64_t v12 = *(void *)(a3 + 16);
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)a3 = 0;
  char v14 = v4;
  uint64_t v5 = (std::__shared_weak_count *)a1[3];
  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v6 = a1[1];
  uint64_t v7 = std::__shared_weak_count::lock(v5);
  if (!v7) {
    goto LABEL_7;
  }
  unint64_t v8 = v7;
  if (!a1[2]) {
    goto LABEL_6;
  }
  uint64_t v9 = a1[6];
  v13[0] = a1[5];
  v13[1] = &v14;
  uint64_t v13[2] = v9;
  v13[3] = __p;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZZZNS1_6engageEvENK3__0clEvENKUlbNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE_clEbSB_EUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSE__block_invoke;
  block[3] = &__block_descriptor_tmp_136;
  void block[4] = v6 + 72;
  void block[5] = v13;
  size_t v10 = *(NSObject **)(v6 + 88);
  if (!*(void *)(v6 + 96))
  {
    dispatch_sync(v10, block);
    if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_10;
    }
LABEL_7:
    if ((SHIBYTE(v12) & 0x80000000) == 0) {
      return;
    }
LABEL_11:
    operator delete(__p[0]);
    return;
  }
  dispatch_async_and_wait(v10, block);
LABEL_6:
  if (atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_7;
  }
LABEL_10:
  ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
  std::__shared_weak_count::__release_weak(v8);
  if (SHIBYTE(v12) < 0) {
    goto LABEL_11;
  }
}

uint64_t std::__function::__func<QMITransportService::engage(void)::$_0::operator() const(void)::{lambda(BOOL,std::string)#1},std::allocator<QMITransportService::engage(void)::$_0::operator() const(void)::{lambda(BOOL,std::string)#1}>,void ()(BOOL,std::string)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZZN19QMITransportService6engageEvENK3$_0clEvEUlbNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEE_") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"ZZN19QMITransportService6engageEvENK3$_0clEvEUlbNSt3__112basic_stringIcNS1_11char_traits"
                                "IcEENS1_9allocatorIcEEEEE_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZZN19QMITransportService6engageEvENK3$_0clEvEUlbNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEE_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN19QMITransportService6engageEvENK3$_0clEvEUlbNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEE_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<QMITransportService::engage(void)::$_0::operator() const(void)::{lambda(BOOL,std::string)#1},std::allocator<QMITransportService::engage(void)::$_0::operator() const(void)::{lambda(BOOL,std::string)#1}>,void ()(BOOL,std::string)>::target_type()
{
}

std::string *___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZZZNS1_6engageEvENK3__0clEvENKUlbNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE_clEbSB_EUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSE__block_invoke(std::string *result)
{
  std::string::size_type v1 = result[1].__r_.__value_.__r.__words[2];
  int v2 = **(unsigned __int8 **)(v1 + 8);
  **(unsigned char **)std::string::size_type v1 = v2;
  if (!v2)
  {
    std::string::append(*(std::string **)(v1 + 16), "Engage failure: ", 0x10uLL);
    unint64_t v3 = *(std::string **)(v1 + 16);
    uint64_t v4 = *(void *)(v1 + 24);
    int v5 = *(char *)(v4 + 23);
    if (v5 >= 0) {
      uint64_t v6 = *(const std::string::value_type **)(v1 + 24);
    }
    else {
      uint64_t v6 = *(const std::string::value_type **)v4;
    }
    if (v5 >= 0) {
      std::string::size_type v7 = *(unsigned __int8 *)(v4 + 23);
    }
    else {
      std::string::size_type v7 = *(void *)(v4 + 8);
    }
    return std::string::append(v3, v6, v7);
  }
  return result;
}

void ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZNS1_6engageEvE3__1EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS5__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(v1 + 16);
  unint64_t v3 = *(unsigned char **)v1;
  if (**(unsigned char **)v1)
  {
    int v4 = **(unsigned __int8 **)(v1 + 8);
    unsigned char *v3 = v4 ^ 1;
    if (!v4)
    {
      int v5 = *(NSObject **)(v2 + 40);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1C5767000, v5, OS_LOG_TYPE_DEFAULT, "#I ----------------- Engaged ----------------", (uint8_t *)&v9, 2u);
      }
      return;
    }
  }
  else
  {
    unsigned char *v3 = 0;
  }
  uint64_t v6 = *(uint64_t **)(v1 + 24);
  if (*((char *)v6 + 23) < 0) {
    uint64_t v6 = (uint64_t *)*v6;
  }
  (*(void (**)(void, uint64_t *, uint64_t))(**(void **)(v2 + 128) + 16))(*(void *)(v2 + 128), v6, 1);
  std::string::size_type v7 = *(NSObject **)(v2 + 40);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    unint64_t v8 = *(uint64_t **)(v1 + 24);
    if (*((char *)v8 + 23) < 0) {
      unint64_t v8 = (uint64_t *)*v8;
    }
    int v9 = 136315138;
    size_t v10 = v8;
    _os_log_error_impl(&dword_1C5767000, v7, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v9, 0xCu);
  }
}

void ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZNS1_7recoverEvE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS5__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v2 = (void *)*v1;
  unint64_t v3 = *(NSObject **)(*v1 + 40);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v14 = 0;
    _os_log_impl(&dword_1C5767000, v3, OS_LOG_TYPE_DEFAULT, "#I ----------------- Recovering ----------------", v14, 2u);
  }
  int v4 = (std::__shared_weak_count *)v2[10];
  if (!v4 || (uint64_t v5 = v2[9], (v6 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  std::string::size_type v7 = v6;
  p_shared_weak_owners = &v6->__shared_weak_owners_;
  atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
  int v9 = (void *)v2[18];
  atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
  size_t v10 = (dispatch_object_t *)v1[1];
  uint64_t v11 = *v10;
  if (*v10)
  {
    dispatch_retain(*v10);
    dispatch_group_enter(v11);
  }
  uint64_t v12 = v1[2];
  uint64_t v15 = 0;
  uint64_t v13 = (uint8_t *)operator new(0x30uLL);
  *(void *)uint64_t v13 = &unk_1F20FF790;
  *((void *)v13 + 1) = v2;
  *((void *)v13 + 2) = v5;
  *((void *)v13 + 3) = v7;
  *((void *)v13 + 4) = v11;
  *((void *)v13 + 5) = v12;
  uint64_t v15 = v13;
  RouterIPCController::recover(v9, v14);
  if (v15 == v14)
  {
    (*(void (**)(uint8_t *))(*(void *)v14 + 32))(v14);
  }
  else if (v15)
  {
    (*(void (**)(void))(*(void *)v15 + 40))();
  }
  std::__shared_weak_count::__release_weak(v7);
}

void sub_1C595B76C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12 == v13)
  {
    (*(void (**)(uint64_t *))(a9 + 32))(&a9);
    std::__shared_weak_count::__release_weak(v12);
    _Unwind_Resume(a1);
  }
  if (a12)
  {
    (*(void (**)(void))(*(void *)a12 + 40))();
    std::__shared_weak_count::__release_weak(v12);
    _Unwind_Resume(a1);
  }
  std::__shared_weak_count::__release_weak(v12);
  _Unwind_Resume(a1);
}

void *std::__function::__func<QMITransportService::recover(void)::$_0::operator() const(void)::{lambda(BOOL)#1},std::allocator<QMITransportService::recover(void)::$_0::operator() const(void)::{lambda(BOOL)#1}>,void ()(BOOL)>::~__func(void *a1)
{
  *a1 = &unk_1F20FF790;
  uint64_t v2 = a1[4];
  if (v2)
  {
    dispatch_group_leave(v2);
    unint64_t v3 = a1[4];
    if (v3) {
      dispatch_release(v3);
    }
  }
  int v4 = (std::__shared_weak_count *)a1[3];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void std::__function::__func<QMITransportService::recover(void)::$_0::operator() const(void)::{lambda(BOOL)#1},std::allocator<QMITransportService::recover(void)::$_0::operator() const(void)::{lambda(BOOL)#1}>,void ()(BOOL)>::~__func(void *__p)
{
  *std::string __p = &unk_1F20FF790;
  uint64_t v2 = __p[4];
  if (v2)
  {
    dispatch_group_leave(v2);
    unint64_t v3 = __p[4];
    if (v3) {
      dispatch_release(v3);
    }
  }
  int v4 = (std::__shared_weak_count *)__p[3];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(__p);
}

char *std::__function::__func<QMITransportService::recover(void)::$_0::operator() const(void)::{lambda(BOOL)#1},std::allocator<QMITransportService::recover(void)::$_0::operator() const(void)::{lambda(BOOL)#1}>,void ()(BOOL)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x30uLL);
  *(void *)uint64_t v2 = &unk_1F20FF790;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)v2 + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  int v4 = *(NSObject **)(a1 + 32);
  *((void *)v2 + 4) = v4;
  if (v4)
  {
    dispatch_retain(v4);
    uint64_t v5 = *((void *)v2 + 4);
    if (v5) {
      dispatch_group_enter(v5);
    }
  }
  *((void *)v2 + 5) = *(void *)(a1 + 40);
  return v2;
}

void std::__function::__func<QMITransportService::recover(void)::$_0::operator() const(void)::{lambda(BOOL)#1},std::allocator<QMITransportService::recover(void)::$_0::operator() const(void)::{lambda(BOOL)#1}>,void ()(BOOL)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1F20FF790;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = *(NSObject **)(a1 + 32);
  *(void *)(a2 + 32) = v5;
  if (v5)
  {
    dispatch_retain(v5);
    uint64_t v6 = *(NSObject **)(a2 + 32);
    if (v6) {
      dispatch_group_enter(v6);
    }
  }
  *(void *)(a2 + 40) = *(void *)(a1 + 40);
}

void std::__function::__func<QMITransportService::recover(void)::$_0::operator() const(void)::{lambda(BOOL)#1},std::allocator<QMITransportService::recover(void)::$_0::operator() const(void)::{lambda(BOOL)#1}>,void ()(BOOL)>::destroy(uint64_t a1)
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
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 24);
  if (v4)
  {
    std::__shared_weak_count::__release_weak(v4);
  }
}

void std::__function::__func<QMITransportService::recover(void)::$_0::operator() const(void)::{lambda(BOOL)#1},std::allocator<QMITransportService::recover(void)::$_0::operator() const(void)::{lambda(BOOL)#1}>,void ()(BOOL)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = __p[4];
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = __p[4];
    if (v3) {
      dispatch_release(v3);
    }
  }
  uint64_t v4 = (std::__shared_weak_count *)__p[3];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(__p);
}

void std::__function::__func<QMITransportService::recover(void)::$_0::operator() const(void)::{lambda(BOOL)#1},std::allocator<QMITransportService::recover(void)::$_0::operator() const(void)::{lambda(BOOL)#1}>,void ()(BOOL)>::operator()(void *a1, char *a2)
{
  char v9 = *a2;
  uint64_t v3 = (std::__shared_weak_count *)a1[3];
  if (v3)
  {
    uint64_t v4 = a1[1];
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      uint64_t v6 = v5;
      if (!a1[2]) {
        goto LABEL_6;
      }
      v8[0] = a1[5];
      v8[1] = &v9;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 0x40000000;
      block[2] = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZZZNS1_7recoverEvENK3__0clEvENKUlbE_clEbEUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
      block[3] = &__block_descriptor_tmp_147;
      void block[4] = v4 + 72;
      void block[5] = v8;
      std::string::size_type v7 = *(NSObject **)(v4 + 88);
      if (*(void *)(v4 + 96))
      {
        dispatch_async_and_wait(v7, block);
LABEL_6:
        if (atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
          return;
        }
LABEL_9:
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
        return;
      }
      dispatch_sync(v7, block);
      if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_9;
      }
    }
  }
}

uint64_t std::__function::__func<QMITransportService::recover(void)::$_0::operator() const(void)::{lambda(BOOL)#1},std::allocator<QMITransportService::recover(void)::$_0::operator() const(void)::{lambda(BOOL)#1}>,void ()(BOOL)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZZN19QMITransportService7recoverEvENK3$_0clEvEUlbE_") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"ZZN19QMITransportService7recoverEvENK3$_0clEvEUlbE_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZZN19QMITransportService7recoverEvENK3$_0clEvEUlbE_")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN19QMITransportService7recoverEvENK3$_0clEvEUlbE_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<QMITransportService::recover(void)::$_0::operator() const(void)::{lambda(BOOL)#1},std::allocator<QMITransportService::recover(void)::$_0::operator() const(void)::{lambda(BOOL)#1}>,void ()(BOOL)>::target_type()
{
}

uint64_t ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZZZNS1_7recoverEvENK3__0clEvENKUlbE_clEbEUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke(uint64_t result)
{
  ***(unsigned char ***)(result + 40) = **(unsigned char **)(*(void *)(result + 40) + 8);
  return result;
}

void ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZNS1_7recoverEvE3__1EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS5__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(v1 + 16);
  unint64_t v3 = *(unsigned char **)v1;
  if (**(unsigned char **)v1)
  {
    int v4 = **(unsigned __int8 **)(v1 + 8);
    unsigned char *v3 = v4 ^ 1;
    if (!v4)
    {
      uint64_t v5 = *(NSObject **)(v2 + 40);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1C5767000, v5, OS_LOG_TYPE_DEFAULT, "#I ----------------- Recovered ----------------", (uint8_t *)&v9, 2u);
      }
      return;
    }
  }
  else
  {
    unsigned char *v3 = 0;
  }
  uint64_t v6 = *(uint64_t **)(v1 + 24);
  if (*((char *)v6 + 23) < 0) {
    uint64_t v6 = (uint64_t *)*v6;
  }
  (*(void (**)(void, uint64_t *, uint64_t))(**(void **)(v2 + 128) + 16))(*(void *)(v2 + 128), v6, 1);
  std::string::size_type v7 = *(NSObject **)(v2 + 40);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    unint64_t v8 = *(uint64_t **)(v1 + 24);
    if (*((char *)v8 + 23) < 0) {
      unint64_t v8 = (uint64_t *)*v8;
    }
    int v9 = 136315138;
    size_t v10 = v8;
    _os_log_error_impl(&dword_1C5767000, v7, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v9, 0xCu);
  }
}

void ___ZNK8dispatch8callbackIU13block_pointerFv10WakeReasonEEclIJNS1_6StatusEEEEvDpT__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(a1 + 40);
  xpc_object_t object = xpc_null_create();
  (*(void (**)(uint64_t, int *))(v1 + 16))(v1, &v2);
  xpc_release(object);
}

void sub_1C595BE58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void *__copy_helper_block_e8_32c54_ZTSN8dispatch5blockIU13block_pointerFv10WakeReasonEEE(uint64_t a1, uint64_t a2)
{
  __n128 result = *(void **)(a2 + 32);
  if (result) {
    __n128 result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c54_ZTSN8dispatch5blockIU13block_pointerFv10WakeReasonEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void *_ZNSt3__110__function6__funcIZZZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionEEUb_EUb0_E3__4NS_9allocatorIS5_EEFvbEED1Ev(void *a1)
{
  *a1 = &unk_1F20FF840;
  int v2 = (std::__shared_weak_count *)a1[3];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

void _ZNSt3__110__function6__funcIZZZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionEEUb_EUb0_E3__4NS_9allocatorIS5_EEFvbEED0Ev(void *__p)
{
  *std::string __p = &unk_1F20FF840;
  int v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }

  operator delete(__p);
}

char *_ZNKSt3__110__function6__funcIZZZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionEEUb_EUb0_E3__4NS_9allocatorIS5_EEFvbEE7__cloneEv(uint64_t a1)
{
  __n128 result = (char *)operator new(0x20uLL);
  *(void *)__n128 result = &unk_1F20FF840;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)result + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t _ZNKSt3__110__function6__funcIZZZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionEEUb_EUb0_E3__4NS_9allocatorIS5_EEFvbEE7__cloneEPNS0_6__baseIS8_EE(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_1F20FF840;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  uint64_t v2 = *(void *)(result + 24);
  *(void *)(a2 + 24) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void _ZNSt3__110__function6__funcIZZZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionEEUb_EUb0_E3__4NS_9allocatorIS5_EEFvbEE7destroyEv(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void _ZNSt3__110__function6__funcIZZZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionEEUb_EUb0_E3__4NS_9allocatorIS5_EEFvbEE18destroy_deallocateEv(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }

  operator delete(__p);
}

void _ZNSt3__110__function6__funcIZZZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionEEUb_EUb0_E3__4NS_9allocatorIS5_EEFvbEEclEOb(void *a1, char *a2)
{
  char v9 = *a2;
  uint64_t v3 = (std::__shared_weak_count *)a1[3];
  if (v3)
  {
    uint64_t v4 = a1[1];
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      uint64_t v6 = v5;
      if (!a1[2]) {
        goto LABEL_6;
      }
      v8[0] = v4;
      v8[1] = &v9;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 0x40000000;
      block[2] = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZZZZNS1_13enterLowPowerEN8dispatch13group_sessionEEUb_EUb0_ENK3__4clEbEUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
      block[3] = &__block_descriptor_tmp_150_1;
      void block[4] = v4 + 72;
      void block[5] = v8;
      std::string::size_type v7 = *(NSObject **)(v4 + 88);
      if (*(void *)(v4 + 96))
      {
        dispatch_async_and_wait(v7, block);
LABEL_6:
        if (atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
          return;
        }
LABEL_9:
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
        return;
      }
      dispatch_sync(v7, block);
      if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_9;
      }
    }
  }
}

uint64_t _ZNKSt3__110__function6__funcIZZZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionEEUb_EUb0_E3__4NS_9allocatorIS5_EEFvbEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZZZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionEEUb_EUb0_E3$_4") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"ZZZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionEEUb_EUb0_E3$_4" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZZZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionEEUb_EUb0_E3$_4")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionEEUb_EUb0_E3$_4" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionEEUb_EUb0_E3__4NS_9allocatorIS5_EEFvbEE11target_typeEv()
{
  return &_ZTIZZZN19QMITransportService13enterLowPowerEN8dispatch13group_sessionEEUb_EUb0_E3__4;
}

void ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZZZZNS1_13enterLowPowerEN8dispatch13group_sessionEEUb_EUb0_ENK3__4clEbEUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(int64x2_t ***)(a1 + 40);
  uint64_t v2 = *v1;
  if ((*v1)[22].i64[1])
  {
    uint64_t v3 = *(void *)(v2[20].i64[1] + (((unint64_t)v2[22].i64[0] >> 6) & 0x3FFFFFFFFFFFFF8));
    uint64_t v4 = v2[22].i64[0] & 0x1FF;
    uint64_t v5 = *(NSObject **)(v3 + 8 * v4);
    if (v5)
    {
      dispatch_group_leave(v5);
      uint64_t v6 = *(NSObject **)(v3 + 8 * v4);
      if (v6) {
        dispatch_release(v6);
      }
    }
    int64x2_t v7 = vaddq_s64(v2[22], (int64x2_t)xmmword_1C59A7040);
    v2[22] = v7;
    if (v7.i64[0] >= 0x400uLL)
    {
      operator delete(*(void **)v2[20].i64[1]);
      v2[20].i64[1] += 8;
      v2[22].i64[0] -= 512;
    }
    unint64_t v8 = (void *)v2[23].i64[0];
    v2[23].i64[0] = 0;
    if (v8)
    {
      TelephonyBasebandWatchdogStop();
      operator delete(v8);
    }
    char v9 = (void *)v2[23].i64[1];
    v2[23].i64[1] = 0;
    if (v9)
    {
      TelephonyBasebandWatchdogStop();
      operator delete(v9);
    }
  }
  size_t v10 = v2[2].i64[1];
  if (v1[1]->i8[0])
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C5767000, v10, OS_LOG_TYPE_DEFAULT, "#I ----------------- Low Power ----------------", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11[0] = 0;
    _os_log_error_impl(&dword_1C5767000, v10, OS_LOG_TYPE_ERROR, "-------------- Enter Low Power Failure -------------", (uint8_t *)v11, 2u);
  }
}

void ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZNS1_8tearDownEvE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS5__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = *(NSObject **)(*v1 + 40);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v14 = 0;
    _os_log_impl(&dword_1C5767000, v3, OS_LOG_TYPE_DEFAULT, "#I ----------------- Tearing Down ----------------", v14, 2u);
  }
  uint64_t v4 = (std::__shared_weak_count *)v2[10];
  if (!v4 || (uint64_t v5 = v2[9], (v6 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  int64x2_t v7 = v6;
  p_shared_weak_owners = &v6->__shared_weak_owners_;
  atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
  char v9 = (void *)v2[18];
  atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
  size_t v10 = (dispatch_object_t *)v1[1];
  uint64_t v11 = *v10;
  if (*v10)
  {
    dispatch_retain(*v10);
    dispatch_group_enter(v11);
  }
  uint64_t v12 = v1[2];
  uint64_t v15 = 0;
  uint64_t v13 = (uint8_t *)operator new(0x30uLL);
  *(void *)uint64_t v13 = &unk_1F20FF8C0;
  *((void *)v13 + 1) = v2;
  *((void *)v13 + 2) = v5;
  *((void *)v13 + 3) = v7;
  *((void *)v13 + 4) = v11;
  *((void *)v13 + 5) = v12;
  uint64_t v15 = v13;
  RouterIPCController::teardown(v9, v14);
  if (v15 == v14)
  {
    (*(void (**)(uint8_t *))(*(void *)v14 + 32))(v14);
  }
  else if (v15)
  {
    (*(void (**)(void))(*(void *)v15 + 40))();
  }
  std::__shared_weak_count::__release_weak(v7);
}

void sub_1C595C578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12 == v13)
  {
    (*(void (**)(uint64_t *))(a9 + 32))(&a9);
    std::__shared_weak_count::__release_weak(v12);
    _Unwind_Resume(a1);
  }
  if (a12)
  {
    (*(void (**)(void))(*(void *)a12 + 40))();
    std::__shared_weak_count::__release_weak(v12);
    _Unwind_Resume(a1);
  }
  std::__shared_weak_count::__release_weak(v12);
  _Unwind_Resume(a1);
}

void *std::__function::__func<QMITransportService::tearDown(void)::$_0::operator() const(void)::{lambda(BOOL)#1},std::allocator<QMITransportService::tearDown(void)::$_0::operator() const(void)::{lambda(BOOL)#1}>,void ()(BOOL)>::~__func(void *a1)
{
  *a1 = &unk_1F20FF8C0;
  uint64_t v2 = a1[4];
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = a1[4];
    if (v3) {
      dispatch_release(v3);
    }
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[3];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void std::__function::__func<QMITransportService::tearDown(void)::$_0::operator() const(void)::{lambda(BOOL)#1},std::allocator<QMITransportService::tearDown(void)::$_0::operator() const(void)::{lambda(BOOL)#1}>,void ()(BOOL)>::~__func(void *__p)
{
  *std::string __p = &unk_1F20FF8C0;
  uint64_t v2 = __p[4];
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = __p[4];
    if (v3) {
      dispatch_release(v3);
    }
  }
  uint64_t v4 = (std::__shared_weak_count *)__p[3];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(__p);
}

char *std::__function::__func<QMITransportService::tearDown(void)::$_0::operator() const(void)::{lambda(BOOL)#1},std::allocator<QMITransportService::tearDown(void)::$_0::operator() const(void)::{lambda(BOOL)#1}>,void ()(BOOL)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x30uLL);
  *(void *)uint64_t v2 = &unk_1F20FF8C0;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)v2 + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = *(NSObject **)(a1 + 32);
  *((void *)v2 + 4) = v4;
  if (v4)
  {
    dispatch_retain(v4);
    uint64_t v5 = *((void *)v2 + 4);
    if (v5) {
      dispatch_group_enter(v5);
    }
  }
  *((void *)v2 + 5) = *(void *)(a1 + 40);
  return v2;
}

void std::__function::__func<QMITransportService::tearDown(void)::$_0::operator() const(void)::{lambda(BOOL)#1},std::allocator<QMITransportService::tearDown(void)::$_0::operator() const(void)::{lambda(BOOL)#1}>,void ()(BOOL)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1F20FF8C0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = *(NSObject **)(a1 + 32);
  *(void *)(a2 + 32) = v5;
  if (v5)
  {
    dispatch_retain(v5);
    uint64_t v6 = *(NSObject **)(a2 + 32);
    if (v6) {
      dispatch_group_enter(v6);
    }
  }
  *(void *)(a2 + 40) = *(void *)(a1 + 40);
}

void std::__function::__func<QMITransportService::tearDown(void)::$_0::operator() const(void)::{lambda(BOOL)#1},std::allocator<QMITransportService::tearDown(void)::$_0::operator() const(void)::{lambda(BOOL)#1}>,void ()(BOOL)>::destroy(uint64_t a1)
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
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 24);
  if (v4)
  {
    std::__shared_weak_count::__release_weak(v4);
  }
}

void std::__function::__func<QMITransportService::tearDown(void)::$_0::operator() const(void)::{lambda(BOOL)#1},std::allocator<QMITransportService::tearDown(void)::$_0::operator() const(void)::{lambda(BOOL)#1}>,void ()(BOOL)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = __p[4];
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = __p[4];
    if (v3) {
      dispatch_release(v3);
    }
  }
  uint64_t v4 = (std::__shared_weak_count *)__p[3];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(__p);
}

void std::__function::__func<QMITransportService::tearDown(void)::$_0::operator() const(void)::{lambda(BOOL)#1},std::allocator<QMITransportService::tearDown(void)::$_0::operator() const(void)::{lambda(BOOL)#1}>,void ()(BOOL)>::operator()(void *a1, char *a2)
{
  char v9 = *a2;
  uint64_t v3 = (std::__shared_weak_count *)a1[3];
  if (v3)
  {
    uint64_t v4 = a1[1];
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      uint64_t v6 = v5;
      if (!a1[2]) {
        goto LABEL_6;
      }
      v8[0] = a1[5];
      v8[1] = &v9;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 0x40000000;
      block[2] = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZZZNS1_8tearDownEvENK3__0clEvENKUlbE_clEbEUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
      block[3] = &__block_descriptor_tmp_152;
      void block[4] = v4 + 72;
      void block[5] = v8;
      int64x2_t v7 = *(NSObject **)(v4 + 88);
      if (*(void *)(v4 + 96))
      {
        dispatch_async_and_wait(v7, block);
LABEL_6:
        if (atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
          return;
        }
LABEL_9:
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
        return;
      }
      dispatch_sync(v7, block);
      if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_9;
      }
    }
  }
}

uint64_t std::__function::__func<QMITransportService::tearDown(void)::$_0::operator() const(void)::{lambda(BOOL)#1},std::allocator<QMITransportService::tearDown(void)::$_0::operator() const(void)::{lambda(BOOL)#1}>,void ()(BOOL)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZZN19QMITransportService8tearDownEvENK3$_0clEvEUlbE_") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"ZZN19QMITransportService8tearDownEvENK3$_0clEvEUlbE_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZZN19QMITransportService8tearDownEvENK3$_0clEvEUlbE_")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN19QMITransportService8tearDownEvENK3$_0clEvEUlbE_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<QMITransportService::tearDown(void)::$_0::operator() const(void)::{lambda(BOOL)#1},std::allocator<QMITransportService::tearDown(void)::$_0::operator() const(void)::{lambda(BOOL)#1}>,void ()(BOOL)>::target_type()
{
}

uint64_t ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZZZNS1_8tearDownEvENK3__0clEvENKUlbE_clEbEUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke(uint64_t result)
{
  ***(unsigned char ***)(result + 40) = **(unsigned char **)(*(void *)(result + 40) + 8);
  return result;
}

void ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZNS1_8tearDownEvE3__1EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS5__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(v1 + 16);
  unint64_t v3 = *(unsigned char **)v1;
  if (**(unsigned char **)v1)
  {
    int v4 = **(unsigned __int8 **)(v1 + 8);
    unsigned char *v3 = v4 ^ 1;
    if (!v4)
    {
      uint64_t v5 = *(NSObject **)(v2 + 40);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1C5767000, v5, OS_LOG_TYPE_DEFAULT, "#I ----------------- Offline ----------------", (uint8_t *)&v8, 2u);
      }
      return;
    }
  }
  else
  {
    unsigned char *v3 = 0;
  }
  uint64_t v6 = *(NSObject **)(v2 + 40);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int64x2_t v7 = *(uint64_t **)(v1 + 24);
    if (*((char *)v7 + 23) < 0) {
      int64x2_t v7 = (uint64_t *)*v7;
    }
    int v8 = 136315138;
    char v9 = v7;
    _os_log_error_impl(&dword_1C5767000, v6, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v8, 0xCu);
  }
}

void *_ZNSt3__110__function6__funcIZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_E3__7NS_9allocatorIS5_EEFvbEED1Ev(void *a1)
{
  *a1 = &unk_1F20FF940;
  uint64_t v2 = a1[5];
  if (v2) {
    dispatch_release(v2);
  }
  unint64_t v3 = a1[4];
  if (v3)
  {
    dispatch_group_leave(v3);
    int v4 = a1[4];
    if (v4) {
      dispatch_release(v4);
    }
  }
  uint64_t v5 = (std::__shared_weak_count *)a1[3];
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  return a1;
}

void _ZNSt3__110__function6__funcIZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_E3__7NS_9allocatorIS5_EEFvbEED0Ev(void *__p)
{
  *std::string __p = &unk_1F20FF940;
  uint64_t v2 = __p[5];
  if (v2) {
    dispatch_release(v2);
  }
  unint64_t v3 = __p[4];
  if (v3)
  {
    dispatch_group_leave(v3);
    int v4 = __p[4];
    if (v4) {
      dispatch_release(v4);
    }
  }
  uint64_t v5 = (std::__shared_weak_count *)__p[3];
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }

  operator delete(__p);
}

char *_ZNKSt3__110__function6__funcIZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_E3__7NS_9allocatorIS5_EEFvbEE7__cloneEv(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x30uLL);
  *(void *)uint64_t v2 = &unk_1F20FF940;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)v2 + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  int v4 = *(NSObject **)(a1 + 32);
  *((void *)v2 + 4) = v4;
  if (v4)
  {
    dispatch_retain(v4);
    uint64_t v5 = *((void *)v2 + 4);
    if (v5) {
      dispatch_group_enter(v5);
    }
  }
  uint64_t v6 = *(NSObject **)(a1 + 40);
  *((void *)v2 + 5) = v6;
  if (v6) {
    dispatch_retain(v6);
  }
  return v2;
}

void _ZNKSt3__110__function6__funcIZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_E3__7NS_9allocatorIS5_EEFvbEE7__cloneEPNS0_6__baseIS8_EE(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1F20FF940;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = *(NSObject **)(a1 + 32);
  *(void *)(a2 + 32) = v5;
  if (v5)
  {
    dispatch_retain(v5);
    uint64_t v6 = *(NSObject **)(a2 + 32);
    if (v6) {
      dispatch_group_enter(v6);
    }
  }
  int64x2_t v7 = *(NSObject **)(a1 + 40);
  *(void *)(a2 + 40) = v7;
  if (v7)
  {
    dispatch_retain(v7);
  }
}

void _ZNSt3__110__function6__funcIZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_E3__7NS_9allocatorIS5_EEFvbEE7destroyEv(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[4];
  if (v3)
  {
    dispatch_group_leave(v3);
    uint64_t v4 = a1[4];
    if (v4) {
      dispatch_release(v4);
    }
  }
  uint64_t v5 = (std::__shared_weak_count *)a1[3];
  if (v5)
  {
    std::__shared_weak_count::__release_weak(v5);
  }
}

void _ZNSt3__110__function6__funcIZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_E3__7NS_9allocatorIS5_EEFvbEE18destroy_deallocateEv(void *__p)
{
  uint64_t v2 = __p[5];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = __p[4];
  if (v3)
  {
    dispatch_group_leave(v3);
    uint64_t v4 = __p[4];
    if (v4) {
      dispatch_release(v4);
    }
  }
  uint64_t v5 = (std::__shared_weak_count *)__p[3];
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }

  operator delete(__p);
}

void _ZNSt3__110__function6__funcIZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_E3__7NS_9allocatorIS5_EEFvbEEclEOb(void *a1, char *a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a1[3];
  if (v3)
  {
    char v4 = *a2;
    uint64_t v5 = a1[1];
    uint64_t v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      int64x2_t v7 = v6;
      if (!a1[2])
      {
LABEL_16:
        if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
        return;
      }
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 1174405120;
      v12[2] = ___ZZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_ENK3__7clEb_block_invoke;
      v12[3] = &__block_descriptor_tmp_167;
      char v15 = v4;
      int v8 = a1[5];
      v12[4] = v5;
      dispatch_object_t object = v8;
      if (v8) {
        dispatch_retain(v8);
      }
      char v9 = a1[4];
      dispatch_group_t group = v9;
      if (v9)
      {
        dispatch_retain(v9);
        dispatch_group_enter(group);
      }
      uint64_t v16 = v12;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 0x40000000;
      block[2] = ___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
      block[3] = &__block_descriptor_tmp_112_0;
      void block[4] = v5 + 72;
      void block[5] = &v16;
      uint64_t v10 = *(NSObject **)(v5 + 88);
      if (*(void *)(v5 + 96))
      {
        dispatch_async_and_wait(v10, block);
        uint64_t v11 = group;
        if (!group)
        {
LABEL_14:
          if (object) {
            dispatch_release(object);
          }
          goto LABEL_16;
        }
      }
      else
      {
        dispatch_sync(v10, block);
        uint64_t v11 = group;
        if (!group) {
          goto LABEL_14;
        }
      }
      dispatch_group_leave(v11);
      if (group) {
        dispatch_release(group);
      }
      goto LABEL_14;
    }
  }
}

uint64_t _ZNKSt3__110__function6__funcIZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_E3__7NS_9allocatorIS5_EEFvbEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_E3$_7") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"ZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_E3$_7" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_E3$_7")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_E3$_7" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_E3__7NS_9allocatorIS5_EEFvbEE11target_typeEv()
{
  return &_ZTIZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_E3__7;
}

void ___ZZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_ENK3__7clEb_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 56))
  {
    unint64_t v3 = *(void **)(v1 + 240);
    char v4 = (void *)(v1 + 248);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 1174405120;
    std::string::size_type v28 = ___ZZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_ENK3__7clEb_block_invoke_2;
    unint64_t v29 = &__block_descriptor_tmp_156;
    uint64_t v5 = *(NSObject **)(a1 + 40);
    uint64_t v30 = v1;
    dispatch_object_t v31 = v5;
    if (v5) {
      dispatch_retain(v5);
    }
    if (v3 != v4)
    {
      do
      {
        v28((uint64_t)v27, (QMux *)(v3 + 4));
        char v9 = (void *)v3[1];
        if (v9)
        {
          do
          {
            uint64_t v10 = v9;
            char v9 = (void *)*v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            uint64_t v10 = (void *)v3[2];
            BOOL v11 = *v10 == (void)v3;
            unint64_t v3 = v10;
          }
          while (!v11);
        }
        unint64_t v3 = v10;
      }
      while (v10 != v4);
    }
    int64x2_t v7 = *(NSObject **)(a1 + 40);
    uint64_t v6 = *(NSObject **)(a1 + 48);
    int v8 = *(NSObject **)(v1 + 88);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 1174405120;
    block[2] = ___ZZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_ENK3__7clEb_block_invoke_157;
    block[3] = &__block_descriptor_tmp_162;
    void block[4] = v1;
    dispatch_group_t group = v6;
    if (v6)
    {
      dispatch_retain(v6);
      dispatch_group_enter(group);
    }
    dispatch_group_notify(v7, v8, block);
    if (group)
    {
      dispatch_group_leave(group);
      if (group) {
        dispatch_release(group);
      }
    }
    if (v31) {
      dispatch_release(v31);
    }
  }
  else
  {
    uint64_t v12 = *(NSObject **)(v1 + 40);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C5767000, v12, OS_LOG_TYPE_ERROR, "----------------- Exit Low Power Failure ----------------", buf, 2u);
    }
    *(void *)buf = 0;
    size_t v22 = buf;
    uint64_t v23 = 0x2000000000;
    char v24 = 0;
    uint64_t v13 = *(void **)(v1 + 240);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 0x40000000;
    xpc_object_t v17 = ___ZZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_ENK3__7clEb_block_invoke_163;
    xpc_object_t v18 = &unk_1E65186B0;
    xpc_object_t v19 = buf;
    uint64_t v20 = v1;
    if (v13 == (void *)(v1 + 248)) {
      goto LABEL_31;
    }
    do
    {
      v17((uint64_t)v16, (QMux *)(v13 + 4));
      char v14 = (void *)v13[1];
      if (v14)
      {
        do
        {
          char v15 = v14;
          char v14 = (void *)*v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          char v15 = (void *)v13[2];
          BOOL v11 = *v15 == (void)v13;
          uint64_t v13 = v15;
        }
        while (!v11);
      }
      uint64_t v13 = v15;
    }
    while (v15 != (void *)(v1 + 248));
    if (!v22[24]) {
LABEL_31:
    }
      (*(void (**)(void, const char *, uint64_t))(**(void **)(v1 + 128) + 16))(*(void *)(v1 + 128), "Exit Low Power Failure", 1);
    _Block_object_dispose(buf, 8);
  }
}

void sub_1C595D3E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C595D400(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(NSObject **)(v1 - 72);
  if (!v3) {
    _Unwind_Resume(exception_object);
  }
  dispatch_release(v3);
  _Unwind_Resume(exception_object);
}

uint64_t ___ZZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_ENK3__7clEb_block_invoke_2(uint64_t a1, QMux *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    QMux::getName((uint64_t *)__p, a2);
    if (v7 >= 0) {
      char v4 = __p;
    }
    else {
      char v4 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315394;
    char v9 = "operator()_block_invoke_2";
    __int16 v10 = 2080;
    BOOL v11 = v4;
    _os_log_impl(&dword_1C5767000, v3, OS_LOG_TYPE_DEFAULT, "#I %s: Power up %s", buf, 0x16u);
    if (v7 < 0) {
      operator delete(__p[0]);
    }
  }
  return QMux::enterPowerMode();
}

void ___ZZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_ENK3__7clEb_block_invoke_157(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(QMITransportService **)(a1 + 32);
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2000000000;
  uint64_t v16 = 0;
  uint64_t v2 = (void *)*((void *)v1 + 30);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 0x40000000;
  __int16 v10 = ___ZZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_ENK3__7clEb_block_invoke_2_158;
  BOOL v11 = &unk_1E6518688;
  uint64_t v12 = &v13;
  if (v2 != (void *)((char *)v1 + 248))
  {
    do
    {
      v10((uint64_t)v9, (QMux *)(v2 + 4));
      uint64_t v6 = (void *)v2[1];
      if (v6)
      {
        do
        {
          char v7 = v6;
          uint64_t v6 = (void *)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          char v7 = (void *)v2[2];
          BOOL v8 = *v7 == (void)v2;
          uint64_t v2 = v7;
        }
        while (!v8);
      }
      uint64_t v2 = v7;
    }
    while (v7 != (void *)((char *)v1 + 248));
  }
  unint64_t v3 = *((void *)v1 + 5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v14[3];
    uint64_t v5 = *((void *)v1 + 32);
    *(_DWORD *)buf = 134218240;
    uint64_t v18 = v4;
    __int16 v19 = 2048;
    uint64_t v20 = v5;
    _os_log_impl(&dword_1C5767000, v3, OS_LOG_TYPE_DEFAULT, "#I QMux exited low-power: %zd of %zd QMux's", buf, 0x16u);
    unint64_t v3 = *((void *)v1 + 5);
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C5767000, v3, OS_LOG_TYPE_DEFAULT, "#I ----------------- Awake ----------------", buf, 2u);
  }
  QMITransportService::reportPowerDownMessages_sync(v1);
  _Block_object_dispose(&v13, 8);
}

void sub_1C595D6EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C595D704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_ENK3__7clEb_block_invoke_2_158(uint64_t a1, QMux *this)
{
  uint64_t result = QMux::isPoweredDown(this);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result ^ 1;
  return result;
}

void ___ZZZN19QMITransportService12exitLowPowerEN8dispatch13group_sessionEEUb1_ENK3__7clEb_block_invoke_163(uint64_t a1, QMux *this)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 40);
  if (QMux::isRunning(this))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    QMux::getName((uint64_t *)&v11, this);
    uint64_t v5 = std::string::append(&v11, " failed to power down", 0x15uLL);
    long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    int64_t v10 = v5->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v6;
    v5->__r_.__value_.__l.__size_ = 0;
    v5->__r_.__value_.__r.__words[2] = 0;
    v5->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v11.__r_.__value_.__l.__data_);
    }
    char v7 = *(NSObject **)(v4 + 40);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = __p;
      if (v10 < 0) {
        BOOL v8 = (void **)__p[0];
      }
      LODWORD(v11.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)v11.__r_.__value_.__r.__words + 4) = (std::string::size_type)v8;
      _os_log_error_impl(&dword_1C5767000, v7, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v11, 0xCu);
    }
    QMux::invokeReset();
    if (SHIBYTE(v10) < 0) {
      operator delete(__p[0]);
    }
  }
}

void sub_1C595D8A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a14 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_e8_40c21_ZTSN8dispatch5groupE48c30_ZTSN8dispatch13group_sessionE(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 40) = v4;
  if (v4) {
    dispatch_retain(v4);
  }
  uint64_t v5 = *(NSObject **)(a2 + 48);
  *(void *)(a1 + 48) = v5;
  if (v5)
  {
    dispatch_retain(v5);
    long long v6 = *(NSObject **)(a1 + 48);
    if (v6)
    {
      dispatch_group_enter(v6);
    }
  }
}

void __destroy_helper_block_e8_40c21_ZTSN8dispatch5groupE48c30_ZTSN8dispatch13group_sessionE(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 48);
  if (v2)
  {
    dispatch_group_leave(v2);
    unint64_t v3 = *(NSObject **)(a1 + 48);
    if (v3) {
      dispatch_release(v3);
    }
  }
  uint64_t v4 = *(NSObject **)(a1 + 40);
  if (v4)
  {
    dispatch_release(v4);
  }
}

void ___ZNK8dispatch8callbackIU13block_pointerFv10WakeReasonEEclIJS1_EEEvDpT__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(a1 + 40);
  unint64_t v3 = *(void **)(a1 + 48);
  int v4 = v2;
  xpc_object_t object = v3;
  if (v3) {
    xpc_retain(v3);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  (*(void (**)(uint64_t, int *))(v1 + 16))(v1, &v4);
  xpc_release(object);
}

void sub_1C595DA18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

xpc_object_t __copy_helper_block_e8_32c54_ZTSN8dispatch5blockIU13block_pointerFv10WakeReasonEEE40c16_ZTS10WakeReason(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)(a2 + 32);
  if (v4) {
    int v4 = _Block_copy(v4);
  }
  *(void *)(a1 + 32) = v4;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  uint64_t v5 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v5;
  if (v5) {
    return xpc_retain(v5);
  }
  xpc_object_t result = xpc_null_create();
  *(void *)(a1 + 48) = result;
  return result;
}

void __destroy_helper_block_e8_32c54_ZTSN8dispatch5blockIU13block_pointerFv10WakeReasonEEE40c16_ZTS10WakeReason(uint64_t a1)
{
  xpc_release(*(xpc_object_t *)(a1 + 48));
  *(void *)(a1 + 48) = 0;
  int v2 = *(const void **)(a1 + 32);
  if (v2) {
    _Block_release(v2);
  }
}

uint64_t __cxx_global_var_init_37_0()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<CommandDriverFactory>::~PthreadMutexGuardPolicy, &ctu::Singleton<CommandDriverFactory,CommandDriverFactory,ctu::PthreadMutexGuardPolicy<CommandDriverFactory>>::sInstance, &dword_1C5767000);
  }
  return result;
}

uint64_t _GLOBAL__sub_I_QMITransportService_cpp()
{
  _ATCSException::setExceptionHandler();
  qmi::MessageBase::setParsingErrorHandler((qmi::MessageBase *)QMIParserErrorToABMAssert, v0);

  return MEMORY[0x1F417CFB8](QMIWriteErrorToABMAssert);
}

void util::strip_non_printable(std::string *this)
{
  uint64_t v1 = this;
  std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) == 0) {
    unint64_t v3 = this;
  }
  else {
    unint64_t v3 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  if ((size & 0x80u) != 0) {
    std::string::size_type size = this->__r_.__value_.__l.__size_;
  }
  if (size)
  {
    int v4 = (std::string *)((char *)v3 + size);
    std::string::size_type v5 = size - 1;
    uint64_t v6 = MEMORY[0x1E4F14390];
    while (1)
    {
      unsigned int v7 = v3->__r_.__value_.__s.__data_[0];
      if ((v7 & 0x80000000) != 0) {
        break;
      }
      int v8 = *(_DWORD *)(v6 + 4 * v7 + 60);
      if ((v8 & 0x40000) == 0 || (v8 & 0x4000) != 0) {
        goto LABEL_15;
      }
LABEL_8:
      unint64_t v3 = (std::string *)((char *)v3 + 1);
      --v5;
      if (v3 == v4) {
        goto LABEL_28;
      }
    }
    if (__maskrune(v3->__r_.__value_.__s.__data_[0], 0x40000uLL) && !__maskrune(v7, 0x4000uLL)) {
      goto LABEL_8;
    }
LABEL_15:
    if (v3 != v4 && (std::string *)((char *)&v3->__r_.__value_.__l.__data_ + 1) != v4)
    {
      uint64_t v9 = 1;
      int v4 = v3;
      while (1)
      {
        unsigned int v10 = v3->__r_.__value_.__s.__data_[v9];
        if ((v10 & 0x80000000) != 0)
        {
          if (!__maskrune(v3->__r_.__value_.__s.__data_[v9], 0x40000uLL) || __maskrune(v10, 0x4000uLL)) {
            goto LABEL_19;
          }
        }
        else
        {
          int v11 = *(_DWORD *)(v6 + 4 * v10 + 60);
          if ((v11 & 0x40000) == 0 || (v11 & 0x4000) != 0) {
            goto LABEL_19;
          }
        }
        v4->__r_.__value_.__s.__data_[0] = v3->__r_.__value_.__s.__data_[v9];
        int v4 = (std::string *)((char *)v4 + 1);
LABEL_19:
        ++v9;
        if (!--v5) {
          goto LABEL_28;
        }
      }
    }
  }
  int v4 = v3;
LABEL_28:
  std::string::size_type v12 = HIBYTE(v1->__r_.__value_.__r.__words[2]);
  int v13 = (char)v12;
  char v14 = (std::string *)v1->__r_.__value_.__r.__words[0];
  uint64_t v15 = (char *)(v1->__r_.__value_.__r.__words[0] + v1->__r_.__value_.__l.__size_);
  if ((v12 & 0x80u) != 0)
  {
    std::string::size_type v16 = v1->__r_.__value_.__r.__words[0];
  }
  else
  {
    uint64_t v15 = (char *)v1 + v12;
    std::string::size_type v16 = (std::string::size_type)v1;
  }
  if ((v12 & 0x80u) != 0) {
    std::string::size_type v12 = v1->__r_.__value_.__l.__size_;
  }
  std::string::size_type v17 = (std::string::size_type)v4 - v16;
  if (v12 < (unint64_t)v4 - v16) {
    std::string::__throw_out_of_range[abi:ne180100]();
  }
  if (v15 - (char *)v4 == -1)
  {
    if (v13 < 0)
    {
      v1->__r_.__value_.__l.__size_ = v17;
      uint64_t v1 = v14;
    }
    else
    {
      *((unsigned char *)&v1->__r_.__value_.__s + 23) = v17 & 0x7F;
    }
    v1->__r_.__value_.__s.__data_[v17] = 0;
  }
  else
  {
    std::string::__erase_external_with_move(v1, v17, v15 - (char *)v4);
  }
}

uint64_t util::convert_garbage(uint64_t result)
{
  int v1 = *(char *)(result + 23);
  if (v1 >= 0) {
    int v2 = (unsigned char *)result;
  }
  else {
    int v2 = *(unsigned char **)result;
  }
  if (v1 >= 0) {
    uint64_t v3 = *(unsigned __int8 *)(result + 23);
  }
  else {
    uint64_t v3 = *(void *)(result + 8);
  }
  if (v3)
  {
    uint64_t v4 = MEMORY[0x1E4F14390];
    do
    {
      unsigned int v5 = (char)*v2;
      if ((v5 & 0x80000000) != 0)
      {
        uint64_t result = __maskrune((char)*v2, 0x40000uLL);
        if (result) {
          goto LABEL_10;
        }
        uint64_t result = __maskrune(v5, 0x4000uLL);
        if (result) {
          goto LABEL_10;
        }
      }
      else
      {
        int v6 = *(_DWORD *)(v4 + 4 * v5 + 60);
        if ((v6 & 0x40000) != 0) {
          goto LABEL_10;
        }
        uint64_t result = v6 & 0x4000;
        if ((v6 & 0x4000) != 0) {
          goto LABEL_10;
        }
      }
      unsigned char *v2 = 32;
LABEL_10:
      ++v2;
      --v3;
    }
    while (v3);
  }
  return result;
}

void util::strip_pattern(char *a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  memset(a3, 170, sizeof(std::string));
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(a3, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a3->__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
  }
  int v5 = a1[23];
  int v6 = SHIBYTE(a3->__r_.__value_.__r.__words[2]);
  unsigned int v7 = (std::string *)a3->__r_.__value_.__r.__words[0];
  if (v6 >= 0) {
    int v8 = a3;
  }
  else {
    int v8 = (std::string *)a3->__r_.__value_.__r.__words[0];
  }
  if (v5 >= 0) {
    int64_t v9 = a1[23];
  }
  else {
    int64_t v9 = *((void *)a1 + 1);
  }
  std::string::size_type v10 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
  if (v5 >= 0) {
    int v11 = a1;
  }
  else {
    int v11 = *(char **)a1;
  }
  if (!v9)
  {
    std::string::size_type v13 = 0;
    goto LABEL_20;
  }
  if (v6 >= 0) {
    uint64_t size = HIBYTE(a3->__r_.__value_.__r.__words[2]);
  }
  else {
    uint64_t size = a3->__r_.__value_.__l.__size_;
  }
  if (size >= v9)
  {
    size_t v27 = (char *)v8 + size;
    int v28 = *v11;
    unint64_t v29 = v8;
    do
    {
      uint64_t v30 = size - v9;
      if (v30 == -1) {
        break;
      }
      dispatch_object_t v31 = (char *)memchr(v29, v28, v30 + 1);
      if (!v31) {
        break;
      }
      uint64_t v32 = v31;
      if (!memcmp(v31, v11, v9))
      {
        if (v32 != v27)
        {
          std::string::size_type v13 = v32 - (char *)v8;
          if (v32 - (char *)v8 != -1)
          {
            if (v9 == -1)
            {
              while (1)
              {
                std::string::size_type v33 = a3->__r_.__value_.__l.__size_;
                if ((v10 & 0x80u) == 0) {
                  std::string::size_type v33 = v10;
                }
                if (v33 < v13) {
                  break;
                }
                if ((char)v10 < 0)
                {
                  a3->__r_.__value_.__l.__size_ = v13;
                }
                else
                {
                  *((unsigned char *)&a3->__r_.__value_.__s + 23) = v13 & 0x7F;
                  unsigned int v7 = a3;
                }
                v7->__r_.__value_.__s.__data_[v13] = 0;
                int v34 = SHIBYTE(a3->__r_.__value_.__r.__words[2]);
                std::string::size_type v10 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
                unsigned int v7 = (std::string *)a3->__r_.__value_.__r.__words[0];
                if (v34 >= 0) {
                  size_t v35 = a3;
                }
                else {
                  size_t v35 = (std::string *)a3->__r_.__value_.__r.__words[0];
                }
                int v36 = a1[23];
                if (v36 >= 0) {
                  int v37 = a1;
                }
                else {
                  int v37 = *(char **)a1;
                }
                if (v36 >= 0) {
                  int64_t v38 = a1[23];
                }
                else {
                  int64_t v38 = *((void *)a1 + 1);
                }
                if (v38)
                {
                  if (v34 >= 0) {
                    int64_t v39 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
                  }
                  else {
                    int64_t v39 = a3->__r_.__value_.__l.__size_;
                  }
                  if (v39 < v38) {
                    return;
                  }
                  uint64_t v40 = (char *)v35 + v39;
                  int v41 = *v37;
                  std::string::size_type v42 = v35;
                  while (1)
                  {
                    int64_t v43 = v39 - v38;
                    if (v43 == -1) {
                      return;
                    }
                    long long v44 = (char *)memchr(v42, v41, v43 + 1);
                    if (!v44) {
                      return;
                    }
                    int v45 = v44;
                    if (!memcmp(v44, v37, v38)) {
                      break;
                    }
                    std::string::size_type v42 = (std::string *)(v45 + 1);
                    int64_t v39 = v40 - (v45 + 1);
                    if (v39 < v38) {
                      return;
                    }
                  }
                  if (v45 == v40) {
                    return;
                  }
                  std::string::size_type v13 = v45 - (char *)v35;
                  if (v45 - (char *)v35 == -1) {
                    return;
                  }
                }
                else
                {
                  std::string::size_type v13 = 0;
                }
              }
            }
            else
            {
LABEL_20:
              while (1)
              {
                std::string::size_type v14 = (v10 & 0x80u) == 0 ? v10 : a3->__r_.__value_.__l.__size_;
                if (v14 < v13) {
                  break;
                }
                std::string::__erase_external_with_move(a3, v13, v9);
                int v15 = SHIBYTE(a3->__r_.__value_.__r.__words[2]);
                std::string::size_type v10 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
                if (v15 >= 0) {
                  std::string::size_type v16 = a3;
                }
                else {
                  std::string::size_type v16 = (std::string *)a3->__r_.__value_.__r.__words[0];
                }
                int v17 = a1[23];
                if (v17 >= 0) {
                  uint64_t v18 = a1;
                }
                else {
                  uint64_t v18 = *(char **)a1;
                }
                if (v17 >= 0) {
                  int64_t v19 = a1[23];
                }
                else {
                  int64_t v19 = *((void *)a1 + 1);
                }
                if (v19)
                {
                  if (v15 >= 0) {
                    int64_t v20 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
                  }
                  else {
                    int64_t v20 = a3->__r_.__value_.__l.__size_;
                  }
                  if (v20 < v19) {
                    return;
                  }
                  uint64_t v21 = (char *)v16 + v20;
                  int v22 = *v18;
                  uint64_t v23 = v16;
                  while (1)
                  {
                    int64_t v24 = v20 - v19;
                    if (v24 == -1) {
                      return;
                    }
                    uint64_t v25 = (char *)memchr(v23, v22, v24 + 1);
                    if (!v25) {
                      return;
                    }
                    size_t v26 = v25;
                    if (!memcmp(v25, v18, v19)) {
                      break;
                    }
                    uint64_t v23 = (std::string *)(v26 + 1);
                    int64_t v20 = v21 - (v26 + 1);
                    if (v20 < v19) {
                      return;
                    }
                  }
                  if (v26 == v21) {
                    return;
                  }
                  std::string::size_type v13 = v26 - (char *)v16;
                  if (v26 - (char *)v16 == -1) {
                    return;
                  }
                }
                else
                {
                  std::string::size_type v13 = 0;
                }
              }
            }
            std::string::__throw_out_of_range[abi:ne180100]();
          }
        }
        return;
      }
      unint64_t v29 = (std::string *)(v32 + 1);
      uint64_t size = v27 - (v32 + 1);
    }
    while (size >= v9);
  }
}

void sub_1C595E0E4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *util::strip_leading_trailing@<X0>(void *result@<X0>, void **a2@<X1>, void *a3@<X8>)
{
  unint64_t v4 = *((unsigned __int8 *)result + 23);
  int v5 = (void *)*result;
  unint64_t v6 = result[1];
  if ((v4 & 0x80u) == 0) {
    unsigned int v7 = result;
  }
  else {
    unsigned int v7 = (void *)*result;
  }
  if ((v4 & 0x80u) == 0) {
    uint64_t v8 = *((unsigned __int8 *)result + 23);
  }
  else {
    uint64_t v8 = result[1];
  }
  int v9 = *((char *)a2 + 23);
  if (v9 >= 0) {
    std::string::size_type v10 = a2;
  }
  else {
    std::string::size_type v10 = *a2;
  }
  if (v9 >= 0) {
    size_t v11 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v11 = (size_t)a2[1];
  }
  if (!v8) {
    goto LABEL_26;
  }
  std::string::size_type v12 = result;
  unint64_t v13 = 0;
  if (!v11)
  {
    uint64_t v14 = v8 - 1;
    if ((v4 & 0x80) == 0) {
      goto LABEL_28;
    }
    goto LABEL_24;
  }
  while (1)
  {
    uint64_t result = memchr(v10, *((char *)v7 + v13), v11);
    if (!result) {
      break;
    }
    if (v8 == ++v13) {
      goto LABEL_26;
    }
  }
  if (v13 == -1)
  {
LABEL_26:
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
    return result;
  }
  do
  {
    if (!v8)
    {
      uint64_t v14 = -1;
      if ((v4 & 0x80) == 0) {
        goto LABEL_28;
      }
LABEL_24:
      if (v6 >= v13)
      {
        unint64_t v4 = v6;
        std::string::size_type v12 = v5;
        goto LABEL_29;
      }
LABEL_41:
      std::string::__throw_out_of_range[abi:ne180100]();
    }
    uint64_t result = memchr(v10, *((char *)v7 + --v8), v11);
  }
  while (result);
  uint64_t v14 = v8;
  if ((v4 & 0x80) != 0) {
    goto LABEL_24;
  }
LABEL_28:
  if (v13 > v4) {
    goto LABEL_41;
  }
LABEL_29:
  unint64_t v15 = v14 - v13 + 1;
  if (v4 - v13 >= v15) {
    size_t v16 = v15;
  }
  else {
    size_t v16 = v4 - v13;
  }
  if (v16 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v16 >= 0x17)
  {
    uint64_t v17 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v17 = v16 | 7;
    }
    uint64_t v18 = v17 + 1;
    int64_t v19 = operator new(v17 + 1);
    a3[1] = v16;
    a3[2] = v18 | 0x8000000000000000;
    *a3 = v19;
    a3 = v19;
    goto LABEL_39;
  }
  *((unsigned char *)a3 + 23) = v16;
  if (v16) {
LABEL_39:
  }
    uint64_t result = memmove(a3, (char *)v12 + v13, v16);
  *((unsigned char *)a3 + v16) = 0;
  return result;
}

uint64_t util::to_upper(uint64_t result)
{
  uint64_t v1 = *(unsigned __int8 *)(result + 23);
  int v2 = (char)v1;
  uint64_t v3 = (unsigned char *)(result + v1);
  if (v2 >= 0) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = (unsigned char *)(*(void *)result + *(void *)(result + 8));
  }
  if (v2 >= 0) {
    int v5 = (unsigned char *)result;
  }
  else {
    int v5 = *(unsigned char **)result;
  }
  for (; v5 != v4; ++v5)
  {
    uint64_t result = __toupper((char)*v5);
    unsigned char *v5 = result;
  }
  return result;
}

BOOL util::equal_nocase(const char *a1, const char *a2)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  return strcasecmp(a1, a2) == 0;
}

void util::strip_non_alpha(std::string *a1)
{
  std::string::size_type size = HIBYTE(a1->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) == 0) {
    uint64_t v3 = (char *)a1;
  }
  else {
    uint64_t v3 = (char *)a1->__r_.__value_.__r.__words[0];
  }
  if ((size & 0x80u) != 0) {
    std::string::size_type size = a1->__r_.__value_.__l.__size_;
  }
  if (!size) {
    goto LABEL_21;
  }
  unint64_t v4 = &v3[size];
  std::string::size_type v5 = size - 1;
  uint64_t v6 = MEMORY[0x1E4F14390];
  while (1)
  {
    unsigned int v7 = *v3;
    if ((v7 & 0x80000000) != 0)
    {
      if (!__maskrune(v7, 0x100uLL)) {
        break;
      }
      goto LABEL_9;
    }
    if ((*(_DWORD *)(v6 + 4 * v7 + 60) & 0x100) == 0) {
      break;
    }
LABEL_9:
    ++v3;
    --v5;
    if (v3 == v4) {
      goto LABEL_22;
    }
  }
  if (v3 != v4 && v3 + 1 != v4)
  {
    uint64_t v8 = 1;
    unint64_t v4 = v3;
    while (1)
    {
      unsigned int v9 = v3[v8];
      if ((v9 & 0x80000000) == 0) {
        break;
      }
      if (__maskrune(v9, 0x100uLL)) {
        goto LABEL_16;
      }
LABEL_17:
      ++v8;
      if (!--v5) {
        goto LABEL_22;
      }
    }
    if ((*(_DWORD *)(v6 + 4 * v9 + 60) & 0x100) == 0) {
      goto LABEL_17;
    }
LABEL_16:
    *v4++ = v3[v8];
    goto LABEL_17;
  }
LABEL_21:
  unint64_t v4 = v3;
LABEL_22:
  unint64_t v10 = HIBYTE(a1->__r_.__value_.__r.__words[2]);
  int v11 = (char)v10;
  std::string::size_type v12 = a1->__r_.__value_.__r.__words[0];
  unint64_t v13 = (char *)(a1->__r_.__value_.__r.__words[0] + a1->__r_.__value_.__l.__size_);
  if ((v10 & 0x80u) != 0)
  {
    uint64_t v14 = (std::string *)a1->__r_.__value_.__r.__words[0];
  }
  else
  {
    unint64_t v13 = (char *)a1 + v10;
    uint64_t v14 = a1;
  }
  if ((v10 & 0x80u) != 0) {
    unint64_t v10 = a1->__r_.__value_.__l.__size_;
  }
  std::string::size_type v15 = v4 - (char *)v14;
  if (v10 < v4 - (char *)v14) {
    std::string::__throw_out_of_range[abi:ne180100]();
  }
  if (v13 - v4 == -1)
  {
    if (v11 < 0)
    {
      a1->__r_.__value_.__l.__size_ = v15;
      *(unsigned char *)(v12 + v15) = 0;
    }
    else
    {
      *((unsigned char *)&a1->__r_.__value_.__s + 23) = v15 & 0x7F;
      a1->__r_.__value_.__s.__data_[v15] = 0;
    }
  }
  else
  {
    std::string::__erase_external_with_move(a1, v15, v13 - v4);
  }
}

void util::readPlistToCFDictionary(uint64_t a1@<X0>, void *a2@<X8>)
{
  int v2 = (const char *)a1;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (*(char *)(a1 + 23) < 0) {
    int v2 = *(const char **)a1;
  }
  std::string::size_type v5 = (__CFError *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v2, 0x8000100u);
  error[3] = v5;
  uint64_t v6 = CFURLCreateWithFileSystemPath(v4, (CFStringRef)v5, kCFURLPOSIXPathStyle, 0);
  error[2] = v6;
  *a2 = 0;
  if (v6) {
    unsigned int v7 = ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::get;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v7)
  {
    uint64_t v8 = CFReadStreamCreateWithFile(v4, v6);
    unsigned int v9 = v8;
    error[1] = v8;
    if (v8) {
      unint64_t v10 = ctu::SharedRef<__CFReadStream,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFReadStream>::get;
    }
    else {
      unint64_t v10 = 0;
    }
    if (!v10) {
      goto LABEL_16;
    }
    CFReadStreamOpen(v8);
    error[0] = 0;
    CFPropertyListRef v11 = CFPropertyListCreateWithStream(v4, v9, 0, 1uLL, 0, error);
    *a2 = v11;
    CFReadStreamClose(v9);
    if (!error[0]) {
      goto LABEL_16;
    }
    CFErrorGetDomain(error[0]);
    memset(buf, 0, sizeof(buf));
    ctu::cf::assign();
    *(_OWORD *)std::string __p = *(_OWORD *)buf;
    uint64_t v16 = *(void *)&buf[16];
    std::string::size_type v12 = GetOsLogContext()[1];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      CFIndex Code = CFErrorGetCode(error[0]);
      uint64_t v14 = __p;
      if (v16 < 0) {
        uint64_t v14 = (void **)__p[0];
      }
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = Code;
      *(_WORD *)&unsigned char buf[22] = 2080;
      int64_t v19 = v14;
      _os_log_error_impl(&dword_1C5767000, v12, OS_LOG_TYPE_ERROR, "Failed to create %@ PropertyList: %ld: %s", buf, 0x20u);
    }
    CFRelease(error[0]);
    *a2 = 0;
    if (v11) {
      CFRelease(v11);
    }
    if ((SHIBYTE(v16) & 0x80000000) == 0)
    {
LABEL_16:
      if (!v9) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    operator delete(__p[0]);
    if (v9) {
LABEL_17:
    }
      CFRelease(v9);
  }
LABEL_18:
  if (v6) {
    CFRelease(v6);
  }
  if (v5) {
    CFRelease(v5);
  }
}

void sub_1C595E710(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, char a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ctu::SharedRef<__CFReadStream,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFReadStream>::get(uint64_t a1)
{
  return *(void *)a1;
}

const void **ctu::cf::CFSharedRef<__CFReadStream>::~CFSharedRef(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::cf::CFSharedRef<__CFURL const>::~CFSharedRef(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void util::moveDirContent(std::string::size_type a1, uint64_t a2, unsigned int a3, int a4, uint64_t a5)
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v131 = 0;
  CFAllocatorRef v132 = 0;
  uint64_t v133 = 0;
  std::locale::locale(&v125, (const std::locale *)a5);
  long long v126 = *(_OWORD *)(a5 + 8);
  long long v127 = *(_OWORD *)(a5 + 24);
  uint64_t v8 = *(std::__shared_weak_count **)(a5 + 48);
  uint64_t v128 = *(void *)(a5 + 40);
  CFAllocatorRef v129 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v130 = *(void *)(a5 + 56);
  int filtered_files = ctu::fs::get_filtered_files();
  unint64_t v10 = v129;
  if (!v129 || atomic_fetch_add(&v129->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    std::locale::~locale(&v125);
    if (filtered_files) {
      goto LABEL_6;
    }
LABEL_104:
    xpc_object_t v53 = GetOsLogContext()[1];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      std::string::size_type v109 = a1;
      if (*(char *)(a1 + 23) < 0) {
        std::string::size_type v109 = *(void *)a1;
      }
      LODWORD(v139.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)v139.__r_.__value_.__r.__words + 4) = v109;
      _os_log_error_impl(&dword_1C5767000, v53, OS_LOG_TYPE_ERROR, "Failed to find a content in %s", (uint8_t *)&v139, 0xCu);
    }
    goto LABEL_105;
  }
  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
  std::__shared_weak_count::__release_weak(v10);
  std::locale::~locale(&v125);
  if (!filtered_files) {
    goto LABEL_104;
  }
LABEL_6:
  CFPropertyListRef v11 = v131;
  unint64_t v113 = (char *)v132;
  if (v131 != (char *)v132)
  {
    if (a4)
    {
      while (1)
      {
        memset(&v139, 170, sizeof(v139));
        if (v11[23] < 0)
        {
          std::string::__init_copy_ctor_external(&v139, *(const std::string::value_type **)v11, *((void *)v11 + 1));
        }
        else
        {
          long long v12 = *(_OWORD *)v11;
          v139.__r_.__value_.__r.__words[2] = *((void *)v11 + 2);
          *(_OWORD *)&v139.__r_.__value_.__l.__data_ = v12;
        }
        int v13 = *(char *)(a1 + 23);
        if (v13 >= 0) {
          size_t v14 = *(unsigned __int8 *)(a1 + 23);
        }
        else {
          size_t v14 = *(void *)(a1 + 8);
        }
        unint64_t v15 = v14 + 1;
        memset(&__p, 170, sizeof(__p));
        if (v14 + 1 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v15 >= 0x17) {
          break;
        }
        memset(&__p, 0, sizeof(__p));
        p_p = &__p;
        *((unsigned char *)&__p.__r_.__value_.__s + 23) = v14 + 1;
        if (v14) {
          goto LABEL_24;
        }
LABEL_28:
        *(_WORD *)((char *)&p_p->__r_.__value_.__l.__data_ + v14) = 47;
        if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v20 = &v139;
        }
        else {
          uint64_t v20 = (std::string *)v139.__r_.__value_.__r.__words[0];
        }
        if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(v139.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = v139.__r_.__value_.__l.__size_;
        }
        int v22 = std::string::append(&__p, (const std::string::value_type *)v20, size);
        long long v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
        v124.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v124.__r_.__value_.__l.__data_ = v23;
        v22->__r_.__value_.__l.__size_ = 0;
        v22->__r_.__value_.__r.__words[2] = 0;
        v22->__r_.__value_.__r.__words[0] = 0;
        int is_directory = ctu::fs::is_directory();
        if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v124.__r_.__value_.__l.__data_);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            goto LABEL_45;
          }
LABEL_36:
          if (is_directory) {
            goto LABEL_37;
          }
LABEL_46:
          unint64_t v29 = GetOsLogContext()[1];
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            goto LABEL_83;
          }
          int v30 = *(char *)(a1 + 23);
          if (v30 >= 0) {
            size_t v31 = *(unsigned __int8 *)(a1 + 23);
          }
          else {
            size_t v31 = *(void *)(a1 + 8);
          }
          unint64_t v32 = v31 + 1;
          memset(&__p, 170, sizeof(__p));
          if (v31 + 1 > 0x7FFFFFFFFFFFFFF7) {
            std::string::__throw_length_error[abi:ne180100]();
          }
          if (v32 >= 0x17)
          {
            int v110 = v30;
            uint64_t v45 = (v32 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v32 | 7) != 0x17) {
              uint64_t v45 = v32 | 7;
            }
            uint64_t v46 = v45 + 1;
            std::string::size_type v33 = (std::string *)operator new(v45 + 1);
            __p.__r_.__value_.__l.__size_ = v31 + 1;
            __p.__r_.__value_.__r.__words[2] = v46 | 0x8000000000000000;
            __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v33;
            int v30 = v110;
          }
          else
          {
            memset(&__p, 0, sizeof(__p));
            std::string::size_type v33 = &__p;
            *((unsigned char *)&__p.__r_.__value_.__s + 23) = v31 + 1;
            if (!v31) {
              goto LABEL_93;
            }
          }
          if (v30 >= 0) {
            size_t v47 = (const void *)a1;
          }
          else {
            size_t v47 = *(const void **)a1;
          }
          memmove(v33, v47, v31);
LABEL_93:
          *(_WORD *)((char *)&v33->__r_.__value_.__l.__data_ + v31) = 47;
          if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            size_t v48 = &v139;
          }
          else {
            size_t v48 = (std::string *)v139.__r_.__value_.__r.__words[0];
          }
          if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type v49 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v49 = v139.__r_.__value_.__l.__size_;
          }
          uint64_t v50 = std::string::append(&__p, (const std::string::value_type *)v48, v49);
          long long v51 = *(_OWORD *)&v50->__r_.__value_.__l.__data_;
          v124.__r_.__value_.__r.__words[2] = v50->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v124.__r_.__value_.__l.__data_ = v51;
          v50->__r_.__value_.__l.__size_ = 0;
          v50->__r_.__value_.__r.__words[2] = 0;
          v50->__r_.__value_.__r.__words[0] = 0;
          unint64_t v52 = &v124;
          if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            unint64_t v52 = (std::string *)v124.__r_.__value_.__r.__words[0];
          }
          LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
          *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v52;
          WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
          *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = a4;
          _os_log_error_impl(&dword_1C5767000, v29, OS_LOG_TYPE_ERROR, "%s is not a directory. So, skip to move it with the depth (%d)", (uint8_t *)&buf, 0x12u);
          if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0) {
            goto LABEL_82;
          }
LABEL_77:
          if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_83;
          }
LABEL_9:
          operator delete(__p.__r_.__value_.__l.__data_);
          if (SHIBYTE(v139.__r_.__value_.__r.__words[2]) < 0) {
            goto LABEL_84;
          }
LABEL_10:
          v11 += 24;
          if (v11 == v113) {
            goto LABEL_105;
          }
        }
        else
        {
          if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_36;
          }
LABEL_45:
          operator delete(__p.__r_.__value_.__l.__data_);
          if (!is_directory) {
            goto LABEL_46;
          }
LABEL_37:
          int v25 = *(char *)(a1 + 23);
          if (v25 >= 0) {
            size_t v26 = *(unsigned __int8 *)(a1 + 23);
          }
          else {
            size_t v26 = *(void *)(a1 + 8);
          }
          unint64_t v27 = v26 + 1;
          memset(&__p, 170, sizeof(__p));
          if (v26 + 1 > 0x7FFFFFFFFFFFFFF7) {
            std::string::__throw_length_error[abi:ne180100]();
          }
          if (v27 >= 0x17)
          {
            uint64_t v34 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v27 | 7) != 0x17) {
              uint64_t v34 = v27 | 7;
            }
            uint64_t v35 = v34 + 1;
            int v28 = (std::string *)operator new(v34 + 1);
            __p.__r_.__value_.__l.__size_ = v26 + 1;
            __p.__r_.__value_.__r.__words[2] = v35 | 0x8000000000000000;
            __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v28;
          }
          else
          {
            memset(&__p, 0, sizeof(__p));
            int v28 = &__p;
            *((unsigned char *)&__p.__r_.__value_.__s + 23) = v26 + 1;
            if (!v26) {
              goto LABEL_61;
            }
          }
          if (v25 >= 0) {
            int v36 = (const void *)a1;
          }
          else {
            int v36 = *(const void **)a1;
          }
          memmove(v28, v36, v26);
LABEL_61:
          *(_WORD *)((char *)&v28->__r_.__value_.__l.__data_ + v26) = 47;
          if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            int v37 = &v139;
          }
          else {
            int v37 = (std::string *)v139.__r_.__value_.__r.__words[0];
          }
          if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type v38 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v38 = v139.__r_.__value_.__l.__size_;
          }
          int64_t v39 = std::string::append(&__p, (const std::string::value_type *)v37, v38);
          long long v40 = *(_OWORD *)&v39->__r_.__value_.__l.__data_;
          v124.__r_.__value_.__r.__words[2] = v39->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v124.__r_.__value_.__l.__data_ = v40;
          v39->__r_.__value_.__l.__size_ = 0;
          v39->__r_.__value_.__r.__words[2] = 0;
          v39->__r_.__value_.__r.__words[0] = 0;
          int v41 = std::string::append(&v124, "/", 1uLL);
          long long v42 = *(_OWORD *)&v41->__r_.__value_.__l.__data_;
          std::string::size_type v122 = v41->__r_.__value_.__r.__words[2];
          *(_OWORD *)uint64_t v121 = v42;
          v41->__r_.__value_.__l.__size_ = 0;
          v41->__r_.__value_.__r.__words[2] = 0;
          v41->__r_.__value_.__r.__words[0] = 0;
          if (*(char *)(a2 + 23) < 0) {
            std::string::__init_copy_ctor_external(&v120, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
          }
          else {
            std::string v120 = *(std::string *)a2;
          }
          std::locale::locale(&v114, (const std::locale *)a5);
          long long v115 = *(_OWORD *)(a5 + 8);
          long long v116 = *(_OWORD *)(a5 + 24);
          int64_t v43 = *(std::__shared_weak_count **)(a5 + 48);
          uint64_t v117 = *(void *)(a5 + 40);
          CFAllocatorRef v118 = v43;
          if (v43) {
            atomic_fetch_add_explicit(&v43->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          uint64_t v119 = *(void *)(a5 + 56);
          util::moveDirContent(v121, &v120, a3, (a4 - 1), &v114);
          long long v44 = v118;
          if (v118 && !atomic_fetch_add(&v118->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
            std::__shared_weak_count::__release_weak(v44);
            std::locale::~locale(&v114);
            if ((SHIBYTE(v120.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
LABEL_75:
              if ((SHIBYTE(v122) & 0x80000000) == 0) {
                goto LABEL_76;
              }
LABEL_81:
              operator delete(v121[0]);
              if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0) {
                goto LABEL_82;
              }
              goto LABEL_77;
            }
          }
          else
          {
            std::locale::~locale(&v114);
            if ((SHIBYTE(v120.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
              goto LABEL_75;
            }
          }
          operator delete(v120.__r_.__value_.__l.__data_);
          if (SHIBYTE(v122) < 0) {
            goto LABEL_81;
          }
LABEL_76:
          if ((SHIBYTE(v124.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_77;
          }
LABEL_82:
          operator delete(v124.__r_.__value_.__l.__data_);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            goto LABEL_9;
          }
LABEL_83:
          if ((SHIBYTE(v139.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_10;
          }
LABEL_84:
          operator delete(v139.__r_.__value_.__l.__data_);
          v11 += 24;
          if (v11 == v113) {
            goto LABEL_105;
          }
        }
      }
      uint64_t v17 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v15 | 7) != 0x17) {
        uint64_t v17 = v15 | 7;
      }
      uint64_t v18 = v17 + 1;
      p_p = (std::string *)operator new(v17 + 1);
      __p.__r_.__value_.__l.__size_ = v14 + 1;
      __p.__r_.__value_.__r.__words[2] = v18 | 0x8000000000000000;
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)p_p;
LABEL_24:
      if (v13 >= 0) {
        int64_t v19 = (const void *)a1;
      }
      else {
        int64_t v19 = *(const void **)a1;
      }
      memmove(p_p, v19, v14);
      goto LABEL_28;
    }
    while (1)
    {
      memset(&v139, 170, sizeof(v139));
      if (v11[23] < 0)
      {
        std::string::__init_copy_ctor_external(&v139, *(const std::string::value_type **)v11, *((void *)v11 + 1));
      }
      else
      {
        long long v57 = *(_OWORD *)v11;
        v139.__r_.__value_.__r.__words[2] = *((void *)v11 + 2);
        *(_OWORD *)&v139.__r_.__value_.__l.__data_ = v57;
      }
      memset(&v124, 170, sizeof(v124));
      int v58 = *(char *)(a2 + 23);
      if (v58 >= 0) {
        size_t v59 = *(unsigned __int8 *)(a2 + 23);
      }
      else {
        size_t v59 = *(void *)(a2 + 8);
      }
      unint64_t v60 = v59 + 1;
      memset(&buf, 170, sizeof(buf));
      if (v59 + 1 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v60 >= 0x17)
      {
        uint64_t v62 = (v60 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v60 | 7) != 0x17) {
          uint64_t v62 = v60 | 7;
        }
        uint64_t v63 = v62 + 1;
        p_std::string buf = (std::string *)operator new(v62 + 1);
        buf.__r_.__value_.__l.__size_ = v59 + 1;
        buf.__r_.__value_.__r.__words[2] = v63 | 0x8000000000000000;
        buf.__r_.__value_.__r.__words[0] = (std::string::size_type)p_buf;
      }
      else
      {
        memset(&buf, 0, sizeof(buf));
        p_std::string buf = &buf;
        *((unsigned char *)&buf.__r_.__value_.__s + 23) = v59 + 1;
        if (!v59) {
          goto LABEL_136;
        }
      }
      if (v58 >= 0) {
        uint64_t v64 = (const void *)a2;
      }
      else {
        uint64_t v64 = *(const void **)a2;
      }
      memmove(p_buf, v64, v59);
LABEL_136:
      *(_WORD *)((char *)&p_buf->__r_.__value_.__l.__data_ + v59) = 47;
      if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unint64_t v65 = &v139;
      }
      else {
        unint64_t v65 = (std::string *)v139.__r_.__value_.__r.__words[0];
      }
      if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v66 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v66 = v139.__r_.__value_.__l.__size_;
      }
      size_t v67 = std::string::append(&buf, (const std::string::value_type *)v65, v66);
      long long v68 = *(_OWORD *)&v67->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = v67->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v68;
      v67->__r_.__value_.__l.__size_ = 0;
      v67->__r_.__value_.__r.__words[2] = 0;
      v67->__r_.__value_.__r.__words[0] = 0;
      ctu::fs::get_unique_filename();
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_144;
        }
      }
      else if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        goto LABEL_144;
      }
      operator delete(buf.__r_.__value_.__l.__data_);
LABEL_144:
      int v69 = *(char *)(a1 + 23);
      if (v69 >= 0) {
        size_t v70 = *(unsigned __int8 *)(a1 + 23);
      }
      else {
        size_t v70 = *(void *)(a1 + 8);
      }
      unint64_t v71 = v70 + 1;
      memset(&buf, 170, sizeof(buf));
      if (v70 + 1 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v71 >= 0x17)
      {
        uint64_t v73 = (v71 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v71 | 7) != 0x17) {
          uint64_t v73 = v71 | 7;
        }
        uint64_t v74 = v73 + 1;
        v72 = (std::string *)operator new(v73 + 1);
        buf.__r_.__value_.__l.__size_ = v70 + 1;
        buf.__r_.__value_.__r.__words[2] = v74 | 0x8000000000000000;
        buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v72;
LABEL_154:
        if (v69 >= 0) {
          uint64_t v75 = (const void *)a1;
        }
        else {
          uint64_t v75 = *(const void **)a1;
        }
        memmove(v72, v75, v70);
        goto LABEL_158;
      }
      memset(&buf, 0, sizeof(buf));
      v72 = &buf;
      *((unsigned char *)&buf.__r_.__value_.__s + 23) = v70 + 1;
      if (v70) {
        goto LABEL_154;
      }
LABEL_158:
      *(_WORD *)((char *)&v72->__r_.__value_.__l.__data_ + v70) = 47;
      if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v76 = &v139;
      }
      else {
        v76 = (std::string *)v139.__r_.__value_.__r.__words[0];
      }
      if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v77 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v77 = v139.__r_.__value_.__l.__size_;
      }
      int64_t v78 = std::string::append(&buf, (const std::string::value_type *)v76, v77);
      long long v79 = *(_OWORD *)&v78->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = v78->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v79;
      v78->__r_.__value_.__l.__size_ = 0;
      v78->__r_.__value_.__r.__words[2] = 0;
      v78->__r_.__value_.__r.__words[0] = 0;
      char v80 = ctu::fs::rename();
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
          goto LABEL_178;
        }
LABEL_166:
        if (v80) {
          goto LABEL_167;
        }
LABEL_179:
        std::string v86 = GetOsLogContext()[1];
        if (!os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
          goto LABEL_206;
        }
        int v87 = *(char *)(a1 + 23);
        if (v87 >= 0) {
          size_t v88 = *(unsigned __int8 *)(a1 + 23);
        }
        else {
          size_t v88 = *(void *)(a1 + 8);
        }
        unint64_t v89 = v88 + 1;
        memset(&buf, 170, sizeof(buf));
        if (v88 + 1 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v89 >= 0x17)
        {
          uint64_t v100 = (v89 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v89 | 7) != 0x17) {
            uint64_t v100 = v89 | 7;
          }
          uint64_t v101 = v100 + 1;
          xpc_object_t v90 = (std::string *)operator new(v100 + 1);
          buf.__r_.__value_.__l.__size_ = v88 + 1;
          buf.__r_.__value_.__r.__words[2] = v101 | 0x8000000000000000;
          buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v90;
        }
        else
        {
          memset(&buf, 0, sizeof(buf));
          xpc_object_t v90 = &buf;
          *((unsigned char *)&buf.__r_.__value_.__s + 23) = v88 + 1;
          if (!v88) {
            goto LABEL_217;
          }
        }
        if (v87 >= 0) {
          v102 = (const void *)a1;
        }
        else {
          v102 = *(const void **)a1;
        }
        memmove(v90, v102, v88);
LABEL_217:
        *(_WORD *)((char *)&v90->__r_.__value_.__l.__data_ + v88) = 47;
        if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          CFAllocatorRef v103 = &v139;
        }
        else {
          CFAllocatorRef v103 = (std::string *)v139.__r_.__value_.__r.__words[0];
        }
        if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v104 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v104 = v139.__r_.__value_.__l.__size_;
        }
        CFAllocatorRef v105 = std::string::append(&buf, (const std::string::value_type *)v103, v104);
        long long v106 = *(_OWORD *)&v105->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = v105->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v106;
        v105->__r_.__value_.__l.__size_ = 0;
        v105->__r_.__value_.__r.__words[2] = 0;
        v105->__r_.__value_.__r.__words[0] = 0;
        unint64_t v107 = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          unint64_t v107 = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        unint64_t v108 = &v124;
        if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          unint64_t v108 = (std::string *)v124.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)CFAllocatorRef v134 = 136315394;
        CFAllocatorRef v135 = v107;
        __int16 v136 = 2080;
        CFAllocatorRef v137 = v108;
        _os_log_error_impl(&dword_1C5767000, v86, OS_LOG_TYPE_ERROR, "Failed to move %s -> %s", v134, 0x16u);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          goto LABEL_228;
        }
LABEL_205:
        if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_206;
        }
LABEL_229:
        operator delete(buf.__r_.__value_.__l.__data_);
        if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0) {
          goto LABEL_117;
        }
LABEL_207:
        if (SHIBYTE(v139.__r_.__value_.__r.__words[2]) < 0) {
          goto LABEL_208;
        }
LABEL_118:
        v11 += 24;
        if (v11 == v113) {
          break;
        }
      }
      else
      {
        if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_166;
        }
LABEL_178:
        operator delete(buf.__r_.__value_.__l.__data_);
        if ((v80 & 1) == 0) {
          goto LABEL_179;
        }
LABEL_167:
        uint64_t v81 = GetOsLogContext()[1];
        if (!os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_206;
        }
        int v82 = *(char *)(a1 + 23);
        if (v82 >= 0) {
          size_t v83 = *(unsigned __int8 *)(a1 + 23);
        }
        else {
          size_t v83 = *(void *)(a1 + 8);
        }
        unint64_t v84 = v83 + 1;
        memset(&buf, 170, sizeof(buf));
        if (v83 + 1 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v84 >= 0x17)
        {
          uint64_t v91 = (v84 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v84 | 7) != 0x17) {
            uint64_t v91 = v84 | 7;
          }
          uint64_t v92 = v91 + 1;
          std::string v85 = (std::string *)operator new(v91 + 1);
          buf.__r_.__value_.__l.__size_ = v83 + 1;
          buf.__r_.__value_.__r.__words[2] = v92 | 0x8000000000000000;
          buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v85;
        }
        else
        {
          memset(&buf, 0, sizeof(buf));
          std::string v85 = &buf;
          *((unsigned char *)&buf.__r_.__value_.__s + 23) = v83 + 1;
          if (!v83) {
            goto LABEL_194;
          }
        }
        if (v82 >= 0) {
          uint64_t v93 = (const void *)a1;
        }
        else {
          uint64_t v93 = *(const void **)a1;
        }
        memmove(v85, v93, v83);
LABEL_194:
        *(_WORD *)((char *)&v85->__r_.__value_.__l.__data_ + v83) = 47;
        if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          int v94 = &v139;
        }
        else {
          int v94 = (std::string *)v139.__r_.__value_.__r.__words[0];
        }
        if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v95 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v95 = v139.__r_.__value_.__l.__size_;
        }
        long long v96 = std::string::append(&buf, (const std::string::value_type *)v94, v95);
        long long v97 = *(_OWORD *)&v96->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = v96->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v97;
        v96->__r_.__value_.__l.__size_ = 0;
        v96->__r_.__value_.__r.__words[2] = 0;
        v96->__r_.__value_.__r.__words[0] = 0;
        uint64_t v98 = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          uint64_t v98 = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        unint64_t v99 = &v124;
        if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          unint64_t v99 = (std::string *)v124.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)CFAllocatorRef v134 = 136315394;
        CFAllocatorRef v135 = v98;
        __int16 v136 = 2080;
        CFAllocatorRef v137 = v99;
        _os_log_impl(&dword_1C5767000, v81, OS_LOG_TYPE_DEFAULT, "Moved %s -> %s", v134, 0x16u);
        if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_205;
        }
LABEL_228:
        operator delete(__p.__r_.__value_.__l.__data_);
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
          goto LABEL_229;
        }
LABEL_206:
        if ((SHIBYTE(v124.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_207;
        }
LABEL_117:
        operator delete(v124.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v139.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_118;
        }
LABEL_208:
        operator delete(v139.__r_.__value_.__l.__data_);
        v11 += 24;
        if (v11 == v113) {
          break;
        }
      }
    }
  }
LABEL_105:
  if (a3) {
    ctu::fs::remove_dir();
  }
  xpc_object_t v54 = (void **)v131;
  if (v131)
  {
    v55 = v132;
    int v56 = v131;
    if (v132 != (void **)v131)
    {
      do
      {
        if (*((char *)v55 - 1) < 0) {
          operator delete(*(v55 - 3));
        }
        v55 -= 3;
      }
      while (v55 != v54);
      int v56 = v131;
    }
    CFAllocatorRef v132 = v54;
    operator delete(v56);
  }
}

void sub_1C595F64C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,std::locale a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,uint64_t a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50,uint64_t a51,void *__p,uint64_t a53,int a54,__int16 a55,char a56,char a57,std::locale a58)
{
  if (a57 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v58 - 105) < 0) {
    operator delete(*(void **)(v58 - 128));
  }
  std::vector<std::string>::~vector[abi:ne180100]((void **)(v58 - 216));
  _Unwind_Resume(a1);
}

void util::generateSHA256(const char *a1@<X0>, void *a2@<X1>, unsigned int a3@<W2>, unsigned __int8 **a4@<X8>)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  uint64_t v8 = (unsigned __int8 *)operator new(0x20uLL);
  a4[1] = v8 + 32;
  a4[2] = v8 + 32;
  *(_OWORD *)uint64_t v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *a4 = v8;
  if (!a2)
  {
    size_t v14 = GetOsLogContext()[1];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      return;
    }
    LOWORD(c.count[0]) = 0;
    unint64_t v15 = "dataIn Buffer is NULL";
    p_CC_SHA256_CTX c = (uint8_t *)&c;
    uint64_t v17 = v14;
    uint32_t v18 = 2;
    goto LABEL_16;
  }
  *(void *)&c.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&c.wbuf[6] = v9;
  *(_OWORD *)&c.wbuf[10] = v9;
  *(_OWORD *)&c.hash[6] = v9;
  *(_OWORD *)&c.wbuf[2] = v9;
  *(_OWORD *)c.count = v9;
  *(_OWORD *)&c.hash[2] = v9;
  if (!ctu::fs::get_file_size()) {
    return;
  }
  CC_SHA256_Init(&c);
  unint64_t v10 = a1;
  if (a1[23] < 0) {
    unint64_t v10 = *(const char **)a1;
  }
  int v11 = open(v10, 0);
  if (v11 < 1)
  {
    int64_t v19 = GetOsLogContext()[1];
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      return;
    }
    if (a1[23] < 0) {
      a1 = *(const char **)a1;
    }
    uint64_t v20 = __error();
    uint64_t v21 = strerror(*v20);
    int v22 = *__error();
    int v23 = *__error();
    *(_DWORD *)std::string buf = 136315906;
    size_t v31 = a1;
    __int16 v32 = 2080;
    std::string::size_type v33 = v21;
    __int16 v34 = 1024;
    int v35 = v22;
    __int16 v36 = 1024;
    int v37 = v23;
    unint64_t v15 = "Failed to open: %s : %s (%d, 0x%x)";
    p_CC_SHA256_CTX c = buf;
    uint64_t v17 = v19;
    uint32_t v18 = 34;
LABEL_16:
    _os_log_error_impl(&dword_1C5767000, v17, OS_LOG_TYPE_ERROR, v15, p_c, v18);
    return;
  }
  unint64_t v12 = 0;
  while (1)
  {
    ssize_t v13 = read(v11, a2, a3);
    if (v13 == -1) {
      break;
    }
    CC_SHA256_Update(&c, a2, v13);
    v12 += v13;
    if (v12 >= 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_18;
    }
  }
  int64_t v24 = GetOsLogContext()[1];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    if (a1[23] < 0) {
      a1 = *(const char **)a1;
    }
    int v25 = __error();
    size_t v26 = strerror(*v25);
    int v27 = *__error();
    int v28 = *__error();
    *(_DWORD *)std::string buf = 136315906;
    size_t v31 = a1;
    __int16 v32 = 2080;
    std::string::size_type v33 = v26;
    __int16 v34 = 1024;
    int v35 = v27;
    __int16 v36 = 1024;
    int v37 = v28;
    _os_log_error_impl(&dword_1C5767000, v24, OS_LOG_TYPE_ERROR, "Failed to read: %s : %s (%d,0x%x)", buf, 0x22u);
  }
LABEL_18:
  CC_SHA256_Final(v8, &c);
  close(v11);
}

void sub_1C595FB28(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_1C595FB40(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_1C595FB58(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_1C595FB70(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_1C595FB88(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_1C595FBA0(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_1C595FBB8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_1C595FBD0(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

BOOL util::markPurgeableFile(uint64_t *a1)
{
  uint64_t v1 = a1;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 65541;
  if ((*((char *)a1 + 23) & 0x80000000) == 0)
  {
    int v2 = open((const char *)a1, 0);
    if ((v2 & 0x80000000) == 0) {
      goto LABEL_3;
    }
LABEL_9:
    unint64_t v12 = GetOsLogContext()[1];
    BOOL result = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    if (*((char *)v1 + 23) < 0) {
      uint64_t v1 = (uint64_t *)*v1;
    }
    ssize_t v13 = __error();
    size_t v14 = strerror(*v13);
    *(_DWORD *)std::string buf = 136315394;
    uint64_t v17 = v1;
    __int16 v18 = 2080;
    *(void *)int64_t v19 = v14;
    long long v9 = "Failed to open %s : %s";
    unint64_t v10 = v12;
    uint32_t v11 = 22;
    goto LABEL_13;
  }
  int v2 = open((const char *)*a1, 0);
  if (v2 < 0) {
    goto LABEL_9;
  }
LABEL_3:
  int v3 = v2;
  int v4 = ffsctl(v2, 0xC0084A44uLL, &v15, 0);
  close(v3);
  if (v4)
  {
    std::string::size_type v5 = GetOsLogContext()[1];
    BOOL result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    if (*((char *)v1 + 23) < 0) {
      uint64_t v1 = (uint64_t *)*v1;
    }
    unsigned int v7 = __error();
    uint64_t v8 = strerror(*v7);
    *(_DWORD *)std::string buf = 136315906;
    uint64_t v17 = v1;
    __int16 v18 = 1024;
    *(_DWORD *)int64_t v19 = v4;
    *(_WORD *)&v19[4] = 2080;
    *(void *)&v19[6] = v8;
    __int16 v20 = 2048;
    uint64_t v21 = v15;
    long long v9 = "Failed to mark %s as purgeable %d (%s) (flags 0x%llx)";
    unint64_t v10 = v5;
    uint32_t v11 = 38;
LABEL_13:
    _os_log_error_impl(&dword_1C5767000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
    return 0;
  }
  return 1;
}

BOOL util::checkLogFileAge(uint64_t a1, int64_t a2, uint64_t a3)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v95 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v97 = 0xAAAAAAAAAAAAAA00;
  long long v99 = v4;
  uint64_t v96 = 0;
  long long v98 = 0uLL;
  LOBYTE(v99) = 0;
  BYTE8(v99) = 0;
  uint64_t v100 = 0;
  memset(v94, 0, sizeof(v94));
  uint64_t v5 = *(unsigned __int8 *)(a1 + 23);
  if ((v5 & 0x80u) == 0) {
    uint64_t v6 = (std::sub_match<const char *> *)a1;
  }
  else {
    uint64_t v6 = *(std::sub_match<const char *> **)a1;
  }
  if ((v5 & 0x80u) != 0) {
    uint64_t v5 = *(void *)(a1 + 8);
  }
  unsigned int v7 = (std::sub_match<std::__wrap_iter<const char *>> *)((char *)v6 + v5);
  unint64_t v103 = 0xAAAAAAAAAAAAAA00;
  __p.tm_gmtoff = 0xAAAAAAAAAAAAAAAALL;
  long long v106 = v4;
  __p.tm_zone = 0;
  uint64_t v102 = 0;
  uint64_t v104 = 0;
  uint64_t v105 = 0;
  LOBYTE(v106) = 0;
  BYTE8(v106) = 0;
  uint64_t v107 = 0;
  memset(&__p, 0, 41);
  int v8 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(a3, v6, (std::sub_match<const char *> *)((char *)v6 + v5), (std::vector<std::csub_match> *)&__p, 4160);
  std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((std::vector<std::ssub_match> *)v94, (uint64_t)v6, v7, (uint64_t *)&__p.tm_sec, 0);
  if (*(void *)&__p.tm_sec)
  {
    *(void *)&__p.tm_hour = *(void *)&__p.tm_sec;
    operator delete(*(void **)&__p.tm_sec);
  }
  if ((_BYTE)v99) {
    int v9 = 0;
  }
  else {
    int v9 = v8;
  }
  if (v9 != 1)
  {
    BOOL v21 = 0;
    uint64_t v22 = *(void **)v94;
    if (!*(void *)v94) {
      return v21;
    }
LABEL_23:
    *(void *)&v94[8] = v22;
    operator delete(v22);
    return v21;
  }
  memset(&__p, 0, sizeof(__p));
  uint64_t v10 = *(void *)v94;
  if (!*(unsigned char *)(*(void *)v94 + 40))
  {
    memset(&v93, 0, sizeof(v93));
    goto LABEL_33;
  }
  uint64_t v12 = *(void *)(*(void *)v94 + 24);
  uint32_t v11 = *(char **)(*(void *)v94 + 32);
  unint64_t v13 = (unint64_t)&v11[-v12];
  if ((unint64_t)&v11[-v12] > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v13 <= 0x16)
  {
    *((unsigned char *)&v93.__r_.__value_.__s + 23) = (_BYTE)v11 - v12;
    size_t v14 = &v93;
    if ((char *)v12 != v11) {
      goto LABEL_16;
    }
LABEL_29:
    unsigned char *v14 = 0;
    goto LABEL_33;
  }
  uint64_t v24 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v13 | 7) != 0x17) {
    uint64_t v24 = v13 | 7;
  }
  uint64_t v25 = v24 + 1;
  size_t v14 = operator new(v24 + 1);
  v93.__r_.__value_.__l.__size_ = (std::string::size_type)&v11[-v12];
  v93.__r_.__value_.__r.__words[2] = v25 | 0x8000000000000000;
  v93.__r_.__value_.__r.__words[0] = (std::string::size_type)v14;
  if ((char *)v12 == v11) {
    goto LABEL_29;
  }
LABEL_16:
  if (v13 < 0x20 || (unint64_t)&v14[-v12] < 0x20)
  {
    uint64_t v15 = v14;
    uint64_t v16 = (char *)v12;
  }
  else
  {
    uint64_t v15 = &v14[v13 & 0xFFFFFFFFFFFFFFE0];
    uint64_t v16 = (char *)(v12 + (v13 & 0xFFFFFFFFFFFFFFE0));
    uint64_t v17 = (long long *)(v12 + 16);
    __int16 v18 = v14 + 16;
    unint64_t v19 = v13 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v20 = *v17;
      *(v18 - 1) = *(v17 - 1);
      _OWORD *v18 = v20;
      v17 += 2;
      v18 += 2;
      v19 -= 32;
    }
    while (v19);
    if (v13 == (v13 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_32;
    }
  }
  do
  {
    char v26 = *v16++;
    *v15++ = v26;
  }
  while (v16 != v11);
LABEL_32:
  unsigned char *v15 = 0;
LABEL_33:
  util::convert<int>(&v93, &__p.tm_year, 10);
  if ((SHIBYTE(v93.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    __p.tm_year -= 1900;
    if (*(unsigned char *)(v10 + 64)) {
      goto LABEL_35;
    }
LABEL_45:
    memset(&v93, 0, sizeof(v93));
    goto LABEL_53;
  }
  operator delete(v93.__r_.__value_.__l.__data_);
  __p.tm_year -= 1900;
  if (!*(unsigned char *)(v10 + 64)) {
    goto LABEL_45;
  }
LABEL_35:
  uint64_t v28 = *(void *)(v10 + 48);
  int v27 = *(char **)(v10 + 56);
  unint64_t v29 = (unint64_t)&v27[-v28];
  if ((unint64_t)&v27[-v28] > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v29 <= 0x16)
  {
    *((unsigned char *)&v93.__r_.__value_.__s + 23) = (_BYTE)v27 - v28;
    int v30 = &v93;
    if ((char *)v28 != v27) {
      goto LABEL_38;
    }
LABEL_49:
    unsigned char *v30 = 0;
    goto LABEL_53;
  }
  uint64_t v37 = (v29 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v29 | 7) != 0x17) {
    uint64_t v37 = v29 | 7;
  }
  uint64_t v38 = v37 + 1;
  int v30 = operator new(v37 + 1);
  v93.__r_.__value_.__l.__size_ = (std::string::size_type)&v27[-v28];
  v93.__r_.__value_.__r.__words[2] = v38 | 0x8000000000000000;
  v93.__r_.__value_.__r.__words[0] = (std::string::size_type)v30;
  if ((char *)v28 == v27) {
    goto LABEL_49;
  }
LABEL_38:
  if (v29 < 0x20 || (unint64_t)&v30[-v28] < 0x20)
  {
    size_t v31 = v30;
    __int16 v32 = (char *)v28;
  }
  else
  {
    size_t v31 = &v30[v29 & 0xFFFFFFFFFFFFFFE0];
    __int16 v32 = (char *)(v28 + (v29 & 0xFFFFFFFFFFFFFFE0));
    std::string::size_type v33 = (long long *)(v28 + 16);
    __int16 v34 = v30 + 16;
    unint64_t v35 = v29 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v36 = *v33;
      *(v34 - 1) = *(v33 - 1);
      *__int16 v34 = v36;
      v33 += 2;
      v34 += 2;
      v35 -= 32;
    }
    while (v35);
    if (v29 == (v29 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_52;
    }
  }
  do
  {
    char v39 = *v32++;
    *v31++ = v39;
  }
  while (v32 != v27);
LABEL_52:
  *size_t v31 = 0;
LABEL_53:
  util::convert<int>(&v93, &__p.tm_mon, 10);
  if ((SHIBYTE(v93.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    --__p.tm_mon;
    if (*(unsigned char *)(v10 + 88)) {
      goto LABEL_55;
    }
LABEL_65:
    memset(&v93, 0, sizeof(v93));
    goto LABEL_73;
  }
  operator delete(v93.__r_.__value_.__l.__data_);
  --__p.tm_mon;
  if (!*(unsigned char *)(v10 + 88)) {
    goto LABEL_65;
  }
LABEL_55:
  uint64_t v41 = *(void *)(v10 + 72);
  long long v40 = *(char **)(v10 + 80);
  unint64_t v42 = (unint64_t)&v40[-v41];
  if ((unint64_t)&v40[-v41] > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v42 <= 0x16)
  {
    *((unsigned char *)&v93.__r_.__value_.__s + 23) = (_BYTE)v40 - v41;
    int64_t v43 = &v93;
    if ((char *)v41 != v40) {
      goto LABEL_58;
    }
LABEL_69:
    *int64_t v43 = 0;
    goto LABEL_73;
  }
  uint64_t v50 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v42 | 7) != 0x17) {
    uint64_t v50 = v42 | 7;
  }
  uint64_t v51 = v50 + 1;
  int64_t v43 = operator new(v50 + 1);
  v93.__r_.__value_.__l.__size_ = (std::string::size_type)&v40[-v41];
  v93.__r_.__value_.__r.__words[2] = v51 | 0x8000000000000000;
  v93.__r_.__value_.__r.__words[0] = (std::string::size_type)v43;
  if ((char *)v41 == v40) {
    goto LABEL_69;
  }
LABEL_58:
  if (v42 < 0x20 || (unint64_t)&v43[-v41] < 0x20)
  {
    long long v44 = v43;
    uint64_t v45 = (char *)v41;
  }
  else
  {
    long long v44 = &v43[v42 & 0xFFFFFFFFFFFFFFE0];
    uint64_t v45 = (char *)(v41 + (v42 & 0xFFFFFFFFFFFFFFE0));
    uint64_t v46 = (long long *)(v41 + 16);
    size_t v47 = v43 + 16;
    unint64_t v48 = v42 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v49 = *v46;
      *(v47 - 1) = *(v46 - 1);
      *size_t v47 = v49;
      v46 += 2;
      v47 += 2;
      v48 -= 32;
    }
    while (v48);
    if (v42 == (v42 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_72;
    }
  }
  do
  {
    char v52 = *v45++;
    *v44++ = v52;
  }
  while (v45 != v40);
LABEL_72:
  *long long v44 = 0;
LABEL_73:
  util::convert<int>(&v93, (_DWORD *)((unint64_t)&__p | 0xC), 10);
  if ((SHIBYTE(v93.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (*(unsigned char *)(v10 + 112)) {
      goto LABEL_75;
    }
LABEL_85:
    memset(&v93, 0, sizeof(v93));
    goto LABEL_93;
  }
  operator delete(v93.__r_.__value_.__l.__data_);
  if (!*(unsigned char *)(v10 + 112)) {
    goto LABEL_85;
  }
LABEL_75:
  uint64_t v54 = *(void *)(v10 + 96);
  xpc_object_t v53 = *(char **)(v10 + 104);
  unint64_t v55 = (unint64_t)&v53[-v54];
  if ((unint64_t)&v53[-v54] > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v55 <= 0x16)
  {
    *((unsigned char *)&v93.__r_.__value_.__s + 23) = (_BYTE)v53 - v54;
    int v56 = &v93;
    if ((char *)v54 != v53) {
      goto LABEL_78;
    }
LABEL_89:
    unsigned char *v56 = 0;
    goto LABEL_93;
  }
  uint64_t v63 = (v55 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v55 | 7) != 0x17) {
    uint64_t v63 = v55 | 7;
  }
  uint64_t v64 = v63 + 1;
  int v56 = operator new(v63 + 1);
  v93.__r_.__value_.__l.__size_ = (std::string::size_type)&v53[-v54];
  v93.__r_.__value_.__r.__words[2] = v64 | 0x8000000000000000;
  v93.__r_.__value_.__r.__words[0] = (std::string::size_type)v56;
  if ((char *)v54 == v53) {
    goto LABEL_89;
  }
LABEL_78:
  if (v55 < 0x20 || (unint64_t)&v56[-v54] < 0x20)
  {
    long long v57 = v56;
    uint64_t v58 = (char *)v54;
  }
  else
  {
    long long v57 = &v56[v55 & 0xFFFFFFFFFFFFFFE0];
    uint64_t v58 = (char *)(v54 + (v55 & 0xFFFFFFFFFFFFFFE0));
    size_t v59 = (long long *)(v54 + 16);
    unint64_t v60 = v56 + 16;
    unint64_t v61 = v55 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v62 = *v59;
      *(v60 - 1) = *(v59 - 1);
      _OWORD *v60 = v62;
      v59 += 2;
      v60 += 2;
      v61 -= 32;
    }
    while (v61);
    if (v55 == (v55 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_92;
    }
  }
  do
  {
    char v65 = *v58++;
    *v57++ = v65;
  }
  while (v58 != v53);
LABEL_92:
  unsigned char *v57 = 0;
LABEL_93:
  util::convert<int>(&v93, &__p.tm_hour, 10);
  if ((SHIBYTE(v93.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (*(unsigned char *)(v10 + 136)) {
      goto LABEL_95;
    }
LABEL_105:
    memset(&v93, 0, sizeof(v93));
    goto LABEL_113;
  }
  operator delete(v93.__r_.__value_.__l.__data_);
  if (!*(unsigned char *)(v10 + 136)) {
    goto LABEL_105;
  }
LABEL_95:
  uint64_t v67 = *(void *)(v10 + 120);
  std::string::size_type v66 = *(char **)(v10 + 128);
  unint64_t v68 = (unint64_t)&v66[-v67];
  if ((unint64_t)&v66[-v67] > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v68 <= 0x16)
  {
    *((unsigned char *)&v93.__r_.__value_.__s + 23) = (_BYTE)v66 - v67;
    int v69 = &v93;
    if ((char *)v67 != v66) {
      goto LABEL_98;
    }
LABEL_109:
    *int v69 = 0;
    goto LABEL_113;
  }
  uint64_t v76 = (v68 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v68 | 7) != 0x17) {
    uint64_t v76 = v68 | 7;
  }
  uint64_t v77 = v76 + 1;
  int v69 = operator new(v76 + 1);
  v93.__r_.__value_.__l.__size_ = (std::string::size_type)&v66[-v67];
  v93.__r_.__value_.__r.__words[2] = v77 | 0x8000000000000000;
  v93.__r_.__value_.__r.__words[0] = (std::string::size_type)v69;
  if ((char *)v67 == v66) {
    goto LABEL_109;
  }
LABEL_98:
  if (v68 < 0x20 || (unint64_t)&v69[-v67] < 0x20)
  {
    size_t v70 = v69;
    unint64_t v71 = (char *)v67;
  }
  else
  {
    size_t v70 = &v69[v68 & 0xFFFFFFFFFFFFFFE0];
    unint64_t v71 = (char *)(v67 + (v68 & 0xFFFFFFFFFFFFFFE0));
    v72 = (long long *)(v67 + 16);
    uint64_t v73 = v69 + 16;
    unint64_t v74 = v68 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v75 = *v72;
      *(v73 - 1) = *(v72 - 1);
      _OWORD *v73 = v75;
      v72 += 2;
      v73 += 2;
      v74 -= 32;
    }
    while (v74);
    if (v68 == (v68 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_112;
    }
  }
  do
  {
    char v78 = *v71++;
    *v70++ = v78;
  }
  while (v71 != v66);
LABEL_112:
  *size_t v70 = 0;
LABEL_113:
  util::convert<int>(&v93, &__p.tm_min, 10);
  if ((SHIBYTE(v93.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (*(unsigned char *)(v10 + 160)) {
      goto LABEL_115;
    }
LABEL_125:
    memset(&v93, 0, sizeof(v93));
    goto LABEL_133;
  }
  operator delete(v93.__r_.__value_.__l.__data_);
  if (!*(unsigned char *)(v10 + 160)) {
    goto LABEL_125;
  }
LABEL_115:
  uint64_t v80 = *(void *)(v10 + 144);
  long long v79 = *(char **)(v10 + 152);
  unint64_t v81 = (unint64_t)&v79[-v80];
  if ((unint64_t)&v79[-v80] > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v81 <= 0x16)
  {
    *((unsigned char *)&v93.__r_.__value_.__s + 23) = (_BYTE)v79 - v80;
    int v82 = &v93;
    if ((char *)v80 != v79) {
      goto LABEL_118;
    }
LABEL_129:
    *int v82 = 0;
    goto LABEL_133;
  }
  uint64_t v89 = (v81 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v81 | 7) != 0x17) {
    uint64_t v89 = v81 | 7;
  }
  uint64_t v90 = v89 + 1;
  int v82 = operator new(v89 + 1);
  v93.__r_.__value_.__l.__size_ = (std::string::size_type)&v79[-v80];
  v93.__r_.__value_.__r.__words[2] = v90 | 0x8000000000000000;
  v93.__r_.__value_.__r.__words[0] = (std::string::size_type)v82;
  if ((char *)v80 == v79) {
    goto LABEL_129;
  }
LABEL_118:
  if (v81 < 0x20 || (unint64_t)&v82[-v80] < 0x20)
  {
    size_t v83 = v82;
    unint64_t v84 = (char *)v80;
  }
  else
  {
    size_t v83 = &v82[v81 & 0xFFFFFFFFFFFFFFE0];
    unint64_t v84 = (char *)(v80 + (v81 & 0xFFFFFFFFFFFFFFE0));
    std::string v85 = (long long *)(v80 + 16);
    std::string v86 = v82 + 16;
    unint64_t v87 = v81 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v88 = *v85;
      *(v86 - 1) = *(v85 - 1);
      _OWORD *v86 = v88;
      v85 += 2;
      v86 += 2;
      v87 -= 32;
    }
    while (v87);
    if (v81 == (v81 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_132;
    }
  }
  do
  {
    char v91 = *v84++;
    *v83++ = v91;
  }
  while (v84 != v79);
LABEL_132:
  unsigned char *v83 = 0;
LABEL_133:
  util::convert<int>(&v93, &__p, 10);
  if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v93.__r_.__value_.__l.__data_);
  }
  __p.tm_isdst = -1;
  time_t v92 = mktime(&__p);
  v93.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
  v93.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday((timeval *)&v93, 0);
  BOOL v21 = (int64_t)(v93.__r_.__value_.__r.__words[0] - v92) > a2;
  uint64_t v22 = *(void **)v94;
  if (*(void *)v94) {
    goto LABEL_23;
  }
  return v21;
}

void sub_1C5960620(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void util::findBasebandLogInfoFile(const void **a1@<X0>, long long **a2@<X1>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  uint64_t v46 = a3;
  a3[2] = 0;
  int v3 = *a2;
  size_t v47 = a2[1];
  if (v3 == v47) {
    return;
  }
  while (1)
  {
    memset(&v49, 170, sizeof(v49));
    if (*((char *)v3 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v49, *(const std::string::value_type **)v3, *((void *)v3 + 1));
    }
    else
    {
      long long v5 = *v3;
      v49.__r_.__value_.__r.__words[2] = *((void *)v3 + 2);
      *(_OWORD *)&v49.__r_.__value_.__l.__data_ = v5;
    }
    int v6 = *((char *)a1 + 23);
    if (v6 >= 0) {
      size_t v7 = *((unsigned __int8 *)a1 + 23);
    }
    else {
      size_t v7 = (size_t)a1[1];
    }
    int v8 = SHIBYTE(v49.__r_.__value_.__r.__words[2]);
    if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      size_t size = HIBYTE(v49.__r_.__value_.__r.__words[2]);
    }
    else {
      size_t size = v49.__r_.__value_.__l.__size_;
    }
    unint64_t v10 = size + v7;
    memset(__dst, 170, sizeof(__dst));
    if (size + v7 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v10 <= 0x16)
    {
      memset(__dst, 0, sizeof(__dst));
      uint32_t v11 = __dst;
      HIBYTE(__dst[2]) = size + v7;
      if (!v7) {
        goto LABEL_20;
      }
LABEL_16:
      if (v6 >= 0) {
        uint64_t v12 = a1;
      }
      else {
        uint64_t v12 = *a1;
      }
      memmove(v11, v12, v7);
      goto LABEL_20;
    }
    uint64_t v18 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v18 = v10 | 7;
    }
    uint64_t v19 = v18 + 1;
    uint32_t v11 = (void **)operator new(v18 + 1);
    __dst[1] = (void *)(size + v7);
    std::string __dst[2] = (void *)(v19 | 0x8000000000000000);
    __dst[0] = v11;
    if (v7) {
      goto LABEL_16;
    }
LABEL_20:
    unint64_t v13 = (char *)v11 + v7;
    if (size)
    {
      if (v8 >= 0) {
        size_t v14 = &v49;
      }
      else {
        size_t v14 = (std::string *)v49.__r_.__value_.__r.__words[0];
      }
      memmove(v13, v14, size);
    }
    v13[size] = 0;
    v15.tv_seCC_SHA256_CTX c = 0xAAAAAAAAAAAAAAAALL;
    v15.tv_nseCC_SHA256_CTX c = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v50.st_blksize_t size = v15;
    *(timespec *)v50.st_qspare = v15;
    v50.st_birthtimespeCC_SHA256_CTX c = v15;
    *(timespec *)&v50.st_size_t size = v15;
    v50.st_mtimespeCC_SHA256_CTX c = v15;
    v50.st_ctimespeCC_SHA256_CTX c = v15;
    *(timespec *)&v50.st_uid = v15;
    v50.st_atimespeCC_SHA256_CTX c = v15;
    *(timespec *)&v50.st_dev = v15;
    if (SHIBYTE(__dst[2]) >= 0) {
      uint64_t v16 = (const char *)__dst;
    }
    else {
      uint64_t v16 = (const char *)__dst[0];
    }
    if (stat(v16, &v50)
      || (SHIBYTE(__dst[2]) >= 0 ? (long long v20 = (const char *)__dst) : (long long v20 = (const char *)__dst[0]),
          BOOL v21 = opendir(v20),
          (uint64_t v22 = v21) == 0))
    {
      char v17 = HIBYTE(__dst[2]);
      goto LABEL_30;
    }
    int v23 = readdir(v21);
    closedir(v22);
    char v17 = HIBYTE(__dst[2]);
    if (v23) {
      break;
    }
LABEL_30:
    if (v17 < 0)
    {
      operator delete(__dst[0]);
      if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
LABEL_59:
      }
        operator delete(v49.__r_.__value_.__l.__data_);
    }
    else if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
    {
      goto LABEL_59;
    }
    int v3 = (long long *)((char *)v3 + 24);
    if (v3 == v47) {
      return;
    }
  }
  if ((HIBYTE(__dst[2]) & 0x80) == 0)
  {
    if (HIBYTE(__dst[2]) <= 4u) {
      goto LABEL_99;
    }
    uint64_t v24 = (_DWORD *)((char *)__dst + HIBYTE(__dst[2]) - 5);
    if (*v24 == 1885626669 && *((unsigned char *)__dst + HIBYTE(__dst[2]) - 1) == 108) {
      goto LABEL_79;
    }
    if (*v24 == 1935962413 && *((unsigned char *)__dst + HIBYTE(__dst[2]) - 1) == 115) {
      goto LABEL_79;
    }
    if (*v24 == 1634296877 && *((unsigned char *)__dst + HIBYTE(__dst[2]) - 1) == 103) {
      goto LABEL_79;
    }
    if (HIBYTE(__dst[2]) < 9u) {
      goto LABEL_99;
    }
    uint64_t v28 = __dst;
    unint64_t v29 = (void *)HIBYTE(__dst[2]);
    goto LABEL_74;
  }
  unint64_t v29 = __dst[1];
  if (__dst[1] < (void *)5) {
    goto LABEL_99;
  }
  uint64_t v28 = (void **)__dst[0];
  int v30 = (char *)__dst[1] + (unint64_t)__dst[0] - 5;
  if ((*v30 != 1885626669 || *((unsigned char *)__dst[1] + (unint64_t)__dst[0] - 1) != 108)
    && (*v30 != 1935962413 || *((unsigned char *)__dst[1] + (unint64_t)__dst[0] - 1) != 115)
    && (*v30 != 1634296877 || *((unsigned char *)__dst[1] + (unint64_t)__dst[0] - 1) != 103))
  {
    if (__dst[1] < (void *)9) {
LABEL_99:
    }
      std::string::__throw_out_of_range[abi:ne180100]();
LABEL_74:
    __int16 v34 = (char *)v28 + (void)v29;
    uint64_t v35 = *(void *)(v34 - 9);
    int v36 = *(v34 - 1);
    if (v35 == 0x636172742D62622DLL && v36 == 101) {
      goto LABEL_79;
    }
    goto LABEL_30;
  }
LABEL_79:
  int v38 = SHIBYTE(v49.__r_.__value_.__r.__words[2]);
  if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t v39 = HIBYTE(v49.__r_.__value_.__r.__words[2]);
  }
  else {
    size_t v39 = v49.__r_.__value_.__l.__size_;
  }
  unint64_t v40 = v39 + 9;
  memset(&v50, 170, 24);
  if (v39 + 9 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v40 >= 0x17)
  {
    uint64_t v42 = (v40 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v40 | 7) != 0x17) {
      uint64_t v42 = v40 | 7;
    }
    uint64_t v43 = v42 + 1;
    uint64_t v41 = operator new(v42 + 1);
    v50.st_ino = v39 + 9;
    *(void *)&v50.st_uid = v43 | 0x8000000000000000;
    *(void *)&v50.st_dev = v41;
  }
  else
  {
    memset(&v50, 0, 24);
    uint64_t v41 = &v50;
    HIBYTE(v50.st_gid) = v39 + 9;
    if (!v39) {
      goto LABEL_93;
    }
  }
  if (v38 >= 0) {
    long long v44 = &v49;
  }
  else {
    long long v44 = (std::string *)v49.__r_.__value_.__r.__words[0];
  }
  memmove(v41, v44, v39);
LABEL_93:
  strcpy((char *)v41 + v39, "/info.txt");
  uint64_t v45 = v46;
  *uint64_t v46 = *(_OWORD *)&v50.st_dev;
  *((void *)v45 + 2) = *(void *)&v50.st_uid;
  if ((v17 & 0x80) == 0)
  {
    if ((v38 & 0x80) == 0) {
      return;
    }
LABEL_97:
    operator delete(v49.__r_.__value_.__l.__data_);
    return;
  }
  operator delete(__dst[0]);
  if ((*((unsigned char *)&v49.__r_.__value_.__s + 23) & 0x80) != 0) {
    goto LABEL_97;
  }
}

void sub_1C5960B10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0)
  {
    operator delete(__p);
    if ((a23 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a23 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a18);
  _Unwind_Resume(exception_object);
}

BOOL util::isDumpForSysdiagnose(uint64_t a1, uint64_t a2)
{
  __p[73] = *(void **)MEMORY[0x1E4F143B8];
  char v65 = 0;
  std::string::size_type v66 = 0;
  uint64_t v67 = 0;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v63[32] = v2;
  long long v64 = v2;
  *(_OWORD *)uint64_t v63 = v2;
  *(_OWORD *)&v63[16] = v2;
  int v3 = *(char *)(a2 + 23);
  if (v3 >= 0) {
    size_t v4 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v4 = *(void *)(a2 + 8);
  }
  unint64_t v5 = v4 + 2;
  memset(&v62, 170, sizeof(v62));
  if (v4 + 2 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  int v6 = (const void **)a2;
  if (v5 >= 0x17)
  {
    uint64_t v9 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17) {
      uint64_t v9 = v5 | 7;
    }
    uint64_t v10 = v9 + 1;
    uint32_t v11 = operator new(v9 + 1);
    v62.__r_.__value_.__l.__size_ = v4 + 2;
    v62.__r_.__value_.__r.__words[2] = v10 | 0x8000000000000000;
    v62.__r_.__value_.__r.__words[0] = (std::string::size_type)v11;
    _WORD *v11 = 10798;
    int v8 = (std::string::value_type *)(v11 + 1);
  }
  else
  {
    v62.__r_.__value_.__r.__words[2] = 0;
    *((unsigned char *)&v62.__r_.__value_.__s + 23) = v4 + 2;
    int v8 = &v62.__r_.__value_.__s.__data_[2];
    *(_OWORD *)&v62.__r_.__value_.__l.__data_ = 0x2A2EuLL;
    if (!v4) {
      goto LABEL_15;
    }
  }
  if (v3 >= 0) {
    uint64_t v12 = v6;
  }
  else {
    uint64_t v12 = (const void **)*v6;
  }
  memmove(v8, v12, v4);
LABEL_15:
  v8[v4] = 0;
  unint64_t v13 = std::string::append(&v62, ".*", 2uLL);
  long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  __p[2] = (void *)v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)tm __p = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>((uint64_t)v63, (uint64_t)__p, 0);
  if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v62.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_17;
    }
LABEL_20:
    operator delete(v62.__r_.__value_.__l.__data_);
    if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_21;
  }
  operator delete(__p[0]);
  if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_20;
  }
LABEL_17:
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
LABEL_18:
    std::string v61 = *(std::string *)a1;
    goto LABEL_22;
  }
LABEL_21:
  std::string::__init_copy_ctor_external(&v61, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
LABEL_22:
  std::locale::locale(&v55, (const std::locale *)v63);
  long long v56 = *(_OWORD *)&v63[8];
  long long v57 = *(_OWORD *)&v63[24];
  uint64_t v58 = *(void *)&v63[40];
  size_t v59 = (std::__shared_weak_count *)v64;
  if ((void)v64) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v64 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v60 = *((void *)&v64 + 1);
  BOOL FilteredFiles = support::fs::getFilteredFiles((const char *)&v61, (uint64_t)&v55, (uint64_t)&v65, 0);
  uint64_t v16 = v59;
  if (v59 && !atomic_fetch_add(&v59->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
    std::locale::~locale(&v55);
    if ((SHIBYTE(v61.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_27:
      if (FilteredFiles) {
        goto LABEL_28;
      }
LABEL_32:
      BOOL v17 = 0;
      goto LABEL_110;
    }
  }
  else
  {
    std::locale::~locale(&v55);
    if ((SHIBYTE(v61.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_27;
    }
  }
  operator delete(v61.__r_.__value_.__l.__data_);
  if (!FilteredFiles) {
    goto LABEL_32;
  }
LABEL_28:
  memset(&v62, 170, sizeof(v62));
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v54, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string v54 = *(std::string *)a1;
  }
  uint64_t v51 = 0;
  char v52 = 0;
  uint64_t v53 = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v51, (uint64_t)v65, (uint64_t)v66, 0xAAAAAAAAAAAAAAABLL * (((char *)v66 - (unsigned char *)v65) >> 3));
  util::findBasebandLogInfoFile((const void **)&v54.__r_.__value_.__l.__data_, (long long **)&v51, &v62);
  uint64_t v18 = (void **)v51;
  if (v51)
  {
    uint64_t v19 = v52;
    long long v20 = v51;
    if (v52 != v51)
    {
      do
      {
        if (*((char *)v19 - 1) < 0) {
          operator delete(*(v19 - 3));
        }
        v19 -= 3;
      }
      while (v19 != v18);
      long long v20 = v51;
    }
    char v52 = v18;
    operator delete(v20);
  }
  if ((SHIBYTE(v54.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    int v21 = SHIBYTE(v62.__r_.__value_.__r.__words[2]);
    if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      size_t size = HIBYTE(v62.__r_.__value_.__r.__words[2]);
    }
    else {
      size_t size = v62.__r_.__value_.__l.__size_;
    }
    if (size) {
      goto LABEL_47;
    }
LABEL_94:
    uint64_t v42 = GetOsLogContext()[1];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      if (*((char *)v6 + 23) < 0) {
        int v6 = (const void **)*v6;
      }
      LODWORD(__p[0]) = 136315138;
      *(void **)((char *)__p + 4) = v6;
      _os_log_impl(&dword_1C5767000, v42, OS_LOG_TYPE_DEFAULT, "No baseband info file found for %s", (uint8_t *)__p, 0xCu);
    }
    BOOL v17 = 0;
    if ((v21 & 0x80) != 0) {
      goto LABEL_109;
    }
    goto LABEL_110;
  }
  operator delete(v54.__r_.__value_.__l.__data_);
  int v21 = SHIBYTE(v62.__r_.__value_.__r.__words[2]);
  if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t size = HIBYTE(v62.__r_.__value_.__r.__words[2]);
  }
  else {
    size_t size = v62.__r_.__value_.__l.__size_;
  }
  if (!size) {
    goto LABEL_94;
  }
LABEL_47:
  memset(__p, 170, 0x240uLL);
  int v23 = *(char *)(a1 + 23);
  if (v23 >= 0) {
    size_t v24 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    size_t v24 = *(void *)(a1 + 8);
  }
  unint64_t v25 = v24 + size;
  memset(__dst, 170, 24);
  if (v24 + size > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v25 <= 0x16)
  {
    memset(__dst, 0, 24);
    char v26 = __dst;
    HIBYTE(__dst[2]) = v24 + size;
    if (!v24) {
      goto LABEL_57;
    }
    goto LABEL_53;
  }
  uint64_t v43 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v25 | 7) != 0x17) {
    uint64_t v43 = v25 | 7;
  }
  uint64_t v44 = v43 + 1;
  char v26 = (void **)operator new(v43 + 1);
  __dst[1] = (void *)(v24 + size);
  std::string __dst[2] = (void *)(v44 | 0x8000000000000000);
  __dst[0] = v26;
  if (v24)
  {
LABEL_53:
    if (v23 >= 0) {
      int v27 = (const void *)a1;
    }
    else {
      int v27 = *(const void **)a1;
    }
    memmove(v26, v27, v24);
  }
LABEL_57:
  uint64_t v28 = (char *)v26 + v24;
  if (v21 >= 0) {
    unint64_t v29 = &v62;
  }
  else {
    unint64_t v29 = (std::string *)v62.__r_.__value_.__r.__words[0];
  }
  memmove(v28, v29, size);
  v28[size] = 0;
  std::ifstream::basic_ifstream((uint64_t *)__p);
  if (SHIBYTE(__dst[2]) < 0)
  {
    operator delete(__dst[0]);
    if (__p[17]) {
      goto LABEL_62;
    }
LABEL_105:
    uint64_t v45 = GetOsLogContext()[1];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__dst[0]) = 136315138;
      *(void **)((char *)__dst + 4) = v29;
      _os_log_error_impl(&dword_1C5767000, v45, OS_LOG_TYPE_ERROR, "Failed to open info file: %s", (uint8_t *)__dst, 0xCu);
    }
    BOOL v17 = 0;
    goto LABEL_108;
  }
  if (!__p[17]) {
    goto LABEL_105;
  }
LABEL_62:
  std::istream::seekg();
  memset(__dst, 170, 24);
  int v30 = __dst;
  support::fs::readCurrentLine(__p, __dst);
  uint64_t v31 = HIBYTE(__dst[2]);
  int v32 = SHIBYTE(__dst[2]);
  std::string::size_type v33 = __dst[0];
  if (SHIBYTE(__dst[2]) < 0)
  {
    uint64_t v31 = (uint64_t)__dst[1];
    int v30 = (void **)__dst[0];
  }
  __int16 v34 = (char *)v30 + v31;
  if (v31 >= 35)
  {
    uint64_t v35 = v30;
    do
    {
      int v36 = (char *)memchr(v35, 98, v31 - 34);
      if (!v36) {
        break;
      }
      if (*(void *)v36 == 0x6320676F6C206262
        && *((void *)v36 + 1) == 0x6F697463656C6C6FLL
        && *((void *)v36 + 2) == 0x20726F66202D206ELL
        && *((void *)v36 + 3) == 0x6E67616964737973
        && *(void *)(v36 + 27) == 0x65736F6E67616964)
      {
        goto LABEL_82;
      }
      uint64_t v35 = (void **)(v36 + 1);
      uint64_t v31 = v34 - (char *)v35;
    }
    while (v34 - (char *)v35 > 34);
  }
  int v36 = v34;
LABEL_82:
  BOOL v17 = v36 != v34 && v36 - (char *)v30 != -1;
  if (v32 < 0) {
    operator delete(v33);
  }
LABEL_108:
  __p[0] = *(void **)MEMORY[0x1E4FBA3F8];
  *(void **)((char *)__p + *((void *)__p[0] - 3)) = *(void **)(MEMORY[0x1E4FBA3F8] + 24);
  MEMORY[0x1C8791D30](&__p[2]);
  std::istream::~istream();
  MEMORY[0x1C8791FB0](&__p[53]);
  if ((*((unsigned char *)&v62.__r_.__value_.__s + 23) & 0x80) != 0) {
LABEL_109:
  }
    operator delete(v62.__r_.__value_.__l.__data_);
LABEL_110:
  uint64_t v46 = (std::__shared_weak_count *)v64;
  if ((void)v64 && !atomic_fetch_add((atomic_ullong *volatile)(v64 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
    std::__shared_weak_count::__release_weak(v46);
  }
  std::locale::~locale((std::locale *)v63);
  size_t v47 = (void **)v65;
  if (v65)
  {
    unint64_t v48 = v66;
    std::string v49 = v65;
    if (v66 != v65)
    {
      do
      {
        if (*((char *)v48 - 1) < 0) {
          operator delete(*(v48 - 3));
        }
        v48 -= 3;
      }
      while (v48 != v47);
      std::string v49 = v65;
    }
    std::string::size_type v66 = v47;
    operator delete(v49);
  }
  return v17;
}

void sub_1C5961348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, std::locale a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,void *__p,uint64_t a35,uint64_t a36,std::locale a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46,uint64_t a47,uint64_t a48,void *a49,uint64_t a50,int a51,__int16 a52,char a53,char a54,uint64_t a55,uint64_t a56)
{
  std::ifstream::~ifstream(&a56);
  if (v56 < 0) {
    operator delete(__p);
  }
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a37);
  std::vector<std::string>::~vector[abi:ne180100](&a46);
  _Unwind_Resume(a1);
}

void sub_1C5961404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *__p,uint64_t a51,int a52,__int16 a53,char a54,char a55)
{
  if (a55 < 0)
  {
    operator delete(__p);
    if (a33 < 0)
    {
LABEL_5:
      operator delete(a28);
      std::vector<std::string>::~vector[abi:ne180100](&a43);
      _Unwind_Resume(a1);
    }
  }
  else if (a33 < 0)
  {
    goto LABEL_5;
  }
  std::vector<std::string>::~vector[abi:ne180100](&a43);
  _Unwind_Resume(a1);
}

void sub_1C5961460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40)
{
}

void util::findLastLogDumpTimestamp(util *this@<X0>, const char *__s@<X1>, const char *a3@<X2>, int a4@<W3>, char *a5@<X4>, std::string *a6@<X8>)
{
  unsigned int v8 = a3;
  uint64_t v10 = a6;
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  a6->__r_.__value_.__r.__words[0] = 0;
  a6->__r_.__value_.__l.__size_ = 0;
  a6->__r_.__value_.__r.__words[2] = 0;
  CFAllocatorRef v138 = 0;
  std::string v139 = 0;
  uint64_t v140 = 0;
  memset(v137, 170, sizeof(v137));
  size_t v11 = strlen(__s);
  unint64_t v103 = v10;
  if (v11 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v12 = v11;
  if (v11 >= 0x17)
  {
    uint64_t v14 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17) {
      uint64_t v14 = v11 | 7;
    }
    uint64_t v15 = v14 + 1;
    p_dst = (long long *)operator new(v14 + 1);
    *((void *)&__dst + 1) = v12;
    *(void *)int v142 = v15 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    goto LABEL_8;
  }
  v142[7] = v11;
  p_dst = &__dst;
  if (v11) {
LABEL_8:
  }
    memcpy(p_dst, __s, v12);
  *((unsigned char *)p_dst + v12) = 0;
  uint64_t v16 = std::string::append((std::string *)&__dst, ".*", 2uLL);
  long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v137[2] = (void *)v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)CFAllocatorRef v137 = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  if ((v142[7] & 0x80000000) != 0) {
    operator delete((void *)__dst);
  }
  *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v135[32] = v18;
  long long v136 = v18;
  *(_OWORD *)CFAllocatorRef v135 = v18;
  *(_OWORD *)&v135[16] = v18;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>((uint64_t)v135, (uint64_t)v137, 0);
  *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v133[32] = v19;
  long long v134 = v19;
  *(_OWORD *)uint64_t v133 = v19;
  *(_OWORD *)&v133[16] = v19;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)v133, "(\\d{4})-(\\d{2})-(\\d{2})-(\\d{2})-(\\d{2})-(\\d{2})-(\\d{3})", 0);
  BOOL v104 = a5 == 0;
  size_t v20 = strlen((const char *)this);
  if (v20 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  int v21 = (void *)v20;
  if (v20 >= 0x17)
  {
    uint64_t v23 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v20 | 7) != 0x17) {
      uint64_t v23 = v20 | 7;
    }
    uint64_t v24 = v23 + 1;
    uint64_t v22 = operator new(v23 + 1);
    unint64_t v132 = v24 | 0x8000000000000000;
    __p[0] = v22;
    __p[1] = v21;
    goto LABEL_18;
  }
  HIBYTE(v132) = v20;
  uint64_t v22 = __p;
  if (v20) {
LABEL_18:
  }
    memcpy(v22, this, (size_t)v21);
  *((unsigned char *)v21 + (void)v22) = 0;
  std::locale::locale(&v125, (const std::locale *)v135);
  long long v126 = *(_OWORD *)&v135[8];
  long long v127 = *(_OWORD *)&v135[24];
  uint64_t v128 = *(void *)&v135[40];
  CFAllocatorRef v129 = (std::__shared_weak_count *)v136;
  if ((void)v136) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v136 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v130 = *((void *)&v136 + 1);
  BOOL FilteredFiles = support::fs::getFilteredFiles((const char *)__p, (uint64_t)&v125, (uint64_t)&v138, 0);
  char v26 = v129;
  if (v129 && !atomic_fetch_add(&v129->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
    std::__shared_weak_count::__release_weak(v26);
    std::locale::~locale(&v125);
    if ((SHIBYTE(v132) & 0x80000000) == 0)
    {
LABEL_24:
      if (!FilteredFiles) {
        goto LABEL_167;
      }
      goto LABEL_28;
    }
  }
  else
  {
    std::locale::~locale(&v125);
    if ((SHIBYTE(v132) & 0x80000000) == 0) {
      goto LABEL_24;
    }
  }
  operator delete(__p[0]);
  if (!FilteredFiles) {
    goto LABEL_167;
  }
LABEL_28:
  unint64_t v28 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (v139 - v138));
  if (v139 == v138) {
    uint64_t v29 = 0;
  }
  else {
    uint64_t v29 = v28;
  }
  std::__introsort<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*,false>((unint64_t)v138, v139, v29, 1, v27);
  memset(&v124, 0, sizeof(v124));
  int v30 = v138;
  uint64_t v102 = v139;
  if (v138 == v139)
  {
LABEL_167:
    if (!v8) {
      goto LABEL_184;
    }
LABEL_168:
    if (SHIBYTE(v10->__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v111, v10->__r_.__value_.__l.__data_, v10->__r_.__value_.__l.__size_);
    }
    else {
      std::string v111 = *v10;
    }
    std::locale::locale(&v105, (const std::locale *)v133);
    long long v106 = *(_OWORD *)&v133[8];
    long long v107 = *(_OWORD *)&v133[24];
    uint64_t v108 = *(void *)&v133[40];
    std::string::size_type v109 = (std::__shared_weak_count *)v134;
    if ((void)v134) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v134 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v110 = *((void *)&v134 + 1);
    BOOL v91 = util::checkLogFileAge((uint64_t)&v111, v8, (uint64_t)&v105);
    time_t v92 = v109;
    if (v109 && !atomic_fetch_add(&v109->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
      std::__shared_weak_count::__release_weak(v92);
      std::locale::~locale(&v105);
      if ((SHIBYTE(v111.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_176:
        if (!v91) {
          goto LABEL_184;
        }
LABEL_180:
        if (SHIBYTE(v10->__r_.__value_.__r.__words[2]) < 0)
        {
          *v10->__r_.__value_.__l.__data_ = 0;
          v10->__r_.__value_.__l.__size_ = 0;
        }
        else
        {
          v10->__r_.__value_.__s.__data_[0] = 0;
          *((unsigned char *)&v10->__r_.__value_.__s + 23) = 0;
        }
        goto LABEL_184;
      }
    }
    else
    {
      std::locale::~locale(&v105);
      if ((SHIBYTE(v111.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_176;
      }
    }
    operator delete(v111.__r_.__value_.__l.__data_);
    if (!v91) {
      goto LABEL_184;
    }
    goto LABEL_180;
  }
  unsigned int v98 = v8;
  uint64_t v100 = a5;
  while (1)
  {
    memset(&v123, 170, sizeof(v123));
    if (*((char *)v30 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v123, (const std::string::value_type *)*v30, (std::string::size_type)v30[1]);
    }
    else
    {
      long long v31 = *(_OWORD *)v30;
      v123.__r_.__value_.__r.__words[2] = (std::string::size_type)v30[2];
      *(_OWORD *)&v123.__r_.__value_.__l.__data_ = v31;
    }
    if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int64_t size = HIBYTE(v124.__r_.__value_.__r.__words[2]);
    }
    else {
      int64_t size = v124.__r_.__value_.__l.__size_;
    }
    std::string::size_type v33 = HIBYTE(v123.__r_.__value_.__r.__words[2]);
    int v34 = SHIBYTE(v123.__r_.__value_.__r.__words[2]);
    uint64_t v35 = (std::string *)v123.__r_.__value_.__r.__words[0];
    if (size)
    {
      if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int v36 = &v124;
      }
      else {
        int v36 = (std::string *)v124.__r_.__value_.__r.__words[0];
      }
      if ((v123.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v37 = &v123;
      }
      else {
        uint64_t v37 = (std::string *)v123.__r_.__value_.__r.__words[0];
      }
      int64_t v38 = v123.__r_.__value_.__l.__size_;
      if ((v123.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int64_t v38 = HIBYTE(v123.__r_.__value_.__r.__words[2]);
      }
      if (v38 >= size)
      {
        uint64_t v63 = (char *)v37 + v38;
        int v64 = v36->__r_.__value_.__s.__data_[0];
        char v65 = v37;
        do
        {
          int64_t v66 = v38 - size;
          if (v66 == -1) {
            break;
          }
          uint64_t v67 = (char *)memchr(v65, v64, v66 + 1);
          if (!v67) {
            break;
          }
          unint64_t v68 = v67;
          if (!memcmp(v67, v36, size))
          {
            if (v68 == v63 || v68 - (char *)v37 == -1) {
              break;
            }
            int v61 = 3;
            uint64_t v10 = v103;
            if ((v34 & 0x80) == 0) {
              goto LABEL_150;
            }
            goto LABEL_106;
          }
          char v65 = (std::string *)(v68 + 1);
          int64_t v38 = v63 - (v68 + 1);
        }
        while (v38 >= size);
      }
    }
    *(void *)&long long v39 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v121 = v39;
    unint64_t v118 = 0xAAAAAAAAAAAAAA00;
    v115[1].__end_cap_.__value_ = (std::sub_match<std::__wrap_iter<const char *>> *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v116 = 0;
    uint64_t v117 = 0;
    uint64_t v119 = 0;
    uint64_t v120 = 0;
    LOBYTE(v121) = 0;
    BYTE8(v121) = 0;
    uint64_t v122 = 0;
    memset(v115, 0, 41);
    if (v104)
    {
      std::string::size_type v40 = v123.__r_.__value_.__l.__size_;
      long long v148 = v39;
      unint64_t v145 = 0xAAAAAAAAAAAAAA00;
      *(void *)&v142[24] = v39;
      uint64_t v143 = 0;
      uint64_t v144 = 0;
      uint64_t v146 = 0;
      uint64_t v147 = 0;
      LOBYTE(v148) = 0;
      BYTE8(v148) = 0;
      uint64_t v149 = 0;
      long long __dst = 0uLL;
      *(_OWORD *)int v142 = 0uLL;
      if (v34 >= 0) {
        uint64_t v41 = (std::sub_match<const char *> *)&v123;
      }
      else {
        uint64_t v41 = (std::sub_match<const char *> *)v35;
      }
      if (v34 >= 0) {
        std::string::size_type v40 = v33;
      }
      *(_OWORD *)&v142[9] = 0uLL;
      uint64_t v10 = v103;
      int v42 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)v133, v41, (std::sub_match<const char *> *)((char *)v41 + v40), (std::vector<std::csub_match> *)&__dst, 0);
      std::string::size_type v43 = HIBYTE(v123.__r_.__value_.__r.__words[2]);
      if ((v123.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v44 = &v123;
      }
      else {
        uint64_t v44 = (std::string *)v123.__r_.__value_.__r.__words[0];
      }
      if ((v123.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type v43 = v123.__r_.__value_.__l.__size_;
      }
      std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>(v115, (uint64_t)v44, (std::sub_match<std::__wrap_iter<const char *>> *)((char *)v44 + v43), (uint64_t *)&__dst, 0);
      if ((void)__dst)
      {
        *((void *)&__dst + 1) = __dst;
        operator delete((void *)__dst);
      }
      if (v42)
      {
        p_end_cap = &v115[1].__end_cap_;
        if (v115[0].__end_ != v115[0].__begin_) {
          p_end_cap = &v115[0].__begin_->matched;
        }
        if (!*p_end_cap)
        {
          long long __dst = 0uLL;
          *(void *)int v142 = 0;
          if ((SHIBYTE(v103->__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_116;
          }
          goto LABEL_101;
        }
        std::vector<std::ssub_match>::pointer begin = (std::vector<std::ssub_match>::pointer)&v115[1];
        if (v115[0].__end_ != v115[0].__begin_) {
          std::vector<std::ssub_match>::pointer begin = v115[0].__begin_;
        }
        std::__wrap_iter<const char *>::iterator_type i = begin->first.__i_;
        p_std::__wrap_iter<const char *>::iterator_type i = &v115[0].__begin_->second.__i_;
        if (v115[0].__end_ == v115[0].__begin_) {
          p_std::__wrap_iter<const char *>::iterator_type i = (const char **)&v115[1].__end_;
        }
        std::string v49 = *p_i;
        unint64_t v50 = *p_i - i;
        if (v50 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v50 > 0x16)
        {
          uint64_t v75 = (v50 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v50 | 7) != 0x17) {
            uint64_t v75 = v50 | 7;
          }
          uint64_t v76 = v75 + 1;
          uint64_t v51 = (long long *)operator new(v75 + 1);
          *((void *)&__dst + 1) = v50;
          *(void *)int v142 = v76 | 0x8000000000000000;
          *(void *)&long long __dst = v51;
          if (i != v49)
          {
LABEL_74:
            if (v50 < 0x20 || (unint64_t)((char *)v51 - i) < 0x20)
            {
              char v52 = v51;
              uint64_t v53 = i;
            }
            else
            {
              char v52 = (long long *)((char *)v51 + (v50 & 0xFFFFFFFFFFFFFFE0));
              uint64_t v53 = &i[v50 & 0xFFFFFFFFFFFFFFE0];
              std::string v54 = (long long *)(i + 16);
              std::locale v55 = v51 + 1;
              unint64_t v56 = v50 & 0xFFFFFFFFFFFFFFE0;
              do
              {
                long long v57 = *v54;
                *(v55 - 1) = *(v54 - 1);
                _OWORD *v55 = v57;
                v54 += 2;
                v55 += 2;
                v56 -= 32;
              }
              while (v56);
              if (v50 == (v50 & 0x7FFFFFFFFFFFFFE0))
              {
LABEL_115:
                *(unsigned char *)char v52 = 0;
                if ((SHIBYTE(v103->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                {
LABEL_116:
                  *(_OWORD *)&v103->__r_.__value_.__l.__data_ = __dst;
                  v103->__r_.__value_.__r.__words[2] = *(void *)v142;
                  if (a4) {
                    goto LABEL_117;
                  }
                  goto LABEL_141;
                }
LABEL_101:
                operator delete(v103->__r_.__value_.__l.__data_);
                *(_OWORD *)&v103->__r_.__value_.__l.__data_ = __dst;
                v103->__r_.__value_.__r.__words[2] = *(void *)v142;
                if (a4)
                {
LABEL_117:
                  size_t v78 = strlen((const char *)this);
                  if (v78 > 0x7FFFFFFFFFFFFFF7) {
                    std::string::__throw_length_error[abi:ne180100]();
                  }
                  long long v79 = (void *)v78;
                  if (v78 >= 0x17)
                  {
                    uint64_t v81 = (v78 & 0xFFFFFFFFFFFFFFF8) + 8;
                    if ((v78 | 7) != 0x17) {
                      uint64_t v81 = v78 | 7;
                    }
                    uint64_t v82 = v81 + 1;
                    uint64_t v80 = operator new(v81 + 1);
                    v113[1] = v79;
                    unint64_t v114 = v82 | 0x8000000000000000;
                    v113[0] = v80;
                  }
                  else
                  {
                    HIBYTE(v114) = v78;
                    uint64_t v80 = v113;
                    if (!v78)
                    {
                      LOBYTE(v113[0]) = 0;
                      if ((SHIBYTE(v103->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                      {
LABEL_121:
                        std::string v112 = *v103;
                        goto LABEL_127;
                      }
LABEL_126:
                      std::string::__init_copy_ctor_external(&v112, v103->__r_.__value_.__l.__data_, v103->__r_.__value_.__l.__size_);
LABEL_127:
                      BOOL isDumpForSysdiagnose = util::isDumpForSysdiagnose((uint64_t)v113, (uint64_t)&v112);
                      if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0)
                      {
                        operator delete(v112.__r_.__value_.__l.__data_);
                        if ((SHIBYTE(v114) & 0x80000000) == 0)
                        {
LABEL_129:
                          if (isDumpForSysdiagnose) {
                            goto LABEL_130;
                          }
                          goto LABEL_141;
                        }
                      }
                      else if ((SHIBYTE(v114) & 0x80000000) == 0)
                      {
                        goto LABEL_129;
                      }
                      operator delete(v113[0]);
                      if (isDumpForSysdiagnose)
                      {
LABEL_130:
                        unint64_t v84 = GetOsLogContext()[1];
                        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                        {
                          if ((v103->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                            std::string v85 = v103;
                          }
                          else {
                            std::string v85 = (std::string *)v103->__r_.__value_.__r.__words[0];
                          }
                          LODWORD(__dst) = 136315138;
                          *(void *)((char *)&__dst + 4) = v85;
                          _os_log_impl(&dword_1C5767000, v84, OS_LOG_TYPE_DEFAULT, "Ignore dump for sysdiagnose: %s", (uint8_t *)&__dst, 0xCu);
                        }
                        if (&v124 != v103)
                        {
                          char v86 = HIBYTE(v103->__r_.__value_.__r.__words[2]);
                          if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0)
                          {
                            if (v86 >= 0) {
                              uint64_t v89 = v103;
                            }
                            else {
                              uint64_t v89 = (std::string *)v103->__r_.__value_.__r.__words[0];
                            }
                            if (v86 >= 0) {
                              size_t v90 = HIBYTE(v103->__r_.__value_.__r.__words[2]);
                            }
                            else {
                              size_t v90 = v103->__r_.__value_.__l.__size_;
                            }
                            std::string::__assign_no_alias<false>((void **)&v124.__r_.__value_.__l.__data_, v89, v90);
                          }
                          else
                          {
                            if ((*((unsigned char *)&v103->__r_.__value_.__s + 23) & 0x80) == 0)
                            {
                              std::string v124 = *v103;
LABEL_164:
                              int v61 = 0;
                              v103->__r_.__value_.__s.__data_[0] = 0;
                              *((unsigned char *)&v103->__r_.__value_.__s + 23) = 0;
                              goto LABEL_146;
                            }
                            std::string::__assign_no_alias<true>(&v124, v103->__r_.__value_.__l.__data_, v103->__r_.__value_.__l.__size_);
                          }
                        }
                        if (SHIBYTE(v103->__r_.__value_.__r.__words[2]) < 0)
                        {
                          int v61 = 0;
                          *v103->__r_.__value_.__l.__data_ = 0;
                          v103->__r_.__value_.__l.__size_ = 0;
                          goto LABEL_146;
                        }
                        goto LABEL_164;
                      }
                      goto LABEL_141;
                    }
                  }
                  memcpy(v80, this, (size_t)v79);
                  *((unsigned char *)v79 + (void)v80) = 0;
                  if ((SHIBYTE(v103->__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                    goto LABEL_121;
                  }
                  goto LABEL_126;
                }
LABEL_141:
                int v61 = 2;
LABEL_146:
                char v87 = 1;
LABEL_147:
                BOOL v104 = v87;
                std::string v62 = v115[0].__begin_;
                if (v115[0].__begin_) {
                  goto LABEL_148;
                }
                goto LABEL_149;
              }
            }
            do
            {
              char v77 = *v53++;
              *(unsigned char *)char v52 = v77;
              char v52 = (long long *)((char *)v52 + 1);
            }
            while (v53 != v49);
            goto LABEL_115;
          }
        }
        else
        {
          v142[7] = *(unsigned char *)p_i - (_BYTE)i;
          uint64_t v51 = &__dst;
          if (i != v49) {
            goto LABEL_74;
          }
        }
        *(unsigned char *)uint64_t v51 = 0;
        if ((SHIBYTE(v103->__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_116;
        }
        goto LABEL_101;
      }
LABEL_145:
      int v61 = 0;
      goto LABEL_146;
    }
    if (v34 >= 0) {
      uint64_t v35 = &v123;
    }
    int64_t v58 = strlen(v100);
    uint64_t v10 = v103;
    if (!v58)
    {
LABEL_144:
      std::string::__assign_external(&v124, v100);
      goto LABEL_145;
    }
    int64_t v59 = v58;
    int64_t v60 = v123.__r_.__value_.__l.__size_;
    if (v34 >= 0) {
      int64_t v60 = v33;
    }
    if (v60 >= v58)
    {
      int v69 = (char *)v35 + v60;
      int v70 = *v100;
      unint64_t v71 = v35;
      do
      {
        int64_t v72 = v60 - v59;
        if (v72 == -1) {
          break;
        }
        uint64_t v73 = (char *)memchr(v71, v70, v72 + 1);
        if (!v73) {
          break;
        }
        unint64_t v74 = v73;
        if (!memcmp(v73, v100, v59))
        {
          char v87 = 0;
          if (v74 != v69)
          {
            int64_t v88 = v74 - (char *)v35;
            int v61 = 0;
            if (v88 == -1) {
              goto LABEL_147;
            }
            goto LABEL_144;
          }
          int v61 = 0;
          BOOL v104 = 0;
          std::string v62 = v115[0].__begin_;
          if (v115[0].__begin_) {
            goto LABEL_148;
          }
          goto LABEL_149;
        }
        unint64_t v71 = (std::string *)(v74 + 1);
        int64_t v60 = v69 - (v74 + 1);
      }
      while (v60 >= v59);
    }
    int v61 = 0;
    BOOL v104 = 0;
    std::string v62 = v115[0].__begin_;
    if (v115[0].__begin_)
    {
LABEL_148:
      v115[0].__end_ = v62;
      operator delete(v62);
    }
LABEL_149:
    if ((*((unsigned char *)&v123.__r_.__value_.__s + 23) & 0x80) != 0) {
      break;
    }
LABEL_150:
    if (v61 != 3) {
      goto LABEL_151;
    }
LABEL_33:
    v30 += 3;
    if (v30 == v102) {
      goto LABEL_166;
    }
  }
LABEL_106:
  operator delete(v123.__r_.__value_.__l.__data_);
  if (v61 == 3) {
    goto LABEL_33;
  }
LABEL_151:
  if (!v61) {
    goto LABEL_33;
  }
LABEL_166:
  unsigned int v8 = v98;
  if ((SHIBYTE(v124.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
    goto LABEL_167;
  }
  operator delete(v124.__r_.__value_.__l.__data_);
  if (v98) {
    goto LABEL_168;
  }
LABEL_184:
  std::string v93 = (std::__shared_weak_count *)v134;
  if ((void)v134 && !atomic_fetch_add((atomic_ullong *volatile)(v134 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v93->__on_zero_shared)(v93);
    std::__shared_weak_count::__release_weak(v93);
    std::locale::~locale((std::locale *)v133);
    int v94 = (std::__shared_weak_count *)v136;
    if (!(void)v136) {
      goto LABEL_188;
    }
LABEL_187:
    if (atomic_fetch_add(&v94->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_188;
    }
    ((void (*)(std::__shared_weak_count *))v94->__on_zero_shared)(v94);
    std::__shared_weak_count::__release_weak(v94);
    std::locale::~locale((std::locale *)v135);
    if (SHIBYTE(v137[2]) < 0) {
LABEL_189:
    }
      operator delete(v137[0]);
  }
  else
  {
    std::locale::~locale((std::locale *)v133);
    int v94 = (std::__shared_weak_count *)v136;
    if ((void)v136) {
      goto LABEL_187;
    }
LABEL_188:
    std::locale::~locale((std::locale *)v135);
    if (SHIBYTE(v137[2]) < 0) {
      goto LABEL_189;
    }
  }
  long long v95 = v138;
  if (v138)
  {
    uint64_t v96 = v139;
    unint64_t v97 = v138;
    if (v139 != v138)
    {
      do
      {
        if (*((char *)v96 - 1) < 0) {
          operator delete((void *)*(v96 - 3));
        }
        v96 -= 3;
      }
      while (v96 != v95);
      unint64_t v97 = v138;
    }
    std::string v139 = v95;
    operator delete(v97);
  }
}

void sub_1C59620F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex((std::locale *)&STACK[0x220]);
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex((std::locale *)&STACK[0x260]);
  if (SLOBYTE(STACK[0x2B7]) < 0) {
    operator delete((void *)STACK[0x2A0]);
  }
  std::vector<std::string>::~vector[abi:ne180100]((void **)(v24 - 248));
  if (*(char *)(a24 + 23) < 0) {
    operator delete(*(void **)a24);
  }
  _Unwind_Resume(a1);
}

uint64_t util::getNumberOfLogDumps(uint64_t a1, const void **a2)
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  unint64_t v145 = 0;
  uint64_t v146 = 0;
  uint64_t v147 = 0;
  long long v142 = 0u;
  long long v143 = 0u;
  unint64_t v144 = 0xAAAAAAAA3F800000;
  size_t v4 = (char *)operator new(0x48uLL);
  unint64_t v5 = v4;
  strcpy(v4, "[0-9]{4}-[0-9]{2}-[0-9]{2}-[0-9]{2}-[0-9]{2}-[0-9]{2,4}-[0-9]{3}");
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v140[32] = v6;
  long long v141 = v6;
  *(_OWORD *)uint64_t v140 = v6;
  *(_OWORD *)&v140[16] = v6;
  int v7 = *((char *)a2 + 23);
  if (v7 >= 0) {
    size_t v8 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v8 = (size_t)a2[1];
  }
  unint64_t v9 = v8 + 64;
  memset(__dst, 170, 24);
  std::locale v125 = v4;
  if (v8 + 64 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v9 <= 0x16)
  {
    memset(__dst, 0, 24);
    uint64_t v10 = __dst;
    __dst[23] = v8 + 64;
LABEL_10:
    if (v7 >= 0) {
      unint64_t v13 = a2;
    }
    else {
      unint64_t v13 = *a2;
    }
    memmove(v10, v13, v8);
    goto LABEL_14;
  }
  uint64_t v11 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v9 | 7) != 0x17) {
    uint64_t v11 = v9 | 7;
  }
  uint64_t v12 = v11 + 1;
  uint64_t v10 = operator new(v11 + 1);
  *(void *)&__dst[8] = v8 + 64;
  *(void *)&__dst[16] = v12 | 0x8000000000000000;
  *(void *)long long __dst = v10;
  if (v8) {
    goto LABEL_10;
  }
LABEL_14:
  uint64_t v14 = &v10[v8];
  long long v15 = *(_OWORD *)v5;
  long long v16 = *((_OWORD *)v5 + 1);
  long long v17 = *((_OWORD *)v5 + 3);
  *((_OWORD *)v14 + 2) = *((_OWORD *)v5 + 2);
  *((_OWORD *)v14 + 3) = v17;
  *(_OWORD *)uint64_t v14 = v15;
  *((_OWORD *)v14 + 1) = v16;
  v14[64] = 0;
  long long v18 = std::string::append((std::string *)__dst, ".*", 2uLL);
  long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  *(void *)&__p[16] = *((void *)&v18->__r_.__value_.__l + 2);
  *(_OWORD *)tm __p = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>((uint64_t)v140, (uint64_t)__p, 0);
  if ((__p[23] & 0x80000000) != 0)
  {
    operator delete(*(void **)__p);
    if ((__dst[23] & 0x80000000) == 0) {
      goto LABEL_16;
    }
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_16;
  }
  operator delete(*(void **)__dst);
LABEL_16:
  *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v138 = v20;
  long long v139 = v20;
  long long v137 = v20;
  *(_OWORD *)&v136[0].__locale_ = v20;
  int v21 = *((char *)a2 + 23);
  if (v21 >= 0) {
    size_t v22 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v22 = (size_t)a2[1];
  }
  unint64_t v23 = v22 + 64;
  memset(__dst, 170, 24);
  if (v22 + 64 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v23 <= 0x16)
  {
    memset(__dst, 0, 24);
    uint64_t v24 = __dst;
    __dst[23] = v22 + 64;
LABEL_25:
    if (v21 >= 0) {
      __n128 v27 = a2;
    }
    else {
      __n128 v27 = *a2;
    }
    memmove(v24, v27, v22);
    goto LABEL_29;
  }
  uint64_t v25 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v23 | 7) != 0x17) {
    uint64_t v25 = v23 | 7;
  }
  uint64_t v26 = v25 + 1;
  uint64_t v24 = operator new(v25 + 1);
  *(void *)&__dst[8] = v22 + 64;
  *(void *)&__dst[16] = v26 | 0x8000000000000000;
  *(void *)long long __dst = v24;
  if (v22) {
    goto LABEL_25;
  }
LABEL_29:
  unint64_t v28 = &v24[v22];
  long long v29 = *(_OWORD *)v5;
  long long v30 = *((_OWORD *)v5 + 1);
  long long v31 = *((_OWORD *)v5 + 3);
  *((_OWORD *)v28 + 2) = *((_OWORD *)v5 + 2);
  *((_OWORD *)v28 + 3) = v31;
  *(_OWORD *)unint64_t v28 = v29;
  *((_OWORD *)v28 + 1) = v30;
  v28[64] = 0;
  int v32 = std::string::append((std::string *)__dst, "(?=-*)(?!\\.json)", 0x10uLL);
  long long v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
  *(void *)&__p[16] = *((void *)&v32->__r_.__value_.__l + 2);
  *(_OWORD *)tm __p = v33;
  v32->__r_.__value_.__l.__size_ = 0;
  v32->__r_.__value_.__r.__words[2] = 0;
  v32->__r_.__value_.__r.__words[0] = 0;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>((uint64_t)v136, (uint64_t)__p, 0);
  if ((__p[23] & 0x80000000) == 0)
  {
    if ((__dst[23] & 0x80000000) == 0) {
      goto LABEL_31;
    }
LABEL_36:
    operator delete(*(void **)__dst);
    if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_37;
  }
  operator delete(*(void **)__p);
  if ((__dst[23] & 0x80000000) != 0) {
    goto LABEL_36;
  }
LABEL_31:
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
LABEL_32:
    std::string v135 = *(std::string *)a1;
    goto LABEL_38;
  }
LABEL_37:
  std::string::__init_copy_ctor_external(&v135, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
LABEL_38:
  std::locale::locale(&v129, (const std::locale *)v140);
  long long v130 = *(_OWORD *)&v140[8];
  long long v131 = *(_OWORD *)&v140[24];
  uint64_t v132 = *(void *)&v140[40];
  uint64_t v133 = (std::__shared_weak_count *)v141;
  if ((void)v141) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v141 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v134 = *((void *)&v141 + 1);
  support::fs::getFilteredFiles((const char *)&v135, (uint64_t)&v129, (uint64_t)&v145, 0);
  int v34 = v133;
  if (v133 && !atomic_fetch_add(&v133->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
    std::__shared_weak_count::__release_weak(v34);
    std::locale::~locale(&v129);
    if ((SHIBYTE(v135.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_43:
      int v36 = (std::sub_match<const char *> *)v145;
      uint64_t v35 = v146;
      if (v145 == v146) {
        goto LABEL_219;
      }
      goto LABEL_47;
    }
  }
  else
  {
    std::locale::~locale(&v129);
    if ((SHIBYTE(v135.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_43;
    }
  }
  operator delete(v135.__r_.__value_.__l.__data_);
  int v36 = (std::sub_match<const char *> *)v145;
  uint64_t v35 = v146;
  if (v145 != v146)
  {
LABEL_47:
    long long v126 = v35;
    while (1)
    {
      *(void *)&long long v37 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v37 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v162 = v37;
      unint64_t v159 = 0xAAAAAAAAAAAAAA00;
      *(void *)&__dst[40] = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v157 = 0;
      uint64_t v158 = 0;
      uint64_t v160 = 0;
      uint64_t v161 = 0;
      LOBYTE(v162) = 0;
      BYTE8(v162) = 0;
      uint64_t v163 = 0;
      memset(__dst, 0, 41);
      long long v154 = v37;
      unint64_t v151 = 0xAAAAAAAAAAAAAA00;
      *(void *)&__p[40] = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v149 = 0;
      uint64_t v150 = 0;
      uint64_t v152 = 0;
      uint64_t v153 = 0;
      LOBYTE(v154) = 0;
      BYTE8(v154) = 0;
      uint64_t v155 = 0;
      memset(__p, 0, 41);
      second = (const char *)*((unsigned __int8 *)&v36->matched + 7);
      if ((char)second >= 0) {
        first = v36;
      }
      else {
        first = (std::sub_match<const char *> *)v36->first;
      }
      if ((char)second < 0) {
        second = v36->second;
      }
      int v40 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)v136, first, (std::sub_match<const char *> *)&second[(void)first], (std::vector<std::csub_match> *)__p, 0);
      uint64_t v41 = (const char *)*((unsigned __int8 *)&v36->matched + 7);
      if ((char)v41 >= 0) {
        uint64_t v42 = (uint64_t)v36;
      }
      else {
        uint64_t v42 = (uint64_t)v36->first;
      }
      if ((char)v41 < 0) {
        uint64_t v41 = v36->second;
      }
      std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((std::vector<std::ssub_match> *)__dst, v42, (std::sub_match<std::__wrap_iter<const char *>> *)&v41[v42], (uint64_t *)__p, 0);
      if (*(void *)__p)
      {
        *(void *)&__p[8] = *(void *)__p;
        operator delete(*(void **)__p);
      }
      if (!v40) {
        goto LABEL_217;
      }
      std::string::size_type v43 = *(void *)&__dst[8] == *(void *)__dst ? &__dst[40] : (unsigned char *)(*(void *)__dst + 16);
      if (*v43) {
        break;
      }
      unint64_t v56 = 0;
      long long v57 = 0;
      unint64_t v58 = 0;
      v127[0] = 0;
      v127[1] = 0;
      int64_t v128 = 0;
LABEL_87:
      if ((v58 & 0x80u) == 0) {
        std::string v62 = (uint64_t *)v127;
      }
      else {
        std::string v62 = v57;
      }
      if ((v58 & 0x80u) == 0) {
        unint64_t v63 = v58;
      }
      else {
        unint64_t v63 = (unint64_t)v56;
      }
      unint64_t v64 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)__p, v62, v63);
      unint64_t v65 = v64;
      unint64_t v66 = *((void *)&v142 + 1);
      if (!*((void *)&v142 + 1))
      {
        unint64_t v68 = 0xAAAAAAAAAAAAAAAALL;
LABEL_143:
        *(void *)&__p[16] = 0xAAAAAAAAAAAAAA01;
        char v87 = operator new(0x28uLL);
        *(void *)tm __p = v87;
        *(void *)&__p[8] = &v143;
        void *v87 = 0;
        v87[1] = v65;
        *((_OWORD *)v87 + 1) = *(_OWORD *)v127;
        v87[4] = v128;
        v127[0] = 0;
        v127[1] = 0;
        int64_t v128 = 0;
        float v88 = (float)(unint64_t)(*((void *)&v143 + 1) + 1);
        if (v66 && (float)(*(float *)&v144 * (float)v66) >= v88)
        {
          uint64_t v35 = v126;
          uint64_t v89 = v142;
          size_t v90 = *(void **)(v142 + 8 * v68);
          if (v90) {
            goto LABEL_146;
          }
LABEL_195:
          void *v87 = v143;
          *(void *)&long long v143 = v87;
          *(void *)(v89 + 8 * v68) = &v143;
          if (*v87)
          {
            unint64_t v111 = *(void *)(*v87 + 8);
            if ((v66 & (v66 - 1)) != 0)
            {
              if (v111 >= v66) {
                v111 %= v66;
              }
            }
            else
            {
              v111 &= v66 - 1;
            }
            size_t v90 = (void *)(v142 + 8 * v111);
LABEL_214:
            void *v90 = v87;
          }
          ++*((void *)&v143 + 1);
          if (v128 < 0) {
            goto LABEL_216;
          }
          goto LABEL_217;
        }
        BOOL v91 = (v66 & (v66 - 1)) != 0;
        if (v66 < 3) {
          BOOL v91 = 1;
        }
        unint64_t v92 = v91 | (2 * v66);
        unint64_t v93 = vcvtps_u32_f32(v88 / *(float *)&v144);
        if (v92 <= v93) {
          size_t prime = v93;
        }
        else {
          size_t prime = v92;
        }
        uint64_t v35 = v126;
        if (prime == 1)
        {
          size_t prime = 2;
        }
        else if ((prime & (prime - 1)) != 0)
        {
          size_t prime = std::__next_prime(prime);
          unint64_t v66 = *((void *)&v142 + 1);
        }
        if (prime <= v66)
        {
          if (prime >= v66) {
            goto LABEL_193;
          }
          unint64_t v105 = vcvtps_u32_f32((float)*((unint64_t *)&v143 + 1) / *(float *)&v144);
          if (v66 < 3 || (uint8x8_t v106 = (uint8x8_t)vcnt_s8((int8x8_t)v66), v106.i16[0] = vaddlv_u8(v106), v106.u32[0] > 1uLL))
          {
            unint64_t v105 = std::__next_prime(v105);
          }
          else
          {
            uint64_t v107 = 1 << -(char)__clz(v105 - 1);
            if (v105 >= 2) {
              unint64_t v105 = v107;
            }
          }
          if (prime <= v105) {
            size_t prime = v105;
          }
          if (prime < v66)
          {
            if (prime) {
              goto LABEL_157;
            }
            std::string::size_type v109 = (void *)v142;
            *(void *)&long long v142 = 0;
            if (v109) {
              operator delete(v109);
            }
            unint64_t v66 = 0;
            *((void *)&v142 + 1) = 0;
            uint64_t v110 = -1;
            goto LABEL_194;
          }
          unint64_t v66 = *((void *)&v142 + 1);
          uint64_t v110 = *((void *)&v142 + 1) - 1;
          if ((*((void *)&v142 + 1) & (*((void *)&v142 + 1) - 1)) == 0) {
            goto LABEL_194;
          }
          goto LABEL_206;
        }
LABEL_157:
        if (prime >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        long long v95 = operator new(8 * prime);
        uint64_t v96 = (void *)v142;
        *(void *)&long long v142 = v95;
        if (v96) {
          operator delete(v96);
        }
        uint64_t v97 = 0;
        *((void *)&v142 + 1) = prime;
        do
          *(void *)(v142 + 8 * v97++) = 0;
        while (prime != v97);
        unsigned int v98 = (void **)v143;
        if (!(void)v143)
        {
LABEL_205:
          unint64_t v66 = prime;
          uint64_t v110 = prime - 1;
          if ((prime & (prime - 1)) == 0) {
            goto LABEL_194;
          }
          goto LABEL_206;
        }
        size_t v99 = *(void *)(v143 + 8);
        size_t v100 = prime - 1;
        if ((prime & (prime - 1)) == 0)
        {
          size_t v101 = v99 & v100;
          *(void *)(v142 + 8 * v101) = &v143;
          for (std::__wrap_iter<const char *>::iterator_type i = *v98; *v98; std::__wrap_iter<const char *>::iterator_type i = *v98)
          {
            size_t v103 = i[1] & v100;
            if (v103 == v101)
            {
              unsigned int v98 = (void **)i;
            }
            else if (*(void *)(v142 + 8 * v103))
            {
              *unsigned int v98 = (void *)*i;
              uint64_t v104 = 8 * v103;
              *std::__wrap_iter<const char *>::iterator_type i = **(void **)(v142 + v104);
              **(void **)(v142 + v104) = i;
            }
            else
            {
              *(void *)(v142 + 8 * v103) = v98;
              unsigned int v98 = (void **)i;
              size_t v101 = v103;
            }
          }
          goto LABEL_205;
        }
        if (v99 < prime)
        {
          *(void *)(v142 + 8 * v99) = &v143;
          uint64_t v108 = *v98;
          if (*v98) {
            goto LABEL_200;
          }
LABEL_192:
          unint64_t v66 = prime;
LABEL_193:
          uint64_t v110 = v66 - 1;
          if ((v66 & (v66 - 1)) == 0)
          {
LABEL_194:
            unint64_t v68 = v110 & v65;
            uint64_t v89 = v142;
            size_t v90 = *(void **)(v142 + 8 * (v110 & v65));
            if (!v90) {
              goto LABEL_195;
            }
LABEL_146:
            void *v87 = *v90;
            goto LABEL_214;
          }
LABEL_206:
          if (v65 >= v66)
          {
            unint64_t v68 = v65 % v66;
            uint64_t v89 = v142;
            size_t v90 = *(void **)(v142 + 8 * (v65 % v66));
            if (!v90) {
              goto LABEL_195;
            }
          }
          else
          {
            unint64_t v68 = v65;
            uint64_t v89 = v142;
            size_t v90 = *(void **)(v142 + 8 * v65);
            if (!v90) {
              goto LABEL_195;
            }
          }
          goto LABEL_146;
        }
        v99 %= prime;
        *(void *)(v142 + 8 * v99) = &v143;
        uint64_t v108 = *v98;
        if (!*v98) {
          goto LABEL_192;
        }
        while (1)
        {
LABEL_200:
          size_t v113 = v108[1];
          if (v113 >= prime) {
            v113 %= prime;
          }
          if (v113 == v99) {
            goto LABEL_199;
          }
          if (*(void *)(v142 + 8 * v113)) {
            break;
          }
          *(void *)(v142 + 8 * v113) = v98;
          unsigned int v98 = (void **)v108;
          uint64_t v108 = (void *)*v108;
          size_t v99 = v113;
          if (!v108) {
            goto LABEL_205;
          }
        }
        *unsigned int v98 = (void *)*v108;
        uint64_t v112 = 8 * v113;
        *uint64_t v108 = **(void **)(v142 + v112);
        **(void **)(v142 + v112) = v108;
        uint64_t v108 = v98;
LABEL_199:
        unsigned int v98 = (void **)v108;
        uint64_t v108 = (void *)*v108;
        if (!v108) {
          goto LABEL_205;
        }
        goto LABEL_200;
      }
      uint8x8_t v67 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v142 + 8));
      v67.i16[0] = vaddlv_u8(v67);
      if (v67.u32[0] > 1uLL)
      {
        unint64_t v68 = v64;
        if (v64 >= *((void *)&v142 + 1)) {
          unint64_t v68 = v64 % *((void *)&v142 + 1);
        }
      }
      else
      {
        unint64_t v68 = (*((void *)&v142 + 1) - 1) & v64;
      }
      int v69 = *(uint64_t ***)(v142 + 8 * v68);
      if (!v69) {
        goto LABEL_143;
      }
      int v70 = *v69;
      if (!*v69) {
        goto LABEL_143;
      }
      char v71 = HIBYTE(v128);
      if (v128 >= 0) {
        int64_t v72 = (void *)HIBYTE(v128);
      }
      else {
        int64_t v72 = v127[1];
      }
      if (v128 >= 0) {
        uint64_t v73 = v127;
      }
      else {
        uint64_t v73 = (void **)v127[0];
      }
      if (v67.u32[0] >= 2uLL)
      {
        while (1)
        {
          unint64_t v75 = v70[1];
          if (v75 == v65)
          {
            uint64_t v76 = *((unsigned __int8 *)v70 + 39);
            if ((v76 & 0x80u) == 0) {
              char v77 = (void *)*((unsigned __int8 *)v70 + 39);
            }
            else {
              char v77 = (void *)v70[3];
            }
            if (v77 == v72)
            {
              size_t v78 = (const void **)(v70 + 2);
              if ((v76 & 0x80) != 0)
              {
                if (!memcmp(*v78, v73, v70[3]))
                {
LABEL_125:
                  uint64_t v35 = v126;
                  if (v71 < 0) {
                    goto LABEL_216;
                  }
                  goto LABEL_217;
                }
              }
              else
              {
                if (!*((unsigned char *)v70 + 39)) {
                  goto LABEL_125;
                }
                long long v79 = v73;
                while (*(unsigned __int8 *)v78 == *(unsigned __int8 *)v79)
                {
                  size_t v78 = (const void **)((char *)v78 + 1);
                  long long v79 = (void **)((char *)v79 + 1);
                  if (!--v76) {
                    goto LABEL_125;
                  }
                }
              }
            }
          }
          else
          {
            if (v75 >= v66) {
              v75 %= v66;
            }
            if (v75 != v68) {
              goto LABEL_143;
            }
          }
          int v70 = (uint64_t *)*v70;
          if (!v70) {
            goto LABEL_143;
          }
        }
      }
      uint64_t v74 = *((void *)&v142 + 1) - 1;
      while (1)
      {
        uint64_t v80 = v70[1];
        if (v80 != v65)
        {
          if ((v80 & v74) != v68) {
            goto LABEL_143;
          }
          goto LABEL_128;
        }
        uint64_t v81 = *((unsigned __int8 *)v70 + 39);
        uint64_t v82 = (v81 & 0x80u) == 0 ? (void *)*((unsigned __int8 *)v70 + 39) : (void *)v70[3];
        if (v82 == v72) {
          break;
        }
LABEL_128:
        int v70 = (uint64_t *)*v70;
        if (!v70) {
          goto LABEL_143;
        }
      }
      size_t v83 = (const void **)(v70 + 2);
      if ((v81 & 0x80) == 0)
      {
        if (!*((unsigned char *)v70 + 39)) {
          goto LABEL_141;
        }
        unint64_t v84 = v73;
        while (*(unsigned __int8 *)v83 == *(unsigned __int8 *)v84)
        {
          size_t v83 = (const void **)((char *)v83 + 1);
          unint64_t v84 = (void **)((char *)v84 + 1);
          if (!--v81) {
            goto LABEL_141;
          }
        }
        goto LABEL_128;
      }
      std::string v124 = v72;
      uint64_t v85 = v74;
      int v86 = memcmp(*v83, v73, v70[3]);
      uint64_t v74 = v85;
      int64_t v72 = v124;
      if (v86) {
        goto LABEL_128;
      }
LABEL_141:
      uint64_t v35 = v126;
      if (v71 < 0) {
LABEL_216:
      }
        operator delete(v127[0]);
LABEL_217:
      if (*(void *)__dst)
      {
        *(void *)&__dst[8] = *(void *)__dst;
        operator delete(*(void **)__dst);
      }
      if (++v36 == v35) {
        goto LABEL_219;
      }
    }
    uint64_t v44 = (uint64_t *)&__dst[24];
    if (*(void *)&__dst[8] != *(void *)__dst) {
      uint64_t v44 = *(uint64_t **)__dst;
    }
    uint64_t v45 = *v44;
    uint64_t v46 = (char **)(*(void *)__dst + 8);
    if (*(void *)&__dst[8] == *(void *)__dst) {
      uint64_t v46 = (char **)&__dst[32];
    }
    size_t v47 = *v46;
    unint64_t v48 = (unint64_t)&(*v46)[-v45];
    if (v48 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v48 > 0x16)
    {
      uint64_t v59 = (v48 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v48 | 7) != 0x17) {
        uint64_t v59 = v48 | 7;
      }
      uint64_t v60 = v59 + 1;
      std::string v49 = operator new(v59 + 1);
      v127[1] = (void *)v48;
      int64_t v128 = v60 | 0x8000000000000000;
      v127[0] = v49;
      if ((char *)v45 != v47) {
        goto LABEL_73;
      }
    }
    else
    {
      HIBYTE(v128) = *(unsigned char *)v46 - v45;
      std::string v49 = v127;
      if ((char *)v45 != v47)
      {
LABEL_73:
        if (v48 < 0x20 || (unint64_t)v49 - v45 < 0x20)
        {
          unint64_t v50 = v49;
          uint64_t v51 = (char *)v45;
        }
        else
        {
          unint64_t v50 = (char *)v49 + (v48 & 0xFFFFFFFFFFFFFFE0);
          uint64_t v51 = (char *)(v45 + (v48 & 0xFFFFFFFFFFFFFFE0));
          char v52 = (long long *)(v45 + 16);
          uint64_t v53 = v49 + 1;
          unint64_t v54 = v48 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            long long v55 = *v52;
            *(v53 - 1) = *(v52 - 1);
            _OWORD *v53 = v55;
            v52 += 2;
            v53 += 2;
            v54 -= 32;
          }
          while (v54);
          if (v48 == (v48 & 0x7FFFFFFFFFFFFFE0)) {
            goto LABEL_86;
          }
        }
        do
        {
          char v61 = *v51++;
          *v50++ = v61;
        }
        while (v51 != v47);
LABEL_86:
        *unint64_t v50 = 0;
        unint64_t v58 = HIBYTE(v128);
        long long v57 = (uint64_t *)v127[0];
        unint64_t v56 = v127[1];
        goto LABEL_87;
      }
    }
    unint64_t v50 = v49;
    goto LABEL_86;
  }
LABEL_219:
  uint64_t v114 = *((void *)&v143 + 1);
  long long v115 = (std::__shared_weak_count *)v139;
  if ((void)v139 && !atomic_fetch_add((atomic_ullong *volatile)(v139 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v115->__on_zero_shared)(v115);
    std::__shared_weak_count::__release_weak(v115);
  }
  std::locale::~locale(v136);
  uint64_t v116 = (std::__shared_weak_count *)v141;
  if ((void)v141 && !atomic_fetch_add((atomic_ullong *volatile)(v141 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v116->__on_zero_shared)(v116);
    std::__shared_weak_count::__release_weak(v116);
  }
  std::locale::~locale((std::locale *)v140);
  operator delete(v125);
  uint64_t v117 = (void **)v143;
  if ((void)v143)
  {
    do
    {
      std::string v123 = (void **)*v117;
      if (*((char *)v117 + 39) < 0) {
        operator delete(v117[2]);
      }
      operator delete(v117);
      uint64_t v117 = v123;
    }
    while (v123);
  }
  unint64_t v118 = (void *)v142;
  *(void *)&long long v142 = 0;
  if (v118) {
    operator delete(v118);
  }
  uint64_t v119 = (void **)v145;
  if (v145)
  {
    uint64_t v120 = (void **)v146;
    long long v121 = v145;
    if (v146 != v145)
    {
      do
      {
        if (*((char *)v120 - 1) < 0) {
          operator delete(*(v120 - 3));
        }
        v120 -= 3;
      }
      while (v120 != v119);
      long long v121 = v145;
    }
    uint64_t v146 = (std::sub_match<const char *> *)v119;
    operator delete(v121);
  }
  return v114;
}

void sub_1C5963294(_Unwind_Exception *a1)
{
  operator delete(v2);
  std::unordered_set<std::string>::~unordered_set[abi:ne180100](&v3);
  std::vector<std::string>::~vector[abi:ne180100](&v4);
  _Unwind_Resume(a1);
}

void sub_1C596329C()
{
}

void sub_1C59632C4(uint64_t a1, int a2)
{
  if (a2) {
    JUMPOUT(0x1C59632CCLL);
  }
  JUMPOUT(0x1C5963154);
}

uint64_t std::unordered_set<std::string>::~unordered_set[abi:ne180100](uint64_t a1)
{
  long long v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v5 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      long long v2 = v5;
    }
    while (v5);
  }
  uint64_t v3 = *(void **)a1;
  *(void *)a1 = 0;
  if (v3) {
    operator delete(v3);
  }
  return a1;
}

uint64_t util::compareTwoStringsWithPattern(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v87 = 0xAAAAAAAAAAAAAA00;
  v84[1].__end_cap_.__value_ = (std::sub_match<std::__wrap_iter<const char *>> *)0xAAAAAAAAAAAAAAAALL;
  long long v90 = v5;
  uint64_t v85 = 0;
  uint64_t v86 = 0;
  uint64_t v88 = 0;
  uint64_t v89 = 0;
  LOBYTE(v90) = 0;
  BYTE8(v90) = 0;
  uint64_t v91 = 0;
  memset(v84, 0, 41);
  long long v82 = v5;
  long long v83 = v5;
  *(_OWORD *)&v80[0].__locale_ = v5;
  long long v81 = v5;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>((uint64_t)v80, a3, 0);
  char v77 = 0;
  size_t v78 = 0;
  unint64_t v79 = 0;
  tm __p = 0;
  unint64_t v75 = 0;
  unint64_t v76 = 0;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v95 = 0xAAAAAAAAAAAAAA00;
  v92[1].__end_cap_.__value_ = (std::sub_match<const char *> *)0xAAAAAAAAAAAAAAAALL;
  long long v98 = v6;
  uint64_t v93 = 0;
  uint64_t v94 = 0;
  uint64_t v96 = 0;
  uint64_t v97 = 0;
  LOBYTE(v98) = 0;
  BYTE8(v98) = 0;
  uint64_t v99 = 0;
  memset(v92, 0, 32);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 23);
  if ((v7 & 0x80u) == 0) {
    size_t v8 = (std::sub_match<const char *> *)a1;
  }
  else {
    size_t v8 = *(std::sub_match<const char *> **)a1;
  }
  if ((v7 & 0x80u) != 0) {
    uint64_t v7 = *(void *)(a1 + 8);
  }
  *(_OWORD *)((char *)&v92[1].__begin_ + 1) = 0uLL;
  int v9 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)v80, v8, (std::sub_match<const char *> *)((char *)v8 + v7), v92, 0);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 23);
  if ((v10 & 0x80u) == 0) {
    uint64_t v11 = a1;
  }
  else {
    uint64_t v11 = *(void *)a1;
  }
  if ((v10 & 0x80u) != 0) {
    uint64_t v10 = *(void *)(a1 + 8);
  }
  std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>(v84, v11, (std::sub_match<std::__wrap_iter<const char *>> *)(v11 + v10), (uint64_t *)v92, 0);
  if (v92[0].__begin_)
  {
    v92[0].__end_ = v92[0].__begin_;
    operator delete(v92[0].__begin_);
  }
  if (v9)
  {
    std::vector<std::ssub_match>::pointer end = v84[0].__end_;
    std::vector<std::ssub_match>::pointer begin = v84[0].__begin_;
    if (v84[0].__begin_ != v84[0].__end_)
    {
      while (1)
      {
        if (!begin->matched)
        {
          memset(v92, 0, 24);
          uint64_t v25 = v78;
          if ((unint64_t)v78 >= v79) {
            goto LABEL_38;
          }
          goto LABEL_16;
        }
        std::__wrap_iter<const char *>::iterator_type i = begin->first.__i_;
        std::__wrap_iter<const char *>::iterator_type v15 = begin->second.__i_;
        unint64_t v17 = v15 - begin->first.__i_;
        if (v17 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v17 > 0x16)
        {
          uint64_t v26 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v17 | 7) != 0x17) {
            uint64_t v26 = v17 | 7;
          }
          uint64_t v27 = v26 + 1;
          long long v18 = (std::sub_match<const char *> *)operator new(v26 + 1);
          v92[0].__end_ = (std::vector<std::csub_match>::pointer)v17;
          v92[0].__end_cap_.__value_ = (std::sub_match<const char *> *)(v27 | 0x8000000000000000);
          v92[0].__begin_ = v18;
          if (i == v15)
          {
LABEL_33:
            LOBYTE(v18->first) = 0;
            uint64_t v25 = v78;
            if ((unint64_t)v78 >= v79) {
              goto LABEL_38;
            }
            goto LABEL_16;
          }
        }
        else
        {
          HIBYTE(v92[0].__end_cap_.__value_) = (_BYTE)v15 - LOBYTE(begin->first.__i_);
          long long v18 = (std::sub_match<const char *> *)v92;
          if (i == v15) {
            goto LABEL_33;
          }
        }
        if (v17 < 0x20 || (unint64_t)((char *)v18 - i) < 0x20) {
          break;
        }
        long long v19 = (std::sub_match<const char *> *)((char *)v18 + (v17 & 0xFFFFFFFFFFFFFFE0));
        long long v20 = &i[v17 & 0xFFFFFFFFFFFFFFE0];
        int v21 = (long long *)(i + 16);
        p_matched = &v18->matched;
        unint64_t v23 = v17 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v24 = *v21;
          *((_OWORD *)p_matched - 1) = *(v21 - 1);
          *(_OWORD *)p_matched = v24;
          v21 += 2;
          p_matched += 32;
          v23 -= 32;
        }
        while (v23);
        if (v17 != (v17 & 0x7FFFFFFFFFFFFFE0)) {
          goto LABEL_36;
        }
LABEL_37:
        LOBYTE(v19->first) = 0;
        uint64_t v25 = v78;
        if ((unint64_t)v78 >= v79)
        {
LABEL_38:
          size_t v78 = std::vector<std::string>::__push_back_slow_path<std::string>(&v77, (uint64_t)v92);
          if (SHIBYTE(v92[0].__end_cap_.__value_) < 0) {
            operator delete(v92[0].__begin_);
          }
          goto LABEL_17;
        }
LABEL_16:
        long long v14 = *(_OWORD *)&v92[0].__begin_;
        *((void *)v25 + 2) = v92[0].__end_cap_.__value_;
        *(_OWORD *)uint64_t v25 = v14;
        size_t v78 = v25 + 24;
LABEL_17:
        if (++begin == end) {
          goto LABEL_40;
        }
      }
      long long v19 = v18;
      long long v20 = i;
      do
      {
LABEL_36:
        char v28 = *v20++;
        LOBYTE(v19->first) = v28;
        long long v19 = (std::sub_match<const char *> *)((char *)v19 + 1);
      }
      while (v20 != v15);
      goto LABEL_37;
    }
LABEL_40:
    long long v29 = (char *)v77;
    long long v30 = v78;
    if (v78 - (unsigned char *)v77 != 24)
    {
      if ((char *)v77 + 24 != v78)
      {
        long long v31 = (char *)v77 + 23;
        do
        {
          int v32 = (void **)(v31 - 23);
          if (*v31 < 0) {
            operator delete(*v32);
          }
          *(_OWORD *)int v32 = *(_OWORD *)(v31 + 1);
          *(void *)(v31 - 7) = *(void *)(v31 + 17);
          v31[24] = 0;
          v31 += 24;
          *(v31 - 23) = 0;
          v29 += 24;
        }
        while (v31 + 1 != v30);
        long long v30 = v78;
      }
      while (v30 != v29)
      {
        if (*(v30 - 1) < 0) {
          operator delete(*((void **)v30 - 3));
        }
        v30 -= 24;
      }
      size_t v78 = v29;
    }
    *(void *)&long long v33 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v95 = 0xAAAAAAAAAAAAAA00;
    v92[1].__end_cap_.__value_ = (std::sub_match<const char *> *)0xAAAAAAAAAAAAAAAALL;
    long long v98 = v33;
    uint64_t v93 = 0;
    uint64_t v94 = 0;
    uint64_t v96 = 0;
    uint64_t v97 = 0;
    LOBYTE(v98) = 0;
    BYTE8(v98) = 0;
    uint64_t v99 = 0;
    memset(v92, 0, 32);
    uint64_t v34 = *(unsigned __int8 *)(a2 + 23);
    if ((v34 & 0x80u) == 0) {
      uint64_t v35 = (std::sub_match<const char *> *)a2;
    }
    else {
      uint64_t v35 = *(std::sub_match<const char *> **)a2;
    }
    if ((v34 & 0x80u) != 0) {
      uint64_t v34 = *(void *)(a2 + 8);
    }
    *(_OWORD *)((char *)&v92[1].__begin_ + 1) = 0uLL;
    int v36 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)v80, v35, (std::sub_match<const char *> *)((char *)v35 + v34), v92, 0);
    uint64_t v37 = *(unsigned __int8 *)(a2 + 23);
    if ((v37 & 0x80u) == 0) {
      uint64_t v38 = a2;
    }
    else {
      uint64_t v38 = *(void *)a2;
    }
    if ((v37 & 0x80u) != 0) {
      uint64_t v37 = *(void *)(a2 + 8);
    }
    std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>(v84, v38, (std::sub_match<std::__wrap_iter<const char *>> *)(v38 + v37), (uint64_t *)v92, 0);
    if (v92[0].__begin_)
    {
      v92[0].__end_ = v92[0].__begin_;
      operator delete(v92[0].__begin_);
    }
    if (v36)
    {
      std::vector<std::ssub_match>::pointer v40 = v84[0].__end_;
      std::vector<std::ssub_match>::pointer v39 = v84[0].__begin_;
      if (v84[0].__begin_ != v84[0].__end_)
      {
        while (1)
        {
          if (!v39->matched)
          {
            memset(v92, 0, 24);
            char v52 = v75;
            if ((unint64_t)v75 >= v76) {
              goto LABEL_89;
            }
            goto LABEL_67;
          }
          std::__wrap_iter<const char *>::iterator_type v43 = v39->first.__i_;
          std::__wrap_iter<const char *>::iterator_type v42 = v39->second.__i_;
          unint64_t v44 = v42 - v39->first.__i_;
          if (v44 > 0x7FFFFFFFFFFFFFF7) {
            std::string::__throw_length_error[abi:ne180100]();
          }
          if (v44 > 0x16)
          {
            uint64_t v53 = (v44 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v44 | 7) != 0x17) {
              uint64_t v53 = v44 | 7;
            }
            uint64_t v54 = v53 + 1;
            uint64_t v45 = (std::sub_match<const char *> *)operator new(v53 + 1);
            v92[0].__end_ = (std::vector<std::csub_match>::pointer)v44;
            v92[0].__end_cap_.__value_ = (std::sub_match<const char *> *)(v54 | 0x8000000000000000);
            v92[0].__begin_ = v45;
            if (v43 == v42)
            {
LABEL_84:
              LOBYTE(v45->first) = 0;
              char v52 = v75;
              if ((unint64_t)v75 >= v76) {
                goto LABEL_89;
              }
              goto LABEL_67;
            }
          }
          else
          {
            HIBYTE(v92[0].__end_cap_.__value_) = (_BYTE)v42 - LOBYTE(v39->first.__i_);
            uint64_t v45 = (std::sub_match<const char *> *)v92;
            if (v43 == v42) {
              goto LABEL_84;
            }
          }
          if (v44 < 0x20 || (unint64_t)((char *)v45 - v43) < 0x20) {
            break;
          }
          uint64_t v46 = (std::sub_match<const char *> *)((char *)v45 + (v44 & 0xFFFFFFFFFFFFFFE0));
          size_t v47 = &v43[v44 & 0xFFFFFFFFFFFFFFE0];
          unint64_t v48 = (long long *)(v43 + 16);
          std::string v49 = &v45->matched;
          unint64_t v50 = v44 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            long long v51 = *v48;
            *((_OWORD *)v49 - 1) = *(v48 - 1);
            *(_OWORD *)std::string v49 = v51;
            v48 += 2;
            v49 += 32;
            v50 -= 32;
          }
          while (v50);
          if (v44 != (v44 & 0x7FFFFFFFFFFFFFE0)) {
            goto LABEL_87;
          }
LABEL_88:
          LOBYTE(v46->first) = 0;
          char v52 = v75;
          if ((unint64_t)v75 >= v76)
          {
LABEL_89:
            unint64_t v75 = std::vector<std::string>::__push_back_slow_path<std::string>(&__p, (uint64_t)v92);
            if (SHIBYTE(v92[0].__end_cap_.__value_) < 0) {
              operator delete(v92[0].__begin_);
            }
            goto LABEL_68;
          }
LABEL_67:
          long long v41 = *(_OWORD *)&v92[0].__begin_;
          *((void *)v52 + 2) = v92[0].__end_cap_.__value_;
          *(_OWORD *)char v52 = v41;
          unint64_t v75 = v52 + 24;
LABEL_68:
          if (++v39 == v40) {
            goto LABEL_91;
          }
        }
        uint64_t v46 = v45;
        size_t v47 = v43;
        do
        {
LABEL_87:
          char v55 = *v47++;
          LOBYTE(v46->first) = v55;
          uint64_t v46 = (std::sub_match<const char *> *)((char *)v46 + 1);
        }
        while (v47 != v42);
        goto LABEL_88;
      }
LABEL_91:
      long long v57 = (char *)__p;
      unint64_t v56 = v75;
      if (v75 - (unsigned char *)__p == 24)
      {
        unint64_t v58 = (char *)v77;
        uint64_t v59 = v78;
        uint64_t v60 = 1;
        if (v77 != v78) {
          goto LABEL_117;
        }
LABEL_105:
        if (v57) {
          goto LABEL_106;
        }
LABEL_134:
        unint64_t v64 = (char *)v77;
        if (v77) {
          goto LABEL_135;
        }
        goto LABEL_108;
      }
      if ((char *)__p + 24 != v75)
      {
        char v61 = (char *)__p + 23;
        do
        {
          std::string v62 = (void **)(v61 - 23);
          if (*v61 < 0) {
            operator delete(*v62);
          }
          *(_OWORD *)std::string v62 = *(_OWORD *)(v61 + 1);
          *(void *)(v61 - 7) = *(void *)(v61 + 17);
          v61[24] = 0;
          v61 += 24;
          *(v61 - 23) = 0;
          v57 += 24;
        }
        while (v61 + 1 != v56);
        unint64_t v56 = v75;
      }
      while (v56 != v57)
      {
        if (*(v56 - 1) < 0) {
          operator delete(*((void **)v56 - 3));
        }
        v56 -= 24;
      }
      unint64_t v75 = v57;
      long long v57 = (char *)__p;
      unint64_t v58 = (char *)v77;
      uint64_t v59 = v78;
      uint64_t v60 = 1;
      if (v77 == v78) {
        goto LABEL_105;
      }
      while (1)
      {
LABEL_117:
        uint64_t v66 = v58[23];
        if ((v66 & 0x80u) == 0) {
          uint64_t v67 = v58[23];
        }
        else {
          uint64_t v67 = *((void *)v58 + 1);
        }
        uint64_t v68 = v57[23];
        int v69 = (char)v68;
        if ((v68 & 0x80u) != 0) {
          uint64_t v68 = *((void *)v57 + 1);
        }
        if (v67 != v68) {
          break;
        }
        if (v69 >= 0) {
          int v70 = v57;
        }
        else {
          int v70 = *(char **)v57;
        }
        if ((v66 & 0x80) != 0)
        {
          if (memcmp(*(const void **)v58, v70, *((void *)v58 + 1))) {
            break;
          }
        }
        else if (v58[23])
        {
          uint64_t v71 = 0;
          while (v58[v71] == v70[v71])
          {
            if (v66 == ++v71) {
              goto LABEL_116;
            }
          }
          break;
        }
LABEL_116:
        v58 += 24;
        v57 += 24;
        if (v58 == v59) {
          goto LABEL_133;
        }
      }
    }
  }
  uint64_t v60 = 0;
LABEL_133:
  long long v57 = (char *)__p;
  if (!__p) {
    goto LABEL_134;
  }
LABEL_106:
  unint64_t v63 = v75;
  if (v75 != v57)
  {
    do
    {
      if (*(v63 - 1) < 0) {
        operator delete(*((void **)v63 - 3));
      }
      v63 -= 24;
    }
    while (v63 != v57);
    unint64_t v75 = v57;
    operator delete(__p);
    unint64_t v64 = (char *)v77;
    if (v77) {
      goto LABEL_135;
    }
LABEL_108:
    unint64_t v65 = (std::__shared_weak_count *)v83;
    if (!(void)v83) {
      goto LABEL_144;
    }
    goto LABEL_142;
  }
  unint64_t v75 = v57;
  operator delete(v57);
  unint64_t v64 = (char *)v77;
  if (!v77) {
    goto LABEL_108;
  }
LABEL_135:
  int64_t v72 = v78;
  if (v78 == v64)
  {
    size_t v78 = v64;
    operator delete(v64);
    unint64_t v65 = (std::__shared_weak_count *)v83;
    if (!(void)v83) {
      goto LABEL_144;
    }
    goto LABEL_142;
  }
  do
  {
    if (*(v72 - 1) < 0) {
      operator delete(*((void **)v72 - 3));
    }
    v72 -= 24;
  }
  while (v72 != v64);
  size_t v78 = v64;
  operator delete(v77);
  unint64_t v65 = (std::__shared_weak_count *)v83;
  if ((void)v83)
  {
LABEL_142:
    if (!atomic_fetch_add(&v65->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
      std::__shared_weak_count::__release_weak(v65);
    }
  }
LABEL_144:
  std::locale::~locale(v80);
  if (v84[0].__begin_)
  {
    v84[0].__end_ = v84[0].__begin_;
    operator delete(v84[0].__begin_);
  }
  return v60;
}

void sub_1C5963B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, std::locale a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24)
{
  uint64_t v26 = *(void **)(v24 - 192);
  if (v26)
  {
    *(void *)(v24 - 184) = v26;
    operator delete(v26);
  }
  std::vector<std::string>::~vector[abi:ne180100]((void **)&a9);
  std::vector<std::string>::~vector[abi:ne180100](&a12);
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a15);
  if (__p)
  {
    a24 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

__n128 std::__introsort<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*,false>(unint64_t a1, const void **a2, uint64_t a3, char a4, __n128 result)
{
LABEL_1:
  v268 = a2 - 3;
  v271 = a2;
  v260 = a2 - 9;
  v261 = a2 - 6;
  unint64_t k = a1;
  while (1)
  {
    a1 = k;
    uint64_t v11 = (uint64_t)a2 - k;
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)a2 - k) >> 3);
    if (v6 || !v5)
    {
      switch(v12)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          uint64_t v119 = (__n128 *)(a2 - 3);
          int v120 = *((char *)a2 - 1);
          if (v120 >= 0) {
            long long v121 = a2 - 3;
          }
          else {
            long long v121 = (const void **)*(a2 - 3);
          }
          if (v120 >= 0) {
            size_t v122 = *((unsigned __int8 *)a2 - 1);
          }
          else {
            size_t v122 = (size_t)*(a2 - 2);
          }
          int v123 = *(char *)(a1 + 23);
          std::string v124 = *(void **)a1;
          std::locale v125 = *(const void **)(a1 + 8);
          if (v123 >= 0) {
            long long v126 = (const void *)a1;
          }
          else {
            long long v126 = *(const void **)a1;
          }
          if (v123 >= 0) {
            size_t v127 = *(unsigned __int8 *)(a1 + 23);
          }
          else {
            size_t v127 = *(void *)(a1 + 8);
          }
          if (v127 >= v122) {
            size_t v128 = v122;
          }
          else {
            size_t v128 = v127;
          }
          int v129 = memcmp(v121, v126, v128);
          if (v129)
          {
            if (v129 < 0) {
              return result;
            }
          }
          else if (v122 <= v127)
          {
            return result;
          }
          v258 = *(const void **)(a1 + 16);
          uint64_t v259 = (uint64_t)*(a2 - 1);
          BOOL result = *v119;
          *(__n128 *)a1 = *v119;
          *(void *)(a1 + 16) = v259;
          *(a2 - 3) = v124;
          *(a2 - 2) = v125;
          *(a2 - 1) = v258;
          break;
        case 3uLL:
          result.n128_u64[0] = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, v268).n128_u64[0];
          return result;
        case 4uLL:
          result.n128_u64[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, a1 + 48, v268).n128_u64[0];
          return result;
        case 5uLL:
          result.n128_u64[0] = std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, a1 + 48, a1 + 72, v268).n128_u64[0];
          return result;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v11 <= 575)
    {
      if (a4)
      {
        if ((const void **)a1 == a2) {
          return result;
        }
        long long v130 = (const void *)(a1 + 24);
        if ((const void **)(a1 + 24) == a2) {
          return result;
        }
        uint64_t v131 = 0;
        unint64_t v132 = a1;
        while (2)
        {
          uint64_t v134 = (__n128 *)v132;
          unint64_t v132 = (unint64_t)v130;
          int v135 = v134[2].n128_i8[15];
          if (v135 >= 0) {
            long long v136 = v130;
          }
          else {
            long long v136 = (const void *)v134[1].n128_u64[1];
          }
          if (v135 >= 0) {
            size_t v137 = v134[2].n128_u8[15];
          }
          else {
            size_t v137 = v134[2].n128_u64[0];
          }
          int v138 = v134[1].n128_i8[7];
          if (v138 >= 0) {
            long long v139 = v134;
          }
          else {
            long long v139 = (__n128 *)v134->n128_u64[0];
          }
          if (v138 >= 0) {
            size_t v140 = v134[1].n128_u8[7];
          }
          else {
            size_t v140 = v134->n128_u64[1];
          }
          if (v140 >= v137) {
            size_t v141 = v137;
          }
          else {
            size_t v141 = v140;
          }
          int v142 = memcmp(v136, v139, v141);
          if (v142)
          {
            if (v142 < 0)
            {
LABEL_266:
              long long v130 = (const void *)(v132 + 24);
              v131 += 24;
              if ((const void **)(v132 + 24) == v271) {
                return result;
              }
              continue;
            }
          }
          else if (v137 <= v140)
          {
            goto LABEL_266;
          }
          break;
        }
        __n128 v143 = *(__n128 *)v132;
        int64_t v274 = *(void *)(v132 + 16);
        __n128 v273 = v143;
        if (v274 >= 0) {
          unint64_t v144 = &v273;
        }
        else {
          unint64_t v144 = (__n128 *)v143.n128_u64[0];
        }
        if (v274 >= 0) {
          size_t v145 = HIBYTE(v274);
        }
        else {
          size_t v145 = v143.n128_u64[1];
        }
        *(void *)(v132 + 16) = v134[1].n128_u64[0];
        *(__n128 *)unint64_t v132 = *v134;
        v134[1].n128_u8[7] = 0;
        v134->n128_u8[0] = 0;
        uint64_t v133 = (__n128 *)a1;
        if (v134 != (__n128 *)a1)
        {
          uint64_t v146 = v131;
          while (1)
          {
            uint64_t v147 = a1 + v146;
            int v148 = *(char *)(a1 + v146 - 1);
            if (v148 >= 0) {
              uint64_t v149 = (const void *)(a1 + v146 - 24);
            }
            else {
              uint64_t v149 = *(const void **)(a1 + v146 - 24);
            }
            if (v148 >= 0) {
              size_t v150 = *(unsigned __int8 *)(a1 + v146 - 1);
            }
            else {
              size_t v150 = *(void *)(a1 + v146 - 16);
            }
            if (v150 >= v145) {
              size_t v151 = v145;
            }
            else {
              size_t v151 = v150;
            }
            int v152 = memcmp(v144, v149, v151);
            if (v152)
            {
              if (v152 < 0)
              {
                uint64_t v133 = (__n128 *)(a1 + v146);
                break;
              }
            }
            else if (v145 <= v150)
            {
              uint64_t v133 = v134;
              break;
            }
            uint64_t v134 = (__n128 *)((char *)v134 - 24);
            *(_OWORD *)uint64_t v147 = *(_OWORD *)(a1 + v146 - 24);
            *(void *)(v147 + 16) = *(void *)(a1 + v146 - 8);
            *(unsigned char *)(v147 - 1) = 0;
            *(unsigned char *)(v147 - 24) = 0;
            v146 -= 24;
            if (!v146)
            {
              uint64_t v133 = (__n128 *)a1;
              break;
            }
          }
        }
        BOOL result = v273;
        v133[1].n128_u64[0] = v274;
        *uint64_t v133 = result;
        goto LABEL_266;
      }
      if ((const void **)a1 == a2) {
        return result;
      }
      v239 = (const void *)(a1 + 24);
      if ((const void **)(a1 + 24) == a2) {
        return result;
      }
LABEL_478:
      v240 = (const void **)a1;
      a1 = (unint64_t)v239;
      int v241 = *((char *)v240 + 47);
      if (v241 >= 0) {
        v242 = v239;
      }
      else {
        v242 = v240[3];
      }
      if (v241 >= 0) {
        size_t v243 = *((unsigned __int8 *)v240 + 47);
      }
      else {
        size_t v243 = (size_t)v240[4];
      }
      int v244 = *((char *)v240 + 23);
      if (v244 >= 0) {
        v245 = v240;
      }
      else {
        v245 = *v240;
      }
      if (v244 >= 0) {
        size_t v246 = *((unsigned __int8 *)v240 + 23);
      }
      else {
        size_t v246 = (size_t)v240[1];
      }
      if (v246 >= v243) {
        size_t v247 = v243;
      }
      else {
        size_t v247 = v246;
      }
      int v248 = memcmp(v242, v245, v247);
      if (v248)
      {
        if (v248 < 0) {
          goto LABEL_477;
        }
      }
      else if (v243 <= v246)
      {
        goto LABEL_477;
      }
      __n128 v249 = *(__n128 *)a1;
      int64_t v274 = *(void *)(a1 + 16);
      __n128 v273 = v249;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
      *(void *)a1 = 0;
      if (v274 >= 0) {
        v250 = &v273;
      }
      else {
        v250 = (__n128 *)v273.n128_u64[0];
      }
      if (v274 >= 0) {
        size_t v251 = HIBYTE(v274);
      }
      else {
        size_t v251 = v273.n128_u64[1];
      }
      for (unint64_t i = a1; ; i -= 24)
      {
        *(_OWORD *)unint64_t i = *(_OWORD *)(i - 24);
        *(void *)(i + 16) = *(void *)(i - 8);
        *(unsigned char *)(i - 1) = 0;
        *(unsigned char *)(i - 24) = 0;
        int v253 = *(char *)(i - 25);
        if (v253 >= 0) {
          v254 = (const void *)(i - 48);
        }
        else {
          v254 = *(const void **)(i - 48);
        }
        if (v253 >= 0) {
          size_t v255 = *(unsigned __int8 *)(i - 25);
        }
        else {
          size_t v255 = *(void *)(i - 40);
        }
        if (v255 >= v251) {
          size_t v256 = v251;
        }
        else {
          size_t v256 = v255;
        }
        int v257 = memcmp(v250, v254, v256);
        if (v257)
        {
          if (v257 < 0)
          {
LABEL_476:
            BOOL result = v273;
            *(void *)(i - 8) = v274;
            *(__n128 *)(i - 24) = result;
LABEL_477:
            v239 = (const void *)(a1 + 24);
            if ((const void **)(a1 + 24) == a2) {
              return result;
            }
            goto LABEL_478;
          }
        }
        else if (v251 <= v255)
        {
          goto LABEL_476;
        }
      }
    }
    if (!a3) {
      break;
    }
    unint64_t v13 = v12 >> 1;
    uint64_t v14 = a1 + 24 * (v12 >> 1);
    if ((unint64_t)v11 < 0xC01)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(v14, a1, v268);
      uint64_t v265 = a3 - 1;
      if ((a4 & 1) == 0)
      {
LABEL_10:
        int v19 = *(char *)(a1 - 1);
        if (v19 >= 0) {
          long long v20 = (const void *)(a1 - 24);
        }
        else {
          long long v20 = *(const void **)(a1 - 24);
        }
        if (v19 >= 0) {
          size_t v21 = *(unsigned __int8 *)(a1 - 1);
        }
        else {
          size_t v21 = *(void *)(a1 - 16);
        }
        int v22 = *(char *)(a1 + 23);
        if (v22 >= 0) {
          unint64_t v23 = (const void *)a1;
        }
        else {
          unint64_t v23 = *(const void **)a1;
        }
        if (v22 >= 0) {
          size_t v24 = *(unsigned __int8 *)(a1 + 23);
        }
        else {
          size_t v24 = *(void *)(a1 + 8);
        }
        if (v24 >= v21) {
          size_t v25 = v21;
        }
        else {
          size_t v25 = v24;
        }
        int v26 = memcmp(v20, v23, v25);
        if (v26)
        {
          if (v26 < 0) {
            goto LABEL_125;
          }
        }
        else if (v21 <= v24)
        {
LABEL_125:
          __n128 v72 = *(__n128 *)a1;
          int64_t v274 = *(void *)(a1 + 16);
          __n128 v273 = v72;
          *(void *)(a1 + 8) = 0;
          *(void *)(a1 + 16) = 0;
          *(void *)a1 = 0;
          uint64_t v73 = a2;
          if (v274 >= 0) {
            uint64_t v74 = &v273;
          }
          else {
            uint64_t v74 = (__n128 *)v273.n128_u64[0];
          }
          if (v274 >= 0) {
            size_t v75 = HIBYTE(v274);
          }
          else {
            size_t v75 = v273.n128_u64[1];
          }
          size_t v76 = *((unsigned __int8 *)v73 - 1);
          size_t v78 = (const void **)*(v73 - 3);
          char v77 = *(v73 - 2);
          if ((v76 & 0x80u) == 0) {
            unint64_t v79 = v268;
          }
          else {
            unint64_t v79 = (const void **)*(v73 - 3);
          }
          if ((v76 & 0x80u) == 0) {
            size_t v80 = *((unsigned __int8 *)v73 - 1);
          }
          else {
            size_t v80 = (size_t)*(v73 - 2);
          }
          if (v80 >= v75) {
            size_t v81 = v75;
          }
          else {
            size_t v81 = v80;
          }
          int v82 = memcmp(v74, v79, v81);
          if (v82)
          {
            if ((v82 & 0x80000000) == 0)
            {
LABEL_142:
              unint64_t v83 = a1 + 24;
              do
              {
                while (1)
                {
                  unint64_t k = v83;
                  uint64_t v84 = *(unsigned __int8 *)(v83 + 23);
                  uint64_t v85 = (v84 & 0x80u) == 0 ? (const void *)k : *(const void **)k;
                  size_t v86 = (v84 & 0x80u) == 0 ? v84 : *(void *)(k + 8);
                  size_t v87 = v86 >= v75 ? v75 : v86;
                  int v88 = memcmp(v74, v85, v87);
                  unint64_t v83 = k + 24;
                  if (v88) {
                    break;
                  }
                  if (v75 > v86) {
                    goto LABEL_155;
                  }
                }
              }
              while (v88 < 0);
LABEL_155:
              j = v271;
              if (k < (unint64_t)v271)
              {
                for (j = v268; ; char v77 = j[1])
                {
                  if ((v76 & 0x80u) == 0) {
                    uint64_t v91 = j;
                  }
                  else {
                    uint64_t v91 = v78;
                  }
                  if ((v76 & 0x80u) == 0) {
                    size_t v92 = v76;
                  }
                  else {
                    size_t v92 = (size_t)v77;
                  }
                  if (v92 >= v75) {
                    size_t v93 = v75;
                  }
                  else {
                    size_t v93 = v92;
                  }
                  int v94 = memcmp(v74, v91, v93);
                  if (v94)
                  {
                    if (v94 < 0) {
                      break;
                    }
                  }
                  else if (v75 <= v92)
                  {
                    break;
                  }
                  long long v90 = (const void **)*(j - 3);
                  j -= 3;
                  size_t v78 = v90;
                  size_t v76 = *((unsigned __int8 *)j + 23);
                }
              }
              if (k < (unint64_t)j)
              {
                unint64_t v95 = *(const void **)k;
                do
                {
                  long long v96 = *(_OWORD *)(k + 8);
                  long long v97 = *(_OWORD *)j;
                  *(void *)(k + 16) = j[2];
                  *(_OWORD *)unint64_t k = v97;
                  *j = v95;
                  *(_OWORD *)(j + 1) = v96;
                  if (v274 >= 0) {
                    long long v98 = &v273;
                  }
                  else {
                    long long v98 = (__n128 *)v273.n128_u64[0];
                  }
                  if (v274 >= 0) {
                    unint64_t v99 = HIBYTE(v274);
                  }
                  else {
                    unint64_t v99 = v273.n128_u64[1];
                  }
                  unint64_t v100 = k + 24;
                  do
                  {
                    while (1)
                    {
                      unint64_t k = v100;
                      uint64_t v101 = *(unsigned __int8 *)(v100 + 23);
                      unint64_t v95 = *(const void **)k;
                      uint64_t v102 = (v101 & 0x80u) == 0 ? (const void *)k : *(const void **)k;
                      unint64_t v103 = (v101 & 0x80u) == 0 ? v101 : *(void *)(k + 8);
                      size_t v104 = v103 >= v99 ? v99 : v103;
                      int v105 = memcmp(v98, v102, v104);
                      unint64_t v100 = k + 24;
                      if (v105) {
                        break;
                      }
                      if (v99 > v103) {
                        goto LABEL_192;
                      }
                    }
                  }
                  while (v105 < 0);
LABEL_192:
                  uint8x8_t v106 = j - 3;
                  do
                  {
                    while (1)
                    {
                      j = v106;
                      uint64_t v107 = (const void *)*((unsigned __int8 *)v106 + 23);
                      uint64_t v108 = (char)v107 >= 0 ? j : (const void **)*j;
                      std::string::size_type v109 = (char)v107 >= 0 ? v107 : j[1];
                      size_t v110 = (unint64_t)v109 >= v99 ? v99 : (size_t)v109;
                      int v111 = memcmp(v98, v108, v110);
                      uint8x8_t v106 = j - 3;
                      if (v111) {
                        break;
                      }
                      if (v99 <= (unint64_t)v109) {
                        goto LABEL_172;
                      }
                    }
                  }
                  while ((v111 & 0x80000000) == 0);
LABEL_172:
                  ;
                }
                while (k < (unint64_t)j);
              }
              uint64_t v112 = (__n128 *)(k - 24);
              BOOL v5 = k - 24 >= a1;
              BOOL v6 = k - 24 == a1;
              if (k - 24 == a1)
              {
                a2 = v271;
                a3 = v265;
                if (*(char *)(k - 1) < 0) {
                  operator delete(*(void **)a1);
                }
              }
              else
              {
                if (*(char *)(a1 + 23) < 0) {
                  operator delete(*(void **)a1);
                }
                __n128 v113 = *v112;
                *(void *)(a1 + 16) = *(void *)(k - 8);
                *(__n128 *)a1 = v113;
                *(unsigned char *)(k - 1) = 0;
                *(unsigned char *)(k - 24) = 0;
                a2 = v271;
                a3 = v265;
              }
              a4 = 0;
              BOOL result = v273;
              *(void *)(k - 8) = v274;
              *uint64_t v112 = result;
              continue;
            }
          }
          else if (v75 > v80)
          {
            goto LABEL_142;
          }
          for (unint64_t k = a1 + 24; k < (unint64_t)v271; k += 24)
          {
            int v114 = *(char *)(k + 23);
            if (v114 >= 0) {
              long long v115 = (const void *)k;
            }
            else {
              long long v115 = *(const void **)k;
            }
            if (v114 >= 0) {
              size_t v116 = *(unsigned __int8 *)(k + 23);
            }
            else {
              size_t v116 = *(void *)(k + 8);
            }
            if (v116 >= v75) {
              size_t v117 = v75;
            }
            else {
              size_t v117 = v116;
            }
            int v118 = memcmp(v74, v115, v117);
            if (v118)
            {
              if ((v118 & 0x80000000) == 0) {
                goto LABEL_155;
              }
            }
            else if (v75 > v116)
            {
              goto LABEL_155;
            }
          }
          goto LABEL_155;
        }
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, v14, v268);
      uint64_t v15 = 24 * v13;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1 + 24, v15 + a1 - 24, v261);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1 + 48, a1 + 24 + v15, v260);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(v15 + a1 - 24, v14, (const void **)(a1 + 24 + v15));
      long long v16 = *(void **)a1;
      long long v17 = *(_OWORD *)(a1 + 8);
      long long v18 = *(_OWORD *)v14;
      *(void *)(a1 + 16) = *(void *)(v14 + 16);
      *(_OWORD *)a1 = v18;
      *(void *)uint64_t v14 = v16;
      *(_OWORD *)(v14 + 8) = v17;
      uint64_t v265 = a3 - 1;
      if ((a4 & 1) == 0) {
        goto LABEL_10;
      }
    }
    uint64_t v27 = 0;
    __n128 v28 = *(__n128 *)a1;
    int64_t v274 = *(void *)(a1 + 16);
    __n128 v273 = v28;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    if (v274 >= 0) {
      long long v29 = &v273;
    }
    else {
      long long v29 = (__n128 *)v273.n128_u64[0];
    }
    if (v274 >= 0) {
      unint64_t v30 = HIBYTE(v274);
    }
    else {
      unint64_t v30 = v273.n128_u64[1];
    }
    while (1)
    {
      long long v31 = *(const void **)(a1 + v27 + 24);
      int v32 = *(char *)(a1 + v27 + 47);
      long long v33 = v32 >= 0 ? (const void *)(a1 + v27 + 24) : *(const void **)(a1 + v27 + 24);
      unint64_t v34 = v32 >= 0 ? *(unsigned __int8 *)(a1 + v27 + 47) : *(void *)(a1 + v27 + 32);
      size_t v35 = v30 >= v34 ? v34 : v30;
      int v36 = memcmp(v33, v29, v35);
      if (v36) {
        break;
      }
      if (v34 <= v30) {
        goto LABEL_46;
      }
LABEL_34:
      v27 += 24;
    }
    if ((v36 & 0x80000000) == 0) {
      goto LABEL_34;
    }
LABEL_46:
    unint64_t v37 = a1 + v27 + 24;
    uint64_t v38 = v268;
    if (v27)
    {
      do
      {
        while (1)
        {
          std::vector<std::ssub_match>::pointer v39 = v38;
          uint64_t v46 = (const void *)*((unsigned __int8 *)v38 + 23);
          size_t v47 = (char)v46 >= 0 ? v39 : (const void **)*v39;
          unint64_t v48 = (unint64_t)((char)v46 >= 0 ? v46 : v39[1]);
          size_t v49 = v30 >= v48 ? v48 : v30;
          int v50 = memcmp(v47, v29, v49);
          uint64_t v38 = v39 - 3;
          if (v50) {
            break;
          }
          if (v48 > v30) {
            goto LABEL_77;
          }
        }
      }
      while (v50 < 0);
    }
    else
    {
      std::vector<std::ssub_match>::pointer v39 = v271;
      if (v37 < (unint64_t)v271)
      {
        std::vector<std::ssub_match>::pointer v40 = v268;
        do
        {
          while (1)
          {
            std::vector<std::ssub_match>::pointer v39 = v40;
            long long v41 = (const void *)*((unsigned __int8 *)v40 + 23);
            std::__wrap_iter<const char *>::iterator_type v42 = (char)v41 >= 0 ? v39 : (const void **)*v39;
            unint64_t v43 = (unint64_t)((char)v41 >= 0 ? v41 : v39[1]);
            size_t v44 = v30 >= v43 ? v43 : v30;
            int v45 = memcmp(v42, v29, v44);
            std::vector<std::ssub_match>::pointer v40 = v39 - 3;
            if (!v45) {
              break;
            }
            if (v37 >= (unint64_t)v39 || (v45 & 0x80000000) == 0) {
              goto LABEL_77;
            }
          }
        }
        while (v37 < (unint64_t)v39 && v43 <= v30);
      }
    }
LABEL_77:
    if (v37 >= (unint64_t)v39)
    {
      unint64_t k = v37;
    }
    else
    {
      long long v51 = v39;
      unint64_t k = v37;
      do
      {
        long long v52 = *(_OWORD *)(k + 8);
        long long v53 = *(_OWORD *)v51;
        *(void *)(k + 16) = v51[2];
        *(_OWORD *)unint64_t k = v53;
        *long long v51 = v31;
        *(_OWORD *)(v51 + 1) = v52;
        if (v274 >= 0) {
          uint64_t v54 = &v273;
        }
        else {
          uint64_t v54 = (__n128 *)v273.n128_u64[0];
        }
        if (v274 >= 0) {
          unint64_t v55 = HIBYTE(v274);
        }
        else {
          unint64_t v55 = v273.n128_u64[1];
        }
        unint64_t v56 = k + 24;
        do
        {
          while (1)
          {
            unint64_t k = v56;
            uint64_t v57 = *(unsigned __int8 *)(v56 + 23);
            long long v31 = *(const void **)k;
            unint64_t v58 = (v57 & 0x80u) == 0 ? (const void *)k : *(const void **)k;
            unint64_t v59 = (v57 & 0x80u) == 0 ? v57 : *(void *)(k + 8);
            size_t v60 = v55 >= v59 ? v59 : v55;
            int v61 = memcmp(v58, v54, v60);
            unint64_t v56 = k + 24;
            if (v61) {
              break;
            }
            if (v59 <= v55) {
              goto LABEL_99;
            }
          }
        }
        while ((v61 & 0x80000000) == 0);
LABEL_99:
        std::string v62 = v51 - 3;
        do
        {
          while (1)
          {
            long long v51 = v62;
            unint64_t v63 = (const void *)*((unsigned __int8 *)v62 + 23);
            unint64_t v64 = (char)v63 >= 0 ? v51 : (const void **)*v51;
            unint64_t v65 = (unint64_t)((char)v63 >= 0 ? v63 : v51[1]);
            size_t v66 = v55 >= v65 ? v65 : v55;
            int v67 = memcmp(v64, v54, v66);
            std::string v62 = v51 - 3;
            if (v67) {
              break;
            }
            if (v65 > v55) {
              goto LABEL_79;
            }
          }
        }
        while (v67 < 0);
LABEL_79:
        ;
      }
      while (k < (unint64_t)v51);
    }
    uint64_t v68 = (__n128 *)(k - 24);
    if (k - 24 == a1)
    {
      a2 = v271;
      a3 = v265;
      if (*(char *)(k - 1) < 0) {
        operator delete(*(void **)a1);
      }
    }
    else
    {
      a2 = v271;
      a3 = v265;
      if (*(char *)(a1 + 23) < 0) {
        operator delete(*(void **)a1);
      }
      __n128 v69 = *v68;
      *(void *)(a1 + 16) = *(void *)(k - 8);
      *(__n128 *)a1 = v69;
      *(unsigned char *)(k - 1) = 0;
      *(unsigned char *)(k - 24) = 0;
    }
    __n128 v70 = v273;
    *(void *)(k - 8) = v274;
    __n128 *v68 = v70;
    if (v37 < (unint64_t)v39)
    {
LABEL_123:
      std::__introsort<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*,false>(a1, k - 24, a3, a4 & 1);
      a4 = 0;
    }
    else
    {
      BOOL v71 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, (const void **)(k - 24));
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(k, a2))
      {
        a2 = (const void **)(k - 24);
        if (v71) {
          return result;
        }
        goto LABEL_1;
      }
      if (!v71) {
        goto LABEL_123;
      }
    }
  }
  if ((const void **)a1 == a2) {
    return result;
  }
  int64_t v153 = (v12 - 2) >> 1;
  int64_t v154 = v153;
  while (2)
  {
    int64_t v156 = v154;
    if (v153 >= v154)
    {
      uint64_t v157 = (2 * v154) | 1;
      unint64_t v158 = a1 + 24 * v157;
      uint64_t v159 = 2 * v154 + 2;
      if (v159 >= (uint64_t)v12) {
        goto LABEL_337;
      }
      uint64_t v160 = (const void **)(v158 + 24);
      int v161 = *(char *)(v158 + 23);
      if (v161 >= 0) {
        long long v162 = (const void *)(a1 + 24 * v157);
      }
      else {
        long long v162 = *(const void **)v158;
      }
      if (v161 >= 0) {
        size_t v163 = *(unsigned __int8 *)(v158 + 23);
      }
      else {
        size_t v163 = *(void *)(v158 + 8);
      }
      int v164 = *(char *)(v158 + 47);
      if (v164 >= 0) {
        v165 = (const void *)(v158 + 24);
      }
      else {
        v165 = *(const void **)(v158 + 24);
      }
      if (v164 >= 0) {
        size_t v166 = *(unsigned __int8 *)(v158 + 47);
      }
      else {
        size_t v166 = *(void *)(v158 + 32);
      }
      if (v166 >= v163) {
        size_t v167 = v163;
      }
      else {
        size_t v167 = v166;
      }
      int v168 = memcmp(v162, v165, v167);
      if (v168)
      {
        a2 = v271;
        if (v168 < 0)
        {
LABEL_337:
          uint64_t v160 = (const void **)(a1 + 24 * v157);
          uint64_t v159 = (2 * v156) | 1;
        }
      }
      else
      {
        BOOL v169 = v163 >= v166;
        if (v163 == v166)
        {
          uint64_t v160 = (const void **)(a1 + 24 * v157);
          uint64_t v159 = (2 * v156) | 1;
          a2 = v271;
        }
        else
        {
          a2 = v271;
          if (!v169) {
            goto LABEL_337;
          }
        }
      }
      unint64_t v170 = a1 + 24 * v156;
      int v171 = *((char *)v160 + 23);
      if (v171 >= 0) {
        CFTypeID v172 = v160;
      }
      else {
        CFTypeID v172 = *v160;
      }
      if (v171 >= 0) {
        size_t v173 = *((unsigned __int8 *)v160 + 23);
      }
      else {
        size_t v173 = (size_t)v160[1];
      }
      int v174 = *(char *)(v170 + 23);
      if (v174 >= 0) {
        v175 = (const void *)(a1 + 24 * v156);
      }
      else {
        v175 = *(const void **)v170;
      }
      if (v174 >= 0) {
        size_t v176 = *(unsigned __int8 *)(v170 + 23);
      }
      else {
        size_t v176 = *(void *)(v170 + 8);
      }
      if (v176 >= v173) {
        size_t v177 = v173;
      }
      else {
        size_t v177 = v176;
      }
      int v178 = memcmp(v172, v175, v177);
      if (v178)
      {
        int64_t v153 = (v12 - 2) >> 1;
        if (v178 < 0)
        {
LABEL_357:
          __n128 v180 = *(__n128 *)v170;
          int64_t v274 = *(void *)(v170 + 16);
          __n128 v273 = v180;
          *(void *)(v170 + 8) = 0;
          *(void *)(v170 + 16) = 0;
          *(void *)unint64_t v170 = 0;
          long long v181 = *(_OWORD *)v160;
          *(void *)(v170 + 16) = v160[2];
          *(_OWORD *)unint64_t v170 = v181;
          *((unsigned char *)v160 + 23) = 0;
          *(unsigned char *)uint64_t v160 = 0;
          if (v153 >= v159)
          {
            unint64_t v182 = HIBYTE(v274);
            uint64_t v183 = &v273;
            if (v274 < 0)
            {
              unint64_t v182 = v273.n128_u64[1];
              uint64_t v183 = (__n128 *)v273.n128_u64[0];
            }
            size_t v263 = v182;
            v266 = v183;
            int64_t v269 = v156;
            while (1)
            {
              uint64_t v185 = (2 * v159) | 1;
              unint64_t v186 = a1 + 24 * v185;
              uint64_t v159 = 2 * v159 + 2;
              if (v159 >= (uint64_t)v12) {
                goto LABEL_385;
              }
              uint64_t v155 = (const void **)(v186 + 24);
              int v187 = *(char *)(v186 + 23);
              v188 = v187 >= 0 ? (const void *)(a1 + 24 * v185) : *(const void **)v186;
              unint64_t v189 = v187 >= 0 ? *(unsigned __int8 *)(v186 + 23) : *(void *)(v186 + 8);
              int v190 = *(char *)(v186 + 47);
              v191 = v190 >= 0 ? (const void *)(v186 + 24) : *(const void **)(v186 + 24);
              unint64_t v192 = v190 >= 0 ? *(unsigned __int8 *)(v186 + 47) : *(void *)(v186 + 32);
              size_t v193 = v192 >= v189 ? v189 : v192;
              int v194 = memcmp(v188, v191, v193);
              if (v194) {
                break;
              }
              BOOL v195 = v189 >= v192;
              if (v189 == v192)
              {
                uint64_t v155 = (const void **)(a1 + 24 * v185);
                uint64_t v159 = v185;
                a2 = v271;
                int64_t v153 = (v12 - 2) >> 1;
                goto LABEL_386;
              }
              a2 = v271;
              int64_t v153 = (v12 - 2) >> 1;
              if (!v195) {
                goto LABEL_385;
              }
LABEL_386:
              int v196 = *((char *)v155 + 23);
              if (v196 >= 0) {
                v197 = v155;
              }
              else {
                v197 = *v155;
              }
              if (v196 >= 0) {
                size_t v198 = *((unsigned __int8 *)v155 + 23);
              }
              else {
                size_t v198 = (size_t)v155[1];
              }
              if (v263 >= v198) {
                size_t v199 = v198;
              }
              else {
                size_t v199 = v263;
              }
              int v200 = memcmp(v197, v266, v199);
              if (v200)
              {
                int64_t v156 = v269;
                if ((v200 & 0x80000000) == 0) {
                  goto LABEL_311;
                }
              }
              else
              {
                int64_t v156 = v269;
                if (v198 > v263) {
                  goto LABEL_311;
                }
              }
              long long v184 = *(_OWORD *)v155;
              v160[2] = v155[2];
              *(_OWORD *)uint64_t v160 = v184;
              *((unsigned char *)v155 + 23) = 0;
              *(unsigned char *)uint64_t v155 = 0;
              uint64_t v160 = v155;
              if (v153 < v159) {
                goto LABEL_312;
              }
            }
            a2 = v271;
            int64_t v153 = (v12 - 2) >> 1;
            if ((v194 & 0x80000000) == 0) {
              goto LABEL_386;
            }
LABEL_385:
            uint64_t v155 = (const void **)(a1 + 24 * v185);
            uint64_t v159 = v185;
            goto LABEL_386;
          }
LABEL_311:
          uint64_t v155 = v160;
LABEL_312:
          BOOL result = v273;
          v155[2] = (const void *)v274;
          *(__n128 *)uint64_t v155 = result;
        }
      }
      else
      {
        BOOL v179 = v173 > v176;
        int64_t v153 = (v12 - 2) >> 1;
        if (!v179) {
          goto LABEL_357;
        }
      }
    }
    int64_t v154 = v156 - 1;
    if (v156) {
      continue;
    }
    break;
  }
  int64_t v201 = v11 / 0x18uLL;
  do
  {
    if (v201 < 2) {
      goto LABEL_400;
    }
    uint64_t v202 = 0;
    v270 = *(void **)a1;
    v272 = a2;
    v264 = *(const void **)(a1 + 16);
    v267 = *(const void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    unint64_t v203 = a1;
    *(void *)a1 = 0;
    do
    {
      uint64_t v205 = v203 + 24 * v202 + 24;
      uint64_t v206 = (2 * v202) | 1;
      uint64_t v202 = 2 * v202 + 2;
      if (v202 < v201)
      {
        long long v204 = (__n128 *)(v205 + 24);
        int v207 = *(char *)(v205 + 23);
        if (v207 >= 0) {
          long long v208 = (const void *)v205;
        }
        else {
          long long v208 = *(const void **)v205;
        }
        if (v207 >= 0) {
          size_t v209 = *(unsigned __int8 *)(v205 + 23);
        }
        else {
          size_t v209 = *(void *)(v205 + 8);
        }
        int v210 = *(char *)(v205 + 47);
        if (v210 >= 0) {
          long long v211 = (const void *)(v205 + 24);
        }
        else {
          long long v211 = *(const void **)(v205 + 24);
        }
        if (v210 >= 0) {
          size_t v212 = *(unsigned __int8 *)(v205 + 47);
        }
        else {
          size_t v212 = *(void *)(v205 + 32);
        }
        if (v212 >= v209) {
          size_t v213 = v209;
        }
        else {
          size_t v213 = v212;
        }
        int v214 = memcmp(v208, v211, v213);
        if (v214)
        {
          if ((v214 & 0x80000000) == 0) {
            goto LABEL_424;
          }
        }
        else if (v209 != v212 && v209 >= v212)
        {
LABEL_424:
          if ((*(char *)(v203 + 23) & 0x80000000) == 0) {
            goto LABEL_405;
          }
          goto LABEL_425;
        }
      }
      long long v204 = (__n128 *)v205;
      uint64_t v202 = v206;
      if ((*(char *)(v203 + 23) & 0x80000000) == 0) {
        goto LABEL_405;
      }
LABEL_425:
      operator delete(*(void **)v203);
LABEL_405:
      BOOL result = *v204;
      *(void *)(v203 + 16) = v204[1].n128_u64[0];
      *(__n128 *)unint64_t v203 = result;
      v204[1].n128_u8[7] = 0;
      v204->n128_u8[0] = 0;
      unint64_t v203 = (unint64_t)v204;
    }
    while (v202 <= (uint64_t)((unint64_t)(v201 - 2) >> 1));
    if (v204 == (__n128 *)(a2 - 3))
    {
      v204->n128_u64[0] = (unint64_t)v270;
      v204->n128_u64[1] = (unint64_t)v267;
      v204[1].n128_u64[0] = (unint64_t)v264;
      goto LABEL_400;
    }
    BOOL result = *(__n128 *)(a2 - 3);
    v204[1].n128_u64[0] = (unint64_t)*(a2 - 1);
    *long long v204 = result;
    *(a2 - 3) = v270;
    *(a2 - 2) = v267;
    *(a2 - 1) = v264;
    uint64_t v215 = (uint64_t)&v204[1].n128_i64[1] - a1;
    if (v215 >= 25)
    {
      unint64_t v216 = v215 / 0x18uLL - 2;
      unint64_t v217 = v216 >> 1;
      unint64_t v218 = a1 + 24 * (v216 >> 1);
      int v219 = *(char *)(v218 + 23);
      if (v219 >= 0) {
        v220 = (const void *)(a1 + 24 * (v216 >> 1));
      }
      else {
        v220 = *(const void **)v218;
      }
      if (v219 >= 0) {
        size_t v221 = *(unsigned __int8 *)(v218 + 23);
      }
      else {
        size_t v221 = *(void *)(v218 + 8);
      }
      int v222 = v204[1].n128_i8[7];
      if (v222 >= 0) {
        v223 = v204;
      }
      else {
        v223 = (__n128 *)v204->n128_u64[0];
      }
      if (v222 >= 0) {
        size_t v224 = v204[1].n128_u8[7];
      }
      else {
        size_t v224 = v204->n128_u64[1];
      }
      if (v224 >= v221) {
        size_t v225 = v221;
      }
      else {
        size_t v225 = v224;
      }
      int v226 = memcmp(v220, v223, v225);
      if (v226)
      {
        if (v226 < 0) {
          goto LABEL_400;
        }
      }
      else if (v221 <= v224)
      {
        goto LABEL_400;
      }
      __n128 v227 = *v204;
      int64_t v274 = v204[1].n128_i64[0];
      __n128 v273 = v227;
      v204->n128_u64[1] = 0;
      v204[1].n128_u64[0] = 0;
      v204->n128_u64[0] = 0;
      if (v274 >= 0) {
        v228 = &v273;
      }
      else {
        v228 = (__n128 *)v273.n128_u64[0];
      }
      if (v274 >= 0) {
        size_t v229 = HIBYTE(v274);
      }
      else {
        size_t v229 = v273.n128_u64[1];
      }
      __n128 v230 = *(__n128 *)v218;
      v204[1].n128_u64[0] = *(void *)(v218 + 16);
      *long long v204 = v230;
      *(unsigned char *)(v218 + 23) = 0;
      *(unsigned char *)unint64_t v218 = 0;
      if (v216 >= 2)
      {
        while (1)
        {
          unint64_t v232 = v217 - 1;
          unint64_t v217 = (v217 - 1) >> 1;
          unint64_t v233 = a1 + 24 * v217;
          int v234 = *(char *)(v233 + 23);
          if (v234 >= 0) {
            v235 = (const void *)(a1 + 24 * v217);
          }
          else {
            v235 = *(const void **)v233;
          }
          if (v234 >= 0) {
            size_t v236 = *(unsigned __int8 *)(v233 + 23);
          }
          else {
            size_t v236 = *(void *)(v233 + 8);
          }
          if (v229 >= v236) {
            size_t v237 = v236;
          }
          else {
            size_t v237 = v229;
          }
          int v238 = memcmp(v235, v228, v237);
          if (v238)
          {
            if (v238 < 0) {
              break;
            }
          }
          else if (v236 <= v229)
          {
            break;
          }
          long long v231 = *(_OWORD *)v233;
          *(void *)(v218 + 16) = *(void *)(v233 + 16);
          *(_OWORD *)unint64_t v218 = v231;
          *(unsigned char *)(v233 + 23) = 0;
          *(unsigned char *)unint64_t v233 = 0;
          unint64_t v218 = a1 + 24 * v217;
          if (v232 <= 1) {
            goto LABEL_472;
          }
        }
      }
      unint64_t v233 = v218;
LABEL_472:
      BOOL result = v273;
      *(void *)(v233 + 16) = v274;
      *(__n128 *)unint64_t v233 = result;
      a2 = v272;
    }
LABEL_400:
    a2 -= 3;
    BOOL v179 = (unint64_t)v201-- > 2;
  }
  while (v179);
  return result;
}

__n128 std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(uint64_t a1, uint64_t a2, const void **a3)
{
  int v6 = *(char *)(a2 + 23);
  uint64_t v7 = *(const void **)a2;
  size_t v8 = *(const void **)(a2 + 8);
  if (v6 >= 0) {
    int v9 = (const void *)a2;
  }
  else {
    int v9 = *(const void **)a2;
  }
  if (v6 >= 0) {
    size_t v10 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v10 = *(void *)(a2 + 8);
  }
  int v11 = *(char *)(a1 + 23);
  unint64_t v13 = *(const void **)a1;
  unint64_t v12 = *(const void **)(a1 + 8);
  if (v11 >= 0) {
    uint64_t v14 = (const void *)a1;
  }
  else {
    uint64_t v14 = *(const void **)a1;
  }
  if (v11 >= 0) {
    size_t v15 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    size_t v15 = *(void *)(a1 + 8);
  }
  if (v15 >= v10) {
    size_t v16 = v10;
  }
  else {
    size_t v16 = v15;
  }
  int v17 = memcmp(v9, v14, v16);
  if (v17)
  {
    if ((v17 & 0x80000000) == 0) {
      goto LABEL_18;
    }
  }
  else if (v10 > v15)
  {
LABEL_18:
    int v18 = *((char *)a3 + 23);
    if (v18 >= 0) {
      int v19 = a3;
    }
    else {
      int v19 = *a3;
    }
    if (v18 >= 0) {
      size_t v20 = *((unsigned __int8 *)a3 + 23);
    }
    else {
      size_t v20 = (size_t)a3[1];
    }
    if (v10 >= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v10;
    }
    int v22 = memcmp(v19, v9, v21);
    if (v22)
    {
      if ((v22 & 0x80000000) == 0)
      {
LABEL_29:
        unint64_t v23 = *(const void **)(a1 + 16);
        size_t v24 = a3[2];
        __n128 result = *(__n128 *)a3;
        *(_OWORD *)a1 = *(_OWORD *)a3;
        *(void *)(a1 + 16) = v24;
        *a3 = v13;
        a3[1] = v12;
        a3[2] = v23;
        return result;
      }
    }
    else if (v20 > v10)
    {
      goto LABEL_29;
    }
    uint64_t v31 = *(void *)(a1 + 16);
    uint64_t v32 = *(void *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = v32;
    *(void *)a2 = v13;
    *(void *)(a2 + 8) = v12;
    *(void *)(a2 + 16) = v31;
    int v33 = *((char *)a3 + 23);
    if (v33 >= 0) {
      unint64_t v34 = a3;
    }
    else {
      unint64_t v34 = *a3;
    }
    if (v33 >= 0) {
      size_t v35 = *((unsigned __int8 *)a3 + 23);
    }
    else {
      size_t v35 = (size_t)a3[1];
    }
    if (v31 >= 0) {
      int v36 = (const void *)a2;
    }
    else {
      int v36 = v13;
    }
    if (v31 >= 0) {
      size_t v37 = HIBYTE(v31);
    }
    else {
      size_t v37 = (size_t)v12;
    }
    if (v37 >= v35) {
      size_t v38 = v35;
    }
    else {
      size_t v38 = v37;
    }
    int v39 = memcmp(v34, v36, v38);
    if (v39)
    {
      if (v39 < 0) {
        return result;
      }
    }
    else if (v35 <= v37)
    {
      return result;
    }
    __n128 result = *(__n128 *)a3;
    *(void *)(a2 + 16) = a3[2];
    *(__n128 *)a2 = result;
    *a3 = v13;
    a3[1] = v12;
    a3[2] = (const void *)v31;
    return result;
  }
  int v26 = *((char *)a3 + 23);
  if (v26 >= 0) {
    uint64_t v27 = a3;
  }
  else {
    uint64_t v27 = *a3;
  }
  if (v26 >= 0) {
    size_t v28 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v28 = (size_t)a3[1];
  }
  if (v10 >= v28) {
    size_t v29 = v28;
  }
  else {
    size_t v29 = v10;
  }
  int v30 = memcmp(v27, v9, v29);
  if (v30)
  {
    if (v30 < 0) {
      return result;
    }
  }
  else if (v28 <= v10)
  {
    return result;
  }
  std::vector<std::ssub_match>::pointer v40 = *(const void **)(a2 + 16);
  long long v41 = a3[2];
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(void *)(a2 + 16) = v41;
  *a3 = v7;
  a3[1] = v8;
  a3[2] = v40;
  int v42 = *(char *)(a2 + 23);
  if (v42 >= 0) {
    unint64_t v43 = (const void *)a2;
  }
  else {
    unint64_t v43 = *(const void **)a2;
  }
  if (v42 >= 0) {
    size_t v44 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v44 = *(void *)(a2 + 8);
  }
  int v45 = *(char *)(a1 + 23);
  uint64_t v46 = *(const void **)a1;
  uint64_t v47 = *(void *)(a1 + 8);
  if (v45 >= 0) {
    unint64_t v48 = (const void *)a1;
  }
  else {
    unint64_t v48 = *(const void **)a1;
  }
  if (v45 >= 0) {
    size_t v49 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    size_t v49 = *(void *)(a1 + 8);
  }
  if (v49 >= v44) {
    size_t v50 = v44;
  }
  else {
    size_t v50 = v49;
  }
  int v51 = memcmp(v43, v48, v50);
  if (!v51)
  {
    if (v44 <= v49) {
      return result;
    }
    goto LABEL_84;
  }
  if ((v51 & 0x80000000) == 0)
  {
LABEL_84:
    uint64_t v52 = *(void *)(a1 + 16);
    uint64_t v53 = *(void *)(a2 + 16);
    __n128 result = *(__n128 *)a2;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = v53;
    *(void *)a2 = v46;
    *(void *)(a2 + 8) = v47;
    *(void *)(a2 + 16) = v52;
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(uint64_t a1, const void **a2)
{
  long long v2 = a2;
  uint64_t v4 = ((uint64_t)a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      int v6 = a2 - 3;
      int v7 = *((char *)a2 - 1);
      if (v7 >= 0) {
        size_t v8 = a2 - 3;
      }
      else {
        size_t v8 = (const void **)*(a2 - 3);
      }
      if (v7 >= 0) {
        size_t v9 = *((unsigned __int8 *)a2 - 1);
      }
      else {
        size_t v9 = (size_t)*(a2 - 2);
      }
      int v10 = *(char *)(a1 + 23);
      int v11 = *(const void **)a1;
      unint64_t v12 = *(const void **)(a1 + 8);
      if (v10 >= 0) {
        unint64_t v13 = (const void *)a1;
      }
      else {
        unint64_t v13 = *(const void **)a1;
      }
      if (v10 >= 0) {
        size_t v14 = *(unsigned __int8 *)(a1 + 23);
      }
      else {
        size_t v14 = *(void *)(a1 + 8);
      }
      if (v14 >= v9) {
        size_t v15 = v9;
      }
      else {
        size_t v15 = v14;
      }
      int v16 = memcmp(v8, v13, v15);
      if (v16)
      {
        if (v16 < 0) {
          return 1;
        }
      }
      else if (v9 <= v14)
      {
        return 1;
      }
      long long v41 = *(const void **)(a1 + 16);
      uint64_t v42 = (uint64_t)*(v2 - 1);
      *(_OWORD *)a1 = *(_OWORD *)v6;
      *(void *)(a1 + 16) = v42;
      *(v2 - 3) = v11;
      *(v2 - 2) = v12;
      *(v2 - 1) = v41;
      return 1;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, a2 - 3);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, a1 + 48, a2 - 3);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, a1 + 48, a1 + 72, a2 - 3);
      return 1;
    default:
      int v17 = (const void **)(a1 + 48);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, (const void **)(a1 + 48));
      int v18 = (const void **)(a1 + 72);
      if ((const void **)(a1 + 72) == v2) {
        return 1;
      }
      uint64_t v19 = 0;
      int v20 = 0;
      unint64_t v43 = v2;
      break;
  }
  while (2)
  {
    int v23 = *((char *)v18 + 23);
    if (v23 >= 0) {
      size_t v24 = v18;
    }
    else {
      size_t v24 = *v18;
    }
    if (v23 >= 0) {
      size_t v25 = *((unsigned __int8 *)v18 + 23);
    }
    else {
      size_t v25 = (size_t)v18[1];
    }
    int v26 = *((char *)v17 + 23);
    if (v26 >= 0) {
      uint64_t v27 = v17;
    }
    else {
      uint64_t v27 = *v17;
    }
    if (v26 >= 0) {
      size_t v28 = *((unsigned __int8 *)v17 + 23);
    }
    else {
      size_t v28 = (size_t)v17[1];
    }
    if (v28 >= v25) {
      size_t v29 = v25;
    }
    else {
      size_t v29 = v28;
    }
    int v30 = memcmp(v24, v27, v29);
    if (v30)
    {
      if (v30 < 0) {
        goto LABEL_25;
      }
    }
    else if (v25 <= v28)
    {
      goto LABEL_25;
    }
    long long v44 = *(_OWORD *)v18;
    int v45 = v18[2];
    *(_OWORD *)int v18 = *(_OWORD *)v17;
    v18[2] = v17[2];
    *((unsigned char *)v17 + 23) = 0;
    *(unsigned char *)int v17 = 0;
    uint64_t v21 = a1;
    if (v17 == (const void **)a1) {
      goto LABEL_24;
    }
    uint64_t v31 = v19;
    while (1)
    {
      uint64_t v32 = a1 + v31;
      int v33 = (_OWORD *)(a1 + v31 + 24);
      unint64_t v34 = SHIBYTE(v45) >= 0 ? &v44 : (long long *)v44;
      unint64_t v35 = SHIBYTE(v45) >= 0 ? HIBYTE(v45) : *((void *)&v44 + 1);
      int v36 = *(char *)(v32 + 47);
      size_t v37 = v36 >= 0 ? (const void *)(a1 + v31 + 24) : *(const void **)(a1 + v31 + 24);
      unint64_t v38 = v36 >= 0 ? *(unsigned __int8 *)(v32 + 47) : *(void *)(v32 + 32);
      size_t v39 = v38 >= v35 ? v35 : v38;
      int v40 = memcmp(v34, v37, v39);
      if (!v40) {
        break;
      }
      if (v40 < 0)
      {
        uint64_t v21 = (uint64_t)v17;
        goto LABEL_23;
      }
LABEL_48:
      v17 -= 3;
      *(_OWORD *)(v32 + 48) = *v33;
      *(void *)(v32 + 64) = *(void *)(a1 + v31 + 40);
      *(unsigned char *)(v32 + 47) = 0;
      *(unsigned char *)int v33 = 0;
      v31 -= 24;
      if (v31 == -48)
      {
        uint64_t v21 = a1;
        goto LABEL_23;
      }
    }
    if (v35 > v38) {
      goto LABEL_48;
    }
    uint64_t v21 = a1 + v31 + 48;
LABEL_23:
    long long v2 = v43;
LABEL_24:
    long long v22 = v44;
    *(void *)(v21 + 16) = v45;
    *(_OWORD *)uint64_t v21 = v22;
    if (++v20 == 8) {
      return v18 + 3 == v2;
    }
LABEL_25:
    int v17 = v18;
    v19 += 24;
    v18 += 3;
    if (v18 != v2) {
      continue;
    }
    return 1;
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(uint64_t a1, uint64_t a2, uint64_t a3, const void **a4)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a2, (const void **)a3);
  int v8 = *((char *)a4 + 23);
  if (v8 >= 0) {
    size_t v9 = a4;
  }
  else {
    size_t v9 = *a4;
  }
  if (v8 >= 0) {
    size_t v10 = *((unsigned __int8 *)a4 + 23);
  }
  else {
    size_t v10 = (size_t)a4[1];
  }
  int v11 = *(char *)(a3 + 23);
  unint64_t v12 = *(const void **)a3;
  unint64_t v13 = *(const void **)(a3 + 8);
  if (v11 >= 0) {
    size_t v14 = (const void *)a3;
  }
  else {
    size_t v14 = *(const void **)a3;
  }
  if (v11 >= 0) {
    size_t v15 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    size_t v15 = *(void *)(a3 + 8);
  }
  if (v15 >= v10) {
    size_t v16 = v10;
  }
  else {
    size_t v16 = v15;
  }
  int v17 = memcmp(v9, v14, v16);
  if (v17)
  {
    if (v17 < 0) {
      return result;
    }
  }
  else if (v10 <= v15)
  {
    return result;
  }
  uint64_t v19 = *(const void **)(a3 + 16);
  int v20 = a4[2];
  *(_OWORD *)a3 = *(_OWORD *)a4;
  *(void *)(a3 + 16) = v20;
  *a4 = v12;
  a4[1] = v13;
  a4[2] = v19;
  int v21 = *(char *)(a3 + 23);
  if (v21 >= 0) {
    long long v22 = (const void *)a3;
  }
  else {
    long long v22 = *(const void **)a3;
  }
  if (v21 >= 0) {
    size_t v23 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    size_t v23 = *(void *)(a3 + 8);
  }
  int v24 = *(char *)(a2 + 23);
  size_t v25 = *(const void **)a2;
  uint64_t v26 = *(void *)(a2 + 8);
  if (v24 >= 0) {
    uint64_t v27 = (const void *)a2;
  }
  else {
    uint64_t v27 = *(const void **)a2;
  }
  if (v24 >= 0) {
    size_t v28 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v28 = *(void *)(a2 + 8);
  }
  if (v28 >= v23) {
    size_t v29 = v23;
  }
  else {
    size_t v29 = v28;
  }
  int v30 = memcmp(v22, v27, v29);
  if (v30)
  {
    if (v30 < 0) {
      return result;
    }
  }
  else if (v23 <= v28)
  {
    return result;
  }
  uint64_t v31 = *(void *)(a2 + 16);
  uint64_t v32 = *(void *)(a3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(void *)(a2 + 16) = v32;
  *(void *)a3 = v25;
  *(void *)(a3 + 8) = v26;
  *(void *)(a3 + 16) = v31;
  int v33 = *(char *)(a2 + 23);
  if (v33 >= 0) {
    unint64_t v34 = (const void *)a2;
  }
  else {
    unint64_t v34 = *(const void **)a2;
  }
  if (v33 >= 0) {
    size_t v35 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v35 = *(void *)(a2 + 8);
  }
  int v36 = *(char *)(a1 + 23);
  size_t v37 = *(const void **)a1;
  uint64_t v38 = *(void *)(a1 + 8);
  if (v36 >= 0) {
    size_t v39 = (const void *)a1;
  }
  else {
    size_t v39 = *(const void **)a1;
  }
  if (v36 >= 0) {
    size_t v40 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    size_t v40 = *(void *)(a1 + 8);
  }
  if (v40 >= v35) {
    size_t v41 = v35;
  }
  else {
    size_t v41 = v40;
  }
  int v42 = memcmp(v34, v39, v41);
  if (!v42)
  {
    if (v35 <= v40) {
      return result;
    }
LABEL_58:
    uint64_t v43 = *(void *)(a1 + 16);
    uint64_t v44 = *(void *)(a2 + 16);
    __n128 result = *(__n128 *)a2;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = v44;
    *(void *)a2 = v37;
    *(void *)(a2 + 8) = v38;
    *(void *)(a2 + 16) = v43;
    return result;
  }
  if ((v42 & 0x80000000) == 0) {
    goto LABEL_58;
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void **a5)
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a2, a3, (const void **)a4);
  int v10 = *((char *)a5 + 23);
  if (v10 >= 0) {
    int v11 = a5;
  }
  else {
    int v11 = *a5;
  }
  if (v10 >= 0) {
    size_t v12 = *((unsigned __int8 *)a5 + 23);
  }
  else {
    size_t v12 = (size_t)a5[1];
  }
  int v13 = *(char *)(a4 + 23);
  size_t v14 = *(const void **)a4;
  size_t v15 = *(const void **)(a4 + 8);
  if (v13 >= 0) {
    size_t v16 = (const void *)a4;
  }
  else {
    size_t v16 = *(const void **)a4;
  }
  if (v13 >= 0) {
    size_t v17 = *(unsigned __int8 *)(a4 + 23);
  }
  else {
    size_t v17 = *(void *)(a4 + 8);
  }
  if (v17 >= v12) {
    size_t v18 = v12;
  }
  else {
    size_t v18 = v17;
  }
  int v19 = memcmp(v11, v16, v18);
  if (v19)
  {
    if (v19 < 0) {
      return result;
    }
  }
  else if (v12 <= v17)
  {
    return result;
  }
  int v21 = *(const void **)(a4 + 16);
  long long v22 = a5[2];
  *(_OWORD *)a4 = *(_OWORD *)a5;
  *(void *)(a4 + 16) = v22;
  *a5 = v14;
  a5[1] = v15;
  a5[2] = v21;
  int v23 = *(char *)(a4 + 23);
  if (v23 >= 0) {
    int v24 = (const void *)a4;
  }
  else {
    int v24 = *(const void **)a4;
  }
  if (v23 >= 0) {
    size_t v25 = *(unsigned __int8 *)(a4 + 23);
  }
  else {
    size_t v25 = *(void *)(a4 + 8);
  }
  int v26 = *(char *)(a3 + 23);
  uint64_t v27 = *(const void **)a3;
  uint64_t v28 = *(void *)(a3 + 8);
  if (v26 >= 0) {
    size_t v29 = (const void *)a3;
  }
  else {
    size_t v29 = *(const void **)a3;
  }
  if (v26 >= 0) {
    size_t v30 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    size_t v30 = *(void *)(a3 + 8);
  }
  if (v30 >= v25) {
    size_t v31 = v25;
  }
  else {
    size_t v31 = v30;
  }
  int v32 = memcmp(v24, v29, v31);
  if (v32)
  {
    if (v32 < 0) {
      return result;
    }
  }
  else if (v25 <= v30)
  {
    return result;
  }
  uint64_t v33 = *(void *)(a3 + 16);
  uint64_t v34 = *(void *)(a4 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a4;
  *(void *)(a3 + 16) = v34;
  *(void *)a4 = v27;
  *(void *)(a4 + 8) = v28;
  *(void *)(a4 + 16) = v33;
  int v35 = *(char *)(a3 + 23);
  if (v35 >= 0) {
    int v36 = (const void *)a3;
  }
  else {
    int v36 = *(const void **)a3;
  }
  if (v35 >= 0) {
    size_t v37 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    size_t v37 = *(void *)(a3 + 8);
  }
  int v38 = *(char *)(a2 + 23);
  size_t v39 = *(const void **)a2;
  uint64_t v40 = *(void *)(a2 + 8);
  if (v38 >= 0) {
    size_t v41 = (const void *)a2;
  }
  else {
    size_t v41 = *(const void **)a2;
  }
  if (v38 >= 0) {
    size_t v42 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v42 = *(void *)(a2 + 8);
  }
  if (v42 >= v37) {
    size_t v43 = v37;
  }
  else {
    size_t v43 = v42;
  }
  int v44 = memcmp(v36, v41, v43);
  if (v44)
  {
    if (v44 < 0) {
      return result;
    }
  }
  else if (v37 <= v42)
  {
    return result;
  }
  uint64_t v45 = *(void *)(a2 + 16);
  uint64_t v46 = *(void *)(a3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(void *)(a2 + 16) = v46;
  *(void *)a3 = v39;
  *(void *)(a3 + 8) = v40;
  *(void *)(a3 + 16) = v45;
  int v47 = *(char *)(a2 + 23);
  if (v47 >= 0) {
    unint64_t v48 = (const void *)a2;
  }
  else {
    unint64_t v48 = *(const void **)a2;
  }
  if (v47 >= 0) {
    size_t v49 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v49 = *(void *)(a2 + 8);
  }
  int v50 = *(char *)(a1 + 23);
  int v51 = *(const void **)a1;
  uint64_t v52 = *(void *)(a1 + 8);
  if (v50 >= 0) {
    uint64_t v53 = (const void *)a1;
  }
  else {
    uint64_t v53 = *(const void **)a1;
  }
  if (v50 >= 0) {
    size_t v54 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    size_t v54 = *(void *)(a1 + 8);
  }
  if (v54 >= v49) {
    size_t v55 = v49;
  }
  else {
    size_t v55 = v54;
  }
  int v56 = memcmp(v48, v53, v55);
  if (v56)
  {
    if (v56 < 0) {
      return result;
    }
  }
  else if (v49 <= v54)
  {
    return result;
  }
  uint64_t v57 = *(void *)(a1 + 16);
  uint64_t v58 = *(void *)(a2 + 16);
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v58;
  *(void *)a2 = v51;
  *(void *)(a2 + 8) = v52;
  *(void *)(a2 + 16) = v57;
  return result;
}

char *std::vector<std::string>::__push_back_slow_path<std::string>(void **a1, uint64_t a2)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 3);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) > v4) {
    unint64_t v4 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) >= 0x555555555555555) {
    unint64_t v6 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v6)
  {
    if (v6 > 0xAAAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int v7 = (char *)operator new(24 * v6);
  }
  else
  {
    int v7 = 0;
  }
  int v8 = &v7[24 * v3];
  size_t v9 = &v7[24 * v6];
  *(_OWORD *)int v8 = *(_OWORD *)a2;
  *((void *)v8 + 2) = *(void *)(a2 + 16);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  int v10 = v8 + 24;
  int v11 = (void **)*a1;
  size_t v12 = (void **)a1[1];
  if (v12 == *a1)
  {
    *a1 = v8;
    a1[1] = v10;
    a1[2] = v9;
  }
  else
  {
    do
    {
      long long v13 = *(_OWORD *)(v12 - 3);
      *((void *)v8 - 1) = *(v12 - 1);
      *(_OWORD *)(v8 - 24) = v13;
      v8 -= 24;
      *(v12 - 2) = 0;
      *(v12 - 1) = 0;
      *(v12 - 3) = 0;
      v12 -= 3;
    }
    while (v12 != v11);
    size_t v12 = (void **)*a1;
    size_t v14 = (void **)a1[1];
    *a1 = v8;
    a1[1] = v10;
    a1[2] = v9;
    while (v14 != v12)
    {
      if (*((char *)v14 - 1) < 0) {
        operator delete(*(v14 - 3));
      }
      v14 -= 3;
    }
  }
  if (v12) {
    operator delete(v12);
  }
  return v10;
}

const char *abm::asString(unsigned int a1)
{
  if (a1 > 9) {
    return "Unknown";
  }
  else {
    return off_1E6518708[a1];
  }
}

{
  if (a1 > 3) {
    return "Unknown";
  }
  else {
    return off_1E6518758[a1];
  }
}

const char *abm::asString(int a1)
{
  if ((a1 - 1) > 2) {
    return "Unknown";
  }
  else {
    return off_1E6518778[a1 - 1];
  }
}

{
  if ((a1 - 1) > 2) {
    return "Unknown";
  }
  else {
    return off_1E6518790[a1 - 1];
  }
}

uint64_t *GetOsLogContext(void)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBBDD608, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EBBDD608))
  {
    qword_1EBBDD628 = 0;
    qword_1EBBDD620 = 0;
    __cxa_atexit(MEMORY[0x1E4FBA188], &qword_1EBBDD620, &dword_1C5767000);
    __cxa_guard_release(&qword_1EBBDD608);
  }
  if (_MergedGlobals_12 != -1) {
    dispatch_once(&_MergedGlobals_12, &__block_literal_global_7);
  }
  return &qword_1EBBDD620;
}

void ___Z15GetOsLogContextv_block_invoke()
{
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v0, "com.apple.telephony.abm", "global");
  ctu::OsLogContext::operator=();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v0);
}

void *GetGlobalLogger(void *a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBBDD618, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EBBDD618))
  {
    MEMORY[0x1C8790FF0](&unk_1EBBDD630);
    __cxa_atexit(MEMORY[0x1E4FBA190], &unk_1EBBDD630, &dword_1C5767000);
    __cxa_guard_release(&qword_1EBBDD618);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1174405120;
  v5[2] = ___Z15GetGlobalLoggerNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v5[3] = &__block_descriptor_tmp_3_4;
  long long v2 = (std::__shared_weak_count *)a1[1];
  v5[4] = *a1;
  unint64_t v6 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (qword_1EBBDD610 == -1)
  {
    unint64_t v3 = v6;
    if (!v6) {
      return &unk_1EBBDD630;
    }
  }
  else
  {
    dispatch_once(&qword_1EBBDD610, v5);
    unint64_t v3 = v6;
    if (!v6) {
      return &unk_1EBBDD630;
    }
  }
  if (atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return &unk_1EBBDD630;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return &unk_1EBBDD630;
}

void sub_1C59659A0(_Unwind_Exception *a1)
{
}

void ___Z15GetGlobalLoggerNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke(uint64_t a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBBDD608, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EBBDD608))
  {
    qword_1EBBDD628 = 0;
    qword_1EBBDD620 = 0;
    __cxa_atexit(MEMORY[0x1E4FBA188], &qword_1EBBDD620, &dword_1C5767000);
    __cxa_guard_release(&qword_1EBBDD608);
  }
  if (_MergedGlobals_12 != -1) {
    dispatch_once(&_MergedGlobals_12, &__block_literal_global_7);
  }
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v5, (const ctu::OsLogContext *)&qword_1EBBDD620);
  MEMORY[0x1C8790FE0](v6, v5, a1 + 32);
  ctu::LoggerCommonBase::operator=();
  uint64_t v3 = v7;
  uint64_t v2 = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v4 = (std::__shared_weak_count *)qword_1EBBDD668;
  qword_1EBBDD660 = v3;
  qword_1EBBDD668 = v2;
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  MEMORY[0x1C8791000](v6);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v5);
}

void sub_1C5965B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t __copy_helper_block_e8_32c42_ZTSNSt3__110shared_ptrIN3ctu9LogServerEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_32c42_ZTSNSt3__110shared_ptrIN3ctu9LogServerEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

void *PPMManager::create@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  *a2 = 0xAAAAAAAAAAAAAAAALL;
  a2[1] = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = operator new(0x28uLL);
  __n128 result = std::__shared_ptr_emplace<PPMManager>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<ctu::LogServer> &,std::allocator<PPMManager>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_1C5965C04(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

const char *PPMManager::getName(PPMManager *this)
{
  return "ppm.mgr";
}

void *PPMManager::PPMManager(void *a1, uint64_t *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  *a1 = 0;
  a1[1] = 0;
  uint64_t v4 = *a2;
  uint64_t v3 = (std::__shared_weak_count *)a2[1];
  uint64_t v15 = *a2;
  size_t v16 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  BOOL v5 = operator new(0x68uLL);
  unint64_t v6 = v5;
  v5[1] = 0;
  v5[2] = 0;
  void *v5 = &unk_1F20FFAD0;
  uint64_t v7 = v5 + 3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v5[3] = &unk_1F20FFB90;
  *((unsigned char *)&__p.__r_.__value_.__s + 23) = 8;
  strcpy((char *)&__p, "ppm.hdlr");
  ctu::LoggerCommonBase::LoggerCommonBase();
  v6[4] = &unk_1F20F0070;
  v6[10] = v4;
  v6[11] = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  v6[3] = &unk_1F20FFB20;
  v6[12] = 0;
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  id v18 = 0;
  uint64_t v8 = [[MEMORY[0x1E4FBA110] sharedInstanceWithClientRepresentation:@"com.apple.duet.ppm-attr.bsbd" error:&v18]
  size_t v9 = (NSError *)v18;
  int v10 = (void *)v6[12];
  v6[12] = v8;

  if (v9 || !v6[12])
  {
    int v11 = v6[8];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      PPMHandler::getErrorMsg(&__p, v9);
      size_t v12 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &__p
          : (std::string *)__p.__r_.__value_.__r.__words[0];
      *(_DWORD *)std::string buf = 136315138;
      int v20 = v12;
      _os_log_error_impl(&dword_1C5767000, v11, OS_LOG_TYPE_ERROR, "Failed to get PPM instance: %s", buf, 0xCu);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
  }

  long long v13 = (std::__shared_weak_count *)a1[1];
  *a1 = v7;
  a1[1] = v6;
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  return a1;
}

void sub_1C5965F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100](v11);
  _Unwind_Resume(a1);
}

void sub_1C5965FC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  if (v20)
  {
    if (!atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  std::__shared_weak_count::~__shared_weak_count(v19);
  operator delete(v22);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100](v18);
  _Unwind_Resume(a1);
}

void sub_1C5966040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<ABMServer>::~shared_ptr[abi:ne180100](v9);
  _Unwind_Resume(a1);
}

void PPMManager::start(PPMHandler **this)
{
}

void PPMHandler::start(PPMHandler *this)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)*((void *)this + 9);
  id v9 = 0;
  char v3 = [v2 activityStartedWithLevel:&unk_1F2100F90 options:0 error:&v9];
  uint64_t v4 = (NSError *)v9;
  if (v4) {
    char v5 = 0;
  }
  else {
    char v5 = v3;
  }
  if ((v5 & 1) == 0)
  {
    unint64_t v6 = *((void *)this + 5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      PPMHandler::getErrorMsg(&__p, v4);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string buf = 136315138;
      uint64_t v11 = p_p;
      _os_log_error_impl(&dword_1C5767000, v6, OS_LOG_TYPE_ERROR, "Failed to set PPM activity started level: %s", buf, 0xCu);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
  }
}

void sub_1C5966180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void PPMManager::reportTelemetry(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  char v3 = *a2;
  xpc_object_t object = v3;
  if (v3) {
    xpc_retain(v3);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  PPMHandler::reportTelemetry(v2, &object);
  xpc_release(object);
}

void sub_1C59661F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void PPMHandler::reportTelemetry(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x1C8792D30](*a2) != MEMORY[0x1E4F14590]) {
    return;
  }
  uint64_t v4 = (void *)*a2;
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)xpc_object_t object = v4;
  if (v4) {
    xpc_retain(v4);
  }
  else {
    *(void *)xpc_object_t object = xpc_null_create();
  }
  xpc::bridge((uint64_t *)&cf, (xpc *)object, v5);
  unint64_t v6 = (const void *)cf.__r_.__value_.__r.__words[0];
  if (cf.__r_.__value_.__r.__words[0])
  {
    CFTypeID v7 = CFGetTypeID(cf.__r_.__value_.__l.__data_);
    if (v7 == CFDictionaryGetTypeID())
    {
      unint64_t v15 = (unint64_t)v6;
      CFRetain(v6);
      uint64_t v8 = (const void *)cf.__r_.__value_.__r.__words[0];
      if (!cf.__r_.__value_.__r.__words[0]) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  unint64_t v6 = 0;
  unint64_t v15 = 0;
  uint64_t v8 = (const void *)cf.__r_.__value_.__r.__words[0];
  if (cf.__r_.__value_.__r.__words[0]) {
LABEL_10:
  }
    CFRelease(v8);
LABEL_11:
  xpc_release(*(xpc_object_t *)object);
  id v9 = *(void **)(a1 + 72);
  id v14 = 0;
  [v9 pushTelemetryToPPM:v6 error:&v14];
  int v10 = (NSError *)v14;
  if (v10)
  {
    uint64_t v11 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      PPMHandler::getErrorMsg(&cf, v10);
      uint64_t v12 = (cf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &cf
          : (std::string *)cf.__r_.__value_.__r.__words[0];
      *(_DWORD *)xpc_object_t object = 136315138;
      *(void *)&object[4] = v12;
      _os_log_error_impl(&dword_1C5767000, v11, OS_LOG_TYPE_ERROR, "Failed to report telemetry to PPM: %s", object, 0xCu);
      if (SHIBYTE(cf.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(cf.__r_.__value_.__l.__data_);
      }
    }
  }
  if (v6) {
    CFRelease(v6);
  }
}

void sub_1C59663B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, xpc_object_t object)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void PPMManager::shutdown(PPMHandler **this)
{
}

void PPMHandler::shutdown(PPMHandler *this)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)*((void *)this + 9);
  id v15 = 0;
  char v3 = [v2 activityStoppedWithLevel:0 options:0 error:&v15];
  uint64_t v4 = (NSError *)v15;
  if (v4) {
    char v5 = 0;
  }
  else {
    char v5 = v3;
  }
  if ((v5 & 1) == 0)
  {
    unint64_t v6 = *((void *)this + 5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      PPMHandler::getErrorMsg(&__p, v4);
      uint64_t v11 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &__p
          : (std::string *)__p.__r_.__value_.__r.__words[0];
      *(_DWORD *)std::string buf = 136315138;
      uint64_t v17 = v11;
      _os_log_error_impl(&dword_1C5767000, v6, OS_LOG_TYPE_ERROR, "Failed to set PPM activity stopped level: %s", buf, 0xCu);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
  }
  CFTypeID v7 = (void *)*((void *)this + 9);
  long long v13 = v4;
  [v7 endInteraction:&v13];
  uint64_t v8 = v13;

  if (v8) {
    char v9 = 0;
  }
  else {
    char v9 = v3;
  }
  if ((v9 & 1) == 0)
  {
    int v10 = *((void *)this + 5);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      PPMHandler::getErrorMsg(&__p, v8);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string buf = 136315138;
      uint64_t v17 = p_p;
      _os_log_error_impl(&dword_1C5767000, v10, OS_LOG_TYPE_ERROR, "Failed to end interaction: %s", buf, 0xCu);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
  }
}

void sub_1C59665F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<PPMHandler>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20FFAD0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<PPMHandler>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20FFAD0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<PPMHandler>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void PPMHandler::~PPMHandler(id *this)
{
  *this = &unk_1F20FFB90;
  MEMORY[0x1C8790F40](this + 1);
}

{
  uint64_t vars8;

  *this = &unk_1F20FFB90;
  MEMORY[0x1C8790F40](this + 1);

  operator delete(this);
}

uint64_t ctu::Loggable<PPMHandler,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x1F417DA50](a1 + 8);
}

void ctu::Loggable<PPMHandler,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(char *a1@<X8>)
{
  a1[23] = 8;
  strcpy(a1, "ppm.hdlr");
}

uint64_t ctu::Loggable<PPMHandler,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x1F417DD10](a1 + 8);
}

void *ctu::Loggable<PPMHandler,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F20FFB90;
  MEMORY[0x1C8790F40](a1 + 1);
  return a1;
}

void ctu::Loggable<PPMHandler,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F20FFB90;
  MEMORY[0x1C8790F40](a1 + 1);

  operator delete(a1);
}

void PPMHandler::getErrorMsg(std::string *this, NSError *a2)
{
  char v3 = a2;
  this->__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  this->__r_.__value_.__r.__words[2] = 0xAAAAAAAAAAAAAAAALL;
  *((unsigned char *)&this->__r_.__value_.__s + 23) = 13;
  strcpy((char *)this, "Unknown error");
  if (v3)
  {
    int v10 = v3;
    uint64_t v4 = [(NSError *)v3 localizedDescription];
    char v5 = [(NSError *)v10 localizedFailureReason];
    if (v5)
    {
      unint64_t v6 = [(NSError *)v10 localizedFailureReason];
    }
    else
    {
      CFTypeID v7 = [MEMORY[0x1E4F28B50] mainBundle];
      unint64_t v6 = [v7 localizedStringForKey:@"Not found localizedFailureReason" value:&stru_1F20FFDB0 table:0];
    }
    uint64_t v8 = [NSString stringWithFormat:@"%@: %@", v4, v6];

    id v9 = v8;
    std::string::__assign_external(this, (const std::string::value_type *)[v9 UTF8String]);

    char v3 = v10;
  }
}

void sub_1C5966964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  size_t v16 = v15;

  if (*(char *)(v12 + 23) < 0) {
    operator delete(*(void **)v12);
  }

  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<PPMManager>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<ctu::LogServer> &,std::allocator<PPMManager>,0>(void *a1, uint64_t *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_1F20FFBD0;
  char v3 = a1 + 3;
  uint64_t v4 = (std::__shared_weak_count *)a2[1];
  v6[0] = *a2;
  v6[1] = (uint64_t)v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  PPMManager::PPMManager(v3, v6);
  if (!v4 || atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void sub_1C5966AA8(_Unwind_Exception *a1)
{
  if (v2)
  {
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<PPMManager>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20FFBD0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<PPMManager>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20FFBD0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_emplace<PPMManager>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 32);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

uint64_t APFSVolumeNeedsCryptoMigration()
{
  return MEMORY[0x1F4105388]();
}

uint64_t APFSVolumeRole()
{
  return MEMORY[0x1F4105390]();
}

void AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID)
{
}

uint64_t BBUFSServerCopyDefaultDestination()
{
  return MEMORY[0x1F4179F70]();
}

uint64_t BBUFSServerCreate()
{
  return MEMORY[0x1F4179F78]();
}

uint64_t BBUFSServerFlush()
{
  return MEMORY[0x1F4179F80]();
}

uint64_t BBUFSServerFlushInProgress()
{
  return MEMORY[0x1F4179F88]();
}

uint64_t BBUFSServerParametersInit()
{
  return MEMORY[0x1F4179F90]();
}

uint64_t BBUFSServerRelease()
{
  return MEMORY[0x1F4179F98]();
}

uint64_t BBUFSServerStart()
{
  return MEMORY[0x1F4179FA8]();
}

uint64_t BBUFSServerStop()
{
  return MEMORY[0x1F4179FB0]();
}

uint64_t BBUpdaterExecCommand()
{
  return MEMORY[0x1F4179FB8]();
}

uint64_t BBUpdaterExtremeCreate()
{
  return MEMORY[0x1F4179FC0]();
}

uint64_t BBUpdaterRegisterGlobalLogSink()
{
  return MEMORY[0x1F4179FC8]();
}

uint64_t BBUpdaterSetOptions()
{
  return MEMORY[0x1F4179FD0]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x1F40D7AA0](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1F40D7AA8](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1F40D7AB8](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F58](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1F40D7FC0](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1F40D7FF8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

Boolean CFRunLoopIsWaiting(CFRunLoopRef rl)
{
  return MEMORY[0x1F40D80D0](rl);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

uint64_t ETLDebugRegisterDelegate()
{
  return MEMORY[0x1F417A4D0]();
}

uint64_t IOPMClaimSystemWakeEvent()
{
  return MEMORY[0x1F40E8FC8]();
}

uint64_t NEHelperCacheCopyAppUUIDMapping()
{
  return MEMORY[0x1F40C98D8]();
}

uint64_t SBSGetScreenLockStatus()
{
  return MEMORY[0x1F415C380]();
}

uint64_t TelephonyBasebandCreateController()
{
  return MEMORY[0x1F417D178]();
}

uint64_t TelephonyBasebandGetBasebandState()
{
  return MEMORY[0x1F417D190]();
}

uint64_t TelephonyBasebandGetManagerState()
{
  return MEMORY[0x1F417D198]();
}

uint64_t TelephonyBasebandGetPowerDebugOptions()
{
  return MEMORY[0x1F417D1A0]();
}

uint64_t TelephonyBasebandGetReset()
{
  return MEMORY[0x1F417D1A8]();
}

uint64_t TelephonyBasebandPCITransportCreate()
{
  return MEMORY[0x1F417CF18]();
}

uint64_t TelephonyBasebandPCITransportInitParameters()
{
  return MEMORY[0x1F417CF20]();
}

uint64_t TelephonyBasebandPowerDebugUnblock()
{
  return MEMORY[0x1F417D1B0]();
}

uint64_t TelephonyBasebandPowerOnModem()
{
  return MEMORY[0x1F417D1B8]();
}

uint64_t TelephonyBasebandPowercycleModem()
{
  return MEMORY[0x1F417D1C0]();
}

uint64_t TelephonyBasebandRegisterForReset()
{
  return MEMORY[0x1F417D1C8]();
}

uint64_t TelephonyBasebandReportThermalData()
{
  return MEMORY[0x1F417D1D0]();
}

uint64_t TelephonyBasebandResetModem()
{
  return MEMORY[0x1F417D1D8]();
}

uint64_t TelephonyBasebandResetSPMI()
{
  return MEMORY[0x1F417D1E0]();
}

uint64_t TelephonyBasebandSetBasebandProperty()
{
  return MEMORY[0x1F417D1E8]();
}

uint64_t TelephonyBasebandSetBasebandState()
{
  return MEMORY[0x1F417D1F0]();
}

uint64_t TelephonyBasebandSetChargerDesense()
{
  return MEMORY[0x1F417D1F8]();
}

uint64_t TelephonyBasebandSetManagerState()
{
  return MEMORY[0x1F417D200]();
}

uint64_t TelephonyBasebandSetPowerDebugOptions()
{
  return MEMORY[0x1F417D210]();
}

uint64_t TelephonyBasebandWatchdogStart()
{
  return MEMORY[0x1F417D740]();
}

uint64_t TelephonyBasebandWatchdogStop()
{
  return MEMORY[0x1F417D748]();
}

uint64_t TelephonyUtilDebugRegisterDelegate()
{
  return MEMORY[0x1F417D8C0]();
}

uint64_t TelephonyUtilDebugSetFlags()
{
  return MEMORY[0x1F417D8C8]();
}

uint64_t TelephonyUtilGetSystemTime()
{
  return MEMORY[0x1F417D750]();
}

uint64_t TelephonyUtilGetSystemWakeReason()
{
  return MEMORY[0x1F417D758]();
}

uint64_t TelephonyUtilIsCarrierBuild()
{
  return MEMORY[0x1F417D760]();
}

uint64_t TelephonyUtilIsInternalBuild()
{
  return MEMORY[0x1F417D768]();
}

uint64_t TelephonyUtilIsVendorBuild()
{
  return MEMORY[0x1F417D770]();
}

uint64_t TelephonyUtilSystemMachTime()
{
  return MEMORY[0x1F417D778]();
}

uint64_t TelephonyUtilTransportFree()
{
  return MEMORY[0x1F417D940]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
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

uint64_t mav_router::device::controller::engage(mav_router::device::controller *this)
{
  return MEMORY[0x1F4180A08](this);
}

uint64_t capabilities::abs::shouldBoot(capabilities::abs *this)
{
  return MEMORY[0x1F417D218](this);
}

uint64_t capabilities::abs::TUDebugFlags(capabilities::abs *this)
{
  return MEMORY[0x1F417D228](this);
}

uint64_t capabilities::abs::supportsCoex(capabilities::abs *this)
{
  return MEMORY[0x1F417D230](this);
}

uint64_t capabilities::abs::getCPMSVariant(capabilities::abs *this)
{
  return MEMORY[0x1F417D238](this);
}

uint64_t capabilities::abs::logScratchPath(capabilities::abs *this)
{
  return MEMORY[0x1F417D240](this);
}

uint64_t capabilities::abs::logSnapshotPath(capabilities::abs *this)
{
  return MEMORY[0x1F417D248](this);
}

uint64_t capabilities::abs::shouldSetRegion(capabilities::abs *this)
{
  return MEMORY[0x1F417D250](this);
}

uint64_t capabilities::abs::supportsDesense(capabilities::abs *this)
{
  return MEMORY[0x1F417D258](this);
}

uint64_t capabilities::abs::supportsMagSafe(capabilities::abs *this)
{
  return MEMORY[0x1F417D260](this);
}

uint64_t capabilities::abs::CPMSDebounceTimer(capabilities::abs *this)
{
  return MEMORY[0x1F417D280](this);
}

uint64_t capabilities::abs::LLDataInterfaceID(capabilities::abs *this)
{
  return MEMORY[0x1F417D288](this);
}

uint64_t capabilities::abs::supportsCoexEur5G(capabilities::abs *this)
{
  return MEMORY[0x1F417D290](this);
}

uint64_t capabilities::abs::shouldIgnoreResets(capabilities::abs *this)
{
  return MEMORY[0x1F417D2A0](this);
}

uint64_t capabilities::abs::supportsRFSelfTest(capabilities::abs *this)
{
  return MEMORY[0x1F417D2A8](this);
}

uint64_t capabilities::abs::supportsETSProtocol(capabilities::abs *this)
{
  return MEMORY[0x1F417D2B0](this);
}

uint64_t capabilities::abs::supportsRadioHealth(capabilities::abs *this)
{
  return MEMORY[0x1F417D2B8](this);
}

uint64_t capabilities::abs::dataPowerSaveEnabled(capabilities::abs *this)
{
  return MEMORY[0x1F417D2C0](this);
}

uint64_t capabilities::abs::supportedSARFeatures(capabilities::abs *this)
{
  return MEMORY[0x1F417D2C8](this);
}

uint64_t capabilities::abs::supportsRFFEScanData(capabilities::abs *this)
{
  return MEMORY[0x1F417D2D8](this);
}

uint64_t capabilities::abs::QMIPacketMaxSizeBytes(capabilities::abs *this)
{
  return MEMORY[0x1F417D2E0](this);
}

uint64_t capabilities::abs::supportsNetworkPolicy(capabilities::abs *this)
{
  return MEMORY[0x1F417D2F0](this);
}

uint64_t capabilities::abs::thermalSensorMaxCount(capabilities::abs *this)
{
  return MEMORY[0x1F417D2F8](this);
}

uint64_t capabilities::abs::dataFlowControlEnabled(capabilities::abs *this)
{
  return MEMORY[0x1F417D300](this);
}

uint64_t capabilities::abs::defaultDataInterfaceID(capabilities::abs *this)
{
  return MEMORY[0x1F417D308](this);
}

uint64_t capabilities::abs::fileSystemFlushTimeout(capabilities::abs *this)
{
  return MEMORY[0x1F417D310](this);
}

uint64_t capabilities::abs::supportsChargerDesense(capabilities::abs *this)
{
  return MEMORY[0x1F417D318](this);
}

uint64_t capabilities::abs::supportsResetSPMIEvent(capabilities::abs *this)
{
  return MEMORY[0x1F417D320](this);
}

uint64_t capabilities::abs::dataAggregationProtocol(capabilities::abs *this)
{
  return MEMORY[0x1F417D328](this);
}

uint64_t capabilities::abs::fileSystemFlushInterval(capabilities::abs *this)
{
  return MEMORY[0x1F417D330](this);
}

uint64_t capabilities::abs::supportsAccessoryModule(capabilities::abs *this)
{
  return MEMORY[0x1F417D338](this);
}

uint64_t capabilities::abs::supportsCMHandDetection(capabilities::abs *this)
{
  return MEMORY[0x1F417D340](this);
}

uint64_t capabilities::abs::supportsFieldTestConfig(capabilities::abs *this)
{
  return MEMORY[0x1F417D350](this);
}

uint64_t capabilities::abs::SMCThermalReportInterval(capabilities::abs *this)
{
  return MEMORY[0x1F417D358](this);
}

uint64_t capabilities::abs::defaultSystemLogsHistory(capabilities::abs *this)
{
  return MEMORY[0x1F417D360](this);
}

uint64_t capabilities::abs::supportsCalibrationQuery(capabilities::abs *this)
{
  return MEMORY[0x1F417D370](this);
}

uint64_t capabilities::abs::supportsCoexGPSReporting(capabilities::abs *this)
{
  return MEMORY[0x1F417D378](this);
}

uint64_t capabilities::abs::supportsSMCThermalReport(capabilities::abs *this)
{
  return MEMORY[0x1F417D388](this);
}

uint64_t capabilities::abs::engageTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x1F417D398](this);
}

uint64_t capabilities::abs::supportsCPMSConnectedState(capabilities::abs *this)
{
  return MEMORY[0x1F417D3A0](this);
}

uint64_t capabilities::abs::supportsCPMSGetPowerFromBB(capabilities::abs *this)
{
  return MEMORY[0x1F417D3A8](this);
}

uint64_t capabilities::abs::supportsEFSEraseOnBootLoop(capabilities::abs *this)
{
  return MEMORY[0x1F417D3B0](this);
}

uint64_t capabilities::abs::dataAggregationMaxSizeBytes(capabilities::abs *this)
{
  return MEMORY[0x1F417D3B8](this);
}

uint64_t capabilities::abs::supportsDataTransportService(capabilities::abs *this)
{
  return MEMORY[0x1F417D3C8](this);
}

uint64_t capabilities::abs::LLDataAggregationMaxSizeBytes(capabilities::abs *this)
{
  return MEMORY[0x1F417D3D0](this);
}

uint64_t capabilities::abs::supportsBatteryInfoMonitoring(capabilities::abs *this)
{
  return MEMORY[0x1F417D3D8](this);
}

uint64_t capabilities::abs::supportsDisplayCoverAccessory(capabilities::abs *this)
{
  return MEMORY[0x1F417D3E0](this);
}

uint64_t capabilities::abs::dataAggregationDatagramMaxCount(capabilities::abs *this)
{
  return MEMORY[0x1F417D3F0](this);
}

uint64_t capabilities::abs::serviceInitTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x1F417D3F8](this);
}

uint64_t capabilities::abs::supportsSmartConnectorAccessory(capabilities::abs *this)
{
  return MEMORY[0x1F417D400](this);
}

uint64_t capabilities::abs::serviceSleepTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x1F417D408](this);
}

uint64_t capabilities::abs::serviceStartTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x1F417D410](this);
}

uint64_t capabilities::abs::LLDataAggregationDatagramMaxCount(capabilities::abs *this)
{
  return MEMORY[0x1F417D418](this);
}

uint64_t capabilities::abs::resetAssertionTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x1F417D420](this);
}

uint64_t capabilities::abs::traceTransportTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x1F417D428](this);
}

uint64_t capabilities::abs::bootupAssertionTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x1F417D430](this);
}

uint64_t capabilities::abs::serviceShutdownTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x1F417D438](this);
}

uint64_t capabilities::abs::shutdownAssertionTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x1F417D440](this);
}

uint64_t capabilities::abs::shouldUseMinBasebandTransportIOReadSize(capabilities::abs *this)
{
  return MEMORY[0x1F417D448](this);
}

uint64_t capabilities::abs::shouldUseMinBasebandTransportIOReadCount(capabilities::abs *this)
{
  return MEMORY[0x1F417D450](this);
}

uint64_t capabilities::abs::supportsWirelessTelemetryUsingMultiClientModel(capabilities::abs *this)
{
  return MEMORY[0x1F417D458](this);
}

uint64_t capabilities::abs::operator&()
{
  return MEMORY[0x1F417D460]();
}

uint64_t capabilities::ipc::supportsPCI(capabilities::ipc *this)
{
  return MEMORY[0x1F417D488](this);
}

uint64_t capabilities::ipc::defaultLogLevel(capabilities::ipc *this)
{
  return MEMORY[0x1F417D490](this);
}

uint64_t capabilities::ipc::supportsIPMetadataTrailer(capabilities::ipc *this)
{
  return MEMORY[0x1F417D4A8](this);
}

uint64_t capabilities::ipc::defaultMHIConfigPayloadSizeBytes(capabilities::ipc *this)
{
  return MEMORY[0x1F417D4B0](this);
}

uint64_t capabilities::ipc::defaultPCIBinaryTraceHistorySizeMB(capabilities::ipc *this)
{
  return MEMORY[0x1F417D4B8](this);
}

uint64_t capabilities::pci::controlChannelCount(capabilities::pci *this)
{
  return MEMORY[0x1F417D4C0](this);
}

uint64_t capabilities::radio::supportsMESA(capabilities::radio *this)
{
  return MEMORY[0x1F417D540](this);
}

uint64_t capabilities::radio::supportsUMTS(capabilities::radio *this)
{
  return MEMORY[0x1F417D548](this);
}

uint64_t capabilities::radio::supportsDataService(capabilities::radio *this)
{
  return MEMORY[0x1F417D560](this);
}

uint64_t capabilities::radio::supportsDeviceMaterial(capabilities::radio *this)
{
  return MEMORY[0x1F417D568](this);
}

uint64_t capabilities::radio::supportsLowLatencyData(capabilities::radio *this)
{
  return MEMORY[0x1F417D570](this);
}

uint64_t capabilities::radio::supportsMultiClientAWD(capabilities::radio *this)
{
  return MEMORY[0x1F417D578](this);
}

uint64_t capabilities::radio::personalizedFirmwarePath(capabilities::radio *this)
{
  return MEMORY[0x1F417D588](this);
}

uint64_t capabilities::radio::supportsAccessoryDetection(capabilities::radio *this)
{
  return MEMORY[0x1F417D590](this);
}

uint64_t capabilities::radio::supportsAutomaticRadarFiling(capabilities::radio *this)
{
  return MEMORY[0x1F417D5A0](this);
}

uint64_t capabilities::radio::supportsFactoryCalibrationV2(capabilities::radio *this)
{
  return MEMORY[0x1F417D5A8](this);
}

uint64_t capabilities::radio::supportsBasebandStateController(capabilities::radio *this)
{
  return MEMORY[0x1F417D5B0](this);
}

uint64_t capabilities::radio::supportsAccessoryDetectionForARTD(capabilities::radio *this)
{
  return MEMORY[0x1F417D5B8](this);
}

uint64_t capabilities::radio::supportsAccessoryTypeDetectionForRF(capabilities::radio *this)
{
  return MEMORY[0x1F417D5C0](this);
}

uint64_t capabilities::radio::supportsAccessoryTypeDetectionForARTD(capabilities::radio *this)
{
  return MEMORY[0x1F417D5C8](this);
}

uint64_t capabilities::radio::ice(capabilities::radio *this)
{
  return MEMORY[0x1F417D5D0](this);
}

uint64_t capabilities::radio::vendor(capabilities::radio *this)
{
  return MEMORY[0x1F417D5D8](this);
}

uint64_t capabilities::radio::product(capabilities::radio *this)
{
  return MEMORY[0x1F417D5E0](this);
}

uint64_t capabilities::radio::maverick(capabilities::radio *this)
{
  return MEMORY[0x1F417D5E8](this);
}

uint64_t capabilities::radio::C2KDevice(capabilities::radio *this)
{
  return MEMORY[0x1F417D5F0](this);
}

uint64_t capabilities::radio::mav20Plus(capabilities::radio *this)
{
  return MEMORY[0x1F417D5F8](this);
}

uint64_t capabilities::radio::radioType(capabilities::radio *this)
{
  return MEMORY[0x1F417D608](this);
}

uint64_t capabilities::trace::enabledByDefault(capabilities::trace *this)
{
  return MEMORY[0x1F417D610](this);
}

uint64_t capabilities::trace::getCompressionMode(capabilities::trace *this)
{
  return MEMORY[0x1F417D618](this);
}

uint64_t capabilities::trace::defaultFileSizeBytes(capabilities::trace *this)
{
  return MEMORY[0x1F417D620](this);
}

uint64_t capabilities::trace::defaultHistorySizeMB(capabilities::trace *this)
{
  return MEMORY[0x1F417D628](this);
}

uint64_t capabilities::trace::defaultMemoryFileMaxCount(capabilities::trace *this)
{
  return MEMORY[0x1F417D650](this);
}

uint64_t capabilities::trace::supportsDumpLogIndication(capabilities::trace *this)
{
  return MEMORY[0x1F417D658](this);
}

uint64_t capabilities::trace::supportsHighTPutByDefault(capabilities::trace *this)
{
  return MEMORY[0x1F417D660](this);
}

uint64_t capabilities::trace::supportsDataLoggingByDefault(capabilities::trace *this)
{
  return MEMORY[0x1F417D668](this);
}

uint64_t capabilities::trace::supportsDuplicateSignatureDetection(capabilities::trace *this)
{
  return MEMORY[0x1F417D678](this);
}

uint64_t capabilities::trace::allowed(capabilities::trace *this)
{
  return MEMORY[0x1F417D688](this);
}

uint64_t capabilities::txpower::supportsPPM(capabilities::txpower *this)
{
  return MEMORY[0x1F417D698](this);
}

uint64_t capabilities::txpower::timeoutConfig(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6A0](this);
}

uint64_t capabilities::txpower::supportsMotion(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6A8](this);
}

uint64_t capabilities::txpower::supportedFaceID(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6B0](this);
}

uint64_t capabilities::txpower::supportsKeyboard(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6B8](this);
}

uint64_t capabilities::txpower::supportsFrontCamera(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6C0](this);
}

uint64_t capabilities::txpower::supportsAudioSpeaker(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6C8](this);
}

uint64_t capabilities::txpower::supportsMotionAlways(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6D0](this);
}

uint64_t capabilities::txpower::supportedControlInput(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6D8](this);
}

uint64_t capabilities::txpower::supportsAudioJackReport(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6E0](this);
}

uint64_t capabilities::txpower::supportsPowerChargerDesense(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6E8](this);
}

uint64_t capabilities::txpower::supportsPowerSourceDetection(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6F0](this);
}

uint64_t capabilities::txpower::supportsVideoAntennaSwitching(capabilities::txpower *this)
{
  return MEMORY[0x1F417D6F8](this);
}

uint64_t capabilities::txpower::supportsAntennaFreeSpaceConfig(capabilities::txpower *this)
{
  return MEMORY[0x1F417D700](this);
}

uint64_t capabilities::txpower::operator&()
{
  return MEMORY[0x1F417D708]();
}

uint64_t capabilities::coredump::recoveryForControlMessageTimeout(capabilities::coredump *this)
{
  return MEMORY[0x1F417D730](this);
}

uint64_t capabilities::coredump::operator&()
{
  return MEMORY[0x1F417D738]();
}

uint64_t mav_router_t::create()
{
  return MEMORY[0x1F4180A10]();
}

uint64_t AppleSARHelper::callUserClientMethod(AppleSARHelper *this, uint64_t a2, const unint64_t *a3, uint64_t a4, const void *a5, uint64_t a6, unint64_t *a7, unsigned int *a8, void *a9, unint64_t a10)
{
  return MEMORY[0x1F410AAB8](this, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t AppleSARHelper::create_default_global(AppleSARHelper *this)
{
  return MEMORY[0x1F410AAC0](this);
}

uint64_t AppleSARHelper::registerSARServiceCallback()
{
  return MEMORY[0x1F410AAC8]();
}

uint64_t _ATCSException::setExceptionHandler()
{
  return MEMORY[0x1F41785E8]();
}

uint64_t ATCSRouterIPCDriver::resetErrorState(ATCSRouterIPCDriver *this)
{
  return MEMORY[0x1F41785F0](this);
}

uint64_t ATCSRouterIPCDriver::create()
{
  return MEMORY[0x1F41785F8]();
}

void QMIServerConnection::QMIServerConnection(QMIServerConnection *this)
{
}

uint64_t AppleBasebandManager::setEventHandler()
{
  return MEMORY[0x1F4109990]();
}

uint64_t AppleBasebandManager::create()
{
  return MEMORY[0x1F4109998]();
}

uint64_t AppleBasebandManager::perform()
{
  return MEMORY[0x1F41099A0]();
}

uint64_t AppleBasebandManager::eventsOn(AppleBasebandManager *this)
{
  return MEMORY[0x1F41099A8](this);
}

uint64_t CommandDriverFactory::setRegistry()
{
  return MEMORY[0x1F4179FF0]();
}

uint64_t CommandDriverFactory::create_default_global(CommandDriverFactory *this)
{
  return MEMORY[0x1F4179FF8](this);
}

void wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(wireless_diagnostics::google::protobuf::MessageLite *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x1F4181C68](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return MEMORY[0x1F4181C70](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return MEMORY[0x1F4181C78](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x1F4181CA0](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x1F4181CA8](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  return MEMORY[0x1F4181CC8](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  return MEMORY[0x1F4181CE8](this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage()
{
  return MEMORY[0x1F4181D10]();
}

void wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(wireless_diagnostics::google::protobuf::internal::LogMessage *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<()
{
  return MEMORY[0x1F4181D20]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=()
{
  return MEMORY[0x1F4181D30]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::VerifyVersion(wireless_diagnostics::google::protobuf::internal *this, uint64_t a2, uint64_t a3, const char *a4)
{
  return MEMORY[0x1F4181D68](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString()
{
  return MEMORY[0x1F4181D70]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString()
{
  return MEMORY[0x1F4181DA8]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x1F4181DB0](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x1F4181DB8](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x1F4181DD0](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  return MEMORY[0x1F4181DE8](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x1F4181DF0](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap()
{
  return MEMORY[0x1F4181E08]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *this)
{
  return MEMORY[0x1F4181E10](this);
}

uint64_t ApplePDPHelperInterface::getInstance(ApplePDPHelperInterface *this)
{
  return MEMORY[0x1F410AA60](this);
}

uint64_t ApplePDPHelperInterface::enableMetadataTrailer(ApplePDPHelperInterface *this, uint64_t a2, BOOL *a3)
{
  return MEMORY[0x1F410AA68](this, a2, a3);
}

uint64_t ApplePDPHelperInterface::enableLowPowerPDPThrottle(ApplePDPHelperInterface *this)
{
  return MEMORY[0x1F410AA70](this);
}

uint64_t ApplePDPHelperInterface::activateLowPowerPDPThrottle(ApplePDPHelperInterface *this)
{
  return MEMORY[0x1F410AA78](this);
}

uint64_t ApplePDPHelperInterface::getNumLowPowerPDPThrottleStats()
{
  return MEMORY[0x1F410AA80]();
}

uint64_t abm::HelperClient::registerForHelperReady()
{
  return MEMORY[0x1F4104E68]();
}

uint64_t abm::HelperClient::create()
{
  return MEMORY[0x1F4104E70]();
}

uint64_t abm::HelperClient::perform()
{
  return MEMORY[0x1F4104E78]();
}

{
  return MEMORY[0x1F4104E80]();
}

uint64_t abm::AccessoryInfo::create()
{
  return MEMORY[0x1F41099B0]();
}

uint64_t abm::AccessorySimulate::create()
{
  return MEMORY[0x1F41099B8]();
}

uint64_t abm::AccessorySimulate::create(abm::AccessorySimulate *this)
{
  return MEMORY[0x1F41099C0](this);
}

uint64_t abm::AccessorySimulate::toDict(abm::AccessorySimulate *this)
{
  return MEMORY[0x1F41099C8](this);
}

uint64_t abm::trace::isSupported()
{
  return MEMORY[0x1F410C7B0]();
}

uint64_t abm::client::Command::create()
{
  return MEMORY[0x1F4109A20]();
}

uint64_t abm::helper::asEnum(abm::helper *this, const char *a2)
{
  return MEMORY[0x1F4104E88](this, a2);
}

uint64_t abm::helper::asString()
{
  return MEMORY[0x1F4104E90]();
}

{
  return MEMORY[0x1F4104E98]();
}

{
  return MEMORY[0x1F4104EA0]();
}

{
  return MEMORY[0x1F4104EA8]();
}

uint64_t abm::asString()
{
  return MEMORY[0x1F4109A38]();
}

{
  return MEMORY[0x1F4109A40]();
}

{
  return MEMORY[0x1F4109A48]();
}

{
  return MEMORY[0x1F4109A50]();
}

{
  return MEMORY[0x1F4109A58]();
}

{
  return MEMORY[0x1F4109A60]();
}

{
  return MEMORY[0x1F4109A68]();
}

{
  return MEMORY[0x1F4109A70]();
}

{
  return MEMORY[0x1F4109A78]();
}

{
  return MEMORY[0x1F4109A80]();
}

uint64_t awd::AppContext::setHandler()
{
  return MEMORY[0x1F417A008]();
}

{
  return MEMORY[0x1F417A010]();
}

{
  return MEMORY[0x1F417A018]();
}

uint64_t awd::AppContext::setProperties()
{
  return MEMORY[0x1F417A020]();
}

uint64_t awd::AwdCommandDriver::checkIn()
{
  return MEMORY[0x1F417A028]();
}

uint64_t awd::asString()
{
  return MEMORY[0x1F417A040]();
}

{
  return MEMORY[0x1F417A050]();
}

uint64_t ctu::LogMessage::LogMessage()
{
  return MEMORY[0x1F417D950]();
}

uint64_t ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase()
{
  return MEMORY[0x1F417D958]();
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const char *a2, const char *a3)
{
  return MEMORY[0x1F417D968](this, a2, a3);
}

uint64_t ctu::OsLogLogger::OsLogLogger()
{
  return MEMORY[0x1F417D970]();
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const ctu::OsLogLogger *a2)
{
  return MEMORY[0x1F417D978](this, a2);
}

void ctu::OsLogLogger::~OsLogLogger(ctu::OsLogLogger *this)
{
}

uint64_t ctu::OsLogContext::OsLogContext()
{
  return MEMORY[0x1F417D988]();
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x1F417D990](this, a2, a3);
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const ctu::OsLogContext *a2)
{
  return MEMORY[0x1F417D998](this, a2);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
}

uint64_t ctu::OsLogContext::operator=()
{
  return MEMORY[0x1F417D9A8]();
}

uint64_t ctu::StaticLogger::StaticLogger()
{
  return MEMORY[0x1F417D9B0]();
}

uint64_t ctu::StaticLogger::StaticLogger(ctu::StaticLogger *this)
{
  return MEMORY[0x1F417D9B8](this);
}

void ctu::StaticLogger::~StaticLogger(ctu::StaticLogger *this)
{
}

uint64_t ctu::TrackedLogger::registerLoggerToServer()
{
  return MEMORY[0x1F417D9C8]();
}

uint64_t ctu::split_any_copy()
{
  return MEMORY[0x1F417D9D8]();
}

uint64_t ctu::LogMessageBuffer::takeString(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x1F417DA10](this);
}

uint64_t ctu::LogMessageBuffer::takeMetadata(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x1F417DA18](this);
}

uint64_t ctu::LogMessageBuffer::vprintf(ctu::LogMessageBuffer *this, const char *a2, char *a3)
{
  return MEMORY[0x1F417DA28](this, a2, a3);
}

uint64_t ctu::LogMessageBuffer::LogMessageBuffer(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x1F417DA30](this);
}

void ctu::LogMessageBuffer::~LogMessageBuffer(ctu::LogMessageBuffer *this)
{
}

uint64_t ctu::LoggerCommonBase::setLogLevel()
{
  return MEMORY[0x1F417DA48]();
}

uint64_t ctu::LoggerCommonBase::LoggerCommonBase()
{
  return MEMORY[0x1F417DA58]();
}

{
  return MEMORY[0x1F417DA60]();
}

uint64_t ctu::LoggerCommonBase::operator=()
{
  return MEMORY[0x1F417DA68]();
}

uint64_t ctu::XpcJetsamAssertion::createActivity()
{
  return MEMORY[0x1F417DA78]();
}

uint64_t ctu::XpcJetsamAssertion::create_default_global(ctu::XpcJetsamAssertion *this)
{
  return MEMORY[0x1F417DA80](this);
}

uint64_t ctu::DispatchTimerService::create()
{
  return MEMORY[0x1F417DA88]();
}

uint64_t ctu::cf::MakeCFString::MakeCFString(ctu::cf::MakeCFString *this, const char *a2)
{
  return MEMORY[0x1F417DA90](this, a2);
}

void ctu::cf::MakeCFString::~MakeCFString(ctu::cf::MakeCFString *this)
{
}

uint64_t ctu::cf::convert_copy(ctu::cf *this, const __CFString **a2, const char *a3, uint64_t a4, const __CFAllocator *a5)
{
  return MEMORY[0x1F417DAA0](this, a2, a3, a4, a5);
}

uint64_t ctu::cf::convert_copy()
{
  return MEMORY[0x1F417DAA8]();
}

uint64_t ctu::cf::dict_adapter::dict_adapter(ctu::cf::dict_adapter *this, const __CFDictionary *a2)
{
  return MEMORY[0x1F417DAB8](this, a2);
}

uint64_t ctu::cf::dict_adapter::dict_adapter(ctu::cf::dict_adapter *this, const ctu::cf::dict_adapter *a2)
{
  return MEMORY[0x1F417DAC0](this, a2);
}

void ctu::cf::dict_adapter::~dict_adapter(ctu::cf::dict_adapter *this)
{
}

uint64_t ctu::cf::plist_adapter::plist_adapter(ctu::cf::plist_adapter *this, const __CFString *a2, const __CFString *a3)
{
  return MEMORY[0x1F417DAD0](this, a2, a3);
}

void ctu::cf::plist_adapter::~plist_adapter(ctu::cf::plist_adapter *this)
{
}

uint64_t ctu::cf::show(ctu::cf *this, const void *a2)
{
  return MEMORY[0x1F417DAE0](this, a2);
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x1F417DAE8]();
}

{
  return MEMORY[0x1F417DAF0]();
}

{
  return MEMORY[0x1F417DAF8]();
}

uint64_t ctu::cf::assign(ctu::cf *this, signed __int8 *a2, const __CFNumber *a3)
{
  return MEMORY[0x1F417DB08](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, BOOL *a2, const __CFBoolean *a3)
{
  return MEMORY[0x1F417DB10](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, int *a2, const __CFNumber *a3)
{
  return MEMORY[0x1F417DB28](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, unsigned int *a2, const __CFNumber *a3)
{
  return MEMORY[0x1F417DB30](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, uint64_t *a2, const __CFNumber *a3)
{
  return MEMORY[0x1F417DB38](this, a2, a3);
}

{
  return MEMORY[0x1F417DB50](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, unsigned __int16 *a2, const __CFNumber *a3)
{
  return MEMORY[0x1F417DB48](this, a2, a3);
}

uint64_t ctu::fs::remove_dir()
{
  return MEMORY[0x1F417DB58]();
}

uint64_t ctu::fs::file_exists()
{
  return MEMORY[0x1F417DB60]();
}

uint64_t ctu::fs::is_directory()
{
  return MEMORY[0x1F417DB70]();
}

uint64_t ctu::fs::get_file_size()
{
  return MEMORY[0x1F417DB78]();
}

uint64_t ctu::fs::create_directory()
{
  return MEMORY[0x1F417DB80]();
}

uint64_t ctu::fs::get_filtered_files()
{
  return MEMORY[0x1F417DB88]();
}

uint64_t ctu::fs::get_unique_filename()
{
  return MEMORY[0x1F417DB90]();
}

uint64_t ctu::fs::rename()
{
  return MEMORY[0x1F417DBA8]();
}

uint64_t ctu::Clock::now_in_nanoseconds(ctu::Clock *this)
{
  return MEMORY[0x1F417DBD8](this);
}

uint64_t ctu::iokit::Controller::setMesaQuality()
{
  return MEMORY[0x1F417D780]();
}

uint64_t ctu::iokit::Controller::setMesaCallback()
{
  return MEMORY[0x1F417D788]();
}

uint64_t ctu::iokit::Controller::queryPowerSource(ctu::iokit::Controller *this)
{
  return MEMORY[0x1F417D790](this);
}

uint64_t ctu::iokit::Controller::setFaceIDCallback()
{
  return MEMORY[0x1F417D798]();
}

uint64_t ctu::iokit::Controller::acquireMesaService(ctu::iokit::Controller *this)
{
  return MEMORY[0x1F417D7A0](this);
}

uint64_t ctu::iokit::Controller::setDisplayCallback()
{
  return MEMORY[0x1F417D7A8]();
}

uint64_t ctu::iokit::Controller::setupCameraService(ctu::iokit::Controller *this)
{
  return MEMORY[0x1F417D7B0](this);
}

uint64_t ctu::iokit::Controller::setAccessoryCallback()
{
  return MEMORY[0x1F417D7B8]();
}

uint64_t ctu::iokit::Controller::setFrontCameraCallback()
{
  return MEMORY[0x1F417D7C0]();
}

uint64_t ctu::iokit::Controller::setPowerSourceCallback()
{
  return MEMORY[0x1F417D7C8]();
}

uint64_t ctu::iokit::Controller::registerForBatteryInfoChange()
{
  return MEMORY[0x1F417D7D0]();
}

uint64_t ctu::iokit::Controller::stopBatteryInfoNotifications(ctu::iokit::Controller *this)
{
  return MEMORY[0x1F417D7D8](this);
}

uint64_t ctu::iokit::Controller::stopPowerSourceNotifications(ctu::iokit::Controller *this)
{
  return MEMORY[0x1F417D7E0](this);
}

uint64_t ctu::iokit::Controller::getAccessoryPrimaryPortNumber(ctu::iokit::Controller *this)
{
  return MEMORY[0x1F417D7E8](this);
}

uint64_t ctu::iokit::Controller::stopDisplayCoverStateNotifications(ctu::iokit::Controller *this)
{
  return MEMORY[0x1F417D7F0](this);
}

uint64_t ctu::iokit::Controller::registerForDisplayCoverStateChanged()
{
  return MEMORY[0x1F417D7F8]();
}

uint64_t ctu::iokit::Controller::create()
{
  return MEMORY[0x1F417D800]();
}

uint64_t ctu::iokit::IOHIDController::isProxCovered(ctu::iokit::IOHIDController *this)
{
  return MEMORY[0x1F417D808](this);
}

uint64_t ctu::iokit::IOHIDController::queryHIDEventTrigger(ctu::iokit::IOHIDController *this)
{
  return MEMORY[0x1F417D810](this);
}

uint64_t ctu::iokit::IOHIDController::registerProxCallback()
{
  return MEMORY[0x1F417D818]();
}

uint64_t ctu::iokit::IOHIDController::registerKeyboardCallback()
{
  return MEMORY[0x1F417D820]();
}

uint64_t ctu::iokit::IOHIDController::stop(ctu::iokit::IOHIDController *this)
{
  return MEMORY[0x1F417D828](this);
}

uint64_t ctu::iokit::IOHIDController::start(ctu::iokit::IOHIDController *this)
{
  return MEMORY[0x1F417D830](this);
}

uint64_t ctu::iokit::IOHIDController::create()
{
  return MEMORY[0x1F417D838]();
}

uint64_t ctu::iokit::IOPortUSBCController::registerCallback()
{
  return MEMORY[0x1F417D840]();
}

uint64_t ctu::iokit::IOPortUSBCController::create(ctu::iokit::IOPortUSBCController *this, queue a2, const char *a3, const char *a4)
{
  return MEMORY[0x1F417D848](this, a2.fObj.fObj, a3, a4);
}

uint64_t ctu::iokit::IOPortUSBCController::asString()
{
  return MEMORY[0x1F417D850]();
}

uint64_t ctu::iokit::asString()
{
  return MEMORY[0x1F417D858]();
}

{
  return MEMORY[0x1F417D860]();
}

{
  return MEMORY[0x1F417D868]();
}

{
  return MEMORY[0x1F417D870]();
}

uint64_t ctu::iokit::operator&()
{
  return MEMORY[0x1F417D878]();
}

uint64_t ctu::power::manager::registerListener()
{
  return MEMORY[0x1F417D880]();
}

uint64_t ctu::power::manager::get(ctu::power::manager *this)
{
  return MEMORY[0x1F417D888](this);
}

uint64_t ctu::power::manager::asCString(ctu::power::manager *this)
{
  return MEMORY[0x1F417D890](this);
}

uint64_t ctu::power::assertion::createInternal()
{
  return MEMORY[0x1F417D898]();
}

uint64_t ctu::power::assertion::assertion(ctu::power::assertion *this)
{
  return MEMORY[0x1F417D8A0](this);
}

uint64_t ctu::asChar()
{
  return MEMORY[0x1F417DBE0]();
}

uint64_t ctu::assign()
{
  return MEMORY[0x1F417DBE8]();
}

uint64_t ctu::Gestalt::create_default_global(ctu::Gestalt *this)
{
  return MEMORY[0x1F417DBF0](this);
}

uint64_t ctu::tokenize()
{
  return MEMORY[0x1F417DBF8]();
}

uint64_t ctu::LogServer::setEnabled(ctu::LogServer *this)
{
  return MEMORY[0x1F417DC00](this);
}

uint64_t ctu::LogServer::updateConfig()
{
  return MEMORY[0x1F417DC08]();
}

uint64_t ctu::LogServer::log()
{
  return MEMORY[0x1F417DC10]();
}

uint64_t ctu::LogServer::start(ctu::LogServer *this)
{
  return MEMORY[0x1F417DC18](this);
}

uint64_t ctu::LogServer::create()
{
  return MEMORY[0x1F417DC20]();
}

uint64_t ctu::LogServer::addWriter()
{
  return MEMORY[0x1F417DC28]();
}

uint64_t ctu::XpcClient::setServer_sync()
{
  return MEMORY[0x1F417DC30]();
}

uint64_t ctu::XpcClient::XpcClient()
{
  return MEMORY[0x1F417DC38]();
}

void ctu::XpcClient::~XpcClient(ctu::XpcClient *this)
{
}

uint64_t ctu::XpcServer::setListener_sync()
{
  return MEMORY[0x1F417DC50]();
}

uint64_t ctu::XpcServer::startListener_sync(ctu::XpcServer *this)
{
  return MEMORY[0x1F417DC58](this);
}

uint64_t ctu::XpcServer::XpcServer()
{
  return MEMORY[0x1F417DC60]();
}

void ctu::XpcServer::~XpcServer(ctu::XpcServer *this)
{
}

uint64_t ctu::cf_to_xpc(ctu *this, const void *a2)
{
  return MEMORY[0x1F417DC70](this, a2);
}

uint64_t ctu::xpc_to_cf(ctu *this, void *a2)
{
  return MEMORY[0x1F417DC78](this, a2);
}

uint64_t ctu::operator<<()
{
  return MEMORY[0x1F417DC80]();
}

{
  return MEMORY[0x1F417DC88]();
}

{
  return MEMORY[0x1F417DC90]();
}

{
  return MEMORY[0x1F417DC98]();
}

uint64_t pci::event::Listener::create()
{
  return MEMORY[0x1F417CF28]();
}

uint64_t qmi::MessageBase::setParsingErrorHandler(qmi::MessageBase *this, BOOL (*a2)(unsigned __int16, unsigned __int16, const unsigned __int8 *, unint64_t))
{
  return MEMORY[0x1F417CF60](this, a2);
}

uint64_t qmi::asShortString()
{
  return MEMORY[0x1F417CFA0]();
}

uint64_t qmi::QMuxServerAccepter::setValidationStrategy()
{
  return MEMORY[0x1F4178620]();
}

uint64_t qmi::QMuxServerAccepter::QMuxServerAccepter()
{
  return MEMORY[0x1F4178628]();
}

uint64_t qmi::parse()
{
  return MEMORY[0x1F417CFF0]();
}

uint64_t qmi::asString()
{
  return MEMORY[0x1F417CFF8]();
}

uint64_t sar::toStringAccessory(sar *this)
{
  return MEMORY[0x1F410AAD0](this);
}

uint64_t sar::toString()
{
  return MEMORY[0x1F410AAD8]();
}

{
  return MEMORY[0x1F410AAE0]();
}

uint64_t wis::MetricFactory::getSharedMetricFactory(wis::MetricFactory *this)
{
  return MEMORY[0x1F4176C78](this);
}

uint64_t wis::MetricFactory::newMetricContainerWithIdentifier(wis::MetricFactory *this)
{
  return MEMORY[0x1F4176C80](this);
}

uint64_t wis::MetricContainer::storeMetric(wis::MetricContainer *this, uint64_t a2, uint64_t a3, const wireless_diagnostics::google::protobuf::MessageLite *a4)
{
  return MEMORY[0x1F4176C88](this, a2, a3, a4);
}

void wis::MetricContainer::~MetricContainer(wis::MetricContainer *this)
{
}

uint64_t wis::getWISTimestamp(wis *this)
{
  return MEMORY[0x1F4176C98](this);
}

uint64_t wis::WISServerConnection::SubmitMetric(wis::WISServerConnection *this, wis::MetricContainer *a2)
{
  return MEMORY[0x1F4176CA0](this, a2);
}

uint64_t wis::WISServerConnection::RegisterCallbackForTimer()
{
  return MEMORY[0x1F4176CA8]();
}

uint64_t wis::WISServerConnection::RegisterQueriableMetricCallbackForIdentifier()
{
  return MEMORY[0x1F4176CB0]();
}

uint64_t wis::WISServerConnection::WISServerConnection(wis::WISServerConnection *this)
{
  return MEMORY[0x1F4176CB8](this);
}

void wis::WISServerConnection::~WISServerConnection(wis::WISServerConnection *this)
{
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, const char *a3)
{
  return MEMORY[0x1F417DCA8](this, a2, a3);
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x1F417DCB0]();
}

{
  return MEMORY[0x1F417DCB8]();
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2)
{
  return MEMORY[0x1F417DCC0](this, a2);
}

{
  return MEMORY[0x1F417DCD0](this, a2);
}

{
  return MEMORY[0x1F417DCD8](this, a2);
}

{
  return MEMORY[0x1F417DCE0](this, a2);
}

{
  return MEMORY[0x1F417DCE8](this, a2);
}

{
  return MEMORY[0x1F417DCF0](this, a2);
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, double a3)
{
  return MEMORY[0x1F417DCC8](this, a2, a3);
}

uint64_t xpc::bridge(xpc *this, const object *a2)
{
  return MEMORY[0x1F417DCF8](this, a2);
}

uint64_t QMux::invokeReset()
{
  return MEMORY[0x1F4178668]();
}

uint64_t QMux::enterPowerMode()
{
  return MEMORY[0x1F4178670]();
}

uint64_t QMux::setDriverAndCookie()
{
  return MEMORY[0x1F4178678]();
}

uint64_t QMux::getQMIPowerDownMessages(QMux *this)
{
  return MEMORY[0x1F4178680](this);
}

uint64_t QMux::stop(QMux *this)
{
  return MEMORY[0x1F4178688](this);
}

uint64_t QMux::start(QMux *this)
{
  return MEMORY[0x1F4178690](this);
}

uint64_t QMux::shutdown(QMux *this)
{
  return MEMORY[0x1F4178698](this);
}

uint64_t QMux::QMux()
{
  return MEMORY[0x1F41786A0]();
}

void QMux::QMux(QMux *this)
{
}

void QMux::~QMux(QMux *this)
{
}

uint64_t util::writeJSON()
{
  return MEMORY[0x1F410C7D8]();
}

uint64_t radio::asStringV2()
{
  return MEMORY[0x1F417A088]();
}

uint64_t radio::CommandDriver::watchClientState()
{
  return MEMORY[0x1F417A090]();
}

uint64_t radio::CommandDriver::watchOperatingMode()
{
  return MEMORY[0x1F417A098]();
}

uint64_t radio::RFCalibration_t::fill()
{
  return MEMORY[0x1F417A0B8]();
}

uint64_t radio::RFCalibration_t::toString(radio::RFCalibration_t *this)
{
  return MEMORY[0x1F417A0C0](this);
}

uint64_t radio::RFCalibration_t::RFCalibration_t(radio::RFCalibration_t *this)
{
  return MEMORY[0x1F417A0C8](this);
}

uint64_t radio::BasebandProperties::create()
{
  return MEMORY[0x1F417A0E0]();
}

uint64_t radio::HealthCommandDriver::LinkStats::LinkStats(radio::HealthCommandDriver::LinkStats *this)
{
  return MEMORY[0x1F417A0F8](this);
}

uint64_t radio::asString()
{
  return MEMORY[0x1F417A118]();
}

{
  return MEMORY[0x1F417A120]();
}

uint64_t trace::toString()
{
  return MEMORY[0x1F410C7E0]();
}

void Factory::Factory(Factory *this)
{
}

void Factory::~Factory(Factory *this)
{
}

uint64_t antenna::CommandDriver::registerHandler()
{
  return MEMORY[0x1F417A128]();
}

void antenna::AntennaCommandDriverDelegateInterface::~AntennaCommandDriverDelegateInterface(antenna::AntennaCommandDriverDelegateInterface *this)
{
}

uint64_t Registry::getServerConnection(Registry *this)
{
  return MEMORY[0x1F417A248](this);
}

void Registry::Registry(Registry *this)
{
}

uint64_t mav_router_t::get_channel_for_service()
{
  return MEMORY[0x1F4180A18]();
}

uint64_t abm::client::Event::name(abm::client::Event *this)
{
  return MEMORY[0x1F4109A88](this);
}

uint64_t abm::client::Event::getData(abm::client::Event *this)
{
  return MEMORY[0x1F4109A90](this);
}

uint64_t awd::AppContext::getProperties(awd::AppContext *this)
{
  return MEMORY[0x1F417A158](this);
}

uint64_t awd::AppContext::getAppID(awd::AppContext *this)
{
  return MEMORY[0x1F417A160](this);
}

uint64_t ctu::LoggerCommonBase::getLogDomain(ctu::LoggerCommonBase *this)
{
  return MEMORY[0x1F417DD08](this);
}

uint64_t ctu::cf::map_adapter::copyCFDataRef(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x1F417DD18](this, a2);
}

uint64_t ctu::cf::map_adapter::copyCFArrayRef(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x1F417DD20](this, a2);
}

uint64_t ctu::cf::map_adapter::copyCFNumberRef(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x1F417DD28](this, a2);
}

uint64_t ctu::cf::map_adapter::copyCFDictionaryRef(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x1F417DD30](this, a2);
}

uint64_t ctu::cf::map_adapter::getInt(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x1F417DD38](this, a2);
}

uint64_t ctu::cf::map_adapter::getBool(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x1F417DD40](this, a2);
}

uint64_t ctu::cf::map_adapter::getDouble(ctu::cf::map_adapter *this, const __CFString *a2, double a3)
{
  return MEMORY[0x1F417DD48](this, a2, a3);
}

uint64_t ctu::cf::map_adapter::getString()
{
  return MEMORY[0x1F417DD50]();
}

uint64_t ctu::LogServer::getConfig(ctu::LogServer *this)
{
  return MEMORY[0x1F417DD68](this);
}

uint64_t ctu::XpcServer::getListener_sync(ctu::XpcServer *this)
{
  return MEMORY[0x1F417DD70](this);
}

uint64_t xpc::object::to_string(xpc::object *this)
{
  return MEMORY[0x1F417DD78](this);
}

uint64_t QMux::isPoweredDown(QMux *this)
{
  return MEMORY[0x1F4178748](this);
}

uint64_t QMux::getName(QMux *this)
{
  return MEMORY[0x1F4178750](this);
}

uint64_t QMux::dumpState(QMux *this)
{
  return MEMORY[0x1F4178758](this);
}

uint64_t QMux::isRunning(QMux *this)
{
  return MEMORY[0x1F4178760](this);
}

uint64_t Registry::getRegistryModel(Registry *this)
{
  return MEMORY[0x1F417A258](this);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1F417E390](this, __s);
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x1F417E400](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E458](this, a2);
}

void std::length_error::~length_error(std::length_error *this)
{
}

{
  MEMORY[0x1F417E488](this);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1F417E4D0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4E0](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x1F417E550](this, *(void *)&__ecode);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1F417E5D0](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1F417E728]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x1F417E730]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1F417E740]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1F417E748]();
}

uint64_t std::istream::peek()
{
  return MEMORY[0x1F417E760]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x1F417E768]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x1F417E780]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x1F417E788]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1F417E7A0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1F417E7C0]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1F417E830]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1F417E838]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x1F417E840]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E878]();
}

{
  return MEMORY[0x1F417E880]();
}

{
  return MEMORY[0x1F417E898]();
}

{
  return MEMORY[0x1F417E8A0]();
}

{
  return MEMORY[0x1F417E8A8]();
}

{
  return MEMORY[0x1F417E8B0]();
}

{
  return MEMORY[0x1F417E8C8]();
}

{
  return MEMORY[0x1F417E8D0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1F417E940]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x1F417E960](__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1F417EA90](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x1F417EAA8](retstr, __s);
}

uint64_t std::stol(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x1F417EBE8](__str, __idx, *(void *)&__base);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

unint64_t std::stoul(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x1F417EC20](__str, __idx, *(void *)&__base);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x1F417ECE0](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x1F417ECE8](this);
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1F417EE70](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x1F417EE78](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE88](retstr, __val);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1F40C9B60](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9D00](*(void *)&a1);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x1F41138D8]();
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CB3A8](a1, *(void *)&a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

double difftime(time_t a1, time_t a2)
{
  MEMORY[0x1F40CB8F8](a1, a2);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
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

void dispatch_group_notify_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA0](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
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

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD50](label);
}

uint64_t dispatch_workloop_is_current()
{
  return MEMORY[0x1F40CBD60]();
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1F40CC028](*(void *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC0D8](*(void *)&a1, a2, a3, *(void *)&a4);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1F40CC290](a1, a2, *(void *)&a3);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1F40CC2E0](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1F40CC410](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1F40CC4D8](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1F40CC678](*(void *)&a1, a2, a3, *(void *)&a4);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC870](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

uint64_t mav_router_channel_get_name_as_cstr()
{
  return MEMORY[0x1F4180A20]();
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x1F40CCE30](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CD120](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1F40CD578]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1F40CD930](a1);
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x1F40CD938](__attr, *(void *)&__qos_class, *(void *)&__relative_priority);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1F40CDA38](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x1F40CDB48](*(void *)&__qos_class, *(void *)&__relative_priority);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1F40CDB60](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1F40CDC60](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1F40CDD10](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

void rewind(FILE *a1)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0A0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

int statvfs(const char *a1, statvfs *a2)
{
  return MEMORY[0x1F40CE120](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1F40CE198](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1F40CE1D8](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x1F40CE220](a1, a2, a3);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE360](a1, a2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1F40CEB10](value);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1F40CEBE8]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC20](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1F40CED38]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1F40CEEE0](xdict);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1F40CEFE8](value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1F40CF040](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF188](value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1F40CF208]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF320](value);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1F40CF368](xuuid);
}