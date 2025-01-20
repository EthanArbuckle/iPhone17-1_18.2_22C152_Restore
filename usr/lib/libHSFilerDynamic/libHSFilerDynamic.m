void support::misc::safe_timer::create(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, dispatch_qos_class_t a4@<W3>, support::misc::safe_timer **a5@<X8>)
{
  long long v10;
  support::misc::safe_timer *v11;
  void *v12;
  std::__shared_weak_count *v13;
  NSObject *v14;
  uint8_t v15[16];
  void *v16[2];
  uint64_t v17;
  void *__p[2];
  char v19;
  void *v20;
  long long v21;
  _OWORD v22[3];
  long long v23;
  long long v24;
  void v25[3];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x263EF8340];
  *(void *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v23 = v10;
  v24 = v10;
  v22[1] = v10;
  v22[2] = v10;
  v22[0] = v10;
  v20 = operator new(0x30uLL);
  v21 = xmmword_263807900;
  strcpy((char *)v20, "com.apple.telephony.basebandservices.support");
  v19 = 10;
  strcpy((char *)__p, "safe-timer");
  support::log::client::client(v22, (uint64_t)&v20, (uint64_t)__p);
  if (v19 < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v21) & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  else if ((SHIBYTE(v21) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(v20);
LABEL_3:
  *a5 = 0;
  v11 = (support::misc::safe_timer *)operator new(0xD0uLL);
  *(_OWORD *)v16 = *(_OWORD *)a1;
  v17 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = 0;
  v12 = (void *)a3[3];
  if (v12)
  {
    if (v12 == a3)
    {
      v26 = v25;
      (*(void (**)(void *, void *))(*a3 + 24))(a3, v25);
    }
    else
    {
      v26 = (void *)a3[3];
      a3[3] = 0;
    }
  }
  else
  {
    v26 = 0;
  }
  support::misc::safe_timer::safe_timer((uint64_t)v11, (const std::string::value_type *)v16, a2, 0, (uint64_t)v25, a4);
  if (v26 == v25)
  {
    (*(void (**)(void *))(v25[0] + 32))(v25);
    if ((SHIBYTE(v17) & 0x80000000) == 0) {
      goto LABEL_14;
    }
  }
  else
  {
    if (v26) {
      (*(void (**)(void *))(*v26 + 40))(v26);
    }
    if ((SHIBYTE(v17) & 0x80000000) == 0)
    {
LABEL_14:
      if (support::misc::safe_timer::init(v11)) {
        goto LABEL_15;
      }
      goto LABEL_21;
    }
  }
  operator delete(v16[0]);
  if (support::misc::safe_timer::init(v11))
  {
LABEL_15:
    *a5 = v11;
    *(void *)&v22[0] = &unk_270EAECE0;
    v13 = (std::__shared_weak_count *)v24;
    if (!(void)v24) {
      return;
    }
    goto LABEL_16;
  }
LABEL_21:
  v14 = *(NSObject **)v23;
  if (os_log_type_enabled(*(os_log_t *)v23, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v15 = 0;
    _os_log_error_impl(&dword_2637D5000, v14, OS_LOG_TYPE_ERROR, "error: failed to init safe_timer object", v15, 2u);
  }
  (*(void (**)(support::misc::safe_timer *))(*(void *)v11 + 8))(v11);
  *(void *)&v22[0] = &unk_270EAECE0;
  v13 = (std::__shared_weak_count *)v24;
  if ((void)v24)
  {
LABEL_16:
    if (!atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
}

void sub_2637D69DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,char a30)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void *std::function<void ()(void)>::~function(void *a1)
{
  v2 = (void *)a1[3];
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

BOOL support::misc::safe_timer::init(support::misc::safe_timer *this)
{
  if (!*((void *)this + 17))
  {
    v3 = **((void **)this + 13);
    BOOL result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    __int16 v9 = 0;
    size_t v4 = "error: invalid timeout value";
    size_t v5 = (uint8_t *)&v9;
    goto LABEL_15;
  }
  if (!*((void *)this + 22))
  {
    v3 = **((void **)this + 13);
    BOOL result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    __int16 v8 = 0;
    size_t v4 = "error: invalid timeout callback";
    size_t v5 = (uint8_t *)&v8;
    goto LABEL_15;
  }
  v1 = (void *)*((void *)this + 23);
  if (!v1)
  {
    v3 = **((void **)this + 13);
    BOOL result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    __int16 v7 = 0;
    size_t v4 = "error: failed to create dispatch queue";
    size_t v5 = (uint8_t *)&v7;
LABEL_15:
    _os_log_error_impl(&dword_2637D5000, v3, OS_LOG_TYPE_ERROR, v4, v5, 2u);
    return 0;
  }
  if (*((void *)this + 24))
  {
    dispatch_queue_set_specific(*((dispatch_queue_t *)this + 23), "CurrentQueue", v1, 0);
    return 1;
  }
  v3 = **((void **)this + 13);
  BOOL result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (result)
  {
    __int16 v6 = 0;
    size_t v4 = "error: failed to create dispatch safe_timer object";
    size_t v5 = (uint8_t *)&v6;
    goto LABEL_15;
  }
  return result;
}

void support::log::client::~client(support::log::client *this)
{
  *(void *)this = &unk_270EAECE0;
  v1 = (std::__shared_weak_count *)*((void *)this + 8);
  if (v1)
  {
    if (!atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

void support::misc::safe_timer::create(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, dispatch_qos_class_t a5@<W4>, support::misc::safe_timer **a6@<X8>)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v25 = v12;
  long long v26 = v12;
  v24[1] = v12;
  v24[2] = v12;
  v24[0] = v12;
  v22 = operator new(0x30uLL);
  long long v23 = xmmword_263807900;
  strcpy((char *)v22, "com.apple.telephony.basebandservices.support");
  char v21 = 10;
  strcpy((char *)__p, "safe-timer");
  support::log::client::client(v24, (uint64_t)&v22, (uint64_t)__p);
  if (v21 < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v23) & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  else if ((SHIBYTE(v23) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(v22);
LABEL_3:
  *a6 = 0;
  v13 = (support::misc::safe_timer *)operator new(0xD0uLL);
  *(_OWORD *)v18 = *(_OWORD *)a1;
  uint64_t v19 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = 0;
  v14 = (void *)a4[3];
  if (v14)
  {
    if (v14 == a4)
    {
      v28 = v27;
      (*(void (**)(void *, void *))(*a4 + 24))(a4, v27);
    }
    else
    {
      v28 = (void *)a4[3];
      a4[3] = 0;
    }
  }
  else
  {
    v28 = 0;
  }
  support::misc::safe_timer::safe_timer((uint64_t)v13, (const std::string::value_type *)v18, a2, a3, (uint64_t)v27, a5);
  if (v28 == v27)
  {
    (*(void (**)(void *))(v27[0] + 32))(v27);
    if ((SHIBYTE(v19) & 0x80000000) == 0) {
      goto LABEL_14;
    }
  }
  else
  {
    if (v28) {
      (*(void (**)(void *))(*v28 + 40))(v28);
    }
    if ((SHIBYTE(v19) & 0x80000000) == 0)
    {
LABEL_14:
      if (support::misc::safe_timer::init(v13)) {
        goto LABEL_15;
      }
      goto LABEL_21;
    }
  }
  operator delete(v18[0]);
  if (support::misc::safe_timer::init(v13))
  {
LABEL_15:
    *a6 = v13;
    *(void *)&v24[0] = &unk_270EAECE0;
    v15 = (std::__shared_weak_count *)v26;
    if (!(void)v26) {
      return;
    }
    goto LABEL_16;
  }
LABEL_21:
  v16 = *(NSObject **)v25;
  if (os_log_type_enabled(*(os_log_t *)v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v17 = 0;
    _os_log_error_impl(&dword_2637D5000, v16, OS_LOG_TYPE_ERROR, "error: failed to init safe_timer object", v17, 2u);
  }
  (*(void (**)(support::misc::safe_timer *))(*(void *)v13 + 8))(v13);
  *(void *)&v24[0] = &unk_270EAECE0;
  v15 = (std::__shared_weak_count *)v26;
  if ((void)v26)
  {
LABEL_16:
    if (!atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
}

void sub_2637D70E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,char a30)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t support::misc::safe_timer::safe_timer(uint64_t a1, const std::string::value_type *a2, uint64_t a3, uint64_t a4, uint64_t a5, dispatch_qos_class_t a6)
{
  *(void *)a1 = &unk_270EAEC10;
  uint64_t v11 = a1 + 8;
  *((unsigned char *)&v30.__r_.__value_.__s + 23) = 11;
  strcpy((char *)&v30, "safe-timer.");
  std::string::size_type v12 = *((void *)a2 + 1);
  if (a2[23] >= 0)
  {
    std::string::size_type v13 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = *(const std::string::value_type **)a2;
    std::string::size_type v13 = v12;
  }
  v14 = std::string::append(&v30, a2, v13);
  long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  *(void *)(v11 + 16) = *((void *)&v14->__r_.__value_.__l + 2);
  *(_OWORD *)uint64_t v11 = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v30.__r_.__value_.__l.__data_);
  }
  v30.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&v30.__r_.__value_.__r.__words[1] = xmmword_263807910;
  strcpy(v30.__r_.__value_.__l.__data_, "com.apple.telephony.baseband.");
  int v16 = *(char *)(a1 + 31);
  if (v16 >= 0) {
    v17 = (const std::string::value_type *)v11;
  }
  else {
    v17 = *(const std::string::value_type **)(a1 + 8);
  }
  if (v16 >= 0) {
    std::string::size_type v18 = *(unsigned __int8 *)(a1 + 31);
  }
  else {
    std::string::size_type v18 = *(void *)(a1 + 16);
  }
  uint64_t v19 = std::string::append(&v30, v17, v18);
  v20 = (const char *)(a1 + 32);
  long long v21 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  *(void *)(a1 + 48) = *((void *)&v19->__r_.__value_.__l + 2);
  *(_OWORD *)(a1 + 32) = v21;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v30.__r_.__value_.__l.__data_);
  }
  v28 = operator new(0x30uLL);
  long long v29 = xmmword_263807900;
  strcpy((char *)v28, "com.apple.telephony.basebandservices.support");
  if (*(char *)(a1 + 31) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 8), *(void *)(a1 + 16));
  }
  else {
    std::string __p = *(std::string *)v11;
  }
  support::log::client::client((void *)(a1 + 56), (uint64_t)&v28, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v29) & 0x80000000) == 0)
    {
LABEL_19:
      *(void *)(a1 + 136) = a3;
      *(void *)(a1 + 144) = a4;
      uint64_t v22 = a5 + 24;
      uint64_t v23 = *(void *)(a5 + 24);
      if (v23) {
        goto LABEL_20;
      }
LABEL_24:
      uint64_t v22 = a1 + 176;
      goto LABEL_25;
    }
  }
  else if ((SHIBYTE(v29) & 0x80000000) == 0)
  {
    goto LABEL_19;
  }
  operator delete(v28);
  *(void *)(a1 + 136) = a3;
  *(void *)(a1 + 144) = a4;
  uint64_t v22 = a5 + 24;
  uint64_t v23 = *(void *)(a5 + 24);
  if (!v23) {
    goto LABEL_24;
  }
LABEL_20:
  if (v23 != a5)
  {
    *(void *)(a1 + 176) = v23;
LABEL_25:
    *(void *)uint64_t v22 = 0;
    goto LABEL_27;
  }
  *(void *)(a1 + 176) = a1 + 152;
  (*(void (**)(void))(**(void **)v22 + 24))();
LABEL_27:
  if (*(char *)(a1 + 55) < 0) {
    v20 = *(const char **)v20;
  }
  v24 = dispatch_queue_attr_make_with_qos_class(0, a6, 0);
  long long v25 = dispatch_queue_create(v20, v24);
  *(void *)(a1 + 184) = v25;
  *(void *)(a1 + 192) = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v25);
  *(_WORD *)(a1 + 200) = 0;
  return a1;
}

void sub_2637D7414(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a21 < 0)
  {
    operator delete(__p);
    if ((*(char *)(v27 + 55) & 0x80000000) == 0) {
      goto LABEL_6;
    }
  }
  else if ((*(char *)(v27 + 55) & 0x80000000) == 0)
  {
LABEL_6:
    if (*(char *)(v27 + 31) < 0) {
      operator delete(*v29);
    }
    _Unwind_Resume(exception_object);
  }
  operator delete(*v28);
  goto LABEL_6;
}

void sub_2637D74B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    JUMPOUT(0x2637D74A4);
  }
  JUMPOUT(0x2637D74A8);
}

uint64_t support::misc::safe_timer::getLogClient(support::misc::safe_timer *this)
{
  return (uint64_t)this + 56;
}

void support::misc::safe_timer::start_sync(support::misc::safe_timer *this)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = **((void **)this + 13);
  if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    if (*((unsigned char *)this + 200) != 1) {
      goto LABEL_3;
    }
LABEL_11:
    __int16 v8 = this;
    __int16 v9 = **((void **)this + 13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)((char *)v8 + 8);
      if (*((char *)v8 + 31) < 0) {
        v10 = (void *)*v10;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v10;
      _os_log_error_impl(&dword_2637D5000, v9, OS_LOG_TYPE_ERROR, "error: '%s' already active", buf, 0xCu);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v27, "'");
    v14 = (const std::string::value_type *)*((void *)v8 + 1);
    std::string::size_type v13 = (char *)v8 + 8;
    std::string::size_type v12 = v14;
    int v15 = v13[23];
    if (v15 >= 0) {
      int v16 = v13;
    }
    else {
      int v16 = v12;
    }
    if (v15 >= 0) {
      std::string::size_type v17 = v13[23];
    }
    else {
      std::string::size_type v17 = *((void *)v13 + 1);
    }
    std::string::size_type v18 = std::string::append(&v27, v16, v17);
    long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v28.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    std::string::basic_string[abi:ne180100]<0>(v25, "' already active");
    if ((v26 & 0x80u) == 0) {
      v20 = (const std::string::value_type *)v25;
    }
    else {
      v20 = (const std::string::value_type *)v25[0];
    }
    if ((v26 & 0x80u) == 0) {
      std::string::size_type v21 = v26;
    }
    else {
      std::string::size_type v21 = v25[1];
    }
    uint64_t v22 = std::string::append(&v28, v20, v21);
    long long v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
    std::string::size_type v30 = v22->__r_.__value_.__r.__words[2];
    *(_OWORD *)buf = v23;
    v22->__r_.__value_.__l.__size_ = 0;
    v22->__r_.__value_.__r.__words[2] = 0;
    v22->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x263E6A7C0](exception, buf);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  *(_WORD *)buf = 0;
  _os_log_debug_impl(&dword_2637D5000, v2, OS_LOG_TYPE_DEBUG, "starting...", buf, 2u);
  if (*((unsigned char *)this + 200) == 1) {
    goto LABEL_11;
  }
LABEL_3:
  dispatch_assert_queue_V2(*((dispatch_queue_t *)this + 23));
  v3 = *((void *)this + 24);
  dispatch_time_t v4 = dispatch_time(0, 1000000 * *((void *)this + 17));
  uint64_t v5 = *((void *)this + 18);
  if (v5) {
    uint64_t v6 = 1000000 * v5;
  }
  else {
    uint64_t v6 = -1;
  }
  dispatch_source_set_timer(v3, v4, v6, 0x1388uLL);
  __int16 v7 = *((void *)this + 24);
  if (*((unsigned char *)this + 200))
  {
    dispatch_resume(v7);
  }
  else
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = ___ZN7support4misc10safe_timer10start_syncEv_block_invoke;
    handler[3] = &__block_descriptor_tmp;
    handler[4] = this;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_activate(*((dispatch_object_t *)this + 24));
  }
  *((_WORD *)this + 100) = 1;
}

void sub_2637D7778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (*(char *)(v34 - 41) < 0)
  {
    operator delete(*(void **)(v34 - 64));
    if ((a20 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a32 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((a20 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a15);
  if ((a32 & 0x80000000) == 0)
  {
LABEL_4:
    if (a26 < 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  operator delete(a27);
  if (a26 < 0)
  {
LABEL_5:
    operator delete(__p);
    if ((v33 & 1) == 0) {
LABEL_12:
    }
      _Unwind_Resume(a1);
LABEL_11:
    __cxa_free_exception(v32);
    _Unwind_Resume(a1);
  }
LABEL_10:
  if (!v33) {
    goto LABEL_12;
  }
  goto LABEL_11;
}

uint64_t ___ZN7support4misc10safe_timer10start_syncEv_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 200) == 1)
  {
    v2 = **(NSObject ***)(v1 + 104);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_2637D5000, v2, OS_LOG_TYPE_DEFAULT, "fired", v5, 2u);
    }
    *(unsigned char *)(v1 + 201) = 1;
    if (!*(void *)(v1 + 144))
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 184));
      if (*(unsigned char *)(v1 + 200) == 1)
      {
        v3 = **(NSObject ***)(v1 + 104);
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_2637D5000, v3, OS_LOG_TYPE_DEBUG, "stopping...", buf, 2u);
        }
        dispatch_suspend(*(dispatch_object_t *)(v1 + 192));
        *(unsigned char *)(v1 + 200) = 2;
      }
    }
    uint64_t v4 = *(void *)(v1 + 176);
    if (!v4) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    return (*(uint64_t (**)(uint64_t))(*(void *)v4 + 48))(v4);
  }
  return result;
}

void support::misc::safe_timer::stop_sync(dispatch_queue_t *this)
{
  dispatch_assert_queue_V2(this[23]);
  if (*((unsigned char *)this + 200) == 1)
  {
    isa = this[13]->isa;
    if (os_log_type_enabled(isa, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v3 = 0;
      _os_log_debug_impl(&dword_2637D5000, isa, OS_LOG_TYPE_DEBUG, "stopping...", v3, 2u);
    }
    dispatch_suspend(this[24]);
    *((unsigned char *)this + 200) = 2;
  }
}

void support::misc::safe_timer::start(support::misc::safe_timer *this)
{
  v2 = *((void *)this + 23);
  if (v2 == dispatch_get_specific("CurrentQueue"))
  {
    support::misc::safe_timer::start_sync(this);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN7support4misc10safe_timer5startEv_block_invoke;
    block[3] = &__block_descriptor_tmp_8;
    block[4] = this;
    dispatch_sync(v2, block);
  }
}

void ___ZN7support4misc10safe_timer5startEv_block_invoke(uint64_t a1)
{
}

void support::misc::safe_timer::stop(support::misc::safe_timer *this)
{
  v2 = *((void *)this + 23);
  if (v2 == dispatch_get_specific("CurrentQueue"))
  {
    dispatch_assert_queue_V2(v2);
    if (*((unsigned char *)this + 200) == 1)
    {
      v3 = **((void **)this + 13);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_2637D5000, v3, OS_LOG_TYPE_DEBUG, "stopping...", buf, 2u);
      }
      dispatch_suspend(*((dispatch_object_t *)this + 24));
      *((unsigned char *)this + 200) = 2;
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN7support4misc10safe_timer4stopEv_block_invoke;
    block[3] = &__block_descriptor_tmp_9;
    block[4] = this;
    dispatch_sync(v2, block);
  }
}

void ___ZN7support4misc10safe_timer4stopEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 184));
  if (*(unsigned char *)(v1 + 200) == 1)
  {
    v2 = **(NSObject ***)(v1 + 104);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v3 = 0;
      _os_log_debug_impl(&dword_2637D5000, v2, OS_LOG_TYPE_DEBUG, "stopping...", v3, 2u);
    }
    dispatch_suspend(*(dispatch_object_t *)(v1 + 192));
    *(unsigned char *)(v1 + 200) = 2;
  }
}

void support::misc::safe_timer::restart(support::misc::safe_timer *this)
{
  v2 = *((void *)this + 23);
  if (v2 == dispatch_get_specific("CurrentQueue"))
  {
    dispatch_assert_queue_V2(v2);
    if (*((unsigned char *)this + 200) == 1)
    {
      v3 = **((void **)this + 13);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_2637D5000, v3, OS_LOG_TYPE_DEBUG, "stopping...", buf, 2u);
      }
      dispatch_suspend(*((dispatch_object_t *)this + 24));
      *((unsigned char *)this + 200) = 2;
    }
    uint64_t v4 = *((void *)this + 23);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN7support4misc10safe_timer7restartEv_block_invoke;
    block[3] = &__block_descriptor_tmp_10;
    block[4] = this;
    dispatch_async(v4, block);
  }
  else
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = ___ZN7support4misc10safe_timer7restartEv_block_invoke_2;
    v5[3] = &__block_descriptor_tmp_11;
    v5[4] = this;
    dispatch_sync(v2, v5);
  }
}

void ___ZN7support4misc10safe_timer7restartEv_block_invoke(uint64_t a1)
{
}

void ___ZN7support4misc10safe_timer7restartEv_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 184));
  if (*(unsigned char *)(v1 + 200) == 1)
  {
    v2 = **(NSObject ***)(v1 + 104);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v3 = 0;
      _os_log_debug_impl(&dword_2637D5000, v2, OS_LOG_TYPE_DEBUG, "stopping...", v3, 2u);
    }
    dispatch_suspend(*(dispatch_object_t *)(v1 + 192));
    *(unsigned char *)(v1 + 200) = 2;
  }
  support::misc::safe_timer::start_sync((support::misc::safe_timer *)v1);
}

uint64_t support::misc::safe_timer::has_fired(support::misc::safe_timer *this)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  char v8 = 0;
  uint64_t v1 = *((void *)this + 23);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1107296256;
  v4[2] = ___ZNK7support4misc10safe_timer9has_firedEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_12_0;
  v4[4] = &v5;
  v4[5] = this;
  dispatch_sync(v1, v4);
  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t ___ZNK7support4misc10safe_timer9has_firedEv_block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(*(void *)(result + 40) + 201);
  return result;
}

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
}

void support::misc::safe_timer::~safe_timer(support::misc::safe_timer *this)
{
  *(void *)this = &unk_270EAEC10;
  uint64_t v8 = 0;
  __int16 v9 = &v8;
  uint64_t v10 = 0x2000000000;
  char v11 = 0;
  if (*((void *)this + 23))
  {
    support::misc::safe_timer::stop(this);
    uint64_t v2 = *((void *)this + 23);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 1107296256;
    v7[2] = ___ZN7support4misc10safe_timerD2Ev_block_invoke;
    v7[3] = &__block_descriptor_tmp_15;
    v7[4] = &v8;
    v7[5] = this;
    dispatch_sync(v2, v7);
  }
  v3 = *((void *)this + 24);
  if (v3)
  {
    if (*((unsigned char *)v9 + 24))
    {
      dispatch_source_cancel(v3);
      if (*((unsigned char *)v9 + 24) == 2) {
        dispatch_resume(*((dispatch_object_t *)this + 24));
      }
    }
    else
    {
      dispatch_activate(v3);
      dispatch_source_cancel(*((dispatch_source_t *)this + 24));
    }
    dispatch_release(*((dispatch_object_t *)this + 24));
  }
  uint64_t v4 = *((void *)this + 23);
  if (v4) {
    dispatch_release(v4);
  }
  _Block_object_dispose(&v8, 8);
  uint64_t v5 = (support::misc::safe_timer *)*((void *)this + 22);
  if (v5 == (support::misc::safe_timer *)((char *)this + 152))
  {
    (*(void (**)(char *))(*((void *)this + 19) + 32))((char *)this + 152);
    *((void *)this + 7) = &unk_270EAECE0;
    uint64_t v6 = (std::__shared_weak_count *)*((void *)this + 15);
    if (!v6) {
      goto LABEL_18;
    }
  }
  else
  {
    if (v5) {
      (*(void (**)(support::misc::safe_timer *))(*(void *)v5 + 40))(v5);
    }
    *((void *)this + 7) = &unk_270EAECE0;
    uint64_t v6 = (std::__shared_weak_count *)*((void *)this + 15);
    if (!v6)
    {
LABEL_18:
      if ((*((char *)this + 55) & 0x80000000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_22;
    }
  }
  if (atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_18;
  }
  ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
  std::__shared_weak_count::__release_weak(v6);
  if ((*((char *)this + 55) & 0x80000000) == 0)
  {
LABEL_19:
    if ((*((char *)this + 31) & 0x80000000) == 0) {
      return;
    }
LABEL_23:
    operator delete(*((void **)this + 1));
    return;
  }
LABEL_22:
  operator delete(*((void **)this + 4));
  if (*((char *)this + 31) < 0) {
    goto LABEL_23;
  }
}

{
  void *v1;
  uint64_t vars8;

  support::misc::safe_timer::~safe_timer(this);

  operator delete(v1);
}

void __clang_call_terminate(void *a1)
{
}

uint64_t ___ZN7support4misc10safe_timerD2Ev_block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(*(void *)(result + 40) + 200);
  return result;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2655D5A08, MEMORY[0x263F8C060]);
}

void sub_2637D8288(_Unwind_Exception *a1)
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

void support::log::client::~client(std::__shared_weak_count **this)
{
  uint64_t v1 = (support::log::client *)this;
  *this = (std::__shared_weak_count *)&unk_270EAECE0;
  uint64_t v2 = this[8];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    this = (std::__shared_weak_count **)v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  operator delete(this);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
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
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

uint64_t ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>::~PthreadMutexGuardPolicy(uint64_t a1)
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
  v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v3 || atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return a1;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  operator delete(v1);
}

uint64_t __cxx_global_var_init()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>::~PthreadMutexGuardPolicy, &ctu::Singleton<support::log::shared_stdio,support::log::shared_stdio,ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>>::sInstance, &dword_2637D5000);
  }
  return result;
}

uint64_t support::transport::ARI::getLogClient(support::transport::ARI *this)
{
  return (uint64_t)this + 32;
}

BOOL support::transport::ARI::initRT(support::transport::ARI *this, char *__s, dispatch_queue_s *a3)
{
  strcpy((char *)&v52, "com.apple.ARITransport");
  *((unsigned char *)&v52.__r_.__value_.__s + 23) = 22;
  if (!__s || !*__s)
  {
    long long v25 = (support::log::manager *)*((void *)this + 13);
    LOBYTE(rep) = 1;
    unsigned __int8 v26 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v25 + 16))(v25, 1, **((void **)this + 10));
    if (v26)
    {
      if (*((void *)v25 + 17))
      {
        support::log::buffer::borrow(v26);
        int v27 = 2;
      }
      else
      {
        int v27 = 0;
      }
      if (v27 | os_log_type_enabled(**((os_log_t **)this + 10), OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p[0]) = 0;
        uint64_t v40 = _os_log_send_and_compose_impl();
        if (v40)
        {
          v41 = (char *)v40;
          __dst.__r_.__value_.__l.__data_ = (std::string::pointer)std::chrono::system_clock::now().__d_.__rep_;
          __p[0] = &unk_270EAED78;
          __p[1] = (char *)this + 40;
          v50 = (char *)&rep;
          p_dst = &__dst;
          support::log::manager::message_delegates(v25, (const support::log::details *)__p, v41);
        }
      }
    }
    goto LABEL_75;
  }
  size_t v6 = strlen(__s);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  std::string::size_type v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    uint64_t v8 = (std::string *)operator new(v9 + 1);
    __dst.__r_.__value_.__l.__size_ = v7;
    __dst.__r_.__value_.__r.__words[2] = v10 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    goto LABEL_10;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v6;
  uint64_t v8 = &__dst;
  if (v6) {
LABEL_10:
  }
    memcpy(v8, __s, v7);
  v8->__r_.__value_.__s.__data_[v7] = 0;
  char v11 = std::string::insert(&__dst, 0, ".", 1uLL);
  long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  v50 = (char *)v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v50) >= 0) {
    std::string::size_type v13 = __p;
  }
  else {
    std::string::size_type v13 = (void **)__p[0];
  }
  if (SHIBYTE(v50) >= 0) {
    std::string::size_type v14 = HIBYTE(v50);
  }
  else {
    std::string::size_type v14 = (std::string::size_type)__p[1];
  }
  std::string::append(&v52, (const std::string::value_type *)v13, v14);
  if (SHIBYTE(v50) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_19;
    }
  }
  else if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_19;
  }
  operator delete(__dst.__r_.__value_.__l.__data_);
LABEL_19:
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v15 = &v52;
  }
  else {
    int v15 = (std::string *)v52.__r_.__value_.__r.__words[0];
  }
  int v16 = (AriHost *)dispatch_queue_create((const char *)v15, 0);
  std::string::size_type v17 = *((void *)this + 1);
  *((void *)this + 1) = v16;
  if (v17)
  {
    dispatch_release(v17);
    int v16 = (AriHost *)*((void *)this + 1);
  }
  if (!v16)
  {
    std::string v28 = (support::log::manager *)*((void *)this + 13);
    LOBYTE(rep) = 1;
    long long v29 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v28 + 16))(v28, 1, **((void **)this + 10));
    if (v29)
    {
      if (*((void *)v28 + 17))
      {
        support::log::buffer::borrow(v29);
        int v30 = 2;
      }
      else
      {
        int v30 = 0;
      }
      if (v30 | os_log_type_enabled(**((os_log_t **)this + 10), OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p[0]) = 0;
        uint64_t v42 = _os_log_send_and_compose_impl();
        if (v42) {
          goto LABEL_74;
        }
      }
    }
    goto LABEL_75;
  }
  if (AriHost::Init(v16))
  {
    std::string v28 = (support::log::manager *)*((void *)this + 13);
    LOBYTE(rep) = 1;
    uint64_t v31 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v28 + 16))(v28, 1, **((void **)this + 10));
    if (v31)
    {
      if (*((void *)v28 + 17))
      {
        support::log::buffer::borrow(v31);
        int v32 = 2;
      }
      else
      {
        int v32 = 0;
      }
      if (v32 | os_log_type_enabled(**((os_log_t **)this + 10), OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p[0]) = 0;
        uint64_t v42 = _os_log_send_and_compose_impl();
        if (v42) {
          goto LABEL_74;
        }
      }
    }
    goto LABEL_75;
  }
  if (AriHost::RegisterClient((AriHost *)__s, (const char *)this + 16, *((int **)this + 1), a3))
  {
    std::string v28 = (support::log::manager *)*((void *)this + 13);
    LOBYTE(rep) = 1;
    int v33 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v28 + 16))(v28, 1, **((void **)this + 10));
    if (v33)
    {
      if (*((void *)v28 + 17))
      {
        support::log::buffer::borrow(v33);
        int v34 = 2;
      }
      else
      {
        int v34 = 0;
      }
      if (v34 | os_log_type_enabled(**((os_log_t **)this + 10), OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p[0]) = 0;
        uint64_t v42 = _os_log_send_and_compose_impl();
        if (v42)
        {
LABEL_74:
          v43 = (char *)v42;
          __dst.__r_.__value_.__l.__data_ = (std::string::pointer)std::chrono::system_clock::now().__d_.__rep_;
          __p[0] = &unk_270EAED78;
          __p[1] = (char *)this + 40;
          v50 = (char *)&rep;
          p_dst = &__dst;
          support::log::manager::message_delegates(v28, (const support::log::details *)__p, v43);
        }
      }
    }
LABEL_75:
    BOOL v23 = 0;
    if ((SHIBYTE(v52.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return v23;
    }
    goto LABEL_39;
  }
  std::string::size_type v18 = operator new(0x20uLL);
  *std::string::size_type v18 = 0u;
  v18[1] = 0u;
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v18;
  if (KTLInitOptions())
  {
    if (KTLOpenChannel())
    {
      __dst.__r_.__value_.__r.__words[0] = 0;
      long long v19 = (void *)*((void *)this + 3);
      *((void *)this + 3) = v18;
      if (!v19)
      {
        BOOL v23 = 1;
        if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
          goto LABEL_39;
        }
        return v23;
      }
      if (v19[1])
      {
        TelephonyUtilTransportFree();
        int v20 = 0;
        int v21 = 0;
        uint64_t v22 = (void *)v19[1];
        if (!v22) {
          goto LABEL_38;
        }
        goto LABEL_32;
      }
      int v21 = 0;
      goto LABEL_38;
    }
    v35 = (support::log::manager *)*((void *)this + 13);
    char v47 = 1;
    v38 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v35 + 16))(v35, 1, **((void **)this + 10));
    if (v38)
    {
      if (*((void *)v35 + 17))
      {
        support::log::buffer::borrow(v38);
        int v39 = 2;
      }
      else
      {
        int v39 = 0;
      }
      if (v39 | os_log_type_enabled(**((os_log_t **)this + 10), OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p[0]) = 0;
        uint64_t v44 = _os_log_send_and_compose_impl();
        if (v44) {
          goto LABEL_84;
        }
      }
    }
  }
  else
  {
    v35 = (support::log::manager *)*((void *)this + 13);
    char v47 = 1;
    v36 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v35 + 16))(v35, 1, **((void **)this + 10));
    if (v36)
    {
      if (*((void *)v35 + 17))
      {
        support::log::buffer::borrow(v36);
        int v37 = 2;
      }
      else
      {
        int v37 = 0;
      }
      if (v37 | os_log_type_enabled(**((os_log_t **)this + 10), OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p[0]) = 0;
        uint64_t v44 = _os_log_send_and_compose_impl();
        if (v44)
        {
LABEL_84:
          v45 = (char *)v44;
          std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = std::chrono::system_clock::now().__d_.__rep_;
          __p[0] = &unk_270EAED78;
          __p[1] = (char *)this + 40;
          v50 = &v47;
          p_dst = (std::string *)&rep;
          support::log::manager::message_delegates(v35, (const support::log::details *)__p, v45);
        }
      }
    }
  }
  __dst.__r_.__value_.__r.__words[0] = 0;
  if (*((void *)v18 + 1))
  {
    TelephonyUtilTransportFree();
    uint64_t v22 = (void *)*((void *)v18 + 1);
    int v20 = 8;
    long long v19 = v18;
    int v21 = 8;
    if (v22)
    {
LABEL_32:
      operator delete(v22);
      int v21 = v20;
    }
  }
  else
  {
    int v21 = 8;
    long long v19 = v18;
  }
LABEL_38:
  operator delete(v19);
  BOOL v23 = v21 == 0;
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
LABEL_39:
  }
    operator delete(v52.__r_.__value_.__l.__data_);
  return v23;
}

void sub_2637D8F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a32 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

void **std::unique_ptr<KTLOptions,support::transport::ARI::KTLOptionsDestructor>::~unique_ptr[abi:ne180100](void **a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (v2[1])
    {
      TelephonyUtilTransportFree();
      v3 = (void *)v2[1];
      if (v3) {
        operator delete(v3);
      }
    }
    operator delete(v2);
  }
  return a1;
}

uint64_t support::transport::ARI::initLibTU(support::transport::ARI *this, const char *__s, int a3)
{
  strcpy((char *)&v60, "com.apple.ARITransport");
  *((unsigned char *)&v60.__r_.__value_.__s + 23) = 22;
  uint64_t v59 = 0;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v54 = 0u;
  if (!__s || !*__s)
  {
    v24 = (support::log::manager *)*((void *)this + 13);
    LOBYTE(rep) = 1;
    long long v25 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v24 + 16))(v24, 1, **((void **)this + 10));
    if (v25)
    {
      if (*((void *)v24 + 17))
      {
        support::log::buffer::borrow(v25);
        int v26 = 2;
      }
      else
      {
        int v26 = 0;
      }
      if (v26 | os_log_type_enabled(**((os_log_t **)this + 10), OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p[0]) = 0;
        uint64_t v38 = _os_log_send_and_compose_impl();
        if (v38)
        {
          int v39 = (char *)v38;
          __dst.__r_.__value_.__l.__data_ = (std::string::pointer)std::chrono::system_clock::now().__d_.__rep_;
          __p[0] = &unk_270EAED78;
          __p[1] = (char *)this + 40;
          std::string v52 = (char *)&rep;
          p_dst = &__dst;
          support::log::manager::message_delegates(v24, (const support::log::details *)__p, v39);
        }
      }
    }
LABEL_78:
    uint64_t v22 = 0;
    if ((SHIBYTE(v60.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return v22;
    }
    goto LABEL_37;
  }
  size_t v6 = strlen(__s);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  std::string::size_type v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    uint64_t v8 = (std::string *)operator new(v9 + 1);
    __dst.__r_.__value_.__l.__size_ = v7;
    __dst.__r_.__value_.__r.__words[2] = v10 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    goto LABEL_10;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v6;
  uint64_t v8 = &__dst;
  if (v6) {
LABEL_10:
  }
    memcpy(v8, __s, v7);
  v8->__r_.__value_.__s.__data_[v7] = 0;
  char v11 = std::string::insert(&__dst, 0, ".", 1uLL);
  long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  std::string v52 = (char *)v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v52) >= 0) {
    std::string::size_type v13 = __p;
  }
  else {
    std::string::size_type v13 = (void **)__p[0];
  }
  if (SHIBYTE(v52) >= 0) {
    std::string::size_type v14 = HIBYTE(v52);
  }
  else {
    std::string::size_type v14 = (std::string::size_type)__p[1];
  }
  std::string::append(&v60, (const std::string::value_type *)v13, v14);
  if (SHIBYTE(v52) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_19;
    }
  }
  else if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_19;
  }
  operator delete(__dst.__r_.__value_.__l.__data_);
LABEL_19:
  if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v15 = &v60;
  }
  else {
    int v15 = (std::string *)v60.__r_.__value_.__r.__words[0];
  }
  dispatch_queue_t v16 = dispatch_queue_create((const char *)v15, 0);
  std::string::size_type v17 = *((void *)this + 1);
  *((void *)this + 1) = v16;
  if (v17)
  {
    dispatch_release(v17);
    dispatch_queue_t v16 = (dispatch_queue_t)*((void *)this + 1);
  }
  if (!v16)
  {
    int v27 = (support::log::manager *)*((void *)this + 13);
    LOBYTE(rep) = 1;
    std::string v28 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v27 + 16))(v27, 1, **((void **)this + 10));
    if (v28)
    {
      if (*((void *)v27 + 17))
      {
        support::log::buffer::borrow(v28);
        int v29 = 2;
      }
      else
      {
        int v29 = 0;
      }
      if (v29 | os_log_type_enabled(**((os_log_t **)this + 10), OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p[0]) = 0;
        uint64_t v40 = _os_log_send_and_compose_impl();
        if (v40)
        {
          v41 = (char *)v40;
          __dst.__r_.__value_.__l.__data_ = (std::string::pointer)std::chrono::system_clock::now().__d_.__rep_;
          __p[0] = &unk_270EAED78;
          __p[1] = (char *)this + 40;
          std::string v52 = (char *)&rep;
          p_dst = &__dst;
          support::log::manager::message_delegates(v27, (const support::log::details *)__p, v41);
        }
      }
    }
    goto LABEL_78;
  }
  TelephonyBasebandPCITransportInitParameters();
  uint64_t v18 = *((void *)this + 1);
  DWORD2(v55) = a3;
  LODWORD(v56) = v56 | 1;
  LODWORD(v54) = 8;
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 0x40000000;
  v49[2] = ___ZN7support9transport3ARI9initLibTUEPKcjj_block_invoke;
  v49[3] = &__block_descriptor_tmp_0;
  v49[4] = this;
  __dst.__r_.__value_.__r.__words[0] = 0;
  *((void *)&v54 + 1) = v18;
  *(void *)&long long v55 = v49;
  operator new(0x58uLL);
  if ((TelephonyBasebandPCITransportCreate() & 1) == 0)
  {
    int v30 = (support::log::manager *)*((void *)this + 13);
    char v48 = 1;
    uint64_t v31 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v30 + 16))(v30, 1, **((void **)this + 10));
    if (v31)
    {
      if (*((void *)v30 + 17))
      {
        support::log::buffer::borrow(v31);
        int v32 = 2;
      }
      else
      {
        int v32 = 0;
      }
      if (v32 | os_log_type_enabled(**((os_log_t **)this + 10), OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p[0]) = 0;
        uint64_t v42 = _os_log_send_and_compose_impl();
        if (v42)
        {
          v43 = (char *)v42;
          std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = std::chrono::system_clock::now().__d_.__rep_;
          __p[0] = &unk_270EAED78;
          __p[1] = (char *)this + 40;
          std::string v52 = &v48;
          p_dst = (std::string *)&rep;
          support::log::manager::message_delegates(v30, (const support::log::details *)__p, v43);
        }
      }
    }
    goto LABEL_78;
  }
  long long v19 = operator new(0x20uLL);
  *long long v19 = 0u;
  v19[1] = 0u;
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v19;
  if ((KTLInitOptions() & 1) == 0)
  {
    int v33 = (support::log::manager *)*((void *)this + 13);
    char v48 = 1;
    int v34 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v33 + 16))(v33, 1, **((void **)this + 10));
    if (!v34) {
      goto LABEL_74;
    }
    if (*((void *)v33 + 17))
    {
      support::log::buffer::borrow(v34);
      int v35 = 2;
    }
    else
    {
      int v35 = 0;
    }
    if (!(v35 | os_log_type_enabled(**((os_log_t **)this + 10), OS_LOG_TYPE_ERROR))) {
      goto LABEL_74;
    }
    LOWORD(__p[0]) = 0;
    uint64_t v44 = _os_log_send_and_compose_impl();
    if (!v44) {
      goto LABEL_74;
    }
LABEL_73:
    v45 = (char *)v44;
    std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = std::chrono::system_clock::now().__d_.__rep_;
    __p[0] = &unk_270EAED78;
    __p[1] = (char *)this + 40;
    std::string v52 = &v48;
    p_dst = (std::string *)&rep;
    support::log::manager::message_delegates(v33, (const support::log::details *)__p, v45);
LABEL_74:
    __dst.__r_.__value_.__r.__words[0] = 0;
    if (*((void *)v19 + 1))
    {
      TelephonyUtilTransportFree();
      v46 = (void *)*((void *)v19 + 1);
      if (v46) {
        operator delete(v46);
      }
    }
    operator delete(v19);
    goto LABEL_78;
  }
  if ((KTLOpenChannel() & 1) == 0)
  {
    int v33 = (support::log::manager *)*((void *)this + 13);
    char v48 = 1;
    v36 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v33 + 16))(v33, 1, **((void **)this + 10));
    if (!v36) {
      goto LABEL_74;
    }
    if (*((void *)v33 + 17))
    {
      support::log::buffer::borrow(v36);
      int v37 = 2;
    }
    else
    {
      int v37 = 0;
    }
    if (!(v37 | os_log_type_enabled(**((os_log_t **)this + 10), OS_LOG_TYPE_ERROR))) {
      goto LABEL_74;
    }
    LOWORD(__p[0]) = 0;
    uint64_t v44 = _os_log_send_and_compose_impl();
    if (!v44) {
      goto LABEL_74;
    }
    goto LABEL_73;
  }
  __dst.__r_.__value_.__r.__words[0] = 0;
  int v20 = (void *)*((void *)this + 3);
  *((void *)this + 3) = v19;
  if (v20)
  {
    if (v20[1])
    {
      TelephonyUtilTransportFree();
      int v21 = (void *)v20[1];
      if (v21) {
        operator delete(v21);
      }
    }
    operator delete(v20);
    uint64_t v22 = 1;
    if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_37;
    }
  }
  else
  {
    uint64_t v22 = 1;
    if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0) {
LABEL_37:
    }
      operator delete(v60.__r_.__value_.__l.__data_);
  }
  return v22;
}

void sub_2637D98B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  std::unique_ptr<KTLOptions,support::transport::ARI::KTLOptionsDestructor>::~unique_ptr[abi:ne180100]((void **)&a18);
  if (*(char *)(v29 - 73) < 0)
  {
    operator delete(*(void **)(v29 - 96));
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

void ___ZN7support9transport3ARI9initLibTUEPKcjj_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2 == 1)
  {
    std::string::size_type v7 = *(void **)(v2 + 104);
    char v25 = 1;
    uint64_t v8 = (support::log::buffer *)(*(uint64_t (**)(void *, uint64_t, void))(*v7 + 16))(v7, a2, **(void **)(v2 + 80));
    if (v8)
    {
      if (v7[17])
      {
        int v9 = 2;
        support::log::buffer::borrow(v8);
      }
      else
      {
        int v9 = 0;
      }
      if (v9 | os_log_type_enabled(**(os_log_t **)(v2 + 80), OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        uint64_t v18 = _os_log_send_and_compose_impl();
        if (v18)
        {
          std::string::size_type v14 = (char *)v18;
          v15.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
          std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v15.__d_.__rep_;
          int v26 = &unk_270EAED78;
          uint64_t v27 = v2 + 40;
          std::string v28 = &v25;
          p_std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = &rep;
          long long v19 = v7 + 15;
          for (uint64_t i = v7[16]; (void *)i != v19; uint64_t i = *(void *)(i + 8))
            v15.__d_.__rep_ = (***(uint64_t (****)(void, void **, char *))(i + 16))(*(void *)(i + 16), &v26, v14);
          goto LABEL_29;
        }
      }
    }
  }
  else
  {
    int v3 = a2;
    if (a2)
    {
      uint64_t v10 = *(void **)(v2 + 104);
      char v25 = 1;
      char v11 = (support::log::buffer *)(*(uint64_t (**)(void *, uint64_t, void))(*v10 + 16))(v10, 1, **(void **)(v2 + 80));
      if (v11)
      {
        if (v10[17])
        {
          int v12 = 2;
          support::log::buffer::borrow(v11);
        }
        else
        {
          int v12 = 0;
        }
        if (v12 | os_log_type_enabled(**(os_log_t **)(v2 + 80), OS_LOG_TYPE_ERROR))
        {
          LODWORD(v26) = 67109120;
          HIDWORD(v26) = v3;
          uint64_t v21 = _os_log_send_and_compose_impl();
          if (v21)
          {
            std::string::size_type v14 = (char *)v21;
            v15.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
            std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v15.__d_.__rep_;
            int v26 = &unk_270EAED78;
            uint64_t v27 = v2 + 40;
            std::string v28 = &v25;
            p_std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = &rep;
            uint64_t v22 = v10 + 15;
            for (uint64_t j = v10[16]; (void *)j != v22; uint64_t j = *(void *)(j + 8))
              v15.__d_.__rep_ = (***(uint64_t (****)(void, void **, char *))(j + 16))(*(void *)(j + 16), &v26, v14);
            goto LABEL_29;
          }
        }
      }
    }
    else
    {
      uint64_t v4 = *(void **)(v2 + 104);
      char v25 = 1;
      uint64_t v5 = (support::log::buffer *)(*(uint64_t (**)(void *, uint64_t, void))(*v4 + 16))(v4, 1, **(void **)(v2 + 80));
      if (v5)
      {
        if (v4[17])
        {
          int v6 = 2;
          support::log::buffer::borrow(v5);
        }
        else
        {
          int v6 = 0;
        }
        if (v6 | os_log_type_enabled(**(os_log_t **)(v2 + 80), OS_LOG_TYPE_ERROR))
        {
          LOWORD(v26) = 0;
          uint64_t v13 = _os_log_send_and_compose_impl();
          if (v13)
          {
            std::string::size_type v14 = (char *)v13;
            v15.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
            std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v15.__d_.__rep_;
            int v26 = &unk_270EAED78;
            uint64_t v27 = v2 + 40;
            std::string v28 = &v25;
            p_std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = &rep;
            dispatch_queue_t v16 = v4 + 15;
            for (uint64_t k = v4[16]; (void *)k != v16; uint64_t k = *(void *)(k + 8))
              v15.__d_.__rep_ = (***(uint64_t (****)(void, void **, char *))(k + 16))(*(void *)(k + 16), &v26, v14);
LABEL_29:
            support::log::manager::release_log_buffer((support::log::manager *)v15.__d_.__rep_, v14);
          }
        }
      }
    }
  }
}

uint64_t support::transport::ARI::getKTLOptions(support::transport::ARI *this)
{
  return *((void *)this + 3);
}

uint64_t support::transport::ARI::getLibTUTransport(support::transport::ARI *this)
{
  return *(void *)(*((void *)this + 3) + 8);
}

void support::transport::ARI::create(support::transport::ARI *this@<X0>, dispatch_queue_s *a2@<X1>, char a3@<W3>, const support::log::manager *a4@<X4>, support::transport::ARI **a5@<X8>)
{
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v38 = v11;
  long long v39 = v11;
  v37[1] = v11;
  v37[2] = v11;
  v37[0] = v11;
  int v35 = operator new(0x30uLL);
  long long v36 = xmmword_263807900;
  strcpy((char *)v35, "com.apple.telephony.basebandservices.support");
  char v34 = 10;
  strcpy((char *)__p, "ari.create");
  support::log::client::client(v37, (uint64_t)&v35, (uint64_t)__p, (uint64_t)a4);
  if (v34 < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v36) & 0x80000000) == 0) {
      goto LABEL_3;
    }
LABEL_10:
    operator delete(v35);
    goto LABEL_3;
  }
  if (SHIBYTE(v36) < 0) {
    goto LABEL_10;
  }
LABEL_3:
  *a5 = (support::transport::ARI *)0xAAAAAAAAAAAAAAAALL;
  int v12 = (support::transport::ARI *)operator new(0x70uLL);
  support::transport::ARI::ARI(v12, a4);
  *a5 = v12;
  uint64_t v13 = getprogname();
  if (!strncmp(v13, "CommCenter", 0xAuLL)) {
    goto LABEL_13;
  }
  std::string::size_type v14 = getprogname();
  if (!strncmp(v14, "CommCenter-asan", 0xFuLL)) {
    goto LABEL_13;
  }
  std::chrono::system_clock::time_point v15 = getprogname();
  if (!strncmp(v15, "basebandd", 9uLL)) {
    goto LABEL_13;
  }
  HIBYTE(v28) = 10;
  strcpy((char *)v27, "CommCenter");
  if ((ctu::isProcessRunning() & 1) == 0)
  {
    char v32 = 9;
    strcpy((char *)v31, "basebandd");
    int isProcessRunning = ctu::isProcessRunning();
    if (SHIBYTE(v28) < 0) {
      goto LABEL_19;
    }
    goto LABEL_12;
  }
  int isProcessRunning = 1;
  if ((SHIBYTE(v28) & 0x80000000) == 0)
  {
LABEL_12:
    if (!isProcessRunning) {
      goto LABEL_20;
    }
LABEL_13:
    if (a3)
    {
      if (support::transport::ARI::initRT(v12, (char *)this, a2)) {
        goto LABEL_15;
      }
      char v30 = 1;
      uint64_t v18 = (support::log::manager *)*((void *)&v39 + 1);
      BOOL v23 = (support::log::buffer *)(*(uint64_t (**)(void, uint64_t, void))(**((void **)&v39 + 1) + 16))(*((void *)&v39 + 1), 1, *(void *)v38);
      if (!v23) {
        goto LABEL_38;
      }
      if (*((void *)v18 + 17))
      {
        support::log::buffer::borrow(v23);
        int v24 = 2;
      }
      else
      {
        int v24 = 0;
      }
      if (!(v24 | os_log_type_enabled(*(os_log_t *)v38, OS_LOG_TYPE_ERROR))) {
        goto LABEL_38;
      }
      LOWORD(v27[0]) = 0;
      uint64_t v25 = _os_log_send_and_compose_impl();
      if (!v25) {
        goto LABEL_38;
      }
    }
    else
    {
      char v30 = 1;
      uint64_t v18 = (support::log::manager *)*((void *)&v39 + 1);
      uint64_t v21 = (support::log::buffer *)(*(uint64_t (**)(void, uint64_t, void))(**((void **)&v39 + 1) + 16))(*((void *)&v39 + 1), 1, *(void *)v38);
      if (!v21) {
        goto LABEL_38;
      }
      if (*((void *)v18 + 17))
      {
        support::log::buffer::borrow(v21);
        int v22 = 2;
      }
      else
      {
        int v22 = 0;
      }
      if (!(v22 | os_log_type_enabled(*(os_log_t *)v38, OS_LOG_TYPE_ERROR))) {
        goto LABEL_38;
      }
      LOWORD(v27[0]) = 0;
      uint64_t v25 = _os_log_send_and_compose_impl();
      if (!v25) {
        goto LABEL_38;
      }
    }
    goto LABEL_37;
  }
LABEL_19:
  operator delete(v27[0]);
  if (isProcessRunning) {
    goto LABEL_13;
  }
LABEL_20:
  if (support::transport::ARI::initLibTU(v12, (const char *)this, (int)a2)) {
    goto LABEL_15;
  }
  char v30 = 1;
  uint64_t v18 = (support::log::manager *)*((void *)&v39 + 1);
  long long v19 = (support::log::buffer *)(*(uint64_t (**)(void, uint64_t, void))(**((void **)&v39 + 1) + 16))(*((void *)&v39 + 1), 1, *(void *)v38);
  if (v19)
  {
    if (*((void *)v18 + 17))
    {
      support::log::buffer::borrow(v19);
      int v20 = 2;
    }
    else
    {
      int v20 = 0;
    }
    if (v20 | os_log_type_enabled(*(os_log_t *)v38, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27[0]) = 0;
      uint64_t v25 = _os_log_send_and_compose_impl();
      if (v25)
      {
LABEL_37:
        int v26 = (char *)v25;
        v31[0] = std::chrono::system_clock::now().__d_.__rep_;
        v27[0] = &unk_270EAED78;
        v27[1] = (char *)v37 + 8;
        std::string v28 = &v30;
        uint64_t v29 = v31;
        support::log::manager::message_delegates(v18, (const support::log::details *)v27, v26);
      }
    }
  }
LABEL_38:
  *a5 = 0;
  (*(void (**)(support::transport::ARI *))(*(void *)v12 + 8))(v12);
LABEL_15:
  *(void *)&v37[0] = &unk_270EAECE0;
  std::string::size_type v17 = (std::__shared_weak_count *)v39;
  if ((void)v39)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(v39 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
}

void sub_2637DA438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,char a37)
{
  *int v37 = 0;
  (*(void (**)(uint64_t))(*(void *)v38 + 8))(v38);
  support::log::client::~client((support::log::client *)&a37);
  _Unwind_Resume(a1);
}

void support::transport::ARI::create(support::transport::ARI *this@<X0>, dispatch_queue_s *a2@<X1>, const support::log::manager *a3@<X3>, support::transport::ARI **a4@<X8>)
{
}

void support::transport::ARI::create(support::transport::ARI *this@<X0>, const char *a2@<X1>, const support::log::manager *a3@<X2>, support::transport::ARI **a4@<X8>)
{
}

support::transport::ARI *support::transport::ARI::ARI(support::transport::ARI *this, const support::log::manager *a2)
{
  *(void *)this = &unk_270EAED10;
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 4) = 0;
  *((void *)this + 3) = 0;
  std::string::size_type v7 = operator new(0x30uLL);
  long long v8 = xmmword_263807900;
  strcpy((char *)v7, "com.apple.telephony.basebandservices.support");
  char v6 = 3;
  LODWORD(__p) = 6910561;
  support::log::client::client((void *)this + 4, (uint64_t)&v7, (uint64_t)&__p, (uint64_t)a2);
  if (v6 < 0)
  {
    operator delete(__p);
    if ((SHIBYTE(v8) & 0x80000000) == 0) {
      return this;
    }
  }
  else if ((SHIBYTE(v8) & 0x80000000) == 0)
  {
    return this;
  }
  operator delete(v7);
  return this;
}

void sub_2637DA634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((a20 & 0x80000000) == 0)
    {
LABEL_3:
      std::unique_ptr<KTLOptions,support::transport::ARI::KTLOptionsDestructor>::~unique_ptr[abi:ne180100](v21);
      BOOL v23 = *(NSObject **)(v20 + 8);
      if (!v23) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else if ((a20 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a15);
  std::unique_ptr<KTLOptions,support::transport::ARI::KTLOptionsDestructor>::~unique_ptr[abi:ne180100](v21);
  BOOL v23 = *(NSObject **)(v20 + 8);
  if (!v23) {
LABEL_4:
  }
    _Unwind_Resume(a1);
LABEL_7:
  dispatch_release(v23);
  _Unwind_Resume(a1);
}

void support::transport::ARI::~ARI(support::transport::ARI *this)
{
  *(void *)this = &unk_270EAED10;
  if (*((void *)this + 3)) {
    KTLCloseChannel();
  }
  uint64_t v2 = (AriHost *)*((unsigned int *)this + 4);
  if (v2) {
    AriHost::DeregisterClient(v2);
  }
  *((void *)this + 4) = &unk_270EAECE0;
  int v3 = (std::__shared_weak_count *)*((void *)this + 12);
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    uint64_t v4 = (void *)*((void *)this + 3);
    *((void *)this + 3) = 0;
    if (!v4) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v4 = (void *)*((void *)this + 3);
    *((void *)this + 3) = 0;
    if (!v4) {
      goto LABEL_12;
    }
  }
  if (v4[1])
  {
    TelephonyUtilTransportFree();
    uint64_t v5 = (void *)v4[1];
    if (v5) {
      operator delete(v5);
    }
  }
  operator delete(v4);
LABEL_12:
  char v6 = *((void *)this + 1);
  if (v6) {
    dispatch_release(v6);
  }
}

{
  void *v1;
  uint64_t vars8;

  support::transport::ARI::~ARI(this);

  operator delete(v1);
}

support::transport::ARI *support::transport::AriRT::AriRT(support::transport::AriRT *this, const support::log::manager *a2)
{
  uint64_t result = support::transport::ARI::ARI(this, a2);
  *(void *)uint64_t result = &unk_270EAED30;
  return result;
}

{
  support::transport::ARI *result;

  uint64_t result = support::transport::ARI::ARI(this, a2);
  *(void *)uint64_t result = &unk_270EAED30;
  return result;
}

void support::transport::AriRT::create(support::transport::AriRT *this@<X0>, dispatch_queue_s *a2@<X1>, const support::log::manager *a3@<X3>, support::transport::ARI **a4@<X8>)
{
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v25 = v9;
  long long v26 = v9;
  v24[2] = v9;
  v24[0] = v9;
  v24[1] = v9;
  int v22 = operator new(0x30uLL);
  long long v23 = xmmword_263807900;
  strcpy((char *)v22, "com.apple.telephony.basebandservices.support");
  char v21 = 13;
  strcpy((char *)__p, "ari.rt.create");
  support::log::client::client(v24, (uint64_t)&v22, (uint64_t)__p, (uint64_t)a3);
  if (v21 < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v23) & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  else if ((SHIBYTE(v23) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(v22);
LABEL_3:
  *a4 = (support::transport::ARI *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v10 = (support::transport::ARI *)operator new(0x70uLL);
  support::transport::ARI::ARI(v10, a3);
  *(void *)uint64_t v10 = &unk_270EAED30;
  *a4 = v10;
  if (support::transport::ARI::initRT(v10, (char *)this, a2))
  {
    *(void *)&v24[0] = &unk_270EAECE0;
    long long v11 = (std::__shared_weak_count *)v26;
    if (!(void)v26) {
      return;
    }
    goto LABEL_5;
  }
  char v19 = 1;
  int v12 = (support::log::manager *)*((void *)&v26 + 1);
  uint64_t v13 = (support::log::buffer *)(*(uint64_t (**)(void, uint64_t, void))(**((void **)&v26 + 1) + 16))(*((void *)&v26 + 1), 1, *(void *)v25);
  if (v13)
  {
    if (*((void *)v12 + 17))
    {
      support::log::buffer::borrow(v13);
      int v14 = 2;
    }
    else
    {
      int v14 = 0;
    }
    if (v14 | os_log_type_enabled(*(os_log_t *)v25, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18[0]) = 0;
      uint64_t v15 = _os_log_send_and_compose_impl();
      if (v15)
      {
        dispatch_queue_t v16 = (char *)v15;
        std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = std::chrono::system_clock::now().__d_.__rep_;
        v18[0] = &unk_270EAED78;
        v18[1] = (char *)v24 + 8;
        v18[2] = &v19;
        v18[3] = &rep;
        support::log::manager::message_delegates(v12, (const support::log::details *)v18, v16);
      }
    }
  }
  *a4 = 0;
  (*(void (**)(support::transport::ARI *))(*(void *)v10 + 8))(v10);
  *(void *)&v24[0] = &unk_270EAECE0;
  long long v11 = (std::__shared_weak_count *)v26;
  if ((void)v26)
  {
LABEL_5:
    if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

void sub_2637DAB74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  void *v17 = 0;
  (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  support::log::client::~client((support::log::client *)va);
  _Unwind_Resume(a1);
}

void sub_2637DABD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  if (a30 < 0)
  {
    operator delete(a25);
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x2637DABD0);
}

void support::transport::AriRT::create(support::transport::AriRT *this@<X0>, const support::log::manager *a2@<X1>, support::transport::ARI **a3@<X8>)
{
}

void support::transport::AriRT::~AriRT(support::transport::AriRT *this)
{
  support::transport::ARI::~ARI(this);

  operator delete(v1);
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2655D5A10, MEMORY[0x263F8C068]);
}

void sub_2637DAC8C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

uint64_t __cxx_global_var_init_0()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>::~PthreadMutexGuardPolicy, &ctu::Singleton<support::log::shared_stdio,support::log::shared_stdio,ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>>::sInstance, &dword_2637D5000);
  }
  return result;
}

uint64_t HSFilerRT_Internal::getLogClient(HSFilerRT_Internal *this)
{
  return (uint64_t)this + 80;
}

void HSFilerRT_Internal::Session::create(uint64_t *a1@<X0>, int a2@<W1>, char a3@<W2>, NSObject **a4@<X3>, uint64_t *a5@<X8>)
{
  *a5 = 0;
  a5[1] = 0;
  if (capabilities::radio::vendor((capabilities::radio *)a1) == 3)
  {
    uint64_t v10 = operator new(0x98uLL);
    v10[1] = 0;
    v10[2] = 0;
    void *v10 = &unk_270EAF160;
    uint64_t v11 = (uint64_t)(v10 + 3);
    uint64_t v12 = *a1;
    uint64_t v13 = (std::__shared_weak_count *)a1[1];
    v16[0] = v12;
    v16[1] = (uint64_t)v13;
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    int v14 = *a4;
    dispatch_object_t v15 = v14;
    if (v14) {
      dispatch_retain(v14);
    }
    HSFilerRT_Internal_INT::Session_INT::Session_INT(v11, v16, a2, a3, &v15);
    if (v14) {
      dispatch_release(v14);
    }
    if (v13)
    {
      if (!atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    *a5 = v11;
    a5[1] = (uint64_t)v10;
  }
}

void sub_2637DAE44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (v13) {
    dispatch_release(v13);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::__shared_weak_count::~__shared_weak_count(v12);
  operator delete(v15);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](v11);
  _Unwind_Resume(a1);
}

void sub_2637DAE78(_Unwind_Exception *a1)
{
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void sub_2637DAE8C(_Unwind_Exception *a1)
{
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(std::__shared_weak_count **)(result + 8);
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

uint64_t HSFilerRT_Internal::Session::Session(uint64_t a1, uint64_t *a2, int a3, char a4, NSObject **a5)
{
  uint64_t v8 = *a2;
  uint64_t v7 = a2[1];
  *(void *)a1 = &unk_270EAEDA8;
  *(void *)(a1 + 8) = v8;
  *(void *)(a1 + 16) = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  *(_DWORD *)(a1 + 24) = a3;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 64) = 0;
  *(_DWORD *)(a1 + 72) = 1065353216;
  long long v9 = *a5;
  *(void *)(a1 + 80) = *a5;
  if (v9) {
    dispatch_retain(v9);
  }
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(unsigned char *)(a1 + 112) = a4;
  *(_WORD *)(a1 + 113) = 0;
  return a1;
}

{
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;

  uint64_t v8 = *a2;
  uint64_t v7 = a2[1];
  *(void *)a1 = &unk_270EAEDA8;
  *(void *)(a1 + 8) = v8;
  *(void *)(a1 + 16) = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  *(_DWORD *)(a1 + 24) = a3;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 64) = 0;
  *(_DWORD *)(a1 + 72) = 1065353216;
  long long v9 = *a5;
  *(void *)(a1 + 80) = *a5;
  if (v9) {
    dispatch_retain(v9);
  }
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(unsigned char *)(a1 + 112) = a4;
  *(_WORD *)(a1 + 113) = 0;
  return a1;
}

void HSFilerRT_Internal::Session::~Session(HSFilerRT_Internal::Session *this)
{
  *(void *)this = &unk_270EAEDA8;
  HSFilerRT_Internal::Session::end(this);
  uint64_t v2 = *((void *)this + 13);
  *((void *)this + 13) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  int v3 = (const void *)*((void *)this + 11);
  if (v3) {
    _Block_release(v3);
  }
  uint64_t v4 = *((void *)this + 10);
  if (v4) {
    dispatch_release(v4);
  }
  uint64_t v5 = (void **)*((void *)this + 7);
  if (v5)
  {
    do
    {
      uint64_t v8 = (void **)*v5;
      if (*((char *)v5 + 39) < 0) {
        operator delete(v5[2]);
      }
      operator delete(v5);
      uint64_t v5 = v8;
    }
    while (v8);
  }
  char v6 = (void *)*((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v7)
  {
    if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

{
  void *v1;
  uint64_t vars8;

  HSFilerRT_Internal::Session::~Session(this);

  operator delete(v1);
}

BOOL HSFilerRT_Internal::Session::hasFile(uint64_t a1, uint64_t a2)
{
  return std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::find<std::string>((void *)(a1 + 40), a2) != 0;
}

uint64_t *HSFilerRT_Internal::Session::markFileAsTransferred(uint64_t a1, long long *a2)
{
  uint64_t v3 = a1 + 40;
  uint64_t result = std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::find<std::string>((void *)(a1 + 40), (uint64_t)a2);
  if (result)
  {
    uint64_t v5 = a2;
    uint64_t result = std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v3, (uint64_t)a2, &v5);
    *((unsigned char *)result + 40) = 1;
  }
  return result;
}

uint64_t *HSFilerRT_Internal::Session::fileTransferred(uint64_t a1, long long *a2)
{
  uint64_t v3 = a1 + 40;
  uint64_t result = std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::find<std::string>((void *)(a1 + 40), (uint64_t)a2);
  if (result)
  {
    uint64_t v5 = a2;
    return (uint64_t *)(*((unsigned char *)std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v3, (uint64_t)a2, &v5)+ 40) != 0);
  }
  return result;
}

BOOL HSFilerRT_Internal::Session::allFilesTransferred(HSFilerRT_Internal::Session *this)
{
  uint64_t v1 = (char *)this + 56;
  do
    uint64_t v1 = *(char **)v1;
  while (v1 && v1[40]);
  return v1 == 0;
}

void HSFilerRT_Internal::Session::end(HSFilerRT_Internal::Session *this)
{
  uint64_t v2 = *((void *)this + 13);
  if (v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
    uint64_t v3 = *((void *)this + 13);
    *((void *)this + 13) = 0;
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
    }
  }
  *((_DWORD *)this + 24) = 0;
  *((unsigned char *)this + 113) = 0;
  if (*((void *)this + 8))
  {
    uint64_t v4 = (void **)*((void *)this + 7);
    if (v4)
    {
      do
      {
        uint64_t v7 = (void **)*v4;
        if (*((char *)v4 + 39) < 0) {
          operator delete(v4[2]);
        }
        operator delete(v4);
        uint64_t v4 = v7;
      }
      while (v7);
    }
    *((void *)this + 7) = 0;
    uint64_t v5 = *((void *)this + 6);
    if (v5)
    {
      for (uint64_t i = 0; i != v5; ++i)
        *(void *)(*((void *)this + 5) + 8 * i) = 0;
    }
    *((void *)this + 8) = 0;
  }
}

void HSFilerRT_Internal::HSFilerRT_Internal(HSFilerRT_Internal *this)
{
  uint64_t v1 = this;
  v111[2] = *(void **)MEMORY[0x263EF8340];
  *(void *)this = &unk_270EAF5B0;
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  uint64_t v3 = dispatch_queue_create_with_target_V2("HSFilerRT", initially_inactive, 0);
  dispatch_set_qos_class_floor(v3, QOS_CLASS_BACKGROUND, 0);
  dispatch_activate(v3);
  *((void *)v1 + 1) = 0;
  *((void *)v1 + 2) = 0;
  *((void *)v1 + 3) = v3;
  if (v3)
  {
    dispatch_retain(v3);
    *((void *)v1 + 4) = 0;
    dispatch_release(v3);
  }
  else
  {
    *((void *)v1 + 4) = 0;
  }
  *(void *)uint64_t v1 = &unk_270EAF5B0;
  *((void *)v1 + 6) = 0;
  v69 = (void *)((char *)v1 + 48);
  *((void *)v1 + 5) = (char *)v1 + 48;
  uint64_t i = (void **)((char *)v1 + 40);
  *((void *)v1 + 7) = 0;
  *((void *)v1 + 8) = 0;
  *((void *)v1 + 9) = 0;
  v68 = (void **)((char *)v1 + 40);
  hsfiler_log_client::hsfiler_log_client((HSFilerRT_Internal *)((char *)v1 + 80), "hsfiler.rt");
  blocuint64_t k = MEMORY[0x263EF8330];
  uint64_t v91 = 0x40000000;
  v92 = ___ZN7hsfiler7loggingL14sLogServerInitERNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v93 = &__block_descriptor_tmp_2;
  v94 = &hsfiler::logging::getLogServer(void)::sLogServer;
  if (hsfiler::logging::sLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce != -1)
  {
    dispatch_once(&hsfiler::logging::sLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, &block);
    uint64_t v5 = *(void *)algn_26A99FA28;
    uint64_t v85 = hsfiler::logging::getLogServer(void)::sLogServer;
    v86 = *(std::__shared_weak_count **)algn_26A99FA28;
    if (!*(void *)algn_26A99FA28) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v5 = *(void *)algn_26A99FA28;
  uint64_t v85 = hsfiler::logging::getLogServer(void)::sLogServer;
  v86 = *(std::__shared_weak_count **)algn_26A99FA28;
  if (*(void *)algn_26A99FA28) {
LABEL_6:
  }
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
LABEL_7:
  ctu::DispatchTimerService::create();
  if (v86 && !atomic_fetch_add(&v86->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v86->__on_zero_shared)(v86);
    std::__shared_weak_count::__release_weak(v86);
  }
  *((void *)v1 + 22) = 0;
  *((_DWORD *)v1 + 46) = 0;
  *((void *)v1 + 25) = 0;
  *((void *)v1 + 26) = 0;
  *((void *)v1 + 24) = 0;
  *((unsigned char *)v1 + 216) = 0;
  v84[0] = 0;
  v84[1] = 0;
  v83 = v84;
  LODWORD(block) = 1;
  v92 = 0;
  v93 = 0;
  uint64_t v91 = (uint64_t)&v92;
  v66 = v1;
  std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__tree_node<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,void *> *,long>>>(&v91, v84, v84);
  v82[0] = 0;
  v82[1] = 0;
  v81 = v82;
  LODWORD(v94) = 2;
  v96[0] = 0;
  v96[1] = 0;
  v95 = v96;
  std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__tree_node<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,void *> *,long>>>((uint64_t *)&v95, v82, v82);
  v80[0] = 0;
  v80[1] = 0;
  v79 = v80;
  int v97 = 3;
  v99[0] = 0;
  v99[1] = 0;
  v98 = v99;
  std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__tree_node<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,void *> *,long>>>((uint64_t *)&v98, v80, v80);
  v78[0] = 0;
  v78[1] = 0;
  v77 = v78;
  int v100 = 4;
  v102[0] = 0;
  v102[1] = 0;
  v101 = v102;
  std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__tree_node<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,void *> *,long>>>((uint64_t *)&v101, v78, v78);
  v76[0] = 0;
  v76[1] = 0;
  v75 = v76;
  int v103 = 5;
  v105[0] = 0;
  v105[1] = 0;
  v104 = v105;
  std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__tree_node<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,void *> *,long>>>((uint64_t *)&v104, v76, v76);
  v74[0] = 0;
  v74[1] = 0;
  v73 = v74;
  int v106 = 6;
  v108[1] = 0;
  v108[0] = 0;
  v107 = v108;
  std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__tree_node<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,void *> *,long>>>((uint64_t *)&v107, v74, v74);
  v72[0] = 0;
  v72[1] = 0;
  v71 = v72;
  int v109 = 7;
  v111[1] = 0;
  v111[0] = 0;
  v110 = v111;
  std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__tree_node<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,void *> *,long>>>((uint64_t *)&v110, v72, v72);
  if (*((void *)v1 + 7))
  {
    uint64_t v87 = (uint64_t)v1 + 40;
    unint64_t v88 = 0xAAAAAAAAAAAAAAAALL;
    char v6 = *i;
    *uint64_t i = v69;
    *(void *)(*v69 + 16) = 0;
    void *v69 = 0;
    *((void *)v1 + 7) = 0;
    uint64_t v7 = v6[1] ? (void *)v6[1] : v6;
    unint64_t v89 = (unint64_t)v7;
    if (v7)
    {
      uint64_t v8 = (void *)v7[2];
      if (v8)
      {
        long long v9 = (void *)*v8;
        if ((void *)*v8 == v7)
        {
          *uint64_t v8 = 0;
          while (1)
          {
            v65 = (void *)v8[1];
            if (!v65) {
              break;
            }
            do
            {
              uint64_t v8 = v65;
              v65 = (void *)*v65;
            }
            while (v65);
          }
        }
        else
        {
          for (v8[1] = 0; v9; long long v9 = (void *)v8[1])
          {
            do
            {
              uint64_t v8 = v9;
              long long v9 = (void *)*v9;
            }
            while (v9);
          }
        }
      }
      uint64_t v10 = 0;
      unint64_t v88 = (unint64_t)v8;
      while (1)
      {
        uint64_t v11 = &block + 4 * v10;
        uint64_t v12 = v69;
        uint64_t v13 = *v69;
        unsigned int v14 = *(_DWORD *)v11;
LABEL_25:
        dispatch_object_t v15 = v12;
        if (v13)
        {
          do
          {
            uint64_t v12 = (void *)v13;
            unsigned int v16 = *(_DWORD *)(v13 + 32);
            if (v14 < v16)
            {
              uint64_t v13 = *v12;
              goto LABEL_25;
            }
            if (v16 >= v14) {
              goto LABEL_22;
            }
            uint64_t v13 = v12[1];
          }
          while (v13);
          dispatch_object_t v15 = v12 + 1;
        }
        *((_DWORD *)v7 + 8) = v14;
        if (v7 + 4 != v11)
        {
          std::string::size_type v17 = &block + 4 * v10;
          uint64_t v18 = (void **)(v7 + 5);
          char v19 = (void *)v17[1];
          v70 = v17 + 2;
          if (v7[7])
          {
            char v21 = (uint64_t **)(v7 + 6);
            uint64_t v20 = v7[6];
            uint64_t v22 = v7[5];
            v7[5] = v7 + 6;
            *(void *)(v20 + 16) = 0;
            void v7[6] = 0;
            v7[7] = 0;
            if (*(void *)(v22 + 8)) {
              long long v23 = *(uint64_t **)(v22 + 8);
            }
            else {
              long long v23 = (uint64_t *)v22;
            }
            if (v23)
            {
              int v24 = (uint64_t *)v23[2];
              if (v24)
              {
                long long v25 = (uint64_t *)*v24;
                if ((uint64_t *)*v24 == v23)
                {
                  uint64_t *v24 = 0;
                  while (1)
                  {
                    long long v54 = (uint64_t *)v24[1];
                    if (!v54) {
                      break;
                    }
                    do
                    {
                      int v24 = v54;
                      long long v54 = (uint64_t *)*v54;
                    }
                    while (v54);
                  }
                }
                else
                {
                  for (v24[1] = 0; v25; long long v25 = (uint64_t *)v24[1])
                  {
                    do
                    {
                      int v24 = v25;
                      long long v25 = (uint64_t *)*v25;
                    }
                    while (v25);
                  }
                }
              }
              uint64_t v67 = v10;
              if (v19 == v70)
              {
                int v35 = v19;
                long long v26 = v23;
              }
              else
              {
                do
                {
                  long long v26 = v24;
                  v23[4] = v19[4];
                  uint64_t v28 = v19[5];
                  uint64_t v27 = v19[6];
                  if (v27) {
                    atomic_fetch_add_explicit((atomic_ullong *volatile)(v27 + 8), 1uLL, memory_order_relaxed);
                  }
                  uint64_t v29 = (std::__shared_weak_count *)v23[6];
                  v23[5] = v28;
                  v23[6] = v27;
                  if (v29 && !atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                  {
                    ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
                    std::__shared_weak_count::__release_weak(v29);
                    char v30 = *v21;
                    uint64_t v31 = (uint64_t **)(v7 + 6);
                    char v32 = (uint64_t **)(v7 + 6);
                    if (*v21)
                    {
                      do
                      {
LABEL_49:
                        while (1)
                        {
                          uint64_t v31 = (uint64_t **)v30;
                          if (v23[4] >= (unint64_t)v30[4]) {
                            break;
                          }
                          char v30 = (uint64_t *)*v30;
                          char v32 = v31;
                          if (!*v31) {
                            goto LABEL_54;
                          }
                        }
                        char v30 = (uint64_t *)v30[1];
                      }
                      while (v30);
                      char v32 = v31 + 1;
                    }
                  }
                  else
                  {
                    char v30 = *v21;
                    uint64_t v31 = (uint64_t **)(v7 + 6);
                    char v32 = (uint64_t **)(v7 + 6);
                    if (*v21) {
                      goto LABEL_49;
                    }
                  }
LABEL_54:
                  *long long v23 = 0;
                  v23[1] = 0;
                  v23[2] = (uint64_t)v31;
                  void *v32 = v23;
                  int v33 = (void *)**v18;
                  if (v33)
                  {
                    *uint64_t v18 = v33;
                    long long v23 = *v32;
                  }
                  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v7[6], v23);
                  ++v7[7];
                  if (v26)
                  {
                    int v24 = (uint64_t *)v26[2];
                    if (v24)
                    {
                      int v37 = (uint64_t *)*v24;
                      if ((uint64_t *)*v24 == v26)
                      {
                        uint64_t *v24 = 0;
                        while (1)
                        {
                          uint64_t v38 = (uint64_t *)v24[1];
                          if (!v38) {
                            break;
                          }
                          do
                          {
                            int v24 = v38;
                            uint64_t v38 = (uint64_t *)*v38;
                          }
                          while (v38);
                        }
                      }
                      else
                      {
                        for (v24[1] = 0; v37; int v37 = (uint64_t *)v24[1])
                        {
                          do
                          {
                            int v24 = v37;
                            int v37 = (uint64_t *)*v37;
                          }
                          while (v37);
                        }
                      }
                    }
                  }
                  else
                  {
                    int v24 = 0;
                  }
                  char v34 = (void *)v19[1];
                  if (v34)
                  {
                    do
                    {
                      int v35 = v34;
                      char v34 = (void *)*v34;
                    }
                    while (v34);
                  }
                  else
                  {
                    do
                    {
                      int v35 = (void *)v19[2];
                      BOOL v36 = *v35 == (void)v19;
                      char v19 = v35;
                    }
                    while (!v36);
                  }
                  if (!v26) {
                    break;
                  }
                  long long v23 = v26;
                  char v19 = v35;
                }
                while (v35 != v70);
              }
              std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)(v7 + 5), v26);
              if (v24)
              {
                long long v39 = (uint64_t *)v24[2];
                uint64_t v10 = v67;
                for (i = v68; v39; long long v39 = (uint64_t *)v39[2])
                  int v24 = v39;
                std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)(v7 + 5), v24);
                uint64_t v1 = v66;
                if (v35 == v70) {
                  goto LABEL_106;
                }
LABEL_87:
                uint64_t v40 = (uint64_t **)(v7 + 6);
                while (2)
                {
                  v41 = (uint64_t *)operator new(0x38uLL);
                  uint64_t v42 = v41;
                  unint64_t v43 = v35[4];
                  v41[4] = v43;
                  v41[5] = v35[5];
                  uint64_t v44 = v35[6];
                  v41[6] = v44;
                  if (v44) {
                    atomic_fetch_add_explicit((atomic_ullong *volatile)(v44 + 8), 1uLL, memory_order_relaxed);
                  }
                  v45 = *v40;
                  v46 = (uint64_t **)(v7 + 6);
                  char v47 = (uint64_t **)(v7 + 6);
                  if (*v40)
                  {
                    do
                    {
                      while (1)
                      {
                        v46 = (uint64_t **)v45;
                        if (v43 >= v45[4]) {
                          break;
                        }
                        v45 = (uint64_t *)*v45;
                        char v47 = v46;
                        if (!*v46) {
                          goto LABEL_96;
                        }
                      }
                      v45 = (uint64_t *)v45[1];
                    }
                    while (v45);
                    char v47 = v46 + 1;
                    uint64_t *v41 = 0;
                    v41[1] = 0;
                    v41[2] = (uint64_t)v46;
                    v46[1] = v41;
                    char v48 = (void *)**v18;
                    if (v48)
                    {
LABEL_97:
                      *uint64_t v18 = v48;
                      uint64_t v42 = *v47;
                    }
                  }
                  else
                  {
LABEL_96:
                    uint64_t *v41 = 0;
                    v41[1] = 0;
                    v41[2] = (uint64_t)v46;
                    *char v47 = v41;
                    char v48 = (void *)**v18;
                    if (v48) {
                      goto LABEL_97;
                    }
                  }
                  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v7[6], v42);
                  ++v7[7];
                  v49 = (void *)v35[1];
                  if (v49)
                  {
                    do
                    {
                      v50 = v49;
                      v49 = (void *)*v49;
                    }
                    while (v49);
                  }
                  else
                  {
                    do
                    {
                      v50 = (void *)v35[2];
                      BOOL v36 = *v50 == (void)v35;
                      int v35 = v50;
                    }
                    while (!v36);
                  }
                  int v35 = v50;
                  if (v50 == v70) {
                    goto LABEL_106;
                  }
                  continue;
                }
              }
              uint64_t v1 = v66;
              uint64_t v10 = v67;
              uint64_t i = v68;
              if (v35 != v70) {
                goto LABEL_87;
              }
            }
            else
            {
              int v35 = v19;
              uint64_t i = v68;
              if (v19 != v70) {
                goto LABEL_87;
              }
            }
          }
          else
          {
            int v35 = (void *)v17[1];
            if (v19 != v70) {
              goto LABEL_87;
            }
          }
        }
LABEL_106:
        *uint64_t v7 = 0;
        v7[1] = 0;
        v7[2] = v12;
        void *v15 = v7;
        v51 = (void *)**i;
        if (v51)
        {
          *uint64_t i = v51;
          uint64_t v7 = (void *)*v15;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)v1 + 6), v7);
        ++*((void *)v1 + 7);
        uint64_t v7 = (void *)v88;
        unint64_t v89 = v88;
        if (!v88)
        {
          uint64_t k = v10 + 1;
          std::__tree<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::__map_value_compare<HSFilerClientID,std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::less<HSFilerClientID>,true>,std::allocator<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>>::destroy(v87, 0);
          if (v10 == 6) {
            goto LABEL_140;
          }
          goto LABEL_127;
        }
        uint64_t v8 = *(void **)(v88 + 16);
        if (v8)
        {
          std::string v52 = (void *)*v8;
          if (*v8 == v88)
          {
            *uint64_t v8 = 0;
            while (1)
            {
              v53 = (void *)v8[1];
              if (!v53) {
                break;
              }
              do
              {
                uint64_t v8 = v53;
                v53 = (void *)*v53;
              }
              while (v53);
            }
          }
          else
          {
            for (v8[1] = 0; v52; std::string v52 = (void *)v8[1])
            {
              do
              {
                uint64_t v8 = v52;
                std::string v52 = (void *)*v52;
              }
              while (v52);
            }
          }
        }
        unint64_t v88 = (unint64_t)v8;
LABEL_22:
        if (++v10 == 7)
        {
          uint64_t v63 = v87;
          std::__tree<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::__map_value_compare<HSFilerClientID,std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::less<HSFilerClientID>,true>,std::allocator<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>>::destroy(v87, v7);
          if (v8)
          {
            for (uint64_t j = (void *)v8[2]; j; uint64_t j = (void *)j[2])
              uint64_t v8 = j;
            std::__tree<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::__map_value_compare<HSFilerClientID,std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::less<HSFilerClientID>,true>,std::allocator<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>>::destroy(v63, v8);
          }
          goto LABEL_140;
        }
      }
    }
  }
  for (uint64_t k = 0; k != 7; ++k)
  {
LABEL_127:
    unsigned int v56 = *((_DWORD *)&block + 8 * k);
    long long v57 = v69;
    while (1)
    {
      uint64_t v58 = *v57;
      uint64_t v59 = v57;
      if (!*v57) {
        break;
      }
      while (1)
      {
        long long v57 = (void *)v58;
        unsigned int v60 = *(_DWORD *)(v58 + 32);
        if (v60 > v56) {
          break;
        }
        if (v60 >= v56) {
          goto LABEL_126;
        }
        uint64_t v58 = v57[1];
        if (!v58)
        {
          uint64_t v59 = v57 + 1;
          goto LABEL_133;
        }
      }
    }
LABEL_133:
    v61 = operator new(0x40uLL);
    v61[6] = 0;
    v61[5] = v61 + 6;
    *((_DWORD *)v61 + 8) = v56;
    v61[7] = 0;
    std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__tree_node<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,void *> *,long>>>(v61 + 5, (void *)*(&block + 4 * k + 1), &v92 + 4 * k);
    void *v61 = 0;
    v61[1] = 0;
    v61[2] = v57;
    *uint64_t v59 = v61;
    v62 = (void *)**i;
    if (v62)
    {
      *uint64_t i = v62;
      v61 = (void *)*v59;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)v1 + 6), v61);
    ++*((void *)v1 + 7);
LABEL_126:
    ;
  }
LABEL_140:
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&v110, v111[0]);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&v107, v108[0]);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&v104, v105[0]);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&v101, v102[0]);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&v98, v99[0]);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&v95, v96[0]);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&v91, v92);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&v71, v72[0]);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&v73, v74[0]);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&v75, v76[0]);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&v77, v78[0]);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&v79, v80[0]);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&v81, v82[0]);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&v83, v84[0]);
}

void sub_2637DBEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, hsfiler_log_client *a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void **a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  uint64_t v59 = v53;
  unsigned int v56 = (char *)&STACK[0x220];
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy(v59, *v54);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&a27, (void *)a28);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&a30, (void *)a31);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&a33, (void *)a34);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&a36, (void *)a37);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&a39, (void *)a40);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&a42, (void *)a43);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)&a45, (void *)a46);
  if (&a53 != (char *)&STACK[0x220])
  {
    do
    {
      std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)(v56 - 24), *((void **)v56 - 2));
      v56 -= 32;
    }
    while (v56 != &a53);
  }
  long long v57 = *(const void **)(a22 + 208);
  if (v57) {
    _Block_release(v57);
  }
  uint64_t v58 = *(std::__shared_weak_count **)(a22 + 200);
  if (v58) {
    std::__shared_weak_count::__release_weak(v58);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](a10);
  hsfiler_log_client::~hsfiler_log_client(a11);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](a12);
  std::__tree<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::__map_value_compare<HSFilerClientID,std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::less<HSFilerClientID>,true>,std::allocator<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>>::destroy(a24, *a25);
  ctu::SharedSynchronizable<HSFilerRT_Internal>::~SharedSynchronizable(a13);
  _Unwind_Resume(a1);
}

void sub_2637DC0CC(void *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  JUMPOUT(0x2637DC0C4);
}

void hsfiler_log_client::~hsfiler_log_client(hsfiler_log_client *this)
{
  *(void *)this = &unk_270EAECE0;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 8);
  if (v1)
  {
    if (!atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

void *ctu::SharedSynchronizable<HSFilerRT_Internal>::~SharedSynchronizable(void *a1)
{
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

double HSFilerRT_Internal::create@<D0>(HSFilerRT_Internal *this@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  if (capabilities::radio::vendor(this) == 3)
  {
    _ZNSt3__115allocate_sharedB8ne180100I22HSFilerRT_Internal_INTNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((uint64_t *)v4);
    double result = v4[0];
    *(_OWORD *)a2 = *(_OWORD *)v4;
  }
  return result;
}

void sub_2637DC208(_Unwind_Exception *a1)
{
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void sub_2637DC21C(_Unwind_Exception *a1)
{
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t HSFilerRT_Internal::createSession(uint64_t a1, uint64_t *a2, int a3, unsigned int a4, NSObject **a5)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (a4 >= 9)
  {
    dispatch_object_t v15 = **(NSObject ***)(a1 + 128);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a4;
      _os_log_error_impl(&dword_2637D5000, v15, OS_LOG_TYPE_ERROR, "error: Invalid clientID param: %d", buf, 8u);
    }
    return 0;
  }
  if (!*a5)
  {
    unsigned int v16 = **(NSObject ***)(a1 + 128);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2637D5000, v16, OS_LOG_TYPE_ERROR, "error: NULL queue param", buf, 2u);
    }
    return 0;
  }
  char v8 = a3;
  if (a3) {
    uint64_t v10 = "read";
  }
  else {
    uint64_t v10 = "write";
  }
  __dst.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  __dst.__r_.__value_.__r.__words[2] = 0xAAAAAAAAAAAAAAAALL;
  if (a3) {
    size_t v11 = 4;
  }
  else {
    size_t v11 = 5;
  }
  __dst.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v11;
  memcpy(&__dst, v10, v11);
  *(unsigned char *)((unint64_t)&__dst | v11) = 0;
  uint64_t v12 = **(NSObject ***)(a1 + 128);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = hsfiler::support::to_string(a4);
    p_dst = &__dst;
    if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = p_dst;
    _os_log_impl(&dword_2637D5000, v12, OS_LOG_TYPE_DEFAULT, "Creating client (%s) %s session", buf, 0x16u);
  }
  uint64_t v38 = 0;
  long long v39 = &v38;
  uint64_t v40 = 0x2000000000;
  char v41 = 0;
  uint64_t v34 = 0;
  int v35 = &v34;
  uint64_t v36 = 0x2000000000;
  uint64_t v37 = 0;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 1174405120;
  v27[2] = ___ZN18HSFilerRT_Internal13createSessionENSt3__110shared_ptrI8RegistryEEb15HSFilerClientIDN8dispatch5queueE_block_invoke;
  void v27[3] = &__block_descriptor_tmp_4;
  v27[6] = a1;
  unsigned int v32 = a4;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = __dst;
  }
  uint64_t v18 = (std::__shared_weak_count *)a2[1];
  uint64_t v29 = *a2;
  char v30 = v18;
  if (v18) {
    atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  char v33 = v8;
  char v19 = *a5;
  dispatch_object_t object = v19;
  if (v19) {
    dispatch_retain(v19);
  }
  v27[4] = &v34;
  v27[5] = &v38;
  unint64_t v43 = v27;
  *(void *)buf = MEMORY[0x263EF8330];
  *(void *)&buf[8] = 0x40000000;
  *(void *)&uint8_t buf[16] = ___ZNK3ctu20SharedSynchronizableI18HSFilerRT_InternalE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  v45 = &__block_descriptor_tmp_83;
  uint64_t v46 = a1 + 8;
  char v47 = &v43;
  uint64_t v20 = *(NSObject **)(a1 + 24);
  if (*(void *)(a1 + 32))
  {
    dispatch_async_and_wait(v20, buf);
    if (!*((unsigned char *)v39 + 24)) {
      goto LABEL_33;
    }
  }
  else
  {
    dispatch_sync(v20, buf);
    if (!*((unsigned char *)v39 + 24)) {
      goto LABEL_33;
    }
  }
  char v21 = **(NSObject ***)(a1 + 128);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = hsfiler::support::to_string(a4);
    long long v23 = &__dst;
    if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      long long v23 = (std::string *)__dst.__r_.__value_.__r.__words[0];
    }
    int v24 = (void *)v35[3];
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2048;
    v45 = v24;
    _os_log_impl(&dword_2637D5000, v21, OS_LOG_TYPE_DEFAULT, "Created client (%s) %s session (%llu)", buf, 0x20u);
  }
LABEL_33:
  uint64_t v17 = v35[3];
  if (object) {
    dispatch_release(object);
  }
  long long v25 = v30;
  if (!v30 || atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
  std::__shared_weak_count::__release_weak(v25);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
LABEL_38:
  }
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_39:
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  return v17;
}

void sub_2637DC6B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,dispatch_object_t object,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  if (object) {
    dispatch_release(object);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](v39);
  if (a21 < 0) {
    operator delete(__p);
  }
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  if (a39 < 0) {
    operator delete(a34);
  }
  _Unwind_Resume(a1);
}

void ___ZN18HSFilerRT_Internal13createSessionENSt3__110shared_ptrI8RegistryEEb15HSFilerClientIDN8dispatch5queueE_block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v4 = (uint64_t **)(v2 + 48);
  uint64_t v3 = *(uint64_t **)(v2 + 48);
  unsigned int v5 = *(_DWORD *)(a1 + 104);
  char v6 = (uint64_t **)(v2 + 48);
  uint64_t v7 = (uint64_t **)(v2 + 48);
  if (v3)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v7 = (uint64_t **)v3;
        unsigned int v8 = *((_DWORD *)v3 + 8);
        if (v5 >= v8) {
          break;
        }
        uint64_t v3 = *v7;
        char v6 = v7;
        if (!*v7) {
          goto LABEL_8;
        }
      }
      if (v8 >= v5) {
        break;
      }
      uint64_t v3 = v7[1];
      if (!v3)
      {
        char v6 = v7 + 1;
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    long long v9 = (uint64_t *)v7;
    uint64_t v7 = (uint64_t **)operator new(0x40uLL);
    *((_DWORD *)v7 + 8) = v5;
    v7[7] = 0;
    void v7[6] = 0;
    v7[5] = (uint64_t *)(v7 + 6);
    *uint64_t v7 = 0;
    v7[1] = 0;
    v7[2] = v9;
    void *v6 = (uint64_t *)v7;
    uint64_t v10 = **(void **)(v2 + 40);
    size_t v11 = (uint64_t *)v7;
    if (v10)
    {
      *(void *)(v2 + 40) = v10;
      size_t v11 = *v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v2 + 48), v11);
    ++*(void *)(v2 + 56);
  }
  if (v7[7] == (uint64_t *)20)
  {
    uint64_t v12 = **(NSObject ***)(v2 + 128);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = hsfiler::support::to_string(*(_DWORD *)(a1 + 104));
      unsigned int v14 = (void *)(a1 + 56);
      if (*(char *)(a1 + 79) < 0) {
        unsigned int v14 = (void *)*v14;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v46 = v13;
      __int16 v47 = 2080;
      uint64_t v48 = v14;
      __int16 v49 = 2048;
      uint64_t v50 = 20;
      _os_log_error_impl(&dword_2637D5000, v12, OS_LOG_TYPE_ERROR, "error: Failed client (%s) create %s session: max number of sessions (%zu) reached", buf, 0x20u);
    }
    return;
  }
  uint64_t v43 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v44 = 0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t v15 = *(std::__shared_weak_count **)(a1 + 88);
  v42[0] = *(void *)(a1 + 80);
  v42[1] = (uint64_t)v15;
  if (v15) {
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v16 = *(_DWORD *)(a1 + 104);
  int v17 = *(unsigned __int8 *)(a1 + 108);
  uint64_t v18 = *(NSObject **)(a1 + 96);
  char v41 = v18;
  if (v18) {
    dispatch_retain(v18);
  }
  HSFilerRT_Internal::Session::create(v42, v16, v17 != 0, &v41, &v43);
  if (v18) {
    dispatch_release(v18);
  }
  if (!v15 || atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (v43) {
      goto LABEL_25;
    }
LABEL_37:
    uint64_t v29 = **(NSObject ***)(v2 + 128);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      char v30 = hsfiler::support::to_string(*(_DWORD *)(a1 + 104));
      uint64_t v31 = (void *)(a1 + 56);
      if (*(char *)(a1 + 79) < 0) {
        uint64_t v31 = (void *)*v31;
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v46 = v30;
      __int16 v47 = 2080;
      uint64_t v48 = v31;
      _os_log_error_impl(&dword_2637D5000, v29, OS_LOG_TYPE_ERROR, "error: Failed client (%s) create %s session: Session obj alloc failed", buf, 0x16u);
    }
    goto LABEL_56;
  }
  ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
  std::__shared_weak_count::__release_weak(v15);
  if (!v43) {
    goto LABEL_37;
  }
LABEL_25:
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = atomic_fetch_add((atomic_ullong *volatile)(v2 + 176), 1uLL)+ 1;
  *(void *)(v43 + 32) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  char v19 = *(uint64_t **)(v2 + 48);
  unsigned int v20 = *(_DWORD *)(a1 + 104);
  char v21 = (uint64_t **)(v2 + 48);
  if (v19)
  {
    while (1)
    {
      while (1)
      {
        char v21 = (uint64_t **)v19;
        unsigned int v22 = *((_DWORD *)v19 + 8);
        if (v20 >= v22) {
          break;
        }
        char v19 = *v21;
        uint64_t v4 = v21;
        if (!*v21) {
          goto LABEL_32;
        }
      }
      if (v22 >= v20) {
        break;
      }
      char v19 = v21[1];
      if (!v19)
      {
        uint64_t v4 = v21 + 1;
        goto LABEL_32;
      }
    }
    long long v23 = v21;
    uint64_t v27 = v21 + 6;
    long long v26 = v21[6];
    unint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (v26) {
      goto LABEL_44;
    }
LABEL_42:
    unsigned int v32 = v27;
LABEL_48:
    uint64_t v34 = (uint64_t *)operator new(0x38uLL);
    v34[5] = 0;
    v34[6] = 0;
    v34[4] = v28;
    *uint64_t v34 = 0;
    v34[1] = 0;
    v34[2] = (uint64_t)v32;
    *uint64_t v27 = v34;
    int v35 = (void *)*v23[5];
    uint64_t v36 = v34;
    if (v35)
    {
      v23[5] = v35;
      uint64_t v36 = *v27;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v23[6], v36);
    v23[7] = (void *)((char *)v23[7] + 1);
    uint64_t v38 = v43;
    unint64_t v37 = v44;
    if (!v44) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
LABEL_32:
  long long v23 = (void **)operator new(0x40uLL);
  *((_DWORD *)v23 + 8) = v20;
  v23[7] = 0;
  v23[6] = 0;
  v23[5] = v23 + 6;
  *long long v23 = 0;
  v23[1] = 0;
  v23[2] = v21;
  *uint64_t v4 = (uint64_t *)v23;
  uint64_t v24 = **(void **)(v2 + 40);
  long long v25 = (uint64_t *)v23;
  if (v24)
  {
    *(void *)(v2 + 40) = v24;
    long long v25 = *v4;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v2 + 48), v25);
  ++*(void *)(v2 + 56);
  uint64_t v27 = v23 + 6;
  long long v26 = v23[6];
  unint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (!v26) {
    goto LABEL_42;
  }
  while (1)
  {
LABEL_44:
    while (1)
    {
      unsigned int v32 = (uint64_t **)v26;
      unint64_t v33 = v26[4];
      if (v28 >= v33) {
        break;
      }
      long long v26 = *v32;
      uint64_t v27 = v32;
      if (!*v32) {
        goto LABEL_48;
      }
    }
    if (v33 >= v28) {
      break;
    }
    long long v26 = v32[1];
    if (!v26)
    {
      uint64_t v27 = v32 + 1;
      goto LABEL_48;
    }
  }
  uint64_t v34 = (uint64_t *)v32;
  uint64_t v38 = v43;
  unint64_t v37 = v44;
  if (!v44) {
    goto LABEL_52;
  }
LABEL_51:
  atomic_fetch_add_explicit((atomic_ullong *volatile)(v37 + 8), 1uLL, memory_order_relaxed);
LABEL_52:
  uint64_t v39 = (std::__shared_weak_count *)v34[6];
  v34[5] = v38;
  v34[6] = v37;
  if (v39 && !atomic_fetch_add(&v39->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
    std::__shared_weak_count::__release_weak(v39);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_56:
  uint64_t v40 = (std::__shared_weak_count *)v44;
  if (v44 && !atomic_fetch_add((atomic_ullong *volatile)(v44 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
    std::__shared_weak_count::__release_weak(v40);
  }
}

void sub_2637DCC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2637DCC50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2637DCC64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (v11) {
    dispatch_release(v11);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32r40r56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE80c35_ZTSNSt3__110shared_ptrI8RegistryEE96c21_ZTSN8dispatch5queueE(void *a1, uint64_t a2)
{
  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 8);
  _Block_object_assign(a1 + 5, *(const void **)(a2 + 40), 8);
  uint64_t v4 = (std::string *)(a1 + 7);
  if (*(char *)(a2 + 79) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)(a2 + 56), *(void *)(a2 + 64));
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 56);
    a1[9] = *(void *)(a2 + 72);
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
  }
  uint64_t v6 = *(void *)(a2 + 88);
  a1[10] = *(void *)(a2 + 80);
  a1[11] = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v7 = *(NSObject **)(a2 + 96);
  a1[12] = v7;
  if (v7)
  {
    dispatch_retain(v7);
  }
}

void sub_2637DCD48(_Unwind_Exception *a1)
{
  _Block_object_dispose(*v2, 8);
  _Block_object_dispose(*v1, 8);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_32r40r56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE80c35_ZTSNSt3__110shared_ptrI8RegistryEE96c21_ZTSN8dispatch5queueE(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 96);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 88);
  if (!v3 || atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if ((*(char *)(a1 + 79) & 0x80000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  if (*(char *)(a1 + 79) < 0) {
LABEL_6:
  }
    operator delete(*(void **)(a1 + 56));
LABEL_7:
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  uint64_t v4 = *(const void **)(a1 + 32);

  _Block_object_dispose(v4, 8);
}

void HSFilerRT_Internal::destroySession(uint64_t a1, int a2, uint64_t a3)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = ___ZN18HSFilerRT_Internal14destroySessionE15HSFilerClientIDy_block_invoke;
  v3[3] = &__block_descriptor_tmp_4;
  int v4 = a2;
  v3[4] = a1;
  v3[5] = a3;
  ctu::SharedSynchronizable<HSFilerRT_Internal>::execute_wrapped((uint64_t *)(a1 + 8), (uint64_t)v3);
}

void ___ZN18HSFilerRT_Internal14destroySessionE15HSFilerClientIDy_block_invoke(uint64_t a1)
{
  unint64_t v5 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v1 = *(uint64_t **)(a1 + 32);
  HSFilerRT_Internal::findSession_sync(v1, *(_DWORD *)(a1 + 48), *(void *)(a1 + 40), &v5);
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v2 = (std::__shared_weak_count *)v6;
  v4[0] = v5;
  v4[1] = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  HSFilerRT_Internal::destroySession_sync((uint64_t)v1, v4);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v3 = (std::__shared_weak_count *)v6;
    if (!v6) {
      return;
    }
  }
  else
  {
LABEL_6:
    uint64_t v3 = (std::__shared_weak_count *)v6;
    if (!v6) {
      return;
    }
  }
  if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_2637DCFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

uint64_t *HSFilerRT_Internal::findSession_sync@<X0>(uint64_t *result@<X0>, unsigned int a2@<W1>, unint64_t a3@<X2>, void *a4@<X8>)
{
  if (a2 > 8) {
    goto LABEL_23;
  }
  uint64_t v7 = result;
  long long v9 = (uint64_t **)(result + 6);
  unsigned int v8 = (uint64_t *)result[6];
  if (v8)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v10 = v8;
        unsigned int v11 = *((_DWORD *)v8 + 8);
        if (v11 <= a2) {
          break;
        }
        unsigned int v8 = (uint64_t *)*v10;
        long long v9 = (uint64_t **)v10;
        if (!*v10) {
          goto LABEL_9;
        }
      }
      if (v11 >= a2) {
        break;
      }
      unsigned int v8 = (uint64_t *)v10[1];
      if (!v8)
      {
        long long v9 = (uint64_t **)(v10 + 1);
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v10 = result + 6;
LABEL_9:
    uint64_t v12 = v10;
    uint64_t v10 = operator new(0x40uLL);
    *((_DWORD *)v10 + 8) = a2;
    v10[7] = 0;
    v10[6] = 0;
    v10[5] = v10 + 6;
    void *v10 = 0;
    v10[1] = 0;
    v10[2] = v12;
    *long long v9 = v10;
    uint64_t v13 = *(void *)v7[5];
    unsigned int v14 = v10;
    if (v13)
    {
      v7[5] = v13;
      unsigned int v14 = *v9;
    }
    double result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v7[6], v14);
    ++v7[7];
  }
  int v17 = (void *)v10[6];
  int v16 = v10 + 6;
  dispatch_object_t v15 = v17;
  if (!v17) {
    goto LABEL_23;
  }
  uint64_t v18 = v16;
  do
  {
    unint64_t v19 = v15[4];
    BOOL v20 = v19 >= a3;
    if (v19 >= a3) {
      char v21 = v15;
    }
    else {
      char v21 = v15 + 1;
    }
    if (v20) {
      uint64_t v18 = v15;
    }
    dispatch_object_t v15 = (void *)*v21;
  }
  while (*v21);
  if (v18 != v16 && v18[4] <= a3)
  {
    uint64_t v23 = v18[5];
    uint64_t v22 = v18[6];
    *a4 = v23;
    a4[1] = v22;
    if (v22) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v22 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
LABEL_23:
    *a4 = 0;
    a4[1] = 0;
  }
  return result;
}

void HSFilerRT_Internal::destroySession_sync(uint64_t a1, void *a2)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  int v4 = **(NSObject ***)(a1 + 128);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v5 = hsfiler::support::to_string(*(_DWORD *)(*a2 + 24));
    uint64_t v6 = *(void *)(*a2 + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v67 = v5;
    __int16 v68 = 2048;
    uint64_t v69 = v6;
    _os_log_impl(&dword_2637D5000, v4, OS_LOG_TYPE_DEFAULT, "Destroying client (%s) session (%llu)", buf, 0x16u);
  }
  uint64_t v64 = 0;
  v65 = 0;
  uint64_t v7 = *(std::__shared_weak_count **)(a1 + 200);
  if (!v7 || (v65 = std::__shared_weak_count::lock(v7)) == 0)
  {
LABEL_16:
    unsigned int v14 = (void *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 48);
    unsigned int v15 = *(_DWORD *)(*a2 + 24);
    if (v13) {
      goto LABEL_21;
    }
LABEL_19:
    int v16 = v14;
LABEL_25:
    uint64_t v18 = operator new(0x40uLL);
    v18[8] = v15;
    *((void *)v18 + 7) = 0;
    *((void *)v18 + 6) = 0;
    *((void *)v18 + 5) = v18 + 12;
    *(void *)uint64_t v18 = 0;
    *((void *)v18 + 1) = 0;
    *((void *)v18 + 2) = v16;
    void *v14 = v18;
    uint64_t v19 = **(void **)(a1 + 40);
    BOOL v20 = (uint64_t *)v18;
    if (v19)
    {
      *(void *)(a1 + 40) = v19;
      BOOL v20 = (uint64_t *)*v14;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(a1 + 48), v20);
    ++*(void *)(a1 + 56);
    uint64_t v22 = (void ***)(v18 + 12);
    char v21 = (void ***)*((void *)v18 + 6);
    if (!v21) {
      goto LABEL_129;
    }
    goto LABEL_30;
  }
  uint64_t v8 = *(void *)(a1 + 192);
  uint64_t v64 = v8;
  uint64_t v9 = *a2;
  if (v8 && *(void *)(v8 + 32) == *(void *)(v9 + 32))
  {
    uint64_t v10 = **(NSObject ***)(a1 + 128);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v53 = hsfiler::support::to_string(*(_DWORD *)(v9 + 24));
      uint64_t v54 = *(void *)(*a2 + 32);
      *(_DWORD *)buf = 136315394;
      uint64_t v67 = v53;
      __int16 v68 = 2048;
      uint64_t v69 = v54;
      _os_log_error_impl(&dword_2637D5000, v10, OS_LOG_TYPE_ERROR, "error: Client (%s) destroying session (%llu) while it is currently in progress", buf, 0x16u);
      unsigned int v11 = (std::__shared_weak_count *)a2[1];
      uint64_t v62 = *a2;
      uint64_t v63 = v11;
      if (!v11)
      {
LABEL_10:
        HSFilerRT_Internal::logSessionFileTransferStatus_sync(a1, (uint64_t)&v62);
        if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
        uint64_t v12 = *(std::__shared_weak_count **)(a1 + 200);
        *(void *)(a1 + 192) = 0;
        *(void *)(a1 + 200) = 0;
        if (v12) {
          std::__shared_weak_count::__release_weak(v12);
        }
        HSFilerRT_Internal::resetBaseband_sync(a1, *(_DWORD *)(*a2 + 24), *(void *)(*a2 + 32), -7);
        goto LABEL_16;
      }
    }
    else
    {
      unsigned int v11 = (std::__shared_weak_count *)a2[1];
      uint64_t v62 = v9;
      uint64_t v63 = v11;
      if (!v11) {
        goto LABEL_10;
      }
    }
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    goto LABEL_10;
  }
  unsigned int v14 = (void *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 48);
  unsigned int v15 = *(_DWORD *)(v9 + 24);
  if (!v13) {
    goto LABEL_19;
  }
  while (1)
  {
LABEL_21:
    while (1)
    {
      int v16 = (void *)v13;
      unsigned int v17 = *(_DWORD *)(v13 + 32);
      if (v15 >= v17) {
        break;
      }
      uint64_t v13 = *v16;
      unsigned int v14 = v16;
      if (!*v16) {
        goto LABEL_25;
      }
    }
    if (v17 >= v15) {
      break;
    }
    uint64_t v13 = v16[1];
    if (!v13)
    {
      unsigned int v14 = v16 + 1;
      goto LABEL_25;
    }
  }
  uint64_t v18 = v16;
  uint64_t v22 = (void ***)(v16 + 6);
  char v21 = (void ***)v16[6];
  if (!v21) {
    goto LABEL_129;
  }
LABEL_30:
  unint64_t v23 = *(void *)(*a2 + 32);
  uint64_t v24 = v22;
  long long v25 = v21;
  do
  {
    unint64_t v26 = (unint64_t)v25[4];
    BOOL v27 = v26 >= v23;
    if (v26 >= v23) {
      unint64_t v28 = (void ****)v25;
    }
    else {
      unint64_t v28 = (void ****)(v25 + 1);
    }
    if (v27) {
      uint64_t v24 = v25;
    }
    long long v25 = *v28;
  }
  while (*v28);
  if (v24 == v22 || v23 < (unint64_t)v24[4]) {
    goto LABEL_129;
  }
  uint64_t v29 = v24[1];
  if (v29)
  {
    do
    {
      char v30 = v29;
      uint64_t v29 = (void **)*v29;
    }
    while (v29);
  }
  else
  {
    uint64_t v31 = v24;
    do
    {
      char v30 = v31[2];
      BOOL v43 = *v30 == v31;
      uint64_t v31 = (void ***)v30;
    }
    while (!v43);
  }
  if (*((void ****)v18 + 5) == v24)
  {
    *((void *)v18 + 5) = v30;
    --*((void *)v18 + 7);
    unsigned int v32 = *v24;
    unint64_t v33 = (void **)v24;
    if (!*v24) {
      goto LABEL_52;
    }
  }
  else
  {
    --*((void *)v18 + 7);
    unsigned int v32 = *v24;
    unint64_t v33 = (void **)v24;
    if (!*v24) {
      goto LABEL_52;
    }
  }
  uint64_t v34 = v24[1];
  if (!v34)
  {
    unint64_t v33 = (void **)v24;
    goto LABEL_58;
  }
  do
  {
    unint64_t v33 = v34;
    uint64_t v34 = (void **)*v34;
  }
  while (v34);
LABEL_52:
  unsigned int v32 = (void **)v33[1];
  if (!v32)
  {
    int v35 = 1;
    uint64_t v36 = (void ***)v33[2];
    unint64_t v37 = *v36;
    if (*v36 == v33) {
      goto LABEL_54;
    }
LABEL_59:
    v36[1] = v32;
    int v38 = *((unsigned __int8 *)v33 + 24);
    if (v33 == (void **)v24) {
      goto LABEL_64;
    }
    goto LABEL_60;
  }
LABEL_58:
  int v35 = 0;
  v32[2] = v33[2];
  uint64_t v36 = (void ***)v33[2];
  unint64_t v37 = *v36;
  if (*v36 != v33) {
    goto LABEL_59;
  }
LABEL_54:
  uint64_t *v36 = v32;
  if (v33 != (void **)v21)
  {
    unint64_t v37 = v36[1];
    int v38 = *((unsigned __int8 *)v33 + 24);
    if (v33 == (void **)v24) {
      goto LABEL_64;
    }
LABEL_60:
    uint64_t v39 = v24[2];
    v33[2] = v39;
    v39[*v24[2] != v24] = v33;
    uint64_t v40 = *v24;
    *unint64_t v33 = *v24;
    v40[2] = v33;
    char v41 = v24[1];
    v33[1] = v41;
    if (v41) {
      v41[2] = v33;
    }
    *((unsigned char *)v33 + 24) = *((unsigned char *)v24 + 24);
    if (v21 == v24) {
      char v21 = (void ***)v33;
    }
    goto LABEL_64;
  }
  unint64_t v37 = 0;
  char v21 = (void ***)v32;
  int v38 = *((unsigned __int8 *)v33 + 24);
  if (v33 != (void **)v24) {
    goto LABEL_60;
  }
LABEL_64:
  if (!v38 || !v21) {
    goto LABEL_125;
  }
  if (!v35)
  {
    *((unsigned char *)v32 + 24) = 1;
    goto LABEL_125;
  }
  while (1)
  {
    unint64_t v44 = (void ***)v37[2];
    if (*v44 != v37) {
      break;
    }
    if (*((unsigned char *)v37 + 24))
    {
      uint64_t v46 = *v37;
      if (*v37) {
        goto LABEL_96;
      }
    }
    else
    {
      *((unsigned char *)v37 + 24) = 1;
      *((unsigned char *)v44 + 24) = 0;
      uint64_t v50 = (void **)v37[1];
      *unint64_t v44 = v50;
      if (v50) {
        v50[2] = v44;
      }
      v37[2] = v44[2];
      v44[2][*v44[2] != v44] = v37;
      v37[1] = v44;
      v44[2] = v37;
      if (v21 == v44) {
        char v21 = (void ***)v37;
      }
      unint64_t v37 = *v44;
      uint64_t v46 = **v44;
      if (v46)
      {
LABEL_96:
        if (!v46[24]) {
          goto LABEL_120;
        }
      }
    }
    uint64_t v51 = (uint64_t *)v37[1];
    if (v51 && !*((unsigned char *)v51 + 24))
    {
      if (v46 && !v46[24])
      {
LABEL_120:
        uint64_t v51 = (uint64_t *)v37;
      }
      else
      {
        *((unsigned char *)v51 + 24) = 1;
        *((unsigned char *)v37 + 24) = 0;
        uint64_t v52 = *v51;
        v37[1] = (void *)*v51;
        if (v52) {
          *(void *)(v52 + 16) = v37;
        }
        v51[2] = (uint64_t)v37[2];
        *((void *)v37[2] + (*(void *)v37[2] != (void)v37)) = v51;
        uint64_t *v51 = (uint64_t)v37;
        v37[2] = v51;
        uint64_t v46 = v37;
      }
      uint64_t v56 = v51[2];
      *((unsigned char *)v51 + 24) = *(unsigned char *)(v56 + 24);
      *(unsigned char *)(v56 + 24) = 1;
      v46[24] = 1;
      long long v57 = *(uint64_t **)v56;
      uint64_t v59 = *(void *)(*(void *)v56 + 8);
      *(void *)uint64_t v56 = v59;
      if (v59) {
        *(void *)(v59 + 16) = v56;
      }
      v57[2] = *(void *)(v56 + 16);
      *(void *)(*(void *)(v56 + 16) + 8 * (**(void **)(v56 + 16) != v56)) = v57;
      v57[1] = v56;
      goto LABEL_124;
    }
    *((unsigned char *)v37 + 24) = 0;
    uint64_t v42 = (void ***)v37[2];
    if (*((unsigned char *)v42 + 24)) {
      BOOL v43 = v42 == v21;
    }
    else {
      BOOL v43 = 1;
    }
    if (v43) {
      goto LABEL_108;
    }
LABEL_72:
    unint64_t v37 = (void **)v42[2][*v42[2] == v42];
  }
  if (*((unsigned char *)v37 + 24))
  {
    v45 = *v37;
    if (!*v37)
    {
LABEL_86:
      __int16 v49 = (void **)v37[1];
      if (v49 && !*((unsigned char *)v49 + 24)) {
        goto LABEL_116;
      }
      *((unsigned char *)v37 + 24) = 0;
      uint64_t v42 = (void ***)v37[2];
      if (v42 == v21)
      {
        uint64_t v42 = v21;
LABEL_108:
        *((unsigned char *)v42 + 24) = 1;
        goto LABEL_125;
      }
      if (!*((unsigned char *)v42 + 24)) {
        goto LABEL_108;
      }
      goto LABEL_72;
    }
  }
  else
  {
    *((unsigned char *)v37 + 24) = 1;
    *((unsigned char *)v44 + 24) = 0;
    __int16 v47 = (void ****)v44[1];
    uint64_t v48 = (void **)*v47;
    v44[1] = (void **)*v47;
    if (v48) {
      v48[2] = v44;
    }
    v47[2] = (void ***)v44[2];
    v44[2][*v44[2] != v44] = v47;
    *__int16 v47 = v44;
    v44[2] = (void **)v47;
    if (v21 == *v37) {
      char v21 = (void ***)v37;
    }
    unint64_t v37 = (void **)*((void *)*v37 + 1);
    v45 = *v37;
    if (!*v37) {
      goto LABEL_86;
    }
  }
  if (*((unsigned char *)v45 + 24)) {
    goto LABEL_86;
  }
  __int16 v49 = (void **)v37[1];
  if (v49 && !*((unsigned char *)v49 + 24))
  {
LABEL_116:
    v45 = v37;
  }
  else
  {
    *((unsigned char *)v45 + 24) = 1;
    *((unsigned char *)v37 + 24) = 0;
    long long v55 = (void *)v45[1];
    *unint64_t v37 = v55;
    if (v55) {
      v55[2] = v37;
    }
    v45[2] = v37[2];
    *((void *)v37[2] + (*(void *)v37[2] != (void)v37)) = v45;
    v45[1] = v37;
    v37[2] = v45;
    __int16 v49 = v37;
  }
  uint64_t v56 = v45[2];
  *((unsigned char *)v45 + 24) = *(unsigned char *)(v56 + 24);
  *(unsigned char *)(v56 + 24) = 1;
  *((unsigned char *)v49 + 24) = 1;
  long long v57 = *(uint64_t **)(v56 + 8);
  uint64_t v58 = *v57;
  *(void *)(v56 + 8) = *v57;
  if (v58) {
    *(void *)(v58 + 16) = v56;
  }
  v57[2] = *(void *)(v56 + 16);
  *(void *)(*(void *)(v56 + 16) + 8 * (**(void **)(v56 + 16) != v56)) = v57;
  *long long v57 = v56;
LABEL_124:
  *(void *)(v56 + 16) = v57;
LABEL_125:
  unsigned int v60 = (std::__shared_weak_count *)v24[6];
  if (v60 && !atomic_fetch_add(&v60->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
    std::__shared_weak_count::__release_weak(v60);
  }
  operator delete(v24);
LABEL_129:
  v61 = v65;
  if (v65)
  {
    if (!atomic_fetch_add(&v65->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }
}

void sub_2637DD91C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2637DD930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2637DD944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_2637DD960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL HSFilerRT_Internal::queueSession(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t *a4, const void **a5, int a6)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v7 = *a5;
  if (!*a5)
  {
    unsigned int v17 = **(NSObject ***)(a1 + 128);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      int v16 = "error: NULL sessionCb param";
      uint64_t v18 = v17;
      uint32_t v19 = 2;
      goto LABEL_37;
    }
    return 0;
  }
  uint64_t v12 = *a4;
  uint64_t v11 = a4[1];
  if (*a4 != v11)
  {
    if (0xAAAAAAAAAAAAAAABLL * ((v11 - v12) >> 3) > 0x1E)
    {
      uint64_t v13 = **(NSObject ***)(a1 + 128);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        unsigned int v14 = hsfiler::support::to_string(a2);
        unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3);
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a3;
        *(_WORD *)&buf[22] = 2048;
        BOOL v43 = (void *)v15;
        LOWORD(v44) = 1024;
        *(_DWORD *)((char *)&v44 + 2) = 30;
        int v16 = "error: Failed client (%s) queue session (%llu): num files (%lu) > max allowed (%d)";
        goto LABEL_36;
      }
      return 0;
    }
    do
    {
      if (*(char *)(v12 + 23) < 0)
      {
        if (*(void *)(v12 + 8) >= 0x65uLL) {
          goto LABEL_15;
        }
      }
      else if (*(unsigned __int8 *)(v12 + 23) >= 0x65uLL)
      {
LABEL_15:
        uint64_t v13 = **(NSObject ***)(a1 + 128);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          return 0;
        }
        unint64_t v23 = hsfiler::support::to_string(a2);
        if (*(char *)(v12 + 23) < 0) {
          uint64_t v24 = *(void **)(v12 + 8);
        }
        else {
          uint64_t v24 = (void *)*(unsigned __int8 *)(v12 + 23);
        }
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v23;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a3;
        *(_WORD *)&buf[22] = 2048;
        BOOL v43 = v24;
        LOWORD(v44) = 1024;
        *(_DWORD *)((char *)&v44 + 2) = 100;
        int v16 = "error: Failed client (%s) queue session (%llu) fileID length (%lu) > max allowed (%d)";
LABEL_36:
        uint64_t v18 = v13;
        uint32_t v19 = 38;
LABEL_37:
        _os_log_error_impl(&dword_2637D5000, v18, OS_LOG_TYPE_ERROR, v16, buf, v19);
        return 0;
      }
      v12 += 24;
    }
    while (v12 != v11);
    long long v25 = **(NSObject ***)(a1 + 128);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = hsfiler::support::to_string(a2);
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a3;
      _os_log_impl(&dword_2637D5000, v25, OS_LOG_TYPE_DEFAULT, "Queueing client (%s) session (%llu)", buf, 0x16u);
      uint64_t v7 = *a5;
    }
    uint64_t v37 = 0;
    int v38 = &v37;
    uint64_t v39 = 0x2000000000;
    char v40 = 0;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 1174405120;
    v33[2] = ___ZN18HSFilerRT_Internal12queueSessionE15HSFilerClientIDyRKNSt3__16vectorINS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS6_IS8_EEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusEEEj_block_invoke;
    v33[3] = &__block_descriptor_tmp_9_0;
    unsigned int v35 = a2;
    v33[5] = a1;
    v33[6] = a3;
    v33[7] = a4;
    if (v7) {
      unint64_t v26 = _Block_copy(v7);
    }
    else {
      unint64_t v26 = 0;
    }
    int v36 = a6;
    aBlocuint64_t k = v26;
    v33[4] = &v37;
    char v41 = v33;
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 0x40000000;
    *(void *)&uint8_t buf[16] = ___ZNK3ctu20SharedSynchronizableI18HSFilerRT_InternalE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
    BOOL v43 = &__block_descriptor_tmp_83;
    uint64_t v44 = a1 + 8;
    v45 = &v41;
    BOOL v27 = *(NSObject **)(a1 + 24);
    if (*(void *)(a1 + 32))
    {
      dispatch_async_and_wait(v27, buf);
      if (*((unsigned char *)v38 + 24)) {
        goto LABEL_25;
      }
    }
    else
    {
      dispatch_sync(v27, buf);
      if (*((unsigned char *)v38 + 24))
      {
LABEL_25:
        unint64_t v28 = **(NSObject ***)(a1 + 128);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = hsfiler::support::to_string(a2);
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = v29;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = a3;
          _os_log_impl(&dword_2637D5000, v28, OS_LOG_TYPE_DEFAULT, "Queued client (%s) session (%llu)", buf, 0x16u);
          BOOL v30 = *((unsigned char *)v38 + 24) != 0;
          uint64_t v31 = aBlock;
          if (!aBlock) {
            goto LABEL_33;
          }
        }
        else
        {
          BOOL v30 = 1;
          uint64_t v31 = aBlock;
          if (!aBlock)
          {
LABEL_33:
            _Block_object_dispose(&v37, 8);
            return v30;
          }
        }
LABEL_32:
        _Block_release(v31);
        goto LABEL_33;
      }
    }
    BOOL v30 = 0;
    uint64_t v31 = aBlock;
    if (!aBlock) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  BOOL v20 = **(NSObject ***)(a1 + 128);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = hsfiler::support::to_string(a2);
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    int v16 = "error: Failed client (%s) queue session (%llu): fileIDs empty";
    uint64_t v18 = v20;
    uint32_t v19 = 22;
    goto LABEL_37;
  }
  return 0;
}

void sub_2637DDE3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *aBlock, uint64_t a19, char a20)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  _Block_object_dispose(&a20, 8);
  _Unwind_Resume(a1);
}

void sub_2637DDE60(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void ___ZN18HSFilerRT_Internal12queueSessionE15HSFilerClientIDyRKNSt3__16vectorINS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS6_IS8_EEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusEEEj_block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  unint64_t v36 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v2 = *(void *)(a1 + 40);
  HSFilerRT_Internal::findSession_sync((uint64_t *)v2, *(_DWORD *)(a1 + 72), *(void *)(a1 + 48), &v36);
  unint64_t v3 = v36;
  if (!v36) {
    goto LABEL_38;
  }
  if (*(unsigned char *)(v36 + 113))
  {
    int v4 = **(NSObject ***)(v2 + 128);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      unint64_t v5 = hsfiler::support::to_string(*(_DWORD *)(a1 + 72));
      std::string::size_type v6 = *(void *)(a1 + 48);
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v5;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v6;
      _os_log_error_impl(&dword_2637D5000, v4, OS_LOG_TYPE_ERROR, "error: Failed client (%s) queue session (%llu): already queued", (uint8_t *)&buf, 0x16u);
    }
    goto LABEL_38;
  }
  uint64_t v30 = a1;
  uint64_t v7 = *(uint64_t **)(a1 + 56);
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];
  if (*v7 != v9)
  {
    do
    {
      buf.__r_.__value_.__r.__words[0] = v8;
      *((unsigned char *)std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v3 + 40, v8, (long long **)&buf)+ 40) = 0;
      uint64_t v11 = **(NSObject ***)(v2 + 128);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        std::string::size_type v12 = v8;
        if (*(char *)(v8 + 23) < 0) {
          std::string::size_type v12 = *(void *)v8;
        }
        std::string::size_type v10 = *(void *)(v3 + 32);
        LODWORD(buf.__r_.__value_.__l.__data_) = 134218242;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v10;
        WORD2(buf.__r_.__value_.__r.__words[1]) = 2080;
        *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v12;
        _os_log_impl(&dword_2637D5000, v11, OS_LOG_TYPE_DEFAULT, "Session (%llu) added file (%s)", (uint8_t *)&buf, 0x16u);
      }
      v8 += 24;
    }
    while (v8 != v9);
  }
  uint64_t v13 = *(void **)(v30 + 64);
  if (v13) {
    uint64_t v13 = _Block_copy(v13);
  }
  unsigned int v14 = *(const void **)(v3 + 88);
  *(void *)(v3 + 88) = v13;
  if (v14) {
    _Block_release(v14);
  }
  std::to_string(&v35, *(void *)(v3 + 32));
  unint64_t v15 = std::string::insert(&v35, 0, "Session ", 8uLL);
  long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  buf.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
  *(_OWORD *)&buf.__r_.__value_.__l.__data_ = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  unsigned int v17 = std::string::append(&buf, " timer", 6uLL);
  uint64_t v18 = (std::string::value_type *)v17->__r_.__value_.__r.__words[0];
  std::string::size_type size = v17->__r_.__value_.__l.__size_;
  std::string::size_type v20 = v17->__r_.__value_.__r.__words[2];
  v17->__r_.__value_.__l.__size_ = 0;
  v17->__r_.__value_.__r.__words[2] = 0;
  v17->__r_.__value_.__r.__words[0] = 0;
  if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v35.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_18;
    }
LABEL_21:
    operator delete(v35.__r_.__value_.__l.__data_);
    uint64_t v21 = *(void *)(v2 + 160);
    if ((v20 & 0x8000000000000000) == 0) {
      goto LABEL_19;
    }
LABEL_22:
    std::string::__init_copy_ctor_external(&v33, v18, size);
    goto LABEL_23;
  }
  operator delete(buf.__r_.__value_.__l.__data_);
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_21;
  }
LABEL_18:
  uint64_t v21 = *(void *)(v2 + 160);
  if ((v20 & 0x8000000000000000) != 0) {
    goto LABEL_22;
  }
LABEL_19:
  v33.__r_.__value_.__r.__words[0] = (std::string::size_type)v18;
  v33.__r_.__value_.__l.__size_ = size;
  v33.__r_.__value_.__r.__words[2] = v20;
LABEL_23:
  unsigned int v22 = *(_DWORD *)(v30 + 76);
  std::string::size_type v23 = *(void *)(v2 + 24);
  if (v23) {
    dispatch_retain(*(dispatch_object_t *)(v2 + 24));
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN18HSFilerRT_Internal12queueSessionE15HSFilerClientIDyRKNSt3__16vectorINS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS6_IS8_EEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusEEEj_block_invoke_7;
  aBlock[3] = &__block_descriptor_tmp_8_0;
  int v32 = *(_DWORD *)(v30 + 72);
  uint64_t v24 = *(void *)(v30 + 48);
  aBlock[4] = v2;
  aBlock[5] = v24;
  long long v25 = _Block_copy(aBlock);
  std::string buf = v33;
  memset(&v33, 0, sizeof(v33));
  v35.__r_.__value_.__r.__words[0] = v23;
  int v38 = v25;
  (*(void (**)(uint64_t *__return_ptr, uint64_t, std::string *, void, uint64_t, void, std::string *, const void **))(*(void *)v21 + 16))(&v34, v21, &buf, 0, 1000000 * v22, 0, &v35, &v38);
  if (v38) {
    _Block_release(v38);
  }
  if (v35.__r_.__value_.__r.__words[0]) {
    dispatch_release((dispatch_object_t)v35.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(buf.__r_.__value_.__l.__data_);
  }
  uint64_t v26 = v34;
  uint64_t v34 = 0;
  uint64_t v27 = *(void *)(v3 + 104);
  *(void *)(v3 + 104) = v26;
  if (v27)
  {
    (*(void (**)(uint64_t))(*(void *)v27 + 8))(v27);
    uint64_t v28 = v34;
    uint64_t v34 = 0;
    if (v28) {
      (*(void (**)(uint64_t))(*(void *)v28 + 8))(v28);
    }
  }
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v33.__r_.__value_.__l.__data_);
  }
  *(unsigned char *)(v3 + 113) = 1;
  HSFilerRT_Internal::sessionScheduler_sync((HSFilerRT_Internal *)v2);
  *(unsigned char *)(*(void *)(*(void *)(v30 + 32) + 8) + 24) = 1;
  if ((v20 & 0x8000000000000000) != 0) {
    operator delete(v18);
  }
LABEL_38:
  uint64_t v29 = (std::__shared_weak_count *)v37;
  if (v37)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(v37 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
}

void sub_2637DE31C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,dispatch_object_t object,uint64_t a29,int a30,__int16 a31,char a32,char a33,char a34)
{
  if (v35 < 0)
  {
    operator delete(v34);
    std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a34);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a34);
  _Unwind_Resume(a1);
}

void ___ZN18HSFilerRT_Internal12queueSessionE15HSFilerClientIDyRKNSt3__16vectorINS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS6_IS8_EEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusEEEj_block_invoke_7(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 48);
  unint64_t v3 = *(HSFilerRT_Internal **)(a1 + 32);
  unint64_t v2 = *(void *)(a1 + 40);
  char v4 = 0;
  HSFilerRT_Internal::abortSession_sync((uint64_t)v3, v1, v2, -2, &v4);
  if (v4)
  {
    HSFilerRT_Internal::resetBaseband_sync((uint64_t)v3, v1, v2, -2);
  }
  else
  {
    HSFilerRT_Internal::sessionScheduler_sync(v3);
  }
}

void HSFilerRT_Internal::handleSessionError_sync(HSFilerRT_Internal *a1, unsigned int a2, unint64_t a3, int a4)
{
  char v8 = 0;
  HSFilerRT_Internal::abortSession_sync((uint64_t)a1, a2, a3, a4, &v8);
  if (v8 && ((a4 + 10) <= 8 && ((1 << (a4 + 10)) & 0x137) != 0 || a4 == 0x7FFFFFFF))
  {
    HSFilerRT_Internal::resetBaseband_sync((uint64_t)a1, a2, a3, a4);
  }
  else
  {
    HSFilerRT_Internal::sessionScheduler_sync(a1);
  }
}

void HSFilerRT_Internal::sessionScheduler_sync(HSFilerRT_Internal *this)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)this + 25);
  if ((!v2 || *(void *)(v2 + 8) == -1) && !*((unsigned char *)this + 216))
  {
    unint64_t v3 = (uint64_t *)*((void *)this + 5);
    char v4 = (uint64_t **)((char *)this + 48);
    if (v3 != (uint64_t *)((char *)this + 48))
    {
      unint64_t v5 = -1;
      unsigned int v6 = -1;
      do
      {
        if (v3[7])
        {
          uint64_t v7 = (uint64_t *)v3[5];
          if (v7 != v3 + 6)
          {
            unint64_t v8 = 0;
            do
            {
              uint64_t v9 = (uint64_t *)v7[1];
              std::string::size_type v10 = v7;
              if (v9)
              {
                do
                {
                  uint64_t v11 = v9;
                  uint64_t v9 = (uint64_t *)*v9;
                }
                while (v9);
              }
              else
              {
                do
                {
                  uint64_t v11 = (uint64_t *)v10[2];
                  BOOL v12 = *v11 == (void)v10;
                  std::string::size_type v10 = v11;
                }
                while (!v12);
              }
              v8 += *(unsigned __int8 *)(v7[5] + 113);
              uint64_t v7 = v11;
            }
            while (v11 != v3 + 6);
            if (v8 && v8 < v5)
            {
              unsigned int v6 = *((_DWORD *)v3 + 8);
              unint64_t v5 = v8;
            }
          }
        }
        uint64_t v13 = (uint64_t *)v3[1];
        if (v13)
        {
          do
          {
            unsigned int v14 = (uint64_t **)v13;
            uint64_t v13 = (uint64_t *)*v13;
          }
          while (v13);
        }
        else
        {
          do
          {
            unsigned int v14 = (uint64_t **)v3[2];
            BOOL v12 = *v14 == v3;
            unint64_t v3 = (uint64_t *)v14;
          }
          while (!v12);
        }
        unint64_t v3 = (uint64_t *)v14;
      }
      while (v14 != v4);
      if (v6 != -1)
      {
        unint64_t v15 = *v4;
        long long v16 = (uint64_t **)((char *)this + 48);
        if (*v4)
        {
          while (1)
          {
            while (1)
            {
              long long v16 = (uint64_t **)v15;
              unsigned int v17 = *((_DWORD *)v15 + 8);
              if (v6 >= v17) {
                break;
              }
              unint64_t v15 = *v16;
              char v4 = v16;
              if (!*v16) {
                goto LABEL_35;
              }
            }
            if (v17 >= v6) {
              break;
            }
            unint64_t v15 = v16[1];
            if (!v15)
            {
              char v4 = v16 + 1;
              goto LABEL_35;
            }
          }
        }
        else
        {
LABEL_35:
          uint64_t v18 = (char *)v16;
          long long v16 = (uint64_t **)operator new(0x40uLL);
          *((_DWORD *)v16 + 8) = v6;
          v16[7] = 0;
          v16[6] = 0;
          v16[5] = (uint64_t *)(v16 + 6);
          const char *v16 = 0;
          v16[1] = 0;
          uint64_t v16[2] = (uint64_t *)v18;
          *char v4 = (uint64_t *)v16;
          uint64_t v19 = **((void **)this + 5);
          std::string::size_type v20 = (uint64_t *)v16;
          if (v19)
          {
            *((void *)this + 5) = v19;
            std::string::size_type v20 = *v4;
          }
          std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)this + 6), v20);
          ++*((void *)this + 7);
        }
        uint64_t v21 = v16[5];
        uint64_t v23 = v21[5];
        unsigned int v22 = (std::__shared_weak_count *)v21[6];
        if (v22) {
          atomic_fetch_add_explicit(&v22->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v24 = (std::__shared_weak_count *)*((void *)this + 25);
        *((void *)this + 24) = v23;
        *((void *)this + 25) = v22;
        if (v24)
        {
          std::__shared_weak_count::__release_weak(v24);
          unsigned int v22 = (std::__shared_weak_count *)*((void *)this + 25);
        }
        if (v22)
        {
          long long v25 = std::__shared_weak_count::lock(v22);
          __dst[4] = v25;
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *((void *)this + 24);
            __dst[3] = (void *)v27;
            if (v27)
            {
              memset(__dst, 170, 24);
              if (*(unsigned char *)(v27 + 112)) {
                uint64_t v28 = "read";
              }
              else {
                uint64_t v28 = "write";
              }
              if (*(unsigned char *)(v27 + 112)) {
                size_t v29 = 4;
              }
              else {
                size_t v29 = 5;
              }
              HIBYTE(__dst[2]) = v29;
              memcpy(__dst, v28, v29);
              *(unsigned char *)((unint64_t)__dst | v29) = 0;
              uint64_t v30 = **((void **)this + 16);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v31 = hsfiler::support::to_string(v6);
                int v32 = __dst;
                if (SHIBYTE(__dst[2]) < 0) {
                  int v32 = (void **)__dst[0];
                }
                std::string v33 = *(void **)(v27 + 32);
                *(_DWORD *)std::string buf = 136315650;
                *(void *)&uint8_t buf[4] = v31;
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = v32;
                *(_WORD *)&buf[22] = 2048;
                unint64_t v36 = v33;
                _os_log_impl(&dword_2637D5000, v30, OS_LOG_TYPE_DEFAULT, "Scheduling client (%s) %s session (%llu)", buf, 0x20u);
              }
              *(void *)std::string buf = MEMORY[0x263EF8330];
              *(void *)&buf[8] = 0x40000000;
              *(void *)&uint8_t buf[16] = ___ZN18HSFilerRT_Internal12startSessionEv_block_invoke;
              unint64_t v36 = &__block_descriptor_tmp_12;
              unint64_t v37 = this;
              ctu::SharedSynchronizable<HSFilerRT_Internal>::execute_wrapped((uint64_t *)this + 1, (uint64_t)buf);
              if (SHIBYTE(__dst[2]) < 0) {
                operator delete(__dst[0]);
              }
            }
            if (!atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
              std::__shared_weak_count::__release_weak(v26);
            }
          }
        }
      }
    }
  }
}

void sub_2637DE958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_32r64c58_ZTSN8dispatch5blockIU13block_pointerFvy13HSFilerStatusEEE(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  double result = *(void **)(a2 + 64);
  if (result) {
    double result = _Block_copy(result);
  }
  *(void *)(a1 + 64) = result;
  return result;
}

void __destroy_helper_block_e8_32r64c58_ZTSN8dispatch5blockIU13block_pointerFvy13HSFilerStatusEEE(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 64);
  if (v2) {
    _Block_release(v2);
  }
  unint64_t v3 = *(const void **)(a1 + 32);

  _Block_object_dispose(v3, 8);
}

BOOL HSFilerRT_Internal::removeSessionFromQueue(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  unsigned int v6 = **(NSObject ***)(a1 + 128);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = hsfiler::support::to_string(a2);
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    _os_log_impl(&dword_2637D5000, v6, OS_LOG_TYPE_DEFAULT, "Removing client (%s) session (%llu) from queue", buf, 0x16u);
  }
  uint64_t v14 = 0;
  unint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000;
  char v17 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = ___ZN18HSFilerRT_Internal22removeSessionFromQueueE15HSFilerClientIDy_block_invoke;
  v12[3] = &__block_descriptor_tmp_10_1;
  v12[5] = a1;
  v12[6] = a3;
  unsigned int v13 = a2;
  v12[4] = &v14;
  uint64_t v18 = v12;
  *(void *)std::string buf = MEMORY[0x263EF8330];
  *(void *)&buf[8] = 0x40000000;
  *(void *)&uint8_t buf[16] = ___ZNK3ctu20SharedSynchronizableI18HSFilerRT_InternalE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  std::string::size_type v20 = &__block_descriptor_tmp_83;
  uint64_t v21 = a1 + 8;
  unsigned int v22 = &v18;
  uint64_t v7 = *(NSObject **)(a1 + 24);
  if (*(void *)(a1 + 32))
  {
    dispatch_async_and_wait(v7, buf);
    if (*((unsigned char *)v15 + 24)) {
      goto LABEL_5;
    }
LABEL_8:
    BOOL v10 = 0;
    goto LABEL_10;
  }
  dispatch_sync(v7, buf);
  if (!*((unsigned char *)v15 + 24)) {
    goto LABEL_8;
  }
LABEL_5:
  unint64_t v8 = **(NSObject ***)(a1 + 128);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = hsfiler::support::to_string(a2);
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    _os_log_impl(&dword_2637D5000, v8, OS_LOG_TYPE_DEFAULT, "Removed client (%s) session (%llu) from queue", buf, 0x16u);
    BOOL v10 = *((unsigned char *)v15 + 24) != 0;
  }
  else
  {
    BOOL v10 = 1;
  }
LABEL_10:
  _Block_object_dispose(&v14, 8);
  return v10;
}

void sub_2637DEC48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZN18HSFilerRT_Internal22removeSessionFromQueueE15HSFilerClientIDy_block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  unint64_t v3 = *(std::__shared_weak_count **)(v2 + 200);
  if (!v3
    || (char v4 = std::__shared_weak_count::lock(v3), (v21 = v4) == 0)
    || (uint64_t v5 = *(void *)(v2 + 192), (v20 = v5) == 0))
  {
    unint64_t v6 = *(void *)(a1 + 48);
    goto LABEL_11;
  }
  unint64_t v6 = *(void *)(a1 + 48);
  if (*(void *)(v5 + 32) != v6) {
    goto LABEL_11;
  }
  if (!*(unsigned char *)(v5 + 114))
  {
    unint64_t v6 = *(void *)(v5 + 32);
LABEL_11:
    unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
    HSFilerRT_Internal::findSession_sync((uint64_t *)v2, *(_DWORD *)(a1 + 56), v6, &v17);
    if (v17)
    {
      (*(void (**)(unint64_t))(*(void *)v17 + 16))(v17);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      BOOL v10 = (atomic_ullong *)v18;
      if (!v18) {
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v11 = **(NSObject ***)(v2 + 128);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        unsigned int v13 = hsfiler::support::to_string(*(_DWORD *)(a1 + 56));
        uint64_t v14 = *(void *)(a1 + 48);
        *(_DWORD *)std::string buf = 136315394;
        uint64_t v23 = v13;
        __int16 v24 = 2048;
        uint64_t v25 = v14;
        _os_log_error_impl(&dword_2637D5000, v11, OS_LOG_TYPE_ERROR, "error: Unable to find client (%s) session (%llu): this should never happen", buf, 0x16u);
        BOOL v10 = (atomic_ullong *)v18;
        if (!v18) {
          goto LABEL_19;
        }
      }
      else
      {
        BOOL v10 = (atomic_ullong *)v18;
        if (!v18) {
          goto LABEL_19;
        }
      }
    }
    if (atomic_fetch_add(v10 + 1, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_19;
    }
    (*(void (**)(atomic_ullong *))(*v10 + 16))(v10);
    uint64_t v9 = (std::__shared_weak_count *)v10;
    goto LABEL_18;
  }
  uint64_t v7 = (atomic_ullong *)v4;
  unint64_t v8 = **(NSObject ***)(v2 + 128);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    unint64_t v15 = hsfiler::support::to_string(*(_DWORD *)(a1 + 56));
    uint64_t v16 = *(void *)(a1 + 48);
    *(_DWORD *)std::string buf = 136315394;
    uint64_t v23 = v15;
    __int16 v24 = 2048;
    uint64_t v25 = v16;
    _os_log_error_impl(&dword_2637D5000, v8, OS_LOG_TYPE_ERROR, "error: Failed client (%s) remove session (%llu): session is in progress", buf, 0x16u);
  }
  v19[0] = v5;
  v19[1] = v7;
  atomic_fetch_add_explicit(v7 + 1, 1uLL, memory_order_relaxed);
  HSFilerRT_Internal::logSessionFileTransferStatus_sync(v2, (uint64_t)v19);
  if (!atomic_fetch_add(v7 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(atomic_ullong *))(*v7 + 16))(v7);
    uint64_t v9 = (std::__shared_weak_count *)v7;
LABEL_18:
    std::__shared_weak_count::__release_weak(v9);
  }
LABEL_19:
  BOOL v12 = v21;
  if (v21)
  {
    if (!atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

void sub_2637DEF34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2637DEF48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_2637DEF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void HSFilerRT_Internal::logSessionFileTransferStatus_sync(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  for (uint64_t i = *(uint64_t **)(*(void *)a2 + 56); i; uint64_t i = (uint64_t *)*i)
  {
    uint64_t v7 = **(NSObject ***)(a1 + 128);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unint64_t v8 = i + 2;
      uint64_t v9 = hsfiler::support::to_string(*(_DWORD *)(*(void *)a2 + 24));
      if (*((char *)i + 39) < 0) {
        unint64_t v8 = (void *)*v8;
      }
      uint64_t v5 = *(void *)(*(void *)a2 + 32);
      uint64_t v6 = "transferred";
      if (!*((unsigned char *)i + 40)) {
        uint64_t v6 = "not transferred";
      }
      *(_DWORD *)std::string buf = 136315906;
      uint64_t v11 = v9;
      __int16 v12 = 2048;
      uint64_t v13 = v5;
      __int16 v14 = 2080;
      unint64_t v15 = v8;
      __int16 v16 = 2080;
      unint64_t v17 = v6;
      _os_log_impl(&dword_2637D5000, v7, OS_LOG_TYPE_INFO, "Client (%s) session (%llu): file (%s) %s", buf, 0x2Au);
    }
  }
}

void HSFilerRT_Internal::startSession(HSFilerRT_Internal *this)
{
  v1[0] = MEMORY[0x263EF8330];
  v1[1] = 0x40000000;
  v1[2] = ___ZN18HSFilerRT_Internal12startSessionEv_block_invoke;
  v1[3] = &__block_descriptor_tmp_12;
  v1[4] = this;
  ctu::SharedSynchronizable<HSFilerRT_Internal>::execute_wrapped((uint64_t *)this + 1, (uint64_t)v1);
}

void ___ZN18HSFilerRT_Internal12startSessionEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v21 = 0;
  unsigned int v22 = 0;
  uint64_t v2 = *(std::__shared_weak_count **)(v1 + 200);
  if (v2)
  {
    unsigned int v22 = std::__shared_weak_count::lock(v2);
    if (!v22) {
      return;
    }
    uint64_t v3 = *(void *)(v1 + 192);
    uint64_t v21 = v3;
    if (v3)
    {
      if (!*(unsigned char *)(v3 + 113))
      {
        uint64_t v6 = *(std::__shared_weak_count **)(v1 + 200);
        *(void *)(v1 + 192) = 0;
        *(void *)(v1 + 200) = 0;
        if (v6) {
          std::__shared_weak_count::__release_weak(v6);
        }
        HSFilerRT_Internal::sessionScheduler_sync((HSFilerRT_Internal *)v1);
        goto LABEL_17;
      }
      if (*(unsigned char *)(v3 + 114)) {
        goto LABEL_6;
      }
      uint64_t v7 = v21;
      *(_DWORD *)(v21 + 96) = atomic_fetch_add((atomic_uint *volatile)(v1 + 184), 1u) + 1;
      if (*(unsigned char *)(v7 + 112))
      {
        uint64_t v19 = v7;
        uint64_t v20 = v22;
        if (v22) {
          atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        int v8 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v1 + 16))(v1, &v19);
        uint64_t v9 = v20;
        if (!v20) {
          goto LABEL_25;
        }
      }
      else
      {
        uint64_t v17 = v7;
        uint64_t v18 = v22;
        if (v22) {
          atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        int v8 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v1 + 24))(v1, &v17);
        uint64_t v9 = v18;
        if (!v18) {
          goto LABEL_25;
        }
      }
      if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
        if (v8)
        {
LABEL_28:
          uint64_t v11 = v21;
          uint64_t v12 = *(void *)(v21 + 32);
          v14[0] = MEMORY[0x263EF8330];
          v14[1] = 1174405120;
          v14[2] = ___ZN18HSFilerRT_Internal12startSessionEv_block_invoke_2;
          v14[3] = &__block_descriptor_tmp_11_0;
          v14[4] = v21;
          unint64_t v15 = v22;
          if (v22) {
            atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          uint64_t v16 = v12;
          dispatch_async(*(dispatch_queue_t *)(v11 + 80), v14);
          *(unsigned char *)(v11 + 114) = 1;
          uint64_t v13 = v15;
          if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
            std::__shared_weak_count::__release_weak(v13);
          }
          goto LABEL_17;
        }
LABEL_6:
        uint64_t v4 = *(unsigned int *)(v21 + 24);
        unint64_t v5 = *(void *)(v21 + 32);
        char v23 = 0;
        HSFilerRT_Internal::abortSession_sync(v1, v4, v5, -5, &v23);
        if (v23) {
          HSFilerRT_Internal::resetBaseband_sync(v1, v4, v5, 4294967291);
        }
        else {
          HSFilerRT_Internal::sessionScheduler_sync((HSFilerRT_Internal *)v1);
        }
        goto LABEL_17;
      }
LABEL_25:
      if (v8) {
        goto LABEL_28;
      }
      goto LABEL_6;
    }
  }
LABEL_17:
  BOOL v10 = v22;
  if (v22)
  {
    if (!atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

void sub_2637DF450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](v8 - 56);
  _Unwind_Resume(a1);
}

void sub_2637DF46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](v10 - 56);
  _Unwind_Resume(a1);
}

void sub_2637DF488(_Unwind_Exception *a1)
{
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](v1 - 56);
  _Unwind_Resume(a1);
}

uint64_t ___ZN18HSFilerRT_Internal12startSessionEv_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(*(void *)(a1 + 32) + 88) + 16))(*(void *)(*(void *)(a1 + 32) + 88), *(void *)(a1 + 48), 0);
}

uint64_t __copy_helper_block_e8_32c56_ZTSNSt3__110shared_ptrIN18HSFilerRT_Internal7SessionEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_32c56_ZTSNSt3__110shared_ptrIN18HSFilerRT_Internal7SessionEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

BOOL HSFilerRT_Internal::read(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void **a5, void *a6)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (*a5)
  {
    uint64_t v35 = 0;
    unint64_t v36 = &v35;
    uint64_t v37 = 0x2000000000;
    char v38 = 0;
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 1107296256;
    uint64_t v28 = ___ZN18HSFilerRT_Internal4readE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFvPKvmEEE_block_invoke;
    size_t v29 = &__block_descriptor_tmp_15_0;
    int v34 = a2;
    uint64_t v32 = a3;
    uint64_t v33 = a4;
    uint64_t v30 = &v35;
    uint64_t v31 = a1;
    uint64_t v39 = &v26;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZNK3ctu20SharedSynchronizableI18HSFilerRT_InternalE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
    block[3] = &__block_descriptor_tmp_83;
    block[4] = a1 + 8;
    void block[5] = &v39;
    uint64_t v12 = *(NSObject **)(a1 + 24);
    if (*(void *)(a1 + 32))
    {
      dispatch_async_and_wait(v12, block);
      BOOL v13 = *((unsigned char *)v36 + 24) != 0;
      if (!*((unsigned char *)v36 + 24)) {
        goto LABEL_23;
      }
    }
    else
    {
      dispatch_sync(v12, block);
      BOOL v13 = *((unsigned char *)v36 + 24) != 0;
      if (!*((unsigned char *)v36 + 24)) {
        goto LABEL_23;
      }
    }
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 1174405120;
    v41[2] = ___ZN18HSFilerRT_Internal4readE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFvPKvmEEE_block_invoke_16;
    v41[3] = &__block_descriptor_tmp_31;
    v41[4] = a1;
    v41[5] = a3;
    int v46 = a2;
    unint64_t v15 = *a5;
    if (*a5) {
      unint64_t v15 = _Block_copy(v15);
    }
    aBlocuint64_t k = v15;
    uint64_t v43 = a4;
    uint64_t v16 = a6[3];
    if (v16)
    {
      if ((void *)v16 == a6)
      {
        v45 = v44;
        (*(void (**)(void *, void *))(*a6 + 24))(a6, v44);
        goto LABEL_16;
      }
      uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 16))(v16);
    }
    v45 = (void *)v16;
LABEL_16:
    ctu::SharedSynchronizable<HSFilerRT_Internal>::execute_wrapped((uint64_t *)(a1 + 8), (uint64_t)v41);
    if (v45 != v44)
    {
      if (v45) {
        (*(void (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*v45 + 40))(v45, v17, v18, v19, v20, v21, v22, v23, v26, v27);
      }
      __int16 v24 = aBlock;
      if (!aBlock) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    (*(void (**)(void *))(v44[0] + 32))(v44);
    __int16 v24 = aBlock;
    if (aBlock) {
LABEL_22:
    }
      _Block_release(v24);
LABEL_23:
    _Block_object_dispose(&v35, 8);
    return v13;
  }
  __int16 v14 = **(NSObject ***)(a1 + 128);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    LOWORD(block[0]) = 0;
    _os_log_error_impl(&dword_2637D5000, v14, OS_LOG_TYPE_ERROR, "error: NULL transferCb param", (uint8_t *)block, 2u);
  }
  return 0;
}

void sub_2637DF884(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *aBlock)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void ___ZN18HSFilerRT_Internal4readE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFvPKvmEEE_block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v2 = *(void *)(a1 + 40);
  HSFilerRT_Internal::findSession_sync((uint64_t *)v2, *(_DWORD *)(a1 + 64), *(void *)(a1 + 48), &v8);
  if (!v8) {
    goto LABEL_6;
  }
  if (std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::find<std::string>((void *)(v8 + 40), *(void *)(a1 + 56)))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    uint64_t v3 = (std::__shared_weak_count *)v9;
    if (!v9) {
      return;
    }
    goto LABEL_7;
  }
  uint64_t v4 = **(NSObject ***)(v2 + 128);
  if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
LABEL_6:
    uint64_t v3 = (std::__shared_weak_count *)v9;
    if (!v9) {
      return;
    }
    goto LABEL_7;
  }
  unint64_t v5 = hsfiler::support::to_string(*(_DWORD *)(a1 + 64));
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v6 = *(uint64_t **)(a1 + 56);
  if (*((char *)v6 + 23) < 0) {
    uint64_t v6 = (uint64_t *)*v6;
  }
  *(_DWORD *)std::string buf = 136315650;
  uint64_t v11 = v5;
  __int16 v12 = 2048;
  uint64_t v13 = v7;
  __int16 v14 = 2080;
  unint64_t v15 = v6;
  _os_log_error_impl(&dword_2637D5000, v4, OS_LOG_TYPE_ERROR, "error: Client (%s) session (%llu): invalid fileID (%s)", buf, 0x20u);
  uint64_t v3 = (std::__shared_weak_count *)v9;
  if (v9)
  {
LABEL_7:
    if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_2637DFA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void ___ZN18HSFilerRT_Internal4readE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFvPKvmEEE_block_invoke_16(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v69 = 0;
  uint64_t v70 = 0;
  uint64_t v3 = *(std::__shared_weak_count **)(v2 + 200);
  if (v3)
  {
    uint64_t v4 = std::__shared_weak_count::lock(v3);
    uint64_t v70 = v4;
    if (v4)
    {
      uint64_t v5 = *(void *)(v2 + 192);
      uint64_t v69 = v5;
      if (v5)
      {
        if (*(void *)(v5 + 32) == *(void *)(a1 + 40))
        {
          uint64_t v6 = v4;
          uint64_t v7 = *(void *)(a1 + 56);
          if (std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::find<std::string>((void *)(v5 + 40), v7))
          {
            *(void *)std::string buf = v7;
            if (*((unsigned char *)std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v5 + 40, v7, (long long **)buf)+ 40))
            {
              unint64_t v8 = **(NSObject ***)(v2 + 128);
              if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
              {
                char v38 = hsfiler::support::to_string(*(_DWORD *)(a1 + 96));
                uint64_t v39 = *(void *)(a1 + 40);
                *(_DWORD *)std::string buf = 136315394;
                *(void *)&uint8_t buf[4] = v38;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v39;
                _os_log_error_impl(&dword_2637D5000, v8, OS_LOG_TYPE_ERROR, "error: Failed client (%s) session (%llu) readWithBuff: fileID already transferred", buf, 0x16u);
              }
              block[0] = MEMORY[0x263EF8330];
              block[1] = 1174405120;
              block[2] = ___ZN18HSFilerRT_Internal4readE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFvPKvmEEE_block_invoke_19;
              block[3] = &__block_descriptor_tmp_22_0;
              unint64_t v9 = *(void **)(a1 + 48);
              if (v9) {
                unint64_t v9 = _Block_copy(v9);
              }
              uint64_t v10 = *(void *)(a1 + 40);
              aBlocuint64_t k = v9;
              uint64_t v63 = v10;
              uint64_t v64 = *(void *)(a1 + 56);
              dispatch_async(*(dispatch_queue_t *)(v5 + 80), block);
              if (aBlock) {
                _Block_release(aBlock);
              }
              goto LABEL_23;
            }
          }
          uint64_t v17 = **(NSObject ***)(v2 + 128);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v18 = hsfiler::support::to_string(*(_DWORD *)(a1 + 96));
            uint64_t v19 = *(void *)(a1 + 40);
            uint64_t v20 = *(void ***)(a1 + 56);
            if (*((char *)v20 + 23) < 0) {
              uint64_t v20 = (void **)*v20;
            }
            *(_DWORD *)std::string buf = 136315650;
            *(void *)&uint8_t buf[4] = v18;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v19;
            *(_WORD *)&buf[22] = 2080;
            v74 = v20;
            _os_log_impl(&dword_2637D5000, v17, OS_LOG_TYPE_DEFAULT, " ------ Reading client (%s) session (%llu) file (%s) to buff ------ ", buf, 0x20u);
          }
          v57[0] = MEMORY[0x263EF8330];
          v57[1] = 1174405120;
          v57[2] = ___ZN18HSFilerRT_Internal4readE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFvPKvmEEE_block_invoke_23;
          v57[3] = &__block_descriptor_tmp_26_0;
          uint64_t v21 = *(void **)(a1 + 48);
          if (v21) {
            uint64_t v21 = _Block_copy(v21);
          }
          uint64_t v22 = *(void *)(a1 + 40);
          uint64_t v58 = v21;
          uint64_t v59 = v22;
          uint64_t v60 = *(void *)(a1 + 56);
          uint64_t v55 = v5;
          uint64_t v56 = v6;
          atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v23 = (*(uint64_t (**)(uint64_t, uint64_t *, void))(*(void *)v2 + 40))(v2, &v55, *(void *)(a1 + 56));
          __int16 v24 = v56;
          if (v56 && !atomic_fetch_add(&v56->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
            std::__shared_weak_count::__release_weak(v24);
          }
          if (!v23)
          {
LABEL_70:
            int v41 = -9;
LABEL_71:
            uint64_t v43 = v69;
            v48[0] = MEMORY[0x263EF8330];
            v48[1] = 1174405120;
            v48[2] = ___ZN18HSFilerRT_Internal4readE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFvPKvmEEE_block_invoke_27;
            v48[3] = &__block_descriptor_tmp_30;
            uint64_t v44 = *(void **)(a1 + 48);
            if (v44) {
              uint64_t v44 = _Block_copy(v44);
            }
            uint64_t v45 = *(void *)(a1 + 40);
            __int16 v49 = v44;
            uint64_t v50 = v45;
            int v52 = v41;
            uint64_t v51 = *(void *)(a1 + 56);
            dispatch_async(*(dispatch_queue_t *)(v43 + 80), v48);
            HSFilerRT_Internal::handleSessionError_sync((HSFilerRT_Internal *)v2, *(_DWORD *)(v43 + 24), *(void *)(a1 + 40), v41);
            if (v49) {
              _Block_release(v49);
            }
LABEL_64:
            if (v58) {
              _Block_release(v58);
            }
            goto LABEL_23;
          }
          if (v23 > 0xF00000)
          {
            uint64_t v40 = **(NSObject ***)(v2 + 128);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)std::string buf = 134218240;
              *(void *)&uint8_t buf[4] = v23;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = 15728640;
              _os_log_error_impl(&dword_2637D5000, v40, OS_LOG_TYPE_ERROR, "error: File size (%llu) reported by baseband > max allowed (%zu)", buf, 0x16u);
            }
            int v41 = -14;
            goto LABEL_71;
          }
          uint64_t v53 = v69;
          uint64_t v54 = v70;
          if (v70) {
            atomic_fetch_add_explicit(&v70->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          uint64_t v25 = *(void *)(a1 + 56);
          uint64_t v26 = *(void *)(a1 + 88);
          if (v26)
          {
            if (v26 == a1 + 64)
            {
              v72 = v71;
              (*(void (**)(uint64_t, void *))(*(void *)v26 + 24))(v26, v71);
              goto LABEL_45;
            }
            uint64_t v26 = (*(uint64_t (**)(uint64_t))(*(void *)v26 + 16))(v26);
          }
          v72 = (void *)v26;
LABEL_45:
          char v29 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, unint64_t, void *))(*(void *)v2 + 48))(v2, &v53, v25, v23, v71);
          if (v72 == v71)
          {
            (*(void (**)(void *))(v71[0] + 32))(v71);
          }
          else if (v72)
          {
            (*(void (**)(void))(*v72 + 40))();
          }
          uint64_t v30 = v54;
          if (v54 && !atomic_fetch_add(&v54->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
            std::__shared_weak_count::__release_weak(v30);
          }
          if (v29)
          {
            uint64_t v31 = v69;
            uint64_t v32 = *(void *)(a1 + 56);
            if (std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::find<std::string>((void *)(v69 + 40), v32))
            {
              *(void *)std::string buf = v32;
              *((unsigned char *)std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v31 + 40, v32, (long long **)buf)+ 40) = 1;
            }
            dispatch_async(*(dispatch_queue_t *)(v31 + 80), v57);
            uint64_t v33 = **(NSObject ***)(v2 + 128);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              int v34 = hsfiler::support::to_string(*(_DWORD *)(a1 + 96));
              uint64_t v35 = *(void *)(a1 + 40);
              unint64_t v36 = *(void ***)(a1 + 56);
              if (*((char *)v36 + 23) < 0) {
                unint64_t v36 = (void **)*v36;
              }
              *(_DWORD *)std::string buf = 136315650;
              *(void *)&uint8_t buf[4] = v34;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v35;
              *(_WORD *)&buf[22] = 2080;
              v74 = v36;
              _os_log_impl(&dword_2637D5000, v33, OS_LOG_TYPE_DEFAULT, " ------ Successfully read client (%s) session (%llu) file (%s) to buff ------ ", buf, 0x20u);
            }
            uint64_t v37 = (uint64_t *)(v31 + 56);
            while (1)
            {
              uint64_t v37 = (uint64_t *)*v37;
              if (!v37) {
                break;
              }
              if (!*((unsigned char *)v37 + 40)) {
                goto LABEL_64;
              }
            }
            *(void *)std::string buf = MEMORY[0x263EF8330];
            *(void *)&buf[8] = 0x40000000;
            *(void *)&uint8_t buf[16] = ___ZN18HSFilerRT_Internal10endSessionEv_block_invoke;
            v74 = (void **)&__block_descriptor_tmp_54;
            uint64_t v75 = v2;
            ctu::SharedSynchronizable<HSFilerRT_Internal>::execute_wrapped((uint64_t *)(v2 + 8), (uint64_t)buf);
            goto LABEL_64;
          }
          uint64_t v42 = **(NSObject ***)(v2 + 128);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            uint64_t v46 = *(void *)(v69 + 32);
            uint64_t v47 = *(uint64_t ***)(a1 + 56);
            if (*((char *)v47 + 23) < 0) {
              uint64_t v47 = (uint64_t **)*v47;
            }
            *(_DWORD *)std::string buf = 134218242;
            *(void *)&uint8_t buf[4] = v46;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = v47;
            _os_log_error_impl(&dword_2637D5000, v42, OS_LOG_TYPE_ERROR, "error: Failed to read file from baseband (session: %llu, file: %s)", buf, 0x16u);
          }
          goto LABEL_70;
        }
      }
    }
  }
  uint64_t v11 = **(NSObject ***)(v2 + 128);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v27 = hsfiler::support::to_string(*(_DWORD *)(a1 + 96));
    uint64_t v28 = *(void *)(a1 + 40);
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = v27;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v28;
    _os_log_error_impl(&dword_2637D5000, v11, OS_LOG_TYPE_ERROR, "error: Failed client (%s) session (%llu) readWithBuff: session not running", buf, 0x16u);
  }
  memset(buf, 170, 16);
  HSFilerRT_Internal::findSession_sync((uint64_t *)v2, *(_DWORD *)(a1 + 96), *(void *)(a1 + 40), buf);
  uint64_t v12 = *(void *)buf;
  if (*(void *)buf)
  {
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 1174405120;
    v65[2] = ___ZN18HSFilerRT_Internal4readE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFvPKvmEEE_block_invoke_17;
    v65[3] = &__block_descriptor_tmp_18;
    uint64_t v13 = *(void **)(a1 + 48);
    if (v13) {
      uint64_t v13 = _Block_copy(v13);
    }
    uint64_t v14 = *(void *)(a1 + 40);
    v66 = v13;
    uint64_t v67 = v14;
    uint64_t v68 = *(void *)(a1 + 56);
    dispatch_async(*(dispatch_queue_t *)(v12 + 80), v65);
    if (v66) {
      _Block_release(v66);
    }
  }
  unint64_t v15 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8]
    && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
LABEL_23:
  uint64_t v16 = v70;
  if (v70)
  {
    if (!atomic_fetch_add(&v70->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
}

void sub_2637E0358(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *aBlock, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN18HSFilerRT_Internal4readE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFvPKvmEEE_block_invoke_17(void *a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(a1[4] + 16))(a1[4], a1[5], 4294967293, a1[6]);
}

void *__copy_helper_block_e8_32c124_ZTSN8dispatch5blockIU13block_pointerFvy13HSFilerStatusRKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEEE(uint64_t a1, uint64_t a2)
{
  double result = *(void **)(a2 + 32);
  if (result) {
    double result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c124_ZTSN8dispatch5blockIU13block_pointerFvy13HSFilerStatusRKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t ___ZN18HSFilerRT_Internal4readE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFvPKvmEEE_block_invoke_19(void *a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(a1[4] + 16))(a1[4], a1[5], 4294967283, a1[6]);
}

uint64_t ___ZN18HSFilerRT_Internal4readE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFvPKvmEEE_block_invoke_23(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[4] + 16))(a1[4], a1[5], 0, a1[6]);
}

void *std::function<void ()(void const*,unsigned long)>::~function(void *a1)
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

void HSFilerRT_Internal::endSession(HSFilerRT_Internal *this)
{
  v1[0] = MEMORY[0x263EF8330];
  v1[1] = 0x40000000;
  v1[2] = ___ZN18HSFilerRT_Internal10endSessionEv_block_invoke;
  v1[3] = &__block_descriptor_tmp_54;
  v1[4] = this;
  ctu::SharedSynchronizable<HSFilerRT_Internal>::execute_wrapped((uint64_t *)this + 1, (uint64_t)v1);
}

uint64_t ___ZN18HSFilerRT_Internal4readE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFvPKvmEEE_block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned int *)(a1 + 56), *(void *)(a1 + 48));
}

uint64_t __copy_helper_block_e8_48c124_ZTSN8dispatch5blockIU13block_pointerFvy13HSFilerStatusRKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEEE64c30_ZTSNSt3__18functionIFvPKvmEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 48);
  if (v4) {
    uint64_t v4 = _Block_copy(v4);
  }
  *(void *)(a1 + 48) = v4;
  uint64_t result = *(void *)(a2 + 88);
  if (!result) {
    goto LABEL_6;
  }
  if (result != a2 + 64)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 16))(result);
LABEL_6:
    *(void *)(a1 + 88) = result;
    return result;
  }
  *(void *)(a1 + 88) = a1 + 64;
  return (*(uint64_t (**)(void))(**(void **)(a2 + 88) + 24))(*(void *)(a2 + 88));
}

void sub_2637E0688(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(const void **)(v1 + 48);
  if (v3) {
    _Block_release(v3);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_48c124_ZTSN8dispatch5blockIU13block_pointerFvy13HSFilerStatusRKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEEE64c30_ZTSNSt3__18functionIFvPKvmEEE(uint64_t a1)
{
  uint64_t v2 = a1 + 64;
  uint64_t v3 = *(void *)(a1 + 88);
  if (v3 == v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
    uint64_t v4 = *(const void **)(a1 + 48);
    if (!v4) {
      return;
    }
    goto LABEL_7;
  }
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
  }
  uint64_t v4 = *(const void **)(a1 + 48);
  if (v4) {
LABEL_7:
  }
    _Block_release(v4);
}

BOOL HSFilerRT_Internal::readWithBuff(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t *a5, const void **a6)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v9 = *a5;
  if (*a5)
  {
    if (*a6)
    {
      uint64_t v12 = _Block_copy(*a6);
      uint64_t v9 = *a5;
      uint64_t v13 = a5[1];
      uint64_t v17 = v12;
      if (!v13) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v17 = 0;
      uint64_t v13 = a5[1];
      if (!v13)
      {
LABEL_5:
        v18[0] = &unk_270EAF230;
        v18[1] = v9;
        v18[2] = v13;
        uint64_t v19 = v18;
        BOOL v14 = HSFilerRT_Internal::read(a1, a2, a3, a4, &v17, v18);
        if (v19 == v18)
        {
          (*(void (**)(void *))(v18[0] + 32))(v18);
          if (!v12) {
            return v14;
          }
        }
        else
        {
          if (v19) {
            (*(void (**)(void))(*v19 + 40))();
          }
          if (!v12) {
            return v14;
          }
        }
        _Block_release(v12);
        return v14;
      }
    }
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
    goto LABEL_5;
  }
  uint64_t v16 = **(NSObject ***)(a1 + 128);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)std::string buf = 136315394;
    uint64_t v21 = hsfiler::support::to_string(a2);
    __int16 v22 = 2048;
    uint64_t v23 = a3;
    _os_log_error_impl(&dword_2637D5000, v16, OS_LOG_TYPE_ERROR, "error: Client (%s) session (%llu): invalid buffer", buf, 0x16u);
  }
  return 0;
}

void sub_2637E093C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

BOOL HSFilerRT_Internal::readWithFile(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, const void **a6)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  if (*(char *)(a5 + 23) < 0)
  {
    std::string::size_type v11 = *(void *)(a5 + 8);
    if (v11)
    {
      std::string::__init_copy_ctor_external(&v22, *(const std::string::value_type **)a5, v11);
LABEL_6:
      support::fs::SyncFile::create((uint64_t)&v22, 52, 0x100000uLL, buf);
      uint64_t v13 = *(void *)buf;
      uint64_t v12 = *(std::__shared_weak_count **)&buf[8];
      *(void *)std::string buf = 0;
      *(void *)&buf[8] = 0;
      uint64_t v23 = v13;
      uint64_t v24 = v12;
      if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v22.__r_.__value_.__l.__data_);
      }
      if (!v13)
      {
        uint64_t v18 = **(NSObject ***)(a1 + 128);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = hsfiler::support::to_string(a2);
          if (*(char *)(a4 + 23) >= 0) {
            uint64_t v20 = a4;
          }
          else {
            uint64_t v20 = *(void *)a4;
          }
          *(_DWORD *)std::string buf = 136315650;
          *(void *)&uint8_t buf[4] = v19;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = a3;
          __int16 v28 = 2080;
          uint64_t v29 = v20;
          _os_log_error_impl(&dword_2637D5000, v18, OS_LOG_TYPE_ERROR, "error: Client (%s) session (%llu): failed to create file (%s)", buf, 0x20u);
          BOOL v15 = 0;
        }
        else
        {
          BOOL v15 = 0;
        }
        goto LABEL_21;
      }
      if (*a6)
      {
        BOOL v14 = _Block_copy(*a6);
        uint64_t v21 = v14;
        if (!v12) {
          goto LABEL_12;
        }
      }
      else
      {
        BOOL v14 = 0;
        uint64_t v21 = 0;
        if (!v12)
        {
LABEL_12:
          v25[0] = &unk_270EAF2C0;
          v25[1] = v13;
          void v25[2] = v12;
          uint64_t v26 = v25;
          BOOL v15 = HSFilerRT_Internal::read(a1, a2, a3, a4, &v21, v25);
          if (v26 == v25)
          {
            (*(void (**)(void *))(v25[0] + 32))(v25);
            if (!v14)
            {
LABEL_21:
              if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
                std::__shared_weak_count::__release_weak(v12);
              }
              return v15;
            }
          }
          else
          {
            if (v26) {
              (*(void (**)(void))(*v26 + 40))();
            }
            if (!v14) {
              goto LABEL_21;
            }
          }
          _Block_release(v14);
          goto LABEL_21;
        }
      }
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      goto LABEL_12;
    }
  }
  else if (*(unsigned char *)(a5 + 23))
  {
    std::string v22 = *(std::string *)a5;
    goto LABEL_6;
  }
  uint64_t v17 = **(NSObject ***)(a1 + 128);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = hsfiler::support::to_string(a2);
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    _os_log_error_impl(&dword_2637D5000, v17, OS_LOG_TYPE_ERROR, "error: Client (%s) session (%llu): invalid file path", buf, 0x16u);
  }
  return 0;
}

void sub_2637E0C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, char a20,uint64_t a21,char a22)
{
}

BOOL HSFilerRT_Internal::readWithStream(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, const void **a6)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v9 = *(void **)a5;
  if (*(void *)a5 && !*(_DWORD *)((char *)v9 + *(void *)(*v9 - 24) + 32))
  {
    if (*a6)
    {
      uint64_t v12 = _Block_copy(*a6);
      uint64_t v9 = *(void **)a5;
      uint64_t v13 = *(void *)(a5 + 8);
      uint64_t v17 = v12;
      if (!v13) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v17 = 0;
      uint64_t v13 = *(void *)(a5 + 8);
      if (!v13)
      {
LABEL_6:
        v18[0] = &unk_270EAF340;
        v18[1] = v9;
        v18[2] = v13;
        uint64_t v19 = v18;
        BOOL v14 = HSFilerRT_Internal::read(a1, a2, a3, a4, &v17, v18);
        if (v19 == v18)
        {
          (*(void (**)(void *))(v18[0] + 32))(v18);
          if (!v12) {
            return v14;
          }
        }
        else
        {
          if (v19) {
            (*(void (**)(void))(*v19 + 40))();
          }
          if (!v12) {
            return v14;
          }
        }
        _Block_release(v12);
        return v14;
      }
    }
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
    goto LABEL_6;
  }
  uint64_t v16 = **(NSObject ***)(a1 + 128);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)std::string buf = 136315394;
    uint64_t v21 = hsfiler::support::to_string(a2);
    __int16 v22 = 2048;
    uint64_t v23 = a3;
    _os_log_error_impl(&dword_2637D5000, v16, OS_LOG_TYPE_ERROR, "error: Client (%s) session (%llu): invalid output stream", buf, 0x16u);
  }
  return 0;
}

void sub_2637E0F24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

BOOL HSFilerRT_Internal::write(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, void **a6, void *a7)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (*a6)
  {
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x2000000000;
    char v25 = 0;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 1174405120;
    v35[2] = ___ZN18HSFilerRT_Internal5writeE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEmN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFbPvmEEE_block_invoke;
    v35[3] = &__block_descriptor_tmp_32;
    int v38 = a2;
    v35[5] = a1;
    v35[6] = a3;
    v35[7] = a4;
    uint64_t v14 = a7[3];
    if (v14)
    {
      if ((void *)v14 == a7)
      {
        uint64_t v37 = v36;
        (*(void (**)(void *, void *))(*a7 + 24))(a7, v36);
LABEL_10:
        v35[4] = &v22;
        uint64_t v26 = v35;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 0x40000000;
        block[2] = ___ZNK3ctu20SharedSynchronizableI18HSFilerRT_InternalE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
        block[3] = &__block_descriptor_tmp_83;
        void block[4] = a1 + 8;
        void block[5] = &v26;
        uint64_t v17 = *(NSObject **)(a1 + 24);
        if (*(void *)(a1 + 32))
        {
          dispatch_async_and_wait(v17, block);
          BOOL v16 = *((unsigned char *)v23 + 24) != 0;
          if (!*((unsigned char *)v23 + 24)) {
            goto LABEL_28;
          }
        }
        else
        {
          dispatch_sync(v17, block);
          BOOL v16 = *((unsigned char *)v23 + 24) != 0;
          if (!*((unsigned char *)v23 + 24)) {
            goto LABEL_28;
          }
        }
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 1174405120;
        v28[2] = ___ZN18HSFilerRT_Internal5writeE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEmN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFbPvmEEE_block_invoke_33;
        v28[3] = &__block_descriptor_tmp_50;
        v28[4] = a1;
        v28[5] = a3;
        int v34 = a2;
        uint64_t v18 = *a6;
        if (*a6) {
          uint64_t v18 = _Block_copy(v18);
        }
        aBlocuint64_t k = v18;
        uint64_t v30 = a4;
        uint64_t v31 = a5;
        uint64_t v19 = a7[3];
        if (v19)
        {
          if ((void *)v19 == a7)
          {
            uint64_t v33 = v32;
            (*(void (**)(void *, void *))(*a7 + 24))(a7, v32);
            goto LABEL_21;
          }
          uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)v19 + 16))(v19);
        }
        uint64_t v33 = (void *)v19;
LABEL_21:
        ctu::SharedSynchronizable<HSFilerRT_Internal>::execute_wrapped((uint64_t *)(a1 + 8), (uint64_t)v28);
        if (v33 != v32)
        {
          if (v33) {
            (*(void (**)(void))(*v33 + 40))();
          }
          uint64_t v20 = aBlock;
          if (!aBlock) {
            goto LABEL_28;
          }
          goto LABEL_27;
        }
        (*(void (**)(void *))(v32[0] + 32))(v32);
        uint64_t v20 = aBlock;
        if (aBlock) {
LABEL_27:
        }
          _Block_release(v20);
LABEL_28:
        if (v37 == v36)
        {
          (*(void (**)(void *))(v36[0] + 32))(v36);
        }
        else if (v37)
        {
          (*(void (**)(void))(*v37 + 40))();
        }
        _Block_object_dispose(&v22, 8);
        return v16;
      }
      uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 16))(v14);
    }
    uint64_t v37 = (void *)v14;
    goto LABEL_10;
  }
  BOOL v15 = **(NSObject ***)(a1 + 128);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    LOWORD(block[0]) = 0;
    _os_log_error_impl(&dword_2637D5000, v15, OS_LOG_TYPE_ERROR, "error: NULL transferCb param", (uint8_t *)block, 2u);
  }
  return 0;
}

void sub_2637E1390(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *aBlock)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN18HSFilerRT_Internal5writeE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEmN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFbPvmEEE_block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v2 = *(void *)(a1 + 40);
  HSFilerRT_Internal::findSession_sync((uint64_t *)v2, *(_DWORD *)(a1 + 96), *(void *)(a1 + 48), &v11);
  if (!v11) {
    goto LABEL_12;
  }
  if (std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::find<std::string>((void *)(v11 + 40), *(void *)(a1 + 56)))
  {
    if (*(void *)(a1 + 88))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      uint64_t v3 = (std::__shared_weak_count *)v12;
      if (!v12) {
        return;
      }
      goto LABEL_13;
    }
    unint64_t v8 = **(NSObject ***)(v2 + 128);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      uint64_t v3 = (std::__shared_weak_count *)v12;
      if (!v12) {
        return;
      }
      goto LABEL_13;
    }
    uint64_t v9 = hsfiler::support::to_string(*(_DWORD *)(a1 + 96));
    uint64_t v10 = *(void *)(a1 + 48);
    *(_DWORD *)std::string buf = 136315394;
    uint64_t v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    _os_log_error_impl(&dword_2637D5000, v8, OS_LOG_TYPE_ERROR, "error: Client (%s) session (%llu): invalid writer callback param", buf, 0x16u);
    uint64_t v3 = (std::__shared_weak_count *)v12;
    if (!v12) {
      return;
    }
LABEL_13:
    if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
    return;
  }
  uint64_t v4 = **(NSObject ***)(v2 + 128);
  if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    goto LABEL_12;
  }
  uint64_t v5 = hsfiler::support::to_string(*(_DWORD *)(a1 + 96));
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v6 = *(uint64_t **)(a1 + 56);
  if (*((char *)v6 + 23) < 0) {
    uint64_t v6 = (uint64_t *)*v6;
  }
  *(_DWORD *)std::string buf = 136315650;
  uint64_t v14 = v5;
  __int16 v15 = 2048;
  uint64_t v16 = v7;
  __int16 v17 = 2080;
  uint64_t v18 = v6;
  _os_log_error_impl(&dword_2637D5000, v4, OS_LOG_TYPE_ERROR, "error: Client (%s) session (%llu): invalid fileID (%s)", buf, 0x20u);
  uint64_t v3 = (std::__shared_weak_count *)v12;
  if (v12) {
    goto LABEL_13;
  }
}

void sub_2637E15C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2637E15DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t __copy_helper_block_e8_32r64c29_ZTSNSt3__18functionIFbPvmEEE(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  uint64_t result = *(void *)(a2 + 88);
  if (!result) {
    goto LABEL_4;
  }
  if (result != a2 + 64)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 16))(result);
LABEL_4:
    *(void *)(a1 + 88) = result;
    return result;
  }
  *(void *)(a1 + 88) = a1 + 64;
  return (*(uint64_t (**)(void))(**(void **)(a2 + 88) + 24))(*(void *)(a2 + 88));
}

void sub_2637E16B0(_Unwind_Exception *a1)
{
  _Block_object_dispose(*v1, 8);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_32r64c29_ZTSNSt3__18functionIFbPvmEEE(uint64_t a1)
{
  uint64_t v2 = a1 + 64;
  uint64_t v3 = *(void *)(a1 + 88);
  if (v3 == v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
    uint64_t v4 = *(const void **)(a1 + 32);
  }
  else
  {
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
    }
    uint64_t v4 = *(const void **)(a1 + 32);
  }
  _Block_object_dispose(v4, 8);
}

void *std::function<BOOL ()(void *,unsigned long)>::~function(void *a1)
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

void ___ZN18HSFilerRT_Internal5writeE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEmN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFbPvmEEE_block_invoke_33(uint64_t a1)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v64 = 0;
  v65 = 0;
  uint64_t v3 = *(std::__shared_weak_count **)(v2 + 200);
  if (!v3
    || (uint64_t v4 = std::__shared_weak_count::lock(v3), (v65 = v4) == 0)
    || (uint64_t v5 = *(void *)(v2 + 192), (v64 = v5) == 0)
    || *(void *)(v5 + 32) != *(void *)(a1 + 40))
  {
    unint64_t v11 = **(NSObject ***)(v2 + 128);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = hsfiler::support::to_string(*(_DWORD *)(a1 + 104));
      uint64_t v27 = *(void *)(a1 + 40);
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v27;
      _os_log_error_impl(&dword_2637D5000, v11, OS_LOG_TYPE_ERROR, "error: Failed client (%s) session (%llu) writeWithBuff: session not running", buf, 0x16u);
    }
    memset(buf, 170, 16);
    HSFilerRT_Internal::findSession_sync((uint64_t *)v2, *(_DWORD *)(a1 + 104), *(void *)(a1 + 40), buf);
    uint64_t v12 = *(void *)buf;
    if (*(void *)buf)
    {
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 1174405120;
      v60[2] = ___ZN18HSFilerRT_Internal5writeE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEmN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFbPvmEEE_block_invoke_34;
      v60[3] = &__block_descriptor_tmp_37;
      uint64_t v13 = *(void **)(a1 + 48);
      if (v13) {
        uint64_t v13 = _Block_copy(v13);
      }
      uint64_t v14 = *(void *)(a1 + 40);
      v61 = v13;
      uint64_t v62 = v14;
      uint64_t v63 = *(void *)(a1 + 56);
      dispatch_async(*(dispatch_queue_t *)(v12 + 80), v60);
      if (v61) {
        _Block_release(v61);
      }
    }
    __int16 v15 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8]
      && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
    goto LABEL_23;
  }
  uint64_t v6 = v4;
  uint64_t v7 = *(void *)(a1 + 56);
  if (std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::find<std::string>((void *)(v5 + 40), v7))
  {
    *(void *)std::string buf = v7;
    if (*((unsigned char *)std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v5 + 40, v7, (long long **)buf)+ 40))
    {
      unint64_t v8 = **(NSObject ***)(v2 + 128);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = hsfiler::support::to_string(*(_DWORD *)(a1 + 104));
        uint64_t v38 = *(void *)(a1 + 40);
        *(_DWORD *)std::string buf = 136315394;
        *(void *)&uint8_t buf[4] = v37;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v38;
        _os_log_error_impl(&dword_2637D5000, v8, OS_LOG_TYPE_ERROR, "error: Failed client (%s) session (%llu) writeWithBuff: fileID already transferred", buf, 0x16u);
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 1174405120;
      block[2] = ___ZN18HSFilerRT_Internal5writeE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEmN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFbPvmEEE_block_invoke_38;
      block[3] = &__block_descriptor_tmp_41;
      uint64_t v9 = *(void **)(a1 + 48);
      if (v9) {
        uint64_t v9 = _Block_copy(v9);
      }
      uint64_t v10 = *(void *)(a1 + 40);
      aBlocuint64_t k = v9;
      uint64_t v58 = v10;
      uint64_t v59 = *(void *)(a1 + 56);
      dispatch_async(*(dispatch_queue_t *)(v5 + 80), block);
      if (aBlock) {
        _Block_release(aBlock);
      }
      goto LABEL_23;
    }
  }
  __int16 v17 = **(NSObject ***)(v2 + 128);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = hsfiler::support::to_string(*(_DWORD *)(a1 + 104));
    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v20 = *(void ***)(a1 + 56);
    if (*((char *)v20 + 23) < 0) {
      uint64_t v20 = (void **)*v20;
    }
    *(_DWORD *)std::string buf = 136315650;
    *(void *)&uint8_t buf[4] = v18;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v19;
    *(_WORD *)&unsigned char buf[22] = 2080;
    uint64_t v69 = v20;
    _os_log_impl(&dword_2637D5000, v17, OS_LOG_TYPE_DEFAULT, " ------ Writing client (%s) session (%llu) file (%s) from buff ------ ", buf, 0x20u);
  }
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 1174405120;
  v52[2] = ___ZN18HSFilerRT_Internal5writeE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEmN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFbPvmEEE_block_invoke_42;
  v52[3] = &__block_descriptor_tmp_45;
  uint64_t v21 = *(void **)(a1 + 48);
  if (v21) {
    uint64_t v21 = _Block_copy(v21);
  }
  uint64_t v22 = *(void *)(a1 + 40);
  uint64_t v53 = v21;
  uint64_t v54 = v22;
  uint64_t v55 = *(void *)(a1 + 56);
  uint64_t v50 = v5;
  uint64_t v51 = v6;
  atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v23 = *(void *)(a1 + 56);
  uint64_t v24 = *(void *)(a1 + 64);
  uint64_t v25 = *(void *)(a1 + 96);
  if (v25)
  {
    if (v25 == a1 + 72)
    {
      uint64_t v67 = v66;
      (*(void (**)(uint64_t, void *))(*(void *)v25 + 24))(v25, v66);
      goto LABEL_38;
    }
    uint64_t v25 = (*(uint64_t (**)(uint64_t))(*(void *)v25 + 16))(v25);
  }
  uint64_t v67 = (void *)v25;
LABEL_38:
  char v28 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, void *))(*(void *)v2 + 56))(v2, &v50, v23, v24, v66);
  if (v67 == v66)
  {
    (*(void (**)(void *))(v66[0] + 32))(v66);
  }
  else if (v67)
  {
    (*(void (**)(void))(*v67 + 40))();
  }
  uint64_t v29 = v51;
  if (v51 && !atomic_fetch_add(&v51->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
    std::__shared_weak_count::__release_weak(v29);
  }
  if (v28)
  {
    uint64_t v30 = v64;
    uint64_t v31 = *(void *)(a1 + 56);
    if (std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::find<std::string>((void *)(v64 + 40), v31))
    {
      *(void *)std::string buf = v31;
      *((unsigned char *)std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v30 + 40, v31, (long long **)buf)+ 40) = 1;
    }
    dispatch_async(*(dispatch_queue_t *)(v30 + 80), v52);
    uint64_t v32 = **(NSObject ***)(v2 + 128);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = hsfiler::support::to_string(*(_DWORD *)(a1 + 104));
      uint64_t v34 = *(void *)(a1 + 40);
      uint64_t v35 = *(void ***)(a1 + 56);
      if (*((char *)v35 + 23) < 0) {
        uint64_t v35 = (void **)*v35;
      }
      *(_DWORD *)std::string buf = 136315650;
      *(void *)&uint8_t buf[4] = v33;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v34;
      *(_WORD *)&unsigned char buf[22] = 2080;
      uint64_t v69 = v35;
      _os_log_impl(&dword_2637D5000, v32, OS_LOG_TYPE_DEFAULT, " ------ Successfully wrote client (%s) session (%llu) file (%s) from buff ------ ", buf, 0x20u);
    }
    unint64_t v36 = (uint64_t *)(v30 + 56);
    while (1)
    {
      unint64_t v36 = (uint64_t *)*v36;
      if (!v36) {
        break;
      }
      if (!*((unsigned char *)v36 + 40)) {
        goto LABEL_57;
      }
    }
    *(void *)std::string buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 0x40000000;
    *(void *)&uint8_t buf[16] = ___ZN18HSFilerRT_Internal10endSessionEv_block_invoke;
    uint64_t v69 = (void **)&__block_descriptor_tmp_54;
    uint64_t v70 = v2;
    ctu::SharedSynchronizable<HSFilerRT_Internal>::execute_wrapped((uint64_t *)(v2 + 8), (uint64_t)buf);
  }
  else
  {
    uint64_t v39 = **(NSObject ***)(v2 + 128);
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    uint64_t v41 = v64;
    if (v40)
    {
      uint64_t v44 = *(void *)(v64 + 32);
      uint64_t v45 = *(uint64_t ***)(a1 + 56);
      if (*((char *)v45 + 23) < 0) {
        uint64_t v45 = (uint64_t **)*v45;
      }
      *(_DWORD *)std::string buf = 134218242;
      *(void *)&uint8_t buf[4] = v44;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v45;
      _os_log_error_impl(&dword_2637D5000, v39, OS_LOG_TYPE_ERROR, "error: Failed to write file to baseband (session: %llu, file: %s)", buf, 0x16u);
    }
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 1174405120;
    v46[2] = ___ZN18HSFilerRT_Internal5writeE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEmN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFbPvmEEE_block_invoke_46;
    v46[3] = &__block_descriptor_tmp_49;
    uint64_t v42 = *(void **)(a1 + 48);
    if (v42) {
      uint64_t v42 = _Block_copy(v42);
    }
    uint64_t v43 = *(void *)(a1 + 40);
    uint64_t v47 = v42;
    uint64_t v48 = v43;
    uint64_t v49 = *(void *)(a1 + 56);
    dispatch_async(*(dispatch_queue_t *)(v41 + 80), v46);
    HSFilerRT_Internal::handleSessionError_sync((HSFilerRT_Internal *)v2, *(_DWORD *)(v41 + 24), *(void *)(a1 + 40), -9);
    if (v47) {
      _Block_release(v47);
    }
  }
LABEL_57:
  if (v53) {
    _Block_release(v53);
  }
LABEL_23:
  uint64_t v16 = v65;
  if (v65)
  {
    if (!atomic_fetch_add(&v65->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
}

void sub_2637E2004(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *aBlock, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN18HSFilerRT_Internal5writeE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEmN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFbPvmEEE_block_invoke_34(void *a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(a1[4] + 16))(a1[4], a1[5], 4294967293, a1[6]);
}

uint64_t ___ZN18HSFilerRT_Internal5writeE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEmN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFbPvmEEE_block_invoke_38(void *a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(a1[4] + 16))(a1[4], a1[5], 4294967283, a1[6]);
}

uint64_t ___ZN18HSFilerRT_Internal5writeE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEmN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFbPvmEEE_block_invoke_42(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[4] + 16))(a1[4], a1[5], 0, a1[6]);
}

uint64_t ___ZN18HSFilerRT_Internal5writeE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEmN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEENS1_8functionIFbPvmEEE_block_invoke_46(void *a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(a1[4] + 16))(a1[4], a1[5], 4294967287, a1[6]);
}

uint64_t __copy_helper_block_e8_48c124_ZTSN8dispatch5blockIU13block_pointerFvy13HSFilerStatusRKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEEE72c29_ZTSNSt3__18functionIFbPvmEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 48);
  if (v4) {
    uint64_t v4 = _Block_copy(v4);
  }
  *(void *)(a1 + 48) = v4;
  uint64_t result = *(void *)(a2 + 96);
  if (!result) {
    goto LABEL_6;
  }
  if (result != a2 + 72)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 16))(result);
LABEL_6:
    *(void *)(a1 + 96) = result;
    return result;
  }
  *(void *)(a1 + 96) = a1 + 72;
  return (*(uint64_t (**)(void))(**(void **)(a2 + 96) + 24))(*(void *)(a2 + 96));
}

void sub_2637E21C4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(const void **)(v1 + 48);
  if (v3) {
    _Block_release(v3);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_48c124_ZTSN8dispatch5blockIU13block_pointerFvy13HSFilerStatusRKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEEE72c29_ZTSNSt3__18functionIFbPvmEEE(uint64_t a1)
{
  uint64_t v2 = a1 + 72;
  uint64_t v3 = *(void *)(a1 + 96);
  if (v3 == v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
    uint64_t v4 = *(const void **)(a1 + 48);
    if (!v4) {
      return;
    }
    goto LABEL_7;
  }
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
  }
  uint64_t v4 = *(const void **)(a1 + 48);
  if (v4) {
LABEL_7:
  }
    _Block_release(v4);
}

BOOL HSFilerRT_Internal::writeWithBuff(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, void *a5, const void **a6)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v9 = (void *)*a5;
  if (!*a5)
  {
    char v28 = **(NSObject ***)(a1 + 128);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 136315394;
      uint64_t v33 = hsfiler::support::to_string(a2);
      __int16 v34 = 2048;
      uint64_t v35 = a3;
      uint64_t v25 = "error: Client (%s) session (%llu): invalid buffer";
      uint64_t v26 = v28;
      uint32_t v27 = 22;
      goto LABEL_22;
    }
    return 0;
  }
  uint64_t v11 = v9[1];
  unint64_t v12 = v11 - *v9;
  if (v11 == *v9 || v12 > 0xF00000)
  {
    uint64_t v22 = **(NSObject ***)(a1 + 128);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = hsfiler::support::to_string(a2);
      uint64_t v24 = *(void *)(*a5 + 8) - *(void *)*a5;
      *(_DWORD *)std::string buf = 136315650;
      uint64_t v33 = v23;
      __int16 v34 = 2048;
      uint64_t v35 = a3;
      __int16 v36 = 2048;
      uint64_t v37 = v24;
      uint64_t v25 = "error: Client (%s) session (%llu): invalid buffer size %zu";
      uint64_t v26 = v22;
      uint32_t v27 = 32;
LABEL_22:
      _os_log_error_impl(&dword_2637D5000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
      return 0;
    }
    return 0;
  }
  if (*a6)
  {
    uint64_t v14 = _Block_copy(*a6);
    uint64_t v9 = (void *)*a5;
    uint64_t v15 = a5[1];
    uint64_t v29 = v14;
    if (!v15) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v14 = 0;
  uint64_t v15 = a5[1];
  uint64_t v29 = 0;
  if (v15) {
LABEL_6:
  }
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
LABEL_7:
  uint64_t v16 = operator new(0x20uLL);
  void *v16 = &unk_270EAF3C0;
  v16[1] = a1;
  uint64_t v16[2] = v9;
  v16[3] = v15;
  uint64_t v31 = v16;
  BOOL v20 = HSFilerRT_Internal::write(a1, a2, a3, a4, v12, &v29, v30);
  if (v31 == v30)
  {
    (*(void (**)(void *))(v30[0] + 32))(v30);
    if (!v14) {
      return v20;
    }
LABEL_15:
    _Block_release(v14);
    return v20;
  }
  if (v31) {
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*v31 + 40))(v31, v17, v18, v19);
  }
  if (v14) {
    goto LABEL_15;
  }
  return v20;
}

void sub_2637E2518(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t HSFilerRT_Internal::writeWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0::~$_0(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(std::__shared_weak_count **)(result + 16);
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

BOOL HSFilerRT_Internal::writeWithFile(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, const void **a6)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  if (*(char *)(a5 + 23) < 0)
  {
    std::string::size_type v11 = *(void *)(a5 + 8);
    if (v11)
    {
      std::string::__init_copy_ctor_external(&v40, *(const std::string::value_type **)a5, v11);
LABEL_6:
      support::fs::SyncFile::create((uint64_t)&v40, 12, 0x100000uLL, buf);
      uint64_t v13 = *(uint64_t **)buf;
      unint64_t v12 = *(std::__shared_weak_count **)&buf[8];
      *(void *)std::string buf = 0;
      *(void *)&buf[8] = 0;
      uint64_t v41 = v13;
      uint64_t v42 = v12;
      if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v40.__r_.__value_.__l.__data_);
      }
      if (v13)
      {
        *(void *)std::string buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 0x40000000;
        *(void *)&uint8_t buf[16] = ___ZN7support2fs8SyncFile4openEv_block_invoke;
        uint64_t v46 = &__block_descriptor_tmp_3;
        uint64_t v47 = v13;
        ctu::SharedSynchronizable<support::fs::SyncFile>::execute_wrapped(v13 + 1, (uint64_t)buf);
        if (support::fs::SyncFile::isOpen((support::fs::SyncFile *)v13))
        {
          if (support::fs::SyncFile::getSize((support::fs::SyncFile *)v13))
          {
            uint64_t v15 = v14;
            if (v14)
            {
              if (v14 <= 0xF00000)
              {
                if (*a6)
                {
                  uint64_t v16 = _Block_copy(*a6);
                  uint64_t v39 = v16;
                  if (!v12) {
                    goto LABEL_16;
                  }
                }
                else
                {
                  uint64_t v16 = 0;
                  uint64_t v39 = 0;
                  if (!v12)
                  {
LABEL_16:
                    *(void *)&long long v38 = a1;
                    DWORD2(v38) = a2;
                    uint64_t v44 = 0;
                    uint64_t v17 = operator new(0x38uLL);
                    void *v17 = &unk_270EAF450;
                    v17[1] = v15;
                    v17[2] = v13;
                    v17[3] = v12;
                    *((_OWORD *)v17 + 2) = v38;
                    v17[6] = a3;
                    uint64_t v44 = v17;
                    BOOL v18 = HSFilerRT_Internal::write(a1, a2, a3, a4, v15, &v39, v43);
                    if (v44 == v43)
                    {
                      (*(void (**)(void *))(v43[0] + 32))(v43);
                      if (!v16)
                      {
LABEL_25:
                        if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                        {
                          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
                          std::__shared_weak_count::__release_weak(v12);
                        }
                        return v18;
                      }
                    }
                    else
                    {
                      if (v44) {
                        (*(void (**)(void))(*v44 + 40))();
                      }
                      if (!v16) {
                        goto LABEL_25;
                      }
                    }
                    _Block_release(v16);
                    goto LABEL_25;
                  }
                }
                atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
                goto LABEL_16;
              }
              char v28 = **(NSObject ***)(a1 + 128);
              if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
LABEL_52:
                BOOL v18 = 0;
                goto LABEL_25;
              }
              uint64_t v37 = hsfiler::support::to_string(a2);
              *(_DWORD *)std::string buf = 136315650;
              *(void *)&uint8_t buf[4] = v37;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = a3;
              *(_WORD *)&unsigned char buf[22] = 2048;
              uint64_t v46 = (void *)v15;
              uint64_t v24 = "error: Client (%s) session (%llu): file size too large (%zu)";
            }
            else
            {
              char v28 = **(NSObject ***)(a1 + 128);
              if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                goto LABEL_52;
              }
              uint64_t v33 = hsfiler::support::to_string(a2);
              uint64_t v36 = v13[5];
              uint64_t v35 = v13 + 5;
              __int16 v34 = (void *)v36;
              if (*((char *)v35 + 23) >= 0) {
                __int16 v34 = v35;
              }
              *(_DWORD *)std::string buf = 136315650;
              *(void *)&uint8_t buf[4] = v33;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = a3;
              *(_WORD *)&unsigned char buf[22] = 2080;
              uint64_t v46 = v34;
              uint64_t v24 = "error: Client (%s) session (%llu): invalid file size (%s)";
            }
          }
          else
          {
            char v28 = **(NSObject ***)(a1 + 128);
            if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              goto LABEL_52;
            }
            uint64_t v29 = hsfiler::support::to_string(a2);
            uint64_t v32 = v13[5];
            uint64_t v31 = v13 + 5;
            uint64_t v30 = (void *)v32;
            if (*((char *)v31 + 23) >= 0) {
              uint64_t v30 = v31;
            }
            *(_DWORD *)std::string buf = 136315650;
            *(void *)&uint8_t buf[4] = v29;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = a3;
            *(_WORD *)&unsigned char buf[22] = 2080;
            uint64_t v46 = v30;
            uint64_t v24 = "error: Client (%s) session (%llu): failed to get file size (%s)";
          }
          uint32_t v27 = v28;
LABEL_55:
          _os_log_error_impl(&dword_2637D5000, v27, OS_LOG_TYPE_ERROR, v24, buf, 0x20u);
          BOOL v18 = 0;
          goto LABEL_25;
        }
        uint64_t v21 = **(NSObject ***)(a1 + 128);
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          goto LABEL_52;
        }
        uint64_t v25 = hsfiler::support::to_string(a2);
        if (*(char *)(a4 + 23) >= 0) {
          uint64_t v26 = (void *)a4;
        }
        else {
          uint64_t v26 = *(void **)a4;
        }
        *(_DWORD *)std::string buf = 136315650;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a3;
        *(_WORD *)&unsigned char buf[22] = 2080;
        uint64_t v46 = v26;
        uint64_t v24 = "error: Client (%s) session (%llu): failed to open file (%s)";
      }
      else
      {
        uint64_t v21 = **(NSObject ***)(a1 + 128);
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          goto LABEL_52;
        }
        uint64_t v22 = hsfiler::support::to_string(a2);
        if (*(char *)(a4 + 23) >= 0) {
          uint64_t v23 = (void *)a4;
        }
        else {
          uint64_t v23 = *(void **)a4;
        }
        *(_DWORD *)std::string buf = 136315650;
        *(void *)&uint8_t buf[4] = v22;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a3;
        *(_WORD *)&unsigned char buf[22] = 2080;
        uint64_t v46 = v23;
        uint64_t v24 = "error: Client (%s) session (%llu): failed to create file (%s)";
      }
      uint32_t v27 = v21;
      goto LABEL_55;
    }
  }
  else if (*(unsigned char *)(a5 + 23))
  {
    std::string v40 = *(std::string *)a5;
    goto LABEL_6;
  }
  BOOL v20 = **(NSObject ***)(a1 + 128);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = hsfiler::support::to_string(a2);
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    _os_log_error_impl(&dword_2637D5000, v20, OS_LOG_TYPE_ERROR, "error: Client (%s) session (%llu): invalid file path", buf, 0x16u);
  }
  return 0;
}

void sub_2637E2B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2637E2BEC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  JUMPOUT(0x2637E2BDCLL);
}

BOOL HSFilerRT_Internal::writeWithStream(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, void *a5, const void **a6)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (!*a5 || *(_DWORD *)(*a5 + *(void *)(*(void *)*a5 - 24) + 32))
  {
    uint64_t v19 = **(NSObject ***)(a1 + 128);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)std::string buf = 136315394;
    uint64_t v37 = hsfiler::support::to_string(a2);
    __int16 v38 = 2048;
    uint64_t v39 = a3;
    BOOL v20 = "error: Client (%s) session (%llu): invalid input stream";
    uint64_t v21 = v19;
    uint32_t v22 = 22;
LABEL_22:
    _os_log_error_impl(&dword_2637D5000, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);
    return 0;
  }
  std::istream::seekg();
  std::istream::tellg();
  uint64_t v12 = v42;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v35 = 0;
  std::istream::seekg();
  if ((unint64_t)(v42 - 15728641) <= 0xFFFFFFFFFF0FFFFFLL)
  {
    uint64_t v23 = **(NSObject ***)(a1 + 128);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)std::string buf = 136315650;
    uint64_t v37 = hsfiler::support::to_string(a2);
    __int16 v38 = 2048;
    uint64_t v39 = a3;
    __int16 v40 = 2048;
    uint64_t v41 = v42;
    BOOL v20 = "error: Client (%s) session (%llu): invalid input stream size %zu";
    uint64_t v21 = v23;
    uint32_t v22 = 32;
    goto LABEL_22;
  }
  if (*a6)
  {
    uint64_t v13 = _Block_copy(*a6);
    uint64_t v24 = v13;
    uint64_t v15 = (void *)*a5;
    uint64_t v14 = a5[1];
    if (!v14) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = 0;
  uint64_t v24 = 0;
  uint64_t v15 = (void *)*a5;
  uint64_t v14 = a5[1];
  if (v14) {
LABEL_6:
  }
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 8), 1uLL, memory_order_relaxed);
LABEL_7:
  uint64_t v16 = operator new(0x28uLL);
  void *v16 = &unk_270EAF4D0;
  v16[1] = a1;
  uint64_t v16[2] = v15;
  v16[3] = v14;
  v16[4] = v12;
  uint64_t v26 = v16;
  BOOL v17 = HSFilerRT_Internal::write(a1, a2, a3, a4, v12, &v24, v25);
  if (v26 == v25)
  {
    (*(void (**)(void *))(v25[0] + 32))(v25);
    if (!v13) {
      return v17;
    }
LABEL_15:
    _Block_release(v13);
    return v17;
  }
  if (v26) {
    (*(void (**)(void))(*v26 + 40))();
  }
  if (v13) {
    goto LABEL_15;
  }
  return v17;
}

void sub_2637E2F0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN18HSFilerRT_Internal10endSessionEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(HSFilerRT_Internal **)(a1 + 32);
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)v1 + 25);
  if (v2)
  {
    uint64_t v3 = std::__shared_weak_count::lock(v2);
    uint64_t v21 = v3;
    if (!v3) {
      return;
    }
    uint64_t v4 = *((void *)v1 + 24);
    uint64_t v20 = v4;
    if (v4)
    {
      uint64_t v18 = v4;
      uint64_t v19 = v3;
      atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
      char v5 = (*(uint64_t (**)(HSFilerRT_Internal *, uint64_t *))(*(void *)v1 + 32))(v1, &v18);
      char v6 = v5;
      uint64_t v7 = v19;
      if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
        uint64_t v8 = v20;
        if (v6) {
          goto LABEL_7;
        }
      }
      else
      {
        uint64_t v8 = v20;
        if (v5)
        {
LABEL_7:
          *(unsigned char *)(v8 + 114) = 0;
          (*(void (**)(uint64_t))(*(void *)v8 + 16))(v8);
          uint64_t v9 = (std::__shared_weak_count *)*((void *)v1 + 25);
          *((void *)v1 + 24) = 0;
          *((void *)v1 + 25) = 0;
          if (v9) {
            std::__shared_weak_count::__release_weak(v9);
          }
          uint64_t v10 = *(void *)(v8 + 32);
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 1174405120;
          v15[2] = ___ZN18HSFilerRT_Internal10endSessionEv_block_invoke_2;
          v15[3] = &__block_descriptor_tmp_53;
          v15[4] = v8;
          uint64_t v16 = v21;
          if (v21) {
            atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          uint64_t v17 = v10;
          dispatch_async(*(dispatch_queue_t *)(v8 + 80), v15);
          HSFilerRT_Internal::sessionScheduler_sync(v1);
          std::string::size_type v11 = v16;
          if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
            std::__shared_weak_count::__release_weak(v11);
          }
          goto LABEL_18;
        }
      }
      unsigned int v12 = *(_DWORD *)(v8 + 24);
      unint64_t v13 = *(void *)(v8 + 32);
      char v22 = 0;
      HSFilerRT_Internal::abortSession_sync((uint64_t)v1, v12, v13, -6, &v22);
      if (v22) {
        HSFilerRT_Internal::resetBaseband_sync((uint64_t)v1, v12, v13, -6);
      }
      else {
        HSFilerRT_Internal::sessionScheduler_sync(v1);
      }
    }
  }
LABEL_18:
  uint64_t v14 = v21;
  if (v21)
  {
    if (!atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
}

void sub_2637E31F4(_Unwind_Exception *a1)
{
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](v1);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](v2 - 56);
  _Unwind_Resume(a1);
}

void sub_2637E321C(_Unwind_Exception *a1)
{
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](v1 - 56);
  _Unwind_Resume(a1);
}

uint64_t ___ZN18HSFilerRT_Internal10endSessionEv_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(*(void *)(a1 + 32) + 88) + 16))(*(void *)(*(void *)(a1 + 32) + 88), *(void *)(a1 + 48), 1);
}

void HSFilerRT_Internal::abortSession_sync(uint64_t a1, unsigned int a2, unint64_t a3, int a4, unsigned char *a5)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  HSFilerRT_Internal::findSession_sync((uint64_t *)a1, a2, a3, &v27);
  unint64_t v10 = v27;
  if (v27)
  {
    std::string::size_type v11 = **(NSObject ***)(a1 + 128);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = hsfiler::support::to_string(a2);
      char v22 = hsfiler::support::to_string(a4);
      *(_DWORD *)std::string buf = 136315650;
      long long v30 = v21;
      __int16 v31 = 2048;
      unint64_t v32 = a3;
      __int16 v33 = 2080;
      long long v34 = v22;
      _os_log_error_impl(&dword_2637D5000, v11, OS_LOG_TYPE_ERROR, "error: Client (%s) session (%llu) aborted with reason: %s", buf, 0x20u);
    }
    (*(void (**)(unint64_t))(*(void *)v10 + 16))(v10);
    unsigned int v12 = *(const void **)(v10 + 88);
    if (v12) {
      unint64_t v13 = _Block_copy(v12);
    }
    else {
      unint64_t v13 = 0;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN18HSFilerRT_Internal17abortSession_syncE15HSFilerClientIDy13HSFilerStatusRb_block_invoke;
    block[3] = &__block_descriptor_tmp_55;
    if (v13) {
      uint64_t v14 = _Block_copy(v13);
    }
    else {
      uint64_t v14 = 0;
    }
    aBlocuint64_t k = v14;
    unint64_t v25 = a3;
    int v26 = a4;
    dispatch_async(*(dispatch_queue_t *)(v10 + 80), block);
    if (aBlock) {
      _Block_release(aBlock);
    }
    if (v13) {
      _Block_release(v13);
    }
  }
  *a5 = 0;
  uint64_t v15 = *(std::__shared_weak_count **)(a1 + 200);
  if (v15)
  {
    uint64_t v16 = std::__shared_weak_count::lock(v15);
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)(a1 + 192);
      if (v18 && *(void *)(v18 + 32) == a3)
      {
        uint64_t v19 = *(std::__shared_weak_count **)(a1 + 200);
        *(void *)(a1 + 192) = 0;
        *(void *)(a1 + 200) = 0;
        if (v19) {
          std::__shared_weak_count::__release_weak(v19);
        }
        *a5 = 1;
      }
      if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }
  uint64_t v20 = (std::__shared_weak_count *)v28;
  if (v28)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(v28 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
}

void sub_2637E34F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_2637E352C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ___ZN18HSFilerRT_Internal17abortSession_syncE15HSFilerClientIDy13HSFilerStatusRb_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

void *__copy_helper_block_e8_32c58_ZTSN8dispatch5blockIU13block_pointerFvy13HSFilerStatusEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 32);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c58_ZTSN8dispatch5blockIU13block_pointerFvy13HSFilerStatusEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void HSFilerRT_Internal::resetBaseband_sync(uint64_t a1, unsigned int a2, unint64_t a3, int a4)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 216)) {
    return;
  }
  memset(&v47, 170, sizeof(v47));
  uint64_t v7 = hsfiler::support::to_string(a2);
  size_t v8 = strlen(v7);
  if (v8 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  std::string::size_type v9 = v8;
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    p_dst = (std::string *)operator new(v11 + 1);
    __dst.__r_.__value_.__l.__size_ = v9;
    __dst.__r_.__value_.__r.__words[2] = v12 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_9;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v8;
  p_dst = &__dst;
  if (v8) {
LABEL_9:
  }
    memmove(p_dst, v7, v9);
  p_dst->__r_.__value_.__s.__data_[v9] = 0;
  unint64_t v13 = std::string::insert(&__dst, 0, "client (", 8uLL);
  long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  v43.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v43.__r_.__value_.__l.__data_ = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  uint64_t v15 = std::string::append(&v43, ") session (", 0xBuLL);
  long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  v44.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&v41, a3);
  if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v17 = &v41;
  }
  else {
    uint64_t v17 = (std::string *)v41.__r_.__value_.__r.__words[0];
  }
  if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v41.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v41.__r_.__value_.__l.__size_;
  }
  uint64_t v19 = std::string::append(&v44, (const std::string::value_type *)v17, size);
  long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  v45.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  uint64_t v21 = std::string::append(&v45, ") status (", 0xAuLL);
  long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  v46.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v46.__r_.__value_.__l.__data_ = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  uint64_t v23 = hsfiler::support::to_string(a4);
  size_t v24 = strlen(v23);
  if (v24 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v25 = v24;
  if (v24 >= 0x17)
  {
    uint64_t v27 = (v24 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v24 | 7) != 0x17) {
      uint64_t v27 = v24 | 7;
    }
    uint64_t v28 = v27 + 1;
    p_p = operator new(v27 + 1);
    std::string::size_type v39 = v25;
    int64_t v40 = v28 | 0x8000000000000000;
    std::string __p = p_p;
    goto LABEL_23;
  }
  HIBYTE(v40) = v24;
  p_p = &__p;
  if (v24) {
LABEL_23:
  }
    memmove(p_p, v23, v25);
  *((unsigned char *)p_p + v25) = 0;
  if (v40 >= 0) {
    long long v29 = (const std::string::value_type *)&__p;
  }
  else {
    long long v29 = (const std::string::value_type *)__p;
  }
  if (v40 >= 0) {
    std::string::size_type v30 = HIBYTE(v40);
  }
  else {
    std::string::size_type v30 = v39;
  }
  __int16 v31 = std::string::append(&v46, v29, v30);
  long long v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
  v48.__r_.__value_.__r.__words[2] = v31->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v48.__r_.__value_.__l.__data_ = v32;
  v31->__r_.__value_.__l.__size_ = 0;
  v31->__r_.__value_.__r.__words[2] = 0;
  v31->__r_.__value_.__r.__words[0] = 0;
  __int16 v33 = std::string::append(&v48, ")", 1uLL);
  long long v34 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
  v47.__r_.__value_.__r.__words[2] = v33->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v47.__r_.__value_.__l.__data_ = v34;
  v33->__r_.__value_.__l.__size_ = 0;
  v33->__r_.__value_.__r.__words[2] = 0;
  v33->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v48.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v40) & 0x80000000) == 0)
    {
LABEL_32:
      if ((SHIBYTE(v46.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_33;
      }
      goto LABEL_44;
    }
  }
  else if ((SHIBYTE(v40) & 0x80000000) == 0)
  {
    goto LABEL_32;
  }
  operator delete(__p);
  if ((SHIBYTE(v46.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_33:
    if ((SHIBYTE(v45.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_45;
  }
LABEL_44:
  operator delete(v46.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v45.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_34:
    if ((SHIBYTE(v41.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_46;
  }
LABEL_45:
  operator delete(v45.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v41.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_35:
    if ((SHIBYTE(v44.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_47;
  }
LABEL_46:
  operator delete(v41.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v44.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_36:
    if ((SHIBYTE(v43.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_48;
  }
LABEL_47:
  operator delete(v44.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v43.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_37:
    if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_49;
  }
LABEL_48:
  operator delete(v43.__r_.__value_.__l.__data_);
  if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_38:
    uint64_t v35 = **(NSObject ***)(a1 + 128);
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
LABEL_50:
    uint64_t v37 = &v47;
    if ((v47.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      uint64_t v37 = (std::string *)v47.__r_.__value_.__r.__words[0];
    }
    LODWORD(v48.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)v48.__r_.__value_.__r.__words + 4) = (std::string::size_type)v37;
    _os_log_error_impl(&dword_2637D5000, v35, OS_LOG_TYPE_ERROR, "error: Requesting baseband reset due to: %s", (uint8_t *)&v48, 0xCu);
    uint64_t v36 = *(void *)(a1 + 208);
    if (v36) {
      goto LABEL_40;
    }
LABEL_53:
    HSFilerRT_Internal::sessionScheduler_sync((HSFilerRT_Internal *)a1);
    goto LABEL_56;
  }
LABEL_49:
  operator delete(__dst.__r_.__value_.__l.__data_);
  uint64_t v35 = **(NSObject ***)(a1 + 128);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
    goto LABEL_50;
  }
LABEL_39:
  uint64_t v36 = *(void *)(a1 + 208);
  if (!v36) {
    goto LABEL_53;
  }
LABEL_40:
  *(unsigned char *)(a1 + 216) = 1;
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v48, v47.__r_.__value_.__l.__data_, v47.__r_.__value_.__l.__size_);
  }
  else {
    std::string v48 = v47;
  }
  (*(void (**)(uint64_t, std::string *))(v36 + 16))(v36, &v48);
  if ((SHIBYTE(v48.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_56:
    if ((SHIBYTE(v47.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return;
    }
    goto LABEL_57;
  }
  operator delete(v48.__r_.__value_.__l.__data_);
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0) {
LABEL_57:
  }
    operator delete(v47.__r_.__value_.__l.__data_);
}

void sub_2637E3A48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,void *a42,uint64_t a43,int a44,__int16 a45,char a46,char a47,uint64_t a48,void *a49,uint64_t a50,int a51,__int16 a52,char a53,char a54)
{
  if (*(char *)(v54 - 121) < 0)
  {
    operator delete(*(void **)(v54 - 144));
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void HSFilerRT_Internal::logSessionStatus_sync(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a2;
  if (*a2)
  {
    char v5 = **(NSObject ***)(a1 + 128);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      char v6 = hsfiler::support::to_string(*(_DWORD *)(v2 + 24));
      uint64_t v7 = *a2;
      uint64_t v8 = *(void *)(*a2 + 32);
      if (*(unsigned char *)(*a2 + 112)) {
        std::string::size_type v9 = "read";
      }
      else {
        std::string::size_type v9 = "write";
      }
      int v10 = *(_DWORD *)(v7 + 96);
      int v11 = *(_DWORD *)(v7 + 100);
      uint64_t v12 = "TRUE";
      if (*(unsigned char *)(v7 + 113)) {
        unint64_t v13 = "TRUE";
      }
      else {
        unint64_t v13 = "FALSE";
      }
      if (!*(unsigned char *)(v7 + 114)) {
        uint64_t v12 = "FALSE";
      }
      uint64_t v14 = *(void *)(v7 + 64);
      *(_DWORD *)std::string buf = 136316930;
      uint64_t v18 = v6;
      __int16 v19 = 2048;
      uint64_t v20 = v8;
      __int16 v21 = 2080;
      long long v22 = v9;
      __int16 v23 = 1024;
      int v24 = v10;
      __int16 v25 = 1024;
      int v26 = v11;
      __int16 v27 = 2080;
      uint64_t v28 = v13;
      __int16 v29 = 2080;
      std::string::size_type v30 = v12;
      __int16 v31 = 2048;
      uint64_t v32 = v14;
      _os_log_impl(&dword_2637D5000, v5, OS_LOG_TYPE_DEFAULT, "Client (%s) session (%llu): %s sequenceID(%u) timeout(%u sec) queued(%s) started(%s) files(%lu)", buf, 0x4Au);
      uint64_t v2 = *a2;
    }
    uint64_t v15 = (std::__shared_weak_count *)a2[1];
    v16[0] = v2;
    v16[1] = v15;
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    HSFilerRT_Internal::logSessionFileTransferStatus_sync(a1, (uint64_t)v16);
    if (v15)
    {
      if (!atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
}

void sub_2637E3D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL HSFilerRT_Internal::statusFatal(uint64_t a1, int a2)
{
  return (a2 + 10) <= 5 && a2 != -7 || a2 == 0x7FFFFFFF;
}

void HSFilerRT_Internal::basebandReadyEventHandler(HSFilerRT_Internal *this)
{
  uint64_t v2 = **((void **)this + 16);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_2637D5000, v2, OS_LOG_TYPE_DEFAULT, "Received baseband ready event", buf, 2u);
  }
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = ___ZN18HSFilerRT_Internal25basebandReadyEventHandlerEv_block_invoke;
  v3[3] = &__block_descriptor_tmp_64;
  v3[4] = this;
  ctu::SharedSynchronizable<HSFilerRT_Internal>::execute_wrapped((uint64_t *)this + 1, (uint64_t)v3);
}

void ___ZN18HSFilerRT_Internal25basebandReadyEventHandlerEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = **(NSObject ***)(v1 + 128);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_2637D5000, v2, OS_LOG_TYPE_DEFAULT, "Processing baseband ready event", v3, 2u);
  }
  *(unsigned char *)(v1 + 216) = 0;
  HSFilerRT_Internal::sessionScheduler_sync((HSFilerRT_Internal *)v1);
}

void HSFilerRT_Internal::basebandResetEventHandler(HSFilerRT_Internal *this)
{
  uint64_t v2 = **((void **)this + 16);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_2637D5000, v2, OS_LOG_TYPE_DEFAULT, "Received baseband reset event", buf, 2u);
  }
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = ___ZN18HSFilerRT_Internal25basebandResetEventHandlerEv_block_invoke;
  v3[3] = &__block_descriptor_tmp_65;
  v3[4] = this;
  ctu::SharedSynchronizable<HSFilerRT_Internal>::execute_wrapped((uint64_t *)this + 1, (uint64_t)v3);
}

void ___ZN18HSFilerRT_Internal25basebandResetEventHandlerEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = **(NSObject ***)(v1 + 128);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_2637D5000, v2, OS_LOG_TYPE_DEFAULT, "Processing baseband reset event", buf, 2u);
  }
  *(unsigned char *)(v1 + 216) = 1;
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 200);
  if (v3)
  {
    uint64_t v4 = std::__shared_weak_count::lock(v3);
    std::string::size_type v9 = v4;
    if (v4)
    {
      char v5 = v4;
      uint64_t v6 = *(void *)(v1 + 192);
      *(void *)std::string buf = v6;
      if (v6) {
        HSFilerRT_Internal::abortSession_sync(v1, *(_DWORD *)(v6 + 24), *(void *)(v6 + 32), -15, &v7);
      }
      if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
}

void sub_2637E4094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void HSFilerRT_Internal::registerBasebandResetDelegate(uint64_t a1, const void **a2)
{
  uint64_t v3 = *a2;
  if (*a2)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 1174405120;
    v7[2] = ___ZN18HSFilerRT_Internal29registerBasebandResetDelegateEN8dispatch5blockIU13block_pointerFvNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEEE_block_invoke;
    v7[3] = &__block_descriptor_tmp_66_0;
    v7[4] = a1;
    aBlocuint64_t k = _Block_copy(v3);
    std::string::size_type v9 = v7;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZNK3ctu20SharedSynchronizableI18HSFilerRT_InternalE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
    block[3] = &__block_descriptor_tmp_83;
    void block[4] = a1 + 8;
    void block[5] = &v9;
    uint64_t v4 = *(NSObject **)(a1 + 24);
    if (*(void *)(a1 + 32))
    {
      dispatch_async_and_wait(v4, block);
      char v5 = aBlock;
      if (!aBlock) {
        return;
      }
LABEL_8:
      _Block_release(v5);
      return;
    }
    dispatch_sync(v4, block);
    char v5 = aBlock;
    if (aBlock) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = **(NSObject ***)(a1 + 128);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(block[0]) = 0;
      _os_log_error_impl(&dword_2637D5000, v6, OS_LOG_TYPE_ERROR, "error: NULL resetCb param", (uint8_t *)block, 2u);
    }
  }
}

void ___ZN18HSFilerRT_Internal29registerBasebandResetDelegateEN8dispatch5blockIU13block_pointerFvNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = **(NSObject ***)(v2 + 128);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_2637D5000, v3, OS_LOG_TYPE_DEFAULT, "Baseband reset delegate registered", v6, 2u);
  }
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4) {
    uint64_t v4 = _Block_copy(v4);
  }
  char v5 = *(const void **)(v2 + 208);
  *(void *)(v2 + 208) = v4;
  if (v5) {
    _Block_release(v5);
  }
}

void *__copy_helper_block_e8_40c106_ZTSN8dispatch5blockIU13block_pointerFvNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 40);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c106_ZTSN8dispatch5blockIU13block_pointerFvNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

void HSFilerRT_Internal::dumpState(HSFilerRT_Internal *this)
{
  v1[0] = MEMORY[0x263EF8330];
  v1[1] = 0x40000000;
  v1[2] = ___ZN18HSFilerRT_Internal9dumpStateEv_block_invoke;
  v1[3] = &__block_descriptor_tmp_67;
  v1[4] = this;
  ctu::SharedSynchronizable<HSFilerRT_Internal>::execute_wrapped((uint64_t *)this + 1, (uint64_t)v1);
}

void ___ZN18HSFilerRT_Internal9dumpStateEv_block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = **(NSObject ***)(v1 + 128);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_2637D5000, v2, OS_LOG_TYPE_DEFAULT, " ------ HSFiler State Dump BEGIN ------ ", buf, 2u);
  }
  uint64_t v3 = *(void **)(v1 + 40);
  if (v3 != (void *)(v1 + 48))
  {
    while (1)
    {
      uint64_t v4 = **(NSObject ***)(v1 + 128);
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        char v5 = (void *)v3[5];
        uint64_t v6 = v3 + 6;
        if (v5 != v3 + 6) {
          goto LABEL_14;
        }
        goto LABEL_10;
      }
      char v7 = hsfiler::support::to_string(*((_DWORD *)v3 + 8));
      uint64_t v8 = v3[7];
      *(_DWORD *)std::string buf = 136315394;
      uint64_t v18 = v7;
      __int16 v19 = 2048;
      uint64_t v20 = v8;
      _os_log_impl(&dword_2637D5000, v4, OS_LOG_TYPE_DEFAULT, "Client (%s) has %lu sessions", buf, 0x16u);
      char v5 = (void *)v3[5];
      uint64_t v6 = v3 + 6;
      if (v5 != v3 + 6) {
        break;
      }
LABEL_10:
      std::string::size_type v9 = (void *)v3[1];
      if (v9)
      {
        do
        {
          int v10 = v9;
          std::string::size_type v9 = (void *)*v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          int v10 = (void *)v3[2];
          BOOL v14 = *v10 == (void)v3;
          uint64_t v3 = v10;
        }
        while (!v14);
      }
      uint64_t v3 = v10;
      if (v10 == (void *)(v1 + 48)) {
        goto LABEL_28;
      }
    }
    while (1)
    {
LABEL_14:
      int v11 = (std::__shared_weak_count *)v5[6];
      v16[0] = v5[5];
      v16[1] = v11;
      if (v11) {
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      HSFilerRT_Internal::logSessionStatus_sync(v1, v16);
      if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
        uint64_t v12 = (void *)v5[1];
        if (!v12)
        {
          do
          {
LABEL_22:
            unint64_t v13 = (void *)v5[2];
            BOOL v14 = *v13 == (void)v5;
            char v5 = v13;
          }
          while (!v14);
          goto LABEL_13;
        }
      }
      else
      {
        uint64_t v12 = (void *)v5[1];
        if (!v12) {
          goto LABEL_22;
        }
      }
      do
      {
        unint64_t v13 = v12;
        uint64_t v12 = (void *)*v12;
      }
      while (v12);
LABEL_13:
      char v5 = v13;
      if (v13 == v6) {
        goto LABEL_10;
      }
    }
  }
LABEL_28:
  uint64_t v15 = **(NSObject ***)(v1 + 128);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_2637D5000, v15, OS_LOG_TYPE_DEFAULT, " ------ HSFiler State Dump END ------ ", buf, 2u);
  }
}

void sub_2637E45F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__tree_node<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,void *> *,long>>>(uint64_t *result, void *a2, void *a3)
{
  if (a2 != a3)
  {
    uint64_t v4 = a2;
    char v5 = result;
    uint64_t v6 = result + 1;
    while (1)
    {
      char v7 = (uint64_t *)v5[1];
      uint64_t v8 = v6;
      if ((uint64_t *)*v5 != v6)
      {
        std::string::size_type v9 = (uint64_t *)v5[1];
        int v10 = v6;
        if (v7)
        {
          do
          {
            uint64_t v8 = v9;
            std::string::size_type v9 = (uint64_t *)v9[1];
          }
          while (v9);
        }
        else
        {
          do
          {
            uint64_t v8 = (uint64_t *)v10[2];
            BOOL v11 = *v8 == (void)v10;
            int v10 = v8;
          }
          while (v11);
        }
        unint64_t v12 = v4[4];
        if (v8[4] >= v12) {
          break;
        }
      }
      if (v7) {
        unint64_t v13 = (uint64_t **)v8;
      }
      else {
        unint64_t v13 = (uint64_t **)v6;
      }
      if (v7) {
        BOOL v14 = (uint64_t **)(v8 + 1);
      }
      else {
        BOOL v14 = (uint64_t **)v6;
      }
      if (!*v14) {
        goto LABEL_25;
      }
LABEL_30:
      uint64_t v21 = (void *)v4[1];
      if (v21)
      {
        do
        {
          long long v22 = v21;
          uint64_t v21 = (void *)*v21;
        }
        while (v21);
      }
      else
      {
        do
        {
          long long v22 = (void *)v4[2];
          BOOL v11 = *v22 == (void)v4;
          uint64_t v4 = v22;
        }
        while (!v11);
      }
      uint64_t v4 = v22;
      if (v22 == a3) {
        return result;
      }
    }
    BOOL v14 = (uint64_t **)v6;
    unint64_t v13 = (uint64_t **)v6;
    if (v7)
    {
      while (1)
      {
        while (1)
        {
          unint64_t v13 = (uint64_t **)v7;
          unint64_t v15 = v7[4];
          if (v15 <= v12) {
            break;
          }
          char v7 = *v13;
          BOOL v14 = v13;
          if (!*v13) {
            goto LABEL_25;
          }
        }
        if (v15 >= v12) {
          goto LABEL_30;
        }
        char v7 = v13[1];
        if (!v7)
        {
          BOOL v14 = v13 + 1;
          break;
        }
      }
    }
LABEL_25:
    long long v16 = (uint64_t *)operator new(0x38uLL);
    uint64_t v17 = v16;
    uint64_t v18 = v4[5];
    v16[4] = v4[4];
    v16[5] = v18;
    uint64_t v19 = v4[6];
    v16[6] = v19;
    if (v19) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v19 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t *v16 = 0;
    v16[1] = 0;
    void v16[2] = (uint64_t)v13;
    void *v14 = v16;
    uint64_t v20 = *(void *)*v5;
    if (v20)
    {
      *char v5 = v20;
      uint64_t v17 = *v14;
    }
    uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v5[1], v17);
    ++v5[2];
    goto LABEL_30;
  }
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 == result) {
    return result;
  }
  while (1)
  {
    uint64_t v2 = a2[2];
    if (*(unsigned char *)(v2 + 24)) {
      return result;
    }
    uint64_t v3 = *(uint64_t **)(v2 + 16);
    uint64_t v4 = *v3;
    if (*v3 != v2) {
      break;
    }
    uint64_t v7 = v3[1];
    if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), char v5 = (unsigned char *)(v7 + 24), v8))
    {
      if (*(uint64_t **)v2 == a2)
      {
        *(unsigned char *)(v2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        uint64_t *v3 = v11;
        if (v11) {
          goto LABEL_15;
        }
      }
      else
      {
        std::string::size_type v9 = *(uint64_t **)(v2 + 8);
        uint64_t v10 = *v9;
        *(void *)(v2 + 8) = *v9;
        if (v10)
        {
          *(void *)(v10 + 16) = v2;
          uint64_t v3 = *(uint64_t **)(v2 + 16);
        }
        v9[2] = (uint64_t)v3;
        *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = v9;
        *std::string::size_type v9 = v2;
        *(void *)(v2 + 16) = v9;
        uint64_t v3 = (uint64_t *)v9[2];
        uint64_t v2 = *v3;
        *((unsigned char *)v9 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        uint64_t *v3 = v11;
        if (v11) {
LABEL_15:
        }
          *(void *)(v11 + 16) = v3;
      }
      *(void *)(v2 + 16) = v3[2];
      *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
      *(void *)(v2 + 8) = v3;
      v3[2] = v2;
      return result;
    }
LABEL_3:
    *(unsigned char *)(v2 + 24) = 1;
    a2 = v3;
    *((unsigned char *)v3 + 24) = v3 == result;
    *char v5 = 1;
    if (v3 == result) {
      return result;
    }
  }
  if (v4)
  {
    int v6 = *(unsigned __int8 *)(v4 + 24);
    char v5 = (unsigned char *)(v4 + 24);
    if (!v6) {
      goto LABEL_3;
    }
  }
  if (*(uint64_t **)v2 == a2)
  {
    uint64_t v12 = a2[1];
    *(void *)uint64_t v2 = v12;
    if (v12)
    {
      *(void *)(v12 + 16) = v2;
      uint64_t v3 = *(uint64_t **)(v2 + 16);
    }
    a2[2] = (uint64_t)v3;
    *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = a2;
    a2[1] = v2;
    *(void *)(v2 + 16) = a2;
    uint64_t v3 = (uint64_t *)a2[2];
  }
  else
  {
    a2 = (uint64_t *)a2[2];
  }
  *((unsigned char *)a2 + 24) = 1;
  *((unsigned char *)v3 + 24) = 0;
  unint64_t v13 = (uint64_t *)v3[1];
  uint64_t v14 = *v13;
  v3[1] = *v13;
  if (v14) {
    *(void *)(v14 + 16) = v3;
  }
  v13[2] = v3[2];
  *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v13;
  uint64_t *v13 = (uint64_t)v3;
  v3[2] = (uint64_t)v13;
  return result;
}

void std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy(a1, a2[1]);
    uint64_t v4 = (std::__shared_weak_count *)a2[6];
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      char v5 = a2;
    }
    else
    {
      char v5 = a2;
    }
    operator delete(v5);
  }
}

void std::__shared_ptr_emplace<HSFilerRT_Internal_INT::Session_INT>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAF160;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<HSFilerRT_Internal_INT::Session_INT>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAF160;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<HSFilerRT_Internal_INT::Session_INT>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t *std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::find<std::string>(void *a1, uint64_t a2)
{
  uint64_t v2 = (unsigned char *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v5 = v4;
  }
  unint64_t v6 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v25, (uint64_t *)a2, v5);
  int8x8_t v7 = (int8x8_t)a1[1];
  if (!*(void *)&v7) {
    return 0;
  }
  unint64_t v8 = v6;
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v7);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v10 = v6;
    if (v6 >= *(void *)&v7) {
      unint64_t v10 = v6 % *(void *)&v7;
    }
  }
  else
  {
    unint64_t v10 = (*(void *)&v7 - 1) & v6;
  }
  uint64_t v12 = *(uint64_t ***)(*a1 + 8 * v10);
  if (v12)
  {
    unint64_t v13 = *v12;
    if (*v12)
    {
      char v14 = v2[23];
      if (v14 >= 0) {
        uint64_t v15 = v2[23];
      }
      else {
        uint64_t v15 = *((void *)v2 + 1);
      }
      if (v14 < 0) {
        uint64_t v2 = *(unsigned char **)v2;
      }
      if (v9.u32[0] < 2uLL)
      {
        uint64_t v16 = *(void *)&v7 - 1;
        while (1)
        {
          uint64_t v21 = v13[1];
          if (v21 == v8)
          {
            uint64_t v22 = *((unsigned __int8 *)v13 + 39);
            if ((v22 & 0x80u) == 0) {
              uint64_t v23 = *((unsigned __int8 *)v13 + 39);
            }
            else {
              uint64_t v23 = v13[3];
            }
            if (v23 == v15)
            {
              if ((v22 & 0x80) != 0)
              {
                if (!memcmp((const void *)v13[2], v2, v13[3])) {
                  return v13;
                }
              }
              else
              {
                if (!*((unsigned char *)v13 + 39)) {
                  return v13;
                }
                uint64_t v24 = 0;
                while (*((unsigned __int8 *)v13 + v24 + 16) == v2[v24])
                {
                  if (v22 == ++v24) {
                    return v13;
                  }
                }
              }
            }
          }
          else if ((v21 & v16) != v10)
          {
            return 0;
          }
          uint64_t result = 0;
          unint64_t v13 = (uint64_t *)*v13;
          if (!v13) {
            return result;
          }
        }
      }
      while (1)
      {
        unint64_t v17 = v13[1];
        if (v17 == v8)
        {
          uint64_t v18 = *((unsigned __int8 *)v13 + 39);
          if ((v18 & 0x80u) == 0) {
            uint64_t v19 = *((unsigned __int8 *)v13 + 39);
          }
          else {
            uint64_t v19 = v13[3];
          }
          if (v19 == v15)
          {
            if ((v18 & 0x80) != 0)
            {
              if (!memcmp((const void *)v13[2], v2, v13[3])) {
                return v13;
              }
            }
            else
            {
              if (!*((unsigned char *)v13 + 39)) {
                return v13;
              }
              uint64_t v20 = 0;
              while (*((unsigned __int8 *)v13 + v20 + 16) == v2[v20])
              {
                if (v18 == ++v20) {
                  return v13;
                }
              }
            }
          }
        }
        else
        {
          if (v17 >= *(void *)&v7) {
            v17 %= *(void *)&v7;
          }
          if (v17 != v10) {
            return 0;
          }
        }
        uint64_t result = 0;
        unint64_t v13 = (uint64_t *)*v13;
        if (!v13) {
          return result;
        }
      }
    }
  }
  return 0;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v23 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v24 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v25 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v27 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v26 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v28 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v29 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v30 = v26 + v28;
      unint64_t v31 = 0x9DDFEA08EB382D69
          * (v25 ^ ((0x9DDFEA08EB382D69 * (v25 ^ (v23 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v25 ^ (v23 + a3))));
      unint64_t v32 = 0x9DDFEA08EB382D69 * (v31 ^ (v31 >> 47));
      unint64_t v33 = v23 + v26 + v27 + a3;
      uint64_t v34 = v33 + v24;
      unint64_t v35 = __ROR8__(v33, 44) + v27 + a3 + __ROR8__(v27 + a3 + v24 - 0x622015F714C7D297 * (v31 ^ (v31 >> 47)), 21);
      uint64_t v36 = v26 + v28 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v37 = v25 + v28 + v36;
      uint64_t v38 = __ROR8__(v37, 44);
      uint64_t v39 = v37 + v29;
      uint64_t v40 = v38 + v36 + __ROR8__(v36 + v24 + v29, 21);
      uint64_t v42 = *a2;
      std::string v41 = a2 + 4;
      unint64_t v43 = v42 - 0x4B6D499041670D8DLL * v24;
      uint64_t v44 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v45 = *(v41 - 3);
        uint64_t v46 = v43 + v34 + v30 + v45;
        uint64_t v47 = v41[2];
        uint64_t v48 = v41[3];
        uint64_t v49 = v41[1];
        unint64_t v30 = v49 + v34 - 0x4B6D499041670D8DLL * __ROR8__(v30 + v35 + v47, 42);
        uint64_t v50 = v32 + v39;
        uint64_t v51 = *(v41 - 2);
        uint64_t v52 = *(v41 - 1);
        uint64_t v53 = *(v41 - 4) - 0x4B6D499041670D8DLL * v35;
        uint64_t v54 = v53 + v39 + v52;
        uint64_t v55 = v53 + v45 + v51;
        uint64_t v34 = v55 + v52;
        uint64_t v56 = __ROR8__(v55, 44) + v53;
        unint64_t v57 = (0xB492B66FBE98F273 * __ROR8__(v46, 37)) ^ v40;
        unint64_t v43 = 0xB492B66FBE98F273 * __ROR8__(v50, 33);
        unint64_t v35 = v56 + __ROR8__(v54 + v57, 21);
        unint64_t v58 = v43 + v40 + *v41;
        uint64_t v39 = v49 + v47 + v58 + v48;
        uint64_t v40 = __ROR8__(v49 + v47 + v58, 44) + v58 + __ROR8__(v30 + v51 + v58 + v48, 21);
        v41 += 8;
        unint64_t v32 = v57;
        v44 += 64;
      }
      while (v44);
      unint64_t v59 = v43
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v40 ^ ((0x9DDFEA08EB382D69 * (v40 ^ v35)) >> 47) ^ (0x9DDFEA08EB382D69 * (v40 ^ v35)))) ^ ((0x9DDFEA08EB382D69 * (v40 ^ ((0x9DDFEA08EB382D69 * (v40 ^ v35)) >> 47) ^ (0x9DDFEA08EB382D69 * (v40 ^ v35)))) >> 47));
      unint64_t v60 = 0x9DDFEA08EB382D69
          * (v59 ^ (v57
                  - 0x4B6D499041670D8DLL * (v30 ^ (v30 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v39 ^ ((0x9DDFEA08EB382D69 * (v39 ^ v34)) >> 47) ^ (0x9DDFEA08EB382D69 * (v39 ^ v34)))) ^ ((0x9DDFEA08EB382D69 * (v39 ^ ((0x9DDFEA08EB382D69 * (v39 ^ v34)) >> 47) ^ (0x9DDFEA08EB382D69 * (v39 ^ v34)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v59 ^ (v60 >> 47) ^ v60)) ^ ((0x9DDFEA08EB382D69 * (v59 ^ (v60 >> 47) ^ v60)) >> 47));
    }
    else
    {
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v7 = *a2 - 0x3C5A37A36834CED9 * (v6 + a3);
      uint64_t v9 = a2[2];
      uint64_t v8 = a2[3];
      uint64_t v10 = __ROR8__(v7 + v8, 52);
      uint64_t v11 = v7 + a2[1];
      uint64_t v12 = __ROR8__(v11, 7);
      uint64_t v13 = v11 + v9;
      uint64_t v14 = *(uint64_t *)((char *)a2 + a3 - 32) + v9;
      uint64_t v15 = v12 + __ROR8__(*a2 - 0x3C5A37A36834CED9 * (v6 + a3), 37) + v10 + __ROR8__(v13, 31);
      uint64_t v16 = *(uint64_t *)((char *)a2 + a3 - 24) + v14 + v6;
      unint64_t v17 = 0xC3A5C85C97CB3127 * (v16 + *(uint64_t *)((char *)a2 + a3 - 8) + v8 + v15)
          - 0x651E95C4D06FBFB1
          * (v13
           + v8
           + __ROR8__(v14, 37)
           + __ROR8__(*(uint64_t *)((char *)a2 + a3 - 24) + v14, 7)
           + __ROR8__(*(uint64_t *)((char *)a2 + a3 - 8) + v8 + v14, 52)
           + __ROR8__(v16, 31));
      return 0x9AE16A3B2F90404FLL
           * ((v15 - 0x3C5A37A36834CED9 * (v17 ^ (v17 >> 47))) ^ ((v15 - 0x3C5A37A36834CED9 * (v17 ^ (v17 >> 47))) >> 47));
    }
  }
  else if (a3 > 0x10)
  {
    uint64_t v18 = a2[1];
    unint64_t v19 = 0xB492B66FBE98F273 * *a2;
    uint64_t v20 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a2 + a3 - 8), 30) + __ROR8__(v19 - v18, 43);
    unint64_t v21 = v19 + a3 + __ROR8__(v18 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a2 + a3 - 8);
    unint64_t v22 = 0x9DDFEA08EB382D69 * ((v20 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a2 + a3 - 16)) ^ v21);
    return 0x9DDFEA08EB382D69
         * ((0x9DDFEA08EB382D69 * (v21 ^ (v22 >> 47) ^ v22)) ^ ((0x9DDFEA08EB382D69 * (v21 ^ (v22 >> 47) ^ v22)) >> 47));
  }
  else if (a3 < 9)
  {
    if (a3 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a3)
      {
        unint64_t v63 = (0xC949D7C7509E6557 * (a3 + 4 * *((unsigned __int8 *)a2 + a3 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                       * (*(unsigned __int8 *)a2 | ((unint64_t)*((unsigned __int8 *)a2 + (a3 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v63 ^ (v63 >> 47));
      }
    }
    else
    {
      uint64_t v61 = *(unsigned int *)((char *)a2 + a3 - 4);
      unint64_t v62 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a2) + a3) ^ v61);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v61 ^ (v62 >> 47) ^ v62)) ^ ((0x9DDFEA08EB382D69 * (v61 ^ (v62 >> 47) ^ v62)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(uint64_t *)((char *)a2 + a3 - 8);
    uint64_t v4 = __ROR8__(v3 + a3, a3);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a2)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a2)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a2)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a2)))) >> 47))) ^ v3;
  }
  return result;
}

uint64_t *std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, uint64_t a2, long long **a3)
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
      uint64_t v14 = *v13;
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
            uint64_t v14 = (uint64_t *)*v14;
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
          uint64_t v14 = (uint64_t *)*v14;
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
  uint64_t v25 = (void *)(a1 + 16);
  unint64_t v59 = 0xAAAAAAAAAAAAAA00;
  uint64_t v26 = (char *)operator new(0x30uLL);
  v58[0] = v26;
  v58[1] = a1 + 16;
  *(void *)uint64_t v26 = 0;
  *((void *)v26 + 1) = v9;
  uint64_t v27 = (std::string *)(v26 + 16);
  uint64_t v28 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v27, *(const std::string::value_type **)v28, *((void *)v28 + 1));
  }
  else
  {
    long long v29 = *v28;
    *((void *)v26 + 4) = *((void *)v28 + 2);
    *(_OWORD *)&v27->__r_.__value_.__l.__data_ = v29;
  }
  v26[40] = 0;
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
      uint64_t v38 = operator new(8 * prime);
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
      std::string v41 = (void *)*v25;
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
            std::string v41 = i;
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
            std::string v41 = i;
            size_t v44 = v46;
          }
        }
        goto LABEL_100;
      }
      if (v42 >= prime) {
        v42 %= prime;
      }
      *(void *)(*(void *)a1 + 8 * v42) = v25;
      uint64_t v51 = (void *)*v41;
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
          void *v51 = **(void **)(*(void *)a1 + v52);
          **(void **)(*(void *)a1 + v52) = v51;
          uint64_t v51 = v41;
LABEL_94:
          std::string v41 = v51;
          uint64_t v51 = (void *)*v51;
          if (!v51) {
            goto LABEL_100;
          }
        }
        else
        {
          *(void *)(*(void *)a1 + 8 * v53) = v41;
          std::string v41 = v51;
          uint64_t v51 = (void *)*v51;
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
        unint64_t v33 = (void *)v58[0];
        if (v32) {
          goto LABEL_57;
        }
      }
      else
      {
        unint64_t v12 = v9;
        unint64_t v32 = *(void **)(*(void *)a1 + 8 * v9);
        unint64_t v33 = (void *)v58[0];
        if (v32) {
          goto LABEL_57;
        }
      }
LABEL_117:
      *unint64_t v33 = *(void *)(a1 + 16);
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
    unint64_t v33 = (void *)v58[0];
    if (v32) {
      goto LABEL_57;
    }
    goto LABEL_117;
  }
  unint64_t v32 = *(void **)(*(void *)a1 + 8 * v12);
  unint64_t v33 = (void *)v58[0];
  if (!v32) {
    goto LABEL_117;
  }
LABEL_57:
  *unint64_t v33 = *v32;
  void *v32 = v58[0];
LABEL_123:
  uint64_t v14 = (uint64_t *)v58[0];
  ++*(void *)(a1 + 24);
  return v14;
}

void sub_2637E5740(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,BOOL>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,BOOL>,void *>>>>::~unique_ptr[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_2637E5754(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,BOOL>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,BOOL>,void *>>>>::~unique_ptr[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,BOOL>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,BOOL>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16) && *(char *)(v2 + 39) < 0) {
      operator delete(*(void **)(v2 + 16));
    }
    operator delete((void *)v2);
  }
  return a1;
}

void std::__tree<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::__map_value_compare<HSFilerClientID,std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::less<HSFilerClientID>,true>,std::allocator<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::__map_value_compare<HSFilerClientID,std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::less<HSFilerClientID>,true>,std::allocator<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::__map_value_compare<HSFilerClientID,std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::less<HSFilerClientID>,true>,std::allocator<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>>::destroy(a1, a2[1]);
    std::__tree<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>::destroy((uint64_t)(a2 + 5), (void *)a2[6]);
    operator delete(a2);
  }
}

uint64_t std::__tree<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::__map_value_compare<HSFilerClientID,std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::less<HSFilerClientID>,true>,std::allocator<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  std::__tree<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::__map_value_compare<HSFilerClientID,std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::less<HSFilerClientID>,true>,std::allocator<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>>::destroy(*(void *)a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)v2[2];
    if (v3)
    {
      do
      {
        uint64_t v2 = v3;
        uint64_t v3 = (void *)v3[2];
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    std::__tree<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::__map_value_compare<HSFilerClientID,std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::less<HSFilerClientID>,true>,std::allocator<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>>::destroy(*(void *)a1, v2);
  }
  return a1;
}

void _ZNSt3__115allocate_sharedB8ne180100I22HSFilerRT_Internal_INTNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(uint64_t *a1@<X8>)
{
  uint64_t v2 = (std::__shared_weak_count *)operator new(0xF8uLL);
  v2->__shared_owners_ = 0;
  p_shared_owners = &v2->__shared_owners_;
  v2->__shared_weak_owners_ = 0;
  v2->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAF1B0;
  v2[1].std::__shared_count = 0u;
  *(_OWORD *)&v2[1].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v2[2].__shared_owners_ = 0u;
  v2[3].std::__shared_count = 0u;
  *(_OWORD *)&v2[3].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v2[4].__shared_owners_ = 0u;
  v2[5].std::__shared_count = 0u;
  *(_OWORD *)&v2[5].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v2[6].__shared_owners_ = 0u;
  v2[7].std::__shared_count = 0u;
  *(_OWORD *)&v2[7].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v2[8].__shared_owners_ = 0u;
  v2[9].std::__shared_count = 0u;
  *(_OWORD *)&v2[9].__shared_weak_owners_ = 0u;
  HSFilerRT_Internal::HSFilerRT_Internal((HSFilerRT_Internal *)&v2[1]);
  v2[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB0630;
  *a1 = v4;
  a1[1] = (uint64_t)v2;
  shared_weak_owners = (std::__shared_weak_count *)v2[1].__shared_weak_owners_;
  if (shared_weak_owners)
  {
    if (shared_weak_owners->__shared_owners_ != -1) {
      return;
    }
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v2->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v2[1].__shared_owners_ = v4;
    v2[1].__shared_weak_owners_ = (uint64_t)v2;
    std::__shared_weak_count::__release_weak(shared_weak_owners);
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
  }
  else
  {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v2->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v2[1].__shared_owners_ = v4;
    v2[1].__shared_weak_owners_ = (uint64_t)v2;
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
  }
  ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);

  std::__shared_weak_count::__release_weak(v2);
}

void sub_2637E59E0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<HSFilerRT_Internal_INT>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAF1B0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<HSFilerRT_Internal_INT>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAF1B0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<HSFilerRT_Internal_INT>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void *___ZNK3ctu20SharedSynchronizableI18HSFilerRT_InternalE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

void ctu::SharedSynchronizable<HSFilerRT_Internal>::execute_wrapped(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a1[1];
  if (!v3 || (uint64_t v5 = *a1, (v6 = std::__shared_weak_count::lock(v3)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  unint64_t v7 = v6;
  unint64_t v8 = a1[2];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableI18HSFilerRT_InternalE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &__block_descriptor_tmp_84;
  void block[5] = v5;
  unint64_t v12 = v7;
  p_shared_owners = &v7->__shared_owners_;
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  void block[4] = a2;
  dispatch_async(v8, block);
  unint64_t v10 = v12;
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

uint64_t ___ZNK3ctu20SharedSynchronizableI18HSFilerRT_InternalE15execute_wrappedEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __copy_helper_block_e8_32b40c47_ZTSNSt3__110shared_ptrIK18HSFilerRT_InternalEE(void *a1, uint64_t a2)
{
  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 7);
  uint64_t v4 = *(void *)(a2 + 48);
  a1[5] = *(void *)(a2 + 40);
  a1[6] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
}

void __destroy_helper_block_e8_32b40c47_ZTSNSt3__110shared_ptrIK18HSFilerRT_InternalEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v3 = *(const void **)(a1 + 32);
  }
  else
  {
    uint64_t v3 = *(const void **)(a1 + 32);
  }
  _Block_object_dispose(v3, 7);
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C2D8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C198], MEMORY[0x263F8C0A0]);
}

void *std::__function::__func<HSFilerRT_Internal::readWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::~__func(void *result)
{
  uint64_t v1 = result;
  *unint64_t result = &unk_270EAF230;
  uint64_t v2 = (std::__shared_weak_count *)result[2];
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

void std::__function::__func<HSFilerRT_Internal::readWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::~__func(void *__p)
{
  uint64_t v1 = __p;
  *std::string __p = &unk_270EAF230;
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    std::string __p = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  operator delete(__p);
}

void *std::__function::__func<HSFilerRT_Internal::readWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  *unint64_t result = &unk_270EAF230;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<HSFilerRT_Internal::readWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::__clone(uint64_t result, void *a2)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_270EAF230;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<HSFilerRT_Internal::readWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

void std::__function::__func<HSFilerRT_Internal::readWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::destroy_deallocate(void *__p)
{
  uint64_t v1 = __p;
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    std::string __p = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  operator delete(__p);
}

void *std::__function::__func<HSFilerRT_Internal::readWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::operator()(void *result, const void **a2, size_t *a3)
{
  uint64_t v3 = (void **)result[1];
  uint64_t v4 = (char *)*a2;
  unint64_t v5 = *a3;
  unint64_t v6 = (unint64_t)v3[2];
  unint64_t v7 = (char *)*v3;
  if (v6 - (unint64_t)*v3 >= *a3)
  {
    unint64_t v12 = (char *)v3[1];
    uint64_t v13 = v12 - v7;
    if (v12 - v7 >= v5)
    {
      if (v5) {
        unint64_t result = memmove(*v3, *a2, *a3);
      }
      uint8x8_t v11 = &v7[v5];
    }
    else
    {
      if (v12 != v7)
      {
        unint64_t result = memmove(*v3, *a2, v12 - v7);
        unint64_t v7 = (char *)v3[1];
      }
      if (v13 != v5) {
        unint64_t result = memmove(v7, &v4[v13], v5 - v13);
      }
      uint8x8_t v11 = &v7[v5 - v13];
    }
  }
  else
  {
    if (v7)
    {
      v3[1] = v7;
      operator delete(v7);
      unint64_t v6 = 0;
      const void *v3 = 0;
      v3[1] = 0;
      v3[2] = 0;
    }
    if ((v5 & 0x8000000000000000) != 0) {
      goto LABEL_22;
    }
    uint64_t v8 = 2 * v6;
    if (2 * v6 <= v5) {
      uint64_t v8 = v5;
    }
    size_t v9 = v6 >= 0x3FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v8;
    if ((v9 & 0x8000000000000000) != 0) {
LABEL_22:
    }
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    unint64_t v10 = (char *)operator new(v9);
    const void *v3 = v10;
    v3[1] = v10;
    v3[2] = &v10[v9];
    unint64_t result = memcpy(v10, v4, v5);
    uint8x8_t v11 = &v10[v5];
  }
  v3[1] = v11;
  return result;
}

uint64_t std::__function::__func<HSFilerRT_Internal::readWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN18HSFilerRT_Internal12readWithBuffE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIc"
                     "EENS1_9allocatorIcEEEENS1_10shared_ptrINS1_6vectorIhNS5_IhEEEEEEN8dispatch5blockIU13block_pointerFv"
                     "y13HSFilerStatusS9_EEEE3$_0")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZN18HSFilerRT_Internal12readWithBuffE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11ch"
                                "ar_traitsIcEENS1_9allocatorIcEEEENS1_10shared_ptrINS1_6vectorIhNS5_IhEEEEEEN8dispatch5bl"
                                "ockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN18HSFilerRT_Internal12readWithBuffE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS1_10shared_ptrINS1_6vectorIhNS5_IhEEEEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN18HSFilerRT_Internal12readWithBuffE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS1_10shared_ptrINS1_6vectorIhNS5_IhEEEEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<HSFilerRT_Internal::readWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::target_type()
{
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
}

void *std::__function::__func<HSFilerRT_Internal::readWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::~__func(void *result)
{
  uint64_t v1 = result;
  *unint64_t result = &unk_270EAF2C0;
  uint64_t v2 = (std::__shared_weak_count *)result[2];
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

void std::__function::__func<HSFilerRT_Internal::readWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::~__func(void *__p)
{
  uint64_t v1 = __p;
  *std::string __p = &unk_270EAF2C0;
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    std::string __p = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  operator delete(__p);
}

void *std::__function::__func<HSFilerRT_Internal::readWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  *unint64_t result = &unk_270EAF2C0;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<HSFilerRT_Internal::readWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::__clone(uint64_t result, void *a2)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_270EAF2C0;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<HSFilerRT_Internal::readWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

void std::__function::__func<HSFilerRT_Internal::readWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::destroy_deallocate(void *__p)
{
  uint64_t v1 = __p;
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    std::string __p = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  operator delete(__p);
}

void std::__function::__func<HSFilerRT_Internal::readWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::operator()(uint64_t a1, const void **a2, uint64_t *a3)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t v6 = *(void *)(a1 + 8);
  blocuint64_t k = MEMORY[0x263EF8330];
  uint64_t v12 = 0x40000000;
  uint64_t v13 = ___ZN7support2fs8SyncFile4openEv_block_invoke;
  uint64_t v14 = &__block_descriptor_tmp_3;
  uint64_t v15 = v6;
  ctu::SharedSynchronizable<support::fs::SyncFile>::execute_wrapped((uint64_t *)(v6 + 8), (uint64_t)&block);
  support::fs::SyncFile::write(*(support::fs::SyncFile **)(a1 + 8), v4, v5);
  uint64_t v7 = *(void *)(a1 + 8);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 0x40000000;
  v9[2] = ___ZN7support2fs8SyncFile5closeEv_block_invoke;
  v9[3] = &__block_descriptor_tmp_4_0;
  v9[4] = v7;
  unint64_t v10 = v9;
  blocuint64_t k = MEMORY[0x263EF8330];
  uint64_t v12 = 0x40000000;
  uint64_t v13 = ___ZNK3ctu20SharedSynchronizableIN7support2fs8SyncFileEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS9__block_invoke;
  uint64_t v14 = &__block_descriptor_tmp_20;
  uint64_t v15 = v7 + 8;
  uint64_t v16 = &v10;
  uint64_t v8 = *(NSObject **)(v7 + 24);
  if (*(void *)(v7 + 32)) {
    dispatch_async_and_wait(v8, &block);
  }
  else {
    dispatch_sync(v8, &block);
  }
}

uint64_t std::__function::__func<HSFilerRT_Internal::readWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN18HSFilerRT_Internal12readWithFileE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIc"
                     "EENS1_9allocatorIcEEEES7_N8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZN18HSFilerRT_Internal12readWithFileE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11ch"
                                "ar_traitsIcEENS1_9allocatorIcEEEES7_N8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN18HSFilerRT_Internal12readWithFileE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEES7_N8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN18HSFilerRT_Internal12readWithFileE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEES7_N8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<HSFilerRT_Internal::readWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::target_type()
{
}

void *std::__function::__func<HSFilerRT_Internal::readWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::ostream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::ostream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::~__func(void *result)
{
  uint64_t v1 = result;
  *unint64_t result = &unk_270EAF340;
  uint64_t v2 = (std::__shared_weak_count *)result[2];
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

void std::__function::__func<HSFilerRT_Internal::readWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::ostream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::ostream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::~__func(void *__p)
{
  uint64_t v1 = __p;
  *std::string __p = &unk_270EAF340;
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    std::string __p = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  operator delete(__p);
}

void *std::__function::__func<HSFilerRT_Internal::readWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::ostream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::ostream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::__clone(uint64_t a1)
{
  unint64_t result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  *unint64_t result = &unk_270EAF340;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<HSFilerRT_Internal::readWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::ostream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::ostream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::__clone(uint64_t result, void *a2)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_270EAF340;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<HSFilerRT_Internal::readWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::ostream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::ostream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

void std::__function::__func<HSFilerRT_Internal::readWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::ostream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::ostream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::destroy_deallocate(void *__p)
{
  uint64_t v1 = __p;
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    std::string __p = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  operator delete(__p);
}

uint64_t std::__function::__func<HSFilerRT_Internal::readWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::ostream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::ostream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::operator()()
{
  return std::ostream::write();
}

uint64_t std::__function::__func<HSFilerRT_Internal::readWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::ostream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::ostream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN18HSFilerRT_Internal14readWithStreamE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traits"
                     "IcEENS1_9allocatorIcEEEENS1_10shared_ptrINS1_13basic_ostreamIcS4_EEEEN8dispatch5blockIU13block_poin"
                     "terFvy13HSFilerStatusS9_EEEE3$_0")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZN18HSFilerRT_Internal14readWithStreamE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11"
                                "char_traitsIcEENS1_9allocatorIcEEEENS1_10shared_ptrINS1_13basic_ostreamIcS4_EEEEN8dispat"
                                "ch5blockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN18HSFilerRT_Internal14readWithStreamE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS1_10shared_ptrINS1_13basic_ostreamIcS4_EEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN18HSFilerRT_Internal14readWithStreamE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS1_10shared_ptrINS1_13basic_ostreamIcS4_EEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<HSFilerRT_Internal::readWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::ostream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::readWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::ostream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,void ()(void const*,unsigned long)>::target_type()
{
}

void *std::__function::__func<HSFilerRT_Internal::writeWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::~__func(void *result)
{
  uint64_t v1 = result;
  *unint64_t result = &unk_270EAF3C0;
  uint64_t v2 = (std::__shared_weak_count *)result[3];
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

void std::__function::__func<HSFilerRT_Internal::writeWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::~__func(void *__p)
{
  uint64_t v1 = __p;
  *std::string __p = &unk_270EAF3C0;
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    std::string __p = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  operator delete(__p);
}

char *std::__function::__func<HSFilerRT_Internal::writeWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::__clone(uint64_t a1)
{
  unint64_t result = (char *)operator new(0x20uLL);
  *(void *)unint64_t result = &unk_270EAF3C0;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)result + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<HSFilerRT_Internal::writeWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_270EAF3C0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  uint64_t v2 = *(void *)(result + 24);
  *(void *)(a2 + 24) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<HSFilerRT_Internal::writeWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

void std::__function::__func<HSFilerRT_Internal::writeWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::destroy_deallocate(void *__p)
{
  uint64_t v1 = __p;
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    std::string __p = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  operator delete(__p);
}

BOOL std::__function::__func<HSFilerRT_Internal::writeWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::operator()(uint64_t a1, void **a2, unint64_t *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  unint64_t v4 = *a3;
  unint64_t v5 = *(void *)(v3 + 8) - *(void *)v3;
  if (v5 > *a3)
  {
    uint64_t v6 = **(NSObject ***)(*(void *)(a1 + 8) + 128);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_error_impl(&dword_2637D5000, v6, OS_LOG_TYPE_ERROR, "error: Buffer provided by the writer function is too small", v8, 2u);
    }
  }
  else
  {
    memcpy(*a2, *(const void **)v3, *(void *)(v3 + 8) - *(void *)v3);
  }
  return v5 <= v4;
}

uint64_t std::__function::__func<HSFilerRT_Internal::writeWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN18HSFilerRT_Internal13writeWithBuffE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsI"
                     "cEENS1_9allocatorIcEEEENS1_10shared_ptrINS1_6vectorIhNS5_IhEEEEEEN8dispatch5blockIU13block_pointerF"
                     "vy13HSFilerStatusS9_EEEE3$_0")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZN18HSFilerRT_Internal13writeWithBuffE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11c"
                                "har_traitsIcEENS1_9allocatorIcEEEENS1_10shared_ptrINS1_6vectorIhNS5_IhEEEEEEN8dispatch5b"
                                "lockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN18HSFilerRT_Internal13writeWithBuffE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS1_10shared_ptrINS1_6vectorIhNS5_IhEEEEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN18HSFilerRT_Internal13writeWithBuffE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS1_10shared_ptrINS1_6vectorIhNS5_IhEEEEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<HSFilerRT_Internal::writeWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithBuff(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::vector<unsigned char>>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::target_type()
{
}

void *std::__function::__func<HSFilerRT_Internal::writeWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::~__func(void *result)
{
  uint64_t v1 = result;
  *unint64_t result = &unk_270EAF450;
  uint64_t v2 = (std::__shared_weak_count *)result[3];
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

void std::__function::__func<HSFilerRT_Internal::writeWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::~__func(void *__p)
{
  uint64_t v1 = __p;
  *std::string __p = &unk_270EAF450;
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    std::string __p = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  operator delete(__p);
}

__n128 std::__function::__func<HSFilerRT_Internal::writeWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::__clone(__n128 *a1)
{
  uint64_t v2 = (__n128 *)operator new(0x38uLL);
  unint64_t v3 = a1->n128_u64[1];
  unint64_t v4 = a1[1].n128_u64[0];
  v2->n128_u64[0] = (unint64_t)&unk_270EAF450;
  v2->n128_u64[1] = v3;
  unint64_t v5 = a1[1].n128_u64[1];
  v2[1].n128_u64[0] = v4;
  v2[1].n128_u64[1] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  __n128 result = a1[2];
  v2[2] = result;
  v2[3].n128_u64[0] = a1[3].n128_u64[0];
  return result;
}

__n128 std::__function::__func<HSFilerRT_Internal::writeWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::__clone(__n128 *a1, __n128 *a2)
{
  unint64_t v2 = a1->n128_u64[1];
  unint64_t v3 = a1[1].n128_u64[0];
  a2->n128_u64[0] = (unint64_t)&unk_270EAF450;
  a2->n128_u64[1] = v2;
  unint64_t v4 = a1[1].n128_u64[1];
  a2[1].n128_u64[0] = v3;
  a2[1].n128_u64[1] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  __n128 result = a1[2];
  a2[3].n128_u64[0] = a1[3].n128_u64[0];
  a2[2] = result;
  return result;
}

void std::__function::__func<HSFilerRT_Internal::writeWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

void std::__function::__func<HSFilerRT_Internal::writeWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::destroy_deallocate(void *__p)
{
  uint64_t v1 = __p;
  unint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    std::string __p = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  operator delete(__p);
}

BOOL std::__function::__func<HSFilerRT_Internal::writeWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::operator()(uint64_t a1, void **a2, unint64_t *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  unint64_t v4 = *a3;
  uint64_t v5 = *(void *)(a1 + 32);
  unint64_t v6 = *(void *)(a1 + 8);
  if (v6 <= v4)
  {
    if (support::fs::SyncFile::read(*(support::fs::SyncFile **)(a1 + 16), *a2, v6)) {
      return 1;
    }
    uint64_t v14 = **(NSObject ***)(v5 + 128);
    BOOL result = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (result)
    {
      uint64_t v15 = hsfiler::support::to_string(*(_DWORD *)(a1 + 40));
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v17 = *(void *)(a1 + 16);
      uint64_t v20 = *(void *)(v17 + 40);
      uint64_t v18 = v17 + 40;
      uint64_t v19 = v20;
      if (*(char *)(v18 + 23) < 0) {
        uint64_t v18 = v19;
      }
      int v21 = 136315650;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = v16;
      __int16 v25 = 2080;
      uint64_t v26 = v18;
      uint8x8_t v11 = "error: Client (%s) session (%llu): failed to read file (%s)";
      uint64_t v12 = v14;
      uint32_t v13 = 32;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v7 = **(NSObject ***)(v5 + 128);
    BOOL result = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (result)
    {
      size_t v9 = hsfiler::support::to_string(*(_DWORD *)(a1 + 40));
      uint64_t v10 = *(void *)(a1 + 48);
      int v21 = 136315394;
      uint64_t v22 = v9;
      __int16 v23 = 2048;
      uint64_t v24 = v10;
      uint8x8_t v11 = "error: Client (%s) session (%llu): buffer provided by the writer function is too small";
      uint64_t v12 = v7;
      uint32_t v13 = 22;
LABEL_11:
      _os_log_error_impl(&dword_2637D5000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v21, v13);
      return 0;
    }
  }
  return result;
}

uint64_t std::__function::__func<HSFilerRT_Internal::writeWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN18HSFilerRT_Internal13writeWithFileE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsI"
                     "cEENS1_9allocatorIcEEEES7_N8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZN18HSFilerRT_Internal13writeWithFileE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11c"
                                "har_traitsIcEENS1_9allocatorIcEEEES7_N8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN18HSFilerRT_Internal13writeWithFileE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEES7_N8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN18HSFilerRT_Internal13writeWithFileE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEES7_N8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<HSFilerRT_Internal::writeWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithFile(HSFilerClientID,unsigned long long,std::string const&,std::string,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::target_type()
{
}

void *std::__function::__func<HSFilerRT_Internal::writeWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::istream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::istream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::~__func(void *result)
{
  uint64_t v1 = result;
  *BOOL result = &unk_270EAF4D0;
  unint64_t v2 = (std::__shared_weak_count *)result[3];
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

void std::__function::__func<HSFilerRT_Internal::writeWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::istream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::istream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::~__func(void *__p)
{
  uint64_t v1 = __p;
  *std::string __p = &unk_270EAF4D0;
  unint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    std::string __p = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  operator delete(__p);
}

char *std::__function::__func<HSFilerRT_Internal::writeWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::istream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::istream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::__clone(uint64_t a1)
{
  BOOL result = (char *)operator new(0x28uLL);
  *(void *)BOOL result = &unk_270EAF4D0;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)result + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  *((void *)result + 4) = *(void *)(a1 + 32);
  return result;
}

uint64_t std::__function::__func<HSFilerRT_Internal::writeWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::istream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::istream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_270EAF4D0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  uint64_t v2 = *(void *)(result + 24);
  *(void *)(a2 + 24) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a2 + 32) = *(void *)(result + 32);
  return result;
}

void std::__function::__func<HSFilerRT_Internal::writeWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::istream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::istream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

void std::__function::__func<HSFilerRT_Internal::writeWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::istream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::istream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::destroy_deallocate(void *__p)
{
  uint64_t v1 = __p;
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    std::string __p = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  operator delete(__p);
}

BOOL std::__function::__func<HSFilerRT_Internal::writeWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::istream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::istream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::operator()(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3 = *a3;
  unint64_t v4 = *(void *)(a1 + 32);
  if (v4 > *a3)
  {
    uint64_t v5 = **(NSObject ***)(*(void *)(a1 + 8) + 128);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_error_impl(&dword_2637D5000, v5, OS_LOG_TYPE_ERROR, "error: Buffer provided by the writer function is too small", v7, 2u);
    }
  }
  else
  {
    std::istream::read();
  }
  return v4 <= v3;
}

uint64_t std::__function::__func<HSFilerRT_Internal::writeWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::istream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::istream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN18HSFilerRT_Internal15writeWithStreamE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_trait"
                     "sIcEENS1_9allocatorIcEEEENS1_10shared_ptrINS1_13basic_istreamIcS4_EEEEN8dispatch5blockIU13block_poi"
                     "nterFvy13HSFilerStatusS9_EEEE3$_0")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZN18HSFilerRT_Internal15writeWithStreamE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_1"
                                "1char_traitsIcEENS1_9allocatorIcEEEENS1_10shared_ptrINS1_13basic_istreamIcS4_EEEEN8dispa"
                                "tch5blockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN18HSFilerRT_Internal15writeWithStreamE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS1_10shared_ptrINS1_13basic_istreamIcS4_EEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN18HSFilerRT_Internal15writeWithStreamE15HSFilerClientIDyRKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS1_10shared_ptrINS1_13basic_istreamIcS4_EEEEN8dispatch5blockIU13block_pointerFvy13HSFilerStatusS9_EEEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<HSFilerRT_Internal::writeWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::istream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0,std::allocator<HSFilerRT_Internal::writeWithStream(HSFilerClientID,unsigned long long,std::string const&,std::shared_ptr<std::istream>,dispatch::block<void({block_pointer})(unsigned long long,HSFilerStatus,std::string const&)>)::$_0>,BOOL ()(void *,unsigned long)>::target_type()
{
}

uint64_t __cxx_global_var_init_1()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>::~PthreadMutexGuardPolicy, &ctu::Singleton<support::log::shared_stdio,support::log::shared_stdio,ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>>::sInstance, &dword_2637D5000);
  }
  return result;
}

BOOL isAvailable(capabilities::radio *a1)
{
  return capabilities::radio::vendor(a1) == 3;
}

BOOL hsfiler::support::validClientID(unsigned int a1)
{
  return a1 < 9;
}

const char *hsfiler::support::to_string(unsigned int a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  {
    unsigned int v9 = a1;
    a1 = v9;
    if (v10)
    {
      v11[4] = xmmword_2655D5C80;
      v11[5] = unk_2655D5C90;
      v11[6] = xmmword_2655D5CA0;
      v11[0] = constinit;
      v11[1] = unk_2655D5C50;
      v11[2] = xmmword_2655D5C60;
      v11[3] = unk_2655D5C70;
      std::unordered_map<HSFilerClientID,char const*>::unordered_map((uint64_t)&hsfiler::support::to_string(HSFilerClientID)::clientNames, (unsigned int *)v11, 7);
      a1 = v9;
    }
  }
  if (qword_26A99F9C8)
  {
    uint8x8_t v1 = (uint8x8_t)vcnt_s8((int8x8_t)qword_26A99F9C8);
    v1.i16[0] = vaddlv_u8(v1);
    if (v1.u32[0] > 1uLL)
    {
      unint64_t v2 = a1;
      if (qword_26A99F9C8 <= (unint64_t)a1) {
        unint64_t v2 = a1 % (unint64_t)qword_26A99F9C8;
      }
    }
    else
    {
      unint64_t v2 = (qword_26A99F9C8 - 1) & a1;
    }
    unint64_t v3 = *(uint64_t ***)(hsfiler::support::to_string(HSFilerClientID)::clientNames + 8 * v2);
    if (v3)
    {
      unint64_t v4 = *v3;
      if (v4)
      {
        if (v1.u32[0] < 2uLL)
        {
          uint64_t v5 = "HS_FILER_CLIENT_INVALID";
          while (1)
          {
            uint64_t v6 = v4[1];
            if (v6 == a1)
            {
              if (*((_DWORD *)v4 + 4) == a1) {
                return (const char *)v4[3];
              }
            }
            else if ((v6 & (qword_26A99F9C8 - 1)) != v2)
            {
              return v5;
            }
            unint64_t v4 = (uint64_t *)*v4;
            if (!v4) {
              return v5;
            }
          }
        }
        uint64_t v5 = "HS_FILER_CLIENT_INVALID";
        while (1)
        {
          unint64_t v8 = v4[1];
          if (v8 == a1)
          {
            if (*((_DWORD *)v4 + 4) == a1) {
              return (const char *)v4[3];
            }
          }
          else
          {
            if (v8 >= qword_26A99F9C8) {
              v8 %= (unint64_t)qword_26A99F9C8;
            }
            if (v8 != v2) {
              return v5;
            }
          }
          unint64_t v4 = (uint64_t *)*v4;
          if (!v4) {
            return v5;
          }
        }
      }
    }
  }
  return "HS_FILER_CLIENT_INVALID";
}

void sub_2637E7A40(_Unwind_Exception *a1)
{
}

uint64_t std::unordered_map<HSFilerClientID,char const*>::unordered_map(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 16 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<HSFilerClientID,char const*>,std::__unordered_map_hasher<HSFilerClientID,std::__hash_value_type<HSFilerClientID,char const*>,std::hash<HSFilerClientID>,std::equal_to<HSFilerClientID>,true>,std::__unordered_map_equal<HSFilerClientID,std::__hash_value_type<HSFilerClientID,char const*>,std::equal_to<HSFilerClientID>,std::hash<HSFilerClientID>,true>,std::allocator<std::__hash_value_type<HSFilerClientID,char const*>>>::__emplace_unique_key_args<HSFilerClientID,std::pair<HSFilerClientID const,char const*> const&>((float *)a1, a2, a2);
      a2 += 4;
      v5 -= 16;
    }
    while (v5);
  }
  return a1;
}

void sub_2637E7ABC(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)(v1 + 16);
  if (v3)
  {
    do
    {
      unint64_t v4 = (void *)*v3;
      operator delete(v3);
      unint64_t v3 = v4;
    }
    while (v4);
  }
  uint64_t v5 = *(void **)v1;
  *(void *)uint64_t v1 = 0;
  if (v5) {
    operator delete(v5);
  }
  _Unwind_Resume(exception_object);
}

const char *hsfiler::support::to_string(int a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  {
    int v9 = a1;
    a1 = v9;
    if (v10)
    {
      memcpy(__dst, &constinit_25, sizeof(__dst));
      std::unordered_map<HSFilerStatus,char const*>::unordered_map((uint64_t)&hsfiler::support::to_string(HSFilerStatus)::statustStrings, __dst, 17);
      a1 = v9;
    }
  }
  if (qword_26A99F9F8)
  {
    uint8x8_t v1 = (uint8x8_t)vcnt_s8((int8x8_t)qword_26A99F9F8);
    v1.i16[0] = vaddlv_u8(v1);
    if (v1.u32[0] > 1uLL)
    {
      unint64_t v2 = a1;
      if (qword_26A99F9F8 <= (unint64_t)a1) {
        unint64_t v2 = a1 % (unint64_t)qword_26A99F9F8;
      }
    }
    else
    {
      unint64_t v2 = (qword_26A99F9F8 - 1) & a1;
    }
    unint64_t v3 = *(uint64_t ***)(hsfiler::support::to_string(HSFilerStatus)::statustStrings + 8 * v2);
    if (v3)
    {
      unint64_t v4 = *v3;
      if (v4)
      {
        if (v1.u32[0] < 2uLL)
        {
          uint64_t v5 = "HS_FILER_STATUS_INVALID";
          while (1)
          {
            uint64_t v6 = v4[1];
            if (v6 == a1)
            {
              if (*((_DWORD *)v4 + 4) == a1) {
                return (const char *)v4[3];
              }
            }
            else if ((v6 & (qword_26A99F9F8 - 1)) != v2)
            {
              return v5;
            }
            unint64_t v4 = (uint64_t *)*v4;
            if (!v4) {
              return v5;
            }
          }
        }
        uint64_t v5 = "HS_FILER_STATUS_INVALID";
        while (1)
        {
          unint64_t v8 = v4[1];
          if (v8 == a1)
          {
            if (*((_DWORD *)v4 + 4) == a1) {
              return (const char *)v4[3];
            }
          }
          else
          {
            if (v8 >= qword_26A99F9F8) {
              v8 %= (unint64_t)qword_26A99F9F8;
            }
            if (v8 != v2) {
              return v5;
            }
          }
          unint64_t v4 = (uint64_t *)*v4;
          if (!v4) {
            return v5;
          }
        }
      }
    }
  }
  return "HS_FILER_STATUS_INVALID";
}

void sub_2637E7CB0(_Unwind_Exception *a1)
{
}

uint64_t std::unordered_map<HSFilerStatus,char const*>::unordered_map(uint64_t a1, int *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 16 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<HSFilerStatus,char const*>,std::__unordered_map_hasher<HSFilerStatus,std::__hash_value_type<HSFilerStatus,char const*>,std::hash<HSFilerStatus>,std::equal_to<HSFilerStatus>,true>,std::__unordered_map_equal<HSFilerStatus,std::__hash_value_type<HSFilerStatus,char const*>,std::equal_to<HSFilerStatus>,std::hash<HSFilerStatus>,true>,std::allocator<std::__hash_value_type<HSFilerStatus,char const*>>>::__emplace_unique_key_args<HSFilerStatus,std::pair<HSFilerStatus const,char const*> const&>((float *)a1, a2, a2);
      a2 += 4;
      v5 -= 16;
    }
    while (v5);
  }
  return a1;
}

void sub_2637E7D2C(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)(v1 + 16);
  if (v3)
  {
    do
    {
      unint64_t v4 = (void *)*v3;
      operator delete(v3);
      unint64_t v3 = v4;
    }
    while (v4);
  }
  uint64_t v5 = *(void **)v1;
  *(void *)uint64_t v1 = 0;
  if (v5) {
    operator delete(v5);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::__hash_table<std::__hash_value_type<HSFilerClientID,char const*>,std::__unordered_map_hasher<HSFilerClientID,std::__hash_value_type<HSFilerClientID,char const*>,std::hash<HSFilerClientID>,std::equal_to<HSFilerClientID>,true>,std::__unordered_map_equal<HSFilerClientID,std::__hash_value_type<HSFilerClientID,char const*>,std::equal_to<HSFilerClientID>,std::hash<HSFilerClientID>,true>,std::allocator<std::__hash_value_type<HSFilerClientID,char const*>>>::__emplace_unique_key_args<HSFilerClientID,std::pair<HSFilerClientID const,char const*> const&>(float *a1, unsigned int *a2, _OWORD *a3)
{
  unint64_t v5 = *a2;
  unint64_t v6 = *((void *)a1 + 1);
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v8 = *a2;
      if (v6 <= v5) {
        unint64_t v8 = v5 % v6;
      }
    }
    else
    {
      unint64_t v8 = (v6 - 1) & v5;
    }
    int v9 = *(uint64_t ***)(*(void *)a1 + 8 * v8);
    if (v9)
    {
      int v10 = *v9;
      if (*v9)
      {
        if (v7.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v12 = v10[1];
            if (v12 == v5)
            {
              if (*((_DWORD *)v10 + 4) == v5) {
                return v10;
              }
            }
            else if ((v12 & (v6 - 1)) != v8)
            {
              goto LABEL_23;
            }
            int v10 = (uint64_t *)*v10;
            if (!v10) {
              goto LABEL_23;
            }
          }
        }
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v5)
          {
            if (*((_DWORD *)v10 + 4) == v5) {
              return v10;
            }
          }
          else
          {
            if (v11 >= v6) {
              v11 %= v6;
            }
            if (v11 != v8) {
              break;
            }
          }
          int v10 = (uint64_t *)*v10;
        }
        while (v10);
      }
    }
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  }
LABEL_23:
  uint64_t v14 = operator new(0x20uLL);
  void *v14 = 0;
  v14[1] = v5;
  *((_OWORD *)v14 + 1) = *a3;
  float v15 = (float)(unint64_t)(*((void *)a1 + 3) + 1);
  float v16 = a1[8];
  if (v6 && (float)(v16 * (float)v6) >= v15)
  {
    unint64_t v5 = v8;
    uint64_t v17 = *(void **)a1;
    uint64_t v18 = *(void **)(*(void *)a1 + 8 * v8);
    if (!v18) {
      goto LABEL_85;
    }
LABEL_73:
    void *v14 = *v18;
LABEL_91:
    *uint64_t v18 = v14;
    goto LABEL_92;
  }
  BOOL v19 = 1;
  if (v6 >= 3) {
    BOOL v19 = (v6 & (v6 - 1)) != 0;
  }
  unint64_t v20 = v19 | (2 * v6);
  unint64_t v21 = vcvtps_u32_f32(v15 / v16);
  if (v20 <= v21) {
    size_t prime = v21;
  }
  else {
    size_t prime = v20;
  }
  if (prime == 1)
  {
    size_t prime = 2;
  }
  else if ((prime & (prime - 1)) != 0)
  {
    size_t prime = std::__next_prime(prime);
    unint64_t v6 = *((void *)a1 + 1);
  }
  if (prime > v6)
  {
LABEL_37:
    if (prime >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    __int16 v23 = operator new(8 * prime);
    uint64_t v24 = *(void **)a1;
    *(void *)a1 = v23;
    if (v24) {
      operator delete(v24);
    }
    uint64_t v25 = 0;
    *((void *)a1 + 1) = prime;
    do
      *(void *)(*(void *)a1 + 8 * v25++) = 0;
    while (prime != v25);
    uint64_t v27 = (uint64_t *)(a1 + 4);
    uint64_t v26 = (void *)*((void *)a1 + 2);
    if (!v26) {
      goto LABEL_69;
    }
    size_t v28 = v26[1];
    size_t v29 = prime - 1;
    if ((prime & (prime - 1)) == 0)
    {
      size_t v30 = v28 & v29;
      *(void *)(*(void *)a1 + 8 * v30) = v27;
      for (uint64_t i = (void *)*v26; *v26; uint64_t i = (void *)*v26)
      {
        size_t v32 = i[1] & v29;
        if (v32 == v30)
        {
          uint64_t v26 = i;
        }
        else if (*(void *)(*(void *)a1 + 8 * v32))
        {
          *uint64_t v26 = *i;
          uint64_t v33 = 8 * v32;
          *uint64_t i = **(void **)(*(void *)a1 + v33);
          **(void **)(*(void *)a1 + v33) = i;
        }
        else
        {
          *(void *)(*(void *)a1 + 8 * v32) = v26;
          uint64_t v26 = i;
          size_t v30 = v32;
        }
      }
      goto LABEL_69;
    }
    if (v28 >= prime) {
      v28 %= prime;
    }
    *(void *)(*(void *)a1 + 8 * v28) = v27;
    uint64_t v37 = (void *)*v26;
    if (!*v26)
    {
LABEL_69:
      unint64_t v6 = prime;
      if ((prime & (prime - 1)) != 0) {
        goto LABEL_70;
      }
LABEL_84:
      unint64_t v5 = (v6 - 1) & v5;
      uint64_t v17 = *(void **)a1;
      uint64_t v18 = *(void **)(*(void *)a1 + 8 * v5);
      if (!v18) {
        goto LABEL_85;
      }
      goto LABEL_73;
    }
    while (1)
    {
      size_t v39 = v37[1];
      if (v39 >= prime) {
        v39 %= prime;
      }
      if (v39 == v28) {
        goto LABEL_63;
      }
      if (*(void *)(*(void *)a1 + 8 * v39))
      {
        *uint64_t v26 = *v37;
        uint64_t v38 = 8 * v39;
        *uint64_t v37 = **(void **)(*(void *)a1 + v38);
        **(void **)(*(void *)a1 + v38) = v37;
        uint64_t v37 = v26;
LABEL_63:
        uint64_t v26 = v37;
        uint64_t v37 = (void *)*v37;
        if (!v37) {
          goto LABEL_69;
        }
      }
      else
      {
        *(void *)(*(void *)a1 + 8 * v39) = v26;
        uint64_t v26 = v37;
        uint64_t v37 = (void *)*v37;
        size_t v28 = v39;
        if (!v37) {
          goto LABEL_69;
        }
      }
    }
  }
  if (prime < v6)
  {
    unint64_t v34 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
    if (v6 < 3 || (uint8x8_t v35 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v35.i16[0] = vaddlv_u8(v35), v35.u32[0] > 1uLL))
    {
      unint64_t v34 = std::__next_prime(v34);
    }
    else
    {
      uint64_t v36 = 1 << -(char)__clz(v34 - 1);
      if (v34 >= 2) {
        unint64_t v34 = v36;
      }
    }
    if (prime <= v34) {
      size_t prime = v34;
    }
    if (prime < v6)
    {
      if (!prime)
      {
        uint64_t v40 = *(void **)a1;
        *(void *)a1 = 0;
        if (v40) {
          operator delete(v40);
        }
        unint64_t v6 = 0;
        *((void *)a1 + 1) = 0;
        goto LABEL_84;
      }
      goto LABEL_37;
    }
    unint64_t v6 = *((void *)a1 + 1);
  }
  if ((v6 & (v6 - 1)) == 0) {
    goto LABEL_84;
  }
LABEL_70:
  if (v6 <= v5) {
    v5 %= v6;
  }
  uint64_t v17 = *(void **)a1;
  uint64_t v18 = *(void **)(*(void *)a1 + 8 * v5);
  if (v18) {
    goto LABEL_73;
  }
LABEL_85:
  void *v14 = *((void *)a1 + 2);
  *((void *)a1 + 2) = v14;
  v17[v5] = a1 + 4;
  if (*v14)
  {
    unint64_t v41 = *(void *)(*v14 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v41 >= v6) {
        v41 %= v6;
      }
    }
    else
    {
      v41 &= v6 - 1;
    }
    uint64_t v18 = (void *)(*(void *)a1 + 8 * v41);
    goto LABEL_91;
  }
LABEL_92:
  ++*((void *)a1 + 3);
  return v14;
}

void sub_2637E8210(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<HSFilerStatus,char const*>,std::__unordered_map_hasher<HSFilerStatus,std::__hash_value_type<HSFilerStatus,char const*>,std::hash<HSFilerStatus>,std::equal_to<HSFilerStatus>,true>,std::__unordered_map_equal<HSFilerStatus,std::__hash_value_type<HSFilerStatus,char const*>,std::equal_to<HSFilerStatus>,std::hash<HSFilerStatus>,true>,std::allocator<std::__hash_value_type<HSFilerStatus,char const*>>>::__emplace_unique_key_args<HSFilerStatus,std::pair<HSFilerStatus const,char const*> const&>(float *a1, int *a2, _OWORD *a3)
{
  unint64_t v5 = *a2;
  unint64_t v6 = *((void *)a1 + 1);
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v8 = *a2;
      if (v6 <= v5) {
        unint64_t v8 = v5 % v6;
      }
    }
    else
    {
      unint64_t v8 = (v6 - 1) & v5;
    }
    int v9 = *(uint64_t ***)(*(void *)a1 + 8 * v8);
    if (v9)
    {
      int v10 = *v9;
      if (*v9)
      {
        if (v7.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v12 = v10[1];
            if (v12 == v5)
            {
              if (*((_DWORD *)v10 + 4) == v5) {
                return v10;
              }
            }
            else if ((v12 & (v6 - 1)) != v8)
            {
              goto LABEL_23;
            }
            int v10 = (uint64_t *)*v10;
            if (!v10) {
              goto LABEL_23;
            }
          }
        }
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v5)
          {
            if (*((_DWORD *)v10 + 4) == v5) {
              return v10;
            }
          }
          else
          {
            if (v11 >= v6) {
              v11 %= v6;
            }
            if (v11 != v8) {
              break;
            }
          }
          int v10 = (uint64_t *)*v10;
        }
        while (v10);
      }
    }
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  }
LABEL_23:
  uint64_t v14 = operator new(0x20uLL);
  void *v14 = 0;
  v14[1] = v5;
  *((_OWORD *)v14 + 1) = *a3;
  float v15 = (float)(unint64_t)(*((void *)a1 + 3) + 1);
  float v16 = a1[8];
  if (!v6 || (float)(v16 * (float)v6) < v15)
  {
    BOOL v19 = 1;
    if (v6 >= 3) {
      BOOL v19 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v6);
    unint64_t v21 = vcvtps_u32_f32(v15 / v16);
    if (v20 <= v21) {
      size_t prime = v21;
    }
    else {
      size_t prime = v20;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
      unint64_t v6 = *((void *)a1 + 1);
    }
    if (prime > v6)
    {
LABEL_37:
      if (prime >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      __int16 v23 = operator new(8 * prime);
      uint64_t v24 = *(void **)a1;
      *(void *)a1 = v23;
      if (v24) {
        operator delete(v24);
      }
      uint64_t v25 = 0;
      *((void *)a1 + 1) = prime;
      do
        *(void *)(*(void *)a1 + 8 * v25++) = 0;
      while (prime != v25);
      uint64_t v27 = (uint64_t *)(a1 + 4);
      uint64_t v26 = (void *)*((void *)a1 + 2);
      if (!v26) {
        goto LABEL_69;
      }
      size_t v28 = v26[1];
      size_t v29 = prime - 1;
      if ((prime & (prime - 1)) == 0)
      {
        size_t v30 = v28 & v29;
        *(void *)(*(void *)a1 + 8 * v30) = v27;
        for (uint64_t i = (void *)*v26; *v26; uint64_t i = (void *)*v26)
        {
          size_t v32 = i[1] & v29;
          if (v32 == v30)
          {
            uint64_t v26 = i;
          }
          else if (*(void *)(*(void *)a1 + 8 * v32))
          {
            *uint64_t v26 = *i;
            uint64_t v33 = 8 * v32;
            *uint64_t i = **(void **)(*(void *)a1 + v33);
            **(void **)(*(void *)a1 + v33) = i;
          }
          else
          {
            *(void *)(*(void *)a1 + 8 * v32) = v26;
            uint64_t v26 = i;
            size_t v30 = v32;
          }
        }
        goto LABEL_69;
      }
      if (v28 >= prime) {
        v28 %= prime;
      }
      *(void *)(*(void *)a1 + 8 * v28) = v27;
      uint64_t v37 = (void *)*v26;
      if (!*v26)
      {
LABEL_69:
        unint64_t v6 = prime;
        uint64_t v40 = prime - 1;
        if ((prime & (prime - 1)) != 0) {
          goto LABEL_70;
        }
        goto LABEL_85;
      }
      while (1)
      {
        size_t v39 = v37[1];
        if (v39 >= prime) {
          v39 %= prime;
        }
        if (v39 == v28) {
          goto LABEL_63;
        }
        if (*(void *)(*(void *)a1 + 8 * v39))
        {
          *uint64_t v26 = *v37;
          uint64_t v38 = 8 * v39;
          *uint64_t v37 = **(void **)(*(void *)a1 + v38);
          **(void **)(*(void *)a1 + v38) = v37;
          uint64_t v37 = v26;
LABEL_63:
          uint64_t v26 = v37;
          uint64_t v37 = (void *)*v37;
          if (!v37) {
            goto LABEL_69;
          }
        }
        else
        {
          *(void *)(*(void *)a1 + 8 * v39) = v26;
          uint64_t v26 = v37;
          uint64_t v37 = (void *)*v37;
          size_t v28 = v39;
          if (!v37) {
            goto LABEL_69;
          }
        }
      }
    }
    if (prime < v6)
    {
      unint64_t v34 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v6 < 3 || (uint8x8_t v35 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v35.i16[0] = vaddlv_u8(v35), v35.u32[0] > 1uLL))
      {
        unint64_t v34 = std::__next_prime(v34);
      }
      else
      {
        uint64_t v36 = 1 << -(char)__clz(v34 - 1);
        if (v34 >= 2) {
          unint64_t v34 = v36;
        }
      }
      if (prime <= v34) {
        size_t prime = v34;
      }
      if (prime < v6)
      {
        if (!prime)
        {
          unint64_t v41 = *(void **)a1;
          *(void *)a1 = 0;
          if (v41) {
            operator delete(v41);
          }
          unint64_t v6 = 0;
          *((void *)a1 + 1) = 0;
          uint64_t v40 = -1;
          goto LABEL_85;
        }
        goto LABEL_37;
      }
      unint64_t v6 = *((void *)a1 + 1);
    }
    uint64_t v40 = v6 - 1;
    if ((v6 & (v6 - 1)) != 0)
    {
LABEL_70:
      if (v6 <= v5)
      {
        unint64_t v8 = v5 % v6;
        uint64_t v17 = *(void **)a1;
        uint64_t v18 = *(void **)(*(void *)a1 + 8 * (v5 % v6));
        if (v18) {
          goto LABEL_26;
        }
      }
      else
      {
        unint64_t v8 = v5;
        uint64_t v17 = *(void **)a1;
        uint64_t v18 = *(void **)(*(void *)a1 + 8 * v5);
        if (v18) {
          goto LABEL_26;
        }
      }
      goto LABEL_86;
    }
LABEL_85:
    unint64_t v8 = v40 & v5;
    uint64_t v17 = *(void **)a1;
    uint64_t v18 = *(void **)(*(void *)a1 + 8 * (v40 & v5));
    if (v18) {
      goto LABEL_26;
    }
    goto LABEL_86;
  }
  uint64_t v17 = *(void **)a1;
  uint64_t v18 = *(void **)(*(void *)a1 + 8 * v8);
  if (v18)
  {
LABEL_26:
    void *v14 = *v18;
LABEL_92:
    *uint64_t v18 = v14;
    goto LABEL_93;
  }
LABEL_86:
  void *v14 = *((void *)a1 + 2);
  *((void *)a1 + 2) = v14;
  v17[v8] = a1 + 4;
  if (*v14)
  {
    unint64_t v42 = *(void *)(*v14 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v42 >= v6) {
        v42 %= v6;
      }
    }
    else
    {
      v42 &= v6 - 1;
    }
    uint64_t v18 = (void *)(*(void *)a1 + 8 * v42);
    goto LABEL_92;
  }
LABEL_93:
  ++*((void *)a1 + 3);
  return v14;
}

void sub_2637E86E0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t support::transport::PCIMemRegion::getLogClient(support::transport::PCIMemRegion *this)
{
  return (uint64_t)this + 168;
}

void support::transport::PCIMemRegion::create(const void **a1@<X0>, int a2@<W1>, mach_vm_size_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, support::transport::PCIMemRegion **a6@<X8>)
{
}

void support::transport::PCIMemRegion::create(const void **a1@<X0>, int a2@<W1>, mach_vm_size_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, support::transport::PCIMemRegion **a8@<X8>)
{
  *a8 = (support::transport::PCIMemRegion *)0xAAAAAAAAAAAAAAAALL;
  a8[1] = (support::transport::PCIMemRegion *)0xAAAAAAAAAAAAAAAALL;
  float v16 = operator new(0xF8uLL);
  support::transport::PCIMemRegion::PCIMemRegion((uint64_t)v16, a1, a2, a7, a6);
  std::shared_ptr<support::transport::PCIMemRegion>::shared_ptr[abi:ne180100]<support::transport::PCIMemRegion,void>(a8, (uint64_t)v16);
  if (*a8)
  {
    if ((support::transport::PCIMemRegion::createPCITransport(*a8) & 1) == 0
      || !support::transport::PCIMemRegion::allocateVMRegion(*a8, a3)
      || ((uint64_t v17 = *a8, !a4) || !a5
        ? (char v18 = support::transport::PCIMemRegion::mapVMRegion(v17))
        : (char v18 = support::transport::PCIMemRegion::mapVMRegionWithClientData(v17, a4)),
          (v18 & 1) == 0))
    {
      std::shared_ptr<support::transport::PCIMemRegion>::reset[abi:ne180100](a8);
    }
  }
}

void sub_2637E8814(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_2637E8828(_Unwind_Exception *a1)
{
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t support::transport::PCIMemRegion::createPCITransport(support::transport::PCIMemRegion *this)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  if (!*((_DWORD *)this + 30))
  {
    uint64_t v37 = (support::log::manager *)*((void *)this + 30);
    char v66 = 1;
    uint64_t v38 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v37 + 16))(v37, 1, **((void **)this + 27));
    if (v38)
    {
      if (*((void *)v37 + 17))
      {
        int v39 = 2;
        support::log::buffer::borrow(v38);
      }
      else
      {
        int v39 = 0;
      }
      if (v39 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_ERROR))
      {
        int v47 = *((_DWORD *)this + 30);
        LODWORD(v67) = 67109120;
        DWORD1(v67) = v47;
        uint64_t v48 = _os_log_send_and_compose_impl();
        if (v48)
        {
          uint8x8_t v49 = (char *)v48;
          std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = std::chrono::system_clock::now().__d_.__rep_;
          *(void *)&long long v67 = &unk_270EAED78;
          *((void *)&v67 + 1) = (char *)this + 176;
          *(void *)&long long v68 = &v66;
          *((void *)&v68 + 1) = &rep;
          support::log::manager::message_delegates(v37, (const support::log::details *)&v67, v49);
        }
      }
    }
    return 0;
  }
  unint64_t v2 = (support::log::manager *)*((void *)this + 30);
  unint64_t v3 = (char *)this + 176;
  if (!*((void *)this + 3))
  {
    char v66 = 1;
    uint64_t v40 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v2 + 16))(v2, 1, **((void **)this + 27));
    if (v40)
    {
      if (*((void *)v2 + 17))
      {
        int v41 = 2;
        support::log::buffer::borrow(v40);
      }
      else
      {
        int v41 = 0;
      }
      if (v41 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_ERROR))
      {
        LOWORD(v67) = 0;
        uint64_t v50 = _os_log_send_and_compose_impl();
        if (v50)
        {
          uint64_t v51 = (char *)v50;
          std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = std::chrono::system_clock::now().__d_.__rep_;
          *(void *)&long long v67 = &unk_270EAED78;
          *((void *)&v67 + 1) = v3;
          *(void *)&long long v68 = &v66;
          *((void *)&v68 + 1) = &rep;
          support::log::manager::message_delegates(v2, (const support::log::details *)&v67, v51);
        }
      }
    }
    return 0;
  }
  char v66 = 3;
  unint64_t v4 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v2 + 16))(v2, 3, **((void **)this + 27));
  if (v4)
  {
    if (*((void *)v2 + 17))
    {
      int v5 = 2;
      support::log::buffer::borrow(v4);
    }
    else
    {
      int v5 = 0;
    }
    if (v5 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *((_DWORD *)this + 30);
      LODWORD(v67) = 67109120;
      DWORD1(v67) = v6;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        unint64_t v8 = (char *)v7;
        v9.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v9.__d_.__rep_;
        *(void *)&long long v67 = &unk_270EAED78;
        *((void *)&v67 + 1) = v3;
        *(void *)&long long v68 = &v66;
        *((void *)&v68 + 1) = &rep;
        int v10 = (void *)((char *)v2 + 120);
        for (uint64_t i = *((void *)v2 + 16); (void *)i != v10; uint64_t i = *(void *)(i + 8))
          v9.__d_.__rep_ = (***(uint64_t (****)(void, long long *, char *))(i + 16))(*(void *)(i + 16), &v67, v8);
        support::log::manager::release_log_buffer((support::log::manager *)v9.__d_.__rep_, v8);
      }
    }
  }
  unint64_t v12 = *((unsigned int *)this + 30);
  long long v67 = 0u;
  long long v68 = 0u;
  unint64_t v69 = 0xAAAAAAAA3F800000;
  std::__hash_table<std::__hash_value_type<PCITransportMemRegion,PCITransportInterface>,std::__unordered_map_hasher<PCITransportMemRegion,std::__hash_value_type<PCITransportMemRegion,PCITransportInterface>,std::hash<PCITransportMemRegion>,std::equal_to<PCITransportMemRegion>,true>,std::__unordered_map_equal<PCITransportMemRegion,std::__hash_value_type<PCITransportMemRegion,PCITransportInterface>,std::equal_to<PCITransportMemRegion>,std::hash<PCITransportMemRegion>,true>,std::allocator<std::__hash_value_type<PCITransportMemRegion,PCITransportInterface>>>::__emplace_unique_key_args<PCITransportMemRegion,std::pair<PCITransportMemRegion const,PCITransportInterface> const&>((float *)&v67, 2u, 0x1200000002);
  std::__hash_table<std::__hash_value_type<PCITransportMemRegion,PCITransportInterface>,std::__unordered_map_hasher<PCITransportMemRegion,std::__hash_value_type<PCITransportMemRegion,PCITransportInterface>,std::hash<PCITransportMemRegion>,std::equal_to<PCITransportMemRegion>,true>,std::__unordered_map_equal<PCITransportMemRegion,std::__hash_value_type<PCITransportMemRegion,PCITransportInterface>,std::equal_to<PCITransportMemRegion>,std::hash<PCITransportMemRegion>,true>,std::allocator<std::__hash_value_type<PCITransportMemRegion,PCITransportInterface>>>::__emplace_unique_key_args<PCITransportMemRegion,std::pair<PCITransportMemRegion const,PCITransportInterface> const&>((float *)&v67, 3u, 0x1500000003);
  std::__hash_table<std::__hash_value_type<PCITransportMemRegion,PCITransportInterface>,std::__unordered_map_hasher<PCITransportMemRegion,std::__hash_value_type<PCITransportMemRegion,PCITransportInterface>,std::hash<PCITransportMemRegion>,std::equal_to<PCITransportMemRegion>,true>,std::__unordered_map_equal<PCITransportMemRegion,std::__hash_value_type<PCITransportMemRegion,PCITransportInterface>,std::equal_to<PCITransportMemRegion>,std::hash<PCITransportMemRegion>,true>,std::allocator<std::__hash_value_type<PCITransportMemRegion,PCITransportInterface>>>::__emplace_unique_key_args<PCITransportMemRegion,std::pair<PCITransportMemRegion const,PCITransportInterface> const&>((float *)&v67, 0xFFF0u, 0x130000FFF0);
  if (*((void *)&v67 + 1))
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v67 + 8));
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v14 = v12;
      if (*((void *)&v67 + 1) <= v12) {
        unint64_t v14 = v12 % *((void *)&v67 + 1);
      }
    }
    else
    {
      unint64_t v14 = (DWORD2(v67) - 1) & v12;
    }
    float v15 = *(uint64_t ***)(v67 + 8 * v14);
    if (v15)
    {
      float v16 = *v15;
      if (v16)
      {
        if (v13.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v18 = v16[1];
            if (v18 == v12)
            {
              if (*((_DWORD *)v16 + 4) == v12) {
                goto LABEL_48;
              }
            }
            else if ((v18 & (*((void *)&v67 + 1) - 1)) != v14)
            {
              goto LABEL_32;
            }
            float v16 = (uint64_t *)*v16;
            if (!v16) {
              goto LABEL_32;
            }
          }
        }
        do
        {
          unint64_t v17 = v16[1];
          if (v17 == v12)
          {
            if (*((_DWORD *)v16 + 4) == v12)
            {
LABEL_48:
              int v20 = 0;
              int v19 = *((_DWORD *)v16 + 5);
              unint64_t v21 = (void *)v68;
              if (!(void)v68) {
                goto LABEL_34;
              }
              goto LABEL_33;
            }
          }
          else
          {
            if (v17 >= *((void *)&v67 + 1)) {
              v17 %= *((void *)&v67 + 1);
            }
            if (v17 != v14) {
              break;
            }
          }
          float v16 = (uint64_t *)*v16;
        }
        while (v16);
      }
    }
  }
LABEL_32:
  int v19 = 34;
  int v20 = 1;
  unint64_t v21 = (void *)v68;
  if (!(void)v68) {
    goto LABEL_34;
  }
  do
  {
LABEL_33:
    uint64_t v22 = (void *)*v21;
    operator delete(v21);
    unint64_t v21 = v22;
  }
  while (v22);
LABEL_34:
  __int16 v23 = (void *)v67;
  *(void *)&long long v67 = 0;
  if (v23) {
    operator delete(v23);
  }
  if (v20)
  {
    unint64_t v42 = (support::log::manager *)*((void *)this + 30);
    char v66 = 1;
    size_t v43 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v42 + 16))(v42, 1, **((void **)this + 27));
    if (v43)
    {
      if (*((void *)v42 + 17))
      {
        support::log::buffer::borrow(v43);
        int v44 = 2;
      }
      else
      {
        int v44 = 0;
      }
      if (v44 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_ERROR))
      {
        int v52 = *((_DWORD *)this + 30);
        LODWORD(v67) = 67109120;
        DWORD1(v67) = v52;
        uint64_t v53 = _os_log_send_and_compose_impl();
        if (v53)
        {
          uint64_t v54 = (char *)v53;
          std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = std::chrono::system_clock::now().__d_.__rep_;
          *(void *)&long long v67 = &unk_270EAED78;
          *((void *)&v67 + 1) = v3;
          *(void *)&long long v68 = &v66;
          *((void *)&v68 + 1) = &rep;
          support::log::manager::message_delegates(v42, (const support::log::details *)&v67, v54);
        }
      }
    }
    return 0;
  }
  unint64_t v64 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v62 = v24;
  long long v63 = v24;
  long long v60 = v24;
  long long v61 = v24;
  long long v59 = v24;
  TelephonyBasebandPCITransportInitParameters();
  uint64_t v25 = *((void *)this + 3);
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 0x40000000;
  void v58[2] = ___ZN7support9transport12PCIMemRegion18createPCITransportEv_block_invoke;
  v58[3] = &__block_descriptor_tmp_1;
  v58[4] = this;
  *((void *)&v59 + 1) = v25;
  *(void *)&long long v60 = v58;
  LODWORD(v59) = v19;
  DWORD2(v60) = *((_DWORD *)this + 38);
  *(void *)&long long v61 = v61 | 4;
  DWORD2(v61) = 0;
  char v26 = TelephonyBasebandPCITransportCreate();
  uint64_t v27 = (support::log::manager *)*((void *)this + 30);
  if ((v26 & 1) == 0)
  {
    char v66 = 1;
    uint64_t v45 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v27 + 16))(v27, 1, **((void **)this + 27));
    if (v45)
    {
      if (*((void *)v27 + 17))
      {
        support::log::buffer::borrow(v45);
        int v46 = 2;
      }
      else
      {
        int v46 = 0;
      }
      if (v46 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_ERROR))
      {
        int v55 = *((_DWORD *)this + 30);
        LODWORD(v67) = 67109120;
        DWORD1(v67) = v55;
        uint64_t v56 = _os_log_send_and_compose_impl();
        if (v56)
        {
          unint64_t v57 = (char *)v56;
          std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = std::chrono::system_clock::now().__d_.__rep_;
          *(void *)&long long v67 = &unk_270EAED78;
          *((void *)&v67 + 1) = v3;
          *(void *)&long long v68 = &v66;
          *((void *)&v68 + 1) = &rep;
          support::log::manager::message_delegates(v27, (const support::log::details *)&v67, v57);
        }
      }
    }
    return 0;
  }
  char v66 = 3;
  size_t v28 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v27 + 16))(v27, 3, **((void **)this + 27));
  if (v28)
  {
    if (*((void *)v27 + 17))
    {
      support::log::buffer::borrow(v28);
      int v29 = 2;
    }
    else
    {
      int v29 = 0;
    }
    if (v29 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_DEFAULT))
    {
      int v30 = *((_DWORD *)this + 30);
      LODWORD(v67) = 67109120;
      DWORD1(v67) = v30;
      uint64_t v31 = _os_log_send_and_compose_impl();
      if (v31)
      {
        size_t v32 = (char *)v31;
        v33.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v33.__d_.__rep_;
        *(void *)&long long v67 = &unk_270EAED78;
        *((void *)&v67 + 1) = v3;
        *(void *)&long long v68 = &v66;
        *((void *)&v68 + 1) = &rep;
        unint64_t v34 = (void *)((char *)v27 + 120);
        for (uint64_t j = *((void *)v27 + 16); (void *)j != v34; uint64_t j = *(void *)(j + 8))
          v33.__d_.__rep_ = (***(uint64_t (****)(void, long long *, char *))(j + 16))(*(void *)(j + 16), &v67, v32);
        support::log::manager::release_log_buffer((support::log::manager *)v33.__d_.__rep_, v32);
      }
    }
  }
  return 1;
}

void sub_2637E9214(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)(v1 - 96);
  if (v3)
  {
    do
    {
      unint64_t v4 = (void *)*v3;
      operator delete(v3);
      unint64_t v3 = v4;
    }
    while (v4);
  }
  int v5 = *(void **)(v1 - 112);
  *(void *)(v1 - 112) = 0;
  if (v5)
  {
    operator delete(v5);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void std::shared_ptr<support::transport::PCIMemRegion>::reset[abi:ne180100](void *a1)
{
  uint64_t v1 = (std::__shared_weak_count *)a1[1];
  *a1 = 0;
  a1[1] = 0;
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

uint64_t support::transport::PCIMemRegion::allocateVMRegion(support::transport::PCIMemRegion *this, mach_vm_size_t a2)
{
  kern_return_t v15;
  kern_return_t v16;
  mach_vm_size_t v17;
  kern_return_t v18;
  kern_return_t v19;
  support::log::manager *v20;
  support::log::buffer *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  std::chrono::system_clock::time_point v26;
  uint64_t j;
  support::log::buffer *v29;
  int v30;
  support::log::manager *v31;
  support::log::buffer *v32;
  int v33;
  support::log::buffer *v34;
  int v35;
  support::log::buffer *v36;
  int v37;
  support::log::buffer *v38;
  int v39;
  support::log::buffer *v40;
  int v41;
  support::log::buffer *v42;
  int v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep;
  char v55;
  mach_port_t object_name;
  mach_msg_type_number_t infoCnt;
  int info[4];
  long long v59;
  int v60;
  mach_vm_address_t address;
  unsigned char v62[24];
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep *p_rep;
  uint64_t v64;

  unint64_t v64 = *MEMORY[0x263EF8340];
  address = 0;
  long long v60 = -1431699456;
  *(_OWORD *)info = 0u;
  long long v59 = 0u;
  object_name = 0;
  infoCnt = 9;
  unint64_t v3 = (support::log::manager *)*((void *)this + 30);
  unint64_t v4 = (char *)this + 176;
  if (!a2)
  {
    int v55 = 1;
    int v29 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v3 + 16))(v3, 1, **((void **)this + 27));
    if (v29)
    {
      if (*((void *)v3 + 17))
      {
        int v30 = 2;
        support::log::buffer::borrow(v29);
      }
      else
      {
        int v30 = 0;
      }
      if (v30 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long v62 = 134217984;
        *(void *)&v62[4] = 0;
        int v44 = _os_log_send_and_compose_impl();
        if (v44)
        {
          uint64_t v45 = (char *)v44;
          std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = std::chrono::system_clock::now().__d_.__rep_;
          *(void *)long long v62 = &unk_270EAED78;
          *(void *)&v62[8] = v4;
          *(void *)&v62[16] = &v55;
          p_std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = &rep;
          support::log::manager::message_delegates(v3, (const support::log::details *)v62, v45);
        }
      }
    }
    goto LABEL_76;
  }
  int v55 = 3;
  int v6 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v3 + 16))(v3, 3, **((void **)this + 27));
  if (v6)
  {
    if (*((void *)v3 + 17))
    {
      int v7 = 2;
      support::log::buffer::borrow(v6);
    }
    else
    {
      int v7 = 0;
    }
    if (v7 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long v62 = 134217984;
      *(void *)&v62[4] = a2;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        std::chrono::system_clock::time_point v9 = (char *)v8;
        v10.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v10.__d_.__rep_;
        *(void *)long long v62 = &unk_270EAED78;
        *(void *)&v62[8] = v4;
        *(void *)&v62[16] = &v55;
        p_std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = &rep;
        unint64_t v11 = (void *)((char *)v3 + 120);
        for (uint64_t i = *((void *)v3 + 16); (void *)i != v11; uint64_t i = *(void *)(i + 8))
          v10.__d_.__rep_ = (***(uint64_t (****)(void, unsigned char *, char *))(i + 16))(*(void *)(i + 16), v62, v9);
        support::log::manager::release_log_buffer((support::log::manager *)v10.__d_.__rep_, v9);
      }
    }
  }
  *((void *)this + 17) = a2;
  uint8x8_t v13 = (vm_map_read_t *)MEMORY[0x263EF8960];
  unint64_t v14 = (uint64_t *)((char *)this + 128);
  float v15 = mach_vm_allocate(*MEMORY[0x263EF8960], (mach_vm_address_t *)this + 16, a2, 1);
  if (v15)
  {
    uint64_t v31 = (support::log::manager *)*((void *)this + 30);
    int v55 = 1;
    size_t v32 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v31 + 16))(v31, 1, **((void **)this + 27));
    if (!v32) {
      goto LABEL_76;
    }
    if (*((void *)v31 + 17))
    {
      support::log::buffer::borrow(v32);
      std::chrono::system_clock::time_point v33 = 2;
    }
    else
    {
      std::chrono::system_clock::time_point v33 = 0;
    }
    if (!(v33 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_ERROR))) {
      goto LABEL_76;
    }
    int v46 = *((void *)this + 17);
    *(_DWORD *)long long v62 = 134218240;
    *(void *)&v62[4] = v46;
    *(_WORD *)&v62[12] = 1024;
    *(_DWORD *)&v62[14] = v15;
    int v47 = _os_log_send_and_compose_impl();
    if (!v47) {
      goto LABEL_76;
    }
LABEL_71:
    uint64_t v51 = (char *)v47;
    std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = std::chrono::system_clock::now().__d_.__rep_;
    *(void *)long long v62 = &unk_270EAED78;
    *(void *)&v62[8] = v4;
    *(void *)&v62[16] = &v55;
    p_std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = &rep;
    support::log::manager::message_delegates(v31, (const support::log::details *)v62, v51);
LABEL_76:
    support::transport::PCIMemRegion::deallocateVMRegion(this);
    return 0;
  }
  address = *((void *)this + 16);
  *(_OWORD *)info = 0u;
  long long v59 = 0u;
  long long v60 = 0;
  float v16 = mach_vm_region(*v13, &address, (mach_vm_size_t *)this + 18, 9, info, &infoCnt, &object_name);
  if (v16)
  {
    uint64_t v31 = (support::log::manager *)*((void *)this + 30);
    int v55 = 1;
    unint64_t v34 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v31 + 16))(v31, 1, **((void **)this + 27));
    if (!v34) {
      goto LABEL_76;
    }
    if (*((void *)v31 + 17))
    {
      support::log::buffer::borrow(v34);
      uint8x8_t v35 = 2;
    }
    else
    {
      uint8x8_t v35 = 0;
    }
    if (!(v35 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_ERROR))) {
      goto LABEL_76;
    }
    *(_DWORD *)long long v62 = 67109120;
    *(_DWORD *)&v62[4] = v16;
    int v47 = _os_log_send_and_compose_impl();
    if (!v47) {
      goto LABEL_76;
    }
    goto LABEL_71;
  }
  if (address != *v14)
  {
    uint64_t v31 = (support::log::manager *)*((void *)this + 30);
    int v55 = 1;
    uint64_t v36 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v31 + 16))(v31, 1, **((void **)this + 27));
    if (!v36) {
      goto LABEL_76;
    }
    if (*((void *)v31 + 17))
    {
      support::log::buffer::borrow(v36);
      uint64_t v37 = 2;
    }
    else
    {
      uint64_t v37 = 0;
    }
    if (!(v37 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_ERROR))) {
      goto LABEL_76;
    }
    uint64_t v48 = *v14;
    *(_DWORD *)long long v62 = 134218240;
    *(void *)&v62[4] = address;
    *(_WORD *)&v62[12] = 2048;
    *(void *)&v62[14] = v48;
    int v47 = _os_log_send_and_compose_impl();
    if (!v47) {
      goto LABEL_76;
    }
    goto LABEL_71;
  }
  unint64_t v17 = *((void *)this + 18);
  if (v17 < *((void *)this + 17))
  {
    uint64_t v31 = (support::log::manager *)*((void *)this + 30);
    int v55 = 1;
    uint64_t v38 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v31 + 16))(v31, 1, **((void **)this + 27));
    if (!v38) {
      goto LABEL_76;
    }
    if (*((void *)v31 + 17))
    {
      support::log::buffer::borrow(v38);
      int v39 = 2;
    }
    else
    {
      int v39 = 0;
    }
    if (!(v39 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_ERROR))) {
      goto LABEL_76;
    }
    uint64_t v50 = *((void *)this + 17);
    uint8x8_t v49 = *((void *)this + 18);
    *(_DWORD *)long long v62 = 134218240;
    *(void *)&v62[4] = v49;
    *(_WORD *)&v62[12] = 2048;
    *(void *)&v62[14] = v50;
    int v47 = _os_log_send_and_compose_impl();
    if (!v47) {
      goto LABEL_76;
    }
    goto LABEL_71;
  }
  uint64_t v18 = mach_vm_protect(*v13, address, v17, 0, 3);
  if (v18)
  {
    uint64_t v31 = (support::log::manager *)*((void *)this + 30);
    int v55 = 1;
    uint64_t v40 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v31 + 16))(v31, 1, **((void **)this + 27));
    if (!v40) {
      goto LABEL_76;
    }
    if (*((void *)v31 + 17))
    {
      support::log::buffer::borrow(v40);
      int v41 = 2;
    }
    else
    {
      int v41 = 0;
    }
    if (!(v41 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_ERROR))) {
      goto LABEL_76;
    }
    *(_DWORD *)long long v62 = 67109120;
    *(_DWORD *)&v62[4] = v18;
    int v47 = _os_log_send_and_compose_impl();
    if (!v47) {
      goto LABEL_76;
    }
    goto LABEL_71;
  }
  int v19 = mach_vm_inherit(*v13, *((void *)this + 16), *((void *)this + 18), 2u);
  int v20 = (support::log::manager *)*((void *)this + 30);
  if (v19)
  {
    int v55 = 1;
    unint64_t v42 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v20 + 16))(v20, 1, **((void **)this + 27));
    if (v42)
    {
      if (*((void *)v20 + 17))
      {
        support::log::buffer::borrow(v42);
        size_t v43 = 2;
      }
      else
      {
        size_t v43 = 0;
      }
      if (v43 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long v62 = 67109120;
        *(_DWORD *)&v62[4] = v19;
        int v52 = _os_log_send_and_compose_impl();
        if (v52)
        {
          uint64_t v53 = (char *)v52;
          std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = std::chrono::system_clock::now().__d_.__rep_;
          *(void *)long long v62 = &unk_270EAED78;
          *(void *)&v62[8] = v4;
          *(void *)&v62[16] = &v55;
          p_std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = &rep;
          support::log::manager::message_delegates(v20, (const support::log::details *)v62, v53);
        }
      }
    }
    goto LABEL_76;
  }
  int v55 = 3;
  unint64_t v21 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v20 + 16))(v20, 3, **((void **)this + 27));
  if (v21)
  {
    if (*((void *)v20 + 17))
    {
      support::log::buffer::borrow(v21);
      uint64_t v22 = 2;
    }
    else
    {
      uint64_t v22 = 0;
    }
    if (v22 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_DEFAULT))
    {
      __int16 v23 = *v14;
      *(_DWORD *)long long v62 = 134218240;
      *(void *)&v62[4] = a2;
      *(_WORD *)&v62[12] = 2048;
      *(void *)&v62[14] = v23;
      long long v24 = _os_log_send_and_compose_impl();
      if (v24)
      {
        uint64_t v25 = (char *)v24;
        v26.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v26.__d_.__rep_;
        *(void *)long long v62 = &unk_270EAED78;
        *(void *)&v62[8] = v4;
        *(void *)&v62[16] = &v55;
        p_std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = &rep;
        for (uint64_t j = *((void *)v20 + 16);
              (support::log::manager *)j != (support::log::manager *)((char *)v20 + 120);
              uint64_t j = *(void *)(j + 8))
        {
          v26.__d_.__rep_ = (***(uint64_t (****)(void, unsigned char *, char *))(j + 16))(*(void *)(j + 16), v62, v25);
        }
        support::log::manager::release_log_buffer((support::log::manager *)v26.__d_.__rep_, v25);
      }
    }
  }
  return 1;
}

uint64_t support::transport::PCIMemRegion::mapVMRegion(support::transport::PCIMemRegion *this)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x2000000000;
  int v56 = -536870911;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3002000000;
  uint64_t v50 = __Block_byref_object_copy_;
  uint64_t v51 = __Block_byref_object_dispose_;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  unint64_t v2 = (void *)*((void *)this + 30);
  char v46 = 3;
  unint64_t v3 = (support::log::buffer *)(*(uint64_t (**)(void *, uint64_t, void))(*v2 + 16))(v2, 3, **((void **)this + 27));
  unint64_t v4 = (char *)this + 176;
  if (v3)
  {
    if (v2[17])
    {
      support::log::buffer::borrow(v3);
      int v5 = 2;
    }
    else
    {
      int v5 = 0;
    }
    if (v5 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *((_DWORD *)this + 30);
      uint64_t v7 = *((void *)this + 18);
      uint64_t v8 = *((void *)this + 16);
      LODWORD(v57) = 67109632;
      HIDWORD(v57) = v6;
      *(_WORD *)unint64_t v58 = 2048;
      *(void *)&void v58[2] = v7;
      *(_WORD *)&v58[10] = 2048;
      *(void *)&v58[12] = v8;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        std::chrono::system_clock::time_point v10 = (char *)v9;
        v11.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v11.__d_.__rep_;
        unint64_t v57 = &unk_270EAED78;
        *(void *)unint64_t v58 = (char *)this + 176;
        *(void *)&v58[8] = &v46;
        *(void *)&v58[16] = &rep;
        unint64_t v12 = v2 + 15;
        for (uint64_t i = v2[16]; (void *)i != v12; uint64_t i = *(void *)(i + 8))
          v11.__d_.__rep_ = (***(uint64_t (****)(void, void **, char *))(i + 16))(*(void *)(i + 16), &v57, v10);
        support::log::manager::release_log_buffer((support::log::manager *)v11.__d_.__rep_, v10);
      }
    }
  }
  *((void *)this + 20) = *((void *)this + 16);
  unint64_t v14 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v14)
  {
    atomic_fetch_add_explicit(&v14->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v14->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  if ((TelephonyBasebandPCITransportMapRegion() & 1) == 0)
  {
    int v39 = (support::log::manager *)*((void *)this + 30);
    char v46 = 1;
    uint64_t v40 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v39 + 16))(v39, 1, **((void **)this + 27));
    if (v40)
    {
      if (*((void *)v39 + 17))
      {
        support::log::buffer::borrow(v40);
        int v41 = 2;
      }
      else
      {
        int v41 = 0;
      }
      if (v41 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_ERROR))
      {
        int v42 = *((_DWORD *)this + 30);
        LODWORD(v57) = 67109120;
        HIDWORD(v57) = v42;
        uint64_t v43 = _os_log_send_and_compose_impl();
        if (v43)
        {
          int v44 = (char *)v43;
          std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = std::chrono::system_clock::now().__d_.__rep_;
          unint64_t v57 = &unk_270EAED78;
          *(void *)unint64_t v58 = (char *)this + 176;
          *(void *)&v58[8] = &v46;
          *(void *)&v58[16] = &rep;
          support::log::manager::message_delegates(v39, (const support::log::details *)&v57, v44);
        }
      }
    }
LABEL_27:
    uint64_t v28 = 0;
    *((void *)this + 20) = 0;
    int v29 = v14;
    if (!v14) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  float v15 = v48;
  dispatch_time_t v16 = dispatch_time(0, 1000000 * *((unsigned int *)this + 38));
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v15[5], v16))
  {
    unint64_t v17 = (void *)*((void *)this + 30);
    char v46 = 1;
    uint64_t v18 = (support::log::buffer *)(*(uint64_t (**)(void *, uint64_t, void))(*v17 + 16))(v17, 1, **((void **)this + 27));
    if (v18)
    {
      if (v17[17])
      {
        support::log::buffer::borrow(v18);
        int v19 = 2;
      }
      else
      {
        int v19 = 0;
      }
      if (v19 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_ERROR))
      {
        LOWORD(v57) = 0;
        uint64_t v23 = _os_log_send_and_compose_impl();
        if (v23)
        {
          long long v24 = (char *)v23;
          v25.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
          std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v25.__d_.__rep_;
          unint64_t v57 = &unk_270EAED78;
          *(void *)unint64_t v58 = (char *)this + 176;
          *(void *)&v58[8] = &v46;
          *(void *)&v58[16] = &rep;
          char v26 = v17 + 15;
          for (uint64_t j = v17[16]; (void *)j != v26; uint64_t j = *(void *)(j + 8))
            v25.__d_.__rep_ = (***(uint64_t (****)(void, void **, char *))(j + 16))(*(void *)(j + 16), &v57, v24);
          support::log::manager::release_log_buffer((support::log::manager *)v25.__d_.__rep_, v24);
        }
      }
    }
    goto LABEL_27;
  }
  if (*((_DWORD *)v54 + 6)) {
    goto LABEL_27;
  }
  int v20 = (void *)*((void *)this + 30);
  char v46 = 3;
  unint64_t v21 = (support::log::buffer *)(*(uint64_t (**)(void *, uint64_t, void))(*v20 + 16))(v20, 3, **((void **)this + 27));
  if (v21)
  {
    if (v20[17])
    {
      support::log::buffer::borrow(v21);
      int v22 = 2;
    }
    else
    {
      int v22 = 0;
    }
    if (v22 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_DEFAULT))
    {
      int v31 = *((_DWORD *)this + 30);
      uint64_t v32 = *((void *)this + 18);
      uint64_t v33 = *((void *)this + 16);
      LODWORD(v57) = 67109632;
      HIDWORD(v57) = v31;
      *(_WORD *)unint64_t v58 = 2048;
      *(void *)&void v58[2] = v32;
      *(_WORD *)&v58[10] = 2048;
      *(void *)&v58[12] = v33;
      uint64_t v34 = _os_log_send_and_compose_impl();
      if (v34)
      {
        uint8x8_t v35 = (char *)v34;
        v36.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v36.__d_.__rep_;
        unint64_t v57 = &unk_270EAED78;
        *(void *)unint64_t v58 = v4;
        *(void *)&v58[8] = &v46;
        *(void *)&v58[16] = &rep;
        uint64_t v37 = v20 + 15;
        for (uint64_t k = v20[16]; (void *)k != v37; uint64_t k = *(void *)(k + 8))
          v36.__d_.__rep_ = (***(uint64_t (****)(void, void **, char *))(k + 16))(*(void *)(k + 16), &v57, v35);
        support::log::manager::release_log_buffer((support::log::manager *)v36.__d_.__rep_, v35);
      }
    }
  }
  uint64_t v28 = 1;
  int v29 = v14;
  if (v14) {
LABEL_28:
  }
    std::__shared_weak_count::__release_weak(v29);
LABEL_29:
  if (v14) {
    std::__shared_weak_count::__release_weak(v14);
  }
  _Block_object_dispose(&v47, 8);
  if (object) {
    dispatch_release(object);
  }
  _Block_object_dispose(&v53, 8);
  return v28;
}

void sub_2637EA680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,dispatch_object_t object,char a29)
{
  if (a20)
  {
    std::__shared_weak_count::__release_weak(a20);
    if (!v29)
    {
LABEL_3:
      _Block_object_dispose(&a23, 8);
      int v31 = object;
      if (!object) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else if (!v29)
  {
    goto LABEL_3;
  }
  std::__shared_weak_count::__release_weak(v29);
  _Block_object_dispose(&a23, 8);
  int v31 = object;
  if (!object)
  {
LABEL_4:
    _Block_object_dispose(&a29, 8);
    _Unwind_Resume(a1);
  }
LABEL_7:
  dispatch_release(v31);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t support::transport::PCIMemRegion::mapVMRegionWithClientData(support::transport::PCIMemRegion *this, void *a2)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x2000000000;
  int v51 = -536870911;
  unint64_t v3 = dispatch_semaphore_create(0);
  unint64_t v4 = (void *)*((void *)this + 30);
  char v47 = 3;
  int v5 = (support::log::buffer *)(*(uint64_t (**)(void *, uint64_t, void))(*v4 + 16))(v4, 3, **((void **)this + 27));
  int v6 = (char *)this + 176;
  if (v5)
  {
    if (v4[17])
    {
      support::log::buffer::borrow(v5);
      int v7 = 2;
    }
    else
    {
      int v7 = 0;
    }
    if (v7 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *((_DWORD *)this + 30);
      uint64_t v9 = *((void *)this + 18);
      uint64_t v10 = *((void *)this + 16);
      LODWORD(v52) = 67109632;
      HIDWORD(v52) = v8;
      *(_WORD *)uint64_t v53 = 2048;
      *(void *)&v53[2] = v9;
      *(_WORD *)&v53[10] = 2048;
      *(void *)&v53[12] = v10;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        unint64_t v12 = (char *)v11;
        v13.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v13.__d_.__rep_;
        int v52 = &unk_270EAED78;
        *(void *)uint64_t v53 = (char *)this + 176;
        *(void *)&v53[8] = &v47;
        *(void *)&v53[16] = &rep;
        unint64_t v14 = v4 + 15;
        for (uint64_t i = v4[16]; (void *)i != v14; uint64_t i = *(void *)(i + 8))
          v13.__d_.__rep_ = (***(uint64_t (****)(void, void **, char *))(i + 16))(*(void *)(i + 16), &v52, v12);
        support::log::manager::release_log_buffer((support::log::manager *)v13.__d_.__rep_, v12);
      }
    }
  }
  *((void *)this + 20) = *((void *)this + 16);
  dispatch_time_t v16 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v16)
  {
    atomic_fetch_add_explicit(&v16->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v16->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  if ((TelephonyBasebandPCITransportMapRegionwithClientData() & 1) == 0)
  {
    uint64_t v40 = (support::log::manager *)*((void *)this + 30);
    char v47 = 1;
    int v41 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v40 + 16))(v40, 1, **((void **)this + 27));
    if (v41)
    {
      if (*((void *)v40 + 17))
      {
        support::log::buffer::borrow(v41);
        int v42 = 2;
      }
      else
      {
        int v42 = 0;
      }
      if (v42 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_ERROR))
      {
        int v43 = *((_DWORD *)this + 30);
        LODWORD(v52) = 67109120;
        HIDWORD(v52) = v43;
        uint64_t v44 = _os_log_send_and_compose_impl();
        if (v44)
        {
          uint64_t v45 = (char *)v44;
          std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = std::chrono::system_clock::now().__d_.__rep_;
          int v52 = &unk_270EAED78;
          *(void *)uint64_t v53 = (char *)this + 176;
          *(void *)&v53[8] = &v47;
          *(void *)&v53[16] = &rep;
          support::log::manager::message_delegates(v40, (const support::log::details *)&v52, v45);
        }
      }
    }
LABEL_27:
    uint64_t v29 = 0;
    *((void *)this + 20) = 0;
    int v30 = v16;
    if (!v16) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  dispatch_time_t v17 = dispatch_time(0, 1000000 * *((unsigned int *)this + 38));
  if (dispatch_semaphore_wait(v3, v17))
  {
    uint64_t v18 = (void *)*((void *)this + 30);
    char v47 = 1;
    int v19 = (support::log::buffer *)(*(uint64_t (**)(void *, uint64_t, void))(*v18 + 16))(v18, 1, **((void **)this + 27));
    if (v19)
    {
      if (v18[17])
      {
        support::log::buffer::borrow(v19);
        int v20 = 2;
      }
      else
      {
        int v20 = 0;
      }
      if (v20 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_ERROR))
      {
        LOWORD(v52) = 0;
        uint64_t v24 = _os_log_send_and_compose_impl();
        if (v24)
        {
          std::chrono::system_clock::time_point v25 = (char *)v24;
          v26.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
          std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v26.__d_.__rep_;
          int v52 = &unk_270EAED78;
          *(void *)uint64_t v53 = (char *)this + 176;
          *(void *)&v53[8] = &v47;
          *(void *)&v53[16] = &rep;
          uint64_t v27 = v18 + 15;
          for (uint64_t j = v18[16]; (void *)j != v27; uint64_t j = *(void *)(j + 8))
            v26.__d_.__rep_ = (***(uint64_t (****)(void, void **, char *))(j + 16))(*(void *)(j + 16), &v52, v25);
          support::log::manager::release_log_buffer((support::log::manager *)v26.__d_.__rep_, v25);
        }
      }
    }
    goto LABEL_27;
  }
  if (*((_DWORD *)v49 + 6)) {
    goto LABEL_27;
  }
  unint64_t v21 = (void *)*((void *)this + 30);
  char v47 = 3;
  int v22 = (support::log::buffer *)(*(uint64_t (**)(void *, uint64_t, void))(*v21 + 16))(v21, 3, **((void **)this + 27));
  if (v22)
  {
    if (v21[17])
    {
      support::log::buffer::borrow(v22);
      int v23 = 2;
    }
    else
    {
      int v23 = 0;
    }
    if (v23 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_DEFAULT))
    {
      int v32 = *((_DWORD *)this + 30);
      uint64_t v33 = *((void *)this + 18);
      uint64_t v34 = *((void *)this + 16);
      LODWORD(v52) = 67109632;
      HIDWORD(v52) = v32;
      *(_WORD *)uint64_t v53 = 2048;
      *(void *)&v53[2] = v33;
      *(_WORD *)&v53[10] = 2048;
      *(void *)&v53[12] = v34;
      uint64_t v35 = _os_log_send_and_compose_impl();
      if (v35)
      {
        std::chrono::system_clock::time_point v36 = (char *)v35;
        v37.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v37.__d_.__rep_;
        int v52 = &unk_270EAED78;
        *(void *)uint64_t v53 = v6;
        *(void *)&v53[8] = &v47;
        *(void *)&v53[16] = &rep;
        uint64_t v38 = v21 + 15;
        for (uint64_t k = v21[16]; (void *)k != v38; uint64_t k = *(void *)(k + 8))
          v37.__d_.__rep_ = (***(uint64_t (****)(void, void **, char *))(k + 16))(*(void *)(k + 16), &v52, v36);
        support::log::manager::release_log_buffer((support::log::manager *)v37.__d_.__rep_, v36);
      }
    }
  }
  uint64_t v29 = 1;
  int v30 = v16;
  if (v16) {
LABEL_28:
  }
    std::__shared_weak_count::__release_weak(v30);
LABEL_29:
  if (v16) {
    std::__shared_weak_count::__release_weak(v16);
  }
  if (v3) {
    dispatch_release(v3);
  }
  _Block_object_dispose(&v48, 8);
  return v29;
}

void sub_2637EAEC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18, uint64_t a19, uint64_t a20,char a21)
{
  if (a18)
  {
    std::__shared_weak_count::__release_weak(a18);
    if (!v22)
    {
LABEL_3:
      if (!v21) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else if (!v22)
  {
    goto LABEL_3;
  }
  std::__shared_weak_count::__release_weak(v22);
  if (!v21)
  {
LABEL_4:
    _Block_object_dispose(&a21, 8);
    _Unwind_Resume(a1);
  }
LABEL_7:
  dispatch_release(v21);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t support::transport::PCIMemRegion::PCIMemRegion(uint64_t a1, const void **a2, int a3, uint64_t a4, int a5)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = &unk_270EAF600;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 120) = a3;
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 128) = 0;
  *(_DWORD *)(a1 + 152) = a5;
  *(void *)(a1 + 160) = 0;
  std::chrono::system_clock::time_point v26 = operator new(0x30uLL);
  long long v27 = xmmword_263807900;
  strcpy((char *)v26, "com.apple.telephony.basebandservices.support");
  strcpy((char *)v25, "transport.pcimemregion");
  HIBYTE(v25[2]) = 22;
  support::log::client::client((void *)(a1 + 168), (uint64_t)&v26, (uint64_t)v25, a4);
  if (SHIBYTE(v25[2]) < 0)
  {
    operator delete(v25[0]);
    if ((SHIBYTE(v27) & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  else if ((SHIBYTE(v27) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(v26);
LABEL_3:
  int v8 = (char *)operator new(0x28uLL);
  *(_OWORD *)&v24.__r_.__value_.__r.__words[1] = xmmword_2638086D0;
  strcpy(v8, "com.apple.telephony.PCIMemRegion");
  int v9 = *((char *)a2 + 23);
  if (v9 >= 0) {
    size_t v10 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v10 = (size_t)a2[1];
  }
  unint64_t v11 = v10 + 1;
  memset(__p, 170, sizeof(__p));
  v24.__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
  if (v10 + 1 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v11 >= 0x17)
  {
    uint64_t v13 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17) {
      uint64_t v13 = v11 | 7;
    }
    uint64_t v14 = v13 + 1;
    float v15 = (char *)operator new(v13 + 1);
    __p[1] = (void *)(v10 + 1);
    __p[2] = (void *)(v14 | 0x8000000000000000);
    __p[0] = v15;
    char *v15 = 46;
    unint64_t v12 = v15 + 1;
  }
  else
  {
    __p[1] = 0;
    __p[2] = 0;
    HIBYTE(__p[2]) = v10 + 1;
    unint64_t v12 = (char *)__p + 1;
    __p[0] = (void *)46;
    if (!v10) {
      goto LABEL_17;
    }
  }
  if (v9 >= 0) {
    dispatch_time_t v16 = a2;
  }
  else {
    dispatch_time_t v16 = *a2;
  }
  memmove(v12, v16, v10);
LABEL_17:
  v12[v10] = 0;
  if (SHIBYTE(__p[2]) >= 0) {
    dispatch_time_t v17 = __p;
  }
  else {
    dispatch_time_t v17 = (void **)__p[0];
  }
  if (SHIBYTE(__p[2]) >= 0) {
    std::string::size_type v18 = HIBYTE(__p[2]);
  }
  else {
    std::string::size_type v18 = (std::string::size_type)__p[1];
  }
  std::string::append(&v24, (const std::string::value_type *)v17, v18);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v19 = &v24;
  }
  else {
    int v19 = (std::string *)v24.__r_.__value_.__r.__words[0];
  }
  dispatch_queue_t v20 = dispatch_queue_create((const char *)v19, 0);
  unint64_t v21 = *(NSObject **)(a1 + 24);
  *(void *)(a1 + 24) = v20;
  if (v21) {
    dispatch_release(v21);
  }
  *(void *)(a1 + 112) = 0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  return a1;
}

void sub_2637EB204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  support::log::client::~client(v33);
  std::chrono::system_clock::time_point v36 = *(NSObject **)(v32 + 24);
  if (v36)
  {
    dispatch_release(v36);
    uint64_t v35 = *(std::__shared_weak_count **)(v32 + 16);
    if (v35)
    {
LABEL_9:
      std::__shared_weak_count::__release_weak(v35);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    uint64_t v35 = *(std::__shared_weak_count **)(v32 + 16);
    if (v35) {
      goto LABEL_9;
    }
  }
  _Unwind_Resume(a1);
}

void support::transport::PCIMemRegion::~PCIMemRegion(support::transport::PCIMemRegion *this)
{
  *(void *)this = &unk_270EAF600;
  support::transport::PCIMemRegion::unmapVMRegion(this);
  support::transport::PCIMemRegion::deallocateVMRegion(this);
  unint64_t v2 = (unsigned int (*)(char *))*((void *)this + 11);
  if (v2 && v2((char *)this + 32)) {
    TelephonyUtilTransportFree();
  }
  *((void *)this + 21) = &unk_270EAECE0;
  unint64_t v3 = (std::__shared_weak_count *)*((void *)this + 29);
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  unint64_t v4 = *((void *)this + 3);
  if (v4) {
    dispatch_release(v4);
  }
  int v5 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
}

{
  void *v1;
  uint64_t vars8;

  support::transport::PCIMemRegion::~PCIMemRegion(this);

  operator delete(v1);
}

void support::transport::PCIMemRegion::unmapVMRegion(support::transport::PCIMemRegion *this)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  if (!*((void *)this + 20)) {
    return;
  }
  unint64_t v2 = (void *)*((void *)this + 30);
  unint64_t v3 = (char *)this + 176;
  LOBYTE(v57) = 3;
  unint64_t v4 = (support::log::buffer *)(*(uint64_t (**)(void *, uint64_t, void))(*v2 + 16))(v2, 3, **((void **)this + 27));
  if (v4)
  {
    if (v2[17])
    {
      int v5 = 2;
      support::log::buffer::borrow(v4);
    }
    else
    {
      int v5 = 0;
    }
    if (v5 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *((_DWORD *)this + 30);
      uint64_t v7 = *((void *)this + 18);
      uint64_t v8 = *((void *)this + 16);
      LODWORD(v59) = 67109632;
      HIDWORD(v59) = v6;
      *(_WORD *)long long v60 = 2048;
      *(void *)&v60[2] = v7;
      *(_WORD *)&v60[10] = 2048;
      *(void *)&v60[12] = v8;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        size_t v10 = (char *)v9;
        v11.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v11.__d_.__rep_;
        uint64_t v59 = &unk_270EAED78;
        *(void *)long long v60 = v3;
        *(void *)&v60[8] = &v57;
        *(void *)&v60[16] = &rep;
        unint64_t v12 = v2 + 15;
        for (uint64_t i = v2[16]; (void *)i != v12; uint64_t i = *(void *)(i + 8))
          v11.__d_.__rep_ = (***(uint64_t (****)(void, void **, char *))(i + 16))(*(void *)(i + 16), &v59, v10);
        support::log::manager::release_log_buffer((support::log::manager *)v11.__d_.__rep_, v10);
      }
    }
  }
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = 0;
  p_std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = &rep;
  uint64_t v55 = 0x2000000000;
  int v56 = -536870911;
  uint64_t v59 = 0;
  *(void *)long long v60 = &v59;
  *(void *)&v60[8] = 0x3002000000;
  *(void *)&v60[16] = __Block_byref_object_copy_;
  long long v61 = __Block_byref_object_dispose_;
  dispatch_object_t v62 = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t v62 = dispatch_semaphore_create(0);
  uint64_t v47 = MEMORY[0x263EF8330];
  uint64_t v48 = 1107296256;
  uint64_t v49 = ___ZN7support9transport12PCIMemRegion13unmapVMRegionEv_block_invoke;
  uint64_t v50 = &__block_descriptor_tmp_8_1;
  int v51 = &rep;
  int v52 = &v59;
  if ((TelephonyBasebandPCITransportUnmapRegion() & 1) == 0)
  {
    int v19 = (void *)*((void *)this + 30);
    char v46 = 1;
    dispatch_queue_t v20 = (support::log::buffer *)(*(uint64_t (**)(void *, uint64_t, void))(*v19 + 16))(v19, 1, **((void **)this + 27));
    if (!v20) {
      goto LABEL_47;
    }
    if (v19[17])
    {
      support::log::buffer::borrow(v20);
      int v21 = 2;
    }
    else
    {
      int v21 = 0;
    }
    if (!(v21 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_ERROR))) {
      goto LABEL_47;
    }
    int v25 = *((_DWORD *)this + 30);
    LODWORD(v57) = 67109120;
    HIDWORD(v57) = v25;
    uint64_t v26 = _os_log_send_and_compose_impl();
    if (!v26) {
      goto LABEL_47;
    }
    long long v27 = (char *)v26;
    v28.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
    std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v45 = v28.__d_.__rep_;
    unint64_t v57 = &unk_270EAED78;
    *(void *)unint64_t v58 = v3;
    *(void *)&v58[8] = &v46;
    *(void *)&v58[16] = &v45;
    uint64_t v29 = v19 + 15;
    for (uint64_t j = v19[16]; (void *)j != v29; uint64_t j = *(void *)(j + 8))
      v28.__d_.__rep_ = (***(uint64_t (****)(void, void **, char *))(j + 16))(*(void *)(j + 16), &v57, v27);
    goto LABEL_28;
  }
  uint64_t v14 = *(void *)v60;
  dispatch_time_t v15 = dispatch_time(0, 1000000 * *((unsigned int *)this + 38));
  if (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v14 + 40), v15))
  {
    int v22 = (support::log::manager *)*((void *)this + 30);
    if (*((_DWORD *)p_rep + 6))
    {
      char v46 = 1;
      int v23 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v22 + 16))(v22, 1, **((void **)this + 27));
      if (v23)
      {
        if (*((void *)v22 + 17))
        {
          support::log::buffer::borrow(v23);
          int v24 = 2;
        }
        else
        {
          int v24 = 0;
        }
        if (v24 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_ERROR))
        {
          int v36 = *((_DWORD *)this + 30);
          int v37 = *((_DWORD *)p_rep + 6);
          LODWORD(v57) = 67109376;
          HIDWORD(v57) = v36;
          *(_WORD *)unint64_t v58 = 1024;
          *(_DWORD *)&void v58[2] = v37;
          uint64_t v38 = _os_log_send_and_compose_impl();
          if (v38)
          {
            int v39 = (char *)v38;
            std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v45 = std::chrono::system_clock::now().__d_.__rep_;
            unint64_t v57 = &unk_270EAED78;
            *(void *)unint64_t v58 = v3;
            *(void *)&v58[8] = &v46;
            *(void *)&v58[16] = &v45;
            support::log::manager::message_delegates(v22, (const support::log::details *)&v57, v39);
          }
        }
      }
    }
    else
    {
      char v46 = 3;
      int v31 = (support::log::buffer *)(*(uint64_t (**)(support::log::manager *, uint64_t, void))(*(void *)v22 + 16))(v22, 3, **((void **)this + 27));
      if (v31)
      {
        if (*((void *)v22 + 17))
        {
          support::log::buffer::borrow(v31);
          int v32 = 2;
        }
        else
        {
          int v32 = 0;
        }
        if (v32 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_DEFAULT))
        {
          int v40 = *((_DWORD *)this + 30);
          uint64_t v41 = *((void *)this + 18);
          uint64_t v42 = *((void *)this + 16);
          LODWORD(v57) = 67109632;
          HIDWORD(v57) = v40;
          *(_WORD *)unint64_t v58 = 2048;
          *(void *)&void v58[2] = v41;
          *(_WORD *)&v58[10] = 2048;
          *(void *)&v58[12] = v42;
          uint64_t v43 = _os_log_send_and_compose_impl();
          if (v43)
          {
            uint64_t v44 = (char *)v43;
            std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v45 = std::chrono::system_clock::now().__d_.__rep_;
            unint64_t v57 = &unk_270EAED78;
            *(void *)unint64_t v58 = v3;
            *(void *)&v58[8] = &v46;
            *(void *)&v58[16] = &v45;
            support::log::manager::message_delegates(v22, (const support::log::details *)&v57, v44);
          }
        }
      }
      *((void *)this + 20) = 0;
    }
    goto LABEL_47;
  }
  dispatch_time_t v16 = (void *)*((void *)this + 30);
  char v46 = 1;
  dispatch_time_t v17 = (support::log::buffer *)(*(uint64_t (**)(void *, uint64_t, void))(*v16 + 16))(v16, 1, **((void **)this + 27));
  if (v17)
  {
    if (v16[17])
    {
      support::log::buffer::borrow(v17);
      int v18 = 2;
    }
    else
    {
      int v18 = 0;
    }
    if (v18 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_ERROR))
    {
      LOWORD(v57) = 0;
      uint64_t v33 = _os_log_send_and_compose_impl();
      if (v33)
      {
        long long v27 = (char *)v33;
        v28.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v45 = v28.__d_.__rep_;
        unint64_t v57 = &unk_270EAED78;
        *(void *)unint64_t v58 = v3;
        *(void *)&v58[8] = &v46;
        *(void *)&v58[16] = &v45;
        uint64_t v34 = v16 + 15;
        for (uint64_t k = v16[16]; (void *)k != v34; uint64_t k = *(void *)(k + 8))
          v28.__d_.__rep_ = (***(uint64_t (****)(void, void **, char *))(k + 16))(*(void *)(k + 16), &v57, v27);
LABEL_28:
        support::log::manager::release_log_buffer((support::log::manager *)v28.__d_.__rep_, v27);
      }
    }
  }
LABEL_47:
  _Block_object_dispose(&v59, 8);
  if (v62) {
    dispatch_release(v62);
  }
  _Block_object_dispose(&rep, 8);
}

void sub_2637EBBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  uint64_t v13 = *(NSObject **)(v11 - 88);
  if (v13) {
    dispatch_release(v13);
  }
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void support::transport::PCIMemRegion::deallocateVMRegion(support::transport::PCIMemRegion *this)
{
  kern_return_t v3;
  void *v4;
  support::log::buffer *v5;
  int v6;
  support::log::buffer *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  std::chrono::system_clock::time_point v13;
  void *v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t j;
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep;
  char v22;
  unsigned char v23[24];
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep *p_rep;
  uint64_t v25;

  int v25 = *MEMORY[0x263EF8340];
  mach_vm_address_t v2 = *((void *)this + 16);
  if (v2 && *((void *)this + 18))
  {
    unint64_t v3 = mach_vm_deallocate(*MEMORY[0x263EF8960], v2, *((void *)this + 17));
    unint64_t v4 = (void *)*((void *)this + 30);
    if (v3)
    {
      int v22 = 1;
      int v5 = (support::log::buffer *)(*(uint64_t (**)(void *, uint64_t, void))(*v4 + 16))(v4, 1, **((void **)this + 27));
      if (v5)
      {
        if (v4[17])
        {
          int v6 = 2;
          support::log::buffer::borrow(v5);
        }
        else
        {
          int v6 = 0;
        }
        if (v6 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_ERROR))
        {
          size_t v10 = *((void *)this + 16);
          uint64_t v9 = *((void *)this + 17);
          *(_DWORD *)int v23 = 134218240;
          *(void *)&v23[4] = v9;
          *(_WORD *)&v23[12] = 2048;
          *(void *)&v23[14] = v10;
          uint64_t v11 = _os_log_send_and_compose_impl();
          if (v11)
          {
            unint64_t v12 = (char *)v11;
            v13.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
            std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v13.__d_.__rep_;
            *(void *)int v23 = &unk_270EAED78;
            *(void *)&v23[8] = (char *)this + 176;
            *(void *)&v23[16] = &v22;
            p_std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = &rep;
            uint64_t v14 = v4 + 15;
            for (uint64_t i = v4[16]; (void *)i != v14; uint64_t i = *(void *)(i + 8))
              v13.__d_.__rep_ = (***(uint64_t (****)(void, unsigned char *, char *))(i + 16))(*(void *)(i + 16), v23, v12);
LABEL_21:
            support::log::manager::release_log_buffer((support::log::manager *)v13.__d_.__rep_, v12);
          }
        }
      }
    }
    else
    {
      int v22 = 3;
      uint64_t v7 = (support::log::buffer *)(*(uint64_t (**)(void *, uint64_t, void))(*v4 + 16))(v4, 3, **((void **)this + 27));
      if (v7)
      {
        if (v4[17])
        {
          uint64_t v8 = 2;
          support::log::buffer::borrow(v7);
        }
        else
        {
          uint64_t v8 = 0;
        }
        if (v8 | os_log_type_enabled(**((os_log_t **)this + 27), OS_LOG_TYPE_DEFAULT))
        {
          dispatch_time_t v17 = *((void *)this + 16);
          dispatch_time_t v16 = *((void *)this + 17);
          *(_DWORD *)int v23 = 134218240;
          *(void *)&v23[4] = v16;
          *(_WORD *)&v23[12] = 2048;
          *(void *)&v23[14] = v17;
          int v18 = _os_log_send_and_compose_impl();
          if (v18)
          {
            unint64_t v12 = (char *)v18;
            v13.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
            std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v13.__d_.__rep_;
            *(void *)int v23 = &unk_270EAED78;
            *(void *)&v23[8] = (char *)this + 176;
            *(void *)&v23[16] = &v22;
            p_std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = &rep;
            int v19 = v4 + 15;
            for (uint64_t j = v4[16]; (void *)j != v19; uint64_t j = *(void *)(j + 8))
              v13.__d_.__rep_ = (***(uint64_t (****)(void, unsigned char *, char *))(j + 16))(*(void *)(j + 16), v23, v12);
            goto LABEL_21;
          }
        }
      }
    }
  }
  *((void *)this + 16) = 0;
  *((void *)this + 18) = 0;
}

uint64_t support::transport::PCIMemRegion::freePCITransport(uint64_t this)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(this + 88);
  if (v1)
  {
    this = v1(this + 32);
    if (this)
    {
      return TelephonyUtilTransportFree();
    }
  }
  return this;
}

void ___ZN7support9transport12PCIMemRegion18createPCITransportEv_block_invoke(uint64_t a1, int a2)
{
  void v14[5] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = *(void **)(v3 + 240);
  char v13 = 1;
  int v5 = (support::log::buffer *)(*(uint64_t (**)(void *, uint64_t, void))(*v4 + 16))(v4, 1, **(void **)(v3 + 216));
  if (v5)
  {
    if (v4[17])
    {
      int v6 = 2;
      support::log::buffer::borrow(v5);
    }
    else
    {
      int v6 = 0;
    }
    if (v6 | os_log_type_enabled(**(os_log_t **)(v3 + 216), OS_LOG_TYPE_ERROR))
    {
      LODWORD(v14[0]) = 67109120;
      HIDWORD(v14[0]) = a2;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        uint64_t v8 = (char *)v7;
        v9.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v9.__d_.__rep_;
        v14[0] = &unk_270EAED78;
        v14[1] = v3 + 176;
        v14[2] = &v13;
        v14[3] = &rep;
        size_t v10 = v4 + 15;
        for (uint64_t i = v4[16]; (void *)i != v10; uint64_t i = *(void *)(i + 8))
          v9.__d_.__rep_ = (***(uint64_t (****)(void, void *, char *))(i + 16))(*(void *)(i + 16), v14, v8);
        support::log::manager::release_log_buffer((support::log::manager *)v9.__d_.__rep_, v8);
      }
    }
  }
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

void ___ZN7support9transport12PCIMemRegion11mapVMRegionEv_block_invoke(void *a1, int a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v3 = (std::__shared_weak_count *)a1[8];
  if (v3)
  {
    uint64_t v5 = a1[6];
    int v6 = std::__shared_weak_count::lock(v3);
    dispatch_queue_t v20 = v6;
    if (v6)
    {
      uint64_t v7 = v6;
      if (a1[7])
      {
        if (a2)
        {
          uint64_t v8 = *(void **)(v5 + 240);
          char v18 = 1;
          std::chrono::system_clock::time_point v9 = (support::log::buffer *)(*(uint64_t (**)(void *, uint64_t, void))(*v8 + 16))(v8, 1, **(void **)(v5 + 216));
          if (v9)
          {
            if (v8[17])
            {
              support::log::buffer::borrow(v9);
              int v10 = 2;
            }
            else
            {
              int v10 = 0;
            }
            if (v10 | os_log_type_enabled(**(os_log_t **)(v5 + 216), OS_LOG_TYPE_ERROR))
            {
              int v11 = *(_DWORD *)(v5 + 120);
              LODWORD(v21) = 67109376;
              HIDWORD(v21) = v11;
              LOWORD(v22) = 1024;
              *(_DWORD *)((char *)&v22 + 2) = a2;
              uint64_t v12 = _os_log_send_and_compose_impl();
              if (v12)
              {
                char v13 = (char *)v12;
                v14.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
                std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v14.__d_.__rep_;
                int v21 = &unk_270EAED78;
                uint64_t v22 = v5 + 176;
                int v23 = &v18;
                p_std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = &rep;
                dispatch_time_t v15 = v8 + 15;
                for (uint64_t i = v8[16]; (void *)i != v15; uint64_t i = *(void *)(i + 8))
                  v14.__d_.__rep_ = (***(uint64_t (****)(void, void **, char *))(i + 16))(*(void *)(i + 16), &v21, v13);
                support::log::manager::release_log_buffer((support::log::manager *)v14.__d_.__rep_, v13);
              }
            }
          }
        }
        *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = a2;
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[5] + 8) + 40));
      }
      if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
}

void sub_2637EC4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2637EC4B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2637EC4C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2637EC4DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32r40r56c57_ZTSNSt3__18weak_ptrIN7support9transport12PCIMemRegionEEE(void *a1, uint64_t a2)
{
  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 8);
  _Block_object_assign(a1 + 5, *(const void **)(a2 + 40), 8);
  uint64_t v4 = *(void *)(a2 + 64);
  a1[7] = *(void *)(a2 + 56);
  a1[8] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
}

void __destroy_helper_block_e8_32r40r56c57_ZTSNSt3__18weak_ptrIN7support9transport12PCIMemRegionEEE(uint64_t a1)
{
  mach_vm_address_t v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  uint64_t v3 = *(const void **)(a1 + 32);

  _Block_object_dispose(v3, 8);
}

void ___ZN7support9transport12PCIMemRegion25mapVMRegionWithClientDataEPvm_block_invoke(void *a1, int a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v3 = (std::__shared_weak_count *)a1[7];
  if (v3)
  {
    uint64_t v5 = a1[5];
    int v6 = std::__shared_weak_count::lock(v3);
    dispatch_queue_t v20 = v6;
    if (v6)
    {
      uint64_t v7 = v6;
      if (a1[6])
      {
        if (a2)
        {
          uint64_t v8 = *(void **)(v5 + 240);
          char v18 = 1;
          std::chrono::system_clock::time_point v9 = (support::log::buffer *)(*(uint64_t (**)(void *, uint64_t, void))(*v8 + 16))(v8, 1, **(void **)(v5 + 216));
          if (v9)
          {
            if (v8[17])
            {
              support::log::buffer::borrow(v9);
              int v10 = 2;
            }
            else
            {
              int v10 = 0;
            }
            if (v10 | os_log_type_enabled(**(os_log_t **)(v5 + 216), OS_LOG_TYPE_ERROR))
            {
              int v11 = *(_DWORD *)(v5 + 120);
              LODWORD(v21) = 67109376;
              HIDWORD(v21) = v11;
              LOWORD(v22) = 1024;
              *(_DWORD *)((char *)&v22 + 2) = a2;
              uint64_t v12 = _os_log_send_and_compose_impl();
              if (v12)
              {
                char v13 = (char *)v12;
                v14.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
                std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v14.__d_.__rep_;
                int v21 = &unk_270EAED78;
                uint64_t v22 = v5 + 176;
                int v23 = &v18;
                p_std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = &rep;
                dispatch_time_t v15 = v8 + 15;
                for (uint64_t i = v8[16]; (void *)i != v15; uint64_t i = *(void *)(i + 8))
                  v14.__d_.__rep_ = (***(uint64_t (****)(void, void **, char *))(i + 16))(*(void *)(i + 16), &v21, v13);
                support::log::manager::release_log_buffer((support::log::manager *)v14.__d_.__rep_, v13);
              }
            }
          }
        }
        *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = a2;
      }
      if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
}

void sub_2637EC7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2637EC808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2637EC81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2637EC830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32r48c57_ZTSNSt3__18weak_ptrIN7support9transport12PCIMemRegionEEE(void *a1, uint64_t a2)
{
  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 8);
  uint64_t v4 = *(void *)(a2 + 56);
  a1[6] = *(void *)(a2 + 48);
  a1[7] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
}

void __destroy_helper_block_e8_32r48c57_ZTSNSt3__18weak_ptrIN7support9transport12PCIMemRegionEEE(uint64_t a1)
{
  mach_vm_address_t v2 = *(std::__shared_weak_count **)(a1 + 56);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 32);

  _Block_object_dispose(v3, 8);
}

intptr_t ___ZN7support9transport12PCIMemRegion13unmapVMRegionEv_block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __copy_helper_block_e8_32r40r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  uint64_t v4 = *(const void **)(a2 + 40);

  _Block_object_assign((void *)(a1 + 40), v4, 8);
}

void __destroy_helper_block_e8_32r40r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  mach_vm_address_t v2 = *(const void **)(a1 + 32);

  _Block_object_dispose(v2, 8);
}

void std::__hash_table<std::__hash_value_type<PCITransportMemRegion,PCITransportInterface>,std::__unordered_map_hasher<PCITransportMemRegion,std::__hash_value_type<PCITransportMemRegion,PCITransportInterface>,std::hash<PCITransportMemRegion>,std::equal_to<PCITransportMemRegion>,true>,std::__unordered_map_equal<PCITransportMemRegion,std::__hash_value_type<PCITransportMemRegion,PCITransportInterface>,std::equal_to<PCITransportMemRegion>,std::hash<PCITransportMemRegion>,true>,std::allocator<std::__hash_value_type<PCITransportMemRegion,PCITransportInterface>>>::__emplace_unique_key_args<PCITransportMemRegion,std::pair<PCITransportMemRegion const,PCITransportInterface> const&>(float *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v5 = a2;
  unint64_t v6 = *((void *)a1 + 1);
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v8 = a2;
      if (v6 <= a2) {
        unint64_t v8 = a2 % v6;
      }
    }
    else
    {
      unint64_t v8 = (v6 - 1) & a2;
    }
    std::chrono::system_clock::time_point v9 = *(uint64_t ***)(*(void *)a1 + 8 * v8);
    if (v9)
    {
      int v10 = *v9;
      if (v10)
      {
        if (v7.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v12 = v10[1];
            if (v12 == a2)
            {
              if (*((_DWORD *)v10 + 4) == a2) {
                return;
              }
            }
            else if ((v12 & (v6 - 1)) != v8)
            {
              goto LABEL_22;
            }
            int v10 = (uint64_t *)*v10;
            if (!v10) {
              goto LABEL_22;
            }
          }
        }
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == a2)
          {
            if (*((_DWORD *)v10 + 4) == a2) {
              return;
            }
          }
          else
          {
            if (v11 >= v6) {
              v11 %= v6;
            }
            if (v11 != v8) {
              break;
            }
          }
          int v10 = (uint64_t *)*v10;
        }
        while (v10);
      }
    }
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  }
LABEL_22:
  char v13 = operator new(0x18uLL);
  void *v13 = 0;
  v13[1] = v5;
  v13[2] = a3;
  float v14 = (float)(unint64_t)(*((void *)a1 + 3) + 1);
  float v15 = a1[8];
  if (v6 && (float)(v15 * (float)v6) >= v14)
  {
    unint64_t v5 = v8;
    dispatch_time_t v16 = *(void **)a1;
    dispatch_time_t v17 = *(void **)(*(void *)a1 + 8 * v8);
    if (!v17) {
      goto LABEL_84;
    }
LABEL_72:
    void *v13 = *v17;
LABEL_90:
    void *v17 = v13;
    goto LABEL_91;
  }
  BOOL v18 = 1;
  if (v6 >= 3) {
    BOOL v18 = (v6 & (v6 - 1)) != 0;
  }
  unint64_t v19 = v18 | (2 * v6);
  unint64_t v20 = vcvtps_u32_f32(v14 / v15);
  if (v19 <= v20) {
    size_t prime = v20;
  }
  else {
    size_t prime = v19;
  }
  if (prime == 1)
  {
    size_t prime = 2;
  }
  else if ((prime & (prime - 1)) != 0)
  {
    size_t prime = std::__next_prime(prime);
    unint64_t v6 = *((void *)a1 + 1);
  }
  if (prime > v6)
  {
LABEL_36:
    if (prime >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v22 = operator new(8 * prime);
    int v23 = *(void **)a1;
    *(void *)a1 = v22;
    if (v23) {
      operator delete(v23);
    }
    uint64_t v24 = 0;
    *((void *)a1 + 1) = prime;
    do
      *(void *)(*(void *)a1 + 8 * v24++) = 0;
    while (prime != v24);
    uint64_t v26 = (uint64_t *)(a1 + 4);
    uint64_t v25 = (void *)*((void *)a1 + 2);
    if (!v25) {
      goto LABEL_68;
    }
    size_t v27 = v25[1];
    size_t v28 = prime - 1;
    if ((prime & (prime - 1)) == 0)
    {
      size_t v29 = v27 & v28;
      *(void *)(*(void *)a1 + 8 * v29) = v26;
      for (uint64_t i = (void *)*v25; *v25; uint64_t i = (void *)*v25)
      {
        size_t v31 = i[1] & v28;
        if (v31 == v29)
        {
          uint64_t v25 = i;
        }
        else if (*(void *)(*(void *)a1 + 8 * v31))
        {
          *uint64_t v25 = *i;
          uint64_t v32 = 8 * v31;
          *uint64_t i = **(void **)(*(void *)a1 + v32);
          **(void **)(*(void *)a1 + v32) = i;
        }
        else
        {
          *(void *)(*(void *)a1 + 8 * v31) = v25;
          uint64_t v25 = i;
          size_t v29 = v31;
        }
      }
      goto LABEL_68;
    }
    if (v27 >= prime) {
      v27 %= prime;
    }
    *(void *)(*(void *)a1 + 8 * v27) = v26;
    int v36 = (void *)*v25;
    if (!*v25)
    {
LABEL_68:
      unint64_t v6 = prime;
      if ((prime & (prime - 1)) != 0) {
        goto LABEL_69;
      }
LABEL_83:
      unint64_t v5 = (v6 - 1) & v5;
      dispatch_time_t v16 = *(void **)a1;
      dispatch_time_t v17 = *(void **)(*(void *)a1 + 8 * v5);
      if (!v17) {
        goto LABEL_84;
      }
      goto LABEL_72;
    }
    while (1)
    {
      size_t v38 = v36[1];
      if (v38 >= prime) {
        v38 %= prime;
      }
      if (v38 == v27) {
        goto LABEL_62;
      }
      if (*(void *)(*(void *)a1 + 8 * v38))
      {
        *uint64_t v25 = *v36;
        uint64_t v37 = 8 * v38;
        void *v36 = **(void **)(*(void *)a1 + v37);
        **(void **)(*(void *)a1 + v37) = v36;
        int v36 = v25;
LABEL_62:
        uint64_t v25 = v36;
        int v36 = (void *)*v36;
        if (!v36) {
          goto LABEL_68;
        }
      }
      else
      {
        *(void *)(*(void *)a1 + 8 * v38) = v25;
        uint64_t v25 = v36;
        int v36 = (void *)*v36;
        size_t v27 = v38;
        if (!v36) {
          goto LABEL_68;
        }
      }
    }
  }
  if (prime < v6)
  {
    unint64_t v33 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
    if (v6 < 3 || (uint8x8_t v34 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
    {
      unint64_t v33 = std::__next_prime(v33);
    }
    else
    {
      uint64_t v35 = 1 << -(char)__clz(v33 - 1);
      if (v33 >= 2) {
        unint64_t v33 = v35;
      }
    }
    if (prime <= v33) {
      size_t prime = v33;
    }
    if (prime < v6)
    {
      if (!prime)
      {
        int v39 = *(void **)a1;
        *(void *)a1 = 0;
        if (v39) {
          operator delete(v39);
        }
        unint64_t v6 = 0;
        *((void *)a1 + 1) = 0;
        goto LABEL_83;
      }
      goto LABEL_36;
    }
    unint64_t v6 = *((void *)a1 + 1);
  }
  if ((v6 & (v6 - 1)) == 0) {
    goto LABEL_83;
  }
LABEL_69:
  if (v6 <= v5) {
    v5 %= v6;
  }
  dispatch_time_t v16 = *(void **)a1;
  dispatch_time_t v17 = *(void **)(*(void *)a1 + 8 * v5);
  if (v17) {
    goto LABEL_72;
  }
LABEL_84:
  void *v13 = *((void *)a1 + 2);
  *((void *)a1 + 2) = v13;
  v16[v5] = a1 + 4;
  if (*v13)
  {
    unint64_t v40 = *(void *)(*v13 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v40 >= v6) {
        v40 %= v6;
      }
    }
    else
    {
      v40 &= v6 - 1;
    }
    dispatch_time_t v17 = (void *)(*(void *)a1 + 8 * v40);
    goto LABEL_90;
  }
LABEL_91:
  ++*((void *)a1 + 3);
}

void sub_2637ECE08(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::shared_ptr<support::transport::PCIMemRegion>::shared_ptr[abi:ne180100]<support::transport::PCIMemRegion,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = &v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAF6E8;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a2;
  a1[1] = v4;
  if (!a2) {
    return a1;
  }
  unint64_t v6 = *(std::__shared_weak_count **)(a2 + 16);
  if (v6)
  {
    if (v6->__shared_owners_ == -1)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      *(void *)(a2 + 8) = a2;
      *(void *)(a2 + 16) = v4;
      std::__shared_weak_count::__release_weak(v6);
      if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_8;
      }
    }
    return a1;
  }
  atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  *(void *)(a2 + 8) = a2;
  *(void *)(a2 + 16) = v4;
  if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
LABEL_8:
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void sub_2637ECF34(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<support::transport::PCIMemRegion *,std::shared_ptr<support::transport::PCIMemRegion>::__shared_ptr_default_delete<support::transport::PCIMemRegion,support::transport::PCIMemRegion>,std::allocator<support::transport::PCIMemRegion>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<support::transport::PCIMemRegion *,std::shared_ptr<support::transport::PCIMemRegion>::__shared_ptr_default_delete<support::transport::PCIMemRegion,support::transport::PCIMemRegion>,std::allocator<support::transport::PCIMemRegion>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<support::transport::PCIMemRegion *,std::shared_ptr<support::transport::PCIMemRegion>::__shared_ptr_default_delete<support::transport::PCIMemRegion,support::transport::PCIMemRegion>,std::allocator<support::transport::PCIMemRegion>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000002638087DALL) {
    return a1 + 24;
  }
  if (((v3 & 0x80000002638087DALL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000002638087DALL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000002638087DALL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

uint64_t __cxx_global_var_init_2()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>::~PthreadMutexGuardPolicy, &ctu::Singleton<support::log::shared_stdio,support::log::shared_stdio,ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>>::sInstance, &dword_2637D5000);
  }
  return result;
}

void HSFilerRT::create_default_global(HSFilerRT *this@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  if (capabilities::radio::vendor(this) == 3)
  {
    uint64_t v3 = operator new(0x30uLL);
    v3[1] = 0;
    v3[2] = 0;
    void *v3 = &unk_270EAF780;
    v3[3] = &unk_270EAF738;
    v3[4] = 0;
    void v3[5] = 0;
    if (capabilities::radio::vendor((capabilities::radio *)v3) == 3)
    {
      _ZNSt3__115allocate_sharedB8ne180100I22HSFilerRT_Internal_INTNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(v4);
      *((_OWORD *)v3 + 2) = *(_OWORD *)v4;
    }
    *a2 = v3 + 3;
    a2[1] = v3;
  }
}

void sub_2637ED148(_Unwind_Exception *a1)
{
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](v3);
  std::__shared_weak_count::~__shared_weak_count(v2);
  operator delete(v5);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void sub_2637ED174(_Unwind_Exception *a1)
{
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void sub_2637ED188(_Unwind_Exception *a1)
{
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void HSFilerRT::HSFilerRT(HSFilerRT *this)
{
  *(void *)this = &unk_270EAF738;
  *((void *)this + 1) = 0;
  uint64_t v1 = (_OWORD *)((char *)this + 8);
  *((void *)this + 2) = 0;
  if (capabilities::radio::vendor(this) == 3)
  {
    _ZNSt3__115allocate_sharedB8ne180100I22HSFilerRT_Internal_INTNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(v2);
    _OWORD *v1 = *(_OWORD *)v2;
  }
}

{
  _OWORD *v1;
  uint64_t v2[3];

  *(void *)this = &unk_270EAF738;
  *((void *)this + 1) = 0;
  uint64_t v1 = (_OWORD *)((char *)this + 8);
  *((void *)this + 2) = 0;
  if (capabilities::radio::vendor(this) == 3)
  {
    _ZNSt3__115allocate_sharedB8ne180100I22HSFilerRT_Internal_INTNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(v2);
    _OWORD *v1 = *(_OWORD *)v2;
  }
}

void sub_2637ED210(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 16);
  if (v3)
  {
    if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_2637ED2DC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 16);
  if (v3)
  {
    if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  _Unwind_Resume(exception_object);
}

void HSFilerRT::basebandReadyEventHandler(HSFilerRT_Internal **this)
{
}

void HSFilerRT::basebandResetEventHandler(HSFilerRT_Internal **this)
{
}

void HSFilerRT::registerBasebandResetDelegate(uint64_t a1, void **a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  if (*a2) {
    uint64_t v3 = _Block_copy(v3);
  }
  aBlocuint64_t k = v3;
  HSFilerRT_Internal::registerBasebandResetDelegate(v2, (const void **)&aBlock);
  if (aBlock) {
    _Block_release(aBlock);
  }
}

void sub_2637ED39C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *aBlock)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  _Unwind_Resume(exception_object);
}

void HSFilerRT::dumpState(HSFilerRT *this)
{
  uint64_t v1 = *((void *)this + 1);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 0x40000000;
  v2[2] = ___ZN18HSFilerRT_Internal9dumpStateEv_block_invoke;
  uint64_t v2[3] = &__block_descriptor_tmp_67;
  v2[4] = v1;
  ctu::SharedSynchronizable<HSFilerRT_Internal>::execute_wrapped((uint64_t *)(v1 + 8), (uint64_t)v2);
}

uint64_t HSFilerRT::createSession(uint64_t a1, uint64_t *a2, int a3, unsigned int a4, NSObject **a5)
{
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = a2[1];
  uint64_t v14 = *a2;
  float v15 = (std::__shared_weak_count *)v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  std::chrono::system_clock::time_point v9 = *a5;
  dispatch_object_t object = v9;
  if (v9) {
    dispatch_retain(v9);
  }
  uint64_t v10 = HSFilerRT_Internal::createSession(v7, &v14, a3, a4, &object);
  if (object) {
    dispatch_release(object);
  }
  unint64_t v11 = v15;
  if (!v15 || atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return v10;
  }
  ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
  std::__shared_weak_count::__release_weak(v11);
  return v10;
}

void sub_2637ED518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object, char a11)
{
  if (object) {
    dispatch_release(object);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void HSFilerRT::destroySession(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 8);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  void v4[2] = ___ZN18HSFilerRT_Internal14destroySessionE15HSFilerClientIDy_block_invoke;
  uint64_t v4[3] = &__block_descriptor_tmp_4;
  int v5 = a2;
  v4[4] = v3;
  v4[5] = a3;
  ctu::SharedSynchronizable<HSFilerRT_Internal>::execute_wrapped((uint64_t *)(v3 + 8), (uint64_t)v4);
}

BOOL HSFilerRT::queueSession(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t *a4, void **a5, int a6)
{
  uint64_t v10 = *(void *)(a1 + 8);
  unint64_t v11 = *a5;
  if (*a5) {
    unint64_t v11 = _Block_copy(v11);
  }
  aBlocuint64_t k = v11;
  BOOL v12 = HSFilerRT_Internal::queueSession(v10, a2, a3, a4, (const void **)&aBlock, a6);
  if (aBlock) {
    _Block_release(aBlock);
  }
  return v12;
}

void sub_2637ED640(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *aBlock)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  _Unwind_Resume(exception_object);
}

BOOL HSFilerRT::removeSessionFromQueue(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return HSFilerRT_Internal::removeSessionFromQueue(*(void *)(a1 + 8), a2, a3);
}

BOOL HSFilerRT::readWithFile(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, void **a6)
{
  uint64_t v10 = *(void *)(a1 + 8);
  if (*(char *)(a5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v15, *(const std::string::value_type **)a5, *(void *)(a5 + 8));
    unint64_t v11 = *a6;
    if (!*a6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  std::string v15 = *(std::string *)a5;
  unint64_t v11 = *a6;
  if (*a6) {
LABEL_5:
  }
    unint64_t v11 = _Block_copy(v11);
LABEL_6:
  aBlocuint64_t k = v11;
  BOOL v12 = HSFilerRT_Internal::readWithFile(v10, a2, a3, a4, (uint64_t)&v15, (const void **)&aBlock);
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  return v12;
}

void sub_2637ED734(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *aBlock, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL HSFilerRT::readWithStream(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t *a5, void **a6)
{
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = (std::__shared_weak_count *)a5[1];
  uint64_t v16 = *a5;
  dispatch_time_t v17 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unint64_t v11 = *a6;
  if (*a6) {
    unint64_t v11 = _Block_copy(v11);
  }
  aBlocuint64_t k = v11;
  BOOL v12 = HSFilerRT_Internal::readWithStream(v9, a2, a3, a4, (uint64_t)&v16, (const void **)&aBlock);
  if (aBlock) {
    _Block_release(aBlock);
  }
  char v13 = v17;
  if (!v17 || atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return v12;
  }
  ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
  std::__shared_weak_count::__release_weak(v13);
  return v12;
}

void sub_2637ED85C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *aBlock, char a11)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

BOOL HSFilerRT::readWithBuff(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t *a5, void **a6)
{
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = a5[1];
  uint64_t v16 = *a5;
  dispatch_time_t v17 = (std::__shared_weak_count *)v10;
  if (v10) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v11 = *a6;
  if (*a6) {
    unint64_t v11 = _Block_copy(v11);
  }
  aBlocuint64_t k = v11;
  BOOL v12 = HSFilerRT_Internal::readWithBuff(v9, a2, a3, a4, &v16, (const void **)&aBlock);
  if (aBlock) {
    _Block_release(aBlock);
  }
  char v13 = v17;
  if (!v17 || atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return v12;
  }
  ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
  std::__shared_weak_count::__release_weak(v13);
  return v12;
}

void sub_2637ED97C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *aBlock, char a11)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

BOOL HSFilerRT::writeWithFile(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, void **a6)
{
  uint64_t v10 = *(void *)(a1 + 8);
  if (*(char *)(a5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v15, *(const std::string::value_type **)a5, *(void *)(a5 + 8));
    unint64_t v11 = *a6;
    if (!*a6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  std::string v15 = *(std::string *)a5;
  unint64_t v11 = *a6;
  if (*a6) {
LABEL_5:
  }
    unint64_t v11 = _Block_copy(v11);
LABEL_6:
  aBlocuint64_t k = v11;
  BOOL v12 = HSFilerRT_Internal::writeWithFile(v10, a2, a3, a4, (uint64_t)&v15, (const void **)&aBlock);
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  return v12;
}

void sub_2637EDA70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *aBlock, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL HSFilerRT::writeWithStream(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t *a5, void **a6)
{
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = (std::__shared_weak_count *)a5[1];
  uint64_t v16 = *a5;
  dispatch_time_t v17 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unint64_t v11 = *a6;
  if (*a6) {
    unint64_t v11 = _Block_copy(v11);
  }
  aBlocuint64_t k = v11;
  BOOL v12 = HSFilerRT_Internal::writeWithStream(v9, a2, a3, a4, &v16, (const void **)&aBlock);
  if (aBlock) {
    _Block_release(aBlock);
  }
  char v13 = v17;
  if (!v17 || atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return v12;
  }
  ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
  std::__shared_weak_count::__release_weak(v13);
  return v12;
}

void sub_2637EDB98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *aBlock, char a11)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

BOOL HSFilerRT::writeWithBuff(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t *a5, void **a6)
{
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = (std::__shared_weak_count *)a5[1];
  uint64_t v16 = *a5;
  dispatch_time_t v17 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unint64_t v11 = *a6;
  if (*a6) {
    unint64_t v11 = _Block_copy(v11);
  }
  aBlocuint64_t k = v11;
  BOOL v12 = HSFilerRT_Internal::writeWithBuff(v9, a2, a3, a4, &v16, (const void **)&aBlock);
  if (aBlock) {
    _Block_release(aBlock);
  }
  char v13 = v17;
  if (!v17 || atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return v12;
  }
  ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
  std::__shared_weak_count::__release_weak(v13);
  return v12;
}

void sub_2637EDCB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *aBlock, char a11)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void HSFilerRT::~HSFilerRT(HSFilerRT *this)
{
  *(void *)this = &unk_270EAF738;
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

void HSFilerRT::~HSFilerRT(std::__shared_weak_count **this)
{
  uint64_t v1 = (HSFilerRT *)this;
  *this = (std::__shared_weak_count *)&unk_270EAF738;
  uint64_t v2 = this[2];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    this = (std::__shared_weak_count **)v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  operator delete(this);
}

void std::__shared_ptr_emplace<HSFilerRT>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAF780;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<HSFilerRT>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAF780;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<HSFilerRT>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t __cxx_global_var_init_3()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>::~PthreadMutexGuardPolicy, &ctu::Singleton<support::log::shared_stdio,support::log::shared_stdio,ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>>::sInstance, &dword_2637D5000);
  }
  return result;
}

{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>::~PthreadMutexGuardPolicy, &ctu::Singleton<hsfiler_log_manager,hsfiler_log_manager,ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>>::sInstance, &dword_2637D5000);
  }
  return result;
}

void hsfiler_log_manager::hsfiler_log_manager(hsfiler_log_manager *this)
{
  *((unsigned char *)&__p.__r_.__value_.__s + 23) = 7;
  strcpy((char *)&__p, "hsfiler");
  unint64_t v6 = &unk_270EB02A8;
  char v7 = 3;
  uint64_t v2 = getprogname();
  if (!strncmp(v2, "bbutil", 6uLL))
  {
    uint64_t v3 = operator new(0x20uLL);
    _OWORD *v3 = 0u;
    v3[1] = 0u;
    *(void *)uint64_t v3 = &unk_270EB02F0;
  }
  else
  {
    uint64_t v3 = 0;
  }
  int v5 = v3;
  support::log::manager::manager((uint64_t)this, &__p, (uint64_t)&v6, (uint64_t *)&v5);
  uint64_t v4 = (uint64_t)v5;
  int v5 = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 16))(v4);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  *(void *)this = &unk_270EAF7D0;
}

void sub_2637EE030(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a9)
  {
    (*(void (**)(uint64_t))(*(void *)a9 + 16))(a9);
    if ((a17 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a17 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

void hsfiler_log_manager::set_defaults(hsfiler_log_manager *this)
{
  uint64_t v2 = (std::mutex *)((char *)this + 8);
  std::mutex::lock((std::mutex *)((char *)this + 8));
  *((unsigned char *)this + 112) = 3;
  uint64_t v3 = (char *)this + 120;
  if (*((void *)this + 17))
  {
    uint64_t v4 = *((void *)this + 15);
    int v5 = (char *)*((void *)this + 16);
    uint64_t v6 = *(void *)v5;
    *(void *)(v6 + 8) = *(void *)(v4 + 8);
    **(void **)(v4 + 8) = v6;
    *((void *)this + 17) = 0;
    if (v5 != v3)
    {
      do
      {
        uint64_t v9 = (char *)*((void *)v5 + 1);
        uint64_t v8 = *((void *)v5 + 2);
        *((void *)v5 + 2) = 0;
        if (v8) {
          (*(void (**)(uint64_t))(*(void *)v8 + 16))(v8);
        }
        operator delete(v5);
        int v5 = v9;
      }
      while (v9 != v3);
    }
  }
  std::mutex::unlock(v2);
  char v7 = getprogname();
  if (!strncmp(v7, "bbutil", 6uLL))
  {
    uint64_t v10 = operator new(0x20uLL);
    _OWORD *v10 = 0u;
    v10[1] = 0u;
    *(void *)uint64_t v10 = &unk_270EB02F0;
    std::mutex::lock(v2);
    unint64_t v11 = operator new(0x18uLL);
    v11[1] = v3;
    v11[2] = v10;
    uint64_t v12 = *((void *)this + 15);
    *unint64_t v11 = v12;
    *(void *)(v12 + 8) = v11;
    *((void *)this + 15) = v11;
    ++*((void *)this + 17);
    std::mutex::unlock(v2);
  }
}

void sub_2637EE204(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
  _Unwind_Resume(a1);
}

void hsfiler_log_client::hsfiler_log_client(hsfiler_log_client *this, const char *a2)
{
  std::string __p = operator new(0x30uLL);
  long long v17 = xmmword_263807900;
  strcpy((char *)__p, "com.apple.telephony.basebandservices.hsfiler");
  size_t v4 = strlen(a2);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  int v5 = (void *)v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = (void **)operator new(v7 + 1);
    __dst[1] = v5;
    unint64_t v15 = v8 | 0x8000000000000000;
    __dst[0] = v6;
    goto LABEL_8;
  }
  HIBYTE(v15) = v4;
  uint64_t v6 = __dst;
  if (v4) {
LABEL_8:
  }
    memcpy(v6, a2, (size_t)v5);
  *((unsigned char *)v5 + (void)v6) = 0;
  pthread_mutex_lock(&ctu::Singleton<hsfiler_log_manager,hsfiler_log_manager,ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>>::sInstance);
  if (qword_26A99F880) {
    goto LABEL_10;
  }
  uint64_t v9 = (std::__shared_weak_count *)operator new(0xA8uLL);
  v9->__shared_owners_ = 0;
  v9->__shared_weak_owners_ = 0;
  v9->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAF880;
  uint64_t v10 = (uint64_t)&v9[1];
  hsfiler_log_manager::hsfiler_log_manager((hsfiler_log_manager *)&v9[1]);
  unint64_t v11 = (std::__shared_weak_count *)off_26A99F888;
  qword_26A99F880 = (uint64_t)&v9[1];
  off_26A99F888 = v9;
  if (v11)
  {
    if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
LABEL_10:
    uint64_t v10 = qword_26A99F880;
    uint64_t v9 = (std::__shared_weak_count *)off_26A99F888;
    uint64_t v12 = (std::__shared_weak_count *)off_26A99F888;
    if (!off_26A99F888) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  uint64_t v12 = v9;
LABEL_16:
  atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_17:
  pthread_mutex_unlock(&ctu::Singleton<hsfiler_log_manager,hsfiler_log_manager,ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>>::sInstance);
  v13[0] = v10;
  v13[1] = (uint64_t)v12;
  support::log::client::client(this, (uint64_t)&__p, (uint64_t)__dst, v13);
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  if (SHIBYTE(v15) < 0)
  {
    operator delete(__dst[0]);
    if ((SHIBYTE(v17) & 0x80000000) == 0) {
      goto LABEL_22;
    }
LABEL_24:
    operator delete(__p);
    goto LABEL_22;
  }
  if (SHIBYTE(v17) < 0) {
    goto LABEL_24;
  }
LABEL_22:
  *(void *)this = &unk_270EAF800;
}

void sub_2637EE504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  std::__shared_weak_count::~__shared_weak_count(v24);
  operator delete(v26);
  pthread_mutex_unlock(&ctu::Singleton<hsfiler_log_manager,hsfiler_log_manager,ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>>::sInstance);
  if (a18 < 0)
  {
    operator delete(__p);
    if ((a24 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(a1);
  }
  else if ((a24 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a19);
  _Unwind_Resume(a1);
}

void hsfiler::logging::getLogServer(void *a1@<X8>)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN7hsfiler7loggingL14sLogServerInitERNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  block[3] = &__block_descriptor_tmp_2;
  void block[4] = &hsfiler::logging::getLogServer(void)::sLogServer;
  if (hsfiler::logging::sLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    uint64_t v3 = *(void *)algn_26A99FA28;
    *a1 = hsfiler::logging::getLogServer(void)::sLogServer;
    a1[1] = v3;
    if (!v3) {
      return;
    }
  }
  else
  {
    dispatch_once(&hsfiler::logging::sLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, block);
    uint64_t v3 = *(void *)algn_26A99FA28;
    *a1 = hsfiler::logging::getLogServer(void)::sLogServer;
    a1[1] = v3;
    if (!v3) {
      return;
    }
  }
  atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
}

void hsfiler_log_manager::~hsfiler_log_manager(hsfiler_log_manager *this)
{
  *(void *)this = &unk_270EB02C0;
  if (*((void *)this + 17))
  {
    uint64_t v2 = (char *)this + 120;
    uint64_t v3 = *((void *)this + 15);
    size_t v4 = (char *)*((void *)this + 16);
    uint64_t v5 = *(void *)v4;
    *(void *)(v5 + 8) = *(void *)(v3 + 8);
    **(void **)(v3 + 8) = v5;
    *((void *)this + 17) = 0;
    if (v4 != (char *)this + 120)
    {
      do
      {
        uint64_t v7 = (char *)*((void *)v4 + 1);
        uint64_t v6 = *((void *)v4 + 2);
        *((void *)v4 + 2) = 0;
        if (v6) {
          (*(void (**)(uint64_t))(*(void *)v6 + 16))(v6);
        }
        operator delete(v4);
        size_t v4 = v7;
      }
      while (v7 != v2);
    }
  }
  if (*((char *)this + 95) < 0) {
    operator delete(*((void **)this + 9));
  }
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
}

{
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t vars8;

  *(void *)this = &unk_270EB02C0;
  if (*((void *)this + 17))
  {
    uint64_t v2 = (char *)this + 120;
    uint64_t v3 = *((void *)this + 15);
    size_t v4 = (char *)*((void *)this + 16);
    uint64_t v5 = *(void *)v4;
    *(void *)(v5 + 8) = *(void *)(v3 + 8);
    **(void **)(v3 + 8) = v5;
    *((void *)this + 17) = 0;
    if (v4 != (char *)this + 120)
    {
      do
      {
        uint64_t v7 = (char *)*((void *)v4 + 1);
        uint64_t v6 = *((void *)v4 + 2);
        *((void *)v4 + 2) = 0;
        if (v6) {
          (*(void (**)(uint64_t))(*(void *)v6 + 16))(v6);
        }
        operator delete(v4);
        size_t v4 = v7;
      }
      while (v7 != v2);
    }
  }
  if (*((char *)this + 95) < 0) {
    operator delete(*((void **)this + 9));
  }
  std::mutex::~mutex((std::mutex *)((char *)this + 8));

  operator delete(this);
}

BOOL support::log::manager::should_log(uint64_t a1, unsigned int a2, os_log_t oslog)
{
  return *(unsigned __int8 *)(a1 + 112) >= a2 || os_log_type_enabled(oslog, support::log::sOSLogLevel[a2]);
}

void hsfiler_log_client::~hsfiler_log_client(std::__shared_weak_count **this)
{
  uint64_t v1 = (hsfiler_log_client *)this;
  *this = (std::__shared_weak_count *)&unk_270EAECE0;
  uint64_t v2 = this[8];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    this = (std::__shared_weak_count **)v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  operator delete(this);
}

uint64_t ___ZN7hsfiler7loggingL14sLogServerInitERNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke(uint64_t a1)
{
  char v7 = 7;
  strcpy((char *)__p, "hsfiler");
  ctu::LogServer::create();
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = v8;
  long long v8 = 0uLL;
  size_t v4 = *(std::__shared_weak_count **)(v2 + 8);
  *(_OWORD *)uint64_t v2 = v3;
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  if (*((void *)&v8 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v8 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(**((void **)&v8 + 1) + 16))(*((void *)&v8 + 1));
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v8 + 1));
    if ((v7 & 0x80000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v7 < 0) {
LABEL_7:
  }
    operator delete(__p[0]);
LABEL_8:
  ctu::LogServer::start(**(ctu::LogServer ***)(a1 + 32));
  return ctu::LogServer::setEnabled(**(ctu::LogServer ***)(a1 + 32));
}

void sub_2637EEA30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_emplace<hsfiler_log_manager>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAF880;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<hsfiler_log_manager>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAF880;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<hsfiler_log_manager>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>::~PthreadMutexGuardPolicy(uint64_t a1)
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

uint64_t __cxx_global_var_init_4()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>::~PthreadMutexGuardPolicy, &ctu::Singleton<support::log::shared_stdio,support::log::shared_stdio,ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>>::sInstance, &dword_2637D5000);
  }
  return result;
}

_DWORD *BasebandTransport::getSupportedProtocols@<X0>(BasebandTransport *this@<X0>, void *a2@<X8>)
{
  *a2 = a2;
  a2[1] = a2;
  a2[2] = 0;
  uint64_t result = (_DWORD *)capabilities::radio::vendor(this);
  if (result == 1)
  {
    char v13 = operator new(0x18uLL);
    v13[4] = 0;
    *(void *)char v13 = &v33;
    *((void *)v13 + 1) = &v33;
    uint8x8_t v34 = v13;
    uint64_t v14 = operator new(0x18uLL);
    v14[4] = 1;
    *(void *)uint64_t v14 = v13;
    *((void *)v14 + 1) = &v33;
    *((void *)v13 + 1) = v14;
    unint64_t v15 = operator new(0x18uLL);
    v15[4] = 2;
    *(void *)unint64_t v15 = v14;
    *((void *)v15 + 1) = &v33;
    *((void *)v14 + 1) = v15;
    uint64_t v16 = operator new(0x18uLL);
    v16[4] = 3;
    *(void *)uint64_t v16 = v15;
    *((void *)v16 + 1) = &v33;
    *((void *)v15 + 1) = v16;
    long long v17 = operator new(0x18uLL);
    v17[4] = 4;
    *(void *)long long v17 = v16;
    *((void *)v17 + 1) = &v33;
    *((void *)v16 + 1) = v17;
    BOOL v18 = operator new(0x18uLL);
    v18[4] = 5;
    *(void *)BOOL v18 = v17;
    *((void *)v18 + 1) = &v33;
    *((void *)v17 + 1) = v18;
    unint64_t v19 = operator new(0x18uLL);
    v19[4] = 10;
    *(void *)unint64_t v19 = v18;
    *((void *)v19 + 1) = &v33;
    *((void *)v18 + 1) = v19;
    unint64_t v20 = operator new(0x18uLL);
    v20[4] = 12;
    *(void *)unint64_t v20 = v19;
    *((void *)v20 + 1) = &v33;
    *((void *)v19 + 1) = v20;
    int v21 = operator new(0x18uLL);
    v21[4] = 14;
    *(void *)int v21 = v20;
    *((void *)v21 + 1) = &v33;
    *((void *)v20 + 1) = v21;
    unint64_t v33 = v21;
    uint64_t v35 = 9;
    uint64_t result = (_DWORD *)capabilities::radio::mav20Plus((capabilities::radio *)v21);
    if (result)
    {
      uint64_t v22 = operator new(0x18uLL);
      v22[4] = 11;
      int v23 = v33;
      *(void *)uint64_t v22 = v33;
      *((void *)v22 + 1) = &v33;
      v23[1] = v22;
      uint64_t v24 = v35;
      unint64_t v33 = v22;
      ++v35;
      uint64_t result = operator new(0x18uLL);
      result[4] = 15;
      *(void *)uint64_t result = v22;
      *((void *)result + 1) = &v33;
      *((void *)v22 + 1) = result;
      unint64_t v33 = result;
      uint64_t v35 = v24 + 2;
    }
    if (a2[2])
    {
      uint64_t v25 = *a2;
      uint64_t result = (_DWORD *)a2[1];
      uint64_t v26 = *(void *)result;
      *(void *)(v26 + 8) = *(void *)(*a2 + 8);
      **(void **)(v25 + 8) = v26;
      a2[2] = 0;
      if (result != (_DWORD *)a2)
      {
        do
        {
          size_t v27 = (void *)*((void *)result + 1);
          operator delete(result);
          uint64_t result = v27;
        }
        while (v27 != a2);
      }
    }
  }
  else
  {
    if (result != 2) {
      return result;
    }
    size_t v4 = operator new(0x18uLL);
    v4[4] = 6;
    *(void *)size_t v4 = &v33;
    *((void *)v4 + 1) = &v33;
    uint8x8_t v34 = v4;
    uint64_t v5 = operator new(0x18uLL);
    v5[4] = 7;
    *(void *)uint64_t v5 = v4;
    *((void *)v5 + 1) = &v33;
    *((void *)v4 + 1) = v5;
    uint64_t v6 = operator new(0x18uLL);
    v6[4] = 8;
    *(void *)uint64_t v6 = v5;
    *((void *)v6 + 1) = &v33;
    *((void *)v5 + 1) = v6;
    char v7 = operator new(0x18uLL);
    v7[4] = 9;
    *(void *)char v7 = v6;
    *((void *)v7 + 1) = &v33;
    *((void *)v6 + 1) = v7;
    long long v8 = operator new(0x18uLL);
    v8[4] = 10;
    *(void *)long long v8 = v7;
    *((void *)v8 + 1) = &v33;
    *((void *)v7 + 1) = v8;
    unint64_t v33 = v8;
    uint64_t v35 = 5;
    uint64_t result = (_DWORD *)capabilities::abs::supportsETSProtocol((capabilities::abs *)v8);
    if (result)
    {
      uint64_t result = operator new(0x18uLL);
      result[4] = 13;
      uint64_t v9 = v33;
      *(void *)uint64_t result = v33;
      *((void *)result + 1) = &v33;
      v9[1] = result;
      unint64_t v33 = result;
      ++v35;
    }
    if (a2[2])
    {
      uint64_t v10 = *a2;
      uint64_t result = (_DWORD *)a2[1];
      uint64_t v11 = *(void *)result;
      *(void *)(v11 + 8) = *(void *)(*a2 + 8);
      **(void **)(v10 + 8) = v11;
      a2[2] = 0;
      if (result != (_DWORD *)a2)
      {
        do
        {
          uint64_t v12 = (void *)*((void *)result + 1);
          operator delete(result);
          uint64_t result = v12;
        }
        while (v12 != a2);
      }
    }
  }
  uint64_t v28 = v35;
  if (v35)
  {
    int v30 = v33;
    size_t v29 = v34;
    uint64_t v31 = *v34;
    *(void *)(v31 + 8) = v33[1];
    *(void *)v30[1] = v31;
    uint64_t v32 = *a2;
    *(void *)(v32 + 8) = v29;
    *size_t v29 = v32;
    *a2 = v30;
    v30[1] = a2;
    a2[2] += v28;
  }
  return result;
}

void sub_2637EEF98(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::list<BasebandTransport::Protocol>::~list((uint64_t *)va);
  std::list<BasebandTransport::Protocol>::~list(v2);
  _Unwind_Resume(a1);
}

void sub_2637EEFC8(_Unwind_Exception *a1)
{
  std::list<BasebandTransport::Protocol>::~list(v1);
  _Unwind_Resume(a1);
}

void sub_2637EEFE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  do
  {
    uint64_t v16 = (void *)v13[1];
    operator delete(v13);
    char v13 = v16;
  }
  while (v16 != v14);
  std::list<BasebandTransport::Protocol>::~list(v12);
  _Unwind_Resume(a1);
}

uint64_t *std::list<BasebandTransport::Protocol>::~list(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v3 = *a1;
    uint64_t v2 = (uint64_t *)a1[1];
    uint64_t v4 = *v2;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v3 + 8) = v4;
    a1[2] = 0;
    if (v2 != a1)
    {
      do
      {
        uint64_t v5 = (uint64_t *)v2[1];
        operator delete(v2);
        uint64_t v2 = v5;
      }
      while (v5 != a1);
    }
  }
  return a1;
}

void BasebandTransport::getSupportedProtocolsAsStringLowerCase(BasebandTransport *this@<X0>, uint64_t *a2@<X8>)
{
  *a2 = (uint64_t)a2;
  a2[1] = (uint64_t)a2;
  a2[2] = 0;
  memset(v20, 170, sizeof(v20));
  BasebandTransport::getSupportedProtocols(this, v20);
  for (uint64_t i = v20[1]; (void *)i != v20; uint64_t i = *(void *)(i + 8))
  {
    int v4 = *(_DWORD *)(i + 16);
    memset(v19, 170, sizeof(v19));
    switch(v4)
    {
      case 0:
        char v5 = 0;
        char v6 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 3;
        __darwin_ct_rune_t v9 = 4997712;
        goto LABEL_30;
      case 1:
        char v5 = 0;
        char v6 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 3;
        __darwin_ct_rune_t v9 = 4997715;
        goto LABEL_30;
      case 2:
        char v5 = 0;
        char v10 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 4;
        __darwin_ct_rune_t v11 = 1195460932;
        goto LABEL_26;
      case 3:
        char v5 = 0;
        char v10 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 4;
        __darwin_ct_rune_t v11 = 1397114194;
        goto LABEL_26;
      case 4:
        char v5 = 0;
        char v10 = 0;
        char v6 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 5;
        strcpy((char *)v19, "QMUX1");
        char v7 = 1;
        break;
      case 5:
        char v5 = 0;
        char v10 = 0;
        char v6 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 5;
        strcpy((char *)v19, "QMUX2");
        char v7 = 1;
        break;
      case 6:
        char v5 = 0;
        char v6 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 3;
        __darwin_ct_rune_t v9 = 5066578;
        goto LABEL_30;
      case 7:
        char v5 = 0;
        char v10 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 4;
        __darwin_ct_rune_t v11 = 1414483778;
        goto LABEL_26;
      case 8:
        char v5 = 0;
        char v6 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 3;
        __darwin_ct_rune_t v9 = 4805185;
        goto LABEL_30;
      case 9:
        char v5 = 0;
        char v6 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 3;
        __darwin_ct_rune_t v9 = 5526611;
        goto LABEL_30;
      case 10:
        char v10 = 0;
        char v6 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 2;
        strcpy((char *)v19, "AT");
        char v5 = 1;
        break;
      case 11:
        char v5 = 0;
        char v10 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 4;
        __darwin_ct_rune_t v11 = 1280328769;
        goto LABEL_26;
      case 12:
        char v5 = 0;
        char v10 = 0;
        char v6 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 8;
        strcpy((char *)v19, "MEDIACTL");
        break;
      case 13:
        char v5 = 0;
        char v6 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 3;
        __darwin_ct_rune_t v9 = 5461061;
        goto LABEL_30;
      case 14:
        char v5 = 0;
        char v10 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 4;
        strcpy((char *)v19, "GNSS");
        char v6 = 1;
        break;
      case 15:
        char v5 = 0;
        char v10 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 4;
        __darwin_ct_rune_t v11 = 1397965905;
        goto LABEL_26;
      case 16:
        char v5 = 0;
        char v10 = 0;
        char v6 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 5;
        strcpy((char *)v19, "RCTTH");
        char v7 = 1;
        break;
      case 17:
        char v5 = 0;
        char v6 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 3;
        __darwin_ct_rune_t v9 = 5260097;
        goto LABEL_30;
      case 18:
        char v5 = 0;
        char v10 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 4;
        __darwin_ct_rune_t v11 = 1297040214;
        goto LABEL_26;
      case 19:
        char v5 = 0;
        char v10 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 4;
        __darwin_ct_rune_t v11 = 1129335117;
LABEL_26:
        v19[0] = v11;
        char v6 = 1;
        LOBYTE(v19[1]) = 0;
        break;
      case 20:
        char v5 = 0;
        char v6 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 3;
        __darwin_ct_rune_t v9 = 4999236;
        goto LABEL_30;
      case 21:
        char v5 = 0;
        char v6 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 3;
        __darwin_ct_rune_t v9 = 5789005;
        goto LABEL_30;
      case 22:
        char v5 = 0;
        char v6 = 0;
        char v7 = 0;
        char v8 = 0;
        HIBYTE(v19[5]) = 3;
        __darwin_ct_rune_t v9 = 4407622;
LABEL_30:
        v19[0] = v9;
        char v10 = 1;
        break;
      default:
        char v5 = 0;
        char v10 = 0;
        char v6 = 0;
        char v7 = 0;
        HIBYTE(v19[5]) = 7;
        strcpy((char *)v19, "Unknown");
        char v8 = 1;
        break;
    }
    LOBYTE(v19[0]) = __tolower(SLOBYTE(v19[0]));
    BYTE1(v19[0]) = __tolower(SBYTE1(v19[0]));
    if ((v5 & 1) == 0)
    {
      BYTE2(v19[0]) = __tolower(SBYTE2(v19[0]));
      if ((v10 & 1) == 0)
      {
        HIBYTE(v19[0]) = __tolower(SHIBYTE(v19[0]));
        if ((v6 & 1) == 0)
        {
          LOBYTE(v19[1]) = __tolower(SLOBYTE(v19[1]));
          if ((v7 & 1) == 0)
          {
            BYTE1(v19[1]) = __tolower(SBYTE1(v19[1]));
            BYTE2(v19[1]) = __tolower(SBYTE2(v19[1]));
            if ((v8 & 1) == 0) {
              HIBYTE(v19[1]) = __tolower(SHIBYTE(v19[1]));
            }
          }
        }
      }
    }
    uint64_t v12 = operator new(0x28uLL);
    char v13 = (std::string *)(v12 + 2);
    *uint64_t v12 = 0;
    v12[1] = 0;
    if (SHIBYTE(v19[5]) < 0)
    {
      std::string::__init_copy_ctor_external(v13, *(const std::string::value_type **)v19, *(std::string::size_type *)&v19[2]);
    }
    else
    {
      *(_OWORD *)&v13->__r_.__value_.__l.__data_ = *(_OWORD *)v19;
      v12[4] = *(void *)&v19[4];
    }
    uint64_t v14 = *a2;
    *uint64_t v12 = *a2;
    v12[1] = a2;
    *(void *)(v14 + 8) = v12;
    *a2 = (uint64_t)v12;
    ++a2[2];
    if (SHIBYTE(v19[5]) < 0) {
      operator delete(*(void **)v19);
    }
  }
  if (v20[2])
  {
    uint64_t v16 = v20[0];
    unint64_t v15 = (void *)v20[1];
    uint64_t v17 = *(void *)v20[1];
    *(void *)(v17 + 8) = *(void *)(v20[0] + 8);
    **(void **)(v16 + 8) = v17;
    v20[2] = 0;
    if (v15 != v20)
    {
      do
      {
        BOOL v18 = (void *)v15[1];
        operator delete(v15);
        unint64_t v15 = v18;
      }
      while (v18 != v20);
    }
  }
}

void sub_2637EF640(_Unwind_Exception *a1)
{
  std::list<std::string>::~list(v1);
  _Unwind_Resume(a1);
}

void sub_2637EF654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15)
{
  uint64_t v17 = v16;
  operator delete(v17);
  if (a14 < 0) {
    operator delete(__p);
  }
  std::list<BasebandTransport::Protocol>::~list(&a15);
  std::list<std::string>::~list(v15);
  _Unwind_Resume(a1);
}

uint64_t BasebandTransport::asStringLowerCase@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  memset(a2, 170, 24);
  uint64_t result = BasebandTransport::asString(a1, (char *)a2);
  uint64_t v4 = *((unsigned __int8 *)a2 + 23);
  int v5 = (char)v4;
  char v6 = (char *)a2 + v4;
  if (v5 >= 0) {
    char v7 = v6;
  }
  else {
    char v7 = (unsigned char *)(*a2 + a2[1]);
  }
  if (v5 >= 0) {
    char v8 = a2;
  }
  else {
    char v8 = (unsigned char *)*a2;
  }
  for (; v8 != v7; ++v8)
  {
    uint64_t result = __tolower((char)*v8);
    *char v8 = result;
  }
  return result;
}

void sub_2637EF76C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

char *std::list<std::string>::~list(char *a1)
{
  if (*((void *)a1 + 2))
  {
    uint64_t v2 = *(void *)a1;
    uint64_t v3 = (char *)*((void *)a1 + 1);
    uint64_t v4 = *(void *)v3;
    *(void *)(v4 + 8) = *(void *)(*(void *)a1 + 8);
    **(void **)(v2 + 8) = v4;
    *((void *)a1 + 2) = 0;
    if (v3 != a1)
    {
      do
      {
        char v6 = (char *)*((void *)v3 + 1);
        if (v3[39] < 0) {
          operator delete(*((void **)v3 + 2));
        }
        operator delete(v3);
        uint64_t v3 = v6;
      }
      while (v6 != a1);
    }
  }
  return a1;
}

void BasebandTransport::getSupportedProtocolsAsString(BasebandTransport *this@<X0>, void *a2@<X8>)
{
  *a2 = a2;
  a2[1] = a2;
  a2[2] = 0;
  memset(v18, 170, sizeof(v18));
  BasebandTransport::getSupportedProtocols(this, v18);
  uint64_t v3 = (uint64_t *)v18[1];
  if ((void *)v18[1] != v18)
  {
    unint64_t v4 = a2[2];
    unint64_t v5 = v4 + 1;
    char v6 = (void *)*a2;
    uint64_t v7 = v18[1];
    do
    {
      char v8 = 8;
      unint64_t v9 = 0x4C5443414944454DLL;
      switch(*(_DWORD *)(v7 + 16))
      {
        case 0:
          unint64_t v9 = v4 & 0xFFFFFFFF00000000 | 0x4C4250;
          char v8 = 3;
          break;
        case 1:
          unint64_t v9 = (v4 & 0xFFFFFFFF00000000 | 0x4C4250) + 3;
          char v8 = 3;
          break;
        case 2:
          uint64_t v10 = 1195460932;
          goto LABEL_25;
        case 3:
          uint64_t v10 = 1397114194;
          goto LABEL_25;
        case 4:
          uint64_t v11 = 0x3158554D51;
          goto LABEL_21;
        case 5:
          uint64_t v11 = 0x3258554D51;
          goto LABEL_21;
        case 6:
          unsigned int v12 = 5066578;
          goto LABEL_29;
        case 7:
          uint64_t v10 = 1414483778;
          goto LABEL_25;
        case 8:
          unsigned int v12 = 4805185;
          goto LABEL_29;
        case 9:
          unsigned int v12 = 5526611;
          goto LABEL_29;
        case 0xA:
          unint64_t v13 = v4 & 0xFFFFFFFFFF000000 | 0x5441;
          char v8 = 2;
          goto LABEL_30;
        case 0xB:
          uint64_t v10 = 1280328769;
          goto LABEL_25;
        case 0xC:
          break;
        case 0xD:
          unsigned int v12 = 5461061;
          goto LABEL_29;
        case 0xE:
          unint64_t v9 = (v4 & 0xFFFFFF0000000000 | 0x53534451) + 2550;
          char v8 = 4;
          break;
        case 0xF:
          unint64_t v9 = v4 & 0xFFFFFF0000000000 | 0x53534451;
          char v8 = 4;
          break;
        case 0x10:
          uint64_t v11 = 0x4854544352;
LABEL_21:
          unint64_t v13 = v4 & 0xFFFF000000000000 | v11 & 0xFFFFFFFFFFFFLL;
          char v8 = 5;
          goto LABEL_30;
        case 0x11:
          unsigned int v12 = 5260097;
          goto LABEL_29;
        case 0x12:
          uint64_t v10 = 1297040214;
          goto LABEL_25;
        case 0x13:
          uint64_t v10 = 1129335117;
LABEL_25:
          unint64_t v13 = v4 & 0xFFFFFF0000000000 | v10 & 0xFFFFFFFFFFLL;
          char v8 = 4;
          goto LABEL_30;
        case 0x14:
          unint64_t v9 = (v4 & 0xFFFFFFFF00000000 | 0x4C4250) + 1524;
          char v8 = 3;
          break;
        case 0x15:
          unsigned int v12 = 5789005;
          goto LABEL_29;
        case 0x16:
          unsigned int v12 = 4407622;
LABEL_29:
          unint64_t v13 = v4 & 0xFFFFFFFF00000000 | v12;
          char v8 = 3;
LABEL_30:
          unint64_t v9 = v13;
          break;
        default:
          char v8 = 7;
          unint64_t v9 = 0x6E776F6E6B6E55;
          break;
      }
      uint64_t v14 = operator new(0x28uLL);
      v14[2] = v9;
      v14[3] = 0;
      *((unsigned char *)v14 + 39) = v8;
      void *v14 = v6;
      v14[1] = a2;
      v6[1] = v14;
      *a2 = v14;
      a2[2] = v5;
      uint64_t v7 = *(void *)(v7 + 8);
      ++v5;
      unint64_t v4 = v9;
      char v6 = v14;
    }
    while ((void *)v7 != v18);
  }
  if (v18[2])
  {
    uint64_t v15 = v18[0];
    uint64_t v16 = *v3;
    *(void *)(v16 + 8) = *(void *)(v18[0] + 8);
    **(void **)(v15 + 8) = v16;
    v18[2] = 0;
    if (v3 != v18)
    {
      do
      {
        uint64_t v17 = (uint64_t *)v3[1];
        operator delete(v3);
        uint64_t v3 = v17;
      }
      while (v17 != v18);
    }
  }
}

void sub_2637EFACC(_Unwind_Exception *a1)
{
  std::list<std::string>::~list(v1);
  _Unwind_Resume(a1);
}

void sub_2637EFAE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::list<BasebandTransport::Protocol>::~list((uint64_t *)va);
  std::list<std::string>::~list(v2);
  _Unwind_Resume(a1);
}

uint64_t BasebandTransport::asString@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  switch((int)result)
  {
    case 0:
      a2[23] = 3;
      *(_DWORD *)a2 = 4997712;
      break;
    case 1:
      a2[23] = 3;
      *(_DWORD *)a2 = 4997715;
      break;
    case 2:
      a2[23] = 4;
      strcpy(a2, "DIAG");
      break;
    case 3:
      a2[23] = 4;
      strcpy(a2, "REFS");
      break;
    case 4:
      a2[23] = 5;
      strcpy(a2, "QMUX1");
      break;
    case 5:
      a2[23] = 5;
      strcpy(a2, "QMUX2");
      break;
    case 6:
      a2[23] = 3;
      *(_DWORD *)a2 = 5066578;
      break;
    case 7:
      a2[23] = 4;
      strcpy(a2, "BOOT");
      break;
    case 8:
      a2[23] = 3;
      *(_DWORD *)a2 = 4805185;
      break;
    case 9:
      a2[23] = 3;
      *(_DWORD *)a2 = 5526611;
      break;
    case 10:
      a2[23] = 2;
      strcpy(a2, "AT");
      break;
    case 11:
      a2[23] = 4;
      strcpy(a2, "ADPL");
      break;
    case 12:
      a2[23] = 8;
      strcpy(a2, "MEDIACTL");
      break;
    case 13:
      a2[23] = 3;
      *(_DWORD *)a2 = 5461061;
      break;
    case 14:
      a2[23] = 4;
      strcpy(a2, "GNSS");
      break;
    case 15:
      a2[23] = 4;
      strcpy(a2, "QDSS");
      break;
    case 16:
      a2[23] = 5;
      strcpy(a2, "RCTTH");
      break;
    case 17:
      a2[23] = 3;
      *(_DWORD *)a2 = 5260097;
      break;
    case 18:
      a2[23] = 4;
      strcpy(a2, "VCOM");
      break;
    case 19:
      a2[23] = 4;
      strcpy(a2, "MIPC");
      break;
    case 20:
      a2[23] = 3;
      *(_DWORD *)a2 = 4999236;
      break;
    case 21:
      a2[23] = 3;
      *(_DWORD *)a2 = 5789005;
      break;
    case 22:
      a2[23] = 3;
      *(_DWORD *)a2 = 4407622;
      break;
    default:
      a2[23] = 7;
      strcpy(a2, "Unknown");
      break;
  }
  return result;
}

{
  switch((int)result)
  {
    case 0:
      a2[23] = 8;
      strcpy(a2, "NotReady");
      break;
    case 1:
      a2[23] = 5;
      strcpy(a2, "Ready");
      break;
    case 2:
      a2[23] = 5;
      strcpy(a2, "Error");
      break;
    case 3:
      a2[23] = 7;
      strcpy(a2, "Stalled");
      break;
    default:
      a2[23] = 7;
      strcpy(a2, "Unknown");
      break;
  }
  return result;
}

uint64_t BasebandTransport::asProtocol(char *__s1)
{
  uint64_t v1 = __s1;
  if ((__s1[23] & 0x80000000) == 0)
  {
    uint64_t result = strcmp(__s1, "PBL");
    if (!result) {
      return result;
    }
    if (!strcmp(v1, "SBL")) {
      return 1;
    }
    if (strcasecmp(v1, "DIAG"))
    {
      if (strcasecmp(v1, "REFS"))
      {
        if (strcasecmp(v1, "QMUX1"))
        {
          if (strcasecmp(v1, "QMUX2"))
          {
            if (strcasecmp(v1, "ROM"))
            {
              if (strcasecmp(v1, "BOOT"))
              {
                if (strcasecmp(v1, "ARI"))
                {
                  if (strcasecmp(v1, "STT"))
                  {
                    if (strcasecmp(v1, "AT"))
                    {
                      if (strcasecmp(v1, "ADPL"))
                      {
                        if (strcasecmp(v1, "MEDIACTL"))
                        {
                          if (strcasecmp(v1, "ETS"))
                          {
                            if (strcasecmp(v1, "GNSS"))
                            {
                              if (strcasecmp(v1, "QDSS"))
                              {
                                if (strcasecmp(v1, "RCTTH"))
                                {
                                  if (strcasecmp(v1, "ACP"))
                                  {
                                    if (strcasecmp(v1, "VCOM"))
                                    {
                                      if (strcasecmp(v1, "MIPC"))
                                      {
                                        if (strcasecmp(v1, "DHL"))
                                        {
                                          if (strcasecmp(v1, "MUX")) {
                                            goto LABEL_24;
                                          }
                                          return 21;
                                        }
                                        return 20;
                                      }
                                      return 19;
                                    }
                                    return 18;
                                  }
                                  return 17;
                                }
                                return 16;
                              }
                              return 15;
                            }
                            return 14;
                          }
                          return 13;
                        }
                        return 12;
                      }
                      return 11;
                    }
                    return 10;
                  }
                  return 9;
                }
                return 8;
              }
              return 7;
            }
            return 6;
          }
          return 5;
        }
        return 4;
      }
      return 3;
    }
    return 2;
  }
  uint64_t v1 = *(const char **)__s1;
  uint64_t result = strcmp(*(const char **)__s1, "PBL");
  if (!result) {
    return result;
  }
  if (!strcmp(v1, "SBL")) {
    return 1;
  }
  if (!strcasecmp(v1, "DIAG")) {
    return 2;
  }
  if (!strcasecmp(v1, "REFS")) {
    return 3;
  }
  if (!strcasecmp(v1, "QMUX1")) {
    return 4;
  }
  if (!strcasecmp(v1, "QMUX2")) {
    return 5;
  }
  if (!strcasecmp(v1, "ROM")) {
    return 6;
  }
  if (!strcasecmp(v1, "BOOT")) {
    return 7;
  }
  if (!strcasecmp(v1, "ARI")) {
    return 8;
  }
  if (!strcasecmp(v1, "STT")) {
    return 9;
  }
  if (!strcasecmp(v1, "AT")) {
    return 10;
  }
  if (!strcasecmp(v1, "ADPL")) {
    return 11;
  }
  if (!strcasecmp(v1, "MEDIACTL")) {
    return 12;
  }
  if (!strcasecmp(v1, "ETS")) {
    return 13;
  }
  if (!strcasecmp(v1, "GNSS")) {
    return 14;
  }
  if (!strcasecmp(v1, "QDSS")) {
    return 15;
  }
  if (!strcasecmp(v1, "RCTTH")) {
    return 16;
  }
  if (!strcasecmp(v1, "ACP")) {
    return 17;
  }
  if (!strcasecmp(v1, "VCOM")) {
    return 18;
  }
  if (!strcasecmp(v1, "MIPC")) {
    return 19;
  }
  if (!strcasecmp(v1, "DHL")) {
    return 20;
  }
  if (!strcasecmp(v1, "MUX")) {
    return 21;
  }
LABEL_24:
  if (!strcasecmp(v1, "FAC")) {
    return 22;
  }
  else {
    return 23;
  }
}

uint64_t BasebandTransport::getDefaultTransportIOReadSize(capabilities::abs *a1)
{
  if (capabilities::abs::shouldUseMinBasebandTransportIOReadSize(a1)) {
    return 0x4000;
  }
  else {
    return 0x8000;
  }
}

uint64_t BasebandTransport::getDefaultTransportIOReadCount(capabilities::abs *a1)
{
  int v1 = (int)a1;
  char shouldUseMinBasebandTransportIOReadCount = capabilities::abs::shouldUseMinBasebandTransportIOReadCount(a1);
  if (v1 == 15) {
    int v3 = 36;
  }
  else {
    int v3 = 4;
  }
  if (v1 == 16) {
    int v4 = 36;
  }
  else {
    int v4 = v3;
  }
  if (v1 == 2) {
    unsigned int v5 = 16;
  }
  else {
    unsigned int v5 = v4;
  }
  if (shouldUseMinBasebandTransportIOReadCount) {
    return 4;
  }
  else {
    return v5;
  }
}

double BasebandTransport::Status::Status(BasebandTransport::Status *this)
{
  *(_DWORD *)this = 0;
  *((unsigned char *)this + 4) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

{
  double result;

  *(_DWORD *)this = 0;
  *((unsigned char *)this + 4) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

double BasebandTransport::Status::init(BasebandTransport::Status *this)
{
  *(_DWORD *)this = 0;
  *((unsigned char *)this + 4) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

uint64_t BasebandTransport::Status::toString@<X0>(BasebandTransport::Status *this@<X0>, unsigned char *a2@<X8>)
{
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v31[7] = v4;
  v31[8] = v4;
  v31[5] = v4;
  v31[6] = v4;
  v31[3] = v4;
  v31[4] = v4;
  v31[1] = v4;
  void v31[2] = v4;
  long long v30 = v4;
  v31[0] = v4;
  *(_OWORD *)uint64_t v28 = v4;
  long long v29 = v4;
  long long v26 = v4;
  long long v27 = v4;
  long long v24 = v4;
  long long v25 = v4;
  long long v23 = v4;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v23);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v24, (uint64_t)"State: ", 7);
  switch(*(_DWORD *)this)
  {
    case 0:
      uint64_t v5 = 8;
      char v22 = 8;
      strcpy((char *)__p, "NotReady");
      break;
    case 1:
      uint64_t v5 = 5;
      char v22 = 5;
      strcpy((char *)__p, "Ready");
      break;
    case 2:
      uint64_t v5 = 5;
      char v22 = 5;
      strcpy((char *)__p, "Error");
      break;
    case 3:
      uint64_t v5 = 7;
      char v22 = 7;
      LODWORD(__p[0]) = 1818326099;
      int v6 = 1684368492;
      goto LABEL_7;
    default:
      uint64_t v5 = 7;
      char v22 = 7;
      LODWORD(__p[0]) = 1852534357;
      int v6 = 1853321070;
LABEL_7:
      *(_DWORD *)((char *)__p + 3) = v6;
      HIBYTE(__p[0]) = 0;
      break;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v24, (uint64_t)__p, v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v24, (uint64_t)", ", 2);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v24, (uint64_t)"Async: ", 7);
  *(_DWORD *)((char *)&v24 + *(void *)(v24 - 24) + 8) |= 1u;
  uint64_t v7 = (void *)std::ostream::operator<<();
  char v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)", ", 2);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"Total Rx: ", 10);
  unint64_t v9 = (void *)std::ostream::operator<<();
  uint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)" KB, ", 5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"Total Tx: ", 10);
  uint64_t v11 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)" KB", 3);
  if ((v22 & 0x80000000) == 0)
  {
    char v12 = BYTE8(v30);
    if ((BYTE8(v30) & 0x10) == 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v14 = v30;
    if ((unint64_t)v30 < *((void *)&v27 + 1))
    {
      *(void *)&long long v30 = *((void *)&v27 + 1);
      uint64_t v14 = *((void *)&v27 + 1);
    }
    uint64_t v15 = (const void *)v27;
    size_t v13 = v14 - v27;
    if ((unint64_t)(v14 - v27) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_27;
    }
    goto LABEL_16;
  }
  operator delete(__p[0]);
  char v12 = BYTE8(v30);
  if ((BYTE8(v30) & 0x10) != 0) {
    goto LABEL_13;
  }
LABEL_10:
  if ((v12 & 8) == 0)
  {
    size_t v13 = 0;
    a2[23] = 0;
    goto LABEL_23;
  }
  uint64_t v15 = (const void *)*((void *)&v25 + 1);
  size_t v13 = *((void *)&v26 + 1) - *((void *)&v25 + 1);
  if (*((void *)&v26 + 1) - *((void *)&v25 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_27:
  }
    std::string::__throw_length_error[abi:ne180100]();
LABEL_16:
  if (v13 >= 0x17)
  {
    uint64_t v16 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17) {
      uint64_t v16 = v13 | 7;
    }
    uint64_t v17 = v16 + 1;
    BOOL v18 = operator new(v16 + 1);
    *((void *)a2 + 1) = v13;
    *((void *)a2 + 2) = v17 | 0x8000000000000000;
    *(void *)a2 = v18;
    a2 = v18;
    goto LABEL_22;
  }
  a2[23] = v13;
  if (v13) {
LABEL_22:
  }
    memmove(a2, v15, v13);
LABEL_23:
  a2[v13] = 0;
  *(void *)&long long v23 = *MEMORY[0x263F8C2B8];
  uint64_t v19 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)&v23 + *(void *)(v23 - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  *(void *)&long long v24 = v19;
  *((void *)&v24 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v29) < 0) {
    operator delete(v28[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x263E6A9F0](v31);
}

void sub_2637F0878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2637F088C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
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
  char v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
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

void sub_2637F0B70(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x263E6A9F0](v1);
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
  MEMORY[0x263E6A9F0](a1 + 128);
  return a1;
}

uint64_t BasebandTransport::Parameters::toString@<X0>(BasebandTransport::Parameters *this@<X0>, unsigned char *a2@<X8>)
{
  unint64_t v38 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v37[7] = v4;
  v37[8] = v4;
  v37[5] = v4;
  v37[6] = v4;
  _OWORD v37[3] = v4;
  v37[4] = v4;
  v37[1] = v4;
  v37[2] = v4;
  long long v36 = v4;
  v37[0] = v4;
  *(_OWORD *)uint8x8_t v34 = v4;
  long long v35 = v4;
  long long v32 = v4;
  long long v33 = v4;
  long long v30 = v4;
  long long v31 = v4;
  long long v29 = v4;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v29);
  switch(*(_DWORD *)this)
  {
    case 0:
      size_t v5 = 3;
      char v25 = 3;
      strcpy((char *)v24, "PBL");
      break;
    case 1:
      size_t v5 = 3;
      char v25 = 3;
      strcpy((char *)v24, "SBL");
      break;
    case 2:
      size_t v5 = 4;
      char v25 = 4;
      int v6 = 1195460932;
      goto LABEL_25;
    case 3:
      size_t v5 = 4;
      char v25 = 4;
      int v6 = 1397114194;
      goto LABEL_25;
    case 4:
      size_t v5 = 5;
      char v25 = 5;
      strcpy((char *)v24, "QMUX1");
      break;
    case 5:
      size_t v5 = 5;
      char v25 = 5;
      strcpy((char *)v24, "QMUX2");
      break;
    case 6:
      size_t v5 = 3;
      char v25 = 3;
      strcpy((char *)v24, "ROM");
      break;
    case 7:
      size_t v5 = 4;
      char v25 = 4;
      int v6 = 1414483778;
      goto LABEL_25;
    case 8:
      size_t v5 = 3;
      char v25 = 3;
      strcpy((char *)v24, "ARI");
      break;
    case 9:
      size_t v5 = 3;
      char v25 = 3;
      strcpy((char *)v24, "STT");
      break;
    case 0xA:
      size_t v5 = 2;
      char v25 = 2;
      strcpy((char *)v24, "AT");
      break;
    case 0xB:
      size_t v5 = 4;
      char v25 = 4;
      int v6 = 1280328769;
      goto LABEL_25;
    case 0xC:
      size_t v5 = 8;
      char v25 = 8;
      strcpy((char *)v24, "MEDIACTL");
      break;
    case 0xD:
      size_t v5 = 3;
      char v25 = 3;
      strcpy((char *)v24, "ETS");
      break;
    case 0xE:
      size_t v5 = 4;
      char v25 = 4;
      int v6 = 1397968455;
      goto LABEL_25;
    case 0xF:
      size_t v5 = 4;
      char v25 = 4;
      int v6 = 1397965905;
      goto LABEL_25;
    case 0x10:
      size_t v5 = 5;
      char v25 = 5;
      strcpy((char *)v24, "RCTTH");
      break;
    case 0x11:
      size_t v5 = 3;
      char v25 = 3;
      strcpy((char *)v24, "ACP");
      break;
    case 0x12:
      size_t v5 = 4;
      char v25 = 4;
      int v6 = 1297040214;
      goto LABEL_25;
    case 0x13:
      size_t v5 = 4;
      char v25 = 4;
      int v6 = 1129335117;
LABEL_25:
      LODWORD(v24[0]) = v6;
      BYTE4(v24[0]) = 0;
      break;
    case 0x14:
      size_t v5 = 3;
      char v25 = 3;
      strcpy((char *)v24, "DHL");
      break;
    case 0x15:
      size_t v5 = 3;
      char v25 = 3;
      strcpy((char *)v24, "MUX");
      break;
    case 0x16:
      size_t v5 = 3;
      char v25 = 3;
      strcpy((char *)v24, "FAC");
      break;
    default:
      size_t v5 = 7;
      char v25 = 7;
      strcpy((char *)v24, "Unknown");
      break;
  }
  uint64_t v27 = 8250;
  uint64_t v28 = 0;
  HIBYTE(v28) = v5 + 10;
  std::string __p = *(void **)"Protocol: ";
  memcpy((char *)&v27 + 2, v24, v5);
  *((unsigned char *)&v27 + v5 + 2) = 0;
  if (v28 >= 0) {
    uint64_t p_p = (uint64_t)&__p;
  }
  else {
    uint64_t p_p = 0x6C6F636F746F7250;
  }
  if (v28 >= 0) {
    uint64_t v8 = HIBYTE(v28);
  }
  else {
    uint64_t v8 = v27;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v30, p_p, v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v30, (uint64_t)", ", 2);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v30, (uint64_t)"Powersave: ", 11);
  *(_DWORD *)((char *)&v30 + *(void *)(v30 - 24) + 8) |= 1u;
  uint64_t v9 = (void *)std::ostream::operator<<();
  uint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)", ", 2);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"Create Timeout: ", 16);
  uint64_t v11 = (void *)std::ostream::operator<<();
  uint64_t v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)" sec, ", 6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"IO Size: ", 9);
  size_t v13 = (void *)std::ostream::operator<<();
  uint64_t v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)" KB, ", 5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)"Num Pending Reads: ", 19);
  std::ostream::operator<<();
  if (SHIBYTE(v28) < 0)
  {
    operator delete(__p);
    if ((v25 & 0x80000000) == 0)
    {
LABEL_34:
      char v15 = BYTE8(v36);
      if ((BYTE8(v36) & 0x10) == 0) {
        goto LABEL_35;
      }
LABEL_39:
      uint64_t v17 = v36;
      if ((unint64_t)v36 < *((void *)&v33 + 1))
      {
        *(void *)&long long v36 = *((void *)&v33 + 1);
        uint64_t v17 = *((void *)&v33 + 1);
      }
      BOOL v18 = (const void *)v33;
      size_t v16 = v17 - v33;
      if ((unint64_t)(v17 - v33) >= 0x7FFFFFFFFFFFFFF8) {
        goto LABEL_53;
      }
      goto LABEL_42;
    }
  }
  else if ((v25 & 0x80000000) == 0)
  {
    goto LABEL_34;
  }
  operator delete(v24[0]);
  char v15 = BYTE8(v36);
  if ((BYTE8(v36) & 0x10) != 0) {
    goto LABEL_39;
  }
LABEL_35:
  if ((v15 & 8) == 0)
  {
    size_t v16 = 0;
    a2[23] = 0;
    goto LABEL_49;
  }
  BOOL v18 = (const void *)*((void *)&v31 + 1);
  size_t v16 = *((void *)&v32 + 1) - *((void *)&v31 + 1);
  if (*((void *)&v32 + 1) - *((void *)&v31 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_53:
  }
    std::string::__throw_length_error[abi:ne180100]();
LABEL_42:
  if (v16 >= 0x17)
  {
    uint64_t v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17) {
      uint64_t v19 = v16 | 7;
    }
    uint64_t v20 = v19 + 1;
    int v21 = operator new(v19 + 1);
    *((void *)a2 + 1) = v16;
    *((void *)a2 + 2) = v20 | 0x8000000000000000;
    *(void *)a2 = v21;
    a2 = v21;
    goto LABEL_48;
  }
  a2[23] = v16;
  if (v16) {
LABEL_48:
  }
    memmove(a2, v18, v16);
LABEL_49:
  a2[v16] = 0;
  *(void *)&long long v29 = *MEMORY[0x263F8C2B8];
  uint64_t v22 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)&v29 + *(void *)(v29 - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  *(void *)&long long v30 = v22;
  *((void *)&v30 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v35) < 0) {
    operator delete(v34[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x263E6A9F0](v37);
}

void sub_2637F1424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2637F1438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  if (a20 < 0)
  {
    operator delete(__p);
    if ((a14 & 0x80000000) == 0)
    {
LABEL_3:
      std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a21);
      _Unwind_Resume(a1);
    }
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a9);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a21);
  _Unwind_Resume(a1);
}

uint64_t BasebandTransport::BasebandTransport(uint64_t a1, void *a2, NSObject **a3)
{
  *(void *)a1 = &unk_270EAF8D0;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v15, "com.apple.telephony.abm", "ipc.bb");
  int v6 = dispatch_queue_create("ipc.bb", 0);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = v6;
  if (v6)
  {
    uint64_t v7 = v6;
    dispatch_retain(v6);
    *(void *)(a1 + 96) = 0;
    dispatch_release(v7);
  }
  else
  {
    *(void *)(a1 + 96) = 0;
  }
  *(void *)a1 = &unk_270EAFD10;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v17);
  *(void *)(a1 + 8) = &unk_270EAFE48;
  *(void *)(a1 + 56) = *a2;
  uint64_t v8 = a2[1];
  *(void *)(a1 + 64) = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v16);
  *(void *)a1 = &unk_270EAFE08;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v15);
  *(void *)a1 = &unk_270EAF8D0;
  *(_DWORD *)(a1 + 104) = 23;
  *(unsigned char *)(a1 + 108) = 0;
  *(void *)(a1 + 112) = 10;
  shouldUseMinBasebandTransportIOReadSize = (capabilities::abs *)capabilities::abs::shouldUseMinBasebandTransportIOReadSize(v9);
  if (shouldUseMinBasebandTransportIOReadSize) {
    int v11 = 0x4000;
  }
  else {
    int v11 = 0x8000;
  }
  *(_DWORD *)(a1 + 120) = v11;
  capabilities::abs::shouldUseMinBasebandTransportIOReadCount(shouldUseMinBasebandTransportIOReadSize);
  *(_DWORD *)(a1 + 124) = 4;
  *(void *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  uint64_t v12 = *a3;
  *(void *)(a1 + 152) = *a3;
  if (v12) {
    dispatch_retain(v12);
  }
  *(void *)(a1 + 160) = 0;
  *(void *)(a1 + 168) = 0;
  uint64_t Controller = TelephonyBasebandCreateController();
  *(void *)(a1 + 272) = 0;
  *(void *)(a1 + 280) = 0;
  *(void *)(a1 + 264) = Controller;
  *(void *)(a1 + 285) = 0;
  *(void *)(a1 + 304) = 0;
  *(void *)(a1 + 312) = 0;
  *(void *)(a1 + 296) = 0;
  *(void *)(a1 + 320) = dispatch_group_create();
  *(_DWORD *)(a1 + 328) = 0;
  *(unsigned char *)(a1 + 332) = 0;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(void *)(a1 + 256) = 0;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(void *)(a1 + 365) = 0;
  return a1;
}

void sub_2637F1710(_Unwind_Exception *a1)
{
  long long v4 = (const void *)v1[21];
  if (v4) {
    _Block_release(v4);
  }
  if (*v2) {
    _Block_release(*v2);
  }
  size_t v5 = v1[19];
  if (v5) {
    dispatch_release(v5);
  }
  int v6 = (const void *)v1[18];
  if (v6) {
    _Block_release(v6);
  }
  ctu::SharedLoggable<BasebandTransport,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v1);
  _Unwind_Resume(a1);
}

const char *BasebandTransport::getName(BasebandTransport *this)
{
  return "ipc.bb";
}

void *ctu::SharedLoggable<BasebandTransport,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_270EAFD10;
  MEMORY[0x263E6A470](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  long long v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = &unk_270EAFD10;
  MEMORY[0x263E6A470](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  long long v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void BasebandTransport::~BasebandTransport(BasebandTransport *this)
{
  *(void *)this = &unk_270EAF8D0;
  BasebandTransport::timerOff_sync(this);
  (*(void (**)(BasebandTransport *))(*(void *)this + 80))(this);
  uint64_t v2 = (const void *)*((void *)this + 33);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 33) = 0;
  }
  uint64_t v3 = (void *)*((void *)this + 37);
  if (v3)
  {
    operator delete[](v3);
    *((void *)this + 37) = 0;
  }
  long long v4 = *((void *)this + 40);
  if (v4) {
    dispatch_release(v4);
  }
  size_t v5 = *((void *)this + 39);
  if (v5) {
    dispatch_release(v5);
  }
  int v6 = (const void *)*((void *)this + 34);
  if (v6) {
    _Block_release(v6);
  }
  uint64_t v7 = (const void *)*((void *)this + 21);
  if (v7) {
    _Block_release(v7);
  }
  uint64_t v8 = (const void *)*((void *)this + 20);
  if (v8) {
    _Block_release(v8);
  }
  uint64_t v9 = *((void *)this + 19);
  if (v9) {
    dispatch_release(v9);
  }
  uint64_t v10 = (const void *)*((void *)this + 18);
  if (v10) {
    _Block_release(v10);
  }
  *(void *)this = &unk_270EAFD10;
  MEMORY[0x263E6A470]((char *)this + 8);
  int v11 = *((void *)this + 12);
  if (v11) {
    dispatch_release(v11);
  }
  uint64_t v12 = *((void *)this + 11);
  if (v12) {
    dispatch_release(v12);
  }
  size_t v13 = (std::__shared_weak_count *)*((void *)this + 10);
  if (v13) {
    std::__shared_weak_count::__release_weak(v13);
  }
}

{
  void *v1;
  uint64_t vars8;

  BasebandTransport::~BasebandTransport(this);

  operator delete(v1);
}

NSObject *BasebandTransport::timerOff_sync(BasebandTransport *this)
{
  double result = *((void *)this + 35);
  if (result)
  {
    dispatch_source_cancel(result);
    dispatch_release(*((dispatch_object_t *)this + 35));
    *((void *)this + 35) = 0;
    uint64_t v3 = (char *)this + 8;
    long long v4 = *((void *)this + 5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6[0]) = 0;
      _os_log_impl(&dword_2637D5000, v4, OS_LOG_TYPE_DEFAULT, "#I Status report disabled", (uint8_t *)v6, 2u);
    }
    double result = (**(uint64_t (***)(char *, uint64_t))v3)(v3, 40);
    if (result)
    {
      ctu::LogMessageBuffer::createWithFormat(v6, (ctu::LogMessageBuffer *)"Status report disabled", v5);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      return MEMORY[0x263E6A4D0](v6);
    }
  }
  return result;
}

void BasebandTransport::create(NSObject **a1@<X0>, uint64_t a2@<X8>)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZL14sLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  block[3] = &__block_descriptor_tmp_120;
  void block[4] = &qword_26A99FA40;
  if (_MergedGlobals == -1)
  {
    long long v4 = *(std::__shared_weak_count **)algn_26A99FA48;
    uint64_t v7 = qword_26A99FA40;
    uint64_t v8 = *(void *)algn_26A99FA48;
    if (!*(void *)algn_26A99FA48) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&_MergedGlobals, block);
  long long v4 = *(std::__shared_weak_count **)algn_26A99FA48;
  uint64_t v7 = qword_26A99FA40;
  uint64_t v8 = *(void *)algn_26A99FA48;
  if (*(void *)algn_26A99FA48) {
LABEL_3:
  }
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_4:
  size_t v5 = *a1;
  int v6 = v5;
  if (v5) {
    dispatch_retain(v5);
  }
  BasebandTransport::create((capabilities::radio *)&v7, &v6, a2);
  if (v5) {
    dispatch_release(v5);
  }
  if (v4)
  {
    if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

void sub_2637F1BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (v10) {
    dispatch_release(v10);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  _Unwind_Resume(a1);
}

void BasebandTransport::create(capabilities::radio *a1@<X0>, NSObject **a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  int v6 = capabilities::radio::vendor(a1);
  if (v6 != 2)
  {
    if (v6 != 3) {
      return;
    }
    uint64_t v7 = (std::__shared_weak_count_vtbl *)operator new(0x198uLL);
    uint64_t v8 = (std::__shared_weak_count *)*((void *)a1 + 1);
    uint64_t v25 = *(void *)a1;
    long long v26 = v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v9 = *a2;
    long long v24 = v9;
    if (v9) {
      dispatch_retain(v9);
    }
    BasebandTransport::BasebandTransport((uint64_t)v7, &v25, &v24);
    long long v30 = (BasebandTransportICE *)v7;
    unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v10 = (std::__shared_weak_count *)operator new(0x20uLL);
    v10->__shared_owners_ = 0;
    p_shared_owners = &v10->__shared_owners_;
    v10->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAFED8;
    v10->__shared_weak_owners_ = 0;
    v10[1].__vftable = v7;
    unint64_t v31 = (unint64_t)v10;
    uint64_t v12 = (std::__shared_weak_count *)v7[2].~__shared_weak_count;
    if (v12)
    {
      if (v12->__shared_owners_ != -1
        || (atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed),
            atomic_fetch_add_explicit(&v10->__shared_weak_owners_, 1uLL, memory_order_relaxed),
            v7[1].__on_zero_shared_weauint64_t k = (void (__cdecl *)(std::__shared_weak_count *__hidden))v7,
            v7[2].~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))v10,
            std::__shared_weak_count::__release_weak(v12),
            atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)))
      {
LABEL_21:
        uint64_t v19 = (uint64_t)v30;
        ctu::Loggable<BasebandTransport,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync((uint64_t)v30);
        unint64_t v20 = v31;
        long long v30 = 0;
        unint64_t v31 = 0;
        *(void *)a3 = v19;
        *(void *)(a3 + 8) = v20;
        if (v9) {
          dispatch_release(v9);
        }
        int v21 = v26;
        if (!v26) {
          goto LABEL_32;
        }
        goto LABEL_30;
      }
    }
    else
    {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v10->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      v7[1].__on_zero_shared_weauint64_t k = (void (__cdecl *)(std::__shared_weak_count *__hidden))v7;
      v7[2].~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))v10;
      if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_21;
      }
    }
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
    goto LABEL_21;
  }
  size_t v13 = (BasebandTransportICE *)operator new(0x208uLL);
  uint64_t v14 = (std::__shared_weak_count *)*((void *)a1 + 1);
  uint64_t v28 = *(void *)a1;
  long long v29 = v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  char v15 = *a2;
  dispatch_object_t object = v15;
  if (v15) {
    dispatch_retain(v15);
  }
  BasebandTransportICE::BasebandTransportICE(v13, &v28, &object);
  long long v30 = v13;
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  size_t v16 = (std::__shared_weak_count *)operator new(0x20uLL);
  v16->__shared_owners_ = 0;
  uint64_t v17 = &v16->__shared_owners_;
  v16->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAFE88;
  v16->__shared_weak_owners_ = 0;
  v16[1].__vftable = (std::__shared_weak_count_vtbl *)v13;
  unint64_t v31 = (unint64_t)v16;
  BOOL v18 = (std::__shared_weak_count *)*((void *)v13 + 10);
  if (!v18)
  {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v16->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((void *)v13 + 9) = v13;
    *((void *)v13 + 10) = v16;
    if (atomic_fetch_add(v17, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (v18->__shared_owners_ == -1)
  {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v16->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((void *)v13 + 9) = v13;
    *((void *)v13 + 10) = v16;
    std::__shared_weak_count::__release_weak(v18);
    if (!atomic_fetch_add(v17, 0xFFFFFFFFFFFFFFFFLL))
    {
LABEL_26:
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
LABEL_27:
  uint64_t v22 = (uint64_t)v30;
  ctu::Loggable<BasebandTransport,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync((uint64_t)v30);
  unint64_t v23 = v31;
  long long v30 = 0;
  unint64_t v31 = 0;
  *(void *)a3 = v22;
  *(void *)(a3 + 8) = v23;
  if (object) {
    dispatch_release(object);
  }
  int v21 = v29;
  if (!v29) {
    goto LABEL_32;
  }
LABEL_30:
  if (!atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
  }
LABEL_32:
  BasebandTransport::init(*(BasebandTransport **)a3);
}

void sub_2637F1F14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, dispatch_object_t object, char a13, uint64_t a14, char a15)
{
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  if (object) {
    dispatch_release(object);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](v15);
  _Unwind_Resume(a1);
}

void BasebandTransport::init(BasebandTransport *this)
{
  uint64_t v5 = *((void *)this + 9);
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 10);
  long long v4 = (char *)this + 72;
  if (!v3 || (int v6 = std::__shared_weak_count::lock(v3)) == 0) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v7 = v6;
  p_shared_weak_owners = &v6->__shared_weak_owners_;
  atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1174405120;
  v11[2] = ___ZN17BasebandTransport4initEv_block_invoke;
  v11[3] = &__block_descriptor_tmp_53_0;
  v11[4] = this;
  v11[5] = v5;
  uint64_t v12 = v7;
  size_t v13 = v11;
  atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI17BasebandTransportE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_128;
  void block[4] = v4;
  void block[5] = &v13;
  uint64_t v9 = *((void *)this + 11);
  if (!*((void *)this + 12))
  {
    dispatch_sync(v9, block);
    uint64_t v10 = v12;
    if (!v12) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  dispatch_async_and_wait(v9, block);
  uint64_t v10 = v12;
  if (v12) {
LABEL_7:
  }
    std::__shared_weak_count::__release_weak(v10);
LABEL_8:
  std::__shared_weak_count::__release_weak(v7);
}

void ___ZN17BasebandTransport4initEv_block_invoke(capabilities::ipc *a1)
{
  uint64_t v2 = *((void *)a1 + 4);
  if (capabilities::ipc::supportsPCI(a1))
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZN17BasebandTransport4initEv_block_invoke_2;
    aBlock[3] = &__block_descriptor_tmp_5;
    uint64_t v4 = *((void *)a1 + 5);
    uint64_t v3 = (std::__shared_weak_count *)*((void *)a1 + 6);
    aBlock[4] = v2;
    aBlock[5] = v4;
    uint64_t v14 = v3;
    if (v3) {
      atomic_fetch_add_explicit(&v3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v5 = _Block_copy(aBlock);
    int v6 = *(const void **)(v2 + 160);
    *(void *)(v2 + 160) = v5;
    if (v6) {
      _Block_release(v6);
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 1174405120;
    v11[2] = ___ZN17BasebandTransport4initEv_block_invoke_44;
    v11[3] = &__block_descriptor_tmp_49_0;
    uint64_t v8 = *((void *)a1 + 5);
    uint64_t v7 = (std::__shared_weak_count *)*((void *)a1 + 6);
    v11[4] = v2;
    v11[5] = v8;
    uint64_t v12 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v9 = _Block_copy(v11);
    uint64_t v10 = *(const void **)(v2 + 168);
    *(void *)(v2 + 168) = v9;
    if (v10) {
      _Block_release(v10);
    }
    if (v12) {
      std::__shared_weak_count::__release_weak(v12);
    }
    if (v14) {
      std::__shared_weak_count::__release_weak(v14);
    }
  }
}

void ___ZN17BasebandTransport4initEv_block_invoke_2(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = (std::__shared_weak_count *)a1[6];
  if (v5)
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = std::__shared_weak_count::lock(v5);
    if (v10)
    {
      int v11 = v10;
      if (a1[5])
      {
        uint64_t v12 = *(NSObject **)(v9 + 40);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = 67109632;
          *(_DWORD *)&uint8_t buf[4] = a2;
          *(_WORD *)&uint8_t buf[8] = 2048;
          *(void *)&buf[10] = a3;
          *(_WORD *)&buf[18] = 2048;
          *(void *)&buf[20] = a4;
          _os_log_error_impl(&dword_2637D5000, v12, OS_LOG_TYPE_ERROR, "PCI Transport Status: 0x%x (0x%08lx, 0x%08lx)", buf, 0x1Cu);
        }
        if ((**(unsigned int (***)(uint64_t, uint64_t))(v9 + 8))(v9 + 8, 80))
        {
          ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"PCI Transport Status: 0x%x (0x%08lx, 0x%08lx)", v13, a2, a3, a4);
          ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
          MEMORY[0x263E6A4D0](buf);
        }
        *(_DWORD *)(v9 + 328) = 2 * (a2 != 0);
        *(int64x2_t *)(v9 + 352) = vsubq_s64(*(int64x2_t *)(v9 + 336), *(int64x2_t *)(v9 + 376));
        uint64_t v14 = *(const void **)(v9 + 272);
        if (v14)
        {
          uint64_t v15 = _Block_copy(v14);
          size_t v16 = v15;
          long long v17 = *(_OWORD *)(v9 + 344);
          *(_OWORD *)std::string buf = *(_OWORD *)(v9 + 328);
          *(_OWORD *)&uint8_t buf[16] = v17;
          uint64_t v23 = *(void *)(v9 + 360);
          BOOL v18 = *(NSObject **)(v9 + 152);
          if (v15) {
            uint64_t v19 = _Block_copy(v15);
          }
          else {
            uint64_t v19 = 0;
          }
          unint64_t v20 = (char *)operator new(0x30uLL);
          *(void *)unint64_t v20 = v19;
          long long v21 = *(_OWORD *)&buf[16];
          *(_OWORD *)(v20 + 8) = *(_OWORD *)buf;
          *(_OWORD *)(v20 + 24) = v21;
          *((void *)v20 + 5) = v23;
          dispatch_async_f(v18, v20, (dispatch_function_t)_ZZN8dispatch5asyncIZZZN17BasebandTransport4initEvEUb_EUb0_E3__0EEvP16dispatch_queue_sNSt3__110unique_ptrIT_NS5_14default_deleteIS7_EEEEENUlPvE_8__invokeESB_);
          if (v16) {
            _Block_release(v16);
          }
        }
      }
      if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
}

void sub_2637F2540(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

int64x2_t BasebandTransport::updateDeltas_sync(BasebandTransport *this)
{
  int64x2_t result = vsubq_s64(*((int64x2_t *)this + 21), *(int64x2_t *)((char *)this + 376));
  *((int64x2_t *)this + 22) = result;
  return result;
}

uint64_t __copy_helper_block_e8_40c42_ZTSNSt3__18weak_ptrI17BasebandTransportEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c42_ZTSNSt3__18weak_ptrI17BasebandTransportEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZN17BasebandTransport4initEv_block_invoke_44(void *a1, uint64_t a2, void *a3, unsigned int a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v6 = a1[4];
  uint64_t v32 = 0;
  long long v33 = 0;
  uint64_t v7 = (std::__shared_weak_count *)a1[6];
  if (v7 && (long long v33 = std::__shared_weak_count::lock(v7)) != 0 && (v10 = a1[5], (v32 = v10) != 0))
  {
    int v11 = *(NSObject **)(v10 + 320);
    if (v11)
    {
      dispatch_retain(*(dispatch_object_t *)(v10 + 320));
      dispatch_group_enter(v11);
    }
    if (a2)
    {
      uint64_t v12 = *(NSObject **)(v6 + 40);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)std::string buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = a2;
        _os_log_debug_impl(&dword_2637D5000, v12, OS_LOG_TYPE_DEBUG, "#D Async read error 0x%08x", buf, 8u);
      }
      if ((**(unsigned int (***)(uint64_t, uint64_t))(v6 + 8))(v6 + 8, 20))
      {
        ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"Async read error 0x%08x", v13, a2);
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
        MEMORY[0x263E6A4D0](buf);
      }
    }
    else
    {
      *(void *)(v6 + 336) += a4;
      uint64_t v14 = *(const void **)(v6 + 144);
      if (v14)
      {
        uint64_t v15 = _Block_copy(v14);
        uint64_t v16 = *(void *)(v6 + 128);
        if (v16)
        {
          std::string __p = 0;
          long long v30 = 0;
          uint64_t v31 = 0;
          (*(void (**)(uint64_t, void *, void, void **))(*(void *)v16 + 8))(v16, a3, a4, &__p);
          long long v17 = *(NSObject **)(v6 + 152);
          if (v15) {
            BOOL v18 = _Block_copy(v15);
          }
          else {
            BOOL v18 = 0;
          }
          *(void *)std::string buf = v18;
          long long v35 = 0;
          long long v36 = 0;
          uint64_t v37 = 0;
          uint64_t v22 = __p;
          size_t v23 = v30 - (unsigned char *)__p;
          if (v30 == __p)
          {
            uint64_t v25 = 0;
            uint64_t v24 = 0;
          }
          else
          {
            if ((v23 & 0x8000000000000000) != 0) {
              std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v24 = (char *)operator new(v30 - (unsigned char *)__p);
            uint64_t v25 = &v24[v23];
            long long v35 = v24;
            uint64_t v37 = &v24[v23];
            memcpy(v24, v22, v23);
            long long v36 = &v24[v23];
          }
          long long v26 = operator new(0x20uLL);
          *long long v26 = v18;
          v26[1] = v24;
          v26[2] = v25;
          v26[3] = v25;
          dispatch_async_f(v17, v26, (dispatch_function_t)_ZZN8dispatch5asyncIZZZN17BasebandTransport4initEvEUb_EUb1_E3__1EEvP16dispatch_queue_sNSt3__110unique_ptrIT_NS5_14default_deleteIS7_EEEEENUlPvE_8__invokeESB_);
          if (__p)
          {
            long long v30 = __p;
            operator delete(__p);
          }
        }
        else
        {
          char v19 = *(unsigned char *)(v6 + 136);
          unint64_t v20 = *(NSObject **)(v6 + 152);
          if (v15) {
            long long v21 = _Block_copy(v15);
          }
          else {
            long long v21 = 0;
          }
          uint64_t v27 = operator new(0x18uLL);
          *uint64_t v27 = v21;
          v27[1] = a3;
          *((_DWORD *)v27 + 4) = a4;
          *((unsigned char *)v27 + 20) = v19;
          dispatch_async_f(v20, v27, (dispatch_function_t)_ZZN8dispatch5asyncIZZZN17BasebandTransport4initEvEUb_EUb1_E3__2EEvP16dispatch_queue_sNSt3__110unique_ptrIT_NS5_14default_deleteIS7_EEEEENUlPvE_8__invokeESB_);
          a3 = 0;
        }
        if (v15) {
          _Block_release(v15);
        }
      }
    }
    if (a3 && !*(unsigned char *)(v6 + 136)) {
      free(a3);
    }
    if (v11)
    {
      dispatch_group_leave(v11);
      dispatch_release(v11);
    }
  }
  else if (a3)
  {
    free(a3);
  }
  uint64_t v28 = v33;
  if (v33)
  {
    if (!atomic_fetch_add(&v33->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
}

void sub_2637F2934(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13, uint64_t a14, void *aBlock, void *a16, uint64_t a17)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

BOOL BasebandTransport::open(BasebandTransport *a1, long long *a2, void **a3)
{
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x2000000000;
  char v20 = 0;
  BasebandTransport::stopReader(a1);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1174405120;
  v12[2] = ___ZN17BasebandTransport4openENS_10ParametersEN8dispatch5blockIU13block_pointerFvPhjEEE_block_invoke;
  v12[3] = &__block_descriptor_tmp_54_0;
  v12[5] = a1;
  long long v6 = a2[1];
  long long v13 = *a2;
  long long v14 = v6;
  uint64_t v15 = *((void *)a2 + 4);
  uint64_t v7 = *a3;
  if (*a3) {
    uint64_t v7 = _Block_copy(v7);
  }
  aBlocuint64_t k = v7;
  v12[4] = &v17;
  long long v21 = v12;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI17BasebandTransportE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_128;
  void block[4] = (char *)a1 + 72;
  void block[5] = &v21;
  uint64_t v8 = *((void *)a1 + 11);
  if (*((void *)a1 + 12))
  {
    dispatch_async_and_wait(v8, block);
    int v9 = *((unsigned __int8 *)v18 + 24);
    uint64_t v10 = aBlock;
    if (!aBlock) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  dispatch_sync(v8, block);
  int v9 = *((unsigned __int8 *)v18 + 24);
  uint64_t v10 = aBlock;
  if (aBlock) {
LABEL_7:
  }
    _Block_release(v10);
LABEL_8:
  _Block_object_dispose(&v17, 8);
  return v9 != 0;
}

void sub_2637F2B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void BasebandTransport::stopReader(BasebandTransport *this)
{
  v19[0] = 0;
  v19[1] = v19;
  void v19[2] = 0x2000000000;
  char v20 = 0;
  uint64_t v2 = (uint64_t *)((char *)this + 72);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 1107296256;
  v18[2] = ___ZN17BasebandTransport10stopReaderEv_block_invoke;
  void v18[3] = &__block_descriptor_tmp_85;
  v18[4] = v19;
  void v18[5] = this;
  long long v21 = v18;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 0x40000000;
  void v16[2] = (uint64_t)___ZNK3ctu20SharedSynchronizableI17BasebandTransportE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  v16[3] = (uint64_t)&__block_descriptor_tmp_128;
  v16[4] = (uint64_t)this + 72;
  v16[5] = (uint64_t)&v21;
  uint64_t v4 = (char *)this + 88;
  uint64_t v3 = *((void *)this + 11);
  if (*((void *)v4 + 1)) {
    dispatch_async_and_wait(v3, v16);
  }
  else {
    dispatch_sync(v3, v16);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 1107296256;
  v17[2] = ___ZN17BasebandTransport10stopReaderEv_block_invoke_86;
  v17[3] = &__block_descriptor_tmp_89;
  v17[4] = v19;
  v17[5] = this;
  ctu::SharedSynchronizable<BasebandTransport>::execute_wrapped(v2, (uint64_t)v17);
  if (*((void *)this + 40))
  {
    uint64_t v5 = (char *)this + 8;
    long long v6 = *((void *)this + 5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl(&dword_2637D5000, v6, OS_LOG_TYPE_DEFAULT, "#I Waiting for reader to be stopped", (uint8_t *)v16, 2u);
    }
    if ((**(unsigned int (***)(char *, uint64_t))v5)((char *)this + 8, 40))
    {
      ctu::LogMessageBuffer::createWithFormat(v16, (ctu::LogMessageBuffer *)"Waiting for reader to be stopped", v7);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x263E6A4D0](v16);
    }
    uint64_t v8 = *((void *)this + 40);
    dispatch_time_t v9 = dispatch_time(0, 3000000000);
    if (dispatch_group_wait(v8, v9))
    {
      (*(void (**)(BasebandTransport *))(*(void *)this + 80))(this);
      uint64_t v10 = *((void *)this + 5);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v16[0]) = 0;
        _os_log_error_impl(&dword_2637D5000, v10, OS_LOG_TYPE_ERROR, "Timeout waiting for read to unblock, freed transport to force read unblock", (uint8_t *)v16, 2u);
      }
      if ((**(unsigned int (***)(char *, uint64_t))v5)((char *)this + 8, 80))
      {
        ctu::LogMessageBuffer::createWithFormat(v16, (ctu::LogMessageBuffer *)"Timeout waiting for read to unblock, freed transport to force read unblock", v11);
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
        MEMORY[0x263E6A4D0](v16);
      }
    }
    else
    {
      uint64_t v12 = (void *)*((void *)this + 37);
      if (v12)
      {
        operator delete[](v12);
        *((void *)this + 37) = 0;
        long long v13 = *((void *)this + 39);
        *((void *)this + 39) = 0;
        if (v13) {
          dispatch_release(v13);
        }
      }
    }
    long long v14 = *((void *)this + 5);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl(&dword_2637D5000, v14, OS_LOG_TYPE_DEFAULT, "#I Reader stopped", (uint8_t *)v16, 2u);
    }
    if ((**(unsigned int (***)(char *, uint64_t))v5)(v5, 40))
    {
      ctu::LogMessageBuffer::createWithFormat(v16, (ctu::LogMessageBuffer *)"Reader stopped", v15);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x263E6A4D0](v16);
    }
  }
  _Block_object_dispose(v19, 8);
}

void sub_2637F2F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  MEMORY[0x263E6A4D0](&a9);
  _Block_object_dispose((const void *)(v9 - 88), 8);
  _Unwind_Resume(a1);
}

void sub_2637F2F6C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 88), 8);
  _Unwind_Resume(a1);
}

void sub_2637F2F84(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 88), 8);
  _Unwind_Resume(a1);
}

void sub_2637F2F9C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 88), 8);
  _Unwind_Resume(a1);
}

void sub_2637F2FB4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 88), 8);
  _Unwind_Resume(a1);
}

void sub_2637F2FCC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 88), 8);
  _Unwind_Resume(a1);
}

void ___ZN17BasebandTransport4openENS_10ParametersEN8dispatch5blockIU13block_pointerFvPhjEEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  BasebandTransport::timerOff_sync((BasebandTransport *)v2);
  (*(void (**)(uint64_t))(*(void *)v2 + 80))(v2);
  *(_DWORD *)(v2 + 328) = 0;
  *(unsigned char *)(v2 + 332) = 0;
  *(_OWORD *)(v2 + 376) = 0u;
  *(_OWORD *)(v2 + 392) = 0u;
  *(_OWORD *)(v2 + 336) = 0u;
  *(_OWORD *)(v2 + 352) = 0u;
  *(void *)(v2 + 365) = 0;
  char v3 = *(unsigned char *)(a1 + 80);
  long long v4 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v2 + 104) = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v2 + 120) = v4;
  *(unsigned char *)(v2 + 136) = v3;
  uint64_t v5 = *(void **)(a1 + 88);
  if (v5) {
    uint64_t v5 = _Block_copy(v5);
  }
  long long v6 = *(const void **)(v2 + 144);
  *(void *)(v2 + 144) = v5;
  if (v6) {
    _Block_release(v6);
  }
  if (*(_DWORD *)(v2 + 104) != 23)
  {
    if (capabilities::ipc::supportsPCI((capabilities::ipc *)v5)) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = BasebandTransport::openPCI_sync((BasebandTransport *)v2);
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      BasebandTransport::timerOn_sync((dispatch_queue_t *)v2);
    }
    else {
      (*(void (**)(uint64_t))(*(void *)v2 + 80))(v2);
    }
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 0x40000000;
    v7[2] = ___ZN17BasebandTransport9dumpStateEb_block_invoke;
    v7[3] = &__block_descriptor_tmp_110;
    v7[4] = v2;
    char v8 = 0;
    ctu::SharedSynchronizable<BasebandTransport>::execute_wrapped((uint64_t *)(v2 + 72), (uint64_t)v7);
  }
}

uint64_t BasebandTransport::openPCI_sync(BasebandTransport *this)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 10);
  if (!v2 || (char v3 = std::__shared_weak_count::lock(v2)) == 0) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  long long v4 = v3;
  atomic_fetch_add_explicit(&v3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v4);
  }
  HIDWORD(v34) = -1431655766;
  inited = (capabilities::abs *)TelephonyBasebandPCITransportInitParameters();
  int v6 = *((_DWORD *)this + 28);
  uint64_t shouldUseMinBasebandTransportIOReadCount = capabilities::abs::traceTransportTimeoutScalingFactor(inited);
  uint64_t v8 = (1000 * v6);
  if (((v8 * (unint64_t)shouldUseMinBasebandTransportIOReadCount) & 0xFFFFFFFF00000000) != 0)
  {
    uint64_t v9 = *((void *)this + 5);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = 1000 * v6;
      _os_log_error_impl(&dword_2637D5000, v9, OS_LOG_TYPE_ERROR, "Scaled create timeout overflowed, falling back to unscaled value: %u", buf, 8u);
    }
    uint64_t shouldUseMinBasebandTransportIOReadCount = (**((uint64_t (***)(char *, uint64_t))this + 1))((char *)this + 8, 80);
    if (shouldUseMinBasebandTransportIOReadCount)
    {
      ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"Scaled create timeout overflowed, falling back to unscaled value: %u", v10, v8);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      uint64_t shouldUseMinBasebandTransportIOReadCount = MEMORY[0x263E6A4D0](buf);
    }
  }
  else
  {
    LODWORD(v8) = v8 * shouldUseMinBasebandTransportIOReadCount;
  }
  uint64_t v35 = *((void *)this + 11);
  uint64_t v37 = v8 | 0x200000000;
  if (!*((_DWORD *)this + 31))
  {
    int v12 = *((_DWORD *)this + 26);
    uint64_t shouldUseMinBasebandTransportIOReadCount = capabilities::abs::shouldUseMinBasebandTransportIOReadCount((capabilities::abs *)shouldUseMinBasebandTransportIOReadCount);
    if (shouldUseMinBasebandTransportIOReadCount) {
      goto LABEL_17;
    }
    if (v12 == 2)
    {
      HIDWORD(v38) = 16;
      unsigned int v11 = *((_DWORD *)this + 30);
      if (v11) {
        goto LABEL_25;
      }
      goto LABEL_13;
    }
    if (v12 == 16 || v12 == 15)
    {
      HIDWORD(v38) = 36;
      unsigned int v11 = *((_DWORD *)this + 30);
      if (v11) {
        goto LABEL_25;
      }
    }
    else
    {
LABEL_17:
      HIDWORD(v38) = 4;
      unsigned int v11 = *((_DWORD *)this + 30);
      if (v11) {
        goto LABEL_25;
      }
    }
LABEL_13:
    if (capabilities::abs::shouldUseMinBasebandTransportIOReadSize((capabilities::abs *)shouldUseMinBasebandTransportIOReadCount)) {
      unsigned int v11 = 0x4000;
    }
    else {
      unsigned int v11 = 0x8000;
    }
    goto LABEL_25;
  }
  HIDWORD(v38) = *((_DWORD *)this + 31);
  unsigned int v11 = *((_DWORD *)this + 30);
  if (!v11) {
    goto LABEL_13;
  }
LABEL_25:
  LODWORD(v38) = -1431655765;
  int v13 = *((_DWORD *)this + 26);
  switch(v13)
  {
    case 0:
      LODWORD(v34) = 0;
      uint64_t v14 = HIDWORD(v38);
      if (HIDWORD(v38) < 0x41) {
        goto LABEL_32;
      }
      goto LABEL_27;
    case 1:
      LODWORD(v34) = 1;
      uint64_t v14 = HIDWORD(v38);
      if (HIDWORD(v38) < 0x41) {
        goto LABEL_32;
      }
      goto LABEL_27;
    case 2:
      LODWORD(v34) = 2;
      uint64_t v14 = HIDWORD(v38);
      if (HIDWORD(v38) < 0x41) {
        goto LABEL_32;
      }
      goto LABEL_27;
    case 3:
      LODWORD(v34) = 3;
      uint64_t v14 = HIDWORD(v38);
      if (HIDWORD(v38) < 0x41) {
        goto LABEL_32;
      }
      goto LABEL_27;
    case 4:
      LODWORD(v34) = 4;
      uint64_t v14 = HIDWORD(v38);
      if (HIDWORD(v38) < 0x41) {
        goto LABEL_32;
      }
      goto LABEL_27;
    case 5:
      LODWORD(v34) = 5;
      uint64_t v14 = HIDWORD(v38);
      if (HIDWORD(v38) < 0x41) {
        goto LABEL_32;
      }
      goto LABEL_27;
    case 6:
      LODWORD(v34) = 6;
      uint64_t v14 = HIDWORD(v38);
      if (HIDWORD(v38) < 0x41) {
        goto LABEL_32;
      }
      goto LABEL_27;
    case 7:
      LODWORD(v34) = 7;
      uint64_t v14 = HIDWORD(v38);
      if (HIDWORD(v38) < 0x41) {
        goto LABEL_32;
      }
      goto LABEL_27;
    case 8:
      LODWORD(v34) = 8;
      uint64_t v14 = HIDWORD(v38);
      if (HIDWORD(v38) < 0x41) {
        goto LABEL_32;
      }
      goto LABEL_27;
    case 9:
    case 17:
      LODWORD(v34) = 9;
      uint64_t v14 = HIDWORD(v38);
      if (HIDWORD(v38) >= 0x41) {
        goto LABEL_27;
      }
      goto LABEL_32;
    case 10:
      LODWORD(v34) = 10;
      uint64_t v14 = HIDWORD(v38);
      if (HIDWORD(v38) < 0x41) {
        goto LABEL_32;
      }
      goto LABEL_27;
    case 11:
      LODWORD(v34) = 11;
      uint64_t v14 = HIDWORD(v38);
      if (HIDWORD(v38) < 0x41) {
        goto LABEL_32;
      }
      goto LABEL_27;
    case 12:
      LODWORD(v34) = 12;
      uint64_t v14 = HIDWORD(v38);
      if (HIDWORD(v38) < 0x41) {
        goto LABEL_32;
      }
      goto LABEL_27;
    case 13:
    case 18:
      LODWORD(v34) = 13;
      uint64_t v14 = HIDWORD(v38);
      if (HIDWORD(v38) < 0x41) {
        goto LABEL_32;
      }
      goto LABEL_27;
    case 14:
      LODWORD(v34) = 14;
      uint64_t v14 = HIDWORD(v38);
      if (HIDWORD(v38) < 0x41) {
        goto LABEL_32;
      }
      goto LABEL_27;
    case 15:
      LODWORD(v34) = 15;
      uint64_t v14 = HIDWORD(v38);
      if (HIDWORD(v38) < 0x41) {
        goto LABEL_32;
      }
      goto LABEL_27;
    case 16:
      LODWORD(v34) = 16;
      uint64_t v14 = HIDWORD(v38);
      if (HIDWORD(v38) >= 0x41)
      {
LABEL_27:
        uint64_t v15 = *((void *)this + 5);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          switch(v13)
          {
            case 0:
              char v44 = 3;
              strcpy((char *)buf, "PBL");
              break;
            case 1:
              char v44 = 3;
              strcpy((char *)buf, "SBL");
              break;
            case 2:
              char v44 = 4;
              int v32 = 1195460932;
              goto LABEL_240;
            case 3:
              char v44 = 4;
              int v32 = 1397114194;
              goto LABEL_240;
            case 4:
              char v44 = 5;
              strcpy((char *)buf, "QMUX1");
              break;
            case 5:
              char v44 = 5;
              strcpy((char *)buf, "QMUX2");
              break;
            case 6:
              char v44 = 3;
              strcpy((char *)buf, "ROM");
              break;
            case 7:
              char v44 = 4;
              int v32 = 1414483778;
              goto LABEL_240;
            case 8:
              char v44 = 3;
              strcpy((char *)buf, "ARI");
              break;
            case 9:
              char v44 = 3;
              strcpy((char *)buf, "STT");
              break;
            case 10:
              char v44 = 2;
              strcpy((char *)buf, "AT");
              break;
            case 11:
              char v44 = 4;
              int v32 = 1280328769;
              goto LABEL_240;
            case 12:
              char v44 = 8;
              strcpy((char *)buf, "MEDIACTL");
              break;
            case 13:
              char v44 = 3;
              strcpy((char *)buf, "ETS");
              break;
            case 14:
              char v44 = 4;
              int v32 = 1397968455;
              goto LABEL_240;
            case 15:
              char v44 = 4;
              int v32 = 1397965905;
              goto LABEL_240;
            case 16:
              char v44 = 5;
              strcpy((char *)buf, "RCTTH");
              break;
            case 17:
              char v44 = 3;
              strcpy((char *)buf, "ACP");
              break;
            case 18:
              char v44 = 4;
              int v32 = 1297040214;
LABEL_240:
              *(_DWORD *)std::string buf = v32;
              uint8_t buf[4] = 0;
              break;
            default:
              char v44 = 7;
              strcpy((char *)buf, "Unknown");
              break;
          }
          *(_DWORD *)int v39 = 136315394;
          *(void *)&v39[4] = buf;
          __int16 v40 = 2048;
          uint64_t v41 = v14;
          _os_log_error_impl(&dword_2637D5000, v15, OS_LOG_TYPE_ERROR, "%s: invalid transport io read count (%lu)", v39, 0x16u);
          if (v44 < 0) {
            operator delete(*(void **)buf);
          }
        }
        if (!(**((unsigned int (***)(char *, uint64_t))this + 1))((char *)this + 8, 80)) {
          goto LABEL_189;
        }
        switch(*((_DWORD *)this + 26))
        {
          case 0:
            char v42 = 3;
            strcpy(v39, "PBL");
            break;
          case 1:
            char v42 = 3;
            strcpy(v39, "SBL");
            break;
          case 2:
            char v42 = 4;
            int v23 = 1195460932;
            goto LABEL_101;
          case 3:
            char v42 = 4;
            int v23 = 1397114194;
            goto LABEL_101;
          case 4:
            char v42 = 5;
            strcpy(v39, "QMUX1");
            break;
          case 5:
            char v42 = 5;
            strcpy(v39, "QMUX2");
            break;
          case 6:
            char v42 = 3;
            strcpy(v39, "ROM");
            break;
          case 7:
            char v42 = 4;
            int v23 = 1414483778;
            goto LABEL_101;
          case 8:
            char v42 = 3;
            strcpy(v39, "ARI");
            break;
          case 9:
            char v42 = 3;
            strcpy(v39, "STT");
            break;
          case 0xA:
            char v42 = 2;
            strcpy(v39, "AT");
            break;
          case 0xB:
            char v42 = 4;
            int v23 = 1280328769;
            goto LABEL_101;
          case 0xC:
            char v42 = 8;
            strcpy(v39, "MEDIACTL");
            break;
          case 0xD:
            char v42 = 3;
            strcpy(v39, "ETS");
            break;
          case 0xE:
            char v42 = 4;
            int v23 = 1397968455;
            goto LABEL_101;
          case 0xF:
            char v42 = 4;
            int v23 = 1397965905;
            goto LABEL_101;
          case 0x10:
            char v42 = 5;
            strcpy(v39, "RCTTH");
            break;
          case 0x11:
            char v42 = 3;
            strcpy(v39, "ACP");
            break;
          case 0x12:
            char v42 = 4;
            int v23 = 1297040214;
            goto LABEL_101;
          case 0x13:
            char v42 = 4;
            int v23 = 1129335117;
LABEL_101:
            *(_DWORD *)int v39 = v23;
            v39[4] = 0;
            break;
          case 0x14:
            char v42 = 3;
            strcpy(v39, "DHL");
            break;
          case 0x15:
            char v42 = 3;
            strcpy(v39, "MUX");
            break;
          case 0x16:
            char v42 = 3;
            strcpy(v39, "FAC");
            break;
          default:
            char v42 = 7;
            strcpy(v39, "Unknown");
            break;
        }
        ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"%s: invalid transport io read count (%lu)", v16, v39, HIDWORD(v38), v34, v35, 0xAAAAAAAAAAAAAAAALL, v37, v38);
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
LABEL_187:
        MEMORY[0x263E6A4D0](buf);
        if (v42 < 0) {
          operator delete(*(void **)v39);
        }
LABEL_189:
        uint64_t v29 = 0;
        goto LABEL_190;
      }
LABEL_32:
      if (v11 - 0x4000 > 0xFC000)
      {
        uint64_t v19 = *((void *)this + 5);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          switch(v13)
          {
            case 0:
              char v44 = 3;
              strcpy((char *)buf, "PBL");
              break;
            case 1:
              char v44 = 3;
              strcpy((char *)buf, "SBL");
              break;
            case 2:
              char v44 = 4;
              int v33 = 1195460932;
              goto LABEL_262;
            case 3:
              char v44 = 4;
              int v33 = 1397114194;
              goto LABEL_262;
            case 4:
              char v44 = 5;
              strcpy((char *)buf, "QMUX1");
              break;
            case 5:
              char v44 = 5;
              strcpy((char *)buf, "QMUX2");
              break;
            case 6:
              char v44 = 3;
              strcpy((char *)buf, "ROM");
              break;
            case 7:
              char v44 = 4;
              int v33 = 1414483778;
              goto LABEL_262;
            case 8:
              char v44 = 3;
              strcpy((char *)buf, "ARI");
              break;
            case 9:
              char v44 = 3;
              strcpy((char *)buf, "STT");
              break;
            case 10:
              char v44 = 2;
              strcpy((char *)buf, "AT");
              break;
            case 11:
              char v44 = 4;
              int v33 = 1280328769;
              goto LABEL_262;
            case 12:
              char v44 = 8;
              strcpy((char *)buf, "MEDIACTL");
              break;
            case 13:
              char v44 = 3;
              strcpy((char *)buf, "ETS");
              break;
            case 14:
              char v44 = 4;
              int v33 = 1397968455;
              goto LABEL_262;
            case 15:
              char v44 = 4;
              int v33 = 1397965905;
              goto LABEL_262;
            case 16:
              char v44 = 5;
              strcpy((char *)buf, "RCTTH");
              break;
            case 17:
              char v44 = 3;
              strcpy((char *)buf, "ACP");
              break;
            case 18:
              char v44 = 4;
              int v33 = 1297040214;
LABEL_262:
              *(_DWORD *)std::string buf = v33;
              uint8_t buf[4] = 0;
              break;
            default:
              char v44 = 7;
              strcpy((char *)buf, "Unknown");
              break;
          }
          *(_DWORD *)int v39 = 136315394;
          *(void *)&v39[4] = buf;
          __int16 v40 = 2048;
          uint64_t v41 = v11;
          _os_log_error_impl(&dword_2637D5000, v19, OS_LOG_TYPE_ERROR, "%s: invalid transport io read size (%lu)", v39, 0x16u);
          if (v44 < 0) {
            operator delete(*(void **)buf);
          }
        }
        if (!(**((unsigned int (***)(char *, uint64_t))this + 1))((char *)this + 8, 80)) {
          goto LABEL_189;
        }
        switch(*((_DWORD *)this + 26))
        {
          case 0:
            char v42 = 3;
            strcpy(v39, "PBL");
            break;
          case 1:
            char v42 = 3;
            strcpy(v39, "SBL");
            break;
          case 2:
            char v42 = 4;
            int v25 = 1195460932;
            goto LABEL_131;
          case 3:
            char v42 = 4;
            int v25 = 1397114194;
            goto LABEL_131;
          case 4:
            char v42 = 5;
            strcpy(v39, "QMUX1");
            break;
          case 5:
            char v42 = 5;
            strcpy(v39, "QMUX2");
            break;
          case 6:
            char v42 = 3;
            strcpy(v39, "ROM");
            break;
          case 7:
            char v42 = 4;
            int v25 = 1414483778;
            goto LABEL_131;
          case 8:
            char v42 = 3;
            strcpy(v39, "ARI");
            break;
          case 9:
            char v42 = 3;
            strcpy(v39, "STT");
            break;
          case 0xA:
            char v42 = 2;
            strcpy(v39, "AT");
            break;
          case 0xB:
            char v42 = 4;
            int v25 = 1280328769;
            goto LABEL_131;
          case 0xC:
            char v42 = 8;
            strcpy(v39, "MEDIACTL");
            break;
          case 0xD:
            char v42 = 3;
            strcpy(v39, "ETS");
            break;
          case 0xE:
            char v42 = 4;
            int v25 = 1397968455;
            goto LABEL_131;
          case 0xF:
            char v42 = 4;
            int v25 = 1397965905;
            goto LABEL_131;
          case 0x10:
            char v42 = 5;
            strcpy(v39, "RCTTH");
            break;
          case 0x11:
            char v42 = 3;
            strcpy(v39, "ACP");
            break;
          case 0x12:
            char v42 = 4;
            int v25 = 1297040214;
            goto LABEL_131;
          case 0x13:
            char v42 = 4;
            int v25 = 1129335117;
LABEL_131:
            *(_DWORD *)int v39 = v25;
            v39[4] = 0;
            break;
          case 0x14:
            char v42 = 3;
            strcpy(v39, "DHL");
            break;
          case 0x15:
            char v42 = 3;
            strcpy(v39, "MUX");
            break;
          case 0x16:
            char v42 = 3;
            strcpy(v39, "FAC");
            break;
          default:
            char v42 = 7;
            strcpy(v39, "Unknown");
            break;
        }
        ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"%s: invalid transport io read size (%lu)", v20, v39, v11, v34, v35, 0xAAAAAAAAAAAAAAAALL, v37, v38);
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
        goto LABEL_187;
      }
      uint64_t v36 = *((void *)this + 20);
      if (*((void *)this + 18))
      {
        *((unsigned char *)this + 332) = 1;
        LODWORD(v38) = -1431655761;
      }
      uint64_t v17 = (unsigned int (***)(char *, uint64_t))((char *)this + 8);
      if (!TelephonyBasebandPCITransportCreate())
      {
        *((_DWORD *)this + 82) = 2;
        long long v21 = *((void *)this + 5);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          BasebandTransport::asString(*((unsigned int *)this + 26), (char *)buf);
          uint64_t v24 = v44 >= 0 ? buf : *(uint8_t **)buf;
          *(_DWORD *)int v39 = 136315138;
          *(void *)&v39[4] = v24;
          _os_log_error_impl(&dword_2637D5000, v21, OS_LOG_TYPE_ERROR, "%s: transport open failed", v39, 0xCu);
          if (v44 < 0) {
            operator delete(*(void **)buf);
          }
        }
        if (!(**v17)((char *)this + 8, 80)) {
          goto LABEL_189;
        }
        switch(*((_DWORD *)this + 26))
        {
          case 0:
            char v42 = 3;
            strcpy(v39, "PBL");
            break;
          case 1:
            char v42 = 3;
            strcpy(v39, "SBL");
            break;
          case 2:
            char v42 = 4;
            int v28 = 1195460932;
            goto LABEL_185;
          case 3:
            char v42 = 4;
            int v28 = 1397114194;
            goto LABEL_185;
          case 4:
            char v42 = 5;
            strcpy(v39, "QMUX1");
            break;
          case 5:
            char v42 = 5;
            strcpy(v39, "QMUX2");
            break;
          case 6:
            char v42 = 3;
            strcpy(v39, "ROM");
            break;
          case 7:
            char v42 = 4;
            int v28 = 1414483778;
            goto LABEL_185;
          case 8:
            char v42 = 3;
            strcpy(v39, "ARI");
            break;
          case 9:
            char v42 = 3;
            strcpy(v39, "STT");
            break;
          case 0xA:
            char v42 = 2;
            strcpy(v39, "AT");
            break;
          case 0xB:
            char v42 = 4;
            int v28 = 1280328769;
            goto LABEL_185;
          case 0xC:
            char v42 = 8;
            strcpy(v39, "MEDIACTL");
            break;
          case 0xD:
            char v42 = 3;
            strcpy(v39, "ETS");
            break;
          case 0xE:
            char v42 = 4;
            int v28 = 1397968455;
            goto LABEL_185;
          case 0xF:
            char v42 = 4;
            int v28 = 1397965905;
            goto LABEL_185;
          case 0x10:
            char v42 = 5;
            strcpy(v39, "RCTTH");
            break;
          case 0x11:
            char v42 = 3;
            strcpy(v39, "ACP");
            break;
          case 0x12:
            char v42 = 4;
            int v28 = 1297040214;
            goto LABEL_185;
          case 0x13:
            char v42 = 4;
            int v28 = 1129335117;
LABEL_185:
            *(_DWORD *)int v39 = v28;
            v39[4] = 0;
            break;
          case 0x14:
            char v42 = 3;
            strcpy(v39, "DHL");
            break;
          case 0x15:
            char v42 = 3;
            strcpy(v39, "MUX");
            break;
          case 0x16:
            char v42 = 3;
            strcpy(v39, "FAC");
            break;
          default:
            char v42 = 7;
            strcpy(v39, "Unknown");
            break;
        }
        ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"%s: transport open failed", v22, v39);
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
        goto LABEL_187;
      }
      *((_DWORD *)this + 82) = 1;
      BOOL v18 = *((void *)this + 5);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        switch(*((_DWORD *)this + 26))
        {
          case 0:
            char v44 = 3;
            strcpy((char *)buf, "PBL");
            break;
          case 1:
            char v44 = 3;
            strcpy((char *)buf, "SBL");
            break;
          case 2:
            char v44 = 4;
            int v26 = 1195460932;
            goto LABEL_156;
          case 3:
            char v44 = 4;
            int v26 = 1397114194;
            goto LABEL_156;
          case 4:
            char v44 = 5;
            strcpy((char *)buf, "QMUX1");
            break;
          case 5:
            char v44 = 5;
            strcpy((char *)buf, "QMUX2");
            break;
          case 6:
            char v44 = 3;
            strcpy((char *)buf, "ROM");
            break;
          case 7:
            char v44 = 4;
            int v26 = 1414483778;
            goto LABEL_156;
          case 8:
            char v44 = 3;
            strcpy((char *)buf, "ARI");
            break;
          case 9:
            char v44 = 3;
            strcpy((char *)buf, "STT");
            break;
          case 0xA:
            char v44 = 2;
            strcpy((char *)buf, "AT");
            break;
          case 0xB:
            char v44 = 4;
            int v26 = 1280328769;
            goto LABEL_156;
          case 0xC:
            char v44 = 8;
            strcpy((char *)buf, "MEDIACTL");
            break;
          case 0xD:
            char v44 = 3;
            strcpy((char *)buf, "ETS");
            break;
          case 0xE:
            char v44 = 4;
            int v26 = 1397968455;
            goto LABEL_156;
          case 0xF:
            char v44 = 4;
            int v26 = 1397965905;
            goto LABEL_156;
          case 0x10:
            char v44 = 5;
            strcpy((char *)buf, "RCTTH");
            break;
          case 0x11:
            char v44 = 3;
            strcpy((char *)buf, "ACP");
            break;
          case 0x12:
            char v44 = 4;
            int v26 = 1297040214;
            goto LABEL_156;
          case 0x13:
            char v44 = 4;
            int v26 = 1129335117;
LABEL_156:
            *(_DWORD *)std::string buf = v26;
            uint8_t buf[4] = 0;
            break;
          case 0x14:
            char v44 = 3;
            strcpy((char *)buf, "DHL");
            break;
          case 0x15:
            char v44 = 3;
            strcpy((char *)buf, "MUX");
            break;
          case 0x16:
            char v44 = 3;
            strcpy((char *)buf, "FAC");
            break;
          default:
            char v44 = 7;
            strcpy((char *)buf, "Unknown");
            break;
        }
        *(_DWORD *)int v39 = 136315394;
        *(void *)&v39[4] = buf;
        __int16 v40 = 1024;
        LODWORD(v41) = v11;
        _os_log_impl(&dword_2637D5000, v18, OS_LOG_TYPE_DEFAULT, "#I %s: transport successfully opened with read io size as %u", v39, 0x12u);
        if (v44 < 0) {
          operator delete(*(void **)buf);
        }
      }
      if ((**v17)((char *)this + 8, 40))
      {
        switch(*((_DWORD *)this + 26))
        {
          case 0:
            char v42 = 3;
            strcpy(v39, "PBL");
            break;
          case 1:
            char v42 = 3;
            strcpy(v39, "SBL");
            break;
          case 2:
            char v42 = 4;
            int v31 = 1195460932;
            goto LABEL_214;
          case 3:
            char v42 = 4;
            int v31 = 1397114194;
            goto LABEL_214;
          case 4:
            char v42 = 5;
            strcpy(v39, "QMUX1");
            break;
          case 5:
            char v42 = 5;
            strcpy(v39, "QMUX2");
            break;
          case 6:
            char v42 = 3;
            strcpy(v39, "ROM");
            break;
          case 7:
            char v42 = 4;
            int v31 = 1414483778;
            goto LABEL_214;
          case 8:
            char v42 = 3;
            strcpy(v39, "ARI");
            break;
          case 9:
            char v42 = 3;
            strcpy(v39, "STT");
            break;
          case 0xA:
            char v42 = 2;
            strcpy(v39, "AT");
            break;
          case 0xB:
            char v42 = 4;
            int v31 = 1280328769;
            goto LABEL_214;
          case 0xC:
            char v42 = 8;
            strcpy(v39, "MEDIACTL");
            break;
          case 0xD:
            char v42 = 3;
            strcpy(v39, "ETS");
            break;
          case 0xE:
            char v42 = 4;
            int v31 = 1397968455;
            goto LABEL_214;
          case 0xF:
            char v42 = 4;
            int v31 = 1397965905;
            goto LABEL_214;
          case 0x10:
            char v42 = 5;
            strcpy(v39, "RCTTH");
            break;
          case 0x11:
            char v42 = 3;
            strcpy(v39, "ACP");
            break;
          case 0x12:
            char v42 = 4;
            int v31 = 1297040214;
            goto LABEL_214;
          case 0x13:
            char v42 = 4;
            int v31 = 1129335117;
LABEL_214:
            *(_DWORD *)int v39 = v31;
            v39[4] = 0;
            break;
          case 0x14:
            char v42 = 3;
            strcpy(v39, "DHL");
            break;
          case 0x15:
            char v42 = 3;
            strcpy(v39, "MUX");
            break;
          case 0x16:
            char v42 = 3;
            strcpy(v39, "FAC");
            break;
          default:
            char v42 = 7;
            strcpy(v39, "Unknown");
            break;
        }
        ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"%s: transport successfully opened with read io size as %u", v27, v39, v11, v34, v35, v36, v37, v38);
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
        MEMORY[0x263E6A4D0](buf);
        if (v42 < 0) {
          operator delete(*(void **)v39);
        }
      }
      uint64_t v29 = 1;
LABEL_190:
      std::__shared_weak_count::__release_weak(v4);
      return v29;
    default:
      goto LABEL_189;
  }
}

void sub_2637F4AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,char a30)
{
  MEMORY[0x263E6A4D0](&a30);
  if (a28 < 0)
  {
    operator delete(__p);
    std::__shared_weak_count::__release_weak(v30);
    _Unwind_Resume(a1);
  }
  std::__shared_weak_count::__release_weak(v30);
  _Unwind_Resume(a1);
}

void BasebandTransport::timerOn_sync(dispatch_queue_t *this)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BasebandTransport::timerOff_sync((BasebandTransport *)this);
  if (*((_DWORD *)this + 82) == 1)
  {
    unsigned int v2 = *((_DWORD *)this + 72);
    if (v2 && this[34])
    {
      uint64_t v3 = 1000000000 * v2;
      long long v4 = dispatch_source_create(MEMORY[0x263EF8400], 1uLL, 0, this[11]);
      this[35] = v4;
      dispatch_time_t v5 = dispatch_time(0, v3);
      dispatch_source_set_timer(v4, v5, v3, 0xBEBC200uLL);
      int v6 = (std::__shared_weak_count *)this[10];
      if (!v6 || (dispatch_queue_t v7 = this[9], (v8 = std::__shared_weak_count::lock(v6)) == 0)) {
        std::__throw_bad_weak_ptr[abi:ne180100]();
      }
      uint64_t v9 = v8;
      p_shared_weak_owners = &v8->__shared_weak_owners_;
      atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v9);
      }
      unsigned int v11 = this[35];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 1174405120;
      handler[2] = ___ZN17BasebandTransport12timerOn_syncEv_block_invoke;
      handler[3] = &__block_descriptor_tmp_106;
      handler[4] = this;
      void handler[5] = v7;
      uint64_t v19 = v9;
      atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
      dispatch_source_set_event_handler(v11, handler);
      dispatch_activate(this[35]);
      int v12 = this[5];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = *((_DWORD *)this + 72);
        *(_DWORD *)std::string buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v13;
        _os_log_impl(&dword_2637D5000, v12, OS_LOG_TYPE_DEFAULT, "#I Status report enabled(%d sec)", buf, 8u);
      }
      if (((unsigned int (*)(char *, uint64_t))this[1]->isa)((char *)this + 8, 40))
      {
        ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"Status report enabled(%d sec)", v14, *((unsigned int *)this + 72));
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
        MEMORY[0x263E6A4D0](buf);
      }
      if (v19) {
        std::__shared_weak_count::__release_weak(v19);
      }
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  else
  {
    uint64_t v15 = (char *)(this + 1);
    uint64_t v16 = this[5];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl(&dword_2637D5000, v16, OS_LOG_TYPE_DEFAULT, "#I Invalid state for status report enable.  Ignoring enable request.", buf, 2u);
    }
    if ((**(unsigned int (***)(char *, uint64_t))v15)(v15, 40))
    {
      ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"Invalid state for status report enable.  Ignoring enable request.", v17);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x263E6A4D0](buf);
    }
  }
}

void BasebandTransport::dumpState(BasebandTransport *this, char a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 0x40000000;
  v2[2] = ___ZN17BasebandTransport9dumpStateEb_block_invoke;
  uint64_t v2[3] = &__block_descriptor_tmp_110;
  v2[4] = this;
  char v3 = a2;
  ctu::SharedSynchronizable<BasebandTransport>::execute_wrapped((uint64_t *)this + 9, (uint64_t)v2);
}

void *__copy_helper_block_e8_32r88c45_ZTSN8dispatch5blockIU13block_pointerFvPhjEEE(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  int64x2_t result = *(void **)(a2 + 88);
  if (result) {
    int64x2_t result = _Block_copy(result);
  }
  *(void *)(a1 + 88) = result;
  return result;
}

void __destroy_helper_block_e8_32r88c45_ZTSN8dispatch5blockIU13block_pointerFvPhjEEE(uint64_t a1)
{
  unsigned int v2 = *(const void **)(a1 + 88);
  if (v2) {
    _Block_release(v2);
  }
  char v3 = *(const void **)(a1 + 32);

  _Block_object_dispose(v3, 8);
}

BOOL BasebandTransport::write(BasebandTransport *this, const unsigned __int8 *a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v39 = 0;
  __int16 v40 = &v39;
  uint64_t v41 = 0x2000000000;
  char v42 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2000000000;
  uint64_t v38 = 0;
  dispatch_queue_t v7 = (char *)this + 72;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 1107296256;
  v34[2] = ___ZN17BasebandTransport5writeEPKhmPjbj_block_invoke;
  v34[3] = &__block_descriptor_tmp_55_0;
  v34[5] = &v39;
  v34[6] = this;
  v34[4] = &v35;
  char v44 = v34;
  blocuint64_t k = MEMORY[0x263EF8330];
  p_blocuint64_t k = 0x40000000;
  uint64_t v28 = (uint64_t)___ZNK3ctu20SharedSynchronizableI17BasebandTransportE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  uint64_t v29 = (__n128 (*)(void *, uint64_t))&__block_descriptor_tmp_128;
  long long v30 = (void (*)(uint64_t))((char *)this + 72);
  std::string __p = &v44;
  uint64_t v9 = (char *)this + 88;
  uint64_t v8 = *((void *)this + 11);
  if (*((void *)v9 + 1))
  {
    dispatch_async_and_wait(v8, &block);
    if (*((unsigned char *)v40 + 24)) {
      goto LABEL_3;
    }
LABEL_10:
    BOOL v14 = 0;
    goto LABEL_19;
  }
  dispatch_sync(v8, &block);
  if (!*((unsigned char *)v40 + 24)) {
    goto LABEL_10;
  }
LABEL_3:
  blocuint64_t k = 0;
  p_blocuint64_t k = (uint64_t)&block;
  uint64_t v28 = 0x4002000000;
  uint64_t v29 = __Block_byref_object_copy__0;
  long long v30 = __Block_byref_object_dispose__0;
  std::string __p = 0;
  int v32 = 0;
  uint64_t v33 = 0;
  uint64_t v22 = 0;
  int v23 = &v22;
  uint64_t v24 = 0x2000000000;
  int v25 = a2;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2000000000;
  uint64_t v21 = a3;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 1107296256;
  v17[2] = ___ZN17BasebandTransport5writeEPKhmPjbj_block_invoke_56;
  v17[3] = &__block_descriptor_tmp_57;
  v17[8] = a2;
  v17[9] = a3;
  v17[4] = &block;
  v17[5] = &v22;
  void v17[6] = &v18;
  v17[7] = this;
  uint64_t v43 = v17;
  char v44 = (void *)MEMORY[0x263EF8330];
  uint64_t v45 = 0x40000000;
  char v46 = ___ZNK3ctu20SharedSynchronizableI17BasebandTransportE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  uint64_t v47 = &__block_descriptor_tmp_128;
  uint64_t v48 = v7;
  uint64_t v49 = &v43;
  uint64_t v10 = *((void *)this + 11);
  if (*((void *)this + 12))
  {
    dispatch_async_and_wait(v10, &v44);
    if (v19[3]) {
      goto LABEL_5;
    }
  }
  else
  {
    dispatch_sync(v10, &v44);
    if (v19[3])
    {
LABEL_5:
      unsigned int v11 = (uint64_t (**)(void, uint64_t))v36[3];
      if (*v11)
      {
        int v12 = (*v11)(v11, v23[3]);
        *((unsigned char *)v40 + 24) = v12;
        if (v12)
        {
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 1107296256;
          void v16[2] = ___ZN17BasebandTransport5writeEPKhmPjbj_block_invoke_58;
          v16[3] = &__block_descriptor_tmp_60;
          v16[4] = &v18;
          v16[5] = this;
          uint64_t v43 = v16;
          char v44 = (void *)MEMORY[0x263EF8330];
          uint64_t v45 = 0x40000000;
          char v46 = ___ZNK3ctu20SharedSynchronizableI17BasebandTransportE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
          uint64_t v47 = &__block_descriptor_tmp_128;
          uint64_t v48 = v7;
          uint64_t v49 = &v43;
          int v13 = *((void *)this + 11);
          if (*((void *)this + 12)) {
            dispatch_async_and_wait(v13, &v44);
          }
          else {
            dispatch_sync(v13, &v44);
          }
          BOOL v14 = *((unsigned char *)v40 + 24) != 0;
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
        *((unsigned char *)v40 + 24) = 0;
      }
      goto LABEL_17;
    }
  }
  BOOL v14 = 1;
LABEL_17:
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&block, 8);
  if (__p)
  {
    int v32 = __p;
    operator delete(__p);
  }
LABEL_19:
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  return v14;
}

void sub_2637F5624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *__p,uint64_t a39)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  if (__p)
  {
    a39 = (uint64_t)__p;
    operator delete(__p);
  }
  _Block_object_dispose((const void *)(v39 - 232), 8);
  _Block_object_dispose((const void *)(v39 - 200), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN17BasebandTransport5writeEPKhmPjbj_block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  *(void *)(*(void *)(a1[4] + 8) + 24) = v2 + 176;
  char v3 = *(uint64_t (**)(void))(v2 + 232);
  if (v3)
  {
    uint64_t result = v3();
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  }
  else
  {
    uint64_t result = 0;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  }
  return result;
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
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

uint64_t (***___ZN17BasebandTransport5writeEPKhmPjbj_block_invoke_56(void *a1))(void, void, void, uint64_t)
{
  __n128 result = *(uint64_t (****)(void, void, void, uint64_t))(a1[7] + 128);
  if (result)
  {
    __n128 result = (uint64_t (***)(void, void, void, uint64_t))(**result)(result, a1[8], a1[9], *(void *)(a1[4] + 8) + 40);
    *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(*(void *)(a1[4] + 8) + 40);
    *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(*(void *)(a1[4] + 8) + 48)
                                                 - *(void *)(*(void *)(a1[4] + 8) + 40);
  }
  return result;
}

void __copy_helper_block_e8_32r40r48r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 8);
  long long v4 = *(const void **)(a2 + 48);

  _Block_object_assign((void *)(a1 + 48), v4, 8);
}

void __destroy_helper_block_e8_32r40r48r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 48), 8);
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  uint64_t v2 = *(const void **)(a1 + 32);

  _Block_object_dispose(v2, 8);
}

uint64_t ___ZN17BasebandTransport5writeEPKhmPjbj_block_invoke_58(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 344) + *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  *(void *)(v2 + 344) = v3;
  long long v4 = *(NSObject **)(v2 + 40);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    *(_DWORD *)std::string buf = 134218240;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = v3;
    _os_log_debug_impl(&dword_2637D5000, v4, OS_LOG_TYPE_DEBUG, "#D Written: %zu bytes, for a total of: %llu", buf, 0x16u);
  }
  uint64_t result = (**(uint64_t (***)(uint64_t, uint64_t))(v2 + 8))(v2 + 8, 20);
  if (result)
  {
    ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"Written: %zu bytes, for a total of: %llu", v6, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), *(void *)(v2 + 344));
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    return MEMORY[0x263E6A4D0](buf);
  }
  return result;
}

uint64_t BasebandTransport::read(BasebandTransport *this, unsigned __int8 *a2, unint64_t a3, unsigned int *a4)
{
  uint64_t v22 = 0;
  int v23 = &v22;
  uint64_t v24 = 0x2000000000;
  char v25 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2000000000;
  uint64_t v21 = 0;
  int v6 = (uint64_t *)((char *)this + 72);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 1107296256;
  v17[2] = ___ZN17BasebandTransport4readEPhmPjbj_block_invoke;
  v17[3] = &__block_descriptor_tmp_64_0;
  v17[5] = &v22;
  void v17[6] = this;
  v17[4] = &v18;
  int v26 = v17;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI17BasebandTransportE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_128;
  void block[4] = (char *)this + 72;
  void block[5] = &v26;
  uint64_t v8 = (char *)this + 88;
  uint64_t v7 = *((void *)this + 11);
  if (*((void *)v8 + 1))
  {
    dispatch_async_and_wait(v7, block);
    uint64_t v9 = v23;
    if (!*((unsigned char *)v23 + 24)) {
      goto LABEL_13;
    }
LABEL_5:
    uint64_t v10 = v19[3];
    if (v10 && (uint64_t v11 = *(uint64_t (**)(void))(v10 + 8)) != 0)
    {
      char v12 = v11();
      *((unsigned char *)v23 + 24) = v12;
      if (v12)
      {
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 0x40000000;
        void v16[2] = ___ZN17BasebandTransport4readEPhmPjbj_block_invoke_65;
        v16[3] = &__block_descriptor_tmp_66;
        v16[4] = this;
        v16[5] = a4;
        ctu::SharedSynchronizable<BasebandTransport>::execute_wrapped(v6, (uint64_t)v16);
        goto LABEL_13;
      }
      int v13 = *(void (**)(void))(v19[3] + 24);
      if (!v13) {
        goto LABEL_13;
      }
    }
    else
    {
      *((unsigned char *)v9 + 24) = 0;
      int v13 = *(void (**)(void))(v10 + 24);
      if (!v13) {
        goto LABEL_13;
      }
    }
    v13();
    goto LABEL_13;
  }
  dispatch_sync(v7, block);
  uint64_t v9 = v23;
  if (*((unsigned char *)v23 + 24)) {
    goto LABEL_5;
  }
LABEL_13:
  uint64_t v14 = *((unsigned __int8 *)v23 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return v14;
}

void sub_2637F5BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

uint64_t ___ZN17BasebandTransport4readEPhmPjbj_block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t result = v2 + 176;
  *(void *)(*(void *)(a1[4] + 8) + 24) = v2 + 176;
  long long v4 = *(uint64_t (**)(void))(v2 + 232);
  if (v4)
  {
    uint64_t result = v4();
    if (!result)
    {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
      if (!*(unsigned char *)(v2 + 332)) {
        return result;
      }
      goto LABEL_7;
    }
    LOBYTE(v4) = *(unsigned char *)(v2 + 332) == 0;
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = (_BYTE)v4;
  if (!*(unsigned char *)(v2 + 332)) {
    return result;
  }
LABEL_7:
  dispatch_time_t v5 = (uint64_t (***)(void, uint64_t))(v2 + 8);
  int v6 = *(NSObject **)(v2 + 40);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v8[0]) = 0;
    _os_log_error_impl(&dword_2637D5000, v6, OS_LOG_TYPE_ERROR, "Explicit reads not allowed in async mode", (uint8_t *)v8, 2u);
  }
  uint64_t result = (**v5)(v5, 80);
  if (result)
  {
    ctu::LogMessageBuffer::createWithFormat(v8, (ctu::LogMessageBuffer *)"Explicit reads not allowed in async mode", v7);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    return MEMORY[0x263E6A4D0](v8);
  }
  return result;
}

uint64_t ___ZN17BasebandTransport4readEPhmPjbj_block_invoke_65(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 336) += **(unsigned int **)(result + 40);
  return result;
}

uint64_t BasebandTransport::close(BasebandTransport *this)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000;
  char v13 = 1;
  *((_DWORD *)this + 72) = 0;
  uint64_t v2 = (char *)this + 72;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 0x40000000;
  v9[2] = ___ZN17BasebandTransport5closeEv_block_invoke;
  v9[3] = &__block_descriptor_tmp_67_0;
  v9[4] = this;
  uint64_t v14 = v9;
  blocuint64_t k = MEMORY[0x263EF8330];
  uint64_t v16 = 0x40000000;
  uint64_t v17 = ___ZNK3ctu20SharedSynchronizableI17BasebandTransportE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  uint64_t v18 = &__block_descriptor_tmp_128;
  uint64_t v19 = (char *)this + 72;
  uint64_t v20 = &v14;
  long long v4 = (char *)this + 88;
  uint64_t v3 = *((void *)this + 11);
  if (*((void *)v4 + 1)) {
    dispatch_async_and_wait(v3, &block);
  }
  else {
    dispatch_sync(v3, &block);
  }
  BasebandTransport::stopReader(this);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = ___ZN17BasebandTransport5closeEv_block_invoke_2;
  v8[3] = &__block_descriptor_tmp_70;
  v8[4] = &v10;
  v8[5] = this;
  uint64_t v14 = v8;
  blocuint64_t k = MEMORY[0x263EF8330];
  uint64_t v16 = 0x40000000;
  uint64_t v17 = ___ZNK3ctu20SharedSynchronizableI17BasebandTransportE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  uint64_t v18 = &__block_descriptor_tmp_128;
  uint64_t v19 = v2;
  uint64_t v20 = &v14;
  dispatch_time_t v5 = *((void *)this + 11);
  if (*((void *)this + 12)) {
    dispatch_async_and_wait(v5, &block);
  }
  else {
    dispatch_sync(v5, &block);
  }
  uint64_t v6 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

void sub_2637F5F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

NSObject *___ZN17BasebandTransport5closeEv_block_invoke(uint64_t a1)
{
  return BasebandTransport::timerOff_sync(*(BasebandTransport **)(a1 + 32));
}

uint64_t ___ZN17BasebandTransport5closeEv_block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 80))(*(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t BasebandTransport::operator*(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = ___ZN17BasebandTransportdeEv_block_invoke;
  v5[3] = &__block_descriptor_tmp_73;
  v5[4] = &v6;
  void v5[5] = a1;
  uint64_t v10 = v5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI17BasebandTransportE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_128;
  void block[4] = a1 + 72;
  void block[5] = &v10;
  uint64_t v2 = a1 + 88;
  uint64_t v1 = *(NSObject **)(a1 + 88);
  if (*(void *)(v2 + 8)) {
    dispatch_async_and_wait(v1, block);
  }
  else {
    dispatch_sync(v1, block);
  }
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t ___ZN17BasebandTransportdeEv_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(result + 40) + 176;
  return result;
}

uint64_t BasebandTransport::switchDIAG_sync(BasebandTransport *this)
{
  return 0;
}

uint64_t BasebandTransport::getIOSizeRx(BasebandTransport *this)
{
  return *((unsigned int *)this + 30);
}

uint64_t BasebandTransport::close_sync(BasebandTransport *this)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = (unsigned int (*)(char *))*((void *)this + 29);
  if (v2 && (uint64_t v3 = (_OWORD *)((char *)this + 176), v2((char *)this + 176)))
  {
    *((_DWORD *)this + 82) = 0;
    uint64_t v4 = TelephonyUtilTransportFree();
    _OWORD *v3 = 0u;
    *((_OWORD *)this + 12) = 0u;
    *((_OWORD *)this + 13) = 0u;
    *((_OWORD *)this + 14) = 0u;
    *((_OWORD *)this + 15) = 0u;
    *((void *)this + 32) = 0;
    dispatch_time_t v5 = (char *)this + 8;
    uint64_t v6 = *((void *)this + 5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v4 = 1;
    dispatch_time_t v5 = (char *)this + 8;
    uint64_t v6 = *((void *)this + 5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
  }
  switch(*((_DWORD *)this + 26))
  {
    case 0:
      char v14 = 3;
      LODWORD(__p[0]) = 4997712;
      break;
    case 1:
      char v14 = 3;
      LODWORD(__p[0]) = 4997715;
      break;
    case 2:
      char v14 = 4;
      int v7 = 1195460932;
      goto LABEL_28;
    case 3:
      char v14 = 4;
      int v7 = 1397114194;
      goto LABEL_28;
    case 4:
      char v14 = 5;
      strcpy((char *)__p, "QMUX1");
      break;
    case 5:
      char v14 = 5;
      strcpy((char *)__p, "QMUX2");
      break;
    case 6:
      char v14 = 3;
      LODWORD(__p[0]) = 5066578;
      break;
    case 7:
      char v14 = 4;
      int v7 = 1414483778;
      goto LABEL_28;
    case 8:
      char v14 = 3;
      LODWORD(__p[0]) = 4805185;
      break;
    case 9:
      char v14 = 3;
      LODWORD(__p[0]) = 5526611;
      break;
    case 0xA:
      char v14 = 2;
      strcpy((char *)__p, "AT");
      break;
    case 0xB:
      char v14 = 4;
      int v7 = 1280328769;
      goto LABEL_28;
    case 0xC:
      char v14 = 8;
      strcpy((char *)__p, "MEDIACTL");
      break;
    case 0xD:
      char v14 = 3;
      LODWORD(__p[0]) = 5461061;
      break;
    case 0xE:
      char v14 = 4;
      int v7 = 1397968455;
      goto LABEL_28;
    case 0xF:
      char v14 = 4;
      int v7 = 1397965905;
      goto LABEL_28;
    case 0x10:
      char v14 = 5;
      strcpy((char *)__p, "RCTTH");
      break;
    case 0x11:
      char v14 = 3;
      LODWORD(__p[0]) = 5260097;
      break;
    case 0x12:
      char v14 = 4;
      int v7 = 1297040214;
      goto LABEL_28;
    case 0x13:
      char v14 = 4;
      int v7 = 1129335117;
LABEL_28:
      LODWORD(__p[0]) = v7;
      BYTE4(__p[0]) = 0;
      break;
    case 0x14:
      char v14 = 3;
      LODWORD(__p[0]) = 4999236;
      break;
    case 0x15:
      char v14 = 3;
      LODWORD(__p[0]) = 5789005;
      break;
    case 0x16:
      char v14 = 3;
      LODWORD(__p[0]) = 4407622;
      break;
    default:
      char v14 = 7;
      strcpy((char *)__p, "Unknown");
      break;
  }
  uint64_t v8 = "error";
  if (v4) {
    uint64_t v8 = "success";
  }
  *(_DWORD *)std::string buf = 136315394;
  *(void *)&uint8_t buf[4] = __p;
  __int16 v16 = 2080;
  uint64_t v17 = v8;
  _os_log_impl(&dword_2637D5000, v6, OS_LOG_TYPE_DEFAULT, "#I Transport close %s: %s", buf, 0x16u);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
LABEL_33:
  if ((**(unsigned int (***)(char *, uint64_t))v5)(v5, 40))
  {
    switch(*((_DWORD *)this + 26))
    {
      case 0:
        char v18 = 3;
        strcpy(buf, "PBL");
        break;
      case 1:
        char v18 = 3;
        strcpy(buf, "SBL");
        break;
      case 2:
        char v18 = 4;
        int v10 = 1195460932;
        goto LABEL_59;
      case 3:
        char v18 = 4;
        int v10 = 1397114194;
        goto LABEL_59;
      case 4:
        char v18 = 5;
        strcpy(buf, "QMUX1");
        break;
      case 5:
        char v18 = 5;
        strcpy(buf, "QMUX2");
        break;
      case 6:
        char v18 = 3;
        strcpy(buf, "ROM");
        break;
      case 7:
        char v18 = 4;
        int v10 = 1414483778;
        goto LABEL_59;
      case 8:
        char v18 = 3;
        strcpy(buf, "ARI");
        break;
      case 9:
        char v18 = 3;
        strcpy(buf, "STT");
        break;
      case 0xA:
        char v18 = 2;
        strcpy(buf, "AT");
        break;
      case 0xB:
        char v18 = 4;
        int v10 = 1280328769;
        goto LABEL_59;
      case 0xC:
        char v18 = 8;
        strcpy(buf, "MEDIACTL");
        break;
      case 0xD:
        char v18 = 3;
        strcpy(buf, "ETS");
        break;
      case 0xE:
        char v18 = 4;
        int v10 = 1397968455;
        goto LABEL_59;
      case 0xF:
        char v18 = 4;
        int v10 = 1397965905;
        goto LABEL_59;
      case 0x10:
        char v18 = 5;
        strcpy(buf, "RCTTH");
        break;
      case 0x11:
        char v18 = 3;
        strcpy(buf, "ACP");
        break;
      case 0x12:
        char v18 = 4;
        int v10 = 1297040214;
        goto LABEL_59;
      case 0x13:
        char v18 = 4;
        int v10 = 1129335117;
LABEL_59:
        *(_DWORD *)std::string buf = v10;
        uint8_t buf[4] = 0;
        break;
      case 0x14:
        char v18 = 3;
        strcpy(buf, "DHL");
        break;
      case 0x15:
        char v18 = 3;
        strcpy(buf, "MUX");
        break;
      case 0x16:
        char v18 = 3;
        strcpy(buf, "FAC");
        break;
      default:
        char v18 = 7;
        strcpy(buf, "Unknown");
        break;
    }
    uint64_t v11 = "error";
    if (v4) {
      uint64_t v11 = "success";
    }
    ctu::LogMessageBuffer::createWithFormat((uint64_t *)__p, (ctu::LogMessageBuffer *)"Transport close %s: %s", v9, buf, v11);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x263E6A4D0](__p);
    if (v18 < 0) {
      operator delete(*(void **)buf);
    }
  }
  return v4;
}

uint64_t BasebandTransport::startReader_sync(NSObject **this)
{
  if (!this[37])
  {
    if (capabilities::abs::shouldUseMinBasebandTransportIOReadSize((capabilities::abs *)this)) {
      size_t v2 = 0x4000;
    }
    else {
      size_t v2 = 0x8000;
    }
    this[38] = v2;
    this[37] = operator new[](v2);
    dispatch_queue_t v3 = dispatch_queue_create("ipc.bb", 0);
    uint64_t v4 = this[39];
    this[39] = v3;
    if (v4) {
      dispatch_release(v4);
    }
  }
  *((unsigned char *)this + 292) = 1;
  *((unsigned char *)this + 332) = 1;
  BasebandTransport::queueRead_sync((BasebandTransport *)this);
  return *((unsigned __int8 *)this + 292);
}

void BasebandTransport::queueRead_sync(BasebandTransport *this)
{
  size_t v2 = (std::__shared_weak_count *)*((void *)this + 10);
  if (!v2 || (v3 = *((void *)this + 9), (uint64_t v4 = std::__shared_weak_count::lock(v2)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  dispatch_time_t v5 = v4;
  uint64_t v6 = *((void *)this + 40);
  if (v6)
  {
    dispatch_retain(*((dispatch_object_t *)this + 40));
    dispatch_group_enter(v6);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1174405120;
  v8[2] = ___ZN17BasebandTransport14queueRead_syncEv_block_invoke;
  v8[3] = &__block_descriptor_tmp_93;
  v8[4] = this;
  v8[5] = v3;
  uint64_t v9 = v5;
  atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  dispatch_group_t group = v6;
  if (v6)
  {
    dispatch_retain(v6);
    dispatch_group_enter(group);
  }
  dispatch_async(*((dispatch_queue_t *)this + 39), v8);
  if (group)
  {
    dispatch_group_leave(group);
    if (group) {
      dispatch_release(group);
    }
  }
  int v7 = v9;
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  if (v6)
  {
    dispatch_group_leave(v6);
    dispatch_release(v6);
  }
  if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
}

uint64_t ___ZN17BasebandTransport10stopReaderEv_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(v1 + 292);
  *(unsigned char *)(v1 + 292) = 0;
  *(unsigned char *)(v1 + 332) = 0;
  return result;
}

uint64_t ___ZN17BasebandTransport10stopReaderEv_block_invoke_86(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  size_t v2 = *(uint64_t (**)(uint64_t))(v1 + 232);
  if (v2)
  {
    uint64_t v3 = result;
    uint64_t result = v2(v1 + 176);
    if (result)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(v3 + 32) + 8) + 24))
      {
        uint64_t v4 = *(uint64_t (**)(uint64_t))(v1 + 192);
        if (v4)
        {
          return v4(v1 + 176);
        }
      }
    }
  }
  return result;
}

void ___ZN17BasebandTransport14queueRead_syncEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  size_t v2 = *(NSObject **)(a1 + 56);
  uint64_t v3 = v2;
  if (v2)
  {
    dispatch_retain(v2);
    dispatch_group_enter(v2);
  }
  BasebandTransport::read_sync(v1, &v3);
  if (v2)
  {
    dispatch_group_leave(v2);
    dispatch_release(v2);
  }
}

void sub_2637F6BE4(_Unwind_Exception *exception_object)
{
  if (v1)
  {
    dispatch_group_leave(v1);
    dispatch_release(v1);
  }
  _Unwind_Resume(exception_object);
}

void BasebandTransport::read_sync(uint64_t a1, NSObject **a2)
{
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 80);
  dispatch_time_t v5 = (uint64_t *)(a1 + 72);
  uint64_t v28 = v6;
  if (!v4
    || (uint64_t v8 = (capabilities::abs *)std::__shared_weak_count::lock(v4), (v29 = (std::__shared_weak_count *)v8) == 0))
  {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  int v27 = 0;
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *, void, uint64_t, void))(a1 + 184);
  if (v9)
  {
    int v10 = v8;
    uint64_t v11 = *(void *)(a1 + 296);
    uint64_t v12 = capabilities::abs::shouldUseMinBasebandTransportIOReadSize(v8) ? 0x4000 : 0x8000;
    int v13 = v9(a1 + 176, v11, v12, &v27, 0, 0xFFFFFFFFLL, 0);
    int v14 = v27 ? v13 : 0;
    if (v14 == 1)
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 0x40000000;
      void v25[2] = ___ZN17BasebandTransport9read_syncEN8dispatch13group_sessionE_block_invoke;
      void v25[3] = &__block_descriptor_tmp_94;
      v25[4] = a1;
      int v26 = v27;
      ctu::SharedSynchronizable<BasebandTransport>::execute_wrapped(v5, (uint64_t)v25);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 1174405120;
      block[2] = ___ZN17BasebandTransport9read_syncEN8dispatch13group_sessionE_block_invoke_2;
      block[3] = &__block_descriptor_tmp_97;
      void block[4] = a1;
      void block[5] = v6;
      uint64_t v22 = (std::__shared_weak_count *)v10;
      atomic_fetch_add_explicit((atomic_ullong *volatile)v10 + 1, 1uLL, memory_order_relaxed);
      uint64_t v15 = *a2;
      dispatch_group_t group = v15;
      if (v15)
      {
        dispatch_retain(v15);
        dispatch_group_enter(group);
      }
      int v24 = v27;
      dispatch_sync(*(dispatch_queue_t *)(a1 + 152), block);
      if (group)
      {
        dispatch_group_leave(group);
        if (group) {
          dispatch_release(group);
        }
      }
      __int16 v16 = v22;
      if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 1174405120;
  void v19[2] = ___ZN17BasebandTransport9read_syncEN8dispatch13group_sessionE_block_invoke_98;
  void v19[3] = &__block_descriptor_tmp_99;
  v19[4] = a1;
  v19[5] = v28;
  uint64_t v20 = v29;
  if (v29) {
    atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ctu::SharedSynchronizable<BasebandTransport>::execute_wrapped(v5, (uint64_t)v19);
  uint64_t v17 = v20;
  if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
  }
  char v18 = v29;
  if (v29)
  {
    if (!atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
}

void sub_2637F6F04(_Unwind_Exception *a1)
{
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100](v1 - 96);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_40c45_ZTSNSt3__110shared_ptrI17BasebandTransportEE56c30_ZTSN8dispatch13group_sessionE(void *a1, void *a2)
{
  uint64_t v3 = a2[6];
  a1[5] = a2[5];
  a1[6] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = a2[7];
  a1[7] = v4;
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_time_t v5 = a1[7];
    if (v5)
    {
      dispatch_group_enter(v5);
    }
  }
}

void __destroy_helper_block_e8_40c45_ZTSNSt3__110shared_ptrI17BasebandTransportEE56c30_ZTSN8dispatch13group_sessionE(uint64_t a1)
{
  size_t v2 = *(NSObject **)(a1 + 56);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *(NSObject **)(a1 + 56);
    if (v3) {
      dispatch_release(v3);
    }
  }
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 48);
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
}

uint64_t ___ZN17BasebandTransport9read_syncEN8dispatch13group_sessionE_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 336) += *(unsigned int *)(result + 40);
  return result;
}

void ___ZN17BasebandTransport9read_syncEN8dispatch13group_sessionE_block_invoke_2(uint64_t a1)
{
  size_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[16];
  if (v3)
  {
    std::string __p = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    (*(void (**)(uint64_t, void, void, void **))(*(void *)v3 + 8))(v3, v2[37], *(unsigned int *)(a1 + 64), &__p);
    (*(void (**)(void))(v2[18] + 16))();
    if (__p)
    {
      uint64_t v6 = __p;
      operator delete(__p);
    }
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(v2[18] + 16);
    v4();
  }
}

void sub_2637F7100(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BasebandTransport *___ZN17BasebandTransport9read_syncEN8dispatch13group_sessionE_block_invoke_98(uint64_t a1)
{
  uint64_t result = *(BasebandTransport **)(a1 + 32);
  if (*((unsigned char *)result + 292)) {
    return (BasebandTransport *)BasebandTransport::queueRead_sync(result);
  }
  return result;
}

uint64_t __copy_helper_block_e8_40c45_ZTSNSt3__110shared_ptrI17BasebandTransportEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c45_ZTSNSt3__110shared_ptrI17BasebandTransportEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZN17BasebandTransport12timerOn_syncEv_block_invoke(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (!v2) {
    return;
  }
  uint64_t v3 = a1[4];
  uint64_t v4 = std::__shared_weak_count::lock(v2);
  if (!v4) {
    return;
  }
  dispatch_time_t v5 = v4;
  uint64_t v6 = a1[5];
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v7 = (int *)(v3 + 328);
  uint64_t v8 = *(void *)(v3 + 336);
  uint64_t v9 = *(void *)(v3 + 376);
  uint64_t v10 = *(void *)(v3 + 344) - *(void *)(v3 + 384);
  *(void *)(v3 + 352) = v8 - v9;
  *(void *)(v3 + 360) = v10;
  if (v10) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v8 == v9;
  }
  if (v11)
  {
    int v12 = 3;
  }
  else
  {
    if (*v7 != 3) {
      goto LABEL_12;
    }
    int v12 = 1;
  }
  *uint64_t v7 = v12;
LABEL_12:
  long long v13 = *(_OWORD *)(v3 + 344);
  *(_OWORD *)(v3 + 368) = *(_OWORD *)v7;
  *(_OWORD *)(v3 + 384) = v13;
  *(void *)(v3 + 400) = *(void *)(v3 + 360);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZN17BasebandTransport12timerOn_syncEv_block_invoke_2;
  block[3] = &__block_descriptor_tmp_103;
  void block[4] = v3;
  void block[5] = v6;
  __int16 v16 = v4;
  atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  dispatch_async(*(dispatch_queue_t *)(v3 + 152), block);
  int v14 = v16;
  if (!v16 || atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
LABEL_14:
    if (atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
LABEL_17:
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
    return;
  }
  ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
  std::__shared_weak_count::__release_weak(v14);
  if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_17;
  }
}

uint64_t ___ZN17BasebandTransport12timerOn_syncEv_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 272);
  uint64_t v10 = *(void *)(v5 + 400);
  long long v7 = *(_OWORD *)(v5 + 384);
  v9[0] = *(_OWORD *)(v5 + 368);
  v9[1] = v7;
  return (*(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, v9, a3, a4, a5);
}

__n128 BasebandTransport::getStatus@<Q0>(BasebandTransport *this@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 32) = *((void *)this + 45);
  __n128 result = *(__n128 *)((char *)this + 328);
  long long v3 = *(_OWORD *)((char *)this + 344);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

void ___ZN17BasebandTransport9dumpStateEb_block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  *(int64x2_t *)(v2 + 352) = vsubq_s64(*(int64x2_t *)(v2 + 336), *(int64x2_t *)(v2 + 376));
  long long v3 = *(NSObject **)(v2 + 40);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BasebandTransport::Parameters::toString((BasebandTransport::Parameters *)(v2 + 104), __p);
    uint64_t v4 = v12 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)std::string buf = 136315138;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl(&dword_2637D5000, v3, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
    if (v12 < 0) {
      operator delete(__p[0]);
    }
  }
  if ((**(unsigned int (***)(uint64_t, uint64_t))(v2 + 8))(v2 + 8, 40)
    && ((BasebandTransport::Parameters::toString((BasebandTransport::Parameters *)(v2 + 104), buf), v14 >= 0)
      ? (uint64_t v6 = buf)
      : (uint64_t v6 = *(unsigned char **)buf),
        ctu::LogMessageBuffer::createWithFormat((uint64_t *)__p, (ctu::LogMessageBuffer *)"%s", v5, v6),
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog(),
        MEMORY[0x263E6A4D0](__p),
        v14 < 0))
  {
    operator delete(*(void **)buf);
    long long v7 = *(NSObject **)(v2 + 40);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
  }
  else
  {
    long long v7 = *(NSObject **)(v2 + 40);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
  }
  BasebandTransport::Status::toString((BasebandTransport::Status *)(v2 + 328), __p);
  if (v12 >= 0) {
    uint64_t v8 = __p;
  }
  else {
    uint64_t v8 = (void **)__p[0];
  }
  *(_DWORD *)std::string buf = 136315138;
  *(void *)&uint8_t buf[4] = v8;
  _os_log_impl(&dword_2637D5000, v7, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
LABEL_19:
  if ((**(unsigned int (***)(uint64_t, uint64_t))(v2 + 8))(v2 + 8, 40)
    && ((BasebandTransport::Status::toString((BasebandTransport::Status *)(v2 + 328), buf), v14 >= 0)
      ? (uint64_t v10 = buf)
      : (uint64_t v10 = *(unsigned char **)buf),
        ctu::LogMessageBuffer::createWithFormat((uint64_t *)__p, (ctu::LogMessageBuffer *)"%s", v9, v10),
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog(),
        MEMORY[0x263E6A4D0](__p),
        v14 < 0))
  {
    operator delete(*(void **)buf);
    if (!*(unsigned char *)(a1 + 40)) {
      return;
    }
  }
  else if (!*(unsigned char *)(a1 + 40))
  {
    return;
  }
  *(_DWORD *)(v2 + 328) = 0;
  *(unsigned char *)(v2 + 332) = 0;
  *(_OWORD *)(v2 + 376) = 0u;
  *(_OWORD *)(v2 + 392) = 0u;
  *(_OWORD *)(v2 + 336) = 0u;
  *(_OWORD *)(v2 + 352) = 0u;
  *(void *)(v2 + 365) = 0;
  BasebandTransport::timerOn_sync((dispatch_queue_t *)v2);
}

void sub_2637F76AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

void BasebandTransport::reportStatus(uint64_t a1, int a2, void **a3)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1174405120;
  v7[2] = ___ZN17BasebandTransport12reportStatusEjN8dispatch5blockIU13block_pointerFvNS_6StatusEEEE_block_invoke;
  v7[3] = &__block_descriptor_tmp_111;
  v7[4] = a1;
  int v9 = a2;
  uint64_t v4 = *a3;
  if (*a3) {
    uint64_t v4 = _Block_copy(v4);
  }
  aBlocuint64_t k = v4;
  uint64_t v10 = v7;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI17BasebandTransportE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_128;
  void block[4] = a1 + 72;
  void block[5] = &v10;
  uint64_t v5 = *(NSObject **)(a1 + 88);
  if (!*(void *)(a1 + 96))
  {
    dispatch_sync(v5, block);
    uint64_t v6 = aBlock;
    if (!aBlock) {
      return;
    }
    goto LABEL_7;
  }
  dispatch_async_and_wait(v5, block);
  uint64_t v6 = aBlock;
  if (aBlock) {
LABEL_7:
  }
    _Block_release(v6);
}

void ___ZN17BasebandTransport12reportStatusEjN8dispatch5blockIU13block_pointerFvNS_6StatusEEEE_block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  *(_DWORD *)(v3 + 288) = v1;
  if (v2) {
    uint64_t v2 = _Block_copy(v2);
  }
  uint64_t v4 = *(const void **)(v3 + 272);
  *(void *)(v3 + 272) = v2;
  if (v4) {
    _Block_release(v4);
  }

  BasebandTransport::timerOn_sync((dispatch_queue_t *)v3);
}

void *__copy_helper_block_e8_40c70_ZTSN8dispatch5blockIU13block_pointerFvN17BasebandTransport6StatusEEEE(uint64_t a1, uint64_t a2)
{
  __n128 result = *(void **)(a2 + 40);
  if (result) {
    __n128 result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c70_ZTSN8dispatch5blockIU13block_pointerFvN17BasebandTransport6StatusEEEE(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t ctu::Loggable<BasebandTransport,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x270F97428](a1 + 8);
}

double ctu::Loggable<BasebandTransport,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 16) = 0x600000000000000;
  double result = *(double *)"ipc.bb";
  *(_OWORD *)a1 = *(_OWORD *)"ipc.bb";
  return result;
}

uint64_t ctu::Loggable<BasebandTransport,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x270F978E0](a1 + 8);
}

void *ctu::Loggable<BasebandTransport,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_270EAFD10;
  MEMORY[0x263E6A470](a1 + 1);
  return a1;
}

void ctu::Loggable<BasebandTransport,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_270EAFD10;
  MEMORY[0x263E6A470](a1 + 1);

  operator delete(a1);
}

void ___ZL14sLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke(uint64_t a1)
{
  char v9 = 18;
  strcpy(__p, "baseband.transport");
  ctu::LogServer::create();
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = v10;
  long long v10 = 0uLL;
  uint64_t v4 = *(std::__shared_weak_count **)(v2 + 8);
  *(_OWORD *)uint64_t v2 = v3;
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  if (*((void *)&v10 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v10 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(**((void **)&v10 + 1) + 16))(*((void *)&v10 + 1));
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v10 + 1));
    if ((v9 & 0x80000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v9 < 0) {
LABEL_7:
  }
    operator delete(*(void **)__p);
LABEL_8:
  uint64_t v5 = (std::__shared_weak_count_vtbl *)operator new(8uLL);
  v5->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&unk_270EAFD50;
  *(void *)std::string __p = v5;
  uint64_t v6 = (std::__shared_weak_count *)operator new(0x20uLL);
  v6->__shared_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAFDB8;
  v6->__shared_weak_owners_ = 0;
  v6[1].__vftable = v5;
  *(void *)&__p[8] = v6;
  long long v7 = v6;
  atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  ctu::LogServer::addWriter();
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  ctu::LogServer::start(**(ctu::LogServer ***)(a1 + 32));
  ctu::LogServer::setEnabled(**(ctu::LogServer ***)(a1 + 32));
  if (*(void *)&__p[8])
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(*(void *)&__p[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(void))(**(void **)&__p[8] + 16))(*(void *)&__p[8]);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&__p[8]);
    }
  }
}

void sub_2637F7BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_2637F7BE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  operator delete(v16);
  _Unwind_Resume(a1);
}

void sub_2637F7C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<EmptyLogWriter *,std::shared_ptr<ctu::LogWriter>::__shared_ptr_default_delete<ctu::LogWriter,EmptyLogWriter>,std::allocator<EmptyLogWriter>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<EmptyLogWriter *,std::shared_ptr<ctu::LogWriter>::__shared_ptr_default_delete<ctu::LogWriter,EmptyLogWriter>,std::allocator<EmptyLogWriter>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<EmptyLogWriter *,std::shared_ptr<ctu::LogWriter>::__shared_ptr_default_delete<ctu::LogWriter,EmptyLogWriter>,std::allocator<EmptyLogWriter>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x8000000263808B87) {
    return a1 + 24;
  }
  if (((v3 & 0x8000000263808B87 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000263808B87)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000263808B87 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  v24[0] = 0xAAAAAAAAAAAAAAAALL;
  v24[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x263E6A8B0](v24, a1);
  if (LOBYTE(v24[0]))
  {
    uint64_t v6 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *((void *)v6 + 5);
    int v8 = *((_DWORD *)v6 + 2);
    int v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      char v12 = std::locale::use_facet(__b, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 32);
      std::locale::~locale(__b);
      *((_DWORD *)v6 + 36) = v9;
      uint64_t v10 = a2 + a3;
      if ((v8 & 0xB0) == 0x20) {
        uint64_t v11 = a2 + a3;
      }
      else {
        uint64_t v11 = a2;
      }
      if (!v7) {
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v10 = a2 + a3;
      if ((*((_DWORD *)v6 + 2) & 0xB0) == 0x20) {
        uint64_t v11 = a2 + a3;
      }
      else {
        uint64_t v11 = a2;
      }
      if (!v7) {
        goto LABEL_34;
      }
    }
    uint64_t v13 = *((void *)v6 + 3);
    BOOL v14 = v13 <= a3;
    size_t v15 = v13 - a3;
    if (v14) {
      size_t v16 = 0;
    }
    else {
      size_t v16 = v15;
    }
    if (v11 - a2 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, a2, v11 - a2) == v11 - a2)
    {
      if ((uint64_t)v16 >= 1)
      {
        memset(__b, 170, sizeof(__b));
        if (v16 >= 0x7FFFFFFFFFFFFFF8) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v16 >= 0x17)
        {
          uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v16 | 7) != 0x17) {
            uint64_t v18 = v16 | 7;
          }
          uint64_t v19 = v18 + 1;
          uint64_t v17 = (std::locale::__imp *)operator new(v18 + 1);
          __b[1].__locale_ = (std::locale::__imp *)v16;
          __b[2].__locale_ = (std::locale::__imp *)(v19 | 0x8000000000000000);
          __b[0].__locale_ = v17;
        }
        else
        {
          HIBYTE(__b[2].__locale_) = v16;
          uint64_t v17 = (std::locale::__imp *)__b;
        }
        memset(v17, v9, v16);
        *((unsigned char *)v17 + v16) = 0;
        if (SHIBYTE(__b[2].__locale_) >= 0) {
          locale = __b;
        }
        else {
          locale = __b[0].__locale_;
        }
        uint64_t v21 = (*(uint64_t (**)(uint64_t, void *, size_t))(*(void *)v7 + 96))(v7, locale, v16);
        uint64_t v22 = v21;
        if (SHIBYTE(__b[2].__locale_) < 0)
        {
          operator delete(__b[0].__locale_);
          if (v22 != v16) {
            goto LABEL_34;
          }
        }
        else if (v21 != v16)
        {
          goto LABEL_34;
        }
      }
      if (v10 - v11 < 1
        || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, v11, v10 - v11) == v10 - v11)
      {
        *((void *)v6 + 3) = 0;
        goto LABEL_35;
      }
    }
LABEL_34:
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
  }
LABEL_35:
  MEMORY[0x263E6A8C0](v24);
  return a1;
}

void sub_2637F7FE8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  MEMORY[0x263E6A8C0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2637F7FB8);
}

void sub_2637F8054(_Unwind_Exception *a1)
{
}

void ctu::SharedLoggable<BasebandTransport,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_270EAFD10;
  MEMORY[0x263E6A470](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

void ctu::Loggable<BasebandTransport,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync(uint64_t a1)
{
  uint64_t v1 = a1 + 56;
  if (*(void *)(a1 + 56))
  {
    if (!*(void *)(a1 + 80) || (uint64_t v2 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(a1 + 80))) == 0) {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    uint64_t v3 = v2;
    ctu::LoggerCommonBase::getLogDomain((ctu::LoggerCommonBase *)(v1 - 48));
    ctu::TrackedLogger::registerLoggerToServer();
    if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_2637F8268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_2637F8284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<BasebandTransportICE *,std::shared_ptr<BasebandTransportICE> ctu::SharedSynchronizable<BasebandTransport>::make_shared_ptr<BasebandTransportICE>(BasebandTransportICE*)::{lambda(BasebandTransportICE *)#1},std::allocator<BasebandTransportICE>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<BasebandTransportICE *,std::shared_ptr<BasebandTransportICE> ctu::SharedSynchronizable<BasebandTransport>::make_shared_ptr<BasebandTransportICE>(BasebandTransportICE*)::{lambda(BasebandTransportICE *)#1},std::allocator<BasebandTransportICE>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<BasebandTransportICE *,std::shared_ptr<BasebandTransportICE> ctu::SharedSynchronizable<BasebandTransport>::make_shared_ptr<BasebandTransportICE>(BasebandTransportICE*)::{lambda(BasebandTransportICE *)#1},std::allocator<BasebandTransportICE>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableI17BasebandTransportE15make_shared_ptrI20BasebandTransportICEEENSt3__11"
                     "0shared_ptrIT_EEPS7_EUlPS4_E_")
    return a1 + 24;
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableI17BasebandTransportE15make_shared_ptrI20BasebandTransportIC"
                                "EEENSt3__110shared_ptrIT_EEPS7_EUlPS4_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableI17BasebandTransportE15make_shared_ptrI20BasebandTransportICEEENSt3__110shared_ptrIT_EEPS7_EUlPS4_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableI17BasebandTransportE15make_shared_ptrI20BasebandTransportICEEENSt3__110shared_ptrIT_EEPS7_EUlPS4_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

uint64_t std::shared_ptr<BasebandTransportICE> ctu::SharedSynchronizable<BasebandTransport>::make_shared_ptr<BasebandTransportICE>(BasebandTransportICE*)::{lambda(BasebandTransportICE*)#1}::operator() const(BasebandTransportICE*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<BasebandTransport *,std::shared_ptr<BasebandTransport> ctu::SharedSynchronizable<BasebandTransport>::make_shared_ptr<BasebandTransport>(BasebandTransport*)::{lambda(BasebandTransport *)#1},std::allocator<BasebandTransport>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<BasebandTransport *,std::shared_ptr<BasebandTransport> ctu::SharedSynchronizable<BasebandTransport>::make_shared_ptr<BasebandTransport>(BasebandTransport*)::{lambda(BasebandTransport *)#1},std::allocator<BasebandTransport>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<BasebandTransport *,std::shared_ptr<BasebandTransport> ctu::SharedSynchronizable<BasebandTransport>::make_shared_ptr<BasebandTransport>(BasebandTransport*)::{lambda(BasebandTransport *)#1},std::allocator<BasebandTransport>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableI17BasebandTransportE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableI17BasebandTransportE15make_shared_ptrIS1_EENSt3__110shared_"
                                "ptrIT_EEPS6_EUlPS1_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableI17BasebandTransportE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableI17BasebandTransportE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

uint64_t std::shared_ptr<BasebandTransport> ctu::SharedSynchronizable<BasebandTransport>::make_shared_ptr<BasebandTransport>(BasebandTransport*)::{lambda(BasebandTransport*)#1}::operator() const(BasebandTransport*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void _ZZN8dispatch5asyncIZZZN17BasebandTransport4initEvEUb_EUb0_E3__0EEvP16dispatch_queue_sNSt3__110unique_ptrIT_NS5_14default_deleteIS7_EEEEENUlPvE_8__invokeESB_(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void (***)(const void *, _OWORD *, uint64_t, uint64_t, uint64_t))a1;
  long long v7 = *(_OWORD *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 40);
  v8[0] = *(_OWORD *)(a1 + 8);
  v8[1] = v7;
  v6[2](v6, v8, a3, a4, a5);
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  operator delete((void *)a1);
}

void sub_2637F84D0(_Unwind_Exception *a1)
{
  if (*v1) {
    _Block_release(*v1);
  }
  operator delete(v1);
  _Unwind_Resume(a1);
}

void _ZZN8dispatch5asyncIZZZN17BasebandTransport4initEvEUb_EUb1_E3__1EEvP16dispatch_queue_sNSt3__110unique_ptrIT_NS5_14default_deleteIS7_EEEEENUlPvE_8__invokeESB_(const void **a1)
{
  (*((void (**)(void))*a1 + 2))();
  uint64_t v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  if (*a1) {
    _Block_release(*a1);
  }

  operator delete(a1);
}

void sub_2637F8560(_Unwind_Exception *a1)
{
  unint64_t v3 = *(void **)(v1 + 8);
  if (v3)
  {
    *(void *)(v1 + 16) = v3;
    operator delete(v3);
  }
  if (*(void *)v1) {
    _Block_release(*(const void **)v1);
  }
  operator delete((void *)v1);
  _Unwind_Resume(a1);
}

void _ZZN8dispatch5asyncIZZZN17BasebandTransport4initEvEUb_EUb1_E3__2EEvP16dispatch_queue_sNSt3__110unique_ptrIT_NS5_14default_deleteIS7_EEEEENUlPvE_8__invokeESB_(void **a1)
{
  (*((void (**)(void))*a1 + 2))();
  if (!*((unsigned char *)a1 + 20))
  {
    free(a1[1]);
    uint64_t v2 = *a1;
    if (!*a1) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v2 = *a1;
  if (*a1) {
LABEL_5:
  }
    _Block_release(v2);
LABEL_6:

  operator delete(a1);
}

void sub_2637F8608(_Unwind_Exception *a1)
{
  if (*v1) {
    _Block_release(*v1);
  }
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *___ZNK3ctu20SharedSynchronizableI17BasebandTransportE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

void ctu::SharedSynchronizable<BasebandTransport>::execute_wrapped(uint64_t *a1, uint64_t a2)
{
  unint64_t v3 = (std::__shared_weak_count *)a1[1];
  if (!v3 || (uint64_t v5 = *a1, (v6 = std::__shared_weak_count::lock(v3)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  long long v7 = v6;
  int v8 = a1[2];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableI17BasebandTransportE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &__block_descriptor_tmp_129;
  void block[5] = v5;
  char v12 = v7;
  p_shared_owners = &v7->__shared_owners_;
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  void block[4] = a2;
  dispatch_async(v8, block);
  uint64_t v10 = v12;
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

uint64_t ___ZNK3ctu20SharedSynchronizableI17BasebandTransportE15execute_wrappedEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __copy_helper_block_e8_32b40c46_ZTSNSt3__110shared_ptrIK17BasebandTransportEE(void *a1, uint64_t a2)
{
  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 7);
  uint64_t v4 = *(void *)(a2 + 48);
  a1[5] = *(void *)(a2 + 40);
  a1[6] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
}

void __destroy_helper_block_e8_32b40c46_ZTSNSt3__110shared_ptrIK17BasebandTransportEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    unint64_t v3 = *(const void **)(a1 + 32);
  }
  else
  {
    unint64_t v3 = *(const void **)(a1 + 32);
  }
  _Block_object_dispose(v3, 7);
}

uint64_t support::fs::SyncFile::getLogClient(support::fs::SyncFile *this)
{
  return (uint64_t)this + 680;
}

void support::fs::SyncFile::create(uint64_t a1@<X0>, int a2@<W1>, size_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] >= 2uLL)
    {
      *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v21 = v9;
      long long v22 = v9;
      v20[1] = v9;
      v20[2] = v9;
      v20[0] = v9;
      uint64_t v18 = operator new(0x30uLL);
      long long v19 = xmmword_263807900;
      strcpy((char *)v18, "com.apple.telephony.basebandservices.support");
      char v17 = 8;
      strcpy((char *)__p, "syncfile");
      support::log::client::client(v20, (uint64_t)&v18, (uint64_t)__p);
      if (v17 < 0)
      {
        operator delete(__p[0]);
        if ((SHIBYTE(v19) & 0x80000000) == 0)
        {
LABEL_5:
          uint64_t v10 = *(NSObject **)v21;
          if (!os_log_type_enabled(*(os_log_t *)v21, OS_LOG_TYPE_ERROR)) {
            goto LABEL_6;
          }
          goto LABEL_19;
        }
      }
      else if ((SHIBYTE(v19) & 0x80000000) == 0)
      {
        goto LABEL_5;
      }
      operator delete(v18);
      uint64_t v10 = *(NSObject **)v21;
      if (!os_log_type_enabled(*(os_log_t *)v21, OS_LOG_TYPE_ERROR))
      {
LABEL_6:
        *a4 = 0;
        a4[1] = 0;
        *(void *)&v20[0] = &unk_270EAECE0;
        uint64_t v11 = (std::__shared_weak_count *)v22;
        if (!(void)v22) {
          return;
        }
        goto LABEL_7;
      }
LABEL_19:
      *(_DWORD *)std::string buf = 134217984;
      size_t v24 = a3;
      _os_log_error_impl(&dword_2637D5000, v10, OS_LOG_TYPE_ERROR, "error: buffer size provided (%lu) must be a power of two", buf, 0xCu);
      *a4 = 0;
      a4[1] = 0;
      *(void *)&v20[0] = &unk_270EAECE0;
      uint64_t v11 = (std::__shared_weak_count *)v22;
      if (!(void)v22) {
        return;
      }
LABEL_7:
      if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
      return;
    }
  }
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    if (*(unsigned char *)(a1 + 23)) {
      goto LABEL_11;
    }
LABEL_16:
    *a4 = 0;
    a4[1] = 0;
    return;
  }
  if (!*(void *)(a1 + 8)) {
    goto LABEL_16;
  }
LABEL_11:
  char v12 = operator new(0x2F8uLL);
  support::fs::SyncFile::SyncFile((uint64_t)v12, (long long *)a1, a2, a3);
  *a4 = v12;
  uint64_t v13 = (std::__shared_weak_count *)operator new(0x20uLL);
  v13->__shared_owners_ = 0;
  p_shared_owners = &v13->__shared_owners_;
  v13->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB01D8;
  v13->__shared_weak_owners_ = 0;
  v13[1].__vftable = (std::__shared_weak_count_vtbl *)v12;
  a4[1] = v13;
  size_t v15 = (std::__shared_weak_count *)*((void *)v12 + 2);
  if (v15)
  {
    if (v15->__shared_owners_ != -1) {
      return;
    }
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((void *)v12 + 1) = v12;
    *((void *)v12 + 2) = v13;
    std::__shared_weak_count::__release_weak(v15);
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
  }
  else
  {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((void *)v12 + 1) = v12;
    *((void *)v12 + 2) = v13;
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
  }
  ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);

  std::__shared_weak_count::__release_weak(v13);
}

void sub_2637F8C1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a2)
  {
    __cxa_begin_catch(exception_object);
    dispatch_barrier_async_f(v20[3], v20, (dispatch_function_t)std::shared_ptr<support::fs::SyncFile> ctu::SharedSynchronizable<support::fs::SyncFile>::make_shared_ptr<support::fs::SyncFile>(support::fs::SyncFile*)::{lambda(support::fs::SyncFile*)#1}::operator() const(support::fs::SyncFile*)::{lambda(void *)#1}::__invoke);
    __cxa_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t support::fs::SyncFile::SyncFile(uint64_t a1, long long *a2, int a3, size_t a4)
{
  uint8x8_t v8 = dispatch_queue_create("SyncFile", 0);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = v8;
  if (v8)
  {
    long long v9 = v8;
    dispatch_retain(v8);
    *(void *)(a1 + 32) = 0;
    dispatch_release(v9);
    *(void *)a1 = &unk_270EAFF70;
    uint64_t v10 = (std::string *)(a1 + 40);
    if ((*((char *)a2 + 23) & 0x80000000) == 0)
    {
LABEL_3:
      long long v11 = *a2;
      v10->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
      *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
      goto LABEL_6;
    }
  }
  else
  {
    *(void *)(a1 + 32) = 0;
    *(void *)a1 = &unk_270EAFF70;
    uint64_t v10 = (std::string *)(a1 + 40);
    if ((*((char *)a2 + 23) & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)a2, *((void *)a2 + 1));
LABEL_6:
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 64) = &unk_270EB0128;
  *(void *)(a1 + 496) = &unk_270EB0150;
  std::ios_base::init((std::ios_base *)(a1 + 496), (void *)(a1 + 88));
  *(void *)(a1 + 632) = 0;
  *(_DWORD *)(a1 + 640) = -1;
  MEMORY[0x263E6A830](a1 + 88);
  *(_DWORD *)(a1 + 648) = a3;
  *(void *)(a1 + 656) = 0;
  *(void *)(a1 + 672) = 0;
  *(void *)(a1 + 664) = 0;
  if (a4)
  {
    if ((a4 & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    char v12 = (char *)operator new(a4);
    *(void *)(a1 + 656) = v12;
    uint64_t v13 = &v12[a4];
    *(void *)(a1 + 672) = &v12[a4];
    bzero(v12, a4);
    *(void *)(a1 + 664) = v13;
  }
  char v17 = operator new(0x30uLL);
  long long v18 = xmmword_263807900;
  strcpy((char *)v17, "com.apple.telephony.basebandservices.support");
  char v16 = 8;
  strcpy((char *)__p, "syncfile");
  support::log::client::client((void *)(a1 + 680), (uint64_t)&v17, (uint64_t)__p);
  if (v16 < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v18) & 0x80000000) == 0)
    {
LABEL_11:
      if (*(void *)(a1 + 664) == *(void *)(a1 + 656)) {
        return a1;
      }
      goto LABEL_15;
    }
  }
  else if ((SHIBYTE(v18) & 0x80000000) == 0)
  {
    goto LABEL_11;
  }
  operator delete(v17);
  if (*(void *)(a1 + 664) != *(void *)(a1 + 656)) {
LABEL_15:
  }
    (*(void (**)(uint64_t))(*(void *)(a1 + 88) + 24))(a1 + 88);
  return a1;
}

void sub_2637F8F94(_Unwind_Exception *a1)
{
  ctu::SharedSynchronizable<HSFilerRT_Internal>::~SharedSynchronizable(v1);
  _Unwind_Resume(a1);
}

void sub_2637F8FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  support::log::client::~client(v25);
  int v27 = *v24;
  if (*v24)
  {
    *(void *)(v21 + 664) = v27;
    operator delete(v27);
  }
  std::fstream::~fstream(v23);
  if (*(char *)(v21 + 63) < 0) {
    operator delete(*v22);
  }
  ctu::SharedSynchronizable<HSFilerRT_Internal>::~SharedSynchronizable(v20);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::fstream::~fstream(void (__cdecl ***a1)(std::fstream *__hidden this)))(std::fstream *__hidden this)
{
  uint64_t v2 = a1 + 54;
  MEMORY[0x263E6A840](a1 + 3);
  std::iostream::~basic_iostream();
  MEMORY[0x263E6A9F0](v2);
  return a1;
}

void support::fs::SyncFile::open(support::fs::SyncFile *this)
{
  v1[0] = MEMORY[0x263EF8330];
  v1[1] = 0x40000000;
  v1[2] = ___ZN7support2fs8SyncFile4openEv_block_invoke;
  v1[3] = &__block_descriptor_tmp_3;
  v1[4] = this;
  ctu::SharedSynchronizable<support::fs::SyncFile>::execute_wrapped((uint64_t *)this + 1, (uint64_t)v1);
}

void ___ZN7support2fs8SyncFile4openEv_block_invoke(uint64_t a1)
{
}

void support::fs::SyncFile::open_sync(support::fs::SyncFile *this)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = **((void **)this + 91);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    unint64_t v3 = (void *)((char *)this + 40);
    if (*((char *)this + 63) < 0) {
      unint64_t v3 = (void *)*v3;
    }
    int v8 = 136315138;
    long long v9 = v3;
    _os_log_impl(&dword_2637D5000, v2, OS_LOG_TYPE_INFO, "Opening file '%s'", (uint8_t *)&v8, 0xCu);
  }
  if (*((void *)this + 26))
  {
    uint64_t v4 = **((void **)this + 91);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = (void *)((char *)this + 40);
      if (*((char *)this + 63) < 0) {
        uint64_t v5 = (void *)*v5;
      }
      int v8 = 136315138;
      long long v9 = v5;
      _os_log_impl(&dword_2637D5000, v4, OS_LOG_TYPE_INFO, "Skipped open, file '%s' is already open", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = std::filebuf::open();
    long long v7 = (std::ios_base *)((char *)this + *(void *)(*((void *)this + 8) - 24) + 64);
    if (v6) {
      std::ios_base::clear(v7, 0);
    }
    else {
      std::ios_base::clear(v7, v7->__rdstate_ | 4);
    }
  }
}

void support::fs::SyncFile::close(support::fs::SyncFile *this)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = ___ZN7support2fs8SyncFile5closeEv_block_invoke;
  v3[3] = &__block_descriptor_tmp_4_0;
  v3[4] = this;
  uint64_t v4 = v3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableIN7support2fs8SyncFileEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS9__block_invoke;
  block[3] = &__block_descriptor_tmp_20;
  void block[4] = (char *)this + 8;
  void block[5] = &v4;
  uint64_t v2 = (char *)this + 24;
  uint64_t v1 = *((void *)this + 3);
  if (*((void *)v2 + 1)) {
    dispatch_async_and_wait(v1, block);
  }
  else {
    dispatch_sync(v1, block);
  }
}

void ___ZN7support2fs8SyncFile5closeEv_block_invoke(uint64_t a1)
{
}

void support::fs::SyncFile::close_sync(support::fs::SyncFile *this)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = **((void **)this + 91);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    unint64_t v3 = (void *)((char *)this + 40);
    if (*((char *)this + 63) < 0) {
      unint64_t v3 = (void *)*v3;
    }
    int v7 = 136315138;
    int v8 = v3;
    _os_log_impl(&dword_2637D5000, v2, OS_LOG_TYPE_INFO, "Closing file '%s'", (uint8_t *)&v7, 0xCu);
  }
  if (*((void *)this + 26))
  {
    support::fs::SyncFile::flush_sync(this);
    if (!std::filebuf::close())
    {
      uint64_t v4 = (std::ios_base *)((char *)this + *(void *)(*((void *)this + 8) - 24) + 64);
      std::ios_base::clear(v4, v4->__rdstate_ | 4);
    }
  }
  else
  {
    uint64_t v5 = **((void **)this + 91);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = (void *)((char *)this + 40);
      if (*((char *)this + 63) < 0) {
        uint64_t v6 = (void *)*v6;
      }
      int v7 = 136315138;
      int v8 = v6;
      _os_log_impl(&dword_2637D5000, v5, OS_LOG_TYPE_INFO, "Skipped close, file '%s' is not open", (uint8_t *)&v7, 0xCu);
    }
  }
}

void support::fs::SyncFile::flush_sync(support::fs::SyncFile *this)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = **((void **)this + 91);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    unint64_t v3 = (void *)((char *)this + 40);
    if (*((char *)this + 63) < 0) {
      unint64_t v3 = (void *)*v3;
    }
    int v6 = 136315138;
    int v7 = v3;
    _os_log_impl(&dword_2637D5000, v2, OS_LOG_TYPE_INFO, "Flushing file '%s'", (uint8_t *)&v6, 0xCu);
  }
  if (*((void *)this + 26))
  {
    std::ostream::flush();
  }
  else
  {
    uint64_t v4 = **((void **)this + 91);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = (void *)((char *)this + 40);
      if (*((char *)this + 63) < 0) {
        uint64_t v5 = (void *)*v5;
      }
      int v6 = 136315138;
      int v7 = v5;
      _os_log_impl(&dword_2637D5000, v4, OS_LOG_TYPE_INFO, "Skipped flush, file '%s' is not open", (uint8_t *)&v6, 0xCu);
    }
  }
}

BOOL support::fs::SyncFile::isOpen(support::fs::SyncFile *this)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  void v4[2] = ___ZNK7support2fs8SyncFile6isOpenEv_block_invoke;
  uint64_t v4[3] = &__block_descriptor_tmp_6;
  v4[4] = this;
  uint64_t v5 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 0x40000000;
  v6[2] = ___ZNK3ctu20SharedSynchronizableIN7support2fs8SyncFileEE20execute_wrapped_syncIU13block_pointerFbvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  v6[3] = &__block_descriptor_tmp_21;
  v6[4] = (char *)this + 8;
  v6[5] = &v5;
  int v7 = v6;
  uint64_t v2 = (char *)this + 24;
  uint64_t v1 = *((void *)this + 3);
  if (*((void *)v2 + 1))
  {
    char v14 = -86;
    blocuint64_t k = MEMORY[0x263EF8330];
    uint64_t v9 = 0x40000000;
    uint64_t v10 = ___ZN8dispatch19async_and_wait_implIRU13block_pointerFbvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS4_17integral_constantIbLb0EEE_block_invoke;
    long long v11 = &__block_descriptor_tmp_23;
    char v12 = &v14;
    uint64_t v13 = &v7;
    dispatch_async_and_wait(v1, &block);
  }
  else
  {
    char v14 = -86;
    blocuint64_t k = MEMORY[0x263EF8330];
    uint64_t v9 = 0x40000000;
    uint64_t v10 = ___ZN8dispatch9sync_implIRU13block_pointerFbvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS4_17integral_constantIbLb0EEE_block_invoke;
    long long v11 = &__block_descriptor_tmp_22;
    char v12 = &v14;
    uint64_t v13 = &v7;
    dispatch_sync(v1, &block);
  }
  return v14 != 0;
}

BOOL ___ZNK7support2fs8SyncFile6isOpenEv_block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 208) != 0;
}

BOOL support::fs::SyncFile::isOpen_sync(support::fs::SyncFile *this)
{
  return *((void *)this + 26) != 0;
}

void support::fs::SyncFile::~SyncFile(void **this)
{
  *this = &unk_270EAFF70;
  support::fs::SyncFile::close_sync((support::fs::SyncFile *)this);
  this[85] = &unk_270EAECE0;
  uint64_t v2 = (std::__shared_weak_count *)this[93];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  unint64_t v3 = this[82];
  if (v3)
  {
    this[83] = v3;
    operator delete(v3);
  }
  MEMORY[0x263E6A840](this + 11);
  std::iostream::~basic_iostream();
  MEMORY[0x263E6A9F0](this + 62);
  if (*((char *)this + 63) < 0) {
    operator delete(this[5]);
  }
  uint64_t v4 = this[4];
  if (v4) {
    dispatch_release(v4);
  }
  uint64_t v5 = this[3];
  if (v5) {
    dispatch_release(v5);
  }
  int v6 = (std::__shared_weak_count *)this[2];
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
}

{
  void *v1;
  uint64_t vars8;

  support::fs::SyncFile::~SyncFile(this);

  operator delete(v1);
}

uint64_t support::fs::SyncFile::getPath(support::fs::SyncFile *this)
{
  return (uint64_t)this + 40;
}

void support::fs::SyncFile::flush(support::fs::SyncFile *this)
{
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 2);
  if (!v2 || (v3 = *((void *)this + 1), (uint64_t v4 = std::__shared_weak_count::lock(v2)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v5 = v4;
  int v6 = operator new(8uLL);
  void *v6 = this;
  int v7 = *((void *)this + 3);
  atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v8 = operator new(0x18uLL);
  *uint64_t v8 = v6;
  v8[1] = v3;
  _OWORD v8[2] = v5;
  dispatch_async_f(v7, v8, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<support::fs::SyncFile>::execute_wrapped<support::fs::SyncFile::flush(void)::$_0>(support::fs::SyncFile::flush(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<support::fs::SyncFile::flush(void)::$_0,dispatch_queue_s *::default_delete<support::fs::SyncFile::flush(void)::$_0>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
}

BOOL support::fs::SyncFile::write_sync(support::fs::SyncFile *this, const void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *((void *)this + 26);
  if (v3)
  {
    std::ostream::write();
  }
  else
  {
    uint64_t v4 = **((void **)this + 91);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = (void *)((char *)this + 40);
      if (*((char *)this + 63) < 0) {
        int v6 = (void *)*v6;
      }
      int v7 = 136315138;
      uint64_t v8 = v6;
      _os_log_error_impl(&dword_2637D5000, v4, OS_LOG_TYPE_ERROR, "error: Failed to write, file '%s' is not open", (uint8_t *)&v7, 0xCu);
    }
  }
  return v3 != 0;
}

void sub_2637F9BA4(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

BOOL support::fs::SyncFile::write(support::fs::SyncFile *this, const void *a2, uint64_t a3)
{
  v6[0] = this;
  v6[1] = a2;
  v6[2] = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK3ctu20SharedSynchronizableIN7support2fs8SyncFileEE20execute_wrapped_syncIZNS3_5writeEPKvmE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS9__block_invoke;
  v7[3] = &__block_descriptor_tmp_24;
  v7[4] = (char *)this + 8;
  void v7[5] = v6;
  uint64_t v8 = v7;
  uint64_t v4 = (char *)this + 24;
  uint64_t v3 = *((void *)this + 3);
  if (*((void *)v4 + 1))
  {
    char v15 = -86;
    blocuint64_t k = MEMORY[0x263EF8330];
    uint64_t v10 = 0x40000000;
    long long v11 = ___ZN8dispatch19async_and_wait_implIRU13block_pointerFbvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS4_17integral_constantIbLb0EEE_block_invoke;
    char v12 = &__block_descriptor_tmp_23;
    uint64_t v13 = &v15;
    char v14 = &v8;
    dispatch_async_and_wait(v3, &block);
  }
  else
  {
    char v15 = -86;
    blocuint64_t k = MEMORY[0x263EF8330];
    uint64_t v10 = 0x40000000;
    long long v11 = ___ZN8dispatch9sync_implIRU13block_pointerFbvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS4_17integral_constantIbLb0EEE_block_invoke;
    char v12 = &__block_descriptor_tmp_22;
    uint64_t v13 = &v15;
    char v14 = &v8;
    dispatch_sync(v3, &block);
  }
  return v15 != 0;
}

BOOL support::fs::SyncFile::read_sync(support::fs::SyncFile *this, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *((void *)this + 26);
  if (v3)
  {
    std::istream::read();
  }
  else
  {
    uint64_t v4 = **((void **)this + 91);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = (void *)((char *)this + 40);
      if (*((char *)this + 63) < 0) {
        int v6 = (void *)*v6;
      }
      int v7 = 136315138;
      uint64_t v8 = v6;
      _os_log_error_impl(&dword_2637D5000, v4, OS_LOG_TYPE_ERROR, "error: Failed to read, file '%s' is not open", (uint8_t *)&v7, 0xCu);
    }
  }
  return v3 != 0;
}

void sub_2637F9DD8(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

BOOL support::fs::SyncFile::read(support::fs::SyncFile *this, void *a2, uint64_t a3)
{
  v6[0] = this;
  v6[1] = a2;
  v6[2] = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK3ctu20SharedSynchronizableIN7support2fs8SyncFileEE20execute_wrapped_syncIZNS3_4readEPvmE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  v7[3] = &__block_descriptor_tmp_25;
  v7[4] = (char *)this + 8;
  void v7[5] = v6;
  uint64_t v8 = v7;
  uint64_t v4 = (char *)this + 24;
  uint64_t v3 = *((void *)this + 3);
  if (*((void *)v4 + 1))
  {
    char v15 = -86;
    blocuint64_t k = MEMORY[0x263EF8330];
    uint64_t v10 = 0x40000000;
    long long v11 = ___ZN8dispatch19async_and_wait_implIRU13block_pointerFbvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS4_17integral_constantIbLb0EEE_block_invoke;
    char v12 = &__block_descriptor_tmp_23;
    uint64_t v13 = &v15;
    char v14 = &v8;
    dispatch_async_and_wait(v3, &block);
  }
  else
  {
    char v15 = -86;
    blocuint64_t k = MEMORY[0x263EF8330];
    uint64_t v10 = 0x40000000;
    long long v11 = ___ZN8dispatch9sync_implIRU13block_pointerFbvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS4_17integral_constantIbLb0EEE_block_invoke;
    char v12 = &__block_descriptor_tmp_22;
    uint64_t v13 = &v15;
    char v14 = &v8;
    dispatch_sync(v3, &block);
  }
  return v15 != 0;
}

uint64_t support::fs::SyncFile::getSize(support::fs::SyncFile *this)
{
  v4[0] = this;
  v4[1] = &v5;
  uint64_t v5 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 0x40000000;
  v6[2] = ___ZNK3ctu20SharedSynchronizableIN7support2fs8SyncFileEE20execute_wrapped_syncIZNS3_7getSizeEvE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  void v6[3] = &__block_descriptor_tmp_26;
  v6[4] = (char *)this + 8;
  v6[5] = v4;
  int v7 = v6;
  uint64_t v2 = (char *)this + 24;
  uint64_t v1 = *((void *)this + 3);
  if (*((void *)v2 + 1))
  {
    unsigned __int8 v14 = -86;
    blocuint64_t k = MEMORY[0x263EF8330];
    uint64_t v9 = 0x40000000;
    uint64_t v10 = ___ZN8dispatch19async_and_wait_implIRU13block_pointerFbvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS4_17integral_constantIbLb0EEE_block_invoke;
    long long v11 = &__block_descriptor_tmp_23;
    char v12 = &v14;
    uint64_t v13 = &v7;
    dispatch_async_and_wait(v1, &block);
  }
  else
  {
    unsigned __int8 v14 = -86;
    blocuint64_t k = MEMORY[0x263EF8330];
    uint64_t v9 = 0x40000000;
    uint64_t v10 = ___ZN8dispatch9sync_implIRU13block_pointerFbvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS4_17integral_constantIbLb0EEE_block_invoke;
    long long v11 = &__block_descriptor_tmp_22;
    char v12 = &v14;
    uint64_t v13 = &v7;
    dispatch_sync(v1, &block);
  }
  return v14;
}

void non-virtual thunk to'std::fstream::~fstream(void (__cdecl ***a1)(std::fstream *__hidden this))
{
  MEMORY[0x263E6A840](a1 + 1);
  std::iostream::~basic_iostream();

  JUMPOUT(0x263E6A9F0);
}

{
  void (__cdecl ***v1)(std::fstream *__hidden);
  void *v2;
  uint64_t vars8;

  uint64_t v1 = a1 - 2;
  uint64_t v2 = a1 + 52;
  MEMORY[0x263E6A840](a1 + 1);
  std::iostream::~basic_iostream();
  MEMORY[0x263E6A9F0](v2);

  operator delete(v1);
}

void virtual thunk to'std::fstream::~fstream(void *a1)
{
  uint64_t v1 = (void (__cdecl ***)(std::fstream *__hidden))((char *)a1 + *(void *)(*a1 - 24));
  MEMORY[0x263E6A840](v1 + 3);
  std::iostream::~basic_iostream();

  JUMPOUT(0x263E6A9F0);
}

{
  void (__cdecl ***v1)(std::fstream *__hidden);
  uint64_t vars8;

  uint64_t v1 = (void (__cdecl ***)(std::fstream *__hidden))((char *)a1 + *(void *)(*a1 - 24));
  MEMORY[0x263E6A840](v1 + 3);
  std::iostream::~basic_iostream();
  MEMORY[0x263E6A9F0](v1 + 54);

  operator delete(v1);
}

void std::fstream::~fstream(void (__cdecl ***a1)(std::fstream *__hidden this))
{
  uint64_t v2 = a1 + 54;
  MEMORY[0x263E6A840](a1 + 3);
  std::iostream::~basic_iostream();
  MEMORY[0x263E6A9F0](v2);

  operator delete(a1);
}

void std::__shared_ptr_pointer<support::fs::SyncFile *,std::shared_ptr<support::fs::SyncFile> ctu::SharedSynchronizable<support::fs::SyncFile>::make_shared_ptr<support::fs::SyncFile>(support::fs::SyncFile*)::{lambda(support::fs::SyncFile *)#1},std::allocator<support::fs::SyncFile>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<support::fs::SyncFile *,std::shared_ptr<support::fs::SyncFile> ctu::SharedSynchronizable<support::fs::SyncFile>::make_shared_ptr<support::fs::SyncFile>(support::fs::SyncFile*)::{lambda(support::fs::SyncFile *)#1},std::allocator<support::fs::SyncFile>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<support::fs::SyncFile *,std::shared_ptr<support::fs::SyncFile> ctu::SharedSynchronizable<support::fs::SyncFile>::make_shared_ptr<support::fs::SyncFile>(support::fs::SyncFile*)::{lambda(support::fs::SyncFile *)#1},std::allocator<support::fs::SyncFile>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableIN7support2fs8SyncFileEE15make_shared_ptrIS3_EENSt3__110shared_ptrIT_EEPS8_EUlPS3_E_") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableIN7support2fs8SyncFileEE15make_shared_ptrIS3_EENSt3__110shar"
                                "ed_ptrIT_EEPS8_EUlPS3_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableIN7support2fs8SyncFileEE15make_shared_ptrIS3_EENSt3__110shared_ptrIT_EEPS8_EUlPS3_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableIN7support2fs8SyncFileEE15make_shared_ptrIS3_EENSt3__110shared_ptrIT_EEPS8_EUlPS3_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

uint64_t std::shared_ptr<support::fs::SyncFile> ctu::SharedSynchronizable<support::fs::SyncFile>::make_shared_ptr<support::fs::SyncFile>(support::fs::SyncFile*)::{lambda(support::fs::SyncFile*)#1}::operator() const(support::fs::SyncFile*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void ctu::SharedSynchronizable<support::fs::SyncFile>::execute_wrapped(uint64_t *a1, uint64_t a2)
{
  unint64_t v3 = (std::__shared_weak_count *)a1[1];
  if (!v3 || (uint64_t v5 = *a1, (v6 = std::__shared_weak_count::lock(v3)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  int v7 = v6;
  uint64_t v8 = a1[2];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableIN7support2fs8SyncFileEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &__block_descriptor_tmp_18_0;
  void block[5] = v5;
  char v12 = v7;
  p_shared_owners = &v7->__shared_owners_;
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  void block[4] = a2;
  dispatch_async(v8, block);
  uint64_t v10 = v12;
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

uint64_t ___ZNK3ctu20SharedSynchronizableIN7support2fs8SyncFileEE15execute_wrappedEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __copy_helper_block_e8_32b40c49_ZTSNSt3__110shared_ptrIKN7support2fs8SyncFileEEE(void *a1, uint64_t a2)
{
  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 7);
  uint64_t v4 = *(void *)(a2 + 48);
  a1[5] = *(void *)(a2 + 40);
  a1[6] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
}

void __destroy_helper_block_e8_32b40c49_ZTSNSt3__110shared_ptrIKN7support2fs8SyncFileEEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    unint64_t v3 = *(const void **)(a1 + 32);
  }
  else
  {
    unint64_t v3 = *(const void **)(a1 + 32);
  }
  _Block_object_dispose(v3, 7);
}

void *___ZNK3ctu20SharedSynchronizableIN7support2fs8SyncFileEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS9__block_invoke(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

void *___ZNK3ctu20SharedSynchronizableIN7support2fs8SyncFileEE20execute_wrapped_syncIU13block_pointerFbvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke(uint64_t a1)
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

void dispatch::async<void ctu::SharedSynchronizable<support::fs::SyncFile>::execute_wrapped<support::fs::SyncFile::flush(void)::$_0>(support::fs::SyncFile::flush(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<support::fs::SyncFile::flush(void)::$_0,dispatch_queue_s *::default_delete<support::fs::SyncFile::flush(void)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t a1)
{
  uint64_t v2 = *(support::fs::SyncFile ***)a1;
  support::fs::SyncFile::flush_sync(**(support::fs::SyncFile ***)a1);
  operator delete(v2);
  unint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    uint64_t v4 = (void *)a1;
  }
  else
  {
    uint64_t v4 = (void *)a1;
  }
  operator delete(v4);
}

void sub_2637FA8A8(_Unwind_Exception *a1)
{
  operator delete(v2);
  uint64_t v4 = (std::__shared_weak_count *)v1[2];
  if (v4)
  {
    if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL ___ZNK3ctu20SharedSynchronizableIN7support2fs8SyncFileEE20execute_wrapped_syncIZNS3_5writeEPKvmE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS9__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(uint64_t **)(a1 + 40);
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 208);
  if (v3)
  {
    std::ostream::write();
  }
  else
  {
    uint64_t v4 = **(NSObject ***)(v2 + 728);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = (void *)(v2 + 40);
      if (*(char *)(v2 + 63) < 0) {
        int v6 = (void *)*v6;
      }
      int v7 = 136315138;
      uint64_t v8 = v6;
      _os_log_error_impl(&dword_2637D5000, v4, OS_LOG_TYPE_ERROR, "error: Failed to write, file '%s' is not open", (uint8_t *)&v7, 0xCu);
    }
  }
  return v3 != 0;
}

void sub_2637FA9EC(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

BOOL ___ZNK3ctu20SharedSynchronizableIN7support2fs8SyncFileEE20execute_wrapped_syncIZNS3_4readEPvmE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(uint64_t **)(a1 + 40);
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 208);
  if (v3)
  {
    std::istream::read();
  }
  else
  {
    uint64_t v4 = **(NSObject ***)(v2 + 728);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = (void *)(v2 + 40);
      if (*(char *)(v2 + 63) < 0) {
        int v6 = (void *)*v6;
      }
      int v7 = 136315138;
      uint64_t v8 = v6;
      _os_log_error_impl(&dword_2637D5000, v4, OS_LOG_TYPE_ERROR, "error: Failed to read, file '%s' is not open", (uint8_t *)&v7, 0xCu);
    }
  }
  return v3 != 0;
}

void sub_2637FAAD8(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

BOOL ___ZNK3ctu20SharedSynchronizableIN7support2fs8SyncFileEE20execute_wrapped_syncIZNS3_7getSizeEvE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(uint64_t **)(a1 + 40);
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 208);
  if (v3)
  {
    unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v14 = v4;
    long long v15 = v4;
    long long v12 = v4;
    long long v13 = v4;
    long long v10 = v4;
    long long v11 = v4;
    *(_OWORD *)std::string buf = v4;
    long long v9 = v4;
    std::istream::tellg();
    std::istream::seekg();
    std::istream::tellg();
    std::istream::seekg();
    std::istream::tellg();
    *(void *)v1[1] = 0;
    std::istream::seekg();
  }
  else
  {
    uint64_t v5 = **(NSObject ***)(v2 + 728);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = (void *)(v2 + 40);
      if (*(char *)(v2 + 63) < 0) {
        int v7 = (void *)*v7;
      }
      *(_DWORD *)std::string buf = 136315138;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_error_impl(&dword_2637D5000, v5, OS_LOG_TYPE_ERROR, "error: Failed to get file size, %s is not open", buf, 0xCu);
    }
  }
  return v3 != 0;
}

uint64_t __cxx_global_var_init_5()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>::~PthreadMutexGuardPolicy, &ctu::Singleton<support::log::shared_stdio,support::log::shared_stdio,ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>>::sInstance, &dword_2637D5000);
  }
  return result;
}

{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<support::log::buffer>::~PthreadMutexGuardPolicy, &ctu::Singleton<support::log::buffer,support::log::buffer,ctu::PthreadMutexGuardPolicy<support::log::buffer>>::sInstance, &dword_2637D5000);
  }
  return result;
}

void *support::log::delegate::context::create@<X0>(support::log::delegate::context *this@<X0>, void *a2@<X8>)
{
  *a2 = 0xAAAAAAAAAAAAAAAALL;
  a2[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = operator new(0x10uLL);
  *uint64_t v5 = &unk_270EB0258;
  v5[1] = this;
  *a2 = v5;
  uint64_t result = operator new(0x20uLL);
  *uint64_t result = &unk_270EB0450;
  result[1] = 0;
  result[2] = 0;
  result[3] = v5;
  a2[1] = result;
  return result;
}

void sub_2637FAD44(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *support::log::delegate::context::context(void *this, void *a2)
{
  *this = &unk_270EB0258;
  this[1] = a2;
  return this;
}

{
  *this = &unk_270EB0258;
  this[1] = a2;
  return this;
}

uint64_t support::log::delegate::delegate(uint64_t result, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  *(void *)uint64_t result = &unk_270EB0278;
  *(void *)(result + 8) = v3;
  *(void *)(result + 16) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  *(unsigned char *)(result + 24) = 1;
  return result;
}

uint64_t support::log::delegate::get_context@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)a2 = 0;
  *(unsigned char *)(a2 + 16) = 0;
  if (*(unsigned char *)(this + 24))
  {
    uint64_t v2 = *(void *)(this + 16);
    *(void *)a2 = *(void *)(this + 8);
    *(void *)(a2 + 8) = v2;
    if (v2) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
    }
    *(unsigned char *)(a2 + 16) = 1;
  }
  return this;
}

uint64_t support::log::manager::parameters::parameters(uint64_t result, char a2)
{
  *(void *)uint64_t result = &unk_270EB02A8;
  *(unsigned char *)(result + 8) = a2;
  return result;
}

{
  *(void *)uint64_t result = &unk_270EB02A8;
  *(unsigned char *)(result + 8) = a2;
  return result;
}

uint64_t support::log::manager::parameters::parameters(uint64_t this)
{
  *(void *)this = &unk_270EB02A8;
  *(unsigned char *)(this + 8) = 3;
  return this;
}

{
  *(void *)this = &unk_270EB02A8;
  *(unsigned char *)(this + 8) = 3;
  return this;
}

uint64_t support::log::manager::parameters::set_defaults(uint64_t this)
{
  *(unsigned char *)(this + 8) = 3;
  return this;
}

uint64_t support::log::manager::manager(uint64_t a1, std::string *a2, uint64_t a3, void *a4)
{
  *(void *)a1 = &unk_270EB02C0;
  *(void *)(a1 + 8) = 850045863;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 64) = 0;
  std::string v18 = *a2;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  a2->__r_.__value_.__r.__words[0] = 0;
  char v17 = 12;
  strcpy(__s, ".log_manager");
  int v7 = std::string::append(&v18, __s, 0xCuLL);
  uint64_t v8 = (const char *)(a1 + 72);
  long long v9 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  *(void *)(a1 + 88) = *((void *)&v7->__r_.__value_.__l + 2);
  *(_OWORD *)(a1 + 72) = v9;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = 0;
  if ((v17 & 0x80000000) == 0)
  {
    if ((SHIBYTE(v18.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_3;
    }
LABEL_8:
    operator delete(v18.__r_.__value_.__l.__data_);
    if ((*(char *)(a1 + 95) & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  operator delete(*(void **)__s);
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_8;
  }
LABEL_3:
  if ((*(char *)(a1 + 95) & 0x80000000) == 0) {
    goto LABEL_4;
  }
LABEL_9:
  uint64_t v8 = *(const char **)v8;
LABEL_4:
  *(void *)(a1 + 96) = os_log_create("com.apple.telephony.basebandservices", v8);
  *(void *)(a1 + 104) = &unk_270EB02A8;
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a3 + 8);
  *(void *)(a1 + 120) = a1 + 120;
  *(void *)(a1 + 128) = a1 + 120;
  *(void *)(a1 + 136) = 0;
  uint64_t v10 = a4[2];
  if (v10)
  {
    uint64_t v12 = *a4;
    long long v11 = (uint64_t *)a4[1];
    uint64_t v13 = *v11;
    *(void *)(v13 + 8) = *(void *)(*a4 + 8);
    **(void **)(v12 + 8) = v13;
    uint64_t v14 = *(void *)(a1 + 120);
    *(void *)(v14 + 8) = v11;
    *long long v11 = v14;
    *(void *)(a1 + 120) = v12;
    *(void *)(v12 + 8) = a1 + 120;
    *(void *)(a1 + 136) = v10;
    a4[2] = 0;
  }
  return a1;
}

void sub_2637FB054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0)
    {
LABEL_3:
      std::mutex::~mutex(v21);
      _Unwind_Resume(a1);
    }
  }
  else if ((a21 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a16);
  std::mutex::~mutex(v21);
  _Unwind_Resume(a1);
}

uint64_t support::log::manager::manager(uint64_t a1, std::string *a2, uint64_t a3, uint64_t *a4)
{
  std::string __p = *a2;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  a2->__r_.__value_.__r.__words[0] = 0;
  uint64_t v15 = (uint64_t)&v15;
  unint64_t v16 = &v15;
  uint64_t v17 = 0;
  support::log::manager::manager(a1, &__p, a3, &v15);
  if (v17)
  {
    uint64_t v6 = v15;
    int v7 = v16;
    uint64_t v8 = *v16;
    *(void *)(v8 + 8) = *(void *)(v15 + 8);
    **(void **)(v6 + 8) = v8;
    uint64_t v17 = 0;
    if (v7 != &v15)
    {
      do
      {
        uint64_t v10 = (uint64_t *)v7[1];
        uint64_t v9 = v7[2];
        v7[2] = 0;
        if (v9) {
          (*(void (**)(uint64_t))(*(void *)v9 + 16))(v9);
        }
        operator delete(v7);
        int v7 = v10;
      }
      while (v10 != &v15);
    }
  }
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (!*a4) {
      return a1;
    }
    goto LABEL_10;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (*a4)
  {
LABEL_10:
    std::mutex::lock((std::mutex *)(a1 + 8));
    long long v11 = operator new(0x18uLL);
    uint64_t v12 = *a4;
    *a4 = 0;
    uint64_t v13 = *(void *)(a1 + 120);
    v11[1] = a1 + 120;
    v11[2] = v12;
    *long long v11 = v13;
    *(void *)(v13 + 8) = v11;
    *(void *)(a1 + 120) = v11;
    ++*(void *)(a1 + 136);
    std::mutex::unlock((std::mutex *)(a1 + 8));
  }
  return a1;
}

{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  std::string __p;

  std::string __p = *a2;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  a2->__r_.__value_.__r.__words[0] = 0;
  uint64_t v15 = (uint64_t)&v15;
  unint64_t v16 = &v15;
  uint64_t v17 = 0;
  support::log::manager::manager(a1, &__p, a3, &v15);
  if (v17)
  {
    uint64_t v6 = v15;
    int v7 = v16;
    uint64_t v8 = *v16;
    *(void *)(v8 + 8) = *(void *)(v15 + 8);
    **(void **)(v6 + 8) = v8;
    uint64_t v17 = 0;
    if (v7 != &v15)
    {
      do
      {
        uint64_t v10 = (uint64_t *)v7[1];
        uint64_t v9 = v7[2];
        v7[2] = 0;
        if (v9) {
          (*(void (**)(uint64_t))(*(void *)v9 + 16))(v9);
        }
        operator delete(v7);
        int v7 = v10;
      }
      while (v10 != &v15);
    }
  }
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (!*a4) {
      return a1;
    }
    goto LABEL_10;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (*a4)
  {
LABEL_10:
    std::mutex::lock((std::mutex *)(a1 + 8));
    long long v11 = operator new(0x18uLL);
    uint64_t v12 = *a4;
    *a4 = 0;
    uint64_t v13 = *(void *)(a1 + 120);
    v11[1] = a1 + 120;
    v11[2] = v12;
    *long long v11 = v13;
    *(void *)(v13 + 8) = v11;
    *(void *)(a1 + 120) = v11;
    ++*(void *)(a1 + 136);
    std::mutex::unlock((std::mutex *)(a1 + 8));
  }
  return a1;
}

void sub_2637FB1F8(_Unwind_Exception *a1)
{
  std::mutex::unlock(v2);
  support::log::manager::~manager(v1);
  _Unwind_Resume(a1);
}

void sub_2637FB21C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t *std::list<std::unique_ptr<support::log::delegate>>::~list(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        int v7 = (uint64_t *)v3[1];
        uint64_t v6 = v3[2];
        v3[2] = 0;
        if (v6) {
          (*(void (**)(uint64_t))(*(void *)v6 + 16))(v6);
        }
        operator delete(v3);
        uint64_t v3 = v7;
      }
      while (v7 != a1);
    }
  }
  return a1;
}

void support::log::manager::add_delegate(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = (void *)a1;
  uint64_t v4 = (std::mutex *)(a1 + 8);
  std::mutex::lock((std::mutex *)(a1 + 8));
  uint64_t v5 = operator new(0x18uLL);
  uint64_t v6 = *a2;
  *a2 = 0;
  uint64_t v7 = v3[15];
  v3 += 15;
  v5[1] = v3;
  v5[2] = v6;
  *uint64_t v5 = v7;
  *(void *)(v7 + 8) = v5;
  void *v3 = v5;
  ++v3[2];

  std::mutex::unlock(v4);
}

void sub_2637FB35C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void support::log::manager::~manager(support::log::manager *this)
{
  *(void *)this = &unk_270EB02C0;
  if (*((void *)this + 17))
  {
    uint64_t v2 = (char *)this + 120;
    uint64_t v3 = *((void *)this + 15);
    uint64_t v4 = (char *)*((void *)this + 16);
    uint64_t v5 = *(void *)v4;
    *(void *)(v5 + 8) = *(void *)(v3 + 8);
    **(void **)(v3 + 8) = v5;
    *((void *)this + 17) = 0;
    if (v4 != (char *)this + 120)
    {
      do
      {
        uint64_t v7 = (char *)*((void *)v4 + 1);
        uint64_t v6 = *((void *)v4 + 2);
        *((void *)v4 + 2) = 0;
        if (v6) {
          (*(void (**)(uint64_t))(*(void *)v6 + 16))(v6);
        }
        operator delete(v4);
        uint64_t v4 = v7;
      }
      while (v7 != v2);
    }
  }
  if (*((char *)this + 95) < 0) {
    operator delete(*((void **)this + 9));
  }
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
}

{
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;

  *(void *)this = &unk_270EB02C0;
  if (*((void *)this + 17))
  {
    uint64_t v2 = (char *)this + 120;
    uint64_t v3 = *((void *)this + 15);
    uint64_t v4 = (char *)*((void *)this + 16);
    uint64_t v5 = *(void *)v4;
    *(void *)(v5 + 8) = *(void *)(v3 + 8);
    **(void **)(v3 + 8) = v5;
    *((void *)this + 17) = 0;
    if (v4 != (char *)this + 120)
    {
      do
      {
        uint64_t v7 = (char *)*((void *)v4 + 1);
        uint64_t v6 = *((void *)v4 + 2);
        *((void *)v4 + 2) = 0;
        if (v6) {
          (*(void (**)(uint64_t))(*(void *)v6 + 16))(v6);
        }
        operator delete(v4);
        uint64_t v4 = v7;
      }
      while (v7 != v2);
    }
  }
  if (*((char *)this + 95) < 0) {
    operator delete(*((void **)this + 9));
  }
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
}

{
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t vars8;

  *(void *)this = &unk_270EB02C0;
  if (*((void *)this + 17))
  {
    uint64_t v2 = (char *)this + 120;
    uint64_t v3 = *((void *)this + 15);
    uint64_t v4 = (char *)*((void *)this + 16);
    uint64_t v5 = *(void *)v4;
    *(void *)(v5 + 8) = *(void *)(v3 + 8);
    **(void **)(v3 + 8) = v5;
    *((void *)this + 17) = 0;
    if (v4 != (char *)this + 120)
    {
      do
      {
        uint64_t v7 = (char *)*((void *)v4 + 1);
        uint64_t v6 = *((void *)v4 + 2);
        *((void *)v4 + 2) = 0;
        if (v6) {
          (*(void (**)(uint64_t))(*(void *)v6 + 16))(v6);
        }
        operator delete(v4);
        uint64_t v4 = v7;
      }
      while (v7 != v2);
    }
  }
  if (*((char *)this + 95) < 0) {
    operator delete(*((void **)this + 9));
  }
  std::mutex::~mutex((std::mutex *)((char *)this + 8));

  operator delete(this);
}

void sub_2637FB59C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v2);
  support::log::manager::~manager(v1);
  _Unwind_Resume(a1);
}

void sub_2637FB5C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void support::log::manager::create(std::string *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  *a4 = 0xAAAAAAAAAAAAAAAALL;
  a4[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v8 = operator new(0x90uLL);
  std::string __p = *a1;
  a1->__r_.__value_.__r.__words[0] = 0;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  support::log::manager::manager((uint64_t)v8, &__p, a2, a3);
  *a4 = v8;
  uint64_t v9 = operator new(0x20uLL);
  *uint64_t v9 = &unk_270EB0538;
  v9[1] = 0;
  _OWORD v9[2] = 0;
  v9[3] = v8;
  a4[1] = v9;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    uint64_t v10 = (void *)__p.__r_.__value_.__r.__words[0];
    operator delete(v10);
  }
}

void sub_2637FB7A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void support::log::manager::create(std::string *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  *a4 = 0xAAAAAAAAAAAAAAAALL;
  a4[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v8 = operator new(0x90uLL);
  std::string __p = *a1;
  a1->__r_.__value_.__r.__words[0] = 0;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  support::log::manager::manager((uint64_t)v8, &__p, a2, a3);
  *a4 = v8;
  uint64_t v9 = operator new(0x20uLL);
  *uint64_t v9 = &unk_270EB0538;
  v9[1] = 0;
  _OWORD v9[2] = 0;
  v9[3] = v8;
  a4[1] = v9;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    uint64_t v10 = (void *)__p.__r_.__value_.__r.__words[0];
    operator delete(v10);
  }
}

void sub_2637FB8F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t support::log::manager::get_level(support::log::manager *this)
{
  return *((unsigned __int8 *)this + 112);
}

void support::log::manager::set_level(uint64_t a1, unsigned int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = (std::mutex *)(a1 + 8);
  std::mutex::lock((std::mutex *)(a1 + 8));
  uint64_t v5 = *(NSObject **)(a1 + 96);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = *(unsigned __int8 *)(a1 + 112);
    if (v6 > 6)
    {
      uint64_t v7 = "???";
      if (a2 > 6) {
        goto LABEL_4;
      }
    }
    else
    {
      if (a2 > 6)
      {
LABEL_4:
        uint64_t v8 = "???";
LABEL_7:
        int v9 = 136315394;
        uint64_t v10 = v7;
        __int16 v11 = 2080;
        uint64_t v12 = v8;
        _os_log_impl(&dword_2637D5000, v5, OS_LOG_TYPE_DEFAULT, "setting log level %s -> %s", (uint8_t *)&v9, 0x16u);
        goto LABEL_8;
      }
    }
    goto LABEL_7;
  }
LABEL_8:
  *(unsigned char *)(a1 + 112) = a2;
  std::mutex::unlock(v4);
}

uint64_t support::log::buffer::borrow(support::log::buffer *this)
{
  pthread_mutex_lock(&ctu::Singleton<support::log::buffer,support::log::buffer,ctu::PthreadMutexGuardPolicy<support::log::buffer>>::sInstance);
  if (!qword_26A99F8D0)
  {
    uint64_t v1 = (char *)operator new(0xA8uLL);
    *((void *)v1 + 1) = 0;
    *((void *)v1 + 2) = 0;
    *(void *)uint64_t v1 = &unk_270EB04A0;
    uint64_t v2 = (uint64_t)(v1 + 24);
    *((void *)v1 + 3) = &unk_270EB04F0;
    *((void *)v1 + 4) = 850045863;
    *(_OWORD *)(v1 + 40) = 0u;
    *(_OWORD *)(v1 + 56) = 0u;
    *(_OWORD *)(v1 + 72) = 0u;
    *((void *)v1 + 14) = 0;
    *((void *)v1 + 13) = 0;
    *((void *)v1 + 11) = 0;
    *((void *)v1 + 12) = v1 + 104;
    *(_OWORD *)(v1 + 120) = 0u;
    *(_OWORD *)(v1 + 136) = 0u;
    *(_OWORD *)(v1 + 152) = 0u;
    uint64_t v3 = (std::__shared_weak_count *)off_26A99F8D8;
    qword_26A99F8D0 = (uint64_t)(v1 + 24);
    off_26A99F8D8 = v1;
    if (!v3)
    {
      std::string v18 = (std::__shared_weak_count *)v1;
      goto LABEL_8;
    }
    if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  uint64_t v2 = qword_26A99F8D0;
  uint64_t v1 = (char *)off_26A99F8D8;
  std::string v18 = (std::__shared_weak_count *)off_26A99F8D8;
  if (off_26A99F8D8) {
LABEL_8:
  }
    atomic_fetch_add_explicit((atomic_ullong *volatile)v1 + 1, 1uLL, memory_order_relaxed);
  pthread_mutex_unlock(&ctu::Singleton<support::log::buffer,support::log::buffer,ctu::PthreadMutexGuardPolicy<support::log::buffer>>::sInstance);
  std::mutex::lock((std::mutex *)(v2 + 8));
  uint64_t v4 = *(void *)(v2 + 136);
  if (v4)
  {
    uint64_t v5 = (void *)(v2 + 128);
    unint64_t v6 = *(void ***)(v2 + 104);
    uint64_t v7 = (*(void **)((char *)v6 + ((*(void *)(v2 + 128) >> 6) & 0x3FFFFFFFFFFFFF8)))[*(void *)(v2 + 128) & 0x1FFLL];
    unint64_t v8 = *(void *)(v2 + 128) + 1;
    *(void *)(v2 + 128) = v8;
    *(void *)(v2 + 136) = v4 - 1;
    if (v8 >= 0x400)
    {
      operator delete(*v6);
      *(void *)(v2 + 104) += 8;
      uint64_t v9 = -512;
LABEL_23:
      *v5 += v9;
    }
  }
  else
  {
    uint64_t v10 = malloc(0x400uLL);
    uint64_t v7 = (uint64_t)v10;
    if (v10)
    {
      uint64_t v12 = (uint64_t **)(v2 + 80);
      __int16 v11 = *(uint64_t **)(v2 + 80);
      if (!v11)
      {
        uint64_t v13 = (uint64_t **)(v2 + 80);
LABEL_20:
        uint64_t v15 = (uint64_t *)operator new(0x28uLL);
        v15[4] = v7;
        uint64_t *v15 = 0;
        v15[1] = 0;
        v15[2] = (uint64_t)v13;
        *uint64_t v12 = v15;
        uint64_t v16 = **(void **)(v2 + 72);
        if (v16)
        {
          *(void *)(v2 + 72) = v16;
          uint64_t v15 = *v12;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v2 + 80), v15);
        uint64_t v5 = (void *)(v2 + 88);
        uint64_t v9 = 1;
        goto LABEL_23;
      }
      while (1)
      {
        while (1)
        {
          uint64_t v13 = (uint64_t **)v11;
          unint64_t v14 = v11[4];
          if ((unint64_t)v10 >= v14) {
            break;
          }
          __int16 v11 = *v13;
          uint64_t v12 = v13;
          if (!*v13) {
            goto LABEL_20;
          }
        }
        if (v14 >= (unint64_t)v10) {
          break;
        }
        __int16 v11 = v13[1];
        if (!v11)
        {
          uint64_t v12 = v13 + 1;
          goto LABEL_20;
        }
      }
    }
  }
  std::mutex::unlock((std::mutex *)(v2 + 8));
  if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
  return v7;
}

void sub_2637FBD10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::mutex::unlock(v9);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_2637FBD2C(_Unwind_Exception *a1)
{
}

void sub_2637FBD48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void support::log::manager::release_log_buffer(support::log::manager *this, char *a2)
{
  pthread_mutex_lock(&ctu::Singleton<support::log::buffer,support::log::buffer,ctu::PthreadMutexGuardPolicy<support::log::buffer>>::sInstance);
  if (qword_26A99F8D0) {
    goto LABEL_2;
  }
  uint64_t v3 = (char *)operator new(0xA8uLL);
  *((void *)v3 + 1) = 0;
  *((void *)v3 + 2) = 0;
  *(void *)uint64_t v3 = &unk_270EB04A0;
  uint64_t v4 = (uint64_t)(v3 + 24);
  *((void *)v3 + 3) = &unk_270EB04F0;
  *((void *)v3 + 4) = 850045863;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_OWORD *)(v3 + 72) = 0u;
  *((void *)v3 + 14) = 0;
  *((void *)v3 + 13) = 0;
  *((void *)v3 + 11) = 0;
  *((void *)v3 + 12) = v3 + 104;
  *(_OWORD *)(v3 + 120) = 0u;
  *(_OWORD *)(v3 + 136) = 0u;
  *(_OWORD *)(v3 + 152) = 0u;
  uint64_t v5 = (std::__shared_weak_count *)off_26A99F8D8;
  qword_26A99F8D0 = (uint64_t)(v3 + 24);
  off_26A99F8D8 = v3;
  if (v5)
  {
    if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
LABEL_2:
    uint64_t v4 = qword_26A99F8D0;
    uint64_t v3 = (char *)off_26A99F8D8;
    if (!off_26A99F8D8) {
      goto LABEL_8;
    }
  }
  atomic_fetch_add_explicit((atomic_ullong *volatile)v3 + 1, 1uLL, memory_order_relaxed);
LABEL_8:
  pthread_mutex_unlock(&ctu::Singleton<support::log::buffer,support::log::buffer,ctu::PthreadMutexGuardPolicy<support::log::buffer>>::sInstance);
  unint64_t v8 = *(void **)(v4 + 80);
  uint64_t v7 = v4 + 80;
  unint64_t v6 = v8;
  if (!v8) {
    goto LABEL_19;
  }
  uint64_t v9 = (void *)v7;
  do
  {
    unint64_t v10 = v6[4];
    BOOL v11 = v10 >= (unint64_t)a2;
    if (v10 >= (unint64_t)a2) {
      uint64_t v12 = v6;
    }
    else {
      uint64_t v12 = v6 + 1;
    }
    if (v11) {
      uint64_t v9 = v6;
    }
    unint64_t v6 = (void *)*v12;
  }
  while (*v12);
  if (v9 == (void *)v7 || v9[4] > (unint64_t)a2) {
LABEL_19:
  }
    uint64_t v9 = (void *)v7;
  if (!v3 || atomic_fetch_add((atomic_ullong *volatile)v3 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (v9 != (void *)v7) {
      goto LABEL_23;
    }
LABEL_27:
    free(a2);
    return;
  }
  (*(void (**)(char *))(*(void *)v3 + 16))(v3);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v3);
  if (v9 == (void *)v7) {
    goto LABEL_27;
  }
LABEL_23:
  pthread_mutex_lock(&ctu::Singleton<support::log::buffer,support::log::buffer,ctu::PthreadMutexGuardPolicy<support::log::buffer>>::sInstance);
  if (!qword_26A99F8D0)
  {
    uint64_t v13 = (char *)operator new(0xA8uLL);
    *((void *)v13 + 1) = 0;
    *((void *)v13 + 2) = 0;
    *(void *)uint64_t v13 = &unk_270EB04A0;
    *((void *)v13 + 3) = &unk_270EB04F0;
    *((void *)v13 + 4) = 850045863;
    *(_OWORD *)(v13 + 40) = 0u;
    *(_OWORD *)(v13 + 56) = 0u;
    *(_OWORD *)(v13 + 72) = 0u;
    *((void *)v13 + 14) = 0;
    *((void *)v13 + 13) = 0;
    *((void *)v13 + 11) = 0;
    *((void *)v13 + 12) = v13 + 104;
    *(_OWORD *)(v13 + 120) = 0u;
    *(_OWORD *)(v13 + 136) = 0u;
    *(_OWORD *)(v13 + 152) = 0u;
    unint64_t v14 = (std::__shared_weak_count *)off_26A99F8D8;
    qword_26A99F8D0 = (uint64_t)(v13 + 24);
    off_26A99F8D8 = v13;
    if (!v14)
    {
      v135 = (std::__shared_weak_count *)v13;
      goto LABEL_34;
    }
    if (!atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  uint64_t v13 = (char *)off_26A99F8D8;
  v135 = (std::__shared_weak_count *)off_26A99F8D8;
  if (off_26A99F8D8) {
LABEL_34:
  }
    atomic_fetch_add_explicit((atomic_ullong *volatile)v13 + 1, 1uLL, memory_order_relaxed);
  pthread_mutex_unlock(&ctu::Singleton<support::log::buffer,support::log::buffer,ctu::PthreadMutexGuardPolicy<support::log::buffer>>::sInstance);
  pthread_mutex_lock(&ctu::Singleton<support::log::buffer,support::log::buffer,ctu::PthreadMutexGuardPolicy<support::log::buffer>>::sInstance);
  if (qword_26A99F8D0) {
    goto LABEL_36;
  }
  uint64_t v15 = (char *)operator new(0xA8uLL);
  *((void *)v15 + 1) = 0;
  *((void *)v15 + 2) = 0;
  *(void *)uint64_t v15 = &unk_270EB04A0;
  uint64_t v16 = (uint64_t)(v15 + 24);
  *((void *)v15 + 3) = &unk_270EB04F0;
  *((void *)v15 + 4) = 850045863;
  *(_OWORD *)(v15 + 40) = 0u;
  *(_OWORD *)(v15 + 56) = 0u;
  *(_OWORD *)(v15 + 72) = 0u;
  *((void *)v15 + 14) = 0;
  *((void *)v15 + 13) = 0;
  *((void *)v15 + 11) = 0;
  *((void *)v15 + 12) = v15 + 104;
  *(_OWORD *)(v15 + 120) = 0u;
  *(_OWORD *)(v15 + 136) = 0u;
  *(_OWORD *)(v15 + 152) = 0u;
  uint64_t v17 = (std::__shared_weak_count *)off_26A99F8D8;
  qword_26A99F8D0 = (uint64_t)(v15 + 24);
  off_26A99F8D8 = v15;
  if (v17)
  {
    if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
LABEL_36:
    uint64_t v16 = qword_26A99F8D0;
    uint64_t v15 = (char *)off_26A99F8D8;
    v136 = (std::__shared_weak_count *)off_26A99F8D8;
    if (!off_26A99F8D8) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  v136 = (std::__shared_weak_count *)v15;
LABEL_42:
  atomic_fetch_add_explicit((atomic_ullong *volatile)v15 + 1, 1uLL, memory_order_relaxed);
LABEL_43:
  pthread_mutex_unlock(&ctu::Singleton<support::log::buffer,support::log::buffer,ctu::PthreadMutexGuardPolicy<support::log::buffer>>::sInstance);
  std::string v18 = (std::mutex *)(v16 + 8);
  std::mutex::lock((std::mutex *)(v16 + 8));
  long long v19 = *(void **)(v16 + 80);
  if (!v19) {
    goto LABEL_175;
  }
  uint64_t v20 = v16 + 80;
  do
  {
    unint64_t v21 = v19[4];
    BOOL v22 = v21 >= (unint64_t)a2;
    if (v21 >= (unint64_t)a2) {
      int v23 = v19;
    }
    else {
      int v23 = v19 + 1;
    }
    if (v22) {
      uint64_t v20 = (uint64_t)v19;
    }
    long long v19 = (void *)*v23;
  }
  while (*v23);
  if (v20 == v16 + 80 || *(void *)(v20 + 32) > (unint64_t)a2)
  {
LABEL_175:
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x263E6A7B0](exception, "attempting to put back a buffer the instance does not own");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  size_t v24 = *(char **)(v16 + 112);
  uint64_t v25 = *(char **)(v16 + 104);
  uint64_t v26 = v24 - v25;
  if (v24 == v25) {
    uint64_t v27 = 0;
  }
  else {
    uint64_t v27 = ((v24 - v25) << 6) - 1;
  }
  unint64_t v29 = *(void *)(v16 + 128);
  uint64_t v28 = *(void *)(v16 + 136);
  unint64_t v30 = v28 + v29;
  if (v27 != v28 + v29) {
    goto LABEL_151;
  }
  if (v29 >= 0x200)
  {
    *(void *)(v16 + 128) = v29 - 512;
    int v31 = v25 + 8;
    uint64_t v32 = *(void *)v25;
    *(void *)(v16 + 104) = v25 + 8;
    if (v24 != *(char **)(v16 + 120))
    {
LABEL_148:
      *(void *)size_t v24 = v32;
      goto LABEL_149;
    }
    uint64_t v33 = *(char **)(v16 + 96);
    if (v31 > v33)
    {
      uint64_t v34 = (v31 - v33) >> 3;
      if (v34 >= -1) {
        uint64_t v35 = v34 + 1;
      }
      else {
        uint64_t v35 = v34 + 2;
      }
      uint64_t v36 = v35 >> 1;
      uint64_t v37 = -v36;
      uint64_t v38 = &v31[-8 * v36];
      int64_t v39 = v24 - v31;
      if (v24 != v31)
      {
        memmove(&v31[-8 * v36], v31, v24 - v31);
        size_t v24 = *(char **)(v16 + 104);
      }
      __int16 v40 = &v24[8 * v37];
      size_t v24 = &v38[v39];
      *(void *)(v16 + 104) = v40;
      *(void *)(v16 + 112) = &v38[v39];
      goto LABEL_148;
    }
    if (v24 == v33) {
      unint64_t v52 = 1;
    }
    else {
      unint64_t v52 = (v24 - v33) >> 2;
    }
    if (!(v52 >> 61))
    {
      uint64_t v53 = (char *)operator new(8 * v52);
      uint64_t v54 = &v53[8 * (v52 >> 2)];
      int64_t v56 = v24 - v31;
      BOOL v55 = v24 == v31;
      size_t v24 = v54;
      if (v55) {
        goto LABEL_146;
      }
      size_t v24 = &v54[v56 & 0xFFFFFFFFFFFFFFF8];
      unint64_t v57 = v56 - 8;
      if (v57 >= 0x38)
      {
        int v109 = &v53[8 * (v52 >> 2)];
        unint64_t v58 = v109;
        if ((unint64_t)(v109 - v31) >= 0x20)
        {
          uint64_t v110 = (v57 >> 3) + 1;
          uint64_t v111 = 8 * (v110 & 0x3FFFFFFFFFFFFFFCLL);
          unint64_t v58 = &v54[v111];
          v31 += v111;
          v112 = (long long *)(v25 + 24);
          v113 = v109 + 16;
          uint64_t v114 = v110 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v115 = *v112;
            *(v113 - 1) = *(v112 - 1);
            _OWORD *v113 = v115;
            v112 += 2;
            v113 += 2;
            v114 -= 4;
          }
          while (v114);
          if (v110 == (v110 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_146:
            *(void *)(v16 + 96) = v53;
            *(void *)(v16 + 104) = v54;
            *(void *)(v16 + 112) = v24;
            *(void *)(v16 + 120) = &v53[8 * v52];
            if (v33)
            {
              operator delete(v33);
              size_t v24 = *(char **)(v16 + 112);
            }
            goto LABEL_148;
          }
        }
      }
      else
      {
        unint64_t v58 = &v53[8 * (v52 >> 2)];
      }
      do
      {
        uint64_t v116 = *(void *)v31;
        v31 += 8;
        *(void *)unint64_t v58 = v116;
        v58 += 8;
      }
      while (v58 != v24);
      goto LABEL_146;
    }
LABEL_177:
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  uint64_t v41 = v26 >> 3;
  char v42 = *(char **)(v16 + 120);
  uint64_t v43 = *(char **)(v16 + 96);
  if (v26 >> 3 >= (unint64_t)((v42 - v43) >> 3))
  {
    if (v42 == v43) {
      unint64_t v46 = 1;
    }
    else {
      unint64_t v46 = (v42 - v43) >> 2;
    }
    if (!(v46 >> 61))
    {
      uint64_t v47 = (char *)operator new(8 * v46);
      uint64_t v48 = operator new(0x1000uLL);
      uint64_t v49 = &v47[8 * v41];
      uint64_t v50 = &v47[8 * v46];
      if (v41 == v46)
      {
        v134 = v48;
        if (v26 < 1)
        {
          if (v24 == v25) {
            unint64_t v60 = 1;
          }
          else {
            unint64_t v60 = v26 >> 2;
          }
          if (v60 >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          uint64_t v49 = (char *)operator new(8 * v60);
          uint64_t v50 = &v49[8 * v60];
          operator delete(v47);
          uint64_t v25 = *(char **)(v16 + 104);
          size_t v24 = *(char **)(v16 + 112);
          uint64_t v47 = v49;
        }
        else
        {
          unint64_t v51 = v41 + 2;
          if (v41 >= -1) {
            unint64_t v51 = v41 + 1;
          }
          v49 -= 8 * (v51 >> 1);
        }
        uint64_t v48 = v134;
      }
      *(void *)uint64_t v49 = v48;
      long long v61 = v49 + 8;
      if (v24 != v25)
      {
        do
        {
          if (v49 == v47)
          {
            if (v61 >= v50)
            {
              if (v50 == v47) {
                unint64_t v68 = 1;
              }
              else {
                unint64_t v68 = (v50 - v47) >> 2;
              }
              if (v68 >> 61) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              unint64_t v69 = (char *)operator new(8 * v68);
              uint64_t v70 = v69;
              unint64_t v71 = (v68 + 3) >> 2;
              uint64_t v49 = &v69[8 * v71];
              int64_t v72 = v61 - v47;
              BOOL v55 = v61 == v47;
              long long v61 = v49;
              if (!v55)
              {
                long long v61 = &v49[v72 & 0xFFFFFFFFFFFFFFF8];
                unint64_t v73 = v72 - 8;
                v74 = &v69[8 * v71];
                uint64_t v75 = v47;
                if (v73 < 0x38) {
                  goto LABEL_181;
                }
                uint64_t v76 = 8 * v71;
                v74 = &v69[8 * v71];
                uint64_t v75 = v47;
                if ((unint64_t)(v74 - v47) < 0x20) {
                  goto LABEL_181;
                }
                uint64_t v77 = (v73 >> 3) + 1;
                uint64_t v78 = 8 * (v77 & 0x3FFFFFFFFFFFFFFCLL);
                v74 = &v49[v78];
                uint64_t v75 = &v47[v78];
                v79 = (long long *)(v47 + 16);
                v80 = &v69[v76 + 16];
                uint64_t v81 = v77 & 0x3FFFFFFFFFFFFFFCLL;
                do
                {
                  long long v82 = *v79;
                  *((_OWORD *)v80 - 1) = *(v79 - 1);
                  *(_OWORD *)v80 = v82;
                  v79 += 2;
                  v80 += 32;
                  v81 -= 4;
                }
                while (v81);
                if (v77 != (v77 & 0x3FFFFFFFFFFFFFFCLL))
                {
LABEL_181:
                  do
                  {
                    uint64_t v83 = *(void *)v75;
                    v75 += 8;
                    *(void *)v74 = v83;
                    v74 += 8;
                  }
                  while (v74 != v61);
                }
              }
              uint64_t v50 = &v69[8 * v68];
              operator delete(v47);
              uint64_t v47 = v70;
            }
            else
            {
              uint64_t v64 = (v50 - v61) >> 3;
              if (v64 >= -1) {
                uint64_t v65 = v64 + 1;
              }
              else {
                uint64_t v65 = v64 + 2;
              }
              uint64_t v66 = v65 >> 1;
              uint64_t v49 = &v47[8 * (v65 >> 1)];
              long long v67 = v47;
              if (v61 != v47)
              {
                memmove(v49, v47, v61 - v47);
                long long v67 = v61;
              }
              long long v61 = (char *)v67 + 8 * v66;
            }
          }
          uint64_t v63 = *((void *)v24 - 1);
          v24 -= 8;
          *((void *)v49 - 1) = v63;
          v49 -= 8;
        }
        while (v24 != *(char **)(v16 + 104));
      }
      dispatch_object_t v62 = *(void **)(v16 + 96);
      *(void *)(v16 + 96) = v47;
      *(void *)(v16 + 104) = v49;
      *(void *)(v16 + 112) = v61;
      *(void *)(v16 + 120) = v50;
      std::string v18 = (std::mutex *)(v16 + 8);
      if (v62) {
        operator delete(v62);
      }
      goto LABEL_150;
    }
    goto LABEL_177;
  }
  char v44 = operator new(0x1000uLL);
  uint64_t v45 = v44;
  if (v42 == v24)
  {
    if (v25 == v43)
    {
      if (v24 == v25) {
        unint64_t v84 = 1;
      }
      else {
        unint64_t v84 = (v42 - v25) >> 2;
      }
      if (v84 >> 61) {
        goto LABEL_177;
      }
      uint64_t v85 = (char *)operator new(8 * v84);
      unint64_t v86 = (v84 + 3) >> 2;
      uint64_t v59 = &v85[8 * v86];
      uint64_t v87 = v59;
      if (v24 != v25)
      {
        uint64_t v87 = &v59[8 * v41];
        unint64_t v88 = &v85[8 * v86];
        unint64_t v89 = v25;
        if ((unint64_t)(v26 - 8) < 0x38) {
          goto LABEL_182;
        }
        v90 = &v85[8 * v86];
        unint64_t v88 = v90;
        unint64_t v89 = v25;
        if ((unint64_t)(v90 - v25) < 0x20) {
          goto LABEL_182;
        }
        unint64_t v91 = ((unint64_t)(v26 - 8) >> 3) + 1;
        uint64_t v92 = 8 * (v91 & 0x3FFFFFFFFFFFFFFCLL);
        unint64_t v88 = &v59[v92];
        unint64_t v89 = &v25[v92];
        v93 = (long long *)(v25 + 16);
        v94 = v90 + 16;
        uint64_t v95 = v91 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v96 = *v93;
          *(v94 - 1) = *(v93 - 1);
          _OWORD *v94 = v96;
          v93 += 2;
          v94 += 2;
          v95 -= 4;
        }
        while (v95);
        if (v91 != (v91 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_182:
          do
          {
            uint64_t v97 = *(void *)v89;
            v89 += 8;
            *(void *)unint64_t v88 = v97;
            v88 += 8;
          }
          while (v88 != v87);
        }
      }
      *(void *)(v16 + 96) = v85;
      *(void *)(v16 + 104) = v59;
      *(void *)(v16 + 112) = v87;
      *(void *)(v16 + 120) = &v85[8 * v84];
      if (v25)
      {
        operator delete(v25);
        uint64_t v59 = *(char **)(v16 + 104);
      }
    }
    else
    {
      uint64_t v59 = v25;
    }
    *((void *)v59 - 1) = v45;
    v98 = *(char **)(v16 + 104);
    v99 = *(char **)(v16 + 112);
    *(void *)(v16 + 104) = v98 - 8;
    uint64_t v100 = *((void *)v98 - 1);
    *(void *)(v16 + 104) = v98;
    if (v99 != *(char **)(v16 + 120)) {
      goto LABEL_133;
    }
    v101 = *(char **)(v16 + 96);
    if (v98 > v101)
    {
      uint64_t v102 = (v98 - v101) >> 3;
      if (v102 >= -1) {
        uint64_t v103 = v102 + 1;
      }
      else {
        uint64_t v103 = v102 + 2;
      }
      uint64_t v104 = v103 >> 1;
      uint64_t v105 = -v104;
      int v106 = &v98[-8 * v104];
      size_t v107 = v99 - v98;
      if (v107)
      {
        memmove(&v98[-8 * v104], v98, v107);
        v98 = *(char **)(v16 + 104);
      }
      v108 = &v106[v107];
      *(void *)(v16 + 104) = &v98[8 * v105];
      *(void *)(v16 + 112) = v108;
      *(void *)v108 = v100;
      goto LABEL_149;
    }
    if (v99 == v101) {
      unint64_t v118 = 1;
    }
    else {
      unint64_t v118 = (v99 - v101) >> 2;
    }
    if (v118 >> 61) {
      goto LABEL_177;
    }
    v119 = (char *)operator new(8 * v118);
    v120 = &v119[8 * (v118 >> 2)];
    int64_t v121 = v99 - v98;
    BOOL v55 = v99 == v98;
    v99 = v120;
    if (!v55)
    {
      v99 = &v120[v121 & 0xFFFFFFFFFFFFFFF8];
      unint64_t v122 = v121 - 8;
      if (v122 < 0x38)
      {
        v123 = &v119[8 * (v118 >> 2)];
        do
        {
LABEL_172:
          uint64_t v132 = *(void *)v98;
          v98 += 8;
          *(void *)v123 = v132;
          v123 += 8;
        }
        while (v123 != v99);
        goto LABEL_173;
      }
      v124 = &v119[8 * (v118 >> 2)];
      v123 = v124;
      if ((unint64_t)(v124 - v98) < 0x20) {
        goto LABEL_172;
      }
      uint64_t v125 = (v122 >> 3) + 1;
      uint64_t v126 = 8 * (v125 & 0x3FFFFFFFFFFFFFFCLL);
      v123 = &v120[v126];
      v127 = &v98[v126];
      v128 = (long long *)(v98 + 16);
      v129 = v124 + 16;
      uint64_t v130 = v125 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v131 = *v128;
        *(v129 - 1) = *(v128 - 1);
        _OWORD *v129 = v131;
        v128 += 2;
        v129 += 2;
        v130 -= 4;
      }
      while (v130);
      v98 = v127;
      if (v125 != (v125 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_172;
      }
    }
LABEL_173:
    *(void *)(v16 + 96) = v119;
    *(void *)(v16 + 104) = v120;
    *(void *)(v16 + 112) = v99;
    *(void *)(v16 + 120) = &v119[8 * v118];
    if (v101)
    {
      operator delete(v101);
      v99 = *(char **)(v16 + 112);
    }
LABEL_133:
    *(void *)v99 = v100;
    goto LABEL_149;
  }
  *(void *)size_t v24 = v44;
LABEL_149:
  *(void *)(v16 + 112) += 8;
LABEL_150:
  uint64_t v25 = *(char **)(v16 + 104);
  uint64_t v28 = *(void *)(v16 + 136);
  unint64_t v30 = *(void *)(v16 + 128) + v28;
LABEL_151:
  *(void *)(*(void *)&v25[(v30 >> 6) & 0x3FFFFFFFFFFFFF8] + 8 * (v30 & 0x1FF)) = a2;
  *(void *)(v16 + 136) = v28 + 1;
  std::mutex::unlock(v18);
  if (v136 && !atomic_fetch_add(&v136->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v136->__on_zero_shared)(v136);
    std::__shared_weak_count::__release_weak(v136);
    v117 = v135;
    if (!v135) {
      return;
    }
  }
  else
  {
    v117 = v135;
    if (!v135) {
      return;
    }
  }
  if (!atomic_fetch_add(&v117->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v117->__on_zero_shared)(v117);
    std::__shared_weak_count::__release_weak(v117);
  }
}

void sub_2637FC948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, std::mutex *a10, char a11, uint64_t a12, char a13)
{
  operator delete(__p);
  operator delete(v13);
  std::mutex::unlock(a10);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void support::log::manager::add_delegates(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  if (v2 != a2)
  {
    uint64_t v5 = (std::mutex *)(a1 + 8);
    uint64_t v6 = a1 + 120;
    do
    {
      std::mutex::lock(v5);
      uint64_t v7 = operator new(0x18uLL);
      uint64_t v8 = *(void *)(v2 + 16);
      *(void *)(v2 + 16) = 0;
      v7[1] = v6;
      v7[2] = v8;
      uint64_t v9 = *(void *)(a1 + 120);
      *uint64_t v7 = v9;
      *(void *)(v9 + 8) = v7;
      *(void *)(a1 + 120) = v7;
      ++*(void *)(a1 + 136);
      std::mutex::unlock(v5);
      uint64_t v2 = *(void *)(v2 + 8);
    }
    while (v2 != a2);
  }
}

void sub_2637FCAB8(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void support::log::manager::set_defaults(support::log::manager *this)
{
  uint64_t v2 = (std::mutex *)((char *)this + 8);
  std::mutex::lock((std::mutex *)((char *)this + 8));
  *((unsigned char *)this + 112) = 3;
  if (*((void *)this + 17))
  {
    uint64_t v3 = (char *)this + 120;
    uint64_t v4 = *((void *)this + 15);
    uint64_t v5 = (char *)*((void *)this + 16);
    uint64_t v6 = *(void *)v5;
    *(void *)(v6 + 8) = *(void *)(v4 + 8);
    **(void **)(v4 + 8) = v6;
    *((void *)this + 17) = 0;
    if (v5 != (char *)this + 120)
    {
      do
      {
        uint64_t v8 = (char *)*((void *)v5 + 1);
        uint64_t v7 = *((void *)v5 + 2);
        *((void *)v5 + 2) = 0;
        if (v7) {
          (*(void (**)(uint64_t))(*(void *)v7 + 16))(v7);
        }
        operator delete(v5);
        uint64_t v5 = v8;
      }
      while (v8 != v3);
    }
  }

  std::mutex::unlock(v2);
}

void support::log::manager::message_delegates(support::log::manager *this, const support::log::details *a2, char *a3)
{
  uint64_t v4 = (char *)this + 120;
  uint64_t v5 = *((void *)this + 16);
  if ((support::log::manager *)v5 != (support::log::manager *)((char *)this + 120))
  {
    do
    {
      this = (support::log::manager *)(***(uint64_t (****)(void, const support::log::details *, char *))(v5 + 16))(*(void *)(v5 + 16), a2, a3);
      uint64_t v5 = *(void *)(v5 + 8);
    }
    while ((char *)v5 != v4);
  }

  support::log::manager::release_log_buffer(this, a3);
}

void support::log::stdout_delegate::create(uint64_t *a1@<X0>, void *a2@<X8>)
{
  *a2 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v4 = operator new(0x20uLL);
  uint64_t v5 = v4;
  uint64_t v6 = *a1;
  uint64_t v7 = (std::__shared_weak_count *)a1[1];
  if (v7)
  {
    atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  *uint64_t v4 = &unk_270EB0278;
  v4[1] = v6;
  void v4[2] = v7;
  if (v7)
  {
    atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((unsigned char *)v4 + 24) = 1;
    std::__shared_weak_count::__release_weak(v7);
    *uint64_t v5 = &unk_270EB02F0;
    std::__shared_weak_count::__release_weak(v7);
    *a2 = v5;
  }
  else
  {
    *((unsigned char *)v4 + 24) = 1;
    *uint64_t v4 = &unk_270EB02F0;
    *a2 = v4;
  }
}

uint64_t support::log::stdout_delegate::stdout_delegate(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v3 = (std::__shared_weak_count *)a2[1];
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  *(void *)a1 = &unk_270EB0278;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v3;
  if (v3)
  {
    atomic_fetch_add_explicit(&v3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *(unsigned char *)(a1 + 24) = 1;
    std::__shared_weak_count::__release_weak(v3);
  }
  else
  {
    *(unsigned char *)(a1 + 24) = 1;
  }
  *(void *)a1 = &unk_270EB02F0;
  return a1;
}

{
  std::__shared_weak_count *v3;
  uint64_t v4;

  uint64_t v4 = *a2;
  uint64_t v3 = (std::__shared_weak_count *)a2[1];
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  *(void *)a1 = &unk_270EB0278;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v3;
  if (v3)
  {
    atomic_fetch_add_explicit(&v3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *(unsigned char *)(a1 + 24) = 1;
    std::__shared_weak_count::__release_weak(v3);
  }
  else
  {
    *(unsigned char *)(a1 + 24) = 1;
  }
  *(void *)a1 = &unk_270EB02F0;
  return a1;
}

double support::log::stdout_delegate::create@<D0>(void *a1@<X8>)
{
  *a1 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v3 = operator new(0x20uLL);
  double result = 0.0;
  _OWORD *v3 = 0u;
  v3[1] = 0u;
  *(void *)uint64_t v3 = &unk_270EB02F0;
  *a1 = v3;
  return result;
}

void support::log::stdout_delegate::message(support::log::stdout_delegate *this, const support::log::details *a2, const char *a3)
{
  if (a3)
  {
    memset(v6, 170, sizeof(v6));
    (*(void (**)(void *__return_ptr))(*(void *)this + 24))(v6);
    if (LOBYTE(v6[2]))
    {
      if (!v6[1]) {
        return;
      }
      uint64_t v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)v6[1]);
      if (v4)
      {
        uint64_t v5 = v4;
        if (v6[0]) {
          fprintf((FILE *)*MEMORY[0x263EF8358], "%s\n", a3);
        }
        if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s\n", a3);
    }
    if (LOBYTE(v6[2]))
    {
      if (v6[1]) {
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6[1]);
      }
    }
  }
}

support::log::manager_global *support::log::manager_global::manager_global(support::log::manager_global *this)
{
  *((unsigned char *)&__p.__r_.__value_.__s + 23) = 6;
  strcpy((char *)&__p, "global");
  uint64_t v10 = 0;
  BOOL v11 = &unk_270EB02A8;
  char v12 = 3;
  uint64_t v8 = (uint64_t)&v8;
  uint64_t v9 = &v8;
  support::log::manager::manager((uint64_t)this, &__p, (uint64_t)&v11, &v8);
  if (v10)
  {
    uint64_t v2 = v8;
    uint64_t v3 = v9;
    uint64_t v4 = *v9;
    *(void *)(v4 + 8) = *(void *)(v8 + 8);
    **(void **)(v2 + 8) = v4;
    uint64_t v10 = 0;
    if (v3 != &v8)
    {
      do
      {
        uint64_t v7 = (uint64_t *)v3[1];
        uint64_t v6 = v3[2];
        v3[2] = 0;
        if (v6) {
          (*(void (**)(uint64_t))(*(void *)v6 + 16))(v6);
        }
        operator delete(v3);
        uint64_t v3 = v7;
      }
      while (v7 != &v8);
    }
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  *(void *)this = &unk_270EB0320;
  return this;
}

void sub_2637FD13C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *support::log::client::descriptor::descriptor(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 = &unk_270EB0350;
  uint64_t descriptor_instance = support::log::global_client_descriptor_manager::get_descriptor_instance(a2, a3);
  a1[1] = descriptor_instance;
  a1[2] = descriptor_instance;
  a1[3] = descriptor_instance + 8;
  a1[4] = descriptor_instance + 32;
  a1[5] = descriptor_instance + 56;
  return a1;
}

{
  uint64_t descriptor_instance;

  *a1 = &unk_270EB0350;
  uint64_t descriptor_instance = support::log::global_client_descriptor_manager::get_descriptor_instance(a2, a3);
  a1[1] = descriptor_instance;
  a1[2] = descriptor_instance;
  a1[3] = descriptor_instance + 8;
  a1[4] = descriptor_instance + 32;
  a1[5] = descriptor_instance + 56;
  return a1;
}

uint64_t support::log::global_client_descriptor_manager::get_descriptor_instance(uint64_t a1, uint64_t a2)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_MergedGlobals_0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&_MergedGlobals_0))
  {
    *(_OWORD *)&qword_26A99FA68 = 0u;
    *(_OWORD *)&qword_26A99FA58 = 0u;
    dword_26A99FA78 = 1065353216;
    __cxa_guard_release(&_MergedGlobals_0);
  }
  std::mutex::lock(&support::log::global_client_descriptor_manager::get_descriptor_instance(std::string const&,std::string const&)::sMutex);
  memset(__p, 170, sizeof(__p));
  int v4 = *(char *)(a1 + 23);
  if (v4 >= 0) {
    size_t v5 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    size_t v5 = *(void *)(a1 + 8);
  }
  unint64_t v6 = v5 + 1;
  memset(&__dst, 170, sizeof(__dst));
  if (v5 + 1 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v6 >= 0x17)
  {
    uint64_t v8 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v8 = v6 | 7;
    }
    uint64_t v9 = v8 + 1;
    p_dst = (std::string *)operator new(v8 + 1);
    __dst.__r_.__value_.__l.__size_ = v5 + 1;
    __dst.__r_.__value_.__r.__words[2] = v9 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    memset(&__dst, 0, sizeof(__dst));
    p_dst = &__dst;
    *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v5 + 1;
    if (!v5) {
      goto LABEL_16;
    }
  }
  if (v4 >= 0) {
    uint64_t v10 = (const std::string::value_type *)a1;
  }
  else {
    uint64_t v10 = *(const std::string::value_type **)a1;
  }
  memmove(p_dst, v10, v5);
LABEL_16:
  *(_WORD *)((char *)&p_dst->__r_.__value_.__l.__data_ + v5) = 44;
  int v11 = *(char *)(a2 + 23);
  if (v11 >= 0) {
    char v12 = (const std::string::value_type *)a2;
  }
  else {
    char v12 = *(const std::string::value_type **)a2;
  }
  if (v11 >= 0) {
    std::string::size_type v13 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    std::string::size_type v13 = *(void *)(a2 + 8);
  }
  unint64_t v14 = std::string::append(&__dst, v12, v13);
  long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  __p[2] = (void *)v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__dst.__r_.__value_.__l.__data_);
    if (std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>>>::find<std::string>(__p)) {
      goto LABEL_156;
    }
  }
  else if (std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>>>::find<std::string>(__p))
  {
    goto LABEL_156;
  }
  uint64_t v16 = (char *)operator new(0x40uLL);
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v72, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string v72 = *(std::string *)a1;
  }
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v71, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v71 = *(std::string *)a2;
  }
  *(void *)uint64_t v16 = &unk_270EB0420;
  uint64_t v17 = v16 + 8;
  *(std::string *)(v16 + 8) = v72;
  memset(&v72, 0, sizeof(v72));
  *(std::string *)(v16 + 32) = v71;
  memset(&v71, 0, sizeof(v71));
  if (v16[31] < 0)
  {
    uint64_t v17 = *(const char **)v17;
    std::string v18 = v16 + 32;
    if ((v16[55] & 0x80000000) == 0) {
      goto LABEL_34;
    }
  }
  else
  {
    std::string v18 = v16 + 32;
    if ((v16[55] & 0x80000000) == 0) {
      goto LABEL_34;
    }
  }
  std::string v18 = *(const char **)v18;
LABEL_34:
  *((void *)v16 + 7) = os_log_create(v17, v18);
  if (SHIBYTE(__p[2]) >= 0) {
    long long v19 = (uint64_t *)__p;
  }
  else {
    long long v19 = (uint64_t *)__p[0];
  }
  if (SHIBYTE(__p[2]) >= 0) {
    unint64_t v20 = HIBYTE(__p[2]);
  }
  else {
    unint64_t v20 = (unint64_t)__p[1];
  }
  unint64_t v21 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&__dst, v19, v20);
  unint64_t v22 = v21;
  unint64_t v23 = qword_26A99FA60;
  if (qword_26A99FA60)
  {
    uint8x8_t v24 = (uint8x8_t)vcnt_s8((int8x8_t)qword_26A99FA60);
    v24.i16[0] = vaddlv_u8(v24);
    if (v24.u32[0] > 1uLL)
    {
      unint64_t v25 = v21;
      if (v21 >= qword_26A99FA60) {
        unint64_t v25 = v21 % qword_26A99FA60;
      }
    }
    else
    {
      unint64_t v25 = (qword_26A99FA60 - 1) & v21;
    }
    uint64_t v26 = *(uint64_t ***)(qword_26A99FA58 + 8 * v25);
    if (v26)
    {
      uint64_t v27 = *v26;
      if (*v26)
      {
        if (SHIBYTE(__p[2]) >= 0) {
          uint64_t v28 = (void *)HIBYTE(__p[2]);
        }
        else {
          uint64_t v28 = __p[1];
        }
        if (SHIBYTE(__p[2]) >= 0) {
          unint64_t v29 = __p;
        }
        else {
          unint64_t v29 = (void **)__p[0];
        }
        if (v24.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v35 = v27[1];
            if (v35 == v22)
            {
              uint64_t v36 = *((unsigned __int8 *)v27 + 39);
              if ((v36 & 0x80u) == 0) {
                uint64_t v37 = (void *)*((unsigned __int8 *)v27 + 39);
              }
              else {
                uint64_t v37 = (void *)v27[3];
              }
              if (v37 == v28)
              {
                uint64_t v38 = (const void **)(v27 + 2);
                if ((v36 & 0x80) != 0)
                {
                  if (!memcmp(*v38, v29, v27[3])) {
                    goto LABEL_154;
                  }
                }
                else
                {
                  if (!*((unsigned char *)v27 + 39)) {
                    goto LABEL_154;
                  }
                  int64_t v39 = v29;
                  while (*(unsigned __int8 *)v38 == *(unsigned __int8 *)v39)
                  {
                    uint64_t v38 = (const void **)((char *)v38 + 1);
                    int64_t v39 = (void **)((char *)v39 + 1);
                    if (!--v36) {
                      goto LABEL_154;
                    }
                  }
                }
              }
            }
            else if ((v35 & (v23 - 1)) != v25)
            {
              goto LABEL_90;
            }
            uint64_t v27 = (uint64_t *)*v27;
            if (!v27) {
              goto LABEL_90;
            }
          }
        }
        do
        {
          unint64_t v30 = v27[1];
          if (v30 == v22)
          {
            uint64_t v31 = *((unsigned __int8 *)v27 + 39);
            if ((v31 & 0x80u) == 0) {
              uint64_t v32 = (void *)*((unsigned __int8 *)v27 + 39);
            }
            else {
              uint64_t v32 = (void *)v27[3];
            }
            if (v32 == v28)
            {
              uint64_t v33 = (const void **)(v27 + 2);
              if ((v31 & 0x80) != 0)
              {
                if (!memcmp(*v33, v29, v27[3])) {
                  goto LABEL_154;
                }
              }
              else
              {
                if (!*((unsigned char *)v27 + 39)) {
                  goto LABEL_154;
                }
                uint64_t v34 = v29;
                while (*(unsigned __int8 *)v33 == *(unsigned __int8 *)v34)
                {
                  uint64_t v33 = (const void **)((char *)v33 + 1);
                  uint64_t v34 = (void **)((char *)v34 + 1);
                  if (!--v31) {
                    goto LABEL_154;
                  }
                }
              }
            }
          }
          else
          {
            if (v30 >= v23) {
              v30 %= v23;
            }
            if (v30 != v25) {
              break;
            }
          }
          uint64_t v27 = (uint64_t *)*v27;
        }
        while (v27);
      }
    }
  }
  else
  {
    unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  }
LABEL_90:
  __dst.__r_.__value_.__r.__words[2] = 0xAAAAAAAAAAAAAA00;
  __int16 v40 = (char *)operator new(0x30uLL);
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v40;
  __dst.__r_.__value_.__l.__size_ = (std::string::size_type)&qword_26A99FA68;
  *(void *)__int16 v40 = 0;
  *((void *)v40 + 1) = v22;
  uint64_t v41 = (std::string *)(v40 + 16);
  if (SHIBYTE(__p[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v41, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
  }
  else
  {
    *(_OWORD *)&v41->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    *((void **)v40 + 4) = __p[2];
  }
  *((void *)v40 + 5) = v16;
  __dst.__r_.__value_.__s.__data_[16] = 1;
  float v42 = (float)(unint64_t)(qword_26A99FA70 + 1);
  if (!v23 || (float)(*(float *)&dword_26A99FA78 * (float)v23) < v42)
  {
    BOOL v45 = 1;
    if (v23 >= 3) {
      BOOL v45 = (v23 & (v23 - 1)) != 0;
    }
    unint64_t v46 = v45 | (2 * v23);
    unint64_t v47 = vcvtps_u32_f32(v42 / *(float *)&dword_26A99FA78);
    if (v46 <= v47) {
      unint64_t prime = v47;
    }
    else {
      unint64_t prime = v46;
    }
    if (prime == 1)
    {
      unint64_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      unint64_t prime = std::__next_prime(prime);
    }
    unint64_t v23 = qword_26A99FA60;
    if (prime > qword_26A99FA60) {
      goto LABEL_107;
    }
    if (prime >= qword_26A99FA60) {
      goto LABEL_140;
    }
    unint64_t v59 = vcvtps_u32_f32((float)(unint64_t)qword_26A99FA70 / *(float *)&dword_26A99FA78);
    if ((unint64_t)qword_26A99FA60 < 3
      || (uint8x8_t v60 = (uint8x8_t)vcnt_s8((int8x8_t)qword_26A99FA60), v60.i16[0] = vaddlv_u8(v60), v60.u32[0] > 1uLL))
    {
      unint64_t v59 = std::__next_prime(v59);
    }
    else
    {
      uint64_t v61 = 1 << -(char)__clz(v59 - 1);
      if (v59 >= 2) {
        unint64_t v59 = v61;
      }
    }
    if (prime <= v59) {
      unint64_t prime = v59;
    }
    if (prime >= v23)
    {
      unint64_t v23 = qword_26A99FA60;
    }
    else
    {
      if (prime)
      {
LABEL_107:
        if (prime >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        uint64_t v49 = operator new(8 * prime);
        uint64_t v50 = (void *)qword_26A99FA58;
        qword_26A99FA58 = (uint64_t)v49;
        if (v50) {
          operator delete(v50);
        }
        uint64_t v51 = 0;
        qword_26A99FA60 = prime;
        do
          *(void *)(qword_26A99FA58 + 8 * v51++) = 0;
        while (prime != v51);
        unint64_t v52 = (void **)qword_26A99FA68;
        if (!qword_26A99FA68) {
          goto LABEL_139;
        }
        unint64_t v53 = *(void *)(qword_26A99FA68 + 8);
        unint64_t v54 = prime - 1;
        if ((prime & (prime - 1)) == 0)
        {
          unint64_t v55 = v53 & v54;
          *(void *)(qword_26A99FA58 + 8 * v55) = &qword_26A99FA68;
          for (uint64_t i = *v52; *v52; uint64_t i = *v52)
          {
            unint64_t v57 = i[1] & v54;
            if (v57 == v55)
            {
              unint64_t v52 = (void **)i;
            }
            else if (*(void *)(qword_26A99FA58 + 8 * v57))
            {
              *unint64_t v52 = (void *)*i;
              uint64_t v58 = 8 * v57;
              *uint64_t i = **(void **)(qword_26A99FA58 + v58);
              **(void **)(qword_26A99FA58 + v58) = i;
            }
            else
            {
              *(void *)(qword_26A99FA58 + 8 * v57) = v52;
              unint64_t v52 = (void **)i;
              unint64_t v55 = v57;
            }
          }
LABEL_139:
          unint64_t v23 = prime;
          goto LABEL_140;
        }
        if (v53 >= prime) {
          v53 %= prime;
        }
        *(void *)(qword_26A99FA58 + 8 * v53) = &qword_26A99FA68;
        dispatch_object_t v62 = *v52;
        if (!*v52) {
          goto LABEL_139;
        }
        while (1)
        {
          unint64_t v64 = v62[1];
          if (v64 >= prime) {
            v64 %= prime;
          }
          if (v64 == v53) {
            goto LABEL_133;
          }
          if (*(void *)(qword_26A99FA58 + 8 * v64))
          {
            *unint64_t v52 = (void *)*v62;
            uint64_t v63 = 8 * v64;
            void *v62 = **(void **)(qword_26A99FA58 + v63);
            **(void **)(qword_26A99FA58 + v63) = v62;
            dispatch_object_t v62 = v52;
LABEL_133:
            unint64_t v52 = (void **)v62;
            dispatch_object_t v62 = (void *)*v62;
            if (!v62) {
              goto LABEL_139;
            }
          }
          else
          {
            *(void *)(qword_26A99FA58 + 8 * v64) = v52;
            unint64_t v52 = (void **)v62;
            dispatch_object_t v62 = (void *)*v62;
            unint64_t v53 = v64;
            if (!v62) {
              goto LABEL_139;
            }
          }
        }
      }
      uint64_t v70 = (void *)qword_26A99FA58;
      qword_26A99FA58 = 0;
      if (v70) {
        operator delete(v70);
      }
      unint64_t v23 = 0;
      qword_26A99FA60 = 0;
    }
LABEL_140:
    unint64_t v65 = v23 - 1;
    if ((v23 & (v23 - 1)) != 0)
    {
      if (v22 >= v23)
      {
        unint64_t v25 = v22 % v23;
        uint64_t v43 = *(void **)(qword_26A99FA58 + 8 * (v22 % v23));
        char v44 = (void *)__dst.__r_.__value_.__r.__words[0];
        if (v43) {
          goto LABEL_96;
        }
      }
      else
      {
        unint64_t v25 = v22;
        uint64_t v43 = *(void **)(qword_26A99FA58 + 8 * v22);
        char v44 = (void *)__dst.__r_.__value_.__r.__words[0];
        if (v43) {
          goto LABEL_96;
        }
      }
    }
    else
    {
      unint64_t v25 = v65 & v22;
      uint64_t v43 = *(void **)(qword_26A99FA58 + 8 * (v65 & v22));
      char v44 = (void *)__dst.__r_.__value_.__r.__words[0];
      if (v43) {
        goto LABEL_96;
      }
    }
LABEL_142:
    *char v44 = qword_26A99FA68;
    qword_26A99FA68 = __dst.__r_.__value_.__r.__words[0];
    *(void *)(qword_26A99FA58 + 8 * v25) = &qword_26A99FA68;
    if (*(void *)__dst.__r_.__value_.__l.__data_)
    {
      unint64_t v66 = *(void *)(*(void *)__dst.__r_.__value_.__l.__data_ + 8);
      if ((v23 & (v23 - 1)) != 0)
      {
        if (v66 >= v23) {
          v66 %= v23;
        }
      }
      else
      {
        v66 &= v23 - 1;
      }
      *(void *)(qword_26A99FA58 + 8 * v66) = __dst.__r_.__value_.__r.__words[0];
    }
    goto LABEL_153;
  }
  uint64_t v43 = *(void **)(qword_26A99FA58 + 8 * v25);
  char v44 = (void *)__dst.__r_.__value_.__r.__words[0];
  if (!v43) {
    goto LABEL_142;
  }
LABEL_96:
  *char v44 = *v43;
  void *v43 = __dst.__r_.__value_.__r.__words[0];
LABEL_153:
  ++qword_26A99FA70;
LABEL_154:
  if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v71.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v72.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_156:
      long long v67 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>>>::find<std::string>(__p);
      if (v67) {
        goto LABEL_157;
      }
LABEL_162:
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    }
  }
  else if ((SHIBYTE(v72.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_156;
  }
  operator delete(v72.__r_.__value_.__l.__data_);
  long long v67 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>>>::find<std::string>(__p);
  if (!v67) {
    goto LABEL_162;
  }
LABEL_157:
  uint64_t v68 = v67[5];
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  std::mutex::unlock(&support::log::global_client_descriptor_manager::get_descriptor_instance(std::string const&,std::string const&)::sMutex);
  return v68;
}

void sub_2637FDA94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  else if ((a21 & 0x80000000) == 0)
  {
LABEL_3:
    if ((a28 & 0x80000000) == 0)
    {
LABEL_8:
      std::mutex::unlock(&support::log::global_client_descriptor_manager::get_descriptor_instance(std::string const&,std::string const&)::sMutex);
      _Unwind_Resume(a1);
    }
LABEL_7:
    operator delete(a23);
    std::mutex::unlock(&support::log::global_client_descriptor_manager::get_descriptor_instance(std::string const&,std::string const&)::sMutex);
    _Unwind_Resume(a1);
  }
  operator delete(a16);
  if ((a28 & 0x80000000) == 0) {
    goto LABEL_8;
  }
  goto LABEL_7;
}

BOOL support::log::client::descriptor::operator==(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 16) == *(void *)(a2 + 16);
}

void *support::log::client::client(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *a1 = &unk_270EAECE0;
  *(_OWORD *)char v12 = *(_OWORD *)a2;
  uint64_t v13 = *(void *)(a2 + 16);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  *(_OWORD *)std::string __p = *(_OWORD *)a3;
  uint64_t v11 = *(void *)(a3 + 16);
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  a1[1] = &unk_270EB0350;
  uint64_t descriptor_instance = support::log::global_client_descriptor_manager::get_descriptor_instance((uint64_t)v12, (uint64_t)__p);
  a1[2] = descriptor_instance;
  a1[3] = descriptor_instance;
  a1[4] = descriptor_instance + 8;
  a1[5] = descriptor_instance + 32;
  a1[6] = descriptor_instance + 56;
  if ((SHIBYTE(v11) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v13) & 0x80000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    operator delete(v12[0]);
    if (a4) {
      goto LABEL_4;
    }
LABEL_7:
    pthread_mutex_lock(&ctu::Singleton<support::log::manager_global,support::log::manager_global,ctu::PthreadMutexGuardPolicy<support::log::manager_global>>::sInstance);
    if (!qword_26A99F920)
    {
      uint64_t v7 = operator new(0xA8uLL);
      v7[1] = 0;
      v7[2] = 0;
      *uint64_t v7 = &unk_270EB0588;
      a4 = (uint64_t)(v7 + 3);
      support::log::manager_global::manager_global((support::log::manager_global *)(v7 + 3));
      uint64_t v8 = (std::__shared_weak_count *)off_26A99F928;
      qword_26A99F920 = (uint64_t)(v7 + 3);
      off_26A99F928 = v7;
      if (!v8)
      {
LABEL_13:
        atomic_fetch_add_explicit(v7 + 1, 1uLL, memory_order_relaxed);
LABEL_14:
        pthread_mutex_unlock(&ctu::Singleton<support::log::manager_global,support::log::manager_global,ctu::PthreadMutexGuardPolicy<support::log::manager_global>>::sInstance);
        a1[7] = a4;
        a1[8] = v7;
        goto LABEL_15;
      }
      if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    a4 = qword_26A99F920;
    uint64_t v7 = off_26A99F928;
    if (!off_26A99F928) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  operator delete(__p[0]);
  if (SHIBYTE(v13) < 0) {
    goto LABEL_6;
  }
LABEL_3:
  if (!a4) {
    goto LABEL_7;
  }
LABEL_4:
  a1[7] = 0;
  a1[8] = 0;
LABEL_15:
  a1[9] = a4;
  return a1;
}

void sub_2637FDDDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  std::__shared_weak_count::~__shared_weak_count(v21);
  operator delete(v23);
  pthread_mutex_unlock(&ctu::Singleton<support::log::manager_global,support::log::manager_global,ctu::PthreadMutexGuardPolicy<support::log::manager_global>>::sInstance);
  _Unwind_Resume(a1);
}

void *support::log::client::client(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  *a1 = &unk_270EAECE0;
  *(_OWORD *)char v12 = *(_OWORD *)a2;
  uint64_t v13 = *(void *)(a2 + 16);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  *(_OWORD *)std::string __p = *(_OWORD *)a3;
  uint64_t v11 = *(void *)(a3 + 16);
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  a1[1] = &unk_270EB0350;
  uint64_t descriptor_instance = support::log::global_client_descriptor_manager::get_descriptor_instance((uint64_t)v12, (uint64_t)__p);
  a1[2] = descriptor_instance;
  a1[3] = descriptor_instance;
  a1[4] = descriptor_instance + 8;
  a1[5] = descriptor_instance + 32;
  a1[6] = descriptor_instance + 56;
  if ((SHIBYTE(v11) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v13) & 0x80000000) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    operator delete(v12[0]);
    uint64_t v7 = *a4;
    uint64_t v8 = a4[1];
    a1[7] = *a4;
    a1[8] = v8;
    if (!v8) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  operator delete(__p[0]);
  if (SHIBYTE(v13) < 0) {
    goto LABEL_7;
  }
LABEL_3:
  uint64_t v7 = *a4;
  uint64_t v8 = a4[1];
  a1[7] = *a4;
  a1[8] = v8;
  if (v8)
  {
LABEL_4:
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    uint64_t v7 = a1[7];
  }
LABEL_5:
  a1[9] = v7;
  return a1;
}

void sub_2637FDF58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a21 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a16);
  _Unwind_Resume(exception_object);
}

void *support::log::client::client(void *a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)uint64_t v7 = *(_OWORD *)a2;
  uint64_t v8 = *(void *)(a2 + 16);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  *(_OWORD *)std::string __p = *(_OWORD *)a3;
  uint64_t v6 = *(void *)(a3 + 16);
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  support::log::client::client(a1, (uint64_t)v7, (uint64_t)__p, 0);
  if (SHIBYTE(v6) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v8) & 0x80000000) == 0) {
      return a1;
    }
  }
  else if ((SHIBYTE(v8) & 0x80000000) == 0)
  {
    return a1;
  }
  operator delete(v7[0]);
  return a1;
}

{
  void *__p[2];
  uint64_t v6;
  void *v7[2];
  uint64_t v8;

  *(_OWORD *)uint64_t v7 = *(_OWORD *)a2;
  uint64_t v8 = *(void *)(a2 + 16);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  *(_OWORD *)std::string __p = *(_OWORD *)a3;
  uint64_t v6 = *(void *)(a3 + 16);
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  support::log::client::client(a1, (uint64_t)v7, (uint64_t)__p, 0);
  if (SHIBYTE(v6) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v8) & 0x80000000) == 0) {
      return a1;
    }
  }
  else if ((SHIBYTE(v8) & 0x80000000) == 0)
  {
    return a1;
  }
  operator delete(v7[0]);
  return a1;
}

void sub_2637FE040(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a21 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a16);
  _Unwind_Resume(exception_object);
}

void sub_2637FE124(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a21 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a16);
  _Unwind_Resume(exception_object);
}

uint64_t support::log::client::get_manager(support::log::client *this)
{
  return *((void *)this + 9);
}

uint64_t support::log::client::get_descriptor(support::log::client *this)
{
  return (uint64_t)this + 8;
}

void support::log::stdout_delegate::~stdout_delegate(support::log::stdout_delegate *this)
{
  *(void *)this = &unk_270EB0278;
  if (*((unsigned char *)this + 24))
  {
    uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v1) {
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

{
  std::__shared_weak_count *v2;
  uint64_t vars8;

  *(void *)this = &unk_270EB0278;
  if (*((unsigned char *)this + 24))
  {
    uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v2) {
      std::__shared_weak_count::__release_weak(v2);
    }
  }

  operator delete(this);
}

uint64_t ctu::PthreadMutexGuardPolicy<support::log::buffer>::~PthreadMutexGuardPolicy(uint64_t a1)
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

uint64_t ctu::PthreadMutexGuardPolicy<support::log::manager_global>::~PthreadMutexGuardPolicy(uint64_t a1)
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

void support::log::manager_global::~manager_global(support::log::manager_global *this)
{
  *(void *)this = &unk_270EB02C0;
  if (*((void *)this + 17))
  {
    uint64_t v2 = (char *)this + 120;
    uint64_t v3 = *((void *)this + 15);
    int v4 = (char *)*((void *)this + 16);
    uint64_t v5 = *(void *)v4;
    *(void *)(v5 + 8) = *(void *)(v3 + 8);
    **(void **)(v3 + 8) = v5;
    *((void *)this + 17) = 0;
    if (v4 != (char *)this + 120)
    {
      do
      {
        uint64_t v7 = (char *)*((void *)v4 + 1);
        uint64_t v6 = *((void *)v4 + 2);
        *((void *)v4 + 2) = 0;
        if (v6) {
          (*(void (**)(uint64_t))(*(void *)v6 + 16))(v6);
        }
        operator delete(v4);
        int v4 = v7;
      }
      while (v7 != v2);
    }
  }
  if (*((char *)this + 95) < 0) {
    operator delete(*((void **)this + 9));
  }
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
}

{
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t vars8;

  *(void *)this = &unk_270EB02C0;
  if (*((void *)this + 17))
  {
    uint64_t v2 = (char *)this + 120;
    uint64_t v3 = *((void *)this + 15);
    int v4 = (char *)*((void *)this + 16);
    uint64_t v5 = *(void *)v4;
    *(void *)(v5 + 8) = *(void *)(v3 + 8);
    **(void **)(v3 + 8) = v5;
    *((void *)this + 17) = 0;
    if (v4 != (char *)this + 120)
    {
      do
      {
        uint64_t v7 = (char *)*((void *)v4 + 1);
        uint64_t v6 = *((void *)v4 + 2);
        *((void *)v4 + 2) = 0;
        if (v6) {
          (*(void (**)(uint64_t))(*(void *)v6 + 16))(v6);
        }
        operator delete(v4);
        int v4 = v7;
      }
      while (v7 != v2);
    }
  }
  if (*((char *)this + 95) < 0) {
    operator delete(*((void **)this + 9));
  }
  std::mutex::~mutex((std::mutex *)((char *)this + 8));

  operator delete(this);
}

uint64_t *std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>>>::find<std::string>(void *a1)
{
  uint64_t v1 = a1;
  int v2 = *((char *)a1 + 23);
  if (v2 >= 0) {
    uint64_t v3 = a1;
  }
  else {
    uint64_t v3 = (uint64_t *)*a1;
  }
  if (v2 >= 0) {
    unint64_t v4 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    unint64_t v4 = a1[1];
  }
  unint64_t v5 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v24, v3, v4);
  unint64_t v6 = qword_26A99FA60;
  if (!qword_26A99FA60) {
    return 0;
  }
  unint64_t v7 = v5;
  uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)qword_26A99FA60);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    unint64_t v9 = v5;
    if (v5 >= qword_26A99FA60) {
      unint64_t v9 = v5 % qword_26A99FA60;
    }
  }
  else
  {
    unint64_t v9 = (qword_26A99FA60 - 1) & v5;
  }
  uint64_t v11 = *(uint64_t ***)(qword_26A99FA58 + 8 * v9);
  if (v11)
  {
    char v12 = *v11;
    if (*v11)
    {
      char v13 = v1[23];
      if (v13 >= 0) {
        uint64_t v14 = v1[23];
      }
      else {
        uint64_t v14 = *((void *)v1 + 1);
      }
      if (v13 < 0) {
        uint64_t v1 = *(unsigned char **)v1;
      }
      if (v8.u32[0] < 2uLL)
      {
        uint64_t v15 = qword_26A99FA60 - 1;
        while (1)
        {
          uint64_t v20 = v12[1];
          if (v20 == v7)
          {
            uint64_t v21 = *((unsigned __int8 *)v12 + 39);
            if ((v21 & 0x80u) == 0) {
              uint64_t v22 = *((unsigned __int8 *)v12 + 39);
            }
            else {
              uint64_t v22 = v12[3];
            }
            if (v22 == v14)
            {
              if ((v21 & 0x80) != 0)
              {
                if (!memcmp((const void *)v12[2], v1, v12[3])) {
                  return v12;
                }
              }
              else
              {
                if (!*((unsigned char *)v12 + 39)) {
                  return v12;
                }
                uint64_t v23 = 0;
                while (*((unsigned __int8 *)v12 + v23 + 16) == v1[v23])
                {
                  if (v21 == ++v23) {
                    return v12;
                  }
                }
              }
            }
          }
          else if ((v20 & v15) != v9)
          {
            return 0;
          }
          double result = 0;
          char v12 = (uint64_t *)*v12;
          if (!v12) {
            return result;
          }
        }
      }
      while (1)
      {
        unint64_t v16 = v12[1];
        if (v16 == v7)
        {
          uint64_t v17 = *((unsigned __int8 *)v12 + 39);
          if ((v17 & 0x80u) == 0) {
            uint64_t v18 = *((unsigned __int8 *)v12 + 39);
          }
          else {
            uint64_t v18 = v12[3];
          }
          if (v18 == v14)
          {
            if ((v17 & 0x80) != 0)
            {
              if (!memcmp((const void *)v12[2], v1, v12[3])) {
                return v12;
              }
            }
            else
            {
              if (!*((unsigned char *)v12 + 39)) {
                return v12;
              }
              uint64_t v19 = 0;
              while (*((unsigned __int8 *)v12 + v19 + 16) == v1[v19])
              {
                if (v17 == ++v19) {
                  return v12;
                }
              }
            }
          }
        }
        else
        {
          if (v16 >= v6) {
            v16 %= v6;
          }
          if (v16 != v9) {
            return 0;
          }
        }
        double result = 0;
        char v12 = (uint64_t *)*v12;
        if (!v12) {
          return result;
        }
      }
    }
  }
  return 0;
}

uint64_t *std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<support::log::global_client_descriptor>>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16))
    {
      uint64_t v3 = *(void *)(v2 + 40);
      *(void *)(v2 + 40) = 0;
      if (v3) {
        (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
      }
      if (*(char *)(v2 + 39) < 0) {
        operator delete(*(void **)(v2 + 16));
      }
    }
    operator delete((void *)v2);
  }
  return a1;
}

void support::log::global_client_descriptor::~global_client_descriptor(void **this)
{
  *this = &unk_270EB0420;
  if ((*((char *)this + 55) & 0x80000000) == 0)
  {
    if ((*((char *)this + 31) & 0x80000000) == 0) {
      return;
    }
LABEL_5:
    operator delete(this[1]);
    return;
  }
  operator delete(this[4]);
  if (*((char *)this + 31) < 0) {
    goto LABEL_5;
  }
}

{
  support::log::global_client_descriptor *v2;
  uint64_t vars8;

  *this = &unk_270EB0420;
  if (*((char *)this + 55) < 0)
  {
    operator delete(this[4]);
    if ((*((char *)this + 31) & 0x80000000) == 0)
    {
LABEL_3:
      uint64_t v2 = (support::log::global_client_descriptor *)this;
      goto LABEL_5;
    }
  }
  else if ((*((char *)this + 31) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(this[1]);
  uint64_t v2 = (support::log::global_client_descriptor *)this;

LABEL_5:
  operator delete(v2);
}

void std::__shared_ptr_pointer<support::log::delegate::context *,std::shared_ptr<support::log::delegate::context>::__shared_ptr_default_delete<support::log::delegate::context,support::log::delegate::context>,std::allocator<support::log::delegate::context>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<support::log::delegate::context *,std::shared_ptr<support::log::delegate::context>::__shared_ptr_default_delete<support::log::delegate::context,support::log::delegate::context>,std::allocator<support::log::delegate::context>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<support::log::delegate::context *,std::shared_ptr<support::log::delegate::context>::__shared_ptr_default_delete<support::log::delegate::context,support::log::delegate::context>,std::allocator<support::log::delegate::context>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x8000000263809204) {
    return a1 + 24;
  }
  if (((v3 & 0x8000000263809204 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000263809204)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000263809204 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void std::__shared_ptr_emplace<support::log::buffer>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB04A0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<support::log::buffer>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB04A0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<support::log::buffer>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void support::log::buffer::~buffer(support::log::buffer *this)
{
  *(void *)this = &unk_270EB04F0;
  uint64_t v2 = (char *)*((void *)this + 9);
  uint64_t v3 = (char *)this + 80;
  if (v2 != (char *)this + 80)
  {
    do
    {
      free(*((void **)v2 + 4));
      unint64_t v4 = (char *)*((void *)v2 + 1);
      if (v4)
      {
        do
        {
          unint64_t v5 = v4;
          unint64_t v4 = *(char **)v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          unint64_t v5 = (char *)*((void *)v2 + 2);
          BOOL v6 = *(void *)v5 == (void)v2;
          uint64_t v2 = v5;
        }
        while (!v6);
      }
      uint64_t v2 = v5;
    }
    while (v5 != v3);
  }
  std::deque<char *>::~deque[abi:ne180100]((uint64_t)this + 96);
  std::__tree<char *>::destroy(*((void **)this + 10));
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
}

{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  BOOL v6;
  uint64_t vars8;

  *(void *)this = &unk_270EB04F0;
  uint64_t v2 = (char *)*((void *)this + 9);
  uint64_t v3 = (char *)this + 80;
  if (v2 != (char *)this + 80)
  {
    do
    {
      free(*((void **)v2 + 4));
      unint64_t v4 = (char *)*((void *)v2 + 1);
      if (v4)
      {
        do
        {
          unint64_t v5 = v4;
          unint64_t v4 = *(char **)v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          unint64_t v5 = (char *)*((void *)v2 + 2);
          BOOL v6 = *(void *)v5 == (void)v2;
          uint64_t v2 = v5;
        }
        while (!v6);
      }
      uint64_t v2 = v5;
    }
    while (v5 != v3);
  }
  std::deque<char *>::~deque[abi:ne180100]((uint64_t)this + 96);
  std::__tree<char *>::destroy(*((void **)this + 10));
  std::mutex::~mutex((std::mutex *)((char *)this + 8));

  operator delete(this);
}

uint64_t std::deque<char *>::~deque[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 8);
  uint64_t v3 = *(void ***)(a1 + 16);
  *(void *)(a1 + 40) = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = *(void ***)(a1 + 16);
      uint64_t v2 = (void **)(*(void *)(a1 + 8) + 8);
      *(void *)(a1 + 8) = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 256;
    goto LABEL_7;
  }
  if (v5 == 2)
  {
    uint64_t v6 = 512;
LABEL_7:
    *(void *)(a1 + 32) = v6;
  }
  if (v2 != v3)
  {
    do
    {
      unint64_t v7 = *v2++;
      operator delete(v7);
    }
    while (v2 != v3);
    uint64_t v9 = *(void *)(a1 + 8);
    uint64_t v8 = *(void *)(a1 + 16);
    if (v8 != v9) {
      *(void *)(a1 + 16) = v8 + ((v9 - v8 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__tree<char *>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<char *>::destroy(*a1);
    std::__tree<char *>::destroy(a1[1]);
    operator delete(a1);
  }
}

void std::__shared_ptr_pointer<support::log::manager *,std::shared_ptr<support::log::manager>::__shared_ptr_default_delete<support::log::manager,support::log::manager>,std::allocator<support::log::manager>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<support::log::manager *,std::shared_ptr<support::log::manager>::__shared_ptr_default_delete<support::log::manager,support::log::manager>,std::allocator<support::log::manager>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<support::log::manager *,std::shared_ptr<support::log::manager>::__shared_ptr_default_delete<support::log::manager,support::log::manager>,std::allocator<support::log::manager>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x8000000263809390) {
    return a1 + 24;
  }
  if (((v3 & 0x8000000263809390 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000263809390)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000263809390 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void std::__shared_ptr_emplace<support::log::manager_global>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB0588;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<support::log::manager_global>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB0588;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<support::log::manager_global>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t __cxx_global_var_init_6()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>::~PthreadMutexGuardPolicy, &ctu::Singleton<support::log::shared_stdio,support::log::shared_stdio,ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>>::sInstance, &dword_2637D5000);
  }
  return result;
}

{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<support::log::manager_global>::~PthreadMutexGuardPolicy, &ctu::Singleton<support::log::manager_global,support::log::manager_global,ctu::PthreadMutexGuardPolicy<support::log::manager_global>>::sInstance, &dword_2637D5000);
  }
  return result;
}

uint64_t HSFilerRT_Internal_INT::Session_INT::Session_INT(uint64_t a1, uint64_t *a2, int a3, char a4, dispatch_object_t *a5)
{
  uint64_t v9 = *a2;
  uint64_t v8 = (std::__shared_weak_count *)a2[1];
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = *a5;
  if (*a5) {
    dispatch_retain(*a5);
  }
  *(void *)a1 = &unk_270EAEDA8;
  *(void *)(a1 + 8) = v9;
  *(void *)(a1 + 16) = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  *(_DWORD *)(a1 + 24) = a3;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 64) = 0;
  *(_DWORD *)(a1 + 72) = 1065353216;
  *(void *)(a1 + 80) = v10;
  if (v10)
  {
    dispatch_retain(v10);
    *(void *)(a1 + 88) = 0;
    *(void *)(a1 + 96) = 0;
    *(void *)(a1 + 104) = 0;
    *(unsigned char *)(a1 + 112) = a4;
    *(_WORD *)(a1 + 113) = 0;
    dispatch_release(v10);
    if (!v8) {
      goto LABEL_13;
    }
  }
  else
  {
    *(void *)(a1 + 88) = 0;
    *(void *)(a1 + 96) = 0;
    *(void *)(a1 + 104) = 0;
    *(unsigned char *)(a1 + 112) = a4;
    *(_WORD *)(a1 + 113) = 0;
    if (!v8) {
      goto LABEL_13;
    }
  }
  if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
LABEL_13:
  *(void *)a1 = &unk_270EB05D8;
  *(void *)(a1 + 120) = 0;
  return a1;
}

void HSFilerRT_Internal_INT::Session_INT::~Session_INT(HSFilerRT_Internal_INT::Session_INT *this)
{
  *(void *)this = &unk_270EB05D8;
  uint64_t v2 = *((void *)this + 15);
  *((void *)this + 15) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  HSFilerRT_Internal::Session::end(this);
  uint64_t v3 = *((void *)this + 15);
  *((void *)this + 15) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }

  HSFilerRT_Internal::Session::~Session(this);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t vars8;

  *(void *)this = &unk_270EB05D8;
  uint64_t v2 = *((void *)this + 15);
  *((void *)this + 15) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  HSFilerRT_Internal::Session::end(this);
  uint64_t v3 = *((void *)this + 15);
  *((void *)this + 15) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }

  HSFilerRT_Internal::Session::~Session(this);
}

{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t vars8;

  *(void *)this = &unk_270EB05D8;
  uint64_t v2 = *((void *)this + 15);
  *((void *)this + 15) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  HSFilerRT_Internal::Session::end(this);
  uint64_t v3 = *((void *)this + 15);
  *((void *)this + 15) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  HSFilerRT_Internal::Session::~Session(this);

  operator delete(v4);
}

void HSFilerRT_Internal_INT::Session_INT::end(HSFilerRT_Internal_INT::Session_INT *this)
{
  uint64_t v2 = *((void *)this + 15);
  *((void *)this + 15) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  HSFilerRT_Internal::Session::end(this);
}

uint64_t HSFilerRT_Internal_INT::startReadSession_sync(uint64_t a1, uint64_t a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (!*(void *)a2
  {
    int64_t v39 = 0;
    __int16 v40 = 0;
    uint64_t v8 = **(NSObject ***)(a1 + 128);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_error_impl(&dword_2637D5000, v8, OS_LOG_TYPE_ERROR, "error: Failed to cast session pointer object", buf, 2u);
      return 0;
    }
    goto LABEL_9;
  }
  unint64_t v5 = *(std::__shared_weak_count **)(a2 + 8);
  int64_t v39 = v4;
  __int16 v40 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  pthread_mutex_lock(&ctu::Singleton<hsfiler_log_manager,hsfiler_log_manager,ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>>::sInstance);
  if (!qword_26A99F880)
  {
    unint64_t v7 = operator new(0xA8uLL);
    v7[1] = 0;
    v7[2] = 0;
    *unint64_t v7 = &unk_270EAF880;
    uint64_t v6 = (const support::log::manager *)(v7 + 3);
    hsfiler_log_manager::hsfiler_log_manager((hsfiler_log_manager *)(v7 + 3));
    uint64_t v11 = (std::__shared_weak_count *)off_26A99F888;
    qword_26A99F880 = (uint64_t)(v7 + 3);
    off_26A99F888 = v7;
    if (!v11)
    {
      *(void *)std::string buf = v7 + 3;
      *(void *)&uint8_t buf[8] = v7;
      goto LABEL_15;
    }
    if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  uint64_t v6 = (const support::log::manager *)qword_26A99F880;
  unint64_t v7 = off_26A99F888;
  *(void *)std::string buf = qword_26A99F880;
  *(void *)&uint8_t buf[8] = off_26A99F888;
  if (off_26A99F888) {
LABEL_15:
  }
    atomic_fetch_add_explicit(v7 + 1, 1uLL, memory_order_relaxed);
  pthread_mutex_unlock(&ctu::Singleton<hsfiler_log_manager,hsfiler_log_manager,ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>>::sInstance);
  support::transport::ARI::create((support::transport::ARI *)"HSFilerARITransport", (dispatch_queue_s *)0x2710, 1, v6, (support::transport::ARI **)v35);
  uint64_t v12 = *(void *)&v35[0];
  *(void *)&v35[0] = 0;
  uint64_t v13 = v39[15];
  v39[15] = v12;
  if (v13)
  {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
    *(void *)&v35[0] = 0;
  }
  uint64_t v14 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8]
    && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  uint64_t v15 = v39;
  unint64_t v16 = **(NSObject ***)(a1 + 128);
  if (!v39[15])
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = v15[4];
      *(_DWORD *)std::string buf = 134217984;
      *(void *)&uint8_t buf[4] = v32;
      _os_log_error_impl(&dword_2637D5000, v16, OS_LOG_TYPE_ERROR, "error: Failed to create ARI transport for session (%llu)", buf, 0xCu);
      uint64_t Session = 0;
      uint64_t v10 = v40;
      if (!v40) {
        return Session;
      }
      goto LABEL_39;
    }
LABEL_9:
    uint64_t Session = 0;
    uint64_t v10 = v40;
    if (!v40) {
      return Session;
    }
    goto LABEL_39;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = v15[4];
    int v18 = *((_DWORD *)v15 + 24);
    *(_DWORD *)std::string buf = 134218240;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = v18;
    _os_log_impl(&dword_2637D5000, v16, OS_LOG_TYPE_DEFAULT, "Starting read session (%llu) with sequenceID (%u)", buf, 0x12u);
  }
  unint64_t v38 = 0xAAAAAAAAAAAAAAAALL;
  hsfiler::ARICommandDriver::ARICommandDriver();
  *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)std::string __p = v19;
  *(_OWORD *)uint64_t v37 = v19;
  v35[2] = v19;
  v35[3] = v19;
  v35[0] = v19;
  v35[1] = v19;
  AriSdk::ARI_IBIFilerHSStartReadBBSessionReq_SDK::ARI_IBIFilerHSStartReadBBSessionReq_SDK((AriSdk::ARI_IBIFilerHSStartReadBBSessionReq_SDK *)v35);
  uint64_t v20 = &buf[2];
  bzero(&buf[2], 0xBB8uLL);
  uint64_t v21 = (uint64_t **)v15[7];
  for (*(_WORD *)std::string buf = v15[8]; v21; v20 += 100)
  {
    while (*((char *)v21 + 39) < 0)
    {
      memcpy(v20, v21[2], (size_t)v21[3]);
      uint64_t v21 = (uint64_t **)*v21;
      v20 += 100;
      if (!v21) {
        goto LABEL_29;
      }
    }
    memcpy(v20, v21 + 2, *((unsigned __int8 *)v21 + 39));
    uint64_t v21 = (uint64_t **)*v21;
  }
LABEL_29:
  int v22 = *((_DWORD *)v15 + 6);
  uint64_t v23 = operator new(4uLL);
  *uint64_t v23 = v22;
  char v24 = __p[0];
  __p[0] = v23;
  if (v24) {
    operator delete(v24);
  }
  unint64_t v25 = operator new(0xBBAuLL);
  memcpy(v25, buf, 0xBBAuLL);
  uint64_t v26 = __p[1];
  __p[1] = v25;
  if (v26) {
    operator delete(v26);
  }
  uint64_t v27 = operator new(4uLL);
  *uint64_t v27 = *((_DWORD *)v15 + 25);
  uint64_t v28 = v37[0];
  v37[0] = v27;
  if (v28) {
    operator delete(v28);
  }
  unint64_t v29 = operator new(4uLL);
  *unint64_t v29 = *((_DWORD *)v15 + 24);
  unint64_t v30 = v37[1];
  v37[1] = v29;
  if (v30) {
    operator delete(v30);
  }
  uint64_t Session = hsfiler::ARICommandDriver::StartReadSession();
  uint64_t v33 = **(NSObject ***)(a1 + 128);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    uint64_t v34 = v15[4];
    *(_DWORD *)uint64_t v41 = 134217984;
    uint64_t v42 = v34;
    _os_log_error_impl(&dword_2637D5000, v33, OS_LOG_TYPE_ERROR, "error: Failed StartReadBBSession ARI command for session (%llu)", v41, 0xCu);
  }
  MEMORY[0x263E6A610](v35);
  hsfiler::ARICommandDriver::~ARICommandDriver((hsfiler::ARICommandDriver *)&v38);
  uint64_t v10 = v40;
  if (v40)
  {
LABEL_39:
    if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  return Session;
}

void sub_2637FFAD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  std::__shared_weak_count::~__shared_weak_count(v34);
  operator delete(v36);
  pthread_mutex_unlock(&ctu::Singleton<hsfiler_log_manager,hsfiler_log_manager,ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>>::sInstance);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a26);
  _Unwind_Resume(a1);
}

uint64_t HSFilerRT_Internal_INT::startWriteSession_sync(uint64_t a1, uint64_t a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (!*(void *)a2
  {
    int64_t v39 = 0;
    __int16 v40 = 0;
    uint64_t v8 = **(NSObject ***)(a1 + 128);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_error_impl(&dword_2637D5000, v8, OS_LOG_TYPE_ERROR, "error: Failed to cast session pointer object", buf, 2u);
      return 0;
    }
    goto LABEL_9;
  }
  unint64_t v5 = *(std::__shared_weak_count **)(a2 + 8);
  int64_t v39 = v4;
  __int16 v40 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  pthread_mutex_lock(&ctu::Singleton<hsfiler_log_manager,hsfiler_log_manager,ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>>::sInstance);
  if (!qword_26A99F880)
  {
    unint64_t v7 = operator new(0xA8uLL);
    v7[1] = 0;
    v7[2] = 0;
    *unint64_t v7 = &unk_270EAF880;
    uint64_t v6 = (const support::log::manager *)(v7 + 3);
    hsfiler_log_manager::hsfiler_log_manager((hsfiler_log_manager *)(v7 + 3));
    uint64_t v11 = (std::__shared_weak_count *)off_26A99F888;
    qword_26A99F880 = (uint64_t)(v7 + 3);
    off_26A99F888 = v7;
    if (!v11)
    {
      *(void *)std::string buf = v7 + 3;
      *(void *)&uint8_t buf[8] = v7;
      goto LABEL_15;
    }
    if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  uint64_t v6 = (const support::log::manager *)qword_26A99F880;
  unint64_t v7 = off_26A99F888;
  *(void *)std::string buf = qword_26A99F880;
  *(void *)&uint8_t buf[8] = off_26A99F888;
  if (off_26A99F888) {
LABEL_15:
  }
    atomic_fetch_add_explicit(v7 + 1, 1uLL, memory_order_relaxed);
  pthread_mutex_unlock(&ctu::Singleton<hsfiler_log_manager,hsfiler_log_manager,ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>>::sInstance);
  support::transport::ARI::create((support::transport::ARI *)"HSFilerARITransport", (dispatch_queue_s *)0x2710, 1, v6, (support::transport::ARI **)v35);
  uint64_t v12 = *(void *)&v35[0];
  *(void *)&v35[0] = 0;
  uint64_t v13 = v39[15];
  v39[15] = v12;
  if (v13)
  {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
    *(void *)&v35[0] = 0;
  }
  uint64_t v14 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8]
    && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  uint64_t v15 = v39;
  unint64_t v16 = **(NSObject ***)(a1 + 128);
  if (!v39[15])
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = v15[4];
      *(_DWORD *)std::string buf = 134217984;
      *(void *)&uint8_t buf[4] = v32;
      _os_log_error_impl(&dword_2637D5000, v16, OS_LOG_TYPE_ERROR, "error: Failed to create ARI transport for session (%llu)", buf, 0xCu);
      uint64_t v9 = 0;
      uint64_t v10 = v40;
      if (!v40) {
        return v9;
      }
      goto LABEL_39;
    }
LABEL_9:
    uint64_t v9 = 0;
    uint64_t v10 = v40;
    if (!v40) {
      return v9;
    }
    goto LABEL_39;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = v15[4];
    int v18 = *((_DWORD *)v15 + 24);
    *(_DWORD *)std::string buf = 134218240;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = v18;
    _os_log_impl(&dword_2637D5000, v16, OS_LOG_TYPE_DEFAULT, "Starting write session (%llu) with sequenceID (%u)", buf, 0x12u);
  }
  unint64_t v38 = 0xAAAAAAAAAAAAAAAALL;
  hsfiler::ARICommandDriver::ARICommandDriver();
  *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)std::string __p = v19;
  *(_OWORD *)uint64_t v37 = v19;
  v35[2] = v19;
  v35[3] = v19;
  v35[0] = v19;
  v35[1] = v19;
  AriSdk::ARI_IBIFilerHSStartWriteBBSessionReq_SDK::ARI_IBIFilerHSStartWriteBBSessionReq_SDK((AriSdk::ARI_IBIFilerHSStartWriteBBSessionReq_SDK *)v35);
  uint64_t v20 = &buf[2];
  bzero(&buf[2], 0xBB8uLL);
  uint64_t v21 = (uint64_t **)v15[7];
  for (*(_WORD *)std::string buf = v15[8]; v21; v20 += 100)
  {
    while (*((char *)v21 + 39) < 0)
    {
      memcpy(v20, v21[2], (size_t)v21[3]);
      uint64_t v21 = (uint64_t **)*v21;
      v20 += 100;
      if (!v21) {
        goto LABEL_29;
      }
    }
    memcpy(v20, v21 + 2, *((unsigned __int8 *)v21 + 39));
    uint64_t v21 = (uint64_t **)*v21;
  }
LABEL_29:
  int v22 = *((_DWORD *)v15 + 6);
  uint64_t v23 = operator new(4uLL);
  *uint64_t v23 = v22;
  char v24 = __p[0];
  __p[0] = v23;
  if (v24) {
    operator delete(v24);
  }
  unint64_t v25 = operator new(0xBBAuLL);
  memcpy(v25, buf, 0xBBAuLL);
  uint64_t v26 = __p[1];
  __p[1] = v25;
  if (v26) {
    operator delete(v26);
  }
  uint64_t v27 = operator new(4uLL);
  *uint64_t v27 = *((_DWORD *)v15 + 25);
  uint64_t v28 = v37[0];
  v37[0] = v27;
  if (v28) {
    operator delete(v28);
  }
  unint64_t v29 = operator new(4uLL);
  *unint64_t v29 = *((_DWORD *)v15 + 24);
  unint64_t v30 = v37[1];
  v37[1] = v29;
  if (v30) {
    operator delete(v30);
  }
  uint64_t v9 = hsfiler::ARICommandDriver::StartWriteSession();
  uint64_t v33 = **(NSObject ***)(a1 + 128);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    uint64_t v34 = v15[4];
    *(_DWORD *)uint64_t v41 = 134217984;
    uint64_t v42 = v34;
    _os_log_error_impl(&dword_2637D5000, v33, OS_LOG_TYPE_ERROR, "error: Failed StartWriteBBSession ARI command for session (%llu)", v41, 0xCu);
  }
  MEMORY[0x263E6A630](v35);
  hsfiler::ARICommandDriver::~ARICommandDriver((hsfiler::ARICommandDriver *)&v38);
  uint64_t v10 = v40;
  if (v40)
  {
LABEL_39:
    if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  return v9;
}

void sub_2638001BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  std::__shared_weak_count::~__shared_weak_count(v34);
  operator delete(v36);
  pthread_mutex_unlock(&ctu::Singleton<hsfiler_log_manager,hsfiler_log_manager,ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>>::sInstance);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a26);
  _Unwind_Resume(a1);
}

uint64_t HSFilerRT_Internal_INT::endSession_sync(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (*(void *)a2
  {
    unint64_t v5 = v4;
    uint64_t v6 = *(std::__shared_weak_count **)(a2 + 8);
    v21[1] = v4;
    v21[2] = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    unint64_t v7 = **(NSObject ***)(a1 + 128);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v5[4];
      int v9 = *((_DWORD *)v5 + 24);
      LODWORD(buf[0]) = 134218240;
      *(void *)((char *)buf + 4) = v8;
      WORD6(buf[0]) = 1024;
      *(_DWORD *)((char *)buf + 14) = v9;
      _os_log_impl(&dword_2637D5000, v7, OS_LOG_TYPE_DEFAULT, "Ending session (%llu) with sequenceID (%u) with the baseband", (uint8_t *)buf, 0x12u);
    }
    v21[0] = 0xAAAAAAAAAAAAAAAALL;
    hsfiler::ARICommandDriver::ARICommandDriver();
    uint64_t v26 = (void *)0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    buf[3] = v10;
    *(_OWORD *)std::string __p = v10;
    buf[1] = v10;
    buf[2] = v10;
    buf[0] = v10;
    AriSdk::ARI_IBIFilerHSEndBBSessionReq_SDK::ARI_IBIFilerHSEndBBSessionReq_SDK((AriSdk::ARI_IBIFilerHSEndBBSessionReq_SDK *)buf);
    int v11 = *((_DWORD *)v5 + 6);
    uint64_t v12 = operator new(4uLL);
    *uint64_t v12 = v11;
    uint64_t v13 = __p[0];
    __p[0] = v12;
    if (v13) {
      operator delete(v13);
    }
    uint64_t v14 = operator new(4uLL);
    _DWORD *v14 = *((_DWORD *)v5 + 24);
    uint64_t v15 = v26;
    uint64_t v26 = v14;
    if (v15) {
      operator delete(v15);
    }
    uint64_t v16 = hsfiler::ARICommandDriver::EndSession();
    long long v19 = **(NSObject ***)(a1 + 128);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = v5[4];
      *(_DWORD *)int v22 = 134217984;
      uint64_t v23 = v20;
      _os_log_error_impl(&dword_2637D5000, v19, OS_LOG_TYPE_ERROR, "error: Failed EndBBSession ARI command for session (%llu)", v22, 0xCu);
    }
    MEMORY[0x263E6A5D0](buf);
    hsfiler::ARICommandDriver::~ARICommandDriver((hsfiler::ARICommandDriver *)v21);
    if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  else
  {
    uint64_t v17 = **(NSObject ***)(a1 + 128);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_error_impl(&dword_2637D5000, v17, OS_LOG_TYPE_ERROR, "error: Failed to cast session pointer object", (uint8_t *)buf, 2u);
    }
    return 0;
  }
  return v16;
}

void sub_263800608(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v5 = va_arg(va2, void);
  uint64_t v7 = va_arg(va2, void);
  uint64_t v8 = va_arg(va2, void);
  uint64_t v9 = va_arg(va2, void);
  uint64_t v10 = va_arg(va2, void);
  uint64_t v11 = va_arg(va2, void);
  MEMORY[0x263E6A5D0](va2);
  hsfiler::ARICommandDriver::~ARICommandDriver((hsfiler::ARICommandDriver *)va);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_26380063C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t HSFilerRT_Internal_INT::getFileSize_sync(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (*(void *)a2
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(std::__shared_weak_count **)(a2 + 8);
    v24[1] = v6;
    void v24[2] = v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v9 = **(NSObject ***)(a1 + 128);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v7[4];
      if (a3[23] >= 0) {
        uint64_t v11 = a3;
      }
      else {
        uint64_t v11 = *(char **)a3;
      }
      *(_DWORD *)std::string buf = 134218242;
      *(void *)&_OWORD buf[4] = v10;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_2637D5000, v9, OS_LOG_TYPE_DEFAULT, "Getting session (%llu) file (%s) size from baseband", buf, 0x16u);
    }
    v24[0] = 0xAAAAAAAAAAAAAAAALL;
    hsfiler::ARICommandDriver::ARICommandDriver();
    uint64_t v32 = (void *)0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)std::string __p = v12;
    long long v31 = v12;
    long long v28 = v12;
    long long v29 = v12;
    *(_OWORD *)std::string buf = v12;
    *(_OWORD *)&uint8_t buf[16] = v12;
    AriSdk::ARI_IBIFilerHSReadBBGetSizeReq_SDK::ARI_IBIFilerHSReadBBGetSizeReq_SDK((AriSdk::ARI_IBIFilerHSReadBBGetSizeReq_SDK *)buf);
    int v13 = *((_DWORD *)v7 + 6);
    uint64_t v14 = operator new(4uLL);
    _DWORD *v14 = v13;
    uint64_t v15 = __p[0];
    __p[0] = v14;
    if (v15) {
      operator delete(v15);
    }
    uint64_t v16 = a3[23];
    if ((v16 & 0x80u) == 0) {
      uint64_t v17 = a3;
    }
    else {
      uint64_t v17 = *(char **)a3;
    }
    if ((v16 & 0x80u) != 0) {
      uint64_t v16 = *((void *)a3 + 1);
    }
    AriSdk::TlvArray<char,100ul>::assign<std::__wrap_iter<char const*>>(&__p[1], v17, &v17[v16]);
    int v18 = operator new(4uLL);
    *int v18 = *((_DWORD *)v7 + 24);
    long long v19 = v32;
    uint64_t v32 = v18;
    if (v19) {
      operator delete(v19);
    }
    hsfiler::ARICommandDriver::GetReadSize();
    int v22 = **(NSObject ***)(a1 + 128);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = v7[4];
      *(_DWORD *)unint64_t v25 = 134217984;
      uint64_t v26 = v23;
      _os_log_error_impl(&dword_2637D5000, v22, OS_LOG_TYPE_ERROR, "error: Failed ReadBBGetSize ARI command for session (%llu)", v25, 0xCu);
    }
    MEMORY[0x263E6A5F0](buf);
    hsfiler::ARICommandDriver::~ARICommandDriver((hsfiler::ARICommandDriver *)v24);
    if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  else
  {
    uint64_t v20 = **(NSObject ***)(a1 + 128);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_error_impl(&dword_2637D5000, v20, OS_LOG_TYPE_ERROR, "error: Failed to cast session pointer object", buf, 2u);
    }
  }
  return 0;
}

void sub_263800A70(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v5 = va_arg(va2, void);
  uint64_t v7 = va_arg(va2, void);
  uint64_t v8 = va_arg(va2, void);
  uint64_t v9 = va_arg(va2, void);
  uint64_t v10 = va_arg(va2, void);
  uint64_t v11 = va_arg(va2, void);
  MEMORY[0x263E6A5F0](va2);
  hsfiler::ARICommandDriver::~ARICommandDriver((hsfiler::ARICommandDriver *)va);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void AriSdk::TlvArray<char,100ul>::assign<std::__wrap_iter<char const*>>(void **a1, char *__src, const char *a3)
{
  size_t v4 = a3 - __src;
  if ((unint64_t)(a3 - __src) < 0x65)
  {
    unint64_t v7 = (unint64_t)a1[2];
    uint64_t v8 = (char *)*a1;
    if (v7 - (unint64_t)*a1 >= v4)
    {
      int v13 = (char *)a1[1];
      if (v13 - v8 < v4)
      {
        uint64_t v14 = &__src[v13 - v8];
        if (v13 != v8)
        {
          memmove(*a1, __src, v13 - v8);
          uint64_t v8 = (char *)a1[1];
        }
        if (a3 != v14) {
          memmove(v8, v14, a3 - v14);
        }
        uint64_t v15 = &v8[a3 - v14];
        goto LABEL_26;
      }
    }
    else
    {
      if (v8)
      {
        a1[1] = v8;
        operator delete(v8);
        unint64_t v7 = 0;
        *a1 = 0;
        a1[1] = 0;
        a1[2] = 0;
      }
      uint64_t v9 = 2 * v7;
      if (2 * v7 <= v4) {
        uint64_t v9 = v4;
      }
      if (v7 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v10 = v9;
      }
      if ((v10 & 0x8000000000000000) != 0) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v8 = (char *)operator new(v10);
      *a1 = v8;
      a1[1] = v8;
      a1[2] = &v8[v10];
    }
    if (a3 != __src) {
      memmove(v8, __src, v4);
    }
    uint64_t v15 = &v8[v4];
LABEL_26:
    a1[1] = v15;
    return;
  }
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/AppleInternal/Library/BuildRoots/7a5643da-a7fb-11ef-987a-36218cb420d5/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/local/include/ARI/ari_sdk_msg.h", "assign", a3);
  if (v17 >= 0) {
    long long v12 = __p;
  }
  else {
    long long v12 = (void **)__p[0];
  }
  Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Range assignment too large(%p), got(%ld) max(%ld)", v11, v12, 385, a1, v4, 100);
  if (v17 < 0) {
    operator delete(__p[0]);
  }
}

void sub_263800C8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t HSFilerRT_Internal_INT::readFile_sync(uint64_t a1, uint64_t a2, char *a3, mach_vm_size_t a4, uint64_t a5)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  if (*(void *)a2)
  {
    if (v10)
    {
      uint64_t v11 = v10;
      long long v12 = *(std::__shared_weak_count **)(a2 + 8);
      int64_t v56 = v10;
      unint64_t v57 = v12;
      if (v12) {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      int v13 = **(NSObject ***)(a1 + 128);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = v11[4];
        if (a3[23] >= 0) {
          uint64_t v15 = a3;
        }
        else {
          uint64_t v15 = *(char **)a3;
        }
        LODWORD(buf[0]) = 134218242;
        *(void *)((char *)buf + 4) = v14;
        WORD6(buf[0]) = 2080;
        *(void *)((char *)buf + 14) = v15;
        _os_log_impl(&dword_2637D5000, v13, OS_LOG_TYPE_DEFAULT, "Reading session (%llu) file (%s) from baseband", (uint8_t *)buf, 0x16u);
      }
      unint64_t v55 = 0xAAAAAAAAAAAAAAAALL;
      hsfiler::ARICommandDriver::ARICommandDriver();
      *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v64 = v16;
      *(_OWORD *)unint64_t v65 = v16;
      buf[3] = v16;
      *(_OWORD *)uint64_t v63 = v16;
      buf[1] = v16;
      buf[2] = v16;
      buf[0] = v16;
      AriSdk::ARI_IBIFilerHSReadBBReq_SDK::ARI_IBIFilerHSReadBBReq_SDK((AriSdk::ARI_IBIFilerHSReadBBReq_SDK *)buf);
      unint64_t v53 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v54 = 0;
      unint64_t v52 = (support::transport::PCIMemRegion *)0xAAAAAAAAAAAAAAAALL;
      char v61 = 11;
      strcpy(__p, "HSFilerRead");
      pthread_mutex_lock(&ctu::Singleton<hsfiler_log_manager,hsfiler_log_manager,ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>>::sInstance);
      if (!qword_26A99F880)
      {
        int v18 = (std::__shared_weak_count *)operator new(0xA8uLL);
        v18->__shared_owners_ = 0;
        v18->__shared_weak_owners_ = 0;
        v18->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAF880;
        uint64_t v17 = (uint64_t)&v18[1];
        hsfiler_log_manager::hsfiler_log_manager((hsfiler_log_manager *)&v18[1]);
        uint64_t v21 = (std::__shared_weak_count *)off_26A99F888;
        qword_26A99F880 = (uint64_t)&v18[1];
        off_26A99F888 = v18;
        if (!v21)
        {
          uint64_t v50 = (uint64_t)&v18[1];
          uint64_t v51 = v18;
LABEL_20:
          atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_21:
          pthread_mutex_unlock(&ctu::Singleton<hsfiler_log_manager,hsfiler_log_manager,ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>>::sInstance);
          support::transport::PCIMemRegion::create((const void **)__p, 3, a4, 0, 0, 5000, v17, &v52);
          if (v51 && !atomic_fetch_add(&v51->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
            std::__shared_weak_count::__release_weak(v51);
            if ((v61 & 0x80000000) == 0)
            {
LABEL_25:
              if (v52)
              {
                int v22 = v56;
                int v23 = v56[6];
                char v24 = operator new(4uLL);
                _DWORD *v24 = v23;
                unint64_t v25 = v63[0];
                v63[0] = v24;
                if (v25) {
                  operator delete(v25);
                }
                uint64_t v26 = a3[23];
                if ((v26 & 0x80u) == 0) {
                  uint64_t v27 = a3;
                }
                else {
                  uint64_t v27 = *(char **)a3;
                }
                if ((v26 & 0x80u) != 0) {
                  uint64_t v26 = *((void *)a3 + 1);
                }
                AriSdk::TlvArray<char,100ul>::assign<std::__wrap_iter<char const*>>(&v63[1], v27, &v27[v26]);
                long long v28 = operator new(8uLL);
                void *v28 = a4;
                long long v29 = v65[0];
                v65[0] = v28;
                if (v29) {
                  operator delete(v29);
                }
                unint64_t v30 = operator new(4uLL);
                *unint64_t v30 = v22[24];
                long long v31 = v65[1];
                v65[1] = v30;
                if (v31) {
                  operator delete(v31);
                }
                uint64_t FileFromBB = hsfiler::ARICommandDriver::ReadFileFromBB();
                uint64_t v20 = FileFromBB;
                if (v54) {
                  char v33 = FileFromBB;
                }
                else {
                  char v33 = 0;
                }
                if ((v33 & 1) == 0)
                {
                  unint64_t v46 = **(NSObject ***)(a1 + 128);
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v47 = *((void *)v22 + 4);
                    *(_DWORD *)std::string __p = 134217984;
                    *(void *)&__p[4] = v47;
                    _os_log_error_impl(&dword_2637D5000, v46, OS_LOG_TYPE_ERROR, "error: Failed ReadBB ARI command for session (%llu)", (uint8_t *)__p, 0xCu);
                  }
                  goto LABEL_50;
                }
                int v34 = *v54[9];
                if (!v34)
                {
                  uint64_t v35 = *(void *)(a5 + 24);
                  if (v35)
                  {
                    *(void *)std::string __p = *((void *)v52 + 20);
                    uint64_t v50 = a4;
                    (*(void (**)(uint64_t, char *, uint64_t *))(*(void *)v35 + 48))(v35, __p, &v50);
                  }
                  uint64_t v36 = **(NSObject ***)(a1 + 128);
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v37 = *((void *)v22 + 4);
                    if (a3[23] >= 0) {
                      unint64_t v38 = a3;
                    }
                    else {
                      unint64_t v38 = *(char **)a3;
                    }
                    *(_DWORD *)std::string __p = 134218242;
                    *(void *)&__p[4] = v37;
                    __int16 v59 = 2080;
                    uint8x8_t v60 = v38;
                    _os_log_impl(&dword_2637D5000, v36, OS_LOG_TYPE_DEFAULT, "Successfully read session (%llu) file (%s) from baseband", (uint8_t *)__p, 0x16u);
                  }
                  uint64_t v20 = 1;
                  goto LABEL_50;
                }
                uint64_t v48 = **(NSObject ***)(a1 + 128);
                if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_66;
                }
                uint64_t v49 = *((void *)v22 + 4);
                *(_DWORD *)std::string __p = 134218240;
                *(void *)&__p[4] = v49;
                __int16 v59 = 1024;
                LODWORD(v60) = v34;
                uint64_t v43 = "error: Failed ReadBB ARI command for session (%llu): result %d";
                uint64_t v44 = v48;
                uint32_t v45 = 18;
              }
              else
              {
                uint64_t v42 = **(NSObject ***)(a1 + 128);
                if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                {
LABEL_66:
                  uint64_t v20 = 0;
LABEL_50:
                  if (v54) {
                    (*((void (**)(_DWORD **))*v54 + 2))(v54);
                  }
                  int64_t v39 = (std::__shared_weak_count *)v53;
                  if (v53 && !atomic_fetch_add((atomic_ullong *volatile)(v53 + 8), 0xFFFFFFFFFFFFFFFFLL))
                  {
                    ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
                    std::__shared_weak_count::__release_weak(v39);
                  }
                  MEMORY[0x263E6A590](buf);
                  hsfiler::ARICommandDriver::~ARICommandDriver((hsfiler::ARICommandDriver *)&v55);
                  __int16 v40 = v57;
                  if (v57 && !atomic_fetch_add(&v57->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                  {
                    ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
                    std::__shared_weak_count::__release_weak(v40);
                  }
                  return v20;
                }
                *(_WORD *)std::string __p = 0;
                uint64_t v43 = "error: Failed to create PCI memory region";
                uint64_t v44 = v42;
                uint32_t v45 = 2;
              }
              _os_log_error_impl(&dword_2637D5000, v44, OS_LOG_TYPE_ERROR, v43, (uint8_t *)__p, v45);
              uint64_t v20 = 0;
              goto LABEL_50;
            }
          }
          else if ((v61 & 0x80000000) == 0)
          {
            goto LABEL_25;
          }
          operator delete(*(void **)__p);
          goto LABEL_25;
        }
        if (!atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
      }
      uint64_t v17 = qword_26A99F880;
      int v18 = (std::__shared_weak_count *)off_26A99F888;
      uint64_t v50 = qword_26A99F880;
      uint64_t v51 = (std::__shared_weak_count *)off_26A99F888;
      if (!off_26A99F888) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  long long v19 = **(NSObject ***)(a1 + 128);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf[0]) = 0;
    _os_log_error_impl(&dword_2637D5000, v19, OS_LOG_TYPE_ERROR, "error: Failed to cast session pointer object", (uint8_t *)buf, 2u);
  }
  return 0;
}

void sub_263801358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,char a27)
{
  std::__shared_weak_count::~__shared_weak_count(v27);
  operator delete(v29);
  pthread_mutex_unlock(&ctu::Singleton<hsfiler_log_manager,hsfiler_log_manager,ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>>::sInstance);
  MEMORY[0x263E6A590](&a27);
  hsfiler::ARICommandDriver::~ARICommandDriver((hsfiler::ARICommandDriver *)&a14);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  _Unwind_Resume(a1);
}

uint64_t HSFilerRT_Internal_INT::writeFile_sync(uint64_t a1, uint64_t a2, char *a3, mach_vm_size_t a4, uint64_t a5)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  if (*(void *)a2)
  {
    if (v10)
    {
      uint64_t v11 = v10;
      long long v12 = *(std::__shared_weak_count **)(a2 + 8);
      unint64_t v55 = v10;
      int64_t v56 = v12;
      if (v12) {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      int v13 = **(NSObject ***)(a1 + 128);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = v11[4];
        if (a3[23] >= 0) {
          uint64_t v15 = a3;
        }
        else {
          uint64_t v15 = *(char **)a3;
        }
        LODWORD(buf[0]) = 134218242;
        *(void *)((char *)buf + 4) = v14;
        WORD6(buf[0]) = 2080;
        *(void *)((char *)buf + 14) = v15;
        _os_log_impl(&dword_2637D5000, v13, OS_LOG_TYPE_DEFAULT, "Writing session (%llu) file (%s) to baseband", (uint8_t *)buf, 0x16u);
      }
      unint64_t v54 = 0xAAAAAAAAAAAAAAAALL;
      hsfiler::ARICommandDriver::ARICommandDriver();
      long long v64 = (void *)0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v62 = v16;
      *(_OWORD *)uint64_t v63 = v16;
      buf[3] = v16;
      *(_OWORD *)char v61 = v16;
      buf[1] = v16;
      buf[2] = v16;
      buf[0] = v16;
      AriSdk::ARI_IBIFilerHSWriteBBReq_SDK::ARI_IBIFilerHSWriteBBReq_SDK((AriSdk::ARI_IBIFilerHSWriteBBReq_SDK *)buf);
      unint64_t v52 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v53 = 0;
      uint64_t v51 = (support::transport::PCIMemRegion *)0xAAAAAAAAAAAAAAAALL;
      char v59 = 12;
      strcpy(__p, "HSFilerWrite");
      pthread_mutex_lock(&ctu::Singleton<hsfiler_log_manager,hsfiler_log_manager,ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>>::sInstance);
      if (!qword_26A99F880)
      {
        int v18 = (std::__shared_weak_count *)operator new(0xA8uLL);
        v18->__shared_owners_ = 0;
        v18->__shared_weak_owners_ = 0;
        v18->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EAF880;
        uint64_t v17 = (uint64_t)&v18[1];
        hsfiler_log_manager::hsfiler_log_manager((hsfiler_log_manager *)&v18[1]);
        uint64_t v21 = (std::__shared_weak_count *)off_26A99F888;
        qword_26A99F880 = (uint64_t)&v18[1];
        off_26A99F888 = v18;
        if (!v21)
        {
          uint64_t v49 = (uint64_t)&v18[1];
          uint64_t v50 = v18;
LABEL_20:
          atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_21:
          pthread_mutex_unlock(&ctu::Singleton<hsfiler_log_manager,hsfiler_log_manager,ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>>::sInstance);
          support::transport::PCIMemRegion::create((const void **)__p, 3, a4, 0, 0, 5000, v17, &v51);
          if (v50 && !atomic_fetch_add(&v50->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
            std::__shared_weak_count::__release_weak(v50);
            if ((v59 & 0x80000000) == 0)
            {
LABEL_25:
              if (v51)
              {
                uint64_t v22 = *(void *)(a5 + 24);
                if (v22)
                {
                  *(void *)std::string __p = *((void *)v51 + 20);
                  uint64_t v49 = a4;
                  if ((*(uint64_t (**)(uint64_t, unsigned char *, uint64_t *))(*(void *)v22 + 48))(v22, __p, &v49))
                  {
                    int v23 = v55;
                    int v24 = v55[6];
                    unint64_t v25 = operator new(4uLL);
                    *unint64_t v25 = v24;
                    uint64_t v26 = v61[0];
                    v61[0] = v25;
                    if (v26) {
                      operator delete(v26);
                    }
                    uint64_t v27 = a3[23];
                    if ((v27 & 0x80u) == 0) {
                      long long v28 = a3;
                    }
                    else {
                      long long v28 = *(char **)a3;
                    }
                    if ((v27 & 0x80u) != 0) {
                      uint64_t v27 = *((void *)a3 + 1);
                    }
                    AriSdk::TlvArray<char,100ul>::assign<std::__wrap_iter<char const*>>(&v61[1], v28, &v28[v27]);
                    long long v29 = operator new(8uLL);
                    *long long v29 = a4;
                    unint64_t v30 = v63[0];
                    v63[0] = v29;
                    if (v30) {
                      operator delete(v30);
                    }
                    long long v31 = operator new(4uLL);
                    *long long v31 = v23[24];
                    uint64_t v32 = v64;
                    long long v64 = v31;
                    if (v32) {
                      operator delete(v32);
                    }
                    uint64_t v33 = hsfiler::ARICommandDriver::WriteFileToBB();
                    uint64_t v20 = v33;
                    if (v53) {
                      char v34 = v33;
                    }
                    else {
                      char v34 = 0;
                    }
                    if ((v34 & 1) == 0)
                    {
                      unint64_t v46 = **(NSObject ***)(a1 + 128);
                      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v47 = *((void *)v23 + 4);
                        *(_DWORD *)std::string __p = 134217984;
                        *(void *)&__p[4] = v47;
                        _os_log_error_impl(&dword_2637D5000, v46, OS_LOG_TYPE_ERROR, "error: Failed WriteBB ARI command for session (%llu)", __p, 0xCu);
                      }
                      goto LABEL_50;
                    }
                    int v35 = *v53[9];
                    uint64_t v36 = **(NSObject ***)(a1 + 128);
                    if (!v35)
                    {
                      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                      {
                        uint64_t v37 = *((void *)v23 + 4);
                        if (a3[23] >= 0) {
                          unint64_t v38 = a3;
                        }
                        else {
                          unint64_t v38 = *(char **)a3;
                        }
                        *(_DWORD *)std::string __p = 134218242;
                        *(void *)&__p[4] = v37;
                        *(_WORD *)&char __p[12] = 2080;
                        uint64_t v58 = v38;
                        _os_log_impl(&dword_2637D5000, v36, OS_LOG_TYPE_DEFAULT, "Wrote session (%llu) file (%s) to baseband", __p, 0x16u);
                      }
                      uint64_t v20 = 1;
                      goto LABEL_50;
                    }
                    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_71;
                    }
                    uint64_t v48 = *((void *)v23 + 4);
                    *(_DWORD *)std::string __p = 134218240;
                    *(void *)&__p[4] = v48;
                    *(_WORD *)&char __p[12] = 1024;
                    LODWORD(v58) = v35;
                    uint64_t v43 = "error: Failed WriteBB ARI command for session (%llu): result %d";
                    uint64_t v44 = v36;
                    uint32_t v45 = 18;
LABEL_73:
                    _os_log_error_impl(&dword_2637D5000, v44, OS_LOG_TYPE_ERROR, v43, __p, v45);
                    uint64_t v20 = 0;
                    goto LABEL_50;
                  }
                  uint64_t v42 = **(NSObject ***)(a1 + 128);
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)std::string __p = 0;
                    uint64_t v43 = "error: Failed to get data from caller";
                    goto LABEL_67;
                  }
LABEL_71:
                  uint64_t v20 = 0;
LABEL_50:
                  if (v53) {
                    (*((void (**)(_DWORD **))*v53 + 2))(v53);
                  }
                  int64_t v39 = (std::__shared_weak_count *)v52;
                  if (v52 && !atomic_fetch_add((atomic_ullong *volatile)(v52 + 8), 0xFFFFFFFFFFFFFFFFLL))
                  {
                    ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
                    std::__shared_weak_count::__release_weak(v39);
                  }
                  MEMORY[0x263E6A5B0](buf);
                  hsfiler::ARICommandDriver::~ARICommandDriver((hsfiler::ARICommandDriver *)&v54);
                  __int16 v40 = v56;
                  if (v56 && !atomic_fetch_add(&v56->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                  {
                    ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
                    std::__shared_weak_count::__release_weak(v40);
                  }
                  return v20;
                }
                uint64_t v42 = **(NSObject ***)(a1 + 128);
                if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_71;
                }
                *(_WORD *)std::string __p = 0;
                uint64_t v43 = "error: Invalid write buffer callback";
              }
              else
              {
                uint64_t v42 = **(NSObject ***)(a1 + 128);
                if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_71;
                }
                *(_WORD *)std::string __p = 0;
                uint64_t v43 = "error: Failed to create PCI memory region";
              }
LABEL_67:
              uint64_t v44 = v42;
              uint32_t v45 = 2;
              goto LABEL_73;
            }
          }
          else if ((v59 & 0x80000000) == 0)
          {
            goto LABEL_25;
          }
          operator delete(*(void **)__p);
          goto LABEL_25;
        }
        if (!atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
      }
      uint64_t v17 = qword_26A99F880;
      int v18 = (std::__shared_weak_count *)off_26A99F888;
      uint64_t v49 = qword_26A99F880;
      uint64_t v50 = (std::__shared_weak_count *)off_26A99F888;
      if (!off_26A99F888) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  long long v19 = **(NSObject ***)(a1 + 128);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf[0]) = 0;
    _os_log_error_impl(&dword_2637D5000, v19, OS_LOG_TYPE_ERROR, "error: Failed to cast session pointer object", (uint8_t *)buf, 2u);
  }
  return 0;
}

void sub_263801B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,char a27)
{
  std::__shared_weak_count::~__shared_weak_count(v27);
  operator delete(v29);
  pthread_mutex_unlock(&ctu::Singleton<hsfiler_log_manager,hsfiler_log_manager,ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>>::sInstance);
  MEMORY[0x263E6A5B0](&a27);
  hsfiler::ARICommandDriver::~ARICommandDriver((hsfiler::ARICommandDriver *)&a14);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void HSFilerRT_Internal_INT::~HSFilerRT_Internal_INT(HSFilerRT_Internal_INT *this)
{
  HSFilerRT_Internal::~HSFilerRT_Internal(this);

  operator delete(v1);
}

void HSFilerRT_Internal::~HSFilerRT_Internal(HSFilerRT_Internal *this)
{
  *(void *)this = &unk_270EAF5B0;
  uint64_t v2 = (const void *)*((void *)this + 26);
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 25);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  size_t v4 = (std::__shared_weak_count *)*((void *)this + 21);
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  *((void *)this + 10) = &unk_270EAECE0;
  uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 18);
  if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  uint64_t v6 = (std::__shared_weak_count *)*((void *)this + 9);
  if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  std::__tree<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::__map_value_compare<HSFilerClientID,std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>,std::less<HSFilerClientID>,true>,std::allocator<std::__value_type<HSFilerClientID,std::map<unsigned long long,std::shared_ptr<HSFilerRT_Internal::Session>>>>>::destroy((uint64_t)this + 40, *((void **)this + 6));
  unint64_t v7 = *((void *)this + 4);
  if (v7) {
    dispatch_release(v7);
  }
  uint64_t v8 = *((void *)this + 3);
  if (v8) {
    dispatch_release(v8);
  }
  uint64_t v9 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v9) {
    std::__shared_weak_count::__release_weak(v9);
  }
}

uint64_t __cxx_global_var_init_7()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>::~PthreadMutexGuardPolicy, &ctu::Singleton<support::log::shared_stdio,support::log::shared_stdio,ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>>::sInstance, &dword_2637D5000);
  }
  return result;
}

uint64_t __cxx_global_var_init_3_0()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>::~PthreadMutexGuardPolicy, &ctu::Singleton<hsfiler_log_manager,hsfiler_log_manager,ctu::PthreadMutexGuardPolicy<hsfiler_log_manager>>::sInstance, &dword_2637D5000);
  }
  return result;
}

uint64_t HSFilerSession::HSFilerSession(uint64_t result, int a2, uint64_t a3)
{
  *(void *)uint64_t result = &unk_270EB0680;
  *(_DWORD *)(result + 8) = a2;
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  *(void *)(result + 16) = a3;
  return result;
}

{
  *(void *)uint64_t result = &unk_270EB0680;
  *(_DWORD *)(result + 8) = a2;
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  *(void *)(result + 16) = a3;
  return result;
}

void HSFilerSession::~HSFilerSession(HSFilerSession *this)
{
  *(void *)this = &unk_270EB0680;
  uint64_t v2 = (HSFilerRT *)pthread_mutex_lock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  uint64_t v3 = off_26A99F9B0;
  if (!off_26A99F9B0)
  {
    HSFilerRT::create_default_global(v2, &v12);
    long long v4 = v12;
    long long v12 = 0uLL;
    uint64_t v5 = (std::__shared_weak_count *)*(&off_26A99F9B0 + 1);
    off_26A99F9B0 = v4;
    if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v6 = (std::__shared_weak_count *)*((void *)&v12 + 1);
    if (*((void *)&v12 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v12 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
    uint64_t v3 = off_26A99F9B0;
  }
  unint64_t v7 = (std::__shared_weak_count *)*(&off_26A99F9B0 + 1);
  if (*(&off_26A99F9B0 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F9B0 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  int v8 = *((_DWORD *)this + 2);
  uint64_t v9 = *((void *)this + 2);
  uint64_t v10 = *(void *)(v3 + 8);
  *(void *)&long long v12 = MEMORY[0x263EF8330];
  *((void *)&v12 + 1) = 0x40000000;
  int v13 = ___ZN18HSFilerRT_Internal14destroySessionE15HSFilerClientIDy_block_invoke;
  uint64_t v14 = &__block_descriptor_tmp_4;
  int v17 = v8;
  uint64_t v15 = v10;
  uint64_t v16 = v9;
  ctu::SharedSynchronizable<HSFilerRT_Internal>::execute_wrapped((uint64_t *)(v10 + 8), (uint64_t)&v12);
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  uint64_t v11 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v11)
  {
    if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

{
  void *v1;
  uint64_t vars8;

  HSFilerSession::~HSFilerSession(this);

  operator delete(v1);
}

void sub_263802068(void *a1)
{
}

BOOL HSFilerSession::addToQueue(uint64_t a1, uint64_t *a2, const void **a3, int a4)
{
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  int v8 = (HSFilerRT *)pthread_mutex_lock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  uint64_t v9 = off_26A99F9B0;
  if (!off_26A99F9B0)
  {
    HSFilerRT::create_default_global(v8, &v22);
    long long v10 = v22;
    long long v22 = 0uLL;
    uint64_t v11 = (std::__shared_weak_count *)*(&off_26A99F9B0 + 1);
    off_26A99F9B0 = v10;
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    long long v12 = (std::__shared_weak_count *)*((void *)&v22 + 1);
    if (*((void *)&v22 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v22 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    uint64_t v9 = off_26A99F9B0;
  }
  int v13 = (std::__shared_weak_count *)*(&off_26A99F9B0 + 1);
  unint64_t v20 = v9;
  unint64_t v21 = *(&off_26A99F9B0 + 1);
  if (*(&off_26A99F9B0 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F9B0 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  unsigned int v14 = *(_DWORD *)(a1 + 8);
  uint64_t v15 = *(void *)(a1 + 16);
  if (*a3) {
    uint64_t v16 = _Block_copy(*a3);
  }
  else {
    uint64_t v16 = 0;
  }
  long long v19 = v16;
  BOOL v17 = HSFilerRT::queueSession(v9, v14, v15, a2, &v19, a4);
  if (v16) {
    _Block_release(v16);
  }
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  return v17;
}

void sub_26380228C(_Unwind_Exception *a1)
{
}

void sub_2638022B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (v11) {
    _Block_release(v11);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

BOOL HSFilerSession::removeFromQueue(HSFilerSession *this)
{
  uint64_t v2 = (HSFilerRT *)pthread_mutex_lock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  uint64_t v3 = off_26A99F9B0;
  if (!off_26A99F9B0)
  {
    HSFilerRT::create_default_global(v2, &v10);
    long long v4 = v10;
    long long v10 = 0uLL;
    uint64_t v5 = (std::__shared_weak_count *)*(&off_26A99F9B0 + 1);
    off_26A99F9B0 = v4;
    if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v6 = (std::__shared_weak_count *)*((void *)&v10 + 1);
    if (*((void *)&v10 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v10 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
    uint64_t v3 = off_26A99F9B0;
  }
  unint64_t v7 = (std::__shared_weak_count *)*(&off_26A99F9B0 + 1);
  if (*(&off_26A99F9B0 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F9B0 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  BOOL result = HSFilerRT_Internal::removeSessionFromQueue(*(void *)(v3 + 8), *((_DWORD *)this + 2), *((void *)this + 2));
  BOOL v9 = result;
  if (v7)
  {
    if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
      return v9;
    }
  }
  return result;
}

void sub_263802468(_Unwind_Exception *a1)
{
}

void sub_263802484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t HSFilerReadSession::HSFilerReadSession(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)(result + 8) = a2;
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  *(void *)(result + 16) = a3;
  *(void *)BOOL result = &unk_270EB06B8;
  return result;
}

{
  *(_DWORD *)(result + 8) = a2;
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  *(void *)(result + 16) = a3;
  *(void *)BOOL result = &unk_270EB06B8;
  return result;
}

void HSFilerReadSession::~HSFilerReadSession(HSFilerReadSession *this)
{
  HSFilerSession::~HSFilerSession(this);

  operator delete(v1);
}

void HSFilerReadSession::create(unsigned int a1@<W0>, NSObject **a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  int v8 = (HSFilerRT *)pthread_mutex_lock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  uint64_t v9 = off_26A99F9B0;
  if (!off_26A99F9B0)
  {
    HSFilerRT::create_default_global(v8, &v24);
    long long v10 = v24;
    long long v24 = 0uLL;
    uint64_t v11 = (std::__shared_weak_count *)*(&off_26A99F9B0 + 1);
    off_26A99F9B0 = v10;
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    long long v12 = (std::__shared_weak_count *)*((void *)&v24 + 1);
    if (*((void *)&v24 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v24 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    uint64_t v9 = off_26A99F9B0;
  }
  unint64_t v22 = v9;
  unint64_t v23 = *(&off_26A99F9B0 + 1);
  if (*(&off_26A99F9B0 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F9B0 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  uint64_t v13 = *a3;
  unsigned int v14 = (std::__shared_weak_count *)a3[1];
  v21[0] = v13;
  v21[1] = (uint64_t)v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v15 = *a2;
  unint64_t v20 = v15;
  if (v15) {
    dispatch_retain(v15);
  }
  uint64_t v16 = HSFilerRT::createSession(v9, v21, 1, a1, &v20);
  if (v15) {
    dispatch_release(v15);
  }
  if (!v14 || atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (v16) {
      goto LABEL_20;
    }
LABEL_23:
    *a4 = 0;
    a4[1] = 0;
    long long v19 = (std::__shared_weak_count *)v23;
    if (!v23) {
      return;
    }
    goto LABEL_24;
  }
  ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
  std::__shared_weak_count::__release_weak(v14);
  if (!v16) {
    goto LABEL_23;
  }
LABEL_20:
  *a4 = 0xAAAAAAAAAAAAAAAALL;
  a4[1] = 0xAAAAAAAAAAAAAAAALL;
  BOOL v17 = operator new(0x28uLL);
  v17[2] = a1;
  *((void *)v17 + 3) = 0;
  *((void *)v17 + 4) = 0;
  *((void *)v17 + 2) = v16;
  *(void *)BOOL v17 = &unk_270EB06B8;
  *a4 = v17;
  int v18 = operator new(0x20uLL);
  *int v18 = &unk_270EB0768;
  v18[1] = 0;
  v18[2] = 0;
  void v18[3] = v17;
  a4[1] = v18;
  long long v19 = (std::__shared_weak_count *)v23;
  if (!v23) {
    return;
  }
LABEL_24:
  if (!atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
}

void sub_2638027CC(_Unwind_Exception *a1)
{
}

void sub_2638027E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  HSFilerSession::~HSFilerSession(v13);
  operator delete(v15);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void sub_263802808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_26380281C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  if (v13) {
    dispatch_release(v13);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

BOOL HSFilerReadSession::readWithFile(uint64_t a1, uint64_t a2, uint64_t a3, const void **a4)
{
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  int v8 = (HSFilerRT *)pthread_mutex_lock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  uint64_t v9 = off_26A99F9B0;
  if (!off_26A99F9B0)
  {
    HSFilerRT::create_default_global(v8, &v23);
    long long v10 = v23;
    long long v23 = 0uLL;
    uint64_t v11 = (std::__shared_weak_count *)*(&off_26A99F9B0 + 1);
    off_26A99F9B0 = v10;
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    long long v12 = (std::__shared_weak_count *)*((void *)&v23 + 1);
    if (*((void *)&v23 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v23 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    uint64_t v9 = off_26A99F9B0;
  }
  uint64_t v13 = (std::__shared_weak_count *)*(&off_26A99F9B0 + 1);
  unint64_t v21 = v9;
  unint64_t v22 = *(&off_26A99F9B0 + 1);
  if (*(&off_26A99F9B0 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F9B0 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  unsigned int v14 = *(_DWORD *)(a1 + 8);
  uint64_t v15 = *(void *)(a1 + 16);
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string v20 = *(std::string *)a3;
  }
  if (*a4) {
    uint64_t v16 = _Block_copy(*a4);
  }
  else {
    uint64_t v16 = 0;
  }
  long long v19 = v16;
  BOOL v17 = HSFilerRT::readWithFile(v9, v14, v15, a2, (uint64_t)&v20, &v19);
  if (v16) {
    _Block_release(v16);
  }
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v20.__r_.__value_.__l.__data_);
  }
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  return v17;
}

void sub_263802A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_263802A64(_Unwind_Exception *a1)
{
}

void sub_263802A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, char a18)
{
  if (v18) {
    _Block_release(v18);
  }
  if (a16 < 0) {
    operator delete(__p);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  _Unwind_Resume(a1);
}

BOOL HSFilerReadSession::readWithStream(uint64_t a1, uint64_t a2, uint64_t *a3, const void **a4)
{
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
  int v8 = (HSFilerRT *)pthread_mutex_lock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  uint64_t v9 = off_26A99F9B0;
  if (!off_26A99F9B0)
  {
    HSFilerRT::create_default_global(v8, &v25);
    long long v10 = v25;
    long long v25 = 0uLL;
    uint64_t v11 = (std::__shared_weak_count *)*(&off_26A99F9B0 + 1);
    off_26A99F9B0 = v10;
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    long long v12 = (std::__shared_weak_count *)*((void *)&v25 + 1);
    if (*((void *)&v25 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v25 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    uint64_t v9 = off_26A99F9B0;
  }
  unint64_t v23 = v9;
  unint64_t v24 = *(&off_26A99F9B0 + 1);
  if (*(&off_26A99F9B0 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F9B0 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  unsigned int v13 = *(_DWORD *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *a3;
  uint64_t v16 = (std::__shared_weak_count *)a3[1];
  v22[0] = v15;
  v22[1] = (uint64_t)v16;
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (*a4) {
    BOOL v17 = _Block_copy(*a4);
  }
  else {
    BOOL v17 = 0;
  }
  unint64_t v21 = v17;
  BOOL v18 = HSFilerRT::readWithStream(v9, v13, v14, a2, v22, &v21);
  if (v17) {
    _Block_release(v17);
  }
  if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  long long v19 = (std::__shared_weak_count *)v24;
  if (v24 && !atomic_fetch_add((atomic_ullong *volatile)(v24 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
  return v18;
}

void sub_263802CE8(_Unwind_Exception *a1)
{
}

void sub_263802D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  if (v13) {
    _Block_release(v13);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

BOOL HSFilerReadSession::readWithBuff(uint64_t a1, uint64_t a2, uint64_t *a3, const void **a4)
{
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
  int v8 = (HSFilerRT *)pthread_mutex_lock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  uint64_t v9 = off_26A99F9B0;
  if (!off_26A99F9B0)
  {
    HSFilerRT::create_default_global(v8, &v25);
    long long v10 = v25;
    long long v25 = 0uLL;
    uint64_t v11 = (std::__shared_weak_count *)*(&off_26A99F9B0 + 1);
    off_26A99F9B0 = v10;
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    long long v12 = (std::__shared_weak_count *)*((void *)&v25 + 1);
    if (*((void *)&v25 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v25 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    uint64_t v9 = off_26A99F9B0;
  }
  unint64_t v23 = v9;
  unint64_t v24 = *(&off_26A99F9B0 + 1);
  if (*(&off_26A99F9B0 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F9B0 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  unsigned int v13 = *(_DWORD *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *a3;
  uint64_t v16 = (std::__shared_weak_count *)a3[1];
  v22[0] = v15;
  v22[1] = (uint64_t)v16;
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (*a4) {
    BOOL v17 = _Block_copy(*a4);
  }
  else {
    BOOL v17 = 0;
  }
  unint64_t v21 = v17;
  BOOL v18 = HSFilerRT::readWithBuff(v9, v13, v14, a2, v22, &v21);
  if (v17) {
    _Block_release(v17);
  }
  if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  long long v19 = (std::__shared_weak_count *)v24;
  if (v24 && !atomic_fetch_add((atomic_ullong *volatile)(v24 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
  return v18;
}

void sub_263802F64(_Unwind_Exception *a1)
{
}

void sub_263802F88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  if (v13) {
    _Block_release(v13);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t HSFilerWriteSession::HSFilerWriteSession(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)(result + 8) = a2;
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  *(void *)(result + 16) = a3;
  *(void *)BOOL result = &unk_270EB06F0;
  return result;
}

{
  *(_DWORD *)(result + 8) = a2;
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  *(void *)(result + 16) = a3;
  *(void *)BOOL result = &unk_270EB06F0;
  return result;
}

void HSFilerWriteSession::~HSFilerWriteSession(HSFilerWriteSession *this)
{
  HSFilerSession::~HSFilerSession(this);

  operator delete(v1);
}

void HSFilerWriteSession::create(unsigned int a1@<W0>, NSObject **a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  int v8 = (HSFilerRT *)pthread_mutex_lock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  uint64_t v9 = off_26A99F9B0;
  if (!off_26A99F9B0)
  {
    HSFilerRT::create_default_global(v8, &v24);
    long long v10 = v24;
    long long v24 = 0uLL;
    uint64_t v11 = (std::__shared_weak_count *)*(&off_26A99F9B0 + 1);
    off_26A99F9B0 = v10;
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    long long v12 = (std::__shared_weak_count *)*((void *)&v24 + 1);
    if (*((void *)&v24 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v24 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    uint64_t v9 = off_26A99F9B0;
  }
  unint64_t v22 = v9;
  unint64_t v23 = *(&off_26A99F9B0 + 1);
  if (*(&off_26A99F9B0 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F9B0 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  uint64_t v13 = *a3;
  uint64_t v14 = (std::__shared_weak_count *)a3[1];
  v21[0] = v13;
  v21[1] = (uint64_t)v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v15 = *a2;
  std::string v20 = v15;
  if (v15) {
    dispatch_retain(v15);
  }
  uint64_t v16 = HSFilerRT::createSession(v9, v21, 0, a1, &v20);
  if (v15) {
    dispatch_release(v15);
  }
  if (!v14 || atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (v16) {
      goto LABEL_20;
    }
LABEL_23:
    *a4 = 0;
    a4[1] = 0;
    long long v19 = (std::__shared_weak_count *)v23;
    if (!v23) {
      return;
    }
    goto LABEL_24;
  }
  ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
  std::__shared_weak_count::__release_weak(v14);
  if (!v16) {
    goto LABEL_23;
  }
LABEL_20:
  *a4 = 0xAAAAAAAAAAAAAAAALL;
  a4[1] = 0xAAAAAAAAAAAAAAAALL;
  BOOL v17 = operator new(0x28uLL);
  v17[2] = a1;
  *((void *)v17 + 3) = 0;
  *((void *)v17 + 4) = 0;
  *((void *)v17 + 2) = v16;
  *(void *)BOOL v17 = &unk_270EB06F0;
  *a4 = v17;
  BOOL v18 = operator new(0x20uLL);
  *BOOL v18 = &unk_270EB07B8;
  v18[1] = 0;
  v18[2] = 0;
  void v18[3] = v17;
  a4[1] = v18;
  long long v19 = (std::__shared_weak_count *)v23;
  if (!v23) {
    return;
  }
LABEL_24:
  if (!atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
}

void sub_2638032E8(_Unwind_Exception *a1)
{
}

void sub_263803304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  HSFilerSession::~HSFilerSession(v13);
  operator delete(v15);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void sub_263803324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_263803338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  if (v13) {
    dispatch_release(v13);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

BOOL HSFilerWriteSession::writeWithFile(uint64_t a1, uint64_t a2, uint64_t a3, const void **a4)
{
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  int v8 = (HSFilerRT *)pthread_mutex_lock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  uint64_t v9 = off_26A99F9B0;
  if (!off_26A99F9B0)
  {
    HSFilerRT::create_default_global(v8, &v23);
    long long v10 = v23;
    long long v23 = 0uLL;
    uint64_t v11 = (std::__shared_weak_count *)*(&off_26A99F9B0 + 1);
    off_26A99F9B0 = v10;
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    long long v12 = (std::__shared_weak_count *)*((void *)&v23 + 1);
    if (*((void *)&v23 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v23 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    uint64_t v9 = off_26A99F9B0;
  }
  uint64_t v13 = (std::__shared_weak_count *)*(&off_26A99F9B0 + 1);
  unint64_t v21 = v9;
  unint64_t v22 = *(&off_26A99F9B0 + 1);
  if (*(&off_26A99F9B0 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F9B0 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  unsigned int v14 = *(_DWORD *)(a1 + 8);
  uint64_t v15 = *(void *)(a1 + 16);
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string v20 = *(std::string *)a3;
  }
  if (*a4) {
    uint64_t v16 = _Block_copy(*a4);
  }
  else {
    uint64_t v16 = 0;
  }
  long long v19 = v16;
  BOOL v17 = HSFilerRT::writeWithFile(v9, v14, v15, a2, (uint64_t)&v20, &v19);
  if (v16) {
    _Block_release(v16);
  }
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v20.__r_.__value_.__l.__data_);
  }
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  return v17;
}

void sub_26380356C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_263803580(_Unwind_Exception *a1)
{
}

void sub_2638035A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, char a18)
{
  if (v18) {
    _Block_release(v18);
  }
  if (a16 < 0) {
    operator delete(__p);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  _Unwind_Resume(a1);
}

BOOL HSFilerWriteSession::writeWithStream(uint64_t a1, uint64_t a2, uint64_t *a3, const void **a4)
{
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
  int v8 = (HSFilerRT *)pthread_mutex_lock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  uint64_t v9 = off_26A99F9B0;
  if (!off_26A99F9B0)
  {
    HSFilerRT::create_default_global(v8, &v25);
    long long v10 = v25;
    long long v25 = 0uLL;
    uint64_t v11 = (std::__shared_weak_count *)*(&off_26A99F9B0 + 1);
    off_26A99F9B0 = v10;
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    long long v12 = (std::__shared_weak_count *)*((void *)&v25 + 1);
    if (*((void *)&v25 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v25 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    uint64_t v9 = off_26A99F9B0;
  }
  unint64_t v23 = v9;
  unint64_t v24 = *(&off_26A99F9B0 + 1);
  if (*(&off_26A99F9B0 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F9B0 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  unsigned int v13 = *(_DWORD *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *a3;
  uint64_t v16 = (std::__shared_weak_count *)a3[1];
  v22[0] = v15;
  v22[1] = (uint64_t)v16;
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (*a4) {
    BOOL v17 = _Block_copy(*a4);
  }
  else {
    BOOL v17 = 0;
  }
  unint64_t v21 = v17;
  BOOL v18 = HSFilerRT::writeWithStream(v9, v13, v14, a2, v22, &v21);
  if (v17) {
    _Block_release(v17);
  }
  if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  long long v19 = (std::__shared_weak_count *)v24;
  if (v24 && !atomic_fetch_add((atomic_ullong *volatile)(v24 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
  return v18;
}

void sub_263803804(_Unwind_Exception *a1)
{
}

void sub_263803828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  if (v13) {
    _Block_release(v13);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

BOOL HSFilerWriteSession::writeWithBuff(uint64_t a1, uint64_t a2, uint64_t *a3, const void **a4)
{
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
  int v8 = (HSFilerRT *)pthread_mutex_lock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  uint64_t v9 = off_26A99F9B0;
  if (!off_26A99F9B0)
  {
    HSFilerRT::create_default_global(v8, &v25);
    long long v10 = v25;
    long long v25 = 0uLL;
    uint64_t v11 = (std::__shared_weak_count *)*(&off_26A99F9B0 + 1);
    off_26A99F9B0 = v10;
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    long long v12 = (std::__shared_weak_count *)*((void *)&v25 + 1);
    if (*((void *)&v25 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v25 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
    uint64_t v9 = off_26A99F9B0;
  }
  unint64_t v23 = v9;
  unint64_t v24 = *(&off_26A99F9B0 + 1);
  if (*(&off_26A99F9B0 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26A99F9B0 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance);
  unsigned int v13 = *(_DWORD *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *a3;
  uint64_t v16 = (std::__shared_weak_count *)a3[1];
  v22[0] = v15;
  v22[1] = (uint64_t)v16;
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (*a4) {
    BOOL v17 = _Block_copy(*a4);
  }
  else {
    BOOL v17 = 0;
  }
  unint64_t v21 = v17;
  BOOL v18 = HSFilerRT::writeWithBuff(v9, v13, v14, a2, v22, &v21);
  if (v17) {
    _Block_release(v17);
  }
  if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  long long v19 = (std::__shared_weak_count *)v24;
  if (v24 && !atomic_fetch_add((atomic_ullong *volatile)(v24 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
  return v18;
}

void sub_263803A80(_Unwind_Exception *a1)
{
}

void sub_263803AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  if (v13) {
    _Block_release(v13);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t HSFilerSession::getID(HSFilerSession *this)
{
  return *((void *)this + 2);
}

uint64_t ctu::PthreadMutexGuardPolicy<HSFilerRT>::~PthreadMutexGuardPolicy(uint64_t a1)
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

void std::__shared_ptr_pointer<HSFilerReadSession *,std::shared_ptr<HSFilerReadSession>::__shared_ptr_default_delete<HSFilerReadSession,HSFilerReadSession>,std::allocator<HSFilerReadSession>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<HSFilerReadSession *,std::shared_ptr<HSFilerReadSession>::__shared_ptr_default_delete<HSFilerReadSession,HSFilerReadSession>,std::allocator<HSFilerReadSession>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 32))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<HSFilerReadSession *,std::shared_ptr<HSFilerReadSession>::__shared_ptr_default_delete<HSFilerReadSession,HSFilerReadSession>,std::allocator<HSFilerReadSession>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x8000000263809540) {
    return a1 + 24;
  }
  if (((v3 & 0x8000000263809540 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000263809540)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000263809540 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void std::__shared_ptr_pointer<HSFilerWriteSession *,std::shared_ptr<HSFilerWriteSession>::__shared_ptr_default_delete<HSFilerWriteSession,HSFilerWriteSession>,std::allocator<HSFilerWriteSession>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<HSFilerWriteSession *,std::shared_ptr<HSFilerWriteSession>::__shared_ptr_default_delete<HSFilerWriteSession,HSFilerWriteSession>,std::allocator<HSFilerWriteSession>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 32))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<HSFilerWriteSession *,std::shared_ptr<HSFilerWriteSession>::__shared_ptr_default_delete<HSFilerWriteSession,HSFilerWriteSession>,std::allocator<HSFilerWriteSession>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x8000000263809614) {
    return a1 + 24;
  }
  if (((v3 & 0x8000000263809614 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000263809614)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000263809614 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

uint64_t __cxx_global_var_init_8()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<HSFilerRT>::~PthreadMutexGuardPolicy, &ctu::Singleton<HSFilerRT,HSFilerRT,ctu::PthreadMutexGuardPolicy<HSFilerRT>>::sInstance, &dword_2637D5000);
  }
  return result;
}

BasebandTransportICE *BasebandTransportICE::BasebandTransportICE(BasebandTransportICE *a1, uint64_t *a2, NSObject **a3)
{
  long long v4 = (std::__shared_weak_count *)a2[1];
  uint64_t v9 = *a2;
  long long v10 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = *a3;
  dispatch_object_t object = v5;
  if (v5) {
    dispatch_retain(v5);
  }
  BasebandTransport::BasebandTransport((uint64_t)a1, &v9, &object);
  if (object) {
    dispatch_release(object);
  }
  uint64_t v6 = v10;
  if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  *(void *)a1 = &unk_270EB0808;
  *((void *)a1 + 54) = 0;
  *((void *)a1 + 58) = 0;
  *((void *)a1 + 62) = 0;
  *((void *)a1 + 63) = 0;
  *((void *)a1 + 64) = dispatch_queue_create("BasebandTransportARI", 0);
  BasebandTransportICE::configurePhysical(a1);
  return a1;
}

void sub_263803ED0(_Unwind_Exception *a1)
{
  uint64_t v6 = *((void *)v1 + 64);
  if (v6) {
    dispatch_release(v6);
  }
  std::function<BOOL ()(void)>::~function(v4);
  std::function<BOOL ()(unsigned char *,unsigned long,unsigned int *,BOOL,unsigned int)>::~function(v3);
  std::function<BOOL ()(unsigned char const*,unsigned long,unsigned int *,BOOL,unsigned int)>::~function(v2);
  BasebandTransport::~BasebandTransport(v1);
  _Unwind_Resume(a1);
}

void sub_263803F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object, char a11)
{
  if (object) {
    dispatch_release(object);
  }
  std::shared_ptr<HSFilerRT_Internal::Session>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

uint64_t *BasebandTransportICE::configurePhysical(BasebandTransportICE *this)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (char *)this + 8;
  uint64_t v3 = *((void *)this + 5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_2637D5000, v3, OS_LOG_TYPE_DEFAULT, "#I using physical pipe...", (uint8_t *)&v6, 2u);
  }
  if ((**(unsigned int (***)(char *, uint64_t))v2)(v2, 40))
  {
    ctu::LogMessageBuffer::createWithFormat((uint64_t *)&v6, (ctu::LogMessageBuffer *)"using physical pipe...", v4);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x263E6A4D0](&v6);
  }
  uint64_t v6 = (void (**)(void **))&unk_270EB0AF8;
  unint64_t v7 = this;
  int v8 = (uint64_t *)&v6;
  std::__function::__value_func<BOOL ()(void)>::swap[abi:ne180100](&v6, (void *)this + 59);
  if (v8 == (uint64_t *)&v6)
  {
    v6[4]((void **)&v6);
  }
  else if (v8)
  {
    (*(void (**)(void))(*v8 + 40))();
  }
  uint64_t v6 = (void (**)(void **))&unk_270EB0B78;
  unint64_t v7 = this;
  int v8 = (uint64_t *)&v6;
  std::__function::__value_func<BOOL ()(unsigned char *,unsigned long,unsigned int *,BOOL,unsigned int)>::swap[abi:ne180100](&v6, (void *)this + 55);
  if (v8 == (uint64_t *)&v6)
  {
    v6[4]((void **)&v6);
  }
  else if (v8)
  {
    (*(void (**)(void))(*v8 + 40))();
  }
  uint64_t v6 = (void (**)(void **))&unk_270EB0BF8;
  unint64_t v7 = this;
  int v8 = (uint64_t *)&v6;
  std::__function::__value_func<BOOL ()(unsigned char const*,unsigned long,unsigned int *,BOOL,unsigned int)>::swap[abi:ne180100](&v6, (void *)this + 51);
  uint64_t result = v8;
  if (v8 == (uint64_t *)&v6) {
    return (uint64_t *)((uint64_t (*)(void **))v6[4])((void **)&v6);
  }
  if (v8) {
    return (uint64_t *)(*(uint64_t (**)(void))(*v8 + 40))();
  }
  return result;
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

void *std::function<BOOL ()(unsigned char *,unsigned long,unsigned int *,BOOL,unsigned int)>::~function(void *a1)
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

void *std::function<BOOL ()(unsigned char const*,unsigned long,unsigned int *,BOOL,unsigned int)>::~function(void *a1)
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

uint64_t *BasebandTransportICE::configureARIPipe(BasebandTransportICE *this)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (char *)this + 8;
  uint64_t v3 = *((void *)this + 5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_2637D5000, v3, OS_LOG_TYPE_DEFAULT, "#I using ARI client pipe...", (uint8_t *)&v6, 2u);
  }
  if ((**(unsigned int (***)(char *, uint64_t))v2)(v2, 40))
  {
    ctu::LogMessageBuffer::createWithFormat((uint64_t *)&v6, (ctu::LogMessageBuffer *)"using ARI client pipe...", v4);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x263E6A4D0](&v6);
  }
  uint64_t v6 = (void (**)(void **))&unk_270EB0918;
  unint64_t v7 = this;
  int v8 = (uint64_t *)&v6;
  std::__function::__value_func<BOOL ()(void)>::swap[abi:ne180100](&v6, (void *)this + 59);
  if (v8 == (uint64_t *)&v6)
  {
    v6[4]((void **)&v6);
  }
  else if (v8)
  {
    (*(void (**)(void))(*v8 + 40))();
  }
  uint64_t v6 = (void (**)(void **))&unk_270EB09A8;
  int v8 = (uint64_t *)&v6;
  std::__function::__value_func<BOOL ()(unsigned char *,unsigned long,unsigned int *,BOOL,unsigned int)>::swap[abi:ne180100](&v6, (void *)this + 55);
  if (v8 == (uint64_t *)&v6)
  {
    v6[4]((void **)&v6);
  }
  else if (v8)
  {
    (*(void (**)(void))(*v8 + 40))();
  }
  uint64_t v6 = (void (**)(void **))&unk_270EB0A38;
  unint64_t v7 = this;
  int v8 = (uint64_t *)&v6;
  std::__function::__value_func<BOOL ()(unsigned char const*,unsigned long,unsigned int *,BOOL,unsigned int)>::swap[abi:ne180100](&v6, (void *)this + 51);
  uint64_t result = v8;
  if (v8 == (uint64_t *)&v6) {
    return (uint64_t *)((uint64_t (*)(void **))v6[4])((void **)&v6);
  }
  if (v8) {
    return (uint64_t *)(*(uint64_t (**)(void))(*v8 + 40))();
  }
  return result;
}

uint64_t BasebandTransportICE::open(uint64_t a1, uint64_t *a2, const void **a3)
{
  if (*(_DWORD *)a2 != 8)
  {
    long long v10 = *((_OWORD *)a2 + 1);
    v19[0] = *(_OWORD *)a2;
    v19[1] = v10;
    uint64_t v20 = a2[4];
    uint64_t v11 = (void *)*a3;
    if (*a3) {
      uint64_t v11 = _Block_copy(v11);
    }
    aBlocuint64_t k = v11;
    BOOL v9 = BasebandTransport::open((BasebandTransport *)a1, v19, &aBlock);
    if (aBlock) {
      _Block_release(aBlock);
    }
    goto LABEL_24;
  }
  uint64_t v6 = *a2;
  v26[1] = *((_OWORD *)a2 + 1);
  uint64_t v27 = a2[4];
  *(void *)&v26[0] = v6;
  *((void *)&v26[0] + 1) = 1;
  unint64_t v7 = (void *)*a3;
  if (*a3) {
    unint64_t v7 = _Block_copy(v7);
  }
  long long v25 = v7;
  BOOL v8 = BasebandTransport::open((BasebandTransport *)a1, v26, &v25);
  if (v25) {
    _Block_release(v25);
  }
  if (v8)
  {
    BOOL v9 = 1;
LABEL_24:
    BasebandTransportICE::configurePhysical((BasebandTransportICE *)a1);
    return v9;
  }
  long long v12 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2637D5000, v12, OS_LOG_TYPE_DEFAULT, "#I Physical transport not available.  Trying ARI pipe...", (uint8_t *)buf, 2u);
  }
  if ((**(unsigned int (***)(uint64_t, uint64_t))(a1 + 8))(a1 + 8, 40))
  {
    ctu::LogMessageBuffer::createWithFormat(buf, (ctu::LogMessageBuffer *)"Physical transport not available.  Trying ARI pipe...", v13);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x263E6A4D0](buf);
  }
  long long v14 = *((_OWORD *)a2 + 1);
  v22[0] = *(_OWORD *)a2;
  v22[1] = v14;
  uint64_t v23 = a2[4];
  if (*a3) {
    uint64_t v15 = _Block_copy(*a3);
  }
  else {
    uint64_t v15 = 0;
  }
  unint64_t v21 = v15;
  BOOL v16 = BasebandTransportICE::openARIClientPipe(a1, v22, &v21);
  if (v15) {
    _Block_release(v15);
  }
  if (!v16)
  {
    BOOL v9 = 0;
    goto LABEL_24;
  }
  BasebandTransportICE::configureARIPipe((BasebandTransportICE *)a1);
  return 1;
}

BOOL BasebandTransportICE::openARIClientPipe(uint64_t a1, long long *a2, void **a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v6 = *a2;
  long long v7 = a2[1];
  *(unsigned char *)(a1 + 136) = *((unsigned char *)a2 + 32);
  *(_OWORD *)(a1 + 120) = v7;
  *(_OWORD *)(a1 + 104) = v6;
  BOOL v8 = *a3;
  if (*a3) {
    BOOL v8 = _Block_copy(v8);
  }
  BOOL v9 = *(const void **)(a1 + 144);
  *(void *)(a1 + 144) = v8;
  if (v9) {
    _Block_release(v9);
  }
  *(_DWORD *)(a1 + 504) = 0;
  long long v10 = *(std::__shared_weak_count **)(a1 + 80);
  if (!v10 || (v11 = *(void *)(a1 + 72), (long long v12 = std::__shared_weak_count::lock(v10)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  unsigned int v13 = v12;
  long long v14 = (unsigned int *)(a1 + 504);
  atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v13);
  }
  int v15 = AriHost::RegisterClient((AriHost *)"ipc.bb", (const char *)(a1 + 504), *(int **)(a1 + 512), (dispatch_queue_s *)(1000 * *((_DWORD *)a2 + 2)));
  if (v15)
  {
    BOOL v16 = 0;
    BOOL v17 = (unsigned int (***)(void, uint64_t))(a1 + 8);
    BOOL v18 = *(NSObject **)(a1 + 40);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
  }
  else
  {
    v25[0] = v11;
    v25[1] = v13;
    atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    uint64_t v3 = v25;
    BOOL v16 = AriHost::SetRTEventHandler() == 0;
    BOOL v17 = (unsigned int (***)(void, uint64_t))(a1 + 8);
    BOOL v18 = *(NSObject **)(a1 + 40);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
  }
  long long v19 = "fail";
  unsigned int v20 = *v14;
  if (v16) {
    long long v19 = "success";
  }
  *(_DWORD *)std::string buf = 136315394;
  uint64_t v27 = v19;
  __int16 v28 = 1024;
  unsigned int v29 = v20;
  _os_log_impl(&dword_2637D5000, v18, OS_LOG_TYPE_DEFAULT, "#I ARI pipe open %s ctx 0x%x", buf, 0x12u);
LABEL_14:
  if ((**v17)(v17, 40))
  {
    unint64_t v22 = "fail";
    if (v16) {
      unint64_t v22 = "success";
    }
    ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"ARI pipe open %s ctx 0x%x", v21, v22, *v14);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x263E6A4D0](buf);
  }
  if (!v15)
  {
    uint64_t v23 = (std::__shared_weak_count *)v3[1];
    if (v23) {
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  std::__shared_weak_count::__release_weak(v13);
  return v16;
}

void sub_263804B98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18)
{
  if (a18) {
    std::__shared_weak_count::__release_weak(a18);
  }
  std::__shared_weak_count::__release_weak(v18);
  _Unwind_Resume(a1);
}

uint64_t BasebandTransportICE::write(BasebandTransportICE *this, const unsigned __int8 *a2, uint64_t a3, unsigned int *a4, char a5, int a6)
{
  long long v12 = a2;
  long long v10 = a4;
  uint64_t v11 = a3;
  char v9 = a5;
  int v8 = a6;
  uint64_t v6 = *((void *)this + 54);
  if (!v6) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, const unsigned __int8 **, uint64_t *, unsigned int **, char *, int *))(*(void *)v6 + 48))(v6, &v12, &v11, &v10, &v9, &v8);
}

uint64_t BasebandTransportICE::read(BasebandTransportICE *this, unsigned __int8 *a2, uint64_t a3, unsigned int *a4, char a5, int a6)
{
  long long v12 = a2;
  long long v10 = a4;
  uint64_t v11 = a3;
  char v9 = a5;
  int v8 = a6;
  uint64_t v6 = *((void *)this + 58);
  if (!v6) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, unsigned __int8 **, uint64_t *, unsigned int **, char *, int *))(*(void *)v6 + 48))(v6, &v12, &v11, &v10, &v9, &v8);
}

uint64_t BasebandTransportICE::close_sync(BasebandTransportICE *this)
{
  uint64_t v1 = *((void *)this + 62);
  if (!v1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);

  return v2();
}

uint64_t ___ZN20BasebandTransportICE17openARIClientPipeEN17BasebandTransport10ParametersEN8dispatch5blockIU13block_pointerFvPhjEEE_block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = a1[4];
  long long v4 = std::__shared_weak_count::lock(v2);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = v4;
  if (a1[5])
  {
    uint64_t v6 = *(NSObject **)(v3 + 40);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string __p = 136315138;
      *(void *)&__p[4] = "ipc.bb";
      _os_log_error_impl(&dword_2637D5000, v6, OS_LOG_TYPE_ERROR, "Got AriHost::ARI_RT_REINIT callback for %s", __p, 0xCu);
    }
    if ((**(unsigned int (***)(uint64_t, uint64_t))(v3 + 8))(v3 + 8, 80))
    {
      ctu::LogMessageBuffer::createWithFormat((uint64_t *)__p, (ctu::LogMessageBuffer *)"Got AriHost::ARI_RT_REINIT callback for %s", v7, "ipc.bb");
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x263E6A4D0](__p);
    }
    char v11 = 6;
    strcpy(__p, "ipc.bb");
    AriHost::ReRegisterClient();
    if (v11 < 0)
    {
      operator delete(*(void **)__p);
      uint64_t v8 = 0;
      if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
LABEL_16:
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    else
    {
      uint64_t v8 = 0;
      if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_16;
      }
    }
  }
  else
  {
    uint64_t v8 = 0xFFFFFFFFLL;
    if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_16;
    }
  }
  return v8;
}

BOOL BasebandTransportICE::writeARIClientPipe(BasebandTransportICE *this, const unsigned __int8 *a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 10);
  if (!v5 || (uint64_t v8 = std::__shared_weak_count::lock(v5)) == 0) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  char v9 = v8;
  atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (*((_DWORD *)this + 127))
    {
LABEL_5:
      atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      int started = AriHost::Send();
      char v11 = v9;
      goto LABEL_6;
    }
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v9);
    if (*((_DWORD *)this + 127)) {
      goto LABEL_5;
    }
  }
  atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  int started = AriHost::StartStream();
  char v11 = v9;
LABEL_6:
  std::__shared_weak_count::__release_weak(v11);
  if (started)
  {
    uint64_t v12 = (char *)this + 8;
    unsigned int v13 = *((void *)this + 5);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 134217984;
      uint64_t v17 = a3;
      _os_log_error_impl(&dword_2637D5000, v13, OS_LOG_TYPE_ERROR, "Failed to send %zu bytes on ARI pipe", buf, 0xCu);
    }
    if ((**(unsigned int (***)(char *, uint64_t))v12)(v12, 80))
    {
      ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"Failed to send %zu bytes on ARI pipe", v14, a3);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x263E6A4D0](buf);
    }
  }
  else if (a4)
  {
    *a4 = a3;
  }
  std::__shared_weak_count::__release_weak(v9);
  return started == 0;
}

uint64_t ___ZN20BasebandTransportICE18writeARIClientPipeEPKhmPjbj_block_invoke(void *a1, uint64_t a2, int a3)
{
  long long v4 = (std::__shared_weak_count *)a1[6];
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = a1[4];
  uint64_t v8 = std::__shared_weak_count::lock(v4);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  char v9 = v8;
  if (a1[5])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN20BasebandTransportICE18writeARIClientPipeEPKhmPjbj_block_invoke_2;
    block[3] = &__block_descriptor_tmp_10_0;
    void block[4] = v7;
    void block[5] = a2;
    int v13 = a3;
    dispatch_async(*(dispatch_queue_t *)(v7 + 152), block);
    uint64_t v10 = 0;
    if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v10 = 0xFFFFFFFFLL;
    if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
LABEL_8:
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  return v10;
}

void ___ZN20BasebandTransportICE18writeARIClientPipeEPKhmPjbj_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 128);
  if (v3)
  {
    std::string __p = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    (*(void (**)(uint64_t, void, void, void **))(*(void *)v3 + 8))(v3, *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), &__p);
    long long v4 = __p;
    size_t v5 = v12 - (unsigned char *)__p;
    if (*(unsigned char *)(v2 + 136))
    {
      uint64_t v6 = malloc(v12 - (unsigned char *)__p);
      memcpy(v6, v4, v5);
    }
    (*(void (**)(void))(*(void *)(v2 + 144) + 16))();
    if (__p)
    {
      uint64_t v12 = __p;
      operator delete(__p);
    }
  }
  else
  {
    uint64_t v7 = *(const void **)(a1 + 40);
    size_t v8 = *(unsigned int *)(a1 + 48);
    if (*(unsigned char *)(v2 + 136))
    {
      char v9 = malloc(v8);
      memcpy(v9, v7, v8);
    }
    uint64_t v10 = *(void (**)(void))(*(void *)(v2 + 144) + 16);
    v10();
  }
}

void sub_26380551C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BasebandTransportICE::sendToDataHandler(BasebandTransportICE *this, unsigned __int8 *a2, size_t __size)
{
  if (*((unsigned char *)this + 136))
  {
    uint64_t v6 = malloc(__size);
    memcpy(v6, a2, __size);
    uint64_t v7 = *(uint64_t (**)(void))(*((void *)this + 18) + 16);
  }
  else
  {
    uint64_t v7 = *(uint64_t (**)(void))(*((void *)this + 18) + 16);
  }
  return v7();
}

uint64_t ___ZN20BasebandTransportICE18writeARIClientPipeEPKhmPjbj_block_invoke_15(void *a1, AriMsg *a2, unsigned int a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v4 = (std::__shared_weak_count *)a1[6];
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = a1[4];
  size_t v8 = std::__shared_weak_count::lock(v4);
  uint64_t v18 = v8;
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  char v9 = v8;
  if (a1[5])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN20BasebandTransportICE18writeARIClientPipeEPKhmPjbj_block_invoke_2_16;
    block[3] = &__block_descriptor_tmp_17;
    void block[4] = v7;
    void block[5] = a2;
    unsigned int v16 = a3;
    dispatch_async(*(dispatch_queue_t *)(v7 + 152), block);
    int BufCtx = AriMsg::GetBufCtx(a2, (const unsigned __int8 *)a3);
    *(_DWORD *)(v7 + 508) = BufCtx;
    char v11 = *(NSObject **)(v7 + 40);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = BufCtx;
      _os_log_impl(&dword_2637D5000, v11, OS_LOG_TYPE_DEFAULT, "#I bypass will use ctx id 0x%x", buf, 8u);
    }
    if ((**(unsigned int (***)(uint64_t, uint64_t))(v7 + 8))(v7 + 8, 40))
    {
      ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"bypass will use ctx id 0x%x", v12, *(unsigned int *)(v7 + 508));
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x263E6A4D0](buf);
    }
    uint64_t v13 = 0;
    if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v13 = 0xFFFFFFFFLL;
    if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
LABEL_13:
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  return v13;
}

void ___ZN20BasebandTransportICE18writeARIClientPipeEPKhmPjbj_block_invoke_2_16(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 128);
  if (v3)
  {
    std::string __p = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    (*(void (**)(uint64_t, void, void, void **))(*(void *)v3 + 8))(v3, *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), &__p);
    long long v4 = __p;
    size_t v5 = v12 - (unsigned char *)__p;
    if (*(unsigned char *)(v2 + 136))
    {
      uint64_t v6 = malloc(v12 - (unsigned char *)__p);
      memcpy(v6, v4, v5);
    }
    (*(void (**)(void))(*(void *)(v2 + 144) + 16))();
    if (__p)
    {
      uint64_t v12 = __p;
      operator delete(__p);
    }
  }
  else
  {
    uint64_t v7 = *(const void **)(a1 + 40);
    size_t v8 = *(unsigned int *)(a1 + 48);
    if (*(unsigned char *)(v2 + 136))
    {
      char v9 = malloc(v8);
      memcpy(v9, v7, v8);
    }
    uint64_t v10 = *(void (**)(void))(*(void *)(v2 + 144) + 16);
    v10();
  }
}

void sub_263805988(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BasebandTransportICE::closeARIClientPipe_sync(BasebandTransportICE *this)
{
  *((_DWORD *)this + 127) = 0;
  AriHost::DeregisterClient((AriHost *)*((unsigned int *)this + 126));
  *((_DWORD *)this + 126) = 0;
  return 1;
}

void BasebandTransportICE::~BasebandTransportICE(BasebandTransportICE *this)
{
  BasebandTransportICE::~BasebandTransportICE(this);

  operator delete(v1);
}

{
  NSObject *v2;
  BasebandTransportICE *v3;
  char *v4;
  BasebandTransportICE *v5;
  char *v6;
  BasebandTransportICE *v7;
  BasebandTransport *v8;
  uint64_t vars8;

  *(void *)this = &unk_270EB0808;
  uint64_t v2 = *((void *)this + 64);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = (BasebandTransportICE *)*((void *)this + 62);
  if (v3 == (BasebandTransportICE *)((char *)this + 472))
  {
    (*(void (**)(char *))(*((void *)this + 59) + 32))((char *)this + 472);
    long long v4 = (char *)this + 440;
    size_t v5 = (BasebandTransportICE *)*((void *)this + 58);
    if (v5 != (BasebandTransportICE *)((char *)this + 440)) {
      goto LABEL_7;
    }
  }
  else
  {
    if (v3) {
      (*(void (**)(BasebandTransportICE *))(*(void *)v3 + 40))(v3);
    }
    long long v4 = (char *)this + 440;
    size_t v5 = (BasebandTransportICE *)*((void *)this + 58);
    if (v5 != (BasebandTransportICE *)((char *)this + 440))
    {
LABEL_7:
      if (v5) {
        (*(void (**)(BasebandTransportICE *))(*(void *)v5 + 40))(v5);
      }
      uint64_t v6 = (char *)this + 408;
      uint64_t v7 = (BasebandTransportICE *)*((void *)this + 54);
      if (v7 != (BasebandTransportICE *)((char *)this + 408)) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  (*(void (**)(char *))(*(void *)v4 + 32))(v4);
  uint64_t v6 = (char *)this + 408;
  uint64_t v7 = (BasebandTransportICE *)*((void *)this + 54);
  if (v7 != (BasebandTransportICE *)((char *)this + 408))
  {
LABEL_10:
    if (v7) {
      (*(void (**)(BasebandTransportICE *))(*(void *)v7 + 40))(v7);
    }
    size_t v8 = this;
    goto LABEL_14;
  }
LABEL_17:
  (*(void (**)(char *))(*(void *)v6 + 32))(v6);
  size_t v8 = this;

LABEL_14:
  BasebandTransport::~BasebandTransport(v8);
}

void *std::__function::__func<BasebandTransportICE::configureARIPipe(void)::$_0,std::allocator<BasebandTransportICE::configureARIPipe(void)::$_0>,BOOL ()(void)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_270EB0918;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<BasebandTransportICE::configureARIPipe(void)::$_0,std::allocator<BasebandTransportICE::configureARIPipe(void)::$_0>,BOOL ()(void)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_270EB0918;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<BasebandTransportICE::configureARIPipe(void)::$_0,std::allocator<BasebandTransportICE::configureARIPipe(void)::$_0>,BOOL ()(void)>::operator()(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  AriHost::EndStream((AriHost *)*(unsigned int *)(v1 + 508));
  *(_DWORD *)(v1 + 508) = 0;
  AriHost::DeregisterClient((AriHost *)*(unsigned int *)(v1 + 504));
  *(_DWORD *)(v1 + 504) = 0;
  return 1;
}

uint64_t std::__function::__func<BasebandTransportICE::configureARIPipe(void)::$_0,std::allocator<BasebandTransportICE::configureARIPipe(void)::$_0>,BOOL ()(void)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN20BasebandTransportICE16configureARIPipeEvE3$_0") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"ZN20BasebandTransportICE16configureARIPipeEvE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN20BasebandTransportICE16configureARIPipeEvE3$_0")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN20BasebandTransportICE16configureARIPipeEvE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<BasebandTransportICE::configureARIPipe(void)::$_0,std::allocator<BasebandTransportICE::configureARIPipe(void)::$_0>,BOOL ()(void)>::target_type()
{
}

void *std::__function::__value_func<BOOL ()(void)>::swap[abi:ne180100](void *result, void *a2)
{
  void v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    unint64_t v3 = result;
    long long v4 = (void *)result[3];
    size_t v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        memset(v6, 170, 24);
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_263805F94(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void *std::__function::__func<BasebandTransportICE::configureARIPipe(void)::$_1,std::allocator<BasebandTransportICE::configureARIPipe(void)::$_1>,BOOL ()(unsigned char *,unsigned long,unsigned int *,BOOL,unsigned int)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &unk_270EB09A8;
  return result;
}

void std::__function::__func<BasebandTransportICE::configureARIPipe(void)::$_1,std::allocator<BasebandTransportICE::configureARIPipe(void)::$_1>,BOOL ()(unsigned char *,unsigned long,unsigned int *,BOOL,unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_270EB09A8;
}

uint64_t std::__function::__func<BasebandTransportICE::configureARIPipe(void)::$_1,std::allocator<BasebandTransportICE::configureARIPipe(void)::$_1>,BOOL ()(unsigned char *,unsigned long,unsigned int *,BOOL,unsigned int)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD **a4)
{
  **a4 = 0;
  return 0;
}

uint64_t std::__function::__func<BasebandTransportICE::configureARIPipe(void)::$_1,std::allocator<BasebandTransportICE::configureARIPipe(void)::$_1>,BOOL ()(unsigned char *,unsigned long,unsigned int *,BOOL,unsigned int)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN20BasebandTransportICE16configureARIPipeEvE3$_1") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"ZN20BasebandTransportICE16configureARIPipeEvE3$_1" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN20BasebandTransportICE16configureARIPipeEvE3$_1")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN20BasebandTransportICE16configureARIPipeEvE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<BasebandTransportICE::configureARIPipe(void)::$_1,std::allocator<BasebandTransportICE::configureARIPipe(void)::$_1>,BOOL ()(unsigned char *,unsigned long,unsigned int *,BOOL,unsigned int)>::target_type()
{
}

void *std::__function::__value_func<BOOL ()(unsigned char *,unsigned long,unsigned int *,BOOL,unsigned int)>::swap[abi:ne180100](void *result, void *a2)
{
  void v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    unint64_t v3 = result;
    long long v4 = (void *)result[3];
    size_t v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        memset(v6, 170, 24);
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_26380632C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void *std::__function::__func<BasebandTransportICE::configureARIPipe(void)::$_2,std::allocator<BasebandTransportICE::configureARIPipe(void)::$_2>,BOOL ()(unsigned char const*,unsigned long,unsigned int *,BOOL,unsigned int)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_270EB0A38;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<BasebandTransportICE::configureARIPipe(void)::$_2,std::allocator<BasebandTransportICE::configureARIPipe(void)::$_2>,BOOL ()(unsigned char const*,unsigned long,unsigned int *,BOOL,unsigned int)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_270EB0A38;
  a2[1] = v2;
  return result;
}

BOOL std::__function::__func<BasebandTransportICE::configureARIPipe(void)::$_2,std::allocator<BasebandTransportICE::configureARIPipe(void)::$_2>,BOOL ()(unsigned char const*,unsigned long,unsigned int *,BOOL,unsigned int)>::operator()(uint64_t a1, uint64_t *a2, uint64_t *a3, unsigned int **a4)
{
  long long v4 = *(BasebandTransportICE **)(a1 + 8);
  uint64_t v5 = *a2;
  uint64_t v6 = *a3;
  uint64_t v7 = *a4;
  v21[0] = 0;
  v21[1] = v21;
  uint64_t v21[2] = 0x4002000000;
  void v21[3] = __Block_byref_object_copy__1;
  v21[4] = __Block_byref_object_dispose__1;
  std::string __p = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2000000000;
  uint64_t v20 = v5;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2000000000;
  uint64_t v16 = v6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = ___ZZN20BasebandTransportICE16configureARIPipeEvENK3__2clEPKhmPjbj_block_invoke;
  v12[3] = &__block_descriptor_tmp_45_0;
  v12[8] = v5;
  v12[9] = v6;
  v12[4] = v21;
  v12[5] = &v17;
  void v12[6] = &v13;
  void v12[7] = v4;
  long long v25 = v12;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableI17BasebandTransportE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke_0;
  block[3] = &__block_descriptor_tmp_46;
  void block[4] = (char *)v4 + 72;
  void block[5] = &v25;
  size_t v8 = *((void *)v4 + 11);
  if (*((void *)v4 + 12))
  {
    dispatch_async_and_wait(v8, block);
    uint64_t v9 = v14[3];
    if (v9)
    {
LABEL_3:
      BOOL v10 = BasebandTransportICE::writeARIClientPipe(v4, (const unsigned __int8 *)v18[3], v9, v7);
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_sync(v8, block);
    uint64_t v9 = v14[3];
    if (v9) {
      goto LABEL_3;
    }
  }
  BOOL v10 = 1;
LABEL_6:
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v21, 8);
  if (__p)
  {
    uint64_t v23 = __p;
    operator delete(__p);
  }
  return v10;
}

void sub_263806580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *__p,uint64_t a34)
{
  if (__p)
  {
    a34 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<BasebandTransportICE::configureARIPipe(void)::$_2,std::allocator<BasebandTransportICE::configureARIPipe(void)::$_2>,BOOL ()(unsigned char const*,unsigned long,unsigned int *,BOOL,unsigned int)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN20BasebandTransportICE16configureARIPipeEvE3$_2") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"ZN20BasebandTransportICE16configureARIPipeEvE3$_2" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN20BasebandTransportICE16configureARIPipeEvE3$_2")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN20BasebandTransportICE16configureARIPipeEvE3$_2" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<BasebandTransportICE::configureARIPipe(void)::$_2,std::allocator<BasebandTransportICE::configureARIPipe(void)::$_2>,BOOL ()(unsigned char const*,unsigned long,unsigned int *,BOOL,unsigned int)>::target_type()
{
}

__n128 __Block_byref_object_copy__1(void *a1, uint64_t a2)
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

void __Block_byref_object_dispose__1(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

uint64_t (***___ZZN20BasebandTransportICE16configureARIPipeEvENK3__2clEPKhmPjbj_block_invoke(void *a1))(void, void, void, uint64_t)
{
  __n128 result = *(uint64_t (****)(void, void, void, uint64_t))(a1[7] + 128);
  if (result)
  {
    __n128 result = (uint64_t (***)(void, void, void, uint64_t))(**result)(result, a1[8], a1[9], *(void *)(a1[4] + 8) + 40);
    *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(*(void *)(a1[4] + 8) + 40);
    *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(*(void *)(a1[4] + 8) + 48)
                                                 - *(void *)(*(void *)(a1[4] + 8) + 40);
  }
  return result;
}

void *___ZNK3ctu20SharedSynchronizableI17BasebandTransportE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke_0(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

void *std::__function::__value_func<BOOL ()(unsigned char const*,unsigned long,unsigned int *,BOOL,unsigned int)>::swap[abi:ne180100](void *result, void *a2)
{
  void v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    unint64_t v3 = result;
    long long v4 = (void *)result[3];
    uint64_t v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        memset(v6, 170, 24);
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        __n128 result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        __n128 result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      __n128 result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_2638069B4(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void *std::__function::__func<BasebandTransportICE::configurePhysical(void)::$_0,std::allocator<BasebandTransportICE::configurePhysical(void)::$_0>,BOOL ()(void)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_270EB0AF8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<BasebandTransportICE::configurePhysical(void)::$_0,std::allocator<BasebandTransportICE::configurePhysical(void)::$_0>,BOOL ()(void)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_270EB0AF8;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<BasebandTransportICE::configurePhysical(void)::$_0,std::allocator<BasebandTransportICE::configurePhysical(void)::$_0>,BOOL ()(void)>::operator()(uint64_t a1)
{
  return BasebandTransport::close_sync(*(BasebandTransport **)(a1 + 8));
}

uint64_t std::__function::__func<BasebandTransportICE::configurePhysical(void)::$_0,std::allocator<BasebandTransportICE::configurePhysical(void)::$_0>,BOOL ()(void)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN20BasebandTransportICE17configurePhysicalEvE3$_0") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"ZN20BasebandTransportICE17configurePhysicalEvE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN20BasebandTransportICE17configurePhysicalEvE3$_0")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN20BasebandTransportICE17configurePhysicalEvE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<BasebandTransportICE::configurePhysical(void)::$_0,std::allocator<BasebandTransportICE::configurePhysical(void)::$_0>,BOOL ()(void)>::target_type()
{
}

void *std::__function::__func<BasebandTransportICE::configurePhysical(void)::$_1,std::allocator<BasebandTransportICE::configurePhysical(void)::$_1>,BOOL ()(unsigned char *,unsigned long,unsigned int *,BOOL,unsigned int)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_270EB0B78;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<BasebandTransportICE::configurePhysical(void)::$_1,std::allocator<BasebandTransportICE::configurePhysical(void)::$_1>,BOOL ()(unsigned char *,unsigned long,unsigned int *,BOOL,unsigned int)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_270EB0B78;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<BasebandTransportICE::configurePhysical(void)::$_1,std::allocator<BasebandTransportICE::configurePhysical(void)::$_1>,BOOL ()(unsigned char *,unsigned long,unsigned int *,BOOL,unsigned int)>::operator()(uint64_t a1, unsigned __int8 **a2, unint64_t *a3, unsigned int **a4)
{
  return BasebandTransport::read(*(BasebandTransport **)(a1 + 8), *a2, *a3, *a4);
}

uint64_t std::__function::__func<BasebandTransportICE::configurePhysical(void)::$_1,std::allocator<BasebandTransportICE::configurePhysical(void)::$_1>,BOOL ()(unsigned char *,unsigned long,unsigned int *,BOOL,unsigned int)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN20BasebandTransportICE17configurePhysicalEvE3$_1") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"ZN20BasebandTransportICE17configurePhysicalEvE3$_1" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN20BasebandTransportICE17configurePhysicalEvE3$_1")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN20BasebandTransportICE17configurePhysicalEvE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<BasebandTransportICE::configurePhysical(void)::$_1,std::allocator<BasebandTransportICE::configurePhysical(void)::$_1>,BOOL ()(unsigned char *,unsigned long,unsigned int *,BOOL,unsigned int)>::target_type()
{
}

void *std::__function::__func<BasebandTransportICE::configurePhysical(void)::$_2,std::allocator<BasebandTransportICE::configurePhysical(void)::$_2>,BOOL ()(unsigned char const*,unsigned long,unsigned int *,BOOL,unsigned int)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *__n128 result = &unk_270EB0BF8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<BasebandTransportICE::configurePhysical(void)::$_2,std::allocator<BasebandTransportICE::configurePhysical(void)::$_2>,BOOL ()(unsigned char const*,unsigned long,unsigned int *,BOOL,unsigned int)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_270EB0BF8;
  a2[1] = v2;
  return result;
}

BOOL std::__function::__func<BasebandTransportICE::configurePhysical(void)::$_2,std::allocator<BasebandTransportICE::configurePhysical(void)::$_2>,BOOL ()(unsigned char const*,unsigned long,unsigned int *,BOOL,unsigned int)>::operator()(uint64_t a1, const unsigned __int8 **a2, uint64_t *a3, unsigned int **a4)
{
  return BasebandTransport::write(*(BasebandTransport **)(a1 + 8), *a2, *a3, *a4);
}

uint64_t std::__function::__func<BasebandTransportICE::configurePhysical(void)::$_2,std::allocator<BasebandTransportICE::configurePhysical(void)::$_2>,BOOL ()(unsigned char const*,unsigned long,unsigned int *,BOOL,unsigned int)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN20BasebandTransportICE17configurePhysicalEvE3$_2") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"ZN20BasebandTransportICE17configurePhysicalEvE3$_2" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN20BasebandTransportICE17configurePhysicalEvE3$_2")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN20BasebandTransportICE17configurePhysicalEvE3$_2" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<BasebandTransportICE::configurePhysical(void)::$_2,std::allocator<BasebandTransportICE::configurePhysical(void)::$_2>,BOOL ()(unsigned char const*,unsigned long,unsigned int *,BOOL,unsigned int)>::target_type()
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t KTLCloseChannel()
{
  return MEMORY[0x270F92858]();
}

uint64_t KTLInitOptions()
{
  return MEMORY[0x270F928F8]();
}

uint64_t KTLOpenChannel()
{
  return MEMORY[0x270F92938]();
}

uint64_t TelephonyBasebandCreateController()
{
  return MEMORY[0x270F967E0]();
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

uint64_t TelephonyBasebandPCITransportMapRegionwithClientData()
{
  return MEMORY[0x270F96508]();
}

uint64_t TelephonyBasebandPCITransportUnmapRegion()
{
  return MEMORY[0x270F96520]();
}

uint64_t TelephonyUtilTransportFree()
{
  return MEMORY[0x270F97228]();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t capabilities::abs::supportsETSProtocol(capabilities::abs *this)
{
  return MEMORY[0x270F96B68](this);
}

uint64_t capabilities::abs::traceTransportTimeoutScalingFactor(capabilities::abs *this)
{
  return MEMORY[0x270F96BF0](this);
}

uint64_t capabilities::abs::shouldUseMinBasebandTransportIOReadSize(capabilities::abs *this)
{
  return MEMORY[0x270F96C10](this);
}

uint64_t capabilities::abs::shouldUseMinBasebandTransportIOReadCount(capabilities::abs *this)
{
  return MEMORY[0x270F96C20](this);
}

uint64_t capabilities::ipc::supportsPCI(capabilities::ipc *this)
{
  return MEMORY[0x270F96C30](this);
}

uint64_t capabilities::radio::vendor(capabilities::radio *this)
{
  return MEMORY[0x270F96D28](this);
}

uint64_t capabilities::radio::mav20Plus(capabilities::radio *this)
{
  return MEMORY[0x270F96D40](this);
}

uint64_t Ari::Log(Ari *this, uint64_t a2, const char *a3, ...)
{
  return MEMORY[0x270F8CD00](this, a2, a3);
}

uint64_t ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase()
{
  return MEMORY[0x270F97268]();
}

uint64_t ctu::OsLogContext::OsLogContext()
{
  return MEMORY[0x270F972D0]();
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x270F972D8](this, a2, a3);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
}

uint64_t ctu::TrackedLogger::registerLoggerToServer()
{
  return MEMORY[0x270F97398]();
}

uint64_t ctu::LogMessageBuffer::createWithFormat(ctu::LogMessageBuffer *this, const char *a2, ...)
{
  return MEMORY[0x270F973F8](this, a2);
}

void ctu::LogMessageBuffer::~LogMessageBuffer(ctu::LogMessageBuffer *this)
{
}

uint64_t ctu::LoggerCommonBase::LoggerCommonBase()
{
  return MEMORY[0x270F97430]();
}

uint64_t ctu::isProcessRunning()
{
  return MEMORY[0x270F97450]();
}

uint64_t ctu::DispatchTimerService::create()
{
  return MEMORY[0x270F974A8]();
}

uint64_t ctu::LogServer::setEnabled(ctu::LogServer *this)
{
  return MEMORY[0x270F97710](this);
}

uint64_t ctu::LogServer::start(ctu::LogServer *this)
{
  return MEMORY[0x270F97728](this);
}

uint64_t ctu::LogServer::create()
{
  return MEMORY[0x270F97730]();
}

uint64_t ctu::LogServer::addWriter()
{
  return MEMORY[0x270F97738]();
}

uint64_t AriMsg::GetBufCtx(AriMsg *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8CD80](this, a2);
}

uint64_t AriOsa::LogSrcInfo(AriOsa *this, const char *a2, const char *a3)
{
  return MEMORY[0x270F8CDB8](this, a2, a3);
}

uint64_t AriSdk::ARI_IBIFilerHSReadBBReq_SDK::ARI_IBIFilerHSReadBBReq_SDK(AriSdk::ARI_IBIFilerHSReadBBReq_SDK *this)
{
  return MEMORY[0x270F8D6E0](this);
}

void AriSdk::ARI_IBIFilerHSReadBBReq_SDK::~ARI_IBIFilerHSReadBBReq_SDK(AriSdk::ARI_IBIFilerHSReadBBReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIFilerHSWriteBBReq_SDK::ARI_IBIFilerHSWriteBBReq_SDK(AriSdk::ARI_IBIFilerHSWriteBBReq_SDK *this)
{
  return MEMORY[0x270F8DA10](this);
}

void AriSdk::ARI_IBIFilerHSWriteBBReq_SDK::~ARI_IBIFilerHSWriteBBReq_SDK(AriSdk::ARI_IBIFilerHSWriteBBReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIFilerHSEndBBSessionReq_SDK::ARI_IBIFilerHSEndBBSessionReq_SDK(AriSdk::ARI_IBIFilerHSEndBBSessionReq_SDK *this)
{
  return MEMORY[0x270F8EDE0](this);
}

void AriSdk::ARI_IBIFilerHSEndBBSessionReq_SDK::~ARI_IBIFilerHSEndBBSessionReq_SDK(AriSdk::ARI_IBIFilerHSEndBBSessionReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIFilerHSReadBBGetSizeReq_SDK::ARI_IBIFilerHSReadBBGetSizeReq_SDK(AriSdk::ARI_IBIFilerHSReadBBGetSizeReq_SDK *this)
{
  return MEMORY[0x270F8F110](this);
}

void AriSdk::ARI_IBIFilerHSReadBBGetSizeReq_SDK::~ARI_IBIFilerHSReadBBGetSizeReq_SDK(AriSdk::ARI_IBIFilerHSReadBBGetSizeReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIFilerHSStartReadBBSessionReq_SDK::ARI_IBIFilerHSStartReadBBSessionReq_SDK(AriSdk::ARI_IBIFilerHSStartReadBBSessionReq_SDK *this)
{
  return MEMORY[0x270F8FC48](this);
}

void AriSdk::ARI_IBIFilerHSStartReadBBSessionReq_SDK::~ARI_IBIFilerHSStartReadBBSessionReq_SDK(AriSdk::ARI_IBIFilerHSStartReadBBSessionReq_SDK *this)
{
}

uint64_t AriSdk::ARI_IBIFilerHSStartWriteBBSessionReq_SDK::ARI_IBIFilerHSStartWriteBBSessionReq_SDK(AriSdk::ARI_IBIFilerHSStartWriteBBSessionReq_SDK *this)
{
  return MEMORY[0x270F8FD70](this);
}

void AriSdk::ARI_IBIFilerHSStartWriteBBSessionReq_SDK::~ARI_IBIFilerHSStartWriteBBSessionReq_SDK(AriSdk::ARI_IBIFilerHSStartWriteBBSessionReq_SDK *this)
{
}

uint64_t AriHost::StartStream()
{
  return MEMORY[0x270F90250]();
}

uint64_t AriHost::RegisterClient(AriHost *this, const char *a2, int *a3, dispatch_queue_s *a4)
{
  return MEMORY[0x270F90260](this, a2, a3, a4);
}

{
  return MEMORY[0x270F90268](this, a2, a3, a4);
}

uint64_t AriHost::DeregisterClient(AriHost *this)
{
  return MEMORY[0x270F90280](this);
}

uint64_t AriHost::ReRegisterClient()
{
  return MEMORY[0x270F90288]();
}

uint64_t AriHost::SetRTEventHandler()
{
  return MEMORY[0x270F90298]();
}

uint64_t AriHost::Init(AriHost *this)
{
  return MEMORY[0x270F902A8](this);
}

uint64_t AriHost::Send()
{
  return MEMORY[0x270F902B0]();
}

uint64_t AriHost::EndStream(AriHost *this)
{
  return MEMORY[0x270F902C8](this);
}

uint64_t hsfiler::ARICommandDriver::EndSession()
{
  return MEMORY[0x270F92AB0]();
}

uint64_t hsfiler::ARICommandDriver::GetReadSize()
{
  return MEMORY[0x270F92AB8]();
}

uint64_t hsfiler::ARICommandDriver::WriteFileToBB()
{
  return MEMORY[0x270F92AC0]();
}

uint64_t hsfiler::ARICommandDriver::ReadFileFromBB()
{
  return MEMORY[0x270F92AC8]();
}

uint64_t hsfiler::ARICommandDriver::StartReadSession()
{
  return MEMORY[0x270F92AD0]();
}

uint64_t hsfiler::ARICommandDriver::StartWriteSession()
{
  return MEMORY[0x270F92AD8]();
}

uint64_t hsfiler::ARICommandDriver::ARICommandDriver()
{
  return MEMORY[0x270F92AE0]();
}

void hsfiler::ARICommandDriver::~ARICommandDriver(hsfiler::ARICommandDriver *this)
{
}

uint64_t ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog()
{
  return MEMORY[0x270F97838]();
}

uint64_t ctu::LoggerCommonBase::getLogDomain(ctu::LoggerCommonBase *this)
{
  return MEMORY[0x270F978D8](this);
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

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
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
  return MEMORY[0x270F98688]();
}

{
  return MEMORY[0x270F98690]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x270F98698]();
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

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98788]();
}

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987D8]();
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

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x270F98C28]();
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E30](retstr, __val);
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

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
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

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
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
  return MEMORY[0x270ED95A8](when, delta);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
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

kern_return_t mach_vm_region(vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, vm_region_flavor_t flavor, vm_region_info_t info, mach_msg_type_number_t *infoCnt, mach_port_t *object_name)
{
  return MEMORY[0x270EDA2C8](*(void *)&target_task, address, size, *(void *)&flavor, info, infoCnt, object_name);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}