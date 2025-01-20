void TelephonyBasebandWatchdogStart(NSObject **a1, unsigned int a2, void *a3)
{
  NSObject *global_queue;
  NSObject *v7;
  dispatch_time_t v8;

  global_queue = dispatch_get_global_queue(-2, 0);
  v7 = dispatch_source_create(MEMORY[0x263EF8400], 1uLL, 0, global_queue);
  v8 = dispatch_time(0, 1000000 * a2);
  dispatch_source_set_event_handler(v7, a3);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 500000 * a2);
  dispatch_activate(v7);
  *a1 = v7;
}

void TelephonyBasebandWatchdogStop(dispatch_object_t *a1)
{
  v2 = *a1;
  if (!v2)
  {
    __TUAssertTrigger();
    v2 = *a1;
  }
  dispatch_source_cancel(v2);
  dispatch_release(*a1);
  *a1 = 0;
}

uint64_t TelephonySystemTrace::TelephonySystemTrace(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 8), *(const std::string::value_type **)(a2 + 8), *(void *)(a2 + 16));
  }
  else
  {
    long long v4 = *(_OWORD *)(a2 + 8);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(_OWORD *)(a1 + 8) = v4;
  }
  v5 = (std::string *)(a1 + 32);
  if (*(char *)(a2 + 55) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a2 + 32), *(void *)(a2 + 40));
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  *(unsigned char *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = dispatch_queue_create("SystemTrace", 0);
  return a1;
}

void sub_23CA1EBFC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

void TelephonySystemTrace::~TelephonySystemTrace(TelephonySystemTrace *this)
{
  if (TelephonyUtilTraceAllowed())
  {
    v2 = *((void *)this + 9);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN20TelephonySystemTraceD2Ev_block_invoke;
    block[3] = &__block_descriptor_tmp;
    block[4] = this;
    dispatch_sync(v2, block);
  }
  v3 = *((void *)this + 9);
  if (v3) {
    dispatch_release(v3);
  }
  if (*((char *)this + 55) < 0) {
    operator delete(*((void **)this + 4));
  }
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

void __clang_call_terminate(void *a1)
{
}

uint64_t ___ZN20TelephonySystemTraceD2Ev_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 56))
  {
    result = TelephonyUtilRunCommand();
    if (!result) {
      *(unsigned char *)(v1 + 56) = 0;
    }
  }
  return result;
}

uint64_t TelephonySystemTrace::stopTrace_sync(TelephonySystemTrace *this)
{
  if (*((unsigned char *)this + 56))
  {
    if (TelephonyUtilRunCommand()) {
      return 0;
    }
    *((unsigned char *)this + 56) = 0;
  }
  return 1;
}

BOOL TelephonySystemTrace::startTrace_sync(TelephonySystemTrace *this)
{
  if (*((unsigned char *)this + 56)) {
    return 1;
  }
  BOOL result = TelephonySystemTrace::setTraceBuffer(this);
  if (result)
  {
    if (TelephonyUtilRunCommand())
    {
      return 0;
    }
    else
    {
      BOOL result = 1;
      *((unsigned char *)this + 56) = 1;
    }
  }
  return result;
}

BOOL TelephonySystemTrace::setTraceBuffer(TelephonySystemTrace *this)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  memset(&v4, 170, sizeof(v4));
  std::to_string(&v4, *(_DWORD *)this);
  v5 = "trace";
  long long v6 = "-i";
  if ((v4.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v1 = &v4;
  }
  else {
    uint64_t v1 = (std::string *)v4.__r_.__value_.__r.__words[0];
  }
  v7 = "-b";
  v8 = v1;
  uint64_t v9 = 0;
  int v2 = TelephonyUtilRunCommand();
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
  return v2 == 0;
}

void sub_23CA1EF84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL TelephonySystemTrace::enableTrace(TelephonySystemTrace *this)
{
  return TelephonyUtilRunCommand() == 0;
}

BOOL TelephonySystemTrace::disableTrace(TelephonySystemTrace *this)
{
  return TelephonyUtilRunCommand() == 0;
}

