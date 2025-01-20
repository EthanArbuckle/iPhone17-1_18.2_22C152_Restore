CTGreenTeaLoggerImpl **getCTGreenTeaOsLogHandle(CTGreenTeaLoggerImpl **result)
{
  if (result) {
    return (CTGreenTeaLoggerImpl **)CTGreenTeaLoggerImpl::getLogHandle(*result);
  }
  return result;
}

void __ct_green_tea_logger_create_static_block_invoke()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ33ct_green_tea_logger_create_staticEUb_E14neverDestroyed, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZ33ct_green_tea_logger_create_staticEUb_E14neverDestroyed))
  {
    operator new();
  }
  ct_green_tea_logger_create_static::fLogServer = _ZZZ33ct_green_tea_logger_create_staticEUb_E14neverDestroyed;
}

void sub_21077AFA0(_Unwind_Exception *a1)
{
}

void *___Z21getGreenTeaLogUtilityv_block_invoke()
{
  result = operator new(0x20uLL);
  result[1] = 0;
  result[2] = 0;
  void *result = &unk_26C2A1610;
  result[3] = &unk_26C2A15E8;
  getGreenTeaLogUtility(void)::greenTeaLogUtility = (uint64_t)(result + 3);
  *(void *)algn_26AA46658 = result;
  return result;
}

const char *ct_green_tea_logger_create_static(const char *result)
{
  if (result)
  {
    v1 = result;
    {
      ct_green_tea_logger_create_static::fLogServer = 0;
    }
    if (ct_green_tea_logger_create_static::onceToken != -1) {
      dispatch_once(&ct_green_tea_logger_create_static::onceToken, &__block_literal_global_0);
    }
    v2 = (CTGreenTeaLogServer *)ct_green_tea_logger_create_static::fLogServer;
    return (const char *)CTGreenTeaLogServer::getLogger(v2, v1);
  }
  return result;
}

void ___ZN12_GLOBAL__N_116isCarrierInstallEv_block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    int v2 = CFEqual(v0, @"Carrier");
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      v3[0] = 67109120;
      v3[1] = v2 != 0;
      _os_log_impl(&dword_21077A000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Carrier install: %d", (uint8_t *)v3, 8u);
    }
    CFRelease(v1);
  }
}

void ___ZN12_GLOBAL__N_117isInternalInstallEv_block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    int v2 = CFEqual(v0, @"Internal");
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      v3[0] = 67109120;
      v3[1] = v2 != 0;
      _os_log_impl(&dword_21077A000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Internal install: %d", (uint8_t *)v3, 8u);
    }
    CFRelease(v1);
  }
}

uint64_t CTGreenTeaLogServer::getLogger(CTGreenTeaLogServer *this, const char *a2)
{
  v12 = a2;
  std::mutex::lock((std::mutex *)this);
  uint64_t v4 = (void *)*((void *)this + 9);
  if (!v4) {
    goto LABEL_12;
  }
  v5 = (void *)((char *)this + 72);
  do
  {
    unint64_t v6 = v4[4];
    BOOL v7 = v6 >= (unint64_t)a2;
    if (v6 >= (unint64_t)a2) {
      v8 = v4;
    }
    else {
      v8 = v4 + 1;
    }
    if (v7) {
      v5 = v4;
    }
    uint64_t v4 = (void *)*v8;
  }
  while (*v8);
  if (v5 != (void *)((char *)this + 72) && v5[4] <= (unint64_t)a2)
  {
    uint64_t v9 = v5[5];
  }
  else
  {
LABEL_12:
    uint64_t GreenTeaLogger = createGreenTeaLogger(a2);
    if (GreenTeaLogger)
    {
      std::__tree<std::__value_type<char const*,ct_green_tea_logger_s *>,std::__map_value_compare<char const*,std::__value_type<char const*,ct_green_tea_logger_s *>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ct_green_tea_logger_s *>>>::__emplace_unique_key_args<char const*,char const*&,ct_green_tea_logger_s *&>((uint64_t **)this + 8, (unint64_t *)&v12, (uint64_t *)&v12, &GreenTeaLogger);
      uint64_t v9 = GreenTeaLogger;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  std::mutex::unlock((std::mutex *)this);
  return v9;
}

void sub_21077B348(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

BOOL ct_green_tea_logging_enabled()
{
  uint64_t GreenTeaLogger = (CTGreenTeaLoggerImpl **)createGreenTeaLogger((const char *)&unk_21077BE7D);
  if (!GreenTeaLogger) {
    return 0;
  }
  uint64_t v1 = (uint64_t)GreenTeaLogger;
  LogHandle = CTGreenTeaLoggerImpl::getLogHandle(*GreenTeaLogger);
  if (LogHandle) {
    BOOL v3 = os_log_type_enabled(LogHandle, OS_LOG_TYPE_INFO);
  }
  else {
    BOOL v3 = 0;
  }
  ct_green_tea_logger_destroy(v1);
  return v3;
}

uint64_t CTGreenTeaLoggerImpl::getLogHandle(CTGreenTeaLoggerImpl *this)
{
  return *(void *)this;
}

uint64_t ct_green_tea_logger_destroy(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(std::__shared_weak_count **)(result + 8);
    if (v1) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v1);
    }
    JUMPOUT(0x216671440);
  }
  return result;
}

