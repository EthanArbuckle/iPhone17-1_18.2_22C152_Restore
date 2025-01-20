void sub_21DF814F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, char a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,char a25,int a26,__int16 a27,char a28,char a29,int a30,__int16 a31,char a32,char a33,int a34,__int16 a35,char a36,char a37,uint64_t a38,uint64_t a39,void *__p,uint64_t a41,int a42,__int16 a43,char a44,char a45)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Run(void *a1, uint64_t a2, const void **a3)
{
  pthread_mutex_lock(&ctu::Singleton<eUICC::detail::StateMachine,eUICC::detail::StateMachine,ctu::PthreadMutexGuardPolicy<eUICC::detail::StateMachine>>::sInstance);
  if (!qword_267D23A08)
  {
    v7 = (int *)operator new(4uLL);
    int *v7 = 0;
    v6 = operator new(0x20uLL);
    void *v6 = &unk_26CECF0F0;
    v6[1] = 0;
    v6[2] = 0;
    v6[3] = v7;
    v8 = (std::__shared_weak_count *)off_267D23A10;
    qword_267D23A08 = (uint64_t)v7;
    off_267D23A10 = v6;
    if (!v8)
    {
      uint64_t v14 = (uint64_t)v7;
      v15 = (std::__shared_weak_count *)v6;
      goto LABEL_8;
    }
    if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  v7 = (int *)qword_267D23A08;
  v6 = off_267D23A10;
  uint64_t v14 = qword_267D23A08;
  v15 = (std::__shared_weak_count *)off_267D23A10;
  if (off_267D23A10) {
LABEL_8:
  }
    atomic_fetch_add_explicit(v6 + 1, 1uLL, memory_order_relaxed);
  pthread_mutex_unlock(&ctu::Singleton<eUICC::detail::StateMachine,eUICC::detail::StateMachine,ctu::PthreadMutexGuardPolicy<eUICC::detail::StateMachine>>::sInstance);
  v9 = *a3;
  CFTypeRef cf = v9;
  if (v9) {
    CFRetain(v9);
  }
  uint64_t v10 = eUICC::detail::StateMachine::Run(v7, a1, a2, (const __CFDictionary **)&cf);
  if (cf) {
    CFRelease(cf);
  }
  v11 = v15;
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  return v10;
}

void sub_21DF817CC(_Unwind_Exception *a1)
{
  operator delete(v1);
  pthread_mutex_unlock(&ctu::Singleton<eUICC::detail::StateMachine,eUICC::detail::StateMachine,ctu::PthreadMutexGuardPolicy<eUICC::detail::StateMachine>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_21DF81800(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, const void *);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void eUICC::DumpRecords(char *a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  memset(v40, 170, sizeof(v40));
  eUICC::Perso::DumpTransactions(v40);
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  }
  _BBULog(22, 0xFFFFFFFFLL, "eUICC", "", "dumping %zu records\n", v2, v3, v4, -85 * (((char *)v40[1] - (char *)v40[0]) >> 4));
  if (ctu::fs::create_directory())
  {
    v9 = (char *)v40[0];
    v8 = (char *)v40[1];
    if (v40[1] == v40[0]) {
      goto LABEL_35;
    }
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    do
    {
      memset(__p, 170, sizeof(__p));
      boost::basic_format<char,std::char_traits<char>,std::allocator<char>>::basic_format((uint64_t)v44, "%s/Perso-%02d-%s");
      v41 = a1;
      v42 = boost::io::detail::call_put_head<char,std::char_traits<char>,std::string const>;
      v43 = boost::io::detail::call_put_last<char,std::char_traits<char>,std::string const>;
      uint64_t v12 = boost::io::detail::feed_impl<char,std::char_traits<char>,std::allocator<char>,boost::io::detail::put_holder<char,std::char_traits<char>> const&>((uint64_t)v44, &v41);
      int v38 = v11;
      v41 = (char *)&v38;
      v42 = boost::io::detail::call_put_head<char,std::char_traits<char>,int const>;
      v43 = boost::io::detail::call_put_last<char,std::char_traits<char>,int const>;
      uint64_t v13 = boost::io::detail::feed_impl<char,std::char_traits<char>,std::allocator<char>,boost::io::detail::put_holder<char,std::char_traits<char>> const&>(v12, &v41);
      v41 = &v9[v10];
      v42 = boost::io::detail::call_put_head<char,std::char_traits<char>,std::string const>;
      v43 = boost::io::detail::call_put_last<char,std::char_traits<char>,std::string const>;
      uint64_t v14 = (uint64_t *)boost::io::detail::feed_impl<char,std::char_traits<char>,std::allocator<char>,boost::io::detail::put_holder<char,std::char_traits<char>> const&>(v13, &v41);
      boost::basic_format<char,std::char_traits<char>,std::allocator<char>>::str(v14, (uint64_t)__p);
      boost::basic_format<char,std::char_traits<char>,std::allocator<char>>::~basic_format((uint64_t)v44);
      if (gBBULogMaskGet(void)::once != -1) {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      }
      if (SHIBYTE(__p[2]) >= 0) {
        v18 = __p;
      }
      else {
        v18 = (void **)__p[0];
      }
      v35 = v18;
      _BBULog(22, 0xFFFFFFFFLL, "eUICC", "", "%zu -> %s\n", v15, v16, v17, v11);
      if (SHIBYTE(__p[2]) >= 0) {
        v19 = __p;
      }
      else {
        v19 = (void **)__p[0];
      }
      int v20 = open_dprotected_np((const char *)v19, 1793, 4, 0, 420, v35, v36, v37);
      int v24 = v20;
      if (v20 < 0)
      {
        if (gBBULogMaskGet(void)::once != -1) {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        }
        v36 = "";
        uint64_t v37 = 146;
        _BBULog(25, 0xFFFFFFFFLL, "eUICC", "", "Condition <<%s>> failed %s %s/%d\n", v21, v22, v23, (char)"destFD >= 0");
        if (gBBULogMaskGet(void)::once != -1) {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        }
        _BBULog(22, 0xFFFFFFFFLL, "eUICC", "", "Couldn't allocate FD for transaction record during coredump! fd %d path %s\n", v25, v26, v27, v24);
      }
      else
      {
        write(v20, *(const void **)&v9[v10 + 24], *(void *)&v9[v10 + 32] - *(void *)&v9[v10 + 24]);
        close(v24);
      }
      if (SHIBYTE(__p[2]) < 0) {
        operator delete(__p[0]);
      }
      if (v24 < 0) {
        break;
      }
      ++v11;
      v9 = (char *)v40[0];
      v10 += 48;
    }
    while (v11 < 0xAAAAAAAAAAAAAAABLL * (((char *)v40[1] - (char *)v40[0]) >> 4));
  }
  else
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(25, 0xFFFFFFFFLL, "eUICC", "", "Condition <<%s>> failed %s %s/%d\n", v5, v6, v7, (char)"success");
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    if (a1[23] >= 0) {
      LOBYTE(v31) = (_BYTE)a1;
    }
    else {
      uint64_t v31 = *(void *)a1;
    }
    _BBULog(22, 0xFFFFFFFFLL, "eUICC", "", "Failed creating directory %s\n", v28, v29, v30, v31);
  }
  v8 = (char *)v40[0];
LABEL_35:
  if (v8)
  {
    v32 = (char *)v40[1];
    v33 = v8;
    if (v40[1] != v8)
    {
      do
      {
        v34 = (void *)*((void *)v32 - 3);
        if (v34)
        {
          *((void *)v32 - 2) = v34;
          operator delete(v34);
        }
        if (*(v32 - 25) < 0) {
          operator delete(*((void **)v32 - 6));
        }
        v32 -= 48;
      }
      while (v32 != v8);
      v33 = (char *)v40[0];
    }
    v40[1] = v8;
    operator delete(v33);
  }
}

void sub_21DF81CA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t ctu::PthreadMutexGuardPolicy<eUICC::detail::StateMachine>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v3 || atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return a1;
}

void std::__shared_ptr_pointer<eUICC::detail::StateMachine *,std::shared_ptr<eUICC::detail::StateMachine>::__shared_ptr_default_delete<eUICC::detail::StateMachine,eUICC::detail::StateMachine>,std::allocator<eUICC::detail::StateMachine>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<eUICC::detail::StateMachine *,std::shared_ptr<eUICC::detail::StateMachine>::__shared_ptr_default_delete<eUICC::detail::StateMachine,eUICC::detail::StateMachine>,std::allocator<eUICC::detail::StateMachine>>::__on_zero_shared(uint64_t a1)
{
  v1 = *(void **)(a1 + 24);
  if (v1) {
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<eUICC::detail::StateMachine *,std::shared_ptr<eUICC::detail::StateMachine>::__shared_ptr_default_delete<eUICC::detail::StateMachine,eUICC::detail::StateMachine>,std::allocator<eUICC::detail::StateMachine>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021DFAE213) {
    return a1 + 24;
  }
  if (((v3 & 0x800000021DFAE213 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000021DFAE213)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021DFAE213 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

uint64_t __cxx_global_var_init_32()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_21DE8A000);
  }
  return result;
}

uint64_t __cxx_global_var_init_33()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<eUICC::detail::StateMachine>::~PthreadMutexGuardPolicy, &ctu::Singleton<eUICC::detail::StateMachine,eUICC::detail::StateMachine,ctu::PthreadMutexGuardPolicy<eUICC::detail::StateMachine>>::sInstance, &dword_21DE8A000);
  }
  return result;
}

uint64_t BBUScratchFile::createWithFile(uint64_t a1, off_t a2)
{
  if (*(char *)(a1 + 23) >= 0) {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    uint64_t v3 = *(void *)(a1 + 8);
  }
  if (!v3) {
    return 2;
  }
  if (!ctu::fs::file_exists()
    || (*(char *)(a1 + 23) >= 0
      ? (uint64_t v6 = (const std::__fs::filesystem::path *)a1)
      : (uint64_t v6 = *(const std::__fs::filesystem::path **)a1),
        !remove(v6, v5)))
  {
    if (*(char *)(a1 + 23) >= 0) {
      v9 = (const char *)a1;
    }
    else {
      v9 = *(const char **)a1;
    }
    int v10 = open(v9, 1537, 384);
    if (v10 < 0)
    {
      if (gBBULogMaskGet(void)::once == -1)
      {
        uint64_t v7 = 15;
        if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0) {
          return v7;
        }
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        uint64_t v7 = 15;
        if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0) {
          return v7;
        }
      }
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v8 = "file not found after creating %s\n";
        goto LABEL_35;
      }
      return v7;
    }
    int v11 = v10;
    if (ftruncate(v10, a2))
    {
      if (gBBULogMaskGet(void)::once == -1)
      {
        uint64_t v7 = 11;
        if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0) {
          goto LABEL_25;
        }
        goto LABEL_21;
      }
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      uint64_t v7 = 11;
      if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) != 0)
      {
LABEL_21:
        if (gBBULogVerbosity < 0) {
          goto LABEL_25;
        }
        uint64_t v12 = __error();
        unsigned __int8 v13 = strerror(*v12);
        uint64_t v17 = "cannot truncate file %s\n";
        goto LABEL_23;
      }
    }
    else
    {
      int v24 = getpwnam("_wireless");
      if (v24)
      {
        if (!fchown(v11, v24->pw_uid, v24->pw_gid))
        {
          uint64_t v7 = 0;
          goto LABEL_25;
        }
        if (gBBULogMaskGet(void)::once == -1)
        {
          uint64_t v7 = 11;
          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0) {
            goto LABEL_25;
          }
        }
        else
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          uint64_t v7 = 11;
          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0) {
            goto LABEL_25;
          }
        }
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          uint64_t v31 = __error();
          unsigned __int8 v13 = strerror(*v31);
          uint64_t v17 = "failed changing file owner:  %s";
LABEL_23:
          char v33 = v13;
LABEL_24:
          _BBULog(15, 0, "BBUScratchFile", "", v17, v14, v15, v16, v33);
        }
      }
      else
      {
        _BBUFSDebugPrint("getWirelessID", "failed to get uid and gid information for _wireless\n", v25, v26, v27, v28, v29, v30, v32);
        if (gBBULogMaskGet(void)::once == -1)
        {
          uint64_t v7 = 11;
          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0) {
            goto LABEL_25;
          }
        }
        else
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          uint64_t v7 = 11;
          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0) {
            goto LABEL_25;
          }
        }
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          uint64_t v17 = "failed to get uid and gid information for _wireless\n";
          goto LABEL_24;
        }
      }
    }
LABEL_25:
    if (close(v11))
    {
      if (gBBULogMaskGet(void)::once == -1)
      {
        uint64_t v7 = 15;
        if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0) {
          return v7;
        }
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        uint64_t v7 = 15;
        if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0) {
          return v7;
        }
      }
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v8 = "could not close file %s\n";
        goto LABEL_35;
      }
    }
    return v7;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    uint64_t v7 = 11;
    if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0) {
      return v7;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    uint64_t v7 = 11;
    if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0) {
      return v7;
    }
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v8 = "cannot remove existing file %s\n";
LABEL_35:
    v18 = __error();
    char v19 = strerror(*v18);
    _BBULog(15, 0, "BBUScratchFile", "", v8, v20, v21, v22, v19);
  }
  return v7;
}

void BBUEURInitializer::~BBUEURInitializer(BBUEURInitializer *this)
{
  *(void *)this = &unk_26CECBF08;
  uint64_t v1 = *((void *)this + 2);
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_26CECBF08;
  uint64_t v2 = *((void *)this + 2);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  operator delete(this);
}

uint64_t BBUEURInitializer::prepare(uint64_t a1, uint64_t a2, int a3)
{
  if (capabilities::radio::supportsSDIReset((capabilities::radio *)a1)
    && BBUFeedback::getStageContext(*(BBUFeedback **)(a1 + 8)) == 8)
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      uint64_t result = 0;
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
        return result;
      }
      goto LABEL_5;
    }
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    uint64_t result = 0;
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) != 0)
    {
LABEL_5:
      if (gBBULogVerbosity < 0) {
        return result;
      }
      uint64_t v6 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      _BBULog(4, 0, v6, "", "StageContext is Coredump, skipping prepare\n", v7, v8, v9, v25);
      return 0;
    }
    return result;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
      goto LABEL_11;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
      goto LABEL_11;
    }
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    int v10 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    char v11 = BBUStageAsString(a3);
    _BBULog(4, 0, v10, "", "Preparing at %s with reset requested %u\n", v12, v13, v14, v11);
  }
LABEL_11:
  if (a3 != 2) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) != 0) {
        goto LABEL_15;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) != 0)
      {
LABEL_15:
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          uint64_t v15 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
          _BBULog(4, 0, v15, "", "Powering on modem. It is NOOP if BB is already on\n", v16, v17, v18, v25);
        }
      }
    }
    TelephonyBasebandPowerOnModem();
    uint64_t result = 0;
    *(unsigned char *)(a1 + 40) = 0;
    return result;
  }
  *(unsigned char *)(a1 + 40) = 0;
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "%s: Resetting modem", "prepare");
  char v19 = TelephonyBasebandResetModem();
  uint64_t result = 0;
  if (v19) {
    return result;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    uint64_t result = 73;
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
      return result;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    uint64_t result = 73;
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
      return result;
    }
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    uint64_t v20 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    char v21 = BBUStageAsString(2);
    _BBULog(4, 0, v20, "", "Fail to prepare at %s with reset %u\n", v22, v23, v24, v21);
    return 73;
  }
  return result;
}

uint64_t BBUEURInitializer::finalize(BBUFeedback **a1, uint64_t a2, uint64_t a3, int a4, unsigned int a5)
{
  if ((a4 & 0xFFFFFFFD) != 1
    || (uint64_t result = (*((uint64_t (**)(BBUFeedback **, uint64_t))*a1 + 30))(a1, a2), !result))
  {
    uint64_t result = BBUEURInitializer::restoreNVItems(a1, a2, a4);
    if (!result)
    {
      (*((void (**)(BBUFeedback **))*a1 + 25))(a1);
      return BBUEURInitializer::updateIMEISvn((uint64_t)a1, a2, a5);
    }
  }
  return result;
}

uint64_t BBUEURInitializer::restoreNVItems(BBUFeedback **a1, uint64_t a2, int a3)
{
  (*((void (**)(BBUFeedback **))*a1 + 23))(a1);
  switch(a3)
  {
    case 1:
      BBUFeedback::handleComment(a1[1], "Restoring NV items to Factory defaults");
      if (ETLMaverickWriteFactoryDefaultNVs()) {
        goto LABEL_9;
      }
      uint64_t result = 3;
      break;
    case 2:
      BBUFeedback::handleComment(a1[1], "Restoring NV items to Shipping defaults");
      if (ETLMaverickWriteDefaultNVs()) {
        goto LABEL_9;
      }
      uint64_t result = 3;
      break;
    case 4:
      BBUFeedback::handleComment(a1[1], "Restoring NV items to FATP defaults");
      if (ETLMaverickWriteFATPDefaultNVs()) {
        goto LABEL_9;
      }
      uint64_t result = 3;
      break;
    case 5:
      BBUFeedback::handleComment(a1[1], "OQC Magic is not supported on MAV basebands");
      goto LABEL_9;
    default:
LABEL_9:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t BBUEURInitializer::updateIMEISvn(uint64_t a1, uint64_t a2, unsigned int a3)
{
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "IMEI-SVN Check and Update...");
  if (a3 == -1) {
    return 0;
  }
  if (a3 > 0x62) {
    return 2;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x10) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x10) == 0) {
      goto LABEL_8;
    }
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    uint64_t v6 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(20, 0, v6, "", "Getting current SVN\n", v7, v8, v9, v33);
  }
LABEL_8:
  if (!ETLMaverickGetIMEISwVersion())
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x10) == 0) {
        goto LABEL_15;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x10) == 0) {
        goto LABEL_15;
      }
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      int v10 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      _BBULog(20, 0, v10, "", "Trying to set SVN\n", v11, v12, v13, v33);
    }
LABEL_15:
    int v14 = ETLMaverickSetIMEISwVersion();
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    int v15 = (gBBULogVerbosity >= 0) & (*(unsigned __int8 *)(gBBULogMaskGet(void)::sBBULogMask + 2) >> 4);
    if (v14)
    {
      if (v15)
      {
        uint64_t v16 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        _BBULog(20, 0, v16, "", "SVN set: %d\n", v17, v18, v19, a3);
      }
      return 0;
    }
    goto LABEL_28;
  }
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  }
  if (((gBBULogVerbosity >= 0) & (*(unsigned __int8 *)(gBBULogMaskGet(void)::sBBULogMask + 2) >> 4)) != 0)
  {
    uint64_t v20 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(20, 0, v20, "", "Trying to set new SVN\n", v21, v22, v23, v33);
  }
  int v24 = ETLMaverickSetIMEISwVersion();
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  }
  int v15 = (gBBULogVerbosity >= 0) & (*(unsigned __int8 *)(gBBULogMaskGet(void)::sBBULogMask + 2) >> 4);
  if (v24)
  {
    if (v15)
    {
      char v25 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      _BBULog(20, 0, v25, "", "SVN changed from %d to %d\n", v26, v27, v28, 170);
    }
    return 0;
  }
LABEL_28:
  if (v15)
  {
    uint64_t v29 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(20, 0, v29, "", "Could not set SVN\n", v30, v31, v32, v33);
  }
  return 3;
}

uint64_t BBUEURInitializer::crashBaseband(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Reset = (capabilities::coredump *)TelephonyBasebandGetReset();
  if (capabilities::coredump::supportsGPIOSignalling(Reset))
  {
    TelephonyBasebandSetModemCoredumpGPIO();
    usleep(0xF4240u);
    TelephonyBasebandSetModemCoredumpGPIO();
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Coredump GPIO signalled");
    TelephonyBasebandGetReset();
  }
  if (a3)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "DIAG crash command sent");
    ETLBBSimulateCrash();
  }
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "resetting modem");
  TelephonyBasebandResetModem();
  return 0;
}

uint64_t BBUEURInitializer::getVersion(void *a1, uint64_t a2, BBUEUR10FirmwareVersion **a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 67, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Initialization/Eureka/BBUEURInitializer.cpp", 0xA3u, (ctu::LogMessageBuffer *)"Assertion failure(transport && \"Telephony util transport error\")", v14, v15, v16, v17);
  }
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)((char *)v21 + 11) = v5;
  v20[14] = v5;
  v21[0] = v5;
  v20[12] = v5;
  v20[13] = v5;
  v20[10] = v5;
  v20[11] = v5;
  v20[8] = v5;
  v20[9] = v5;
  v20[7] = v5;
  v20[5] = v5;
  v20[6] = v5;
  v20[3] = v5;
  v20[4] = v5;
  v20[1] = v5;
  v20[2] = v5;
  v20[0] = v5;
  *a3 = 0;
  (*(void (**)(void *))(*a1 + 200))(a1);
  if (!ETLBBGetVersion()) {
    return 3;
  }
  size_t v6 = strlen((const char *)((unint64_t)v20 | 0xB));
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (void *)v6;
  if (v6 >= 0x17)
  {
    uint64_t v10 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v10 = v6 | 7;
    }
    uint64_t v11 = v10 + 1;
    uint64_t v8 = (void **)operator new(v10 + 1);
    __dst[1] = v7;
    unint64_t v19 = v11 | 0x8000000000000000;
    __dst[0] = v8;
  }
  else
  {
    HIBYTE(v19) = v6;
    uint64_t v8 = __dst;
    if (!v6) {
      goto LABEL_12;
    }
  }
  memcpy(v8, (const void *)((unint64_t)v20 | 0xB), (size_t)v7);
LABEL_12:
  *((unsigned char *)v7 + (void)v8) = 0;
  uint64_t v12 = BBUFirmwareVersion::createFromVersionString((capabilities::updater *)__dst);
  a1[2] = v12;
  if (SHIBYTE(v19) < 0)
  {
    operator delete(__dst[0]);
    uint64_t v12 = (BBUEUR10FirmwareVersion *)a1[2];
  }
  uint64_t result = 0;
  *a3 = v12;
  return result;
}

void sub_21DF83074(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BBUEURInitializer::gatherPersonalizationParameters(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v50 = v6;
  long long v51 = v6;
  long long v48 = v6;
  long long v49 = v6;
  long long v46 = v6;
  long long v47 = v6;
  *(_OWORD *)bytes = v6;
  long long v45 = v6;
  unsigned int v27 = -1431655766;
  (*(void (**)(uint64_t))(*(void *)a1 + 200))(a1);
  if (!ETLMaverickReadPublicKeyHash()) {
    return 3;
  }
  CFIndex v7 = v27;
  uint64_t v8 = operator new(0x10uLL);
  void *v8 = &unk_26CECE908;
  v8[1] = 0;
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v8[1] = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, v7);
  (*(void (**)(void *, void *))(*a3 + 24))(a3, v8);
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v42 = v10;
  long long v43 = v10;
  long long v40 = v10;
  long long v41 = v10;
  long long v38 = v10;
  long long v39 = v10;
  *(_OWORD *)v36 = v10;
  long long v37 = v10;
  int v26 = -1431655766;
  (*(void (**)(uint64_t))(*(void *)a1 + 200))(a1);
  if (!ETLMaverickReadNonce()) {
    return 3;
  }
  uint64_t v11 = operator new(0x10uLL);
  CFIndex v12 = (v26 + 7) >> 3;
  void *v11 = &unk_26CECE7E8;
  v11[1] = 0;
  v11[1] = CFDataCreate(v9, v36, v12);
  uint64_t v13 = a3[1];
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
  }
  a3[1] = v11;
  *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v34 = v14;
  long long v35 = v14;
  long long v32 = v14;
  long long v33 = v14;
  long long v30 = v14;
  long long v31 = v14;
  long long v28 = v14;
  long long v29 = v14;
  char v25 = (BBUEURPersonalizationParameters::EURChipID *)0xAAAAAAAAAAAAAAAALL;
  (*(void (**)(uint64_t))(*(void *)a1 + 200))(a1);
  if (!ETLMaverickReadSerialNumberAndChipID()) {
    return 3;
  }
  uint64_t v15 = BBUEURPersonalizationParameters::EURSerialNumber::createFromSerialNumber((BBUEURPersonalizationParameters::EURSerialNumber *)&v28, (const unsigned __int8 *)HIDWORD(v25));
  (*(void (**)(void *, void *))(*a3 + 16))(a3, v15);
  uint64_t v16 = BBUEURPersonalizationParameters::EURChipID::createFromChipID((BBUEURPersonalizationParameters::EURChipID *)v25);
  uint64_t v17 = a3[2];
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }
  a3[2] = v16;
  HIDWORD(v25) = 0;
  (*(void (**)(void *, char *, void))(*a3 + 32))(a3, (char *)&v25 + 4, 0);
  if (HIDWORD(v25) != 3) {
    return 0;
  }
  *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v28 = v18;
  long long v29 = v18;
  if (ETLMaverickManifestStatusInit())
  {
    uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t, void *, long long *))(*(void *)a1 + 208))(a1, a2, a3, &v28);
    ETLMaverickManifestStatusFree();
  }
  else
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      uint64_t v19 = 19;
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
        return v19;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      uint64_t v19 = 19;
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
        return v19;
      }
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      uint64_t v21 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      _BBULog(4, 0, v21, "", "Failed to allocate space for manifest_status\n", v22, v23, v24, (char)v25);
    }
  }
  return v19;
}

uint64_t BBUEURInitializer::overridePersonalizationParameters(BBUFeedback **this, BBUPersonalizationParameters *a2, const __CFDictionary *a3)
{
  value = (void *)0xAAAAAAAAAAAAAAAALL;
  BBUFeedback::handleComment(this[1], "Overriding with preflight information:");
  if (CFDictionaryGetValueIfPresent(a3, @"ChipID", (const void **)&value))
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      CFIndex v7 = value;
      uint64_t v8 = operator new(0x10uLL);
      void *v8 = &unk_26CECE878;
      v8[1] = v7;
      CFRetain(v7);
      uint64_t v9 = *((void *)a2 + 2);
      if (v9) {
        (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
      }
      *((void *)a2 + 2) = v8;
      long long v10 = this[1];
      int v11 = (*(uint64_t (**)(void *))(*v8 + 24))(v8);
      int v12 = (*(uint64_t (**)(void *))(*v8 + 24))(v8);
      BBUFeedback::handleComment(v10, "   ChipID: %u (0x%08x)", v11, v12);
    }
  }
  if (!CFDictionaryGetValueIfPresent(a3, @"ChipSerialNo", (const void **)&value)) {
    goto LABEL_12;
  }
  CFTypeID v13 = CFGetTypeID(value);
  if (v13 != CFDataGetTypeID()) {
    goto LABEL_12;
  }
  long long v14 = value;
  uint64_t v15 = operator new(0x10uLL);
  void *v15 = &unk_26CECE818;
  v15[1] = v14;
  CFRetain(v14);
  (*(void (**)(BBUPersonalizationParameters *, void *))(*(void *)a2 + 16))(a2, v15);
  uint64_t v16 = this[1];
  (*(void (**)(void **__return_ptr, void *))(*v15 + 24))(__p, v15);
  uint64_t v17 = v31 >= 0 ? (const char *)__p : (const char *)__p[0];
  BBUFeedback::handleComment(v16, "   ChipSerialNo: %s", v17);
  if (v31 < 0)
  {
    operator delete(__p[0]);
    if (!CFDictionaryGetValueIfPresent(a3, @"CertHash", (const void **)&value)) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_12:
    if (!CFDictionaryGetValueIfPresent(a3, @"CertHash", (const void **)&value)) {
      goto LABEL_20;
    }
  }
  CFTypeID v18 = CFGetTypeID(value);
  if (v18 == CFDataGetTypeID())
  {
    uint64_t v19 = value;
    uint64_t v20 = operator new(0x10uLL);
    *uint64_t v20 = &unk_26CECE908;
    v20[1] = v19;
    CFRetain(v19);
    (*(void (**)(BBUPersonalizationParameters *, void *))(*(void *)a2 + 24))(a2, v20);
    uint64_t v21 = this[1];
    (*(void (**)(void **__return_ptr, void *))(*v20 + 24))(__p, v20);
    uint64_t v22 = v31 >= 0 ? (const char *)__p : (const char *)__p[0];
    BBUFeedback::handleComment(v21, "   CertHash: %s", v22);
    if (v31 < 0) {
      operator delete(__p[0]);
    }
  }
LABEL_20:
  if (CFDictionaryGetValueIfPresent(a3, @"Nonce", (const void **)&value))
  {
    CFTypeID v23 = CFGetTypeID(value);
    if (v23 == CFDataGetTypeID())
    {
      uint64_t v24 = value;
      char v25 = operator new(0x10uLL);
      *char v25 = &unk_26CECE7E8;
      v25[1] = v24;
      CFRetain(v24);
      uint64_t v26 = *((void *)a2 + 1);
      if (v26) {
        (*(void (**)(uint64_t))(*(void *)v26 + 8))(v26);
      }
      *((void *)a2 + 1) = v25;
      unsigned int v27 = this[1];
      (*(void (**)(void **__return_ptr, void *))(*v25 + 24))(__p, v25);
      if (v31 >= 0) {
        long long v28 = __p;
      }
      else {
        long long v28 = (void **)__p[0];
      }
      BBUFeedback::handleComment(v27, "   Nonce: %s", (const char *)v28);
      if (v31 < 0) {
        operator delete(__p[0]);
      }
    }
  }
  return 0;
}

void sub_21DF83970(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BBUEURInitializer::gatherProvisioningParameters(BBUFeedback **a1, capabilities::euicc *a2, uint64_t a3)
{
  uint64_t result = (*((uint64_t (**)(BBUFeedback **))*a1 + 33))(a1);
  if (!result)
  {
    uint64_t result = (*((uint64_t (**)(BBUFeedback **, capabilities::euicc *, uint64_t))*a1 + 31))(a1, a2, a3);
    if (!result)
    {
      uint64_t result = (*((uint64_t (**)(BBUFeedback **, capabilities::euicc *, uint64_t))*a1 + 32))(a1, a2, a3);
      if (!result)
      {
        if (eUICC::getEID(a2, a3, a1[1]) == 126) {
          return 126;
        }
        else {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t BBUEURInitializer::getProvisioningStatus(BBUFeedback **a1, uint64_t a2, uint64_t a3, unsigned char *a4, BOOL *a5)
{
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22[0] = v10;
  v22[1] = v10;
  *a4 = 1;
  uint64_t v23 = 0;
  if (ETLMaverickManifestStatusInit())
  {
    if ((*((unsigned int (**)(BBUFeedback **, uint64_t, uint64_t, _OWORD *))*a1 + 26))(a1, a2, a3, v22))
    {
      uint64_t v11 = 0;
      HIDWORD(v23) = 4;
      *a5 = 0;
    }
    else if (ETLProvisionParseStatus())
    {
      int v16 = HIDWORD(v23);
      LOBYTE(v23) = HIDWORD(v23) == 1;
      switch(HIDWORD(v23))
      {
        case 0:
        case 2:
          goto LABEL_11;
        case 1:
          *a4 = 0;
LABEL_11:
          *a5 = v16 != 2;
          BBUFeedback::handleComment(a1[1], "mature");
          int v17 = WORD4(v22[0]);
          if (!WORD4(v22[0])) {
            goto LABEL_18;
          }
          goto LABEL_17;
        case 3:
          *a5 = 0;
          int v17 = WORD4(v22[0]);
          if (WORD4(v22[0])) {
            goto LABEL_17;
          }
          goto LABEL_18;
        default:
          *a5 = 0;
          BBUFeedback::handleComment(a1[1], "bringup");
          int v17 = WORD4(v22[0]);
          if (!WORD4(v22[0])) {
            goto LABEL_18;
          }
LABEL_17:
          CFTypeID v18 = a1[1];
          StateAsString = (const char *)ETLProvisionGetStateAsString();
          BBUFeedback::handleComment(v18, "Provision manifest status:%u => state %s(%u), mismatched %u", v17, StateAsString, HIDWORD(v23), v23);
LABEL_18:
          uint64_t v11 = 0;
          break;
      }
    }
    else
    {
      uint64_t v11 = 3;
    }
    ETLMaverickManifestStatusFree();
  }
  else
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      uint64_t v11 = 19;
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
        return v11;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      uint64_t v11 = 19;
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
        return v11;
      }
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      int v12 = (const char *)(*(uint64_t (**)(BBUFeedback **))*a1)(a1);
      _BBULog(4, 0, v12, "", "Failed to allocate space for manifest_status\n", v13, v14, v15, v21);
    }
  }
  return v11;
}

uint64_t BBUEURInitializer::gatherManifestInfo(BBUFeedback **a1, uint64_t a2, void *a3, uint64_t a4)
{
  BBUFeedback::handleComment(a1[1], "Getting manifest information from BB");
  (*((void (**)(BBUFeedback **))*a1 + 25))(a1);
  if (!ETLMaverickGetManifestStatus())
  {
    BBUFeedback::handleComment(a1[1], "Failed getting manifest status");
    return 3;
  }
  uint64_t v7 = 0;
  switch(*(_WORD *)(a4 + 8))
  {
    case 0:
    case 0x40:
      break;
    case 4:
    case 0xF:
      uint64_t v7 = 1;
      break;
    case 6:
    case 0x1C:
    case 0x1D:
      uint64_t v7 = 2;
      break;
    default:
      uint64_t v7 = 3;
      break;
  }
  uint64_t v9 = BBUEURPersonalizationParameters::EURKeyStatus::createFromKeyStatus((BBUEURPersonalizationParameters::EURKeyStatus *)v7);
  long long v10 = BBUEURPersonalizationParameters::EURKeyStatus::createFromKeyStatus((BBUEURPersonalizationParameters::EURKeyStatus *)*(unsigned __int16 *)(a4 + 8));
  char v31 = BBUEURPersonalizationParameters::EURKeyStatus::createFromKeyStatus((BBUEURPersonalizationParameters::EURKeyStatus *)*(unsigned __int16 *)(a4 + 12));
  long long v32 = BBUEURPersonalizationParameters::EURKeyStatus::createFromKeyStatus((BBUEURPersonalizationParameters::EURKeyStatus *)*(unsigned __int16 *)(a4 + 10));
  BBUFeedback::handleComment(a1[1], "Manifest status: \n\t\t\t  provision_status   : %u\n \t\t\t  fatp_cal_status    : %u\n \t\t\t  calibration_status : %u", *(unsigned __int16 *)(a4 + 8), *(unsigned __int16 *)(a4 + 10), *(unsigned __int16 *)(a4 + 12));
  int DigestType = capabilities::updater::getDigestType(v11);
  if (DigestType == 2) {
    unsigned int v13 = 48;
  }
  else {
    unsigned int v13 = 0;
  }
  unsigned int v14 = DigestType - 1;
  if (DigestType == 1) {
    CFIndex v15 = 32;
  }
  else {
    CFIndex v15 = v13;
  }
  if (!v15) {
    goto LABEL_52;
  }
  int v16 = DigestType;
  memset(__p, 170, sizeof(__p));
  ctu::hex(*(ctu **)(a4 + 16), (const void *)0x10);
  if (SHIBYTE(__p[2]) >= 0) {
    int v17 = __p;
  }
  else {
    int v17 = (void **)__p[0];
  }
  BBUFeedback::handleComment(a1[1], "  skey_hash    [0x%02x]: %s", 0, (const char *)v17);
  if (SHIBYTE(__p[2]) < 0)
  {
    operator delete(__p[0]);
    if (v14 > 1) {
      goto LABEL_33;
    }
  }
  else if (v14 > 1)
  {
    goto LABEL_33;
  }
  memset(__p, 170, sizeof(__p));
  ctu::hex((ctu *)(*(void *)(a4 + 16) + 16), (const void *)0x10);
  if (SHIBYTE(__p[2]) >= 0) {
    CFTypeID v18 = __p;
  }
  else {
    CFTypeID v18 = (void **)__p[0];
  }
  BBUFeedback::handleComment(a1[1], "  skey_hash    [0x%02x]: %s", 16, (const char *)v18);
  if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
  {
    if (v16 != 2) {
      goto LABEL_33;
    }
LABEL_28:
    memset(__p, 170, sizeof(__p));
    ctu::hex((ctu *)(*(void *)(a4 + 16) + 32), (const void *)0x10);
    if (SHIBYTE(__p[2]) >= 0) {
      uint64_t v19 = __p;
    }
    else {
      uint64_t v19 = (void **)__p[0];
    }
    BBUFeedback::handleComment(a1[1], "  skey_hash    [0x%02x]: %s", 32, (const char *)v19);
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
    goto LABEL_33;
  }
  operator delete(__p[0]);
  if (v16 == 2) {
    goto LABEL_28;
  }
LABEL_33:
  memset(__p, 170, sizeof(__p));
  ctu::hex(*(ctu **)(a4 + 24), (const void *)0x10);
  if (SHIBYTE(__p[2]) >= 0) {
    uint64_t v20 = __p;
  }
  else {
    uint64_t v20 = (void **)__p[0];
  }
  BBUFeedback::handleComment(a1[1], "  ckey_hash    [0x%02x]: %s", 0, (const char *)v20);
  if (SHIBYTE(__p[2]) < 0)
  {
    operator delete(__p[0]);
    if (v14 > 1) {
      goto LABEL_52;
    }
  }
  else if (v14 > 1)
  {
    goto LABEL_52;
  }
  memset(__p, 170, sizeof(__p));
  ctu::hex((ctu *)(*(void *)(a4 + 24) + 16), (const void *)0x10);
  if (SHIBYTE(__p[2]) >= 0) {
    char v21 = __p;
  }
  else {
    char v21 = (void **)__p[0];
  }
  BBUFeedback::handleComment(a1[1], "  ckey_hash    [0x%02x]: %s", 16, (const char *)v21);
  if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
  {
    if (v16 != 2) {
      goto LABEL_52;
    }
LABEL_47:
    memset(__p, 170, sizeof(__p));
    ctu::hex((ctu *)(*(void *)(a4 + 24) + 32), (const void *)0x10);
    if (SHIBYTE(__p[2]) >= 0) {
      uint64_t v22 = __p;
    }
    else {
      uint64_t v22 = (void **)__p[0];
    }
    BBUFeedback::handleComment(a1[1], "  ckey_hash    [0x%02x]: %s", 32, (const char *)v22);
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
    goto LABEL_52;
  }
  operator delete(__p[0]);
  if (v16 == 2) {
    goto LABEL_47;
  }
LABEL_52:
  uint64_t v23 = a3[6];
  if (v23) {
    (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
  }
  a3[6] = v9;
  uint64_t v24 = a3[8];
  if (v24) {
    (*(void (**)(uint64_t))(*(void *)v24 + 8))(v24);
  }
  a3[8] = v10;
  uint64_t v25 = a3[9];
  if (v25) {
    (*(void (**)(uint64_t))(*(void *)v25 + 8))(v25);
  }
  a3[9] = v31;
  uint64_t v26 = a3[10];
  if (v26) {
    (*(void (**)(uint64_t))(*(void *)v26 + 8))(v26);
  }
  a3[10] = v32;
  unsigned int v27 = *(unsigned __int16 *)(a4 + 8);
  if (v27 <= 0xF && ((1 << v27) & 0x8011) != 0)
  {
    long long v28 = *(const UInt8 **)(a4 + 16);
    long long v29 = operator new(0x10uLL);
    *long long v29 = &unk_26CECE8D8;
    v29[1] = 0;
    v29[1] = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v28, v15);
    uint64_t v30 = a3[7];
    if (v30) {
      (*(void (**)(uint64_t))(*(void *)v30 + 8))(v30);
    }
    uint64_t result = 0;
    a3[7] = v29;
  }
  else
  {
    BBUFeedback::handleComment(a1[1], "BB has no provisioning manifest");
    return 0;
  }
  return result;
}

void sub_21DF84238(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BBUEURInitializer::pingAndCheckForResponse(uint64_t a1)
{
  int v17 = 0;
  uint64_t v2 = TelephonyUtilSystemMachTime();
  do
  {
    (*(void (**)(uint64_t))(*(void *)a1 + 192))(a1);
    if ((ETLMaverickGetBasebandInitStatusEx() & 1) == 0)
    {
      if (gBBULogMaskGet(void)::once == -1)
      {
        uint64_t result = 3;
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
          return result;
        }
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        uint64_t result = 3;
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
          return result;
        }
      }
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        uint64_t v8 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        _BBULog(4, 0, v8, "", "Fail to read BB Init Status: I/O error\n", v9, v10, v11, v16);
        return 3;
      }
      return result;
    }
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
        goto LABEL_2;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
        goto LABEL_2;
      }
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      uint64_t v3 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      _BBULog(4, 0, v3, "", "BB Init status: not ready\n", v4, v5, v6, v16);
    }
LABEL_2:
    usleep(0x186A0u);
  }
  while ((unint64_t)(TelephonyUtilSystemMachTime() - v2) <= 0x1388);
  if (gBBULogMaskGet(void)::once == -1)
  {
    uint64_t result = 40;
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
      return result;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    uint64_t result = 40;
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
      return result;
    }
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    int v12 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(4, 0, v12, "", "Timeout on waiting for BB Init status\n", v13, v14, v15, v16);
    return 40;
  }
  return result;
}

void sub_21DF846B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BBUEURInitializer::fusingCheck(BBUFeedback **a1)
{
  BBUFeedback::handleBeginQuickStep(a1[1], "Fusing check");
  (*((void (**)(BBUFeedback **))*a1 + 25))(a1);
  FusingStatus = (capabilities::updater *)ETLMaverickGetFusingStatus();
  if (FusingStatus) {
    capabilities::updater::shouldAllowUnfused(FusingStatus);
  }
  (*(void (**)(BBUFeedback *, uint64_t))(*(void *)a1[1] + 24))(a1[1], 24);
  return 24;
}

uint64_t BBUEURInitializer::getIMEI(capabilities::updater *a1, uint64_t a2, std::string **a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if ((capabilities::updater::supportsDualIMEIProvision(a1) & 1) == 0)
  {
    unint64_t v39 = 0xAAAAAAAAAAAAAAAALL;
    char v40 = -86;
    (*(void (**)(capabilities::updater *))(*(void *)a1 + 200))(a1);
    if (!ETLGSMGetIMEI()) {
      return 30;
    }
    if (!ETLGSMIsValidIMEI()) {
      return 0;
    }
    memset(__s, 170, sizeof(__s));
    if (!ETLGSMMakeStringFromIMEI()) {
      return 11;
    }
    uint64_t v9 = (std::string *)operator new(0x18uLL);
    size_t v10 = strlen(__s);
    if (v10 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    size_t v11 = v10;
    if (v10 >= 0x17)
    {
      uint64_t v16 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v10 | 7) != 0x17) {
        uint64_t v16 = v10 | 7;
      }
      uint64_t v17 = v16 + 1;
      int v12 = (long long *)operator new(v16 + 1);
      *((void *)&v30 + 1) = v11;
      unint64_t v31 = v17 | 0x8000000000000000;
      *(void *)&long long v30 = v12;
    }
    else
    {
      HIBYTE(v31) = v10;
      int v12 = &v30;
      if (!v10)
      {
LABEL_27:
        *((unsigned char *)v12 + v11) = 0;
        if (SHIBYTE(v31) < 0)
        {
          uint64_t v25 = (void *)v30;
          std::string::__init_copy_ctor_external(v9, (const std::string::value_type *)v30, *((std::string::size_type *)&v30 + 1));
          operator delete(v25);
          CFTypeID v18 = *a3;
          if (!*a3)
          {
LABEL_48:
            *a3 = v9;
            return 0;
          }
        }
        else
        {
          *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v30;
          v9->__r_.__value_.__r.__words[2] = v31;
          CFTypeID v18 = *a3;
          if (!*a3) {
            goto LABEL_48;
          }
        }
        if (SHIBYTE(v18->__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v18->__r_.__value_.__l.__data_);
        }
        operator delete(v18);
        goto LABEL_48;
      }
    }
    memcpy(v12, __s, v11);
    goto LABEL_27;
  }
  unint64_t v39 = 0xAAAAAAAAAAAAAAAALL;
  char v40 = -86;
  char v35 = -86;
  unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
  char v33 = -86;
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  (*(void (**)(capabilities::updater *))(*(void *)a1 + 200))(a1);
  if (!ETLMaverickGetIMEI()) {
    return 30;
  }
  unint64_t v39 = v34;
  char v40 = v35;
  if (!ETLGSMIsValidIMEI()) {
    goto LABEL_35;
  }
  memset(__s, 170, sizeof(__s));
  if (!ETLGSMMakeStringFromIMEI()) {
    return 11;
  }
  uint64_t v5 = (std::string *)operator new(0x18uLL);
  size_t v6 = strlen(__s);
  if (v6 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v13 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v13 = v6 | 7;
    }
    uint64_t v14 = v13 + 1;
    uint64_t v8 = (long long *)operator new(v13 + 1);
    *((void *)&v30 + 1) = v7;
    unint64_t v31 = v14 | 0x8000000000000000;
    *(void *)&long long v30 = v8;
    goto LABEL_19;
  }
  HIBYTE(v31) = v6;
  uint64_t v8 = &v30;
  if (v6) {
LABEL_19:
  }
    memcpy(v8, __s, v7);
  *((unsigned char *)v8 + v7) = 0;
  if ((SHIBYTE(v31) & 0x80000000) == 0)
  {
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v30;
    v5->__r_.__value_.__r.__words[2] = v31;
    uint64_t v15 = *a3;
    if (!*a3) {
      goto LABEL_34;
    }
LABEL_31:
    if (SHIBYTE(v15->__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v15->__r_.__value_.__l.__data_);
    }
    operator delete(v15);
    goto LABEL_34;
  }
  uint64_t v19 = (void *)v30;
  std::string::__init_copy_ctor_external(v5, (const std::string::value_type *)v30, *((std::string::size_type *)&v30 + 1));
  operator delete(v19);
  uint64_t v15 = *a3;
  if (*a3) {
    goto LABEL_31;
  }
LABEL_34:
  *a3 = v5;
LABEL_35:
  (*(void (**)(capabilities::updater *))(*(void *)a1 + 200))(a1);
  if (!ETLMaverickGetIMEI()) {
    return 30;
  }
  unint64_t v36 = v32;
  char v37 = v33;
  if (ETLGSMIsValidIMEI())
  {
    memset(__s, 170, sizeof(__s));
    if (ETLGSMMakeStringFromIMEI())
    {
      uint64_t v20 = (std::string *)operator new(0x18uLL);
      size_t v21 = strlen(__s);
      if (v21 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      size_t v22 = v21;
      if (v21 >= 0x17)
      {
        uint64_t v26 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v21 | 7) != 0x17) {
          uint64_t v26 = v21 | 7;
        }
        uint64_t v27 = v26 + 1;
        uint64_t v23 = (long long *)operator new(v26 + 1);
        *((void *)&v30 + 1) = v22;
        unint64_t v31 = v27 | 0x8000000000000000;
        *(void *)&long long v30 = v23;
      }
      else
      {
        HIBYTE(v31) = v21;
        uint64_t v23 = &v30;
        if (!v21) {
          goto LABEL_53;
        }
      }
      memcpy(v23, __s, v22);
LABEL_53:
      *((unsigned char *)v23 + v22) = 0;
      if (SHIBYTE(v31) < 0)
      {
        long long v28 = (void *)v30;
        std::string::__init_copy_ctor_external(v20, (const std::string::value_type *)v30, *((std::string::size_type *)&v30 + 1));
        operator delete(v28);
      }
      else
      {
        *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v30;
        v20->__r_.__value_.__r.__words[2] = v31;
      }
      long long v29 = a3[1];
      if (v29)
      {
        if (SHIBYTE(v29->__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v29->__r_.__value_.__l.__data_);
        }
        operator delete(v29);
      }
      a3[1] = v20;
      return 0;
    }
    return 11;
  }
  return 0;
}

void sub_21DF84C88(_Unwind_Exception *a1)
{
  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DF84CA8(_Unwind_Exception *a1)
{
  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DF84CC4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DF84CD8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DF84CEC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUEURInitializer::getMEID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  *(_DWORD *)((char *)v15 + 3) = -1431655766;
  v15[0] = -1431655766;
  (*(void (**)(uint64_t))(*(void *)a1 + 200))(a1);
  if (!ETLCDMAGetMEID()) {
    return 29;
  }
  uint64_t result = ETLCDMAIsValidMEID();
  if (result)
  {
    memset(__s, 170, 15);
    if (!ETLCDMAMakeStringFromMEID()) {
      return 11;
    }
    uint64_t v5 = (std::string *)operator new(0x18uLL);
    size_t v6 = strlen(__s);
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
      p_dst = (long long *)operator new(v9 + 1);
      *((void *)&__dst + 1) = v7;
      unint64_t v14 = v10 | 0x8000000000000000;
      *(void *)&long long __dst = p_dst;
    }
    else
    {
      HIBYTE(v14) = v6;
      p_dst = &__dst;
      if (!v6)
      {
LABEL_15:
        *((unsigned char *)p_dst + v7) = 0;
        if (SHIBYTE(v14) < 0)
        {
          int v12 = (void *)__dst;
          std::string::__init_copy_ctor_external(v5, (const std::string::value_type *)__dst, *((std::string::size_type *)&__dst + 1));
          operator delete(v12);
          uint64_t v11 = *(void *)(a3 + 16);
          if (!v11)
          {
LABEL_22:
            uint64_t result = 0;
            *(void *)(a3 + 16) = v5;
            return result;
          }
        }
        else
        {
          *(_OWORD *)&v5->__r_.__value_.__l.__data_ = __dst;
          v5->__r_.__value_.__r.__words[2] = v14;
          uint64_t v11 = *(void *)(a3 + 16);
          if (!v11) {
            goto LABEL_22;
          }
        }
        if (*(char *)(v11 + 23) < 0) {
          operator delete(*(void **)v11);
        }
        operator delete((void *)v11);
        goto LABEL_22;
      }
    }
    memcpy(p_dst, __s, v7);
    goto LABEL_15;
  }
  return result;
}

void sub_21DF84EDC(_Unwind_Exception *a1)
{
  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DF84EF8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUEURInitializer::getCarrierID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)__s = 0xAAAAAAAAAAAAAAAALL;
  (*(void (**)(uint64_t))(*(void *)a1 + 200))(a1);
  if (!ETLMaverickGetCarrierID()) {
    return 32;
  }
  uint64_t v4 = (std::string *)operator new(0x18uLL);
  size_t v5 = strlen(__s);
  if (v5 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v6 = v5;
  if (v5 >= 0x17)
  {
    uint64_t v10 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17) {
      uint64_t v10 = v5 | 7;
    }
    uint64_t v11 = v10 + 1;
    size_t v7 = (long long *)operator new(v10 + 1);
    *((void *)&v13 + 1) = v6;
    unint64_t v14 = v11 | 0x8000000000000000;
    *(void *)&long long v13 = v7;
  }
  else
  {
    HIBYTE(v14) = v5;
    size_t v7 = &v13;
    if (!v5)
    {
      LOBYTE(v13) = 0;
      if ((SHIBYTE(v14) & 0x80000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  memcpy(v7, __s, v6);
  *((unsigned char *)v7 + v6) = 0;
  if ((SHIBYTE(v14) & 0x80000000) == 0)
  {
LABEL_6:
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v13;
    v4->__r_.__value_.__r.__words[2] = v14;
    uint64_t v8 = *(void *)(a3 + 48);
    if (!v8) {
      goto LABEL_17;
    }
LABEL_14:
    if (*(char *)(v8 + 23) < 0) {
      operator delete(*(void **)v8);
    }
    operator delete((void *)v8);
    goto LABEL_17;
  }
LABEL_13:
  int v12 = (void *)v13;
  std::string::__init_copy_ctor_external(v4, (const std::string::value_type *)v13, *((std::string::size_type *)&v13 + 1));
  operator delete(v12);
  uint64_t v8 = *(void *)(a3 + 48);
  if (v8) {
    goto LABEL_14;
  }
LABEL_17:
  uint64_t result = 0;
  *(void *)(a3 + 48) = v4;
  return result;
}

void sub_21DF850D8(_Unwind_Exception *a1)
{
  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DF850F4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUEURInitializer::queryChipInfoBooted(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v46[6] = v6;
  v46[7] = v6;
  v46[4] = v6;
  v46[5] = v6;
  v46[2] = v6;
  v46[3] = v6;
  v46[0] = v6;
  v46[1] = v6;
  char v35 = (BBUEURPersonalizationParameters::EURChipID *)0xAAAAAAAAAAAAAAAALL;
  long long v44 = v6;
  long long v45 = v6;
  long long v43 = v6;
  long long v41 = v6;
  long long v42 = v6;
  long long v39 = v6;
  long long v40 = v6;
  *(_OWORD *)bytes = v6;
  unsigned int v34 = -1431655766;
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Querying chip info from booted baseband");
  if (!a2 || !a3)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "missing parameter");
    return 2;
  }
  capabilities::updater::personalizationCommandTimeout(v7);
  uint64_t SerialNumberAndChipID = ETLMaverickReadSerialNumberAndChipID();
  if ((SerialNumberAndChipID & 1) == 0)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "failed reading snum and/or chipID from booted baseband over ETL");
    return 18;
  }
  capabilities::updater::personalizationCommandTimeout((capabilities::updater *)SerialNumberAndChipID);
  if ((ETLMaverickReadPublicKeyHash() & 1) == 0)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "failed reading PKHash from booted baseband over ETL");
    return 18;
  }
  uint64_t v9 = BBUEURPersonalizationParameters::EURSerialNumber::createFromSerialNumber((BBUEURPersonalizationParameters::EURSerialNumber *)v46, (const unsigned __int8 *)HIDWORD(v35));
  (*(void (**)(uint64_t, void *))(*(void *)a3 + 16))(a3, v9);
  uint64_t v10 = BBUEURPersonalizationParameters::EURChipID::createFromChipID((BBUEURPersonalizationParameters::EURChipID *)v35);
  uint64_t v11 = *(void *)(a3 + 16);
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  *(void *)(a3 + 16) = v10;
  CFIndex v12 = v34;
  long long v13 = operator new(0x10uLL);
  *long long v13 = &unk_26CECE908;
  v13[1] = 0;
  v13[1] = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, v12);
  (*(void (**)(uint64_t, void *))(*(void *)a3 + 24))(a3, v13);
  if (!v9 || !v10) {
    goto LABEL_19;
  }
  unint64_t v14 = *(BBUFeedback **)(a1 + 8);
  (*(void (**)(void **__return_ptr, void *))(*v9 + 24))(__p, v9);
  if (v33 >= 0) {
    uint64_t v15 = __p;
  }
  else {
    uint64_t v15 = (void **)__p[0];
  }
  if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS == -1)
  {
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1) {
      goto LABEL_14;
    }
  }
  else
  {
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global_7);
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1) {
      goto LABEL_14;
    }
  }
  dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_13);
LABEL_14:
  int v16 = BBUpdaterCommon::inRestoreOS(void)::restoreOS;
  int v17 = BBUpdaterCommon::inRestoreOS(void)::recoveryOS;
  int v18 = (*(uint64_t (**)(void *))(*v10 + 24))(v10);
  if (v16 | v17) {
    uint64_t v19 = (const char *)v15;
  }
  else {
    uint64_t v19 = "<< SNUM >>";
  }
  BBUFeedback::handleComment(v14, "   SNUM: 0x%s / CHIPID: 0x%08x", v19, v18);
  if (v33 < 0) {
    operator delete(__p[0]);
  }
LABEL_19:
  uint64_t v20 = *(BBUFeedback **)(a1 + 8);
  (*(void (**)(void **__return_ptr, void *))(*v13 + 24))(__p, v13);
  if (v33 >= 0) {
    size_t v21 = __p;
  }
  else {
    size_t v21 = (void **)__p[0];
  }
  BBUFeedback::handleComment(v20, "   PUBLIC_KEY_HASH: 0x%s", (const char *)v21);
  if (v33 < 0) {
    operator delete(__p[0]);
  }
  size_t v22 = *(BBUFeedback **)(a1 + 8);
  int v23 = (*(uint64_t (**)(void))(**(void **)(a3 + 24) + 24))(*(void *)(a3 + 24));
  BBUFeedback::handleComment(v22, "   CertID: %u", v23);
  BOOL v28 = *(void *)bytes == 0x654619F356EE0ED4
     && *(void *)&bytes[8] == 0x4A726792A3094157
     && (void)v39 == 0x76CB53CD344194E7
     && *((void *)&v39 + 1) == 0x557949403C3D297ELL
     && (void)v40 == 0x32B99FF19458ABCLL
     && *((void *)&v40 + 1) == 0x87AC155035C6AD1FLL;
  long long v29 = *(BBUFeedback **)(a1 + 8);
  if (v28)
  {
    BBUFeedback::handleComment(v29, "   Detected as unfused BB\n");
    int v30 = 1;
  }
  else
  {
    BBUFeedback::handleComment(v29, "   Detected as fused BB\n");
    int v30 = 3;
  }
  uint64_t result = 0;
  *(_DWORD *)(a3 + 88) = v30;
  return result;
}

void sub_21DF855E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, char a20)
{
}

const char *BBUEURInitializer::getDebugName(BBUEURInitializer *this)
{
  return "BBUEURInitializer";
}

uint64_t __cxx_global_var_init_64()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_21DE8A000);
  }
  return result;
}

void BBUICEEBLImage::~BBUICEEBLImage(BBUICEEBLImage *this)
{
  *(void *)this = &unk_26CECF280;
  uint64_t v1 = *((void *)this + 2);
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_26CECF280;
  uint64_t v2 = *((void *)this + 2);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  operator delete(this);
}

uint64_t BBUICEEBLImage::getWritePayloadData(BBUICEEBLImage *this, unsigned __int8 *a2, uint64_t a3, unsigned int a4)
{
  if ((*(unsigned int (**)(BBUICEEBLImage *))(*(void *)this + 32))(this) <= a4)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 82, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Images/ICE/BBUICEEBLImage.cpp", 0x20u, (ctu::LogMessageBuffer *)"Assertion failure(( offset < getWritePayloadLength()) && \"Error: Chunk size is not sufficient to write payload data of the EBL image.\")", v10, v11, v12, v19);
    goto LABEL_8;
  }
  int v20 = -1431655766;
  uint64_t result = (*(uint64_t (**)(void, unsigned __int8 *, uint64_t, int *, void))(**((void **)this + 2) + 16))(*((void *)this + 2), a2, a3, &v20, *((_DWORD *)this + 2) + a4);
  if (result)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 82, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Images/ICE/BBUICEEBLImage.cpp", 0x23u, (ctu::LogMessageBuffer *)"Assertion failure((ret == kBBUReturnSuccess) && \"Failed to copy EBL image payload data to buffer!\")", v13, v14, v15, v19);
    goto LABEL_8;
  }
  if (v20 != a3)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 82, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Images/ICE/BBUICEEBLImage.cpp", 0x24u, (ctu::LogMessageBuffer *)"Assertion failure((amountCopied == amount) && \"Copied data size mismatch: Failed to copy EBL image payload data to buffer!\")", v16, v17, v18, v19);
LABEL_8:
  }
  return result;
}

void sub_21DF858D0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21DF858E4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21DF858F8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

const char *BBUICEEBLImage::getName(BBUICEEBLImage *this)
{
  return "EBL";
}

uint64_t BBUICEEBLImage::getWritePayloadLength(BBUICEEBLImage *this)
{
  uint64_t result = *((void *)this + 2);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 24))();
  }
  return result;
}

uint64_t BBUICEEBLImage::getOpenPayloadData(BBUICEEBLImage *this)
{
  return 0;
}

uint64_t BBUICEEBLImage::getOpenPayloadLength(BBUICEEBLImage *this)
{
  return 0;
}

void BBUICEEBLImage::generateHash(uint64_t a1, unsigned __int8 *a2, int a3)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 16);
    if (v3) {
      BBUDataSource::generateHash(v3, a2, a3);
    }
  }
}

void BBUUpdateSource::~BBUUpdateSource(BBUUpdateSource *this)
{
  *(void *)this = &unk_26CECF2E8;
  uint64_t v2 = *((void *)this + 3);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = *((void *)this + 5);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = *((void *)this + 6);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  uint64_t v5 = *((void *)this + 7);
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  long long v6 = (const void *)*((void *)this + 2);
  if (v6) {
    CFRelease(v6);
  }
}

BBUEUR10UpdateSource *BBUUpdateSource::createFromZipFile(BBUUpdateSource *this, BBUZipFile *a2, BBUFeedback *a3)
{
  char v3 = (char)a3;
  switch(capabilities::updater::getUpdateSourceType(this))
  {
    case 0u:
      long long v6 = (BBUEUR10UpdateSource *)operator new(0x1A0uLL);
      BBUEUR10UpdateSource::BBUEUR10UpdateSource(v6, this, v7, a2);
      goto LABEL_3;
    case 1u:
      uint64_t v9 = (BBUEUR10UpdateSource *)operator new(0x1A0uLL);
      BBUEUR10UpdateSource::BBUEUR10UpdateSource(v9, this, 0, a2);
      *(void *)uint64_t v9 = &unk_26CECE5E0;
      return v9;
    case 2u:
      uint64_t v10 = (BBUEUR10UpdateSource *)operator new(0x1A0uLL);
      BBUEUR10UpdateSource::BBUEUR10UpdateSource(v10, this, 0, a2);
      *(void *)uint64_t v10 = &unk_26CECB0A8;
      return v10;
    case 3u:
      long long v6 = (BBUEUR10UpdateSource *)operator new(0x1B0uLL);
      BBUEUR10UpdateSource::BBUEUR10UpdateSource(v6, this, 0, a2);
      *(void *)long long v6 = &unk_26CECA558;
      *((void *)v6 + 52) = 0;
      *((unsigned char *)v6 + 424) = v3;
      BBUEUR20UpdateSource::init(v6);
      goto LABEL_3;
    case 4u:
      long long v6 = (BBUEUR10UpdateSource *)operator new(0x150uLL);
      BBUICE16UpdateSource::BBUICE16UpdateSource(v6, this, v11, a2);
LABEL_3:
      uint64_t result = v6;
      break;
    case 5u:
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 87, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Updater/Common/BBUUpdateSource.cpp", 0x41u, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unrecognized radio type.\")", v13, v14, v15, v16);
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

void sub_21DF85C50(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21DF85C64(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DF85C78(_Unwind_Exception *a1)
{
  BBUEUR10UpdateSource::~BBUEUR10UpdateSource(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void sub_21DF85C90(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DF85CA4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DF85CB8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DF85CCC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *BBUUpdateSource::createFromFolder(long long *a1, uint64_t a2, char a3)
{
  long long v6 = (capabilities::updater *)ctu::fs::file_exists();
  if (v6)
  {
    switch(capabilities::updater::getUpdateSourceType(v6))
    {
      case 0u:
        unsigned int v7 = operator new(0x1A0uLL);
        BBUEUR10UpdateSource::BBUEUR10UpdateSource((uint64_t)v7, a1, v8, a2);
        return v7;
      case 1u:
        uint64_t v10 = operator new(0x1A0uLL);
        BBUEUR10UpdateSource::BBUEUR10UpdateSource((uint64_t)v10, a1, 0, a2);
        *uint64_t v10 = &unk_26CECE5E0;
        return v10;
      case 2u:
        unsigned int v11 = operator new(0x1A0uLL);
        BBUEUR10UpdateSource::BBUEUR10UpdateSource((uint64_t)v11, a1, 0, a2);
        void *v11 = &unk_26CECB0A8;
        return v11;
      case 3u:
        unsigned int v7 = operator new(0x1B0uLL);
        BBUEUR10UpdateSource::BBUEUR10UpdateSource((uint64_t)v7, a1, 0, a2);
        void *v7 = &unk_26CECA558;
        v7[52] = 0;
        *((unsigned char *)v7 + 424) = a3;
        BBUEUR20UpdateSource::init((BBUEUR20UpdateSource *)v7);
        return v7;
      case 4u:
        unsigned int v7 = operator new(0x150uLL);
        BBUICE16UpdateSource::BBUICE16UpdateSource((BBUICE16UpdateSource *)v7, a1, v12, a2);
        return v7;
      case 5u:
        exception = __cxa_allocate_exception(0x210uLL);
        _BBUException::_BBUException((uint64_t)exception, 87, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Updater/Common/BBUUpdateSource.cpp", 0x5Eu, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unrecognized radio type.\")", v14, v15, v16, v17);
      default:
        return 0;
    }
  }
  return 0;
}

void sub_21DF85EF4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21DF85F08(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DF85F1C(_Unwind_Exception *a1)
{
  BBUEUR10UpdateSource::~BBUEUR10UpdateSource(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void sub_21DF85F34(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DF85F48(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DF85F5C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DF85F70(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void BBUUpdateSource::loadOptions(uint64_t a1, CFDataRef *a2)
{
  if (*(void *)(a1 + 16)) {
    uint64_t v2 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    uint64_t v2 = 0;
  }
  if (!v2)
  {
    CFPropertyListRef v4 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], *a2, 0, 0, 0);
    if (v4)
    {
      CFPropertyListRef v5 = v4;
      CFTypeID v6 = CFGetTypeID(v4);
      if (v6 != CFDictionaryGetTypeID()) {
        CFPropertyListRef v5 = 0;
      }
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0) {
          goto LABEL_11;
        }
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
        {
LABEL_11:
          if ((gBBULogVerbosity & 0x80000000) == 0)
          {
            unsigned int v7 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
            _BBULog(3, 0, v7, "", "Loaded Options\n", v8, v9, v10, v12);
          }
        }
      }
      unsigned int v11 = *(const void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;
      if (v11) {
        CFRelease(v11);
      }
    }
  }
}

uint64_t BBUUpdateSource::prepareRemoteData(uint64_t a1, uint64_t a2, uint64_t a3, char a4, const void *a5, int a6)
{
  CFURLRef v167 = 0;
  CFStringRef v168 = 0;
  v166 = 0;
  if ((capabilities::updater::shouldStripFDRDataOnAP((capabilities::updater *)a1) & 1) == 0)
  {
    v143 = 0;
    CFURLRef value = 0;
    bytes = 0;
    char v12 = 0;
    uint64_t v8 = 0;
    CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    goto LABEL_7;
  }
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "libFDR options setup for the new FDR flow. Note that this setup will be ignored in legacy FDR flow");
  uint64_t v8 = (char *)calloc(1uLL, 0x400uLL);
  if (!v8)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Calloc for datadir path failed");
    bytes = 0;
    unsigned int v11 = 0;
    char v12 = 0;
    uint64_t v8 = 0;
LABEL_52:
    uint64_t v13 = 19;
    goto LABEL_53;
  }
  uint64_t v9 = lookupPathForPersistentData();
  uint64_t v10 = *(BBUFeedback **)(a1 + 8);
  if (v9)
  {
    BBUFeedback::handleComment(v10, "Failed to get datadir path; error = %ld", v9);
    bytes = 0;
    unsigned int v11 = 0;
    char v12 = 0;
LABEL_5:
    uint64_t v13 = 15;
LABEL_53:
    long long v51 = a5;
    goto LABEL_201;
  }
  BBUFeedback::handleComment(v10, "FDR factory data directory: \"%s\" ", v8);
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v168 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v8, 0x8000100u);
  CFURLRef value = CFURLCreateWithFileSystemPath(v14, v168, kCFURLPOSIXPathStyle, 1u);
  CFURLRef v167 = value;
  char v12 = (char *)calloc(1uLL, 0x400uLL);
  if (!v12)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Calloc for apticket path failed");
    bytes = 0;
    unsigned int v11 = 0;
    char v12 = 0;
    goto LABEL_52;
  }
  uint64_t v134 = lookupPathForPersonalizedData();
  if (v134)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed to get apticket path; error = %ld", v134);
    bytes = 0;
    unsigned int v11 = 0;
    goto LABEL_5;
  }
  if (!a5)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Using the APTicket in the FS to create the FDR option");
    v143 = (char *)operator new(0x30uLL);
    *(void *)v143 = &unk_26CECA448;
    *(_OWORD *)(v143 + 8) = 0u;
    *(_OWORD *)(v143 + 24) = 0u;
    std::string::basic_string[abi:ne180100]<0>(v164, v12);
    int v137 = BBUFileDataSource::init((uint64_t)v143, (const char *)v164, 0);
    if (v165 < 0) {
      operator delete((void *)v164[0]);
    }
    if (v137)
    {
      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "APTicket FileDataSource class init failed...");
      bytes = 0;
      uint64_t v13 = 110;
    }
    else
    {
      unsigned int v138 = (*(uint64_t (**)(char *))(*(void *)v143 + 24))(v143);
      v139 = (UInt8 *)malloc(v138);
      if (v139)
      {
        LODWORD(__p[0]) = -1431655766;
        bytes = v139;
        (*(void (**)(char *))(*(void *)v143 + 16))(v143);
        if (v138 == -1431655766)
        {
          v164[0] = CFDataCreateWithBytesNoCopy(v14, bytes, 2863311530, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
          ctu::cf::CFSharedRef<__CFData const>::operator=(&v166, v164);
          BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "MSU based APTicket Raw Path: \"%s\"", v12);
          goto LABEL_184;
        }
        BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Reading of APTicket content failed.");
        uint64_t v13 = 112;
      }
      else
      {
        BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Malloc failed for APTicket content.");
        bytes = 0;
        uint64_t v13 = 111;
      }
    }
    unsigned int v11 = v143;
LABEL_203:
    (*(void (**)(char *))(*(void *)v11 + 8))(v11);
    goto LABEL_204;
  }
  ctu::cf::CFSharedRef<__CFData const>::operator=(&v166, a5);
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Using the APTicket that is passed in as an input to the BBU for the FDR option");
  bytes = 0;
  v143 = 0;
LABEL_184:
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Is performManFlow?: Bool = %d", a6);
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Now, set the options for the libFDR API (either legacy or new API function)");
LABEL_7:
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v14, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v16 = Mutable;
  CFMutableDictionaryRef v163 = Mutable;
  if (Mutable) {
    char v17 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  }
  else {
    char v17 = 0;
  }
  if (v17)
  {
    if (capabilities::updater::shouldStripFDRDataOnAP(Mutable))
    {
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
          goto LABEL_17;
        }
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
          goto LABEL_17;
        }
      }
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        uint64_t v18 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        _BBULog(3, 0, v18, "", "Stripping and verifying Cal FDR Data on AP\n", v19, v20, v21, v140);
      }
LABEL_17:
      if (a6) {
        goto LABEL_23;
      }
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0) {
          goto LABEL_20;
        }
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
        {
LABEL_20:
          if ((gBBULogVerbosity & 0x80000000) == 0)
          {
            size_t v22 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
            _BBULog(3, 0, v22, "", "Not performManifestCheckif (set kAMFDROptionCopyAllowUnsealed = True\n", v23, v24, v25, v140);
          }
        }
      }
      CFDictionaryAddValue(v16, @"CopyAllowUnsealed", (const void *)*MEMORY[0x263EFFB40]);
LABEL_23:
      CFDictionaryAddValue(v16, @"DataDirectory", value);
      CFDictionaryAddValue(v16, @"APTicket", v166);
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
          goto LABEL_32;
        }
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
          goto LABEL_32;
        }
      }
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        uint64_t v26 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        uint64_t v27 = (ctu::cf *)CFDictionaryGetValue(v16, @"CopyAllowUnsealed");
        ctu::cf::show((uint64_t *)v164, v27, v28);
        if (v165 >= 0) {
          unint64_t v32 = v164;
        }
        else {
          LOBYTE(v32) = v164[0];
        }
        _BBULog(3, 0, v26, "", "CAL: Set kAMFDROptionCopyAllowUnsealed: %s\n", v29, v30, v31, (char)v32);
        if (v165 < 0) {
          operator delete((void *)v164[0]);
        }
        if (gBBULogMaskGet(void)::once != -1)
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
            goto LABEL_40;
          }
          goto LABEL_33;
        }
      }
LABEL_32:
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
        goto LABEL_40;
      }
LABEL_33:
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        char v33 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        unsigned int v34 = (ctu::cf *)CFDictionaryGetValue(v16, @"APTicket");
        ctu::cf::show((uint64_t *)v164, v34, v35);
        if (v165 >= 0) {
          long long v39 = v164;
        }
        else {
          LOBYTE(v39) = v164[0];
        }
        _BBULog(3, 0, v33, "", "CAL: Set kAMFDROptionApTicket: %s\n", v36, v37, v38, (char)v39);
        if (v165 < 0) {
          operator delete((void *)v164[0]);
        }
        if (gBBULogMaskGet(void)::once != -1)
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
            goto LABEL_60;
          }
          goto LABEL_41;
        }
      }
LABEL_40:
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
        goto LABEL_60;
      }
LABEL_41:
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        long long v40 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        long long v41 = (ctu::cf *)CFDictionaryGetValue(v16, @"DataDirectory");
        ctu::cf::show((uint64_t *)v164, v41, v42);
        if (v165 >= 0) {
          long long v46 = v164;
        }
        else {
          LOBYTE(v46) = v164[0];
        }
        _BBULog(3, 0, v40, "", "CAL: Set kAMFDROptionDataDirectory: %s\n", v43, v44, v45, (char)v46);
        if (v165 < 0) {
          operator delete((void *)v164[0]);
        }
      }
      goto LABEL_60;
    }
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      {
LABEL_59:
        CFDictionaryAddValue(v16, @"GetCombined", (const void *)*MEMORY[0x263EFFB40]);
        CFDictionaryAddValue(v16, @"VerifyData", (const void *)*MEMORY[0x263EFFB38]);
        goto LABEL_60;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
        goto LABEL_59;
      }
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      uint64_t v52 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      _BBULog(3, 0, v52, "", "Not stripping Cal FDR Data on AP\n", v53, v54, v55, v140);
    }
    goto LABEL_59;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
      goto LABEL_60;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
      goto LABEL_60;
    }
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    uint64_t v47 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(3, 0, v47, "", "Failed to create dictionary for CAL FDR options\n", v48, v49, v50, v140);
  }
LABEL_60:
  v56 = CFDictionaryCreateMutable(v14, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  v57 = v56;
  v162 = v56;
  if (v56) {
    v58 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  }
  else {
    v58 = 0;
  }
  if (v58)
  {
    if (!capabilities::updater::shouldStripFDRDataOnAP(v56))
    {
      v92 = (const void *)*MEMORY[0x263EFFB38];
      CFDictionaryAddValue(v57, @"GetCombined", (const void *)*MEMORY[0x263EFFB38]);
      CFDictionaryAddValue(v57, @"VerifyData", v92);
      CFDictionaryAddValue(v57, @"StripImg4", (const void *)*MEMORY[0x263EFFB40]);
      goto LABEL_104;
    }
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
        goto LABEL_69;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
        goto LABEL_69;
      }
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v59 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      _BBULog(3, 0, v59, "", "Stripping and verifying PROV FDR Data on AP\n", v60, v61, v62, v140);
    }
LABEL_69:
    if (a6) {
      goto LABEL_75;
    }
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0) {
        goto LABEL_72;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
      {
LABEL_72:
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          v63 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
          _BBULog(3, 0, v63, "", "Not performManifestCheckif (set kAMFDROptionCopyAllowUnsealed = True\n", v64, v65, v66, v140);
        }
      }
    }
    CFDictionaryAddValue(v57, @"CopyAllowUnsealed", (const void *)*MEMORY[0x263EFFB40]);
LABEL_75:
    CFDictionaryAddValue(v57, @"DataDirectory", value);
    CFDictionaryAddValue(v57, @"APTicket", v166);
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
        goto LABEL_84;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
        goto LABEL_84;
      }
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v67 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      v68 = (ctu::cf *)CFDictionaryGetValue(v57, @"CopyAllowUnsealed");
      ctu::cf::show((uint64_t *)v164, v68, v69);
      if (v165 >= 0) {
        v73 = v164;
      }
      else {
        LOBYTE(v73) = v164[0];
      }
      _BBULog(3, 0, v67, "", "PROV: Set kAMFDROptionCopyAllowUnsealed: %s\n", v70, v71, v72, (char)v73);
      if (v165 < 0) {
        operator delete((void *)v164[0]);
      }
      if (gBBULogMaskGet(void)::once != -1)
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
          goto LABEL_92;
        }
        goto LABEL_85;
      }
    }
LABEL_84:
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
      goto LABEL_92;
    }
LABEL_85:
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v74 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      v75 = (ctu::cf *)CFDictionaryGetValue(v57, @"APTicket");
      ctu::cf::show((uint64_t *)v164, v75, v76);
      if (v165 >= 0) {
        v80 = v164;
      }
      else {
        LOBYTE(v80) = v164[0];
      }
      _BBULog(3, 0, v74, "", "PROV: Set kAMFDROptionApTicket: %s\n", v77, v78, v79, (char)v80);
      if (v165 < 0) {
        operator delete((void *)v164[0]);
      }
      if (gBBULogMaskGet(void)::once != -1)
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
          goto LABEL_104;
        }
        goto LABEL_93;
      }
    }
LABEL_92:
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
      goto LABEL_104;
    }
LABEL_93:
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v81 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      v82 = (ctu::cf *)CFDictionaryGetValue(v57, @"DataDirectory");
      ctu::cf::show((uint64_t *)v164, v82, v83);
      if (v165 >= 0) {
        v87 = v164;
      }
      else {
        LOBYTE(v87) = v164[0];
      }
      _BBULog(3, 0, v81, "", "PROV: Set kAMFDROptionDataDirectory: %s\n", v84, v85, v86, (char)v87);
      if (v165 < 0) {
        operator delete((void *)v164[0]);
      }
    }
    goto LABEL_104;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
      goto LABEL_104;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
      goto LABEL_104;
    }
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v88 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(3, 0, v88, "", "Failed to create dictionary for PROV FDR options\n", v89, v90, v91, v140);
  }
LABEL_104:
  v93 = CFDictionaryCreateMutable(v14, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  v94 = v93;
  v161 = v93;
  if (v93) {
    v95 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  }
  else {
    v95 = 0;
  }
  if (v95)
  {
    if (capabilities::updater::shouldStripFDRDataOnAP(v93))
    {
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
          goto LABEL_114;
        }
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
          goto LABEL_114;
        }
      }
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v96 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        _BBULog(3, 0, v96, "", "Stripping and verifying Pac FDR Data on AP\n", v97, v98, v99, v140);
      }
LABEL_114:
      if (a6) {
        goto LABEL_120;
      }
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0) {
          goto LABEL_117;
        }
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
        {
LABEL_117:
          if ((gBBULogVerbosity & 0x80000000) == 0)
          {
            v100 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
            _BBULog(3, 0, v100, "", "Not performManifestCheckif (set kAMFDROptionCopyAllowUnsealed = True\n", v101, v102, v103, v140);
          }
        }
      }
      CFDictionaryAddValue(v94, @"CopyAllowUnsealed", (const void *)*MEMORY[0x263EFFB40]);
LABEL_120:
      CFDictionaryAddValue(v94, @"DataDirectory", value);
      CFDictionaryAddValue(v94, @"APTicket", v166);
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
          goto LABEL_129;
        }
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
          goto LABEL_129;
        }
      }
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v104 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        v105 = (ctu::cf *)CFDictionaryGetValue(v94, @"CopyAllowUnsealed");
        ctu::cf::show((uint64_t *)v164, v105, v106);
        if (v165 >= 0) {
          v110 = v164;
        }
        else {
          LOBYTE(v110) = v164[0];
        }
        v93 = (capabilities::updater *)_BBULog(3, 0, v104, "", "PAC: Set kAMFDROptionCopyAllowUnsealed: %s\n", v107, v108, v109, (char)v110);
        if (v165 < 0) {
          operator delete((void *)v164[0]);
        }
        if (gBBULogMaskGet(void)::once != -1)
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
            goto LABEL_137;
          }
          goto LABEL_130;
        }
      }
LABEL_129:
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
        goto LABEL_137;
      }
LABEL_130:
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v111 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        v112 = (ctu::cf *)CFDictionaryGetValue(v94, @"APTicket");
        ctu::cf::show((uint64_t *)v164, v112, v113);
        if (v165 >= 0) {
          v117 = v164;
        }
        else {
          LOBYTE(v117) = v164[0];
        }
        v93 = (capabilities::updater *)_BBULog(3, 0, v111, "", "PAC: Set kAMFDROptionApTicket: %s\n", v114, v115, v116, (char)v117);
        if (v165 < 0) {
          operator delete((void *)v164[0]);
        }
        if (gBBULogMaskGet(void)::once != -1)
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
            goto LABEL_154;
          }
          goto LABEL_138;
        }
      }
LABEL_137:
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
        goto LABEL_154;
      }
LABEL_138:
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v118 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        v119 = (ctu::cf *)CFDictionaryGetValue(v94, @"DataDirectory");
        ctu::cf::show((uint64_t *)v164, v119, v120);
        if (v165 >= 0) {
          v124 = v164;
        }
        else {
          LOBYTE(v124) = v164[0];
        }
        v93 = (capabilities::updater *)_BBULog(3, 0, v118, "", "PAC: Set kAMFDROptionDataDirectory: %s\n", v121, v122, v123, (char)v124);
        if (v165 < 0) {
          operator delete((void *)v164[0]);
        }
      }
      goto LABEL_154;
    }
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      {
LABEL_153:
        CFDictionaryAddValue(v94, @"GetCombined", (const void *)*MEMORY[0x263EFFB40]);
        CFDictionaryAddValue(v94, @"VerifyData", (const void *)*MEMORY[0x263EFFB38]);
        goto LABEL_154;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
        goto LABEL_153;
      }
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v129 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      _BBULog(3, 0, v129, "", "Not stripping FDR Pac Data on AP\n", v130, v131, v132, v140);
    }
    goto LABEL_153;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
      goto LABEL_154;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
      goto LABEL_154;
    }
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v125 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    v93 = (capabilities::updater *)_BBULog(3, 0, v125, "", "Failed to create dictionary for PAC FDR options\n", v126, v127, v128, v140);
  }
LABEL_154:
  if (*(unsigned char *)(a1 + 32))
  {
    uint64_t v13 = 0;
    long long v51 = a5;
    unsigned int v11 = v143;
    if (!v94) {
      goto LABEL_197;
    }
    goto LABEL_196;
  }
  v159 = (void *)(*(unsigned int *)"bbcl" | 0xAAAAAA0000000000);
  long long v160 = xmmword_21DFAE360;
  char v165 = 3;
  LODWORD(v164[0]) = 4997443;
  capabilities::updater::CALFileName((uint64_t *)__p, v93);
  CFTypeRef cf = v16;
  if (v16) {
    CFRetain(v16);
  }
  BYTE1(v140) = a6;
  LOBYTE(v140) = a4;
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void **, const void **, void **, CFTypeRef *, uint64_t, int))(*(void *)a1 + 216))(a1, a1 + 40, a2, &v159, v164, __p, &cf, a3, v140);
  v133 = (capabilities::updater *)cf;
  if (cf) {
    CFRelease(cf);
  }
  if (v158 < 0)
  {
    operator delete(__p[0]);
    if ((v165 & 0x80000000) == 0)
    {
LABEL_163:
      if ((SHIBYTE(v160) & 0x80000000) == 0) {
        goto LABEL_164;
      }
      goto LABEL_171;
    }
  }
  else if ((v165 & 0x80000000) == 0)
  {
    goto LABEL_163;
  }
  operator delete((void *)v164[0]);
  if ((SHIBYTE(v160) & 0x80000000) == 0)
  {
LABEL_164:
    if (v13) {
      goto LABEL_195;
    }
    goto LABEL_172;
  }
LABEL_171:
  operator delete(v159);
  if (v13) {
    goto LABEL_195;
  }
LABEL_172:
  v154 = (void *)(*(unsigned int *)"bbpv" | 0xAAAAAA0000000000);
  long long v155 = xmmword_21DFAE360;
  char v165 = 4;
  strcpy((char *)v164, "PROV");
  capabilities::updater::PROVFileName((uint64_t *)__p, v133);
  CFTypeRef v153 = v57;
  if (v57) {
    CFRetain(v57);
  }
  BYTE1(v141) = a6;
  LOBYTE(v141) = a4;
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void **, const void **, void **, CFTypeRef *, uint64_t, int))(*(void *)a1 + 216))(a1, a1 + 48, a2, &v154, v164, __p, &v153, a3, v141);
  v135 = (capabilities::updater *)v153;
  if (v153) {
    CFRelease(v153);
  }
  if (v158 < 0)
  {
    operator delete(__p[0]);
    if ((v165 & 0x80000000) == 0)
    {
LABEL_178:
      if ((SHIBYTE(v155) & 0x80000000) == 0) {
        goto LABEL_179;
      }
      goto LABEL_187;
    }
  }
  else if ((v165 & 0x80000000) == 0)
  {
    goto LABEL_178;
  }
  operator delete((void *)v164[0]);
  if ((SHIBYTE(v155) & 0x80000000) == 0)
  {
LABEL_179:
    if (v13) {
      goto LABEL_195;
    }
    goto LABEL_188;
  }
LABEL_187:
  operator delete(v154);
  if (v13) {
    goto LABEL_195;
  }
LABEL_188:
  v151 = (void *)(*(unsigned int *)"bbpc" | 0xAAAAAA0000000000);
  long long v152 = xmmword_21DFAE360;
  char v165 = 3;
  LODWORD(v164[0]) = 4407632;
  capabilities::updater::PACFileName((uint64_t *)__p, v135);
  CFTypeRef v150 = v94;
  if (v94) {
    CFRetain(v94);
  }
  BYTE1(v142) = a6;
  LOBYTE(v142) = a4;
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void **, const void **, void **, CFTypeRef *, uint64_t, int))(*(void *)a1 + 216))(a1, a1 + 56, a2, &v151, v164, __p, &v150, a3, v142);
  if (v150) {
    CFRelease(v150);
  }
  if (v158 < 0)
  {
    operator delete(__p[0]);
    if ((v165 & 0x80000000) == 0)
    {
LABEL_194:
      if ((SHIBYTE(v152) & 0x80000000) == 0) {
        goto LABEL_195;
      }
LABEL_224:
      operator delete(v151);
      *(unsigned char *)(a1 + 32) = 1;
      long long v51 = a5;
      unsigned int v11 = v143;
      if (!v94) {
        goto LABEL_197;
      }
      goto LABEL_196;
    }
  }
  else if ((v165 & 0x80000000) == 0)
  {
    goto LABEL_194;
  }
  operator delete((void *)v164[0]);
  if (SHIBYTE(v152) < 0) {
    goto LABEL_224;
  }
LABEL_195:
  *(unsigned char *)(a1 + 32) = 1;
  long long v51 = a5;
  unsigned int v11 = v143;
  if (v94) {
LABEL_196:
  }
    CFRelease(v94);
LABEL_197:
  if (v57) {
    CFRelease(v57);
  }
  if (v163) {
    CFRelease(v163);
  }
LABEL_201:
  if (v51) {
    goto LABEL_206;
  }
  if (v11) {
    goto LABEL_203;
  }
LABEL_204:
  if (bytes) {
    free(bytes);
  }
LABEL_206:
  if (v8) {
    free(v8);
  }
  if (v12) {
    free(v12);
  }
  if (v166) {
    CFRelease(v166);
  }
  if (v167) {
    CFRelease(v167);
  }
  if (v168) {
    CFRelease(v168);
  }
  return v13;
}

void sub_21DF87914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,char a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46)
{
  ctu::cf::CFSharedRef<__CFData const>::~CFSharedRef((const void **)(v46 - 112));
  ctu::cf::CFSharedRef<__CFURL const>::~CFSharedRef((const void **)(v46 - 104));
  ctu::cf::CFSharedRef<__CFString const>::~CFSharedRef((const void **)(v46 - 96));
  _Unwind_Resume(a1);
}

const void **ctu::cf::CFSharedRef<__CFData const>::operator=(const void **a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  CFPropertyListRef v4 = *a1;
  *a1 = cf;
  if (v4) {
    CFRelease(v4);
  }
  return a1;
}

uint64_t BBUUpdateSource::findRemoteData(BBUFeedback **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, const std::string::value_type *a6, const void **a7, uint64_t a8, unsigned __int8 a9, char a10)
{
  memset(__p, 170, 24);
  pthread_mutex_lock(&ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance);
  uint64_t v16 = (BBUPartitionManager *)off_26AA89B50;
  if (!off_26AA89B50)
  {
    char v17 = (BBUPartitionManager *)operator new(0x18uLL);
    BBUPartitionManager::BBUPartitionManager(v17);
    uint64_t v18 = a8;
    uint64_t v19 = operator new(0x20uLL);
    *uint64_t v19 = &unk_26CECF498;
    v19[1] = 0;
    v19[2] = 0;
    v19[3] = v17;
    uint64_t v20 = (std::__shared_weak_count *)off_26AA89B58;
    off_26AA89B50 = v17;
    off_26AA89B58 = v19;
    if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
    uint64_t v16 = (BBUPartitionManager *)off_26AA89B50;
    a8 = v18;
  }
  uint64_t v21 = (std::__shared_weak_count *)off_26AA89B58;
  uint64_t v62 = v16;
  v63 = off_26AA89B58;
  if (off_26AA89B58) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)off_26AA89B58 + 1, 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance);
  BBUPartitionManager::getBBUFSPath(v16, &v64);
  int v22 = a6[23];
  if (v22 >= 0) {
    uint64_t v23 = a6;
  }
  else {
    uint64_t v23 = *(const std::string::value_type **)a6;
  }
  if (v22 >= 0) {
    std::string::size_type v24 = *((unsigned __int8 *)a6 + 23);
  }
  else {
    std::string::size_type v24 = *((void *)a6 + 1);
  }
  uint64_t v25 = std::string::append(&v64, v23, v24);
  long long v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  __p[2] = (void *)v25->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v64.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v64.__r_.__value_.__l.__data_);
  }
  if (v21 && !atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
  }
  int v27 = (*((uint64_t (**)(BBUFeedback **, uint64_t, void **, uint64_t *))*a1 + 28))(a1, a2, __p, a5);
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
      goto LABEL_30;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
      goto LABEL_30;
    }
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    BOOL v28 = (const char *)(*(uint64_t (**)(BBUFeedback **))*a1)(a1);
    if (a6[23] >= 0) {
      LOBYTE(v32) = (_BYTE)a6;
    }
    else {
      unint64_t v32 = *(const std::string::value_type **)a6;
    }
    char v33 = "not found";
    if (!v27) {
      char v33 = "located";
    }
    unsigned int v34 = __p;
    if (SHIBYTE(__p[2]) < 0) {
      unsigned int v34 = (void **)__p[0];
    }
    v56 = v33;
    v57 = v34;
    _BBULog(3, 0, v28, "", "%s:  %s at %s", v29, v30, v31, (char)v32);
    if (gBBULogMaskGet(void)::once != -1)
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
        goto LABEL_33;
      }
      goto LABEL_31;
    }
  }
LABEL_30:
  if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
    goto LABEL_33;
  }
LABEL_31:
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    char v35 = (const char *)(*(uint64_t (**)(BBUFeedback **))*a1)(a1);
    _BBULog(3, 0, v35, "", "\n", v36, v37, v38, v55);
  }
LABEL_33:
  if (SHIBYTE(__p[2]) < 0)
  {
    operator delete(__p[0]);
    uint64_t v39 = gBBULogMaskGet(void)::once;
    if (v27)
    {
LABEL_35:
      if (v39 == -1)
      {
        long long v40 = a7;
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
          goto LABEL_42;
        }
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        long long v40 = a7;
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
          goto LABEL_42;
        }
      }
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        long long v41 = (const char *)(*(uint64_t (**)(BBUFeedback **))*a1)(a1);
        if (*((char *)a5 + 23) >= 0) {
          LOBYTE(v45) = (_BYTE)a5;
        }
        else {
          uint64_t v45 = *a5;
        }
        _BBULog(3, 0, v41, "", "%s:  searching in FDR\n", v42, v43, v44, v45);
      }
LABEL_42:
      if (*(char *)(a4 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v61, *(const std::string::value_type **)a4, *(void *)(a4 + 8));
        uint64_t v46 = *v40;
        CFTypeRef cf = v46;
        if (!v46) {
          goto LABEL_55;
        }
      }
      else
      {
        std::string v61 = *(std::string *)a4;
        uint64_t v46 = *v40;
        CFTypeRef cf = v46;
        if (!v46)
        {
LABEL_55:
          LOBYTE(v55) = a10;
          uint64_t v47 = (*((uint64_t (**)(BBUFeedback **, uint64_t, uint64_t, std::string *, uint64_t *, CFTypeRef *, uint64_t, void, int, const char *, void **))*a1
                 + 29))(a1, a2, a3, &v61, a5, &cf, a8, a9, v55, v56, v57);
          if (cf) {
            CFRelease(cf);
          }
          if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(v61.__r_.__value_.__l.__data_);
            if (v47) {
              goto LABEL_59;
            }
          }
          else if (v47)
          {
LABEL_59:
            if (*((char *)a5 + 23) >= 0) {
              uint64_t v53 = (const char *)a5;
            }
            else {
              uint64_t v53 = (const char *)*a5;
            }
            BBUFeedback::handleComment(a1[1], "%s:  not found in FDR\n", v53);
            return v47;
          }
          if (gBBULogMaskGet(void)::once != -1) {
            goto LABEL_66;
          }
LABEL_47:
          uint64_t v47 = 0;
          if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
            return v47;
          }
          goto LABEL_48;
        }
      }
      CFRetain(v46);
      goto LABEL_55;
    }
  }
  else
  {
    uint64_t v39 = gBBULogMaskGet(void)::once;
    if (v27) {
      goto LABEL_35;
    }
  }
  if (v39 == -1) {
    goto LABEL_47;
  }
LABEL_66:
  dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  uint64_t v47 = 0;
  if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
    return v47;
  }
LABEL_48:
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    uint64_t v48 = (const char *)(*(uint64_t (**)(BBUFeedback **))*a1)(a1);
    if (a6[23] >= 0) {
      LOBYTE(v52) = (_BYTE)a6;
    }
    else {
      uint64_t v52 = *(const std::string::value_type **)a6;
    }
    _BBULog(3, 0, v48, "", "Loaded %s (%p)\n", v49, v50, v51, (char)v52);
    return 0;
  }
  return v47;
}

void sub_21DF881B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)v34, v34[1]);
  operator delete(v34);
  pthread_mutex_unlock(&ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t BBUUpdateSource::createImageFromFDR(BBUFeedback **a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, const void **a6, uint64_t a7, int a8, unsigned __int8 a9)
{
  CFTypeRef v90 = 0;
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v88, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string v88 = *(std::string *)a3;
  }
  if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v92, v88.__r_.__value_.__l.__data_, v88.__r_.__value_.__l.__size_);
  }
  else {
    std::string v92 = v88;
  }
  uint64_t v91 = 0;
  if (SHIBYTE(v92.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v93, v92.__r_.__value_.__l.__data_, v92.__r_.__value_.__l.__size_);
  }
  else {
    std::string v93 = v92;
  }
  uint64_t v78 = a2;
  v94 = 0;
  if (ctu::cf::convert_copy()) {
    uint64_t v16 = v94;
  }
  else {
    uint64_t v16 = 0;
  }
  if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v93.__r_.__value_.__l.__data_);
    uint64_t v89 = v16;
    if ((SHIBYTE(v92.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_15:
      if ((SHIBYTE(v88.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_16;
      }
LABEL_20:
      operator delete(v88.__r_.__value_.__l.__data_);
      if ((a4[23] & 0x80000000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v89 = v16;
    if ((SHIBYTE(v92.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_15;
    }
  }
  operator delete(v92.__r_.__value_.__l.__data_);
  if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_20;
  }
LABEL_16:
  if ((a4[23] & 0x80000000) == 0)
  {
LABEL_17:
    std::string v86 = *(std::string *)a4;
    goto LABEL_22;
  }
LABEL_21:
  std::string::__init_copy_ctor_external(&v86, *(const std::string::value_type **)a4, *((void *)a4 + 1));
LABEL_22:
  if (SHIBYTE(v86.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v92, v86.__r_.__value_.__l.__data_, v86.__r_.__value_.__l.__size_);
  }
  else {
    std::string v92 = v86;
  }
  uint64_t v91 = 0;
  if (SHIBYTE(v92.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v93, v92.__r_.__value_.__l.__data_, v92.__r_.__value_.__l.__size_);
  }
  else {
    std::string v93 = v92;
  }
  v94 = 0;
  if (ctu::cf::convert_copy()) {
    char v17 = (ctu::cf *)v94;
  }
  else {
    char v17 = 0;
  }
  if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v93.__r_.__value_.__l.__data_);
    v87 = v17;
    if ((SHIBYTE(v92.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_33:
      uint64_t v77 = a7;
      if ((SHIBYTE(v86.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_34;
      }
      goto LABEL_110;
    }
  }
  else
  {
    v87 = v17;
    if ((SHIBYTE(v92.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_33;
    }
  }
  operator delete(v92.__r_.__value_.__l.__data_);
  uint64_t v77 = a7;
  if ((SHIBYTE(v86.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_34:
    v92.__r_.__value_.__r.__words[0] = 0;
    uint64_t v18 = a1[1];
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS == -1) {
      goto LABEL_35;
    }
LABEL_111:
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global_7);
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1) {
      goto LABEL_36;
    }
    goto LABEL_112;
  }
LABEL_110:
  operator delete(v86.__r_.__value_.__l.__data_);
  v92.__r_.__value_.__r.__words[0] = 0;
  uint64_t v18 = a1[1];
  if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS != -1) {
    goto LABEL_111;
  }
LABEL_35:
  if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1) {
    goto LABEL_36;
  }
LABEL_112:
  dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_13);
LABEL_36:
  BBUFeedback::handleComment(v18, "In restoreOS?: Bool = %d", (BBUpdaterCommon::inRestoreOS(void)::restoreOS | BBUpdaterCommon::inRestoreOS(void)::recoveryOS) != 0);
  BBUFeedback::handleComment(a1[1], "Is performManCheckFlow?: Bool = %d", a9);
  BBUFeedback::handleComment(a1[1], "IsBBFused? Bool = %d", a8);
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
      goto LABEL_42;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
      goto LABEL_42;
    }
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    uint64_t v20 = (const char *)(*(uint64_t (**)(BBUFeedback **))*a1)(a1);
    LOBYTE(v24) = (_BYTE)a4;
    if (a4[23] < 0) {
      std::string::size_type v24 = *(uint64_t **)a4;
    }
    _BBULog(3, 0, v20, "", "Identifier: %s\n", v21, v22, v23, (char)v24);
  }
LABEL_42:
  uint64_t v25 = a1[1];
  ctu::cf::show((uint64_t *)&v93, v17, v19);
  if ((v93.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    long long v26 = &v93;
  }
  else {
    long long v26 = (std::string *)v93.__r_.__value_.__r.__words[0];
  }
  BBUFeedback::handleComment(v25, "ClassIdentifier with show(): %s\n", (const char *)v26);
  if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v93.__r_.__value_.__l.__data_);
  }
  if (capabilities::updater::shouldStripFDRDataOnAP(v27))
  {
    BBUFeedback::handleComment(a1[1], "Using the new FDR flow");
    CFTypeRef v85 = v17;
    if (v17) {
      CFRetain(v17);
    }
    CFTypeRef v84 = v16;
    if (v16) {
      CFRetain(v16);
    }
    unint64_t v32 = *a6;
    CFTypeRef cf = v32;
    if (v32) {
      CFRetain(v32);
    }
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS == -1)
    {
      if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1) {
        goto LABEL_56;
      }
    }
    else
    {
      dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global_7);
      if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1) {
        goto LABEL_56;
      }
    }
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_13);
LABEL_56:
    int v33 = BBUFDRUtilities::validateAndCopy((capabilities::radio *)&v85, &v84, &v90, (uint64_t *)&cf, (ctu::cf **)&v92, (BBUpdaterCommon::inRestoreOS(void)::restoreOS | BBUpdaterCommon::inRestoreOS(void)::recoveryOS) != 0);
    if (cf) {
      CFRelease(cf);
    }
    if (v84) {
      CFRelease(v84);
    }
    if (v85) {
      CFRelease(v85);
    }
    unsigned int v34 = a1[1];
    if (!v33)
    {
      BBUFeedback::handleComment(v34, "FDR data pull and validation is successful for %s");
      goto LABEL_120;
    }
    if (*(char *)(a5 + 23) >= 0) {
      char v35 = (const char *)a5;
    }
    else {
      char v35 = *(const char **)a5;
    }
    BBUFeedback::handleComment(v34, "Analyze the FDR failure for %s", v35);
    uint64_t v36 = a1[1];
    ctu::cf::show((uint64_t *)&v93, (ctu::cf *)v92.__r_.__value_.__l.__data_, v37);
    if ((v93.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v38 = &v93;
    }
    else {
      uint64_t v38 = (std::string *)v93.__r_.__value_.__r.__words[0];
    }
    BBUFeedback::handleComment(v36, "FDR failure we hit is: %s \n", (const char *)v38);
    if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v93.__r_.__value_.__l.__data_);
      uint64_t v39 = a1[1];
      long long v40 = a4;
      if ((a4[23] & 0x80000000) == 0) {
        goto LABEL_71;
      }
    }
    else
    {
      uint64_t v39 = a1[1];
      long long v40 = a4;
      if ((a4[23] & 0x80000000) == 0) {
        goto LABEL_71;
      }
    }
    long long v40 = *(const char **)a4;
LABEL_71:
    BBUFeedback::handleComment(v39, "Identifier: %s\n", v40);
    LOBYTE(v94) = 0;
    LOBYTE(v91) = 0;
    int v41 = (*((uint64_t (**)(BBUFeedback **, uint64_t, void **, uint64_t *))*a1 + 31))(a1, v77, &v94, &v91);
    BBUFeedback::handleComment(a1[1], "Return code for the root manifest CAL/FATP_CAL entitlements check is: %d", v41);
    uint64_t v42 = a1[1];
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS == -1)
    {
      if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1) {
        goto LABEL_73;
      }
    }
    else
    {
      dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global_7);
      if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1) {
        goto LABEL_73;
      }
    }
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_13);
LABEL_73:
    BBUFeedback::handleComment(v42, "In restoreOS?: Bool = %d", (BBUpdaterCommon::inRestoreOS(void)::restoreOS | BBUpdaterCommon::inRestoreOS(void)::recoveryOS) != 0);
    BBUFeedback::handleComment(a1[1], "Calibration enabled flag: %d", v94);
    BBUFeedback::handleComment(a1[1], "FATPCalibration enabled flag: %d", v91);
    uint64_t v43 = a1[1];
    uint64_t v44 = a4;
    if (a4[23] < 0) {
      uint64_t v44 = *(const char **)a4;
    }
    int v45 = strncmp(v44, "bbcl", 5uLL);
    BBUFeedback::handleComment(v43, "bbcl string check: %d", v45 == 0);
    uint64_t v46 = a1[1];
    uint64_t v47 = a4;
    if (a4[23] < 0) {
      uint64_t v47 = *(const char **)a4;
    }
    int v48 = strncmp(v47, "bbpc", 5uLL);
    BBUFeedback::handleComment(v46, "bbpc string check: %d", v48 == 0);
    uint64_t v49 = a1[1];
    ctu::cf::show((uint64_t *)&v93, v17, v50);
    if ((v93.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v51 = &v93;
    }
    else {
      uint64_t v51 = (std::string *)v93.__r_.__value_.__r.__words[0];
    }
    BBUFeedback::handleComment(v49, "ClassIdentifier in error: %s\n", (const char *)v51);
    if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v93.__r_.__value_.__l.__data_);
    }
    uint64_t v53 = a1[1];
    ctu::cf::show((uint64_t *)&v93, v17, v52);
    if ((v93.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v54 = &v93;
    }
    else {
      uint64_t v54 = (std::string *)v93.__r_.__value_.__r.__words[0];
    }
    int v55 = strncmp((const char *)v54, "bbcl", 5uLL);
    BBUFeedback::handleComment(v53, "ClassIdentifier bbcl string check: %d", v55 == 0);
    if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v93.__r_.__value_.__l.__data_);
    }
    v57 = a1[1];
    ctu::cf::show((uint64_t *)&v93, v17, v56);
    if ((v93.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v58 = &v93;
    }
    else {
      v58 = (std::string *)v93.__r_.__value_.__r.__words[0];
    }
    int v59 = strncmp((const char *)v58, "bbpc", 5uLL);
    BBUFeedback::handleComment(v57, "ClassIdentifier bbpc string check: %d", v59 == 0);
    if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v93.__r_.__value_.__l.__data_);
      if (a8)
      {
LABEL_92:
        isErrorImageNotFound = (BBUpdaterCommon *)BBUFDRUtilities::isErrorImageNotFound((BBUFDRUtilities *)v92.__r_.__value_.__l.__data_, v60);
        if (isErrorImageNotFound)
        {
          v63 = "Image NOT found in FDR, so ignore all errors coming from the AMFDR and depend on BB to fail if necassary";
LABEL_118:
          uint64_t v66 = a1[1];
LABEL_119:
          BBUFeedback::handleComment(v66, v63);
          goto LABEL_120;
        }
        if ((a9 & 1) == 0 && (_BYTE)v94)
        {
          v73 = a4;
          if (a4[23] < 0) {
            v73 = *(const char **)a4;
          }
          isErrorImageNotFound = (BBUpdaterCommon *)strncmp(v73, "bbcl", 5uLL);
          if (!isErrorImageNotFound) {
            goto LABEL_152;
          }
        }
        if ((a9 & 1) == 0 && (_BYTE)v91)
        {
          if (a4[23] < 0) {
            a4 = *(const char **)a4;
          }
          isErrorImageNotFound = (BBUpdaterCommon *)strncmp(a4, "bbpc", 5uLL);
          if (!isErrorImageNotFound)
          {
LABEL_152:
            v63 = "CALIB enabled for CAL file, so ignore all errors coming from the AMFDR";
            goto LABEL_118;
          }
        }
        if (a9 && v92.__r_.__value_.__r.__words[0])
        {
          v74 = "Fatal error 1 in FDR data validation/decode";
LABEL_151:
          uint64_t v66 = a1[1];
          goto LABEL_161;
        }
        if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS == -1)
        {
          if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1) {
            goto LABEL_155;
          }
        }
        else
        {
          dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global_7);
          if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
          {
LABEL_155:
            if (!(BBUpdaterCommon::inRestoreOS(void)::restoreOS | BBUpdaterCommon::inRestoreOS(void)::recoveryOS)) {
              goto LABEL_158;
            }
LABEL_156:
            if ((a9 & 1) == 0)
            {
              isErrorImageNotFound = (BBUpdaterCommon *)BBUFDRUtilities::isTrustErrorAcceptable((BBUFDRUtilities *)v92.__r_.__value_.__l.__data_, v62);
              if (!isErrorImageNotFound)
              {
                v74 = "Fatal error 2 in FDR data validation/decode";
                goto LABEL_151;
              }
            }
LABEL_158:
            BOOL v75 = BBUpdaterCommon::inRestoreOS(isErrorImageNotFound);
            uint64_t v66 = a1[1];
            v63 = "libFDR errors (if any) coming from the API can be ignored";
            if (v75 || !v92.__r_.__value_.__r.__words[0]) {
              goto LABEL_119;
            }
            v74 = "Fatal error 3 in FDR data validation/decode";
LABEL_161:
            BBUFeedback::handleComment(v66, v74);
            uint64_t v67 = 119;
            goto LABEL_129;
          }
        }
        dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_13);
        if (!(BBUpdaterCommon::inRestoreOS(void)::restoreOS | BBUpdaterCommon::inRestoreOS(void)::recoveryOS)) {
          goto LABEL_158;
        }
        goto LABEL_156;
      }
    }
    else if (a8)
    {
      goto LABEL_92;
    }
    v63 = "BB is NOT fused, so ignore all errors coming from the AMFDR";
    goto LABEL_118;
  }
  CFTypeRef v82 = v17;
  if (v17) {
    CFRetain(v17);
  }
  CFTypeRef v81 = v16;
  if (v16) {
    CFRetain(v16);
  }
  std::string v64 = *a6;
  CFTypeRef v80 = v64;
  if (v64) {
    CFRetain(v64);
  }
  int v65 = BBUFDRUtilities::copy((CFStringRef *)&v82, (CFStringRef *)&v81, &v90, &v80, v28, v29, v30, v31);
  if (v80) {
    CFRelease(v80);
  }
  if (v81) {
    CFRelease(v81);
  }
  if (v82) {
    CFRelease(v82);
  }
  if (v65) {
    BBUFeedback::handleComment(a1[1], "first pass - could not find data in FDR for %s");
  }
LABEL_120:
  CFTypeRef v79 = v90;
  if (v90) {
    CFRetain(v90);
  }
  uint64_t v67 = (*((uint64_t (**)(BBUFeedback **, uint64_t, uint64_t, CFTypeRef *))*a1 + 30))(a1, v78, a5, &v79);
  if (v79) {
    CFRelease(v79);
  }
  if (v67)
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
        goto LABEL_129;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
        goto LABEL_129;
      }
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v68 = (const char *)(*(uint64_t (**)(BBUFeedback **))*a1)(a1);
      _BBULog(3, 0, v68, "", "failed creating image from fdr data\n", v69, v70, v71, v76);
    }
  }
LABEL_129:
  if (v92.__r_.__value_.__r.__words[0]) {
    CFRelease(v92.__r_.__value_.__l.__data_);
  }
  if (v17) {
    CFRelease(v17);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v90) {
    CFRelease(v90);
  }
  return v67;
}

void sub_21DF88E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, int a15, __int16 a16, char a17, char a18, int a19, __int16 a20,char a21,char a22,int a23,__int16 a24,char a25,char a26,int a27,__int16 a28,char a29,char a30,int a31,__int16 a32,char a33,char a34,int a35,__int16 a36,char a37,char a38,void *__p,uint64_t a40,int a41,__int16 a42,char a43,char a44,const void *a45,void *a46,uint64_t a47,int a48,__int16 a49,char a50,char a51,const void *a52,const void *a53,__int16 a54,char a55,char a56)
{
  if (*(char *)(v56 - 105) < 0) {
    operator delete(*(void **)(v56 - 128));
  }
  ctu::cf::CFSharedRef<__CFString const>::~CFSharedRef(&a45);
  ctu::cf::CFSharedRef<__CFString const>::~CFSharedRef(&a52);
  ctu::cf::CFSharedRef<__CFData const>::~CFSharedRef(&a53);
  _Unwind_Resume(a1);
}

uint64_t BBUUpdateSource::createImageFromFile(uint64_t (***a1)(void), BBUICENVMImage **a2, const char *a3, char *a4)
{
  v8.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v8.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&__dst.st_blksize = v8;
  *(timespec *)__dst.st_qspare = v8;
  __dst.st_birthtimespec = v8;
  *(timespec *)&__dst.st_size = v8;
  __dst.st_mtimespec = v8;
  __dst.st_ctimespec = v8;
  *(timespec *)&__dst.st_uid = v8;
  __dst.st_atimespec = v8;
  *(timespec *)&__dst.st_dev = v8;
  if (a3[23] >= 0) {
    uint64_t v9 = a3;
  }
  else {
    uint64_t v9 = *(const char **)a3;
  }
  uint64_t v10 = (capabilities::radio *)stat(v9, &__dst);
  if (!v10)
  {
    int v17 = capabilities::radio::vendor(v10);
    if (v17 == 2)
    {
      uint64_t v23 = (char *)operator new(0x30uLL);
      *(void *)uint64_t v23 = &unk_26CECA448;
      *(_OWORD *)(v23 + 8) = 0u;
      *(_OWORD *)(v23 + 24) = 0u;
      std::string::size_type v24 = (capabilities::radio *)BBUFileDataSource::init((uint64_t)v23, a3, 0);
      if (!v24)
      {
LABEL_29:
        int v27 = capabilities::radio::vendor(v24);
        if (v27 == 2)
        {
          memset(&__dst, 0, 24);
          int v33 = a4[23];
          if (v33 >= 0) {
            unint64_t v34 = a4[23];
          }
          else {
            unint64_t v34 = *((void *)a4 + 1);
          }
          if (v33 < 0) {
            a4 = *(char **)a4;
          }
          if (v34 >= 3) {
            size_t v35 = 3;
          }
          else {
            size_t v35 = v34;
          }
          uint64_t v36 = (capabilities::updater *)memcmp(a4, "CAL", v35);
          if (v36 || v34 != 3)
          {
            if (v34 >= 4) {
              size_t v41 = 4;
            }
            else {
              size_t v41 = v34;
            }
            uint64_t v42 = (capabilities::updater *)memcmp(a4, "PROV", v41);
            if (v42 || v34 != 4)
            {
              uint64_t v47 = (capabilities::updater *)memcmp(a4, "PAC", v35);
              if (v47 || v34 != 3)
              {
                exception = __cxa_allocate_exception(0x210uLL);
                _BBUException::_BBUException((uint64_t)exception, 2, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Updater/Common/BBUUpdateSource.cpp", 0x32Fu, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unrecognized BBUEUR Remote Data fileName.\")", v65, v66, v67, v68);
              }
              capabilities::updater::PACFileName((uint64_t *)&v69, v47);
            }
            else
            {
              capabilities::updater::PROVFileName((uint64_t *)&v69, v42);
            }
          }
          else
          {
            capabilities::updater::CALFileName((uint64_t *)&v69, v36);
          }
          *(_OWORD *)&__dst.st_dev = v69;
          *(void *)&__dst.st_uid = v70;
          int v48 = (BBUICENVMImage *)operator new(0x38uLL);
          uint64_t v49 = v48;
          int st_gid_high = SHIBYTE(__dst.st_gid);
          uint64_t v51 = *(void **)&__dst.st_dev;
          if ((__dst.st_gid & 0x80000000) == 0) {
            p_dst = &__dst;
          }
          else {
            p_dst = *(stat **)&__dst.st_dev;
          }
          BBUICENVMImage::BBUICENVMImage(v48, (BBUDataSource *)v23, (const char *)p_dst, 0);
          *a2 = v49;
          if ((st_gid_high & 0x80000000) == 0)
          {
LABEL_76:
            if (*a2) {
              return 0;
            }
            if (gBBULogMaskGet(void)::once == -1)
            {
              if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0) {
                goto LABEL_80;
              }
            }
            else
            {
              dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
              if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
              {
LABEL_80:
                if ((gBBULogVerbosity & 0x80000000) == 0)
                {
                  uint64_t v53 = (const char *)(**a1)(a1);
                  _BBULog(3, 0, v53, "", "failed creating BBUImage from data source\n", v54, v55, v56, v68);
                }
              }
            }
            (*(void (**)(char *))(*(void *)v23 + 8))(v23);
            return 19;
          }
          uint64_t v46 = v51;
LABEL_75:
          operator delete(v46);
          goto LABEL_76;
        }
        if (v27 == 1)
        {
          uint64_t v28 = (BBUEURMIImage *)operator new(0x58uLL);
          if (a4[23] >= 0) {
            uint64_t v29 = a4;
          }
          else {
            uint64_t v29 = *(const char **)a4;
          }
          size_t v30 = strlen(v29);
          if (v30 > 0x7FFFFFFFFFFFFFF7) {
            std::string::__throw_length_error[abi:ne180100]();
          }
          size_t v31 = v30;
          if (v30 >= 0x17)
          {
            uint64_t v43 = (v30 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v30 | 7) != 0x17) {
              uint64_t v43 = v30 | 7;
            }
            uint64_t v44 = v43 + 1;
            unint64_t v32 = (long long *)operator new(v43 + 1);
            *((void *)&v71 + 1) = v31;
            unint64_t v72 = v44 | 0x8000000000000000;
            *(void *)&long long v71 = v32;
          }
          else
          {
            HIBYTE(v72) = v30;
            unint64_t v32 = &v71;
            if (!v30) {
              goto LABEL_64;
            }
          }
          memmove(v32, v29, v31);
LABEL_64:
          *((unsigned char *)v32 + v31) = 0;
          BBUEURMIImage::BBUEURMIImage(v28, (BBUDataSource *)v23, 0);
          *(void *)uint64_t v28 = &unk_26CECAC80;
          *((void *)v28 + 8) = 0;
          *((void *)v28 + 9) = 0;
          *((void *)v28 + 10) = 0;
          if ((SHIBYTE(v72) & 0x80000000) == 0)
          {
            uint64_t result = 0;
            *((_OWORD *)v28 + 4) = v71;
            *((void *)v28 + 10) = v72;
            *a2 = v28;
            return result;
          }
          int v45 = (void *)v71;
          std::string::__assign_no_alias<true>((void *)v28 + 8, (void *)v71, *((size_t *)&v71 + 1));
          *a2 = v28;
          uint64_t v46 = v45;
          goto LABEL_75;
        }
        v57 = __cxa_allocate_exception(0x210uLL);
        _BBUException::_BBUException((uint64_t)v57, 11, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Updater/Common/BBUUpdateSource.cpp", 0x338u, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unrecognized radio vendor.\")", v61, v62, v63, v68);
LABEL_94:
      }
      (*(void (**)(char *))(*(void *)v23 + 8))(v23);
LABEL_50:
      if (gBBULogMaskGet(void)::once == -1)
      {
        uint64_t result = 19;
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
          return result;
        }
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        uint64_t result = 19;
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
          return result;
        }
      }
      if (gBBULogVerbosity < 0) {
        return result;
      }
      uint64_t v37 = (const char *)(**a1)(a1);
      _BBULog(3, 0, v37, "", "could not create data source from file\n", v38, v39, v40, v68);
      return 19;
    }
    if (v17 != 1)
    {
      v57 = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)v57, 11, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Updater/Common/BBUUpdateSource.cpp", 0x306u, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unrecognized radio vendor.\")", v58, v59, v60, v68);
      goto LABEL_94;
    }
    int ImageIDFromImageName = BBUEUR10UpdateSource::getImageIDFromImageName((const void **)a4);
    if (a3[23] >= 0) {
      uint64_t v19 = a3;
    }
    else {
      uint64_t v19 = *(const char **)a3;
    }
    size_t v20 = strlen(v19);
    if (v20 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    __darwin_ino64_t v21 = v20;
    if (v20 >= 0x17)
    {
      uint64_t v25 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v20 | 7) != 0x17) {
        uint64_t v25 = v20 | 7;
      }
      uint64_t v26 = v25 + 1;
      uint64_t v22 = operator new(v25 + 1);
      __dst.st_ino = v21;
      *(void *)&__dst.st_uid = v26 | 0x8000000000000000;
      *(void *)&__dst.st_dev = v22;
    }
    else
    {
      HIBYTE(__dst.st_gid) = v20;
      uint64_t v22 = &__dst;
      if (!v20)
      {
LABEL_27:
        v22[v21] = 0;
        std::string::size_type v24 = BBUDataSource::createFromEurekaMIFile((uint64_t)&__dst, 0, ImageIDFromImageName);
        uint64_t v23 = (char *)v24;
        if (SHIBYTE(__dst.st_gid) < 0)
        {
          operator delete(*(void **)&__dst.st_dev);
          if (v23) {
            goto LABEL_29;
          }
        }
        else if (v24)
        {
          goto LABEL_29;
        }
        goto LABEL_50;
      }
    }
    memmove(v22, v19, v21);
    goto LABEL_27;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    uint64_t result = 15;
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
      return result;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    uint64_t result = 15;
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
      return result;
    }
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    char v12 = (const char *)(**a1)(a1);
    if (a3[23] >= 0) {
      LOBYTE(v16) = (_BYTE)a3;
    }
    else {
      uint64_t v16 = *(const char **)a3;
    }
    _BBULog(3, 0, v12, "", "could not locate %s\n", v13, v14, v15, (char)v16);
    return 15;
  }
  return result;
}

void sub_21DF897C8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21DF897E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (*((char *)v26 + 87) < 0) {
    operator delete(*v25);
  }
  *uint64_t v26 = &unk_26CECEAE8;
  uint64_t v28 = v26[1];
  if (v28) {
    (*(void (**)(uint64_t))(*(void *)v28 + 8))(v28);
  }
  operator delete(__p);
  operator delete(v26);
  _Unwind_Resume(a1);
}

uint64_t BBUUpdateSource::createImageFromData(capabilities::radio *a1, BBUICENVMImage **a2, const void **a3, BBUDataSource **a4)
{
  int v8 = capabilities::radio::vendor(a1);
  if (v8 != 1)
  {
    if (v8 != 2)
    {
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 11, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Updater/Common/BBUUpdateSource.cpp", 0x365u, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unrecognized radio vendor.\")", v48, v49, v50, v58);
      goto LABEL_72;
    }
    uint64_t v9 = *a4;
    uint64_t v10 = (BBUDataSource *)operator new(0x18uLL);
    unsigned int v11 = v10;
    *((_DWORD *)v10 + 4) = 0;
    *(void *)uint64_t v10 = &unk_26CECE780;
    *((void *)v10 + 1) = v9;
    if (v9) {
      uint64_t v10 = (BBUDataSource *)CFRetain(v9);
    }
LABEL_6:
    int v13 = capabilities::radio::vendor(v10);
    if (v13 == 2)
    {
      long long v61 = 0uLL;
      uint64_t v62 = 0;
      int v19 = *((char *)a3 + 23);
      if (v19 >= 0) {
        unint64_t v20 = *((unsigned __int8 *)a3 + 23);
      }
      else {
        unint64_t v20 = (unint64_t)a3[1];
      }
      if (v19 >= 0) {
        __darwin_ino64_t v21 = a3;
      }
      else {
        __darwin_ino64_t v21 = *a3;
      }
      if (v20 >= 3) {
        size_t v22 = 3;
      }
      else {
        size_t v22 = v20;
      }
      uint64_t v23 = (capabilities::updater *)memcmp(v21, "CAL", v22);
      if (v23) {
        BOOL v24 = 0;
      }
      else {
        BOOL v24 = v20 == 3;
      }
      if (v24)
      {
        capabilities::updater::CALFileName((uint64_t *)&v59, v23);
      }
      else
      {
        if (v20 >= 4) {
          size_t v25 = 4;
        }
        else {
          size_t v25 = v20;
        }
        uint64_t v26 = (capabilities::updater *)memcmp(v21, "PROV", v25);
        if (v26) {
          BOOL v27 = 0;
        }
        else {
          BOOL v27 = v20 == 4;
        }
        if (v27)
        {
          capabilities::updater::PROVFileName((uint64_t *)&v59, v26);
        }
        else
        {
          uint64_t v28 = (capabilities::updater *)memcmp(v21, "PAC", v22);
          if (v28 || v20 != 3)
          {
            uint64_t v54 = __cxa_allocate_exception(0x210uLL);
            _BBUException::_BBUException((uint64_t)v54, 2, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Updater/Common/BBUUpdateSource.cpp", 0x38Du, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unrecognized BBUICE Remote Data fileName.\")", v55, v56, v57, v58);
          }
          capabilities::updater::PACFileName((uint64_t *)&v59, v28);
        }
      }
      long long v61 = v59;
      uint64_t v62 = v60;
      uint64_t v38 = (BBUICENVMImage *)operator new(0x38uLL);
      uint64_t v39 = v38;
      int v40 = SHIBYTE(v62);
      size_t v41 = (void *)v61;
      if (v62 >= 0) {
        uint64_t v42 = (const char *)&v61;
      }
      else {
        uint64_t v42 = (const char *)v61;
      }
      BBUICENVMImage::BBUICENVMImage(v38, v11, v42, 0);
      *a2 = v39;
      if ((v40 & 0x80000000) == 0)
      {
        if (!*a2) {
          goto LABEL_59;
        }
        return 0;
      }
      uint64_t v37 = v41;
LABEL_58:
      operator delete(v37);
      if (!*a2)
      {
LABEL_59:
        if (gBBULogMaskGet(void)::once == -1)
        {
          if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0) {
            goto LABEL_61;
          }
        }
        else
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
          {
LABEL_61:
            if ((gBBULogVerbosity & 0x80000000) == 0)
            {
              uint64_t v43 = (const char *)(**(uint64_t (***)(capabilities::radio *))a1)(a1);
              _BBULog(3, 0, v43, "", "failed creating BBUImage from data source\n", v44, v45, v46, v58);
            }
          }
        }
        (*(void (**)(BBUDataSource *))(*(void *)v11 + 8))(v11);
        return 19;
      }
      return 0;
    }
    if (v13 == 1)
    {
      uint64_t v14 = (BBUEURMIImage *)operator new(0x58uLL);
      if (*((char *)a3 + 23) >= 0) {
        uint64_t v15 = (const char *)a3;
      }
      else {
        uint64_t v15 = (const char *)*a3;
      }
      size_t v16 = strlen(v15);
      if (v16 >= 0x7FFFFFFFFFFFFFF8) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      size_t v17 = v16;
      if (v16 >= 0x17)
      {
        uint64_t v29 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17) {
          uint64_t v29 = v16 | 7;
        }
        uint64_t v30 = v29 + 1;
        p_dst = (long long *)operator new(v29 + 1);
        *((void *)&__dst + 1) = v17;
        unint64_t v64 = v30 | 0x8000000000000000;
        *(void *)&long long __dst = p_dst;
      }
      else
      {
        HIBYTE(v64) = v16;
        p_dst = &__dst;
        if (!v16) {
          goto LABEL_43;
        }
      }
      memmove(p_dst, v15, v17);
LABEL_43:
      *((unsigned char *)p_dst + v17) = 0;
      BBUEURMIImage::BBUEURMIImage(v14, v11, 0);
      *(void *)uint64_t v14 = &unk_26CECAC80;
      *((void *)v14 + 8) = 0;
      *((void *)v14 + 9) = 0;
      *((void *)v14 + 10) = 0;
      if ((SHIBYTE(v64) & 0x80000000) == 0)
      {
        uint64_t result = 0;
        *((_OWORD *)v14 + 4) = __dst;
        *((void *)v14 + 10) = v64;
        *a2 = v14;
        return result;
      }
      uint64_t v36 = (void *)__dst;
      std::string::__assign_no_alias<true>((void *)v14 + 8, (void *)__dst, *((size_t *)&__dst + 1));
      *a2 = v14;
      uint64_t v37 = v36;
      goto LABEL_58;
    }
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 11, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Updater/Common/BBUUpdateSource.cpp", 0x396u, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unrecognized radio vendor.\")", v51, v52, v53, v58);
LABEL_72:
  }
  int ImageIDFromImageName = BBUEUR10UpdateSource::getImageIDFromImageName(a3);
  uint64_t v10 = (BBUDataSource *)BBUDataSource::createFromEurekaMIData(*a4, 0, ImageIDFromImageName);
  unsigned int v11 = v10;
  if (v10) {
    goto LABEL_6;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    uint64_t result = 19;
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
      return result;
    }
    goto LABEL_47;
  }
  dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  uint64_t result = 19;
  if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
  {
LABEL_47:
    if (gBBULogVerbosity < 0) {
      return result;
    }
    unint64_t v32 = (const char *)(**(uint64_t (***)(capabilities::radio *))a1)(a1);
    _BBULog(3, 0, v32, "", "failed creating data source from FDR data\n", v33, v34, v35, v58);
    return 19;
  }
  return result;
}

void sub_21DF89E0C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21DF89E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (*((char *)v24 + 87) < 0) {
    operator delete(*v25);
  }
  *BOOL v24 = &unk_26CECEAE8;
  uint64_t v27 = v24[1];
  if (v27) {
    (*(void (**)(uint64_t))(*(void *)v27 + 8))(v27);
  }
  operator delete(__p);
  operator delete(v24);
  _Unwind_Resume(a1);
}

uint64_t BBUUpdateSource::getCalibrationEntitlements(BBUFeedback **this, BBUDataSource *a2, BOOL *a3, BOOL *a4)
{
  *a3 = 0;
  *a4 = 0;
  if (!a2) {
    return 118;
  }
  uint64_t v8 = (*(uint64_t (**)(BBUDataSource *))(*(void *)a2 + 24))(a2);
  uint64_t v9 = malloc(v8);
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  }
  int v10 = (gBBULogVerbosity >= 0) & (*(unsigned __int8 *)gBBULogMaskGet(void)::sBBULogMask >> 3);
  if (!v9)
  {
    if (v10)
    {
      unint64_t v32 = (const char *)(*(uint64_t (**)(BBUFeedback **))*this)(this);
      _BBULog(3, 0, v32, "", "BBTicket malloc for DER decode failed \n", v33, v34, v35, v55);
    }
    int v26 = 0;
    int v24 = 0;
    *(void *)&long long v36 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v63 = v36;
    long long v64 = v36;
    long long v61 = v36;
    long long v62 = v36;
    long long v59 = v36;
    long long v60 = v36;
    uint64_t v25 = 113;
    goto LABEL_30;
  }
  if (v10
    && (unsigned int v11 = (const char *)(*(uint64_t (**)(BBUFeedback **))*this)(this),
        _BBULog(3, 0, v11, "", "Get root manifest content from file into memory\n", v12, v13, v14, v55),
        gBBULogMaskGet(void)::once != -1))
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
  {
    goto LABEL_10;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    uint64_t v15 = (const char *)(*(uint64_t (**)(BBUFeedback **))*this)(this);
    _BBULog(3, 0, v15, "", "Root manifest size: %d \n", v16, v17, v18, v8);
  }
LABEL_10:
  LODWORD(v57) = -1431655766;
  (*(void (**)(BBUDataSource *, void *, uint64_t, long long *, void))(*(void *)a2 + 16))(a2, v9, v8, &v57, 0);
  if (v57 != v8)
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0) {
        goto LABEL_27;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
      {
LABEL_27:
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          uint64_t v37 = (const char *)(*(uint64_t (**)(BBUFeedback **))*this)(this);
          _BBULog(3, 0, v37, "", "BBTicket read content failed\n", v38, v39, v40, v55);
        }
      }
    }
    int v26 = 0;
    int v24 = 0;
    *(void *)&long long v36 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v63 = v36;
    long long v64 = v36;
    long long v61 = v36;
    long long v62 = v36;
    long long v59 = v36;
    long long v60 = v36;
    uint64_t v25 = 114;
LABEL_30:
    long long v57 = v36;
    long long v58 = v36;
    goto LABEL_31;
  }
  *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v63 = v19;
  long long v64 = v19;
  long long v61 = v19;
  long long v62 = v19;
  long long v59 = v19;
  long long v60 = v19;
  long long v57 = v19;
  long long v58 = v19;
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
      goto LABEL_15;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
      goto LABEL_15;
    }
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    unint64_t v20 = (const char *)(*(uint64_t (**)(BBUFeedback **))*this)(this);
    _BBULog(3, 0, v20, "", "Now DERDecode the root manifest to get the calibration enabled flag\n", v21, v22, v23, v55);
  }
LABEL_15:
  if (DERDecodeBBTicket((uint64_t)v9, v8, (unint64_t)&v57))
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    int v24 = 0;
    uint64_t v25 = 115;
    int v26 = 1;
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    {
      uint64_t v27 = (const char *)(*(uint64_t (**)(BBUFeedback **))*this)(this);
      size_t v31 = "RootManifest decode error during FDR data parsing\n";
LABEL_71:
      _BBULog(3, 0, v27, "", v31, v28, v29, v30, v55);
      int v24 = 0;
    }
  }
  else
  {
    memset(v67, 170, 32);
    unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v66 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
    int v26 = DERDecodeSeqInit((uint64_t)&v60, &v67[1], &v67[2]);
    if (v26)
    {
LABEL_67:
      *a3 = 0;
      if (gBBULogMaskGet(void)::once == -1)
      {
        int v24 = 0;
        uint64_t v25 = 116;
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
          goto LABEL_31;
        }
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        int v24 = 0;
        uint64_t v25 = 116;
        if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0) {
          goto LABEL_31;
        }
      }
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        uint64_t v27 = (const char *)(*(uint64_t (**)(BBUFeedback **))*this)(this);
        size_t v31 = "RootManifest decode error during CalibEnable FDR data parsing\n";
        goto LABEL_71;
      }
    }
    else
    {
      char v52 = 0;
      while (1)
      {
        int v53 = DERDecodeSeqNext(&v67[2], &v65);
        if (v53) {
          break;
        }
        if (v65 == 0x80000000000000D4)
        {
          if (v67[0] != 4) {
            goto LABEL_66;
          }
          char v52 = 0;
          if (*v66)
          {
            if (*v66 != 1)
            {
LABEL_66:
              int v26 = 3;
              goto LABEL_67;
            }
            char v52 = 1;
          }
        }
      }
      int v26 = v53;
      if (v53 != 1) {
        goto LABEL_67;
      }
      int v26 = 0;
      uint64_t v25 = 0;
      *a3 = v52 & 1;
      int v24 = 1;
    }
  }
LABEL_31:
  if (*a3) {
    size_t v41 = "TRUE";
  }
  else {
    size_t v41 = "FALSE";
  }
  BBUFeedback::handleComment(this[1], "Calibration enabled flag: %s", v41);
  if (!v24) {
    goto LABEL_51;
  }
  memset(v67, 170, 32);
  unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v66 = (unsigned char *)0xAAAAAAAAAAAAAAAALL;
  if (DERDecodeSeqInit((uint64_t)&v60, &v67[1], &v67[2])) {
    goto LABEL_46;
  }
  char v42 = 0;
  while (1)
  {
    int v43 = DERDecodeSeqNext(&v67[2], &v65);
    if (v43) {
      break;
    }
    if (v65 == 0x80000000000001C2)
    {
      if (v67[0] != 4) {
        goto LABEL_46;
      }
      char v42 = 0;
      if (*v66)
      {
        if (*v66 != 1) {
          goto LABEL_46;
        }
        char v42 = 1;
      }
    }
  }
  if (v43 != 1)
  {
LABEL_46:
    *a4 = 0;
    uint64_t v44 = &unk_26AA8F000;
LABEL_47:
    if (gBBULogMaskGet(void)::once == -1)
    {
      uint64_t v45 = (unsigned char *)v44[405];
      uint64_t v25 = 117;
      if ((*v45 & 8) == 0) {
        goto LABEL_51;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      uint64_t v54 = (unsigned char *)v44[405];
      uint64_t v25 = 117;
      if ((*v54 & 8) == 0) {
        goto LABEL_51;
      }
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      uint64_t v46 = (const char *)(*(uint64_t (**)(BBUFeedback **))*this)(this);
      _BBULog(3, 0, v46, "", "RootManifest decode error during FATPCalibEnable FDR data parsing\n", v47, v48, v49, v56);
    }
    goto LABEL_51;
  }
  *a4 = v42 & 1;
  uint64_t v44 = (void *)&unk_26AA8F000;
  if (v26) {
    goto LABEL_47;
  }
  uint64_t v25 = 0;
LABEL_51:
  if (*a4) {
    uint64_t v50 = "TRUE";
  }
  else {
    uint64_t v50 = "FALSE";
  }
  BBUFeedback::handleComment(this[1], "FATPCalibration enabled flag: %s", v50);
  free(v9);
  return v25;
}

uint64_t __cxx_global_var_init_26()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUPartitionManager>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance, &dword_21DE8A000);
  }
  return result;
}

void *unzOpen2(uint64_t a1, _OWORD *a2)
{
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __src[19] = v3;
  __src[20] = v3;
  __src[17] = v3;
  __src[18] = v3;
  __src[15] = v3;
  __src[16] = v3;
  __src[13] = v3;
  __src[14] = v3;
  __src[11] = v3;
  __src[12] = v3;
  __src[9] = v3;
  __src[10] = v3;
  __src[8] = v3;
  __src[6] = v3;
  __src[7] = v3;
  __src[4] = v3;
  __src[5] = v3;
  __src[2] = v3;
  __src[3] = v3;
  __src[0] = v3;
  __src[1] = v3;
  if (a2)
  {
    long long v4 = a2[1];
    __src[0] = *a2;
    __src[1] = v4;
    long long v5 = a2[3];
    __src[2] = a2[2];
    __src[3] = v5;
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t, uint64_t))&__src[0])(*((void *)&v5 + 1), a1, 5);
  }
  else
  {
    fill_fopen_filefunc((FILE *(**)(int, char *, char))__src);
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t, uint64_t))&__src[0])(*((void *)&__src[3] + 1), a1, 5);
  }
  unsigned int v7 = (void *)v6;
  *(void *)&__src[4] = v6;
  if (v6)
  {
    if (!(*(uint64_t (**)(void, uint64_t, void, uint64_t))&__src[2])(*((void *)&__src[3] + 1), v6, 0, 2))
    {
      unint64_t v8 = (*((uint64_t (**)(void, void *))&__src[1] + 1))(*((void *)&__src[3] + 1), v7);
      unint64_t v9 = v8;
      unint64_t v10 = v8 >= 0xFFFF ? 0xFFFFLL : v8;
      unsigned int v11 = (char *)malloc(0x404uLL);
      if (v11)
      {
        uint64_t v12 = v11;
        if (v10 >= 5)
        {
          uint64_t v13 = v11 + 1;
          uint64_t v14 = 4;
          do
          {
            unint64_t v15 = v14 + 1024;
            unint64_t v16 = v14 + 1024 >= v10 ? v10 : v14 + 1024;
            unint64_t v17 = v16 >= 0x404 ? 1028 : v16;
            if ((*(uint64_t (**)(void, void *, unint64_t, void))&__src[2])(*((void *)&__src[3] + 1), v7, v9 - v16, 0)|| (*((uint64_t (**)(void, void *, unsigned char *, unint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), v7, v12, v17) != v17)
            {
              break;
            }
            if (v17 >= 4)
            {
              uint64_t v18 = (v17 - 4);
              while (v12[v18] != 80 || v13[v18] != 75 || v13[v18 + 1] != 5 || v13[v18 + 2] != 6)
              {
                if (v18-- <= 0) {
                  goto LABEL_12;
                }
              }
              if (v9 - v16 + v18)
              {
                free(v12);
                int v20 = 0;
                unint64_t v21 = v14 + 1024;
                if (v9 < v14 + 1024) {
                  unint64_t v21 = v9;
                }
                if (v21 >= 0xFFFF) {
                  unint64_t v21 = 0xFFFFLL;
                }
                unint64_t v22 = v9 - v21 + v18;
                goto LABEL_36;
              }
            }
LABEL_12:
            uint64_t v14 = v16;
          }
          while (v10 > v15);
        }
        free(v12);
      }
    }
    unint64_t v22 = 0;
    int v20 = -1;
LABEL_36:
    uint64_t v23 = -1431655766;
    unint64_t v24 = 0xFFFFFFAAAAAAAA00;
    uint64_t v52 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v25 = (*(uint64_t (**)(void, void, unint64_t, void))&__src[2])(*((void *)&__src[3] + 1), *(void *)&__src[4], v22, 0);
    int Long = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], &v52);
    if (v25) {
      BOOL v27 = 0;
    }
    else {
      BOOL v27 = Long == 0;
    }
    if (v27) {
      int v28 = v20;
    }
    else {
      int v28 = -1;
    }
    uint64_t v29 = *(void *)&__src[4];
    v54[0] = -86;
    if ((*((unsigned int (**)(void, void, unsigned char *, uint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[4], v54, 1) == 1)
    {
      uint64_t v30 = v54[0];
      unint64_t v31 = (unint64_t)v54[0] << 8;
    }
    else
    {
      uint64_t v30 = -1431655766;
      unint64_t v31 = 0xFFFFFFAAAAAAAA00;
      if ((*(unsigned int (**)(void, uint64_t))&__src[3])(*((void *)&__src[3] + 1), v29)) {
        goto LABEL_48;
      }
    }
    v54[0] = -86;
    if ((*((unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), v29, v54, 1) == 1)
    {
      unint64_t v31 = (unint64_t)v54[0] << 8;
LABEL_49:
      unint64_t v32 = v31 + v30;
LABEL_50:
      uint64_t v33 = *(void *)&__src[4];
      v54[0] = -86;
      unint64_t v51 = v32;
      if ((*((unsigned int (**)(void, void, unsigned char *, uint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[4], v54, 1) == 1)
      {
        uint64_t v34 = v54[0];
        unint64_t v35 = (unint64_t)v54[0] << 8;
      }
      else
      {
        uint64_t v34 = -1431655766;
        unint64_t v35 = 0xFFFFFFAAAAAAAA00;
        if ((*(unsigned int (**)(void, uint64_t))&__src[3])(*((void *)&__src[3] + 1), v33)) {
          goto LABEL_56;
        }
      }
      v54[0] = -86;
      if ((*((unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), v33, v54, 1) == 1)
      {
        unint64_t v35 = (unint64_t)v54[0] << 8;
LABEL_57:
        unint64_t v36 = v35 + v34;
LABEL_58:
        uint64_t v37 = *(void *)&__src[4];
        v54[0] = -86;
        if ((*((unsigned int (**)(void, void, unsigned char *, uint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[4], v54, 1) == 1)
        {
          uint64_t v38 = v54[0];
          unint64_t v39 = (unint64_t)v54[0] << 8;
        }
        else
        {
          uint64_t v38 = -1431655766;
          unint64_t v39 = 0xFFFFFFAAAAAAAA00;
          if ((*(unsigned int (**)(void, uint64_t))&__src[3])(*((void *)&__src[3] + 1), v37)) {
            goto LABEL_64;
          }
        }
        v54[0] = -86;
        if ((*((unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), v37, v54, 1) == 1)
        {
          unint64_t v39 = (unint64_t)v54[0] << 8;
LABEL_65:
          unint64_t v40 = v39 + v38;
LABEL_66:
          *((void *)&__src[4] + 1) = v40;
          uint64_t v41 = *(void *)&__src[4];
          v54[0] = -86;
          if ((*((unsigned int (**)(void, void, unsigned char *, uint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[4], v54, 1) == 1)
          {
            uint64_t v42 = v54[0];
            unint64_t v43 = (unint64_t)v54[0] << 8;
          }
          else
          {
            uint64_t v42 = -1431655766;
            unint64_t v43 = 0xFFFFFFAAAAAAAA00;
            if ((*(unsigned int (**)(void, uint64_t))&__src[3])(*((void *)&__src[3] + 1), v41)) {
              goto LABEL_72;
            }
          }
          v54[0] = -86;
          if ((*((unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), v41, v54, 1) == 1)
          {
            unint64_t v43 = (unint64_t)v54[0] << 8;
LABEL_73:
            unint64_t v44 = v43 + v42;
LABEL_74:
            uint64_t v45 = *((void *)&__src[4] + 1);
            int v46 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], (uint64_t *)&__src[8]);
            int v47 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], (uint64_t *)&__src[8] + 1);
            uint64_t v48 = *(void *)&__src[4];
            v54[0] = -86;
            if ((*((unsigned int (**)(void, void, unsigned char *, uint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[4], v54, 1) == 1)
            {
              uint64_t v23 = v54[0];
              unint64_t v24 = (unint64_t)v54[0] << 8;
            }
            else if ((*(unsigned int (**)(void, uint64_t))&__src[3])(*((void *)&__src[3] + 1), v48))
            {
              goto LABEL_80;
            }
            v54[0] = -86;
            if ((*((unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), v48, v54, 1) == 1)
            {
              unint64_t v24 = (unint64_t)v54[0] << 8;
LABEL_82:
              *(void *)&__src[5] = v24 + v23;
              if (v22 >= *(void *)&__src[8] + *((void *)&__src[8] + 1)
                && !v47
                && !v46
                && v44 == v45
                && !v36
                && !v51
                && !v28)
              {
                *((void *)&__src[5] + 1) = v22 - (*(void *)&__src[8] + *((void *)&__src[8] + 1));
                *((void *)&__src[7] + 1) = v22;
                *(void *)&__src[18] = 0;
                DWORD2(__src[18]) = 0;
                unsigned int v7 = malloc(0x150uLL);
                memcpy(v7, __src, 0x150uLL);
                uint64_t v49 = v7[17];
                v7[12] = 0;
                v7[13] = v49;
                v7[14] = unzlocal_GetCurrentFileInfoInternal((uint64_t)v7, (uint64_t)(v7 + 18), v7 + 35, 0, 0, 0, 0, 0, 0) == 0;
                return v7;
              }
              goto LABEL_81;
            }
            if (!(*(unsigned int (**)(void, uint64_t))&__src[3])(*((void *)&__src[3] + 1), v48)) {
              goto LABEL_82;
            }
LABEL_80:
            *(void *)&__src[5] = 0;
LABEL_81:
            (*((void (**)(void, void))&__src[2] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[4]);
            return 0;
          }
          if (!(*(unsigned int (**)(void, uint64_t))&__src[3])(*((void *)&__src[3] + 1), v41)) {
            goto LABEL_73;
          }
LABEL_72:
          unint64_t v44 = 0;
          int v28 = -1;
          goto LABEL_74;
        }
        if (!(*(unsigned int (**)(void, uint64_t))&__src[3])(*((void *)&__src[3] + 1), v37)) {
          goto LABEL_65;
        }
LABEL_64:
        unint64_t v40 = 0;
        int v28 = -1;
        goto LABEL_66;
      }
      if (!(*(unsigned int (**)(void, uint64_t))&__src[3])(*((void *)&__src[3] + 1), v33)) {
        goto LABEL_57;
      }
LABEL_56:
      unint64_t v36 = 0;
      int v28 = -1;
      goto LABEL_58;
    }
    if (!(*(unsigned int (**)(void, uint64_t))&__src[3])(*((void *)&__src[3] + 1), v29)) {
      goto LABEL_49;
    }
LABEL_48:
    unint64_t v32 = 0;
    int v28 = -1;
    goto LABEL_50;
  }
  return v7;
}

uint64_t unzlocal_getLong(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unsigned __int8 v13 = -86;
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), a2, &v13, 1) == 1)
  {
    uint64_t v6 = v13;
    int v7 = v13;
  }
  else
  {
    if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), a2)) {
      goto LABEL_16;
    }
    int v7 = -1431655766;
    uint64_t v6 = -1431655766;
  }
  unsigned __int8 v14 = -86;
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), a2, &v14, 1) == 1)
  {
    uint64_t v8 = v14;
    int v7 = v14;
  }
  else
  {
    if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), a2)) {
      goto LABEL_16;
    }
    uint64_t v8 = v7;
  }
  unsigned __int8 v15 = -86;
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), a2, &v15, 1) == 1)
  {
    uint64_t v9 = v15;
    int v7 = v15;
  }
  else
  {
    if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), a2)) {
      goto LABEL_16;
    }
    uint64_t v9 = v7;
  }
  unsigned __int8 v16 = -86;
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), a2, &v16, 1) == 1)
  {
    uint64_t v10 = v16;
LABEL_18:
    uint64_t result = 0;
    uint64_t v11 = v6 + (v8 << 8) + (v9 << 16) + (v10 << 24);
    goto LABEL_19;
  }
  if (!(*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), a2))
  {
    uint64_t v10 = v7;
    goto LABEL_18;
  }
LABEL_16:
  uint64_t v11 = 0;
  uint64_t result = 0xFFFFFFFFLL;
LABEL_19:
  *a3 = v11;
  return result;
}

uint64_t unzlocal_GetCurrentFileInfoInternal(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9)
{
  uint64_t v82 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v83 = 0xAAAAAAAAAAAAAAAALL;
  if (!a1) {
    return 4294967194;
  }
  if ((*(uint64_t (**)(void, void, void, void))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 88) + *(void *)(a1 + 104), 0)|| unzlocal_getLong(a1, *(void *)(a1 + 64), &v82))
  {
    int v15 = -1;
  }
  else if (v82 == 33639248)
  {
    int v15 = 0;
  }
  else
  {
    int v15 = -103;
  }
  uint64_t v81 = a8;
  unint64_t v79 = 0xFFFFFFAAAAAAAA00;
  LOBYTE(v84) = -86;
  uint64_t v16 = *(void *)(a1 + 64);
  if ((*(unsigned int (**)(void, uint64_t, long long *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v16, &v84, 1) == 1)
  {
    uint64_t v17 = v84;
    unint64_t v18 = (unint64_t)v84 << 8;
  }
  else
  {
    uint64_t v17 = -1431655766;
    unint64_t v18 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v16)) {
      goto LABEL_12;
    }
  }
  LOBYTE(v84) = -86;
  if ((*(unsigned int (**)(void, uint64_t, long long *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v16, &v84, 1) != 1)
  {
    if (!(*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v16)) {
      goto LABEL_13;
    }
LABEL_12:
    unint64_t v20 = 0;
    int v15 = -1;
    goto LABEL_14;
  }
  unint64_t v18 = (unint64_t)v84 << 8;
LABEL_13:
  unint64_t v20 = v18 + v17;
LABEL_14:
  unint64_t v92 = 0xAAAAAAAAAAAAAAAALL;
  v21.i64[0] = 0xAAAAAAAAAAAAAAAALL;
  v21.i64[1] = 0xAAAAAAAAAAAAAAAALL;
  int8x16_t v91 = v21;
  int8x16_t v90 = v21;
  int8x16_t v89 = v21;
  int8x16_t v88 = v21;
  int8x16_t v87 = v21;
  int8x16_t v86 = v21;
  int8x16_t v85 = v21;
  *(void *)&long long v84 = v20;
  v93[0] = -86;
  uint64_t v22 = *(void *)(a1 + 64);
  if ((*(unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v22, v93, 1) == 1)
  {
    uint64_t v23 = v93[0];
    unint64_t v24 = (unint64_t)v93[0] << 8;
  }
  else
  {
    uint64_t v23 = -1431655766;
    unint64_t v24 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v22)) {
      goto LABEL_20;
    }
  }
  v93[0] = -86;
  if ((*(unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v22, v93, 1) != 1)
  {
    if (!(*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v22)) {
      goto LABEL_21;
    }
LABEL_20:
    unint64_t v25 = 0;
    int v15 = -1;
    goto LABEL_22;
  }
  unint64_t v24 = (unint64_t)v93[0] << 8;
LABEL_21:
  unint64_t v25 = v24 + v23;
LABEL_22:
  *((void *)&v84 + 1) = v25;
  v93[0] = -86;
  uint64_t v26 = *(void *)(a1 + 64);
  if ((*(unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v26, v93, 1) == 1)
  {
    uint64_t v27 = v93[0];
    unint64_t v28 = (unint64_t)v93[0] << 8;
  }
  else
  {
    uint64_t v27 = -1431655766;
    unint64_t v28 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v26)) {
      goto LABEL_28;
    }
  }
  v93[0] = -86;
  if ((*(unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v26, v93, 1) != 1)
  {
    if (!(*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v26)) {
      goto LABEL_29;
    }
LABEL_28:
    unint64_t v29 = 0;
    int v15 = -1;
    goto LABEL_30;
  }
  unint64_t v28 = (unint64_t)v93[0] << 8;
LABEL_29:
  unint64_t v29 = v28 + v27;
LABEL_30:
  v85.i64[0] = v29;
  v93[0] = -86;
  uint64_t v30 = *(void *)(a1 + 64);
  if ((*(unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v30, v93, 1) == 1)
  {
    uint64_t v31 = v93[0];
    unint64_t v32 = (unint64_t)v93[0] << 8;
  }
  else
  {
    uint64_t v31 = -1431655766;
    unint64_t v32 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v30)) {
      goto LABEL_36;
    }
  }
  v93[0] = -86;
  if ((*(unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v30, v93, 1) != 1)
  {
    if (!(*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v30)) {
      goto LABEL_37;
    }
LABEL_36:
    uint64_t v33 = -1431655766;
    unint64_t v34 = 0;
    int v15 = -1;
    goto LABEL_38;
  }
  unint64_t v32 = (unint64_t)v93[0] << 8;
LABEL_37:
  uint64_t v33 = -1431655766;
  unint64_t v34 = v32 + v31;
LABEL_38:
  v85.i64[1] = v34;
  int Long = unzlocal_getLong(a1, *(void *)(a1 + 64), v86.i64);
  LODWORD(v92) = (((unsigned __int32)v86.i32[0] >> 21) & 0xF) - 1;
  HIDWORD(v92) = ((unsigned __int32)v86.i32[0] >> 25) + 1980;
  v36.i32[0] = v86.i32[0];
  int8x16_t v37 = (int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v86.u32[0]), (uint32x4_t)xmmword_21DFAE3A0);
  v37.i32[0] = vshlq_u32(v36, (uint32x4_t)xmmword_21DFAE390).u32[0];
  int8x16_t v91 = vandq_s8(v37, (int8x16_t)xmmword_21DFAE3B0);
  int v38 = unzlocal_getLong(a1, *(void *)(a1 + 64), &v86.i64[1]);
  int v39 = unzlocal_getLong(a1, *(void *)(a1 + 64), v87.i64);
  if (unzlocal_getLong(a1, *(void *)(a1 + 64), &v87.i64[1]) | v39 | v38 | Long) {
    unsigned int v40 = -1;
  }
  else {
    unsigned int v40 = v15;
  }
  v93[0] = -86;
  uint64_t v41 = *(void *)(a1 + 64);
  if ((*(unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v41, v93, 1) == 1)
  {
    uint64_t v42 = v93[0];
    unint64_t v43 = (unint64_t)v93[0] << 8;
  }
  else
  {
    uint64_t v42 = -1431655766;
    unint64_t v43 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v41)) {
      goto LABEL_47;
    }
  }
  v93[0] = -86;
  if ((*(unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v41, v93, 1) != 1)
  {
    if (!(*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v41)) {
      goto LABEL_48;
    }
LABEL_47:
    unint64_t v44 = 0;
    unsigned int v40 = -1;
    goto LABEL_49;
  }
  unint64_t v43 = (unint64_t)v93[0] << 8;
LABEL_48:
  unint64_t v44 = v43 + v42;
LABEL_49:
  v88.i64[0] = v44;
  v93[0] = -86;
  uint64_t v45 = *(void *)(a1 + 64);
  if ((*(unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v45, v93, 1) == 1)
  {
    uint64_t v46 = v93[0];
    unint64_t v47 = (unint64_t)v93[0] << 8;
  }
  else
  {
    uint64_t v46 = -1431655766;
    unint64_t v47 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v45)) {
      goto LABEL_55;
    }
  }
  v93[0] = -86;
  if ((*(unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v45, v93, 1) != 1)
  {
    if (!(*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v45)) {
      goto LABEL_56;
    }
LABEL_55:
    unint64_t v48 = 0;
    unsigned int v40 = -1;
    goto LABEL_57;
  }
  unint64_t v47 = (unint64_t)v93[0] << 8;
LABEL_56:
  unint64_t v48 = v47 + v46;
LABEL_57:
  v88.i64[1] = v48;
  v93[0] = -86;
  uint64_t v49 = *(void *)(a1 + 64);
  if ((*(unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v49, v93, 1) == 1)
  {
    uint64_t v50 = v93[0];
    unint64_t v51 = (unint64_t)v93[0] << 8;
  }
  else
  {
    uint64_t v50 = -1431655766;
    unint64_t v51 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v49)) {
      goto LABEL_63;
    }
  }
  v93[0] = -86;
  if ((*(unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v49, v93, 1) != 1)
  {
    if (!(*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v49)) {
      goto LABEL_64;
    }
LABEL_63:
    unint64_t v52 = 0;
    unsigned int v40 = -1;
    goto LABEL_65;
  }
  unint64_t v51 = (unint64_t)v93[0] << 8;
LABEL_64:
  unint64_t v52 = v51 + v50;
LABEL_65:
  v89.i64[0] = v52;
  v93[0] = -86;
  uint64_t v53 = *(void *)(a1 + 64);
  if ((*(unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v53, v93, 1) == 1)
  {
    uint64_t v54 = v93[0];
    unint64_t v55 = (unint64_t)v93[0] << 8;
  }
  else
  {
    uint64_t v54 = -1431655766;
    unint64_t v55 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v53)) {
      goto LABEL_71;
    }
  }
  v93[0] = -86;
  if ((*(unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v53, v93, 1) != 1)
  {
    if (!(*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v53)) {
      goto LABEL_72;
    }
LABEL_71:
    unint64_t v56 = 0;
    unsigned int v40 = -1;
    goto LABEL_73;
  }
  unint64_t v55 = (unint64_t)v93[0] << 8;
LABEL_72:
  unint64_t v56 = v55 + v54;
LABEL_73:
  v89.i64[1] = v56;
  v93[0] = -86;
  uint64_t v57 = *(void *)(a1 + 64);
  if ((*(unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v57, v93, 1) == 1)
  {
    uint64_t v33 = v93[0];
    unint64_t v79 = (unint64_t)v93[0] << 8;
  }
  else if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v57))
  {
    goto LABEL_79;
  }
  v93[0] = -86;
  if ((*(unsigned int (**)(void, uint64_t, unsigned char *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v57, v93, 1) != 1)
  {
    int v59 = (*(uint64_t (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v57);
    unint64_t v58 = v79;
    if (!v59) {
      goto LABEL_80;
    }
LABEL_79:
    unint64_t v60 = 0;
    unsigned int v40 = -1;
    goto LABEL_81;
  }
  unint64_t v58 = (unint64_t)v93[0] << 8;
LABEL_80:
  unint64_t v60 = v58 + v33;
LABEL_81:
  v90.i64[0] = v60;
  int v61 = unzlocal_getLong(a1, *(void *)(a1 + 64), &v90.i64[1]);
  if (unzlocal_getLong(a1, *(void *)(a1 + 64), &v83) | v61) {
    uint64_t v19 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v19 = v40;
  }
  unint64_t v62 = v88.i64[0];
  if (a4 && !v19)
  {
    unint64_t v63 = a5;
    if (v88.i64[0] < a5)
    {
      *(unsigned char *)(a4 + v88.i64[0]) = 0;
      unint64_t v63 = v62;
    }
    uint64_t v19 = 0;
    if (a5 && v62)
    {
      if ((*(uint64_t (**)(void, void, uint64_t, unint64_t))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 64), a4, v63) == v63)uint64_t v19 = 0; {
      else
      }
        uint64_t v19 = 0xFFFFFFFFLL;
    }
    v62 -= v63;
  }
  uint64_t v64 = v88.i64[1];
  if (!a6 || v19)
  {
    unint64_t v70 = v88.i64[1] + v62;
    uint64_t v69 = v81;
    char v68 = a3;
    if (!v81) {
      goto LABEL_130;
    }
    goto LABEL_116;
  }
  if (v88.i64[1] >= a7) {
    uint64_t v65 = a7;
  }
  else {
    uint64_t v65 = v88.i64[1];
  }
  if (v62)
  {
    uint64_t v66 = (*(uint64_t (**)(void, void, unint64_t, uint64_t))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), v62, 1);
    if (v66) {
      uint64_t v19 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v19 = 0;
    }
    if (v66) {
      unint64_t v67 = v62;
    }
    else {
      unint64_t v67 = 0;
    }
    uint64_t v69 = v81;
    char v68 = a3;
    if (!a7) {
      goto LABEL_115;
    }
  }
  else
  {
    uint64_t v19 = 0;
    unint64_t v67 = 0;
    uint64_t v69 = v81;
    char v68 = a3;
    if (!a7) {
      goto LABEL_115;
    }
  }
  if (v64)
  {
    if ((*(uint64_t (**)(void, void, uint64_t, uint64_t))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 64), a6, v65) == v65)uint64_t v19 = v19; {
    else
    }
      uint64_t v19 = 0xFFFFFFFFLL;
  }
LABEL_115:
  unint64_t v70 = v64 - v65 + v67;
  if (!v69) {
    goto LABEL_130;
  }
LABEL_116:
  if (!v19)
  {
    unint64_t v71 = v89.i64[0];
    unint64_t v72 = a9;
    if (v89.i64[0] < a9)
    {
      *(unsigned char *)(v69 + v89.i64[0]) = 0;
      unint64_t v72 = v71;
    }
    if (v70)
    {
      if ((*(uint64_t (**)(void, void, unint64_t, uint64_t))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), v70, 1))
      {
        uint64_t v19 = 0xFFFFFFFFLL;
      }
      else
      {
        uint64_t v19 = 0;
      }
      if (!a9) {
        goto LABEL_130;
      }
LABEL_126:
      if (v71)
      {
        if ((*(uint64_t (**)(void, void, uint64_t, unint64_t))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 64), v69, v72) == v72)uint64_t v19 = v19; {
        else
        }
          uint64_t v19 = 0xFFFFFFFFLL;
      }
      goto LABEL_130;
    }
    uint64_t v19 = 0;
    if (a9) {
      goto LABEL_126;
    }
  }
LABEL_130:
  if (a2 && !v19)
  {
    int8x16_t v73 = v91;
    *(int8x16_t *)(a2 + 96) = v90;
    *(int8x16_t *)(a2 + 112) = v73;
    *(void *)(a2 + 128) = v92;
    int8x16_t v74 = v87;
    *(int8x16_t *)(a2 + 32) = v86;
    *(int8x16_t *)(a2 + 48) = v74;
    int8x16_t v75 = v89;
    *(int8x16_t *)(a2 + 64) = v88;
    *(int8x16_t *)(a2 + 80) = v75;
    int8x16_t v76 = v85;
    *(_OWORD *)a2 = v84;
    *(int8x16_t *)(a2 + 16) = v76;
  }
  if (v68 && !v19) {
    void *v68 = v83;
  }
  return v19;
}

uint64_t unzOpenCurrentFile3(uint64_t a1, _DWORD *a2, int *a3, int a4, unsigned char *a5)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  int v64 = -1431655766;
  unint64_t v63 = 0xAAAAAAAAAAAAAAAALL;
  if (!a1 || !*(void *)(a1 + 112)) {
    return 4294967194;
  }
  uint64_t v10 = *(void *)(a1 + 288);
  if (v10)
  {
    if (*(void *)v10) {
      free(*(void **)v10);
    }
    *(void *)uint64_t v10 = 0;
    if (*(void *)(v10 + 128)) {
      inflateEnd((z_streamp)(v10 + 8));
    }
    free((void *)v10);
    *(void *)(a1 + 288) = 0;
  }
  if ((*(uint64_t (**)(void, void, void, void))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 88) + *(void *)(a1 + 280), 0))
  {
    return 4294967193;
  }
  uint64_t v61 = 0xAAAAAAAAAAAAAAAALL;
  int Long = unzlocal_getLong(a1, *(void *)(a1 + 64), &v61);
  if (v61 == 67324752) {
    int v14 = 0;
  }
  else {
    int v14 = -103;
  }
  if (Long) {
    int v15 = -1;
  }
  else {
    int v15 = v14;
  }
  unsigned __int8 v62 = -86;
  uint64_t v16 = *(void *)(a1 + 64);
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v16, &v62, 1) == 1)
  {
    uint64_t v17 = v62;
    unint64_t v18 = (unint64_t)v62 << 8;
  }
  else
  {
    uint64_t v17 = -1431655766;
    unint64_t v18 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v16)) {
      goto LABEL_25;
    }
  }
  unsigned __int8 v62 = -86;
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v16, &v62, 1) != 1)
  {
    if (!(*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v16)) {
      goto LABEL_26;
    }
LABEL_25:
    uint64_t v19 = 0;
    int v15 = -1;
    goto LABEL_27;
  }
  unint64_t v18 = (unint64_t)v62 << 8;
LABEL_26:
  uint64_t v19 = v18 + v17;
LABEL_27:
  uint64_t v60 = v19;
  unsigned __int8 v62 = -86;
  uint64_t v20 = *(void *)(a1 + 64);
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v20, &v62, 1) == 1)
  {
    char v21 = v62;
  }
  else
  {
    char v21 = -86;
    if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v20))
    {
LABEL_32:
      char v22 = 0;
      int v15 = -1;
      goto LABEL_34;
    }
  }
  unsigned __int8 v62 = -86;
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v20, &v62, 1) != 1&& (*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v20))
  {
    goto LABEL_32;
  }
  char v22 = v21;
LABEL_34:
  unsigned __int8 v62 = -86;
  uint64_t v23 = *(void *)(a1 + 64);
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v23, &v62, 1) == 1)
  {
    uint64_t v24 = v62;
    unint64_t v25 = (unint64_t)v62 << 8;
  }
  else
  {
    uint64_t v24 = -1431655766;
    unint64_t v25 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v23)) {
      goto LABEL_40;
    }
  }
  unsigned __int8 v62 = -86;
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v23, &v62, 1) != 1)
  {
    if (!(*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v23)) {
      goto LABEL_41;
    }
LABEL_40:
    uint64_t v60 = 0;
    int v15 = -1;
    goto LABEL_46;
  }
  unint64_t v25 = (unint64_t)v62 << 8;
LABEL_41:
  unint64_t v26 = v25 + v24;
  uint64_t v60 = v25 + v24;
  if (!v15)
  {
    int v15 = -103;
    if (v26 == *(void *)(a1 + 168))
    {
      if ((v26 & 0xFFFFFFFFFFFFFFF7) != 0) {
        int v15 = -103;
      }
      else {
        int v15 = 0;
      }
    }
  }
LABEL_46:
  int v27 = unzlocal_getLong(a1, *(void *)(a1 + 64), &v60);
  if (unzlocal_getLong(a1, *(void *)(a1 + 64), &v60))
  {
    int v15 = -1;
  }
  else
  {
    if (v27) {
      int v15 = -1;
    }
    if (!v15)
    {
      if (v60 == *(void *)(a1 + 184))
      {
        int v15 = 0;
      }
      else if ((v22 & 8) != 0)
      {
        int v15 = 0;
      }
      else
      {
        int v15 = -103;
      }
    }
  }
  if (unzlocal_getLong(a1, *(void *)(a1 + 64), &v60))
  {
    int v15 = -1;
  }
  else if (!v15)
  {
    if (v60 == *(void *)(a1 + 192))
    {
      int v15 = 0;
    }
    else if ((v22 & 8) != 0)
    {
      int v15 = 0;
    }
    else
    {
      int v15 = -103;
    }
  }
  if (unzlocal_getLong(a1, *(void *)(a1 + 64), &v60))
  {
    int v15 = -1;
  }
  else if (!v15)
  {
    if (v60 == *(void *)(a1 + 200))
    {
      int v15 = 0;
    }
    else if ((v22 & 8) != 0)
    {
      int v15 = 0;
    }
    else
    {
      int v15 = -103;
    }
  }
  unsigned __int8 v62 = -86;
  uint64_t v28 = *(void *)(a1 + 64);
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v28, &v62, 1) == 1)
  {
    uint64_t v29 = v62;
    unint64_t v30 = (unint64_t)v62 << 8;
  }
  else
  {
    uint64_t v29 = -1431655766;
    unint64_t v30 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v28)) {
      goto LABEL_78;
    }
  }
  unsigned __int8 v62 = -86;
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v28, &v62, 1) == 1)
  {
    unint64_t v30 = (unint64_t)v62 << 8;
    goto LABEL_79;
  }
  if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v28))
  {
LABEL_78:
    unint64_t v31 = 0;
    int v15 = -1;
    goto LABEL_83;
  }
LABEL_79:
  unint64_t v31 = v30 + v29;
  if (!v15)
  {
    if (v31 == *(void *)(a1 + 208)) {
      int v15 = 0;
    }
    else {
      int v15 = -103;
    }
  }
LABEL_83:
  unsigned __int8 v62 = -86;
  uint64_t v32 = *(void *)(a1 + 64);
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v32, &v62, 1) == 1)
  {
    int v33 = v62;
    int v34 = v62 << 8;
  }
  else
  {
    if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v32)) {
      return 4294967193;
    }
    int v34 = -1431655936;
    int v33 = -1431655766;
  }
  unsigned __int8 v62 = -86;
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), v32, &v62, 1) == 1)
  {
    int v34 = v62 << 8;
    goto LABEL_90;
  }
  if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), v32)) {
    return 4294967193;
  }
LABEL_90:
  if (v15) {
    return 4294967193;
  }
  uint64_t v35 = *(void *)(a1 + 280);
  uint32x4_t v36 = (char *)malloc(0x120uLL);
  if (!v36) {
    return 4294967192;
  }
  int8x16_t v37 = v36;
  int v38 = v34 + v33;
  int v39 = malloc(0x4000uLL);
  *(void *)int8x16_t v37 = v39;
  *((void *)v37 + 17) = v31 + v35 + 30;
  *((_DWORD *)v37 + 36) = v38;
  *((void *)v37 + 19) = 0;
  *((_DWORD *)v37 + 70) = a4;
  if (!v39)
  {
    free(v37);
    return 4294967192;
  }
  *((void *)v37 + 16) = 0;
  if (a2) {
    *a2 = *(void *)(a1 + 168);
  }
  if (!a3) {
    goto LABEL_104;
  }
  *a3 = 6;
  uint64_t v40 = *(void *)(a1 + 160) & 6;
  switch(v40)
  {
    case 2:
      int v41 = 9;
      goto LABEL_103;
    case 6:
      int v41 = 1;
      goto LABEL_103;
    case 4:
      int v41 = 2;
LABEL_103:
      *a3 = v41;
      break;
  }
LABEL_104:
  uint64_t v42 = *(void *)(a1 + 184);
  *((void *)v37 + 20) = 0;
  *((void *)v37 + 21) = v42;
  uint64_t v43 = *(void *)(a1 + 168);
  *((void *)v37 + 32) = *(void *)(a1 + 64);
  *((void *)v37 + 33) = v43;
  long long v44 = *(_OWORD *)(a1 + 16);
  *((_OWORD *)v37 + 12) = *(_OWORD *)a1;
  *((_OWORD *)v37 + 13) = v44;
  long long v45 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v37 + 14) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v37 + 15) = v45;
  *((void *)v37 + 34) = *(void *)(a1 + 88);
  *((void *)v37 + 6) = 0;
  if (!a4 && v43 == 8)
  {
    *((void *)v37 + 1) = 0;
    *((_DWORD *)v37 + 4) = 0;
    *((void *)v37 + 10) = 0;
    *((void *)v37 + 11) = 0;
    *((void *)v37 + 9) = 0;
    uint64_t v46 = inflateInit2_((z_streamp)(v37 + 8), -15, "1.2.12", 112);
    if (v46)
    {
      uint64_t v11 = v46;
      free(v37);
      return v11;
    }
    *((void *)v37 + 16) = 1;
    uint64_t v35 = *(void *)(a1 + 280);
  }
  *((_OWORD *)v37 + 11) = *(_OWORD *)(a1 + 192);
  *((void *)v37 + 15) = v35 + (v38 + v31) + 30;
  *((_DWORD *)v37 + 4) = 0;
  *(void *)(a1 + 288) = v37;
  if (!a5) {
    return 0;
  }
  unint64_t v47 = 878082192;
  crc_table = get_crc_table();
  *(_OWORD *)(a1 + 304) = xmmword_21DFAE3C0;
  *(void *)(a1 + 320) = 878082192;
  *(void *)(a1 + 328) = crc_table;
  int v49 = *a5;
  if (*a5)
  {
    uint64_t v50 = a5 + 1;
    unint64_t v51 = 305419896;
    uint64_t v52 = 591751049;
    do
    {
      unint64_t v51 = crc_table[v49 ^ v51] ^ (v51 >> 8);
      uint64_t v52 = 134775813 * (v52 + v51) + 1;
      *(void *)(a1 + 304) = v51;
      *(void *)(a1 + 312) = v52;
      unint64_t v47 = crc_table[(v47 ^ BYTE3(v52))] ^ (v47 >> 8);
      *(void *)(a1 + 320) = v47;
      int v53 = *v50++;
      int v49 = v53;
    }
    while (v53);
  }
  if ((*(uint64_t (**)(void, void, void, void))(a1 + 32))(*(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(*(void *)(a1 + 288) + 272) + *(void *)(*(void *)(a1 + 288) + 120), 0)|| (unint64_t)(*(uint64_t (**)(void, void, unint64_t *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 64), &v63, 12) < 0xC)
  {
    return 4294967192;
  }
  uint64_t v54 = 0;
  unint64_t v56 = *(void *)(a1 + 320);
  uint64_t v55 = *(void *)(a1 + 328);
  unint64_t v57 = *(void *)(a1 + 304);
  uint64_t v58 = *(void *)(a1 + 312);
  do
  {
    char v59 = *((unsigned char *)&v63 + v54) ^ ((unsigned __int16)((v56 & 0xFFFD ^ 3) * (v56 | 2)) >> 8);
    *((unsigned char *)&v63 + v54) = v59;
    unint64_t v57 = *(void *)(v55 + 8 * (v59 ^ v57)) ^ (v57 >> 8);
    uint64_t v58 = 134775813 * (v58 + v57) + 1;
    *(void *)(a1 + 304) = v57;
    *(void *)(a1 + 312) = v58;
    unint64_t v56 = *(void *)(v55 + 8 * (v56 ^ BYTE3(v58))) ^ (v56 >> 8);
    *(void *)(a1 + 320) = v56;
    ++v54;
  }
  while (v54 != 12);
  uint64_t v11 = 0;
  *(void *)(*(void *)(a1 + 288) + 120) += 12;
  *(_DWORD *)(a1 + 296) = 1;
  return v11;
}

uint64_t unzReadCurrentFile(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (!a1) {
    return 4294967194;
  }
  uint64_t v4 = *(void *)(a1 + 288);
  if (!v4) {
    return 4294967194;
  }
  if (!*(void *)v4) {
    return 4294967196;
  }
  if (!a3) {
    return 0;
  }
  *(void *)(v4 + 32) = a2;
  *(_DWORD *)(v4 + 40) = a3;
  unint64_t v5 = a3;
  unint64_t v6 = *(void *)(v4 + 184);
  if (v6 < a3 && !*(_DWORD *)(v4 + 280))
  {
    *(_DWORD *)(v4 + 40) = v6;
    a3 = v6;
  }
  uint64_t v7 = *(void *)(v4 + 176);
  uint64_t v8 = *(unsigned int *)(v4 + 16);
  if (v7 + v8 < v5 && *(_DWORD *)(v4 + 280))
  {
    a3 = v8 + v7;
    *(_DWORD *)(v4 + 40) = v8 + v7;
  }
  uint64_t v9 = 0;
  if (a3)
  {
    do
    {
      while (1)
      {
        LODWORD(v14) = *(_DWORD *)(v4 + 16);
        if (!v14) {
          break;
        }
        if (*(void *)(v4 + 264)) {
          goto LABEL_19;
        }
LABEL_20:
        if (v14 || *(void *)(v4 + 176))
        {
          unsigned int v15 = *(_DWORD *)(v4 + 40);
          uint64_t v14 = v15 >= v14 ? v14 : v15;
          if (v14)
          {
            for (uint64_t i = 0; i != v14; ++i)
              *(unsigned char *)(*(void *)(v4 + 32) + i) = *(unsigned char *)(*(void *)(v4 + 8) + i);
            uint64_t v11 = v14;
          }
          else
          {
            uint64_t v11 = 0;
          }
          *(void *)(v4 + 160) = crc32(*(void *)(v4 + 160), *(const Bytef **)(v4 + 32), v14);
          *(void *)(v4 + 184) -= v11;
          *(_DWORD *)(v4 + 16) -= v14;
          int v12 = *(_DWORD *)(v4 + 40);
          *(void *)(v4 + 32) += v11;
          *(void *)(v4 + 8) += v11;
          *(void *)(v4 + 48) += v11;
          uint64_t v9 = (v14 + v9);
          int v13 = v12 - v14;
          *(_DWORD *)(v4 + 40) = v13;
          if (v13) {
            continue;
          }
        }
        return v9;
      }
      unint64_t v17 = *(void *)(v4 + 176);
      if (v17)
      {
        if (v17 >= 0x4000) {
          uint64_t v14 = 0x4000;
        }
        else {
          uint64_t v14 = *(void *)(v4 + 176);
        }
        if ((*(uint64_t (**)(void, void, void, void))(v4 + 224))(*(void *)(v4 + 248), *(void *)(v4 + 256), *(void *)(v4 + 272) + *(void *)(v4 + 120), 0)|| (*(uint64_t (**)(void, void, void, uint64_t))(v4 + 200))(*(void *)(v4 + 248), *(void *)(v4 + 256), *(void *)v4, v14) != v14)
        {
          return 0xFFFFFFFFLL;
        }
        if (*(_DWORD *)(a1 + 296))
        {
          uint64_t v18 = 0;
          do
          {
            uint64_t v19 = *(void *)(a1 + 328);
            unsigned int v20 = *(unsigned __int8 *)(*(void *)v4 + v18) ^ (((*(_DWORD *)(a1 + 320) & 0xFFFD ^ 3)
                                                              * (*(_DWORD *)(a1 + 320) | 2u)) >> 8);
            *(unsigned char *)(*(void *)v4 + v18) ^= (unsigned __int16)((*(_WORD *)(a1 + 320) & 0xFFFD ^ 3)
                                                                * (*(_WORD *)(a1 + 320) | 2)) >> 8;
            uint64_t v21 = *(void *)(v19 + 8 * (v20 ^ *(void *)(a1 + 304))) ^ (*(void *)(a1 + 304) >> 8);
            uint64_t v22 = 134775813 * (*(void *)(a1 + 312) + v21) + 1;
            *(void *)(a1 + 304) = v21;
            *(void *)(a1 + 312) = v22;
            *(void *)(a1 + 320) = *(void *)(v19 + 8 * (*(void *)(a1 + 320) ^ BYTE3(v22))) ^ (*(void *)(a1 + 320) >> 8);
            *(unsigned char *)(*(void *)v4 + v18++) = v20;
          }
          while (v14 != v18);
        }
        *(void *)(v4 + 120) += v14;
        *(void *)(v4 + 176) -= v14;
        *(void *)(v4 + 8) = *(void *)v4;
        *(_DWORD *)(v4 + 16) = v14;
        if (!*(void *)(v4 + 264)) {
          goto LABEL_20;
        }
      }
      else
      {
        LODWORD(v14) = 0;
        if (!*(void *)(v4 + 264)) {
          goto LABEL_20;
        }
      }
LABEL_19:
      if (*(_DWORD *)(v4 + 280)) {
        goto LABEL_20;
      }
      uint64_t v23 = *(void *)(v4 + 48);
      uint64_t v24 = *(const Bytef **)(v4 + 32);
      unsigned int v25 = inflate((z_streamp)(v4 + 8), 2);
      if ((v25 & 0x80000000) == 0 && *(void *)(v4 + 56))
      {
        uint64_t v27 = *(void *)(v4 + 48);
        uint64_t v28 = v27 - v23;
        *(void *)(v4 + 160) = crc32(*(void *)(v4 + 160), v24, (int)v27 - (int)v23);
        *(void *)(v4 + 184) -= v28;
        return 4294967293;
      }
      uint64_t v26 = *(void *)(v4 + 48) - v23;
      *(void *)(v4 + 160) = crc32(*(void *)(v4 + 160), v24, v26);
      *(void *)(v4 + 184) -= v26;
      uint64_t v9 = (v9 + v26);
      if (v25)
      {
        if (v25 == 1) {
          return v9;
        }
        else {
          return v25;
        }
      }
    }
    while (*(_DWORD *)(v4 + 40));
  }
  return v9;
}

uint64_t BBUEUR13Loader::connect(uint64_t a1)
{
  return 0;
}

uint64_t BBUEUR13Loader::getVersion(uint64_t a1, uint64_t a2, void *a3)
{
  BBUFeedback::handleBeginQuickStep(*(BBUFeedback **)(a1 + 8), "Getting Version");
  if (!a3)
  {
    uint64_t v8 = 2;
    goto LABEL_21;
  }
  unint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v25[7] = v5;
  v25[8] = v5;
  v25[5] = v5;
  v25[6] = v5;
  v25[3] = v5;
  v25[4] = v5;
  v25[1] = v5;
  v25[2] = v5;
  long long v24 = v5;
  v25[0] = v5;
  *(_OWORD *)__p = v5;
  long long v23 = v5;
  long long v20 = v5;
  long long v21 = v5;
  long long v18 = v5;
  long long v19 = v5;
  long long v17 = v5;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v17);
  std::ostream::operator<<();
  if ((BYTE8(v24) & 0x10) != 0)
  {
    uint64_t v9 = v24;
    if ((unint64_t)v24 < *((void *)&v21 + 1))
    {
      *(void *)&long long v24 = *((void *)&v21 + 1);
      uint64_t v9 = *((void *)&v21 + 1);
    }
    uint64_t v10 = (const void *)v21;
    size_t v6 = v9 - v21;
    if ((unint64_t)(v9 - v21) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_23;
    }
  }
  else
  {
    if ((BYTE8(v24) & 8) == 0)
    {
      size_t v6 = 0;
      HIBYTE(v16) = 0;
      uint64_t v7 = __dst;
      goto LABEL_16;
    }
    uint64_t v10 = (const void *)*((void *)&v19 + 1);
    size_t v6 = *((void *)&v20 + 1) - *((void *)&v19 + 1);
    if (*((void *)&v20 + 1) - *((void *)&v19 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_23:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v6 >= 0x17)
  {
    uint64_t v11 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v11 = v6 | 7;
    }
    uint64_t v12 = v11 + 1;
    uint64_t v7 = (void **)operator new(v11 + 1);
    __dst[1] = (void *)v6;
    unint64_t v16 = v12 | 0x8000000000000000;
    __dst[0] = v7;
  }
  else
  {
    HIBYTE(v16) = v6;
    uint64_t v7 = __dst;
    if (!v6) {
      goto LABEL_16;
    }
  }
  memmove(v7, v10, v6);
LABEL_16:
  *((unsigned char *)v7 + v6) = 0;
  *a3 = BBULoaderVersion::createFromVersionString((uint64_t)__dst);
  if (SHIBYTE(v16) < 0) {
    operator delete(__dst[0]);
  }
  *(void *)&long long v17 = *MEMORY[0x263F8C2B8];
  uint64_t v13 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)&v17 + *(void *)(v17 - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  *(void *)&long long v18 = v13;
  *((void *)&v18 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v23) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x223C1DDF0](v25);
  uint64_t v8 = 0;
LABEL_21:
  (*(void (**)(void, uint64_t))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8), v8);
  return v8;
}

void sub_21DF8C790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0)
  {
    operator delete(__p);
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a16);
    _Unwind_Resume(a1);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

uint64_t BBUEUR13Loader::queryChipInfo(BBUFeedback **a1, uint64_t a2, void *a3)
{
  size_t v6 = (UInt8 *)operator new(0x60uLL);
  *(_OWORD *)size_t v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((_OWORD *)v6 + 5) = 0u;
  int v43 = 0;
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, UInt8 *, uint64_t, int *, void))(a2 + 40);
  if (!v7 || !v7(a2, 4, v6, 96, &v43, 0))
  {
    BBUFeedback::handleComment(a1[1], "Failed to get chip info: Failed to read pk hash");
LABEL_10:
    BBUFeedback::handleComment(a1[1], "failed to read MSMHWID");
    goto LABEL_11;
  }
  unsigned int v8 = (*((uint64_t (**)(BBUFeedback **))*a1 + 11))(a1);
  uint64_t v9 = operator new(0x10uLL);
  void *v9 = &unk_26CECE908;
  v9[1] = 0;
  v9[1] = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v6, v8);
  (*(void (**)(void *, void *))(*a3 + 24))(a3, v9);
  uint64_t v10 = (const void *)(*((uint64_t (**)(BBUFeedback **))*a1 + 12))(a1);
  size_t v11 = (*((uint64_t (**)(BBUFeedback **))*a1 + 11))(a1);
  if (!memcmp(v10, v6, v11))
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      int v12 = 1;
      if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0) {
        goto LABEL_41;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      int v12 = 1;
      if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0) {
        goto LABEL_41;
      }
    }
    if (gBBULogVerbosity >= 1)
    {
      uint64_t v29 = (const char *)(*((uint64_t (**)(BBUFeedback **))*a1 + 9))(a1);
      _BBULog(9, 1, v29, "", "Detect as unfused BB\n", v30, v31, v32, v38);
    }
  }
  else
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      int v12 = 3;
      if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0) {
        goto LABEL_41;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      int v12 = 3;
      if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0) {
        goto LABEL_41;
      }
    }
    if (gBBULogVerbosity >= 1)
    {
      uint64_t v13 = (const char *)(*((uint64_t (**)(BBUFeedback **))*a1 + 9))(a1);
      _BBULog(9, 1, v13, "", "Detect as fused BB\n", v14, v15, v16, v38);
    }
  }
LABEL_41:
  *((_DWORD *)a3 + 22) = v12;
  int v33 = *(unsigned int (**)(uint64_t, uint64_t, UInt8 *, uint64_t, int *, void))(a2 + 40);
  if (!v33 || !v33(a2, 3, v6, 24, &v43, 0)) {
    goto LABEL_10;
  }
  int v34 = BBUEURPersonalizationParameters::EURChipID::createFromChipID((BBUEURPersonalizationParameters::EURChipID *)*((unsigned int *)v6 + 1));
  uint64_t v35 = a3[2];
  if (v35) {
    (*(void (**)(uint64_t))(*(void *)v35 + 8))(v35);
  }
  a3[2] = v34;
  uint32x4_t v36 = *(unsigned int (**)(uint64_t, void, UInt8 *, uint64_t, int *, void))(a2 + 40);
  if (!v36 || !v36(a2, 0, v6, 4, &v43, 0))
  {
LABEL_11:
    BBUFeedback::handleComment(a1[1], "failed to read MSMHWID");
    uint64_t v17 = 98;
    int v18 = -559030611;
    long long v19 = a1[1];
    uint64_t v20 = a3[2];
    int v21 = -559030611;
    if (!v20) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  int8x16_t v37 = BBUEURPersonalizationParameters::EURSerialNumber::createFromSerialNumber((BBUEURPersonalizationParameters::EURSerialNumber *)v6, (const unsigned __int8 *)0x20);
  (*(void (**)(void *, void *))(*a3 + 16))(a3, v37);
  uint64_t v17 = 0;
  int v18 = -559030611;
  long long v19 = a1[1];
  uint64_t v20 = a3[2];
  int v21 = -559030611;
  if (v20) {
LABEL_12:
  }
    int v21 = (*(uint64_t (**)(uint64_t))(*(void *)v20 + 24))(v20);
LABEL_13:
  uint64_t v22 = a3[4];
  if (!v22)
  {
    long long v24 = "failed";
    uint64_t v25 = a3[5];
    if (v25) {
      goto LABEL_22;
    }
LABEL_27:
    unint64_t v26 = "failed";
    uint64_t v27 = a3[3];
    if (!v27) {
      goto LABEL_29;
    }
LABEL_28:
    int v18 = (*(uint64_t (**)(uint64_t))(*(void *)v27 + 24))(v27);
    goto LABEL_29;
  }
  long long v23 = v41;
  (*(void (**)(void **__return_ptr, void))(*(void *)v22 + 24))(v41, a3[4]);
  if (v42 < 0) {
    long long v23 = (void **)v41[0];
  }
  if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS == -1)
  {
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1) {
      goto LABEL_18;
    }
  }
  else
  {
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global_7);
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1) {
      goto LABEL_18;
    }
  }
  dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_13);
LABEL_18:
  if (BBUpdaterCommon::inRestoreOS(void)::restoreOS | BBUpdaterCommon::inRestoreOS(void)::recoveryOS) {
    long long v24 = (const char *)v23;
  }
  else {
    long long v24 = "<< SNUM >>";
  }
  uint64_t v25 = a3[5];
  if (!v25) {
    goto LABEL_27;
  }
LABEL_22:
  unint64_t v26 = (const char *)__p;
  (*(void (**)(void **__return_ptr, uint64_t))(*(void *)v25 + 24))(__p, v25);
  if (v40 < 0) {
    unint64_t v26 = (const char *)__p[0];
  }
  uint64_t v27 = a3[3];
  if (v27) {
    goto LABEL_28;
  }
LABEL_29:
  BBUFeedback::handleComment(v19, "CHIPID=0x%x SNUM=0x%s, PKHASH=0x%s CERTID=0x%x\n", v21, v24, v26, v18);
  if (v25 && v40 < 0) {
    operator delete(__p[0]);
  }
  if (v22 && v42 < 0) {
    operator delete(v41[0]);
  }
  operator delete(v6);
  return v17;
}

void sub_21DF8CDC0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DF8CDD4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DF8CDE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (v26)
  {
    if (a25 < 0)
    {
      operator delete(__p);
      operator delete(v25);
      _Unwind_Resume(a1);
    }
  }
  operator delete(v25);
  _Unwind_Resume(a1);
}

uint64_t BBUEUR13Loader::load(BBUFeedback **a1, uint64_t a2, BBUDataSource *a3, char a4)
{
  BBUFeedback::handleComment(a1[1], "Loading second stage bootloader");
  if (a2 && a3)
  {
    int v42 = -1;
    int v43 = 0;
    BBUDataSource::createData(a3, (CFDataRef *)&cf);
    CFTypeRef v8 = cf;
    int v9 = (*(uint64_t (**)(BBUDataSource *))(*(void *)a3 + 32))(a3);
    uint64_t v10 = operator new(0x18uLL);
    v10[4] = v9;
    *(void *)uint64_t v10 = &unk_26CECE780;
    *((void *)v10 + 1) = v8;
    if (v8) {
      CFRetain(v8);
    }
    if (cf) {
      CFRelease(cf);
    }
    size_t v11 = operator new(0x58uLL);
    BBUEURMIImage::BBUEURMIImage((BBUEURMIImage *)v11, (BBUDataSource *)v10, 0);
    *(void *)size_t v11 = &unk_26CECC2D0;
    *((void *)v11 + 8) = 0;
    int v12 = v11 + 32;
    *((void *)v11 + 9) = 0;
    *((void *)v11 + 10) = 0;
    if (a4)
    {
      *((unsigned char *)v11 + 66) = 76;
      *int v12 = 16979;
      *((unsigned char *)v11 + 87) = 3;
      int v13 = *((_DWORD *)v11 + 8);
      size_t v14 = (v13 + 40);
      if (v13 != -40)
      {
LABEL_9:
        uint64_t v15 = operator new(v14);
        bzero(v15, v14);
        goto LABEL_16;
      }
    }
    else
    {
      v11[36] = 19522;
      *(void *)int v12 = *(void *)"restoreSBL";
      *((unsigned char *)v11 + 87) = 10;
      int v21 = *((_DWORD *)v11 + 8);
      size_t v14 = (v21 + 40);
      if (v21 != -40) {
        goto LABEL_9;
      }
    }
    uint64_t v15 = 0;
LABEL_16:
    BBUEURMIImage::getWritePayloadData((BBUEURMIImage *)v11, (unsigned __int8 *)v15, v14, 0);
    (*(void (**)(_WORD *))(*(void *)v11 + 16))(v11);
    uint64_t v22 = *(uint64_t (**)(uint64_t, void *, size_t, int *, uint64_t, int *, void))(a2 + 32);
    if (v22)
    {
      int v23 = v22(a2, v15, v14, &v43, 10000, &v42, 0);
      if (gBBULogMaskGet(void)::once == -1) {
        goto LABEL_18;
      }
    }
    else
    {
      int v23 = 0;
      if (gBBULogMaskGet(void)::once == -1)
      {
LABEL_18:
        if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0) {
          goto LABEL_23;
        }
LABEL_19:
        if (gBBULogVerbosity >= 1)
        {
          long long v24 = (const char *)(*((uint64_t (**)(BBUFeedback **))*a1 + 9))(a1);
          uint64_t v28 = "failure";
          if (v23) {
            uint64_t v28 = "success";
          }
          _BBULog(9, 1, v24, "", "SendImage returned %s, amountWritten = %u, errorCode = %#x\n", v25, v26, v27, (char)v28);
        }
LABEL_23:
        if (v23)
        {
          uint64_t v29 = gBBULogMaskGet(void)::once;
          if (v43 == v14 && !v42)
          {
            if (gBBULogMaskGet(void)::once == -1)
            {
              uint64_t v16 = 0;
              if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) != 0) {
                goto LABEL_28;
              }
            }
            else
            {
              dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
              uint64_t v16 = 0;
              if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) != 0)
              {
LABEL_28:
                if (gBBULogVerbosity >= 1)
                {
                  uint64_t v30 = (const char *)(*((uint64_t (**)(BBUFeedback **))*a1 + 9))(a1);
                  char v31 = (*(uint64_t (**)(_WORD *))(*(void *)v11 + 16))(v11);
                  _BBULog(9, 1, v30, "", "Sent %s sucessfully!\n", v32, v33, v34, v31);
                  uint64_t v16 = 0;
                }
              }
            }
LABEL_35:
            if (v15) {
              operator delete(v15);
            }
            (*(void (**)(_WORD *))(*(void *)v11 + 8))(v11);
            return v16;
          }
        }
        else
        {
          uint64_t v29 = gBBULogMaskGet(void)::once;
        }
        if (v29 == -1)
        {
          uint64_t v16 = 3;
          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0) {
            goto LABEL_35;
          }
        }
        else
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          uint64_t v16 = 3;
          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0) {
            goto LABEL_35;
          }
        }
        if (gBBULogVerbosity >= 1)
        {
          uint64_t v35 = (const char *)(*((uint64_t (**)(BBUFeedback **))*a1 + 9))(a1);
          char v36 = (*(uint64_t (**)(_WORD *))(*(void *)v11 + 16))(v11);
          _BBULog(9, 1, v35, "", "Fail to send %s !\n", v37, v38, v39, v36);
        }
        goto LABEL_35;
      }
    }
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    uint64_t v16 = 2;
    if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0) {
      return v16;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    uint64_t v16 = 2;
    if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0) {
      return v16;
    }
  }
  if (gBBULogVerbosity >= 1)
  {
    uint64_t v17 = (const char *)(*((uint64_t (**)(BBUFeedback **))*a1 + 9))(a1);
    _BBULog(9, 1, v17, "", "invalid arguments transport:  %p, updateSource: %p\n", v18, v19, v20, a2);
  }
  return v16;
}

void sub_21DF8D3EC(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUEUR13Loader::go()
{
  return 0;
}

const char *BBUEUR13Loader::getDebugName(BBUEUR13Loader *this)
{
  return "BBUEUR13Loader";
}

uint64_t BBUEUR13Loader::getPKHashLength(BBUEUR13Loader *this)
{
  return 32;
}

uint64_t BBUEUR13Loader::getEURDefaultHashData(BBUEUR13Loader *this)
{
  return (uint64_t)this + 41;
}

void BBUPartitionManager::BBUPartitionManager(BBUPartitionManager *this)
{
  *((void *)this + 1) = 0;
  uint64_t v2 = (void *)((char *)this + 8);
  *((void *)this + 2) = 0;
  *(void *)this = (char *)this + 8;
  uint64_t v3 = *((void *)this + 1);
  uint64_t v4 = (void *)((char *)this + 8);
  long long v5 = (void *)((char *)this + 8);
  if (v3)
  {
    while (1)
    {
      while (1)
      {
        long long v5 = (void *)v3;
        int v6 = *(_DWORD *)(v3 + 32);
        if (v6 < 1) {
          break;
        }
        uint64_t v3 = *v5;
        uint64_t v4 = v5;
        if (!*v5) {
          goto LABEL_8;
        }
      }
      if ((v6 & 0x80000000) == 0) {
        break;
      }
      uint64_t v3 = v5[1];
      if (!v3)
      {
        uint64_t v4 = v5 + 1;
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    uint64_t v7 = operator new(0x40uLL);
    v7[8] = 0;
    *((void *)v7 + 5) = 0;
    v7[14] = *(_DWORD *)v22;
    *(_DWORD *)((char *)v7 + 59) = *(_DWORD *)&v22[3];
    *((unsigned char *)v7 + 63) = 0;
    *(void *)uint64_t v7 = 0;
    *((void *)v7 + 1) = 0;
    *((void *)v7 + 2) = v5;
    *uint64_t v4 = v7;
    uint64_t v8 = **(void **)this;
    if (v8)
    {
      *(void *)this = v8;
      uint64_t v7 = (_DWORD *)*v4;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)this + 1), (uint64_t *)v7);
    ++*((void *)this + 2);
  }
  uint64_t v9 = *v2;
  uint64_t v10 = v2;
  size_t v11 = v2;
  if (*v2)
  {
    while (1)
    {
      while (1)
      {
        size_t v11 = (void *)v9;
        int v12 = *(_DWORD *)(v9 + 32);
        if (v12 <= 1) {
          break;
        }
        uint64_t v9 = *v11;
        uint64_t v10 = v11;
        if (!*v11) {
          goto LABEL_18;
        }
      }
      if (v12 == 1) {
        break;
      }
      uint64_t v9 = v11[1];
      if (!v9)
      {
        uint64_t v10 = v11 + 1;
        goto LABEL_18;
      }
    }
  }
  else
  {
LABEL_18:
    int v13 = operator new(0x40uLL);
    v13[8] = 1;
    *((void *)v13 + 5) = 0;
    v13[14] = *(_DWORD *)v21;
    *(_DWORD *)((char *)v13 + 59) = *(_DWORD *)&v21[3];
    *((unsigned char *)v13 + 63) = 0;
    *(void *)int v13 = 0;
    *((void *)v13 + 1) = 0;
    *((void *)v13 + 2) = v11;
    *uint64_t v10 = v13;
    uint64_t v14 = **(void **)this;
    if (v14)
    {
      *(void *)this = v14;
      int v13 = (_DWORD *)*v10;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)this + 1), (uint64_t *)v13);
    ++*((void *)this + 2);
  }
  uint64_t v15 = *v2;
  uint64_t v16 = v2;
  if (*v2)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v16 = (void *)v15;
        int v17 = *(_DWORD *)(v15 + 32);
        if (v17 <= 2) {
          break;
        }
        uint64_t v15 = *v16;
        uint64_t v2 = v16;
        if (!*v16) {
          goto LABEL_28;
        }
      }
      if (v17 == 2) {
        break;
      }
      uint64_t v15 = v16[1];
      if (!v15)
      {
        uint64_t v2 = v16 + 1;
        goto LABEL_28;
      }
    }
  }
  else
  {
LABEL_28:
    uint64_t v18 = operator new(0x40uLL);
    v18[8] = 2;
    *((void *)v18 + 5) = 0;
    v18[14] = *(_DWORD *)v20;
    *(_DWORD *)((char *)v18 + 59) = *(_DWORD *)&v20[3];
    *((unsigned char *)v18 + 63) = 0;
    *(void *)uint64_t v18 = 0;
    *((void *)v18 + 1) = 0;
    *((void *)v18 + 2) = v16;
    *uint64_t v2 = v18;
    uint64_t v19 = **(void **)this;
    if (v19)
    {
      *(void *)this = v19;
      uint64_t v18 = (_DWORD *)*v2;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)this + 1), (uint64_t *)v18);
    ++*((void *)this + 2);
  }
}

void sub_21DF8D6A8(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

void BBUPartitionManager::getBBUFSPath(BBUPartitionManager *this@<X0>, std::string *a2@<X8>)
{
  {
    BBUPartitionManager::getPartitionRoot((uint64_t)this, 2, &__p);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>("/bbfs/", &__p, (std::string *)&BBUPartitionManager::getBBUFSPath(void)const::kBBUFSPath);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  if (byte_267D24717 < 0)
  {
    std::string::__init_copy_ctor_external(a2, (const std::string::value_type *)BBUPartitionManager::getBBUFSPath(void)const::kBBUFSPath, *((std::string::size_type *)&BBUPartitionManager::getBBUFSPath(void)const::kBBUFSPath + 1));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = BBUPartitionManager::getBBUFSPath(void)const::kBBUFSPath;
    a2->__r_.__value_.__r.__words[2] = unk_267D24710;
  }
}

void sub_21DF8D7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

void BBUPartitionManager::getPartitionRoot(uint64_t a1@<X0>, int a2@<W1>, std::string *a3@<X8>)
{
  uint64_t v3 = *(uint64_t **)(a1 + 8);
  if (!v3) {
LABEL_7:
  }
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  while (1)
  {
    while (1)
    {
      int v4 = *((_DWORD *)v3 + 8);
      if (v4 <= a2) {
        break;
      }
      uint64_t v3 = (uint64_t *)*v3;
      if (!v3) {
        goto LABEL_7;
      }
    }
    if (v4 >= a2) {
      break;
    }
    uint64_t v3 = (uint64_t *)v3[1];
    if (!v3) {
      goto LABEL_7;
    }
  }
  if (*((char *)v3 + 63) < 0)
  {
    int v6 = (const std::string::value_type *)v3[5];
    std::string::size_type v7 = v3[6];
    std::string::__init_copy_ctor_external(a3, v6, v7);
  }
  else
  {
    long long v5 = *(_OWORD *)(v3 + 5);
    a3->__r_.__value_.__r.__words[2] = v3[7];
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v5;
  }
}

void BBUPartitionManager::getBBUFDRCacheLocation(BBUPartitionManager *this@<X0>, void *a2@<X8>)
{
  memset(&v20, 0, sizeof(v20));
  ctu::cf::assign();
  memset(&__p, 0, sizeof(__p));
  int v4 = std::string::append(&__p, "/", 1uLL);
  std::string v19 = *v4;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    memset(&v20, 170, sizeof(v20));
    long long v5 = (uint64_t *)*((void *)this + 1);
    if (v5) {
      goto LABEL_7;
    }
LABEL_10:
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  memset(&v20, 170, sizeof(v20));
  long long v5 = (uint64_t *)*((void *)this + 1);
  if (!v5) {
    goto LABEL_10;
  }
  while (1)
  {
LABEL_7:
    while (1)
    {
      int v6 = *((_DWORD *)v5 + 8);
      if (v6 < 1) {
        break;
      }
      long long v5 = (uint64_t *)*v5;
      if (!v5) {
        goto LABEL_10;
      }
    }
    if ((v6 & 0x80000000) == 0) {
      break;
    }
    long long v5 = (uint64_t *)v5[1];
    if (!v5) {
      goto LABEL_10;
    }
  }
  if (*((char *)v5 + 63) < 0) {
    std::string::__init_copy_ctor_external(&v20, (const std::string::value_type *)v5[5], v5[6]);
  }
  else {
    std::string v20 = *(std::string *)(v5 + 5);
  }
  int v7 = SHIBYTE(v20.__r_.__value_.__r.__words[2]);
  if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v20.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v20.__r_.__value_.__l.__size_;
  }
  int v9 = SHIBYTE(v19.__r_.__value_.__r.__words[2]);
  if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v10 = HIBYTE(v19.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v10 = v19.__r_.__value_.__l.__size_;
  }
  unint64_t v11 = v10 + size;
  memset(a2, 170, 24);
  if (v10 + size >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v11 <= 0x16)
  {
    a2[1] = 0;
    a2[2] = 0;
    *a2 = 0;
    *((unsigned char *)a2 + 23) = v11;
    if (!size) {
      goto LABEL_27;
    }
    goto LABEL_23;
  }
  uint64_t v15 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v11 | 7) != 0x17) {
    uint64_t v15 = v11 | 7;
  }
  uint64_t v16 = v15 + 1;
  int v17 = operator new(v15 + 1);
  a2[1] = v11;
  a2[2] = v16 | 0x8000000000000000;
  *a2 = v17;
  a2 = v17;
  if (size)
  {
LABEL_23:
    if (v7 >= 0) {
      int v12 = &v20;
    }
    else {
      int v12 = (std::string *)v20.__r_.__value_.__r.__words[0];
    }
    memmove(a2, v12, size);
  }
LABEL_27:
  int v13 = (char *)a2 + size;
  if (v10)
  {
    if (v9 >= 0) {
      uint64_t v14 = &v19;
    }
    else {
      uint64_t v14 = (std::string *)v19.__r_.__value_.__r.__words[0];
    }
    memmove(v13, v14, v10);
  }
  v13[v10] = 0;
  if ((v7 & 0x80000000) == 0)
  {
    if ((v9 & 0x80000000) == 0) {
      return;
    }
LABEL_40:
    operator delete(v19.__r_.__value_.__l.__data_);
    return;
  }
  operator delete(v20.__r_.__value_.__l.__data_);
  if (v9 < 0) {
    goto LABEL_40;
  }
}

void sub_21DF8DA9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<BBUPartitionManager *,std::shared_ptr<BBUPartitionManager>::__shared_ptr_default_delete<BBUPartitionManager,BBUPartitionManager>,std::allocator<BBUPartitionManager>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<BBUPartitionManager *,std::shared_ptr<BBUPartitionManager>::__shared_ptr_default_delete<BBUPartitionManager,BBUPartitionManager>,std::allocator<BBUPartitionManager>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(char ***)(a1 + 24);
  if (v1)
  {
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(*(void *)(a1 + 24), v1[1]);
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<BBUPartitionManager *,std::shared_ptr<BBUPartitionManager>::__shared_ptr_default_delete<BBUPartitionManager,BBUPartitionManager>,std::allocator<BBUPartitionManager>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021DFAE465) {
    return a1 + 24;
  }
  if (((v3 & 0x800000021DFAE465 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000021DFAE465)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021DFAE465 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void BBUICENVMImage::BBUICENVMImage(BBUICENVMImage *this, BBUDataSource *a2, const char *__s, int a4)
{
  *(void *)this = &unk_26CECF4E8;
  uint64_t v8 = (char *)this + 16;
  size_t v9 = strlen(__s);
  if (v9 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v10 = v9;
  if (v9 >= 0x17)
  {
    uint64_t v12 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17) {
      uint64_t v12 = v9 | 7;
    }
    uint64_t v13 = v12 + 1;
    unint64_t v11 = operator new(v12 + 1);
    *((void *)this + 3) = v10;
    *((void *)this + 4) = v13 | 0x8000000000000000;
    *((void *)this + 2) = v11;
    goto LABEL_8;
  }
  *((unsigned char *)this + 39) = v9;
  unint64_t v11 = v8;
  if (v9) {
LABEL_8:
  }
    memmove(v11, __s, v10);
  *((unsigned char *)v11 + v10) = 0;
  *((_DWORD *)this + 10) = a4;
  *((void *)this + 6) = a2;
  *((void *)this + 1) = 1;
  if (a2) {
    *((_DWORD *)this + 3) = (*(uint64_t (**)(BBUDataSource *))(*(void *)a2 + 24))(a2);
  }
}

void sub_21DF8DD20(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 39) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

void BBUICENVMImage::~BBUICENVMImage(BBUICENVMImage *this)
{
  *(void *)this = &unk_26CECF4E8;
  uint64_t v2 = *((void *)this + 6);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (*((char *)this + 39) < 0) {
    operator delete(*((void **)this + 2));
  }
}

{
  uint64_t v2;
  BBUICENVMImage *v3;
  uint64_t vars8;

  *(void *)this = &unk_26CECF4E8;
  uint64_t v2 = *((void *)this + 6);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (*((char *)this + 39) < 0)
  {
    operator delete(*((void **)this + 2));
    uint64_t v3 = this;
  }
  else
  {
    uint64_t v3 = this;
  }
  operator delete(v3);
}

void *BBUICENVMImage::getWritePayloadData(BBUICENVMImage *this, unsigned __int8 *a2, uint64_t a3, unsigned int a4)
{
  uint64_t result = (void *)(*(uint64_t (**)(BBUICENVMImage *))(*(void *)this + 32))(this);
  if ((int)result + 8 <= a4)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 83, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Images/ICE/BBUICENVMImage.cpp", 0x1Eu, (ctu::LogMessageBuffer *)"Assertion failure((offset < (getWritePayloadLength() + kBinHeaderSize)) && \"Chunk size is not sufficient to write payload data of the NVM image!\")", v11, v12, v13, v20);
    goto LABEL_14;
  }
  int v21 = -1431655766;
  if (a4 <= 7)
  {
    if (8 - a4 >= a3) {
      size_t v9 = a3;
    }
    else {
      size_t v9 = 8 - a4;
    }
    uint64_t result = memcpy(a2, (char *)this + a4 + 8, v9);
    a2 += v9;
    a3 = (a3 - v9);
  }
  if (a3)
  {
    uint64_t result = (void *)(*(uint64_t (**)(void, unsigned __int8 *, uint64_t, int *, void))(**((void **)this + 6)
                                                                                                  + 16))(*((void *)this + 6), a2, a3, &v21, a4 + *((_DWORD *)this + 10) - 8);
    if (result)
    {
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 83, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Images/ICE/BBUICENVMImage.cpp", 0x2Eu, (ctu::LogMessageBuffer *)"Assertion failure((ret == kBBUReturnSuccess) && \"Failed to copy NVM image payload data to buffer!\")", v14, v15, v16, v20);
    }
    else
    {
      if (v21 == a3) {
        return result;
      }
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 83, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Images/ICE/BBUICENVMImage.cpp", 0x2Fu, (ctu::LogMessageBuffer *)"Assertion failure((amountCopied == amount) && \"Copied data size mismatch: Failed to copy NVM image payload data to buffer!\")", v17, v18, v19, v20);
    }
LABEL_14:
  }
  return result;
}

void sub_21DF8E018(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21DF8E02C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21DF8E040(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUICENVMImage::getName(BBUICENVMImage *this)
{
  uint64_t result = (uint64_t)this + 16;
  if (*((char *)this + 39) < 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t BBUICENVMImage::getWritePayloadLength(BBUICENVMImage *this)
{
  uint64_t v1 = *((void *)this + 6);
  if (v1) {
    return (*(unsigned int (**)(uint64_t))(*(void *)v1 + 24))(v1) + 8;
  }
  else {
    return 8;
  }
}

uint64_t BBUICENVMImage::getOpenPayloadData(BBUICENVMImage *this)
{
  return 0;
}

uint64_t BBUICENVMImage::getOpenPayloadLength(BBUICENVMImage *this)
{
  return 0;
}

void BBUICENVMImage::generateHash(uint64_t a1, unsigned __int8 *a2, int a3)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3) {
      BBUDataSource::generateHash(v3, a2, a3);
    }
  }
}

uint64_t BBUICENVMImage::generateBinHeader(BBUICENVMImage *this)
{
  *((void *)this + 1) = 1;
  uint64_t result = *((void *)this + 6);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 24))(result);
    *((_DWORD *)this + 3) = result;
  }
  return result;
}

BBUDataSource *BBUDataSource::createFromEurekaMIFile(uint64_t a1, int a2, int a3)
{
  if (*(char *)(a1 + 23) >= 0) {
    long long v5 = (const char *)a1;
  }
  else {
    long long v5 = *(const char **)a1;
  }
  size_t v6 = strlen(v5);
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
    uint64_t v8 = operator new(v9 + 1);
    *(void *)&__dst[8] = v7;
    *(void *)&__dst[16] = v10 | 0x8000000000000000;
    *(void *)long long __dst = v8;
    goto LABEL_11;
  }
  __dst[23] = v6;
  uint64_t v8 = __dst;
  if (v6) {
LABEL_11:
  }
    memmove(v8, v5, v7);
  v8[v7] = 0;
  uint64_t v11 = (BBUDataSource *)operator new(0x30uLL);
  *(void *)uint64_t v11 = &unk_26CECA448;
  *(_OWORD *)((char *)v11 + 8) = 0u;
  *(_OWORD *)((char *)v11 + 24) = 0u;
  if (BBUFileDataSource::init((uint64_t)v11, __dst, a2))
  {
    (*(void (**)(BBUDataSource *))(*(void *)v11 + 8))(v11);
    uint64_t v11 = 0;
  }
  if ((__dst[23] & 0x80000000) != 0)
  {
    operator delete(*(void **)__dst);
    if (!v11) {
      return v11;
    }
  }
  else if (!v11)
  {
    return v11;
  }
  CFMutableDictionaryRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  char v20 = Mutable;
  int v19 = 0;
  memset(&__dst[4], 0, 32);
  *(_DWORD *)&__dst[20] = (*(uint64_t (**)(BBUDataSource *))(*(void *)v11 + 24))(v11);
  *(_DWORD *)&__dst[16] = (*(uint64_t (**)(BBUDataSource *))(*(void *)v11 + 24))(v11);
  *(_DWORD *)long long __dst = a3;
  CFDataAppendBytes(Mutable, __dst, 40);
  CFDataRef theData = (CFDataRef)0xAAAAAAAAAAAAAAAALL;
  BBUDataSource::createData(v11, &theData);
  CFDataRef v13 = theData;
  BytePtr = CFDataGetBytePtr(theData);
  CFIndex Length = CFDataGetLength(v13);
  CFDataAppendBytes(Mutable, BytePtr, Length);
  (*(void (**)(BBUDataSource *))(*(void *)v11 + 8))(v11);
  uint64_t v11 = (BBUDataSource *)operator new(0x18uLL);
  *((_DWORD *)v11 + 4) = 0;
  *(void *)uint64_t v11 = &unk_26CECE780;
  *((void *)v11 + 1) = Mutable;
  if (Mutable) {
    CFRetain(Mutable);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v11;
}

void sub_21DF8E3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, const void *a19)
{
}

void BBUDataSource::createData(BBUDataSource *this@<X0>, CFDataRef *a2@<X8>)
{
  unsigned int v4 = (*(uint64_t (**)(BBUDataSource *))(*(void *)this + 24))(this);
  if (v4)
  {
    size_t v5 = v4;
    size_t v6 = (char *)operator new(v4);
    size_t v7 = &v6[v5];
    bzero(v6, v5);
  }
  else
  {
    size_t v6 = 0;
    size_t v7 = 0;
  }
  int v18 = -1431655766;
  (*(void (**)(BBUDataSource *, char *, int64_t, int *, void))(*(void *)this + 16))(this, v6, v7 - v6, &v18, 0);
  if (v18 != v7 - v6)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 2, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Support/BBUDataSource.cpp", 0xD9u, (ctu::LogMessageBuffer *)"Assertion failure(copied == dataSize)", v10, v11, v12, v17);
  }
  CFDataRef v8 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v6, (v7 - v6));
  if (!v8)
  {
    CFDataRef v13 = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)v13, 2, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Support/BBUDataSource.cpp", 0xDCu, (ctu::LogMessageBuffer *)"Assertion failure(success)", v14, v15, v16, v17);
  }
  *a2 = v8;
  if (v6) {
    operator delete(v6);
  }
}

void sub_21DF8E5D4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(a1);
}

_DWORD *BBUDataSource::createFromEurekaMIData(BBUDataSource *this, const __CFData *a2, int a3)
{
  int v4 = (int)a2;
  CFMutableDictionaryRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  uint64_t v16 = Mutable;
  int v15 = 0;
  long long v14 = 0u;
  long long v13 = 0u;
  if (this) {
    int Length = CFDataGetLength(this);
  }
  else {
    int Length = 0;
  }
  HIDWORD(v13) = Length;
  LODWORD(v14) = Length;
  int v12 = a3;
  CFDataAppendBytes(Mutable, (const UInt8 *)&v12, 40);
  if (this)
  {
    BytePtr = CFDataGetBytePtr(this);
    CFIndex v9 = CFDataGetLength(this);
    CFDataAppendBytes(Mutable, BytePtr, v9);
  }
  uint64_t v10 = operator new(0x18uLL);
  v10[4] = v4;
  *(void *)uint64_t v10 = &unk_26CECE780;
  *((void *)v10 + 1) = Mutable;
  if (Mutable)
  {
    CFRetain(Mutable);
    CFRelease(Mutable);
  }
  return v10;
}

void sub_21DF8E704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  ctu::cf::CFSharedRef<__CFData>::~CFSharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void BBUDataSource::generateHash(uint64_t a1, unsigned __int8 *a2, int a3)
{
  unsigned int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24))(a1);
  size_t v7 = operator new[](0x100000uLL);
  if (a3 == 1)
  {
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v14.wbuf[12] = v11;
    *(_OWORD *)&v14.wbuf[14] = v11;
    *(_OWORD *)&v14.wbuf[8] = v11;
    *(_OWORD *)&v14.wbuf[10] = v11;
    *(_OWORD *)&v14.wbuf[4] = v11;
    *(_OWORD *)&v14.wbuf[6] = v11;
    *(_OWORD *)v14.wbuf = v11;
    *(_OWORD *)&v14.wbuf[2] = v11;
    *(_OWORD *)&v14.hash[4] = v11;
    *(_OWORD *)&v14.hash[6] = v11;
    *(_OWORD *)v14.hash = v11;
    *(_OWORD *)&v14.hash[2] = v11;
    *(_OWORD *)v14.count = v11;
    CC_SHA384_Init(&v14);
    if (v6)
    {
      uint64_t v12 = 0;
      do
      {
        CC_LONG v15 = 0;
        if (v6 >= 0x100000) {
          uint64_t v13 = 0x100000;
        }
        else {
          uint64_t v13 = v6;
        }
        (*(void (**)(uint64_t, void *, uint64_t, CC_LONG *, uint64_t))(*(void *)a1 + 16))(a1, v7, v13, &v15, v12);
        CC_SHA384_Update(&v14, v7, v15);
        uint64_t v12 = v15 + v12;
        v6 -= v15;
      }
      while (v6);
    }
    CC_SHA384_Final(a2, &v14);
  }
  else if (!a3)
  {
    v14.wbuf[2] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v14.hash[6] = v8;
    *(_OWORD *)v14.wbuf = v8;
    *(_OWORD *)&v14.hash[2] = v8;
    *(_OWORD *)&v14.hash[4] = v8;
    *(_OWORD *)v14.count = v8;
    *(_OWORD *)v14.hash = v8;
    CC_SHA256_Init((CC_SHA256_CTX *)&v14);
    if (v6)
    {
      uint64_t v9 = 0;
      do
      {
        CC_LONG v15 = 0;
        if (v6 >= 0x100000) {
          uint64_t v10 = 0x100000;
        }
        else {
          uint64_t v10 = v6;
        }
        (*(void (**)(uint64_t, void *, uint64_t, CC_LONG *, uint64_t))(*(void *)a1 + 16))(a1, v7, v10, &v15, v9);
        CC_SHA256_Update((CC_SHA256_CTX *)&v14, v7, v15);
        uint64_t v9 = v15 + v9;
        v6 -= v15;
      }
      while (v6);
    }
    CC_SHA256_Final(a2, (CC_SHA256_CTX *)&v14);
  }
  operator delete[](v7);
}

uint64_t BBUDataSource::saveDataToFile(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  memset(&v70, 170, sizeof(v70));
  pthread_mutex_lock(&ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance);
  unsigned int v6 = off_26AA89B50;
  if (!off_26AA89B50)
  {
    size_t v7 = (BBUPartitionManager *)operator new(0x18uLL);
    BBUPartitionManager::BBUPartitionManager(v7);
    long long v8 = operator new(0x20uLL);
    void *v8 = &unk_26CECF498;
    v8[1] = 0;
    v8[2] = 0;
    v8[3] = v7;
    uint64_t v9 = (std::__shared_weak_count *)off_26AA89B58;
    off_26AA89B50 = v7;
    off_26AA89B58 = v8;
    if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
    unsigned int v6 = off_26AA89B50;
  }
  uint64_t v10 = (std::__shared_weak_count *)off_26AA89B58;
  *(void *)&__b.f_bstd::string::size_type size = v6;
  __b.f_blocks = (uint64_t)off_26AA89B58;
  if (off_26AA89B58) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)off_26AA89B58 + 1, 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance);
  long long v11 = (uint64_t *)v6[1];
  if (!v11) {
LABEL_14:
  }
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  while (1)
  {
    while (1)
    {
      int v12 = *((_DWORD *)v11 + 8);
      if (v12 < 1) {
        break;
      }
      long long v11 = (uint64_t *)*v11;
      if (!v11) {
        goto LABEL_14;
      }
    }
    if ((v12 & 0x80000000) == 0) {
      break;
    }
    long long v11 = (uint64_t *)v11[1];
    if (!v11) {
      goto LABEL_14;
    }
  }
  if (*((char *)v11 + 63) < 0) {
    std::string::__init_copy_ctor_external(&v70, (const std::string::value_type *)v11[5], v11[6]);
  }
  else {
    std::string v70 = *(std::string *)(v11 + 5);
  }
  if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  if (*(char *)(a2 + 23) >= 0) {
    uint64_t v13 = (const char *)a2;
  }
  else {
    uint64_t v13 = *(const char **)a2;
  }
  int v14 = open(v13, 1537, 420);
  if (v14 < 0)
  {
    uint64_t v30 = 35;
    if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_86;
    }
    return v30;
  }
  uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24))(a1);
  uint64_t v16 = (char *)operator new[](v15);
  char v17 = v16;
  if (v15)
  {
    uint64_t v18 = 0;
    uint64_t v19 = v15;
    char v20 = v16;
    do
    {
      __b.f_bstd::string::size_type size = -1431655766;
      (*(void (**)(uint64_t, char *, uint64_t, statfs *, uint64_t))(*(void *)a1 + 16))(a1, v20, v19, &__b, v18);
      uint64_t v18 = (__b.f_bsize + v18);
      v20 += __b.f_bsize;
      uint64_t v19 = (v19 - __b.f_bsize);
    }
    while (v19);
  }
  int v69 = -1431655766;
  uint64_t v27 = (BBUpdaterCommon *)TelephonyUtilWriteToCompletion();
  if (!v27)
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0) {
        goto LABEL_41;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0) {
        goto LABEL_41;
      }
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      char v31 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
      _BBULog(15, 0, v31, "", "Wrote %u bytes to %s\n", v32, v33, v34, v69);
    }
LABEL_41:
    if (!a3)
    {
LABEL_44:
      uint64_t v30 = 0;
      goto LABEL_85;
    }
    memset(&__b, 0, 24);
    char v35 = bbufs::chownToWireless((uint64_t *)&__b, v14, v21, v22, v23, v24, v25, v26);
    char v36 = v35;
    if (SHIBYTE(__b.f_bfree) < 0)
    {
      operator delete(*(void **)&__b.f_bsize);
      if (v36) {
        goto LABEL_44;
      }
    }
    else if (v35)
    {
      goto LABEL_44;
    }
    pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
    uint64_t v55 = qword_26AA89AB0;
    if (!qword_26AA89AB0)
    {
      unint64_t v56 = (std::__shared_weak_count_vtbl *)operator new(0x38uLL);
      *(void *)&long long __str = 0;
      ctu::SharedSynchronizable<BBUError>::SharedSynchronizable(v56, "BBUError", QOS_CLASS_UTILITY, (NSObject **)&__str);
      if ((void)__str) {
        dispatch_release((dispatch_object_t)__str);
      }
      v56->__on_zero_shared_weak = 0;
      v56[1].~__shared_weak_count = 0;
      v56[1].~__shared_weak_count_0 = 0;
      std::shared_ptr<BBUError>::shared_ptr[abi:ne180100]<BBUError,std::shared_ptr<BBUError> ctu::SharedSynchronizable<BBUError>::make_shared_ptr<BBUError>(BBUError*)::{lambda(BBUError*)#1},void>((std::__shared_weak_count_vtbl **)&__b, v56);
      long long v57 = *(_OWORD *)&__b.f_bsize;
      *(void *)&__b.f_bstd::string::size_type size = 0;
      __b.f_blocks = 0;
      uint64_t v58 = (std::__shared_weak_count *)off_26AA89AB8;
      *(_OWORD *)&qword_26AA89AB0 = v57;
      if (v58 && !atomic_fetch_add(&v58->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
        std::__shared_weak_count::__release_weak(v58);
      }
      f_blocks = (std::__shared_weak_count *)__b.f_blocks;
      if (__b.f_blocks && !atomic_fetch_add((atomic_ullong *volatile)(__b.f_blocks + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))f_blocks->__on_zero_shared)(f_blocks);
        std::__shared_weak_count::__release_weak(f_blocks);
      }
      uint64_t v55 = qword_26AA89AB0;
    }
    uint64_t v60 = (std::__shared_weak_count *)off_26AA89AB8;
    v68.__r_.__value_.__r.__words[0] = v55;
    v68.__r_.__value_.__l.__size_ = (std::string::size_type)off_26AA89AB8;
    if (off_26AA89AB8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)off_26AA89AB8 + 1, 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
    dispatch_object_t object = (dispatch_object_t)operator new(0x20uLL);
    long long v73 = xmmword_21DFAB690;
    strcpy((char *)object, "Failed to change file ownership");
    *(void *)&__b.f_bstd::string::size_type size = MEMORY[0x263EF8330];
    __b.f_blocks = 0x40000000;
    __b.f_bfree = (uint64_t)___ZN8BBUError8addErrorERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE9BBUReturn_block_invoke;
    __b.f_bavail = (uint64_t)&__block_descriptor_tmp_8;
    __b.f_files = v55;
    __b.f_ffree = (uint64_t)&object;
    __b.f_fsid.val[0] = 35;
    __p[0] = &__b;
    *(void *)&long long __str = MEMORY[0x263EF8330];
    *((void *)&__str + 1) = 0x40000000;
    *(void *)&long long v78 = ___ZNK3ctu20SharedSynchronizableI8BBUErrorE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
    *((void *)&v78 + 1) = &__block_descriptor_tmp_13_0;
    *(void *)&long long v79 = v55;
    *((void *)&v79 + 1) = __p;
    uint64_t v61 = *(NSObject **)(v55 + 16);
    if (*(void *)(v55 + 24))
    {
      dispatch_async_and_wait(v61, &__str);
      if ((SHIBYTE(v73) & 0x80000000) == 0)
      {
LABEL_104:
        if (v60 && !atomic_fetch_add(&v60->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
          std::__shared_weak_count::__release_weak(v60);
        }
        goto LABEL_84;
      }
    }
    else
    {
      dispatch_sync(v61, &__str);
      if ((SHIBYTE(v73) & 0x80000000) == 0) {
        goto LABEL_104;
      }
    }
    operator delete(object);
    goto LABEL_104;
  }
  memset(&__b, 170, sizeof(__b));
  memset(&v68, 0, sizeof(v68));
  if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v28 = &v70;
  }
  else {
    uint64_t v28 = (std::string *)v70.__r_.__value_.__r.__words[0];
  }
  if (statfs((const char *)v28, &__b))
  {
    if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
    {
      v68.__r_.__value_.__l.__size_ = 18;
      uint64_t v29 = (std::string *)v68.__r_.__value_.__r.__words[0];
    }
    else
    {
      *((unsigned char *)&v68.__r_.__value_.__s + 23) = 18;
      uint64_t v29 = &v68;
    }
    strcpy((char *)v29, ": failed to statfs");
  }
  else
  {
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long __str = 0u;
    long long v78 = 0u;
    snprintf((char *)&__str, 0x80uLL, ": free %llu avail %llu", __b.f_bfree * __b.f_bsize, __b.f_bavail * __b.f_bsize);
    std::string::__assign_external(&v68, (const std::string::value_type *)&__str);
  }
  pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
  uint64_t v37 = qword_26AA89AB0;
  if (!qword_26AA89AB0)
  {
    uint64_t v38 = (std::__shared_weak_count_vtbl *)operator new(0x38uLL);
    dispatch_object_t object = 0;
    ctu::SharedSynchronizable<BBUError>::SharedSynchronizable(v38, "BBUError", QOS_CLASS_UTILITY, &object);
    if (object) {
      dispatch_release(object);
    }
    v38->__on_zero_shared_weak = 0;
    v38[1].~__shared_weak_count = 0;
    v38[1].~__shared_weak_count_0 = 0;
    std::shared_ptr<BBUError>::shared_ptr[abi:ne180100]<BBUError,std::shared_ptr<BBUError> ctu::SharedSynchronizable<BBUError>::make_shared_ptr<BBUError>(BBUError*)::{lambda(BBUError*)#1},void>((std::__shared_weak_count_vtbl **)&__str, v38);
    long long v39 = __str;
    long long __str = 0uLL;
    char v40 = (std::__shared_weak_count *)off_26AA89AB8;
    *(_OWORD *)&qword_26AA89AB0 = v39;
    if (v40 && !atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
    int v41 = (std::__shared_weak_count *)*((void *)&__str + 1);
    if (*((void *)&__str + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&__str + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
    uint64_t v37 = qword_26AA89AB0;
  }
  int v42 = (std::__shared_weak_count *)off_26AA89AB8;
  uint64_t v66 = v37;
  unint64_t v67 = off_26AA89AB8;
  if (off_26AA89AB8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)off_26AA89AB8 + 1, 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
  BBUpdaterCommon::BBUStrError(v27, &v62);
  int v43 = std::string::insert(&v62, 0, "Failed to write file: ", 0x16uLL);
  long long v44 = *(_OWORD *)&v43->__r_.__value_.__l.__data_;
  v63.__r_.__value_.__r.__words[2] = v43->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v63.__r_.__value_.__l.__data_ = v44;
  v43->__r_.__value_.__l.__size_ = 0;
  v43->__r_.__value_.__r.__words[2] = 0;
  v43->__r_.__value_.__r.__words[0] = 0;
  if ((v68.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    long long v45 = &v68;
  }
  else {
    long long v45 = (std::string *)v68.__r_.__value_.__r.__words[0];
  }
  if ((v68.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v68.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v68.__r_.__value_.__l.__size_;
  }
  unint64_t v47 = std::string::append(&v63, (const std::string::value_type *)v45, size);
  long long v48 = *(_OWORD *)&v47->__r_.__value_.__l.__data_;
  std::string::size_type v65 = v47->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v48;
  v47->__r_.__value_.__l.__size_ = 0;
  v47->__r_.__value_.__r.__words[2] = 0;
  v47->__r_.__value_.__r.__words[0] = 0;
  *(void *)&long long __str = MEMORY[0x263EF8330];
  *((void *)&__str + 1) = 0x40000000;
  *(void *)&long long v78 = ___ZN8BBUError8addErrorERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE9BBUReturn_block_invoke;
  *((void *)&v78 + 1) = &__block_descriptor_tmp_8;
  *(void *)&long long v79 = v37;
  *((void *)&v79 + 1) = __p;
  LODWORD(v80) = 35;
  p_str = &__str;
  dispatch_object_t object = (dispatch_object_t)MEMORY[0x263EF8330];
  *(void *)&long long v73 = 0x40000000;
  *((void *)&v73 + 1) = ___ZNK3ctu20SharedSynchronizableI8BBUErrorE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  int8x16_t v74 = &__block_descriptor_tmp_13_0;
  uint64_t v75 = v37;
  p_p_str = &p_str;
  int v49 = *(NSObject **)(v37 + 16);
  if (*(void *)(v37 + 24))
  {
    dispatch_async_and_wait(v49, &object);
    if ((SHIBYTE(v65) & 0x80000000) == 0) {
      goto LABEL_68;
    }
  }
  else
  {
    dispatch_sync(v49, &object);
    if ((SHIBYTE(v65) & 0x80000000) == 0)
    {
LABEL_68:
      if ((SHIBYTE(v63.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_69;
      }
      goto LABEL_74;
    }
  }
  operator delete(__p[0]);
  if ((SHIBYTE(v63.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_69:
    if ((SHIBYTE(v62.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_75;
  }
LABEL_74:
  operator delete(v63.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v62.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_70:
    if (!v42) {
      goto LABEL_78;
    }
    goto LABEL_76;
  }
LABEL_75:
  operator delete(v62.__r_.__value_.__l.__data_);
  if (!v42) {
    goto LABEL_78;
  }
LABEL_76:
  if (!atomic_fetch_add(&v42->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
    std::__shared_weak_count::__release_weak(v42);
  }
LABEL_78:
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) != 0) {
      goto LABEL_80;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) != 0)
    {
LABEL_80:
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        uint64_t v50 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
        _BBULog(15, 0, v50, "", "Failed writing %u bytes to %s - wrote only %u\n", v51, v52, v53, v15);
      }
    }
  }
  if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v68.__r_.__value_.__l.__data_);
  }
LABEL_84:
  uint64_t v30 = 35;
LABEL_85:
  close(v14);
  operator delete[](v17);
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
LABEL_86:
  }
    operator delete(v70.__r_.__value_.__l.__data_);
  return v30;
}

void sub_21DF8F3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,dispatch_object_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,NSObject *object)
{
  if (object) {
    dispatch_release(object);
  }
  operator delete(v42);
  pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
  if (a34 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_21DF8F544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

uint64_t __cxx_global_var_init_27()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUPartitionManager>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance, &dword_21DE8A000);
  }
  return result;
}

void eUICC::Firmware::CreateFromData(const void **a1@<X0>, const void **a2@<X1>, const void **a3@<X2>, void *a4@<X8>)
{
  void (***v63)(CFErrorRef *__return_ptr, void);
  ctu *v64;
  const void *v65;
  const void *v66;
  int v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  CFErrorRef *v72;
  unint64_t v73;
  std::__shared_weak_count *v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  long long v80;
  CFTypeRef cf;
  char v82;
  const void *v83;
  const void *v84;
  const void *v85;
  unint64_t v86;
  unint64_t v87;
  ctu::cf *v88;
  CFErrorRef error[3];

  uint64_t v86 = 0xAAAAAAAAAAAAAAAALL;
  int8x16_t v87 = 0xAAAAAAAAAAAAAAAALL;
  long long v8 = (char *)operator new(0x48uLL);
  uint64_t v9 = *a1;
  int8x16_t v85 = v9;
  if (v9) {
    CFRetain(v9);
  }
  uint64_t v10 = *a2;
  long long v84 = v10;
  if (v10) {
    CFRetain(v10);
  }
  *((void *)v8 + 1) = 0;
  *((void *)v8 + 2) = 0;
  *(void *)long long v8 = &unk_26CECF568;
  *((void *)v8 + 3) = v9;
  if (v9) {
    CFRetain(v9);
  }
  *((void *)v8 + 4) = v10;
  if (v10) {
    CFRetain(v10);
  }
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  uint64_t v86 = (unint64_t)v8;
  long long v11 = (std::__shared_weak_count *)operator new(0x20uLL);
  v11->__shared_owners_ = 0;
  p_shared_owners = &v11->__shared_owners_;
  v11->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CECF5E0;
  v11->__shared_weak_owners_ = 0;
  v11[1].__vftable = (std::__shared_weak_count_vtbl *)v8;
  int8x16_t v87 = (unint64_t)v11;
  uint64_t v13 = (std::__shared_weak_count *)*((void *)v8 + 2);
  if (!v13)
  {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v11->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((void *)v8 + 1) = v8;
    *((void *)v8 + 2) = v11;
    if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_51;
    }
LABEL_14:
    if (!v10) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (v13->__shared_owners_ != -1) {
    goto LABEL_14;
  }
  atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(&v11->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  *((void *)v8 + 1) = v8;
  *((void *)v8 + 2) = v11;
  std::__shared_weak_count::__release_weak(v13);
  if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_14;
  }
LABEL_51:
  ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
  std::__shared_weak_count::__release_weak(v11);
  if (v10) {
LABEL_15:
  }
    CFRelease(v10);
LABEL_16:
  if (v9) {
    CFRelease(v9);
  }
  int v14 = (void *)v86;
  uint64_t v15 = *a3;
  long long v83 = v15;
  if (v15) {
    CFRetain(v15);
  }
  CFTypeRef cf = 0;
  CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  error[0] = 0;
  error[1] = (CFErrorRef)&cf;
  char v20 = (ctu::cf *)CFPropertyListCreateWithData(v16, (CFDataRef)v15, 0, 0, error);
  int8x16_t v88 = v20;
  uint64_t v21 = *(const void **)error[1];
  if (error[0])
  {
    *(void *)error[1] = error[0];
    if (!v21) {
      goto LABEL_25;
    }
  }
  else
  {
    *(void *)error[1] = 0;
    if (!v21) {
      goto LABEL_25;
    }
  }
  CFRelease(v21);
LABEL_25:
  if (v20) {
    uint64_t v22 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  }
  else {
    uint64_t v22 = 0;
  }
  if (!v22)
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(25, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "Condition <<%s>> failed %s %s/%d\n", v17, v18, v19, (char)"plistRef");
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    ctu::cf::show((uint64_t *)error, (ctu::cf *)cf, v29);
    if (SHIBYTE(error[2]) >= 0) {
      uint64_t v33 = error;
    }
    else {
      LOBYTE(v33) = error[0];
    }
    _BBULog(22, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "%s\n", v30, v31, v32, (char)v33);
    goto LABEL_75;
  }
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(v20))
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(25, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "Condition <<%s>> failed %s %s/%d\n", v24, v25, v26, (char)"CFDictionaryGetTypeID() == CFGetTypeID(plistRef.get())");
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    ctu::cf::show((uint64_t *)error, v20, v34);
    if (SHIBYTE(error[2]) >= 0) {
      uint64_t v38 = error;
    }
    else {
      LOBYTE(v38) = error[0];
    }
    _BBULog(22, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "info.plist is wrong type %s\n", v35, v36, v37, (char)v38);
    goto LABEL_75;
  }
  if (v20)
  {
    CFTypeID v27 = CFGetTypeID(v20);
    if (v27 != CFDictionaryGetTypeID())
    {
      char v20 = 0;
      uint64_t v28 = (const void *)v14[5];
      v14[5] = 0;
      if (!v28) {
        goto LABEL_55;
      }
      goto LABEL_54;
    }
    CFRetain(v20);
  }
  uint64_t v28 = (const void *)v14[5];
  v14[5] = v20;
  if (v28)
  {
LABEL_54:
    CFRelease(v28);
    char v20 = (ctu::cf *)v14[5];
  }
LABEL_55:
  Value = (ctu::cf *)CFDictionaryGetValue(v20, @"com.apple.EmbeddedSoftwareRestore.eUICC.firmwareMac");
  if (!Value)
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(25, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "Condition <<%s>> failed %s %s/%d\n", v39, v40, v41, (char)"fwMacData");
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(22, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "Missing firmwareMac in info.plist -- firmware too old\n", v55, v56, v57, v79);
LABEL_77:
    int v53 = 0;
    uint64_t v54 = v88;
    if (!v88) {
      goto LABEL_79;
    }
    goto LABEL_78;
  }
  CFTypeID v43 = CFDataGetTypeID();
  if (v43 != CFGetTypeID(Value))
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(25, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "Condition <<%s>> failed %s %s/%d\n", v44, v45, v46, (char)"CFDataGetTypeID() == CFGetTypeID(fwMacData)");
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    ctu::cf::show((uint64_t *)error, Value, v58);
    if (SHIBYTE(error[2]) >= 0) {
      std::string v62 = error;
    }
    else {
      LOBYTE(v62) = error[0];
    }
    _BBULog(22, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "fwMacData is wrong type %s\n", v59, v60, v61, (char)v62);
LABEL_75:
    if (SHIBYTE(error[2]) < 0) {
      operator delete(error[0]);
    }
    goto LABEL_77;
  }
  memset(error, 0, sizeof(error));
  ctu::cf::assign();
  CFErrorRef v50 = error[0];
  long long v51 = *(_OWORD *)&error[1];
  uint64_t v52 = (void *)v14[6];
  if (v52)
  {
    v14[7] = v52;
    long long v80 = v51;
    operator delete(v52);
    long long v51 = v80;
    v14[6] = 0;
    v14[7] = 0;
    v14[8] = 0;
  }
  v14[6] = v50;
  *(_OWORD *)(v14 + 7) = v51;
  if ((void)v51 - (void)v50 != 8)
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(25, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "Condition <<%s>> failed %s %s/%d\n", v47, v48, v49, (char)"fwMac.size() == kFWMacSize");
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(22, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "firmwareMac is wrong size %zu\n", v76, v77, v78, *((unsigned char *)v14 + 56) - *((unsigned char *)v14 + 48));
    goto LABEL_77;
  }
  int v53 = 1;
  uint64_t v54 = v88;
  if (v88) {
LABEL_78:
  }
    CFRelease(v54);
LABEL_79:
  if (cf) {
    CFRelease(cf);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v53)
  {
    std::string v63 = (void (***)(CFErrorRef *__return_ptr, void))v86;
    int v64 = (ctu *)(*(uint64_t (**)(unint64_t))(*(void *)v86 + 8))(v86);
    uint64_t v66 = v65;
    memset(error, 170, sizeof(error));
    (**v63)(error, v63);
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    unint64_t v67 = SHIBYTE(error[2]);
    std::string v68 = (char)error[0];
    ctu::hex(v64, v66);
    unint64_t v72 = error;
    if (v67 < 0) {
      LOBYTE(v72) = v68;
    }
    _BBULog(22, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "eUICC Firmware loaded! Version %s MAC %s\n", v69, v70, v71, (char)v72);
    if (v82 < 0)
    {
      operator delete((void *)cf);
      uint64_t v75 = v87;
      *a4 = v63;
      a4[1] = v75;
      if ((SHIBYTE(error[2]) & 0x80000000) == 0) {
        return;
      }
    }
    else
    {
      long long v73 = v87;
      *a4 = v63;
      a4[1] = v73;
      if ((SHIBYTE(error[2]) & 0x80000000) == 0) {
        return;
      }
    }
    operator delete(error[0]);
  }
  else
  {
    *a4 = 0;
    a4[1] = 0;
    int8x16_t v74 = (std::__shared_weak_count *)v87;
    if (v87 && !atomic_fetch_add((atomic_ullong *volatile)(v87 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
      std::__shared_weak_count::__release_weak(v74);
    }
  }
}

void sub_21DF8FEB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,const void *a21,__int16 a22,char a23,char a24,int a25,__int16 a26,char a27,char a28,int a29,__int16 a30,char a31,char a32)
{
  if (*(char *)(v32 - 65) < 0) {
    operator delete(*(void **)(v32 - 88));
  }
  ctu::cf::CFSharedRef<void const>::~CFSharedRef((const void **)(v32 - 96));
  ctu::cf::CFSharedRef<__CFError>::~CFSharedRef((const void **)&__p);
  ctu::cf::CFSharedRef<__CFData>::~CFSharedRef(&a21);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)&a30);
  _Unwind_Resume(a1);
}

void *eUICC::Firmware::GetVersionString@<X0>(CFMutableDataRef *this@<X0>, void *a2@<X8>)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22[0] = v4;
  v22[1] = v4;
  long long v20 = v4;
  long long v21 = v4;
  *(_OWORD *)__len = v4;
  v18[0] = CFDataGetMutableBytePtr(this[3]);
  v18[1] = CFDataGetLength(this[3]);
  if (DERParseSequence((uint64_t)v18, 2u, (uint64_t)&eUICC::DER::firmwareImageItemSpec, (unint64_t)v22, 0x20uLL))
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 35, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/eUICC/Source/eUICCFirmware.cpp", 0x51u, (ctu::LogMessageBuffer *)"Assertion failure(( DR_Success == ret) && \"Invalid input Firmware.\")", v12, v13, v14, v18[0]);
    goto LABEL_13;
  }
  uint64_t result = DERParseSequenceContent((unint64_t *)v22, 3u, (uint64_t)&eUICC::DER::firmwareImageHeaderItemSpec, (unint64_t)__len, 0x30uLL);
  if (result)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 35, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/eUICC/Source/eUICCFirmware.cpp", 0x54u, (ctu::LogMessageBuffer *)"Assertion failure(( DR_Success == ret) && \"Invalid input Firmware.\")", v15, v16, v17, v18[0]);
LABEL_13:
  }
  size_t v6 = __len[1];
  if (__len[1] >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v7 = (const void *)__len[0];
  if (__len[1] >= 0x17)
  {
    size_t v8 = (__len[1] & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len[1] | 7) != 0x17) {
      size_t v8 = __len[1] | 7;
    }
    size_t v9 = v8 + 1;
    uint64_t v10 = operator new(v8 + 1);
    a2[1] = v6;
    a2[2] = v9 | 0x8000000000000000;
    *a2 = v10;
    a2 = v10;
  }
  else
  {
    *((unsigned char *)a2 + 23) = __len[1];
    if (!v6)
    {
      *(unsigned char *)a2 = 0;
      return result;
    }
  }
  uint64_t result = memmove(a2, v7, v6);
  *((unsigned char *)a2 + v6) = 0;
  return result;
}

void sub_21DF901D0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21DF901E4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t eUICC::Firmware::GetFWMac(eUICC::Firmware *this)
{
  return *((void *)this + 6);
}

CFTypeRef eUICC::Firmware::GetInstallTicket@<X0>(CFTypeRef this@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (const void *)*((void *)this + 4);
  if (v3 && (CFTypeID v4 = CFGetTypeID(*((CFTypeRef *)this + 4)), this = (CFTypeRef)CFDataGetTypeID(), (CFTypeRef)v4 == this))
  {
    *a2 = v3;
    return CFRetain(v3);
  }
  else
  {
    *a2 = 0;
  }
  return this;
}

uint64_t eUICC::Firmware::GetFirmwareAPDUs@<X0>(CFMutableDataRef *this@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = a2;
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v48 = v4;
  long long v49 = v4;
  v47[0] = CFDataGetMutableBytePtr(this[3]);
  v47[1] = CFDataGetLength(this[3]);
  memset(v46, 170, sizeof(v46));
  if (DERParseSequence((uint64_t)v47, 2u, (uint64_t)&eUICC::DER::firmwareImageItemSpec, (unint64_t)&v48, 0x20uLL))
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 35, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/eUICC/Source/eUICCFirmware.cpp", 0x71u, (ctu::LogMessageBuffer *)"Assertion failure(( DR_Success == ret) && \"Invalid input Firmware.\")", v34, v35, v36, v40);
    goto LABEL_33;
  }
  if (DERDecodeSeqInit((uint64_t)&v49, &v46[2], v46))
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 35, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/eUICC/Source/eUICCFirmware.cpp", 0x74u, (ctu::LogMessageBuffer *)"Assertion failure(( DR_Success == ret) && \"Invalid input Firmware.\")", v37, v38, v39, v40);
LABEL_33:
  }
  size_t v5 = 0;
  size_t v6 = &v45[1];
  size_t v7 = &eUICC::DER::firmwareImageAPDUItemSpec;
  uint64_t v41 = v3;
  while (1)
  {
    memset(v45, 170, sizeof(v45));
    uint64_t result = DERDecodeSeqNext(v46, v45);
    if (result) {
      break;
    }
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v43 = v10;
    long long v44 = v10;
    long long v42 = v10;
    if (DERParseSequenceContent(v6, 3u, (uint64_t)v7, (unint64_t)&v42, 0x30uLL))
    {
      uint64_t v25 = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)v25, 35, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/eUICC/Source/eUICCFirmware.cpp", 0x82u, (ctu::LogMessageBuffer *)"Assertion failure(( DR_Success == ret) && \"Corrupt eUICC FW Data!\")", v26, v27, v28, v40);
    }
    long long v11 = v42;
    long long v12 = v43;
    unint64_t v13 = v3[2];
    if ((unint64_t)v5 < v13)
    {
      *size_t v5 = v42;
      size_t v8 = v5 + 2;
      v5[1] = v12;
      goto LABEL_5;
    }
    uint64_t v14 = v6;
    uint64_t v15 = (_OWORD *)*v3;
    uint64_t v16 = ((uint64_t)v5 - *v3) >> 5;
    unint64_t v17 = v16 + 1;
    if ((unint64_t)(v16 + 1) >> 59) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v18 = v7;
    uint64_t v19 = v13 - (void)v15;
    if (v19 >> 4 > v17) {
      unint64_t v17 = v19 >> 4;
    }
    if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v20 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v20 = v17;
    }
    if (v20)
    {
      if (v20 >> 59) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      long long v21 = (char *)operator new(32 * v20);
      uint64_t v22 = (uint64_t)&v21[32 * v16];
      *(_OWORD *)uint64_t v22 = v11;
      *(_OWORD *)(v22 + 16) = v12;
      uint64_t v23 = v22;
      if (v5 != v15)
      {
        do
        {
LABEL_22:
          long long v24 = *(v5 - 1);
          *(_OWORD *)(v23 - 32) = *(v5 - 2);
          *(_OWORD *)(v23 - 16) = v24;
          v23 -= 32;
          v5 -= 2;
        }
        while (v5 != v15);
        size_t v5 = v15;
        size_t v8 = (_OWORD *)(v22 + 32);
        uint64_t *v41 = v23;
        v41[1] = v22 + 32;
        v41[2] = (uint64_t)&v21[32 * v20];
        if (!v15) {
          goto LABEL_20;
        }
LABEL_19:
        operator delete(v5);
        goto LABEL_20;
      }
    }
    else
    {
      long long v21 = 0;
      uint64_t v22 = 32 * v16;
      *(void *)uint64_t v22 = v42;
      *(void *)(v22 + 8) = *((void *)&v11 + 1);
      *(_OWORD *)(v22 + 16) = v12;
      uint64_t v23 = 32 * v16;
      if (v5 != v15) {
        goto LABEL_22;
      }
    }
    size_t v8 = (_OWORD *)(v22 + 32);
    uint64_t *v41 = v23;
    v41[1] = v22 + 32;
    v41[2] = (uint64_t)&v21[32 * v20];
    if (v5) {
      goto LABEL_19;
    }
LABEL_20:
    size_t v6 = v14;
    size_t v7 = v18;
    uint64_t v3 = v41;
LABEL_5:
    v3[1] = (uint64_t)v8;
    size_t v5 = v8;
  }
  if (result != 1)
  {
    uint64_t v29 = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)v29, 35, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/eUICC/Source/eUICCFirmware.cpp", 0x7Eu, (ctu::LogMessageBuffer *)"Assertion failure(( DR_Success == ret) && \"Corrupt eUICC FW Data!\")", v30, v31, v32, v40);
  }
  return result;
}

void sub_21DF905D4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21DF905E8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21DF90600(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  long long v11 = *(void **)a10;
  if (*(void *)a10)
  {
    *(void *)(a10 + 8) = v11;
    operator delete(v11);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Firmware::BundleVersionsSupported(uint64_t a1, std::string **a2)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  long long v4 = *a2;
  for (uint64_t i = a2[1]; i != v4; --i)
  {
    if (SHIBYTE(i[-1].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(i[-1].__r_.__value_.__l.__data_);
    }
  }
  a2[1] = v4;
  v51[0] = 0xAAAAAAAAAAAAAAAALL;
  v51[1] = 0xAAAAAAAAAAAAAAAALL;
  ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v51, *(const __CFDictionary **)(a1 + 40));
  context = a2;
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&__p, "com.apple.EmbeddedSoftwareRestore.eUICC.bootloaderVersionsSupported");
  CFArrayRef v6 = (const __CFArray *)(*(uint64_t (**)(void *, std::string::size_type))v51[0])(v51, __p.__r_.__value_.__r.__words[0]);
  CFArrayRef v7 = v6;
  if (v6)
  {
    CFTypeID v8 = CFGetTypeID(v6);
    CFTypeID TypeID = CFArrayGetTypeID();
    if (v8 == TypeID)
    {
      v54.length = CFArrayGetCount(v7);
      v54.location = 0;
      CFArrayApplyFunction(v7, v54, (CFArrayApplierFunction)ctu::cf::_Applier_InsertArrayDefault<std::string,std::back_insert_iterator<std::vector<std::string>>>, &context);
    }
    CFRelease(v7);
    MEMORY[0x223C1D120](&__p);
    if (v8 == TypeID) {
      goto LABEL_53;
    }
  }
  else
  {
    MEMORY[0x223C1D120](&__p);
  }
  uint64_t Int = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v51, @"com.apple.EmbeddedSoftwareRestore.eUICC.bootloaderMajorVersion");
  int v14 = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v51, @"com.apple.EmbeddedSoftwareRestore.eUICC.bootloaderMinorVersion");
  if ((Int & 0x80000000) == 0)
  {
    int v18 = v14;
    if ((v14 & 0x80000000) == 0)
    {
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x40) != 0) {
          goto LABEL_16;
        }
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x40) != 0)
        {
LABEL_16:
          if (gBBULogVerbosity >= 1) {
            _BBULog(22, 1, "eUICCFirmwareParser", "", "[LEGACY] Bundle Version: %d.%d\n", v15, v16, v17, Int);
          }
        }
      }
      eUICC::Firmware::BootloaderVersion((eUICC::Firmware *)Int, v18, &__p);
      uint64_t v19 = a2[2];
      unint64_t v20 = *a2;
      if (v19 == *a2)
      {
        if (v19)
        {
          uint64_t v26 = a2[1];
          uint64_t v27 = a2[2];
          if (v26 != v19)
          {
            do
            {
              if (SHIBYTE(v26[-1].__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v26[-1].__r_.__value_.__l.__data_);
              }
              --v26;
            }
            while (v26 != v19);
            uint64_t v27 = *a2;
          }
          a2[1] = v19;
          operator delete(v27);
          *a2 = 0;
          a2[1] = 0;
          a2[2] = 0;
        }
        uint64_t v30 = (std::string *)operator new(0x18uLL);
        *a2 = v30;
        a2[1] = v30;
        uint64_t v29 = v30 + 1;
        a2[2] = v30 + 1;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(v30, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        }
        else {
          *uint64_t v30 = __p;
        }
      }
      else if (a2[1] == v20)
      {
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external(*a2, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        }
        else
        {
          long long v28 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          v20->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
          *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v28;
        }
        uint64_t v29 = v20 + 1;
      }
      else
      {
        if (v20 != &__p)
        {
          if (SHIBYTE(v20->__r_.__value_.__r.__words[2]) < 0)
          {
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              p_p = &__p;
            }
            else {
              p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
            }
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type size = __p.__r_.__value_.__l.__size_;
            }
            std::string::__assign_no_alias<false>((void **)&(*a2)->__r_.__value_.__l.__data_, p_p, size);
          }
          else if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) != 0)
          {
            std::string::__assign_no_alias<true>(*a2, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          }
          else
          {
            long long v21 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            v20->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
            *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v21;
          }
        }
        uint64_t v29 = v20 + 1;
        for (j = a2[1]; j != v29; --j)
        {
          if (SHIBYTE(j[-1].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(j[-1].__r_.__value_.__l.__data_);
          }
        }
      }
      a2[1] = v29;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
LABEL_53:
      uint64_t v25 = 1;
      goto LABEL_54;
    }
  }
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  }
  _BBULog(25, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "Condition <<%s>> failed %s %s/%d\n", v15, v16, v17, (char)"success");
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  }
  _BBULog(22, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "Bunk legacy keys?\n", v22, v23, v24, v48);
  uint64_t v25 = 0;
LABEL_54:
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x40) == 0) {
      goto LABEL_66;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x40) == 0) {
      goto LABEL_66;
    }
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    uint64_t v33 = *a2;
    uint64_t v34 = a2[1];
    memset(&__dst, 0, sizeof(__dst));
    if (v33 != v34)
    {
      if (v33 != &__dst)
      {
        if (SHIBYTE(v33->__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__assign_no_alias<true>(&__dst, v33->__r_.__value_.__l.__data_, v33->__r_.__value_.__l.__size_);
        }
        else
        {
          long long v35 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
          __dst.__r_.__value_.__r.__words[2] = v33->__r_.__value_.__r.__words[2];
          *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v35;
        }
      }
      if (", ")
      {
        for (k = v33 + 1; k != v34; ++k)
        {
          *((unsigned char *)&__p.__r_.__value_.__s + 23) = 2;
          memmove(&__p, ", ", 2uLL);
          __p.__r_.__value_.__s.__data_[2] = 0;
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            uint64_t v45 = &__p;
          }
          else {
            uint64_t v45 = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type v46 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v46 = __p.__r_.__value_.__l.__size_;
          }
          std::string::append(&__dst, (const std::string::value_type *)v45, v46);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
          int v42 = SHIBYTE(k->__r_.__value_.__r.__words[2]);
          if (v42 >= 0) {
            long long v43 = (const std::string::value_type *)k;
          }
          else {
            long long v43 = (const std::string::value_type *)k->__r_.__value_.__r.__words[0];
          }
          if (v42 >= 0) {
            std::string::size_type v44 = HIBYTE(k->__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v44 = k->__r_.__value_.__l.__size_;
          }
          std::string::append(&__dst, v43, v44);
        }
      }
      else
      {
        for (m = v33 + 1; m != v34; ++m)
        {
          memset(&__p, 0, sizeof(__p));
          std::string::append(&__dst, (const std::string::value_type *)&__p, 0);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
          int v38 = SHIBYTE(m->__r_.__value_.__r.__words[2]);
          if (v38 >= 0) {
            uint64_t v39 = (const std::string::value_type *)m;
          }
          else {
            uint64_t v39 = (const std::string::value_type *)m->__r_.__value_.__r.__words[0];
          }
          if (v38 >= 0) {
            std::string::size_type v40 = HIBYTE(m->__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v40 = m->__r_.__value_.__l.__size_;
          }
          std::string::append(&__dst, v39, v40);
        }
      }
    }
    _BBULog(22, 0, "eUICCFirmwareParser", "", "Supported Bootloader Versions success %d ret { %s }\n", v10, v11, v12, v25);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__dst.__r_.__value_.__l.__data_);
    }
  }
LABEL_66:
  MEMORY[0x223C1D170](v51);
  return v25;
}

void sub_21DF90DB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, char a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  uint64_t v29 = v28;
  *(void *)(v27 + 8) = v29;
  if (a27 < 0)
  {
    operator delete(__p);
    MEMORY[0x223C1D170](&a20);
    _Unwind_Resume(a1);
  }
  MEMORY[0x223C1D170](&a20);
  _Unwind_Resume(a1);
}

void eUICC::Firmware::BootloaderVersion(eUICC::Firmware *this@<X0>, int a2@<W1>, std::string *a3@<X8>)
{
  std::to_string(&v11, (int)this);
  size_t v5 = std::string::append(&v11, ".", 1uLL);
  long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  v12.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v6;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, a2);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  size_t v9 = std::string::append(&v12, (const std::string::value_type *)p_p, size);
  *a3 = *v9;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_9:
      if ((SHIBYTE(v11.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        return;
      }
LABEL_13:
      operator delete(v11.__r_.__value_.__l.__data_);
      return;
    }
  }
  else if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_9;
  }
  operator delete(v12.__r_.__value_.__l.__data_);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_13;
  }
}

void sub_21DF90FD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((a26 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a20 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else if ((a26 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a21);
  if ((a20 & 0x80000000) == 0) {
LABEL_4:
  }
    _Unwind_Resume(exception_object);
LABEL_7:
  operator delete(a15);
  _Unwind_Resume(exception_object);
}

void eUICC::Firmware::~Firmware(eUICC::Firmware *this)
{
  eUICC::Firmware::~Firmware(this);

  operator delete(v1);
}

{
  void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  std::__shared_weak_count *v6;

  *(void *)this = &unk_26CECF568;
  uint64_t v2 = (void *)*((void *)this + 6);
  if (v2)
  {
    *((void *)this + 7) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (const void *)*((void *)this + 5);
  if (v3) {
    CFRelease(v3);
  }
  long long v4 = (const void *)*((void *)this + 4);
  if (v4) {
    CFRelease(v4);
  }
  size_t v5 = (const void *)*((void *)this + 3);
  if (v5) {
    CFRelease(v5);
  }
  long long v6 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
}

void std::__shared_ptr_pointer<eUICC::Firmware *,std::shared_ptr<eUICC::Firmware>::__shared_ptr_default_delete<eUICC::Firmware,eUICC::Firmware>,std::allocator<eUICC::Firmware>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<eUICC::Firmware *,std::shared_ptr<eUICC::Firmware>::__shared_ptr_default_delete<eUICC::Firmware,eUICC::Firmware>,std::allocator<eUICC::Firmware>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 40))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<eUICC::Firmware *,std::shared_ptr<eUICC::Firmware>::__shared_ptr_default_delete<eUICC::Firmware,eUICC::Firmware>,std::allocator<eUICC::Firmware>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021DFAE59ELL) {
    return a1 + 24;
  }
  if (((v3 & 0x800000021DFAE59ELL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000021DFAE59ELL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021DFAE59ELL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void ctu::cf::_Applier_InsertArrayDefault<std::string,std::back_insert_iterator<std::vector<std::string>>>(uint64_t a1, uint64_t *a2)
{
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v7 = 0;
  ctu::cf::assign();
  uint64_t v3 = *a2;
  unint64_t v4 = *(void *)(v3 + 8);
  if (v4 >= *(void *)(v3 + 16))
  {
    *(void *)(v3 + 8) = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)v3, (uint64_t)__p);
    if (SHIBYTE(v7) < 0) {
LABEL_8:
    }
      operator delete(__p[0]);
  }
  else
  {
    if (SHIBYTE(v7) < 0)
    {
      std::string::__init_copy_ctor_external(*(std::string **)(v3 + 8), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    }
    else
    {
      long long v5 = *(_OWORD *)__p;
      *(void *)(v4 + 16) = v7;
      *(_OWORD *)unint64_t v4 = v5;
    }
    *(void *)(v3 + 8) = v4 + 24;
    *(void *)(v3 + 8) = v4 + 24;
    if (SHIBYTE(v7) < 0) {
      goto LABEL_8;
    }
  }
}

void sub_21DF912A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  *(void *)(v15 + 8) = v16;
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::function<BOOL ()(void)>::~function(void *a1)
{
  uint64_t v2 = (void *)a1[3];
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

uint64_t BBUBootLogger::BBUBootLogger(uint64_t a1, int a2, uint64_t a3)
{
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v8, "com.apple.telephony.bb", "BBUBootLogger");
  uint64_t v6 = v9;
  dispatch_object_t object = 0;
  ctu::SharedSynchronizable<BBUBootLogger>::SharedSynchronizable((void *)a1, "BBUBootLogger", QOS_CLASS_UTILITY, &object);
  if (object) {
    dispatch_release(object);
  }
  MEMORY[0x223C1D040](a1 + 32, v6);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v8);
  *(_DWORD *)(a1 + 128) = a2;
  *(void *)(a1 + 136) = a3;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(void *)(a1 + 120) = 0;
  return a1;
}

void sub_21DF9141C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::SharedSynchronizable<BBUBootLogger>::~SharedSynchronizable(v2);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va);
  _Unwind_Resume(a1);
}

void sub_21DF91438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, dispatch_object_t object)
{
  if (object) {
    dispatch_release(object);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a10);
  _Unwind_Resume(a1);
}

void ___ZN13BBUBootLogger18openTransport_syncEv_block_invoke(void *a1, int a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a1[6];
  if (!v3) {
    return;
  }
  uint64_t v5 = a1[4];
  uint64_t v6 = std::__shared_weak_count::lock(v3);
  if (!v6) {
    return;
  }
  uint64_t v7 = v6;
  if (!a1[5]) {
    goto LABEL_11;
  }
  if (a2 == 1)
  {
    CFTypeID v8 = *(NSObject **)(v5 + 32);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_11;
    }
    __int16 v12 = 0;
    uint64_t v9 = "#D status error";
    uint64_t v10 = (uint8_t *)&v12;
    goto LABEL_14;
  }
  if (a2)
  {
    CFTypeID v8 = *(NSObject **)(v5 + 32);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_11;
    }
    __int16 v11 = 0;
    uint64_t v9 = "#D status unknown";
    uint64_t v10 = (uint8_t *)&v11;
LABEL_14:
    _os_log_debug_impl(&dword_21DE8A000, v8, OS_LOG_TYPE_DEBUG, v9, v10, 2u);
    if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_15;
    }
    return;
  }
  CFTypeID v8 = *(NSObject **)(v5 + 32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    __int16 v13 = 0;
    uint64_t v9 = "#D status not ready";
    uint64_t v10 = (uint8_t *)&v13;
    goto LABEL_14;
  }
LABEL_11:
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
LABEL_15:
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

uint64_t __copy_helper_block_e8_40c38_ZTSNSt3__18weak_ptrI13BBUBootLoggerEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c38_ZTSNSt3__18weak_ptrI13BBUBootLoggerEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZN13BBUBootLogger18openTransport_syncEv_block_invoke_2(void *a1, int a2, const char *a3, unsigned int a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = (std::__shared_weak_count *)a1[6];
  if (v5)
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = std::__shared_weak_count::lock(v5);
    if (v10)
    {
      __int16 v11 = v10;
      uint64_t v12 = a1[5];
      if (v12)
      {
        __int16 v13 = operator new[](a4 + 1);
        int v14 = *(NSObject **)(v9 + 32);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          int v19 = *(_DWORD *)(v12 + 128);
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)long long v21 = a2;
          *(_WORD *)&v21[4] = 1024;
          *(_DWORD *)&v21[6] = a4;
          __int16 v22 = 1024;
          int v23 = v19;
          _os_log_debug_impl(&dword_21DE8A000, v14, OS_LOG_TYPE_DEBUG, "#D read status is %d, size is %u, output is %u", buf, 0x14u);
        }
        bzero(v13, a4 + 1);
        strncpy((char *)v13, a3, a4);
        int v15 = *(_DWORD *)(v12 + 128);
        if (v15 == 1)
        {
          uint64_t v17 = *(BBUFeedback **)(v12 + 136);
          if (v17)
          {
            BBUFeedback::handleComment(v17, "BBUBootLogger: %s", (const char *)v13);
          }
          else
          {
            int v18 = *(NSObject **)(v9 + 32);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_21DE8A000, v18, OS_LOG_TYPE_ERROR, "feedback object is null", buf, 2u);
            }
          }
        }
        else if (v15 == 2)
        {
          uint64_t v16 = *(NSObject **)(v9 + 32);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)long long v21 = v13;
            _os_log_impl(&dword_21DE8A000, v16, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
          }
        }
        operator delete[](v13);
      }
      if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
}

void sub_21DF91820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL BBUBootLogger::openTransport(BBUBootLogger *this)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = ___ZN13BBUBootLogger13openTransportEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_9_0;
  v4[4] = this;
  uint64_t v5 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 0x40000000;
  v6[2] = ___ZNK3ctu20SharedSynchronizableI13BBUBootLoggerE20execute_wrapped_syncIU13block_pointerFbvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS6__block_invoke;
  v6[3] = &__block_descriptor_tmp_18_0;
  v6[4] = this;
  v6[5] = &v5;
  uint64_t v7 = v6;
  uint64_t v2 = (char *)this + 16;
  uint64_t v1 = *((void *)this + 2);
  if (*((void *)v2 + 1))
  {
    char v14 = -86;
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v9 = 0x40000000;
    uint64_t v10 = ___ZN8dispatch19async_and_wait_implIRU13block_pointerFbvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS4_17integral_constantIbLb0EEE_block_invoke;
    __int16 v11 = &__block_descriptor_tmp_21_0;
    uint64_t v12 = &v14;
    __int16 v13 = &v7;
    dispatch_async_and_wait(v1, &block);
  }
  else
  {
    char v14 = -86;
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v9 = 0x40000000;
    uint64_t v10 = ___ZN8dispatch9sync_implIRU13block_pointerFbvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS4_17integral_constantIbLb0EEE_block_invoke;
    __int16 v11 = &__block_descriptor_tmp_20;
    uint64_t v12 = &v14;
    __int16 v13 = &v7;
    dispatch_sync(v1, &block);
  }
  return v14 != 0;
}

uint64_t ___ZN13BBUBootLogger13openTransportEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 32);
  uint64_t v2 = (std::__shared_weak_count *)v1[1];
  if (!v2 || (uint64_t v3 = *v1, (v4 = std::__shared_weak_count::lock(v2)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v5 = v4;
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v5);
  }
  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v16 = v6;
  long long v17 = v6;
  long long v14 = v6;
  long long v15 = v6;
  long long v13 = v6;
  TelephonyBasebandPCITransportInitParameters();
  *((void *)&v13 + 1) = v1[2];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1174405120;
  v11[2] = ___ZN13BBUBootLogger18openTransport_syncEv_block_invoke;
  v11[3] = &__block_descriptor_tmp_14;
  v11[4] = v1;
  v11[5] = v3;
  uint64_t v12 = v5;
  atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  *(void *)&long long v14 = v11;
  LODWORD(v13) = 20;
  *(void *)((char *)&v15 + 4) = 0x40000000002;
  DWORD2(v14) = 5000;
  LODWORD(v15) = v15 | 4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1174405120;
  v9[2] = ___ZN13BBUBootLogger18openTransport_syncEv_block_invoke_2;
  v9[3] = &__block_descriptor_tmp_7_0;
  v9[4] = v1;
  v9[5] = v3;
  uint64_t v10 = v5;
  atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  *(void *)&long long v16 = v9;
  uint64_t v7 = TelephonyBasebandPCITransportCreate();
  if (v10) {
    std::__shared_weak_count::__release_weak(v10);
  }
  if (v12) {
    std::__shared_weak_count::__release_weak(v12);
  }
  std::__shared_weak_count::__release_weak(v5);
  return v7;
}

void sub_21DF91B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22)
{
  if (a15)
  {
    std::__shared_weak_count::__release_weak(a15);
    uint64_t v24 = a22;
    if (!a22)
    {
LABEL_3:
      std::__shared_weak_count::__release_weak(v22);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    uint64_t v24 = a22;
    if (!a22) {
      goto LABEL_3;
    }
  }
  std::__shared_weak_count::__release_weak(v24);
  std::__shared_weak_count::__release_weak(v22);
  _Unwind_Resume(a1);
}

void sub_21DF91BC4(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(a1);
}

void *ctu::SharedSynchronizable<BBUBootLogger>::~SharedSynchronizable(void *a1)
{
  uint64_t v2 = a1[3];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[2];
  if (v3) {
    dispatch_release(v3);
  }
  unint64_t v4 = (std::__shared_weak_count *)a1[1];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

std::__shared_weak_count_vtbl **std::shared_ptr<BBUBootLogger>::shared_ptr[abi:ne180100]<BBUBootLogger,std::shared_ptr<BBUBootLogger> ctu::SharedSynchronizable<BBUBootLogger>::make_shared_ptr<BBUBootLogger>(BBUBootLogger*)::{lambda(BBUBootLogger*)#1},void>(std::__shared_weak_count_vtbl **a1, std::__shared_weak_count_vtbl *a2)
{
  *a1 = a2;
  unint64_t v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = &v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CECF6A0;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = a2;
  a1[1] = (std::__shared_weak_count_vtbl *)v4;
  if (!a2) {
    return a1;
  }
  long long v6 = (std::__shared_weak_count *)a2->~__shared_weak_count_0;
  if (v6)
  {
    if (v6->__shared_owners_ == -1)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      a2->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))a2;
      a2->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v4;
      std::__shared_weak_count::__release_weak(v6);
      if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_8;
      }
    }
    return a1;
  }
  atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  a2->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))a2;
  a2->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v4;
  if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
LABEL_8:
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void sub_21DF91D38(void *a1)
{
  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[2], v1, (dispatch_function_t)std::shared_ptr<BBUBootLogger> ctu::SharedSynchronizable<BBUBootLogger>::make_shared_ptr<BBUBootLogger>(BBUBootLogger*)::{lambda(BBUBootLogger*)#1}::operator() const(BBUBootLogger*)::{lambda(void *)#1}::__invoke);
  __cxa_rethrow();
}

void sub_21DF91D60(_Unwind_Exception *a1)
{
}

void std::__shared_ptr_pointer<BBUBootLogger *,std::shared_ptr<BBUBootLogger> ctu::SharedSynchronizable<BBUBootLogger>::make_shared_ptr<BBUBootLogger>(BBUBootLogger*)::{lambda(BBUBootLogger *)#1},std::allocator<BBUBootLogger>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<BBUBootLogger *,std::shared_ptr<BBUBootLogger> ctu::SharedSynchronizable<BBUBootLogger>::make_shared_ptr<BBUBootLogger>(BBUBootLogger*)::{lambda(BBUBootLogger *)#1},std::allocator<BBUBootLogger>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<BBUBootLogger *,std::shared_ptr<BBUBootLogger> ctu::SharedSynchronizable<BBUBootLogger>::make_shared_ptr<BBUBootLogger>(BBUBootLogger*)::{lambda(BBUBootLogger *)#1},std::allocator<BBUBootLogger>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableI13BBUBootLoggerE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableI13BBUBootLoggerE15make_shared_ptrIS1_EENSt3__110shared_ptrI"
                                "T_EEPS6_EUlPS1_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableI13BBUBootLoggerE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableI13BBUBootLoggerE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void std::shared_ptr<BBUBootLogger> ctu::SharedSynchronizable<BBUBootLogger>::make_shared_ptr<BBUBootLogger>(BBUBootLogger*)::{lambda(BBUBootLogger*)#1}::operator() const(BBUBootLogger*)::{lambda(void *)#1}::__invoke(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(unsigned int (**)(uint64_t))(a1 + 96);
    if (v2)
    {
      unint64_t v3 = (_OWORD *)(a1 + 40);
      if (v2(a1 + 40))
      {
        TelephonyUtilTransportFree();
        *(void *)(a1 + 120) = 0;
        *(_OWORD *)(a1 + 88) = 0u;
        *(_OWORD *)(a1 + 104) = 0u;
        *(_OWORD *)(a1 + 56) = 0u;
        *(_OWORD *)(a1 + 72) = 0u;
        _OWORD *v3 = 0u;
      }
    }
    MEMORY[0x223C1D060](a1 + 32);
    unint64_t v4 = *(NSObject **)(a1 + 24);
    if (v4) {
      dispatch_release(v4);
    }
    uint64_t v5 = *(NSObject **)(a1 + 16);
    if (v5) {
      dispatch_release(v5);
    }
    long long v6 = *(std::__shared_weak_count **)(a1 + 8);
    if (v6) {
      std::__shared_weak_count::__release_weak(v6);
    }
    operator delete((void *)a1);
  }
}

void *ctu::SharedSynchronizable<BBUBootLogger>::SharedSynchronizable(void *a1, const char *a2, dispatch_qos_class_t a3, dispatch_object_t *a4)
{
  CFTypeID v8 = *a4;
  if (*a4) {
    dispatch_retain(*a4);
  }
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  uint64_t v10 = dispatch_queue_create_with_target_V2(a2, initially_inactive, v8);
  dispatch_set_qos_class_floor(v10, a3, 0);
  dispatch_activate(v10);
  *a1 = 0;
  a1[1] = 0;
  a1[2] = v10;
  if (v10) {
    dispatch_retain(v10);
  }
  __int16 v11 = *a4;
  a1[3] = *a4;
  if (v11) {
    dispatch_retain(v11);
  }
  if (v10) {
    dispatch_release(v10);
  }
  if (v8) {
    dispatch_release(v8);
  }
  return a1;
}

void *___ZNK3ctu20SharedSynchronizableI13BBUBootLoggerE20execute_wrapped_syncIU13block_pointerFbvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS6__block_invoke(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

uint64_t ___ZN8dispatch9sync_implIRU13block_pointerFbvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS4_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 16))();
  **(unsigned char **)(a1 + 32) = result;
  return result;
}

uint64_t ___ZN8dispatch19async_and_wait_implIRU13block_pointerFbvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS4_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 16))();
  **(unsigned char **)(a1 + 32) = result;
  return result;
}

uint64_t BBUEUR4PersonalizationParameters::getFusingState(uint64_t a1, _DWORD *a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  if (v3)
  {
    int v6 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 24))(v3);
    *a2 = ctu::TelephonyUtilRadioFusingInferFusingStateFromCertID((ctu *)&v6, v4);
    return 0;
  }
  else
  {
    *a2 = 0;
    return 3;
  }
}

uint64_t BBUEUR4PersonalizationParameters::setPublicKeyHash(uint64_t a1, CFDataRef a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  *(void *)(a1 + 40) = a2;
  if (a2)
  {
    CFDataRef v5 = (const __CFData *)(*(uint64_t (**)(CFDataRef))(*(void *)a2 + 16))(a2);
    a2 = BBUEURPersonalizationParameters::EURCertID::createFromPublicKeyHashData(v5, v6);
  }
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
  }
  *(void *)(a1 + 24) = a2;
  return result;
}

void BBUEUR4PersonalizationParameters::~BBUEUR4PersonalizationParameters(BBUEUR4PersonalizationParameters *this)
{
  BBUPersonalizationParameters::~BBUPersonalizationParameters(this);

  operator delete(v1);
}

void BBUEURDSPImage::BBUEURDSPImage(BBUEURDSPImage *this, BBUDataSource *a2, unsigned int a3, uint64_t a4)
{
  BBUEURMIImage::BBUEURMIImage(this, a2, a4);
  *CFDataRef v5 = &unk_26CECF758;
  v5[8] = 0;
  CFDataRef v6 = (void **)(v5 + 8);
  v5[9] = 0;
  v5[10] = 0;
  unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v23[7] = v7;
  v23[8] = v7;
  v23[5] = v7;
  v23[6] = v7;
  v23[3] = v7;
  v23[4] = v7;
  v23[1] = v7;
  v23[2] = v7;
  v23[0] = v7;
  long long v21 = v7;
  long long v22 = v7;
  long long v19 = v7;
  *(_OWORD *)std::string __p = v7;
  long long v17 = v7;
  long long v18 = v7;
  long long v16 = v7;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v16, (uint64_t)"DSP", 3);
  std::ostream::operator<<();
  if ((BYTE8(v22) & 0x10) != 0)
  {
    uint64_t v10 = v22;
    if ((unint64_t)v22 < *((void *)&v19 + 1))
    {
      *(void *)&long long v22 = *((void *)&v19 + 1);
      uint64_t v10 = *((void *)&v19 + 1);
    }
    __int16 v11 = (const void *)v19;
    size_t v8 = v10 - v19;
    if ((unint64_t)(v10 - v19) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_20;
    }
  }
  else
  {
    if ((BYTE8(v22) & 8) == 0)
    {
      size_t v8 = 0;
      HIBYTE(v15) = 0;
      p_dst = &__dst;
      goto LABEL_14;
    }
    __int16 v11 = (const void *)*((void *)&v17 + 1);
    size_t v8 = *((void *)&v18 + 1) - *((void *)&v17 + 1);
    if (*((void *)&v18 + 1) - *((void *)&v17 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_20:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v8 >= 0x17)
  {
    uint64_t v12 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v12 = v8 | 7;
    }
    uint64_t v13 = v12 + 1;
    p_dst = (long long *)operator new(v12 + 1);
    *((void *)&__dst + 1) = v8;
    unint64_t v15 = v13 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    goto LABEL_13;
  }
  HIBYTE(v15) = v8;
  p_dst = &__dst;
  if (v8) {
LABEL_13:
  }
    memmove(p_dst, v11, v8);
LABEL_14:
  *((unsigned char *)p_dst + v8) = 0;
  if (*((char *)this + 87) < 0) {
    operator delete(*v6);
  }
  *(_OWORD *)CFDataRef v6 = __dst;
  v6[2] = (void *)v15;
  *(void *)&long long v16 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v16 + *(void *)(v16 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v16 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v21) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x223C1DDF0](v23);
}

void sub_21DF9242C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  if (*(char *)(v13 + 87) < 0)
  {
    operator delete(*v14);
    *(void *)uint64_t v13 = &unk_26CECEAE8;
    uint64_t v16 = *(void *)(v13 + 8);
    if (!v16) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else
  {
    *(void *)uint64_t v13 = &unk_26CECEAE8;
    uint64_t v16 = *(void *)(v13 + 8);
    if (!v16) {
      goto LABEL_3;
    }
  }
  (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  _Unwind_Resume(exception_object);
}

void BBUEURDSPImage::~BBUEURDSPImage(void **this)
{
  *this = &unk_26CECF758;
  if (*((char *)this + 87) < 0)
  {
    operator delete(this[8]);
    *this = &unk_26CECEAE8;
    uint64_t v2 = this[1];
    if (!v2) {
      return;
    }
  }
  else
  {
    *this = &unk_26CECEAE8;
    uint64_t v2 = this[1];
    if (!v2) {
      return;
    }
  }
  (*(void (**)(void *))(*(void *)v2 + 8))(v2);
}

void BBUEURDSPImage::~BBUEURDSPImage(BBUEURDSPImage *this)
{
  *(void *)this = &unk_26CECF758;
  if ((*((char *)this + 87) & 0x80000000) == 0)
  {
    *(void *)this = &unk_26CECEAE8;
    uint64_t v2 = *((void *)this + 1);
    if (!v2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  operator delete(*((void **)this + 8));
  *(void *)this = &unk_26CECEAE8;
  uint64_t v2 = *((void *)this + 1);
  if (v2) {
LABEL_3:
  }
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
LABEL_4:

  operator delete(this);
}

uint64_t BBUEURDSPImage::getName(BBUEURDSPImage *this)
{
  uint64_t result = (uint64_t)this + 64;
  if (*((char *)this + 87) < 0) {
    return *(void *)result;
  }
  return result;
}

void BBUICEBinaryImage::BBUICEBinaryImage(BBUICEBinaryImage *this, BBUDataSource *a2, const char *__s, int a4)
{
  *(void *)this = &unk_26CECF7B8;
  size_t v8 = (char *)this + 16;
  size_t v9 = strlen(__s);
  if (v9 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v10 = v9;
  if (v9 >= 0x17)
  {
    uint64_t v12 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17) {
      uint64_t v12 = v9 | 7;
    }
    uint64_t v13 = v12 + 1;
    __int16 v11 = operator new(v12 + 1);
    *((void *)this + 3) = v10;
    *((void *)this + 4) = v13 | 0x8000000000000000;
    *((void *)this + 2) = v11;
    goto LABEL_8;
  }
  *((unsigned char *)this + 39) = v9;
  __int16 v11 = v8;
  if (v9) {
LABEL_8:
  }
    memmove(v11, __s, v10);
  *((unsigned char *)v11 + v10) = 0;
  *((_DWORD *)this + 10) = a4;
  *((void *)this + 6) = a2;
  *((void *)this + 1) = 1;
  if (a2) {
    *((_DWORD *)this + 3) = (*(uint64_t (**)(BBUDataSource *))(*(void *)a2 + 24))(a2);
  }
}

void sub_21DF927A4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 39) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

void BBUICEBinaryImage::~BBUICEBinaryImage(BBUICEBinaryImage *this)
{
  *(void *)this = &unk_26CECF7B8;
  uint64_t v2 = *((void *)this + 6);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (*((char *)this + 39) < 0) {
    operator delete(*((void **)this + 2));
  }
}

{
  uint64_t v2;
  BBUICEBinaryImage *v3;
  uint64_t vars8;

  *(void *)this = &unk_26CECF7B8;
  uint64_t v2 = *((void *)this + 6);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (*((char *)this + 39) < 0)
  {
    operator delete(*((void **)this + 2));
    uint64_t v3 = this;
  }
  else
  {
    uint64_t v3 = this;
  }
  operator delete(v3);
}

void *BBUICEBinaryImage::getWritePayloadData(BBUICEBinaryImage *this, unsigned __int8 *a2, uint64_t a3, unsigned int a4)
{
  uint64_t result = (void *)(*(uint64_t (**)(BBUICEBinaryImage *))(*(void *)this + 32))(this);
  if ((int)result + 8 <= a4)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 80, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Images/ICE/BBUICEBinaryImage.cpp", 0x1Eu, (ctu::LogMessageBuffer *)"Assertion failure(( offset < (getWritePayloadLength() + kBinHeaderSize)) && \"Error: Chunk size is not sufficient to write payload data of the binary image.\")", v11, v12, v13, v20);
    goto LABEL_14;
  }
  int v21 = -1431655766;
  if (a4 <= 7)
  {
    if (8 - a4 >= a3) {
      size_t v9 = a3;
    }
    else {
      size_t v9 = 8 - a4;
    }
    uint64_t result = memcpy(a2, (char *)this + a4 + 8, v9);
    a2 += v9;
    a3 = (a3 - v9);
  }
  if (a3)
  {
    uint64_t result = (void *)(*(uint64_t (**)(void, unsigned __int8 *, uint64_t, int *, void))(**((void **)this + 6)
                                                                                                  + 16))(*((void *)this + 6), a2, a3, &v21, a4 + *((_DWORD *)this + 10) - 8);
    if (result)
    {
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 80, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Images/ICE/BBUICEBinaryImage.cpp", 0x2Eu, (ctu::LogMessageBuffer *)"Assertion failure((ret == kBBUReturnSuccess) && \"Failed to copy binary image payload data to buffer!\")", v14, v15, v16, v20);
    }
    else
    {
      if (v21 == a3) {
        return result;
      }
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 80, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Images/ICE/BBUICEBinaryImage.cpp", 0x2Fu, (ctu::LogMessageBuffer *)"Assertion failure((amountCopied == amount) && \"Copied data size mismatch: Failed to copy binary image payload data to buffer!\")", v17, v18, v19, v20);
    }
LABEL_14:
  }
  return result;
}

void sub_21DF92A9C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21DF92AB0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_21DF92AC4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUICEBinaryImage::getName(BBUICEBinaryImage *this)
{
  uint64_t result = (uint64_t)this + 16;
  if (*((char *)this + 39) < 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t BBUICEBinaryImage::getWritePayloadLength(BBUICEBinaryImage *this)
{
  uint64_t v1 = *((void *)this + 6);
  if (v1) {
    return (*(unsigned int (**)(uint64_t))(*(void *)v1 + 24))(v1) + 8;
  }
  else {
    return 8;
  }
}

uint64_t BBUICEBinaryImage::getOpenPayloadData(BBUICEBinaryImage *this)
{
  return 0;
}

uint64_t BBUICEBinaryImage::getOpenPayloadLength(BBUICEBinaryImage *this)
{
  return 0;
}

void BBUICEBinaryImage::generateHash(uint64_t a1, unsigned __int8 *a2, int a3)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3) {
      BBUDataSource::generateHash(v3, a2, a3);
    }
  }
}

uint64_t BBUICEBinaryImage::generateBinHeader(BBUICEBinaryImage *this)
{
  *((void *)this + 1) = 1;
  uint64_t result = *((void *)this + 6);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 24))(result);
    *((_DWORD *)this + 3) = result;
  }
  return result;
}

void BasebandUpdaterTransport::create(void **a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t *a5@<X8>)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  *a5 = 0xAAAAAAAAAAAAAAAALL;
  size_t v10 = (char *)operator new(0xD8uLL);
  ACFUACIPCTransport::ACFUACIPCTransport((ACFUACIPCTransport *)v10);
  *(void *)size_t v10 = &unk_26CECF828;
  *((void *)v10 + 20) = 0;
  uint64_t v11 = (const void **)(v10 + 160);
  *((void *)v10 + 21) = 0;
  *((void *)v10 + 22) = 0;
  v10[184] = 0;
  *(_DWORD *)(v10 + 185) = 16777217;
  *((void *)v10 + 25) = 0;
  *((void *)v10 + 26) = 0;
  *((void *)v10 + 24) = 0;
  *a5 = (uint64_t)v10;
  uint64_t v13 = (void (**)(void **))*a1;
  uint64_t v12 = (std::__shared_weak_count *)a1[1];
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v15 = *a2;
  uint64_t v14 = (std::__shared_weak_count *)a2[1];
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  Controller = (ACFULogging *)TelephonyBasebandCreateController();
  uint64_t v17 = *v11;
  void *v11 = Controller;
  if (v17)
  {
    CFRelease(v17);
    Controller = (ACFULogging *)*v11;
  }
  if (Controller) {
    uint64_t v18 = ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::get;
  }
  else {
    uint64_t v18 = 0;
  }
  if (!v18)
  {
    ACFULogging::getLogInstance(Controller);
    long long v22 = (ACFULogging *)ACFULogging::handleMessage();
    char v23 = 0;
    goto LABEL_35;
  }
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v19 = (std::__shared_weak_count *)*((void *)v10 + 22);
  *((void *)v10 + 21) = v15;
  *((void *)v10 + 22) = v14;
  if (v19) {
    std::__shared_weak_count::__release_weak(v19);
  }
  v10[184] = a3 & 1;
  v10[185] = a4 & 1;
  if (a3)
  {
    v10[186] = BYTE1(a4) & 1;
    v10[187] = BYTE2(a4) & 1;
    v10[188] = (a4 & 0x1000000) == 0;
  }
  if (HIDWORD(a3))
  {
    ACFULogging::getLogInstance((ACFULogging *)v19);
    ACFULogging::handleMessage();
    *((_DWORD *)v10 + 10) = HIDWORD(a3);
    *((_DWORD *)v10 + 11) = HIDWORD(a3);
  }
  char v20 = v10 + 56;
  uint64_t v29 = (void (**)(void **))&unk_26CECF968;
  int v21 = (void **)*((void *)v10 + 10);
  if (v21 != (void **)(v10 + 56))
  {
    *((void *)v10 + 7) = &unk_26CECF968;
    uint64_t v31 = v21;
    *((void *)v10 + 10) = v20;
    if (v21 != (void **)&v29) {
      goto LABEL_21;
    }
LABEL_25:
    v29[4]((void **)&v29);
    goto LABEL_26;
  }
  unint64_t v33 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v31 = 0;
  uint64_t v32 = (void (**)(void **, uint64_t))&unk_26CECF968;
  (*(void (**)(char *, void (***)(void **)))(*(void *)v20 + 24))(v10 + 56, &v29);
  (*(void (**)(void))(**((void **)v10 + 10) + 32))(*((void *)v10 + 10));
  *((void *)v10 + 10) = 0;
  uint64_t v31 = (void **)&v29;
  v32[3]((void **)&v32, (uint64_t)(v10 + 56));
  ((void (*)(void (***)(void **, uint64_t)))v32[4])(&v32);
  *((void *)v10 + 10) = v20;
  int v21 = v31;
  if (v31 == (void **)&v29) {
    goto LABEL_25;
  }
LABEL_21:
  if (v21) {
    (*((void (**)(void **))*v21 + 5))(v21);
  }
LABEL_26:
  unint64_t v24 = v10 + 88;
  uint64_t v29 = (void (**)(void **))&unk_26CECF9F8;
  uint64_t v30 = (std::__shared_weak_count *)v10;
  uint64_t v25 = (void **)*((void *)v10 + 14);
  if (v25 != (void **)(v10 + 88))
  {
    *((void *)v10 + 11) = &unk_26CECF9F8;
    *((void *)v10 + 12) = v10;
    uint64_t v31 = v25;
    *((void *)v10 + 14) = v24;
    if (v25 != (void **)&v29) {
      goto LABEL_28;
    }
LABEL_43:
    v29[4]((void **)&v29);
    uint64_t v29 = v13;
    uint64_t v30 = v12;
    if (!v12) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  unint64_t v33 = (unint64_t)v10;
  unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v31 = 0;
  uint64_t v32 = (void (**)(void **, uint64_t))&unk_26CECF9F8;
  (*(void (**)(char *, void (***)(void **)))(*((void *)v10 + 11) + 24))(v10 + 88, &v29);
  (*(void (**)(void))(**((void **)v10 + 14) + 32))(*((void *)v10 + 14));
  *((void *)v10 + 14) = 0;
  uint64_t v31 = (void **)&v29;
  v32[3]((void **)&v32, (uint64_t)(v10 + 88));
  ((void (*)(void (***)(void **, uint64_t)))v32[4])(&v32);
  *((void *)v10 + 14) = v24;
  uint64_t v25 = v31;
  if (v31 == (void **)&v29) {
    goto LABEL_43;
  }
LABEL_28:
  if (v25) {
    (*((void (**)(void **))*v25 + 5))(v25);
  }
  uint64_t v29 = v13;
  uint64_t v30 = v12;
  if (!v12) {
    goto LABEL_32;
  }
LABEL_31:
  atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_32:
  long long v22 = (ACFULogging *)ACFUACIPCTransport::init();
  char v23 = (char)v22;
  uint64_t v26 = v30;
  if (v30 && !atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
    std::__shared_weak_count::__release_weak(v26);
  }
LABEL_35:
  if (v14) {
    std::__shared_weak_count::__release_weak(v14);
  }
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  if ((v23 & 1) == 0)
  {
    ACFULogging::getLogInstance(v22);
    ACFULogging::handleMessage();
    uint64_t v27 = *a5;
    *a5 = 0;
    if (v27)
    {
      uint64_t v28 = *(void (**)(void))(*(void *)v27 + 64);
      v28();
    }
  }
}

void sub_21DF93284(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15)
{
  uint64_t v17 = *v15;
  uint64_t *v15 = 0;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 64))(v17);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BasebandUpdaterTransport::IOACIPCHelper::init(BasebandUpdaterTransport::IOACIPCHelper *this, const char *a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  int v43 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3052000000;
  v39[3] = __Block_byref_object_copy__3;
  v39[4] = __Block_byref_object_dispose__3;
  v37[4] = v39;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3254779904;
  v38[2] = ___ZN24BasebandUpdaterTransport13IOACIPCHelper4initEPKcj_block_invoke;
  v38[3] = &__block_descriptor_48_e8_32r_e8_v12__0I8l;
  v38[4] = &v40;
  v38[5] = this;
  v39[5] = v38;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3254779904;
  v37[2] = ___ZN24BasebandUpdaterTransport13IOACIPCHelper4initEPKcj_block_invoke_6;
  v37[3] = &__block_descriptor_40_e8_32r_e8_v12__0I8l;
  std::string::size_type v44 = 0;
  uint64_t v4 = IOServiceMatching("IOAppleConvergedIPCInterface");
  CFDataRef v5 = v4;
  uint64_t v32 = v4;
  if (v4) {
    CFDataRef v6 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  }
  else {
    CFDataRef v6 = 0;
  }
  if (v6)
  {
    long long v7 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, 0x600u);
    size_t v8 = v7;
    std::string::size_type v44 = v7;
    if (v7) {
      size_t v9 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
    }
    else {
      size_t v9 = 0;
    }
    if (v9)
    {
      CFDictionarySetValue(v5, @"ACIPCInterfaceProtocol", v7);
      CFDictionarySetValue(v5, @"ACIPCInterfaceProviderDevice", @"cellular");
    }
    else
    {
      ACFULogging::getLogInstance((ACFULogging *)v7);
      uint64_t TypeID = ACFULogging::handleMessage();
    }
    if (!v5) {
      goto LABEL_15;
    }
  }
  else
  {
    ACFULogging::getLogInstance(v4);
    uint64_t TypeID = ACFULogging::handleMessage();
    size_t v8 = 0;
    if (!v5) {
      goto LABEL_15;
    }
  }
  CFTypeID v11 = CFGetTypeID(v5);
  uint64_t TypeID = CFDictionaryGetTypeID();
  if (v11 == TypeID)
  {
    uint64_t v36 = v5;
    uint64_t TypeID = (uint64_t)CFRetain(v5);
    uint64_t v12 = v5;
    if (!v8) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v12 = 0;
  uint64_t v36 = 0;
  if (v8) {
LABEL_16:
  }
    CFRelease(v8);
LABEL_17:
  if (v5) {
    CFRelease(v5);
  }
  if (v12) {
    uint64_t v13 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    uint64_t v13 = 0;
  }
  if (!v13) {
    goto LABEL_50;
  }
  uint64_t v14 = (IOACIPCClass *)operator new(0xC0uLL);
  *((_OWORD *)v14 + 10) = 0u;
  *((_OWORD *)v14 + 11) = 0u;
  *((_OWORD *)v14 + 8) = 0u;
  *((_OWORD *)v14 + 9) = 0u;
  *((_OWORD *)v14 + 6) = 0u;
  *((_OWORD *)v14 + 7) = 0u;
  *((_OWORD *)v14 + 4) = 0u;
  *((_OWORD *)v14 + 5) = 0u;
  *((_OWORD *)v14 + 2) = 0u;
  *((_OWORD *)v14 + 3) = 0u;
  *(_OWORD *)uint64_t v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  IOACIPCClass::IOACIPCClass(v14);
  *(void *)uint64_t v14 = MEMORY[0x263F8BB10] + 16;
  uint64_t v15 = *((void *)this + 1);
  *((void *)this + 1) = v14;
  if (v15)
  {
    uint64_t TypeID = (*(uint64_t (**)(uint64_t))(*(void *)v15 + 8))(v15);
    if (!*((void *)this + 1)) {
      goto LABEL_50;
    }
  }
  dispatch_queue_t v16 = dispatch_queue_create("com.apple.bbu.acipcTransport", 0);
  uint64_t v17 = *((void *)this + 2);
  *((void *)this + 2) = v16;
  if (v17)
  {
    dispatch_release(v17);
    dispatch_queue_t v16 = (dispatch_queue_t)*((void *)this + 2);
  }
  if (!v16)
  {
    ACFULogging::getLogInstance(0);
LABEL_51:
    ACFULogging::handleMessage();
    uint64_t v28 = 0;
    goto LABEL_39;
  }
  uint64_t TypeID = (uint64_t)operator new(0x78uLL);
  *(void *)(TypeID + 112) = 0;
  *(void *)uint64_t TypeID = 1018212795;
  *(_OWORD *)(TypeID + 8) = 0u;
  *(_OWORD *)(TypeID + 24) = 0u;
  *(void *)(TypeID + 40) = 0;
  *(void *)(TypeID + 48) = 850045863;
  *(_OWORD *)(TypeID + 56) = 0u;
  *(_OWORD *)(TypeID + 72) = 0u;
  *(_OWORD *)(TypeID + 88) = 0u;
  *(_OWORD *)(TypeID + 100) = 0u;
  uint64_t v18 = *((void *)this + 3);
  *((void *)this + 3) = TypeID;
  if (v18)
  {
    std::mutex::~mutex((std::mutex *)(v18 + 48));
    std::condition_variable::~condition_variable((std::condition_variable *)v18);
    operator delete(v19);
    if (!*((void *)this + 3))
    {
LABEL_50:
      ACFULogging::getLogInstance((ACFULogging *)TypeID);
      goto LABEL_51;
    }
  }
  ACFULogging::getLogInstance((ACFULogging *)TypeID);
  char v20 = (ACFULogging *)ACFULogging::handleMessage();
  uint64_t v32 = 0;
  unint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v21 = *((void *)this + 1);
  uint64_t v22 = *((void *)this + 2);
  ACFULogging::getLogInstance(v20);
  ACFULogging::handleMessage();
  char v23 = (ACFULogging *)(*(uint64_t (**)(uint64_t, __CFDictionary *, uint64_t, void *, void *, void))(*(void *)v21 + 24))(v21, v12, v22, v37, &__block_literal_global_6, 0);
  if (v23)
  {
    v45[0] = &unk_26CECFB18;
    std::string::size_type v46 = (ACFULogging *)v45;
    char v24 = ACFUSynchronize::Syncher::wait();
    uint64_t v25 = v46;
    if (v46 == (ACFULogging *)v45)
    {
      uint64_t v25 = (ACFULogging *)(*(uint64_t (**)(void *))(v45[0] + 32))(v45);
      if (v24)
      {
LABEL_36:
        if (!*((unsigned char *)v33 + 24))
        {
          uint64_t v25 = (ACFULogging *)(*(uint64_t (**)(void, void))(**((void **)this + 1) + 40))(*((void *)this + 1), *((unsigned int *)v41 + 6));
          if (!v25)
          {
            _Block_object_dispose(&v32, 8);
            ACFULogging::getLogInstance(v27);
            ACFULogging::handleMessage();
            uint64_t v28 = 1;
            goto LABEL_39;
          }
        }
        ACFULogging::getLogInstance(v25);
        ACFULogging::handleMessage();
        goto LABEL_54;
      }
    }
    else
    {
      if (v46) {
        uint64_t v25 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *))(*(void *)v46 + 40))(v46);
      }
      if (v24) {
        goto LABEL_36;
      }
    }
    uint64_t v26 = *((void *)this + 2);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3254779904;
    block[2] = ___ZN24BasebandUpdaterTransport13IOACIPCHelper4initEPKcj_block_invoke_2;
    block[3] = &__block_descriptor_48_e8_32r40r_e5_v8__0l;
    block[4] = v39;
    block[5] = &v32;
    dispatch_sync(v26, block);
    goto LABEL_36;
  }
  ACFULogging::getLogInstance(v23);
  ACFULogging::handleMessage();
LABEL_54:
  _Block_object_dispose(&v32, 8);
  uint64_t v28 = 0;
LABEL_39:
  io_object_t v29 = *((_DWORD *)v41 + 6);
  if (v29) {
    IOObjectRelease(v29);
  }
  if (v12) {
    CFRelease(v12);
  }
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v40, 8);
  return v28;
}

void sub_21DF93A14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

uint64_t ___ZN24BasebandUpdaterTransport13IOACIPCHelper4initEPKcj_block_invoke(ACFULogging *a1, int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();
  *(_DWORD *)(*(void *)(*((void *)a1 + 4) + 8) + 24) = a2;
  IOObjectRetain(*(_DWORD *)(*(void *)(*((void *)a1 + 4) + 8) + 24));
  v6[0] = &unk_26CECFA88;
  long long v7 = v6;
  ACFUSynchronize::Syncher::notify();
  uint64_t result = (uint64_t)v7;
  if (v7 == v6) {
    return (*(uint64_t (**)(void *))(v6[0] + 32))(v6);
  }
  if (v7) {
    return (*(uint64_t (**)(void *, uint64_t))(*v7 + 40))(v7, v4);
  }
  return result;
}

void sub_21DF93C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::function<void ()(void)>::~function((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t ___ZN24BasebandUpdaterTransport13IOACIPCHelper4initEPKcj_block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(void))(result + 16))();
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = 0;
  }
  return result;
}

uint64_t ___ZN24BasebandUpdaterTransport13IOACIPCHelper4initEPKcj_block_invoke_9(ACFULogging *a1)
{
  return ACFULogging::handleMessage();
}

uint64_t ___ZN24BasebandUpdaterTransport13IOACIPCHelper4initEPKcj_block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) = 0;
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  return result;
}

void BasebandUpdaterTransport::getBoardParameters(BasebandUpdaterTransport *this@<X0>, char a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  __dst[5] = *MEMORY[0x263EF8340];
  if ((a2 & 1) == 0)
  {
    long long v72 = 0u;
    *(_OWORD *)std::string __p = 0u;
    v69[0] = 32;
    __dst[0] = 57005;
    v64[0] = 8;
    *(void *)std::string v70 = 0xDEADBEEFDEADBEEFLL;
    v63[0] = 8;
    unsigned int v61 = 4;
    *(_DWORD *)bytes = 0;
    unsigned int v59 = 4;
    *(_DWORD *)uint64_t v60 = 0;
    *(_WORD *)uint64_t v58 = -8531;
    UInt8 v57 = -34;
    UInt8 v56 = -34;
    UInt8 v55 = -34;
    UInt8 v54 = -34;
    UInt8 v53 = -34;
    ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage();
    CFDataRef v6 = (std::__shared_weak_count *)operator new(0xE8uLL);
    v6->__shared_owners_ = 0;
    v6->__shared_weak_owners_ = 0;
    v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CECFB98;
    uint64_t v26 = operator new(0x40uLL);
    v65[1] = (IOACIPCClass *)(v26 + 4);
    *(void *)&long long v66 = v26 + 4;
    *uint64_t v26 = xmmword_26448A480;
    v26[1] = *(_OWORD *)&off_26448A490;
    v26[2] = xmmword_26448A4A0;
    v26[3] = *(_OWORD *)off_26448A4B0;
    v65[0] = (IOACIPCClass *)v26;
    MEMORY[0x223C1C5F0](&v6[1], v65);
    if (v65[0])
    {
      v65[1] = v65[0];
      operator delete(v65[0]);
    }
    v65[0] = 0;
    uint64_t v27 = (BasebandUpdaterTransport::IOACIPCHelper *)operator new(0x20uLL);
    *(void *)uint64_t v27 = &unk_26CECF938;
    *((void *)v27 + 1) = 0;
    *((void *)v27 + 2) = 0;
    *((void *)v27 + 3) = 0;
    uint64_t v28 = BasebandUpdaterTransport::IOACIPCHelper::init(v27, "rom");
    if ((v28 & 1) == 0)
    {
      long long v51 = (ACFULogging *)(*(uint64_t (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(void *)v27 + 8))(v27);
      ACFULogging::getLogInstance(v51);
      uint64_t v52 = (ACFULogging *)ACFULogging::handleMessage();
      ACFULogging::getLogInstance(v52);
      ACFULogging::handleMessage();
      uint64_t v27 = 0;
      int v50 = 3019;
      goto LABEL_42;
    }
    v65[0] = *((IOACIPCClass **)v27 + 1);
    if (!v65[0])
    {
      ACFULogging::getLogInstance((ACFULogging *)v28);
      ACFULogging::handleMessage();
      int v50 = 3000;
      goto LABEL_42;
    }
    io_object_t v29 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
    if (a3)
    {
      BootNonce = (ACFULogging *)ACFUACIPCTransport::generateBootNonce(this, v65);
      if (BootNonce)
      {
        ACFULogging::getLogInstance(BootNonce);
        ACFULogging::handleMessage();
        int v50 = 3008;
        goto LABEL_42;
      }
      Register = (ACFULogging *)ACFUACIPCTransport::readRegister(this, v65, 5, (unsigned __int8 *)__p, v69);
      if (Register)
      {
        ACFULogging::getLogInstance(Register);
        ACFULogging::handleMessage();
        int v50 = 3017;
        goto LABEL_42;
      }
      ACFULogging::getLogInstance(Register);
      uint64_t v32 = (ACFULogging *)ACFULogging::handleMessage();
      if (v69[0] - 33 <= 0xFFFFFFDF)
      {
        ACFULogging::getLogInstance(v32);
        ACFULogging::handleMessage();
        int v50 = 3018;
        goto LABEL_42;
      }
      CFAllocatorRef v33 = *v29;
      CFDataRef v34 = CFDataCreate(*v29, (const UInt8 *)__p, 32);
      v6[3].__shared_owners_ = (uint64_t)v34;
      LOBYTE(v6[3].__shared_weak_owners_) = v34 != 0;
      char v35 = (ACFULogging *)ACFUACIPCTransport::readRegister(this, v65, 13, (unsigned __int8 *)__dst, v64);
      if (v35)
      {
        ACFULogging::getLogInstance(v35);
        ACFULogging::handleMessage();
        int v50 = 3007;
        goto LABEL_42;
      }
      ACFULogging::getLogInstance(v35);
      uint64_t v36 = (ACFULogging *)ACFULogging::handleMessage();
      if (v64[0] - 9 <= 0xFFFFFFF7)
      {
        ACFULogging::getLogInstance(v36);
        ACFULogging::handleMessage();
        int v50 = 3009;
        goto LABEL_42;
      }
      CFDataRef v37 = CFDataCreate(v33, (const UInt8 *)__dst, 8);
      v6[4].__vftable = (std::__shared_weak_count_vtbl *)v37;
      LOBYTE(v6[4].__shared_owners_) = v37 != 0;
    }
    int v38 = (ACFULogging *)ACFUACIPCTransport::readRegister(this, v65, 3, v70, v63);
    if (v38 || *(void *)v70 == 0xDEADBEEFDEADBEEFLL)
    {
      ACFULogging::getLogInstance(v38);
    }
    else
    {
      uint64_t v39 = (ACFULogging *)ACFUACIPCTransport::readRegister(this, v65, 2, bytes, &v61);
      if (!v39)
      {
        UInt8 v57 = bytes[0];
        if (bytes[0] == 222 || (*(_WORD *)uint64_t v58 = *(_WORD *)&bytes[2], *(unsigned __int16 *)&bytes[2] == 57005))
        {
          ACFULogging::getLogInstance(v39);
        }
        else
        {
          uint64_t v40 = (ACFULogging *)ACFUACIPCTransport::readRegister(this, v65, 1, v60, &v59);
          if (!v40)
          {
            UInt8 v54 = (*(_DWORD *)v60 >> 7) & 3;
            UInt8 v56 = (*(_WORD *)v60 & 0x200) != 0;
            UInt8 v55 = (*(_WORD *)v60 & 0x400) != 0;
            UInt8 v53 = (*(_WORD *)v60 & 0x800) != 0;
            CFAllocatorRef v41 = *v29;
            CFDataRef v42 = CFDataCreate(*v29, v70, 8);
            v6[2].__shared_weak_owners_ = (uint64_t)v42;
            LOBYTE(v6[3].__vftable) = v42 != 0;
            CFDataRef v43 = CFDataCreate(v41, &v57, 1);
            v6[2].__vftable = (std::__shared_weak_count_vtbl *)v43;
            LOBYTE(v6[2].__shared_owners_) = v43 != 0;
            CFDataRef v44 = CFDataCreate(v41, v58, 2);
            v6[1].__shared_owners_ = (uint64_t)v44;
            LOBYTE(v6[1].__shared_weak_owners_) = v44 != 0;
            CFDataRef v45 = CFDataCreate(v41, &v56, 1);
            v6[4].__shared_weak_owners_ = (uint64_t)v45;
            LOBYTE(v6[5].__vftable) = v45 != 0;
            CFDataRef v46 = CFDataCreate(v41, &v55, 1);
            v6[5].__shared_owners_ = (uint64_t)v46;
            LOBYTE(v6[5].__shared_weak_owners_) = v46 != 0;
            CFDataRef v47 = CFDataCreate(v41, &v54, 1);
            v6[6].__shared_weak_owners_ = (uint64_t)v47;
            LOBYTE(v6[7].__vftable) = v47 != 0;
            CFDataRef v48 = CFDataCreate(v41, &v53, 1);
            v6[6].__vftable = (std::__shared_weak_count_vtbl *)v48;
            LOBYTE(v6[6].__shared_owners_) = v48 != 0;
            long long v49 = (ACFULogging *)ACFUCommon::PersonalizeParams::logParameters((ACFUCommon::PersonalizeParams *)&v6[1]);
            ACFULogging::getLogInstance(v49);
            ACFULogging::handleMessage();
            int v50 = 0;
            goto LABEL_42;
          }
          ACFULogging::getLogInstance(v40);
        }
        ACFULogging::handleMessage();
        int v50 = 3011;
LABEL_42:
        atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
        *(void *)a4 = v6 + 1;
        *(void *)(a4 + 8) = v6;
        atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
        *(_DWORD *)(a4 + 16) = v50;
        if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
          std::__shared_weak_count::__release_weak(v6);
        }
        if (v27) {
          (*(void (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(void *)v27 + 8))(v27);
        }
        if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
          goto LABEL_22;
        }
        return;
      }
      ACFULogging::getLogInstance(v39);
    }
    ACFULogging::handleMessage();
    int v50 = 3025;
    goto LABEL_42;
  }
  memset(__dst, 0, 32);
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  CFDataRef v6 = (std::__shared_weak_count *)operator new(0xE8uLL);
  v6->__shared_owners_ = 0;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CECFB98;
  long long v7 = operator new(0x40uLL);
  __p[0] = v7;
  _OWORD *v7 = xmmword_26448A480;
  v7[1] = *(_OWORD *)&off_26448A490;
  v7[2] = xmmword_26448A4A0;
  v7[3] = *(_OWORD *)off_26448A4B0;
  __p[1] = v7 + 4;
  *(void *)&long long v72 = v7 + 4;
  MEMORY[0x223C1C5F0](&v6[1], __p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  *(void *)std::string v70 = 0xAAAAAAAAAAAAAAAALL;
  security::ARICommandDriver::ARICommandDriver();
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v73 = v8;
  long long v74 = v8;
  long long v72 = v8;
  *(_OWORD *)std::string __p = v8;
  AriSdk::ARI_CsiSecGetRandomNumReq_SDK::ARI_CsiSecGetRandomNumReq_SDK((AriSdk::ARI_CsiSecGetRandomNumReq_SDK *)__p);
  *(void *)int v69 = 0;
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v67 = v9;
  long long v68 = v9;
  *(_OWORD *)std::string::size_type v65 = v9;
  long long v66 = v9;
  AriSdk::ARI_GetPersonalizationParametersReq_SDK::ARI_GetPersonalizationParametersReq_SDK((AriSdk::ARI_GetPersonalizationParametersReq_SDK *)v65);
  *(void *)std::string v63 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)int v64 = 0;
  support::transport::ARI::create((support::transport::ARI *)"BasebandUpdaterTransport", (dispatch_queue_s *)0x2710, 0, 0, (char **)v63);
  if (!*(void *)v63)
  {
    ACFULogging::getLogInstance(v10);
    ACFULogging::handleMessage();
    int v23 = 3019;
    goto LABEL_13;
  }
  security::ARICommandDriver::ARICommandDriver();
  *(void *)std::string v70 = *(void *)bytes;
  security::ARICommandDriver::~ARICommandDriver((security::ARICommandDriver *)bytes);
  if (a3)
  {
    uint64_t RandomNum = security::ARICommandDriver::GetRandomNum();
    if ((RandomNum & 1) == 0) {
      goto LABEL_60;
    }
    ACFULogging::getLogInstance((ACFULogging *)RandomNum);
    uint64_t RandomNum = ACFULogging::handleMessage();
    uint64_t v12 = *(unsigned int **)(*(void *)v69 + 64);
    size_t v13 = v12[8];
    if ((v13 - 1) >= 0x20) {
      goto LABEL_60;
    }
    memcpy(__dst, v12, v13);
    CFDataRef v14 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)__dst, 32);
    v6[3].__shared_owners_ = (uint64_t)v14;
    LOBYTE(v6[3].__shared_weak_owners_) = v14 != 0;
  }
  uint64_t RandomNum = security::ARICommandDriver::GetPersonalizationParams();
  if ((RandomNum & 1) == 0)
  {
LABEL_60:
    ACFULogging::getLogInstance((ACFULogging *)RandomNum);
    ACFULogging::handleMessage();
    int v23 = 3000;
    goto LABEL_13;
  }
  if (**(_DWORD **)(*(void *)v64 + 104) >= 2u || **(unsigned __int8 **)(*(void *)v64 + 120) >= 2u)
  {
    ACFULogging::getLogInstance((ACFULogging *)RandomNum);
    ACFULogging::handleMessage();
    int v23 = 3011;
  }
  else
  {
    *(_WORD *)bytes = **(unsigned __int8 **)(*(void *)v64 + 64);
    CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDataRef v16 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, 2);
    v6[2].__vftable = (std::__shared_weak_count_vtbl *)v16;
    LOBYTE(v6[2].__shared_owners_) = v16 != 0;
    CFDataRef v17 = CFDataCreate(v15, *(const UInt8 **)(*(void *)v64 + 72), 2);
    v6[1].__shared_owners_ = (uint64_t)v17;
    LOBYTE(v6[1].__shared_weak_owners_) = v17 != 0;
    *(void *)bytes = **(unsigned int **)(*(void *)v64 + 80) | ((unint64_t)**(unsigned int **)(*(void *)v64 + 88) << 32);
    CFDataRef v18 = CFDataCreate(v15, bytes, 8);
    v6[2].__shared_weak_owners_ = (uint64_t)v18;
    LOBYTE(v6[3].__vftable) = v18 != 0;
    CFDataRef v19 = CFDataCreate(v15, *(const UInt8 **)(*(void *)v64 + 96), 1);
    v6[6].__shared_weak_owners_ = (uint64_t)v19;
    LOBYTE(v6[7].__vftable) = v19 != 0;
    bytes[0] = **(_DWORD **)(*(void *)v64 + 104);
    CFDataRef v20 = CFDataCreate(v15, bytes, 1);
    v6[4].__shared_weak_owners_ = (uint64_t)v20;
    LOBYTE(v6[5].__vftable) = v20 != 0;
    CFDataRef v21 = CFDataCreate(v15, *(const UInt8 **)(*(void *)v64 + 112), 1);
    v6[5].__shared_owners_ = (uint64_t)v21;
    LOBYTE(v6[5].__shared_weak_owners_) = v21 != 0;
    uint64_t v22 = CFDataCreate(v15, *(const UInt8 **)(*(void *)v64 + 120), 1);
    v6[6].__vftable = (std::__shared_weak_count_vtbl *)v22;
    LOBYTE(v6[6].__shared_owners_) = v22 != 0;
    ACFULogging::getLogInstance(v22);
    ACFULogging::handleMessage();
    ACFUCommon::PersonalizeParams::logParameters((ACFUCommon::PersonalizeParams *)&v6[1]);
    int v23 = 0;
  }
LABEL_13:
  if (*(void *)v69) {
    (*(void (**)(void))(**(void **)v69 + 16))(*(void *)v69);
  }
  if (*(void *)v64) {
    (*(void (**)(void))(**(void **)v64 + 16))(*(void *)v64);
  }
  atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  *(void *)a4 = v6 + 1;
  *(void *)(a4 + 8) = v6;
  atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  *(_DWORD *)(a4 + 16) = v23;
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  uint64_t v24 = *(void *)v63;
  *(void *)std::string v63 = 0;
  if (v24) {
    (*(void (**)(uint64_t))(*(void *)v24 + 8))(v24);
  }
  MEMORY[0x223C1D780](v65);
  MEMORY[0x223C1D660](__p);
  security::ARICommandDriver::~ARICommandDriver((security::ARICommandDriver *)v70);
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
LABEL_22:
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
}

void sub_21DF949E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,void *a29)
{
  if (!atomic_fetch_add(v30, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
    std::__shared_weak_count::__release_weak(v29);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BasebandUpdaterTransport::pushFirmware(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (ACFULogging *)TelephonyBasebandSetBasebandState();
  ACFULogging::getLogInstance(v3);
  ACFULogging::handleMessage();
  uint64_t v4 = (BasebandUpdaterTransport::IOACIPCHelper *)operator new(0x20uLL);
  *(void *)uint64_t v4 = &unk_26CECF938;
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *((void *)v4 + 3) = 0;
  uint64_t v5 = BasebandUpdaterTransport::IOACIPCHelper::init(v4, "rom");
  if ((v5 & 1) == 0) {
    goto LABEL_41;
  }
  if (*((void *)v4 + 1))
  {
    CFDataRef v6 = *(std::__shared_weak_count **)(a2 + 8);
    uint64_t v28 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ImageOnBTIStage = (ACFULogging *)ACFUACIPCTransport::loadImageOnBTIStage();
    int v8 = (int)ImageOnBTIStage;
    if (v28 && !atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
    ACFULogging::getLogInstance(ImageOnBTIStage);
    ACFULogging::handleMessage();
    if (v8)
    {
      int v10 = 0;
      uint64_t v9 = 3026;
    }
    else
    {
      uint64_t v9 = 0;
      int v10 = 1;
    }
  }
  else
  {
    ACFULogging::getLogInstance((ACFULogging *)v5);
    ACFULogging::handleMessage();
    int v10 = 0;
    uint64_t v9 = 3000;
  }
  CFTypeID v11 = (ACFULogging *)(*(uint64_t (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(void *)v4 + 8))(v4);
  if (!v10) {
    goto LABEL_32;
  }
  ACFULogging::getLogInstance(v11);
  ACFULogging::handleMessage();
  uint64_t v4 = (BasebandUpdaterTransport::IOACIPCHelper *)operator new(0x20uLL);
  *(void *)uint64_t v4 = &unk_26CECF938;
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *((void *)v4 + 3) = 0;
  if ((BasebandUpdaterTransport::IOACIPCHelper::init(v4, "iboot") & 1) == 0) {
    goto LABEL_41;
  }
  uint64_t v12 = validateBootStage(4);
  if ((v12 & 1) != 0 && *((void *)v4 + 1))
  {
    size_t v13 = *(std::__shared_weak_count **)(a2 + 8);
    uint64_t v27 = v13;
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CFDataRef v14 = (ACFULogging *)ACFUACIPCTransport::processRTIStage();
    int v15 = (int)v14;
    if (v27 && !atomic_fetch_add(&v27->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
    ACFULogging::getLogInstance(v14);
    ACFULogging::handleMessage();
    if (v15)
    {
      int v16 = 0;
      uint64_t v9 = 3027;
    }
    else
    {
      uint64_t v9 = 0;
      int v16 = 1;
    }
  }
  else
  {
    ACFULogging::getLogInstance((ACFULogging *)v12);
    ACFULogging::handleMessage();
    int v16 = 0;
    uint64_t v9 = 3000;
  }
  CFDataRef v17 = (ACFULogging *)(*(uint64_t (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(void *)v4 + 8))(v4);
  if (!v16) {
    goto LABEL_32;
  }
  ACFULogging::getLogInstance(v17);
  ACFULogging::handleMessage();
  uint64_t v4 = (BasebandUpdaterTransport::IOACIPCHelper *)operator new(0x20uLL);
  *(void *)uint64_t v4 = &unk_26CECF938;
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *((void *)v4 + 3) = 0;
  uint64_t v18 = BasebandUpdaterTransport::IOACIPCHelper::init(v4, "cps");
  if ((v18 & 1) == 0)
  {
LABEL_41:
    uint64_t v24 = (ACFULogging *)(*(uint64_t (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(void *)v4 + 8))(v4);
    ACFULogging::getLogInstance(v24);
    uint64_t v25 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v25);
    ACFULogging::handleMessage();
    uint64_t v9 = 3019;
    goto LABEL_34;
  }
  if (*((void *)v4 + 1))
  {
    CFDataRef v19 = *(std::__shared_weak_count **)(a2 + 8);
    uint64_t v26 = v19;
    if (v19) {
      atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CFDataRef v20 = (ACFULogging *)ACFUACIPCTransport::processRTIStage();
    int v21 = (int)v20;
    if (v26 && !atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
    ACFULogging::getLogInstance(v20);
    ACFULogging::handleMessage();
    if (v21)
    {
      int v22 = 0;
      uint64_t v9 = 3027;
    }
    else
    {
      uint64_t v9 = 0;
      int v22 = 1;
    }
  }
  else
  {
    ACFULogging::getLogInstance((ACFULogging *)v18);
    ACFULogging::handleMessage();
    int v22 = 0;
    uint64_t v9 = 3000;
  }
  (*(void (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(void *)v4 + 8))(v4);
  if (v22) {
    goto LABEL_33;
  }
LABEL_32:
  if (!v9) {
LABEL_33:
  }
    uint64_t v9 = 0;
LABEL_34:
  TelephonyBasebandSetBasebandState();
  return v9;
}

void sub_21DF952D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)va);
  (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  _Unwind_Resume(a1);
}

uint64_t ___ZN24BasebandUpdaterTransport12pushFirmwareENSt3__110shared_ptrI12ACFUFirmwareEE_block_invoke(ACFULogging *a1)
{
  uint64_t v1 = (BasebandUpdaterTransport *)*((void *)a1 + 4);
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();

  return BasebandUpdaterTransport::warmResetForce(v1);
}

uint64_t BasebandUpdaterTransport::warmResetForce(BasebandUpdaterTransport *this)
{
  uint64_t result = TelephonyCapabilitiesGetHardwareModel();
  if (*(_DWORD *)(result + 8) == 3) {
    goto LABEL_4;
  }
  if (*((unsigned char *)this + 184))
  {
    if (*((unsigned char *)this + 187))
    {
LABEL_4:
      ACFULogging::getLogInstance((ACFULogging *)result);
      return ACFULogging::handleMessage();
    }
    if (*((unsigned char *)this + 186))
    {
      uint64_t v3 = (FILE **)MEMORY[0x263EF8358];
      do
      {
        printf("        %s - %c/%c?: ", "force warm reset", 121, 110);
        fflush(*v3);
        uint64_t result = getchar();
        char v4 = result;
        for (i = result; result != 10; uint64_t result = getchar())
          ;
        if (i == 110) {
          goto LABEL_4;
        }
      }
      while (v4 != 121);
    }
  }
  uint64_t result = TelephonyBasebandForceResetModem();
  if ((result & 1) == 0) {
    goto LABEL_4;
  }
  return result;
}

uint64_t validateBootStage(int a1)
{
  size_t v13 = 0;
  int valuePtr = 0;
  CFDictionaryRef v2 = IOServiceMatching("AppleConvergedIPCLedaBBControl");
  if (!v2)
  {
    ACFULogging::getLogInstance(0);
LABEL_17:
    ACFULogging::handleMessage();
    return 0;
  }
  MatchingService = (ACFULogging *)IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v2);
  io_object_t v4 = MatchingService;
  if (!MatchingService)
  {
    ACFULogging::getLogInstance(MatchingService);
    goto LABEL_17;
  }
  CFProperty = (ACFULogging *)IORegistryEntryCreateCFProperty((io_registry_entry_t)MatchingService, @"bootstage", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFNumberRef v6 = CFProperty;
  size_t v13 = CFProperty;
  if (CFProperty) {
    long long v7 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  }
  else {
    long long v7 = 0;
  }
  if (!v7
    || (CFTypeID v8 = CFGetTypeID(CFProperty), CFProperty = (ACFULogging *)CFNumberGetTypeID(), (ACFULogging *)v8 != CFProperty))
  {
    ACFULogging::getLogInstance(CFProperty);
LABEL_19:
    ACFULogging::handleMessage();
LABEL_21:
    uint64_t v10 = 0;
    goto LABEL_11;
  }
  Value = (ACFULogging *)CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr);
  if (!Value)
  {
    ACFULogging::getLogInstance(Value);
    goto LABEL_19;
  }
  if (valuePtr != a1)
  {
    ACFULogging::getLogInstance(Value);
    ACFULogging::handleMessage();
    goto LABEL_21;
  }
  uint64_t v10 = 1;
LABEL_11:
  IOObjectRelease(v4);
  if (v6) {
    CFRelease(v6);
  }
  return v10;
}

void sub_21DF956DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  ctu::cf::CFSharedRef<void const>::~CFSharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_21DF956F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  ctu::cf::CFSharedRef<void const>::~CFSharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ___ZN24BasebandUpdaterTransport12pushFirmwareENSt3__110shared_ptrI12ACFUFirmwareEE_block_invoke_2(ACFULogging *a1)
{
  uint64_t v1 = (BasebandUpdaterTransport *)*((void *)a1 + 4);
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();

  return BasebandUpdaterTransport::warmResetForce(v1);
}

uint64_t ___ZN24BasebandUpdaterTransport12pushFirmwareENSt3__110shared_ptrI12ACFUFirmwareEE_block_invoke_3(ACFULogging *a1)
{
  uint64_t v1 = (BasebandUpdaterTransport *)*((void *)a1 + 4);
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();

  return BasebandUpdaterTransport::warmResetForce(v1);
}

uint64_t ___ZN24BasebandUpdaterTransport15collectCoredumpENSt3__110shared_ptrI12ACFUFirmwareEE_block_invoke(ACFULogging *a1)
{
  uint64_t v1 = (BasebandUpdaterTransport *)*((void *)a1 + 4);
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();

  return BasebandUpdaterTransport::warmResetForce(v1);
}

uint64_t ___ZN24BasebandUpdaterTransport15collectCoredumpENSt3__110shared_ptrI12ACFUFirmwareEE_block_invoke_2(ACFULogging *a1)
{
  uint64_t v1 = (BasebandUpdaterTransport *)*((void *)a1 + 4);
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();

  return BasebandUpdaterTransport::warmResetForce(v1);
}

uint64_t std::unordered_map<std::string,std::string>::~unordered_map[abi:ne180100](uint64_t a1)
{
  CFDictionaryRef v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v5 = (void **)*v2;
      if (*((char *)v2 + 63) < 0)
      {
        operator delete(v2[5]);
        if (*((char *)v2 + 39) < 0) {
LABEL_10:
        }
          operator delete(v2[2]);
      }
      else if (*((char *)v2 + 39) < 0)
      {
        goto LABEL_10;
      }
      operator delete(v2);
      CFDictionaryRef v2 = v5;
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

uint64_t BasebandUpdaterTransport::setNonce(BasebandUpdaterTransport *this, void *a2)
{
  return 0;
}

uint64_t BasebandUpdaterTransport::reset(BasebandUpdaterTransport *this)
{
  uint64_t HardwareModel = TelephonyCapabilitiesGetHardwareModel();
  if (*(_DWORD *)(HardwareModel + 8) == 3) {
    goto LABEL_4;
  }
  if (*((unsigned char *)this + 184))
  {
    if (*((unsigned char *)this + 187))
    {
LABEL_4:
      ACFULogging::getLogInstance((ACFULogging *)HardwareModel);
      ACFULogging::handleMessage();
      return 0;
    }
    if (*((unsigned char *)this + 186))
    {
      io_object_t v4 = (FILE **)MEMORY[0x263EF8358];
      do
      {
        printf("        %s - %c/%c?: ", "Cold reset", 121, 110);
        fflush(*v4);
        uint64_t HardwareModel = getchar();
        char v5 = HardwareModel;
        for (int i = HardwareModel; HardwareModel != 10; HardwareModel = getchar())
          ;
        if (i == 110) {
          goto LABEL_4;
        }
      }
      while (v5 != 121);
    }
  }
  ACFULogging::getLogInstance((ACFULogging *)HardwareModel);
  ACFULogging::handleMessage();
  char v7 = TelephonyBasebandPowercycleModem();
  uint64_t result = 0;
  if ((v7 & 1) == 0)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    return 1;
  }
  return result;
}

ACFULogging *BasebandUpdaterTransport::pingCheck(std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *this)
{
  CFDictionaryRef v2 = (capabilities::updater *)capabilities::updater::pingDelay((capabilities::updater *)this);
  unsigned int v18 = v2;
  unint64_t v3 = capabilities::updater::pingAttemptCount(v2);
  uint64_t ValueIfPresent = this[22];
  if (!ValueIfPresent) {
    goto LABEL_12;
  }
  uint64_t ValueIfPresent = (uint64_t)std::__shared_weak_count::lock((std::__shared_weak_count *)ValueIfPresent);
  uint64_t v17 = ValueIfPresent;
  if (!ValueIfPresent) {
    goto LABEL_12;
  }
  char v5 = (std::__shared_weak_count *)ValueIfPresent;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v6 = this[21];
  __ns.__rep_ = v6;
  if (v6)
  {
    uint64_t ValueIfPresent = *(void *)(v6 + 120);
    if (ValueIfPresent)
    {
      CFURLRef value = 0;
      uint64_t ValueIfPresent = CFDictionaryGetValueIfPresent((CFDictionaryRef)ValueIfPresent, @"waitForReadyDelayMilliseconds", (const void **)&value);
      if (ValueIfPresent)
      {
        char v7 = (unsigned int *)value;
        if (value)
        {
          CFTypeID v8 = CFGetTypeID(value);
          uint64_t ValueIfPresent = CFNumberGetTypeID();
          if (v8 == ValueIfPresent) {
            uint64_t ValueIfPresent = ctu::cf::assign((ctu::cf *)&v18, v7, v9);
          }
        }
      }
    }
    if (*(unsigned char *)(v6 + 392)) {
      unint64_t v3 = *(void *)(v6 + 384);
    }
  }
  if (atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
LABEL_12:
    ACFULogging::getLogInstance((ACFULogging *)ValueIfPresent);
    if (v3) {
      goto LABEL_13;
    }
LABEL_21:
    ACFULogging::handleMessage();
    return 0;
  }
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  ACFULogging::getLogInstance(v13);
  if (!v3) {
    goto LABEL_21;
  }
LABEL_13:
  ACFULogging::handleMessage();
  if (v18)
  {
    __ns.__rep_ = 1000000 * v18;
    std::this_thread::sleep_for (&__ns);
  }
  unint64_t v10 = v3 - 1;
  unint64_t v11 = 1;
  while (1)
  {
    FWVersion = (ACFULogging *)BasebandUpdaterTransport::pingAndGetFWVersion(this, 0);
    ACFULogging::getLogInstance(FWVersion);
    if (!FWVersion) {
      break;
    }
    ACFULogging::handleMessage();
    ++v11;
    --v10;
    if (v11 > v3) {
      return FWVersion;
    }
  }
  ACFULogging::handleMessage();
  return FWVersion;
}

void sub_21DF95CEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t BasebandUpdaterTransport::pingAndGetFWVersion(std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *this, const __CFDictionary **a2)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  unsigned int v43 = capabilities::updater::pingTimeout((capabilities::updater *)this);
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep ValueIfPresent = this[22];
  if (ValueIfPresent)
  {
    std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep ValueIfPresent = (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep)std::__shared_weak_count::lock((std::__shared_weak_count *)ValueIfPresent);
    __ns[1].__rep_ = ValueIfPresent;
    if (ValueIfPresent)
    {
      io_object_t v4 = (std::__shared_weak_count *)ValueIfPresent;
      std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v5 = this[21];
      __ns[0].__rep_ = v5;
      if (v5)
      {
        std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep ValueIfPresent = *(void *)(v5 + 120);
        if (ValueIfPresent)
        {
          value[0] = 0;
          std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep ValueIfPresent = CFDictionaryGetValueIfPresent((CFDictionaryRef)ValueIfPresent, @"pingTimeoutMilliseconds", (const void **)value);
          if (ValueIfPresent)
          {
            std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v6 = (unsigned int *)value[0];
            if (value[0])
            {
              CFTypeID v7 = CFGetTypeID(value[0]);
              std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep ValueIfPresent = CFNumberGetTypeID();
              if (v7 == ValueIfPresent) {
                std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep ValueIfPresent = ctu::cf::assign((ctu::cf *)&v43, v6, v8);
              }
            }
          }
        }
      }
      if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
  ACFULogging::getLogInstance((ACFULogging *)ValueIfPresent);
  ACFULogging::handleMessage();
  v9.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
  BOOL v10 = 0;
  while (1)
  {
    value[0] = (void *)0xAAAAAAAAAAAAAAAALL;
    Bsp::ARICommandDriver::ARICommandDriver();
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v56 = v11;
    long long v57 = v11;
    long long v55 = v11;
    *(_OWORD *)&__ns[0].__rep_ = v11;
    AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::ARI_CsiGetCurrentBootStateReq_SDK((AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *)__ns);
    uint64_t v52 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
    UInt8 v53 = 0;
    if (*((unsigned char *)this + 188)) {
      uint64_t v12 = 10000;
    }
    else {
      uint64_t v12 = 0xFFFFFFFFLL;
    }
    support::transport::ARI::create((support::transport::ARI *)"BasebandUpdaterTransport", (dispatch_queue_s *)v12, 1, 0, (char **)&v52);
    if (v52)
    {
      Bsp::ARICommandDriver::ARICommandDriver();
      value[0] = v51;
      Bsp::ARICommandDriver::~ARICommandDriver((Bsp::ARICommandDriver *)&v51);
      uint64_t CurrentBootState = Bsp::ARICommandDriver::GetCurrentBootState();
      if (CurrentBootState)
      {
        int v14 = 1;
        int v15 = (ACFULogging *)v52;
        uint64_t v52 = 0;
        if (!v15) {
          goto LABEL_19;
        }
LABEL_18:
        int v15 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *))(*(void *)v15 + 8))(v15);
        goto LABEL_19;
      }
    }
    ACFULogging::getLogInstance((ACFULogging *)CurrentBootState);
    ACFULogging::handleMessage();
    int v14 = 0;
    int v15 = (ACFULogging *)v52;
    uint64_t v52 = 0;
    if (v15) {
      goto LABEL_18;
    }
LABEL_19:
    if (!v14)
    {
      int v16 = v53;
      if (!v53) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    ACFULogging::getLogInstance(v15);
    ACFULogging::handleMessage();
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS == -1)
    {
      if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1) {
        goto LABEL_22;
      }
    }
    else
    {
      dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global_7);
      if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1) {
        goto LABEL_22;
      }
    }
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_13);
LABEL_22:
    int v16 = v53;
    int v17 = **((_DWORD **)v53 + 8);
    BOOL v18 = v17 == 4;
    BOOL v19 = (v17 - 3) < 2;
    BOOL v10 = BBUpdaterCommon::inRestoreOS(void)::restoreOS | BBUpdaterCommon::inRestoreOS(void)::recoveryOS
        ? v19
        : v18;
LABEL_26:
    (*(void (**)(void *))(*(void *)v16 + 16))(v16);
LABEL_27:
    MEMORY[0x223C1D720](__ns);
    Bsp::ARICommandDriver::~ARICommandDriver((Bsp::ARICommandDriver *)value);
    if (v14) {
      break;
    }
    v21.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
    BOOL v22 = (v21.__d_.__rep_ - v9.__d_.__rep_) / 1000 < v43;
    ACFULogging::getLogInstance((ACFULogging *)v21.__d_.__rep_);
    if (!v22)
    {
      ACFULogging::handleMessage();
      return 3003;
    }
    ACFULogging::handleMessage();
    __ns[0].__rep_ = 500000000;
    std::this_thread::sleep_for (__ns);
  }
  ACFULogging::getLogInstance(v20);
  if (!v10)
  {
    ACFULogging::handleMessage();
    v38.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
    unsigned int v39 = (LODWORD(v38.__d_.__rep_) - LODWORD(v9.__d_.__rep_)) / 1000;
    if (v43 > v39)
    {
      ACFULogging::getLogInstance((ACFULogging *)v38.__d_.__rep_);
      ACFULogging::handleMessage();
      if (v43 != v39)
      {
        __ns[0].__rep_ = 1000000 * (v43 - v39);
        std::this_thread::sleep_for (__ns);
      }
    }
    return 3003;
  }
  ACFULogging::handleMessage();
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v55 = 0u;
  *(_OWORD *)&__ns[0].__rep_ = 0u;
  int v50 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
  Bsp::ARICommandDriver::ARICommandDriver();
  std::string __p = (void *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v23 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v47 = v23;
  long long v48 = v23;
  *(_OWORD *)CFURLRef value = v23;
  long long v46 = v23;
  AriSdk::ARI_CsiSysGetInfoReqV2_SDK::ARI_CsiSysGetInfoReqV2_SDK((AriSdk::ARI_CsiSysGetInfoReqV2_SDK *)value);
  uint64_t v44 = 0;
  UInt8 v53 = (void *)0xAAAAAAAAAAAAAAAALL;
  support::transport::ARI::create((support::transport::ARI *)"BasebandUpdaterTransport", (dispatch_queue_s *)0x2710, 1, 0, (char **)&v53);
  if (!v53) {
    goto LABEL_64;
  }
  Bsp::ARICommandDriver::ARICommandDriver();
  int v50 = v52;
  Bsp::ARICommandDriver::~ARICommandDriver((Bsp::ARICommandDriver *)&v52);
  uint64_t v25 = operator new(4uLL);
  *uint64_t v25 = 4;
  uint64_t v26 = __p;
  std::string __p = v25;
  if (v26) {
    operator delete(v26);
  }
  uint64_t InfoV2 = Bsp::ARICommandDriver::SysGetInfoV2();
  if (InfoV2)
  {
    int v27 = 1;
    uint64_t v28 = (ACFULogging *)v53;
    UInt8 v53 = 0;
    if (v28) {
      goto LABEL_40;
    }
  }
  else
  {
LABEL_64:
    ACFULogging::getLogInstance((ACFULogging *)InfoV2);
    ACFULogging::handleMessage();
    int v27 = 0;
    uint64_t v28 = (ACFULogging *)v53;
    UInt8 v53 = 0;
    if (v28) {
LABEL_40:
    }
      uint64_t v28 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *))(*(void *)v28 + 8))(v28);
  }
  if (!v27) {
    goto LABEL_58;
  }
  io_object_t v29 = *(unsigned int **)(v44 + 64);
  if (v29[129] || (uint64_t v30 = v29[128], v30 >= 0x100))
  {
    ACFULogging::getLogInstance(v28);
    ACFULogging::handleMessage();
    LOBYTE(v27) = 0;
    uint64_t v37 = v44;
    if (!v44) {
      goto LABEL_60;
    }
LABEL_59:
    (*(void (**)(uint64_t))(*(void *)v37 + 16))(v37);
    goto LABEL_60;
  }
  uint64_t v31 = (ACFULogging *)memcpy(__ns, v29, v29[128]);
  *((unsigned char *)&__ns[0].__rep_ + v30) = 0;
  ACFULogging::getLogInstance(v31);
  ACFULogging::handleMessage();
  if (!a2) {
    goto LABEL_50;
  }
  uint64_t v32 = *MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    ACFULogging::getLogInstance(0);
LABEL_57:
    ACFULogging::handleMessage();
    LOBYTE(v27) = 0;
LABEL_58:
    uint64_t v37 = v44;
    if (!v44) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
  uint64_t v52 = @"FirmwareVersion";
  CFRetain(@"FirmwareVersion");
  UInt8 v53 = 0;
  ctu::cf::convert_copy((ctu::cf *)&v53, (const __CFString **)__ns, (const char *)0x8000100, v32, v34);
  char v35 = v53;
  long long v51 = v53;
  if (v53)
  {
    CFDictionaryAddValue(Mutable, @"FirmwareVersion", v53);
    CFRelease(v35);
  }
  CFRelease(@"FirmwareVersion");
  if (!v35)
  {
    ACFULogging::getLogInstance(v36);
    goto LABEL_57;
  }
  *a2 = Mutable;
LABEL_50:
  LOBYTE(v27) = 1;
  uint64_t v37 = v44;
  if (v44) {
    goto LABEL_59;
  }
LABEL_60:
  MEMORY[0x223C1D5A0](value);
  Bsp::ARICommandDriver::~ARICommandDriver((Bsp::ARICommandDriver *)&v50);
  if (v27) {
    return 0;
  }
  ACFULogging::getLogInstance(v40);
  ACFULogging::handleMessage();
  return 3003;
}

void sub_21DF9656C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,char a32)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *std::ofstream::~ofstream(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B0];
  uint64_t v3 = *MEMORY[0x263F8C2B0];
  *a1 = *MEMORY[0x263F8C2B0];
  *(void *)((char *)a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  MEMORY[0x223C1DAE0](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x223C1DDF0](a1 + 52);
  return a1;
}

uint64_t BasebandUpdaterTransport::getDebugInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 185))
  {
    ACFULogging::getLogInstance((ACFULogging *)a1);
    ACFULogging::handleMessage();
    return 0;
  }
  __dst[0] = 0;
  uint64_t Reset = TelephonyBasebandGetReset();
  if ((Reset & 1) == 0)
  {
    ACFULogging::getLogInstance((ACFULogging *)Reset);
    uint64_t Reset = ACFULogging::handleMessage();
    __dst[0] = 0;
  }
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v5 = (ACFULogging *)capabilities::coredump::supportsSPMISignalling((capabilities::coredump *)Reset);
  int v6 = (int)v5;
  ACFULogging::getLogInstance(v5);
  if (!v6)
  {
    ACFULogging::handleMessage();
    *(void *)&__b[0] = 0xAAAAAAAAAAAAAAAALL;
    support::transport::ARI::create((support::transport::ARI *)"BasebandUpdaterTransport", (dispatch_queue_s *)0x2710, 0, 0, (char **)__b);
    if (!*(void *)&__b[0]) {
      goto LABEL_218;
    }
    *(void *)v124 = 0xAAAAAAAAAAAAAAAALL;
    Bsp::BspCommandDriver::BspCommandDriver();
    *(void *)std::string __p = operator new(0x28uLL);
    *(_OWORD *)&__p[8] = xmmword_21DFAE7A0;
    strcpy(*(char **)__p, "AP triggered baseband reset over ARI");
    CFTypeID v7 = (ACFULogging *)Bsp::BspCommandDriver::SwTrap();
    char v8 = (char)v7;
    if ((__p[23] & 0x80000000) != 0) {
      operator delete(*(void **)__p);
    }
    if (v8)
    {
      int v9 = 0;
      BOOL v10 = *(void **)&__b[0];
      *(void *)&__b[0] = 0;
      if (!v10) {
        goto LABEL_15;
      }
    }
    else
    {
LABEL_218:
      ACFULogging::getLogInstance(v7);
      ACFULogging::handleMessage();
      int v9 = 4;
      BOOL v10 = *(void **)&__b[0];
      *(void *)&__b[0] = 0;
      if (!v10)
      {
LABEL_15:
        if (!v9) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
    }
    BOOL v10 = (void *)(*(uint64_t (**)(void *))(*(void *)v10 + 8))(v10);
    goto LABEL_15;
  }
  ACFULogging::handleMessage();
  memset(v124, 170, 24);
  if (*(char *)(a1 + 215) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)v124, *(const std::string::value_type **)(a1 + 192), *(void *)(a1 + 200));
    if (*(char *)(a1 + 215) < 0)
    {
      **(unsigned char **)(a1 + 192) = 0;
      *(void *)(a1 + 200) = 0;
      uint64_t v91 = v124[23];
      char v78 = v124[23];
      if (v124[23] < 0) {
        uint64_t v91 = *(void *)&v124[8];
      }
      if (!v91) {
        goto LABEL_137;
      }
      goto LABEL_138;
    }
  }
  else
  {
    *(_OWORD *)v124 = *(_OWORD *)(a1 + 192);
    *(void *)&v124[16] = *(void *)(a1 + 208);
  }
  *(unsigned char *)(a1 + 192) = 0;
  *(unsigned char *)(a1 + 215) = 0;
  uint64_t v77 = v124[23];
  char v78 = v124[23];
  if (v124[23] < 0) {
    uint64_t v77 = *(void *)&v124[8];
  }
  if (!v77)
  {
LABEL_137:
    std::string::__assign_external((std::string *)v124, "BasebandUpdaterTransport::crashBaseband()", 0x29uLL);
    char v78 = v124[23];
  }
LABEL_138:
  *(void *)&long long v79 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v79 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __b[0] = v79;
  __b[2] = v79;
  __b[3] = v79;
  __b[1] = v79;
  LOBYTE(__b[0]) = 12;
  if (v78 < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)__b + 8), *(const std::string::value_type **)v124, *(std::string::size_type *)&v124[8]);
  }
  else
  {
    *(_OWORD *)((char *)__b + 8) = *(_OWORD *)v124;
    *((void *)&__b[1] + 1) = *(void *)&v124[16];
  }
  LOBYTE(__b[2]) = 1;
  __b[3] = 0uLL;
  *((void *)&__b[2] + 1) = 0;
  char v123 = -86;
  *(void *)&long long v80 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v80 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v121 = v80;
  long long v122 = v80;
  *(_OWORD *)std::string __p = v80;
  *(_OWORD *)&__p[16] = v80;
  ResetReasonEncoder::encode((ResetReasonEncoder *)__b, (uint64_t)__p);
  if (v123)
  {
    uint64_t v82 = TelephonyBasebandCrashModemWithSPMIWithReason();
    if ((v82 & 1) == 0)
    {
LABEL_220:
      ACFULogging::getLogInstance((ACFULogging *)v82);
      ACFULogging::handleMessage();
      char v83 = 0;
      BOOL v10 = (void *)*((void *)&__b[2] + 1);
      if (!*((void *)&__b[2] + 1)) {
        goto LABEL_147;
      }
      goto LABEL_146;
    }
  }
  else
  {
    ACFULogging::getLogInstance(v81);
    ACFULogging::handleMessage();
    uint64_t v82 = TelephonyBasebandCrashModemWithSPMI();
    if ((v82 & 1) == 0) {
      goto LABEL_220;
    }
  }
  char v83 = 1;
  BOOL v10 = (void *)*((void *)&__b[2] + 1);
  if (*((void *)&__b[2] + 1))
  {
LABEL_146:
    *(void *)&__b[3] = v10;
    operator delete(v10);
  }
LABEL_147:
  if (LOBYTE(__b[2]) && SHIBYTE(__b[1]) < 0) {
    operator delete(*((void **)&__b[0] + 1));
  }
  if ((v124[23] & 0x80000000) == 0)
  {
    if (v83) {
      goto LABEL_17;
    }
LABEL_16:
    ACFULogging::getLogInstance((ACFULogging *)v10);
    ACFULogging::handleMessage();
    goto LABEL_17;
  }
  operator delete(*(void **)v124);
  if ((v83 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_17:
  unint64_t v132 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v131[8] = v11;
  v131[7] = v11;
  v131[6] = v11;
  v131[5] = v11;
  v131[4] = v11;
  v131[3] = v11;
  v131[2] = v11;
  v131[1] = v11;
  v131[0] = v11;
  long long v130 = v11;
  long long v129 = v11;
  long long v128 = v11;
  long long v127 = v11;
  long long v126 = v11;
  long long v125 = v11;
  *(_OWORD *)&v124[16] = v11;
  *(_OWORD *)v124 = v11;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v124);
  CFTypeRef cf = 0;
  LODWORD(v113) = 0;
  uint64_t PMUTrace = TelephonyBasebandGetPMUTrace();
  if (PMUTrace)
  {
    size_t v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v124[16], (uint64_t)"Baseband PMU trace: ", 20);
    int v14 = (const char *)TelephonyBasebandPMUTraceToString();
    size_t v15 = strlen(v14);
    int v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)v14, v15);
    std::ios_base::getloc((const std::ios_base *)((char *)v16 + *(void *)(*v16 - 24)));
    int v17 = std::locale::use_facet((const std::locale *)__p, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v17->__vftable[2].~facet_0)(v17, 10);
    std::locale::~locale((std::locale *)__p);
    std::ostream::put();
    std::ostream::flush();
  }
  else
  {
    ACFULogging::getLogInstance((ACFULogging *)PMUTrace);
    ACFULogging::handleMessage();
  }
  BOOL v18 = (__CFString *)ACFUDiagnostics::copyDiagnosticsPath(*(ACFUDiagnostics **)(a1 + 8));
  CFStringRef v19 = v18;
  CFTypeRef cf = v18;
  if (v18) {
    CFDataRef v20 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
  }
  else {
    CFDataRef v20 = 0;
  }
  if (!v20)
  {
    ACFULogging::getLogInstance((ACFULogging *)v18);
    ACFULogging::handleMessage();
    goto LABEL_98;
  }
  bzero(__p, 0x400uLL);
  CFStringGetCString(v19, __p, 1024, 0x8000100u);
  memset(__dst, 170, sizeof(__dst));
  size_t v21 = strlen(__p);
  if (v21 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v22 = v21;
  if (v21 >= 0x17)
  {
    uint64_t v24 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v21 | 7) != 0x17) {
      uint64_t v24 = v21 | 7;
    }
    uint64_t v25 = v24 + 1;
    long long v23 = operator new(v24 + 1);
    *(void *)&void __dst[8] = v22;
    *(void *)&__dst[16] = v25 | 0x8000000000000000;
    *(void *)long long __dst = v23;
    goto LABEL_31;
  }
  __dst[23] = v21;
  long long v23 = __dst;
  if (v21) {
LABEL_31:
  }
    memcpy(v23, __p, v22);
  v23[v22] = 0;
  memset(__b, 170, 0x238uLL);
  int v26 = __dst[23];
  if (__dst[23] >= 0) {
    size_t v27 = __dst[23];
  }
  else {
    size_t v27 = *(void *)&__dst[8];
  }
  unint64_t v28 = v27 + 1;
  memset(&v111, 170, sizeof(v111));
  if (v27 + 1 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v28 >= 0x17)
  {
    uint64_t v30 = (v28 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v28 | 7) != 0x17) {
      uint64_t v30 = v28 | 7;
    }
    uint64_t v31 = v30 + 1;
    io_object_t v29 = (char *)operator new(v30 + 1);
    v111.__r_.__value_.__l.__size_ = v27 + 1;
    v111.__r_.__value_.__r.__words[2] = v31 | 0x8000000000000000;
    v111.__r_.__value_.__r.__words[0] = (std::string::size_type)v29;
  }
  else
  {
    memset(&v111, 0, sizeof(v111));
    io_object_t v29 = (char *)&v111;
    *((unsigned char *)&v111.__r_.__value_.__s + 23) = v27 + 1;
    if (!v27) {
      goto LABEL_46;
    }
  }
  if (v26 >= 0) {
    uint64_t v32 = __dst;
  }
  else {
    uint64_t v32 = *(unsigned char **)__dst;
  }
  memmove(v29, v32, v27);
LABEL_46:
  *(_WORD *)&v29[v27] = 47;
  CFAllocatorRef v33 = std::string::append(&v111, "precoredump", 0xBuLL);
  long long v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
  v112.__r_.__value_.__r.__words[2] = v33->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v112.__r_.__value_.__l.__data_ = v34;
  v33->__r_.__value_.__l.__size_ = 0;
  v33->__r_.__value_.__r.__words[2] = 0;
  v33->__r_.__value_.__r.__words[0] = 0;
  uint64_t v35 = MEMORY[0x263F8C310] + 64;
  *(void *)&__b[26] = MEMORY[0x263F8C310] + 64;
  uint64_t v36 = (void *)MEMORY[0x263F8C2B0];
  uint64_t v37 = *(void *)(MEMORY[0x263F8C2B0] + 16);
  *(void *)&__b[0] = *(void *)(MEMORY[0x263F8C2B0] + 8);
  *(void *)((char *)__b + *(void *)(*(void *)&__b[0] - 24)) = v37;
  std::chrono::system_clock::time_point v38 = (std::ios_base *)((char *)__b + *(void *)(*(void *)&__b[0] - 24));
  std::ios_base::init(v38, (char *)__b + 8);
  uint64_t v39 = MEMORY[0x263F8C310] + 24;
  v38[1].__vftable = 0;
  v38[1].__fmtflags_ = -1;
  *(void *)&__b[0] = v39;
  *(void *)&__b[26] = v35;
  MEMORY[0x223C1DAD0]((char *)__b + 8);
  uint64_t v40 = (ACFULogging *)std::filebuf::open();
  if (!v40) {
    std::ios_base::clear((std::ios_base *)((char *)__b + *(void *)(*(void *)&__b[0] - 24)), *(_DWORD *)((char *)&__b[2] + *(void *)(*(void *)&__b[0] - 24)) | 4);
  }
  if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v112.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v111.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_50:
      if (*(void *)&__b[8]) {
        goto LABEL_51;
      }
      goto LABEL_66;
    }
  }
  else if ((SHIBYTE(v111.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_50;
  }
  operator delete(v111.__r_.__value_.__l.__data_);
  if (*(void *)&__b[8])
  {
LABEL_51:
    if ((BYTE8(v130) & 0x10) != 0)
    {
      uint64_t v42 = v130;
      if ((unint64_t)v130 < *((void *)&v127 + 1))
      {
        *(void *)&long long v130 = *((void *)&v127 + 1);
        uint64_t v42 = *((void *)&v127 + 1);
      }
      unsigned int v43 = (const void *)v127;
      std::string::size_type v44 = v42 - v127;
      if ((unint64_t)(v42 - v127) > 0x7FFFFFFFFFFFFFF7) {
        goto LABEL_80;
      }
    }
    else
    {
      if ((BYTE8(v130) & 8) == 0)
      {
        *((unsigned char *)&v112.__r_.__value_.__s + 23) = 0;
        v112.__r_.__value_.__s.__data_[0] = 0;
        int v41 = 0;
        goto LABEL_60;
      }
      unsigned int v43 = (const void *)*((void *)&v125 + 1);
      std::string::size_type v44 = *((void *)&v126 + 1) - *((void *)&v125 + 1);
      if (*((void *)&v126 + 1) - *((void *)&v125 + 1) > 0x7FFFFFFFFFFFFFF7uLL) {
LABEL_80:
      }
        std::string::__throw_length_error[abi:ne180100]();
    }
    if (v44 >= 0x17)
    {
      uint64_t v48 = (v44 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v44 | 7) != 0x17) {
        uint64_t v48 = v44 | 7;
      }
      uint64_t v49 = v48 + 1;
      CFDataRef v45 = (std::string *)operator new(v48 + 1);
      v112.__r_.__value_.__l.__size_ = v44;
      v112.__r_.__value_.__r.__words[2] = v49 | 0x8000000000000000;
      v112.__r_.__value_.__r.__words[0] = (std::string::size_type)v45;
    }
    else
    {
      *((unsigned char *)&v112.__r_.__value_.__s + 23) = v44;
      CFDataRef v45 = &v112;
      if (!v44)
      {
        v112.__r_.__value_.__s.__data_[0] = 0;
        int v41 = SHIBYTE(v112.__r_.__value_.__r.__words[2]);
        if ((SHIBYTE(v112.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_60;
        }
        goto LABEL_71;
      }
    }
    memmove(v45, v43, v44);
    v45->__r_.__value_.__s.__data_[v44] = 0;
    int v41 = SHIBYTE(v112.__r_.__value_.__r.__words[2]);
    if ((SHIBYTE(v112.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_60:
      if (v41) {
        goto LABEL_61;
      }
      goto LABEL_72;
    }
LABEL_71:
    std::string::size_type size = v112.__r_.__value_.__l.__size_;
    operator delete(v112.__r_.__value_.__l.__data_);
    if (size)
    {
LABEL_61:
      if ((BYTE8(v130) & 0x10) != 0)
      {
        uint64_t v53 = v130;
        if ((unint64_t)v130 < *((void *)&v127 + 1))
        {
          *(void *)&long long v130 = *((void *)&v127 + 1);
          uint64_t v53 = *((void *)&v127 + 1);
        }
        UInt8 v54 = (const void *)v127;
        std::string::size_type v46 = v53 - v127;
        if ((unint64_t)(v53 - v127) > 0x7FFFFFFFFFFFFFF7) {
          goto LABEL_132;
        }
      }
      else
      {
        if ((BYTE8(v130) & 8) == 0)
        {
          std::string::size_type v46 = 0;
          *((unsigned char *)&v112.__r_.__value_.__s + 23) = 0;
          long long v47 = &v112;
          goto LABEL_85;
        }
        UInt8 v54 = (const void *)*((void *)&v125 + 1);
        std::string::size_type v46 = *((void *)&v126 + 1) - *((void *)&v125 + 1);
        if (*((void *)&v126 + 1) - *((void *)&v125 + 1) > 0x7FFFFFFFFFFFFFF7uLL) {
LABEL_132:
        }
          std::string::__throw_length_error[abi:ne180100]();
      }
      if (v46 >= 0x17)
      {
        uint64_t v55 = (v46 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v46 | 7) != 0x17) {
          uint64_t v55 = v46 | 7;
        }
        uint64_t v56 = v55 + 1;
        long long v47 = (std::string *)operator new(v55 + 1);
        v112.__r_.__value_.__l.__size_ = v46;
        v112.__r_.__value_.__r.__words[2] = v56 | 0x8000000000000000;
        v112.__r_.__value_.__r.__words[0] = (std::string::size_type)v47;
      }
      else
      {
        *((unsigned char *)&v112.__r_.__value_.__s + 23) = v46;
        long long v47 = &v112;
        if (!v46)
        {
LABEL_85:
          v47->__r_.__value_.__s.__data_[v46] = 0;
          if ((v112.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            long long v57 = &v112;
          }
          else {
            long long v57 = (std::string *)v112.__r_.__value_.__r.__words[0];
          }
          if ((v112.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type v58 = HIBYTE(v112.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v58 = v112.__r_.__value_.__l.__size_;
          }
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__b, (uint64_t)v57, v58);
          if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v112.__r_.__value_.__l.__data_);
          }
          goto LABEL_93;
        }
      }
      memmove(v47, v54, v46);
      goto LABEL_85;
    }
LABEL_72:
    long long v51 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__b, (uint64_t)"empty", 5);
    std::ios_base::getloc((const std::ios_base *)((char *)v51 + *(void *)(*v51 - 24)));
    uint64_t v52 = std::locale::use_facet((const std::locale *)&v112, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v52->__vftable[2].~facet_0)(v52, 10);
    std::locale::~locale((std::locale *)&v112);
    std::ostream::put();
    std::ostream::flush();
LABEL_93:
    if (!std::filebuf::close()) {
      std::ios_base::clear((std::ios_base *)((char *)__b + *(void *)(*(void *)&__b[0] - 24)), *(_DWORD *)((char *)&__b[2] + *(void *)(*(void *)&__b[0] - 24)) | 4);
    }
    goto LABEL_95;
  }
LABEL_66:
  ACFULogging::getLogInstance(v40);
  ACFULogging::handleMessage();
LABEL_95:
  *(void *)&__b[0] = *v36;
  *(void *)((char *)__b + *(void *)(*(void *)&__b[0] - 24)) = v36[3];
  MEMORY[0x223C1DAE0]((char *)__b + 8);
  std::ostream::~ostream();
  MEMORY[0x223C1DDF0](&__b[26]);
  if ((__dst[23] & 0x80000000) != 0) {
    operator delete(*(void **)__dst);
  }
  CFStringRef v19 = (const __CFString *)cf;
LABEL_98:
  if (v19) {
    CFRelease(v19);
  }
  *(void *)v124 = *MEMORY[0x263F8C2B8];
  uint64_t v59 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)&v124[*(void *)(*(void *)v124 - 24)] = *(void *)(MEMORY[0x263F8C2B8] + 64);
  *(void *)&v124[16] = v59;
  *(void *)&v124[24] = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v129) < 0) {
    operator delete(*((void **)&v128 + 1));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x223C1DDF0](v131);
  uint64_t HardwareModel = TelephonyCapabilitiesGetHardwareModel();
  if (*(_DWORD *)(HardwareModel + 8) == 3) {
    goto LABEL_105;
  }
  if (*(unsigned char *)(a1 + 184))
  {
    if (*(unsigned char *)(a1 + 187))
    {
LABEL_105:
      ACFULogging::getLogInstance((ACFULogging *)HardwareModel);
      ACFULogging::handleMessage();
      goto LABEL_106;
    }
    if (*(unsigned char *)(a1 + 186))
    {
      long long v84 = (FILE **)MEMORY[0x263EF8358];
      do
      {
        printf("        %s - %c/%c?: ", "safe warm reset", 121, 110);
        fflush(*v84);
        uint64_t HardwareModel = getchar();
        char v85 = HardwareModel;
        for (int i = HardwareModel; HardwareModel != 10; HardwareModel = getchar())
          ;
        if (i == 110) {
          goto LABEL_105;
        }
      }
      while (v85 != 121);
    }
  }
  uint64_t v87 = TelephonyBasebandResetModem();
  if ((v87 & 1) == 0)
  {
    ACFULogging::getLogInstance((ACFULogging *)v87);
    int8x16_t v88 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v88);
    uint64_t v4 = 1;
LABEL_163:
    ACFULogging::handleMessage();
    return v4;
  }
LABEL_106:
  long long v62 = *(const void **)a2;
  long long v61 = *(std::__shared_weak_count **)(a2 + 8);
  if (v61) {
    atomic_fetch_add_explicit(&v61->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  TelephonyBasebandSetBasebandState();
  *(void *)&__b[0] = 0;
  long long v63 = (BasebandUpdaterTransport::IOACIPCHelper *)operator new(0x20uLL);
  *(void *)long long v63 = &unk_26CECF938;
  *((void *)v63 + 1) = 0;
  *((void *)v63 + 2) = 0;
  *((void *)v63 + 3) = 0;
  uint64_t v64 = BasebandUpdaterTransport::IOACIPCHelper::init(v63, "rom");
  if ((v64 & 1) == 0)
  {
    uint64_t v102 = (ACFULogging *)(*(uint64_t (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(void *)v63 + 8))(v63);
    ACFULogging::getLogInstance(v102);
    uint64_t v103 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v103);
    ACFULogging::handleMessage();
    uint64_t v4 = 3019;
    goto LABEL_209;
  }
  *(void *)&__b[0] = *((void *)v63 + 1);
  if (*(void *)&__b[0])
  {
    ACFULogging::getLogInstance((ACFULogging *)v64);
    ACFULogging::handleMessage();
    CFTypeRef cf = v62;
    v118 = v61;
    if (v61) {
      atomic_fetch_add_explicit(&v61->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    *(void *)std::string __p = MEMORY[0x263EF8330];
    *(void *)&__p[8] = 3221225472;
    *(void *)&__p[16] = ___ZN24BasebandUpdaterTransport15collectCoredumpENSt3__110shared_ptrI12ACFUFirmwareEE_block_invoke;
    *(void *)&__p[24] = &__block_descriptor_40_e5_v8__0l;
    *(void *)&long long v121 = a1;
    ImageOnBTIStage = (ACFULogging *)ACFUACIPCTransport::loadImageOnBTIStage();
    int v66 = (int)ImageOnBTIStage;
    long long v67 = v118;
    if (v118 && !atomic_fetch_add(&v118->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
      std::__shared_weak_count::__release_weak(v67);
    }
    ACFULogging::getLogInstance(ImageOnBTIStage);
    ACFULogging::handleMessage();
    if (v66)
    {
      int v68 = 0;
      uint64_t v4 = 3026;
    }
    else
    {
      uint64_t v4 = 0;
      int v68 = 1;
    }
  }
  else
  {
    ACFULogging::getLogInstance((ACFULogging *)v64);
    ACFULogging::handleMessage();
    int v68 = 0;
    uint64_t v4 = 3000;
  }
  (*(void (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(void *)v63 + 8))(v63);
  if (v68)
  {
    uint64_t v115 = 0;
    CFTypeRef v116 = 0;
    memset(__b, 0, 32);
    *(void *)&__b[2] = 0xAAAAAAAA3F800000;
    long long v69 = (BasebandUpdaterTransport::IOACIPCHelper *)operator new(0x20uLL);
    *(void *)long long v69 = &unk_26CECF938;
    *((void *)v69 + 1) = 0;
    *((void *)v69 + 2) = 0;
    *((void *)v69 + 3) = 0;
    if (BasebandUpdaterTransport::IOACIPCHelper::init(v69, "iboot"))
    {
      uint64_t v70 = validateBootStage(5);
      if ((v70 & 1) == 0 || (uint64_t v115 = *((void *)v69 + 1)) == 0)
      {
        ACFULogging::getLogInstance((ACFULogging *)v70);
        ACFULogging::handleMessage();
        uint64_t v4 = 3000;
        int v100 = 4;
        goto LABEL_186;
      }
      unint64_t v71 = (void *)ACFUDiagnostics::copyDiagnosticsPath(*(ACFUDiagnostics **)(a1 + 8));
      long long v72 = v71;
      CFTypeRef v116 = v71;
      if (v71) {
        long long v73 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
      }
      else {
        long long v73 = 0;
      }
      if (!v73)
      {
        ACFULogging::getLogInstance((ACFULogging *)v71);
        ACFULogging::handleMessage();
        uint64_t v4 = 1014;
        int v100 = 4;
        goto LABEL_186;
      }
      if (v71) {
        CFRetain(v71);
      }
      uint64_t v74 = a1 + 120;
      uint64_t v75 = (void (**)(void))&unk_26CECFBE8;
      *(void *)v124 = &unk_26CECFBE8;
      *(void *)&v124[8] = v72;
      *(void *)&v124[16] = __b;
      *(void *)&v124[24] = v124;
      if ((unsigned char *)(a1 + 120) != v124)
      {
        if (*(void *)(a1 + 144) == v74)
        {
          *(void *)&void __dst[8] = v72;
          *(void *)&__dst[16] = 0xAAAAAAAAAAAAAAAALL;
          *(void *)long long __dst = &unk_26CECFBE8;
          if (v72)
          {
            CFRetain(v72);
            int8x16_t v89 = *(_OWORD **)&v124[16];
            uint64_t v75 = **(void (****)(void))&v124[24];
          }
          else
          {
            int8x16_t v89 = __b;
          }
          *(void *)&__dst[16] = v89;
          v75[4]();
          *(void *)&v124[24] = 0;
          (*(void (**)(void, unsigned char *))(**(void **)(a1 + 144) + 24))(*(void *)(a1 + 144), v124);
          (*(void (**)(void))(**(void **)(a1 + 144) + 32))(*(void *)(a1 + 144));
          *(void *)(a1 + 144) = 0;
          *(void *)&v124[24] = v124;
          (*(void (**)(unsigned char *, uint64_t))(*(void *)__dst + 24))(__dst, a1 + 120);
          (*(void (**)(unsigned char *))(*(void *)__dst + 32))(__dst);
          *(void *)(a1 + 144) = v74;
          int8x16_t v90 = *(ACFULogging **)&v124[24];
          if (*(unsigned char **)&v124[24] != v124)
          {
LABEL_168:
            if (v90) {
              int8x16_t v90 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *))(*(void *)v90 + 40))(v90);
            }
            goto LABEL_178;
          }
        }
        else
        {
          *(void *)(a1 + 120) = &unk_26CECFBE8;
          *(void *)(a1 + 128) = v72;
          if (v72)
          {
            CFRetain(v72);
            int8x16_t v76 = *(_OWORD **)&v124[16];
            uint64_t v75 = **(void (****)(void))&v124[24];
          }
          else
          {
            int8x16_t v76 = __b;
          }
          *(void *)(a1 + 136) = v76;
          v75[4]();
          *(void *)&v124[24] = *(void *)(a1 + 144);
          int8x16_t v90 = *(ACFULogging **)&v124[24];
          *(void *)(a1 + 144) = v74;
          if (v90 != (ACFULogging *)v124) {
            goto LABEL_168;
          }
        }
        uint64_t v75 = *(void (***)(void))v124;
      }
      int8x16_t v90 = (ACFULogging *)((uint64_t (*)(unsigned char *))v75[4])(v124);
LABEL_178:
      ACFULogging::getLogInstance(v90);
      ACFULogging::handleMessage();
      uint64_t v113 = 0;
      uint64_t v114 = 0;
      *(void *)v124 = MEMORY[0x263EF8330];
      *(void *)&v124[8] = 3221225472;
      *(void *)&v124[16] = ___ZN24BasebandUpdaterTransport15collectCoredumpENSt3__110shared_ptrI12ACFUFirmwareEE_block_invoke_2;
      *(void *)&v124[24] = &__block_descriptor_40_e5_v8__0l;
      *(void *)&long long v125 = a1;
      unint64_t v92 = (ACFULogging *)ACFUACIPCTransport::processRTIStage();
      int v93 = (int)v92;
      v94 = v114;
      if (v114 && !atomic_fetch_add(&v114->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v94->__on_zero_shared)(v94);
        std::__shared_weak_count::__release_weak(v94);
      }
      if (!v93)
      {
        ACFULogging::getLogInstance(v92);
        v111.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
        *(_OWORD *)&v111.__r_.__value_.__r.__words[1] = xmmword_21DFAD2D0;
        strcpy(v111.__r_.__value_.__l.__data_, "BasebandUpdaterTransport");
        v95 = std::string::append(&v111, "::", 2uLL);
        long long v96 = *(_OWORD *)&v95->__r_.__value_.__l.__data_;
        v112.__r_.__value_.__r.__words[2] = v95->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v112.__r_.__value_.__l.__data_ = v96;
        v95->__r_.__value_.__l.__size_ = 0;
        v95->__r_.__value_.__r.__words[2] = 0;
        v95->__r_.__value_.__r.__words[0] = 0;
        uint64_t v97 = std::string::append(&v112, "collectCoredump", 0xFuLL);
        long long v98 = *(_OWORD *)&v97->__r_.__value_.__l.__data_;
        *(void *)&__dst[16] = *((void *)&v97->__r_.__value_.__l + 2);
        *(_OWORD *)long long __dst = v98;
        v97->__r_.__value_.__l.__size_ = 0;
        v97->__r_.__value_.__r.__words[2] = 0;
        v97->__r_.__value_.__r.__words[0] = 0;
        uint64_t v99 = (ACFULogging *)ACFULogging::handleMessageCFType();
        if ((__dst[23] & 0x80000000) != 0)
        {
          operator delete(*(void **)__dst);
          if ((SHIBYTE(v112.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
LABEL_184:
            if ((SHIBYTE(v111.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
LABEL_185:
              ACFULogging::getLogInstance(v99);
              ACFULogging::handleMessage();
              int v100 = 0;
              uint64_t v4 = 0;
              goto LABEL_186;
            }
LABEL_190:
            operator delete(v111.__r_.__value_.__l.__data_);
            goto LABEL_185;
          }
        }
        else if ((SHIBYTE(v112.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
          goto LABEL_184;
        }
        operator delete(v112.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v111.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_185;
        }
        goto LABEL_190;
      }
      ACFULogging::getLogInstance(v92);
      ACFULogging::handleMessage();
      uint64_t v4 = 3027;
      int v100 = 4;
LABEL_186:
      (*(void (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(void *)v69 + 8))(v69);
      uint64_t v101 = *(char **)&__b[1];
      if (*(void *)&__b[1]) {
        goto LABEL_199;
      }
LABEL_202:
      uint64_t v107 = *(void **)&__b[0];
      *(void *)&__b[0] = 0;
      if (v107) {
        operator delete(v107);
      }
      if (v116) {
        CFRelease(v116);
      }
      if (!v100) {
        goto LABEL_208;
      }
      goto LABEL_207;
    }
    v104 = (ACFULogging *)(*(uint64_t (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(void *)v69 + 8))(v69);
    ACFULogging::getLogInstance(v104);
    v105 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v105);
    ACFULogging::handleMessage();
    int v100 = 4;
    uint64_t v4 = 3019;
    uint64_t v101 = *(char **)&__b[1];
    if (!*(void *)&__b[1]) {
      goto LABEL_202;
    }
    while (1)
    {
LABEL_199:
      v106 = *(char **)v101;
      if (v101[63] < 0)
      {
        operator delete(*((void **)v101 + 5));
        if ((v101[39] & 0x80000000) == 0) {
          goto LABEL_198;
        }
LABEL_201:
        operator delete(*((void **)v101 + 2));
        operator delete(v101);
        uint64_t v101 = v106;
        if (!v106) {
          goto LABEL_202;
        }
      }
      else
      {
        if (v101[39] < 0) {
          goto LABEL_201;
        }
LABEL_198:
        operator delete(v101);
        uint64_t v101 = v106;
        if (!v106) {
          goto LABEL_202;
        }
      }
    }
  }
LABEL_207:
  if (!v4) {
LABEL_208:
  }
    uint64_t v4 = 0;
LABEL_209:
  uint64_t v108 = (ACFULogging *)TelephonyBasebandSetBasebandState();
  if (v61 && !atomic_fetch_add(&v61->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
    std::__shared_weak_count::__release_weak(v61);
  }
  if (v4)
  {
    ACFULogging::getLogInstance(v108);
    goto LABEL_163;
  }
  return v4;
}

void sub_21DF980E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, std::locale a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  if (a29)
  {
    (*(void (**)(uint64_t))(*(void *)a29 + 8))(a29);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t BasebandUpdaterTransport::setPreflightMode(BasebandUpdaterTransport *this)
{
  int v9 = 8;
  uint64_t v1 = (BasebandUpdaterTransport::IOACIPCHelper *)operator new(0x20uLL);
  *(void *)uint64_t v1 = &unk_26CECF938;
  *((void *)v1 + 1) = 0;
  *((void *)v1 + 2) = 0;
  *((void *)v1 + 3) = 0;
  uint64_t v2 = BasebandUpdaterTransport::IOACIPCHelper::init(v1, "rom");
  if (v2)
  {
    uint64_t v3 = *((void *)v1 + 1);
    if (v3)
    {
      ACFULogging::getLogInstance((ACFULogging *)v2);
      ACFULogging::handleMessage();
      uint64_t v4 = (ACFULogging *)(*(uint64_t (**)(uint64_t, uint64_t, int *, uint64_t))(*(void *)v3 + 120))(v3, 15, &v9, 4);
      if (v4)
      {
        ACFULogging::getLogInstance(v4);
        ACFULogging::handleMessage();
        uint64_t v5 = 3025;
      }
      else
      {
        ACFULogging::getLogInstance(v4);
        ACFULogging::handleMessage();
        uint64_t v5 = 0;
      }
    }
    else
    {
      ACFULogging::getLogInstance((ACFULogging *)v2);
      ACFULogging::handleMessage();
      uint64_t v5 = 3000;
    }
    (*(void (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(void *)v1 + 8))(v1);
  }
  else
  {
    CFTypeID v7 = (ACFULogging *)(*(uint64_t (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(void *)v1 + 8))(v1);
    ACFULogging::getLogInstance(v7);
    char v8 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v8);
    ACFULogging::handleMessage();
    return 3019;
  }
  return v5;
}

void sub_21DF9867C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void BasebandUpdaterTransport::runCertification(int a1@<W1>, uint64_t a2@<X8>)
{
  uint64_t v39 = (UInt8 *)0xAAAAAAAAAAAAAAAALL;
  security::ARICommandDriver::ARICommandDriver();
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v38[2] = v4;
  v38[3] = v4;
  v38[0] = v4;
  v38[1] = v4;
  AriSdk::ARI_CsiSecCollectScrtBlobReq_SDK::ARI_CsiSecCollectScrtBlobReq_SDK((AriSdk::ARI_CsiSecCollectScrtBlobReq_SDK *)v38);
  uint64_t v37 = 0;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v36[2] = v5;
  v36[3] = v5;
  v36[1] = v5;
  v36[0] = v5;
  AriSdk::ARI_CsiSecReadSikPKeyReq_SDK::ARI_CsiSecReadSikPKeyReq_SDK((AriSdk::ARI_CsiSecReadSikPKeyReq_SDK *)v36);
  uint64_t v35 = 0;
  support::transport::ARI::create((support::transport::ARI *)"BasebandUpdaterTransport", (dispatch_queue_s *)0x2710, 0, 0, (char **)&bytes);
  CFTypeID v7 = bytes;
  if (!bytes)
  {
    ACFULogging::getLogInstance(v6);
    ACFULogging::handleMessage();
    *(void *)a2 = 0;
    *(_DWORD *)(a2 + 8) = 3019;
    goto LABEL_24;
  }
  security::ARICommandDriver::ARICommandDriver();
  uint64_t v39 = bytes;
  security::ARICommandDriver::~ARICommandDriver((security::ARICommandDriver *)&bytes);
  if (a1 == 1)
  {
    bytes = 0;
    CFAllocatorRef v33 = 0;
    uint64_t v34 = 0;
    uint64_t SikPKey = security::ARICommandDriver::CsiSecReadSikPKey();
    if (SikPKey)
    {
      unint64_t v21 = **(unsigned __int16 **)(v35 + 88);
      ACFULogging::getLogInstance((ACFULogging *)SikPKey);
      uint64_t SikPKey = ACFULogging::handleMessage();
      if ((v21 - 133) > 0xFFFFFF7B)
      {
        std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(&bytes, *(char **)(v35 + 64), (char *)(*(void *)(v35 + 64) + v21), v21);
        size_t v22 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, v21);
        CFDataRef v12 = v22;
        if (v22)
        {
          ACFULogging::getLogInstance(v22);
          long long v23 = (ACFULogging *)ACFULogging::handleMessage();
          ACFULogging::getLogInstance(v23);
          v28.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
          *(_OWORD *)&v28.__r_.__value_.__r.__words[1] = xmmword_21DFAD2D0;
          strcpy(v28.__r_.__value_.__l.__data_, "BasebandUpdaterTransport");
          uint64_t v24 = std::string::append(&v28, "::", 2uLL);
          long long v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
          v29.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v25;
          v24->__r_.__value_.__l.__size_ = 0;
          v24->__r_.__value_.__r.__words[2] = 0;
          v24->__r_.__value_.__r.__words[0] = 0;
          int v26 = std::string::append(&v29, "runCertification", 0x10uLL);
          long long v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
          std::string::size_type v31 = v26->__r_.__value_.__r.__words[2];
          *(_OWORD *)std::string __p = v27;
          v26->__r_.__value_.__l.__size_ = 0;
          v26->__r_.__value_.__r.__words[2] = 0;
          v26->__r_.__value_.__r.__words[0] = 0;
          CFDataGetBytePtr(v12);
          CFDataGetLength(v12);
          ACFULogging::handleMessageBinary();
          if (SHIBYTE(v31) < 0)
          {
LABEL_8:
            operator delete(__p[0]);
            if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
              goto LABEL_9;
            }
            goto LABEL_17;
          }
LABEL_16:
          if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
          {
LABEL_9:
            operator delete(v29.__r_.__value_.__l.__data_);
            if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
              goto LABEL_10;
            }
            goto LABEL_18;
          }
LABEL_17:
          if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
          {
LABEL_10:
            operator delete(v28.__r_.__value_.__l.__data_);
            char v18 = 1;
            int v19 = 1;
            CFDataRef v20 = bytes;
            if (!bytes) {
              goto LABEL_20;
            }
LABEL_19:
            CFAllocatorRef v33 = v20;
            operator delete(v20);
            goto LABEL_20;
          }
LABEL_18:
          char v18 = 1;
          int v19 = 1;
          CFDataRef v20 = bytes;
          if (!bytes) {
            goto LABEL_20;
          }
          goto LABEL_19;
        }
        goto LABEL_28;
      }
    }
LABEL_26:
    ACFULogging::getLogInstance((ACFULogging *)SikPKey);
    ACFULogging::handleMessage();
    CFDataRef v12 = 0;
    char v18 = 0;
    int v19 = 1;
    CFDataRef v20 = bytes;
    if (bytes) {
      goto LABEL_19;
    }
LABEL_20:
    if (v18) {
      int v19 = 0;
    }
    goto LABEL_23;
  }
  if (!a1)
  {
    bytes = 0;
    CFAllocatorRef v33 = 0;
    uint64_t v34 = 0;
    uint64_t SikPKey = security::ARICommandDriver::CsiSecCollectScrtBlob();
    if (SikPKey)
    {
      unint64_t v10 = **(unsigned __int16 **)(v37 + 64);
      ACFULogging::getLogInstance((ACFULogging *)SikPKey);
      uint64_t SikPKey = ACFULogging::handleMessage();
      if ((v10 - 4097) > 0xFFFFEFFF)
      {
        std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(&bytes, *(char **)(v37 + 72), (char *)(*(void *)(v37 + 72) + v10), v10);
        long long v11 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, v10);
        CFDataRef v12 = v11;
        if (v11)
        {
          ACFULogging::getLogInstance(v11);
          size_t v13 = (ACFULogging *)ACFULogging::handleMessage();
          ACFULogging::getLogInstance(v13);
          v28.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
          *(_OWORD *)&v28.__r_.__value_.__r.__words[1] = xmmword_21DFAD2D0;
          strcpy(v28.__r_.__value_.__l.__data_, "BasebandUpdaterTransport");
          int v14 = std::string::append(&v28, "::", 2uLL);
          long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
          v29.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v15;
          v14->__r_.__value_.__l.__size_ = 0;
          v14->__r_.__value_.__r.__words[2] = 0;
          v14->__r_.__value_.__r.__words[0] = 0;
          int v16 = std::string::append(&v29, "runCertification", 0x10uLL);
          long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
          std::string::size_type v31 = v16->__r_.__value_.__r.__words[2];
          *(_OWORD *)std::string __p = v17;
          v16->__r_.__value_.__l.__size_ = 0;
          v16->__r_.__value_.__r.__words[2] = 0;
          v16->__r_.__value_.__r.__words[0] = 0;
          CFDataGetBytePtr(v12);
          CFDataGetLength(v12);
          ACFULogging::handleMessageBinary();
          if (SHIBYTE(v31) < 0) {
            goto LABEL_8;
          }
          goto LABEL_16;
        }
LABEL_28:
        ACFULogging::getLogInstance(0);
        ACFULogging::handleMessage();
        CFDataRef v12 = 0;
        char v18 = 0;
        int v19 = 4000;
        CFDataRef v20 = bytes;
        if (bytes) {
          goto LABEL_19;
        }
        goto LABEL_20;
      }
    }
    goto LABEL_26;
  }
  ACFULogging::getLogInstance(v8);
  ACFULogging::handleMessage();
  CFDataRef v12 = 0;
  int v19 = 1010;
LABEL_23:
  *(void *)a2 = v12;
  *(_DWORD *)(a2 + 8) = v19;
  (*(void (**)(UInt8 *))(*(void *)v7 + 8))(v7);
LABEL_24:
  MEMORY[0x223C1D620](v36);
  MEMORY[0x223C1D700](v38);
  security::ARICommandDriver::~ARICommandDriver((security::ARICommandDriver *)&v39);
}

void sub_21DF98C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  MEMORY[0x223C1D620](&a36);
  MEMORY[0x223C1D700](v36 - 128);
  security::ARICommandDriver::~ARICommandDriver((security::ARICommandDriver *)(v36 - 56));
  _Unwind_Resume(a1);
}

uint64_t BasebandUpdaterTransport::retrieveChipRev(BasebandUpdaterTransport *this, unsigned __int8 *a2)
{
  unsigned int v11 = 4;
  *(_DWORD *)CFDataRef v12 = 0;
  long long v4 = operator new(0x20uLL);
  *(void *)long long v4 = &unk_26CECF938;
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *((void *)v4 + 3) = 0;
  uint64_t v5 = BasebandUpdaterTransport::IOACIPCHelper::init((BasebandUpdaterTransport::IOACIPCHelper *)v4, "rom");
  if (v5)
  {
    size_t v13 = (IOACIPCClass *)*((void *)v4 + 1);
    if (v13)
    {
      int v6 = (ACFULogging *)ACFUACIPCTransport::readRegister(this, &v13, 2, v12, &v11);
      if (v6)
      {
        ACFULogging::getLogInstance(v6);
        ACFULogging::handleMessage();
        uint64_t v7 = 3025;
      }
      else
      {
        uint64_t v7 = 0;
        *a2 = v12[1];
      }
    }
    else
    {
      ACFULogging::getLogInstance((ACFULogging *)v5);
      ACFULogging::handleMessage();
      uint64_t v7 = 3000;
    }
    (*(void (**)(void *))(*(void *)v4 + 8))(v4);
  }
  else
  {
    int v9 = (ACFULogging *)(*(uint64_t (**)(void *))(*(void *)v4 + 8))(v4);
    ACFULogging::getLogInstance(v9);
    unint64_t v10 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v10);
    ACFULogging::handleMessage();
    return 3019;
  }
  return v7;
}

void sub_21DF98FE4(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void BasebandUpdaterTransport::~BasebandUpdaterTransport(void **this)
{
  *this = &unk_26CECF828;
  if (*((char *)this + 215) < 0) {
    operator delete(this[24]);
  }
  uint64_t v2 = (std::__shared_weak_count *)this[22];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = this[20];
  if (v3) {
    CFRelease(v3);
  }

  ACFUACIPCTransport::~ACFUACIPCTransport((ACFUACIPCTransport *)this);
}

{
  std::__shared_weak_count *v2;
  const void *v3;
  void *v4;
  uint64_t vars8;

  *this = &unk_26CECF828;
  if (*((char *)this + 215) < 0) {
    operator delete(this[24]);
  }
  uint64_t v2 = (std::__shared_weak_count *)this[22];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = this[20];
  if (v3) {
    CFRelease(v3);
  }
  ACFUACIPCTransport::~ACFUACIPCTransport((ACFUACIPCTransport *)this);

  operator delete(v4);
}

void BasebandUpdaterTransport::IOACIPCHelper::~IOACIPCHelper(BasebandUpdaterTransport::IOACIPCHelper *this)
{
  *(void *)this = &unk_26CECF938;
  uint64_t v2 = *((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v2)
  {
    std::mutex::~mutex((std::mutex *)(v2 + 48));
    std::condition_variable::~condition_variable((std::condition_variable *)v2);
    operator delete(v3);
  }
  long long v4 = *((void *)this + 2);
  if (v4) {
    dispatch_release(v4);
  }
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
}

{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t vars8;

  *(void *)this = &unk_26CECF938;
  uint64_t v2 = *((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v2)
  {
    std::mutex::~mutex((std::mutex *)(v2 + 48));
    std::condition_variable::~condition_variable((std::condition_variable *)v2);
    operator delete(v3);
  }
  long long v4 = *((void *)this + 2);
  if (v4) {
    dispatch_release(v4);
  }
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }

  operator delete(this);
}

void *std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0>,__CFData const* ()(std::shared_ptr<ACFUFirmware>)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &unk_26CECF968;
  return result;
}

void std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0>,__CFData const* ()(std::shared_ptr<ACFUFirmware>)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26CECF968;
}

ACFULogging *std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0>,__CFData const* ()(std::shared_ptr<ACFUFirmware>)>::operator()(ACFULogging *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v2 = *(std::__shared_weak_count **)(a2 + 8);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  if (!v3)
  {
    ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage();
    long long v15 = 0;
    goto LABEL_34;
  }
  long long v4 = __dynamic_cast(v3, MEMORY[0x263F26BA8], MEMORY[0x263F26BC0], 0);
  uint64_t v5 = 0;
  if (v4) {
    BOOL v6 = v2 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v5 = v2;
  }
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  GetBasebandTatsuTagToFileNameMap(&v18);
  uint64_t v7 = v19;
  if (!v19) {
LABEL_13:
  }
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  while (1)
  {
    while (1)
    {
      unint64_t v8 = *((void *)v7 + 4);
      if (v8 <= (unint64_t)@"Cellular1,LLB") {
        break;
      }
      uint64_t v7 = *(char **)v7;
      if (!v7) {
        goto LABEL_13;
      }
    }
    if (v8 >= (unint64_t)@"Cellular1,LLB") {
      break;
    }
    uint64_t v7 = (char *)*((void *)v7 + 1);
    if (!v7) {
      goto LABEL_13;
    }
  }
  RTKitFirmware::getFileOffsetByFileName();
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v18, v19);
  if (!BYTE4(v20)) {
    goto LABEL_31;
  }
  ACFULogging::getLogInstance(v9);
  ACFULogging::handleMessage();
  GetBasebandTatsuTagToFileNameMap(&v18);
  unint64_t v10 = v19;
  if (!v19) {
LABEL_21:
  }
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  while (1)
  {
    while (1)
    {
      unint64_t v11 = *((void *)v10 + 4);
      if (v11 <= (unint64_t)@"Cellular1,LLB") {
        break;
      }
      unint64_t v10 = *(char **)v10;
      if (!v10) {
        goto LABEL_21;
      }
    }
    if (v11 >= (unint64_t)@"Cellular1,LLB") {
      break;
    }
    unint64_t v10 = (char *)*((void *)v10 + 1);
    if (!v10) {
      goto LABEL_21;
    }
  }
  int v12 = (*(uint64_t (**)(void *, char *))(*(void *)v4 + 40))(v4, v10 + 40);
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v18, v19);
  if (v12)
  {
    ACFULogging::getLogInstance(v9);
    size_t v13 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v13);
    ACFULogging::handleMessage();
    uint64_t TypeID = (ACFULogging *)ACFUFirmware::copyFWContainerFromOffset((ACFUFirmware *)v3);
    long long v15 = TypeID;
    if (TypeID && (CFTypeID v16 = CFGetTypeID(TypeID), TypeID = (ACFULogging *)CFDataGetTypeID(), (ACFULogging *)v16 == TypeID))
    {
      ACFULogging::getLogInstance(TypeID);
      ACFULogging::handleMessage();
    }
    else
    {
      ACFULogging::getLogInstance(TypeID);
      ACFULogging::handleMessage();
      long long v15 = 0;
    }
    if (!v5) {
      goto LABEL_34;
    }
  }
  else
  {
LABEL_31:
    ACFULogging::getLogInstance(v9);
    ACFULogging::handleMessage();
    long long v15 = 0;
    if (!v5) {
      goto LABEL_34;
    }
  }
  if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
LABEL_34:
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  return v15;
}

void sub_21DF99664(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14)
{
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
  if (v14)
  {
    if (!atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0>,__CFData const* ()(std::shared_ptr<ACFUFirmware>)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN24BasebandUpdaterTransport4initENSt3__110shared_ptrI15ACFUDiagnosticsEENS0_8weak_ptrI15BasebandRe"
                     "storeEENS_10ParametersEE3$_0")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZN24BasebandUpdaterTransport4initENSt3__110shared_ptrI15ACFUDiagnosticsEENS0_8weak_ptrI1"
                                "5BasebandRestoreEENS_10ParametersEE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN24BasebandUpdaterTransport4initENSt3__110shared_ptrI15ACFUDiagnosticsEENS0_8weak_ptrI15BasebandRestoreEENS_10ParametersEE3$_0"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN24BasebandUpdaterTransport4initENSt3__110shared_ptrI15ACFUDiagnosticsEENS0_8weak_ptrI15BasebandRestoreEENS_10ParametersEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0>,__CFData const* ()(std::shared_ptr<ACFUFirmware>)>::target_type()
{
}

void *std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1>,std::unique_ptr<ACFUDataContainer> ()(std::string const&)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26CECF9F8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1>,std::unique_ptr<ACFUDataContainer> ()(std::string const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26CECF9F8;
  a2[1] = v2;
  return result;
}

void std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1>,std::unique_ptr<ACFUDataContainer> ()(std::string const&)>::operator()(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string::size_type *a3@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(std::__shared_weak_count **)(v4 + 176);
  if (!v5)
  {
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = std::__shared_weak_count::lock(v5);
  uint64_t v7 = v5;
  if (!v5 || (uint64_t v5 = *(std::__shared_weak_count **)(v4 + 168)) == 0)
  {
LABEL_6:
    ACFULogging::getLogInstance((ACFULogging *)v5);
    ACFULogging::handleMessage();
    *a3 = 0;
    if (!v7) {
      return;
    }
    goto LABEL_7;
  }
  BasebandRestore::handleRTIClientImage((ACFULogging *)v5, a2, a3);
LABEL_7:
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void sub_21DF9991C(_Unwind_Exception *exception_object)
{
  if (!atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1>,std::unique_ptr<ACFUDataContainer> ()(std::string const&)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN24BasebandUpdaterTransport4initENSt3__110shared_ptrI15ACFUDiagnosticsEENS0_8weak_ptrI15BasebandRe"
                     "storeEENS_10ParametersEE3$_1")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZN24BasebandUpdaterTransport4initENSt3__110shared_ptrI15ACFUDiagnosticsEENS0_8weak_ptrI1"
                                "5BasebandRestoreEENS_10ParametersEE3$_1" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN24BasebandUpdaterTransport4initENSt3__110shared_ptrI15ACFUDiagnosticsEENS0_8weak_ptrI15BasebandRestoreEENS_10ParametersEE3$_1"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN24BasebandUpdaterTransport4initENSt3__110shared_ptrI15ACFUDiagnosticsEENS0_8weak_ptrI15BasebandRestoreEENS_10ParametersEE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1>,std::unique_ptr<ACFUDataContainer> ()(std::string const&)>::target_type()
{
}

void *_ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher6notifyEbNS_8functionIFvvEEEEd_UlvE_NS_9allocatorIS7_EES5_E7__cloneEv()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &unk_26CECFA88;
  return result;
}

void _ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher6notifyEbNS_8functionIFvvEEEEd_UlvE_NS_9allocatorIS7_EES5_E7__cloneEPNS0_6__baseIS5_EE(uint64_t a1, void *a2)
{
  *a2 = &unk_26CECFA88;
}

uint64_t _ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher6notifyEbNS_8functionIFvvEEEEd_UlvE_NS_9allocatorIS7_EES5_E6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021DFAEC5ELL) {
    return a1 + 8;
  }
  if (((v3 & 0x800000021DFAEC5ELL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000021DFAEC5ELL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021DFAEC5ELL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 8;
  }
  return 0;
}

void *_ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher6notifyEbNS_8functionIFvvEEEEd_UlvE_NS_9allocatorIS7_EES5_E11target_typeEv()
{
  return &_ZTIZN15ACFUSynchronize7Syncher6notifyEbNSt3__18functionIFvvEEEEd_UlvE_;
}

void *_ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_E7__cloneEv()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &unk_26CECFB18;
  return result;
}

void _ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_E7__cloneEPNS0_6__baseIS5_EE(uint64_t a1, void *a2)
{
  *a2 = &unk_26CECFB18;
}

uint64_t _ZNSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_EclEv()
{
  return 1;
}

uint64_t _ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_E6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021DFAED13) {
    return a1 + 8;
  }
  if (((v3 & 0x800000021DFAED13 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000021DFAED13)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021DFAED13 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 8;
  }
  return 0;
}

void *_ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_E11target_typeEv()
{
  return &_ZTIZN15ACFUSynchronize7Syncher4waitEjNSt3__18functionIFbvEEEEd_UlvE_;
}

void std::__shared_ptr_emplace<ACFUCommon::PersonalizeParams>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CECFB98;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ACFUCommon::PersonalizeParams>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CECFB98;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<ACFUCommon::PersonalizeParams>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16))();
}

void *std::__function::__func<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0>,std::string ()(std::string const&)>::~__func(void *a1)
{
  *a1 = &unk_26CECFBE8;
  uint64_t v2 = (const void *)a1[1];
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void std::__function::__func<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0>,std::string ()(std::string const&)>::~__func(void *__p)
{
  *std::string __p = &unk_26CECFBE8;
  uint64_t v2 = (const void *)__p[1];
  if (v2) {
    CFRelease(v2);
  }

  operator delete(__p);
}

void *std::__function::__func<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0>,std::string ()(std::string const&)>::__clone(uint64_t a1)
{
  uint64_t v2 = operator new(0x18uLL);
  uint64_t v3 = *(const void **)(a1 + 8);
  *uint64_t v2 = &unk_26CECFBE8;
  v2[1] = v3;
  if (v3) {
    CFRetain(v3);
  }
  v2[2] = *(void *)(a1 + 16);
  return v2;
}

CFTypeRef std::__function::__func<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0>,std::string ()(std::string const&)>::__clone(uint64_t a1, void *a2)
{
  CFTypeRef result = *(CFTypeRef *)(a1 + 8);
  *a2 = &unk_26CECFBE8;
  a2[1] = result;
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  a2[2] = *(void *)(a1 + 16);
  return result;
}

void std::__function::__func<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0>,std::string ()(std::string const&)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 8);
  if (v1) {
    CFRelease(v1);
  }
}

void std::__function::__func<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0>,std::string ()(std::string const&)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (const void *)__p[1];
  if (v2) {
    CFRelease(v2);
  }

  operator delete(__p);
}

void std::__function::__func<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0>,std::string ()(std::string const&)>::operator()(std::string *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  CFStringRef size = (const __CFString *)a1->__r_.__value_.__l.__size_;
  uint64_t v4 = (void *)a1->__r_.__value_.__r.__words[2];
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  memset(&v101, 0, sizeof(v101));
  if (!size) {
    goto LABEL_7;
  }
  unint64_t v7 = *(unsigned __int8 *)(a2 + 23);
  char v8 = v7;
  size_t v9 = *(void *)(a2 + 8);
  if ((v7 & 0x80u) == 0) {
    uint64_t v10 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v10 = *(void *)(a2 + 8);
  }
  if (v10 != 4)
  {
    if (!v10)
    {
LABEL_7:
      *((unsigned char *)&v101.__r_.__value_.__s + 23) = 12;
      LODWORD(v101.__r_.__value_.__r.__words[1]) = 1953391981;
      v101.__r_.__value_.__r.__words[0] = *(void *)"Bad argument";
LABEL_189:
      ACFULogging::getLogInstance((ACFULogging *)a1);
      ACFULogging::handleMessage();
      goto LABEL_190;
    }
LABEL_15:
    if (v4[3]) {
      goto LABEL_108;
    }
    bzero(buffer, 0x400uLL);
    CFStringGetCString(size, buffer, 1024, 0x8000100u);
    memset(__dst, 170, sizeof(__dst));
    size_t v14 = strlen(buffer);
    if (v14 > 0x7FFFFFFFFFFFFFF7) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    long long v15 = (void *)v14;
    if (v14 >= 0x17)
    {
      uint64_t v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v14 | 7) != 0x17) {
        uint64_t v17 = v14 | 7;
      }
      uint64_t v18 = v17 + 1;
      CFTypeID v16 = (void **)operator new(v17 + 1);
      __dst[1] = v15;
      __dst[2] = (void *)(v18 | 0x8000000000000000);
      __dst[0] = v16;
    }
    else
    {
      HIBYTE(__dst[2]) = v14;
      CFTypeID v16 = __dst;
      if (!v14)
      {
LABEL_28:
        *((unsigned char *)v15 + (void)v16) = 0;
        memset(__b, 170, sizeof(__b));
        int v19 = SHIBYTE(__dst[2]);
        if (SHIBYTE(__dst[2]) >= 0) {
          size_t v20 = HIBYTE(__dst[2]);
        }
        else {
          size_t v20 = (size_t)__dst[1];
        }
        unint64_t v21 = v20 + 1;
        memset(v126, 170, 24);
        if (v20 + 1 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v21 >= 0x17)
        {
          uint64_t v23 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v21 | 7) != 0x17) {
            uint64_t v23 = v21 | 7;
          }
          uint64_t v24 = v23 + 1;
          size_t v22 = operator new(v23 + 1);
          *(void *)&v126[16] = v24 | 0x8000000000000000;
          *(void *)long long v126 = v22;
          *(void *)&v126[8] = v20 + 1;
        }
        else
        {
          memset(v126, 0, 24);
          size_t v22 = v126;
          v126[23] = v20 + 1;
          if (!v20) {
            goto LABEL_42;
          }
        }
        if (v19 >= 0) {
          long long v25 = __dst;
        }
        else {
          long long v25 = (void **)__dst[0];
        }
        memmove(v22, v25, v20);
LABEL_42:
        *(_WORD *)&v22[v20] = 47;
        int v26 = std::string::append((std::string *)v126, "dtt.bin", 7uLL);
        long long v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
        *(void *)&long long v105 = *((void *)&v26->__r_.__value_.__l + 2);
        *(_OWORD *)std::string __p = v27;
        v26->__r_.__value_.__l.__size_ = 0;
        v26->__r_.__value_.__r.__words[2] = 0;
        v26->__r_.__value_.__r.__words[0] = 0;
        std::ifstream::basic_ifstream((uint64_t *)__b);
        if (SBYTE7(v105) < 0)
        {
          operator delete(__p[0]);
          if ((v126[23] & 0x80000000) == 0)
          {
LABEL_44:
            if (__b[5].__r_.__value_.__r.__words[2])
            {
LABEL_45:
              unint64_t v133 = 0xAAAAAAAAAAAAAAAALL;
              *(void *)&long long v28 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v131 = v28;
              long long v132 = v28;
              long long v129 = v28;
              long long v130 = v28;
              long long v127 = v28;
              long long v128 = v28;
              *(_OWORD *)long long v126 = v28;
              *(_OWORD *)&v126[16] = v28;
              std::istream::tellg();
              std::istream::seekg();
              unint64_t v125 = 0xAAAAAAAAAAAAAAAALL;
              *(void *)&long long v29 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v123 = v29;
              long long v124 = v29;
              long long v121 = v29;
              long long v122 = v29;
              long long v119 = v29;
              long long v120 = v29;
              long long v117 = v29;
              long long v118 = v29;
              std::istream::tellg();
              unint64_t v30 = v125;
              unint64_t v31 = v133;
              std::istream::seekg();
              unint64_t v32 = (v30 - v31) / 0x24;
              if ((v30 - v31) % 0x24)
              {
                if (!v4[3])
                {
LABEL_58:
                  std::string::__assign_external(&v101, "Invalid coredump translation table file", 0x27uLL);
                  goto LABEL_59;
                }
                CFAllocatorRef v33 = (char *)v4[2];
                if (!v33)
                {
LABEL_54:
                  v4[2] = 0;
                  uint64_t v35 = v4[1];
                  if (v35)
                  {
                    for (uint64_t i = 0; i != v35; ++i)
                      *(void *)(*v4 + 8 * i) = 0;
                  }
                  v4[3] = 0;
                  goto LABEL_58;
                }
                while (1)
                {
                  uint64_t v34 = *(char **)v33;
                  if (v33[63] < 0)
                  {
                    operator delete(*((void **)v33 + 5));
                    if ((v33[39] & 0x80000000) == 0) {
                      goto LABEL_50;
                    }
LABEL_53:
                    operator delete(*((void **)v33 + 2));
                    operator delete(v33);
                    CFAllocatorRef v33 = v34;
                    if (!v34) {
                      goto LABEL_54;
                    }
                  }
                  else
                  {
                    if (v33[39] < 0) {
                      goto LABEL_53;
                    }
LABEL_50:
                    operator delete(v33);
                    CFAllocatorRef v33 = v34;
                    if (!v34) {
                      goto LABEL_54;
                    }
                  }
                }
              }
              if ((int)v32 < 1)
              {
LABEL_100:
                int v37 = 1;
                goto LABEL_101;
              }
              int v38 = 0;
              while (1)
              {
                int v116 = 0;
                memset(&v115[1], 0, 32);
                std::istream::read();
                if ((*((unsigned char *)&__b[1].__r_.__value_.__r.__words[1]
                      + *(void *)(__b[0].__r_.__value_.__r.__words[0] - 24)) & 5) != 0)
                {
                  unint64_t v113 = 0xAAAAAAAAAAAAAAAALL;
                  *(void *)&long long v91 = 0xAAAAAAAAAAAAAAAALL;
                  *((void *)&v91 + 1) = 0xAAAAAAAAAAAAAAAALL;
                  v112[7] = v91;
                  v112[8] = v91;
                  v112[5] = v91;
                  v112[6] = v91;
                  v112[3] = v91;
                  v112[4] = v91;
                  v112[1] = v91;
                  v112[2] = v91;
                  long long v111 = v91;
                  v112[0] = v91;
                  *(_OWORD *)uint64_t v109 = v91;
                  long long v110 = v91;
                  long long v107 = v91;
                  long long v108 = v91;
                  long long v105 = v91;
                  long long v106 = v91;
                  *(_OWORD *)std::string __p = v91;
                  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)__p);
                  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v105, (uint64_t)"Failed to read coredump translation table entry instance ", 57);
                  std::ostream::operator<<();
                  if ((BYTE8(v111) & 0x10) != 0)
                  {
                    uint64_t v94 = v111;
                    if ((unint64_t)v111 < *((void *)&v108 + 1))
                    {
                      *(void *)&long long v111 = *((void *)&v108 + 1);
                      uint64_t v94 = *((void *)&v108 + 1);
                    }
                    v95 = (const void **)&v108;
                  }
                  else
                  {
                    if ((BYTE8(v111) & 8) == 0)
                    {
                      std::string::size_type v92 = 0;
                      *((unsigned char *)&__s.__r_.__value_.__s + 23) = 0;
                      p_s = &__s;
                      goto LABEL_211;
                    }
                    v95 = (const void **)&v106 + 1;
                    uint64_t v94 = *((void *)&v107 + 1);
                  }
                  long long v96 = *v95;
                  std::string::size_type v92 = v94 - (void)*v95;
                  if (v92 > 0x7FFFFFFFFFFFFFF7) {
                    std::string::__throw_length_error[abi:ne180100]();
                  }
                  if (v92 >= 0x17)
                  {
                    uint64_t v97 = (v92 & 0xFFFFFFFFFFFFFFF8) + 8;
                    if ((v92 | 7) != 0x17) {
                      uint64_t v97 = v92 | 7;
                    }
                    uint64_t v98 = v97 + 1;
                    p_s = (std::string *)operator new(v97 + 1);
                    __s.__r_.__value_.__l.__size_ = v92;
                    __s.__r_.__value_.__r.__words[2] = v98 | 0x8000000000000000;
                    __s.__r_.__value_.__r.__words[0] = (std::string::size_type)p_s;
                  }
                  else
                  {
                    *((unsigned char *)&__s.__r_.__value_.__s + 23) = v94 - *(unsigned char *)v95;
                    p_s = &__s;
                    if (!v92)
                    {
LABEL_211:
                      p_s->__r_.__value_.__s.__data_[v92] = 0;
                      if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0) {
                        operator delete(v101.__r_.__value_.__l.__data_);
                      }
                      std::string v101 = __s;
                      __p[0] = *(void **)MEMORY[0x263F8C2B8];
                      uint64_t v99 = *(void *)(MEMORY[0x263F8C2B8] + 72);
                      *(void **)((char *)__p + *((void *)__p[0] - 3)) = *(void **)(MEMORY[0x263F8C2B8] + 64);
                      *(void *)&long long v105 = v99;
                      *((void *)&v105 + 1) = MEMORY[0x263F8C318] + 16;
                      if (SHIBYTE(v110) < 0) {
                        operator delete(v109[1]);
                      }
                      std::streambuf::~streambuf();
                      std::iostream::~basic_iostream();
                      MEMORY[0x223C1DDF0](v112);
LABEL_59:
                      int v37 = 0;
LABEL_101:
                      if (!std::filebuf::close()) {
                        std::ios_base::clear((std::ios_base *)((char *)__b + *(void *)(__b[0].__r_.__value_.__r.__words[0] - 24)), *(_DWORD *)((char *)&__b[1].__r_.__value_.__r.__words[1]+ *(void *)(__b[0].__r_.__value_.__r.__words[0] - 24)) | 4);
                      }
                      LOBYTE(v19) = HIBYTE(__dst[2]);
LABEL_104:
                      __b[0].__r_.__value_.__r.__words[0] = *MEMORY[0x263F8C2A8];
                      *(std::string::size_type *)((char *)__b[0].__r_.__value_.__r.__words
                                                + *(void *)(__b[0].__r_.__value_.__r.__words[0] - 24)) = *(void *)(MEMORY[0x263F8C2A8] + 24);
                      MEMORY[0x223C1DAE0](&__b[0].__r_.__value_.__r.__words[2]);
                      std::istream::~istream();
                      a1 = (std::string *)MEMORY[0x223C1DDF0](&__b[17].__r_.__value_.__r.__words[2]);
                      if ((v19 & 0x80) != 0) {
                        operator delete(__dst[0]);
                      }
                      if (!v37) {
                        goto LABEL_189;
                      }
                      unint64_t v7 = *(unsigned __int8 *)(a2 + 23);
                      size_t v9 = *(void *)(a2 + 8);
                      char v8 = *(unsigned char *)(a2 + 23);
LABEL_108:
                      if (v8 >= 0) {
                        uint64_t v55 = (uint64_t *)a2;
                      }
                      else {
                        uint64_t v55 = *(uint64_t **)a2;
                      }
                      if (v8 >= 0) {
                        unint64_t v56 = v7;
                      }
                      else {
                        unint64_t v56 = v9;
                      }
                      unint64_t v57 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)buffer, v55, v56);
                      int8x8_t v58 = (int8x8_t)v4[1];
                      if (!*(void *)&v58) {
                        goto LABEL_165;
                      }
                      unint64_t v59 = v57;
                      uint8x8_t v60 = (uint8x8_t)vcnt_s8(v58);
                      v60.i16[0] = vaddlv_u8(v60);
                      if (v60.u32[0] > 1uLL)
                      {
                        unint64_t v61 = v57;
                        if (v57 >= *(void *)&v58) {
                          unint64_t v61 = v57 % *(void *)&v58;
                        }
                      }
                      else
                      {
                        unint64_t v61 = (*(void *)&v58 - 1) & v57;
                      }
                      long long v62 = *(uint64_t ***)(*v4 + 8 * v61);
                      if (!v62) {
                        goto LABEL_165;
                      }
                      long long v63 = *v62;
                      if (!*v62) {
                        goto LABEL_165;
                      }
                      char v64 = *(unsigned char *)(a2 + 23);
                      if (v64 >= 0) {
                        uint64_t v65 = *(unsigned __int8 *)(a2 + 23);
                      }
                      else {
                        uint64_t v65 = *(void *)(a2 + 8);
                      }
                      if (v64 >= 0) {
                        int v66 = (uint64_t *)a2;
                      }
                      else {
                        int v66 = *(uint64_t **)a2;
                      }
                      if (v60.u32[0] < 2uLL)
                      {
                        uint64_t v67 = *(void *)&v58 - 1;
                        while (1)
                        {
                          uint64_t v72 = v63[1];
                          if (v72 == v59)
                          {
                            uint64_t v73 = *((unsigned __int8 *)v63 + 39);
                            if ((v73 & 0x80u) == 0) {
                              uint64_t v74 = *((unsigned __int8 *)v63 + 39);
                            }
                            else {
                              uint64_t v74 = v63[3];
                            }
                            if (v74 == v65)
                            {
                              if ((v73 & 0x80) != 0)
                              {
                                if (!memcmp((const void *)v63[2], v66, v63[3])) {
                                  goto LABEL_162;
                                }
                              }
                              else
                              {
                                if (!*((unsigned char *)v63 + 39)) {
                                  goto LABEL_162;
                                }
                                uint64_t v75 = 0;
                                while (*((unsigned __int8 *)v63 + v75 + 16) == *((unsigned __int8 *)v66 + v75))
                                {
                                  if (v73 == ++v75) {
                                    goto LABEL_161;
                                  }
                                }
                              }
                            }
                          }
                          else if ((v72 & v67) != v61)
                          {
                            goto LABEL_165;
                          }
                          long long v63 = (uint64_t *)*v63;
                          if (!v63) {
                            goto LABEL_165;
                          }
                        }
                      }
                      while (1)
                      {
                        unint64_t v68 = v63[1];
                        if (v68 == v59)
                        {
                          uint64_t v69 = *((unsigned __int8 *)v63 + 39);
                          if ((v69 & 0x80u) == 0) {
                            uint64_t v70 = *((unsigned __int8 *)v63 + 39);
                          }
                          else {
                            uint64_t v70 = v63[3];
                          }
                          if (v70 == v65)
                          {
                            if ((v69 & 0x80) == 0)
                            {
                              if (!*((unsigned char *)v63 + 39)) {
                                goto LABEL_162;
                              }
                              uint64_t v71 = 0;
                              do
                              {
                                if (*((unsigned __int8 *)v63 + v71 + 16) != *((unsigned __int8 *)v66 + v71)) {
                                  goto LABEL_130;
                                }
                                ++v71;
                              }
                              while (v69 != v71);
LABEL_161:
                              if (v63)
                              {
LABEL_162:
                                *(void *)buffer = a2;
                                int8x16_t v76 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v4, a2, (long long **)buffer);
                                if (v76 + 5 != a3)
                                {
                                  if (*((char *)v76 + 63) < 0)
                                  {
                                    std::string::__assign_no_alias<true>(a3, (void *)v76[5], v76[6]);
                                  }
                                  else
                                  {
                                    long long v77 = *(_OWORD *)(v76 + 5);
                                    a3[2] = v76[7];
                                    *(_OWORD *)a3 = v77;
                                  }
                                }
                                goto LABEL_190;
                              }
LABEL_165:
                              unint64_t v144 = 0xAAAAAAAAAAAAAAAALL;
                              *(void *)&long long v78 = 0xAAAAAAAAAAAAAAAALL;
                              *((void *)&v78 + 1) = 0xAAAAAAAAAAAAAAAALL;
                              v143[8] = v78;
                              v143[7] = v78;
                              v143[6] = v78;
                              v143[5] = v78;
                              v143[4] = v78;
                              v143[3] = v78;
                              v143[2] = v78;
                              v143[1] = v78;
                              v143[0] = v78;
                              long long v142 = v78;
                              long long v141 = v78;
                              *(_OWORD *)int v140 = v78;
                              long long v139 = v78;
                              long long v138 = v78;
                              long long v137 = v78;
                              long long v136 = v78;
                              *(_OWORD *)buffer = v78;
                              std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)buffer);
                              long long v79 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v136, (uint64_t)"Tag (", 5);
                              int v80 = *(char *)(a2 + 23);
                              if (v80 >= 0) {
                                uint64_t v81 = a2;
                              }
                              else {
                                uint64_t v81 = *(void *)a2;
                              }
                              if (v80 >= 0) {
                                uint64_t v82 = *(unsigned __int8 *)(a2 + 23);
                              }
                              else {
                                uint64_t v82 = *(void *)(a2 + 8);
                              }
                              char v83 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v79, v81, v82);
                              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v83, (uint64_t)") not found in coredump translation table", 41);
                              if ((BYTE8(v142) & 0x10) != 0)
                              {
                                uint64_t v86 = v142;
                                if ((unint64_t)v142 < *((void *)&v139 + 1))
                                {
                                  *(void *)&long long v142 = *((void *)&v139 + 1);
                                  uint64_t v86 = *((void *)&v139 + 1);
                                }
                                uint64_t v87 = (const void *)v139;
                                std::string::size_type v84 = v86 - v139;
                                if ((unint64_t)(v86 - v139) > 0x7FFFFFFFFFFFFFF7) {
                                  goto LABEL_194;
                                }
                              }
                              else
                              {
                                if ((BYTE8(v142) & 8) == 0)
                                {
                                  std::string::size_type v84 = 0;
                                  *((unsigned char *)&__b[0].__r_.__value_.__s + 23) = 0;
                                  char v85 = __b;
                                  goto LABEL_184;
                                }
                                uint64_t v87 = (const void *)*((void *)&v137 + 1);
                                std::string::size_type v84 = *((void *)&v138 + 1) - *((void *)&v137 + 1);
                                if (*((void *)&v138 + 1) - *((void *)&v137 + 1) > 0x7FFFFFFFFFFFFFF7uLL) {
LABEL_194:
                                }
                                  std::string::__throw_length_error[abi:ne180100]();
                              }
                              if (v84 >= 0x17)
                              {
                                uint64_t v88 = (v84 & 0xFFFFFFFFFFFFFFF8) + 8;
                                if ((v84 | 7) != 0x17) {
                                  uint64_t v88 = v84 | 7;
                                }
                                uint64_t v89 = v88 + 1;
                                char v85 = (std::string *)operator new(v88 + 1);
                                __b[0].__r_.__value_.__r.__words[2] = v89 | 0x8000000000000000;
                                __b[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v85;
                                __b[0].__r_.__value_.__l.__size_ = v84;
                              }
                              else
                              {
                                *((unsigned char *)&__b[0].__r_.__value_.__s + 23) = v84;
                                char v85 = __b;
                                if (!v84)
                                {
LABEL_184:
                                  v85->__r_.__value_.__s.__data_[v84] = 0;
                                  if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0) {
                                    operator delete(v101.__r_.__value_.__l.__data_);
                                  }
                                  std::string v101 = __b[0];
                                  *(void *)buffer = *MEMORY[0x263F8C2B8];
                                  uint64_t v90 = *(void *)(MEMORY[0x263F8C2B8] + 72);
                                  *(void *)&buffer[*(void *)(*(void *)buffer - 24)] = *(void *)(MEMORY[0x263F8C2B8] + 64);
                                  *(void *)&long long v136 = v90;
                                  *((void *)&v136 + 1) = MEMORY[0x263F8C318] + 16;
                                  if (SHIBYTE(v141) < 0) {
                                    operator delete(v140[1]);
                                  }
                                  std::streambuf::~streambuf();
                                  std::iostream::~basic_iostream();
                                  a1 = (std::string *)MEMORY[0x223C1DDF0](v143);
                                  goto LABEL_189;
                                }
                              }
                              memmove(v85, v87, v84);
                              goto LABEL_184;
                            }
                            if (!memcmp((const void *)v63[2], v66, v63[3])) {
                              goto LABEL_162;
                            }
                          }
                        }
                        else
                        {
                          if (v68 >= *(void *)&v58) {
                            v68 %= *(void *)&v58;
                          }
                          if (v68 != v61) {
                            goto LABEL_165;
                          }
                        }
LABEL_130:
                        long long v63 = (uint64_t *)*v63;
                        if (!v63) {
                          goto LABEL_165;
                        }
                      }
                    }
                  }
                  memmove(p_s, v96, v92);
                  goto LABEL_211;
                }
                __p[1] = (void *)0xAAAAAAAAAAAAAAAALL;
                *(void *)&long long v105 = 0x4AAAAAAAAAAAAAALL;
                __p[0] = (void *)(LODWORD(v115[1]) | 0xAAAAAA0000000000);
                if (LOBYTE(v115[1]) != 67)
                {
                  uint64_t v39 = bswap32(v115[1]);
                  __p[0] = (void *)(v100 & 0xFFFFFF0000000000 | v39);
                  unint64_t v100 = v100 & 0xFFFFFF0000000000 | v39 & 0xFFFFFF00FFFFFF00;
                }
                memset(&__s, 170, sizeof(__s));
                size_t v40 = strlen((const char *)&v115[1] + 4);
                if (v40 > 0x7FFFFFFFFFFFFFF7) {
                  std::string::__throw_length_error[abi:ne180100]();
                }
                std::string::size_type v41 = v40;
                if (v40 >= 0x17)
                {
                  uint64_t v43 = (v40 & 0xFFFFFFFFFFFFFFF8) + 8;
                  if ((v40 | 7) != 0x17) {
                    uint64_t v43 = v40 | 7;
                  }
                  uint64_t v44 = v43 + 1;
                  uint64_t v42 = (std::string *)operator new(v43 + 1);
                  __s.__r_.__value_.__l.__size_ = v41;
                  __s.__r_.__value_.__r.__words[2] = v44 | 0x8000000000000000;
                  __s.__r_.__value_.__r.__words[0] = (std::string::size_type)v42;
                }
                else
                {
                  *((unsigned char *)&__s.__r_.__value_.__s + 23) = v40;
                  uint64_t v42 = &__s;
                  if (!v40) {
                    goto LABEL_78;
                  }
                }
                memcpy(v42, (char *)&v115[1] + 4, v41);
LABEL_78:
                v42->__r_.__value_.__s.__data_[v41] = 0;
                std::string::size_type v45 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
                int v46 = SHIBYTE(__s.__r_.__value_.__r.__words[2]);
                if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                  std::string::size_type v45 = __s.__r_.__value_.__l.__size_;
                }
                if (v45 != 17) {
                  goto LABEL_90;
                }
                long long v47 = (std::string *)__s.__r_.__value_.__r.__words[0];
                if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  long long v47 = &__s;
                }
                std::string::size_type v48 = v47->__r_.__value_.__r.__words[0];
                std::string::size_type v49 = v47->__r_.__value_.__l.__size_;
                int v50 = v47->__r_.__value_.__s.__data_[16];
                BOOL v51 = v48 == 0x65725F6873617263 && v49 == 0x6F736A2E74726F70;
                if (v51 && v50 == 110)
                {
                  *((unsigned char *)&v102.__r_.__value_.__s + 23) = 11;
                  strcpy((char *)&v102, "report.json");
                }
                else
                {
LABEL_90:
                  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
                    std::string::__init_copy_ctor_external(&v102, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
                  }
                  else {
                    std::string v102 = __s;
                  }
                }
                v115[0] = (long long *)__p;
                uint64_t v53 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v4, (uint64_t)__p, v115);
                UInt8 v54 = (void **)(v53 + 5);
                if (*((char *)v53 + 63) < 0)
                {
                  operator delete(*v54);
                  *(std::string *)UInt8 v54 = v102;
                  if (v46 < 0) {
                    goto LABEL_65;
                  }
LABEL_98:
                  if ((SBYTE7(v105) & 0x80000000) == 0) {
                    goto LABEL_66;
                  }
LABEL_99:
                  operator delete(__p[0]);
                  if (v32 == ++v38) {
                    goto LABEL_100;
                  }
                }
                else
                {
                  *(_OWORD *)UInt8 v54 = *(_OWORD *)&v102.__r_.__value_.__l.__data_;
                  v53[7] = v102.__r_.__value_.__r.__words[2];
                  if ((v46 & 0x80000000) == 0) {
                    goto LABEL_98;
                  }
LABEL_65:
                  operator delete(__s.__r_.__value_.__l.__data_);
                  if (SBYTE7(v105) < 0) {
                    goto LABEL_99;
                  }
LABEL_66:
                  if (v32 == ++v38) {
                    goto LABEL_100;
                  }
                }
              }
            }
LABEL_62:
            int v37 = 1;
            goto LABEL_104;
          }
        }
        else if ((v126[23] & 0x80000000) == 0)
        {
          goto LABEL_44;
        }
        operator delete(*(void **)v126);
        if (__b[5].__r_.__value_.__r.__words[2]) {
          goto LABEL_45;
        }
        goto LABEL_62;
      }
    }
    memcpy(v16, buffer, (size_t)v15);
    goto LABEL_28;
  }
  if ((char)v7 < 0)
  {
    if (memcmp(*(const void **)a2, "CD00", v9)) {
      goto LABEL_15;
    }
  }
  else if ((_BYTE)v7)
  {
    unint64_t v11 = "CD00";
    int v12 = (unsigned __int8 *)a2;
    uint64_t v13 = *(unsigned __int8 *)(a2 + 23);
    while (*v12 == *(unsigned __int8 *)v11)
    {
      ++v12;
      ++v11;
      if (!--v13) {
        goto LABEL_20;
      }
    }
    goto LABEL_15;
  }
LABEL_20:
  if (a3 != (uint64_t *)"dtt.bin")
  {
    a3[2] = 0x700000000000000;
    *(_OWORD *)a3 = *(_OWORD *)"dtt.bin";
  }
  if (v4[3])
  {
    a1 = std::string::__assign_external(&v101, "Duplicate coredump translation file received", 0x2CuLL);
    goto LABEL_189;
  }
LABEL_190:
  if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v101.__r_.__value_.__l.__data_);
  }
}

void sub_21DF9ADE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t v71 = MEMORY[0x263F8C2A8];
  uint64_t v72 = *MEMORY[0x263F8C2A8];
  STACK[0x310] = *MEMORY[0x263F8C2A8];
  *(unint64_t *)((char *)&STACK[0x310] + *(void *)(v72 - 24)) = *(void *)(v71 + 24);
  MEMORY[0x223C1DAE0](&STACK[0x320]);
  std::istream::~istream();
  MEMORY[0x223C1DDF0](&STACK[0x4B8]);
  if (a69 < 0)
  {
    operator delete(__p);
    if (a20 < 0)
    {
LABEL_6:
      operator delete(a15);
      if ((*(char *)(v69 + 23) & 0x80000000) == 0) {
        goto LABEL_10;
      }
LABEL_9:
      operator delete(*(void **)v69);
LABEL_10:
      _Unwind_Resume(a1);
    }
  }
  else if (a20 < 0)
  {
    goto LABEL_6;
  }
  if ((*(char *)(v69 + 23) & 0x80000000) == 0) {
    goto LABEL_10;
  }
  goto LABEL_9;
}

uint64_t std::__function::__func<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0>,std::string ()(std::string const&)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN24BasebandUpdaterTransport15collectCoredumpENSt3__110shared_ptrI12ACFUFirmwareEEE3$_0") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"ZN24BasebandUpdaterTransport15collectCoredumpENSt3__110shared_ptrI12ACFUFirmwareEEE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN24BasebandUpdaterTransport15collectCoredumpENSt3__110shared_ptrI12ACFUFirmwareEEE3$_0"))return 0; {
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN24BasebandUpdaterTransport15collectCoredumpENSt3__110shared_ptrI12ACFUFirmwareEEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  }
  return 0;
}

void *std::__function::__func<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0>,std::string ()(std::string const&)>::target_type()
{
}

uint64_t *std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, uint64_t a2, long long **a3)
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
  unint64_t v8 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)v58, (uint64_t *)a2, v7);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
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
    uint64_t v13 = *(uint64_t ***)(*(void *)a1 + 8 * v12);
    if (v13)
    {
      size_t v14 = *v13;
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
            uint64_t v21 = v14[1];
            if (v21 == v9)
            {
              uint64_t v22 = *((unsigned __int8 *)v14 + 39);
              if ((v22 & 0x80u) == 0) {
                uint64_t v23 = *((unsigned __int8 *)v14 + 39);
              }
              else {
                uint64_t v23 = v14[3];
              }
              if (v23 == v16)
              {
                if ((v22 & 0x80) != 0)
                {
                  if (!memcmp((const void *)v14[2], v4, v14[3])) {
                    return v14;
                  }
                }
                else
                {
                  if (!*((unsigned char *)v14 + 39)) {
                    return v14;
                  }
                  uint64_t v24 = 0;
                  while (*((unsigned __int8 *)v14 + v24 + 16) == v4[v24])
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
            size_t v14 = (uint64_t *)*v14;
            if (!v14) {
              goto LABEL_51;
            }
          }
        }
        do
        {
          unint64_t v17 = v14[1];
          if (v17 == v9)
          {
            uint64_t v18 = *((unsigned __int8 *)v14 + 39);
            if ((v18 & 0x80u) == 0) {
              uint64_t v19 = *((unsigned __int8 *)v14 + 39);
            }
            else {
              uint64_t v19 = v14[3];
            }
            if (v19 == v16)
            {
              if ((v18 & 0x80) != 0)
              {
                if (!memcmp((const void *)v14[2], v4, v14[3])) {
                  return v14;
                }
              }
              else
              {
                if (!*((unsigned char *)v14 + 39)) {
                  return v14;
                }
                uint64_t v20 = 0;
                while (*((unsigned __int8 *)v14 + v20 + 16) == v4[v20])
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
          size_t v14 = (uint64_t *)*v14;
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
  long long v25 = (void *)(a1 + 16);
  unint64_t v59 = 0xAAAAAAAAAAAAAA00;
  int v26 = operator new(0x40uLL);
  v58[0] = v26;
  v58[1] = a1 + 16;
  *int v26 = 0;
  v26[1] = v9;
  long long v27 = (std::string *)(v26 + 2);
  long long v28 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v27, *(const std::string::value_type **)v28, *((void *)v28 + 1));
  }
  else
  {
    long long v29 = *v28;
    v26[4] = *((void *)v28 + 2);
    *(_OWORD *)&v27->__r_.__value_.__l.__data_ = v29;
  }
  v26[5] = 0;
  v26[6] = 0;
  v26[7] = 0;
  LOBYTE(v59) = 1;
  float v30 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v31 = *(float *)(a1 + 32);
  if (!v10 || (float)(v31 * (float)v10) < v30)
  {
    BOOL v34 = 1;
    if (v10 >= 3) {
      BOOL v34 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v35 = v34 | (2 * v10);
    unint64_t v36 = vcvtps_u32_f32(v30 / v31);
    if (v35 <= v36) {
      size_t prime = v36;
    }
    else {
      size_t prime = v35;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
    }
    unint64_t v10 = *(void *)(a1 + 8);
    if (prime > v10)
    {
LABEL_68:
      if (prime >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      int v38 = operator new(8 * prime);
      uint64_t v39 = *(void **)a1;
      *(void *)a1 = v38;
      if (v39) {
        operator delete(v39);
      }
      uint64_t v40 = 0;
      *(void *)(a1 + 8) = prime;
      do
        *(void *)(*(void *)a1 + 8 * v40++) = 0;
      while (prime != v40);
      std::string::size_type v41 = (void *)*v25;
      if (!*v25) {
        goto LABEL_100;
      }
      size_t v42 = v41[1];
      size_t v43 = prime - 1;
      if ((prime & (prime - 1)) == 0)
      {
        size_t v44 = v42 & v43;
        *(void *)(*(void *)a1 + 8 * v44) = v25;
        for (uint64_t i = (void *)*v41; *v41; uint64_t i = (void *)*v41)
        {
          size_t v46 = i[1] & v43;
          if (v46 == v44)
          {
            std::string::size_type v41 = i;
          }
          else if (*(void *)(*(void *)a1 + 8 * v46))
          {
            void *v41 = *i;
            uint64_t v47 = 8 * v46;
            *uint64_t i = **(void **)(*(void *)a1 + v47);
            **(void **)(*(void *)a1 + v47) = i;
          }
          else
          {
            *(void *)(*(void *)a1 + 8 * v46) = v41;
            std::string::size_type v41 = i;
            size_t v44 = v46;
          }
        }
        goto LABEL_100;
      }
      if (v42 >= prime) {
        v42 %= prime;
      }
      *(void *)(*(void *)a1 + 8 * v42) = v25;
      BOOL v51 = (void *)*v41;
      if (!*v41)
      {
LABEL_100:
        unint64_t v10 = prime;
        uint64_t v54 = prime - 1;
        if ((prime & (prime - 1)) != 0) {
          goto LABEL_101;
        }
        goto LABEL_116;
      }
      while (1)
      {
        size_t v53 = v51[1];
        if (v53 >= prime) {
          v53 %= prime;
        }
        if (v53 == v42) {
          goto LABEL_94;
        }
        if (*(void *)(*(void *)a1 + 8 * v53))
        {
          void *v41 = *v51;
          uint64_t v52 = 8 * v53;
          *BOOL v51 = **(void **)(*(void *)a1 + v52);
          **(void **)(*(void *)a1 + v52) = v51;
          BOOL v51 = v41;
LABEL_94:
          std::string::size_type v41 = v51;
          BOOL v51 = (void *)*v51;
          if (!v51) {
            goto LABEL_100;
          }
        }
        else
        {
          *(void *)(*(void *)a1 + 8 * v53) = v41;
          std::string::size_type v41 = v51;
          BOOL v51 = (void *)*v51;
          size_t v42 = v53;
          if (!v51) {
            goto LABEL_100;
          }
        }
      }
    }
    if (prime < v10)
    {
      unint64_t v48 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v10 < 3 || (uint8x8_t v49 = (uint8x8_t)vcnt_s8((int8x8_t)v10), v49.i16[0] = vaddlv_u8(v49), v49.u32[0] > 1uLL))
      {
        unint64_t v48 = std::__next_prime(v48);
      }
      else
      {
        uint64_t v50 = 1 << -(char)__clz(v48 - 1);
        if (v48 >= 2) {
          unint64_t v48 = v50;
        }
      }
      if (prime <= v48) {
        size_t prime = v48;
      }
      if (prime < v10)
      {
        if (!prime)
        {
          uint64_t v55 = *(void **)a1;
          *(void *)a1 = 0;
          if (v55) {
            operator delete(v55);
          }
          unint64_t v10 = 0;
          *(void *)(a1 + 8) = 0;
          uint64_t v54 = -1;
          goto LABEL_116;
        }
        goto LABEL_68;
      }
      unint64_t v10 = *(void *)(a1 + 8);
    }
    uint64_t v54 = v10 - 1;
    if ((v10 & (v10 - 1)) != 0)
    {
LABEL_101:
      if (v9 >= v10)
      {
        unint64_t v12 = v9 % v10;
        unint64_t v32 = *(void **)(*(void *)a1 + 8 * (v9 % v10));
        CFAllocatorRef v33 = (void *)v58[0];
        if (v32) {
          goto LABEL_57;
        }
      }
      else
      {
        unint64_t v12 = v9;
        unint64_t v32 = *(void **)(*(void *)a1 + 8 * v9);
        CFAllocatorRef v33 = (void *)v58[0];
        if (v32) {
          goto LABEL_57;
        }
      }
LABEL_117:
      void *v33 = *(void *)(a1 + 16);
      *(void *)(a1 + 16) = v58[0];
      *(void *)(*(void *)a1 + 8 * v12) = v25;
      if (*(void *)v58[0])
      {
        unint64_t v56 = *(void *)(*(void *)v58[0] + 8);
        if ((v10 & (v10 - 1)) != 0)
        {
          if (v56 >= v10) {
            v56 %= v10;
          }
        }
        else
        {
          v56 &= v10 - 1;
        }
        *(void *)(*(void *)a1 + 8 * v56) = v58[0];
      }
      goto LABEL_123;
    }
LABEL_116:
    unint64_t v12 = v54 & v9;
    unint64_t v32 = *(void **)(*(void *)a1 + 8 * (v54 & v9));
    CFAllocatorRef v33 = (void *)v58[0];
    if (v32) {
      goto LABEL_57;
    }
    goto LABEL_117;
  }
  unint64_t v32 = *(void **)(*(void *)a1 + 8 * v12);
  CFAllocatorRef v33 = (void *)v58[0];
  if (!v32) {
    goto LABEL_117;
  }
LABEL_57:
  void *v33 = *v32;
  void *v32 = v58[0];
LABEL_123:
  size_t v14 = (uint64_t *)v58[0];
  ++*(void *)(a1 + 24);
  return v14;
}

void sub_21DF9B87C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::~unique_ptr[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_21DF9B890(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::~unique_ptr[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16))
    {
      if (*(char *)(v2 + 63) < 0)
      {
        operator delete(*(void **)(v2 + 40));
        if ((*(char *)(v2 + 39) & 0x80000000) == 0) {
          goto LABEL_5;
        }
      }
      else if ((*(char *)(v2 + 39) & 0x80000000) == 0)
      {
        goto LABEL_5;
      }
      operator delete(*(void **)(v2 + 16));
    }
LABEL_5:
    operator delete((void *)v2);
  }
  return a1;
}

uint64_t __cxx_global_var_init_28()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>::~PthreadMutexGuardPolicy, &ctu::Singleton<support::log::shared_stdio,support::log::shared_stdio,ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>>::sInstance, &dword_21DE8A000);
  }
  return result;
}

uint64_t *getReverseProxySettings@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3812000000;
  v20[3] = __Block_byref_object_copy__4;
  v20[4] = __Block_byref_object_dispose__4;
  v20[5] = "";
  uint64_t v4 = (char *)operator new(0x90uLL);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 3) = 850045863;
  *((void *)v4 + 2) = 0;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((void *)v4 + 10) = 0;
  *((void *)v4 + 11) = 1018212795;
  *((_OWORD *)v4 + 6) = 0u;
  *((_OWORD *)v4 + 7) = 0u;
  *(_OWORD *)(v4 + 124) = 0u;
  *(void *)uint64_t v4 = &unk_26CECEFA8;
  v21[0] = (uint64_t)v4;
  std::mutex::lock((std::mutex *)(v4 + 24));
  int v5 = *((_DWORD *)v4 + 34);
  if ((v5 & 2) != 0) {
    std::__throw_future_error[abi:ne180100](1u);
  }
  atomic_fetch_add_explicit((atomic_ullong *volatile)v4 + 1, 1uLL, memory_order_relaxed);
  *((_DWORD *)v4 + 34) = v5 | 2;
  std::mutex::unlock((std::mutex *)(v4 + 24));
  CFTypeRef cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v18, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string v18 = *(std::string *)a1;
  }
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v22, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
  }
  else {
    std::string v22 = v18;
  }
  v21[1] = 0;
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v23, v22.__r_.__value_.__l.__data_, v22.__r_.__value_.__l.__size_);
  }
  else {
    std::string v23 = v22;
  }
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v24, v23.__r_.__value_.__l.__data_, v23.__r_.__value_.__l.__size_);
  }
  else {
    std::string v24 = v23;
  }
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v25 = (CFStringRef)0xAAAAAAAAAAAAAAAALL;
  if (ctu::cf::convert_copy())
  {
    CFURLRef v7 = CFURLCreateWithString(v6, v25, 0);
    CFRelease(v25);
    if ((SHIBYTE(v24.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_16;
    }
  }
  else
  {
    CFURLRef v7 = 0;
    if ((SHIBYTE(v24.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_16:
      if ((SHIBYTE(v23.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_43;
    }
  }
  operator delete(v24.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v23.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_17:
    CFTypeRef cf = v7;
    if ((SHIBYTE(v22.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_18;
    }
LABEL_44:
    operator delete(v22.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v18.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_45;
  }
LABEL_43:
  operator delete(v23.__r_.__value_.__l.__data_);
  CFTypeRef cf = v7;
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_44;
  }
LABEL_18:
  if ((SHIBYTE(v18.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
    goto LABEL_19;
  }
LABEL_45:
  operator delete(v18.__r_.__value_.__l.__data_);
LABEL_19:
  unint64_t v8 = (ACFULogging *)RPRegisterForAvailability();
  unint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = *(unsigned __int8 *)(a1 + 23);
    if ((v10 & 0x80u) != 0) {
      uint64_t v10 = *(void *)(a1 + 8);
    }
    if (v10
      && (cf
        ? (uint8x8_t v11 = ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::get)
        : (uint8x8_t v11 = 0),
          v11
       && (RPRegistrationResume(),
           v24.__r_.__value_.__r.__words[0] = std::chrono::steady_clock::now().__d_.__rep_ + 5000000000,
           int v12 = std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>((uint64_t)v4, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)&v24), v8 = (ACFULogging *)RPRegistrationInvalidate(), !v12)))
    {
      std::__assoc_state<BOOL>::move((std::__assoc_sub_state *)v4);
      char v14 = (char)v13;
      if (!atomic_fetch_add((atomic_ullong *volatile)v4 + 1, 0xFFFFFFFFFFFFFFFFLL)) {
        uint64_t v13 = (ACFULogging *)(*(uint64_t (**)(char *))(*(void *)v4 + 16))(v4);
      }
      if (v14)
      {
        uint64_t v15 = RPCopyProxyDictionary();
        uint64_t v16 = (const void *)*a2;
        *a2 = v15;
        if (v16) {
          CFRelease(v16);
        }
      }
      else
      {
        ACFULogging::getLogInstance(v13);
        ACFULogging::handleMessage();
      }
      uint64_t v4 = 0;
    }
    else
    {
      ACFULogging::getLogInstance(v8);
      ACFULogging::handleMessage();
    }
    CFRelease(v9);
  }
  else
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v4 && !atomic_fetch_add((atomic_ullong *volatile)v4 + 1, 0xFFFFFFFFFFFFFFFFLL)) {
    (*(void (**)(char *))(*(void *)v4 + 16))(v4);
  }
  _Block_object_dispose(v20, 8);
  return std::promise<BOOL>::~promise(v21);
}

void sub_21DF9BE3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,const void *a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  ctu::cf::CFSharedRef<__CFURL const>::~CFSharedRef(&a23);
  _Block_object_dispose(&a24, 8);
  std::promise<BOOL>::~promise(v40);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(v39);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  return result;
}

uint64_t *__Block_byref_object_dispose__4(uint64_t a1)
{
  return std::promise<BOOL>::~promise((uint64_t *)(a1 + 48));
}

void ___Z23getReverseProxySettingsRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE_block_invoke(ACFULogging *a1, int a2)
{
  if (a2 != 2)
  {
    if (a2 == 1)
    {
      ACFULogging::getLogInstance(a1);
      ACFULogging::handleMessage();
      uint64_t v3 = *(void *)(*(void *)(*((void *)a1 + 4) + 8) + 48);
      if (!v3) {
        std::__throw_future_error[abi:ne180100](3u);
      }
      std::mutex::lock((std::mutex *)(v3 + 24));
      if ((*(unsigned char *)(v3 + 136) & 1) != 0
        || (v5.__ptr_ = 0, uint64_t v4 = *(void *)(v3 + 16), std::exception_ptr::~exception_ptr(&v5), v4))
      {
        std::__throw_future_error[abi:ne180100](2u);
      }
      *(unsigned char *)(v3 + 140) = 1;
      *(_DWORD *)(v3 + 136) |= 5u;
      std::condition_variable::notify_all((std::condition_variable *)(v3 + 88));
      std::mutex::unlock((std::mutex *)(v3 + 24));
    }
    else
    {
      ACFULogging::getLogInstance(a1);
      ACFULogging::handleMessage();
    }
  }
}

void sub_21DF9C12C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t createPostBodyFromDictionary(const __CFAllocator *a1, const __CFDictionary *a2, const __CFData **a3)
{
  if (!a2)
  {
    ACFULogging::getLogInstance(a1);
LABEL_33:
    ACFULogging::handleMessage();
    return 0;
  }
  uint64_t v3 = (uint64_t)a3;
  if (!a3)
  {
    ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage();
    return v3;
  }
  CFMutableStringRef Mutable = CFStringCreateMutable(a1, 0);
  if (!Mutable)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_33;
  }
  CFURLRef v7 = Mutable;
  CFIndex Count = CFDictionaryGetCount(a2);
  unint64_t v9 = (const void **)malloc(8 * Count);
  uint64_t v10 = (const void **)malloc(8 * Count);
  uint8x8_t v11 = v10;
  if (v9)
  {
    if (!v10)
    {
      ACFULogging::getLogInstance(0);
      goto LABEL_28;
    }
    CFDictionaryGetKeysAndValues(a2, v9, v10);
    if (Count >= 1)
    {
      CFIndex v13 = 0;
      while (1)
      {
        CFStringRef v14 = (const __CFString *)v9[v13];
        if (!v14 || !v11[v13]) {
          break;
        }
        CFStringAppend(v7, v14);
        CFStringAppend(v7, @"=");
        CFStringAppend(v7, (CFStringRef)v11[v13]);
        if (v13 < Count - 1) {
          CFStringAppend(v7, @"&");
        }
        if (Count == ++v13) {
          goto LABEL_13;
        }
      }
      ACFULogging::getLogInstance(v12);
LABEL_28:
      ACFULogging::handleMessage();
      uint64_t v20 = 0;
      uint64_t v3 = 0;
      CFRelease(v7);
      free(v9);
      if (!v11) {
        goto LABEL_21;
      }
LABEL_20:
      free(v11);
      goto LABEL_21;
    }
LABEL_13:
    ACFULogging::getLogInstance(v12);
    *((unsigned char *)&v25.__r_.__value_.__s + 23) = 18;
    strcpy((char *)&v25, "BasebandHttpCommon");
    uint64_t v15 = std::string::append(&v25, "::", 2uLL);
    long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    v26.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v16;
    v15->__r_.__value_.__l.__size_ = 0;
    v15->__r_.__value_.__r.__words[2] = 0;
    v15->__r_.__value_.__r.__words[0] = 0;
    unint64_t v17 = std::string::append(&v26, "createPostBodyFromDictionary", 0x1CuLL);
    long long v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
    std::string::size_type v28 = v17->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v18;
    v17->__r_.__value_.__l.__size_ = 0;
    v17->__r_.__value_.__r.__words[2] = 0;
    v17->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType();
    if (SHIBYTE(v28) < 0)
    {
      operator delete(__p[0]);
      if ((SHIBYTE(v26.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_15:
        if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_16;
        }
LABEL_26:
        operator delete(v25.__r_.__value_.__l.__data_);
LABEL_16:
        CFIndex Length = CFStringGetLength(v7);
        uint64_t v20 = (char *)malloc(Length + 1);
        if (v20)
        {
          CString = (ACFULogging *)CFStringGetCString(v7, v20, Length + 1, 0x8000100u);
          if (!CString)
          {
            ACFULogging::getLogInstance(CString);
            goto LABEL_40;
          }
          CFDataRef v22 = CFDataCreate(a1, (const UInt8 *)v20, Length);
          if (v22)
          {
            CFDataRef v23 = v22;
            *(void *)uint64_t v3 = CFRetain(v22);
            CFRelease(v7);
            uint64_t v3 = 1;
            CFRelease(v23);
            free(v9);
            if (!v11) {
              goto LABEL_21;
            }
            goto LABEL_20;
          }
        }
        ACFULogging::getLogInstance(0);
LABEL_40:
        ACFULogging::handleMessage();
        uint64_t v3 = 0;
        CFRelease(v7);
        free(v9);
        if (v11) {
          goto LABEL_20;
        }
        goto LABEL_21;
      }
    }
    else if ((SHIBYTE(v26.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_15;
    }
    operator delete(v26.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_26;
  }
  ACFULogging::getLogInstance((ACFULogging *)v10);
  ACFULogging::handleMessage();
  CFRelease(v7);
  uint64_t v20 = 0;
  uint64_t v3 = 0;
  if (v11) {
    goto LABEL_20;
  }
LABEL_21:
  if (v20) {
    free(v20);
  }
  return v3;
}

void sub_21DF9C588(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0)
  {
    operator delete(__p);
    if ((a23 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a16 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else if ((a23 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a18);
  if ((a16 & 0x80000000) == 0) {
LABEL_4:
  }
    _Unwind_Resume(exception_object);
LABEL_7:
  operator delete(a11);
  _Unwind_Resume(exception_object);
}

uint64_t setHttpUriEscapedValue(const __CFAllocator *a1, __CFDictionary *a2, const __CFString *a3, CFStringRef theString)
{
  CFURLRef value = 0;
  uint64_t v4 = 1005;
  if (a2 && a3 && theString)
  {
    CFURLRef v7 = (ACFULogging *)escapeHttpUriString(a1, theString, (CFTypeRef *)&value);
    if (v7)
    {
      uint64_t v4 = (uint64_t)v7;
      ACFULogging::getLogInstance(v7);
      ACFULogging::handleMessage();
    }
    else if (value)
    {
      CFDictionarySetValue(a2, a3, value);
      uint64_t v4 = 0;
    }
    else
    {
      ACFULogging::getLogInstance(v7);
      ACFULogging::handleMessage();
      uint64_t v4 = 1;
    }
  }
  if (value) {
    CFRelease(value);
  }
  return v4;
}

uint64_t escapeHttpUriString(const __CFAllocator *a1, CFStringRef theString, CFTypeRef *a3)
{
  if (theString && a3)
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(a1, 0, theString);
    if (MutableCopy)
    {
      std::exception_ptr v5 = MutableCopy;
      for (uint64_t i = 0; i != 66; i += 2)
      {
        CFStringRef v7 = kEscapeTable[i];
        CFStringRef v8 = kEscapeTable[i + 1];
        v10.length = CFStringGetLength(v5);
        v10.location = 0;
        CFStringFindAndReplace(v5, v7, v8, v10, 0);
      }
      *a3 = CFRetain(v5);
      CFRelease(v5);
      return 0;
    }
    else
    {
      ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage();
      return 1;
    }
  }
  else
  {
    ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage();
    return 1005;
  }
}

uint64_t setHttpBase64EncodedValue(const __CFAllocator *a1, __CFDictionary *a2, const __CFString *a3, CFDataRef theData)
{
  CFTypeRef cf = 0;
  if (a2)
  {
    if (a3 && theData)
    {
      CFStringRef v7 = (ACFULogging *)encodeBase64(a1, theData, &cf);
      if (v7)
      {
        uint64_t v8 = (uint64_t)v7;
        ACFULogging::getLogInstance(v7);
        ACFULogging::handleMessage();
      }
      else if (cf)
      {
        uint64_t v8 = setHttpUriEscapedValue(a1, a2, a3, (CFStringRef)cf);
      }
      else
      {
        ACFULogging::getLogInstance(v7);
        ACFULogging::handleMessage();
        uint64_t v8 = 1;
      }
    }
    else
    {
      ACFULogging::getLogInstance(a1);
      ACFULogging::handleMessage();
      uint64_t v8 = 1005;
    }
    if (cf) {
      CFRelease(cf);
    }
    return v8;
  }
  else
  {
    ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage();
    return 1005;
  }
}

uint64_t encodeBase64(const __CFAllocator *Length, CFDataRef theData, CFTypeRef *a3)
{
  if (!theData) {
    goto LABEL_16;
  }
  CFAllocatorRef v5 = Length;
  CFIndex Length = (const __CFAllocator *)CFDataGetLength(theData);
  if (!Length)
  {
    ACFULogging::getLogInstance(0);
LABEL_17:
    ACFULogging::handleMessage();
    return 1005;
  }
  if (!a3)
  {
LABEL_16:
    ACFULogging::getLogInstance(Length);
    goto LABEL_17;
  }
  BytePtr = (unsigned __int8 *)CFDataGetBytePtr(theData);
  CFStringRef v7 = (char *)CFDataGetLength(theData);
  if (!BytePtr) {
    goto LABEL_12;
  }
  unsigned int v8 = v7;
  if ((int)v7 < 1) {
    goto LABEL_12;
  }
  unsigned int v9 = v7 / 3;
  if (v7 != 3 * (v7 / 3)) {
    ++v9;
  }
  size_t v10 = (4 * v9) | 1;
  CFStringRef v7 = (char *)malloc(v10);
  if (v7)
  {
    uint8x8_t v11 = v7;
    b64_ntop(BytePtr, v8, v7, v10);
    int v12 = (void *)strlen(v11);
    if (v12)
    {
      int v12 = (void *)CFStringCreateWithBytes(v5, (const UInt8 *)v11, (int)v12, 0x8000100u, 0);
      if (v12)
      {
        CFIndex v13 = v12;
        *a3 = CFRetain(v12);
        free(v11);
        CFRelease(v13);
        return 0;
      }
    }
    ACFULogging::getLogInstance((ACFULogging *)v12);
    ACFULogging::handleMessage();
    free(v11);
  }
  else
  {
LABEL_12:
    ACFULogging::getLogInstance((ACFULogging *)v7);
    ACFULogging::handleMessage();
  }
  return 1;
}

uint64_t decodeBase64(const __CFAllocator *Length, CFStringRef theString, CFTypeRef *a3)
{
  if (!theString) {
    goto LABEL_29;
  }
  CFAllocatorRef v5 = Length;
  CFIndex Length = (const __CFAllocator *)CFStringGetLength(theString);
  if (!Length)
  {
    ACFULogging::getLogInstance(0);
LABEL_30:
    ACFULogging::handleMessage();
    return 1005;
  }
  if (!a3)
  {
LABEL_29:
    ACFULogging::getLogInstance(Length);
    goto LABEL_30;
  }
  int v6 = CFStringGetLength(theString);
  size_t v7 = v6 + 1;
  unsigned int v8 = (char *)malloc(v7);
  if (v8)
  {
    unsigned int v9 = v8;
    uint64_t CString = CFStringGetCString(theString, v8, v7, 0x8000100u);
    if (!CString) {
      goto LABEL_32;
    }
    if (v6 < -1)
    {
      uint64_t CString = strlen(v9);
      uint8x8_t v11 = v9;
      if (CString < 1) {
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t CString = v7;
      uint8x8_t v11 = v9;
      if (!v7) {
        goto LABEL_24;
      }
    }
    int v12 = 0;
    uint64_t v13 = 0;
    CFStringRef v14 = v9;
    uint8x8_t v11 = v9;
    do
    {
      uint64_t v16 = *v14;
      if (v16 == 10 || v16 == 13)
      {
        uint64_t v15 = 0;
        int v12 = 0;
      }
      else
      {
        uint64_t v15 = b64decode_table[v16];
        if (v15 == -1)
        {
          uint64_t v15 = v13;
        }
        else
        {
          switch(v12)
          {
            case 0:
              int v12 = 1;
              break;
            case 1:
              *v11++ = (4 * v13) | (v15 >> 4) & 3;
              int v12 = 2;
              break;
            case 2:
              *v11++ = (16 * v13) | (v15 >> 2) & 0xF;
              int v12 = 3;
              break;
            case 3:
              int v12 = 0;
              *v11++ = v15 | ((_BYTE)v13 << 6);
              break;
            default:
              break;
          }
        }
      }
      ++v14;
      uint64_t v13 = v15;
    }
    while (v14 < &v9[CString]);
LABEL_24:
    char *v11 = 0;
    if ((int)v11 - (int)v9 > 0)
    {
      CFDataRef v18 = CFDataCreate(v5, (const UInt8 *)v9, (v11 - v9));
      if (v18)
      {
        CFDataRef v19 = v18;
        *a3 = CFRetain(v18);
        free(v9);
        CFRelease(v19);
        return 0;
      }
      ACFULogging::getLogInstance(0);
      goto LABEL_35;
    }
LABEL_32:
    ACFULogging::getLogInstance((ACFULogging *)CString);
LABEL_35:
    ACFULogging::handleMessage();
    free(v9);
    return 1;
  }
  ACFULogging::getLogInstance(0);
  ACFULogging::handleMessage();
  return 1;
}

void BBUICEInitializer::~BBUICEInitializer(BBUICEInitializer *this)
{
  *(void *)this = &unk_26CECBF08;
  uint64_t v1 = *((void *)this + 2);
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_26CECBF08;
  uint64_t v2 = *((void *)this + 2);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  operator delete(this);
}

uint64_t BBUICEInitializer::prepare(uint64_t a1, uint64_t a2, int a3)
{
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
      goto LABEL_5;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
      goto LABEL_5;
    }
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    CFAllocatorRef v5 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    char v6 = BBUStageAsString(a3);
    _BBULog(4, 0, v5, "", "Preparing at %s with reset requested %u\n", v7, v8, v9, v6);
  }
LABEL_5:
  if (a3 != 2) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) != 0) {
        goto LABEL_9;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) != 0)
      {
LABEL_9:
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          size_t v10 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
          _BBULog(4, 0, v10, "", "Powering on modem. It is NOOP if BB is already on\n", v11, v12, v13, v20);
        }
      }
    }
    TelephonyBasebandPowerOnModem();
    uint64_t result = 0;
    *(unsigned char *)(a1 + 40) = 0;
    return result;
  }
  *(unsigned char *)(a1 + 40) = 0;
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "%s: Start resetting modem", "prepare");
  char v15 = TelephonyBasebandResetModem();
  uint64_t result = 0;
  if ((v15 & 1) == 0)
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      uint64_t result = 73;
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
        return result;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      uint64_t result = 73;
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
        return result;
      }
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      uint64_t v16 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      _BBULog(4, 0, v16, "", "Failed to prep\n", v17, v18, v19, v21);
      return 73;
    }
  }
  return result;
}

uint64_t BBUICEInitializer::finalize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a4 > 4
    || ((1 << a4) & 0x1A) == 0
    || (uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 240))(a1, a2), !result))
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 232))(a1, a2, a4);
    if (!result)
    {
      uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 200))(a1);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 224))(a1, a2, a5, v10);
      if (!result)
      {
        uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, void, void))(*(void *)a1 + 280);
        return v11(a1, a2, 0, 0);
      }
    }
  }
  return result;
}

uint64_t BBUICEInitializer::crashBaseband(uint64_t a1)
{
  TelephonyBasebandGetReset();
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "modem %s reset", "is not");
  if (capabilities::coredump::supportsGPIOSignalling(v2))
  {
    TelephonyBasebandSetModemCoredumpGPIO();
    usleep(0xF4240u);
    TelephonyBasebandSetModemCoredumpGPIO();
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Coredump GPIO signalled");
  }
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "resetting modem... may take several seconds for safe reset");
  TelephonyBasebandResetModem();
  return 0;
}

uint64_t BBUICEInitializer::getVersion(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 67, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Initialization/ICE/BBUICEInitializer.cpp", 0xA0u, (ctu::LogMessageBuffer *)"Assertion failure(transport && \"TelephonyUtilTransport Error.\")", v7, v8, v9, v10);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  *a3 = 0;
  IceAriGetContext();
  char v4 = KTLGetFirmwareVersion();
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Baseband firmware version size is: %u", 128);
  if (v4) {
    return 0;
  }
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed to get baseband firmware version.");
  return 62;
}

void sub_21DF9D5D0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUICEInitializer::gatherPersonalizationParameters(BBUFeedback **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v42[0] = v6;
  v42[1] = v6;
  v40[1] = v6;
  long long v41 = v6;
  *(_OWORD *)uint64_t v39 = v6;
  v40[0] = v6;
  IceAriGetContext();
  int v7 = KTLGetPersonalizationInfo();
  memset(v38, 170, sizeof(v38));
  ctu::hex((ctu *)v40, (const void *)HIDWORD(v39[0]));
  memset(v37, 170, sizeof(v37));
  ctu::hex((ctu *)&v41, (const void *)LODWORD(v39[1]));
  memset(v36, 170, sizeof(v36));
  ctu::hex((ctu *)v42, (const void *)HIDWORD(v39[1]));
  uint64_t v8 = v38;
  if (SHIBYTE(v38[2]) < 0) {
    uint64_t v8 = (void **)v38[0];
  }
  uint64_t v9 = v37;
  if (SHIBYTE(v37[2]) < 0) {
    uint64_t v9 = (void **)v37[0];
  }
  if (SHIBYTE(v36[2]) >= 0) {
    char v10 = v36;
  }
  else {
    char v10 = (void **)v36[0];
  }
  BBUFeedback::handleComment(a1[1], "Personalization info: \n \t\t\t\t\t\t\t chipId     : 0x%x \n \t\t\t\t\t\t\t nonceSize  : %u \n \t\t\t\t\t\t\t snumSize   : %u \n \t\t\t\t\t\t\t pkHashSize : %u \n \t\t\t\t\t\t\t nonce      : %s \n \t\t\t\t\t\t\t snum       : %s \n \t\t\t\t\t\t\t pkHash     : %s \n", LODWORD(v39[0]), HIDWORD(v39[0]), LODWORD(v39[1]), HIDWORD(v39[1]), (const char *)v8, (const char *)v9, (const char *)v10);
  if (!v7)
  {
    BBUFeedback::handleComment(a1[1], "Failed to gather personalization information.");
    uint64_t v32 = 64;
    if (SHIBYTE(v36[2]) < 0) {
      goto LABEL_41;
    }
LABEL_38:
    if (SHIBYTE(v37[2]) < 0) {
      goto LABEL_42;
    }
    goto LABEL_39;
  }
  CFIndex v11 = HIDWORD(v39[0]);
  long long v12 = operator new(0x10uLL);
  *long long v12 = &unk_26CECFE08;
  v12[1] = 0;
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v12[1] = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v40, v11);
  uint64_t v14 = *(void *)(a3 + 8);
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
  *(void *)(a3 + 8) = v12;
  long long v15 = BBUICEPersonalizationParameters::ICESerialNumber::createFromSerialNumber((const UInt8 *)&v41, (const unsigned __int8 *)(8 * LODWORD(v39[1])));
  (*(void (**)(uint64_t, void *))(*(void *)a3 + 16))(a3, v15);
  long long v16 = BBUICEPersonalizationParameters::ICEChipID::createFromChipID((BBUICEPersonalizationParameters::ICEChipID *)LODWORD(v39[0]));
  uint64_t v17 = *(void *)(a3 + 16);
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }
  *(void *)(a3 + 16) = v16;
  CFIndex v18 = HIDWORD(v39[1]);
  uint64_t v19 = operator new(0x10uLL);
  *uint64_t v19 = &unk_26CECFF28;
  v19[1] = 0;
  v19[1] = CFDataCreate(v13, (const UInt8 *)v42, v18);
  (*(void (**)(uint64_t, void *))(*(void *)a3 + 24))(a3, v19);
  if (v15 && v16)
  {
    char v20 = a1[1];
    (*(void (**)(void **__return_ptr, void *))(*v15 + 24))(__p, v15);
    if (v35 >= 0) {
      char v21 = __p;
    }
    else {
      char v21 = (void **)__p[0];
    }
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS == -1)
    {
      if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1) {
        goto LABEL_20;
      }
    }
    else
    {
      dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global_7);
      if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1) {
        goto LABEL_20;
      }
    }
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_13);
LABEL_20:
    int v22 = BBUpdaterCommon::inRestoreOS(void)::restoreOS;
    int v23 = BBUpdaterCommon::inRestoreOS(void)::recoveryOS;
    int v24 = (*(uint64_t (**)(void *))(*v16 + 24))(v16);
    if (v22 | v23) {
      std::string v25 = (const char *)v21;
    }
    else {
      std::string v25 = "<< SNUM >>";
    }
    BBUFeedback::handleComment(v20, "   SNUM: 0x%s / CHIPID: 0x%08x", v25, v24);
    if (v35 < 0) {
      operator delete(__p[0]);
    }
  }
  std::string v26 = a1[1];
  (*(void (**)(void **__return_ptr, void *))(*v12 + 24))(__p, v12);
  if (v35 >= 0) {
    long long v27 = __p;
  }
  else {
    long long v27 = (void **)__p[0];
  }
  BBUFeedback::handleComment(v26, "   NONCE: %s", (const char *)v27);
  if (v35 < 0) {
    operator delete(__p[0]);
  }
  std::string::size_type v28 = a1[1];
  (*(void (**)(void **__return_ptr, void *))(*v19 + 24))(__p, v19);
  if (v35 >= 0) {
    long long v29 = __p;
  }
  else {
    long long v29 = (void **)__p[0];
  }
  BBUFeedback::handleComment(v28, "   PUBLIC_KEY_HASH: %s", (const char *)v29);
  if (v35 < 0) {
    operator delete(__p[0]);
  }
  float v30 = a1[1];
  int v31 = (*(uint64_t (**)(void))(**(void **)(a3 + 24) + 24))(*(void *)(a3 + 24));
  BBUFeedback::handleComment(v30, "   CertID: %u", v31);
  uint64_t v32 = (*((uint64_t (**)(BBUFeedback **, uint64_t, uint64_t, void))*a1 + 26))(a1, a2, a3, 0);
  if ((SHIBYTE(v36[2]) & 0x80000000) == 0) {
    goto LABEL_38;
  }
LABEL_41:
  operator delete(v36[0]);
  if (SHIBYTE(v37[2]) < 0)
  {
LABEL_42:
    operator delete(v37[0]);
    if (SHIBYTE(v38[2]) < 0) {
      goto LABEL_43;
    }
    return v32;
  }
LABEL_39:
  if (SHIBYTE(v38[2]) < 0) {
LABEL_43:
  }
    operator delete(v38[0]);
  return v32;
}

void sub_21DF9DB90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  if (a28 < 0)
  {
    operator delete(__p);
    if (a34 < 0) {
      goto LABEL_7;
    }
  }
  else if (a34 < 0)
  {
LABEL_7:
    operator delete(a29);
    if ((a40 & 0x80000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if ((a40 & 0x80000000) == 0) {
LABEL_9:
  }
    _Unwind_Resume(a1);
LABEL_8:
  operator delete(a35);
  goto LABEL_9;
}

uint64_t BBUICEInitializer::overridePersonalizationParameters(BBUFeedback **this, BBUPersonalizationParameters *a2, const __CFDictionary *a3)
{
  CFURLRef value = (void *)0xAAAAAAAAAAAAAAAALL;
  BBUFeedback::handleComment(this[1], "Overriding with preflight information:");
  if (CFDictionaryGetValueIfPresent(a3, @"ChipID", (const void **)&value))
  {
    CFTypeID v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      int v7 = value;
      uint64_t v8 = operator new(0x10uLL);
      void *v8 = &unk_26CECFE98;
      v8[1] = v7;
      CFRetain(v7);
      uint64_t v9 = *((void *)a2 + 2);
      if (v9) {
        (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
      }
      *((void *)a2 + 2) = v8;
      char v10 = this[1];
      int v11 = (*(uint64_t (**)(void *))(*v8 + 24))(v8);
      int v12 = (*(uint64_t (**)(void *))(*v8 + 24))(v8);
      BBUFeedback::handleComment(v10, "   ChipID: %u (0x%08x)", v11, v12);
    }
  }
  if (!CFDictionaryGetValueIfPresent(a3, @"ChipSerialNo", (const void **)&value)) {
    goto LABEL_12;
  }
  CFTypeID v13 = CFGetTypeID(value);
  if (v13 != CFDataGetTypeID()) {
    goto LABEL_12;
  }
  uint64_t v14 = value;
  long long v15 = operator new(0x10uLL);
  void *v15 = &unk_26CECFE38;
  v15[1] = v14;
  CFRetain(v14);
  (*(void (**)(BBUPersonalizationParameters *, void *))(*(void *)a2 + 16))(a2, v15);
  long long v16 = this[1];
  (*(void (**)(void **__return_ptr, void *))(*v15 + 24))(__p, v15);
  uint64_t v17 = v31 >= 0 ? (const char *)__p : (const char *)__p[0];
  BBUFeedback::handleComment(v16, "   ChipSerialNo: %s", v17);
  if (v31 < 0)
  {
    operator delete(__p[0]);
    if (!CFDictionaryGetValueIfPresent(a3, @"CertHash", (const void **)&value)) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_12:
    if (!CFDictionaryGetValueIfPresent(a3, @"CertHash", (const void **)&value)) {
      goto LABEL_20;
    }
  }
  CFTypeID v18 = CFGetTypeID(value);
  if (v18 == CFDataGetTypeID())
  {
    uint64_t v19 = value;
    char v20 = operator new(0x10uLL);
    *char v20 = &unk_26CECFF28;
    v20[1] = v19;
    CFRetain(v19);
    (*(void (**)(BBUPersonalizationParameters *, void *))(*(void *)a2 + 24))(a2, v20);
    char v21 = this[1];
    (*(void (**)(void **__return_ptr, void *))(*v20 + 24))(__p, v20);
    int v22 = v31 >= 0 ? (const char *)__p : (const char *)__p[0];
    BBUFeedback::handleComment(v21, "   CertHash: %s", v22);
    if (v31 < 0) {
      operator delete(__p[0]);
    }
  }
LABEL_20:
  if (CFDictionaryGetValueIfPresent(a3, @"Nonce", (const void **)&value))
  {
    CFTypeID v23 = CFGetTypeID(value);
    if (v23 == CFDataGetTypeID())
    {
      int v24 = value;
      std::string v25 = operator new(0x10uLL);
      *std::string v25 = &unk_26CECFE08;
      v25[1] = v24;
      CFRetain(v24);
      uint64_t v26 = *((void *)a2 + 1);
      if (v26) {
        (*(void (**)(uint64_t))(*(void *)v26 + 8))(v26);
      }
      *((void *)a2 + 1) = v25;
      long long v27 = this[1];
      (*(void (**)(void **__return_ptr, void *))(*v25 + 24))(__p, v25);
      if (v31 >= 0) {
        std::string::size_type v28 = __p;
      }
      else {
        std::string::size_type v28 = (void **)__p[0];
      }
      BBUFeedback::handleComment(v27, "   Nonce: %s", (const char *)v28);
      if (v31 < 0) {
        operator delete(__p[0]);
      }
    }
  }
  return 0;
}

void sub_21DF9E0B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

capabilities::updater *BBUICEInitializer::gatherProvisioningParameters(BBUFeedback **a1, capabilities::euicc *a2, uint64_t a3)
{
  CFTypeID v6 = (capabilities::updater *)(*((uint64_t (**)(BBUFeedback **))*a1 + 31))(a1);
  if (capabilities::updater::hasMEID(v6) && !v6) {
    CFTypeID v6 = (capabilities::updater *)(*((uint64_t (**)(BBUFeedback **, capabilities::euicc *, uint64_t))*a1 + 32))(a1, a2, a3);
  }
  eUICC::getEID(a2, a3, a1[1]);
  return v6;
}

uint64_t BBUICEInitializer::getProvisioningStatus(BBUFeedback **a1, uint64_t a2, uint64_t a3, unsigned char *a4, BOOL *a5)
{
  *a4 = 1;
  if ((*((unsigned int (**)(BBUFeedback **, uint64_t, uint64_t, void))*a1 + 26))(a1, a2, a3, 0))
  {
    uint64_t result = 0;
    *a5 = 0;
  }
  else
  {
    uint64_t v10 = *(void *)(a3 + 48);
    if (v10)
    {
      int v11 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 24))(v10);
      int v12 = v11;
      BOOL v13 = v11 == 1;
      BOOL v14 = 0;
      long long v15 = "Ignoring ART mismatch";
      switch(v11)
      {
        case 0:
        case 2:
          BOOL v14 = v11 != 2;
          long long v15 = "mature";
          break;
        case 1:
          *a4 = 0;
          long long v15 = "mature";
          BOOL v14 = 1;
          break;
        case 3:
          break;
        default:
          BOOL v14 = 0;
          long long v15 = "bringup";
          break;
      }
      *a5 = v14;
      BBUFeedback::handleComment(a1[1], v15);
      long long v16 = a1[1];
      StateAsString = (const char *)ETLProvisionGetStateAsString();
      BBUFeedback::handleComment(v16, "Provisioning state %s(%u), mismatched %u", StateAsString, v12, v13);
      return 0;
    }
    else
    {
      return 3;
    }
  }
  return result;
}

uint64_t BBUICEInitializer::gatherManifestInfo(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  long long v47 = 0u;
  memset(v48, 0, 144);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  *(_OWORD *)uint64_t v40 = 0u;
  CFAllocatorRef v5 = (BBUFeedback **)(a1 + 8);
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Getting manifest information from BB");
  IceAriGetContext();
  int v6 = KTLGetManifestStatus();
  BBUFeedback::handleComment(*v5, "Manifest status: \n\t\t\t  status             : %u\n \t\t\t  provision_status   : %u\n \t\t\t  fatp_cal_status    : %u\n \t\t\t  calibration_status : %u\n \t\t\t  skey_hash length   : %u", LODWORD(v40[0]), WORD2(v40[0]), HIWORD(v40[0]), LOWORD(v40[1]), WORD1(v40[1]));
  memset(__p, 170, 24);
  ctu::hex((ctu *)((unint64_t)v40 | 0xC), (const void *)*(unsigned __int16 *)((unint64_t)v40 | 0xA));
  int v7 = *(unsigned __int16 *)((unint64_t)v40 | 0xA);
  if (*(_WORD *)((unint64_t)v40 | 0xA))
  {
    int v8 = 0;
    unint64_t v9 = 0;
    do
    {
      int v10 = v8 + v7;
      if (v10 >= 16) {
        int v10 = 16;
      }
      ctu::hex((ctu *)(((unint64_t)v40 | 0xC) + v9), (const void *)v10);
      if (SHIBYTE(__p[2]) < 0) {
        operator delete(__p[0]);
      }
      *(_OWORD *)std::string __p = *(_OWORD *)v38;
      __p[2] = v38[2];
      if (SHIBYTE(v38[2]) >= 0) {
        int v11 = __p;
      }
      else {
        int v11 = (void **)v38[0];
      }
      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "  skey_hash    [0x%02x]: %s", v9, (const char *)v11);
      v9 += 16;
      int v7 = WORD1(v40[1]);
      v8 -= 16;
    }
    while (v9 < WORD1(v40[1]));
  }
  memset(v38, 170, sizeof(v38));
  ctu::hex((ctu *)((char *)&v48[3] + 2), (const void *)LOWORD(v48[3]));
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "  ckey_hash length   : %u", LOWORD(v48[3]));
  int v12 = v38;
  if (SHIBYTE(v38[2]) < 0) {
    int v12 = (void **)v38[0];
  }
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "  ckey_hash          : %s", (const char *)v12);
  if (!v6)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed to gather manifest info.");
    uint64_t v14 = 63;
    if (SHIBYTE(v38[2]) < 0) {
      goto LABEL_47;
    }
    goto LABEL_17;
  }
  uint64_t v13 = 0;
  switch(WORD2(v40[0]))
  {
    case 0:
    case 0x40:
      break;
    case 4:
    case 0xF:
      uint64_t v13 = 1;
      break;
    case 6:
    case 0x1C:
    case 0x1D:
      uint64_t v13 = 2;
      break;
    default:
      uint64_t v13 = 3;
      break;
  }
  long long v16 = BBUICEPersonalizationParameters::ICEKeyStatus::createFromKeyStatus((BBUICEPersonalizationParameters::ICEKeyStatus *)v13);
  uint64_t v17 = BBUICEPersonalizationParameters::ICEKeyStatus::createFromKeyStatus((BBUICEPersonalizationParameters::ICEKeyStatus *)WORD2(v40[0]));
  CFTypeID v18 = BBUICEPersonalizationParameters::ICEKeyStatus::createFromKeyStatus((BBUICEPersonalizationParameters::ICEKeyStatus *)LOWORD(v40[1]));
  uint64_t v19 = BBUICEPersonalizationParameters::ICEKeyStatus::createFromKeyStatus((BBUICEPersonalizationParameters::ICEKeyStatus *)HIWORD(v40[0]));
  uint64_t v20 = a3[6];
  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
  }
  a3[6] = v16;
  uint64_t v21 = a3[8];
  if (v21) {
    (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
  }
  a3[8] = v17;
  uint64_t v22 = a3[9];
  if (v22) {
    (*(void (**)(uint64_t))(*(void *)v22 + 8))(v22);
  }
  a3[9] = v18;
  CFTypeID v23 = (capabilities::updater *)a3[10];
  if (v23) {
    CFTypeID v23 = (capabilities::updater *)(*(uint64_t (**)(capabilities::updater *))(*(void *)v23 + 8))(v23);
  }
  a3[10] = v19;
  if (WORD2(v40[0]) > 0xFu || ((1 << SBYTE4(v40[0])) & 0x8011) == 0)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "BB has no provisioning manifest");
    uint64_t v14 = 0;
    if (SHIBYTE(v38[2]) < 0) {
      goto LABEL_47;
    }
    goto LABEL_17;
  }
  int DigestType = capabilities::updater::getDigestType(v23);
  if (DigestType == 1)
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
        goto LABEL_42;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
        goto LABEL_42;
      }
    }
    if (gBBULogVerbosity < 0) {
      goto LABEL_42;
    }
    std::string v25 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    long long v29 = "SHA256 detected\n";
    goto LABEL_41;
  }
  if (DigestType != 2)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 63, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Initialization/ICE/BBUICEInitializer.cpp", 0x1CBu, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unsupported hash digest type.\")", v34, v35, v36, v37);
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
      goto LABEL_42;
    }
    goto LABEL_35;
  }
  dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) != 0)
  {
LABEL_35:
    if (gBBULogVerbosity < 0) {
      goto LABEL_42;
    }
    std::string v25 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    long long v29 = "SHA384 detected\n";
LABEL_41:
    _BBULog(4, 0, v25, "", v29, v26, v27, v28, v37);
  }
LABEL_42:
  CFIndex v30 = WORD1(v40[1]);
  char v31 = operator new(0x10uLL);
  *char v31 = &unk_26CECFEF8;
  v31[1] = 0;
  v31[1] = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)((unint64_t)v40 | 0xC), v30);
  uint64_t v32 = a3[7];
  if (v32) {
    (*(void (**)(uint64_t))(*(void *)v32 + 8))(v32);
  }
  uint64_t v14 = 0;
  a3[7] = v31;
  if (SHIBYTE(v38[2]) < 0)
  {
LABEL_47:
    operator delete(v38[0]);
    if (SHIBYTE(__p[2]) < 0) {
      goto LABEL_48;
    }
    return v14;
  }
LABEL_17:
  if (SHIBYTE(__p[2]) < 0) {
LABEL_48:
  }
    operator delete(__p[0]);
  return v14;
}

void sub_21DF9E924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  __cxa_free_exception(v25);
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  _Unwind_Resume(a1);
}

uint64_t BBUICEInitializer::pingAndCheckForResponse(uint64_t a1)
{
  unsigned __int8 v5 = 0;
  uint64_t v2 = TelephonyUtilSystemMachTime();
  while (1)
  {
    IceAriGetContext();
    int v3 = KTLPing();
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "ping returned %d, psReady %u", v3, v5);
    if (v3) {
      break;
    }
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Retrying ping\n");
    usleep(0x7A120u);
    if ((unint64_t)(TelephonyUtilSystemMachTime() - v2) >= 0x5DD)
    {
      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Timeout on ping attemps\n");
      return 46;
    }
  }
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "ping success but PS Ready false, treating as not ready and sleeping 1s");
  usleep(0xF4240u);
  return 6;
}

void sub_21DF9EC70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BBUICEInitializer::restoreNVItems(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 0;
  switch(a3)
  {
    case 1:
      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Restoring NV items to Factory defaults");
      IceAriGetContext();
      char v6 = KTLBspSetNvItemsToState();
      uint64_t result = 0;
      if ((v6 & 1) == 0) {
        goto LABEL_10;
      }
      break;
    case 2:
      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Restoring NV items to Shipping defaults");
      IceAriGetContext();
      if ((KTLBspSetNvItemsToState() & 1) == 0) {
        goto LABEL_10;
      }
      uint64_t result = 0;
      break;
    case 4:
      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Restoring NV items to FATP defaults");
      IceAriGetContext();
      if ((KTLBspSetNvItemsToState() & 1) == 0) {
        goto LABEL_10;
      }
      uint64_t result = 0;
      break;
    case 5:
      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Restoring NV items to OQC defaults");
      IceAriGetContext();
      if (KTLBspSetNvItemsToState())
      {
        uint64_t result = 0;
      }
      else
      {
LABEL_10:
        BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed to restore NV items to state: %d", a3);
        uint64_t result = 58;
      }
      break;
    default:
      return result;
  }
  return result;
}

uint64_t BBUICEInitializer::fusingCheck(uint64_t a1)
{
  BBUFeedback::handleBeginQuickStep(*(BBUFeedback **)(a1 + 8), "Fusing check");
  IceAriGetContext();
  FusingState = (capabilities::updater *)KTLSecGetFusingState();
  if (FusingState) {
    capabilities::updater::shouldAllowUnfused(FusingState);
  }
  (*(void (**)(void, uint64_t))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8), 24);
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Fusing state: %d", -1431655766);
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed fusing check.");
  return 24;
}

uint64_t BBUICEInitializer::updateIMEISvn(uint64_t a1, uint64_t a2, unsigned int a3)
{
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "IMEI-SVN Check and Update: %d", a3);
  if (a3 == -1) {
    return 0;
  }
  if (a3 > 0x62) {
    return 2;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x10) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x10) == 0) {
      goto LABEL_8;
    }
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    char v6 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(20, 0, v6, "", "Getting current SVN\n", v7, v8, v9, v38);
  }
LABEL_8:
  IceAriGetContext();
  int Svn = KTLCpsGetSvn();
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Current SVN: %d", 170);
  if (!Svn)
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x10) == 0) {
        goto LABEL_18;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x10) == 0) {
        goto LABEL_18;
      }
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      uint64_t v17 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      _BBULog(20, 0, v17, "", "Trying to set SVN\n", v18, v19, v20, v39);
    }
LABEL_18:
    IceAriGetContext();
    int v21 = KTLCpsSetSvn();
    if (gBBULogMaskGet(void)::once != -1)
    {
      int v36 = v21;
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      int v21 = v36;
    }
    int v22 = (gBBULogVerbosity >= 0) & (*(unsigned __int8 *)(gBBULogMaskGet(void)::sBBULogMask + 2) >> 4);
    if (v21)
    {
      if (v22)
      {
        CFTypeID v23 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        _BBULog(20, 0, v23, "", "SVN set: %d\n", v24, v25, v26, a3);
      }
      return 0;
    }
    goto LABEL_32;
  }
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  }
  int v11 = (gBBULogVerbosity >= 0) & (*(unsigned __int8 *)(gBBULogMaskGet(void)::sBBULogMask + 2) >> 4);
  if (a3 == 170)
  {
    if (v11)
    {
      int v12 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      long long v16 = "No need to update SVN\n";
LABEL_30:
      _BBULog(20, 0, v12, "", v16, v13, v14, v15, v39);
      return 0;
    }
    return 0;
  }
  if (v11)
  {
    uint64_t v27 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(20, 0, v27, "", "Trying to set new SVN\n", v28, v29, v30, v39);
  }
  IceAriGetContext();
  int v31 = KTLCpsSetSvn();
  if (gBBULogMaskGet(void)::once != -1)
  {
    int v37 = v31;
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    int v31 = v37;
  }
  int v22 = (gBBULogVerbosity >= 0) & (*(unsigned __int8 *)(gBBULogMaskGet(void)::sBBULogMask + 2) >> 4);
  if (v31)
  {
    if (v22)
    {
      int v12 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      long long v16 = "SVN changed from %d to %d\n";
      char v39 = -86;
      goto LABEL_30;
    }
    return 0;
  }
LABEL_32:
  if (v22)
  {
    uint64_t v32 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(20, 0, v32, "", "Could not set SVN\n", v33, v34, v35, v39);
  }
  return 59;
}

uint64_t BBUICEInitializer::getIMEI(uint64_t a1, uint64_t a2, std::string **a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v30 = v5;
  long long v31 = v5;
  long long v28 = v5;
  long long v29 = v5;
  long long __src = v5;
  IceAriGetContext();
  int v6 = KTLGetIMEI_V2();
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "IMEI1: %s", (const char *)&__src);
  if (capabilities::updater::supportsDualIMEIProvision(v7)) {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "IMEI2: %s", (const char *)&v28 + 4);
  }
  if (!v6)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed to get IMEI.");
    return 30;
  }
  memset(__dst, 170, sizeof(__dst));
  size_t v8 = (v28 - 1);
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    uint64_t v9 = operator new(v11 + 1);
    *(void *)&__dst[16] = v12 | 0x8000000000000000;
    *(void *)long long __dst = v9;
    *(void *)&void __dst[8] = v8;
    goto LABEL_11;
  }
  __dst[23] = v28 - 1;
  uint64_t v9 = __dst;
  if (v28 != 1) {
LABEL_11:
  }
    memcpy(v9, &__src, v8);
  v9[v8] = 0;
  valid = (std::string *)KTLIsValidIMEIString();
  if (valid)
  {
    valid = (std::string *)operator new(0x18uLL);
    uint64_t v14 = valid;
    if ((__dst[23] & 0x80000000) != 0)
    {
      std::string::__init_copy_ctor_external(valid, *(const std::string::value_type **)__dst, *(std::string::size_type *)&__dst[8]);
    }
    else
    {
      *(_OWORD *)&valid->__r_.__value_.__l.__data_ = *(_OWORD *)__dst;
      valid->__r_.__value_.__r.__words[2] = *(void *)&__dst[16];
    }
    uint64_t v15 = *a3;
    if (*a3)
    {
      if (SHIBYTE(v15->__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v15->__r_.__value_.__l.__data_);
      }
      operator delete(v15);
    }
    *a3 = v14;
  }
  int v16 = capabilities::updater::supportsDualIMEIProvision((capabilities::updater *)valid);
  if (DWORD1(v29)) {
    int v17 = v16;
  }
  else {
    int v17 = 0;
  }
  if (v17 != 1) {
    goto LABEL_42;
  }
  size_t v18 = (DWORD1(v29) - 1);
  memset(__p, 170, sizeof(__p));
  if (DWORD1(v29) >= 0x18)
  {
    uint64_t v20 = (v18 & 0xFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17) {
      uint64_t v20 = v18 | 7;
    }
    uint64_t v21 = v20 + 1;
    uint64_t v19 = operator new(v20 + 1);
    __p[1] = (void *)v18;
    __p[2] = (void *)(v21 | 0x8000000000000000);
    __p[0] = v19;
    goto LABEL_31;
  }
  HIBYTE(__p[2]) = BYTE4(v29) - 1;
  uint64_t v19 = __p;
  if (DWORD1(v29) != 1) {
LABEL_31:
  }
    memcpy(v19, (char *)&v28 + 4, v18);
  *((unsigned char *)v19 + v18) = 0;
  if (KTLIsValidIMEIString())
  {
    int v22 = (std::string *)operator new(0x18uLL);
    CFTypeID v23 = v22;
    if (SHIBYTE(__p[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v22, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    }
    else
    {
      *(_OWORD *)&v22->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
      v22->__r_.__value_.__r.__words[2] = (std::string::size_type)__p[2];
    }
    uint64_t v24 = a3[1];
    if (v24)
    {
      if (SHIBYTE(v24->__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v24->__r_.__value_.__l.__data_);
      }
      operator delete(v24);
    }
    a3[1] = v23;
  }
  if (SHIBYTE(__p[2]) < 0)
  {
    operator delete(__p[0]);
    if ((__dst[23] & 0x80000000) == 0) {
      return 0;
    }
    goto LABEL_43;
  }
LABEL_42:
  if ((__dst[23] & 0x80000000) != 0) {
LABEL_43:
  }
    operator delete(*(void **)__dst);
  return 0;
}

void sub_21DF9F648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  operator delete(v22);
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a22 < 0)
  {
    operator delete(a17);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t BBUICEInitializer::getMEID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v10 = 0uLL;
  IceAriGetContext();
  int v5 = KTLGetMEID();
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "MEID: %s", (const char *)&v10);
  if (v5)
  {
    __p[0] = (void *)v10;
    *(void **)((char *)__p + 6) = *(void **)((char *)&v10 + 6);
    HIWORD(__p[1]) = -22016;
    if (KTLIsValidMEIDString())
    {
      int v6 = operator new(0x18uLL);
      *(_OWORD *)int v6 = *(_OWORD *)__p;
      v6[2] = 0xEAAAAAAAAAAAAAALL;
      uint64_t v8 = *(void *)(a3 + 16);
      if (v8)
      {
        if (*(char *)(v8 + 23) < 0) {
          operator delete(*(void **)v8);
        }
        operator delete((void *)v8);
      }
      *(void *)(a3 + 16) = v6;
    }
    return 0;
  }
  else
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed to get MEID.");
    return 29;
  }
}

void sub_21DF9F808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  operator delete(v15);
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t BBUICEInitializer::getCarrierID()
{
  return 3;
}

uint64_t BBUICEInitializer::performNVSync(uint64_t a1, uint64_t a2, int a3, int a4)
{
  __src[47] = *MEMORY[0x263EF8340];
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&__src[41] = v8;
  *(_OWORD *)&__src[43] = v8;
  *(_OWORD *)&__src[37] = v8;
  *(_OWORD *)&__src[39] = v8;
  *(_OWORD *)&__src[33] = v8;
  *(_OWORD *)&__src[35] = v8;
  *(_OWORD *)&__src[31] = v8;
  *(_OWORD *)&__src[29] = v8;
  *(_OWORD *)&__src[27] = v8;
  *(_OWORD *)&__src[25] = v8;
  *(_OWORD *)&__src[23] = v8;
  *(_OWORD *)&_OWORD __src[21] = v8;
  *(_OWORD *)&__src[19] = v8;
  *(_OWORD *)&__src[17] = v8;
  *(_OWORD *)&__src[15] = v8;
  *(_OWORD *)&__src[13] = v8;
  *(_OWORD *)&__src[11] = v8;
  *(_OWORD *)&__src[9] = v8;
  *(_OWORD *)&__src[7] = v8;
  *(_OWORD *)&__src[5] = v8;
  *(_OWORD *)&__src[3] = v8;
  *(_OWORD *)&__src[1] = v8;
  __src[45] = 0xAAAAAAAAAAAAAAAALL;
  __src[0] = 0;
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Performing FS sync");
  memset(&__p, 170, sizeof(__p));
  pthread_mutex_lock(&ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance);
  uint64_t v9 = (BBUPartitionManager *)off_26AA89B50;
  if (!off_26AA89B50)
  {
    long long v10 = (BBUPartitionManager *)operator new(0x18uLL);
    BBUPartitionManager::BBUPartitionManager(v10);
    uint64_t v11 = operator new(0x20uLL);
    void *v11 = &unk_26CECF498;
    v11[1] = 0;
    v11[2] = 0;
    v11[3] = v10;
    uint64_t v12 = (std::__shared_weak_count *)off_26AA89B58;
    off_26AA89B50 = v10;
    off_26AA89B58 = v11;
    if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    uint64_t v9 = (BBUPartitionManager *)off_26AA89B50;
  }
  uint64_t v13 = (std::__shared_weak_count *)off_26AA89B58;
  if (off_26AA89B58) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)off_26AA89B58 + 1, 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance);
  BBUPartitionManager::getBBUFSPath(v9, &__p);
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if (p_p) {
      goto LABEL_14;
    }
LABEL_22:
    _BBUFSDebugPrint("BBUFSServerParametersInit", "invalid parameters specified: parameters = %p, destination = %s\n", v14, v15, v16, v17, v18, v19, (char)__src);
    goto LABEL_23;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if (!p_p) {
    goto LABEL_22;
  }
LABEL_14:
  memset(__src, 0, 368);
  size_t v21 = strnlen((const char *)p_p, 0x100uLL);
  uint64_t v22 = TelephonyUtilStrlcpy();
  if (v22 == v21 && (unint64_t)(v22 + 1) <= 0x100)
  {
    uint64_t v29 = 0;
    __src[45] = 0;
    char v30 = 1;
    goto LABEL_27;
  }
  _BBUFSDebugPrint("BBUFSServerParametersInit", "required path length = %zu, copied = %zu, max length = %zu\n", v23, v24, v25, v26, v27, v28, v21 + 1);
  __src[45] = 0;
LABEL_23:
  if (gBBULogMaskGet(void)::once == -1)
  {
    char v30 = 0;
    uint64_t v29 = 11;
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
      goto LABEL_27;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    char v30 = 0;
    uint64_t v29 = 11;
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
      goto LABEL_27;
    }
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    long long v31 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(4, 0, v31, "", "Failed preparing fs sync parameters\n", v32, v33, v34, v77);
    char v30 = 0;
  }
LABEL_27:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  long long v35 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)&__src[5] = *(_OWORD *)(a2 + 32);
  *(_OWORD *)&__src[7] = v35;
  *(_OWORD *)&__src[9] = *(_OWORD *)(a2 + 64);
  __src[11] = *(void *)(a2 + 80);
  long long v36 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&__src[1] = *(_OWORD *)a2;
  *(_OWORD *)&__src[3] = v36;
  __src[12] = IceAriGetContext();
  if ((v30 & 1) == 0)
  {
LABEL_32:
    if (v29 || !a3) {
      goto LABEL_36;
    }
    if (sBBUFSServerSetConfig)
    {
      if (sBBUFSServerSetConfig(a1 + 48, "ForceSync", 0xAAAAAAAA00000001))
      {
LABEL_36:
        if (!v29 && a4)
        {
          if (!sBBUFSServerSetConfig)
          {
            _BBUFSDebugPrint("BBUFSServerSetConfig", "sBBUFSServerSetConfig function not initialized\n", v37, v38, v39, v40, v41, v42, v77);
LABEL_58:
            BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed setting config '%s' to '%d'\n", "ShutdownSync", 1);
            return 61;
          }
          if ((sBBUFSServerSetConfig(a1 + 48, "ShutdownSync", 0xAAAAAAAA00000001) & 1) == 0) {
            goto LABEL_58;
          }
LABEL_46:
          if (sBBUFSServerSetConfig)
          {
            if (sBBUFSServerSetConfig(a1 + 48, "ARICtxId", 0xAAAAAAAA00000000))
            {
              if (sBBUFSServerStart)
              {
                if (sBBUFSServerStart(a1 + 48))
                {
                  if (sBBUFSServerFlush)
                  {
                    int v65 = sBBUFSServerFlush(a1 + 48);
                    char v72 = v65;
                    if (!*(unsigned char *)(a1 + 416))
                    {
                      fwrite("file server stopped\n", 0x14uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
                      if (v72) {
                        return 0;
                      }
LABEL_69:
                      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed FS flush\n");
                      return 61;
                    }
                    if (v65)
                    {
                      if (sBBUFSServerStop) {
                        sBBUFSServerStop(a1 + 48);
                      }
                      else {
                        _BBUFSDebugPrint("BBUFSServerStop", "sBBUFSServerStop function not initialized\n", v66, v67, v68, v69, v70, v71, v77);
                      }
                      return 0;
                    }
                  }
                  else
                  {
                    _BBUFSDebugPrint("BBUFSServerFlush", "sBBUFSServerFlush function not initialized\n", v59, v60, v61, v62, v63, v64, v77);
                    if (!*(unsigned char *)(a1 + 416))
                    {
                      uint64_t v73 = (FILE *)*MEMORY[0x263EF8348];
                      uint64_t v74 = "file server stopped\n";
                      size_t v75 = 20;
                      goto LABEL_68;
                    }
                  }
                  uint64_t v73 = (FILE *)*MEMORY[0x263EF8348];
                  uint64_t v74 = "filesystem flush operation failed\n";
                  size_t v75 = 34;
LABEL_68:
                  fwrite(v74, v75, 1uLL, v73);
                  goto LABEL_69;
                }
              }
              else
              {
                _BBUFSDebugPrint("BBUFSServerStart", "sBBUFSServerStart function not initialized\n", v53, v54, v55, v56, v57, v58, v77);
              }
              BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed starting file server");
              return 61;
            }
          }
          else
          {
            _BBUFSDebugPrint("BBUFSServerSetConfig", "sBBUFSServerSetConfig function not initialized\n", v37, v38, v39, v40, v41, v42, v77);
          }
          BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed setting config '%s' to '%d'", "ARICtxId", 0);
          return 61;
        }
        if (!v29) {
          goto LABEL_46;
        }
        return v29;
      }
    }
    else
    {
      _BBUFSDebugPrint("BBUFSServerSetConfig", "sBBUFSServerSetConfig function not initialized\n", v37, v38, v39, v40, v41, v42, v77);
    }
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed setting config '%s' to '%d'\n", "ForceSync", 1);
    return 61;
  }
  memcpy(__dst, __src, sizeof(__dst));
  if (BBUFSServerCreate((void *)(a1 + 48), __dst, v43, v44, v45, v46, v47, v48))
  {
    uint64_t v29 = 0;
    goto LABEL_32;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    uint64_t v29 = 19;
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
      return v29;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    uint64_t v29 = 19;
    if ((*(unsigned char *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0) {
      return v29;
    }
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    uint64_t v49 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(4, 0, v49, "", "Failed creating file server\n", v50, v51, v52, v77);
  }
  return v29;
}

void sub_21DF9FF8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)v19, v19[1]);
  operator delete(v19);
  pthread_mutex_unlock(&ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t BBUICEInitializer::queryChipInfoBooted(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v36[3] = *MEMORY[0x263EF8340];
  memset(v36, 170, 24);
  memset(v31, 0, sizeof(v31));
  long long v32 = 0u;
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Querying chip info from booted baseband");
  if (!a2 || !a3)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "missing parameter");
    return 2;
  }
  unsigned __int16 v35 = -21846;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)bytes = v6;
  long long v34 = v6;
  IceAriGetContext();
  if ((KTLSecGetSNUM() & 1) == 0)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "failed reading snum from booted baseband over KTL");
    return 18;
  }
  IceAriGetContext();
  if ((KTLSecGetChipId() & 1) == 0)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "failed reading chipid from booted baseband over KTL");
    return 18;
  }
  IceAriGetContext();
  if ((KTLSecGetPkHash() & 1) == 0)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "failed reading pkhash from booted baseband over KTL");
    return 18;
  }
  uint64_t v7 = BBUICEPersonalizationParameters::ICESerialNumber::createFromSerialNumber((const UInt8 *)v36, (const unsigned __int8 *)(8 * LOWORD(v36[2])));
  (*(void (**)(uint64_t, void *))(*(void *)a3 + 16))(a3, v7);
  long long v8 = BBUICEPersonalizationParameters::ICEChipID::createFromChipID((BBUICEPersonalizationParameters::ICEChipID *)v31[0]);
  uint64_t v9 = *(void *)(a3 + 16);
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  *(void *)(a3 + 16) = v8;
  CFIndex v10 = v35;
  uint64_t v11 = operator new(0x10uLL);
  void *v11 = &unk_26CECFF28;
  v11[1] = 0;
  v11[1] = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, v10);
  (*(void (**)(uint64_t, void *))(*(void *)a3 + 24))(a3, v11);
  if (!v7 || !v8) {
    goto LABEL_20;
  }
  uint64_t v12 = *(BBUFeedback **)(a1 + 8);
  (*(void (**)(void **__return_ptr, void *))(*v7 + 24))(__p, v7);
  if (v30 >= 0) {
    uint64_t v13 = __p;
  }
  else {
    uint64_t v13 = (void **)__p[0];
  }
  if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS == -1)
  {
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1) {
      goto LABEL_15;
    }
  }
  else
  {
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global_7);
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1) {
      goto LABEL_15;
    }
  }
  dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_13);
LABEL_15:
  int v14 = BBUpdaterCommon::inRestoreOS(void)::restoreOS;
  int v15 = BBUpdaterCommon::inRestoreOS(void)::recoveryOS;
  int v16 = (*(uint64_t (**)(void *))(*v8 + 24))(v8);
  if (v14 | v15) {
    uint64_t v17 = (const char *)v13;
  }
  else {
    uint64_t v17 = "<< SNUM >>";
  }
  BBUFeedback::handleComment(v12, "   SNUM: 0x%s / CHIPID: 0x%08x", v17, v16);
  if (v30 < 0) {
    operator delete(__p[0]);
  }
LABEL_20:
  uint64_t v18 = *(BBUFeedback **)(a1 + 8);
  (*(void (**)(void **__return_ptr, void *))(*v11 + 24))(__p, v11);
  if (v30 >= 0) {
    uint64_t v19 = __p;
  }
  else {
    uint64_t v19 = (void **)__p[0];
  }
  BBUFeedback::handleComment(v18, "   PUBLIC_KEY_HASH: 0x%s", (const char *)v19);
  if (v30 < 0) {
    operator delete(__p[0]);
  }
  size_t v21 = *(BBUFeedback **)(a1 + 8);
  uint64_t v20 = (BBUFeedback **)(a1 + 8);
  int v22 = (*(uint64_t (**)(void))(**(void **)(a3 + 24) + 24))(*(void *)(a3 + 24));
  BBUFeedback::handleComment(v21, "   CertID: %u", v22);
  BOOL v25 = *(void *)&v31[1] == *(void *)bytes
     && *(void *)&v31[3] == *(void *)&bytes[8]
     && (void)v32 == (void)v34
     && *((void *)&v32 + 1) == *((void *)&v34 + 1);
  uint64_t v26 = *v20;
  if (v25)
  {
    BBUFeedback::handleComment(v26, "   Detected as unfused BB");
    uint64_t result = 0;
    int v28 = 1;
  }
  else
  {
    BBUFeedback::handleComment(v26, "   Detected as fused BB\n");
    uint64_t result = 0;
    int v28 = 3;
  }
  *(_DWORD *)(a3 + 88) = v28;
  return result;
}

void sub_21DFA048C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

const char *BBUICEInitializer::getDebugName(BBUICEInitializer *this)
{
  return "BBUICEInitializer";
}

uint64_t __cxx_global_var_init_29()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_21DE8A000);
  }
  return result;
}

uint64_t __cxx_global_var_init_98()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUPartitionManager>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance, &dword_21DE8A000);
  }
  return result;
}

void BBUICEPersonalizationParameters::ICENonce::~ICENonce(BBUICEPersonalizationParameters::ICENonce *this)
{
  *(void *)this = &unk_26CECFE08;
  uint64_t v1 = (const void *)*((void *)this + 1);
  if (v1) {
    CFRelease(v1);
  }
}

{
  const void *v2;
  uint64_t vars8;

  *(void *)this = &unk_26CECFE08;
  uint64_t v2 = (const void *)*((void *)this + 1);
  if (v2) {
    CFRelease(v2);
  }

  operator delete(this);
}

uint64_t BBUICEPersonalizationParameters::ICENonce::getAsCFData(BBUICEPersonalizationParameters::ICENonce *this)
{
  return *((void *)this + 1);
}

void BBUICEPersonalizationParameters::ICENonce::getAsString(const __CFData **this@<X0>, const __CFData *a2@<X8>)
{
}

void BBUICEPersonalizationParameters::ICESerialNumber::~ICESerialNumber(BBUICEPersonalizationParameters::ICESerialNumber *this)
{
  *(void *)this = &unk_26CECFE38;
  uint64_t v1 = (const void *)*((void *)this + 1);
  if (v1) {
    CFRelease(v1);
  }
}

{
  const void *v2;
  uint64_t vars8;

  *(void *)this = &unk_26CECFE38;
  uint64_t v2 = (const void *)*((void *)this + 1);
  if (v2) {
    CFRelease(v2);
  }

  operator delete(this);
}

void *BBUICEPersonalizationParameters::ICESerialNumber::createFromSerialNumber(const UInt8 *this, const unsigned __int8 *a2)
{
  if (a2 != 96) {
    return 0;
  }
  int v3 = operator new(0x10uLL);
  void *v3 = &unk_26CECFE38;
  v3[1] = 0;
  CFDataRef v4 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], this, 12);
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 100, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Personalization/ICE/BBUICEPersonalizationParameters.cpp", 0x80u, (ctu::LogMessageBuffer *)"Assertion failure(data && \"Failed to create serial number.\")", v7, v8, v9, v10);
  }
  v3[1] = v4;
  return v3;
}

void sub_21DFA0788(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUICEPersonalizationParameters::ICESerialNumber::getAsCFData(BBUICEPersonalizationParameters::ICESerialNumber *this)
{
  return *((void *)this + 1);
}

void BBUICEPersonalizationParameters::ICESerialNumber::getAsString(const __CFData **this@<X0>, const __CFData *a2@<X8>)
{
}

void BBUICEPersonalizationParameters::ICECertID::~ICECertID(BBUICEPersonalizationParameters::ICECertID *this)
{
  *(void *)this = &unk_26CECFE68;
  uint64_t v1 = (const void *)*((void *)this + 1);
  if (v1) {
    CFRelease(v1);
  }
}

{
  const void *v2;
  uint64_t vars8;

  *(void *)this = &unk_26CECFE68;
  uint64_t v2 = (const void *)*((void *)this + 1);
  if (v2) {
    CFRelease(v2);
  }

  operator delete(this);
}

CFDataRef BBUICEPersonalizationParameters::ICECertID::createFromPublicKeyHashData(CFDataRef theData, const __CFData *a2)
{
  CFDataRef v2 = theData;
  if (!theData) {
    return v2;
  }
  BytePtr = (unsigned int *)CFDataGetBytePtr(theData);
  if ((CFDataGetLength(v2) & 0xFFFFFFFCLL) != 0)
  {
    CFDataRef v2 = (CFDataRef)operator new(0x10uLL);
    *(void *)CFDataRef v2 = &unk_26CECFE68;
    *((void *)v2 + 1) = 0;
    uint64_t valuePtr = bswap32(*BytePtr);
    CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
    *((void *)v2 + 1) = v4;
    if (!v4)
    {
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 97, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Personalization/ICE/BBUICEPersonalizationParameters.cpp", 0xEFu, (ctu::LogMessageBuffer *)"Assertion failure(certID->fNumber && \"Failed to create CertID!\")", v7, v8, v9, v10);
    }
    return v2;
  }
  return 0;
}

void sub_21DFA0960(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUICEPersonalizationParameters::ICECertID::getAsCFNumber(BBUICEPersonalizationParameters::ICECertID *this)
{
  return *((void *)this + 1);
}

uint64_t BBUICEPersonalizationParameters::ICECertID::getAsUnsigned(unsigned int **this, uint64_t a2, const __CFNumber *a3)
{
  unsigned int v9 = -1431655766;
  if ((ctu::cf::assign((ctu::cf *)&v9, this[1], a3) & 1) == 0)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 97, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Personalization/ICE/BBUICEPersonalizationParameters.cpp", 0x10Du, (ctu::LogMessageBuffer *)"Assertion failure(success && \"Failed to create CertID!\")", v5, v6, v7, v8);
  }
  return v9;
}

void sub_21DFA0A04(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void BBUICEPersonalizationParameters::ICEChipID::~ICEChipID(BBUICEPersonalizationParameters::ICEChipID *this)
{
  *(void *)this = &unk_26CECFE98;
  uint64_t v1 = (const void *)*((void *)this + 1);
  if (v1) {
    CFRelease(v1);
  }
}

{
  const void *v2;
  uint64_t vars8;

  *(void *)this = &unk_26CECFE98;
  CFDataRef v2 = (const void *)*((void *)this + 1);
  if (v2) {
    CFRelease(v2);
  }

  operator delete(this);
}

void *BBUICEPersonalizationParameters::ICEChipID::createFromChipID(BBUICEPersonalizationParameters::ICEChipID *this)
{
  unsigned int v1 = this;
  CFDataRef v2 = operator new(0x10uLL);
  *CFDataRef v2 = &unk_26CECFE98;
  v2[1] = 0;
  uint64_t valuePtr = v1;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  v2[1] = v3;
  if (!v3)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 98, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Personalization/ICE/BBUICEPersonalizationParameters.cpp", 0x126u, (ctu::LogMessageBuffer *)"Assertion failure(( chipID->fNumber && \"Failed to create ChipID!\"))", v6, v7, v8, v9);
  }
  return v2;
}

void sub_21DFA0B8C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUICEPersonalizationParameters::ICEChipID::getAsCFNumber(BBUICEPersonalizationParameters::ICEChipID *this)
{
  return *((void *)this + 1);
}

uint64_t BBUICEPersonalizationParameters::ICEChipID::getAsUnsigned(unsigned int **this, uint64_t a2, const __CFNumber *a3)
{
  unsigned int v9 = -1431655766;
  if ((ctu::cf::assign((ctu::cf *)&v9, this[1], a3) & 1) == 0)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 98, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Personalization/ICE/BBUICEPersonalizationParameters.cpp", 0x141u, (ctu::LogMessageBuffer *)"Assertion failure(success && \"Failed to create chipID!\")", v5, v6, v7, v8);
  }
  return v9;
}

void sub_21DFA0C30(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void BBUICEPersonalizationParameters::ICEKeyStatus::~ICEKeyStatus(BBUICEPersonalizationParameters::ICEKeyStatus *this)
{
  *(void *)this = &unk_26CECFEC8;
  unsigned int v1 = (const void *)*((void *)this + 1);
  if (v1) {
    CFRelease(v1);
  }
}

{
  const void *v2;
  uint64_t vars8;

  *(void *)this = &unk_26CECFEC8;
  CFDataRef v2 = (const void *)*((void *)this + 1);
  if (v2) {
    CFRelease(v2);
  }

  operator delete(this);
}

void *BBUICEPersonalizationParameters::ICEKeyStatus::createFromKeyStatus(BBUICEPersonalizationParameters::ICEKeyStatus *this)
{
  unsigned int v1 = this;
  CFDataRef v2 = operator new(0x10uLL);
  *CFDataRef v2 = &unk_26CECFEC8;
  v2[1] = 0;
  uint64_t valuePtr = v1;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  v2[1] = v3;
  if (!v3)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 99, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Personalization/ICE/BBUICEPersonalizationParameters.cpp", 0x15Au, (ctu::LogMessageBuffer *)"Assertion failure(status->fNumber && \"Failed to create key status!\")", v6, v7, v8, v9);
  }
  return v2;
}

void sub_21DFA0DB8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUICEPersonalizationParameters::ICEKeyStatus::getAsUnsigned(unsigned int **this, uint64_t a2, const __CFNumber *a3)
{
  unsigned int v9 = -1431655766;
  if ((ctu::cf::assign((ctu::cf *)&v9, this[1], a3) & 1) == 0)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 99, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Personalization/ICE/BBUICEPersonalizationParameters.cpp", 0x16Fu, (ctu::LogMessageBuffer *)"Assertion failure(success && \"Failed to create key status!\")", v5, v6, v7, v8);
  }
  return v9;
}

void sub_21DFA0E54(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUICEPersonalizationParameters::ICEKeyStatus::getAsCFNumber(BBUICEPersonalizationParameters::ICEKeyStatus *this)
{
  return *((void *)this + 1);
}

void BBUICEPersonalizationParameters::ICEKeyHash::~ICEKeyHash(BBUICEPersonalizationParameters::ICEKeyHash *this)
{
  *(void *)this = &unk_26CECFEF8;
  unsigned int v1 = (const void *)*((void *)this + 1);
  if (v1) {
    CFRelease(v1);
  }
}

{
  const void *v2;
  uint64_t vars8;

  *(void *)this = &unk_26CECFEF8;
  CFDataRef v2 = (const void *)*((void *)this + 1);
  if (v2) {
    CFRelease(v2);
  }

  operator delete(this);
}

uint64_t BBUICEPersonalizationParameters::ICEKeyHash::getAsCFData(BBUICEPersonalizationParameters::ICEKeyHash *this)
{
  return *((void *)this + 1);
}

void BBUICEPersonalizationParameters::ICEKeyHash::getAsString(const __CFData **this@<X0>, const __CFData *a2@<X8>)
{
}

void BBUICEPersonalizationParameters::ICEPublicKeyHash::~ICEPublicKeyHash(BBUICEPersonalizationParameters::ICEPublicKeyHash *this)
{
  *(void *)this = &unk_26CECFF28;
  unsigned int v1 = (const void *)*((void *)this + 1);
  if (v1) {
    CFRelease(v1);
  }
}

{
  const void *v2;
  uint64_t vars8;

  *(void *)this = &unk_26CECFF28;
  CFDataRef v2 = (const void *)*((void *)this + 1);
  if (v2) {
    CFRelease(v2);
  }

  operator delete(this);
}

uint64_t BBUICEPersonalizationParameters::ICEPublicKeyHash::getAsCFData(BBUICEPersonalizationParameters::ICEPublicKeyHash *this)
{
  return *((void *)this + 1);
}

void BBUICEPersonalizationParameters::ICEPublicKeyHash::getAsString(const __CFData **this@<X0>, const __CFData *a2@<X8>)
{
}

_DWORD *BBULoaderVersion::createFromVersionString(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 23);
  if ((v1 & 0x80u) != 0) {
    uint64_t v1 = *(void *)(a1 + 8);
  }
  if (!v1 || !capabilities::radio::maverick((capabilities::radio *)a1)) {
    return 0;
  }
  CFNumberRef v3 = operator new(0x28uLL);
  v3[2] = 0;
  *((void *)v3 + 3) = 0;
  *((void *)v3 + 4) = 0;
  *((void *)v3 + 2) = 0;
  *(void *)CFNumberRef v3 = &unk_26CECBD80;
  int v4 = off_26CECBDA0((uint64_t)v3, (void **)a1);
  if (v4)
  {
    int v8 = v4;
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 4) != 0) {
        goto LABEL_8;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 4) != 0)
      {
LABEL_8:
        if ((gBBULogVerbosity & 0x80000000) == 0) {
          _BBULog(18, 0, "BBULoaderVersion", (const char *)&str_16, "Parsing failed, ret = %s\n", v5, v6, v7, (char)BBUReturnAsString::BBUReturnStrings[v8]);
        }
      }
    }
    (*(void (**)(_DWORD *))(*(void *)v3 + 8))(v3);
    return 0;
  }
  return v3;
}

void *BBUpdaterExtremeCreate()
{
  return BBUpdaterExtremeCreateCommon(0);
}

void *BBUpdaterExtremeCreateCommon(CFErrorRef *a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long block = 0u;
  long long v33 = 0u;
  size_t v23 = 256;
  int v2 = sysctlbyname("hw.model", &block, &v23, 0, 0);
  if (v2)
  {
    if (a1)
    {
      *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v30 = v3;
      long long v31 = v3;
      long long v28 = v3;
      long long v29 = v3;
      long long v26 = v3;
      long long v27 = v3;
      *(_OWORD *)long long __str = v3;
      long long v25 = v3;
      snprintf(__str, 0x80uLL, "%s: hw.model query failed with %d\n", "BBUpdaterDetermineVendorandPlatform", v2);
      *a1 = BBUpdaterExtremePrivate::makeCFError(16, __str);
LABEL_26:
      unsigned int v9 = 0;
      *a1 = BBUpdaterExtremePrivate::makeCFError(24, "BBUpdaterExtremeCreateCommon(): Unable to determine radio vendor\n");
      return v9;
    }
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s: hw.model query failed with %d\n", "BBUpdaterDetermineVendorandPlatform", v2);
    return 0;
  }
  uint64_t v4 = TelephonyCapabilitiesSetHardwareModelFromString();
  if ((v4 & 1) == 0)
  {
    if (!a1)
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s: could not set Telephony HW model with %s\n", "BBUpdaterDetermineVendorandPlatform", (const char *)&block);
      return 0;
    }
    *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v30 = v19;
    long long v31 = v19;
    long long v28 = v19;
    long long v29 = v19;
    long long v26 = v19;
    long long v27 = v19;
    *(_OWORD *)long long __str = v19;
    long long v25 = v19;
    snprintf(__str, 0x80uLL, "%s: could not set Telephony HW model with %s\n", "BBUpdaterDetermineVendorandPlatform", (const char *)&block);
    *a1 = BBUpdaterExtremePrivate::makeCFError(16, __str);
    goto LABEL_25;
  }
  if (capabilities::radio::vendor((capabilities::radio *)v4) - 1 > 1)
  {
LABEL_25:
    if (a1) {
      goto LABEL_26;
    }
    return 0;
  }
  pthread_once(&BBUpdaterExtreme::sBBUpdaterRegisterClassOnce, (void (*)(void))BBUpdaterRegisterClass);
  if (!BBUpdaterExtreme::sBBUpdaterTypeID) {
    return 0;
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  unsigned int v9 = (void *)Instance;
  if (Instance)
  {
    *(unsigned char *)(Instance + 24) = 1;
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    char v10 = (capabilities::radio *)_BBULog(0, 0xFFFFFFFFLL, "BBUpdaterExtreme", "", "BBUpdater Version: %s-%s\n", v6, v7, v8, (char)"BBU_PROJECT_VERSION");
    int v11 = capabilities::radio::vendor(v10);
    pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
    uint64_t v12 = qword_26AA89AB0;
    if (!qword_26AA89AB0)
    {
      uint64_t v13 = (BBUError *)operator new(0x38uLL);
      BBUError::BBUError(v13);
      std::shared_ptr<BBUError>::shared_ptr[abi:ne180100]<BBUError,std::shared_ptr<BBUError> ctu::SharedSynchronizable<BBUError>::make_shared_ptr<BBUError>(BBUError*)::{lambda(BBUError*)#1},void>((std::__shared_weak_count_vtbl **)&block, (std::__shared_weak_count_vtbl *)v13);
      long long v14 = block;
      long long block = 0uLL;
      int v15 = (std::__shared_weak_count *)off_26AA89AB8;
      *(_OWORD *)&qword_26AA89AB0 = v14;
      if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
      int v16 = (std::__shared_weak_count *)*((void *)&block + 1);
      if (*((void *)&block + 1)
        && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&block + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
      uint64_t v12 = qword_26AA89AB0;
    }
    uint64_t v17 = (std::__shared_weak_count *)off_26AA89AB8;
    if (off_26AA89AB8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)off_26AA89AB8 + 1, 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
    size_t v23 = (size_t)__str;
    *(void *)long long __str = MEMORY[0x263EF8330];
    *(void *)&__str[8] = 0x40000000;
    *(void *)&long long v25 = ___ZN8BBUError11clearErrorsEv_block_invoke;
    *((void *)&v25 + 1) = &__block_descriptor_tmp_9;
    *(void *)&long long v26 = v12;
    *(void *)&long long block = MEMORY[0x263EF8330];
    *((void *)&block + 1) = 0x40000000;
    *(void *)&long long v33 = ___ZNK3ctu20SharedSynchronizableI8BBUErrorE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
    *((void *)&v33 + 1) = &__block_descriptor_tmp_13_0;
    *(void *)&long long v34 = v12;
    *((void *)&v34 + 1) = &v23;
    uint64_t v18 = *(NSObject **)(v12 + 16);
    if (*(void *)(v12 + 24)) {
      dispatch_async_and_wait(v18, &block);
    }
    else {
      dispatch_sync(v18, &block);
    }
    if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
    if (v11 == 1)
    {
      uint64_t v20 = (BBUpdaterController *)operator new(0x168uLL);
      BBUpdaterController::BBUpdaterController(v20, v9);
    }
    else
    {
      if (v11 != 2)
      {
        if (a1)
        {
          *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v38 = v21;
          long long v39 = v21;
          long long v36 = v21;
          long long v37 = v21;
          long long v34 = v21;
          long long v35 = v21;
          long long block = v21;
          long long v33 = v21;
          snprintf((char *)&block, 0x80uLL, "Unknown telephony radio vendor %d", v11);
          *a1 = BBUpdaterExtremePrivate::makeCFError(24, (const char *)&block);
        }
        else
        {
          fprintf((FILE *)*MEMORY[0x263EF8358], "Unknown telephony radio vendor %d\n", v11);
        }
        goto LABEL_40;
      }
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s: Good\n", "BBUpdaterInit");
      uint64_t v20 = (BBUpdaterController *)operator new(0x168uLL);
      BBUpdaterController::BBUpdaterController(v20, v9);
    }
    v9[2] = v20;
LABEL_40:
    if (v9[2]) {
      return v9;
    }
    CFRelease(v9);
    return 0;
  }
  return v9;
}

#error "21DFA17A8: call analysis failed (funcsize=40)"

_DWORD *BBUpdaterParametersInit(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

void *BBUpdaterExtremeCreateWithParams()
{
  return BBUpdaterExtremeCreateCommon(0);
}

void *BBUpdaterExtremeCreateWithParamsWithError(uint64_t a1, CFErrorRef *a2)
{
  return BBUpdaterExtremeCreateCommon(a2);
}

uint64_t BBUpdaterExecCommand(uint64_t a1, uint64_t a2, uint64_t a3, CFErrorRef *a4)
{
  if (!a1 || !a2)
  {
    if (a4) {
      *a4 = BBUpdaterExtremePrivate::makeCFError(4, 0);
    }
    return 0;
  }
  if (!*(unsigned char *)(a1 + 24)) {
    return 0;
  }
  uint64_t v4 = *(uint64_t (**)(void))(**(void **)(a1 + 16) + 24);

  return v4();
}

uint64_t BBUpdaterSetOptions(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  if (!a1)
  {
    if (a3) {
      *a3 = BBUpdaterExtremePrivate::makeCFError(4, 0);
    }
    return 0;
  }
  if (!*(unsigned char *)(a1 + 24)) {
    return 0;
  }
  long long v3 = *(uint64_t (**)(void))(**(void **)(a1 + 16) + 16);

  return v3();
}

uint64_t BBUpdaterRegisterLogSink(uint64_t result)
{
  if (result)
  {
    if (*(unsigned char *)(result + 24)) {
      return (*(uint64_t (**)(void))(**(void **)(result + 16) + 32))();
    }
  }
  return result;
}

uint64_t BBUpdaterRegisterGlobalLogSink(uint64_t result, void *a2)
{
  gBBULogSinkContext = result;
  gBBULogSinkFunc = a2;
  return result;
}

uint64_t BBUpdaterRegisterClass(void)
{
  uint64_t result = _CFRuntimeRegisterClass();
  BBUpdaterExtreme::sBBUpdateruint64_t TypeID = result;
  return result;
}

void *BBUpdaterDestroy(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[2];
    if (result)
    {
      uint64_t result = (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
      v1[2] = 0;
    }
  }
  return result;
}

CFStringRef BBUpdaterDescribe(CFStringRef result)
{
  if (result)
  {
    CFStringRef v1 = result;
    CFAllocatorRef v2 = CFGetAllocator(result);
    CFAllocatorRef v3 = CFGetAllocator(v1);
    return CFStringCreateWithFormat(v2, 0, @"<libBBUpdater %p [%p]>{}", v1, v3);
  }
  return result;
}

uint64_t __cxx_global_var_init_30()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUError>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance, &dword_21DE8A000);
  }
  return result;
}

void BBUEUR20Fusing::~BBUEUR20Fusing(void **this)
{
  *this = &unk_26CECCD78;
  if ((*((char *)this + 79) & 0x80000000) == 0)
  {
    if ((*((char *)this + 55) & 0x80000000) == 0) {
      return;
    }
LABEL_5:
    operator delete(this[4]);
    return;
  }
  operator delete(this[7]);
  if (*((char *)this + 55) < 0) {
    goto LABEL_5;
  }
}

{
  BBUEUR20Fusing *v2;
  uint64_t vars8;

  *this = &unk_26CECCD78;
  if (*((char *)this + 79) < 0)
  {
    operator delete(this[7]);
    if ((*((char *)this + 55) & 0x80000000) == 0)
    {
LABEL_3:
      CFAllocatorRef v2 = (BBUEUR20Fusing *)this;
      goto LABEL_5;
    }
  }
  else if ((*((char *)this + 55) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(this[4]);
  CFAllocatorRef v2 = (BBUEUR20Fusing *)this;

LABEL_5:
  operator delete(v2);
}

uint64_t BBUEUR20Fusing::performFusing(BBUFeedback **a1)
{
  BBUFeedback::handleBeginPhase(a1[1], "Fuse");
  if (!*((unsigned char *)a1 + 24))
  {
    (*((void (**)(BBUFeedback **))*a1 + 6))(a1);
    ETLFusingProgramTriggerM20();
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
        goto LABEL_7;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
        goto LABEL_7;
      }
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      CFAllocatorRef v3 = (const char *)(*((uint64_t (**)(BBUFeedback **))*a1 + 4))(a1);
      _BBULog(13, 0, v3, "", "Triggering Fusing Program with status (%d)\n", v4, v5, v6, -1);
    }
LABEL_7:
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0) {
        goto LABEL_9;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
      {
LABEL_9:
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          uint64_t v7 = (const char *)(*((uint64_t (**)(BBUFeedback **))*a1 + 4))(a1);
          _BBULog(13, 0, v7, "", "Failed to run ETLFusingProgramTriggerM20() with status (%d)\n", v8, v9, v10, -1);
        }
      }
    }
    uint64_t v2 = 24;
    goto LABEL_12;
  }
  uint64_t v2 = 0;
LABEL_12:
  (*(void (**)(BBUFeedback *, uint64_t))(*(void *)a1[1] + 16))(a1[1], v2);
  return v2;
}

uint64_t BBUEUR20Fusing::verifyFusing(uint64_t a1, uint64_t a2)
{
  BBUFeedback::handleBeginPhase(*(BBUFeedback **)(a1 + 8), "Verify Fusing");
  if (!*(unsigned char *)(a1 + 24) && !*(unsigned char *)(a1 + 80))
  {
    unint64_t v148 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 64))(a2);
    *(void *)unint64_t v144 = v10;
    int v11 = (std::__shared_weak_count *)operator new(0x20uLL);
    v11->__shared_owners_ = 0;
    v11->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CED00D8;
    v11->__shared_weak_owners_ = 0;
    v11[1].__vftable = (std::__shared_weak_count_vtbl *)v10;
    *(void *)&v144[8] = v11;
    if (v10)
    {
      uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 24))(v10);
      uint64_t v13 = v12;
      size_t v14 = v12;
      if (v12)
      {
        int v15 = operator new(v12);
        bzero(v15, v14);
      }
      else
      {
        int v15 = 0;
      }
      LODWORD(v152) = -1431655766;
      if ((*(unsigned int (**)(uint64_t, void *, uint64_t, unint64_t *, void))(*(void *)v10 + 16))(v10, v15, v13, &v152, 0))
      {
        if (gBBULogMaskGet(void)::once == -1)
        {
          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0) {
            goto LABEL_20;
          }
        }
        else
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
          {
LABEL_20:
            if ((gBBULogVerbosity & 0x80000000) == 0)
            {
              uint64_t v20 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
              _BBULog(13, 0, v20, "", "Failed to copy data from fusing source\n", v21, v22, v23, v142);
            }
          }
        }
LABEL_45:
        unint64_t v148 = 0;
LABEL_46:
        if (v15) {
          operator delete(v15);
        }
LABEL_48:
        if (atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          long long v39 = (const void *)v148;
          if (v148) {
            long long v40 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
          }
          else {
            long long v40 = 0;
          }
          if (v40)
          {
LABEL_53:
            memset(v144, 0, sizeof(v144));
            long long v145 = 0u;
            memset(&__p, 0, sizeof(__p));
            unint64_t v147 = 0xAAAAAAAAAAAAAAAALL;
            std::vector<unsigned int>::__append((std::vector<unsigned int> *)v144, 0x28uLL);
            unint64_t v41 = v145 - *(void *)&v144[24];
            if ((void)v145 - *(void *)&v144[24] > 0x9FuLL)
            {
              if (v41 != 160) {
                *(void *)&long long v145 = *(void *)&v144[24] + 160;
              }
            }
            else
            {
              std::vector<unsigned int>::__append((std::vector<unsigned int> *)&v144[24], 40 - (v41 >> 2));
            }
            unint64_t v47 = (char *)__p.__end_ - (char *)__p.__begin_;
            if ((std::vector<unsigned int>::pointer)((char *)__p.__end_ - (char *)__p.__begin_) > (std::vector<unsigned int>::pointer)0x9F)
            {
              if (v47 != 160) {
                __p.__end_ = __p.__begin_ + 40;
              }
            }
            else
            {
              std::vector<unsigned int>::__append(&__p, 40 - (v47 >> 2));
            }
            LODWORD(v147) = 0;
            (*(void (**)(uint64_t))(*(void *)a1 + 48))(a1);
            if ((ETLFusingGetFusedData() & 1) == 0)
            {
              if (gBBULogMaskGet(void)::once == -1)
              {
                uint64_t v4 = 125;
                if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                  goto LABEL_202;
                }
              }
              else
              {
                dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                uint64_t v4 = 125;
                if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                  goto LABEL_202;
                }
              }
              if (gBBULogVerbosity < 0) {
                goto LABEL_202;
              }
              uint64_t v48 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
              uint64_t v52 = "Failed to run ETLFusingGetFusedData()\n";
              goto LABEL_201;
            }
            LODWORD(v147) = 0;
            if ((uint64_t)(*(void *)&v144[8] - *(void *)v144) >> 2) {
              *(void *)&v144[8] = *(void *)v144;
            }
            if ((uint64_t)(v145 - *(void *)&v144[24]) >> 2) {
              *(void *)&long long v145 = *(void *)&v144[24];
            }
            if (__p.__end_ - __p.__begin_) {
              __p.__end_ = __p.__begin_;
            }
            if (v39) {
              CFRetain(v39);
            }
            uint64_t v53 = operator new(0x28uLL);
            v53[2] = 0x4B5F57485F434553;
            v53[3] = 22853;
            *((unsigned char *)v53 + 39) = 10;
            *uint64_t v53 = &format;
            v53[1] = &format;
            CFPropertyListFormat format = (CFPropertyListFormat)v53;
            long long v155 = (CFPropertyListFormat *)v53;
            uint64_t v156 = 1;
            unint64_t Count = CFArrayGetCount((CFArrayRef)v39);
            if (!Count)
            {
              BOOL v55 = 1;
              goto LABEL_183;
            }
            unint64_t v54 = 0;
            BOOL v55 = 0;
LABEL_85:
            unint64_t v152 = 0xAAAAAAAAAAAAAAAALL;
            unint64_t v153 = 0xAAAAAAAAAAAAAAAALL;
            CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v39, v54);
            ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)&v152, ValueAtIndex);
            if (v153)
            {
              uint64_t v150 = 0;
              memset(v151, 170, sizeof(v151));
              v149[0] = 0;
              v149[1] = 0;
              ctu::cf::map_adapter::getString();
              if (SHIBYTE(v150) < 0) {
                operator delete((void *)v149[0]);
              }
              __int32 Int = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)&v152, @"Address");
              uint64_t v58 = v155;
              if (v155 == &format) {
                goto LABEL_113;
              }
              if (SHIBYTE(v151[2]) >= 0) {
                uint64_t v59 = (void *)HIBYTE(v151[2]);
              }
              else {
                uint64_t v59 = v151[1];
              }
              if (SHIBYTE(v151[2]) >= 0) {
                uint64_t v60 = v151;
              }
              else {
                uint64_t v60 = (void **)v151[0];
              }
              while (1)
              {
                uint64_t v61 = *((unsigned __int8 *)v58 + 39);
                if ((v61 & 0x80u) == 0) {
                  uint64_t v62 = (void *)*((unsigned __int8 *)v58 + 39);
                }
                else {
                  uint64_t v62 = (void *)*((void *)v58 + 3);
                }
                if (v62 == v59)
                {
                  uint64_t v63 = (const void **)(v58 + 2);
                  if ((v61 & 0x80) != 0)
                  {
                    if (!memcmp(*v63, v60, *((void *)v58 + 3))) {
                      goto LABEL_106;
                    }
                  }
                  else
                  {
                    if (!*((unsigned char *)v58 + 39))
                    {
LABEL_106:
                      if (v58 != &format)
                      {
                        if (gBBULogMaskGet(void)::once == -1)
                        {
                          int v65 = 4;
                          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
                          {
LABEL_109:
                            if ((gBBULogVerbosity & 0x80000000) == 0)
                            {
                              uint64_t v66 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
                              uint64_t v70 = v151;
                              if (SHIBYTE(v151[2]) < 0) {
                                LOBYTE(v70) = v151[0];
                              }
                              _BBULog(13, 0, v66, "", "Skip because the region type(%s:0x%08X) is in the deny list\n", v67, v68, v69, (char)v70);
                            }
                          }
                        }
                        else
                        {
                          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                          int v65 = 4;
                          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0) {
                            goto LABEL_109;
                          }
                        }
                        goto LABEL_146;
                      }
LABEL_113:
                      uint64_t v71 = *(__int32 **)&v144[8];
                      char v72 = wmemchr(*(__int32 **)v144, Int, (uint64_t)(*(void *)&v144[8] - *(void *)v144) >> 2);
                      if (v72) {
                        uint64_t v73 = v72;
                      }
                      else {
                        uint64_t v73 = v71;
                      }
                      if (v73 == *(__int32 **)&v144[8])
                      {
                        if (gBBULogMaskGet(void)::once == -1)
                        {
                          int v65 = 1;
                          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                            goto LABEL_146;
                          }
                        }
                        else
                        {
                          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                          int v65 = 1;
                          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                            goto LABEL_146;
                          }
                        }
                        if ((gBBULogVerbosity & 0x80000000) == 0)
                        {
                          uint64_t v82 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
                          uint64_t v86 = v151;
                          if (SHIBYTE(v151[2]) < 0) {
                            LOBYTE(v86) = v151[0];
                          }
                          _BBULog(13, 0, v82, "", "%s: Failed to find the addressin BB from the plist address (0x%08X)\n", v83, v84, v85, (char)v86);
                        }
                        goto LABEL_146;
                      }
                      unint64_t v74 = (unint64_t)v73 - *(void *)v144;
                      unint64_t v75 = ((unint64_t)v73 - *(void *)v144) >> 2;
                      if (v75 > ((unint64_t)((char *)__p.__end_cap_.__value_
                                                                               - (char *)__p.__begin_) >> 2))
                      {
                        if (gBBULogMaskGet(void)::once == -1)
                        {
                          int v65 = 1;
                          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                            goto LABEL_146;
                          }
                        }
                        else
                        {
                          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                          int v65 = 1;
                          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                            goto LABEL_146;
                          }
                        }
                        if (gBBULogVerbosity < 0) {
                          goto LABEL_146;
                        }
                        int8x16_t v76 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
                        int v80 = v151;
                        if (SHIBYTE(v151[2]) < 0) {
                          LOBYTE(v80) = v151[0];
                        }
                        uint64_t v81 = "%s: Finding index (%d) is beyond the capacity in LSB in the fusing data\n";
                        goto LABEL_124;
                      }
                      int v87 = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)&v152, @"LSB");
                      unsigned int v88 = __p.__begin_[v75];
                      if ((v88 & v87) == ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)&v152, @"LSB"))
                      {
                        if (v75 > ((*((void *)&v145 + 1) - *(void *)&v144[24]) >> 2))
                        {
                          if (gBBULogMaskGet(void)::once == -1)
                          {
                            int v65 = 1;
                            if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                              goto LABEL_146;
                            }
                          }
                          else
                          {
                            dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                            int v65 = 1;
                            if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                              goto LABEL_146;
                            }
                          }
                          if (gBBULogVerbosity < 0) {
                            goto LABEL_146;
                          }
                          int8x16_t v76 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
                          int v80 = v151;
                          if (SHIBYTE(v151[2]) < 0) {
                            LOBYTE(v80) = v151[0];
                          }
                          uint64_t v81 = "%s: Finding index (%d) is beyond the capacity in MSB in the fusing data\n";
LABEL_124:
                          _BBULog(13, 0, v76, "", v81, v77, v78, v79, (char)v80);
                          goto LABEL_146;
                        }
                        int v97 = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)&v152, @"MSB");
                        int v98 = *(_DWORD *)(*(void *)&v144[24] + 4 * (v74 >> 2));
                        if ((v98 & v97) == ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)&v152, @"MSB"))
                        {
                          if (gBBULogMaskGet(void)::once == -1)
                          {
                            int v65 = 0;
                            if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                              goto LABEL_146;
                            }
                          }
                          else
                          {
                            dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                            int v65 = 0;
                            if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                              goto LABEL_146;
                            }
                          }
                          if ((gBBULogVerbosity & 0x80000000) == 0)
                          {
                            uint64_t v99 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
                            if (SHIBYTE(v151[2]) >= 0) {
                              unint64_t v100 = v151;
                            }
                            else {
                              LOBYTE(v100) = v151[0];
                            }
                            ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)&v152, @"LSB");
                            ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)&v152, @"MSB");
                            _BBULog(13, 0, v99, "", "Region Type (%s): Address (0x%08X), LSB (0x%08X), MSB (0x%08X): PASSED!\n", v101, v102, v103, (char)v100);
                            int v65 = 0;
                          }
LABEL_146:
                          if (SHIBYTE(v151[2]) < 0) {
                            operator delete(v151[0]);
                          }
                          MEMORY[0x223C1D170](&v152);
                          if ((v65 | 4) != 4 || (++v54, BOOL v55 = v54 >= Count, v54 == Count))
                          {
LABEL_183:
                            if (v156)
                            {
                              CFPropertyListFormat v108 = format;
                              uint64_t v109 = v155;
                              CFPropertyListFormat v110 = *v155;
                              *(void *)(v110 + 8) = *(void *)(format + 8);
                              **(void **)(v108 + 8) = v110;
                              uint64_t v156 = 0;
                              if (v109 != &format)
                              {
                                do
                                {
                                  uint64_t v115 = (CFPropertyListFormat *)*((void *)v109 + 1);
                                  if (*((char *)v109 + 39) < 0) {
                                    operator delete(*((void **)v109 + 2));
                                  }
                                  operator delete(v109);
                                  uint64_t v109 = v115;
                                }
                                while (v115 != &format);
                              }
                            }
                            if (v39) {
                              CFRelease(v39);
                            }
                            if (v55)
                            {
                              LODWORD(format) = -1;
                              (*(void (**)(uint64_t))(*(void *)a1 + 48))(a1);
                              if (ETLFusingGetSecureState())
                              {
                                if (format)
                                {
                                  if (gBBULogMaskGet(void)::once == -1)
                                  {
                                    uint64_t v4 = 125;
                                    if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                                      goto LABEL_202;
                                    }
                                  }
                                  else
                                  {
                                    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                                    uint64_t v4 = 125;
                                    if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                                      goto LABEL_202;
                                    }
                                  }
                                  if ((gBBULogVerbosity & 0x80000000) == 0)
                                  {
                                    long long v124 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
                                    _BBULog(13, 0, v124, "", "Failed to pass the secure state: (0x%08X)\n", v125, v126, v127, format);
                                  }
                                }
                                else if (gBBULogMaskGet(void)::once == -1)
                                {
                                  uint64_t v4 = 0;
                                  if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
                                  {
LABEL_192:
                                    if ((gBBULogVerbosity & 0x80000000) == 0)
                                    {
                                      long long v111 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
                                      _BBULog(13, 0, v111, "", "Pass Fusing Secure State: (0x%08X)\n", v112, v113, v114, format);
                                      uint64_t v4 = 0;
                                    }
                                  }
                                }
                                else
                                {
                                  dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                                  uint64_t v4 = 0;
                                  if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0) {
                                    goto LABEL_192;
                                  }
                                }
                              }
                              else
                              {
                                if (gBBULogMaskGet(void)::once == -1)
                                {
                                  uint64_t v4 = 125;
                                  if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                                    goto LABEL_202;
                                  }
                                }
                                else
                                {
                                  dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                                  uint64_t v4 = 125;
                                  if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                                    goto LABEL_202;
                                  }
                                }
                                if ((gBBULogVerbosity & 0x80000000) == 0)
                                {
                                  int v116 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
                                  _BBULog(13, 0, v116, "", "Failed to run ETLFusingGetSecureState()\n", v117, v118, v119, v142);
                                }
                              }
LABEL_202:
                              if (__p.__begin_)
                              {
                                __p.__end_ = __p.__begin_;
                                operator delete(__p.__begin_);
                              }
                              if (*(void *)&v144[24])
                              {
                                *(void *)&long long v145 = *(void *)&v144[24];
                                operator delete(*(void **)&v144[24]);
                              }
                              if (*(void *)v144)
                              {
                                *(void *)&v144[8] = *(void *)v144;
                                operator delete(*(void **)v144);
                              }
                              goto LABEL_208;
                            }
                            if (gBBULogMaskGet(void)::once == -1)
                            {
                              uint64_t v4 = 125;
                              if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                                goto LABEL_202;
                              }
                            }
                            else
                            {
                              dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                              uint64_t v4 = 125;
                              if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                                goto LABEL_202;
                              }
                            }
                            if (gBBULogVerbosity < 0) {
                              goto LABEL_202;
                            }
                            uint64_t v48 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
                            uint64_t v52 = "Failed to match both plist and the fusing data\n";
LABEL_201:
                            _BBULog(13, 0, v48, "", v52, v49, v50, v51, v142);
                            goto LABEL_202;
                          }
                          goto LABEL_85;
                        }
                        if (gBBULogMaskGet(void)::once == -1)
                        {
                          int v65 = 1;
                          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                            goto LABEL_146;
                          }
                        }
                        else
                        {
                          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                          int v65 = 1;
                          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                            goto LABEL_146;
                          }
                        }
                        if (gBBULogVerbosity < 0) {
                          goto LABEL_146;
                        }
                        uint64_t v89 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
                        char v90 = HIBYTE(v151[2]);
                        char v91 = (char)v151[0];
                        ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)&v152, @"LSB");
                        v95 = "%s: The MSB of the Plist (0x%08X) is not matched with the MSB of the fusing data from the "
                              "BB (0x%08X) at the address (0x%08X)\n";
                      }
                      else
                      {
                        if (gBBULogMaskGet(void)::once == -1)
                        {
                          int v65 = 1;
                          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                            goto LABEL_146;
                          }
                        }
                        else
                        {
                          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                          int v65 = 1;
                          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
                            goto LABEL_146;
                          }
                        }
                        if (gBBULogVerbosity < 0) {
                          goto LABEL_146;
                        }
                        uint64_t v89 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
                        char v90 = HIBYTE(v151[2]);
                        char v91 = (char)v151[0];
                        ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)&v152, @"LSB");
                        v95 = "%s: The LSB of the Plist (0x%08X) is not matched with the LSB of the fusing data from the "
                              "BB (0x%08X) at the address (0x%08X)\n";
                      }
                      long long v96 = v151;
                      if (v90 < 0) {
                        LOBYTE(v96) = v91;
                      }
                      _BBULog(13, 0, v89, "", v95, v92, v93, v94, (char)v96);
                      int v65 = 1;
                      goto LABEL_146;
                    }
                    uint64_t v64 = v60;
                    while (*(unsigned __int8 *)v63 == *(unsigned __int8 *)v64)
                    {
                      uint64_t v63 = (const void **)((char *)v63 + 1);
                      uint64_t v64 = (void **)((char *)v64 + 1);
                      if (!--v61) {
                        goto LABEL_106;
                      }
                    }
                  }
                }
                uint64_t v58 = (CFPropertyListFormat *)*((void *)v58 + 1);
                if (v58 == &format) {
                  goto LABEL_113;
                }
              }
            }
            if (gBBULogMaskGet(void)::once == -1)
            {
              if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0) {
                goto LABEL_180;
              }
            }
            else
            {
              dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
              if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
              {
LABEL_180:
                if ((gBBULogVerbosity & 0x80000000) == 0)
                {
                  v104 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
                  _BBULog(13, 0, v104, "", "Failed to get dictionary from the fusing profile array\n", v105, v106, v107, v142);
                }
              }
            }
            MEMORY[0x223C1D170](&v152);
            goto LABEL_183;
          }
        }
        else
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
          long long v39 = (const void *)v148;
          if (v148) {
            long long v42 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
          }
          else {
            long long v42 = 0;
          }
          if (v42) {
            goto LABEL_53;
          }
        }
        if (gBBULogMaskGet(void)::once == -1)
        {
          uint64_t v4 = 125;
          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
            goto LABEL_208;
          }
        }
        else
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          uint64_t v4 = 125;
          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
            goto LABEL_208;
          }
        }
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          long long v43 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
          _BBULog(13, 0, v43, "", "Failed to get FusingProfile\n", v44, v45, v46, v142);
        }
LABEL_208:
        if (v39) {
          CFRelease(v39);
        }
        goto LABEL_7;
      }
      if (v152 != v13)
      {
        if (gBBULogMaskGet(void)::once == -1)
        {
          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
            goto LABEL_45;
          }
        }
        else
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
            goto LABEL_45;
          }
        }
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          long long v35 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
          _BBULog(13, 0, v35, "", "Copied length is different from the fusing source's size\n", v36, v37, v38, v142);
        }
        goto LABEL_45;
      }
      CFAllocatorRef v24 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFDataRef v25 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v15, v14);
      if (v25) {
        long long v26 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
      }
      else {
        long long v26 = 0;
      }
      if (v26)
      {
        CFPropertyListFormat format = kCFPropertyListXMLFormat_v1_0;
        CFPropertyListRef v27 = CFPropertyListCreateWithData(v24, v25, 2uLL, &format, 0);
        long long v28 = v27;
        v151[0] = (void *)v27;
        if (v27) {
          long long v29 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
        }
        else {
          long long v29 = 0;
        }
        if (v29) {
          BOOL v30 = v27 == 0;
        }
        else {
          BOOL v30 = 1;
        }
        if (!v30)
        {
          Value = CFDictionaryGetValue((CFDictionaryRef)v27, @"FusingProfile");
          long long v129 = Value;
          if (Value)
          {
            CFTypeID v130 = CFGetTypeID(Value);
            if (v130 == CFArrayGetTypeID())
            {
              CFTypeID v131 = CFGetTypeID(v129);
              if (v131 == CFArrayGetTypeID())
              {
                CFArrayRef Copy = CFArrayCreateCopy(v24, (CFArrayRef)v129);
                v149[0] = Copy;
                if (Copy) {
                  unint64_t v133 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
                }
                else {
                  unint64_t v133 = 0;
                }
                if (v133)
                {
                  unint64_t v148 = (unint64_t)Copy;
                  v149[0] = 0;
LABEL_246:
                  ctu::cf::CFSharedRef<__CFArray const>::~CFSharedRef(v149);
                  goto LABEL_236;
                }
                if (gBBULogMaskGet(void)::once == -1)
                {
                  if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0) {
                    goto LABEL_243;
                  }
                }
                else
                {
                  dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                  if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
                  {
LABEL_243:
                    if ((gBBULogVerbosity & 0x80000000) == 0)
                    {
                      long long v138 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
                      _BBULog(13, 0, v138, "", "Failed to copy the array\n", v139, v140, v141, v142);
                    }
                  }
                }
                unint64_t v148 = 0;
                goto LABEL_246;
              }
            }
          }
          if (gBBULogMaskGet(void)::once == -1)
          {
            if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0) {
              goto LABEL_233;
            }
          }
          else
          {
            dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
            if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
            {
LABEL_233:
              if ((gBBULogVerbosity & 0x80000000) == 0)
              {
                uint64_t v134 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
                _BBULog(13, 0, v134, "", "Failed to get fusing profile from the plist\n", v135, v136, v137, v142);
              }
            }
          }
          unint64_t v148 = 0;
          goto LABEL_236;
        }
        if (gBBULogMaskGet(void)::once == -1)
        {
          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
            goto LABEL_39;
          }
        }
        else
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
            goto LABEL_39;
          }
        }
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          long long v31 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
          _BBULog(13, 0, v31, "", "Failed to create fusing dictionary from the plist\n", v32, v33, v34, v142);
        }
LABEL_39:
        unint64_t v148 = 0;
        if (!v28)
        {
LABEL_237:
          if (v25) {
            CFRelease(v25);
          }
          goto LABEL_46;
        }
LABEL_236:
        CFRelease(v28);
        goto LABEL_237;
      }
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0) {
          goto LABEL_216;
        }
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
        {
LABEL_216:
          if ((gBBULogVerbosity & 0x80000000) == 0)
          {
            long long v120 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
            _BBULog(13, 0, v120, "", "Failed to create a data from the buffer\n", v121, v122, v123, v142);
          }
        }
      }
      unint64_t v148 = 0;
      goto LABEL_237;
    }
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0) {
        goto LABEL_13;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
      {
LABEL_13:
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          int v16 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
          _BBULog(13, 0, v16, "", "Failed to get fusing source\n", v17, v18, v19, v142);
        }
      }
    }
    unint64_t v148 = 0;
    goto LABEL_48;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    uint64_t v4 = 0;
    if ((*(unsigned char *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0) {
      goto LABEL_7;
    }
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    uint64_t v5 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
    _BBULog(13, 0, v5, "", "Fake Fusing is detected. Bypass the fusing check\n", v6, v7, v8, v142);
    uint64_t v4 = 0;
  }
LABEL_7:
  (*(void (**)(void, uint64_t))(**(void **)(a1 + 8) + 16))(*(void *)(a1 + 8), v4);
  return v4;
}

void sub_21DFA3620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v12 = va_arg(va1, const void *);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  ctu::cf::CFSharedRef<__CFArray const>::~CFSharedRef((const void **)(v10 - 176));
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)(v10 - 152));
  ctu::cf::CFSharedRef<__CFData const>::~CFSharedRef((const void **)va);
  if (v9) {
    operator delete(v9);
  }
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_21DFA3714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  BBUEUR20Fusing::FusingData::~FusingData((BBUEUR20Fusing::FusingData *)va);
  ctu::cf::CFSharedRef<__CFArray const>::~CFSharedRef(v15 - 184);
  _Unwind_Resume(a1);
}

void sub_21DFA3734()
{
  if (*(char *)(v0 - 153) < 0) {
    JUMPOUT(0x21DFA375CLL);
  }
  JUMPOUT(0x21DFA3760);
}

void sub_21DFA3748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  if (*(char *)(v8 - 129) < 0) {
    operator delete(*(void **)(v8 - 152));
  }
  MEMORY[0x223C1D170](v8 - 128);
  std::list<std::string>::~list(v8 - 112);
  ctu::cf::CFSharedRef<__CFArray const>::~CFSharedRef((uint64_t *)va);
  BBUEUR20Fusing::FusingData::~FusingData((BBUEUR20Fusing::FusingData *)va1);
  ctu::cf::CFSharedRef<__CFArray const>::~CFSharedRef(v8 - 184);
  _Unwind_Resume(a1);
}

const void **ctu::cf::CFSharedRef<__CFArray const>::~CFSharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void BBUEUR20Fusing::FusingData::~FusingData(BBUEUR20Fusing::FusingData *this)
{
  uint64_t v2 = (void *)*((void *)this + 6);
  if (v2)
  {
    *((void *)this + 7) = v2;
    operator delete(v2);
  }
  CFAllocatorRef v3 = (void *)*((void *)this + 3);
  if (v3)
  {
    *((void *)this + 4) = v3;
    operator delete(v3);
  }
  uint64_t v4 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v4;
    operator delete(v4);
  }
}

uint64_t ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get(uint64_t a1)
{
  return *(void *)a1;
}

const char *BBUEUR20Fusing::getDebugName(BBUEUR20Fusing *this)
{
  return "BBUEUR20Fusing";
}

uint64_t BBUEUR20Fusing::createFusingProgram(BBUEUR20Fusing *this, BBUDataSource *a2)
{
  return 0;
}

void std::vector<unsigned int>::__append(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  std::vector<unsigned int>::pointer end = this->__end_;
  CFURLRef value = this->__end_cap_.__value_;
  uint64_t v6 = end;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(end, 4 * __n);
      uint64_t v6 = &end[__n];
    }
    this->__end_ = v6;
  }
  else
  {
    std::vector<unsigned int>::pointer begin = this->__begin_;
    uint64_t v8 = (char *)end - (char *)this->__begin_;
    uint64_t v9 = v8 >> 2;
    unint64_t v10 = (v8 >> 2) + __n;
    if (v10 >> 62) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = (char *)value - (char *)begin;
    if (v11 >> 1 > v10) {
      unint64_t v10 = v11 >> 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      if (v12 >> 62) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v13 = operator new(4 * v12);
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v14 = &v13[4 * v9];
    size_t v15 = 4 * __n;
    uint64_t v16 = (unsigned int *)&v13[4 * v12];
    bzero(v14, v15);
    uint64_t v17 = (unsigned int *)&v14[v15];
    if (end != begin)
    {
      unint64_t v18 = (char *)end - (char *)begin - 4;
      if (v18 < 0x2C) {
        goto LABEL_31;
      }
      if ((unint64_t)((char *)end - v13 - v8) < 0x20) {
        goto LABEL_31;
      }
      uint64_t v19 = (v18 >> 2) + 1;
      uint64_t v20 = 4 * (v19 & 0x7FFFFFFFFFFFFFF8);
      uint64_t v6 = &end[v20 / 0xFFFFFFFFFFFFFFFCLL];
      v14 -= v20;
      uint64_t v21 = &v13[4 * v9 - 16];
      uint64_t v22 = (long long *)(end - 4);
      uint64_t v23 = v19 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v24 = *v22;
        *(v21 - 1) = *(v22 - 1);
        *uint64_t v21 = v24;
        v21 -= 2;
        v22 -= 2;
        v23 -= 8;
      }
      while (v23);
      if (v19 != (v19 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_31:
        do
        {
          int v25 = *--v6;
          *((_DWORD *)v14 - 1) = v25;
          v14 -= 4;
        }
        while (v6 != begin);
      }
    }
    this->__begin_ = (std::vector<unsigned int>::pointer)v14;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
    {
      operator delete(begin);
    }
  }
}

void std::__shared_ptr_pointer<BBUDataSource *,std::shared_ptr<BBUDataSource>::__shared_ptr_default_delete<BBUDataSource,BBUDataSource>,std::allocator<BBUDataSource>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<BBUDataSource *,std::shared_ptr<BBUDataSource>::__shared_ptr_default_delete<BBUDataSource,BBUDataSource>,std::allocator<BBUDataSource>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<BBUDataSource *,std::shared_ptr<BBUDataSource>::__shared_ptr_default_delete<BBUDataSource,BBUDataSource>,std::allocator<BBUDataSource>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021DFAF15CLL) {
    return a1 + 24;
  }
  if (((v3 & 0x800000021DFAF15CLL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000021DFAF15CLL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021DFAF15CLL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void *eUICC::eUICCVinylMAVValve::GetVinylType@<X0>(eUICC::eUICCVinylMAVValve *this@<X0>, void *a2@<X8>)
{
  int v4 = eUICC::GetVinylType::Perform();
  char v9 = v4;
  __int16 v10 = v5;
  if (v4) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v5 == 1;
  }
  char v12 = v11;
  if (gBBULogMaskGet(void)::once != -1)
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if (v12) {
      goto LABEL_9;
    }
LABEL_11:
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "error %d status 0x%hhx\n", v6, v7, v8, v9);
    return memcpy(a2, (char *)this + 8, 0x11AuLL);
  }
  if ((v12 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "status 0x%hhx cards_type: %hhu \n", v6, v7, v8, v10);
  *((_DWORD *)this + 2) = v10;
  *((unsigned char *)this + 285) = HIBYTE(v10);
  *((unsigned char *)this + 287) = HIBYTE(v10) == 3;
  return memcpy(a2, (char *)this + 8, 0x11AuLL);
}

void *eUICC::eUICCVinylMAVValve::GetData@<X0>(eUICC::eUICCVinylMAVValve *this@<X0>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X7>, void *a5@<X8>)
{
  uint64_t v6 = (int *)((char *)this + 8);
  if (*((unsigned char *)this + 289))
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "eUICCVinylData cache is valid. Using cached data!\n", a2, a3, a4, v14);
    goto LABEL_7;
  }
  *(_OWORD *)((char *)this + 248) = 0u;
  *(_OWORD *)((char *)this + 264) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)uint64_t v6 = 0u;
  *(_OWORD *)((char *)this + 274) = 0u;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v20 = v8;
  long long v21 = v8;
  *(_OWORD *)uint64_t v19 = v8;
  *(_OWORD *)&v19[16] = v8;
  long long v17 = v8;
  long long v18 = v8;
  *(_OWORD *)&v15[128] = v8;
  long long v16 = v8;
  *(_OWORD *)&v15[96] = v8;
  *(_OWORD *)&v15[112] = v8;
  *(_OWORD *)&v15[64] = v8;
  *(_OWORD *)&v15[80] = v8;
  *(_OWORD *)&v15[32] = v8;
  *(_OWORD *)&v15[48] = v8;
  *(_OWORD *)size_t v15 = v8;
  *(_OWORD *)&v15[16] = v8;
  char v9 = (capabilities::updater *)eUICC::GetData::Perform();
  *((_DWORD *)this + 2) = v15[8];
  *(_WORD *)((char *)this + 13) = bswap32(*(unsigned __int16 *)&v15[10]) >> 16;
  *(_OWORD *)((char *)this + 15) = *(_OWORD *)&v15[12];
  *((unsigned char *)this + 31) = v15[28];
  *((_OWORD *)this + 2) = *(_OWORD *)&v15[29];
  *((_OWORD *)this + 3) = *(_OWORD *)&v15[45];
  *((_OWORD *)this + 4) = *(_OWORD *)&v15[61];
  *((_OWORD *)this + 5) = *(_OWORD *)&v15[77];
  *(_DWORD *)((char *)this + 143) = *(_DWORD *)&v15[140];
  *((_OWORD *)this + 7) = *(_OWORD *)&v15[109];
  *((_OWORD *)this + 8) = *(_OWORD *)&v15[125];
  *((_OWORD *)this + 6) = *(_OWORD *)&v15[93];
  *(_DWORD *)((char *)this + 218) = *(_DWORD *)&v19[15];
  *(_OWORD *)((char *)this + 203) = *(_OWORD *)v19;
  *(_OWORD *)((char *)this + 187) = v18;
  *(_OWORD *)((char *)this + 171) = v17;
  *(_OWORD *)((char *)this + 155) = v16;
  *((_WORD *)this + 115) = *(_WORD *)&v19[19];
  *((unsigned char *)this + 250) = v19[31];
  *((_WORD *)this + 124) = *(_WORD *)&v19[29];
  *(_OWORD *)((char *)this + 267) = v21;
  *(_OWORD *)((char *)this + 251) = v20;
  *((unsigned char *)this + 12) = v15[9];
  *(_WORD *)((char *)this + 283) = -21846;
  *((unsigned char *)this + 286) = v15[8] == 4;
  *((unsigned char *)this + 288) = v15[8] == 15;
  if (*((_DWORD *)this + 2) == capabilities::updater::EUICCVinylSuccessStatus(v9))
  {
    *((unsigned char *)this + 289) = 1;
LABEL_7:
    eUICC::logEUICCData(v6);
    return memcpy(a5, v6, 0x11AuLL);
  }
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  }
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "error %d status %u sw1_sw2 0x%x\n", v10, v11, v12, v15[0]);
  return memcpy(a5, v6, 0x11AuLL);
}

uint64_t eUICC::eUICCVinylMAVValve::SetCardMode(uint64_t a1, int a2, char a3)
{
  __src[36] = *MEMORY[0x263EF8340];
  (*(void (**)(void *__return_ptr))(*(void *)a1 + 8))(__src);
  uint64_t v6 = (capabilities::updater *)memcpy((void *)(a1 + 8), __src, 0x11AuLL);
  if (*(_DWORD *)(a1 + 8) != capabilities::updater::EUICCVinylSuccessStatus(v6))
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"outData.Valid()");
    return 18;
  }
  if ((a3 & 1) == 0 && *(unsigned __int8 *)(a1 + 31) == a2)
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "SwitchCardMode: Baseband already in mode %hhu\n", v7, v8, v9, a2);
    return 0;
  }
  int v10 = *(_DWORD *)(a1 + 292);
  __src[0] = *(void *)(a1 + 296);
  LOBYTE(__src[1]) = v10;
  BYTE1(__src[1]) = a2;
  WORD1(__src[1]) = 1;
  HIDWORD(__src[1]) = 10000;
  int v11 = eUICC::SwitchMode::Perform();
  if (v11 || (v12 & 0xFF00000000) != 0x100000000 || a2 != BYTE5(v12))
  {
    if (gBBULogMaskGet(void)::once != -1)
    {
      char v17 = v11;
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      LOBYTE(v11) = v17;
    }
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "SwitchCardMode: Failed err %d status %hhu mode %d sw1 0x%x sw2 0x%x\n", v13, v14, v15, v11);
    return 18;
  }
  return 0;
}

uint64_t eUICC::eUICCVinylMAVValve::InstallTicket(uint64_t a1, CFDataRef *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*a2) {
    uint64_t v8 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    uint64_t v8 = 0;
  }
  if (v8)
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, void, void))(*(void *)a1 + 16))(a1, 0, 0);
    if (v10)
    {
      uint64_t v14 = v10;
      if (gBBULogMaskGet(void)::once != -1) {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      }
      _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"kBBUReturnSuccess == ret");
      return v14;
    }
    else
    {
      CFDataGetBytePtr(*a2);
      CFDataGetLength(*a2);
      int v16 = eUICC::InstallTicket::Perform();
      char v21 = v16;
      if (v16 || (v17 & 0xFF00000000) != 0x100000000)
      {
        if (gBBULogMaskGet(void)::once != -1) {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        }
        _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "InstallTicket failed error %d status %hhu sw1 0x%x sw2 0x%x\n", v18, v19, v20, v21);
        return 16;
      }
      else
      {
        return 0;
      }
    }
  }
  else
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", a6, a7, a8, (char)"installTicket");
    return 2;
  }
}

uint64_t eUICC::eUICCVinylMAVValve::StreamFirmware(_DWORD *a1, uint64_t a2)
{
  __src[36] = *MEMORY[0x263EF8340];
  memset(v54, 170, sizeof(v54));
  (*(void (**)(void **__return_ptr))(**(void **)a2 + 24))(v54);
  uint64_t v3 = v54[1];
  int v4 = v54[0];
  (*(void (**)(void *__return_ptr, _DWORD *))(*(void *)a1 + 8))(__src, a1);
  __int16 v5 = (capabilities::updater *)memcpy(a1 + 2, __src, 0x11AuLL);
  if (a1[2] != capabilities::updater::EUICCVinylSuccessStatus(v5))
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"outData.Valid()");
    uint64_t v19 = 18;
    uint64_t v20 = v54[0];
    if (v54[0]) {
      goto LABEL_56;
    }
    return v19;
  }
  unsigned int v9 = *((unsigned __int8 *)a1 + 284);
  if (!*((unsigned char *)a1 + 284)) {
    unsigned int v9 = *((unsigned __int8 *)a1 + 304);
  }
  unint64_t v10 = v9;
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  }
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "~~~~ MAX APDU PER SET: %zu  ~~~~\n", v6, v7, v8, v10);
  unint64_t v14 = (v3 - v4) >> 5;
  if (v14 % v10) {
    uint64_t v15 = v14 / v10 + 1;
  }
  else {
    uint64_t v15 = v14 / v10;
  }
  if (!v15)
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"apduSetCount");
    uint64_t v19 = 15;
    uint64_t v20 = v54[0];
    if (v54[0]) {
      goto LABEL_56;
    }
    return v19;
  }
  uint64_t v19 = (*(uint64_t (**)(_DWORD *, uint64_t, void))(*(void *)a1 + 16))(a1, 1, 0);
  if (v19)
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"kBBUReturnSuccess == ret");
LABEL_55:
    uint64_t v20 = v54[0];
    if (v54[0]) {
      goto LABEL_56;
    }
    return v19;
  }
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  unsigned int v52 = 0;
  uint64_t v23 = 480;
  if (v10) {
    uint64_t v23 = 32 * v10;
  }
  size_t __sz = v23;
  unint64_t v24 = v14;
  do
  {
    unint64_t v25 = v24 - v10;
    if (v24 >= v10) {
      unint64_t v26 = v10;
    }
    else {
      unint64_t v26 = v24;
    }
    if (v14 - v22 * v10 >= v10) {
      unint64_t v27 = v10;
    }
    else {
      unint64_t v27 = v14 - v22 * v10;
    }
    *(void *)&long long v28 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&__src[1] = v28;
    *(_OWORD *)&__src[3] = v28;
    LODWORD(__src[4]) = 15000;
    __src[2] = operator new[](__sz);
    __src[3] = v10;
    __src[0] = *((void *)a1 + 37);
    LOBYTE(__src[1]) = a1[73];
    WORD1(__src[1]) = v15;
    WORD2(__src[1]) = v22;
    BYTE6(__src[1]) = v27;
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "StreamFirmware set %d/%zu adpusThisSet %zu\n", v29, v30, v31, v22);
    if (v27)
    {
      unint64_t v35 = 0;
      uint64_t v36 = 24;
      uint64_t v37 = v21;
      while (__src[3] >= v35)
      {
        uint64_t v38 = *(void *)((char *)v54[0] + v37);
        uint64_t v39 = *(void *)((char *)v54[0] + v37 + 16);
        uint64_t v40 = *(void *)((char *)v54[0] + v37 + 24);
        unint64_t v41 = (void *)(__src[2] + v36);
        *(v41 - 3) = *(void *)((char *)v54[0] + v37 + 8);
        *(v41 - 2) = v38;
        *(v41 - 1) = v40;
        void *v41 = v39;
        ++v35;
        v37 += 32;
        v36 += 32;
        if (v26 == v35) {
          goto LABEL_37;
        }
      }
      if (gBBULogMaskGet(void)::once != -1) {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      }
      _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v32, v33, v34, (char)"j <= req.apdu_payload.apdu_data_size");
      if (gBBULogMaskGet(void)::once != -1) {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      }
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed SteamAPDU index '%d' is greater than max array size '%zu'", v48, v49, v50, v35);
      char v46 = 0;
      unint64_t v47 = (void *)__src[2];
      __src[2] = 0;
      if (v47) {
LABEL_44:
      }
        operator delete[](v47);
    }
    else
    {
LABEL_37:
      if (eUICC::StreamAPDU::Perform() || (v42 & 0xFF00000000) != 0x100000000)
      {
        if (gBBULogMaskGet(void)::once != -1) {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        }
        _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed StreamAPDU set %d/%zu, error %d status %hhu sw1 0x%x sw2 0x%x\n", v43, v44, v45, v22);
        char v46 = 0;
        unsigned int v52 = 16;
        unint64_t v47 = (void *)__src[2];
        __src[2] = 0;
        if (v47) {
          goto LABEL_44;
        }
      }
      else
      {
        char v46 = 1;
        unint64_t v47 = (void *)__src[2];
        __src[2] = 0;
        if (v47) {
          goto LABEL_44;
        }
      }
    }
    if ((v46 & 1) == 0)
    {
      uint64_t v19 = v52;
      goto LABEL_55;
    }
    ++v22;
    v21 += 32 * v10;
    unint64_t v24 = v25;
  }
  while (v22 != v15);
  uint64_t v19 = 0;
  uint64_t v20 = v54[0];
  if (!v54[0]) {
    return v19;
  }
LABEL_56:
  v54[1] = v20;
  operator delete(v20);
  return v19;
}

void sub_21DFA4964(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  if (!__p) {
    _Unwind_Resume(exception_object);
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::eUICCVinylMAVValve::DeleteProfile(eUICC::eUICCVinylMAVValve *this)
{
  uint64_t result = eUICC::DeleteProfile::Perform();
  char v6 = result;
  if (result || v2 != 1)
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "DeleteProfile failed, error %d status %hhu sw1 0x%x sw2 0x%x\n", v3, v4, v5, v6);
    return 18;
  }
  return result;
}

uint64_t eUICC::eUICCVinylMAVValve::StoreData(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  char v2 = v1;
  uint64_t v4 = v3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  memset(__b, 170, sizeof(__b));
  eUICC::StoreData::Perform();
  if (__b[0] || LOBYTE(__b[3]) != 1)
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v5, v6, v7, (char)"rsp.Valid()");
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to StoreData status %hhu SW1 0x%x SW2 0x%x\n", v9, v10, v11, __b[3]);
    return 18;
  }
  else
  {
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v4, (char *)&__b[4] + 1, (char *)&__b[4] + *(unsigned __int16 *)((char *)&__b[3] + 3) + 1, *(unsigned __int16 *)((char *)&__b[3] + 3));
    uint64_t result = 0;
    *char v2 = bswap32(*(unsigned __int16 *)((char *)&__b[3] + 1)) >> 16;
  }
  return result;
}

uint64_t eUICC::eUICCVinylMAVValve::InitPerso(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  *(void *)&__dst[6] = 0;
  *(void *)long long __dst = 0;
  *(_DWORD *)&__dst[14] = 30000;
  uint64_t v4 = *(void *)(a1 + 296);
  int v5 = *(_DWORD *)(a1 + 292);
  uint64_t v6 = *(const void **)a2;
  unint64_t v8 = *(void *)(a2 + 8) - (void)v6;
  if (v8 >= 0xC) {
    size_t v9 = 12;
  }
  else {
    size_t v9 = v8;
  }
  memcpy(__dst, v6, v9);
  uint64_t v20 = v4;
  char v21 = v5;
  __int16 v22 = 0;
  char v23 = 0;
  __int16 v24 = v9;
  long long v25 = *(_OWORD *)__dst;
  __int16 v26 = *(_WORD *)&__dst[16];
  memset(__dst, 170, 16);
  eUICC::InitPersoSession::Perform();
  if (!*(void *)__dst)
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"rsp");
    uint64_t v13 = 11;
    unint64_t v14 = *(std::__shared_weak_count **)&__dst[8];
    if (!*(void *)&__dst[8]) {
      return v13;
    }
LABEL_19:
    if (!atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
    return v13;
  }
  if (!**(_DWORD **)__dst && *(unsigned char *)(*(void *)__dst + 8) == 1 && *(_WORD *)(*(void *)__dst + 11))
  {
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a3, (char *)(*(void *)__dst + 13), (char *)(*(void *)__dst + 13 + *(unsigned __int16 *)(*(void *)__dst + 11)), *(unsigned __int16 *)(*(void *)__dst + 11));
    uint64_t v13 = 0;
    unint64_t v14 = *(std::__shared_weak_count **)&__dst[8];
    if (!*(void *)&__dst[8]) {
      return v13;
    }
    goto LABEL_19;
  }
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  }
  _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"rsp->Valid() && rsp->contents.rsp_len");
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  }
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to InitPerso status %hhu SW1 0x%x SW2 0x%x rsp_len %u\n", v15, v16, v17, *(unsigned char *)(*(void *)__dst + 8));
  uint64_t v13 = 18;
  unint64_t v14 = *(std::__shared_weak_count **)&__dst[8];
  if (*(void *)&__dst[8]) {
    goto LABEL_19;
  }
  return v13;
}

void sub_21DFA4EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::eUICCVinylMAVValve::AuthPerso(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = operator new(0x818uLL);
  bzero(v6 + 8, 0x810uLL);
  *((_DWORD *)v6 + 516) = 30000;
  *(void *)uint64_t v6 = *(void *)(a1 + 296);
  v6[8] = *(_DWORD *)(a1 + 292);
  uint64_t v7 = *(const void **)a2;
  if (*(void *)(a2 + 8) - *(void *)a2 >= 0x800uLL) {
    size_t v8 = 2048;
  }
  else {
    size_t v8 = *(void *)(a2 + 8) - *(void *)a2;
  }
  memcpy(v6 + 14, v7, v8);
  *((_WORD *)v6 + 6) = v8;
  eUICC::AuthPersoSession::Perform();
  if (!MEMORY[0xAAAAAAAAAAAAAAAA] && MEMORY[0xAAAAAAAAAAAAAAB2] == 1 && MEMORY[0xAAAAAAAAAAAAAAB5])
  {
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a3, (char *)0xAAAAAAAAAAAAAAB7, (char *)(MEMORY[0xAAAAAAAAAAAAAAB5] - 0x5555555555555549), MEMORY[0xAAAAAAAAAAAAAAB5]);
    uint64_t v12 = 0;
  }
  else
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"rsp->Valid() && rsp->contents.rsp_len");
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to AuthenticatePersoDevice status %hhu SW1 0x%x SW2 0x%x rsp_len %u\n", v13, v14, v15, MEMORY[0xAAAAAAAAAAAAAAB2]);
    uint64_t v12 = 18;
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
  operator delete(v6);
  return v12;
}

void sub_21DFA5174(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21DFA5188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)va);
  operator delete(v5);
  _Unwind_Resume(a1);
}

uint64_t eUICC::eUICCVinylMAVValve::FinalizePerso(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  memset(__dst, 0, 266);
  *(_DWORD *)((char *)&__dst[16] + 2) = 30000;
  uint64_t v3 = *(void *)(a1 + 296);
  int v4 = *(_DWORD *)(a1 + 292);
  int v5 = *(const void **)a2;
  unint64_t v7 = *(void *)(a2 + 8) - (void)v5;
  if (v7 >= 0x100) {
    size_t v8 = 256;
  }
  else {
    size_t v8 = v7;
  }
  memcpy(__dst, v5, v8);
  char v9 = *(unsigned char *)(a1 + 290);
  uint64_t v20 = v3;
  char v21 = v4;
  char v22 = 0;
  char v23 = v9;
  char v24 = 0;
  __int16 v25 = v8;
  memcpy(v26, __dst, sizeof(v26));
  *(void *)&__dst[0] = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&__dst[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
  eUICC::FinalizePersoSession::Perform();
  if (!*(void *)&__dst[0])
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"rsp");
    uint64_t v13 = 11;
    uint64_t v14 = (std::__shared_weak_count *)*((void *)&__dst[0] + 1);
    if (!*((void *)&__dst[0] + 1)) {
      return v13;
    }
LABEL_18:
    if (!atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
    return v13;
  }
  if (!**(_DWORD **)&__dst[0] && *(unsigned char *)(*(void *)&__dst[0] + 8) == 1)
  {
    uint64_t v13 = 0;
    uint64_t v14 = (std::__shared_weak_count *)*((void *)&__dst[0] + 1);
    if (!*((void *)&__dst[0] + 1)) {
      return v13;
    }
    goto LABEL_18;
  }
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  }
  _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"rsp->Valid()");
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  }
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to FinalizePersoDevice status %hhu SW1 0x%x SW2 0x%x\n", v15, v16, v17, *(unsigned char *)(*(void *)&__dst[0] + 8));
  uint64_t v13 = 18;
  uint64_t v14 = (std::__shared_weak_count *)*((void *)&__dst[0] + 1);
  if (*((void *)&__dst[0] + 1)) {
    goto LABEL_18;
  }
  return v13;
}

void sub_21DFA5460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::eUICCVinylMAVValve::ValidatePerso(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  memset(v22, 0, 28);
  long long __dst = 0u;
  long long v20 = 0u;
  DWORD1(v22[1]) = 30000;
  uint64_t v4 = *(void *)(a1 + 296);
  int v5 = *(_DWORD *)(a1 + 292);
  uint64_t v6 = *(const void **)a2;
  unint64_t v8 = *(void *)(a2 + 8) - (void)v6;
  if (v8 >= 0x41) {
    size_t v9 = 65;
  }
  else {
    size_t v9 = v8;
  }
  memcpy(&__dst, v6, v9);
  long long v28 = v20;
  long long v29 = v21;
  *(_OWORD *)uint64_t v30 = v22[0];
  *(_OWORD *)&v30[12] = *(_OWORD *)((char *)v22 + 12);
  uint64_t v23 = v4;
  char v24 = v5;
  char v25 = 0;
  __int16 v26 = v9;
  long long v27 = __dst;
  *(void *)&long long __dst = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&__dst + 1) = 0xAAAAAAAAAAAAAAAALL;
  eUICC::ValidatePerso::Perform();
  if (!(void)__dst)
  {
    if (gBBULogMaskGet(void)::once != -1) {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    }
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"rsp");
    uint64_t v13 = 11;
    uint64_t v14 = (std::__shared_weak_count *)*((void *)&__dst + 1);
    if (!*((void *)&__dst + 1)) {
      return v13;
    }
LABEL_19:
    if (!atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
    return v13;
  }
  if (!*(_DWORD *)__dst && *(unsigned char *)(__dst + 8) == 1 && *(_WORD *)(__dst + 11))
  {
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a3, (char *)(__dst + 13), (char *)(__dst + 13 + *(unsigned __int16 *)(__dst + 11)), *(unsigned __int16 *)(__dst + 11));
    uint64_t v13 = 0;
    uint64_t v14 = (std::__shared_weak_count *)*((void *)&__dst + 1);
    if (!*((void *)&__dst + 1)) {
      return v13;
    }
    goto LABEL_19;
  }
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  }
  _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"rsp->Valid() && rsp->contents.rsp_len");
  if (gBBULogMaskGet(void)::once != -1) {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  }
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to AuthenticatePersoDevice status %hhu SW1 0x%x SW2 0x%x rsp_len %u\n", v15, v16, v17, *(unsigned char *)(__dst + 8));
  uint64_t v13 = 18;
  uint64_t v14 = (std::__shared_weak_count *)*((void *)&__dst + 1);
  if (*((void *)&__dst + 1)) {
    goto LABEL_19;
  }
  return v13;
}

void sub_21DFA572C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t AMSupportCopyDataFromAsciiEncodedHex()
{
  return MEMORY[0x270F979C0]();
}

uint64_t AMSupportCreateURLFromString()
{
  return MEMORY[0x270F97A38]();
}

uint64_t AMSupportGetValueForKeyPathInDict()
{
  return MEMORY[0x270F97A90]();
}

uint64_t AMSupportHexAsciiToNumeric()
{
  return MEMORY[0x270F97A98]();
}

uint64_t AMSupportSafeRetain()
{
  return MEMORY[0x270F97B48]();
}

uint64_t AMSupportWriteDataToFileURL()
{
  return MEMORY[0x270F97B50]();
}

uint64_t AMSupportWriteDictionarytoFileURL()
{
  return MEMORY[0x270F97B58]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B48](data, *(void *)&len, md);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B50](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B58](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B60](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x270EE42F8](allocator, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E8](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x270EE49B8](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B98]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x270EE4C50](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x270EE4D60](propertyList, stream, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRun(void)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4EE0](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFShow(CFTypeRef obj)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x270EE5088](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x270EE5148](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5150](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x270EE5230](theString, suffix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x270EE5538](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x270EE5558](stream);
}

CFIndex CFWriteStreamWrite(CFWriteStreamRef stream, const UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x270EE5590](stream, buffer, bufferLength);
}

uint64_t ETLBBGetVersion()
{
  return MEMORY[0x270F91A88]();
}

uint64_t ETLBBSimulateCrash()
{
  return MEMORY[0x270F91AA0]();
}

uint64_t ETLCDMAGetMEID()
{
  return MEMORY[0x270F91AA8]();
}

uint64_t ETLCDMAIsValidMEID()
{
  return MEMORY[0x270F91AB0]();
}

uint64_t ETLCDMAMakeMEID()
{
  return MEMORY[0x270F91AB8]();
}

uint64_t ETLCDMAMakeStringFromMEID()
{
  return MEMORY[0x270F91AC0]();
}

uint64_t ETLDLOADCommandCreateGoRequest()
{
  return MEMORY[0x270F91940]();
}

uint64_t ETLDLOADCommandCreateParametersRequest()
{
  return MEMORY[0x270F91958]();
}

uint64_t ETLDLOADCommandCreateSerialNumberRequest()
{
  return MEMORY[0x270F91960]();
}

uint64_t ETLDLOADCommandCreateVersionRequest()
{
  return MEMORY[0x270F91968]();
}

uint64_t ETLDLOADCommandCreateWriteRequest()
{
  return MEMORY[0x270F91970]();
}

uint64_t ETLDLOADCommandParseACKNAKResponse()
{
  return MEMORY[0x270F91980]();
}

uint64_t ETLDLOADCommandParseParametersResponse()
{
  return MEMORY[0x270F91990]();
}

uint64_t ETLDLOADCommandParseSerialNumberResponse()
{
  return MEMORY[0x270F91998]();
}

uint64_t ETLDLOADCommandParseVersionResponse()
{
  return MEMORY[0x270F919A0]();
}

uint64_t ETLDLOADCommandReceiveSmallWithFlags()
{
  return MEMORY[0x270F919B0]();
}

uint64_t ETLDLOADCommandSend()
{
  return MEMORY[0x270F919C0]();
}

uint64_t ETLDLOADGetNAKReasonAsString()
{
  return MEMORY[0x270F919C8]();
}

uint64_t ETLEFSDUmpCopyCrashLocationDetails()
{
  return MEMORY[0x270F91C68]();
}

uint64_t ETLEFSDumpInfoFree()
{
  return MEMORY[0x270F91C70]();
}

uint64_t ETLEFSDumpInterpret()
{
  return MEMORY[0x270F91C78]();
}

uint64_t ETLEFSearchBasebandCrashReasonM20()
{
  return MEMORY[0x270F91C80]();
}

uint64_t ETLFusingGetFusedData()
{
  return MEMORY[0x270F91AF8]();
}

uint64_t ETLFusingGetSecureState()
{
  return MEMORY[0x270F91B00]();
}

uint64_t ETLFusingProgramQfpromFuse()
{
  return MEMORY[0x270F91B08]();
}

uint64_t ETLFusingProgramTriggerM20()
{
  return MEMORY[0x270F91B10]();
}

uint64_t ETLFusingReadQfpromFuse()
{
  return MEMORY[0x270F91B18]();
}

uint64_t ETLFusingVerifyQfpromFuse()
{
  return MEMORY[0x270F91B20]();
}

uint64_t ETLGSMGetIMEI()
{
  return MEMORY[0x270F91B28]();
}

uint64_t ETLGSMIsValidIMEI()
{
  return MEMORY[0x270F91B30]();
}

uint64_t ETLGSMMakeStringFromIMEI()
{
  return MEMORY[0x270F91B38]();
}

uint64_t ETLMaverickGetBasebandInitStatusEx()
{
  return MEMORY[0x270F91B48]();
}

uint64_t ETLMaverickGetCarrierID()
{
  return MEMORY[0x270F91B50]();
}

uint64_t ETLMaverickGetFusingStatus()
{
  return MEMORY[0x270F91B58]();
}

uint64_t ETLMaverickGetIMEI()
{
  return MEMORY[0x270F91B60]();
}

uint64_t ETLMaverickGetIMEISwVersion()
{
  return MEMORY[0x270F91B68]();
}

uint64_t ETLMaverickGetManifestStatus()
{
  return MEMORY[0x270F91B70]();
}

uint64_t ETLMaverickManifestStatusFree()
{
  return MEMORY[0x270F91B78]();
}

uint64_t ETLMaverickManifestStatusInit()
{
  return MEMORY[0x270F91B88]();
}

uint64_t ETLMaverickReadNonce()
{
  return MEMORY[0x270F91B98]();
}

uint64_t ETLMaverickReadPublicKeyHash()
{
  return MEMORY[0x270F91BA0]();
}

uint64_t ETLMaverickReadSerialNumberAndChipID()
{
  return MEMORY[0x270F91BA8]();
}

uint64_t ETLMaverickSetIMEISwVersion()
{
  return MEMORY[0x270F91BB8]();
}

uint64_t ETLMaverickWriteDefaultNVs()
{
  return MEMORY[0x270F91BC0]();
}

uint64_t ETLMaverickWriteFATPDefaultNVs()
{
  return MEMORY[0x270F91BC8]();
}

uint64_t ETLMaverickWriteFactoryDefaultNVs()
{
  return MEMORY[0x270F91BD0]();
}

uint64_t ETLProvisionFinish()
{
  return MEMORY[0x270F91BD8]();
}

uint64_t ETLProvisionGetStateAsString()
{
  return MEMORY[0x270F91BE0]();
}

uint64_t ETLProvisionGetStatus()
{
  return MEMORY[0x270F91BE8]();
}

uint64_t ETLProvisionParseStatus()
{
  return MEMORY[0x270F91BF0]();
}

uint64_t ETLProvisionStart()
{
  return MEMORY[0x270F91BF8]();
}

uint64_t ETLSAHCommandCreateDone()
{
  return MEMORY[0x270F91C88]();
}

uint64_t ETLSAHCommandCreateHelloResponse()
{
  return MEMORY[0x270F91C90]();
}

uint64_t ETLSAHCommandCreateHelloResponseExt()
{
  return MEMORY[0x270F91C98]();
}

uint64_t ETLSAHCommandCreateMaverickConfigResponse()
{
  return MEMORY[0x270F91CA0]();
}

uint64_t ETLSAHCommandCreateMaverickEraseResponse()
{
  return MEMORY[0x270F91CA8]();
}

uint64_t ETLSAHCommandCreateMaverickHashResponse()
{
  return MEMORY[0x270F91CB0]();
}

uint64_t ETLSAHCommandCreateMaverickRootManifestResponse()
{
  return MEMORY[0x270F91CB8]();
}

uint64_t ETLSAHCommandCreateReset()
{
  return MEMORY[0x270F91CC0]();
}

uint64_t ETLSAHCommandCreateSwitchMode()
{
  return MEMORY[0x270F91CC8]();
}

uint64_t ETLSAHCommandExecute()
{
  return MEMORY[0x270F91CD0]();
}

uint64_t ETLSAHCommandMaverickParseEnd()
{
  return MEMORY[0x270F91CD8]();
}

uint64_t ETLSAHCommandParseChipID()
{
  return MEMORY[0x270F91CE0]();
}

uint64_t ETLSAHCommandParseCommandReady()
{
  return MEMORY[0x270F91CE8]();
}

uint64_t ETLSAHCommandParseDoneResponse()
{
  return MEMORY[0x270F91CF0]();
}

uint64_t ETLSAHCommandParseEndOfImageTransfer()
{
  return MEMORY[0x270F91CF8]();
}

uint64_t ETLSAHCommandParseHello()
{
  return MEMORY[0x270F91D00]();
}

uint64_t ETLSAHCommandParseMaverickConfigQuery()
{
  return MEMORY[0x270F91D08]();
}

uint64_t ETLSAHCommandParseMaverickEraseQuery()
{
  return MEMORY[0x270F91D10]();
}

uint64_t ETLSAHCommandParseMaverickRootManifestQuery()
{
  return MEMORY[0x270F91D18]();
}

uint64_t ETLSAHCommandParseMaverickSendHashesQuery()
{
  return MEMORY[0x270F91D20]();
}

uint64_t ETLSAHCommandParseReadData()
{
  return MEMORY[0x270F91D28]();
}

uint64_t ETLSAHCommandReceive()
{
  return MEMORY[0x270F91D30]();
}

uint64_t ETLSAHCommandSend()
{
  return MEMORY[0x270F91D38]();
}

uint64_t ETLSAHExecutionCommandIDAsString()
{
  return MEMORY[0x270F91D40]();
}

uint64_t ETLSAHGetDebugRecordCount()
{
  return MEMORY[0x270F91D48]();
}

uint64_t ETLSAHGetDebugTable()
{
  return MEMORY[0x270F91D50]();
}

uint64_t ETLSAHGetRecordEx()
{
  return MEMORY[0x270F91D58]();
}

uint64_t ETLSAHModeAsString()
{
  return MEMORY[0x270F91D60]();
}

uint64_t ETLSAHReturnAsString()
{
  return MEMORY[0x270F91D68]();
}

uint64_t ETLSAHSendReadData()
{
  return MEMORY[0x270F91D70]();
}

uint64_t HDLCFrameFree()
{
  return MEMORY[0x270F92020]();
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x270EF47B0](*(void *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

uint64_t KTLBspSetNvItemsToState()
{
  return MEMORY[0x270F92838]();
}

uint64_t KTLCDProcessCoredumpEntry()
{
  return MEMORY[0x270F92840]();
}

uint64_t KTLCDSendEndCoredumpCommand()
{
  return MEMORY[0x270F92848]();
}

uint64_t KTLCDSendStartCoredumpCommand()
{
  return MEMORY[0x270F92850]();
}

uint64_t KTLCloseChannel()
{
  return MEMORY[0x270F92858]();
}

uint64_t KTLCpsGetSvn()
{
  return MEMORY[0x270F92860]();
}

uint64_t KTLCpsSetSvn()
{
  return MEMORY[0x270F92868]();
}

uint64_t KTLCreateEBLLengthPacket()
{
  return MEMORY[0x270F92870]();
}

uint64_t KTLDebugRegisterDelegate()
{
  return MEMORY[0x270F92878]();
}

uint64_t KTLDebugSetFlags()
{
  return MEMORY[0x270F92880]();
}

uint64_t KTLEBLCreateDoneACKPacket()
{
  return MEMORY[0x270F92888]();
}

uint64_t KTLEBLCreateStartACKPacket()
{
  return MEMORY[0x270F92890]();
}

uint64_t KTLEBLParseDone()
{
  return MEMORY[0x270F92898]();
}

uint64_t KTLEBLParseReadfileExt()
{
  return MEMORY[0x270F928A0]();
}

uint64_t KTLEBLParseStartInfo()
{
  return MEMORY[0x270F928A8]();
}

uint64_t KTLEBLReceivePacket()
{
  return MEMORY[0x270F928B0]();
}

uint64_t KTLEBLSendPacket()
{
  return MEMORY[0x270F928B8]();
}

uint64_t KTLEBLSendReadfileData()
{
  return MEMORY[0x270F928C0]();
}

uint64_t KTLFinishProvision()
{
  return MEMORY[0x270F928C8]();
}

uint64_t KTLGetFirmwareVersion()
{
  return MEMORY[0x270F928D0]();
}

uint64_t KTLGetIMEI_V2()
{
  return MEMORY[0x270F928D8]();
}

uint64_t KTLGetMEID()
{
  return MEMORY[0x270F928E0]();
}

uint64_t KTLGetManifestStatus()
{
  return MEMORY[0x270F928E8]();
}

uint64_t KTLGetPersonalizationInfo()
{
  return MEMORY[0x270F928F0]();
}

uint64_t KTLInitOptions()
{
  return MEMORY[0x270F928F8]();
}

uint64_t KTLIsValidIMEIString()
{
  return MEMORY[0x270F92900]();
}

uint64_t KTLIsValidMEIDString()
{
  return MEMORY[0x270F92908]();
}

uint64_t KTLNVMReadUpdateHeader()
{
  return MEMORY[0x270F92910]();
}

uint64_t KTLNVMSendRegister()
{
  return MEMORY[0x270F92920]();
}

uint64_t KTLNVMSendSnapshot()
{
  return MEMORY[0x270F92928]();
}

uint64_t KTLNVMSendUpdateAck()
{
  return MEMORY[0x270F92930]();
}

uint64_t KTLOpenChannel()
{
  return MEMORY[0x270F92938]();
}

uint64_t KTLPSIFormatEnhancedCommand()
{
  return MEMORY[0x270F92940]();
}

uint64_t KTLPSIFormatEnhancedCommandMrcData()
{
  return MEMORY[0x270F92948]();
}

uint64_t KTLPSIReadMrcResponse()
{
  return MEMORY[0x270F92950]();
}

uint64_t KTLPSIReadResponse()
{
  return MEMORY[0x270F92958]();
}

uint64_t KTLPSISendEnhancedCommand()
{
  return MEMORY[0x270F92960]();
}

uint64_t KTLPSISendMrcTrainingCommand()
{
  return MEMORY[0x270F92968]();
}

uint64_t KTLParseEBLDownloadResult()
{
  return MEMORY[0x270F92970]();
}

uint64_t KTLParseEBLLengthAck()
{
  return MEMORY[0x270F92978]();
}

uint64_t KTLParsePSIICEHashResponse()
{
  return MEMORY[0x270F92980]();
}

uint64_t KTLParsePSIICEHashResponseSha384()
{
  return MEMORY[0x270F92988]();
}

uint64_t KTLParsePSIICEPersonalizionInfo()
{
  return MEMORY[0x270F92990]();
}

uint64_t KTLParsePSIRunning()
{
  return MEMORY[0x270F92998]();
}

uint64_t KTLPing()
{
  return MEMORY[0x270F929A0]();
}

uint64_t KTLRawReceiveData()
{
  return MEMORY[0x270F929A8]();
}

uint64_t KTLRawSendData()
{
  return MEMORY[0x270F929B0]();
}

uint64_t KTLSecGetChipId()
{
  return MEMORY[0x270F929B8]();
}

uint64_t KTLSecGetFusingState()
{
  return MEMORY[0x270F929C0]();
}

uint64_t KTLSecGetPkHash()
{
  return MEMORY[0x270F929C8]();
}

uint64_t KTLSecGetSNUM()
{
  return MEMORY[0x270F929D0]();
}

uint64_t KTLSendEBLImage()
{
  return MEMORY[0x270F929D8]();
}

uint64_t KTLSendEBLImageNoXor()
{
  return MEMORY[0x270F929E0]();
}

uint64_t KTLStartProvision()
{
  return MEMORY[0x270F929E8]();
}

uint64_t PSIModeDescription()
{
  return MEMORY[0x270F929F0]();
}

uint64_t RPCopyProxyDictionary()
{
  return MEMORY[0x270F96718]();
}

uint64_t RPRegisterForAvailability()
{
  return MEMORY[0x270F96730]();
}

uint64_t RPRegistrationInvalidate()
{
  return MEMORY[0x270F96738]();
}

uint64_t RPRegistrationResume()
{
  return MEMORY[0x270F96748]();
}

uint64_t TelephonyBasebandCrashModemWithSPMI()
{
  return MEMORY[0x270F967D0]();
}

uint64_t TelephonyBasebandCrashModemWithSPMIWithReason()
{
  return MEMORY[0x270F967D8]();
}

uint64_t TelephonyBasebandCreateController()
{
  return MEMORY[0x270F967E0]();
}

uint64_t TelephonyBasebandForceResetModem()
{
  return MEMORY[0x270F967E8]();
}

uint64_t TelephonyBasebandGetPMUTrace()
{
  return MEMORY[0x270F96810]();
}

uint64_t TelephonyBasebandGetReset()
{
  return MEMORY[0x270F96820]();
}

uint64_t TelephonyBasebandPCITransportCreate()
{
  return MEMORY[0x270F964F0]();
}

uint64_t TelephonyBasebandPCITransportInitParameters()
{
  return MEMORY[0x270F964F8]();
}

uint64_t TelephonyBasebandPMUTraceToString()
{
  return MEMORY[0x270F96828]();
}

uint64_t TelephonyBasebandPowerOnModem()
{
  return MEMORY[0x270F96838]();
}

uint64_t TelephonyBasebandPowercycleModem()
{
  return MEMORY[0x270F96840]();
}

uint64_t TelephonyBasebandRegisterForReset()
{
  return MEMORY[0x270F96850]();
}

uint64_t TelephonyBasebandResetModem()
{
  return MEMORY[0x270F96858]();
}

uint64_t TelephonyBasebandSetBasebandProperty()
{
  return MEMORY[0x270F96868]();
}

uint64_t TelephonyBasebandSetBasebandState()
{
  return MEMORY[0x270F96870]();
}

uint64_t TelephonyBasebandSetModemCoredumpGPIO()
{
  return MEMORY[0x270F96888]();
}

uint64_t TelephonyCapabilitiesGetHardwareModel()
{
  return MEMORY[0x270F97128]();
}

uint64_t TelephonyCapabilitiesSetHardwareModelFromString()
{
  return MEMORY[0x270F97148]();
}

uint64_t TelephonyRadiosGetHardwareConfig()
{
  return MEMORY[0x270F97150]();
}

uint64_t TelephonyRadiosGetProduct()
{
  return MEMORY[0x270F97158]();
}

uint64_t TelephonyUtilBinToHex()
{
  return MEMORY[0x270F97170]();
}

uint64_t TelephonyUtilDebugRegisterDelegate()
{
  return MEMORY[0x270F97178]();
}

uint64_t TelephonyUtilDebugSetFlags()
{
  return MEMORY[0x270F97180]();
}

uint64_t TelephonyUtilHexToBin()
{
  return MEMORY[0x270F97198]();
}

uint64_t TelephonyUtilLogBinaryToBuffer()
{
  return MEMORY[0x270F971B8]();
}

uint64_t TelephonyUtilRingBufferInitialize()
{
  return MEMORY[0x270F971D8]();
}

uint64_t TelephonyUtilStrlcpy()
{
  return MEMORY[0x270F97208]();
}

uint64_t TelephonyUtilSystemMachTime()
{
  return MEMORY[0x270F97210]();
}

uint64_t TelephonyUtilTransportCreateWithFD()
{
  return MEMORY[0x270F97220]();
}

uint64_t TelephonyUtilTransportFree()
{
  return MEMORY[0x270F97228]();
}

uint64_t TelephonyUtilWriteToCompletion()
{
  return MEMORY[0x270F97238]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
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

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t ICE_FILER_read()
{
  return MEMORY[0x270F929F8]();
}

uint64_t ACFUCommon::PersonalizeParams::logParameters(ACFUCommon::PersonalizeParams *this)
{
  return MEMORY[0x270F0D180](this);
}

uint64_t ACFUCommon::PersonalizeParams::getParametersDictionary(ACFUCommon::PersonalizeParams *this)
{
  return MEMORY[0x270F0D188](this);
}

uint64_t ACFUCommon::PersonalizeParams::PersonalizeParams()
{
  return MEMORY[0x270F0D198]();
}

uint64_t ACFUCommon::createFileDatafromFilePath(ACFUCommon *this, const __CFString *a2)
{
  return MEMORY[0x270F0D1A8](this, a2);
}

uint64_t ACFUCommon::createURLByAppendingStrings(ACFUCommon *this, const __CFString *a2, const __CFString *a3)
{
  return MEMORY[0x270F0D1B8](this, a2, a3);
}

uint64_t ACFULogging::handleMessage()
{
  return MEMORY[0x270F0D1C0]();
}

uint64_t ACFULogging::getLogInstance(ACFULogging *this)
{
  return MEMORY[0x270F0D1D8](this);
}

uint64_t ACFULogging::handleMessageBinary()
{
  return MEMORY[0x270F0D1E0]();
}

uint64_t ACFULogging::handleMessageCFType()
{
  return MEMORY[0x270F0D1F8]();
}

uint64_t ACFULogging::initLog(ACFULogging *this, const __CFDictionary *a2, void (*a3)(void *, const char *), void *a4)
{
  return MEMORY[0x270F0D200](this, a2, a3, a4);
}

uint64_t ACFURestore::performCmd(ACFURestore *this)
{
  return MEMORY[0x270F0D228](this);
}

uint64_t ACFURestore::getStepName()
{
  return MEMORY[0x270F0D230]();
}

uint64_t ACFURestore::isPreflight(ACFURestore *this)
{
  return MEMORY[0x270F0D238](this);
}

uint64_t ACFURestore::isPostSealing(ACFURestore *this)
{
  return MEMORY[0x270F0D248](this);
}

uint64_t ACFURestore::isPreflighted(ACFURestore *this)
{
  return MEMORY[0x270F0D258](this);
}

uint64_t ACFURestore::executeCommand()
{
  return MEMORY[0x270F0D260]();
}

uint64_t ACFURestore::getErrorHandle(ACFURestore *this)
{
  return MEMORY[0x270F0D270](this);
}

uint64_t ACFURestore::restoreCommand(ACFURestore *this, const __CFString *a2)
{
  return MEMORY[0x270F0D280](this, a2);
}

uint64_t ACFURestore::isInternalBuild(ACFURestore *this)
{
  return MEMORY[0x270F0D290](this);
}

uint64_t ACFURestore::isRestoreComplete(ACFURestore *this)
{
  return MEMORY[0x270F0D298](this);
}

uint64_t ACFURestore::getCurrentUpdateStep(ACFURestore *this)
{
  return MEMORY[0x270F0D2A8](this);
}

uint64_t ACFURestore::init(ACFURestore *this, const __CFDictionary *a2, const void *a3)
{
  return MEMORY[0x270F0D2C0](this, a2, a3);
}

uint64_t ACFURestore::isNeRDOS(ACFURestore *this)
{
  return MEMORY[0x270F0D2C8](this);
}

uint64_t ACFURestore::queryCmd(ACFURestore *this)
{
  return MEMORY[0x270F0D2D8](this);
}

void ACFURestore::ACFURestore(ACFURestore *this)
{
}

uint64_t RestoreStep::operator=()
{
  return MEMORY[0x270F0D310]();
}

uint64_t ACFURTKitROM::bootFirmware(ACFURTKitROM *this)
{
  return MEMORY[0x270F0D340](this);
}

uint64_t ACFURTKitROM::create()
{
  return MEMORY[0x270F0D348]();
}

void IOACIPCClass::IOACIPCClass(IOACIPCClass *this)
{
}

uint64_t capabilities::programmer::commandTimeout(capabilities::programmer *this)
{
  return MEMORY[0x270F96898](this);
}

uint64_t capabilities::programmer::connectTimeout(capabilities::programmer *this)
{
  return MEMORY[0x270F968A0](this);
}

uint64_t capabilities::programmer::connectAttemptCount(capabilities::programmer *this)
{
  return MEMORY[0x270F968A8](this);
}

uint64_t capabilities::pci::supportsPCIAudio(capabilities::pci *this)
{
  return MEMORY[0x270F96C68](this);
}

uint64_t capabilities::diag::supportedInterfaces(capabilities::diag *this)
{
  return MEMORY[0x270F96C90](this);
}

uint64_t capabilities::diag::operator&()
{
  return MEMORY[0x270F96C98]();
}

uint64_t capabilities::euicc::supportsLegacyUpdater(capabilities::euicc *this)
{
  return MEMORY[0x270F96CB8](this);
}

uint64_t capabilities::radio::supportsSDIReset(capabilities::radio *this)
{
  return MEMORY[0x270F96CD8](this);
}

uint64_t capabilities::radio::personalizedFirmwarePath(capabilities::radio *this)
{
  return MEMORY[0x270F96CF8](this);
}

uint64_t capabilities::radio::supportsBasebandStateController(capabilities::radio *this)
{
  return MEMORY[0x270F96D10](this);
}

uint64_t capabilities::radio::ice(capabilities::radio *this)
{
  return MEMORY[0x270F96D18](this);
}

uint64_t capabilities::radio::chipID(capabilities::radio *this)
{
  return MEMORY[0x270F96D20](this);
}

uint64_t capabilities::radio::vendor(capabilities::radio *this)
{
  return MEMORY[0x270F96D28](this);
}

uint64_t capabilities::radio::maverick(capabilities::radio *this)
{
  return MEMORY[0x270F96D38](this);
}

uint64_t capabilities::fusing::commandTimeout(capabilities::fusing *this)
{
  return MEMORY[0x270F96DB8](this);
}

uint64_t capabilities::fusing::modeSetTimeout(capabilities::fusing *this)
{
  return MEMORY[0x270F96DC0](this);
}

uint64_t capabilities::updater::getAOPType(capabilities::updater *this)
{
  return MEMORY[0x270F96DE0](this);
}

uint64_t capabilities::updater::getActType(capabilities::updater *this)
{
  return MEMORY[0x270F96DE8](this);
}

uint64_t capabilities::updater::getCalType(capabilities::updater *this)
{
  return MEMORY[0x270F96DF0](this);
}

uint64_t capabilities::updater::getHYPType(capabilities::updater *this)
{
  return MEMORY[0x270F96DF8](this);
}

uint64_t capabilities::updater::getMBAType(capabilities::updater *this)
{
  return MEMORY[0x270F96E00](this);
}

uint64_t capabilities::updater::getPacType(capabilities::updater *this)
{
  return MEMORY[0x270F96E08](this);
}

uint64_t capabilities::updater::getRPMType(capabilities::updater *this)
{
  return MEMORY[0x270F96E10](this);
}

uint64_t capabilities::updater::getSBLType(capabilities::updater *this)
{
  return MEMORY[0x270F96E18](this);
}

uint64_t capabilities::updater::getSECType(capabilities::updater *this)
{
  return MEMORY[0x270F96E20](this);
}

uint64_t capabilities::updater::getWDTType(capabilities::updater *this)
{
  return MEMORY[0x270F96E28](this);
}

uint64_t capabilities::updater::resetDelay(capabilities::updater *this)
{
  return MEMORY[0x270F96E30](this);
}

uint64_t capabilities::updater::CALFileName(capabilities::updater *this)
{
  return MEMORY[0x270F96E38](this);
}

uint64_t capabilities::updater::PACFileName(capabilities::updater *this)
{
  return MEMORY[0x270F96E40](this);
}

uint64_t capabilities::updater::getACDBType(capabilities::updater *this)
{
  return MEMORY[0x270F96E48](this);
}

uint64_t capabilities::updater::getAPDPType(capabilities::updater *this)
{
  return MEMORY[0x270F96E50](this);
}

uint64_t capabilities::updater::getAPPSType(capabilities::updater *this)
{
  return MEMORY[0x270F96E58](this);
}

uint64_t capabilities::updater::getDSP3Type(capabilities::updater *this)
{
  return MEMORY[0x270F96E60](this);
}

uint64_t capabilities::updater::getEFS1Type(capabilities::updater *this)
{
  return MEMORY[0x270F96E68](this);
}

uint64_t capabilities::updater::getEFS2Type(capabilities::updater *this)
{
  return MEMORY[0x270F96E70](this);
}

uint64_t capabilities::updater::getEFS3Type(capabilities::updater *this)
{
  return MEMORY[0x270F96E78](this);
}

uint64_t capabilities::updater::getProvType(capabilities::updater *this)
{
  return MEMORY[0x270F96E80](this);
}

uint64_t capabilities::updater::getUEFIType(capabilities::updater *this)
{
  return MEMORY[0x270F96E88](this);
}

uint64_t capabilities::updater::pingTimeout(capabilities::updater *this)
{
  return MEMORY[0x270F96E90](this);
}

uint64_t capabilities::updater::PROVFileName(capabilities::updater *this)
{
  return MEMORY[0x270F96E98](this);
}

uint64_t capabilities::updater::getBBCFGType(capabilities::updater *this)
{
  return MEMORY[0x270F96EA0](this);
}

uint64_t capabilities::updater::getDEVCFGType(capabilities::updater *this)
{
  return MEMORY[0x270F96EA8](this);
}

uint64_t capabilities::updater::getDigestType(capabilities::updater *this)
{
  return MEMORY[0x270F96EB0](this);
}

uint64_t capabilities::updater::getFusingType(capabilities::updater *this)
{
  return MEMORY[0x270F96EB8](this);
}

uint64_t capabilities::updater::getLoaderType(capabilities::updater *this)
{
  return MEMORY[0x270F96EC0](this);
}

uint64_t capabilities::updater::getMDMDDRType(capabilities::updater *this)
{
  return MEMORY[0x270F96EC8](this);
}

uint64_t capabilities::updater::getXblCfgType(capabilities::updater *this)
{
  return MEMORY[0x270F96ED0](this);
}

uint64_t capabilities::updater::getOEMMiscType(capabilities::updater *this)
{
  return MEMORY[0x270F96ED8](this);
}

uint64_t capabilities::updater::getQDSP6SWType(capabilities::updater *this)
{
  return MEMORY[0x270F96EE0](this);
}

uint64_t capabilities::updater::getQTIMiscType(capabilities::updater *this)
{
  return MEMORY[0x270F96EE8](this);
}

uint64_t capabilities::updater::supportsEBLXor(capabilities::updater *this)
{
  return MEMORY[0x270F96EF0](this);
}

uint64_t capabilities::updater::ICENVMFSizeBytes()
{
  return MEMORY[0x270F96EF8]();
}

uint64_t capabilities::updater::NVRestoreTimeout(capabilities::updater *this)
{
  return MEMORY[0x270F96F00](this);
}

uint64_t capabilities::updater::pingAttemptCount(capabilities::updater *this)
{
  return MEMORY[0x270F96F08](this);
}

uint64_t capabilities::updater::supportsBBFusing(capabilities::updater *this)
{
  return MEMORY[0x270F96F10](this);
}

uint64_t capabilities::updater::ARICommandTimeout(capabilities::updater *this)
{
  return MEMORY[0x270F96F18](this);
}

uint64_t capabilities::updater::EUICCAttemptCount(capabilities::updater *this)
{
  return MEMORY[0x270F96F20](this);
}

uint64_t capabilities::updater::getProgrammerType(capabilities::updater *this)
{
  return MEMORY[0x270F96F28](this);
}

uint64_t capabilities::updater::getXblSupportType(capabilities::updater *this)
{
  return MEMORY[0x270F96F30](this);
}

uint64_t capabilities::updater::supportsUEFIImage(capabilities::updater *this)
{
  return MEMORY[0x270F96F38](this);
}

uint64_t capabilities::updater::bootupTimeMaxValue(capabilities::updater *this)
{
  return MEMORY[0x270F96F40](this);
}

uint64_t capabilities::updater::getFirmwareVersion(capabilities::updater *this)
{
  return MEMORY[0x270F96F48](this);
}

uint64_t capabilities::updater::getProvisionerType(capabilities::updater *this)
{
  return MEMORY[0x270F96F50](this);
}

uint64_t capabilities::updater::shouldAllowUnfused(capabilities::updater *this)
{
  return MEMORY[0x270F96F58](this);
}

uint64_t capabilities::updater::supportsBbcfgImage(capabilities::updater *this)
{
  return MEMORY[0x270F96F60](this);
}

uint64_t capabilities::updater::supportsHashSha384(capabilities::updater *this)
{
  return MEMORY[0x270F96F68](this);
}

uint64_t capabilities::updater::getUpdateSourceType(capabilities::updater *this)
{
  return MEMORY[0x270F96F70](this);
}

uint64_t capabilities::updater::requiresMRCTraining(capabilities::updater *this)
{
  return MEMORY[0x270F96F78](this);
}

uint64_t capabilities::updater::supportsXblCfgImage(capabilities::updater *this)
{
  return MEMORY[0x270F96F80](this);
}

uint64_t capabilities::updater::BBUFSPartitionSizeMB(capabilities::updater *this)
{
  return MEMORY[0x270F96F88](this);
}

uint64_t capabilities::updater::EUICCCertIDSizeBytes(capabilities::updater *this)
{
  return MEMORY[0x270F96F90](this);
}

uint64_t capabilities::updater::getCommunicationType(capabilities::updater *this)
{
  return MEMORY[0x270F96F98](this);
}

uint64_t capabilities::updater::getFusingProgramType(capabilities::updater *this)
{
  return MEMORY[0x270F96FA0](this);
}

uint64_t capabilities::updater::loaderCommandTimeout(capabilities::updater *this)
{
  return MEMORY[0x270F96FA8](this);
}

uint64_t capabilities::updater::getInitializerVersion(capabilities::updater *this)
{
  return MEMORY[0x270F96FB0](this);
}

uint64_t capabilities::updater::loaderConnectAttempts(capabilities::updater *this)
{
  return MEMORY[0x270F96FB8](this);
}

uint64_t capabilities::updater::supportsDDRDataSaving(capabilities::updater *this)
{
  return MEMORY[0x270F96FC0](this);
}

uint64_t capabilities::updater::supportsMHIBootLogger(capabilities::updater *this)
{
  return MEMORY[0x270F96FC8](this);
}

uint64_t capabilities::updater::shouldBailOnEUICCError(capabilities::updater *this)
{
  return MEMORY[0x270F96FD0](this);
}

uint64_t capabilities::updater::shouldStripFDRDataOnAP(capabilities::updater *this)
{
  return MEMORY[0x270F96FD8](this);
}

uint64_t capabilities::updater::EUICCVinylSuccessStatus(capabilities::updater *this)
{
  return MEMORY[0x270F96FE0](this);
}

uint64_t capabilities::updater::manifestCheckRetryCount(capabilities::updater *this)
{
  return MEMORY[0x270F96FE8](this);
}

uint64_t capabilities::updater::repersonalizeLimitCount(capabilities::updater *this)
{
  return MEMORY[0x270F96FF0](this);
}

uint64_t capabilities::updater::supportsXblSupportImage(capabilities::updater *this)
{
  return MEMORY[0x270F96FF8](this);
}

uint64_t capabilities::updater::supportsDualIMEIProvision(capabilities::updater *this)
{
  return MEMORY[0x270F97000](this);
}

uint64_t capabilities::updater::supportsNVSettingOQCMagic(capabilities::updater *this)
{
  return MEMORY[0x270F97008](this);
}

uint64_t capabilities::updater::provisioningCommandTimeout(capabilities::updater *this)
{
  return MEMORY[0x270F97010](this);
}

uint64_t capabilities::updater::shouldSkipRestoreForUnfused(capabilities::updater *this)
{
  return MEMORY[0x270F97018](this);
}

uint64_t capabilities::updater::shouldWaitForReadyAfterBoot(capabilities::updater *this)
{
  return MEMORY[0x270F97020](this);
}

uint64_t capabilities::updater::getBasebandMigrationDataType(capabilities::updater *this)
{
  return MEMORY[0x270F97028](this);
}

uint64_t capabilities::updater::getPersonalizationParameters(capabilities::updater *this)
{
  return MEMORY[0x270F97030](this);
}

uint64_t capabilities::updater::initialStagePingAttemptCount(capabilities::updater *this)
{
  return MEMORY[0x270F97038](this);
}

uint64_t capabilities::updater::shouldBailOnNoManifestHashes(capabilities::updater *this)
{
  return MEMORY[0x270F97040](this);
}

uint64_t capabilities::updater::getLoaderProgressBarTimesType(capabilities::updater *this)
{
  return MEMORY[0x270F97048](this);
}

uint64_t capabilities::updater::intermittentFailureRetryCount(capabilities::updater *this)
{
  return MEMORY[0x270F97050](this);
}

uint64_t capabilities::updater::personalizationCommandTimeout(capabilities::updater *this)
{
  return MEMORY[0x270F97058](this);
}

uint64_t capabilities::updater::shouldOnlySyncDynamicOnShutdown(capabilities::updater *this)
{
  return MEMORY[0x270F97060](this);
}

uint64_t capabilities::updater::getProgrammerProgressBarTimesType(capabilities::updater *this)
{
  return MEMORY[0x270F97068](this);
}

uint64_t capabilities::updater::supportsFATPCalibrationManifestStatus(capabilities::updater *this)
{
  return MEMORY[0x270F97070](this);
}

uint64_t capabilities::updater::hasMEID(capabilities::updater *this)
{
  return MEMORY[0x270F97078](this);
}

uint64_t capabilities::updater::getTZType(capabilities::updater *this)
{
  return MEMORY[0x270F97080](this);
}

uint64_t capabilities::updater::pingDelay(capabilities::updater *this)
{
  return MEMORY[0x270F97088](this);
}

uint64_t capabilities::coredump::supportsGPIOSignalling(capabilities::coredump *this)
{
  return MEMORY[0x270F97098](this);
}

uint64_t capabilities::coredump::supportsSPMISignalling(capabilities::coredump *this)
{
  return MEMORY[0x270F970A0](this);
}

uint64_t RTKitFirmware::getFileOffsetByFileName()
{
  return MEMORY[0x270F0D378]();
}

uint64_t RTKitFirmware::create()
{
  return MEMORY[0x270F0D388]();
}

{
  return MEMORY[0x270F0D398]();
}

uint64_t ACFUDataAccess::createPersonalizedFirmwarePath(ACFUDataAccess *this, const __CFString *a2)
{
  return MEMORY[0x270F0D3B0](this, a2);
}

uint64_t ACFUDiagnostics::copyDiagnosticsPath(ACFUDiagnostics *this)
{
  return MEMORY[0x270F0D3C0](this);
}

uint64_t ACFUDiagnostics::create(ACFUDiagnostics *this, const __CFString *a2)
{
  return MEMORY[0x270F0D3D0](this, a2);
}

uint64_t ACFUDiagnostics::perform(ACFUDiagnostics *this)
{
  return MEMORY[0x270F0D3E0](this);
}

void ACFUDiagnostics::~ACFUDiagnostics(ACFUDiagnostics *this)
{
}

uint64_t ACFUSynchronize::Syncher::wait()
{
  return MEMORY[0x270F0D430]();
}

uint64_t ACFUSynchronize::Syncher::notify()
{
  return MEMORY[0x270F0D448]();
}

uint64_t ACFUDataContainer::create(ACFUDataContainer *this, const __CFString *a2)
{
  return MEMORY[0x270F0D450](this, a2);
}

uint64_t ACFUDataContainer::create(ACFUDataContainer *this, const __CFData *a2)
{
  return MEMORY[0x270F0D458](this, a2);
}

void ACFUDataContainer::~ACFUDataContainer(ACFUDataContainer *this)
{
}

uint64_t ACFUACIPCTransport::readRegister(ACFUACIPCTransport *this, IOACIPCClass **a2, uint64_t a3, unsigned __int8 *a4, unsigned int *a5)
{
  return MEMORY[0x270F0D468](this, a2, a3, a4, a5);
}

uint64_t ACFUACIPCTransport::processRTIStage()
{
  return MEMORY[0x270F0D470]();
}

uint64_t ACFUACIPCTransport::generateBootNonce(ACFUACIPCTransport *this, IOACIPCClass **a2)
{
  return MEMORY[0x270F0D478](this, a2);
}

uint64_t ACFUACIPCTransport::loadImageOnBTIStage()
{
  return MEMORY[0x270F0D480]();
}

uint64_t ACFUACIPCTransport::init()
{
  return MEMORY[0x270F0D488]();
}

void ACFUACIPCTransport::ACFUACIPCTransport(ACFUACIPCTransport *this)
{
}

void ACFUACIPCTransport::~ACFUACIPCTransport(ACFUACIPCTransport *this)
{
}

uint64_t HSFilerReadSession::readWithFile()
{
  return MEMORY[0x270F92048]();
}

uint64_t HSFilerReadSession::create()
{
  return MEMORY[0x270F92050]();
}

uint64_t ACFURTKitNVRMGenerator::copy(ACFURTKitNVRMGenerator *this)
{
  return MEMORY[0x270F0D4A0](this);
}

uint64_t ACFURTKitNVRMGenerator::create()
{
  return MEMORY[0x270F0D4A8]();
}

void ACFURTKitNVRMGenerator::~ACFURTKitNVRMGenerator(ACFURTKitNVRMGenerator *this)
{
}

uint64_t Ari::Log(Ari *this, uint64_t a2, const char *a3, ...)
{
  return MEMORY[0x270F8CD00](this, a2, a3);
}

uint64_t Bsp::ARICommandDriver::SysGetInfoV2()
{
  return MEMORY[0x270F92A00]();
}

uint64_t Bsp::ARICommandDriver::GetNvItemsSetting()
{
  return MEMORY[0x270F92A08]();
}

uint64_t Bsp::ARICommandDriver::GetCurrentBootState()
{
  return MEMORY[0x270F92A10]();
}

uint64_t Bsp::ARICommandDriver::ARICommandDriver()
{
  return MEMORY[0x270F92A18]();
}

void Bsp::ARICommandDriver::~ARICommandDriver(Bsp::ARICommandDriver *this)
{
}

uint64_t Bsp::BspCommandDriver::SwTrap()
{
  return MEMORY[0x270F92A28]();
}

uint64_t Bsp::BspCommandDriver::BspCommandDriver()
{
  return MEMORY[0x270F92A30]();
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, os_log_s *a2)
{
  return MEMORY[0x270F972A0](this, a2);
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const char *a2, const char *a3)
{
  return MEMORY[0x270F972A8](this, a2, a3);
}

void ctu::OsLogLogger::~OsLogLogger(ctu::OsLogLogger *this)
{
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x270F972D8](this, a2, a3);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
}

uint64_t ctu::path_join_impl()
{
  return MEMORY[0x270F973A0]();
}

{
  return MEMORY[0x270F973A8]();
}

{
  return MEMORY[0x270F973B0]();
}

uint64_t ctu::LogMessageBuffer::takeString(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x270F973E8](this);
}

uint64_t ctu::LogMessageBuffer::createWithFormat(ctu::LogMessageBuffer *this, const char *a2, ...)
{
  return MEMORY[0x270F973F8](this, a2);
}

uint64_t ctu::LogMessageBuffer::vCreateWithFormat(ctu::LogMessageBuffer *this, const char *a2, char *a3)
{
  return MEMORY[0x270F97400](this, a2, a3);
}

void ctu::LogMessageBuffer::~LogMessageBuffer(ctu::LogMessageBuffer *this)
{
}

uint64_t ctu::isProcessRunning()
{
  return MEMORY[0x270F97450]();
}

uint64_t ctu::cf::MakeCFString::MakeCFString(ctu::cf::MakeCFString *this, const char *a2)
{
  return MEMORY[0x270F974F0](this, a2);
}

void ctu::cf::MakeCFString::~MakeCFString(ctu::cf::MakeCFString *this)
{
}

uint64_t ctu::cf::convert_copy(ctu::cf *this, const __CFString **a2, const char *a3, uint64_t a4, const __CFAllocator *a5)
{
  return MEMORY[0x270F97500](this, a2, a3, a4, a5);
}

uint64_t ctu::cf::convert_copy()
{
  return MEMORY[0x270F97508]();
}

{
  return MEMORY[0x270F97510]();
}

uint64_t ctu::cf::dict_adapter::dict_adapter(ctu::cf::dict_adapter *this, const __CFDictionary *a2)
{
  return MEMORY[0x270F97518](this, a2);
}

void ctu::cf::dict_adapter::~dict_adapter(ctu::cf::dict_adapter *this)
{
}

uint64_t ctu::cf::plist_adapter::plist_adapter(ctu::cf::plist_adapter *this, const __CFString *a2, const __CFString *a3)
{
  return MEMORY[0x270F97530](this, a2, a3);
}

void ctu::cf::plist_adapter::~plist_adapter(ctu::cf::plist_adapter *this)
{
}

uint64_t ctu::cf::show(ctu::cf *this, const void *a2)
{
  return MEMORY[0x270F97540](this, a2);
}

uint64_t ctu::cf::show(ctu::cf *this, uint64_t a2, const void *a3)
{
  return MEMORY[0x270F97548](this, a2, a3);
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x270F97550]();
}

{
  return MEMORY[0x270F97558]();
}

{
  return MEMORY[0x270F97560]();
}

uint64_t ctu::cf::assign(ctu::cf *this, signed __int8 *a2, const __CFNumber *a3)
{
  return MEMORY[0x270F97568](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, BOOL *a2, const __CFBoolean *a3)
{
  return MEMORY[0x270F97570](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, int *a2, const __CFNumber *a3)
{
  return MEMORY[0x270F97580](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, unsigned int *a2, const __CFNumber *a3)
{
  return MEMORY[0x270F97588](this, a2, a3);
}

uint64_t ctu::fs::close_file(ctu::fs *this)
{
  return MEMORY[0x270F975A0](this);
}

uint64_t ctu::fs::file_exists()
{
  return MEMORY[0x270F975B0]();
}

uint64_t ctu::fs::read_folder()
{
  return MEMORY[0x270F975B8]();
}

uint64_t ctu::fs::remove_file()
{
  return MEMORY[0x270F975C0]();
}

uint64_t ctu::fs::is_directory()
{
  return MEMORY[0x270F975C8]();
}

uint64_t ctu::fs::iterate_folder()
{
  return MEMORY[0x270F975D8]();
}

uint64_t ctu::fs::create_directory()
{
  return MEMORY[0x270F975E0]();
}

uint64_t ctu::fs::remove_directory_contents()
{
  return MEMORY[0x270F975F8]();
}

uint64_t ctu::fs::rename()
{
  return MEMORY[0x270F97600]();
}

uint64_t ctu::fs::open_file()
{
  return MEMORY[0x270F97608]();
}

uint64_t ctu::hex(ctu *this, const void *a2)
{
  return MEMORY[0x270F97628](this, a2);
}

uint64_t ctu::hex()
{
  return MEMORY[0x270F97630]();
}

uint64_t ctu::Http::HttpRequest::create()
{
  return MEMORY[0x270F97648]();
}

uint64_t ctu::Http::asString()
{
  return MEMORY[0x270F97650]();
}

uint64_t ctu::TelephonyUtilRadioFusingInferFusingStateFromCertID(ctu *this, const unsigned int *a2)
{
  return MEMORY[0x270F976B8](this, a2);
}

uint64_t ctu::assign()
{
  return MEMORY[0x270F976D0]();
}

uint64_t ctu::basename()
{
  return MEMORY[0x270F97700]();
}

uint64_t ctu::tokenize()
{
  return MEMORY[0x270F97708]();
}

uint64_t ctu::cf_to_xpc(ctu *this, const void *a2)
{
  return MEMORY[0x270F97778](this, a2);
}

uint64_t nvm::ARICommandDriver::NVMSnapshot()
{
  return MEMORY[0x270F92A38]();
}

uint64_t nvm::ARICommandDriver::ARICommandDriver()
{
  return MEMORY[0x270F92A40]();
}

void nvm::ARICommandDriver::~ARICommandDriver(nvm::ARICommandDriver *this)
{
}

uint64_t pci::transport::kernelControl::create(pci::transport::kernelControl *this)
{
  return MEMORY[0x270F96530](this);
}

uint64_t pci::transport::kernel::errorAsString()
{
  return MEMORY[0x270F96538]();
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x270F977D8]();
}

{
  return MEMORY[0x270F977E0]();
}

uint64_t eUICC::StreamAPDU::Perform()
{
  return MEMORY[0x270F91C10]();
}

uint64_t eUICC::SwitchMode::Perform()
{
  return MEMORY[0x270F91C18]();
}

uint64_t eUICC::GetVinylType::Perform()
{
  return MEMORY[0x270F91C20]();
}

uint64_t eUICC::DeleteProfile::Perform()
{
  return MEMORY[0x270F91C28]();
}

uint64_t eUICC::InstallTicket::Perform()
{
  return MEMORY[0x270F91C30]();
}

uint64_t eUICC::ValidatePerso::Perform()
{
  return MEMORY[0x270F91C38]();
}

uint64_t eUICC::AuthPersoSession::Perform()
{
  return MEMORY[0x270F91C40]();
}

uint64_t eUICC::InitPersoSession::Perform()
{
  return MEMORY[0x270F91C48]();
}

uint64_t eUICC::VinylCommandDriver::InstallVad()
{
  return MEMORY[0x270F92A50]();
}

uint64_t eUICC::VinylCommandDriver::GetVinylType()
{
  return MEMORY[0x270F92A58]();
}

uint64_t eUICC::VinylCommandDriver::DeleteProfile()
{
  return MEMORY[0x270F92A60]();
}

uint64_t eUICC::VinylCommandDriver::FinalizePerso()
{
  return MEMORY[0x270F92A68]();
}

uint64_t eUICC::VinylCommandDriver::ValidatePerso()
{
  return MEMORY[0x270F92A70]();
}

uint64_t eUICC::VinylCommandDriver::SwitchCardMode()
{
  return MEMORY[0x270F92A78]();
}

uint64_t eUICC::VinylCommandDriver::GetData()
{
  return MEMORY[0x270F92A80]();
}

uint64_t eUICC::VinylCommandDriver::StreamFW()
{
  return MEMORY[0x270F92A88]();
}

uint64_t eUICC::VinylCommandDriver::AuthPerso()
{
  return MEMORY[0x270F92A90]();
}

uint64_t eUICC::VinylCommandDriver::InitPerso()
{
  return MEMORY[0x270F92A98]();
}

uint64_t eUICC::VinylCommandDriver::VinylCommandDriver()
{
  return MEMORY[0x270F92AA0]();
}

void eUICC::VinylCommandDriver::~VinylCommandDriver(eUICC::VinylCommandDriver *this)
{
}

uint64_t eUICC::FinalizePersoSession::Perform()
{
  return MEMORY[0x270F91C50]();
}

uint64_t eUICC::GetData::Perform()
{
  return MEMORY[0x270F91C58]();
}

uint64_t eUICC::StoreData::Perform()
{
  return MEMORY[0x270F91C60]();
}

uint64_t AriOsa::LogSrcInfo(AriOsa *this, const char *a2, const char *a3)
{
  return MEMORY[0x270F8CDB8](this, a2, a3);
}

uint64_t AriSdk::ARI_IBIVinylTapeReq_SDK::ARI_IBIVinylTapeReq_SDK(AriSdk::ARI_IBIVinylTapeReq_SDK *this)
{
  return MEMORY[0x270F8D060](this);
}

void AriSdk::ARI_IBIVinylTapeReq_SDK::~ARI_IBIVinylTapeReq_SDK(AriSdk::ARI_IBIVinylTapeReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBINvmSnapshotReq_SDK::ARI_IBINvmSnapshotReq_SDK(AriSdk::ARI_IBINvmSnapshotReq_SDK *this)
{
  return MEMORY[0x270F8D278](this);
}

void AriSdk::ARI_IBINvmSnapshotReq_SDK::~ARI_IBINvmSnapshotReq_SDK(AriSdk::ARI_IBINvmSnapshotReq_SDK *this)
{
}

uint64_t AriSdk::ARI_CsiSysGetInfoReqV2_SDK::ARI_CsiSysGetInfoReqV2_SDK(AriSdk::ARI_CsiSysGetInfoReqV2_SDK *this)
{
  return MEMORY[0x270F8D3F8](this);
}

void AriSdk::ARI_CsiSysGetInfoReqV2_SDK::~ARI_CsiSysGetInfoReqV2_SDK(AriSdk::ARI_CsiSysGetInfoReqV2_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIVinylAuthPsoReq_SDK::ARI_IBIVinylAuthPsoReq_SDK(AriSdk::ARI_IBIVinylAuthPsoReq_SDK *this)
{
  return MEMORY[0x270F8D5B0](this);
}

void AriSdk::ARI_IBIVinylAuthPsoReq_SDK::~ARI_IBIVinylAuthPsoReq_SDK(AriSdk::ARI_IBIVinylAuthPsoReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIVinylGetDataReq_SDK::ARI_IBIVinylGetDataReq_SDK(AriSdk::ARI_IBIVinylGetDataReq_SDK *this)
{
  return MEMORY[0x270F8D5C0](this);
}

void AriSdk::ARI_IBIVinylGetDataReq_SDK::~ARI_IBIVinylGetDataReq_SDK(AriSdk::ARI_IBIVinylGetDataReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIVinylInitPsoReq_SDK::ARI_IBIVinylInitPsoReq_SDK(AriSdk::ARI_IBIVinylInitPsoReq_SDK *this)
{
  return MEMORY[0x270F8D5D0](this);
}

void AriSdk::ARI_IBIVinylInitPsoReq_SDK::~ARI_IBIVinylInitPsoReq_SDK(AriSdk::ARI_IBIVinylInitPsoReq_SDK *this)
{
}

uint64_t AriSdk::ARI_CsiSecReadSikPKeyReq_SDK::ARI_CsiSecReadSikPKeyReq_SDK(AriSdk::ARI_CsiSecReadSikPKeyReq_SDK *this)
{
  return MEMORY[0x270F8D968](this);
}

void AriSdk::ARI_CsiSecReadSikPKeyReq_SDK::~ARI_CsiSecReadSikPKeyReq_SDK(AriSdk::ARI_CsiSecReadSikPKeyReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIVinylInstallFwReq_SDK::ARI_IBIVinylInstallFwReq_SDK(AriSdk::ARI_IBIVinylInstallFwReq_SDK *this)
{
  return MEMORY[0x270F8DB68](this);
}

void AriSdk::ARI_IBIVinylInstallFwReq_SDK::~ARI_IBIVinylInstallFwReq_SDK(AriSdk::ARI_IBIVinylInstallFwReq_SDK *this)
{
}

uint64_t AriSdk::ARI_CsiSecGetRandomNumReq_SDK::ARI_CsiSecGetRandomNumReq_SDK(AriSdk::ARI_CsiSecGetRandomNumReq_SDK *this)
{
  return MEMORY[0x270F8DC88](this);
}

void AriSdk::ARI_CsiSecGetRandomNumReq_SDK::~ARI_CsiSecGetRandomNumReq_SDK(AriSdk::ARI_CsiSecGetRandomNumReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIVinylInstallVadReq_SDK::ARI_IBIVinylInstallVadReq_SDK(AriSdk::ARI_IBIVinylInstallVadReq_SDK *this)
{
  return MEMORY[0x270F8DEF0](this);
}

void AriSdk::ARI_IBIVinylInstallVadReq_SDK::~ARI_IBIVinylInstallVadReq_SDK(AriSdk::ARI_IBIVinylInstallVadReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIVinylSwitchModeReq_SDK::ARI_IBIVinylSwitchModeReq_SDK(AriSdk::ARI_IBIVinylSwitchModeReq_SDK *this)
{
  return MEMORY[0x270F8DF10](this);
}

void AriSdk::ARI_IBIVinylSwitchModeReq_SDK::~ARI_IBIVinylSwitchModeReq_SDK(AriSdk::ARI_IBIVinylSwitchModeReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIVinylFinalizePsoReq_SDK::ARI_IBIVinylFinalizePsoReq_SDK(AriSdk::ARI_IBIVinylFinalizePsoReq_SDK *this)
{
  return MEMORY[0x270F8E340](this);
}

void AriSdk::ARI_IBIVinylFinalizePsoReq_SDK::~ARI_IBIVinylFinalizePsoReq_SDK(AriSdk::ARI_IBIVinylFinalizePsoReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIVinylValidatePsoReq_SDK::ARI_IBIVinylValidatePsoReq_SDK(AriSdk::ARI_IBIVinylValidatePsoReq_SDK *this)
{
  return MEMORY[0x270F8E390](this);
}

void AriSdk::ARI_IBIVinylValidatePsoReq_SDK::~ARI_IBIVinylValidatePsoReq_SDK(AriSdk::ARI_IBIVinylValidatePsoReq_SDK *this)
{
}

uint64_t AriSdk::ARI_CsiSecCollectScrtBlobReq_SDK::ARI_CsiSecCollectScrtBlobReq_SDK(AriSdk::ARI_CsiSecCollectScrtBlobReq_SDK *this)
{
  return MEMORY[0x270F8E900](this);
}

void AriSdk::ARI_CsiSecCollectScrtBlobReq_SDK::~ARI_CsiSecCollectScrtBlobReq_SDK(AriSdk::ARI_CsiSecCollectScrtBlobReq_SDK *this)
{
}

uint64_t AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::ARI_CsiGetCurrentBootStateReq_SDK(AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *this)
{
  return MEMORY[0x270F8EC00](this);
}

void AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::~ARI_CsiGetCurrentBootStateReq_SDK(AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::ARI_IBISimAccessGetSimDataReq_SDK(AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *this)
{
  return MEMORY[0x270F8EE50](this);
}

void AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::~ARI_IBISimAccessGetSimDataReq_SDK(AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *this)
{
}

uint64_t AriSdk::ARI_FactoryGetNvItemsSettingReq_SDK::ARI_FactoryGetNvItemsSettingReq_SDK(AriSdk::ARI_FactoryGetNvItemsSettingReq_SDK *this)
{
  return MEMORY[0x270F8F2E0](this);
}

void AriSdk::ARI_FactoryGetNvItemsSettingReq_SDK::~ARI_FactoryGetNvItemsSettingReq_SDK(AriSdk::ARI_FactoryGetNvItemsSettingReq_SDK *this)
{
}

uint64_t AriSdk::ARI_GetPersonalizationParametersReq_SDK::ARI_GetPersonalizationParametersReq_SDK(AriSdk::ARI_GetPersonalizationParametersReq_SDK *this)
{
  return MEMORY[0x270F8FBA8](this);
}

void AriSdk::ARI_GetPersonalizationParametersReq_SDK::~ARI_GetPersonalizationParametersReq_SDK(AriSdk::ARI_GetPersonalizationParametersReq_SDK *this)
{
}

uint64_t ACFUFDR::getDataLocalCopy()
{
  return MEMORY[0x270F0D4C0]();
}

uint64_t AriHost::RegisterClient(AriHost *this, const char *a2, int *a3, dispatch_queue_s *a4)
{
  return MEMORY[0x270F90260](this, a2, a3, a4);
}

uint64_t AriHost::DeregisterClient(AriHost *this)
{
  return MEMORY[0x270F90280](this);
}

uint64_t AriHost::Init(AriHost *this)
{
  return MEMORY[0x270F902A8](this);
}

uint64_t hsfiler::support::to_string()
{
  return MEMORY[0x270F92058]();
}

uint64_t security::ARICommandDriver::GetRandomNum()
{
  return MEMORY[0x270F92AF0]();
}

uint64_t security::ARICommandDriver::CsiSecReadSikPKey()
{
  return MEMORY[0x270F92AF8]();
}

uint64_t security::ARICommandDriver::CsiSecCollectScrtBlob()
{
  return MEMORY[0x270F92B00]();
}

uint64_t security::ARICommandDriver::GetPersonalizationParams()
{
  return MEMORY[0x270F92B08]();
}

uint64_t security::ARICommandDriver::ARICommandDriver()
{
  return MEMORY[0x270F92B10]();
}

void security::ARICommandDriver::~ARICommandDriver(security::ARICommandDriver *this)
{
}

uint64_t ACFUError::clearError(ACFUError *this)
{
  return MEMORY[0x270F0D4C8](this);
}

uint64_t ACFUError::getCFError(ACFUError *this)
{
  return MEMORY[0x270F0D4D8](this);
}

uint64_t ACFUError::createAppendedDomain(ACFUError *this, const __CFString *a2)
{
  return MEMORY[0x270F0D4E0](this, a2);
}

uint64_t ACFUError::addError()
{
  return MEMORY[0x270F0D4F8]();
}

uint64_t ACFUError::hasError(ACFUError *this)
{
  return MEMORY[0x270F0D500](this);
}

void ACFUError::ACFUError(ACFUError *this, const __CFString *a2)
{
}

void ACFUError::~ACFUError(ACFUError *this)
{
}

uint64_t ACFUFirmware::getManifest(ACFUFirmware *this)
{
  return MEMORY[0x270F0D538](this);
}

uint64_t ACFUFirmware::copyFWDataByTag(ACFUFirmware *this, const __CFString *a2)
{
  return MEMORY[0x270F0D548](this, a2);
}

uint64_t ACFUFirmware::copyFWDataByFileName()
{
  return MEMORY[0x270F0D550]();
}

uint64_t ACFUFirmware::copyFWContainerFromOffset(ACFUFirmware *this)
{
  return MEMORY[0x270F0D558](this);
}

uint64_t ctu::cf::map_adapter::getInt(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x270F97908](this, a2);
}

uint64_t ctu::cf::map_adapter::getBool(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x270F97910](this, a2);
}

uint64_t ctu::cf::map_adapter::getString()
{
  return MEMORY[0x270F97920]();
}

uint64_t ctu::llvm::StringRef::find_last_not_of()
{
  return MEMORY[0x270F97928]();
}

uint64_t ctu::llvm::StringRef::find_first_not_of()
{
  return MEMORY[0x270F97930]();
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::path::lexically_normal(std::__fs::filesystem::path *__return_ptr retstr, const std::__fs::filesystem::path *this)
{
  return (std::__fs::filesystem::path *)MEMORY[0x270F982A8](retstr, this);
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x270F982D8](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x270F98340](this, a2);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x270F98398](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x270F983C8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983D8](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x270F98440](this, *(void *)&__ecode);
}

void std::this_thread::sleep_for (const std::chrono::nanoseconds *__ns)
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F984B0](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x270F985E0](this, *(void *)&__ec.__val_, __ec.__cat_);
}

void std::future_error::~future_error(std::future_error *this)
{
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x270F98640]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x270F98678]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x270F98690]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x270F98698]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::istream::getline()
{
  return MEMORY[0x270F986B8]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x270F986F0]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x270F98750]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98788]();
}

{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987D0]();
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x270F98890](__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x270F988E0]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::__assoc_sub_state::set_exception(std::__assoc_sub_state *this, std::exception_ptr __p)
{
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
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

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x270F98A00](retstr, __s);
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98B78](__str, __idx, *(void *)&__base);
}

uint64_t std::stol(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98B80](__str, __idx, *(void *)&__base);
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

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x270F98C18]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x270F98C28]();
}

time_t std::chrono::system_clock::to_time_t(const std::chrono::system_clock::time_point *__t)
{
  return MEMORY[0x270F98C30](__t);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x270F98C70](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x270F98C78](this);
}

void std::locale::~locale(std::locale *this)
{
}

const std::locale *__cdecl std::locale::operator=(std::locale *this, const std::locale *a2)
{
  return (const std::locale *)MEMORY[0x270F98C88](this, a2);
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

std::locale std::ios_base::imbue(std::ios_base *this, const std::locale *__loc)
{
  return (std::locale)MEMORY[0x270F98D58](this, __loc);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E20](retstr, __val);
}

void std::exception::~exception(std::exception *this)
{
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x270F98E98]();
}

void std::rethrow_exception(std::exception_ptr a1)
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
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x270F98EE8](lpmangled, lpout, lpoutlen, lpstatus);
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
  return MEMORY[0x270F98F10](a1);
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

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x270ED8ED0](a1, *(void *)&a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x270F9C690](crc, buf, *(void *)&len);
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

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9440](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x270ED98B0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x270ED9918](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

const z_crc_t *get_crc_table(void)
{
  return (const z_crc_t *)MEMORY[0x270F9C6C8]();
}

int getchar(void)
{
  return MEMORY[0x270ED9BC8]();
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x270ED9CC0](*(void *)&a1, a2, a3, a4, a5);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x270ED9D28](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C730](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C738](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x270F9C740](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270EDA098](a1);
}

uint64_t lookupPathForPersistentData()
{
  return MEMORY[0x270F49500]();
}

uint64_t lookupPathForPersonalizedData()
{
  return MEMORY[0x270F49508]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x270EDA830](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x270EDAB58]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDB128](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x270EDB1E8](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int sched_yield(void)
{
  return MEMORY[0x270EDB320]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x270EDB570](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x270EDB5E8](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA70](a1, a2, a3);
}

int vprintf(const char *a1, va_list a2)
{
  return MEMORY[0x270EDBB00](a1, a2);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x270EDBBE8](__s, *(void *)&__c, __n);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x270EDC290]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}