void TelephonySystemTrace::watchdogStart(uint64_t a1, int a2, uint64_t a3, void **a4, void **a5)
{
  if (TelephonyUtilTraceAllowed())
  {
    uint64_t v10 = _Block_copy(&__block_literal_global);
    v24 = v10;
    TelephonySystemTrace::watchdogStop(a1, 0, &v24);
    if (v10) {
      _Block_release(v10);
    }
    v11 = *(NSObject **)(a1 + 72);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN20TelephonySystemTrace13watchdogStartEjNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvvEEESB__block_invoke_2;
    block[3] = &__block_descriptor_tmp_3;
    block[4] = a1;
    dispatch_async(v11, block);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZN20TelephonySystemTrace13watchdogStartEjNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvvEEESB__block_invoke_3;
    aBlock[3] = &__block_descriptor_tmp_8;
    aBlock[4] = a1;
    if (*(char *)(a3 + 23) < 0) {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
    }
    else {
      std::string __p = *(std::string *)a3;
    }
    int v21 = a2;
    v12 = *a4;
    if (*a4) {
      v12 = _Block_copy(v12);
    }
    v20 = v12;
    v13 = _Block_copy(aBlock);
    v22 = v13;
    TelephonySystemTrace::watchdogStartInternal(a1, a2, &v22);
    if (v13) {
      _Block_release(v13);
    }
    v14 = *(NSObject **)(a1 + 72);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 1174405120;
    v16[2] = ___ZN20TelephonySystemTrace13watchdogStartEjNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvvEEESB__block_invoke_9;
    v16[3] = &__block_descriptor_tmp_12;
    v15 = *a5;
    if (*a5) {
      v15 = _Block_copy(v15);
    }
    v17 = v15;
    dispatch_async(v14, v16);
    if (v17) {
      _Block_release(v17);
    }
    if (v20) {
      _Block_release(v20);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_23CA1F2CC(_Unwind_Exception *exception_object)
{
  if (v1) {
    _Block_release(v1);
  }
  _Unwind_Resume(exception_object);
}

void TelephonySystemTrace::watchdogStop(uint64_t a1, int a2, void **a3)
{
  if (TelephonyUtilTraceAllowed())
  {
    if (a2)
    {
      long long v6 = *(NSObject **)(a1 + 72);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = ___ZN20TelephonySystemTrace12watchdogStopEbN8dispatch5blockIU13block_pointerFvvEEE_block_invoke;
      block[3] = &__block_descriptor_tmp_14;
      block[4] = a1;
      dispatch_async(v6, block);
    }
    v7 = *(NSObject **)(a1 + 72);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 0x40000000;
    v12[2] = ___ZN20TelephonySystemTrace12watchdogStopEbN8dispatch5blockIU13block_pointerFvvEEE_block_invoke_2;
    v12[3] = &__block_descriptor_tmp_15;
    v12[4] = a1;
    dispatch_async(v7, v12);
    v8 = *(NSObject **)(a1 + 72);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1174405120;
    v10[2] = ___ZN20TelephonySystemTrace12watchdogStopEbN8dispatch5blockIU13block_pointerFvvEEE_block_invoke_3;
    v10[3] = &__block_descriptor_tmp_18;
    uint64_t v9 = *a3;
    if (*a3) {
      uint64_t v9 = _Block_copy(v9);
    }
    aBlock = v9;
    dispatch_async(v8, v10);
    if (aBlock) {
      _Block_release(aBlock);
    }
  }
}

BOOL ___ZN20TelephonySystemTrace13watchdogStartEjNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvvEEESB__block_invoke_2(uint64_t a1)
{
  return TelephonySystemTrace::startTrace_sync(*(TelephonySystemTrace **)(a1 + 32));
}

void TelephonySystemTrace::watchdogStartInternal(uint64_t a1, int a2, void **a3)
{
  v3 = *(NSObject **)(a1 + 72);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZN20TelephonySystemTrace21watchdogStartInternalEjN8dispatch5blockIU13block_pointerFvvEEE_block_invoke;
  block[3] = &__block_descriptor_tmp_13;
  block[4] = a1;
  int v7 = a2;
  std::string v4 = *a3;
  if (*a3) {
    std::string v4 = _Block_copy(v4);
  }
  aBlock = v4;
  dispatch_async(v3, block);
  if (aBlock) {
    _Block_release(aBlock);
  }
}

uint64_t ___ZN20TelephonySystemTrace13watchdogStartEjNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvvEEESB__block_invoke_3(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  int v2 = *(TelephonySystemTrace **)(a1 + 32);
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  long long v33 = v3;
  long long v32 = v3;
  long long v31 = v3;
  long long v30 = v3;
  long long v29 = v3;
  long long v28 = v3;
  long long v27 = v3;
  long long v26 = v3;
  long long v25 = v3;
  long long v22 = v3;
  v20[3] = v3;
  *(_OWORD *)std::string __p = v3;
  v20[1] = v3;
  v20[2] = v3;
  v20[0] = v3;
  uint64_t v4 = MEMORY[0x263F8C340] + 64;
  uint64_t v24 = MEMORY[0x263F8C340] + 64;
  v5 = (uint64_t *)MEMORY[0x263F8C2C8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v19 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(uint64_t *)((char *)&v19 + *(void *)(v19 - 24)) = v6;
  int v7 = (std::ios_base *)((char *)&v19 + *(void *)(v19 - 24));
  std::ios_base::init(v7, v20);
  uint64_t v8 = MEMORY[0x263F8C340] + 24;
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  uint64_t v19 = v8;
  uint64_t v24 = v4;
  std::streambuf::basic_streambuf();
  uint64_t v9 = MEMORY[0x263F8C318] + 16;
  *(void *)&v20[0] = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)std::string __p = 0u;
  long long v22 = 0u;
  LODWORD(v23) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v19, (uint64_t)"operation timeout at ", 21);
  int v10 = *(char *)(a1 + 63);
  if (v10 >= 0) {
    uint64_t v11 = a1 + 40;
  }
  else {
    uint64_t v11 = *(void *)(a1 + 40);
  }
  if (v10 >= 0) {
    uint64_t v12 = *(unsigned __int8 *)(a1 + 63);
  }
  else {
    uint64_t v12 = *(void *)(a1 + 48);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v19, v11, v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v19, (uint64_t)", timeout ", 10);
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>(&__dst, (uint64_t)v20);
  if (v35 >= 0) {
    p_dst = (const char *)&__dst;
  }
  else {
    p_dst = (const char *)__dst;
  }
  syslog(5, "Watchdog fired: %s\n", p_dst);
  if (SHIBYTE(v35) < 0) {
    operator delete((void *)__dst);
  }
  long long __dst = xmmword_264E7AFD8;
  uint64_t v35 = 0;
  TelephonyUtilRunCommand();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>(&__dst, (uint64_t)v20);
  TelephonyUtilWriteStackshot();
  if (SHIBYTE(v35) < 0) {
    operator delete((void *)__dst);
  }
  TelephonySystemTrace::writeTraceBuffer(v2);
  long long __dst = xmmword_264E7AFC0;
  uint64_t v35 = 0;
  TelephonyUtilRunCommand();
  v14 = *((void *)v2 + 9);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZN20TelephonySystemTrace13watchdogStartEjNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvvEEESB__block_invoke_4;
  block[3] = &__block_descriptor_tmp_7;
  v15 = *(void **)(a1 + 64);
  if (v15) {
    v15 = _Block_copy(v15);
  }
  aBlock = v15;
  dispatch_async(v14, block);
  if (aBlock) {
    _Block_release(aBlock);
  }
  uint64_t v19 = *v5;
  *(uint64_t *)((char *)&v19 + *(void *)(v19 - 24)) = v5[3];
  *(void *)&v20[0] = v9;
  if (SBYTE7(v22) < 0) {
    operator delete(__p[0]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x23ECEDDF0](&v24);
}

void sub_23CA1F948(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

BOOL TelephonySystemTrace::writeTraceBuffer(TelephonySystemTrace *this)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v2 = (char *)this + 32;
  if (*((char *)this + 55) < 0) {
    int v2 = *(const char **)v2;
  }
  TelephonySystemTrace::generateFileName(v2, &v14);
  int v3 = *((char *)this + 31);
  if (v3 >= 0) {
    uint64_t v4 = (char *)this + 8;
  }
  else {
    uint64_t v4 = (const std::string::value_type *)*((void *)this + 1);
  }
  if (v3 >= 0) {
    std::string::size_type v5 = *((unsigned __int8 *)this + 31);
  }
  else {
    std::string::size_type v5 = *((void *)this + 2);
  }
  uint64_t v6 = std::string::insert(&v14, 0, v4, v5);
  long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  int64_t v13 = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (v13 >= 0) {
    uint64_t v8 = __p;
  }
  else {
    uint64_t v8 = (void **)__p[0];
  }
  syslog(5, "Writing system trace at %s\n", (const char *)v8);
  v14.__r_.__value_.__r.__words[0] = (std::string::size_type)"trace";
  v14.__r_.__value_.__l.__size_ = (std::string::size_type)"-l";
  if (v13 >= 0) {
    uint64_t v9 = __p;
  }
  else {
    uint64_t v9 = (void **)__p[0];
  }
  v14.__r_.__value_.__r.__words[2] = (std::string::size_type)v9;
  uint64_t v15 = 0;
  int v10 = TelephonyUtilRunCommand();
  if (SHIBYTE(v13) < 0) {
    operator delete(__p[0]);
  }
  return v10 == 0;
}

void sub_23CA1FAF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN20TelephonySystemTrace13watchdogStartEjNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvvEEESB__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void *__copy_helper_block_e8_32c43_ZTSN8dispatch5blockIU13block_pointerFvvEEE(uint64_t a1, uint64_t a2)
{
  BOOL result = *(void **)(a2 + 32);
  if (result) {
    BOOL result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c43_ZTSN8dispatch5blockIU13block_pointerFvvEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
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
  MEMORY[0x23ECEDDF0](a1 + 112);
  return a1;
}

void *__copy_helper_block_e8_40c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c43_ZTSN8dispatch5blockIU13block_pointerFvvEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (std::string *)(a1 + 40);
  if (*(char *)(a2 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)(a2 + 40), *(void *)(a2 + 48));
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 40);
    v4->__r_.__value_.__r.__words[2] = *(void *)(a2 + 56);
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
  }
  BOOL result = *(void **)(a2 + 64);
  if (result) {
    BOOL result = _Block_copy(result);
  }
  *(void *)(a1 + 64) = result;
  return result;
}

void __destroy_helper_block_e8_40c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c43_ZTSN8dispatch5blockIU13block_pointerFvvEEE(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 64);
  if (v2) {
    _Block_release(v2);
  }
  if (*(char *)(a1 + 63) < 0)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    operator delete(v3);
  }
}

