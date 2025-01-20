const char *BasebandRFDiagnostics::asString(unsigned int a1)
{
  if (a1 > 9) {
    return "Unknown";
  }
  else {
    return off_2655D3268[a1];
  }
}

void BasebandRFDiagnostics::BasebandRFDiagnostics(BasebandRFDiagnostics *this)
{
  BasebandDiagnostics::BasebandDiagnostics(this);
  *(void *)uint64_t v1 = &unk_270EA3458;
  *(void *)(v1 + 136) = 0;
  *(void *)(v1 + 144) = 0;
  *(void *)(v1 + 128) = 0;
  *(void *)(v1 + 168) = 0;
  *(void *)(v1 + 176) = 0;
  *(void *)(v1 + 160) = 0;
  *(void *)(v1 + 192) = 0;
  *(_DWORD *)(v1 + 200) = 0;
  *(void *)(v1 + 208) = 0;
  *(_DWORD *)(v1 + 216) = 0;
}

{
  uint64_t v1;

  BasebandDiagnostics::BasebandDiagnostics(this);
  *(void *)uint64_t v1 = &unk_270EA3458;
  *(void *)(v1 + 136) = 0;
  *(void *)(v1 + 144) = 0;
  *(void *)(v1 + 128) = 0;
  *(void *)(v1 + 168) = 0;
  *(void *)(v1 + 176) = 0;
  *(void *)(v1 + 160) = 0;
  *(void *)(v1 + 192) = 0;
  *(_DWORD *)(v1 + 200) = 0;
  *(void *)(v1 + 208) = 0;
  *(_DWORD *)(v1 + 216) = 0;
}

void BasebandRFDiagnostics::~BasebandRFDiagnostics(BasebandRFDiagnostics *this)
{
  *(void *)this = &unk_270EA3458;
  v2 = *((void *)this + 5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_263679000, v2, OS_LOG_TYPE_DEFAULT, "#I BasebandRFDiagHelper dealloc", v6, 2u);
  }
  v3 = (const void *)*((void *)this + 24);
  if (v3) {
    CFRelease(v3);
  }
  v4 = (void *)*((void *)this + 20);
  if (v4)
  {
    *((void *)this + 21) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((void *)this + 16);
  if (v5)
  {
    *((void *)this + 17) = v5;
    operator delete(v5);
  }
  BasebandDiagnostics::~BasebandDiagnostics(this);
}

{
  void *v1;
  uint64_t vars8;

  BasebandRFDiagnostics::~BasebandRFDiagnostics(this);

  operator delete(v1);
}

void __clang_call_terminate(void *a1)
{
}

void BasebandRFDiagnostics::resetAll(BasebandRFDiagnostics *this)
{
  *((_DWORD *)this + 50) = 0;
  *((void *)this + 26) = 0;
  *((_DWORD *)this + 54) = 0;
  if (*((void *)this + 7))
  {
    v2 = *((void *)this + 5);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_263679000, v2, OS_LOG_TYPE_DEFAULT, "#I ABM client reset", v5, 2u);
    }
    v3 = (std::__shared_weak_count *)*((void *)this + 8);
    *((void *)this + 7) = 0;
    *((void *)this + 8) = 0;
    if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v4 = *((void *)this + 10);
  *((void *)this + 10) = 0;
  if (v4)
  {
    dispatch_group_leave(v4);
    dispatch_release(v4);
  }
}

void BasebandRFDiagnostics::create(std::__shared_weak_count ***a1@<X8>)
{
  v3 = (std::__shared_weak_count **)operator new(0xE0uLL);
  BasebandDiagnostics::BasebandDiagnostics((BasebandDiagnostics *)v3);
  std::__shared_weak_count *v3 = (std::__shared_weak_count *)&unk_270EA3458;
  v3[17] = 0;
  v3[18] = 0;
  v3[16] = 0;
  v3[21] = 0;
  v3[22] = 0;
  v3[20] = 0;
  v3[24] = 0;
  *((_DWORD *)v3 + 50) = 0;
  v3[26] = 0;
  *((_DWORD *)v3 + 54) = 0;
  *a1 = v3;
  a1[1] = (std::__shared_weak_count **)0xAAAAAAAAAAAAAAAALL;
  v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = &v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EA34A0;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)v3;
  a1[1] = (std::__shared_weak_count **)v4;
  v6 = v3[2];
  if (v6)
  {
    if (v6->__shared_owners_ != -1) {
      return;
    }
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v3[1] = (std::__shared_weak_count *)v3;
    v3[2] = v4;
    std::__shared_weak_count::__release_weak(v6);
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
  }
  else
  {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v3[1] = (std::__shared_weak_count *)v3;
    v3[2] = v4;
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
  }
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);

  std::__shared_weak_count::__release_weak(v4);
}

void sub_26367AF3C(void *a1)
{
  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[3], v1, (dispatch_function_t)std::shared_ptr<BasebandRFDiagnostics> ctu::SharedSynchronizable<BasebandDiagnostics>::make_shared_ptr<BasebandRFDiagnostics>(BasebandRFDiagnostics*)::{lambda(BasebandRFDiagnostics*)#1}::operator() const(BasebandRFDiagnostics*)::{lambda(void *)#1}::__invoke);
  __cxa_rethrow();
}

void sub_26367AF64(_Unwind_Exception *a1)
{
}

void sub_26367AF78(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

const char *BasebandRFDiagnostics::getName(BasebandRFDiagnostics *this)
{
  return "BBDiagnosticsRF";
}

uint64_t BasebandRFDiagnostics::getBasebandPersonalizationInfo(BasebandRFDiagnostics *this)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  uint64_t v3 = MEMORY[0x263EF8708];
  if (v2 || (xpc_object_t v2 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E67FD0](v2) == v3)
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
  xpc_object_t v5 = xpc_int64_create(5000);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x263F25DB8], v5);
  xpc_object_t v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
  xpc_object_t v54 = xpc_null_create();
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__p = v7;
  long long v53 = v7;
  v8 = (std::__shared_weak_count *)*((void *)this + 8);
  uint64_t v50 = *((void *)this + 7);
  v51 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v9 = (const void *)*MEMORY[0x263F264E8];
  size_t v10 = strlen((const char *)*MEMORY[0x263F264E8]);
  if (v10 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v11 = v10;
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    v12 = operator new(v13 + 1);
    *(void *)&__dst[8] = v11;
    *(void *)&__dst[16] = v14 | 0x8000000000000000;
    *(void *)__dst = v12;
    goto LABEL_18;
  }
  __dst[23] = v10;
  v12 = __dst;
  if (v10) {
LABEL_18:
  }
    memmove(v12, v9, v11);
  v12[v11] = 0;
  abm::client::PerformCommand();
  if ((__dst[23] & 0x80000000) != 0) {
    operator delete(*(void **)__dst);
  }
  v15 = v51;
  if (v51 && !atomic_fetch_add(&v51->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
    xpc_object_t v16 = v54;
    if (v54) {
      goto LABEL_27;
    }
  }
  else
  {
    xpc_object_t v16 = v54;
    if (v54) {
      goto LABEL_27;
    }
  }
  xpc_object_t v16 = xpc_null_create();
  if (!v16)
  {
    xpc_object_t v17 = xpc_null_create();
    xpc_object_t v16 = 0;
    goto LABEL_30;
  }
LABEL_27:
  if (MEMORY[0x263E67FD0](v16) == v3)
  {
    xpc_retain(v16);
    xpc_object_t v17 = v16;
  }
  else
  {
    xpc_object_t v17 = xpc_null_create();
  }
LABEL_30:
  xpc_release(v16);
  v18 = buf;
  if (LODWORD(__p[0])
    || MEMORY[0x263E67FD0](v17) != v3
    || (v23 = (const char *)*MEMORY[0x263F26370], !xpc_dictionary_get_value(v17, (const char *)*MEMORY[0x263F26370]))
    || (v24 = (const char *)*MEMORY[0x263F25FB8], !xpc_dictionary_get_value(v17, (const char *)*MEMORY[0x263F25FB8])))
  {
    v19 = *((void *)this + 5);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__dst = 0;
      _os_log_error_impl(&dword_263679000, v19, OS_LOG_TYPE_ERROR, "Failed to get Firmware Info", __dst, 2u);
      if (LODWORD(__p[0])) {
        goto LABEL_34;
      }
    }
    else if (LODWORD(__p[0]))
    {
LABEL_34:
      v20 = *((void *)this + 5);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        TelephonyXPC::Result::describe((TelephonyXPC::Result *)__p, __dst);
        v26 = __dst[23] >= 0 ? __dst : *(unsigned char **)__dst;
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v26;
        _os_log_error_impl(&dword_263679000, v20, OS_LOG_TYPE_ERROR, "Get firmware info cmd failed: %s", buf, 0xCu);
        if ((__dst[23] & 0x80000000) != 0) {
          operator delete(*(void **)__dst);
        }
      }
    }
    uint64_t v21 = 0;
    goto LABEL_36;
  }
  xpc_object_t value = xpc_dictionary_get_value(v17, v23);
  xpc_object_t object = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  memset(__dst, 0, 24);
  xpc::dyn_cast_or_default();
  if (*(void *)__dst)
  {
    *(void *)&__dst[8] = *(void *)__dst;
    operator delete(*(void **)__dst);
  }
  v27 = (void *)*((void *)this + 16);
  if (v27)
  {
    *((void *)this + 17) = v27;
    operator delete(v27);
    *((void *)this + 16) = 0;
    *((void *)this + 17) = 0;
    *((void *)this + 18) = 0;
  }
  *((_OWORD *)this + 8) = *(_OWORD *)buf;
  *((void *)this + 18) = *(void *)&buf[16];
  memset(buf, 0, sizeof(buf));
  xpc_release(object);
  xpc_object_t v28 = xpc_dictionary_get_value(v17, v24);
  *(void *)__dst = v28;
  if (v28) {
    xpc_retain(v28);
  }
  else {
    *(void *)__dst = xpc_null_create();
  }
  *((_DWORD *)this + 38) = xpc::dyn_cast_or_default();
  xpc_release(*(xpc_object_t *)__dst);
  memset(__dst, 170, 24);
  ctu::hex(*((ctu **)this + 16), (const void *)(*((void *)this + 17) - *((void *)this + 16)));
  v29 = *((void *)this + 5);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    v42 = __dst;
    if (__dst[23] < 0) {
      v42 = *(unsigned char **)__dst;
    }
    int v43 = *((_DWORD *)this + 38);
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = v42;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v43;
    _os_log_debug_impl(&dword_263679000, v29, OS_LOG_TYPE_DEBUG, "#D Serial Number: %s, ChipId: %d", buf, 0x12u);
    if ((__dst[23] & 0x80000000) == 0)
    {
LABEL_60:
      *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__dst = v30;
      *(_OWORD *)&__dst[16] = v30;
      v31 = (std::__shared_weak_count *)*((void *)this + 8);
      v47 = v31;
      if (!v31) {
        goto LABEL_62;
      }
      goto LABEL_61;
    }
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_60;
  }
  operator delete(*(void **)__dst);
  *(void *)&long long v44 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__dst = v44;
  *(_OWORD *)&__dst[16] = v44;
  v31 = (std::__shared_weak_count *)*((void *)this + 8);
  v47 = v31;
  if (v31) {
LABEL_61:
  }
    atomic_fetch_add_explicit(&v31->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_62:
  v32 = (const void *)*MEMORY[0x263F260A8];
  size_t v33 = strlen((const char *)*MEMORY[0x263F260A8]);
  if (v33 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v34 = v33;
  if (v33 >= 0x17)
  {
    uint64_t v35 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v33 | 7) != 0x17) {
      uint64_t v35 = v33 | 7;
    }
    uint64_t v36 = v35 + 1;
    v18 = operator new(v35 + 1);
    *(void *)&buf[8] = v34;
    *(void *)&buf[16] = v36 | 0x8000000000000000;
    *(void *)buf = v18;
  }
  else
  {
    buf[23] = v33;
    if (!v33) {
      goto LABEL_70;
    }
  }
  memmove(v18, v32, v34);
LABEL_70:
  *((unsigned char *)v18 + v34) = 0;
  abm::client::PerformCommand();
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  if (v47 && !atomic_fetch_add(&v47->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
    std::__shared_weak_count::__release_weak(v47);
  }
  xpc_object_t v37 = v54;
  if (v54 || (xpc_object_t v37 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E67FD0](v37) == v3)
    {
      xpc_retain(v37);
      xpc_object_t v38 = v37;
    }
    else
    {
      xpc_object_t v38 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v38 = xpc_null_create();
    xpc_object_t v37 = 0;
  }
  xpc_release(v37);
  if (!*(_DWORD *)__dst
    && MEMORY[0x263E67FD0](v38) == v3
    && (v40 = (const char *)*MEMORY[0x263F25FB0], xpc_dictionary_get_value(v38, (const char *)*MEMORY[0x263F25FB0])))
  {
    xpc_object_t v41 = xpc_dictionary_get_value(v38, v40);
    *(void *)buf = v41;
    if (v41) {
      xpc_retain(v41);
    }
    else {
      *(void *)buf = xpc_null_create();
    }
    *((_DWORD *)this + 46) = xpc::dyn_cast_or_default();
    xpc_release(*(xpc_object_t *)buf);
    v45 = *((void *)this + 5);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      int v46 = *((_DWORD *)this + 46);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v46;
      _os_log_debug_impl(&dword_263679000, v45, OS_LOG_TYPE_DEBUG, "#D GoldCertID: 0x%x", buf, 8u);
    }
    uint64_t v21 = 1;
  }
  else
  {
    v39 = *((void *)this + 5);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_263679000, v39, OS_LOG_TYPE_ERROR, "Failed to get GoldCertId", buf, 2u);
    }
    uint64_t v21 = 0;
  }
  xpc_release(v38);
  if ((__dst[31] & 0x80000000) != 0) {
    operator delete(*(void **)&__dst[8]);
  }
LABEL_36:
  xpc_release(v17);
  if (SHIBYTE(v53) < 0) {
    operator delete(__p[1]);
  }
  xpc_release(v4);
  return v21;
}

void sub_26367B798(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, void *__p, int a13, __int16 a14, char a15, char a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,xpc_object_t a22,char a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100](uint64_t result)
{
  uint64_t v1 = result;
  xpc_object_t v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

uint64_t TelephonyXPC::Result::describe@<X0>(TelephonyXPC::Result *this@<X0>, unsigned char *a2@<X8>)
{
  unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v34[7] = v4;
  v34[8] = v4;
  v34[5] = v4;
  v34[6] = v4;
  v34[3] = v4;
  v34[4] = v4;
  v34[1] = v4;
  v34[2] = v4;
  long long v33 = v4;
  v34[0] = v4;
  *(_OWORD *)v31 = v4;
  long long v32 = v4;
  long long v29 = v4;
  long long v30 = v4;
  long long v27 = v4;
  long long v28 = v4;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v27);
  xpc_object_t v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)"Result:'", 8);
  switch(*(_DWORD *)this)
  {
    case 0xE020E000:
      uint64_t v6 = 14;
      char v26 = 14;
      strcpy((char *)__p, "kInternalError");
      break;
    case 0xE020E001:
      uint64_t v6 = 12;
      char v26 = 12;
      strcpy((char *)__p, "kServerError");
      break;
    case 0xE020E002:
      uint64_t v6 = 13;
      v8 = "kCommandError";
      goto LABEL_10;
    case 0xE020E003:
      uint64_t v6 = 8;
      char v26 = 8;
      uint64_t v7 = 0x74756F656D69546BLL;
      goto LABEL_8;
    case 0xE020E004:
      uint64_t v6 = 13;
      v8 = "kNotSupported";
      goto LABEL_10;
    case 0xE020E005:
      uint64_t v6 = 6;
      char v26 = 6;
      strcpy((char *)__p, "kRetry");
      break;
    case 0xE020E006:
      uint64_t v6 = 17;
      char v26 = 17;
      __int16 v25 = 100;
      v9 = "kPermissionDenied";
      goto LABEL_15;
    case 0xE020E007:
      uint64_t v6 = 13;
      v8 = "kNotAvailable";
LABEL_10:
      char v26 = 13;
      __p[0] = *(void **)v8;
      *(void **)((char *)__p + 5) = *(void **)(v8 + 5);
      BYTE5(__p[1]) = 0;
      break;
    default:
      if (*(_DWORD *)this)
      {
        uint64_t v6 = 17;
        char v26 = 17;
        __int16 v25 = 101;
        v9 = "kInvalidErrorCode";
LABEL_15:
        *(_OWORD *)__p = *(_OWORD *)v9;
      }
      else
      {
        uint64_t v6 = 8;
        char v26 = 8;
        uint64_t v7 = 0x737365636375536BLL;
LABEL_8:
        __p[0] = (void *)v7;
        LOBYTE(__p[1]) = 0;
      }
      break;
  }
  size_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)__p, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"'", 1);
  if (v26 < 0)
  {
    operator delete(__p[0]);
    int v11 = *((char *)this + 31);
    if ((v11 & 0x80000000) == 0)
    {
LABEL_18:
      if (!(_BYTE)v11) {
        goto LABEL_29;
      }
      goto LABEL_22;
    }
  }
  else
  {
    int v11 = *((char *)this + 31);
    if ((v11 & 0x80000000) == 0) {
      goto LABEL_18;
    }
  }
  if (!*((void *)this + 2)) {
    goto LABEL_29;
  }
LABEL_22:
  v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)" Info:'", 7);
  int v13 = *((char *)this + 31);
  if (v13 >= 0) {
    uint64_t v14 = (char *)this + 8;
  }
  else {
    uint64_t v14 = (char *)*((void *)this + 1);
  }
  if (v13 >= 0) {
    uint64_t v15 = *((unsigned __int8 *)this + 31);
  }
  else {
    uint64_t v15 = *((void *)this + 2);
  }
  xpc_object_t v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)v14, v15);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"'", 1);
LABEL_29:
  if ((BYTE8(v33) & 0x10) != 0)
  {
    uint64_t v18 = v33;
    if ((unint64_t)v33 < *((void *)&v30 + 1))
    {
      *(void *)&long long v33 = *((void *)&v30 + 1);
      uint64_t v18 = *((void *)&v30 + 1);
    }
    v19 = (const void *)v30;
    size_t v17 = v18 - v30;
    if ((unint64_t)(v18 - v30) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_46;
    }
  }
  else
  {
    if ((BYTE8(v33) & 8) == 0)
    {
      size_t v17 = 0;
      a2[23] = 0;
      goto LABEL_42;
    }
    v19 = (const void *)*((void *)&v28 + 1);
    size_t v17 = *((void *)&v29 + 1) - *((void *)&v28 + 1);
    if (*((void *)&v29 + 1) - *((void *)&v28 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_46:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v17 >= 0x17)
  {
    uint64_t v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17) {
      uint64_t v20 = v17 | 7;
    }
    uint64_t v21 = v20 + 1;
    v22 = operator new(v20 + 1);
    *((void *)a2 + 1) = v17;
    *((void *)a2 + 2) = v21 | 0x8000000000000000;
    *(void *)a2 = v22;
    a2 = v22;
    goto LABEL_41;
  }
  a2[23] = v17;
  if (v17) {
LABEL_41:
  }
    memmove(a2, v19, v17);
LABEL_42:
  a2[v17] = 0;
  *(void *)&long long v27 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v27 + *(void *)(v27 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v27 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v32) < 0) {
    operator delete(v31[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x263E67C70](v34);
}

void sub_26367BDD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
{
  if (a14 < 0)
  {
    operator delete(__p);
    std::ostringstream::~ostringstream((uint64_t)&a16);
    _Unwind_Resume(a1);
  }
  std::ostringstream::~ostringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

uint64_t BasebandRFDiagnostics::getPersonalizationInfo(ctu **this)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (capabilities::radio::vendor((capabilities::radio *)this) - 1 > 1
    || !BasebandRFDiagnostics::getBasebandPersonalizationInfo((BasebandRFDiagnostics *)this))
  {
    int v5 = 0;
    return v5 ^ 1u;
  }
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  uint64_t v3 = MEMORY[0x263EF8708];
  if (v2 || (xpc_object_t v2 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E67FD0](v2) == v3)
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
  xpc_object_t v6 = xpc_int64_create(5000);
  if (!v6) {
    xpc_object_t v6 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x263F25DB8], v6);
  xpc_object_t v7 = xpc_null_create();
  xpc_release(v6);
  xpc_release(v7);
  xpc_object_t v32 = xpc_null_create();
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__p = v8;
  long long v31 = v8;
  v9 = this[8];
  long long v29 = (std::__shared_weak_count *)v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v9 + 1, 1uLL, memory_order_relaxed);
  }
  size_t v10 = (const void *)*MEMORY[0x263F267B0];
  size_t v11 = strlen((const char *)*MEMORY[0x263F267B0]);
  if (v11 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  v12 = (void *)v11;
  if (v11 >= 0x17)
  {
    uint64_t v14 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17) {
      uint64_t v14 = v11 | 7;
    }
    uint64_t v15 = v14 + 1;
    int v13 = (void **)operator new(v14 + 1);
    __dst[1] = v12;
    __dst[2] = (void *)(v15 | 0x8000000000000000);
    __dst[0] = v13;
    goto LABEL_21;
  }
  HIBYTE(__dst[2]) = v11;
  int v13 = __dst;
  if (v11) {
LABEL_21:
  }
    memmove(v13, v10, (size_t)v12);
  *((unsigned char *)v12 + (void)v13) = 0;
  abm::client::PerformCommand();
  if (SHIBYTE(__dst[2]) < 0)
  {
    operator delete(__dst[0]);
    xpc_object_t v16 = v29;
    if (!v29) {
      goto LABEL_27;
    }
  }
  else
  {
    xpc_object_t v16 = v29;
    if (!v29) {
      goto LABEL_27;
    }
  }
  if (!atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
    xpc_object_t v17 = v32;
    if (v32) {
      goto LABEL_31;
    }
    goto LABEL_28;
  }
LABEL_27:
  xpc_object_t v17 = v32;
  if (v32) {
    goto LABEL_31;
  }
LABEL_28:
  xpc_object_t v17 = xpc_null_create();
  if (!v17)
  {
    xpc_object_t v18 = xpc_null_create();
    xpc_object_t v17 = 0;
    goto LABEL_34;
  }
LABEL_31:
  if (MEMORY[0x263E67FD0](v17) == v3)
  {
    xpc_retain(v17);
    xpc_object_t v18 = v17;
  }
  else
  {
    xpc_object_t v18 = xpc_null_create();
  }