uint64_t createGreenTeaLogger(const char *a1)
{
  getGreenTeaLogUtility(&v3);
  int v1 = (**v3)(v3);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  if (v1) {
    operator new();
  }
  return 0;
}

void sub_21077B4BC(_Unwind_Exception *a1)
{
  MEMORY[0x216671440](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

BOOL GreenTeaLogUtility::canCreateLogHandle(GreenTeaLogUtility *this)
{
    return 1;
}

void ct_green_tea_logger_s::ct_green_tea_logger_s(ct_green_tea_logger_s *this, const char *a2)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  uint64_t v4 = operator new(0x20uLL);
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = 0;
  *uint64_t v4 = &unk_26C2A1648;
  v4[3] = os_log_create("com.apple.greentea", a2);
  v5 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v4 + 3;
  *((void *)this + 1) = v4;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

void getGreenTeaLogUtility(void *a1@<X8>)
{
  {
    getGreenTeaLogUtility(void)::greenTeaLogUtility = 0;
    *(void *)algn_26AA46658 = 0;
  }
  unint64_t v2 = 0x26AA46000uLL;
  {
    unint64_t v2 = 0x26AA46000uLL;
    if (v4)
    {
      getGreenTeaLogUtility(void)::onceToken = 0;
      unint64_t v2 = 0x26AA46000;
    }
  }
  if (*(void *)(v2 + 1632) != -1) {
    dispatch_once(&getGreenTeaLogUtility(void)::onceToken, &__block_literal_global_1);
  }
  uint64_t v3 = *(void *)algn_26AA46658;
  *a1 = getGreenTeaLogUtility(void)::greenTeaLogUtility;
  a1[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
}

void std::__shared_ptr_emplace<CTGreenTeaLoggerImpl>::__on_zero_shared(uint64_t a1)
{
}

void CTGreenTeaLoggerImpl::~CTGreenTeaLoggerImpl(void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    os_release(v1);
  }
}

uint64_t *std::__tree<std::__value_type<char const*,ct_green_tea_logger_s *>,std::__map_value_compare<char const*,std::__value_type<char const*,ct_green_tea_logger_s *>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ct_green_tea_logger_s *>>>::__emplace_unique_key_args<char const*,char const*&,ct_green_tea_logger_s *&>(uint64_t **a1, unint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  v8 = a1 + 1;
  BOOL v7 = a1[1];
  if (v7)
  {
    unint64_t v9 = *a2;
    while (1)
    {
      while (1)
      {
        v10 = (uint64_t **)v7;
        unint64_t v11 = v7[4];
        if (v9 >= v11) {
          break;
        }
        BOOL v7 = *v10;
        v8 = v10;
        if (!*v10) {
          goto LABEL_10;
        }
      }
      if (v11 >= v9) {
        break;
      }
      BOOL v7 = v10[1];
      if (!v7)
      {
        v8 = v10 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v10 = a1 + 1;
LABEL_10:
    v12 = (uint64_t *)operator new(0x30uLL);
    uint64_t v13 = *a4;
    v12[4] = *a3;
    v12[5] = v13;
    std::__tree<std::__value_type<char const*,ct_green_tea_logger_s *>,std::__map_value_compare<char const*,std::__value_type<char const*,ct_green_tea_logger_s *>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ct_green_tea_logger_s *>>>::__insert_node_at(a1, (uint64_t)v10, v8, v12);
    return v12;
  }
  return (uint64_t *)v10;
}

uint64_t *std::__tree<std::__value_type<char const*,ct_green_tea_logger_s *>,std::__map_value_compare<char const*,std::__value_type<char const*,ct_green_tea_logger_s *>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,ct_green_tea_logger_s *>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
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
      unint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            unint64_t v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *unint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            unint64_t v2 = (uint64_t *)*v3;
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
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
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
        unint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        _DWORD v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

const char *ct_green_tea_logger_create(const char *result)
{
  if (result) {
    return (const char *)createGreenTeaLogger(result);
  }
  return result;
}

void GreenTeaLogUtility::~GreenTeaLogUtility(GreenTeaLogUtility *this)
{
  GreenTeaLogUtilityInterface::~GreenTeaLogUtilityInterface(this);

  JUMPOUT(0x216671440);
}

void __clang_call_terminate(void *a1)
{
}

void std::__shared_ptr_emplace<GreenTeaLogUtility>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2A1610;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<GreenTeaLogUtility>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2A1610;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x216671440);
}

uint64_t std::__shared_ptr_emplace<GreenTeaLogUtility>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 8))();
}

void std::__shared_ptr_emplace<CTGreenTeaLoggerImpl>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2A1648;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<CTGreenTeaLoggerImpl>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C2A1648;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x216671440);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F90]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::terminate(void)
{
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

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}