uint64_t ___ZN20TelephonySystemTrace13watchdogStartEjNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvvEEESB__block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ___ZN20TelephonySystemTrace21watchdogStartInternalEjN8dispatch5blockIU13block_pointerFvvEEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  *(void *)(v2 + 64) = dispatch_source_create(MEMORY[0x263EF8400], 1uLL, 0, *(dispatch_queue_t *)(v2 + 72));
  unsigned int v3 = *(_DWORD *)(a1 + 48);
  dispatch_time_t v4 = dispatch_time(0, 1000000 * v3);
  dispatch_source_set_event_handler(*(dispatch_source_t *)(v2 + 64), *(dispatch_block_t *)(a1 + 40));
  dispatch_source_set_timer(*(dispatch_source_t *)(v2 + 64), v4, 0xFFFFFFFFFFFFFFFFLL, 500000 * v3);
  long long v5 = *(NSObject **)(v2 + 64);

  dispatch_activate(v5);
}

void *__copy_helper_block_e8_40c43_ZTSN8dispatch5blockIU13block_pointerFvvEEE(uint64_t a1, uint64_t a2)
{
  BOOL result = *(void **)(a2 + 40);
  if (result) {
    BOOL result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c43_ZTSN8dispatch5blockIU13block_pointerFvvEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t ___ZN20TelephonySystemTrace12watchdogStopEbN8dispatch5blockIU13block_pointerFvvEEE_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 56))
  {
    BOOL result = TelephonyUtilRunCommand();
    if (!result) {
      *(unsigned char *)(v1 + 56) = 0;
    }
  }
  return result;
}