LABEL_34:
  xpc_release(v17);
  if (LODWORD(__p[0]))
  {
    v19 = this[5];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      TelephonyXPC::Result::describe((TelephonyXPC::Result *)__p, __dst);
      char v26 = SHIBYTE(__dst[2]) >= 0 ? __dst : (void **)__dst[0];
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v26;
      _os_log_error_impl(&dword_263679000, v19, OS_LOG_TYPE_ERROR, "Get rf self test nonce cmd failed: %s", buf, 0xCu);
      if (SHIBYTE(__dst[2]) < 0) {
        operator delete(__dst[0]);
      }
    }
    goto LABEL_36;
  }
  uint64_t v21 = (const char *)*MEMORY[0x263F268E0];
  if (!xpc_dictionary_get_value(v18, (const char *)*MEMORY[0x263F268E0]))
  {
LABEL_36:
    uint64_t v20 = this[5];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__dst[0]) = 0;
      _os_log_error_impl(&dword_263679000, v20, OS_LOG_TYPE_ERROR, "Failed to get RFSelfTestNonce", (uint8_t *)__dst, 2u);
    }
    int v5 = 0;
    goto LABEL_51;
  }
  xpc_object_t value = xpc_dictionary_get_value(v18, v21);
  xpc_object_t object = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  memset(__dst, 0, 24);
  xpc::dyn_cast_or_default();
  if (__dst[0])
  {
    __dst[1] = __dst[0];
    operator delete(__dst[0]);
  }
  v23 = this[20];
  if (v23)
  {
    this[21] = v23;
    operator delete(v23);
    this[20] = 0;
    this[21] = 0;
    this[22] = 0;
  }
  *((_OWORD *)this + 10) = *(_OWORD *)buf;
  this[22] = v35;
  unint64_t v35 = 0;
  memset(buf, 0, sizeof(buf));
  xpc_release(object);
  memset(__dst, 170, 24);
  ctu::hex(this[20], (const void *)(this[21] - this[20]));
  v24 = this[5];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    long long v27 = __dst;
    if (SHIBYTE(__dst[2]) < 0) {
      long long v27 = (void **)__dst[0];
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v27;
    _os_log_debug_impl(&dword_263679000, v24, OS_LOG_TYPE_DEBUG, "#D RF Self Test Nonce: %s", buf, 0xCu);
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
  if (SHIBYTE(__dst[2]) < 0) {
LABEL_49:
  }
    operator delete(__dst[0]);
LABEL_50:
  int v5 = 1;
LABEL_51:
  xpc_release(v18);
  if (SHIBYTE(v31) < 0) {
    operator delete(__p[1]);
  }
  xpc_release(v4);
  return v5 ^ 1u;
}

void sub_26367C334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, char a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  xpc_release(v28);
  if (a19 < 0) {
    operator delete(__p);
  }
  xpc_release(v27);
  _Unwind_Resume(a1);
}

uint64_t BasebandRFDiagnostics::isRFTestSupported(uint64_t a1, int a2)
{
  if (a2 == 2) {
    return MEMORY[0x270F96BB0]();
  }
  if (a2 == 1) {
    return MEMORY[0x270F96B60]();
  }
  return 0;
}

BOOL BasebandRFDiagnostics::getAPAuthParameters(BasebandRFDiagnostics *this)
{
  unint64_t v2 = MGGetSInt64Answer();
  int v3 = v2 & 0xFFFFFF;
  if (HIDWORD(v2)) {
    int v3 = 0;
  }
  *((_DWORD *)this + 50) = v3;
  uint64_t v4 = MGGetSInt64Answer();
  *((void *)this + 26) = v4;
  if (*((_DWORD *)this + 50)) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

uint64_t BasebandRFDiagnostics::getSignedTicketAndStore(BasebandRFDiagnostics *this, BOOL a2)
{
  BOOL v2 = a2;
  int v3 = this;
  uint64_t v21 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  if (a2)
  {
    unint64_t v4 = MGGetSInt64Answer();
    int v5 = v4 & 0xFFFFFF;
    if (HIDWORD(v4)) {
      int v5 = 0;
    }
    *((_DWORD *)v3 + 50) = v5;
    this = (BasebandRFDiagnostics *)MGGetSInt64Answer();
    *((void *)v3 + 26) = this;
    if (!*((_DWORD *)v3 + 50) || this == 0)
    {
      xpc_object_t v7 = *((void *)v3 + 5);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v8 = 2;
        _os_log_impl(&dword_263679000, v7, OS_LOG_TYPE_DEFAULT, "#I Failed to get AP tag info", buf, 2u);
        CFTypeRef v9 = cf;
        if (!cf) {
          return v8;
        }
      }
      else
      {
        uint64_t v8 = 2;
        CFTypeRef v9 = cf;
        if (!cf) {
          return v8;
        }
      }
      goto LABEL_42;
    }
  }
  if (capabilities::radio::vendor(this) - 3 < 0xFFFFFFFE)
  {
    unsigned int RFSelfTestTicket = 14;
    goto LABEL_15;
  }
  unsigned int RFSelfTestTicket = BasebandRFDiagnostics::getRFSelfTestTicket((const UInt8 **)v3, v2, 1u, (const __CFData **)&cf);
  if (!RFSelfTestTicket)
  {
    *(void *)buf = operator new(0x19uLL);
    *(_OWORD *)&buf[8] = xmmword_263688530;
    strcpy(*(char **)buf, "RFSelfTestTicketBlocked");
    int IntegerFromUserDefaults = BasebandDiagnostics::readIntegerFromUserDefaults((uint64_t)v3, (uint64_t *)buf);
    int v13 = IntegerFromUserDefaults;
    if ((buf[23] & 0x80000000) != 0)
    {
      operator delete(*(void **)buf);
      if (v13)
      {
LABEL_26:
        uint64_t v14 = *((void *)v3 + 5);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_263679000, v14, OS_LOG_TYPE_DEFAULT, "#I Access to RFSelfTestTicket is blocked", buf, 2u);
          uint64_t v8 = 5;
          CFTypeRef v9 = cf;
          if (!cf) {
            return v8;
          }
        }
        else
        {
          uint64_t v8 = 5;
          CFTypeRef v9 = cf;
          if (!cf) {
            return v8;
          }
        }
        goto LABEL_42;
      }
    }
    else if (IntegerFromUserDefaults)
    {
      goto LABEL_26;
    }
    buf[23] = 16;
    strcpy(buf, "RFSelfTestTicket");
    BOOL v15 = BasebandDiagnostics::saveToUserDefaults((uint64_t)v3, (uint64_t *)buf, (uint64_t)cf);
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    xpc_object_t v16 = *((void *)v3 + 5);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      xpc_object_t v17 = "Failed";
      if (v15) {
        xpc_object_t v17 = "Success";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v17;
      _os_log_impl(&dword_263679000, v16, OS_LOG_TYPE_DEFAULT, "#I Get signed ticket and save: %s", buf, 0xCu);
    }
    if (v15) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = 5;
    }
LABEL_41:
    CFTypeRef v9 = cf;
    if (!cf) {
      return v8;
    }
LABEL_42:
    CFRelease(v9);
    return v8;
  }
LABEL_15:
  size_t v11 = *((void *)v3 + 5);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = RFSelfTestTicket;
    _os_log_impl(&dword_263679000, v11, OS_LOG_TYPE_DEFAULT, "#I Failed to get signed ticket from Server w/ error: %d", buf, 8u);
  }
  uint64_t v8 = 4;
  if (RFSelfTestTicket <= 0x13 && ((1 << RFSelfTestTicket) & 0xE0002) != 0) {
    goto LABEL_41;
  }
  if (RFSelfTestTicket == 3194) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 3;
  }
  CFTypeRef v9 = cf;
  if (cf) {
    goto LABEL_42;
  }
  return v8;
}

void sub_26367C7D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BasebandRFDiagnostics::getRFSelfTestTicket(const UInt8 **this, BOOL a2, unsigned int a3, const __CFData **a4)
{
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], this[16], this[17] - this[16]);
  CFDataRef v7 = CFDataCreate(v5, this[20], this[21] - this[20]);
  uint64_t RFSelfTestTicket = AMAuthInstallBasebandGetRFSelfTestTicket();
  if (v7) {
    CFRelease(v7);
  }
  if (v6) {
    CFRelease(v6);
  }
  return RFSelfTestTicket;
}

void sub_26367C8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  unint64_t v4 = va_arg(va1, const void *);
  ctu::cf::CFSharedRef<__CFData const>::~CFSharedRef((const void **)va);
  ctu::cf::CFSharedRef<__CFData const>::~CFSharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

void sub_26367C8EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  ctu::cf::CFSharedRef<__CFData const>::~CFSharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void BasebandRFDiagnostics::clearRFSelfTestTicket(BasebandRFDiagnostics *this)
{
  BOOL v2 = *((void *)this + 5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__p = 0;
    _os_log_impl(&dword_263679000, v2, OS_LOG_TYPE_DEFAULT, "#I Clear ticket", (uint8_t *)__p, 2u);
  }
  char v4 = 16;
  strcpy(__p, "RFSelfTestTicket");
  BasebandDiagnostics::removeFromUserDefaults((uint64_t)this, (uint64_t *)__p);
  if (v4 < 0) {
    operator delete(*(void **)__p);
  }
}

void sub_26367C9AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BasebandRFDiagnostics::startBasebandRFSelfTestAST2Mode(BasebandRFDiagnostics *this)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  *(void *)buf = operator new(0x19uLL);
  *(_OWORD *)&buf[8] = xmmword_263688530;
  strcpy(*(char **)buf, "RFSelfTestTicketBlocked");
  if (BasebandDiagnostics::readIntegerFromUserDefaults((uint64_t)this, (uint64_t *)buf))
  {
    CFDataRef v2 = 0;
    CFDataRef v28 = 0;
    if ((char)buf[23] < 0)
    {
LABEL_14:
      operator delete(*(void **)buf);
      if (v2) {
        CFAllocatorRef v5 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
      }
      else {
        CFAllocatorRef v5 = 0;
      }
      if (v5) {
        goto LABEL_18;
      }
LABEL_23:
      uint64_t v8 = *((void *)this + 5);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_263679000, v8, OS_LOG_TYPE_DEFAULT, "#I Failed to restore ticket", buf, 2u);
      }
      uint64_t v9 = 6;
      if (v2) {
        goto LABEL_62;
      }
      return v9;
    }
  }
  else
  {
    HIBYTE(__p[2]) = 16;
    strcpy((char *)__p, "RFSelfTestTicket");
    CFDataRef ObjectFromUserDefaults = (const __CFData *)BasebandDiagnostics::readObjectFromUserDefaults((uint64_t)this, (uint64_t *)__p);
    CFDataRef v2 = ObjectFromUserDefaults;
    CFDataRef v28 = ObjectFromUserDefaults;
    if (ObjectFromUserDefaults) {
      CFRetain(ObjectFromUserDefaults);
    }
    if (SHIBYTE(__p[2]) < 0)
    {
      operator delete(__p[0]);
      if ((char)buf[23] < 0) {
        goto LABEL_14;
      }
    }
    else if ((char)buf[23] < 0)
    {
      goto LABEL_14;
    }
  }
  if (v2) {
    char v4 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    char v4 = 0;
  }
  if (!v4) {
    goto LABEL_23;
  }
LABEL_18:
  if (!CFDataGetLength(v2)) {
    goto LABEL_23;
  }
  memset(__p, 0, sizeof(__p));
  ctu::cf::assign();
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v6 || (xpc_object_t v6 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E67FD0](v6) == MEMORY[0x263EF8708])
    {
      xpc_retain(v6);
      xpc_object_t v7 = v6;
    }
    else
    {
      xpc_object_t v7 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t v6 = 0;
  }
  xpc_release(v6);
  xpc_object_t v10 = xpc_array_create(0, 0);
  if (v10 || (xpc_object_t v10 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E67FD0](v10) == MEMORY[0x263EF86D8])
    {
      xpc_retain(v10);
      xpc_object_t v11 = v10;
    }
    else
    {
      xpc_object_t v11 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v11 = xpc_null_create();
    xpc_object_t v10 = 0;
  }
  xpc_release(v10);
  v12 = (unsigned __int8 *)__p[0];
  for (i = (unsigned __int8 *)__p[1]; v12 != i; ++v12)
  {
    xpc_object_t v14 = xpc_int64_create(*v12);
    if (!v14) {
      xpc_object_t v14 = xpc_null_create();
    }
    xpc_array_append_value(v11, v14);
    xpc_release(v14);
  }
  xpc_object_t v15 = xpc_null_create();
  xpc_dictionary_set_value(v7, (const char *)*MEMORY[0x263F264B8], v15);
  xpc_object_t v16 = xpc_null_create();
  xpc_release(v16);
  xpc_release(v15);
  if (v11)
  {
    xpc_retain(v11);
    xpc_object_t v17 = v11;
  }
  else
  {
    xpc_object_t v17 = xpc_null_create();
  }
  memset(buf, 0, sizeof(buf));
  ctu::cf::assign();
  *(_OWORD *)__int16 v25 = *(_OWORD *)buf;
  uint64_t v26 = *(void *)&buf[16];
  if ((buf[23] & 0x80u) == 0) {
    xpc_object_t v18 = v25;
  }
  else {
    xpc_object_t v18 = *(void ***)buf;
  }
  xpc_dictionary_set_value(v7, (const char *)v18, v17);
  xpc_object_t v19 = xpc_null_create();
  xpc_release(v17);
  if (SHIBYTE(v26) < 0) {
    operator delete(v25[0]);
  }
  xpc_release(v19);
  if (v7)
  {
    xpc_retain(v7);
    xpc_object_t v20 = v7;
  }
  else
  {
    xpc_object_t v20 = xpc_null_create();
  }
  BOOL v21 = BasebandRFDiagnostics::sendCommandBasebandRequestRFSelfTest((uint64_t)this);
  xpc_release(v20);
  if (v21) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = 7;
  }
  v22 = *((void *)this + 5);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = "Failed";
    if (v21) {
      v23 = "Success";
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v23;
    _os_log_impl(&dword_263679000, v22, OS_LOG_TYPE_DEFAULT, "#I Start Baseband RF Self Test: %s", buf, 0xCu);
  }
  buf[23] = 16;
  strcpy((char *)buf, "RFSelfTestTicket");
  BasebandDiagnostics::removeFromUserDefaults((uint64_t)this, (uint64_t *)buf);
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  xpc_release(v11);
  xpc_release(v7);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  CFDataRef v2 = v28;
  if (v28) {
LABEL_62:
  }
    CFRelease(v2);
  return v9;
}

void sub_26367CE7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get(uint64_t a1)
{
  return *(void *)a1;
}

BOOL BasebandRFDiagnostics::sendCommandBasebandRequestRFSelfTest(uint64_t a1)
{
  xpc_object_t v23 = xpc_null_create();
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)BOOL v21 = v2;
  long long v22 = v2;
  int v3 = *(std::__shared_weak_count **)(a1 + 64);
  uint64_t v19 = *(void *)(a1 + 56);
  xpc_object_t v20 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  char v4 = (const void *)*MEMORY[0x263F26778];
  size_t v5 = strlen((const char *)*MEMORY[0x263F26778]);
  if (v5 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v6 = v5;
  if (v5 >= 0x17)
  {
    uint64_t v8 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17) {
      uint64_t v8 = v5 | 7;
    }
    uint64_t v9 = v8 + 1;
    p_dst = (long long *)operator new(v8 + 1);
    *((void *)&__dst + 1) = v6;
    int64_t v25 = v9 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    goto LABEL_10;
  }
  HIBYTE(v25) = v5;
  p_dst = &__dst;
  if (v5) {
LABEL_10:
  }
    memmove(p_dst, v4, v6);
  *((unsigned char *)p_dst + v6) = 0;
  abm::client::PerformCommand();
  if (SHIBYTE(v25) < 0) {
    operator delete((void *)__dst);
  }
  if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
    xpc_object_t v10 = v23;
    if (v23)
    {
LABEL_19:
      if (MEMORY[0x263E67FD0](v10) == MEMORY[0x263EF8708])
      {
        xpc_retain(v10);
        xpc_object_t v11 = v10;
      }
      else
      {
        xpc_object_t v11 = xpc_null_create();
      }
      goto LABEL_22;
    }
  }
  else
  {
    xpc_object_t v10 = v23;
    if (v23) {
      goto LABEL_19;
    }
  }
  xpc_object_t v10 = xpc_null_create();
  if (v10) {
    goto LABEL_19;
  }
  xpc_object_t v11 = xpc_null_create();
  xpc_object_t v10 = 0;
LABEL_22:
  xpc_release(v10);
  long long __dst = 0uLL;
  int64_t v25 = 0;
  ctu::cf::assign();
  *(_OWORD *)__p = __dst;
  int64_t v17 = v25;
  if (v25 >= 0) {
    v12 = __p;
  }
  else {
    v12 = (void **)__p[0];
  }
  xpc_object_t value = xpc_dictionary_get_value(v11, (const char *)v12);
  xpc_object_t object = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  *(_DWORD *)(a1 + 216) = xpc::dyn_cast_or_default();
  xpc_release(object);
  xpc_object_t object = 0;
  if (SHIBYTE(v17) < 0) {
    operator delete(__p[0]);
  }
  int v14 = (int)v21[0];
  xpc_release(v11);
  if (SHIBYTE(v22) < 0) {
    operator delete(v21[1]);
  }
  return v14 == 0;
}

void sub_26367D264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, xpc_object_t object, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  xpc_release(object);
  if (a14 < 0) {
    operator delete(a9);
  }
  xpc_release(v24);
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_26367D2D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  if (*(char *)(v5 - 49) < 0)
  {
    operator delete(*(void **)(v5 - 72));
    std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100]((uint64_t)va);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

const void **ctu::cf::CFSharedRef<__CFData const>::~CFSharedRef(const void **a1)
{
  long long v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t BasebandRFDiagnostics::startBasebandRFSelfTestFTMMode(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v6 || (xpc_object_t v6 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E67FD0](v6) == MEMORY[0x263EF8708])
    {
      xpc_retain(v6);
      xpc_object_t v7 = v6;
    }
    else
    {
      xpc_object_t v7 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t v6 = 0;
  }
  xpc_release(v6);
  xpc_object_t v8 = xpc_int64_create(1);
  if (!v8) {
    xpc_object_t v8 = xpc_null_create();
  }
  xpc_dictionary_set_value(v7, (const char *)*MEMORY[0x263F264B8], v8);
  xpc_object_t v9 = xpc_null_create();
  xpc_release(v8);
  xpc_release(v9);
  if (a2)
  {
    xpc_object_t v10 = xpc_int64_create(a2);
    if (!v10) {
      xpc_object_t v10 = xpc_null_create();
    }
    memset(buf, 0, sizeof(buf));
    ctu::cf::assign();
    *(_OWORD *)__p = 0u;
    uint64_t v23 = 0;
    xpc_dictionary_set_value(v7, (const char *)__p, v10);
    xpc_object_t v11 = xpc_null_create();
    xpc_release(v10);
    if (SHIBYTE(v23) < 0) {
      operator delete(__p[0]);
    }
    xpc_release(v11);
    xpc_object_t v12 = xpc_int64_create(a3);
    if (!v12) {
      xpc_object_t v12 = xpc_null_create();
    }
    memset(buf, 0, sizeof(buf));
    ctu::cf::assign();
    *(_OWORD *)__p = *(_OWORD *)buf;
    uint64_t v23 = *(void *)&buf[16];
    if ((buf[23] & 0x80u) == 0) {
      int v13 = __p;
    }
    else {
      int v13 = *(void ***)buf;
    }
    xpc_dictionary_set_value(v7, (const char *)v13, v12);
    xpc_object_t v14 = xpc_null_create();
    xpc_release(v12);
    if (SHIBYTE(v23) < 0) {
      operator delete(__p[0]);
    }
    xpc_release(v14);
    xpc_object_t object = v7;
    if (v7) {
      xpc_retain(v7);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    BOOL v17 = BasebandRFDiagnostics::sendCommandBasebandRequestRFSelfTest(a1);
    xpc_release(object);
    if (v17) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = 8;
    }
    xpc_object_t v18 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = "Failed";
      if (v17) {
        uint64_t v19 = "Success";
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = a3;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = v19;
      _os_log_impl(&dword_263679000, v18, OS_LOG_TYPE_DEFAULT, "#I Start Baseband RF Self Test (Type=%d) in FTM: %s", buf, 0x12u);
    }
  }
  else
  {
    xpc_object_t v15 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_263679000, v15, OS_LOG_TYPE_ERROR, "Invalid measType in RF Self Test", buf, 2u);
    }
    uint64_t v16 = 8;
  }
  xpc_release(v7);
  return v16;
}

void sub_26367D684(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t BasebandRFDiagnostics::getBasebandEstimatedTestTime(BasebandRFDiagnostics *this)
{
  return *((unsigned int *)this + 54);
}

uint64_t BasebandRFDiagnostics::setBasebandRFSelfTestTicket(BasebandRFDiagnostics *this)
{
  __p[5] = *(void **)MEMORY[0x263EF8340];
  __p[0] = operator new(0x19uLL);
  *(_OWORD *)&__p[1] = xmmword_263688530;
  strcpy((char *)__p[0], "RFSelfTestTicketBlocked");
  if (BasebandDiagnostics::readIntegerFromUserDefaults((uint64_t)this, (uint64_t *)__p))
  {
    long long v2 = 0;
    unint64_t v35 = 0;
    if (SHIBYTE(__p[2]) < 0) {
      goto LABEL_3;
    }
LABEL_12:
    if (v2) {
      uint64_t v5 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
    }
    else {
      uint64_t v5 = 0;
    }
    if (!v5) {
      goto LABEL_21;
    }
    goto LABEL_16;
  }
  HIBYTE(v34[2]) = 16;
  strcpy((char *)v34, "RFSelfTestTicket");
  CFDataRef ObjectFromUserDefaults = (const void *)BasebandDiagnostics::readObjectFromUserDefaults((uint64_t)this, v34);
  long long v2 = ObjectFromUserDefaults;
  unint64_t v35 = ObjectFromUserDefaults;
  if (ObjectFromUserDefaults) {
    CFRetain(ObjectFromUserDefaults);
  }
  if (SHIBYTE(v34[2]) < 0)
  {
    operator delete((void *)v34[0]);
    if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
      goto LABEL_12;
    }
  }
  else if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
  {
    goto LABEL_12;
  }
LABEL_3:
  operator delete(__p[0]);
  if (v2) {
    int v3 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    int v3 = 0;
  }
  if (!v3) {
    goto LABEL_21;
  }
LABEL_16:
  if (CFDataGetLength((CFDataRef)v2))
  {
    memset(v34, 0, sizeof(v34));
    ctu::cf::assign();
    xpc_object_t v6 = xpc_array_create(0, 0);
    if (v6 || (xpc_object_t v6 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x263E67FD0](v6) == MEMORY[0x263EF86D8])
      {
        xpc_retain(v6);
        xpc_object_t v7 = v6;
      }
      else
      {
        xpc_object_t v7 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v7 = xpc_null_create();
      xpc_object_t v6 = 0;
    }
    xpc_release(v6);
    xpc_object_t v10 = (unsigned __int8 *)v34[0];
    for (uint64_t i = v34[1]; v10 != (unsigned __int8 *)i; ++v10)
    {
      xpc_object_t v12 = xpc_int64_create(*v10);
      if (!v12) {
        xpc_object_t v12 = xpc_null_create();
      }
      xpc_array_append_value(v7, v12);
      xpc_release(v12);
    }
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    if (v13 || (xpc_object_t v13 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x263E67FD0](v13) == MEMORY[0x263EF8708])
      {
        xpc_retain(v13);
        xpc_object_t v14 = v13;
      }
      else
      {
        xpc_object_t v14 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v14 = xpc_null_create();
      xpc_object_t v13 = 0;
    }
    xpc_release(v13);
    if (v7)
    {
      xpc_retain(v7);
      xpc_object_t v15 = v7;
    }
    else
    {
      xpc_object_t v15 = xpc_null_create();
    }
    memset(__p, 0, 24);
    ctu::cf::assign();
    *(_OWORD *)long long __dst = *(_OWORD *)__p;
    long long v33 = __p[2];
    if (SHIBYTE(__p[2]) >= 0) {
      uint64_t v16 = __dst;
    }
    else {
      uint64_t v16 = (void **)__p[0];
    }
    xpc_dictionary_set_value(v14, (const char *)v16, v15);
    xpc_object_t v17 = xpc_null_create();
    xpc_release(v15);
    if (SHIBYTE(v33) < 0) {
      operator delete(__dst[0]);
    }
    xpc_release(v17);
    *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)__p = v18;
    *(_OWORD *)&__p[2] = v18;
    uint64_t v19 = (std::__shared_weak_count *)*((void *)this + 8);
    long long v31 = v19;
    if (v19) {
      atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    xpc_object_t v20 = (const void *)*MEMORY[0x263F267E0];
    size_t v21 = strlen((const char *)*MEMORY[0x263F267E0]);
    if (v21 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    long long v22 = (void *)v21;
    if (v21 >= 0x17)
    {
      uint64_t v24 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v21 | 7) != 0x17) {
        uint64_t v24 = v21 | 7;
      }
      uint64_t v25 = v24 + 1;
      uint64_t v23 = operator new(v24 + 1);
      __dst[1] = v22;
      long long v33 = (void *)(v25 | 0x8000000000000000);
      __dst[0] = v23;
    }
    else
    {
      HIBYTE(v33) = v21;
      uint64_t v23 = __dst;
      if (!v21)
      {
LABEL_57:
        *((unsigned char *)v22 + (void)v23) = 0;
        abm::client::PerformCommand();
        if (SHIBYTE(v33) < 0)
        {
          operator delete(__dst[0]);
          uint64_t v26 = v31;
          if (!v31) {
            goto LABEL_62;
          }
        }
        else
        {
          uint64_t v26 = v31;
          if (!v31) {
            goto LABEL_62;
          }
        }
        if (!atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
          int v27 = (int)__p[0];
          if (LODWORD(__p[0])) {
            uint64_t v9 = 7;
          }
          else {
            uint64_t v9 = 0;
          }
          if (SHIBYTE(__p[3]) < 0) {
            goto LABEL_66;
          }
          goto LABEL_67;
        }
LABEL_62:
        int v27 = (int)__p[0];
        if (LODWORD(__p[0])) {
          uint64_t v9 = 7;
        }
        else {
          uint64_t v9 = 0;
        }
        if (SHIBYTE(__p[3]) < 0) {
LABEL_66:
        }
          operator delete(__p[1]);
LABEL_67:
        xpc_release(v14);
        xpc_release(v7);
        if (v34[0])
        {
          v34[1] = v34[0];
          operator delete((void *)v34[0]);
        }
        CFDataRef v28 = *((void *)this + 5);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          long long v29 = "Failed";
          if (!v27) {
            long long v29 = "Success";
          }
          LODWORD(__p[0]) = 136315138;
          *(void **)((char *)__p + 4) = (void *)v29;
          _os_log_impl(&dword_263679000, v28, OS_LOG_TYPE_DEFAULT, "#I Set RF Self Test Ticket to baseband: %s", (uint8_t *)__p, 0xCu);
        }
        HIBYTE(__p[2]) = 16;
        strcpy((char *)__p, "RFSelfTestTicket");
        BasebandDiagnostics::removeFromUserDefaults((uint64_t)this, (uint64_t *)__p);
        if (SHIBYTE(__p[2]) < 0)
        {
          operator delete(__p[0]);
          long long v2 = v35;
          if (!v35) {
            return v9;
          }
        }
        else
        {
          long long v2 = v35;
          if (!v35) {
            return v9;
          }
        }
LABEL_77:
        CFRelease(v2);
        return v9;
      }
    }
    memmove(v23, v20, (size_t)v22);
    goto LABEL_57;
  }
LABEL_21:
  xpc_object_t v8 = *((void *)this + 5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl(&dword_263679000, v8, OS_LOG_TYPE_DEFAULT, "#I Failed to restore ticket", (uint8_t *)__p, 2u);
  }
  uint64_t v9 = 6;
  if (v2) {
    goto LABEL_77;
  }
  return v9;
}

void sub_26367DD20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t BasebandRFDiagnostics::prepareRFSelfTest(BasebandRFDiagnostics *this)
{
  return 1;
}

BOOL BasebandRFDiagnostics::createNum64Num32FromData(uint64_t a1, CFDataRef theData, const void **a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (!theData || !a3)
  {
    xpc_object_t v14 = *(NSObject **)(a1 + 40);
    BOOL result = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_WORD *)long long __dst = 0;
    uint64_t v16 = "Null param";
LABEL_19:
    xpc_object_t v17 = v14;
    uint32_t v18 = 2;
LABEL_20:
    _os_log_error_impl(&dword_263679000, v17, OS_LOG_TYPE_ERROR, v16, __dst, v18);
    return 0;
  }
  BytePtr = CFDataGetBytePtr(theData);
  if (!BytePtr)
  {
    xpc_object_t v14 = *(NSObject **)(a1 + 40);
    BOOL result = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_WORD *)long long __dst = 0;
    uint64_t v16 = "Get byte pointer failed";
    goto LABEL_19;
  }
  xpc_object_t v7 = BytePtr;
  CFIndex Length = CFDataGetLength(theData);
  CFIndex v9 = Length;
  if ((Length & 0x8000000000000000) == 0 && Length < 9uLL)
  {
    if (Length < 5uLL)
    {
      *(_DWORD *)long long __dst = 0;
      memcpy(__dst, v7, Length);
      CFNumberRef v20 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, __dst);
      size_t v21 = *a3;
      *a3 = v20;
      if (v21)
      {
        CFRelease(v21);
        CFNumberRef v20 = (CFNumberRef)*a3;
      }
      if (v20) {
        long long v22 = ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get;
      }
      else {
        long long v22 = 0;
      }
      if (!v22)
      {
        xpc_object_t v13 = *(NSObject **)(a1 + 40);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          return 0;
        }
        goto LABEL_32;
      }
    }
    else
    {
      *(void *)long long __dst = 0;
      memcpy(__dst, v7, Length);
      CFNumberRef v10 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, __dst);
      xpc_object_t v11 = *a3;
      *a3 = v10;
      if (v11)
      {
        CFRelease(v11);
        CFNumberRef v10 = (CFNumberRef)*a3;
      }
      if (v10) {
        xpc_object_t v12 = ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get;
      }
      else {
        xpc_object_t v12 = 0;
      }
      if (!v12)
      {
        xpc_object_t v13 = *(NSObject **)(a1 + 40);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
LABEL_32:
          *(_WORD *)uint64_t v24 = 0;
          _os_log_error_impl(&dword_263679000, v13, OS_LOG_TYPE_ERROR, "Data allocation error during conversion", v24, 2u);
        }
        return 0;
      }
    }
    return 1;
  }
  uint64_t v19 = *(NSObject **)(a1 + 40);
  BOOL result = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_DWORD *)long long __dst = 134217984;
    *(void *)&__dst[4] = v9;
    uint64_t v16 = "Data size wrong %lu";
    xpc_object_t v17 = v19;
    uint32_t v18 = 12;
    goto LABEL_20;
  }
  return result;
}

void sub_26367E164(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2655D31D0, MEMORY[0x263F8C060]);
}

void sub_26367E1D8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  BOOL result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C340] + 64;
  *(void *)(a1 + 112) = MEMORY[0x263F8C340] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  uint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x263F8C340] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_26367E390(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x263E67C70](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C8];
  uint64_t v3 = *MEMORY[0x263F8C2C8];
  *(void *)a1 = *MEMORY[0x263F8C2C8];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x263E67C70](a1 + 112);
  return a1;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x263E67B70](v13, a1);
  if (LOBYTE(v13[0]))
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      CFNumberRef v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x263E67B80](v13);
  return a1;
}

void sub_26367E60C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x263E67B80](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x26367E5ECLL);
}

void sub_26367E660(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      size_t v12 = 0;
    }
    else {
      size_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if ((uint64_t)v12 >= 1)
    {
      memset(__b, 170, sizeof(__b));
      if (v12 >= 0x7FFFFFFFFFFFFFF8) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v12 >= 0x17)
      {
        uint64_t v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v14 = v12 | 7;
        }
        uint64_t v15 = v14 + 1;
        xpc_object_t v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        __b[2] = (void *)(v15 | 0x8000000000000000);
        __b[0] = v13;
      }
      else
      {
        HIBYTE(__b[2]) = v12;
        xpc_object_t v13 = __b;
      }
      memset(v13, __c, v12);
      *((unsigned char *)v13 + v12) = 0;
      if (SHIBYTE(__b[2]) >= 0) {
        uint64_t v16 = __b;
      }
      else {
        uint64_t v16 = (void **)__b[0];
      }
      uint64_t v17 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(void *)v6 + 96))(v6, v16, v12);
      uint64_t v18 = v17;
      if (SHIBYTE(__b[2]) < 0)
      {
        operator delete(__b[0]);
        if (v18 != v12) {
          return 0;
        }
      }
      else if (v17 != v12)
      {
        return 0;
      }
    }
    uint64_t v19 = a4 - a3;
    if (v19 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v19) == v19)
    {
      *(void *)(a5 + 24) = 0;
      return v6;
    }
    return 0;
  }
  return v6;
}

void sub_26367E854(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<BasebandRFDiagnostics *,std::shared_ptr<BasebandRFDiagnostics> ctu::SharedSynchronizable<BasebandDiagnostics>::make_shared_ptr<BasebandRFDiagnostics>(BasebandRFDiagnostics*)::{lambda(BasebandRFDiagnostics *)#1},std::allocator<BasebandRFDiagnostics>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<BasebandRFDiagnostics *,std::shared_ptr<BasebandRFDiagnostics> ctu::SharedSynchronizable<BasebandDiagnostics>::make_shared_ptr<BasebandRFDiagnostics>(BasebandRFDiagnostics*)::{lambda(BasebandRFDiagnostics *)#1},std::allocator<BasebandRFDiagnostics>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<BasebandRFDiagnostics *,std::shared_ptr<BasebandRFDiagnostics> ctu::SharedSynchronizable<BasebandDiagnostics>::make_shared_ptr<BasebandRFDiagnostics>(BasebandRFDiagnostics*)::{lambda(BasebandRFDiagnostics *)#1},std::allocator<BasebandRFDiagnostics>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableI19BasebandDiagnosticsE15make_shared_ptrI21BasebandRFDiagnosticsEENSt3_"
                     "_110shared_ptrIT_EEPS7_EUlPS4_E_")
    return a1 + 24;
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableI19BasebandDiagnosticsE15make_shared_ptrI21BasebandRFDiagnos"
                                "ticsEENSt3__110shared_ptrIT_EEPS7_EUlPS4_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableI19BasebandDiagnosticsE15make_shared_ptrI21BasebandRFDiagnosticsEENSt3__110shared_ptrIT_EEPS7_EUlPS4_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableI19BasebandDiagnosticsE15make_shared_ptrI21BasebandRFDiagnosticsEENSt3__110shared_ptrIT_EEPS7_EUlPS4_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

uint64_t std::shared_ptr<BasebandRFDiagnostics> ctu::SharedSynchronizable<BasebandDiagnostics>::make_shared_ptr<BasebandRFDiagnostics>(BasebandRFDiagnostics*)::{lambda(BasebandRFDiagnostics*)#1}::operator() const(BasebandRFDiagnostics*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 16))();
  }
  return result;
}

uint64_t ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t config::hw::watch(config::hw *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_26A99EF40;
  if (!off_26A99EF40)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v9, v1);
    long long v3 = v9;
    long long v9 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_26A99EF40 + 1);
    off_26A99EF40 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    uint64_t v5 = (std::__shared_weak_count *)*((void *)&v9 + 1);
    if (*((void *)&v9 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v9 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = off_26A99EF40;
  }
  uint64_t v6 = (std::__shared_weak_count *)*(&off_26A99EF40 + 1);
  if (*(&off_26A99EF40 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99EF40 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 144))(v2);
  uint64_t v8 = result;
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

void sub_26367EAF0(_Unwind_Exception *a1)
{
}

void sub_26367EB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t config::hw::iPad(config::hw *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_26A99EF40;
  if (!off_26A99EF40)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v9, v1);
    long long v3 = v9;
    long long v9 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_26A99EF40 + 1);
    off_26A99EF40 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    uint64_t v5 = (std::__shared_weak_count *)*((void *)&v9 + 1);
    if (*((void *)&v9 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v9 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = off_26A99EF40;
  }
  uint64_t v6 = (std::__shared_weak_count *)*(&off_26A99EF40 + 1);
  if (*(&off_26A99EF40 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99EF40 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 136))(v2);
  uint64_t v8 = result;
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

void sub_26367ECB4(_Unwind_Exception *a1)
{
}

void sub_26367ECD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void config::hw::product(config::hw *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_26A99EF40;
  if (!off_26A99EF40)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v7, v1);
    long long v3 = v7;
    long long v7 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_26A99EF40 + 1);
    off_26A99EF40 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    uint64_t v5 = (std::__shared_weak_count *)*((void *)&v7 + 1);
    if (*((void *)&v7 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = off_26A99EF40;
  }
  uint64_t v6 = (std::__shared_weak_count *)*(&off_26A99EF40 + 1);
  if (*(&off_26A99EF40 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99EF40 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(uint64_t))(*(void *)v2 + 48))(v2);
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_26367EE80(_Unwind_Exception *a1)
{
}

void sub_26367EE9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void config::hw::deviceMaterial(config::hw *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_26A99EF40;
  if (!off_26A99EF40)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v7, v1);
    long long v3 = v7;
    long long v7 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_26A99EF40 + 1);
    off_26A99EF40 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    uint64_t v5 = (std::__shared_weak_count *)*((void *)&v7 + 1);
    if (*((void *)&v7 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = off_26A99EF40;
  }
  uint64_t v6 = (std::__shared_weak_count *)*(&off_26A99EF40 + 1);
  if (*(&off_26A99EF40 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99EF40 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(uint64_t))(*(void *)v2 + 104))(v2);
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_26367F04C(_Unwind_Exception *a1)
{
}

void sub_26367F068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void config::hw::getBootArgs(std::string *a1@<X8>)
{
  memset(v41, 170, 24);
  long long v3 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v4 = off_26A99EF40;
  if (!off_26A99EF40)
  {
    ctu::Gestalt::create_default_global((uint64_t *)__p, v3);
    long long v5 = *(_OWORD *)__p;
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v6 = (std::__shared_weak_count *)*(&off_26A99EF40 + 1);
    off_26A99EF40 = v5;
    if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
    long long v7 = (std::__shared_weak_count *)__p[1];
    if (__p[1] && !atomic_fetch_add((atomic_ullong *volatile)__p[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    uint64_t v4 = off_26A99EF40;
  }
  uint64_t v8 = (std::__shared_weak_count *)*(&off_26A99EF40 + 1);
  v41[3] = v4;
  v41[4] = *(&off_26A99EF40 + 1);
  if (*(&off_26A99EF40 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99EF40 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(void *__return_ptr, uint64_t))(*(void *)v4 + 112))(v41, v4);
  if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
  HIBYTE(v40) = 9;
  strcpy((char *)__p, "boot-args");
  long long v9 = (void *)v41[1];
  if (v41[1])
  {
    while (1)
    {
      uint64_t v11 = v9;
      uint64_t v14 = (const void *)v9[4];
      size_t v12 = v9 + 4;
      xpc_object_t v13 = v14;
      int v15 = *((char *)v12 + 23);
      if (v15 >= 0) {
        uint64_t v16 = v12;
      }
      else {
        uint64_t v16 = v13;
      }
      if (v15 >= 0) {
        unint64_t v17 = *((unsigned __int8 *)v12 + 23);
      }
      else {
        unint64_t v17 = v12[1];
      }
      if (v17 >= 9) {
        size_t v18 = 9;
      }
      else {
        size_t v18 = v17;
      }
      int v19 = memcmp(__p, v16, v18);
      if (v19)
      {
        if (v19 < 0) {
          goto LABEL_16;
        }
LABEL_30:
        int v20 = memcmp(v16, __p, v18);
        if (v20)
        {
          if ((v20 & 0x80000000) == 0) {
            goto LABEL_55;
          }
        }
        else if (v17 >= 9)
        {
LABEL_55:
          size_t v21 = (char *)v11;
          if (*((char *)v11 + 79) < 0) {
            goto LABEL_56;
          }
LABEL_68:
          long long v38 = *(_OWORD *)(v21 + 56);
          a1->__r_.__value_.__r.__words[2] = *((void *)v21 + 9);
          *(_OWORD *)&a1->__r_.__value_.__l.__data_ = v38;
          if (SHIBYTE(v40) < 0) {
            goto LABEL_69;
          }
          goto LABEL_57;
        }
        long long v9 = (void *)v11[1];
        if (!v9)
        {
          CFNumberRef v10 = (char **)(v11 + 1);
          goto LABEL_37;
        }
      }
      else
      {
        if (v17 <= 9) {
          goto LABEL_30;
        }
LABEL_16:
        long long v9 = (void *)*v11;
        CFNumberRef v10 = (char **)v11;
        if (!*v11) {
          goto LABEL_37;
        }
      }
    }
  }
  CFNumberRef v10 = (char **)&v41[1];
  uint64_t v11 = &v41[1];
LABEL_37:
  size_t v21 = (char *)operator new(0x50uLL);
  *((_OWORD *)v21 + 2) = *(_OWORD *)__p;
  uint64_t v22 = v40;
  __p[1] = 0;
  uint64_t v40 = 0;
  __p[0] = 0;
  *((void *)v21 + 6) = v22;
  *((void *)v21 + 7) = 0;
  *((void *)v21 + 8) = 0;
  *((void *)v21 + 9) = 0;
  *(void *)size_t v21 = 0;
  *((void *)v21 + 1) = 0;
  *((void *)v21 + 2) = v11;
  *CFNumberRef v10 = v21;
  uint64_t v23 = v21;
  if (*(void *)v41[0])
  {
    v41[0] = *(void *)v41[0];
    uint64_t v23 = *v10;
  }
  uint64_t v24 = (char *)v41[1];
  BOOL v25 = v23 == (char *)v41[1];
  v23[24] = v23 == (char *)v41[1];
  if (!v25)
  {
    do
    {
      uint64_t v26 = *((void *)v23 + 2);
      if (*(unsigned char *)(v26 + 24)) {
        break;
      }
      int v27 = *(char **)(v26 + 16);
      uint64_t v28 = *(void *)v27;
      if (*(void *)v27 == v26)
      {
        uint64_t v31 = *((void *)v27 + 1);
        if (!v31 || (v32 = *(unsigned __int8 *)(v31 + 24), long long v29 = (unsigned char *)(v31 + 24), v32))
        {
          if (*(char **)v26 == v23)
          {
            *(unsigned char *)(v26 + 24) = 1;
            v27[24] = 0;
            uint64_t v35 = *(void *)(v26 + 8);
            *(void *)int v27 = v35;
            if (v35) {
              goto LABEL_53;
            }
          }
          else
          {
            long long v33 = *(uint64_t **)(v26 + 8);
            uint64_t v34 = *v33;
            *(void *)(v26 + 8) = *v33;
            if (v34)
            {
              *(void *)(v34 + 16) = v26;
              int v27 = *(char **)(v26 + 16);
            }
            v33[2] = (uint64_t)v27;
            *(void *)(*(void *)(v26 + 16) + 8 * (**(void **)(v26 + 16) != v26)) = v33;
            *long long v33 = v26;
            *(void *)(v26 + 16) = v33;
            int v27 = (char *)v33[2];
            uint64_t v26 = *(void *)v27;
            *((unsigned char *)v33 + 24) = 1;
            v27[24] = 0;
            uint64_t v35 = *(void *)(v26 + 8);
            *(void *)int v27 = v35;
            if (v35) {
LABEL_53:
            }
              *(void *)(v35 + 16) = v27;
          }
          *(void *)(v26 + 16) = *((void *)v27 + 2);
          *(void *)(*((void *)v27 + 2) + 8 * (**((void **)v27 + 2) != (void)v27)) = v26;
          *(void *)(v26 + 8) = v27;
LABEL_66:
          *((void *)v27 + 2) = v26;
          break;
        }
      }
      else if (!v28 || (int v30 = *(unsigned __int8 *)(v28 + 24), v29 = (unsigned char *)(v28 + 24), v30))
      {
        if (*(char **)v26 == v23)
        {
          uint64_t v36 = *((void *)v23 + 1);
          *(void *)uint64_t v26 = v36;
          if (v36)
          {
            *(void *)(v36 + 16) = v26;
            int v27 = *(char **)(v26 + 16);
          }
          *((void *)v23 + 2) = v27;
          *(void *)(*(void *)(v26 + 16) + 8 * (**(void **)(v26 + 16) != v26)) = v23;
          *((void *)v23 + 1) = v26;
          *(void *)(v26 + 16) = v23;
          int v27 = (char *)*((void *)v23 + 2);
        }
        else
        {
          uint64_t v23 = (char *)*((void *)v23 + 2);
        }
        v23[24] = 1;
        v27[24] = 0;
        uint64_t v26 = *((void *)v27 + 1);
        xpc_object_t v37 = *(char **)v26;
        *((void *)v27 + 1) = *(void *)v26;
        if (v37) {
          *((void *)v37 + 2) = v27;
        }
        *(void *)(v26 + 16) = *((void *)v27 + 2);
        *(void *)(*((void *)v27 + 2) + 8 * (**((void **)v27 + 2) != (void)v27)) = v26;
        *(void *)uint64_t v26 = v27;
        goto LABEL_66;
      }
      *(unsigned char *)(v26 + 24) = 1;
      uint64_t v23 = v27;
      v27[24] = v27 == v24;
      unsigned char *v29 = 1;
    }
    while (v27 != v24);
  }
  ++v41[2];
  if ((v21[79] & 0x80000000) == 0) {
    goto LABEL_68;
  }
LABEL_56:
  std::string::__init_copy_ctor_external(a1, *((const std::string::value_type **)v21 + 7), *((void *)v21 + 8));
  if (SHIBYTE(v40) < 0) {
LABEL_69:
  }
    operator delete(__p[0]);
LABEL_57:
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v41[1]);
}

void sub_26367F53C(_Unwind_Exception *a1)
{
}

void sub_26367F558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_26367F570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a16);
  _Unwind_Resume(a1);
}

void config::hw::regionCode(config::hw *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_26A99EF40;
  if (!off_26A99EF40)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v7, v1);
    long long v3 = v7;
    long long v7 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_26A99EF40 + 1);
    off_26A99EF40 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    long long v5 = (std::__shared_weak_count *)*((void *)&v7 + 1);
    if (*((void *)&v7 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = off_26A99EF40;
  }
  uint64_t v6 = (std::__shared_weak_count *)*(&off_26A99EF40 + 1);
  if (*(&off_26A99EF40 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99EF40 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(uint64_t))(*(void *)v2 + 72))(v2);
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_26367F72C(_Unwind_Exception *a1)
{
}

void sub_26367F748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void config::hw::regionInfo(config::hw *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_26A99EF40;
  if (!off_26A99EF40)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v7, v1);
    long long v3 = v7;
    long long v7 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_26A99EF40 + 1);
    off_26A99EF40 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    long long v5 = (std::__shared_weak_count *)*((void *)&v7 + 1);
    if (*((void *)&v7 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = off_26A99EF40;
  }
  uint64_t v6 = (std::__shared_weak_count *)*(&off_26A99EF40 + 1);
  if (*(&off_26A99EF40 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99EF40 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (*(void (**)(uint64_t))(*(void *)v2 + 64))(v2);
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_26367F8F8(_Unwind_Exception *a1)
{
}

void sub_26367F914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t config::build::carrier(config::build *this)
{
  uint64_t result = TelephonyUtilIsCarrierBuild();
  if (result) {
    return TelephonyUtilIsInternalBuild() ^ 1;
  }
  return result;
}

uint64_t config::build::internal_or_carrier(config::build *this)
{
  if (TelephonyUtilIsInternalBuild()) {
    return 1;
  }

  return TelephonyUtilIsCarrierBuild();
}

void config::build::version(config::build *this)
{
  uint64_t v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = (void (***)(void))off_26A99EF40;
  if (!off_26A99EF40)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v7, v1);
    long long v3 = v7;
    long long v7 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*(&off_26A99EF40 + 1);
    off_26A99EF40 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    long long v5 = (std::__shared_weak_count *)*((void *)&v7 + 1);
    if (*((void *)&v7 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = (void (***)(void))off_26A99EF40;
  }
  uint64_t v6 = (std::__shared_weak_count *)*(&off_26A99EF40 + 1);
  if (*(&off_26A99EF40 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99EF40 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  (**v2)(v2);
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_26367FB24(_Unwind_Exception *a1)
{
}

void sub_26367FB40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy(uint64_t a1)
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
  long long v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v3 || atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return a1;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  long long v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    long long v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(uint64_t a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*(void *)a1);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*(void *)(a1 + 8));
    if (*(char *)(a1 + 79) < 0)
    {
      operator delete(*(void **)(a1 + 56));
      if ((*(char *)(a1 + 55) & 0x80000000) == 0)
      {
LABEL_4:
        uint64_t v2 = (void *)a1;
LABEL_6:
        operator delete(v2);
        return;
      }
    }
    else if ((*(char *)(a1 + 55) & 0x80000000) == 0)
    {
      goto LABEL_4;
    }
    operator delete(*(void **)(a1 + 32));
    uint64_t v2 = (void *)a1;
    goto LABEL_6;
  }
}

uint64_t __cxx_global_var_init()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy, &ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance, &dword_263679000);
  }
  return result;
}