void ___ZN20TelephonySystemTrace12watchdogStopEbN8dispatch5blockIU13block_pointerFvvEEE_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 64);
  if (v2)
  {
    dispatch_source_cancel(v2);
    dispatch_release(*(dispatch_object_t *)(v1 + 64));
    *(void *)(v1 + 64) = 0;
  }
}

uint64_t ___ZN20TelephonySystemTrace12watchdogStopEbN8dispatch5blockIU13block_pointerFvvEEE_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

unint64_t TelephonySystemTrace::generateFileName@<X0>(const char *a1@<X1>, void *a2@<X8>)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  memset(&v12, 0, sizeof(v12));
  time_t v11 = time(0);
  localtime_r(&v11, &v12);
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v27 = v5;
  long long v28 = v5;
  long long v25 = v5;
  long long v26 = v5;
  long long v23 = v5;
  long long v24 = v5;
  long long v21 = v5;
  long long v22 = v5;
  long long v19 = v5;
  long long v20 = v5;
  long long v17 = v5;
  long long v18 = v5;
  long long v15 = v5;
  long long v16 = v5;
  *(_OWORD *)__str = v5;
  long long v14 = v5;
  snprintf(__str, 0x100uLL, "%s%04u-%02u-%02u-%02u-%02u-%02u-systemtrace.raw", a1, v12.tm_year + 1900, v12.tm_mon + 1, v12.tm_mday, v12.tm_hour, v12.tm_min, v12.tm_sec);
  unint64_t result = strlen(__str);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v7 = result;
  if (result >= 0x17)
  {
    uint64_t v8 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v8 = result | 7;
    }
    uint64_t v9 = v8 + 1;
    int v10 = operator new(v8 + 1);
    a2[1] = v7;
    a2[2] = v9 | 0x8000000000000000;
    *a2 = v10;
    a2 = v10;
  }
  else
  {
    *((unsigned char *)a2 + 23) = result;
    if (!result) {
      goto LABEL_9;
    }
  }
  unint64_t result = (unint64_t)memcpy(a2, __str, v7);