uint64_t *sGetDiagnosticsLogHandler(void)
{
  if (qword_26A99EF58 != -1) {
    dispatch_once(&qword_26A99EF58, &__block_literal_global);
  }
  return &_MergedGlobals;
}

os_log_t ___Z25sGetDiagnosticsLogHandlerv_block_invoke()
{
  os_log_t result = os_log_create("com.apple.telephony.abm", "abm.diagnostics");
  _MergedGlobals = (uint64_t)result;
  return result;
}

const char *radio::asString(char *a1)
{
  unint64_t v1 = *a1;
  if (v1 > 7) {
    return "Unknown";
  }
  else {
    return off_2655D3578[v1];
  }
}

{
  unint64_t v1;

  unint64_t v1 = *a1;
  if (v1 > 2) {
    return "FactoryCalibrationStatus::kUnknown";
  }
  else {
    return off_2655D3670[v1];
  }
}

{
  unint64_t v1;

  unint64_t v1 = *a1;
  if (v1 > 2) {
    return "RFCalibrationStatus::kUnknown";
  }
  else {
    return off_2655D36A0[v1];
  }
}

void radio::OpMode::~OpMode(radio::OpMode *this)
{
  uint64_t v2 = (void *)*((void *)this + 1);
  *((void *)this + 2) = v2;
  long long v3 = (void *)*((void *)this + 4);
  if (v3)
  {
    *((void *)this + 5) = v3;
    operator delete(v3);
    uint64_t v2 = (void *)*((void *)this + 1);
  }
  if (v2)
  {
    *((void *)this + 2) = v2;
    operator delete(v2);
  }
}

{
  void *v2;
  void *v3;

  uint64_t v2 = (void *)*((void *)this + 1);
  *((void *)this + 2) = v2;
  long long v3 = (void *)*((void *)this + 4);
  if (v3)
  {
    *((void *)this + 5) = v3;
    operator delete(v3);
    uint64_t v2 = (void *)*((void *)this + 1);
  }
  if (v2)
  {
    *((void *)this + 2) = v2;
    operator delete(v2);
  }
}

void radio::OpMode::create(void *a1@<X8>)
{
  *a1 = 0xAAAAAAAAAAAAAAAALL;
  a1[1] = 0xAAAAAAAAAAAAAAAALL;
  long long v3 = (char *)operator new(0x50uLL);
  *((void *)v3 + 1) = 0;
  *((void *)v3 + 2) = 0;
  *(void *)long long v3 = &unk_270EA3510;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *((void *)v3 + 9) = 0;
  a1[1] = v3;
  *(_OWORD *)(v3 + 24) = 0u;
  v3 += 24;
  *a1 = v3;
  radio::OpMode::init((radio::OpMode *)v3);
}

void sub_26367FF60(_Unwind_Exception *a1)
{
  std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void radio::OpMode::init(radio::OpMode *this)
{
  *(unsigned char *)this = 8;
  *((_WORD *)this + 1) = 0;
  int RadioVendor = TelephonyRadiosGetRadioVendor();
  if ((RadioVendor - 2) < 2)
  {
    std::string::size_type v7 = operator new(7uLL);
    *(_DWORD *)std::string::size_type v7 = 262657;
    v7[2] = 1536;
    *((unsigned char *)v7 + 6) = 7;
    long long v5 = (void *)*((void *)this + 1);
    *((void *)this + 1) = v7;
    *((void *)this + 2) = (char *)v7 + 7;
    *((void *)this + 3) = (char *)v7 + 7;
    if (!v5) {
      return;
    }
    goto LABEL_9;
  }
  if (RadioVendor == 4)
  {
    uint64_t v8 = operator new(2uLL);
    long long v5 = (void *)*((void *)this + 1);
    *((void *)this + 1) = v8;
    *v8++ = 1;
    *((void *)this + 2) = v8;
    *((void *)this + 3) = v8;
    if (!v5) {
      return;
    }
    goto LABEL_9;
  }
  if (RadioVendor == 1)
  {
    long long v3 = operator new(8uLL);
    void *v3 = 0xB09050403020100;
    uint64_t v4 = operator new(8uLL);
    void *v4 = 0x3000200010000;
    long long v5 = (void *)*((void *)this + 1);
    *((void *)this + 1) = v3;
    *((void *)this + 2) = v3 + 1;
    std::string::size_type v6 = (void *)*((void *)this + 4);
    *((void *)this + 3) = v3 + 1;
    *((void *)this + 4) = v4;
    *((void *)this + 5) = v4 + 1;
    *((void *)this + 6) = v4 + 1;
    if (v6) {
      operator delete(v6);
    }
    if (v5)
    {
LABEL_9:
      operator delete(v5);
    }
  }
}

void sub_2636800AC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

unsigned char *radio::OpMode::setMode(unsigned char *result, char a2)
{
  *os_log_t result = a2;
  return result;
}

uint64_t radio::OpMode::setMode(uint64_t this, int a2)
{
  uint64_t v2 = *(void *)(this + 8);
  uint64_t v3 = *(void *)(this + 16);
  if (v2 == v3)
  {
LABEL_5:
    LOBYTE(v4) = 8;
  }
  else
  {
    uint64_t v4 = 0;
    while (*(unsigned __int8 *)(v2 + v4) != a2)
    {
      ++v4;
      if (v2 + v4 == v3) {
        goto LABEL_5;
      }
    }
  }
  *(unsigned char *)this = v4;
  return this;
}

uint64_t radio::OpMode::convertMode(radio::OpMode *this, int a2)
{
  uint64_t v2 = *((void *)this + 1);
  uint64_t v3 = *((void *)this + 2);
  if (v2 == v3)
  {
LABEL_5:
    LOBYTE(v4) = 8;
  }
  else
  {
    uint64_t v4 = 0;
    while (*(unsigned __int8 *)(v2 + v4) != a2)
    {
      ++v4;
      if (v2 + v4 == v3) {
        goto LABEL_5;
      }
    }
  }
  return v4;
}

uint64_t radio::OpMode::getMode(radio::OpMode *this)
{
  return *(unsigned __int8 *)this;
}

uint64_t radio::OpMode::getModeValue(radio::OpMode *this)
{
  unint64_t v1 = *(unsigned __int8 *)this;
  uint64_t v2 = *((void *)this + 1);
  if (*((void *)this + 2) - v2 <= v1) {
    return 255;
  }
  else {
    return *(unsigned __int8 *)(v2 + v1);
  }
}

uint64_t radio::OpMode::convertMode(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (*(void *)(a1 + 16) - v2 <= (unint64_t)a2) {
    return 255;
  }
  else {
    return *(unsigned __int8 *)(v2 + a2);
  }
}

uint64_t radio::OpMode::setConfig(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 2) = a2;
  return result;
}

uint64_t radio::OpMode::setConfig(uint64_t this, int a2)
{
  uint64_t v2 = *(unsigned __int16 **)(this + 32);
  uint64_t v3 = *(unsigned __int16 **)(this + 40);
  if (v2 == v3)
  {
LABEL_5:
    __int16 v4 = 0;
  }
  else
  {
    __int16 v4 = 0;
    while (*v2 != a2)
    {
      ++v2;
      ++v4;
      if (v2 == v3) {
        goto LABEL_5;
      }
    }
  }
  *(_WORD *)(this + 2) = v4;
  return this;
}

uint64_t radio::OpMode::convertConfig(radio::OpMode *this, int a2)
{
  uint64_t v2 = (unsigned __int16 *)*((void *)this + 4);
  uint64_t v3 = (unsigned __int16 *)*((void *)this + 5);
  if (v2 == v3)
  {
    return 0;
  }
  else
  {
    unsigned __int16 v4 = 0;
    while (*v2 != a2)
    {
      ++v2;
      ++v4;
      if (v2 == v3) {
        return 0;
      }
    }
  }
  return v4;
}

uint64_t radio::OpMode::getConfig(radio::OpMode *this)
{
  return *((unsigned __int16 *)this + 1);
}

uint64_t radio::OpMode::getConfigValue(radio::OpMode *this)
{
  unint64_t v1 = *((unsigned __int8 *)this + 2);
  uint64_t v2 = *((void *)this + 4);
  if (v1 >= (*((void *)this + 5) - v2) >> 1) {
    return 0xFFFFLL;
  }
  else {
    return *(unsigned __int16 *)(v2 + 2 * v1);
  }
}

uint64_t radio::OpMode::convertConfig(uint64_t a1, unsigned __int8 a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2 >= (unint64_t)((*(void *)(a1 + 40) - v2) >> 1)) {
    return 0xFFFFLL;
  }
  else {
    return *(unsigned __int16 *)(v2 + 2 * a2);
  }
}

BOOL radio::OpMode::allowModeChange(radio::OpMode *this)
{
  unsigned int v1 = *((unsigned __int16 *)this + 1);
  if (v1 < 2) {
    return 1;
  }
  if (v1 == 3)
  {
    int v3 = *(unsigned __int8 *)this;
    if ((v3 & 0xFE) == 4) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)this;
  }
  return v3 != 2;
}

uint64_t radio::OpMode::getModeString@<X0>(radio::OpMode *this@<X0>, unsigned char *a2@<X8>)
{
  return radio::OpMode::modeToString((uint64_t)this, *(unsigned __int8 *)this, a2);
}

uint64_t radio::OpMode::modeToString@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, unsigned char *a3@<X8>)
{
  unint64_t v39 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v38[7] = v6;
  v38[8] = v6;
  v38[5] = v6;
  v38[6] = v6;
  v38[3] = v6;
  v38[4] = v6;
  v38[1] = v6;
  v38[2] = v6;
  long long v37 = v6;
  v38[0] = v6;
  *(_OWORD *)__p = v6;
  long long v36 = v6;
  long long v33 = v6;
  *(_OWORD *)__src = v6;
  long long v31 = v6;
  long long v32 = v6;
  long long v30 = v6;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v30);
  if (a2 > 7) {
    std::string::size_type v7 = "Unknown";
  }
  else {
    std::string::size_type v7 = off_2655D3578[(char)a2];
  }
  size_t v8 = strlen(v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v31, (uint64_t)v7, v8);
  int RadioVendor = TelephonyRadiosGetRadioVendor();
  if ((RadioVendor - 2) < 2)
  {
    CFNumberRef v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v31, (uint64_t)" [ ", 3);
    uint64_t v16 = *(void *)(a1 + 8);
    if (*(void *)(a1 + 16) - v16 <= (unint64_t)a2 || (unint64_t v17 = *(char *)(v16 + a2), v17 > 7)) {
      xpc_object_t v13 = "Unknown";
    }
    else {
      xpc_object_t v13 = off_2655D3618[v17];
    }
  }
  else if (RadioVendor == 1)
  {
    CFNumberRef v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v31, (uint64_t)" [ ", 3);
    uint64_t v18 = *(void *)(a1 + 8);
    if (*(void *)(a1 + 16) - v18 <= (unint64_t)a2 || (unint64_t v19 = *(char *)(v18 + a2), v19 > 0xB)) {
      xpc_object_t v13 = "Unknown";
    }
    else {
      xpc_object_t v13 = off_2655D35B8[v19];
    }
  }
  else
  {
    if (RadioVendor != 4) {
      goto LABEL_23;
    }
    CFNumberRef v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v31, (uint64_t)" [ ", 3);
    uint64_t v11 = *(void *)(a1 + 8);
    unint64_t v12 = a2;
    xpc_object_t v13 = "Unknown";
    if (*(void *)(a1 + 16) - v11 > v12)
    {
      char v14 = *(unsigned char *)(v11 + v12);
      int v15 = "Online";
      if (v14 != 1) {
        int v15 = "Unknown";
      }
      if (v14) {
        xpc_object_t v13 = v15;
      }
      else {
        xpc_object_t v13 = "Airplane";
      }
    }
  }
  size_t v20 = strlen(v13);
  size_t v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)v13, v20);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)" ]", 2);
LABEL_23:
  if ((BYTE8(v37) & 0x10) != 0)
  {
    uint64_t v23 = (unsigned char *)v37;
    if ((void *)v37 < __src[1])
    {
      *(void **)&long long v37 = __src[1];
      uint64_t v23 = __src[1];
    }
    uint64_t v24 = __src[0];
    size_t v22 = v23 - (char *)__src[0];
    if ((unint64_t)(v23 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_40;
    }
  }
  else
  {
    if ((BYTE8(v37) & 8) == 0)
    {
      size_t v22 = 0;
      a3[23] = 0;
      goto LABEL_36;
    }
    uint64_t v24 = (const void *)*((void *)&v32 + 1);
    size_t v22 = *((void *)&v33 + 1) - *((void *)&v32 + 1);
    if (*((void *)&v33 + 1) - *((void *)&v32 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_40:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v22 >= 0x17)
  {
    uint64_t v25 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v22 | 7) != 0x17) {
      uint64_t v25 = v22 | 7;
    }
    uint64_t v26 = v25 + 1;
    int v27 = operator new(v25 + 1);
    *((void *)a3 + 1) = v22;
    *((void *)a3 + 2) = v26 | 0x8000000000000000;
    *(void *)a3 = v27;
    a3 = v27;
    goto LABEL_35;
  }
  a3[23] = v22;
  if (v22) {
LABEL_35:
  }
    memmove(a3, v24, v22);
LABEL_36:
  a3[v22] = 0;
  *(void *)&long long v30 = *MEMORY[0x263F8C2B8];
  uint64_t v28 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)&v30 + *(void *)(v30 - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  *(void *)&long long v31 = v28;
  *((void *)&v31 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v36) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x263E67C70](v38);
}

void sub_2636806CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2636806E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2636806F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_263680708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t radio::OpMode::modeToString@<X0>(radio::OpMode *this@<X0>, int a2@<W1>, unsigned char *a3@<X8>)
{
  uint64_t v3 = *((void *)this + 1);
  uint64_t v4 = *((void *)this + 2);
  if (v3 == v4)
  {
LABEL_5:
    LOBYTE(v5) = 8;
  }
  else
  {
    uint64_t v5 = 0;
    while (*(unsigned __int8 *)(v3 + v5) != a2)
    {
      ++v5;
      if (v3 + v5 == v4) {
        goto LABEL_5;
      }
    }
  }
  return radio::OpMode::modeToString((uint64_t)this, v5, a3);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  uint64_t v5 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  size_t v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  uint64_t v9 = MEMORY[0x263F8C328] + 24;
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  uint64_t v10 = v5[5];
  uint64_t v11 = v5[4];
  *(void *)(a1 + 16) = v11;
  *(void *)(v3 + *(void *)(v11 - 24)) = v10;
  uint64_t v12 = v5[1];
  *(void *)a1 = v12;
  *(void *)(a1 + *(void *)(v12 - 24)) = v5[6];
  *(void *)a1 = v9;
  *(void *)(a1 + 128) = v2;
  *(void *)(a1 + 16) = v4;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_263680A04(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x263E67C70](v1);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B8];
  uint64_t v3 = *MEMORY[0x263F8C2B8];
  *(void *)a1 = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x263E67C70](a1 + 128);
  return a1;
}

uint64_t radio::OpMode::getConfigString@<X0>(radio::OpMode *this@<X0>, unsigned char *a2@<X8>)
{
  return radio::OpMode::configToString((uint64_t)this, *((unsigned __int16 *)this + 1), a2);
}

uint64_t radio::OpMode::configToString@<X0>(uint64_t a1@<X0>, int a2@<W1>, unsigned char *a3@<X8>)
{
  unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v34[7] = v6;
  v34[8] = v6;
  v34[5] = v6;
  v34[6] = v6;
  uint64_t v34[3] = v6;
  v34[4] = v6;
  v34[1] = v6;
  v34[2] = v6;
  long long v33 = v6;
  v34[0] = v6;
  *(_OWORD *)__p = v6;
  long long v32 = v6;
  long long v29 = v6;
  *(_OWORD *)__src = v6;
  long long v27 = v6;
  long long v28 = v6;
  long long v26 = v6;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v26);
  if ((a2 - 1) > 2) {
    uint64_t v7 = "Unknown";
  }
  else {
    uint64_t v7 = off_2655D3658[(__int16)(a2 - 1)];
  }
  size_t v8 = strlen(v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)v7, v8);
  int RadioVendor = TelephonyRadiosGetRadioVendor();
  if ((RadioVendor - 2) >= 2)
  {
    if (RadioVendor == 1)
    {
      uint64_t v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)" [ ", 3);
      uint64_t v13 = *(void *)(a1 + 32);
      if (a2 >= (unint64_t)((*(void *)(a1 + 40) - v13) >> 1)
        || (unsigned int v14 = *(unsigned __int16 *)(v13 + 2 * a2) - 1, v14 > 2))
      {
        int v15 = "Unknown";
      }
      else
      {
        int v15 = off_2655D3658[(__int16)v14];
      }
      size_t v16 = strlen(v15);
      unint64_t v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)v15, v16);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)" ]", 2);
    }
  }
  else
  {
    uint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)" [ ", 3);
    uint64_t v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"Invalid for ICE", 15);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)" ]", 2);
  }
  if ((BYTE8(v33) & 0x10) != 0)
  {
    unint64_t v19 = (unsigned char *)v33;
    if ((void *)v33 < __src[1])
    {
      *(void **)&long long v33 = __src[1];
      unint64_t v19 = __src[1];
    }
    size_t v20 = __src[0];
    size_t v18 = v19 - (char *)__src[0];
    if ((unint64_t)(v19 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_29;
    }
  }
  else
  {
    if ((BYTE8(v33) & 8) == 0)
    {
      size_t v18 = 0;
      a3[23] = 0;
      goto LABEL_25;
    }
    size_t v20 = (const void *)*((void *)&v28 + 1);
    size_t v18 = *((void *)&v29 + 1) - *((void *)&v28 + 1);
    if (*((void *)&v29 + 1) - *((void *)&v28 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_29:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v18 >= 0x17)
  {
    uint64_t v21 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17) {
      uint64_t v21 = v18 | 7;
    }
    uint64_t v22 = v21 + 1;
    uint64_t v23 = operator new(v21 + 1);
    *((void *)a3 + 1) = v18;
    *((void *)a3 + 2) = v22 | 0x8000000000000000;
    *(void *)a3 = v23;
    a3 = v23;
    goto LABEL_24;
  }
  a3[23] = v18;
  if (v18) {
LABEL_24:
  }
    memmove(a3, v20, v18);
LABEL_25:
  a3[v18] = 0;
  *(void *)&long long v26 = *MEMORY[0x263F8C2B8];
  uint64_t v24 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)&v26 + *(void *)(v26 - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  *(void *)&long long v27 = v24;
  *((void *)&v27 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v32) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x263E67C70](v34);
}

void sub_263680EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_263680EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t radio::OpMode::configToString@<X0>(radio::OpMode *this@<X0>, int a2@<W1>, unsigned char *a3@<X8>)
{
  uint64_t v3 = (unsigned __int16 *)*((void *)this + 4);
  uint64_t v4 = (unsigned __int16 *)*((void *)this + 5);
  if (v3 == v4)
  {
LABEL_5:
    unsigned __int16 v5 = 0;
  }
  else
  {
    unsigned __int16 v5 = 0;
    while (*v3 != a2)
    {
      ++v3;
      ++v5;
      if (v3 == v4) {
        goto LABEL_5;
      }
    }
  }
  return radio::OpMode::configToString((uint64_t)this, v5, a3);
}

const char *radio::asStringV2(char *a1)
{
  unint64_t v1 = *a1;
  if (v1 > 2) {
    return "FactoryCalibrationStatus::kUnknown";
  }
  else {
    return off_2655D3688[v1];
  }
}

uint64_t radio::RFCalibration_t::toString@<X0>(radio::RFCalibration_t *this@<X0>, unsigned char *a2@<X8>)
{
  unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v64[7] = v4;
  v64[8] = v4;
  v64[5] = v4;
  v64[6] = v4;
  v64[3] = v4;
  v64[4] = v4;
  v64[1] = v4;
  v64[2] = v4;
  long long v63 = v4;
  v64[0] = v4;
  *(_OWORD *)__p = v4;
  long long v62 = v4;
  long long v59 = v4;
  *(_OWORD *)__src = v4;
  long long v57 = v4;
  long long v58 = v4;
  long long v56 = v4;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v56);
  unint64_t v5 = *(char *)this;
  if (v5 > 2) {
    long long v6 = "RFCalibrationStatus::kUnknown";
  }
  else {
    long long v6 = off_2655D36A0[v5];
  }
  size_t v7 = strlen(v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)v6, v7);
  if (*(unsigned char *)this == 1)
  {
    size_t v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nGSM: ", 6);
    *(_DWORD *)((char *)v8 + *(void *)(*v8 - 24) + 8) = *(_DWORD *)((unsigned char *)v8 + *(void *)(*v8 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"0x", 2);
    uint64_t v9 = (void *)std::ostream::operator<<();
    uint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v10 + *(void *)(*v10 - 24) + 8) = *(_DWORD *)((unsigned char *)v10 + *(void *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"0x", 2);
    uint64_t v11 = (void *)std::ostream::operator<<();
    int v12 = *((unsigned __int16 *)this + 1);
    int v13 = *((unsigned __int16 *)this + 2);
    if (v12 == v13) {
      unsigned int v14 = " - CORRECT";
    }
    else {
      unsigned int v14 = " - INCORRECT";
    }
    if (v12 == v13) {
      uint64_t v15 = 10;
    }
    else {
      uint64_t v15 = 12;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)v14, v15);
    size_t v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nCDMA: ", 7);
    *(_DWORD *)((char *)v16 + *(void *)(*v16 - 24) + 8) = *(_DWORD *)((unsigned char *)v16 + *(void *)(*v16 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"0x", 2);
    unint64_t v17 = (void *)std::ostream::operator<<();
    size_t v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v18 + *(void *)(*v18 - 24) + 8) = *(_DWORD *)((unsigned char *)v18 + *(void *)(*v18 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"0x", 2);
    unint64_t v19 = (void *)std::ostream::operator<<();
    int v20 = *((_DWORD *)this + 2);
    int v21 = *((_DWORD *)this + 3);
    if (v20 == v21) {
      uint64_t v22 = " - CORRECT";
    }
    else {
      uint64_t v22 = " - INCORRECT";
    }
    if (v20 == v21) {
      uint64_t v23 = 10;
    }
    else {
      uint64_t v23 = 12;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)v22, v23);
    uint64_t v24 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nWCDMA: ", 8);
    *(_DWORD *)((char *)v24 + *(void *)(*v24 - 24) + 8) = *(_DWORD *)((unsigned char *)v24 + *(void *)(*v24 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)"0x", 2);
    uint64_t v25 = (void *)std::ostream::operator<<();
    long long v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v26 + *(void *)(*v26 - 24) + 8) = *(_DWORD *)((unsigned char *)v26 + *(void *)(*v26 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)"0x", 2);
    long long v27 = (void *)std::ostream::operator<<();
    int v28 = *((_DWORD *)this + 4);
    int v29 = *((_DWORD *)this + 5);
    if (v28 == v29) {
      long long v30 = " - CORRECT";
    }
    else {
      long long v30 = " - INCORRECT";
    }
    if (v28 == v29) {
      uint64_t v31 = 10;
    }
    else {
      uint64_t v31 = 12;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)v30, v31);
    long long v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nTDSCDMA: ", 10);
    *(_DWORD *)((char *)v32 + *(void *)(*v32 - 24) + 8) = *(_DWORD *)((unsigned char *)v32 + *(void *)(*v32 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)"0x", 2);
    long long v33 = (void *)std::ostream::operator<<();
    uint64_t v34 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v34 + *(void *)(*v34 - 24) + 8) = *(_DWORD *)((unsigned char *)v34 + *(void *)(*v34 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v34, (uint64_t)"0x", 2);
    unint64_t v35 = (void *)std::ostream::operator<<();
    int v36 = *((_DWORD *)this + 6);
    int v37 = *((_DWORD *)this + 7);
    if (v36 == v37) {
      long long v38 = " - CORRECT";
    }
    else {
      long long v38 = " - INCORRECT";
    }
    if (v36 == v37) {
      uint64_t v39 = 10;
    }
    else {
      uint64_t v39 = 12;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v35, (uint64_t)v38, v39);
    uint64_t v40 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nLTE: ", 6);
    *(_DWORD *)((char *)v40 + *(void *)(*v40 - 24) + 8) = *(_DWORD *)((unsigned char *)v40 + *(void *)(*v40 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v40, (uint64_t)"0x", 2);
    xpc_object_t v41 = (void *)std::ostream::operator<<();
    v42 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v41, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v42 + *(void *)(*v42 - 24) + 8) = *(_DWORD *)((unsigned char *)v42 + *(void *)(*v42 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v42, (uint64_t)"0x", 2);
    int v43 = (void *)std::ostream::operator<<();
    uint64_t v44 = *((void *)this + 4);
    uint64_t v45 = *((void *)this + 5);
    if (v44 == v45) {
      int v46 = " - CORRECT";
    }
    else {
      int v46 = " - INCORRECT";
    }
    if (v44 == v45) {
      uint64_t v47 = 10;
    }
    else {
      uint64_t v47 = 12;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v43, (uint64_t)v46, v47);
  }
  if ((BYTE8(v63) & 0x10) != 0)
  {
    v49 = (unsigned char *)v63;
    if ((void *)v63 < __src[1])
    {
      *(void **)&long long v63 = __src[1];
      v49 = __src[1];
    }
    uint64_t v50 = __src[0];
    size_t v48 = v49 - (char *)__src[0];
    if ((unint64_t)(v49 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_53;
    }
  }
  else
  {
    if ((BYTE8(v63) & 8) == 0)
    {
      size_t v48 = 0;
      a2[23] = 0;
      goto LABEL_49;
    }
    uint64_t v50 = (const void *)*((void *)&v58 + 1);
    size_t v48 = *((void *)&v59 + 1) - *((void *)&v58 + 1);
    if (*((void *)&v59 + 1) - *((void *)&v58 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_53:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v48 >= 0x17)
  {
    uint64_t v51 = (v48 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v48 | 7) != 0x17) {
      uint64_t v51 = v48 | 7;
    }
    uint64_t v52 = v51 + 1;
    long long v53 = operator new(v51 + 1);
    *((void *)a2 + 1) = v48;
    *((void *)a2 + 2) = v52 | 0x8000000000000000;
    *(void *)a2 = v53;
    a2 = v53;
    goto LABEL_48;
  }
  a2[23] = v48;
  if (v48) {
LABEL_48:
  }
    memmove(a2, v50, v48);
LABEL_49:
  a2[v48] = 0;
  *(void *)&long long v56 = *MEMORY[0x263F8C2B8];
  uint64_t v54 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)&v56 + *(void *)(v56 - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  *(void *)&long long v57 = v54;
  *((void *)&v57 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v62) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x263E67C70](v64);
}

void sub_263681650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

unsigned char *radio::RFCalibration_t::RFCalibration_t(unsigned char *this)
{
  *this = 2;
  return this;
}

{
  *this = 2;
  return this;
}

BOOL radio::RFCalibration_t::fill(uint64_t a1, const __CFDictionary **a2)
{
  CFDictionaryRef v2 = *a2;
  if (v2) {
    uint64_t v3 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    uint64_t v3 = 0;
  }
  if (!v3) {
    return 0;
  }
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v13, v2);
  int Bool = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v13, @"BasebandRFCalibrationPresentStatus");
  *(unsigned char *)a1 = Bool;
  if (Bool)
  {
    *(_WORD *)(a1 + 2) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, @"BasebandGSMCalibrationStatus");
    *(_WORD *)(a1 + 4) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, @"BasebandGSMCalibrationMask");
    *(_DWORD *)(a1 + 8) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, @"BasebandCDMACalibrationStatus");
    *(_DWORD *)(a1 + 12) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, @"BasebandCDMACalibrationMask");
    *(_DWORD *)(a1 + 16) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, @"BasebandWCDMACalibrationStatus");
    *(_DWORD *)(a1 + 20) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, @"BasebandWCDMACalibrationMask");
    *(_DWORD *)(a1 + 24) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, @"BasebandTDSCDMACalibrationStatus");
    *(_DWORD *)(a1 + 28) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, @"BasebandTDSCDMACalibrationMask");
    unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
    CFNumberRef v6 = (const __CFNumber *)ctu::cf::map_adapter::copyCFNumberRef((ctu::cf::map_adapter *)v13, @"BasebandLTECalibrationStatus");
    CFNumberRef v7 = v6;
    if (v6)
    {
      if (CFNumberGetValue(v6, kCFNumberSInt64Type, &valuePtr))
      {
        *(void *)(a1 + 32) = valuePtr;
        int v8 = 1;
      }
      else
      {
        int v8 = 0;
      }
      CFRelease(v7);
      unint64_t valuePtr = 0;
    }
    else
    {
      int v8 = 1;
    }
    CFNumberRef v10 = (const __CFNumber *)ctu::cf::map_adapter::copyCFNumberRef((ctu::cf::map_adapter *)v13, @"BasebandLTECalibrationMask");
    CFNumberRef v11 = v10;
    if (v10)
    {
      if (CFNumberGetValue(v10, kCFNumberSInt64Type, &valuePtr)) {
        *(void *)(a1 + 40) = valuePtr;
      }
      else {
        int v8 = 0;
      }
      CFRelease(v11);
    }
  }
  else
  {
    int v8 = 0;
  }
  MEMORY[0x263E679F0](v13);
  return v8 != 0;
}

uint64_t ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get(uint64_t a1)
{
  return *(void *)a1;
}

const char *radio::asString(_DWORD *a1)
{
  unsigned int v1 = *a1 - 1;
  if (v1 > 4) {
    return "Other";
  }
  else {
    return off_2655D36B8[v1];
  }
}

const char *radio::asString(unsigned char *a1)
{
  unsigned int v1 = "Invalid";
  if (!*a1) {
    unsigned int v1 = "Disabled";
  }
  if (*a1 == 1) {
    return "Enabled";
  }
  else {
    return v1;
  }
}

{
  const char *v1;

  unsigned int v1 = "Invalid";
  if (!*a1) {
    unsigned int v1 = "Disabled";
  }
  if (*a1 == 1) {
    return "Enabled";
  }
  else {
    return v1;
  }
}

uint64_t radio::BasebandProperties::create(const __CFDictionary **a1)
{
  CFDictionaryRef v1 = *a1;
  if (!*a1) {
    return 0xAAAAAAAAAAAAAA00;
  }
  v7[0] = 0xAAAAAAAAAAAAAAAALL;
  v7[1] = 0xAAAAAAAAAAAAAAAALL;
  ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v7, v1);
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v8, "kBasebandPropertyCoredumpSupported");
  int Bool = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v7, v8);
  MEMORY[0x263E679C0](&v8);
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v8, "kBasebandPropertyPowerSequenceIndex");
  int Int = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v7, v8);
  MEMORY[0x263E679C0](&v8);
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v8, "kBasebandPropertyBasebandVersion");
  uint64_t v4 = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v7, v8);
  MEMORY[0x263E679C0](&v8);
  MEMORY[0x263E679F0](v7);
  uint64_t v5 = 256;
  if (!Bool) {
    uint64_t v5 = 0;
  }
  return (Int << 16) | (unint64_t)(v4 << 32) | v5 | 1;
}

void sub_263681A54(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  MEMORY[0x263E679C0](va1);
  MEMORY[0x263E679F0]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void radio::BasebandProperties::toDict(radio::BasebandProperties *this@<X0>, __CFDictionary **a2@<X8>)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  int v6 = *((unsigned __int8 *)this + 1);
  key = 0;
  ctu::cf::convert_copy((ctu::cf *)&key, (const __CFString **)"kBasebandPropertyCoredumpSupported", (const char *)0x8000100, (uint64_t)v4, v7);
  uint64_t v9 = key;
  CFNumberRef v10 = (void **)MEMORY[0x263EFFB40];
  if (!v6) {
    CFNumberRef v10 = (void **)MEMORY[0x263EFFB38];
  }
  CFNumberRef v11 = *v10;
  key = *v10;
  if (v9 && v11)
  {
    CFDictionaryAddValue(Mutable, v9, v11);
  }
  else if (!v11)
  {
    goto LABEL_8;
  }
  CFRelease(v11);
LABEL_8:
  if (v9) {
    CFRelease(v9);
  }
  int v12 = (void *)*((unsigned __int16 *)this + 1);
  key = 0;
  ctu::cf::convert_copy((ctu::cf *)&key, (const __CFString **)"kBasebandPropertyPowerSequenceIndex", (const char *)0x8000100, (uint64_t)v4, v8);
  int v13 = key;
  key = v12;
  CFNumberRef v14 = CFNumberCreate(v4, kCFNumberLongLongType, &key);
  CFNumberRef v16 = v14;
  if (v13 && v14)
  {
    CFDictionaryAddValue(Mutable, v13, v14);
  }
  else if (!v14)
  {
    goto LABEL_15;
  }
  CFRelease(v16);
LABEL_15:
  if (v13) {
    CFRelease(v13);
  }
  unint64_t v17 = (void *)*((unsigned int *)this + 1);
  key = 0;
  ctu::cf::convert_copy((ctu::cf *)&key, (const __CFString **)"kBasebandPropertyBasebandVersion", (const char *)0x8000100, (uint64_t)v4, v15);
  size_t v18 = key;
  key = v17;
  CFNumberRef v19 = CFNumberCreate(v4, kCFNumberLongLongType, &key);
  CFNumberRef v20 = v19;
  if (v18 && v19)
  {
    CFDictionaryAddValue(Mutable, v18, v19);
  }
  else if (!v19)
  {
    goto LABEL_22;
  }
  CFRelease(v20);
LABEL_22:
  if (v18) {
    CFRelease(v18);
  }
  if (Mutable)
  {
    CFTypeID v21 = CFGetTypeID(Mutable);
    if (v21 == CFDictionaryGetTypeID())
    {
      *a2 = Mutable;
      CFRetain(Mutable);
    }
    else
    {
      *a2 = 0;
    }
    CFRelease(Mutable);
  }
  else
  {
    *a2 = 0;
  }
}

void sub_263681CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10, const void *a11)
{
}

void sub_263681D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, uint64_t a10, const void *a11)
{
}

void sub_263681D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

const void **ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(const void **a1)
{
  CFDictionaryRef v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void std::__shared_ptr_emplace<radio::OpMode>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EA3510;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<radio::OpMode>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EA3510;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_emplace<radio::OpMode>::__on_zero_shared(void *a1)
{
  CFDictionaryRef v2 = (void *)a1[4];
  a1[5] = v2;
  uint64_t v3 = (void *)a1[7];
  if (v3)
  {
    a1[8] = v3;
    operator delete(v3);
    CFDictionaryRef v2 = (void *)a1[4];
  }
  if (v2)
  {
    a1[5] = v2;
    operator delete(v2);
  }
}

void ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(const void **this)
{
  CFDictionaryRef v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

const char *BasebandDiagnostics::getName(BasebandDiagnostics *this)
{
  return "BBDiagnostics";
}

const char *BasebandDiagnostics::asString(uint64_t a1, unsigned int a2)
{
  if (a2 > 3) {
    return "Invalid";
  }
  else {
    return off_2655D3720[a2];
  }
}

void BasebandDiagnostics::BasebandDiagnostics(BasebandDiagnostics *this)
{
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v10, "com.apple.telephony.abm", "BBDiag");
  uint64_t v2 = *((void *)&v10 + 1);
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  CFAllocatorRef v4 = dispatch_queue_create_with_target_V2("BasebandDiagnostics", initially_inactive, 0);
  dispatch_set_qos_class_floor(v4, QOS_CLASS_UTILITY, 0);
  dispatch_activate(v4);
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = v4;
  if (v4)
  {
    dispatch_retain(v4);
    *((void *)this + 4) = 0;
    dispatch_release(v4);
  }
  else
  {
    *((void *)this + 4) = 0;
  }
  MEMORY[0x263E67970]((char *)this + 40, v2);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v10);
  *(void *)this = &unk_270EA3560;
  *((_OWORD *)this + 3) = 0u;
  *((void *)this + 13) = 0;
  *((void *)this + 14) = 0;
  *((void *)this + 15) = 0;
  *((_OWORD *)this + 4) = 0u;
  *((void *)this + 10) = 0;
  abm::client::CreateManager();
  long long v5 = v10;
  long long v10 = 0uLL;
  int v6 = (std::__shared_weak_count *)*((void *)this + 8);
  *(_OWORD *)((char *)this + 56) = v5;
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  CFAllocatorRef v7 = (std::__shared_weak_count *)*((void *)&v10 + 1);
  if (*((void *)&v10 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v10 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  *((unsigned char *)this + 96) = 0;
  dispatch_group_t v8 = dispatch_group_create();
  uint64_t v9 = *((void *)this + 9);
  *((void *)this + 9) = v8;
  if (v9) {
    dispatch_release(v9);
  }
}

void sub_263682088(_Unwind_Exception *a1)
{
  int v6 = v3;
  dispatch_group_t v8 = *v6;
  if (*v6)
  {
    v1[14] = v8;
    operator delete(v8);
  }
  uint64_t v9 = v1[10];
  if (v9)
  {
    dispatch_group_leave(v9);
    long long v10 = v1[10];
    if (v10) {
      dispatch_release(v10);
    }
  }
  CFNumberRef v11 = v1[9];
  if (v11)
  {
    dispatch_release(v11);
    std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100](v4);
    int v12 = *v5;
    if (!*v5)
    {
LABEL_8:
      ctu::SharedLoggable<BasebandDiagnostics,ctu::OsLogLogger>::~SharedLoggable(v2);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100](v4);
    int v12 = *v5;
    if (!*v5) {
      goto LABEL_8;
    }
  }
  dispatch_release(v12);
  ctu::SharedLoggable<BasebandDiagnostics,ctu::OsLogLogger>::~SharedLoggable(v2);
  _Unwind_Resume(a1);
}

void sub_263682108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  ctu::SharedSynchronizable<BasebandDiagnostics>::~SharedSynchronizable(v9);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a9);
  _Unwind_Resume(a1);
}

void *ctu::SharedLoggable<BasebandDiagnostics,ctu::OsLogLogger>::~SharedLoggable(void *a1)
{
  MEMORY[0x263E67980](a1 + 4);
  uint64_t v2 = a1[3];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[2];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[1];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void BasebandDiagnostics::~BasebandDiagnostics(BasebandDiagnostics *this)
{
  *(void *)this = &unk_270EA3560;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 8);
  int v13 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  abm::client::EventsOff();
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  uint64_t v3 = *((void *)this + 10);
  *((void *)this + 10) = 0;
  if (v3)
  {
    dispatch_group_leave(v3);
    dispatch_release(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 13);
  if (v4)
  {
    *((void *)this + 14) = v4;
    operator delete(v4);
  }
  long long v5 = *((void *)this + 10);
  if (v5)
  {
    dispatch_group_leave(v5);
    int v6 = *((void *)this + 10);
    if (v6) {
      dispatch_release(v6);
    }
  }
  CFAllocatorRef v7 = *((void *)this + 9);
  if (v7) {
    dispatch_release(v7);
  }
  dispatch_group_t v8 = (std::__shared_weak_count *)*((void *)this + 8);
  if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
  uint64_t v9 = *((void *)this + 6);
  if (v9) {
    dispatch_release(v9);
  }
  MEMORY[0x263E67980]((char *)this + 40);
  long long v10 = *((void *)this + 4);
  if (v10) {
    dispatch_release(v10);
  }
  CFNumberRef v11 = *((void *)this + 3);
  if (v11) {
    dispatch_release(v11);
  }
  int v12 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v12) {
    std::__shared_weak_count::__release_weak(v12);
  }
}

{
  void *v1;
  uint64_t vars8;

  BasebandDiagnostics::~BasebandDiagnostics(this);

  operator delete(v1);
}