LABEL_9:
  *((unsigned char *)a2 + v7) = 0;
  return result;
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

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_264E7AEE0, MEMORY[0x263F8C060]);
}

void sub_23CA20180(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  unint64_t result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  v23[0] = 0xAAAAAAAAAAAAAAAALL;
  v23[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x23ECEDD50](v23, a1);
  if (LOBYTE(v23[0]))
  {
    std::string::size_type v6 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *((void *)v6 + 5);
    int v8 = *((_DWORD *)v6 + 2);
    int v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      int v10 = std::locale::use_facet(__b, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(__b);
      *((_DWORD *)v6 + 36) = v9;
    }
    uint64_t v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v12 = a2 + a3;
    }
    else {
      uint64_t v12 = a2;
    }
    if (!v7) {
      goto LABEL_29;
    }
    uint64_t v13 = *((void *)v6 + 3);
    BOOL v14 = v13 <= a3;
    uint64_t v15 = v13 - a3;
    size_t v16 = v14 ? 0 : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_29;
    }
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
        long long v17 = (std::locale::__imp *)operator new(v18 + 1);
        __b[1].__locale_ = (std::locale::__imp *)v16;
        __b[2].__locale_ = (std::locale::__imp *)(v19 | 0x8000000000000000);
        __b[0].__locale_ = v17;
      }
      else
      {
        HIBYTE(__b[2].__locale_) = v16;
        long long v17 = (std::locale::__imp *)__b;
      }
      memset(v17, v9, v16);
      *((unsigned char *)v17 + v16) = 0;
      long long v20 = SHIBYTE(__b[2].__locale_) >= 0 ? __b : (std::locale *)__b[0].__locale_;
      uint64_t v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(void *)v7 + 96))(v7, v20, v16);
      if (SHIBYTE(__b[2].__locale_) < 0) {
        operator delete(__b[0].__locale_);
      }
      if (v21 != v16) {
        goto LABEL_29;
      }
    }
    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((void *)v6 + 3) = 0;
    }
    else
    {
LABEL_29:
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x23ECEDD60](v23);
  return a1;
}