BOOL BasebandDiagnostics::resetBaseband(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  unint64_t v32 = 0xAAAAAAAAE020E002;
  long long __p = 0uLL;
  uint64_t v34 = 0;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v6 || (xpc_object_t v6 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E67FD0](v6) == MEMORY[0x263EF8708])
    {
      xpc_retain(v6);
      xpc_object_t v7 = v6;
    }
    else
    {
      xpc_object_t v7 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t v6 = 0;
  }
  xpc_release(v6);
  xpc_object_t v8 = xpc_int64_create(20000);
  if (!v8) {
    xpc_object_t v8 = xpc_null_create();
  }
  xpc_dictionary_set_value(v7, (const char *)*MEMORY[0x263F25DB8], v8);
  xpc_object_t v9 = xpc_null_create();
  xpc_release(v8);
  xpc_release(v9);
  if (a3)
  {
    xpc_object_t v10 = xpc_string_create((const char *)*MEMORY[0x263F26178]);
    if (!v10) {
      xpc_object_t v10 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v10 = xpc_string_create((const char *)*MEMORY[0x263F26180]);
    if (!v10) {
      xpc_object_t v10 = xpc_null_create();
    }
  }
  xpc_dictionary_set_value(v7, (const char *)*MEMORY[0x263F26148], v10);
  xpc_object_t v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
  xpc_object_t v12 = xpc_string_create((const char *)*MEMORY[0x263F26718]);
  if (!v12) {
    xpc_object_t v12 = xpc_null_create();
  }
  xpc_dictionary_set_value(v7, (const char *)*MEMORY[0x263F26368], v12);
  xpc_object_t v13 = xpc_null_create();
  xpc_release(v12);
  xpc_release(v13);
  if (*(char *)(a2 + 23) >= 0) {
    CFNumberRef v14 = (const char *)a2;
  }
  else {
    CFNumberRef v14 = *(const char **)a2;
  }
  xpc_object_t v15 = xpc_string_create(v14);
  if (!v15) {
    xpc_object_t v15 = xpc_null_create();
  }
  xpc_dictionary_set_value(v7, (const char *)*MEMORY[0x263F262A8], v15);
  xpc_object_t v16 = xpc_null_create();
  xpc_release(v15);
  xpc_release(v16);
  unint64_t v17 = *(std::__shared_weak_count **)(a1 + 64);
  uint64_t v31 = v17;
  if (v17) {
    atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  size_t v18 = (const void *)*MEMORY[0x263F26118];
  size_t v19 = strlen((const char *)*MEMORY[0x263F26118]);
  if (v19 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v20 = v19;
  if (v19 >= 0x17)
  {
    uint64_t v22 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17) {
      uint64_t v22 = v19 | 7;
    }
    uint64_t v23 = v22 + 1;
    CFTypeID v21 = operator new(v22 + 1);
    *(void *)&__dst[8] = v20;
    *(void *)&__dst[16] = v23 | 0x8000000000000000;
    *(void *)long long __dst = v21;
    goto LABEL_31;
  }
  __dst[23] = v19;
  CFTypeID v21 = __dst;
  if (v19) {
LABEL_31:
  }
    memmove(v21, v18, v20);
  v21[v20] = 0;
  abm::client::PerformCommand();
  LODWORD(v32) = *(_DWORD *)buf;
  if (SHIBYTE(v34) < 0) {
    operator delete((void *)__p);
  }
  long long __p = *(_OWORD *)&buf[8];
  uint64_t v34 = v37;
  HIBYTE(v37) = 0;
  buf[8] = 0;
  if ((__dst[23] & 0x80000000) != 0) {
    operator delete(*(void **)__dst);
  }
  if (v31 && !atomic_fetch_add(&v31->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
    std::__shared_weak_count::__release_weak(v31);
    int v24 = v32;
    uint64_t v25 = *(NSObject **)(a1 + 40);
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    if (v32)
    {
LABEL_39:
      if (v26)
      {
        TelephonyXPC::Result::describe((TelephonyXPC::Result *)&v32, buf);
        long long v27 = "soft";
        if (a3) {
          long long v27 = "hard";
        }
        if (buf[23] >= 0) {
          int v28 = buf;
        }
        else {
          int v28 = *(unsigned char **)buf;
        }
        *(_DWORD *)long long __dst = 136315394;
        *(void *)&__dst[4] = v27;
        *(_WORD *)&__dst[12] = 2080;
        *(void *)&__dst[14] = v28;
        _os_log_impl(&dword_263679000, v25, OS_LOG_TYPE_DEFAULT, "#I Baseband %s reset failed: %s", __dst, 0x16u);
        if ((buf[23] & 0x80000000) != 0) {
          operator delete(*(void **)buf);
        }
      }
      goto LABEL_52;
    }
  }
  else
  {
    int v24 = v32;
    uint64_t v25 = *(NSObject **)(a1 + 40);
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    if (v32) {
      goto LABEL_39;
    }
  }
  if (v26)
  {
    int v29 = "soft";
    if (a3) {
      int v29 = "hard";
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v29;
    _os_log_impl(&dword_263679000, v25, OS_LOG_TYPE_DEFAULT, "#I Baseband %s reset success", buf, 0xCu);
  }
LABEL_52:
  xpc_release(v7);
  if (SHIBYTE(v34) < 0) {
    operator delete((void *)__p);
  }
  return v24 == 0;
}

void sub_26368282C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t BasebandDiagnostics::getOperatingMode(BasebandDiagnostics *this)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)this + 5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_263679000, v2, OS_LOG_TYPE_DEFAULT, "#I Getting baseband operating mode", buf, 2u);
  }
  *(void *)buf = 0xAAAAAAAAE020E002;
  long long __p = 0uLL;
  uint64_t v30 = 0;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  uint64_t v4 = MEMORY[0x263EF8708];
  if (v3 || (xpc_object_t v3 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E67FD0](v3) == v4)
    {
      xpc_retain(v3);
      xpc_object_t v5 = v3;
    }
    else
    {
      xpc_object_t v5 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    xpc_object_t v3 = 0;
  }
  xpc_release(v3);
  xpc_object_t v6 = xpc_int64_create(180000);
  if (!v6) {
    xpc_object_t v6 = xpc_null_create();
  }
  xpc_dictionary_set_value(v5, (const char *)*MEMORY[0x263F25DB8], v6);
  xpc_object_t v7 = xpc_null_create();
  xpc_release(v6);
  xpc_release(v7);
  xpc_object_t v8 = xpc_null_create();
  xpc_object_t v9 = (std::__shared_weak_count *)*((void *)this + 8);
  BOOL v26 = v9;
  xpc_object_t v27 = v8;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  xpc_object_t v10 = (const void *)*MEMORY[0x263F26728];
  size_t v11 = strlen((const char *)*MEMORY[0x263F26728]);
  if (v11 >= 0x7FFFFFFFFFFFFFF8) {
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
    unint64_t v32 = v15 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    goto LABEL_20;
  }
  HIBYTE(v32) = v11;
  p_dst = &__dst;
  if (v11) {
LABEL_20:
  }
    memmove(p_dst, v10, v12);
  *((unsigned char *)p_dst + v12) = 0;
  abm::client::PerformCommand();
  *(_DWORD *)buf = *(_DWORD *)object;
  if (SHIBYTE(v30) < 0) {
    operator delete((void *)__p);
  }
  long long __p = *(_OWORD *)&object[8];
  uint64_t v30 = v34;
  HIBYTE(v34) = 0;
  object[8] = 0;
  if (SHIBYTE(v32) < 0) {
    operator delete((void *)__dst);
  }
  if (v26 && !atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
    std::__shared_weak_count::__release_weak(v26);
    xpc_object_t v16 = v27;
    if (v27) {
      goto LABEL_31;
    }
  }
  else
  {
    xpc_object_t v16 = v27;
    if (v27) {
      goto LABEL_31;
    }
  }
  xpc_object_t v16 = xpc_null_create();
  if (!v16)
  {
    xpc_object_t v17 = xpc_null_create();
    xpc_object_t v16 = 0;
    goto LABEL_34;
  }
LABEL_31:
  if (MEMORY[0x263E67FD0](v16) == v4)
  {
    xpc_retain(v16);
    xpc_object_t v17 = v16;
  }
  else
  {
    xpc_object_t v17 = xpc_null_create();
  }
LABEL_34:
  xpc_release(v16);
  if (!*(_DWORD *)buf && MEMORY[0x263E67FD0](v17) == v4)
  {
    xpc_object_t value = xpc_dictionary_get_value(v17, (const char *)*MEMORY[0x263F26430]);
    *(void *)xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      *(void *)xpc_object_t object = xpc_null_create();
    }
    unsigned __int8 v23 = xpc::dyn_cast_or_default();
    xpc_release(*(xpc_object_t *)object);
    if (v23 >= 7u)
    {
      uint64_t v20 = 5;
      int v24 = *((void *)this + 5);
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
    }
    else
    {
      uint64_t v20 = dword_26368881C[(char)v23];
      int v24 = *((void *)this + 5);
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
    }
    if (v20 > 3) {
      uint64_t v25 = "Invalid";
    }
    else {
      uint64_t v25 = off_2655D3720[(int)v20];
    }
    *(_DWORD *)xpc_object_t object = 136315138;
    *(void *)&object[4] = v25;
    _os_log_impl(&dword_263679000, v24, OS_LOG_TYPE_DEFAULT, "#I Baseband operating mode: %s", object, 0xCu);
    goto LABEL_43;
  }
  size_t v18 = *((void *)this + 5);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    TelephonyXPC::Result::describe((TelephonyXPC::Result *)buf, object);
    size_t v19 = object[23] >= 0 ? object : *(unsigned char **)object;
    LODWORD(__dst) = 136315138;
    *(void *)((char *)&__dst + 4) = v19;
    _os_log_impl(&dword_263679000, v18, OS_LOG_TYPE_DEFAULT, "#I Failed to get operating mode: %s", (uint8_t *)&__dst, 0xCu);
    if ((object[23] & 0x80000000) != 0) {
      operator delete(*(void **)object);
    }
  }
  uint64_t v20 = 5;
LABEL_43:
  xpc_release(v17);
  xpc_release(v5);
  if (SHIBYTE(v30) < 0) {
    operator delete((void *)__p);
  }
  return v20;
}

void sub_263682DE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,xpc_object_t object)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

BOOL BasebandDiagnostics::setOperatingMode(uint64_t a1, int a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (a2 >= 5)
  {
    xpc_object_t v3 = *(NSObject **)(a1 + 40);
    BOOL v4 = 0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_263679000, v3, OS_LOG_TYPE_DEFAULT, "#I Invalid Baseband op mode", buf, 2u);
      return 0;
    }
    return v4;
  }
  *(void *)buf = 0xAAAAAAAAE020E002;
  long long __p = 0uLL;
  uint64_t v27 = 0;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v6 || (xpc_object_t v6 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E67FD0](v6) == MEMORY[0x263EF8708])
    {
      xpc_retain(v6);
      xpc_object_t v7 = v6;
    }
    else
    {
      xpc_object_t v7 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t v6 = 0;
  }
  xpc_release(v6);
  xpc_object_t v8 = xpc_int64_create(5000);
  if (!v8) {
    xpc_object_t v8 = xpc_null_create();
  }
  xpc_dictionary_set_value(v7, (const char *)*MEMORY[0x263F25DB8], v8);
  xpc_object_t v9 = xpc_null_create();
  xpc_release(v8);
  xpc_release(v9);
  switch(a2)
  {
    case 0:
      xpc_object_t v10 = xpc_int64_create(0);
      if (!v10) {
        xpc_object_t v10 = xpc_null_create();
      }
      goto LABEL_24;
    case 1:
      xpc_object_t v10 = xpc_int64_create(1);
      if (!v10) {
        xpc_object_t v10 = xpc_null_create();
      }
      goto LABEL_24;
    case 2:
      xpc_object_t v10 = xpc_int64_create(2);
      if (!v10) {
        xpc_object_t v10 = xpc_null_create();
      }
      goto LABEL_24;
    case 3:
      xpc_object_t v10 = xpc_int64_create(3);
      if (!v10) {
        xpc_object_t v10 = xpc_null_create();
      }
LABEL_24:
      xpc_dictionary_set_value(v7, (const char *)*MEMORY[0x263F26430], v10);
      xpc_object_t v11 = xpc_null_create();
      xpc_release(v10);
      xpc_release(v11);
      break;
    default:
      break;
  }
  size_t v12 = *(std::__shared_weak_count **)(a1 + 64);
  int v24 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  xpc_object_t v13 = (const void *)*MEMORY[0x263F26738];
  size_t v14 = strlen((const char *)*MEMORY[0x263F26738]);
  if (v14 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v15 = v14;
  if (v14 >= 0x17)
  {
    uint64_t v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v17 = v14 | 7;
    }
    uint64_t v18 = v17 + 1;
    p_dst = (long long *)operator new(v17 + 1);
    *((void *)&__dst + 1) = v15;
    unint64_t v29 = v18 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
  }
  else
  {
    HIBYTE(v29) = v14;
    p_dst = &__dst;
    if (!v14) {
      goto LABEL_35;
    }
  }
  memmove(p_dst, v13, v15);
LABEL_35:
  *((unsigned char *)p_dst + v15) = 0;
  abm::client::PerformCommand();
  *(_DWORD *)buf = *(_DWORD *)v30;
  if (SHIBYTE(v27) < 0) {
    operator delete((void *)__p);
  }
  long long __p = *(_OWORD *)&v30[8];
  uint64_t v27 = v31;
  HIBYTE(v31) = 0;
  v30[8] = 0;
  if (SHIBYTE(v29) < 0) {
    operator delete((void *)__dst);
  }
  if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
    std::__shared_weak_count::__release_weak(v24);
  }
  BOOL v4 = *(_DWORD *)buf == 0;
  size_t v19 = *(NSObject **)(a1 + 40);
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (*(_DWORD *)buf)
  {
    if (v20)
    {
      TelephonyXPC::Result::describe((TelephonyXPC::Result *)buf, v30);
      CFTypeID v21 = v30[23] >= 0 ? v30 : *(unsigned char **)v30;
      LODWORD(__dst) = 136315138;
      *(void *)((char *)&__dst + 4) = v21;
      _os_log_impl(&dword_263679000, v19, OS_LOG_TYPE_DEFAULT, "#I Failed to set operating mode: %s", (uint8_t *)&__dst, 0xCu);
      if ((v30[23] & 0x80000000) != 0) {
        operator delete(*(void **)v30);
      }
    }
  }
  else if (v20)
  {
    if (a2 > 3) {
      uint64_t v22 = "Invalid";
    }
    else {
      uint64_t v22 = off_2655D3720[a2];
    }
    *(_DWORD *)uint64_t v30 = 136315138;
    *(void *)&v30[4] = v22;
    _os_log_impl(&dword_263679000, v19, OS_LOG_TYPE_DEFAULT, "#I Set operating mode to %s success", v30, 0xCu);
  }
  xpc_release(v7);
  if (SHIBYTE(v27) < 0) {
    operator delete((void *)__p);
  }
  return v4;
}

void sub_2636833EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void BasebandDiagnostics::waitForBasebandOperatingMode(uint64_t a1, int a2)
{
  if (a2 == 5 || !*(void *)(a1 + 56)) {
    return;
  }
  *(_DWORD *)(a1 + 88) = a2;
  *(unsigned char *)(a1 + 96) = 1;
  xpc_object_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (!v3 || (BOOL v4 = std::__shared_weak_count::lock(v3)) == 0) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  xpc_object_t v5 = v4;
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v5);
  }
  xpc_object_t v6 = *(std::__shared_weak_count **)(a1 + 64);
  uint64_t v20 = *(void *)(a1 + 56);
  CFTypeID v21 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  xpc_object_t v7 = (const void *)*MEMORY[0x263F26788];
  size_t v8 = strlen((const char *)*MEMORY[0x263F26788]);
  if (v8 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  xpc_object_t v9 = (void *)v8;
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    xpc_object_t v10 = (void **)operator new(v11 + 1);
    __dst[1] = v9;
    unint64_t v19 = v12 | 0x8000000000000000;
    __dst[0] = v10;
  }
  else
  {
    HIBYTE(v19) = v8;
    xpc_object_t v10 = __dst;
    if (!v8) {
      goto LABEL_17;
    }
  }
  memmove(v10, v7, (size_t)v9);
LABEL_17:
  *((unsigned char *)v9 + (void)v10) = 0;
  atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  abm::client::RegisterEventHandler();
  if (SHIBYTE(v19) < 0) {
    operator delete(__dst[0]);
  }
  xpc_object_t v13 = v21;
  if (v21 && !atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  size_t v14 = *(std::__shared_weak_count **)(a1 + 64);
  uint64_t v17 = v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  abm::client::EventsOff();
  if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
  }
  size_t v15 = *(std::__shared_weak_count **)(a1 + 64);
  xpc_object_t v16 = v15;
  if (v15) {
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  abm::client::EventsOn();
  if (v16)
  {
    if (!atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  std::__shared_weak_count::__release_weak(v5);
  std::__shared_weak_count::__release_weak(v5);
}

void sub_2636837F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, std::__shared_weak_count *a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  if (a19)
  {
    std::__shared_weak_count::__release_weak(a19);
    std::__shared_weak_count::__release_weak(v25);
    _Unwind_Resume(a1);
  }
  std::__shared_weak_count::__release_weak(v25);
  _Unwind_Resume(a1);
}

void ___ZN19BasebandDiagnostics28waitForBasebandOperatingModeE14BasebandOpMode_block_invoke(void *a1, xpc_object_t a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  xpc_object_t v3 = (std::__shared_weak_count *)a1[6];
  if (!v3) {
    return;
  }
  uint64_t v5 = a1[4];
  xpc_object_t v6 = std::__shared_weak_count::lock(v3);
  unint64_t v19 = v6;
  if (!v6) {
    return;
  }
  if (!a1[5])
  {
    xpc_object_t v7 = v6;
LABEL_33:
    if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    return;
  }
  if (a2)
  {
    xpc_retain(a2);
    goto LABEL_8;
  }
  a2 = xpc_null_create();
  if (a2)
  {
LABEL_8:
    if (MEMORY[0x263E67FD0](a2) == MEMORY[0x263EF8708])
    {
      xpc_retain(a2);
      xpc_object_t v8 = a2;
    }
    else
    {
      xpc_object_t v8 = xpc_null_create();
    }
    goto LABEL_12;
  }
  xpc_object_t v8 = xpc_null_create();
  a2 = 0;
LABEL_12:
  xpc_release(a2);
  xpc_object_t value = xpc_dictionary_get_value(v8, (const char *)*MEMORY[0x263F26430]);
  *(void *)xpc_object_t object = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    *(void *)xpc_object_t object = xpc_null_create();
  }
  unsigned __int8 v10 = xpc::dyn_cast_or_default();
  xpc_release(*(xpc_object_t *)object);
  uint64_t v11 = *(NSObject **)(v5 + 40);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v10 > 7u)
    {
      uint64_t v12 = "Unknown";
      if (*(void *)(v5 + 80))
      {
LABEL_18:
        uint64_t v13 = *(int *)(v5 + 88);
        if (v13 > 3) {
          size_t v14 = "Invalid";
        }
        else {
          size_t v14 = off_2655D3720[v13];
        }
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v12 = off_2655D36E0[(char)v10];
      if (*(void *)(v5 + 80)) {
        goto LABEL_18;
      }
    }
    size_t v14 = "None";
LABEL_23:
    *(_DWORD *)xpc_object_t object = 136315394;
    *(void *)&object[4] = v12;
    __int16 v21 = 2080;
    uint64_t v22 = v14;
    _os_log_impl(&dword_263679000, v11, OS_LOG_TYPE_DEFAULT, "#I BB mode event [%s] - target mode [%s]", object, 0x16u);
  }
  int v15 = v10;
  if (v10 >= 4u) {
    int v15 = 5;
  }
  *(_DWORD *)(v5 + 92) = v15;
  int v16 = *(_DWORD *)(v5 + 88);
  if (v16 != 5 && v16 == v15)
  {
    *(unsigned char *)(v5 + 96) = 0;
    uint64_t v17 = *(NSObject **)(v5 + 80);
    if (v17)
    {
      *(void *)(v5 + 80) = 0;
      dispatch_group_leave(v17);
      dispatch_release(v17);
    }
    else
    {
      uint64_t v18 = *(NSObject **)(v5 + 40);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)xpc_object_t object = 0;
        _os_log_impl(&dword_263679000, v18, OS_LOG_TYPE_DEFAULT, "#I BB mode reached to target but no group waiting", object, 2u);
      }
    }
  }
  xpc_release(v8);
  xpc_object_t v7 = v19;
  if (v19) {
    goto LABEL_33;
  }
}

void sub_263683B38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t __copy_helper_block_ea8_40c44_ZTSNSt3__18weak_ptrI19BasebandDiagnosticsEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_ea8_40c44_ZTSNSt3__18weak_ptrI19BasebandDiagnosticsEE(uint64_t a1)
{
  CFDictionaryRef v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

BOOL BasebandDiagnostics::updateBasebandOperatingMode(uint64_t a1, unsigned int a2, int a3, int a4)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (a2 == 5) {
    return 0;
  }
  xpc_object_t v6 = *(std::__shared_weak_count **)(a1 + 16);
  if (!v6 || (unsigned __int8 v10 = std::__shared_weak_count::lock(v6)) == 0) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v11 = v10;
  atomic_fetch_add_explicit(&v10->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v11);
  }
  if (a2)
  {
    if (a4)
    {
      uint64_t v12 = *(NSObject **)(a1 + 40);
      a4 = 0;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        if (a2 > 3) {
          uint64_t v13 = "Invalid";
        }
        else {
          uint64_t v13 = off_2655D3720[a2];
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v13;
        _os_log_impl(&dword_263679000, v12, OS_LOG_TYPE_DEFAULT, "#I %s mode cannot be set by resetting", buf, 0xCu);
        a4 = 0;
      }
    }
  }
  int OperatingMode = BasebandDiagnostics::getOperatingMode((BasebandDiagnostics *)a1);
  *(_DWORD *)(a1 + 92) = OperatingMode;
  if (OperatingMode == a2)
  {
    BOOL v4 = 1;
    goto LABEL_61;
  }
  BasebandDiagnostics::waitForBasebandOperatingMode(a1, a2);
  uint64_t v37 = v11;
  while (*(unsigned char *)(a1 + 96))
  {
    int v15 = *(NSObject **)(a1 + 72);
    if (v15)
    {
      dispatch_retain(*(dispatch_object_t *)(a1 + 72));
      dispatch_group_enter(v15);
    }
    int v16 = *(NSObject **)(a1 + 80);
    *(void *)(a1 + 80) = v15;
    if (v16)
    {
      dispatch_group_leave(v16);
      dispatch_release(v16);
    }
    if (!a4) {
      goto LABEL_39;
    }
    uint64_t v17 = (**(uint64_t (***)(uint64_t))a1)(a1);
    uint64_t v18 = (const void **)v17;
    int v19 = *(char *)(v17 + 23);
    if (v19 >= 0) {
      size_t v20 = *(unsigned __int8 *)(v17 + 23);
    }
    else {
      size_t v20 = *(void *)(v17 + 8);
    }
    unint64_t v21 = v20 + 41;
    memset(buf, 170, sizeof(buf));
    if (v20 + 41 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    if (v21 <= 0x16)
    {
      memset(buf, 0, sizeof(buf));
      uint64_t v22 = buf;
      buf[23] = v20 + 41;
LABEL_33:
      if (v19 >= 0) {
        uint64_t v25 = v18;
      }
      else {
        uint64_t v25 = *v18;
      }
      memmove(v22, v25, v20);
      goto LABEL_37;
    }
    uint64_t v23 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v21 | 7) != 0x17) {
      uint64_t v23 = v21 | 7;
    }
    uint64_t v24 = v23 + 1;
    uint64_t v22 = operator new(v23 + 1);
    *(void *)&uint8_t buf[8] = v20 + 41;
    *(void *)&uint8_t buf[16] = v24 | 0x8000000000000000;
    *(void *)buf = v22;
    if (v20) {
      goto LABEL_33;
    }
LABEL_37:
    strcpy((char *)v22 + v20, ": resetting baseband to recover to online");
    if (BasebandDiagnostics::resetBaseband(a1, (uint64_t)buf, 0))
    {
      char v26 = 1;
      goto LABEL_40;
    }
LABEL_39:
    BOOL v27 = BasebandDiagnostics::setOperatingMode(a1, a2);
    char v26 = v27;
    if (!a4)
    {
      if (!v27) {
        goto LABEL_54;
      }
      goto LABEL_46;
    }
LABEL_40:
    if ((char)buf[23] < 0)
    {
      operator delete(*(void **)buf);
      if ((v26 & 1) == 0) {
        goto LABEL_54;
      }
    }
    else if ((v26 & 1) == 0)
    {
      goto LABEL_54;
    }
LABEL_46:
    if (!*(unsigned char *)(a1 + 96))
    {
      uint64_t v35 = *(NSObject **)(a1 + 80);
      *(void *)(a1 + 80) = 0;
      if (v35)
      {
        dispatch_group_leave(v35);
        dispatch_release(v35);
      }
      break;
    }
    int v28 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v29 = "Invalid";
      if (a2 <= 3) {
        unint64_t v29 = off_2655D3720[a2];
      }
      *(_DWORD *)uint64_t v38 = 136315138;
      uint64_t v39 = v29;
      _os_log_impl(&dword_263679000, v28, OS_LOG_TYPE_DEFAULT, "#I Waiting for Baseband %s mode", v38, 0xCu);
    }
    uint64_t v30 = *(NSObject **)(a1 + 72);
    dispatch_time_t v31 = dispatch_time(0, 10000000000);
    if (!dispatch_group_wait(v30, v31))
    {
      int v33 = 0;
      uint64_t v34 = *(NSObject **)(a1 + 80);
      *(void *)(a1 + 80) = 0;
      if (!v34) {
        goto LABEL_17;
      }
LABEL_55:
      dispatch_group_leave(v34);
      dispatch_release(v34);
      goto LABEL_17;
    }
    uint64_t v32 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v38 = 67109120;
      LODWORD(v39) = a3;
      _os_log_impl(&dword_263679000, v32, OS_LOG_TYPE_DEFAULT, "#I Baseband mode not updated in time. retry=%d", v38, 8u);
    }
LABEL_54:
    int v33 = a3;
    uint64_t v34 = *(NSObject **)(a1 + 80);
    *(void *)(a1 + 80) = 0;
    if (v34) {
      goto LABEL_55;
    }
LABEL_17:
    a3 = v33 - 1;
    if (!v33) {
      break;
    }
  }
  *(_DWORD *)(a1 + 88) = 5;
  BOOL v4 = *(_DWORD *)(a1 + 92) == a2;
  uint64_t v11 = v37;
LABEL_61:
  std::__shared_weak_count::__release_weak(v11);
  return v4;
}

void sub_263684058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::__shared_weak_count *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  std::__shared_weak_count::__release_weak(v22);
  _Unwind_Resume(a1);
}

void sub_263684080()
{
  if (v0) {
    JUMPOUT(0x263684088);
  }
  JUMPOUT(0x263684098);
}

uint64_t BasebandDiagnostics::getRadioType(BasebandDiagnostics *this)
{
  int v1 = capabilities::radio::vendor(this);
  if (v1 == 1) {
    unsigned __int8 v2 = 1;
  }
  else {
    unsigned __int8 v2 = -1;
  }
  if (v1 == 2) {
    return 0;
  }
  return v2;
}

BOOL BasebandDiagnostics::addAWDConfig(BasebandDiagnostics *a1, uint64_t **a2)
{
  v17[72] = *MEMORY[0x263EF8340];
  memset(&v17[1], 170, 0x238uLL);
  uint64_t v4 = MEMORY[0x263F8C308] + 64;
  v17[53] = MEMORY[0x263F8C308] + 64;
  uint64_t v5 = (void *)MEMORY[0x263F8C2A8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2A8] + 16);
  v17[0] = *(void *)(MEMORY[0x263F8C2A8] + 8);
  *(void *)((char *)v17 + *(void *)(v17[0] - 24)) = v6;
  v17[1] = 0;
  xpc_object_t v7 = (std::ios_base *)((char *)v17 + *(void *)(v17[0] - 24));
  std::ios_base::init(v7, &v17[2]);
  uint64_t v8 = MEMORY[0x263F8C308] + 24;
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  v17[0] = v8;
  v17[53] = v4;
  MEMORY[0x263E67B10](&v17[2]);
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)v17 + *(void *)(v17[0] - 24)), *(_DWORD *)((char *)&v17[4] + *(void *)(v17[0] - 24)) | 4);
  }
  if (v17[17])
  {
    size_t __sz = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v15[6] = v9;
    v15[7] = v9;
    v15[4] = v9;
    v15[5] = v9;
    v15[2] = v9;
    v15[3] = v9;
    v15[0] = v9;
    v15[1] = v9;
    std::istream::tellg();
    unsigned __int8 v10 = operator new[](0xAAAAAAAAAAAAAAAALL);
    std::istream::seekg();
    std::istream::read();
    if (!std::filebuf::close()) {
      std::ios_base::clear((std::ios_base *)((char *)v17 + *(void *)(v17[0] - 24)), *(_DWORD *)((char *)&v17[4] + *(void *)(v17[0] - 24)) | 4);
    }
    xpc_object_t v11 = xpc_data_create(v10, 0xAAAAAAAAAAAAAAAALL);
    if (!v11) {
      xpc_object_t v11 = xpc_null_create();
    }
    operator delete[](v10);
    BOOL v12 = BasebandDiagnostics::addAWDConfigPayload(a1, (char *)v10, 0xAAAAAAAAAAAAAAAALL);
    xpc_release(v11);
  }
  else
  {
    uint64_t v13 = *((void *)a1 + 5);
    BOOL v12 = 0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (*((char *)a2 + 23) < 0) {
        a2 = (uint64_t **)*a2;
      }
      LODWORD(v15[0]) = 136315138;
      *(void *)((char *)v15 + 4) = a2;
      _os_log_impl(&dword_263679000, v13, OS_LOG_TYPE_DEFAULT, "#I Failed to open AWD Config file (%s)", (uint8_t *)v15, 0xCu);
      BOOL v12 = 0;
    }
  }
  v17[0] = *v5;
  *(void *)((char *)v17 + *(void *)(v17[0] - 24)) = v5[3];
  MEMORY[0x263E67B20](&v17[2]);
  std::istream::~istream();
  MEMORY[0x263E67C70](&v17[53]);
  return v12;
}

void sub_263684498(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

BOOL BasebandDiagnostics::addAWDConfigPayload(BasebandDiagnostics *this, char *bytes, size_t length)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  xpc_object_t v4 = xpc_data_create(bytes, length);
  if (!v4) {
    xpc_object_t v4 = xpc_null_create();
  }
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (v5 || (xpc_object_t v5 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E67FD0](v5) == MEMORY[0x263EF8708])
    {
      xpc_retain(v5);
      xpc_object_t v6 = v5;
    }
    else
    {
      xpc_object_t v6 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v6 = xpc_null_create();
    xpc_object_t v5 = 0;
  }
  xpc_release(v5);
  if (MEMORY[0x263E67FD0](v4) == MEMORY[0x263EF8758])
  {
    char v10 = 0;
    xpc_object_t v11 = 0;
    BOOL v12 = 0;
    uint64_t v13 = *((void *)this + 5);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_40;
    }
    goto LABEL_37;
  }
  xpc_object_t v7 = xpc_int64_create(5);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  xpc_dictionary_set_value(v6, (const char *)*MEMORY[0x263F268C8], v7);
  xpc_object_t v8 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v8);
  if (v4)
  {
    xpc_retain(v4);
    xpc_object_t v9 = v4;
  }
  else
  {
    xpc_object_t v9 = xpc_null_create();
  }
  xpc_dictionary_set_value(v6, (const char *)*MEMORY[0x263F25DB0], v9);
  xpc_object_t v14 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v14);
  xpc_object_t v15 = xpc_int64_create(0);
  if (!v15) {
    xpc_object_t v15 = xpc_null_create();
  }
  xpc_dictionary_set_value(v6, (const char *)*MEMORY[0x263F25EC0], v15);
  xpc_object_t v16 = xpc_null_create();
  xpc_release(v15);
  xpc_release(v16);
  xpc_object_t v17 = xpc_int64_create(5000);
  if (!v17) {
    xpc_object_t v17 = xpc_null_create();
  }
  xpc_dictionary_set_value(v6, (const char *)*MEMORY[0x263F25DB8], v17);
  xpc_object_t v18 = xpc_null_create();
  xpc_release(v17);
  xpc_release(v18);
  xpc_object_t v19 = xpc_null_create();
  size_t v20 = (std::__shared_weak_count *)*((void *)this + 8);
  uint64_t v33 = *((void *)this + 7);
  uint64_t v34 = v20;
  xpc_object_t v35 = v19;
  if (v20) {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unint64_t v21 = (const void *)*MEMORY[0x263F26310];
  size_t v22 = strlen((const char *)*MEMORY[0x263F26310]);
  if (v22 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v23 = (void *)v22;
  if (v22 >= 0x17)
  {
    uint64_t v25 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v22 | 7) != 0x17) {
      uint64_t v25 = v22 | 7;
    }
    uint64_t v26 = v25 + 1;
    uint64_t v24 = operator new(v25 + 1);
    __p[1] = v23;
    unint64_t v32 = v26 | 0x8000000000000000;
    __p[0] = v24;
    goto LABEL_30;
  }
  HIBYTE(v32) = v22;
  uint64_t v24 = __p;
  if (v22) {
LABEL_30:
  }
    memmove(v24, v21, (size_t)v23);
  *((unsigned char *)v23 + (void)v24) = 0;
  abm::client::PerformCommand();
  int v27 = *(_DWORD *)buf;
  xpc_object_t v11 = *(void **)&v37[4];
  char v10 = v38;
  char v38 = 0;
  v37[4] = 0;
  if (SHIBYTE(v32) < 0) {
    operator delete(__p[0]);
  }
  int v28 = v34;
  if (v34 && !atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
  }
  BOOL v12 = v27 == 0;
  uint64_t v13 = *((void *)this + 5);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
LABEL_37:
    unint64_t v29 = "Failed";
    if (v12) {
      unint64_t v29 = "Success";
    }
    *(_DWORD *)buf = 136315138;
    *(void *)uint64_t v37 = v29;
    _os_log_impl(&dword_263679000, v13, OS_LOG_TYPE_DEFAULT, "#I AWD Configuration add %s", buf, 0xCu);
  }
LABEL_40:
  xpc_release(v6);
  if (v10 < 0) {
    operator delete(v11);
  }
  xpc_release(v4);
  return v12;
}

void sub_263684920(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void *std::ifstream::~ifstream(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8C2A8];
  uint64_t v3 = *MEMORY[0x263F8C2A8];
  *a1 = *MEMORY[0x263F8C2A8];
  *(void *)((char *)a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  MEMORY[0x263E67B20](a1 + 2);
  std::istream::~istream();
  MEMORY[0x263E67C70](a1 + 53);
  return a1;
}

BOOL BasebandDiagnostics::removeAWDConfig(BasebandDiagnostics *this)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  xpc_object_t v28 = xpc_null_create();
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (v2 || (xpc_object_t v2 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E67FD0](v2) == MEMORY[0x263EF8708])
    {
      xpc_retain(v2);
      xpc_object_t v3 = v2;
    }
    else
    {
      xpc_object_t v3 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    xpc_object_t v2 = 0;
  }
  xpc_release(v2);
  xpc_object_t v4 = xpc_int64_create(5);
  if (!v4) {
    xpc_object_t v4 = xpc_null_create();
  }
  xpc_dictionary_set_value(v3, (const char *)*MEMORY[0x263F268C8], v4);
  xpc_object_t v5 = xpc_null_create();
  xpc_release(v4);
  xpc_release(v5);
  xpc_object_t v6 = xpc_int64_create(5000);
  if (!v6) {
    xpc_object_t v6 = xpc_null_create();
  }
  xpc_dictionary_set_value(v3, (const char *)*MEMORY[0x263F25DB8], v6);
  xpc_object_t v7 = xpc_null_create();
  xpc_release(v6);
  xpc_release(v7);
  xpc_object_t v8 = (std::__shared_weak_count *)*((void *)this + 8);
  uint64_t v26 = *((void *)this + 7);
  int v27 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  xpc_object_t v9 = (const void *)*MEMORY[0x263F26480];
  size_t v10 = strlen((const char *)*MEMORY[0x263F26480]);
  if (v10 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  xpc_object_t v11 = (void *)v10;
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    BOOL v12 = (void **)operator new(v13 + 1);
    __dst[1] = v11;
    unint64_t v25 = v14 | 0x8000000000000000;
    __dst[0] = v12;
    goto LABEL_20;
  }
  HIBYTE(v25) = v10;
  BOOL v12 = __dst;
  if (v10) {
LABEL_20:
  }
    memmove(v12, v9, (size_t)v11);
  *((unsigned char *)v11 + (void)v12) = 0;
  abm::client::PerformCommand();
  int v15 = *(_DWORD *)buf;
  xpc_object_t v16 = *(void **)&v30[4];
  int v17 = v31;
  char v31 = 0;
  v30[4] = 0;
  if (SHIBYTE(v25) < 0) {
    operator delete(__dst[0]);
  }
  xpc_object_t v18 = v27;
  if (v27 && !atomic_fetch_add(&v27->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
    xpc_object_t v19 = *((void *)this + 5);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
  }
  else
  {
    xpc_object_t v19 = *((void *)this + 5);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
  }
  size_t v20 = "Failed";
  if (!v15) {
    size_t v20 = "Success";
  }
  *(_DWORD *)buf = 136315138;
  *(void *)uint64_t v30 = v20;
  _os_log_impl(&dword_263679000, v19, OS_LOG_TYPE_DEFAULT, "#I AWD Configuration remove %s", buf, 0xCu);
LABEL_29:
  unint64_t v21 = (std::__shared_weak_count *)*((void *)this + 8);
  uint64_t v23 = v21;
  if (v21) {
    atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  abm::client::EventsOff();
  if (v23 && !atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
  }
  xpc_release(v3);
  if (v17 < 0) {
    operator delete(v16);
  }
  return v15 == 0;
}

void sub_263684E50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void BasebandDiagnostics::resetAll(BasebandDiagnostics *this)
{
  xpc_object_t v2 = (std::__shared_weak_count *)*((void *)this + 8);
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    xpc_object_t v3 = *((void *)this + 10);
    *((void *)this + 10) = 0;
    if (!v3) {
      return;
    }
  }
  else
  {
    xpc_object_t v3 = *((void *)this + 10);
    *((void *)this + 10) = 0;
    if (!v3) {
      return;
    }
  }
  dispatch_group_leave(v3);

  dispatch_release(v3);
}

void BasebandDiagnostics::registerAWDMetricHandler(void *a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  xpc_object_t v3 = (void *)a2[3];
  if (v3)
  {
    a1[14] = a1[13];
    *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v4;
    long long v33 = v4;
    if (v3 == a2)
    {
      *((void *)&v33 + 1) = buf;
      (*(void (**)(void *, uint8_t *))(*a2 + 24))(a2, buf);
    }
    else
    {
      *((void *)&v33 + 1) = (*(uint64_t (**)(void *))(*v3 + 16))(v3);
    }
    xpc_object_t v6 = (std::__shared_weak_count *)a1[8];
    uint64_t v23 = a1[7];
    uint64_t v24 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    xpc_object_t v7 = (const void *)*MEMORY[0x263F25DC0];
    size_t v8 = strlen((const char *)*MEMORY[0x263F25DC0]);
    if (v8 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    xpc_object_t v9 = (void *)v8;
    if (v8 >= 0x17)
    {
      uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v8 | 7) != 0x17) {
        uint64_t v11 = v8 | 7;
      }
      uint64_t v12 = v11 + 1;
      size_t v10 = (void **)operator new(v11 + 1);
      __dst[1] = v9;
      unint64_t v22 = v12 | 0x8000000000000000;
      __dst[0] = v10;
    }
    else
    {
      HIBYTE(v22) = v8;
      size_t v10 = __dst;
      if (!v8)
      {
LABEL_17:
        *((unsigned char *)v9 + (void)v10) = 0;
        uint64_t v25 = MEMORY[0x263EF8330];
        uint64_t v26 = 3321888768;
        int v27 = ___ZN19BasebandDiagnostics24registerAWDMetricHandlerENSt3__18functionIFvNS0_6vectorIhNS0_9allocatorIhEEEEEEE_block_invoke;
        xpc_object_t v28 = &__block_descriptor_72_ea8_40c57_ZTSNSt3__18functionIFvNS_6vectorIhNS_9allocatorIhEEEEEEE_e31_v24__0_v8__dispatch_group_s__16l;
        unint64_t v29 = a1;
        uint64_t v13 = *((void *)&v33 + 1);
        if (*((void *)&v33 + 1))
        {
          if (*((uint8_t **)&v33 + 1) == buf)
          {
            char v31 = v30;
            (*(void (**)(uint8_t *, void *))(*(void *)buf + 24))(buf, v30);
LABEL_22:
            abm::client::RegisterEventHandler();
            if (SHIBYTE(v22) < 0) {
              operator delete(__dst[0]);
            }
            uint64_t v14 = v24;
            if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
              std::__shared_weak_count::__release_weak(v14);
            }
            int v15 = (std::__shared_weak_count *)a1[8];
            size_t v20 = v15;
            if (v15) {
              atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            abm::client::EventsOff();
            if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
              std::__shared_weak_count::__release_weak(v20);
            }
            xpc_object_t v16 = (std::__shared_weak_count *)a1[8];
            xpc_object_t v19 = v16;
            if (v16) {
              atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            abm::client::EventsOn();
            if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
              std::__shared_weak_count::__release_weak(v19);
              int v17 = v31;
              if (v31 != v30)
              {
LABEL_37:
                if (v17) {
                  (*(void (**)(void *))(*v17 + 40))(v17);
                }
                uint64_t v18 = *((void *)&v33 + 1);
                if (*((uint8_t **)&v33 + 1) != buf) {
                  goto LABEL_40;
                }
                goto LABEL_44;
              }
            }
            else
            {
              int v17 = v31;
              if (v31 != v30) {
                goto LABEL_37;
              }
            }
            (*(void (**)(void *))(v30[0] + 32))(v30);
            uint64_t v18 = *((void *)&v33 + 1);
            if (*((uint8_t **)&v33 + 1) != buf)
            {
LABEL_40:
              if (v18) {
                (*(void (**)(uint64_t))(*(void *)v18 + 40))(v18);
              }
              return;
            }
LABEL_44:
            (*(void (**)(uint8_t *))(*(void *)buf + 32))(buf);
            return;
          }
          uint64_t v13 = (*(uint64_t (**)(void))(**((void **)&v33 + 1) + 16))();
        }
        char v31 = (void *)v13;
        goto LABEL_22;
      }
    }
    memmove(v10, v7, (size_t)v9);
    goto LABEL_17;
  }
  xpc_object_t v5 = a1[5];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_263679000, v5, OS_LOG_TYPE_ERROR, "No AWD Metric handler", buf, 2u);
  }
}

void sub_263685450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  if (a18 < 0)
  {
    operator delete(__p);
    std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
    std::function<void ()(std::vector<unsigned char>)>::~function((void *)(v19 - 96));
    _Unwind_Resume(a1);
  }
  std::shared_ptr<abm::client::Manager>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  std::function<void ()(std::vector<unsigned char>)>::~function((void *)(v19 - 96));
  _Unwind_Resume(a1);
}

void ___ZN19BasebandDiagnostics24registerAWDMetricHandlerENSt3__18functionIFvNS0_6vectorIhNS0_9allocatorIhEEEEEEE_block_invoke(uint64_t a1, xpc_object_t object)
{
  objecta[3] = *(xpc_object_t *)MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  if (object)
  {
    xpc_object_t v4 = object;
    xpc_retain(object);
    goto LABEL_4;
  }
  xpc_object_t v4 = xpc_null_create();
  if (v4)
  {
LABEL_4:
    if (MEMORY[0x263E67FD0](v4) == MEMORY[0x263EF8708])
    {
      xpc_retain(v4);
      xpc_object_t v5 = v4;
    }
    else
    {
      xpc_object_t v5 = xpc_null_create();
    }
    goto LABEL_8;
  }
  xpc_object_t v5 = xpc_null_create();
  xpc_object_t v4 = 0;
LABEL_8:
  xpc_release(v4);
  xpc_object_t v6 = (const char *)*MEMORY[0x263F268C8];
  if (xpc_dictionary_get_value(v5, (const char *)*MEMORY[0x263F268C8]))
  {
    xpc_object_t value = xpc_dictionary_get_value(v5, v6);
    objecta[0] = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      objecta[0] = xpc_null_create();
    }
    int v8 = xpc::dyn_cast_or_default();
    xpc_release(objecta[0]);
    if (v8 == 5)
    {
      xpc_object_t v9 = (const char *)*MEMORY[0x263F25DB0];
      if (xpc_dictionary_get_value(v5, (const char *)*MEMORY[0x263F25DB0]))
      {
        xpc_object_t v10 = xpc_dictionary_get_value(v5, v9);
        xpc_object_t v28 = v10;
        if (v10) {
          xpc_retain(v10);
        }
        else {
          xpc_object_t v28 = xpc_null_create();
        }
        memset(objecta, 0, 24);
        xpc::dyn_cast_or_default();
        uint64_t v12 = v29;
        uint64_t v13 = v30;
        unint64_t v29 = 0;
        uint64_t v30 = 0;
        uint64_t v31 = 0;
        xpc_release(v28);
        uint64_t v14 = *(NSObject **)(v3 + 40);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(objecta[0]) = 134217984;
          *(xpc_object_t *)((char *)objecta + 4) = (xpc_object_t)(v13 - v12);
          _os_log_impl(&dword_263679000, v14, OS_LOG_TYPE_DEFAULT, "#I Received AWD metric w/ payload size = %ld", (uint8_t *)objecta, 0xCu);
        }
        std::vector<unsigned char>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(v3 + 104, *(char **)(v3 + 112), v12, v13, v13 - v12);
        int v15 = (const char *)*MEMORY[0x263F25F08];
        if (xpc_dictionary_get_value(v5, (const char *)*MEMORY[0x263F25F08]))
        {
          xpc_object_t v16 = xpc_dictionary_get_value(v5, v15);
          objecta[0] = v16;
          if (v16) {
            xpc_retain(v16);
          }
          else {
            objecta[0] = xpc_null_create();
          }
          int v17 = xpc::dyn_cast_or_default();
          xpc_release(objecta[0]);
          if (!v17)
          {
            uint64_t v24 = *(NSObject **)(v3 + 40);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(objecta[0]) = 0;
              _os_log_impl(&dword_263679000, v24, OS_LOG_TYPE_DEFAULT, "#I Continue to wait for more data..", (uint8_t *)objecta, 2u);
            }
            goto LABEL_36;
          }
        }
        memset(objecta, 170, 24);
        wis::createTagForProtobuf((wis *)0xF);
        std::vector<unsigned char>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(v3 + 104, *(char **)(v3 + 104), (unsigned char *)objecta[0], (unsigned char *)objecta[1], (char *)objecta[1] - (char *)objecta[0]);
        if (objecta[0])
        {
          objecta[1] = objecta[0];
          operator delete(objecta[0]);
        }
      }
      else
      {
        uint64_t v11 = *(NSObject **)(v3 + 40);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          LOWORD(objecta[0]) = 0;
          _os_log_error_impl(&dword_263679000, v11, OS_LOG_TYPE_ERROR, "Received AWD metric w/ no Payload!", (uint8_t *)objecta, 2u);
        }
        uint64_t v12 = 0;
        *(void *)(v3 + 112) = *(void *)(v3 + 104);
      }
      uint64_t v18 = *(void *)(a1 + 64);
      if (v18)
      {
        long long __p = 0;
        uint64_t v26 = 0;
        int v27 = 0;
        size_t v20 = *(unsigned char **)(v3 + 104);
        uint64_t v19 = *(unsigned char **)(v3 + 112);
        size_t v21 = v19 - v20;
        if (v19 != v20)
        {
          if ((v21 & 0x8000000000000000) != 0) {
            std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v22 = (char *)operator new(v19 - v20);
          uint64_t v23 = &v22[v21];
          long long __p = v22;
          int v27 = &v22[v21];
          memcpy(v22, v20, v21);
          uint64_t v26 = v23;
        }
        (*(void (**)(uint64_t, void **))(*(void *)v18 + 48))(v18, &__p);
        if (__p)
        {
          uint64_t v26 = __p;
          operator delete(__p);
        }
      }
      *(void *)(v3 + 112) = *(void *)(v3 + 104);
LABEL_36:
      if (v12) {
        operator delete(v12);
      }
    }
  }
  xpc_release(v5);
}