void sub_23CA20480(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  MEMORY[0x23ECEDD60](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x23CA20454);
}

void sub_23CA204EC(_Unwind_Exception *a1)
{
}

void *std::stringbuf::str[abi:ne180100]<std::allocator<char>>(void *__dst, uint64_t a2)
{
  uint64_t v2 = __dst;
  int v3 = *(_DWORD *)(a2 + 96);
  if ((v3 & 0x10) != 0)
  {
    unint64_t v5 = *(void *)(a2 + 88);
    unint64_t v6 = *(void *)(a2 + 48);
    if (v5 < v6)
    {
      *(void *)(a2 + 88) = v6;
      unint64_t v5 = v6;
    }
    uint64_t v7 = (const void **)(a2 + 40);
  }
  else
  {
    if ((v3 & 8) == 0)
    {
      size_t v4 = 0;
      *((unsigned char *)__dst + 23) = 0;
      goto LABEL_16;
    }
    uint64_t v7 = (const void **)(a2 + 16);
    unint64_t v5 = *(void *)(a2 + 32);
  }
  int v8 = *v7;
  size_t v4 = v5 - (void)*v7;
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v4 >= 0x17)
  {
    uint64_t v9 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v9 = v4 | 7;
    }
    uint64_t v10 = v9 + 1;
    uint64_t v11 = operator new(v9 + 1);
    v2[1] = v4;
    v2[2] = v10 | 0x8000000000000000;
    void *v2 = v11;
    uint64_t v2 = v11;
  }
  else
  {
    *((unsigned char *)__dst + 23) = v4;
    if (!v4) {
      goto LABEL_16;
    }
  }
  long long __dst = memmove(v2, v8, v4);
LABEL_16:
  *((unsigned char *)v2 + v4) = 0;
  return __dst;
}

void TelephonyBasebandWatchdogStartWithStackshot(NSObject **a1, unsigned int a2, uint64_t a3)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = __TelephonyBasebandWatchdogStartWithStackshot_block_invoke;
  v3[3] = &__block_descriptor_tmp_0;
  v3[4] = a3;
  unsigned int v4 = a2;
  TelephonyBasebandWatchdogStart(a1, a2, v3);
}

void __TelephonyBasebandWatchdogStartWithStackshot_block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  *(void *)&long long v1 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v18 = v1;
  long long v19 = v1;
  long long v16 = v1;
  long long v17 = v1;
  long long v14 = v1;
  long long v15 = v1;
  long long v12 = v1;
  long long v13 = v1;
  long long v10 = v1;
  long long v11 = v1;
  long long v8 = v1;
  long long v9 = v1;
  long long v6 = v1;
  long long v7 = v1;
  *(_OWORD *)__str = v1;
  long long v5 = v1;
  snprintf(__str, 0x100uLL, "Telephony operation timeout at '%s', timeout %u\n", *(const char **)(a1 + 32), *(_DWORD *)(a1 + 40));
  _TelephonyUtilDebugPrint();
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    int v3 = __str;
    _os_log_error_impl(&dword_23CA1E000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Telephony watchdog fired: %s\n", buf, 0xCu);
  }
}

uint64_t TelephonyUtilRunCommand()
{
  return MEMORY[0x270F97200]();
}

uint64_t TelephonyUtilTraceAllowed()
{
  return MEMORY[0x270F97218]();
}

uint64_t TelephonyUtilWriteStackshot()
{
  return MEMORY[0x270F97230]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _TelephonyUtilDebugPrint()
{
  return MEMORY[0x270F97240]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
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

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

uint64_t __TUAssertTrigger()
{
  return MEMORY[0x270F97950]();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDA0A0](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

void syslog(int a1, const char *a2, ...)
{
}