void sub_2636858D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, xpc_object_t a13, uint64_t a14, uint64_t a15, uint64_t a16, xpc_object_t object, uint64_t a18)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t __copy_helper_block_ea8_40c57_ZTSNSt3__18functionIFvNS_6vectorIhNS_9allocatorIhEEEEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a2 + 64);
  if (result)
  {
    if (result == a2 + 40)
    {
      *(void *)(a1 + 64) = a1 + 40;
      xpc_object_t v4 = *(uint64_t (**)(void))(**(void **)(a2 + 64) + 24);
      return v4();
    }
    else
    {
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 16))(result);
      *(void *)(a1 + 64) = result;
    }
  }
  else
  {
    *(void *)(a1 + 64) = 0;
  }
  return result;
}

uint64_t __destroy_helper_block_ea8_40c57_ZTSNSt3__18functionIFvNS_6vectorIhNS_9allocatorIhEEEEEEE(uint64_t a1)
{
  uint64_t v1 = a1 + 40;
  uint64_t result = *(void *)(a1 + 64);
  if (result == v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 32))(v1);
  }
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 40))();
  }
  return result;
}

void *std::function<void ()(std::vector<unsigned char>)>::~function(void *a1)
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

BOOL BasebandDiagnostics::saveToUserDefaults(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  xpc_object_t v6 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BasebandDiagnostics"];
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0) {
      xpc_object_t v7 = a2;
    }
    else {
      xpc_object_t v7 = (uint64_t *)*a2;
    }
    int v8 = [NSString stringWithUTF8String:v7];
    [v6 removeObjectForKey:v8];

    if (*((char *)a2 + 23) >= 0) {
      xpc_object_t v9 = a2;
    }
    else {
      xpc_object_t v9 = (uint64_t *)*a2;
    }
    xpc_object_t v10 = [NSString stringWithUTF8String:v9];
    [v6 setObject:a3 forKey:v10];

    [v6 synchronize];
  }
  uint64_t v11 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (uint64_t *)*a2;
    uint64_t v13 = "Failed";
    if (*((char *)a2 + 23) >= 0) {
      uint64_t v12 = a2;
    }
    if (v6) {
      uint64_t v13 = "Success";
    }
    int v15 = 136315394;
    xpc_object_t v16 = v12;
    __int16 v17 = 2080;
    uint64_t v18 = v13;
    _os_log_impl(&dword_263679000, v11, OS_LOG_TYPE_DEFAULT, "#I User Defaults - Save Data for key=%s: %s", (uint8_t *)&v15, 0x16u);
  }

  return v6 != 0;
}

void sub_263685D00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_263685D14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_263685D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL BasebandDiagnostics::removeFromUserDefaults(uint64_t a1, uint64_t *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  xpc_object_t v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BasebandDiagnostics"];
  if (v4)
  {
    if (*((char *)a2 + 23) >= 0) {
      xpc_object_t v5 = a2;
    }
    else {
      xpc_object_t v5 = (uint64_t *)*a2;
    }
    xpc_object_t v6 = [NSString stringWithUTF8String:v5];
    [v4 removeObjectForKey:v6];

    [v4 synchronize];
  }
  xpc_object_t v7 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = (uint64_t *)*a2;
    xpc_object_t v9 = "Failed";
    if (*((char *)a2 + 23) >= 0) {
      int v8 = a2;
    }
    if (v4) {
      xpc_object_t v9 = "Success";
    }
    int v11 = 136315394;
    uint64_t v12 = v8;
    __int16 v13 = 2080;
    uint64_t v14 = v9;
    _os_log_impl(&dword_263679000, v7, OS_LOG_TYPE_DEFAULT, "#I User Defaults - Remove key=%s: %s", (uint8_t *)&v11, 0x16u);
  }

  return v4 != 0;
}

void sub_263685E84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_263685E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BasebandDiagnostics::readObjectFromUserDefaults(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BasebandDiagnostics"];
  if (v3)
  {
    if (*((char *)a2 + 23) >= 0) {
      xpc_object_t v4 = a2;
    }
    else {
      xpc_object_t v4 = (uint64_t *)*a2;
    }
    xpc_object_t v5 = [NSString stringWithUTF8String:v4];
    uint64_t v6 = [v3 objectForKey:v5];

    return v6;
  }
  else
  {

    return 0;
  }
}

void sub_263685F50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_263685F64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BasebandDiagnostics::readIntegerFromUserDefaults(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BasebandDiagnostics"];
  if (v3)
  {
    if (*((char *)a2 + 23) >= 0) {
      xpc_object_t v4 = a2;
    }
    else {
      xpc_object_t v4 = (uint64_t *)*a2;
    }
    xpc_object_t v5 = [NSString stringWithUTF8String:v4];
    uint64_t v6 = [v3 integerForKey:v5];

    return v6;
  }
  else
  {

    return 0;
  }
}

void sub_263686018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_26368602C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void BasebandDiagnostics::readStringFromUserDefaults(uint64_t *a1@<X1>, void **a2@<X2>, uint64_t a3@<X8>)
{
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BasebandDiagnostics"];
  if (v6)
  {
    id v13 = v6;
    if (*((char *)a1 + 23) >= 0) {
      xpc_object_t v7 = a1;
    }
    else {
      xpc_object_t v7 = (uint64_t *)*a1;
    }
    int v8 = [NSString stringWithUTF8String:v7];
    xpc_object_t v9 = [v13 stringForKey:v8];

    if (v9 && [v9 length])
    {
      std::string::__assign_external((std::string *)a3, (const std::string::value_type *)[v9 UTF8String]);
    }
    else if ((void **)a3 != a2)
    {
      char v10 = *((unsigned char *)a2 + 23);
      if (*(char *)(a3 + 23) < 0)
      {
        if (v10 >= 0) {
          int v11 = a2;
        }
        else {
          int v11 = *a2;
        }
        if (v10 >= 0) {
          size_t v12 = *((unsigned __int8 *)a2 + 23);
        }
        else {
          size_t v12 = (size_t)a2[1];
        }
        std::string::__assign_no_alias<false>((void **)a3, v11, v12);
      }
      else if ((*((unsigned char *)a2 + 23) & 0x80) != 0)
      {
        std::string::__assign_no_alias<true>((void *)a3, *a2, (size_t)a2[1]);
      }
      else
      {
        *(_OWORD *)a3 = *(_OWORD *)a2;
        *(void *)(a3 + 16) = a2[2];
      }
    }

    uint64_t v6 = v13;
  }
}

void sub_263686174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (*(char *)(v10 + 23) < 0) {
    operator delete(*(void **)v10);
  }
  _Unwind_Resume(a1);
}

void *ctu::SharedSynchronizable<BasebandDiagnostics>::~SharedSynchronizable(void *a1)
{
  xpc_object_t v2 = a1[3];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[2];
  if (v3) {
    dispatch_release(v3);
  }
  xpc_object_t v4 = (std::__shared_weak_count *)a1[1];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void std::vector<unsigned char>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(uint64_t a1, char *__dst, unsigned char *__src, unsigned char *a4, unint64_t a5)
{
  if ((uint64_t)a5 < 1) {
    return;
  }
  uint64_t v10 = *(char **)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9 - (uint64_t)v10 < (uint64_t)a5)
  {
    int v11 = *(char **)a1;
    uint64_t v12 = (uint64_t)&v10[a5 - *(void *)a1];
    if (v12 < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    id v13 = (char *)(__dst - v11);
    unint64_t v14 = v9 - (void)v11;
    if (2 * v14 > v12) {
      uint64_t v12 = 2 * v14;
    }
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v15 = v12;
    }
    if (v15)
    {
      xpc_object_t v16 = operator new(v15);
      __int16 v17 = &v13[(void)v16];
      uint64_t v18 = &v13[(void)v16 + a5];
      uint64_t v19 = &v13[(void)v16];
      size_t v20 = __src;
      if (a5 < 8) {
        goto LABEL_45;
      }
    }
    else
    {
      xpc_object_t v16 = 0;
      __int16 v17 = (char *)(__dst - v11);
      uint64_t v18 = &v13[a5];
      uint64_t v19 = (char *)(__dst - v11);
      size_t v20 = __src;
      if (a5 < 8) {
        goto LABEL_45;
      }
    }
    uint64_t v19 = v17;
    size_t v20 = __src;
    if ((char *)(&__dst[(void)v16] - &__src[(void)v11]) >= (char *)0x20)
    {
      if (a5 >= 0x20)
      {
        uint64_t v29 = a5 & 0x7FFFFFFFFFFFFFE0;
        int v36 = (long long *)(__src + 16);
        uint64_t v37 = (char *)v16 + (void)v13 + 16;
        unint64_t v38 = a5 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v39 = *v36;
          *(v37 - 1) = *(v36 - 1);
          *uint64_t v37 = v39;
          v36 += 2;
          v37 += 2;
          v38 -= 32;
        }
        while (v38);
        if (v29 == a5)
        {
LABEL_46:
          uint64_t v45 = *(char **)a1;
          if (*(char **)a1 == __dst)
          {
LABEL_55:
            long long v53 = (char *)v16 + v15;
            if (v10 != __dst) {
              memmove(v18, __dst, v10 - __dst);
            }
            uint64_t v54 = *(char **)a1;
            *(void *)a1 = v17;
            *(void *)(a1 + 8) = &v18[v10 - __dst];
            *(void *)(a1 + 16) = v53;
            if (v54)
            {
              operator delete(v54);
            }
            return;
          }
          unint64_t v46 = __dst - v45;
          if ((unint64_t)(__dst - v45) >= 0x20)
          {
            uint64_t v47 = __dst;
            if ((unint64_t)(v11 - (unsigned char *)v16) >= 0x20)
            {
              uint64_t v47 = &__dst[-(v46 & 0xFFFFFFFFFFFFFFE0)];
              v17 -= v46 & 0xFFFFFFFFFFFFFFE0;
              size_t v48 = __dst - 16;
              v49 = (char *)v16 + __dst - 16 - v11;
              unint64_t v50 = v46 & 0xFFFFFFFFFFFFFFE0;
              do
              {
                long long v51 = *(_OWORD *)v48;
                *(v49 - 1) = *((_OWORD *)v48 - 1);
                _OWORD *v49 = v51;
                v49 -= 2;
                v48 -= 32;
                v50 -= 32;
              }
              while (v50);
              if (v46 == (v46 & 0xFFFFFFFFFFFFFFE0)) {
                goto LABEL_54;
              }
            }
          }
          else
          {
            uint64_t v47 = __dst;
          }
          do
          {
            char v52 = *--v47;
            *--__int16 v17 = v52;
          }
          while (v47 != v45);
LABEL_54:
          uint64_t v10 = *(char **)(a1 + 8);
          goto LABEL_55;
        }
        if ((a5 & 0x18) == 0)
        {
          size_t v20 = &__src[v29];
          uint64_t v19 = &v17[v29];
          goto LABEL_45;
        }
      }
      else
      {
        uint64_t v29 = 0;
      }
      uint64_t v19 = &v17[a5 & 0xFFFFFFFFFFFFFFF8];
      size_t v20 = &__src[a5 & 0xFFFFFFFFFFFFFFF8];
      uint64_t v40 = (uint64_t *)&__src[v29];
      uint64_t v41 = (char *)v16 + &__dst[v29] - v11;
      unint64_t v42 = v29 - (a5 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        uint64_t v43 = *v40++;
        *v41++ = v43;
        v42 += 8;
      }
      while (v42);
      if ((a5 & 0x7FFFFFFFFFFFFFF8) == a5) {
        goto LABEL_46;
      }
    }
    do
    {
LABEL_45:
      char v44 = *v20++;
      *v19++ = v44;
    }
    while (v19 != v18);
    goto LABEL_46;
  }
  uint64_t v21 = v10 - __dst;
  if (v10 - __dst >= (uint64_t)a5)
  {
    unint64_t v22 = &__src[a5];
    uint64_t v24 = *(char **)(a1 + 8);
    uint64_t v25 = &__dst[a5];
    uint64_t v26 = &v10[-a5];
    int v27 = v24;
    if ((unint64_t)v10 < a5) {
      goto LABEL_30;
    }
    goto LABEL_19;
  }
  unint64_t v22 = &__src[v21];
  int64_t v23 = a4 - &__src[v21];
  if (a4 != &__src[v21]) {
    memmove(*(void **)(a1 + 8), &__src[v21], a4 - &__src[v21]);
  }
  uint64_t v24 = &v10[v23];
  *(void *)(a1 + 8) = &v10[v23];
  if (v21 >= 1)
  {
    uint64_t v25 = &__dst[a5];
    uint64_t v26 = &v24[-a5];
    int v27 = &v10[v23];
    if (&v24[-a5] >= v10) {
      goto LABEL_30;
    }
LABEL_19:
    unint64_t v28 = &v10[a5] - v24;
    if (v28 >= 0x20)
    {
      int v27 = v24;
      if (a5 >= 0x20)
      {
        uint64_t v30 = &v26[v28 & 0xFFFFFFFFFFFFFFE0];
        int v27 = &v24[v28 & 0xFFFFFFFFFFFFFFE0];
        uint64_t v31 = v24 + 16;
        uint64_t v32 = (long long *)(v26 + 16);
        unint64_t v33 = v28 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v34 = *v32;
          *(v31 - 1) = *(v32 - 1);
          _OWORD *v31 = v34;
          v31 += 2;
          v32 += 2;
          v33 -= 32;
        }
        while (v33);
        uint64_t v26 = v30;
        if (v28 == (v28 & 0xFFFFFFFFFFFFFFE0)) {
          goto LABEL_30;
        }
      }
    }
    else
    {
      int v27 = v24;
    }
    do
    {
      char v35 = *v26++;
      *v27++ = v35;
    }
    while (v26 != v10);
LABEL_30:
    *(void *)(a1 + 8) = v27;
    if (v24 != v25) {
      memmove(v25, __dst, v24 - v25);
    }
    if (v22 != __src)
    {
      memmove(__dst, __src, v22 - __src);
    }
  }
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
}

void *std::string::__assign_no_alias<true>(void *__dst, void *__src, size_t __len)
{
  if (__len > 0x16)
  {
    if (__len - 0x7FFFFFFFFFFFFFF7 <= 0x800000000000001ELL) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    size_t v7 = 44;
    if (__len > 0x2C) {
      size_t v7 = __len;
    }
    size_t v8 = (v7 | 7) + 1;
    uint64_t v6 = operator new(v8);
    memcpy(v6, __src, __len);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *long long __dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    uint64_t v6 = __dst;
    if (__len)
    {
      memmove(__dst, __src, __len);
      uint64_t v6 = __dst;
    }
  }
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void **std::string::__assign_no_alias<false>(void **a1, void *__src, size_t __len)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v7 = v6 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) > __len)
  {
    size_t v8 = *a1;
    a1[1] = (void *)__len;
    if (__len) {
      memmove(v8, __src, __len);
    }
    goto LABEL_12;
  }
  size_t v9 = 0x7FFFFFFFFFFFFFF7;
  if (0x7FFFFFFFFFFFFFF7 - v7 < __len - v7 + 1) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  unint64_t v10 = v7 - 1;
  int v11 = a1;
  if ((v6 & 0x8000000000000000) == 0)
  {
    if (v10 > 0x3FFFFFFFFFFFFFF2) {
      goto LABEL_7;
    }
LABEL_14:
    unint64_t v13 = 2 * v10;
    if (__len > 2 * v10) {
      unint64_t v13 = __len;
    }
    uint64_t v14 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17) {
      uint64_t v14 = v13 | 7;
    }
    if (v13 >= 0x17) {
      size_t v9 = v14 + 1;
    }
    else {
      size_t v9 = 23;
    }
    size_t v8 = operator new(v9);
    if (!__len) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  int v11 = *a1;
  if (v10 <= 0x3FFFFFFFFFFFFFF2) {
    goto LABEL_14;
  }
LABEL_7:
  size_t v8 = operator new(0x7FFFFFFFFFFFFFF7uLL);
  if (__len) {
LABEL_8:
  }
    memcpy(v8, __src, __len);
LABEL_9:
  if (v10 != 22) {
    operator delete(v11);
  }
  a1[1] = (void *)__len;
  a1[2] = (void *)(v9 | 0x8000000000000000);
  *a1 = v8;
LABEL_12:
  *((unsigned char *)v8 + __len) = 0;
  return a1;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = this->__r_.__value_.__r.__words[2];
    unint64_t v8 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (__n > v8)
    {
      size_t v11 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - (v10 & 0x7FFFFFFFFFFFFFFFLL) >= __n - v8)
      {
        size_t v9 = (std::string *)this->__r_.__value_.__r.__words[0];
        if (v8 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          uint64_t v7 = operator new(v11);
          memcpy(v7, __s, __n);
          if (v8 != 22) {
            operator delete(v9);
          }
          this->__r_.__value_.__r.__words[2] = v11 | 0x8000000000000000;
          this->__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
LABEL_23:
          this->__r_.__value_.__l.__size_ = __n;
          goto LABEL_24;
        }
LABEL_8:
        std::string::size_type v12 = 2 * v8;
        if (__n > 2 * v8) {
          std::string::size_type v12 = __n;
        }
        uint64_t v13 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v13 = v12 | 7;
        }
        if (v12 >= 0x17) {
          size_t v11 = v13 + 1;
        }
        else {
          size_t v11 = 23;
        }
        goto LABEL_15;
      }
LABEL_25:
      std::string::__throw_length_error[abi:ne180100]();
    }
    unint64_t v6 = HIBYTE(v10);
    uint64_t v7 = (void *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    uint64_t v7 = this;
    if (__n > 0x16)
    {
      if (__n - 0x7FFFFFFFFFFFFFF7 >= 0x800000000000001FLL)
      {
        unint64_t v8 = 22;
        size_t v9 = this;
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0) {
    goto LABEL_23;
  }
  *((unsigned char *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
LABEL_24:
  *((unsigned char *)v7 + __n) = 0;
  return this;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  std::string::size_type v4 = strlen(__s);

  return std::string::__assign_external(this, __s, v4);
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C2D8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C198], MEMORY[0x263F8C0A0]);
}

uint64_t AMAuthInstallBasebandGetRFSelfTestTicket()
{
  return MEMORY[0x270F980E8]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x270F95FF0]();
}

uint64_t TelephonyRadiosGetRadioVendor()
{
  return MEMORY[0x270F97168]();
}

uint64_t TelephonyUtilIsCarrierBuild()
{
  return MEMORY[0x270F971A0]();
}

uint64_t TelephonyUtilIsInternalBuild()
{
  return MEMORY[0x270F971A8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t capabilities::radio::vendor(capabilities::radio *this)
{
  return MEMORY[0x270F96D28](this);
}

uint64_t abm::client::CreateManager()
{
  return MEMORY[0x270F0CE80]();
}

uint64_t abm::client::PerformCommand()
{
  return MEMORY[0x270F0CE88]();
}

uint64_t abm::client::RegisterEventHandler()
{
  return MEMORY[0x270F0CE90]();
}

uint64_t abm::client::EventsOn()
{
  return MEMORY[0x270F0CEA0]();
}

uint64_t abm::client::EventsOff()
{
  return MEMORY[0x270F0CEA8]();
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, os_log_s *a2)
{
  return MEMORY[0x270F972A0](this, a2);
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

uint64_t ctu::cf::dict_adapter::dict_adapter(ctu::cf::dict_adapter *this, const __CFDictionary *a2)
{
  return MEMORY[0x270F97518](this, a2);
}

void ctu::cf::dict_adapter::~dict_adapter(ctu::cf::dict_adapter *this)
{
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x270F97550]();
}

{
  return MEMORY[0x270F97560]();
}

uint64_t ctu::hex(ctu *this, const void *a2)
{
  return MEMORY[0x270F97628](this, a2);
}

uint64_t ctu::Gestalt::create_default_global(ctu::Gestalt *this)
{
  return MEMORY[0x270F976E8](this);
}

uint64_t wis::createTagForProtobuf(wis *this)
{
  return MEMORY[0x270F85910](this);
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x270F977E8]();
}

{
  return MEMORY[0x270F97800]();
}

{
  return MEMORY[0x270F97808]();
}

{
  return MEMORY[0x270F97820]();
}

uint64_t ctu::cf::map_adapter::copyCFNumberRef(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x270F978F8](this, a2);
}

uint64_t ctu::cf::map_adapter::getInt(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x270F97908](this, a2);
}

uint64_t ctu::cf::map_adapter::getBool(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x270F97910](this, a2);
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

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
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
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987D0]();
}

{
  return MEMORY[0x270F987E0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
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
  return MEMORY[0x270F98DE8]();
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

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
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

void dispatch_activate(dispatch_object_t object)
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

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
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

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC210](value);
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