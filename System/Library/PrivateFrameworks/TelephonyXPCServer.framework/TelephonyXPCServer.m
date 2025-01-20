void std::__tree<std::string>::destroy(uint64_t a1, char *a2)
{
  uint64_t vars8;

  if (a2)
  {
    std::__tree<std::string>::destroy(a1, *(void *)a2);
    std::__tree<std::string>::destroy(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

const char *TelephonyXPC::ServerPowerObserver::asString(unsigned int a1)
{
  if (a1 > 2) {
    return "Unknown";
  }
  else {
    return off_264490BD0[a1];
  }
}

{
  if (a1 > 3) {
    return "Unknown";
  }
  else {
    return off_264490BE8[a1];
  }
}

void TelephonyXPC::ServerPowerObserver::create(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = 0xAAAAAAAAAAAAAAAALL;
  a3[1] = 0xAAAAAAAAAAAAAAAALL;
  v6 = operator new(0x90uLL);
  v7 = (std::__shared_weak_count *)a1[1];
  uint64_t v11 = *a1;
  v12 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (*(void *)a2) {
    v8 = _Block_copy(*(const void **)a2);
  }
  else {
    v8 = 0;
  }
  v9 = *(NSObject **)(a2 + 8);
  v10[0] = v8;
  v10[1] = v9;
  if (v9) {
    dispatch_retain(v9);
  }
  TelephonyXPC::ServerPowerObserver::ServerPowerObserver(v6, &v11, (uint64_t)v10);
  std::shared_ptr<TelephonyXPC::ServerPowerObserver>::shared_ptr[abi:ne180100]<TelephonyXPC::ServerPowerObserver,void>(a3, (uint64_t)v6);
  if (v9) {
    dispatch_release(v9);
  }
  if (v8) {
    _Block_release(v8);
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  TelephonyXPC::ServerPowerObserver::init((TelephonyXPC::ServerPowerObserver *)*a3);
}

void sub_21E06A73C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  v14 = *(std::__shared_weak_count **)(v12 + 8);
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  _Unwind_Resume(exception_object);
}

uint64_t dispatch::callback<void({block_pointer})(TelephonyXPC::ServerPowerObserver::PowerEvent,TelephonyXPC::ServerPowerObserver::PowerState,dispatch::group_session)>::~callback(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

void TelephonyXPC::ServerPowerObserver::init(TelephonyXPC::ServerPowerObserver *this)
{
  uint64_t v5 = *((void *)this + 9);
  v3 = (std::__shared_weak_count *)*((void *)this + 10);
  v4 = (char *)this + 72;
  if (!v3 || (v6 = std::__shared_weak_count::lock(v3)) == 0) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  v7 = v6;
  p_shared_weak_owners = &v6->__shared_weak_owners_;
  atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1174405120;
  void v10[2] = ___ZN12TelephonyXPC19ServerPowerObserver4initEv_block_invoke;
  v10[3] = &__block_descriptor_tmp_12;
  v10[4] = this;
  v10[5] = v5;
  uint64_t v11 = v7;
  uint64_t v12 = v10;
  atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableIN12TelephonyXPC19ServerPowerObserverEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  block[3] = &__block_descriptor_tmp_33;
  block[4] = v4;
  block[5] = &v12;
  v9 = *((void *)this + 11);
  if (*((void *)this + 12)) {
    dispatch_async_and_wait(v9, block);
  }
  else {
    dispatch_sync(v9, block);
  }
  if (v11) {
    std::__shared_weak_count::__release_weak(v11);
  }
  std::__shared_weak_count::__release_weak(v7);
}

void *TelephonyXPC::ServerPowerObserver::ServerPowerObserver(void *a1, void *a2, uint64_t a3)
{
  *a1 = &unk_26CEE4488;
  uint64_t v5 = ctu::SharedLoggable<TelephonyXPC::ServerPowerObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::SharedLoggable<std::string const&,std::shared_ptr<ctu::LogServer>&>(a1, (uint64_t)"ServerPowerObserver", (uint64_t)"ServerPowerObserver", a2);
  *uint64_t v5 = &unk_26CEE4488;
  v5[13] = 0;
  v5[14] = 0;
  *((_DWORD *)v5 + 30) = 2;
  v6 = *(void **)a3;
  if (*(void *)a3) {
    v6 = _Block_copy(v6);
  }
  v7 = *(NSObject **)(a3 + 8);
  a1[16] = v6;
  a1[17] = v7;
  if (v7) {
    dispatch_retain(v7);
  }
  ctu::LoggerCommonBase::setLogLevel();
  return a1;
}

void sub_21E06A994(_Unwind_Exception *a1)
{
  dispatch::callback<void({block_pointer})(TelephonyXPC::ServerPowerObserver::PowerEvent,TelephonyXPC::ServerPowerObserver::PowerState,dispatch::group_session)>::~callback(v2);
  v4 = (std::__shared_weak_count *)v1[14];
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  ctu::SharedLoggable<TelephonyXPC::ServerPowerObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v1);
  _Unwind_Resume(a1);
}

const char *TelephonyXPC::ServerPowerObserver::getName(TelephonyXPC::ServerPowerObserver *this)
{
  return "ServerPowerObserver";
}

void *ctu::SharedLoggable<TelephonyXPC::ServerPowerObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::SharedLoggable<std::string const&,std::shared_ptr<ctu::LogServer>&>(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  dispatch_object_t object = 0;
  ctu::SharedSynchronizable<TelephonyXPC::ServerPowerObserver>::SharedSynchronizable(a1 + 9, a2, 0, &object);
  if (object) {
    dispatch_release(object);
  }
  *a1 = &unk_26CEE45E8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::LoggerBase((uint64_t)(a1 + 1), a3, a4);
  *a1 = &unk_26CEE46A0;
  return a1;
}

void sub_21E06AA70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object)
{
  ctu::SharedSynchronizable<TelephonyXPC::ServerPowerObserver>::~SharedSynchronizable(v10);
  _Unwind_Resume(a1);
}

void *ctu::SharedLoggable<TelephonyXPC::ServerPowerObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CEE45E8;
  uint64_t v2 = a1 + 9;
  MEMORY[0x223C1F210](a1 + 1);
  ctu::SharedSynchronizable<TelephonyXPC::ServerPowerObserver>::~SharedSynchronizable(v2);
  return a1;
}

{
  void *v2;

  *a1 = &unk_26CEE45E8;
  uint64_t v2 = a1 + 9;
  MEMORY[0x223C1F210](a1 + 1);
  ctu::SharedSynchronizable<TelephonyXPC::ServerPowerObserver>::~SharedSynchronizable(v2);
  return a1;
}

void TelephonyXPC::ServerPowerObserver::~ServerPowerObserver(TelephonyXPC::ServerPowerObserver *this)
{
  *(void *)this = &unk_26CEE4488;
  uint64_t v2 = *((void *)this + 17);
  if (v2) {
    dispatch_release(v2);
  }
  v3 = (const void *)*((void *)this + 16);
  if (v3) {
    _Block_release(v3);
  }
  v4 = (std::__shared_weak_count *)*((void *)this + 14);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  *(void *)this = &unk_26CEE45E8;
  MEMORY[0x223C1F210]((char *)this + 8);
  ctu::SharedSynchronizable<TelephonyXPC::ServerPowerObserver>::~SharedSynchronizable((void *)this + 9);
}

{
  void *v1;
  uint64_t vars8;

  TelephonyXPC::ServerPowerObserver::~ServerPowerObserver(this);
  operator delete(v1);
}

void ___ZN12TelephonyXPC19ServerPowerObserver4initEv_block_invoke(uint64_t a1)
{
  *(void *)&v21[2] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v1 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v21[0] = v1;
  v21[1] = v1;
  long long v20 = v1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN12TelephonyXPC19ServerPowerObserver4initEv_block_invoke_2;
  aBlock[3] = &__block_descriptor_tmp;
  long long v9 = *(_OWORD *)(a1 + 32);
  long long v18 = v9;
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  v19 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  v3 = _Block_copy(aBlock);
  v4 = *(NSObject **)(v9 + 88);
  *(void *)&long long v20 = 1;
  *((void *)&v20 + 1) = v4;
  if (v4) {
    dispatch_retain(v4);
  }
  *(void *)&v21[0] = 0;
  if (v3)
  {
    *((void *)&v21[0] + 1) = _Block_copy(v3);
    memset(&v21[1], 0, 24);
    _Block_release(v3);
  }
  else
  {
    memset((char *)v21 + 8, 0, 32);
  }
  *(_DWORD *)(v9 + 120) = 2;
  ctu::power::manager::get(&v14, (ctu::power::manager *)v4);
  long long v10 = v20;
  if (*((void *)&v20 + 1)) {
    dispatch_retain(*((dispatch_object_t *)&v20 + 1));
  }
  uint64_t v5 = *(void **)&v21[0];
  if (*(void *)&v21[0]) {
    uint64_t v5 = _Block_copy(*(const void **)&v21[0]);
  }
  uint64_t v11 = v5;
  v6 = (void *)*((void *)&v21[0] + 1);
  if (*((void *)&v21[0] + 1)) {
    v6 = _Block_copy(*((const void **)&v21[0] + 1));
  }
  uint64_t v12 = v6;
  if (SBYTE7(v21[2]) < 0) {
    std::string::__init_copy_ctor_external(&v13, *(const std::string::value_type **)&v21[1], *((std::string::size_type *)&v21[1] + 1));
  }
  else {
    std::string v13 = *(std::string *)&v21[1];
  }
  ctu::power::manager::registerListener();
  long long v7 = v16;
  long long v16 = 0uLL;
  v8 = *(std::__shared_weak_count **)(v9 + 112);
  *(_OWORD *)(v9 + 104) = v7;
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    if (*((void *)&v16 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v16 + 1));
    }
  }
  ctu::power::manager::parameters::~parameters((void **)&v10);
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  ctu::power::manager::parameters::~parameters((void **)&v20);
  if (v19) {
    std::__shared_weak_count::__release_weak(v19);
  }
}

void sub_21E06AD90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, dispatch_object_t object, void *a14, void *aBlock, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,std::__shared_weak_count *a30)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (a14) {
    _Block_release(a14);
  }
  if (object) {
    dispatch_release(object);
  }
  if (a20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a20);
  }
  ctu::power::manager::parameters::~parameters((void **)(v30 - 96));
  if (a30) {
    std::__shared_weak_count::__release_weak(a30);
  }
  _Unwind_Resume(a1);
}

void ___ZN12TelephonyXPC19ServerPowerObserver4initEv_block_invoke_2(void *a1, int a2, uint64_t a3, const void **a4)
{
  v6 = (std::__shared_weak_count *)a1[6];
  if (!v6)
  {
    long long v9 = 0;
    goto LABEL_7;
  }
  uint64_t v8 = a1[4];
  long long v9 = std::__shared_weak_count::lock(v6);
  if (!v9 || !a1[5])
  {
LABEL_7:
    (*((void (**)(void))*a4 + 2))();
    if (!v9) {
      return;
    }
    goto LABEL_12;
  }
  if (*a4) {
    long long v10 = _Block_copy(*a4);
  }
  else {
    long long v10 = 0;
  }
  uint64_t v11 = v10;
  TelephonyXPC::ServerPowerObserver::handlePowerNotification_sync(v8, (uint64_t)&v11, a2);
  if (v10) {
    _Block_release(v10);
  }
LABEL_12:
  std::__shared_weak_count::__release_shared[abi:ne180100](v9);
}

void sub_21E06AF04(_Unwind_Exception *a1)
{
  if (v2) {
    _Block_release(v2);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void TelephonyXPC::ServerPowerObserver::handlePowerNotification_sync(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 <= -536870273)
  {
    if (a3 != -536870320 && a3 != -536870315)
    {
      if (a3 == -536870288)
      {
        *(_DWORD *)(a1 + 120) = 0;
LABEL_17:
        int v6 = 4;
        char v5 = 1;
        goto LABEL_19;
      }
LABEL_16:
      *(_DWORD *)(a1 + 120) = 2;
      goto LABEL_17;
    }
LABEL_12:
    char v5 = 0;
    *(_DWORD *)(a1 + 120) = 2;
    int v6 = 1;
    goto LABEL_19;
  }
  if (a3 > -536870129)
  {
    if (a3 == -536870112)
    {
      char v5 = 0;
      *(_DWORD *)(a1 + 120) = 2;
      int v6 = 3;
      goto LABEL_19;
    }
    if (a3 != -536870128) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }
  if (a3 != -536870272)
  {
    if (a3 == -536870144)
    {
      char v5 = 0;
      int v6 = 0;
      *(_DWORD *)(a1 + 120) = 2;
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  char v5 = 0;
  if (*(_DWORD *)(a1 + 120)) {
    *(_DWORD *)(a1 + 120) = 1;
  }
  int v6 = 2;
LABEL_19:
  ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
  if ((**(unsigned int (***)(uint64_t, uint64_t))(a1 + 8))(a1 + 8, 20))
  {
    unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v27 = v7;
    *(_OWORD *)group = v7;
    long long block = v7;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&block);
    MEMORY[0x223C1F330](&block, "Power Notification [");
    ctu::operator<<();
    uint64_t v8 = ctu::operator<<();
    uint64_t v9 = MEMORY[0x223C1F330](v8, "]");
    MEMORY[0x223C1F330](v9, " Event [");
    uint64_t v10 = ctu::operator<<();
    uint64_t v11 = MEMORY[0x223C1F330](v10, "]");
    MEMORY[0x223C1F330](v11, " PowerState [");
    uint64_t v12 = ctu::operator<<();
    uint64_t v13 = MEMORY[0x223C1F330](v12, "]");
    MEMORY[0x223C1F330](v13, " Forced Sleep [");
    uint64_t v14 = ctu::operator<<();
    MEMORY[0x223C1F330](v14, "]");
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x223C1F270](&block);
  }
  if ((v5 & 1) == 0 && *(void *)(a1 + 128) && *(void *)(a1 + 136))
  {
    v15 = dispatch_group_create();
    long long v16 = v15;
    if (v15)
    {
      dispatch_retain(v15);
      dispatch_group_enter(v16);
      unsigned int v17 = *(_DWORD *)(a1 + 120);
      dispatch_retain(v16);
      dispatch_group_enter(v16);
    }
    else
    {
      unsigned int v17 = *(_DWORD *)(a1 + 120);
    }
    long long v18 = *(const void **)(a1 + 128);
    if (v18) {
      v19 = _Block_copy(v18);
    }
    else {
      v19 = 0;
    }
    long long v20 = *(NSObject **)(a1 + 136);
    *(void *)&long long block = MEMORY[0x263EF8330];
    *((void *)&block + 1) = 1174405120;
    *(void *)&long long v27 = ___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC19ServerPowerObserver10PowerEventENS2_10PowerStateENS_13group_sessionEEEclIJS3_S4_S5_EEEvDpT__block_invoke;
    *((void *)&v27 + 1) = &__block_descriptor_tmp_34;
    if (v19) {
      v21 = _Block_copy(v19);
    }
    else {
      v21 = 0;
    }
    unint64_t v29 = __PAIR64__(v17, v6);
    group[0] = v21;
    group[1] = v16;
    if (v16)
    {
      dispatch_retain(v16);
      if (group[1]) {
        dispatch_group_enter(group[1]);
      }
    }
    dispatch_async(v20, &block);
    if (group[1])
    {
      dispatch_group_leave(group[1]);
      if (group[1]) {
        dispatch_release(group[1]);
      }
    }
    if (group[0]) {
      _Block_release(group[0]);
    }
    if (v19) {
      _Block_release(v19);
    }
    if (v16)
    {
      dispatch_group_leave(v16);
      dispatch_release(v16);
    }
    v22 = *(NSObject **)(a1 + 88);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 1174405120;
    v24[2] = ___ZN12TelephonyXPC19ServerPowerObserver28handlePowerNotification_syncEN8dispatch5blockIU13block_pointerFvbEEEjb_block_invoke;
    v24[3] = &__block_descriptor_tmp_19;
    v24[4] = a1;
    v23 = *(void **)a2;
    if (*(void *)a2) {
      v23 = _Block_copy(v23);
    }
    aBlock = v23;
    dispatch_group_notify(v16, v22, v24);
    if (aBlock) {
      _Block_release(aBlock);
    }
    if (v16)
    {
      dispatch_group_leave(v16);
      dispatch_release(v16);
      dispatch_release(v16);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)a2 + 16))();
  }
}

uint64_t __copy_helper_block_e8_40c60_ZTSNSt3__18weak_ptrIN12TelephonyXPC19ServerPowerObserverEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c60_ZTSNSt3__18weak_ptrIN12TelephonyXPC19ServerPowerObserverEEE(uint64_t a1)
{
  long long v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

uint64_t std::hex[abi:ne180100](uint64_t result)
{
  *(_DWORD *)(result + 8) = *(_DWORD *)(result + 8) & 0xFFFFFFB5 | 8;
  return result;
}

uint64_t ___ZN12TelephonyXPC19ServerPowerObserver28handlePowerNotification_syncEN8dispatch5blockIU13block_pointerFvbEEEjb_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(v2 + 8));
  if ((**(unsigned int (***)(uint64_t, uint64_t))(v2 + 8))(v2 + 8, 20))
  {
    unint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v5[1] = v3;
    v5[2] = v3;
    v5[0] = v3;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)v5);
    MEMORY[0x223C1F330](v5, "All clients acknowledged the power notification");
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x223C1F270](v5);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void *__copy_helper_block_e8_40c43_ZTSN8dispatch5blockIU13block_pointerFvbEEE(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a2 + 40);
  if (result) {
    result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c43_ZTSN8dispatch5blockIU13block_pointerFvbEEE(uint64_t a1)
{
  long long v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t ctu::Loggable<TelephonyXPC::ServerPowerObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x270F97428](a1 + 8);
}

void ctu::Loggable<TelephonyXPC::ServerPowerObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 + 20) = unk_21E0779DC;
}

uint64_t ctu::Loggable<TelephonyXPC::ServerPowerObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x270F978E0](a1 + 8);
}

void __clang_call_terminate(void *a1)
{
}

void *ctu::SharedSynchronizable<TelephonyXPC::ServerPowerObserver>::~SharedSynchronizable(void *a1)
{
  uint64_t v2 = a1[3];
  if (v2) {
    dispatch_release(v2);
  }
  long long v3 = a1[2];
  if (v3) {
    dispatch_release(v3);
  }
  v4 = (std::__shared_weak_count *)a1[1];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void *ctu::Loggable<TelephonyXPC::ServerPowerObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CEE45E8;
  MEMORY[0x223C1F210](a1 + 1);
  return a1;
}

void ctu::Loggable<TelephonyXPC::ServerPowerObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CEE45E8;
  MEMORY[0x223C1F210](a1 + 1);
  operator delete(a1);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  char v5 = this;
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
    char v5 = v8;
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

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264490B38, MEMORY[0x263F8C060]);
}

void sub_21E06B734(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void ctu::power::manager::parameters::~parameters(void **this)
{
  if (*((char *)this + 55) < 0) {
    operator delete(this[4]);
  }
  uint64_t v2 = this[3];
  if (v2) {
    _Block_release(v2);
  }
  long long v3 = this[2];
  if (v3) {
    _Block_release(v3);
  }
  v4 = this[1];
  if (v4) {
    dispatch_release(v4);
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

uint64_t *std::shared_ptr<TelephonyXPC::ServerPowerObserver>::shared_ptr[abi:ne180100]<TelephonyXPC::ServerPowerObserver,void>(uint64_t *a1, uint64_t a2)
{
  *a1 = a2;
  v4 = operator new(0x20uLL);
  void *v4 = &unk_26CEE4628;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = (uint64_t)v4;
  if (a2) {
    char v5 = (void *)(a2 + 72);
  }
  else {
    char v5 = 0;
  }
  std::shared_ptr<TelephonyXPC::ServerPowerObserver>::__enable_weak_this[abi:ne180100]<TelephonyXPC::ServerPowerObserver,TelephonyXPC::ServerPowerObserver,void>((uint64_t)a1, v5, a2);
  return a1;
}

void sub_21E06B8C0(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::shared_ptr<TelephonyXPC::ServerPowerObserver>::__enable_weak_this[abi:ne180100]<TelephonyXPC::ServerPowerObserver,TelephonyXPC::ServerPowerObserver,void>(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    v4 = (std::__shared_weak_count *)a2[1];
    if (!v4 || v4->__shared_owners_ == -1)
    {
      char v5 = *(std::__shared_weak_count **)(a1 + 8);
      if (v5)
      {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
        atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        v4 = (std::__shared_weak_count *)a2[1];
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

void std::__shared_ptr_pointer<TelephonyXPC::ServerPowerObserver *,std::shared_ptr<TelephonyXPC::ServerPowerObserver>::__shared_ptr_default_delete<TelephonyXPC::ServerPowerObserver,TelephonyXPC::ServerPowerObserver>,std::allocator<TelephonyXPC::ServerPowerObserver>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::ServerPowerObserver *,std::shared_ptr<TelephonyXPC::ServerPowerObserver>::__shared_ptr_default_delete<TelephonyXPC::ServerPowerObserver,TelephonyXPC::ServerPowerObserver>,std::allocator<TelephonyXPC::ServerPowerObserver>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::ServerPowerObserver *,std::shared_ptr<TelephonyXPC::ServerPowerObserver>::__shared_ptr_default_delete<TelephonyXPC::ServerPowerObserver,TelephonyXPC::ServerPowerObserver>,std::allocator<TelephonyXPC::ServerPowerObserver>>::__get_deleter(uint64_t a1, uint64_t a2)
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

void *ctu::SharedSynchronizable<TelephonyXPC::ServerPowerObserver>::SharedSynchronizable(void *a1, uint64_t a2, dispatch_queue_attr_t attr, dispatch_object_t *a4)
{
  if (*(char *)(a2 + 23) >= 0) {
    std::string::size_type v6 = (const char *)a2;
  }
  else {
    std::string::size_type v6 = *(const char **)a2;
  }
  std::string::size_type v7 = *a4;
  if (*a4)
  {
    dispatch_retain(*a4);
    dispatch_retain(v7);
    uint64_t v8 = dispatch_queue_create_with_target_V2(v6, attr, v7);
  }
  else
  {
    uint64_t v8 = dispatch_queue_create(v6, attr);
  }
  uint64_t v9 = v8;
  *a1 = 0;
  a1[1] = 0;
  a1[2] = v8;
  if (v8) {
    dispatch_retain(v8);
  }
  a1[3] = v7;
  if (v7) {
    dispatch_retain(v7);
  }
  if (v9) {
    dispatch_release(v9);
  }
  if (v7)
  {
    dispatch_release(v7);
    dispatch_release(v7);
  }
  return a1;
}

void ctu::SharedLoggable<TelephonyXPC::ServerPowerObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CEE45E8;
  uint64_t v2 = a1 + 9;
  MEMORY[0x223C1F210](a1 + 1);
  ctu::SharedSynchronizable<TelephonyXPC::ServerPowerObserver>::~SharedSynchronizable(v2);
  operator delete(a1);
}

void *ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::LoggerBase(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = (void *)ctu::LoggerCommonBase::LoggerCommonBase();
  void *result = &unk_26CEE46E0;
  uint64_t v5 = a3[1];
  result[6] = *a3;
  result[7] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C2D8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C198], MEMORY[0x263F8C0A0]);
}

void *___ZNK3ctu20SharedSynchronizableIN12TelephonyXPC19ServerPowerObserverEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

void ___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC19ServerPowerObserver10PowerEventENS2_10PowerStateENS_13group_sessionEEEclIJS3_S4_S5_EEEvDpT__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 48);
  uint64_t v2 = *(unsigned int *)(a1 + 52);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(NSObject **)(a1 + 40);
  dispatch_group_t group = v4;
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_group_enter(v4);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, dispatch_group_t *))(v3 + 16))(v3, v1, v2, &group);
  if (group)
  {
    dispatch_group_leave(group);
    if (group) {
      dispatch_release(group);
    }
  }
}

void sub_21E06BD30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_group_t group)
{
  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_e8_32c127_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC19ServerPowerObserver10PowerEventENS2_10PowerStateENS_13group_sessionEEEE40c30_ZTSN8dispatch13group_sessionE(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a2 + 32);
  if (v4) {
    v4 = _Block_copy(v4);
  }
  uint64_t v5 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  if (v5)
  {
    dispatch_retain(v5);
    std::string::size_type v6 = *(NSObject **)(a1 + 40);
    if (v6)
    {
      dispatch_group_enter(v6);
    }
  }
}

void __destroy_helper_block_e8_32c127_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC19ServerPowerObserver10PowerEventENS2_10PowerStateENS_13group_sessionEEEE40c30_ZTSN8dispatch13group_sessionE(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 40);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *(NSObject **)(a1 + 40);
    if (v3) {
      dispatch_release(v3);
    }
  }
  v4 = *(const void **)(a1 + 32);
  if (v4) {
    _Block_release(v4);
  }
}

void TelephonyXPC::Server::State::~State(TelephonyXPC::Server::State *this)
{
  *(void *)this = &unk_26CEE4750;
  *((void *)this + 9) = &unk_26CEE4788;
  uint64_t v2 = *((void *)this + 36);
  if (v2)
  {
    dispatch_source_cancel(v2);
    dispatch_release(*((dispatch_object_t *)this + 36));
    *((void *)this + 36) = 0;
  }
  std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(*((void **)this + 41));
  std::__tree<std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>,std::__map_value_compare<xpc::connection,std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>,std::less<xpc::connection>,true>,std::allocator<std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>>>::destroy(*((void **)this + 38));
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 35);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  v4 = (std::__shared_weak_count *)*((void *)this + 33);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  uint64_t v5 = *((void *)this + 31);
  if (v5) {
    dispatch_release(v5);
  }
  std::string::size_type v6 = (const void *)*((void *)this + 30);
  if (v6) {
    _Block_release(v6);
  }
  xpc_release(*((xpc_object_t *)this + 27));
  *((void *)this + 27) = 0;
  if (*((char *)this + 215) < 0) {
    operator delete(*((void **)this + 24));
  }
  if (*((char *)this + 191) < 0) {
    operator delete(*((void **)this + 21));
  }
  if (*((char *)this + 167) < 0) {
    operator delete(*((void **)this + 18));
  }
  *((void *)this + 9) = &unk_26CEE4848;
  MEMORY[0x223C1F210]((char *)this + 80);
  ctu::XpcServer::~XpcServer(this);
}

{
  void *v1;
  uint64_t vars8;

  TelephonyXPC::Server::State::~State(this);
  operator delete(v1);
}

uint64_t dispatch::callback<void({block_pointer})(TelephonyXPC::Server::ServerStatus)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

void TelephonyXPC::Server::State::Parameters::~Parameters(xpc_object_t *this)
{
  this[9] = 0;
  if (*((char *)this + 71) < 0) {
    operator delete(this[6]);
  }
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

void non-virtual thunk to'TelephonyXPC::Server::State::~State(TelephonyXPC::Server::State *this)
{
}

{
  void *v1;
  uint64_t vars8;

  TelephonyXPC::Server::State::~State((TelephonyXPC::Server::State *)((char *)this - 72));
  operator delete(v1);
}

void *TelephonyXPC::Server::Server(void *result, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  void *result = &unk_26CEE47C8;
  result[1] = v3;
  result[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

{
  uint64_t v2;
  uint64_t v3;

  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  void *result = &unk_26CEE47C8;
  result[1] = v3;
  result[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void TelephonyXPC::Server::~Server(TelephonyXPC::Server *this)
{
  *(void *)this = &unk_26CEE47C8;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;

  *(void *)this = &unk_26CEE47C8;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v2;
  uint64_t vars8;

  *(void *)this = &unk_26CEE47C8;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  operator delete(this);
}

void TelephonyXPC::Server::create(xpc_object_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  xpc_object_t v7 = *a1;
  if (*a1) {
    xpc_retain(*a1);
  }
  else {
    xpc_object_t v7 = xpc_null_create();
  }
  uint64_t v9 = *a2;
  uint64_t v8 = (std::__shared_weak_count *)a2[1];
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = *(void **)a3;
  if (*(void *)a3) {
    uint64_t v10 = _Block_copy(v10);
  }
  uint64_t v11 = *(NSObject **)(a3 + 8);
  aBlock = v10;
  v47 = v11;
  if (v11) {
    dispatch_retain(v11);
  }
  if (MEMORY[0x223C1F7A0](v7) != MEMORY[0x263EF8708])
  {
    uint64_t v12 = 0;
LABEL_12:
    syslog(3, "Could not create TelephonyXPCServer, verify parameters\n", v44, v45);
    uint64_t v13 = 0;
    goto LABEL_108;
  }
  unint64_t v58 = 0xAAAAAAAAAAAAAAAALL;
  xpc_object_t xarray = xpc_null_create();
  xpc::dict::object_proxy::operator xpc::object(block, v7, "ServiceXPCName");
  xpc::dyn_cast_or_default();
  std::string v54 = object;
  *((unsigned char *)&object.__r_.__value_.__s + 23) = 0;
  object.__r_.__value_.__s.__data_[0] = 0;
  xpc_release(block[0]);
  xpc::dict::object_proxy::operator xpc::object(block, v7, "ServiceNotificationName");
  xpc::dyn_cast_or_default();
  std::string v55 = object;
  *((unsigned char *)&object.__r_.__value_.__s + 23) = 0;
  object.__r_.__value_.__s.__data_[0] = 0;
  xpc_release(block[0]);
  xpc::dict::object_proxy::operator xpc::object(block, v7, "ServerHostName");
  xpc::dyn_cast_or_default();
  std::string v56 = object;
  *((unsigned char *)&object.__r_.__value_.__s + 23) = 0;
  object.__r_.__value_.__s.__data_[0] = 0;
  xpc_release(block[0]);
  xpc::dict::object_proxy::operator xpc::object(&object, v7, "ServerEnablePowerObserver");
  LOBYTE(v58) = xpc::dyn_cast_or_default();
  xpc_release(object.__r_.__value_.__l.__data_);
  xpc::dict::object_proxy::operator xpc::object(&object, v7, "ServerEnableSignalHandler");
  BYTE1(v58) = xpc::dyn_cast_or_default();
  xpc_release(object.__r_.__value_.__l.__data_);
  xpc_object_t value = xpc_dictionary_get_value(v7, "ServiceXPCEntitlements");
  xpc_object_t v15 = value;
  uint64_t v16 = MEMORY[0x263EF86D8];
  if (value)
  {
    xpc_retain(value);
  }
  else
  {
    xpc_object_t v15 = xpc_null_create();
    if (!v15)
    {
      xpc_object_t v17 = xpc_null_create();
      xpc_object_t v15 = 0;
      goto LABEL_20;
    }
  }
  if (MEMORY[0x223C1F7A0](v15) == v16)
  {
    xpc_retain(v15);
    xpc_object_t v17 = v15;
  }
  else
  {
    xpc_object_t v17 = xpc_null_create();
  }
LABEL_20:
  xpc_release(v15);
  xpc_object_t v18 = xpc_null_create();
  xpc_object_t v19 = xarray;
  xpc_object_t xarray = v17;
  xpc_release(v19);
  xpc_release(v18);
  if (MEMORY[0x223C1F7A0](v17) == v16) {
    goto LABEL_48;
  }
  xpc_object_t v20 = xpc_array_create(0, 0);
  if (v20 || (xpc_object_t v20 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x223C1F7A0](v20) == v16)
    {
      xpc_retain(v20);
      xpc_object_t v21 = v20;
    }
    else
    {
      xpc_object_t v21 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v21 = xpc_null_create();
    xpc_object_t v20 = 0;
  }
  xpc_release(v20);
  xpc_object_t v22 = xpc_null_create();
  xpc_object_t v23 = xarray;
  xpc_object_t xarray = v21;
  xpc_release(v23);
  xpc_release(v22);
  int v24 = SHIBYTE(v54.__r_.__value_.__r.__words[2]);
  if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t size = HIBYTE(v54.__r_.__value_.__r.__words[2]);
  }
  else {
    size_t size = v54.__r_.__value_.__l.__size_;
  }
  unint64_t v26 = size + 6;
  memset(&object, 170, sizeof(object));
  if (size + 6 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v26 >= 0x17)
  {
    uint64_t v28 = (v26 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v26 | 7) != 0x17) {
      uint64_t v28 = v26 | 7;
    }
    uint64_t v29 = v28 + 1;
    p_std::string object = (std::string *)operator new(v28 + 1);
    object.__r_.__value_.__l.__size_ = size + 6;
    object.__r_.__value_.__r.__words[2] = v29 | 0x8000000000000000;
    object.__r_.__value_.__r.__words[0] = (std::string::size_type)p_object;
    goto LABEL_37;
  }
  memset(&object, 0, sizeof(object));
  p_std::string object = &object;
  *((unsigned char *)&object.__r_.__value_.__s + 23) = size + 6;
  if (size)
  {
LABEL_37:
    if (v24 >= 0) {
      uint64_t v30 = &v54;
    }
    else {
      uint64_t v30 = (std::string *)v54.__r_.__value_.__r.__words[0];
    }
    memmove(p_object, v30, size);
  }
  strcpy((char *)p_object + size, ".allow");
  if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v31 = &object;
  }
  else {
    v31 = (std::string *)object.__r_.__value_.__r.__words[0];
  }
  xpc_object_t v32 = xpc_string_create((const char *)v31);
  if (!v32) {
    xpc_object_t v32 = xpc_null_create();
  }
  xpc_array_append_value(xarray, v32);
  xpc_release(v32);
  if (SHIBYTE(object.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(object.__r_.__value_.__l.__data_);
  }
LABEL_48:
  std::string::size_type v33 = HIBYTE(v54.__r_.__value_.__r.__words[2]);
  int v34 = SHIBYTE(v54.__r_.__value_.__r.__words[2]);
  if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v33 = v54.__r_.__value_.__l.__size_;
  }
  if (!v33) {
    goto LABEL_58;
  }
  std::string::size_type v35 = HIBYTE(v55.__r_.__value_.__r.__words[2]);
  if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v35 = v55.__r_.__value_.__l.__size_;
  }
  if (!v35)
  {
LABEL_58:
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    goto LABEL_100;
  }
  uint64_t v13 = (char *)operator new(0x158uLL);
  TelephonyXPC::Server::State::Parameters::Parameters(&object, (const TelephonyXPC::Server::State::Parameters *)&v54);
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (aBlock) {
    v36 = _Block_copy(aBlock);
  }
  else {
    v36 = 0;
  }
  if (v47) {
    dispatch_retain(v47);
  }
  std::string::basic_string[abi:ne180100]<0>(block, "Server");
  if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v37 = &object;
  }
  else {
    v37 = (std::string *)object.__r_.__value_.__r.__words[0];
  }
  xpc_object_t mach_service = xpc_connection_create_mach_service((const char *)v37, 0, 1uLL);
  if (!mach_service) {
    xpc_object_t mach_service = xpc_null_create();
  }
  v61[0] = 0;
  ctu::XpcServer::XpcServer();
  if (v61[0]) {
    dispatch_release(v61[0]);
  }
  xpc_release(mach_service);
  xpc_object_t mach_service = 0;
  if (SHIBYTE(v63) < 0) {
    operator delete(block[0]);
  }
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v59, "com.apple.telephony.xpc", "server");
  v45 = &unk_26CEE4848;
  *((void *)v13 + 9) = &unk_26CEE4848;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)block);
  *((void *)v13 + 10) = &unk_26CEE46E0;
  *((void *)v13 + 16) = v9;
  *((void *)v13 + 17) = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v61);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v59);
  *(void *)uint64_t v13 = &unk_26CEE4750;
  *((void *)v13 + 9) = &unk_26CEE4788;
  TelephonyXPC::Server::State::Parameters::Parameters((std::string *)v13 + 6, (const TelephonyXPC::Server::State::Parameters *)&object);
  *((_DWORD *)v13 + 58) = 0;
  if (v36) {
    v38 = _Block_copy(v36);
  }
  else {
    v38 = 0;
  }
  *((void *)v13 + 30) = v38;
  *((void *)v13 + 31) = v47;
  if (v47) {
    dispatch_retain(v47);
  }
  v44 = v13 + 240;
  *((void *)v13 + 32) = v9;
  *((void *)v13 + 33) = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  *((void *)v13 + 38) = 0;
  *((void *)v13 + 39) = 0;
  *((void *)v13 + 34) = 0;
  *((void *)v13 + 35) = 0;
  *((void *)v13 + 36) = 0;
  *((void *)v13 + 37) = v13 + 304;
  *((void *)v13 + 41) = 0;
  *((void *)v13 + 42) = 0;
  *((void *)v13 + 40) = v13 + 328;
  ctu::LoggerCommonBase::setLogLevel();
  uint64_t v12 = (std::__shared_weak_count *)operator new(0x20uLL);
  v12->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CEE4888;
  v12->__shared_owners_ = 0;
  v12->__shared_weak_owners_ = 0;
  v12[1].__vftable = (std::__shared_weak_count_vtbl *)v13;
  v39 = (std::__shared_weak_count *)*((void *)v13 + 2);
  if (!v39)
  {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((void *)v13 + 1) = v13;
    *((void *)v13 + 2) = v12;
    goto LABEL_84;
  }
  if (v39->__shared_owners_ == -1)
  {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((void *)v13 + 1) = v13;
    *((void *)v13 + 2) = v12;
    std::__shared_weak_count::__release_weak(v39);
LABEL_84:
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (v47) {
    dispatch_release(v47);
  }
  if (v36) {
    _Block_release(v36);
  }
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  xpc_release(v53);
  xpc_object_t v53 = 0;
  if (v52 < 0) {
    operator delete(__p);
  }
  if (v50 < 0) {
    operator delete(v49);
  }
  if (SHIBYTE(object.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(object.__r_.__value_.__l.__data_);
  }
  v61[0] = (dispatch_object_t)MEMORY[0x263EF8330];
  v61[1] = (dispatch_object_t)0x40000000;
  v61[2] = (dispatch_object_t)___ZN12TelephonyXPC6Server5State4initEv_block_invoke;
  v61[3] = (dispatch_object_t)&__block_descriptor_tmp_30;
  v59[0] = v61;
  v61[4] = (dispatch_object_t)v13;
  block[0] = (void *)MEMORY[0x263EF8330];
  block[1] = (void *)0x40000000;
  v63 = ___ZNK3ctu20SharedSynchronizableINS_9XpcServerEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  v64 = &__block_descriptor_tmp_31;
  v65 = v13 + 8;
  v66 = v59;
  v40 = *((void *)v13 + 3);
  if (*((void *)v13 + 4)) {
    dispatch_async_and_wait(v40, block);
  }
  else {
    dispatch_sync(v40, block);
  }
LABEL_100:
  xpc_release(xarray);
  if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v56.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v55.__r_.__value_.__l.__data_);
    if ((v34 & 0x80000000) == 0)
    {
LABEL_104:
      if (!v13) {
        goto LABEL_12;
      }
      goto LABEL_108;
    }
  }
  else if ((v34 & 0x80000000) == 0)
  {
    goto LABEL_104;
  }
  operator delete(v54.__r_.__value_.__l.__data_);
  if (!v13) {
    goto LABEL_12;
  }
LABEL_108:
  if (v47) {
    dispatch_release(v47);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  xpc_release(v7);
  v41 = operator new(0x18uLL);
  v42 = v41;
  if (v12)
  {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    void *v41 = &unk_26CEE47C8;
    v41[1] = v13;
    v41[2] = v12;
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    void *v41 = &unk_26CEE47C8;
    v41[1] = v13;
    v41[2] = 0;
  }
  *a4 = v41;
  v43 = operator new(0x20uLL);
  void *v43 = &unk_26CEE4C00;
  v43[1] = 0;
  v43[2] = 0;
  v43[3] = v42;
  a4[1] = v43;
  if (v12)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
}

void sub_21E06CB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, char a14, uint64_t a15, xpc_object_t object, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,xpc_object_t a30)
{
  (*(void (**)(uint64_t))(*(void *)v32 + 32))(v32);
  dispatch::callback<void({block_pointer})(TelephonyXPC::Server::ServerStatus)>::~callback((uint64_t)&a14);
  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
  }
  TelephonyXPC::Server::State::Parameters::~Parameters(&object);
  TelephonyXPC::Server::State::Parameters::~Parameters(&a30);
  dispatch::callback<void({block_pointer})(TelephonyXPC::Server::ServerStatus)>::~callback((uint64_t)&a12);
  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
  }
  xpc_release(v30);
  _Unwind_Resume(a1);
}

void sub_21E06CE08()
{
}

void xpc::dict::~dict(xpc_object_t *this)
{
  *this = 0;
}

uint64_t TelephonyXPC::Server::start(TelephonyXPC::Server *this)
{
  uint64_t v1 = *((void *)this + 1);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = ___ZN12TelephonyXPC6Server5State5startEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_38;
  v4[4] = v1;
  uint64_t v5 = v4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcServerEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_31;
  block[4] = v1 + 8;
  block[5] = &v5;
  uint64_t v2 = *(NSObject **)(v1 + 24);
  if (*(void *)(v1 + 32)) {
    dispatch_async_and_wait(v2, block);
  }
  else {
    dispatch_sync(v2, block);
  }
  return *(unsigned int *)(v1 + 232);
}

void TelephonyXPC::Server::broadcastEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 8);
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v8 = *(std::string *)a2;
  }
  if (*(void *)a3) {
    uint64_t v5 = _Block_copy(*(const void **)a3);
  }
  else {
    uint64_t v5 = 0;
  }
  std::string::size_type v6 = *(NSObject **)(a3 + 8);
  v7[0] = v5;
  v7[1] = v6;
  if (v6) {
    dispatch_retain(v6);
  }
  TelephonyXPC::Server::State::broadcast(v4, (uint64_t)&v8, (uint64_t)v7);
  if (v6) {
    dispatch_release(v6);
  }
  if (v5) {
    _Block_release(v5);
  }
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
}

void sub_21E06CFEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void TelephonyXPC::Server::State::broadcast(void *a1, uint64_t a2, uint64_t a3)
{
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v9 = *(std::string *)a2;
  }
  xpc_object_t v5 = xpc_null_create();
  if (*(void *)a3) {
    std::string::size_type v6 = _Block_copy(*(const void **)a3);
  }
  else {
    std::string::size_type v6 = 0;
  }
  xpc_object_t v7 = *(NSObject **)(a3 + 8);
  v8[0] = v6;
  v8[1] = v7;
  if (v7) {
    dispatch_retain(v7);
  }
  TelephonyXPC::Server::State::broadcast(a1, (uint64_t)&v9, v5, (uint64_t)v8);
  if (v7) {
    dispatch_release(v7);
  }
  if (v6) {
    _Block_release(v6);
  }
  xpc_release(v5);
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
}

void sub_21E06D0F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  dispatch::callback<void({block_pointer})(void)>::~callback((uint64_t)&a9);
  xpc_release(v16);
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t dispatch::callback<void({block_pointer})(void)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

void TelephonyXPC::Server::broadcastEvent(uint64_t a1, uint64_t a2, xpc_object_t *a3, uint64_t a4)
{
  std::string::size_type v6 = *(void **)(a1 + 8);
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v11 = *(std::string *)a2;
  }
  xpc_object_t v7 = *a3;
  if (v7) {
    xpc_retain(v7);
  }
  else {
    xpc_object_t v7 = xpc_null_create();
  }
  if (*(void *)a4) {
    std::string v8 = _Block_copy(*(const void **)a4);
  }
  else {
    std::string v8 = 0;
  }
  std::string v9 = *(NSObject **)(a4 + 8);
  v10[0] = v8;
  v10[1] = v9;
  if (v9) {
    dispatch_retain(v9);
  }
  TelephonyXPC::Server::State::broadcast(v6, (uint64_t)&v11, v7, (uint64_t)v10);
  if (v9) {
    dispatch_release(v9);
  }
  if (v8) {
    _Block_release(v8);
  }
  xpc_release(v7);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v11.__r_.__value_.__l.__data_);
  }
}

void sub_21E06D264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  dispatch::callback<void({block_pointer})(void)>::~callback((uint64_t)&a9);
  xpc_release(v16);
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void TelephonyXPC::Server::State::broadcast(void *a1, uint64_t a2, xpc_object_t object, uint64_t a4)
{
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1174405120;
  v14[2] = ___ZN12TelephonyXPC6Server5State9broadcastENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN3xpc4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke;
  v14[3] = &__block_descriptor_tmp_48;
  v14[4] = a1;
  xpc_object_t v15 = object;
  if (object) {
    xpc_retain(object);
  }
  else {
    xpc_object_t v15 = xpc_null_create();
  }
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  xpc_object_t v7 = *(void **)a4;
  if (*(void *)a4) {
    xpc_object_t v7 = _Block_copy(v7);
  }
  std::string v8 = *(NSObject **)(a4 + 8);
  aBlock = v7;
  dispatch_object_t objecta = v8;
  if (v8) {
    dispatch_retain(v8);
  }
  std::string v9 = (std::__shared_weak_count *)a1[2];
  if (!v9 || (v10 = a1[1], (std::string v11 = std::__shared_weak_count::lock(v9)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v12 = v11;
  uint64_t v13 = a1[3];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcServerEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &__block_descriptor_tmp_49;
  block[5] = v10;
  xpc_object_t v20 = v12;
  atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  block[4] = v14;
  dispatch_async(v13, block);
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  if (objecta) {
    dispatch_release(objecta);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  xpc_release(v15);
}

void sub_21E06D448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object)
{
}

uint64_t TelephonyXPC::Server::setCommandHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v10 = *(std::string *)a2;
  }
  if (*(void *)a3) {
    xpc_object_t v5 = _Block_copy(*(const void **)a3);
  }
  else {
    xpc_object_t v5 = 0;
  }
  std::string::size_type v6 = *(NSObject **)(a3 + 8);
  if (v6) {
    dispatch_retain(v6);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1174405120;
  v11[2] = ___ZN12TelephonyXPC6Server5State17setCommandHandlerENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS_17ServerClientStateEN3xpc4dictENSA_IU13block_pointerFviSD_EEEEEE_block_invoke;
  v11[3] = &__block_descriptor_tmp_52;
  v11[4] = v4;
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v10.__r_.__value_.__l.__data_, v10.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v10;
  }
  if (v5) {
    xpc_object_t v7 = _Block_copy(v5);
  }
  else {
    xpc_object_t v7 = 0;
  }
  aBlock = v7;
  dispatch_object_t object = v6;
  if (v6) {
    dispatch_retain(v6);
  }
  xpc_object_t v15 = v11;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcServerEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_31;
  block[4] = v4 + 8;
  block[5] = &v15;
  std::string v8 = *(NSObject **)(v4 + 24);
  if (*(void *)(v4 + 32)) {
    dispatch_async_and_wait(v8, block);
  }
  else {
    dispatch_sync(v8, block);
  }
  if (object) {
    dispatch_release(object);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v6) {
    dispatch_release(v6);
  }
  if (v5) {
    _Block_release(v5);
  }
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
  return 0;
}

void sub_21E06D658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

void *TelephonyXPC::Server::statusToString@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  if (a1 > 3) {
    uint64_t v2 = "Unknown";
  }
  else {
    uint64_t v2 = (&off_264490CE0)[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

const char *TelephonyXPC::Server::asString(unsigned int a1)
{
  if (a1 > 3) {
    return "Unknown";
  }
  else {
    return (&off_264490CE0)[a1];
  }
}

void TelephonyXPC::Server::State::handleServerError_sync(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(NSObject **)(a1 + 112);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    xpc_object_t v5 = (char *)MEMORY[0x223C1F740](*a2);
    memset(__p, 170, 24);
    std::string::basic_string[abi:ne180100]<0>(__p, v5);
    free(v5);
    std::string::size_type v6 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v6;
    _os_log_impl(&dword_21E069000, v4, OS_LOG_TYPE_DEFAULT, "#I Server error: %s", buf, 0xCu);
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
  }
  if ((**(unsigned int (***)(uint64_t, uint64_t))(a1 + 80))(a1 + 80, 40))
  {
    xpc_object_t v7 = (char *)MEMORY[0x223C1F740](*a2);
    memset(buf, 170, sizeof(buf));
    std::string::basic_string[abi:ne180100]<0>(buf, v7);
    free(v7);
    std::string v9 = (buf[23] & 0x80u) == 0 ? buf : *(uint8_t **)buf;
    ctu::LogMessageBuffer::createWithFormat((uint64_t *)__p, (ctu::LogMessageBuffer *)"Server error: %s", v8, v9);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x223C1F270](__p);
    if ((char)buf[23] < 0) {
      operator delete(*(void **)buf);
    }
  }
  *(_DWORD *)(a1 + 232) = 3;
  std::string v10 = *(const void **)(a1 + 240);
  if (v10) {
    std::string v11 = _Block_copy(v10);
  }
  else {
    std::string v11 = 0;
  }
  uint64_t v12 = *(NSObject **)(a1 + 248);
  __p[0] = (void *)MEMORY[0x263EF8330];
  __p[1] = (void *)1174405120;
  __p[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC6Server12ServerStatusEEEclIJS3_EEEvDpT__block_invoke;
  __p[3] = &__block_descriptor_tmp_37;
  if (v11) {
    uint64_t v13 = _Block_copy(v11);
  }
  else {
    uint64_t v13 = 0;
  }
  aBlock = v13;
  int v18 = 3;
  dispatch_async(v12, __p);
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v11) {
    _Block_release(v11);
  }
  std::string::basic_string[abi:ne180100]<0>(v14, "ServerStateError");
  TelephonyXPC::Server::State::broadcastServerState((void *)a1, (const char *)v14);
  if (v15 < 0) {
    operator delete(v14[0]);
  }
}

void TelephonyXPC::Server::State::handleNewClient_sync(uint64_t a1@<X0>, xpc_object_t *a2@<X1>, void **a3@<X8>)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  v49[0] = 0;
  v49[1] = 0;
  v48 = v49;
  std::string::size_type v6 = (_xpc_connection_s *)*a2;
  if (*a2) {
    xpc_retain(*a2);
  }
  else {
    std::string::size_type v6 = (_xpc_connection_s *)xpc_null_create();
  }
  if (MEMORY[0x223C1F7A0](v6) != MEMORY[0x263EF86F0]) {
    goto LABEL_5;
  }
  pid_t pid = xpc_connection_get_pid(v6);
  if (getpid() == pid) {
    goto LABEL_41;
  }
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v12;
  long long v58 = v12;
  xpc_connection_get_audit_token();
  uint64_t v13 = (void *)xpc_copy_entitlement_for_token();
  uint64_t v14 = MEMORY[0x263EF8708];
  if (v13 || (uint64_t v13 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x223C1F7A0](v13) == v14)
    {
      xpc_retain(v13);
      xpc_object_t v15 = v13;
    }
    else
    {
      xpc_object_t v15 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v15 = xpc_null_create();
    uint64_t v13 = 0;
  }
  xpc_release(v13);
  if (MEMORY[0x223C1F7A0](v15) == v14)
  {
    xpc_object_t v18 = *(xpc_object_t *)(a1 + 216);
    if (v18) {
      xpc_retain(*(xpc_object_t *)(a1 + 216));
    }
    else {
      xpc_object_t v18 = xpc_null_create();
    }
    xpc::array::iterator::iterator(&object, v18, 0);
    xpc_release(v18);
    xpc_object_t v19 = *(xpc_object_t *)(a1 + 216);
    if (v19) {
      xpc_retain(*(xpc_object_t *)(a1 + 216));
    }
    else {
      xpc_object_t v19 = xpc_null_create();
    }
    uint64_t v20 = MEMORY[0x223C1F7A0](*(void *)(a1 + 216)) == MEMORY[0x263EF86D8]
        ? (void *)xpc_array_get_count(*(xpc_object_t *)(a1 + 216))
        : 0;
    xpc::array::iterator::iterator(&v51, v19, v20);
    xpc_release(v19);
    xpc_object_t v21 = object;
    size_t v22 = index;
    if (index == v52 && object == v51)
    {
      char v17 = 0;
    }
    else
    {
      char v17 = 0;
      do
      {
        memset(v50, 170, sizeof(v50));
        xpc_object_t value = xpc_array_get_value(v21, v22);
        __p[0] = value;
        if (value) {
          xpc_retain(value);
        }
        else {
          __p[0] = xpc_null_create();
        }
        xpc::dyn_cast_or_default();
        xpc_release(__p[0]);
        v37 = (void *)HIBYTE(v50[2]);
        int v38 = SHIBYTE(v50[2]);
        if (SHIBYTE(v50[2]) < 0) {
          v37 = v50[1];
        }
        if (v37)
        {
          v39 = *(NSObject **)(a1 + 112);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            v44 = (void **)v50[0];
            if (v38 >= 0) {
              v44 = v50;
            }
            LODWORD(__p[0]) = 136315138;
            *(void **)((char *)__p + 4) = v44;
            _os_log_debug_impl(&dword_21E069000, v39, OS_LOG_TYPE_DEBUG, "#D Searching for entitlement: %s", (uint8_t *)__p, 0xCu);
          }
          if ((**(unsigned int (***)(uint64_t, uint64_t))(a1 + 80))(a1 + 80, 20))
          {
            v41 = v50;
            if (SHIBYTE(v50[2]) < 0) {
              v41 = (void **)v50[0];
            }
            ctu::LogMessageBuffer::createWithFormat((uint64_t *)__p, (ctu::LogMessageBuffer *)"Searching for entitlement: %s", v40, v41);
            ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
            MEMORY[0x223C1F270](__p);
          }
          __p[0] = (void *)0xAAAAAAAAAAAAAAAALL;
          if (SHIBYTE(v50[2]) >= 0) {
            v42 = (char *)v50;
          }
          else {
            v42 = (char *)v50[0];
          }
          xpc::dict::object_proxy::operator xpc::object(__p, v15, v42);
          if (MEMORY[0x223C1F7A0](__p[0]) != MEMORY[0x263EF8758])
          {
            uint64_t v43 = MEMORY[0x223C1F7A0](__p[0]);
            if (v43 == MEMORY[0x263EF86E0])
            {
              char v17 = xpc::dyn_cast_or_default();
              std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t **)&v48, v50, (uint64_t)v50);
            }
            else if (v43 == MEMORY[0x263EF86D8])
            {
              std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t **)&v48, v50, (uint64_t)v50);
              char v17 = 1;
            }
          }
          xpc_release(__p[0]);
          LOBYTE(v38) = HIBYTE(v50[2]);
        }
        if ((v38 & 0x80) != 0) {
          operator delete(v50[0]);
        }
        xpc_object_t v21 = object;
        size_t v22 = index + 1;
        size_t index = v22;
      }
      while (v22 != v52 || object != v51);
    }
    xpc_release(v21);
    xpc_release(object);
  }
  else
  {
    char v17 = 0;
  }
  xpc_release(v15);
  if (v17)
  {
LABEL_41:
    char v10 = 1;
  }
  else
  {
LABEL_5:
    xpc_object_t v7 = *(NSObject **)(a1 + 112);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      xpc::connection::to_debug_string((xpc::connection *)__p, (uint64_t)v6);
      uint64_t v16 = v56 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v16;
      _os_log_error_impl(&dword_21E069000, v7, OS_LOG_TYPE_ERROR, "Connection not allowed:\n %s", buf, 0xCu);
      if (v56 < 0) {
        operator delete(__p[0]);
      }
    }
    if ((**(unsigned int (***)(uint64_t, uint64_t))(a1 + 80))(a1 + 80, 80))
    {
      xpc::connection::to_debug_string((xpc::connection *)buf, (uint64_t)v6);
      std::string v9 = (SBYTE7(v58) & 0x80u) == 0 ? buf : *(uint8_t **)buf;
      ctu::LogMessageBuffer::createWithFormat((uint64_t *)__p, (ctu::LogMessageBuffer *)"Connection not allowed:\n %s", v8, v9);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x223C1F270](__p);
      if (SBYTE7(v58) < 0) {
        operator delete(*(void **)buf);
      }
    }
    char v10 = 0;
  }
  xpc_release(v6);
  if (v10)
  {
    memset(buf, 170, sizeof(buf));
    xpc::connection::to_debug_string((xpc::connection *)__p, (uint64_t)*a2);
    TelephonyXPC::ServerClientState::ServerClientState(buf, (long long *)__p);
    if (v56 < 0) {
      operator delete(__p[0]);
    }
    std::set<std::string>::set[abi:ne180100](v47, (uint64_t)&v48);
    TelephonyXPC::ServerClientState::setClientEntitlements((uint64_t *)buf, (uint64_t)v47);
    std::__tree<std::string>::destroy((uint64_t)v47, (char *)v47[1]);
    xpc_object_t v23 = *(NSObject **)(a1 + 112);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      xpc_object_t v45 = *a2;
      LODWORD(__p[0]) = 134217984;
      *(void **)((char *)__p + 4) = v45;
      _os_log_debug_impl(&dword_21E069000, v23, OS_LOG_TYPE_DEBUG, "#D New client %p", (uint8_t *)__p, 0xCu);
    }
    if ((**(unsigned int (***)(uint64_t, uint64_t))(a1 + 80))(a1 + 80, 20))
    {
      ctu::LogMessageBuffer::createWithFormat((uint64_t *)__p, (ctu::LogMessageBuffer *)"New client %p", v24, *a2);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x223C1F270](__p);
    }
    xpc_object_t v25 = *a2;
    unint64_t v26 = *(uint64_t **)(a1 + 304);
    if (v26)
    {
      while (1)
      {
        while (1)
        {
          long long v27 = (uint64_t **)v26;
          unint64_t v28 = v26[4];
          if (v28 <= (unint64_t)v25) {
            break;
          }
          unint64_t v26 = *v27;
          uint64_t v29 = v27;
          if (!*v27) {
            goto LABEL_58;
          }
        }
        if (v28 >= (unint64_t)v25) {
          break;
        }
        unint64_t v26 = v27[1];
        if (!v26)
        {
          uint64_t v29 = v27 + 1;
          goto LABEL_58;
        }
      }
      uint64_t v30 = (uint64_t *)v27;
    }
    else
    {
      uint64_t v29 = (uint64_t **)(a1 + 304);
      long long v27 = (uint64_t **)(a1 + 304);
LABEL_58:
      uint64_t v30 = (uint64_t *)operator new(0x38uLL);
      v30[4] = (uint64_t)v25;
      if (v25) {
        xpc_retain(v25);
      }
      else {
        v30[4] = (uint64_t)xpc_null_create();
      }
      v30[5] = 0;
      v30[6] = 0;
      *uint64_t v30 = 0;
      v30[1] = 0;
      v30[2] = (uint64_t)v27;
      *uint64_t v29 = v30;
      uint64_t v31 = **(void **)(a1 + 296);
      uint64_t v32 = v30;
      if (v31)
      {
        *(void *)(a1 + 296) = v31;
        uint64_t v32 = *v29;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(a1 + 304), v32);
      ++*(void *)(a1 + 312);
    }
    uint64_t v34 = *(void *)buf;
    uint64_t v33 = *(void *)&buf[8];
    if (*(void *)&buf[8]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
    }
    std::string::size_type v35 = (std::__shared_weak_count *)v30[6];
    v30[5] = v34;
    v30[6] = v33;
    if (v35) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v35);
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN12TelephonyXPC6Server5State20handleNewClient_syncEN3xpc10connectionE_block_invoke;
    aBlock[3] = &__block_descriptor_tmp_56;
    void aBlock[4] = a1;
    *a3 = _Block_copy(aBlock);
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
    }
  }
  else
  {
    *a3 = 0;
  }
  std::__tree<std::string>::destroy((uint64_t)&v48, v49[0]);
}

void sub_21E06E1E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,xpc_object_t a32,uint64_t a33,xpc_object_t object,uint64_t a35,xpc_object_t a36,uint64_t a37,int a38,__int16 a39,char a40,char a41)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void TelephonyXPC::Server::State::handleClientError_sync(uint64_t a1, xpc_object_t *a2, xpc::object *a3)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  unint64_t v49 = 0xAAAAAAAAAAAAAAAALL;
  char v50 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v6 = *a2;
  if (*a2) {
    xpc_retain(*a2);
  }
  else {
    xpc_object_t v6 = xpc_null_create();
  }
  TelephonyXPC::Server::State::getClientState_sync(&v49, a1, (unint64_t)v6);
  xpc_release(v6);
  if (!v49) {
    goto LABEL_63;
  }
  memset(__p, 170, 24);
  if (*(char *)(v49 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v52, *(const std::string::value_type **)v49, *(void *)(v49 + 8));
  }
  else
  {
    long long v7 = *(_OWORD *)v49;
    v52.__r_.__value_.__r.__words[2] = *(void *)(v49 + 16);
    *(_OWORD *)&v52.__r_.__value_.__l.__data_ = v7;
  }
  std::string v8 = std::string::insert(&v52, 0, "Client '", 8uLL);
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v51.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v51.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  char v10 = std::string::append(&v51, "' ", 2uLL);
  long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  __p[2] = (void *)v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v51.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v52.__r_.__value_.__l.__data_);
  }
  uint64_t v12 = *(void *)a3;
  if (*(void *)a3 != MEMORY[0x263EF86A8])
  {
    if (v12 == MEMORY[0x263EF86A0])
    {
      std::string::size_type v35 = (unsigned int (***)(void, uint64_t))(a1 + 80);
      v36 = *(NSObject **)(a1 + 112);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v46 = __p;
        if (SHIBYTE(__p[2]) < 0) {
          v46 = (void **)__p[0];
        }
        LODWORD(v51.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)v51.__r_.__value_.__r.__words + 4) = (std::string::size_type)v46;
        _os_log_debug_impl(&dword_21E069000, v36, OS_LOG_TYPE_DEBUG, "#D %s connection interrupted", (uint8_t *)&v51, 0xCu);
      }
      if (!(**v35)(v35, 20)) {
        goto LABEL_61;
      }
      int v38 = __p;
      if (SHIBYTE(__p[2]) < 0) {
        int v38 = (void **)__p[0];
      }
      ctu::LogMessageBuffer::createWithFormat((uint64_t *)&v51, (ctu::LogMessageBuffer *)"%s connection interrupted", v37, v38);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    }
    else
    {
      uint64_t v13 = MEMORY[0x263EF86C0];
      uint64_t v14 = (unsigned int (***)(void, uint64_t))(a1 + 80);
      xpc_object_t v15 = *(NSObject **)(a1 + 112);
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
      if (v12 != v13)
      {
        if (v16)
        {
          xpc::object::to_string((uint64_t *)&v51, a3);
          v44 = __p;
          if (SHIBYTE(__p[2]) < 0) {
            v44 = (void **)__p[0];
          }
          if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            xpc_object_t v45 = &v51;
          }
          else {
            xpc_object_t v45 = (std::string *)v51.__r_.__value_.__r.__words[0];
          }
          LODWORD(v52.__r_.__value_.__l.__data_) = 136315394;
          *(std::string::size_type *)((char *)v52.__r_.__value_.__r.__words + 4) = (std::string::size_type)v44;
          WORD2(v52.__r_.__value_.__r.__words[1]) = 2080;
          *(std::string::size_type *)((char *)&v52.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v45;
          _os_log_debug_impl(&dword_21E069000, v15, OS_LOG_TYPE_DEBUG, "#D %s %s", (uint8_t *)&v52, 0x16u);
          if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v51.__r_.__value_.__l.__data_);
          }
        }
        if (!(**v14)(v14, 20)) {
          goto LABEL_61;
        }
        int v17 = SHIBYTE(__p[2]);
        xpc_object_t v18 = (void **)__p[0];
        xpc::object::to_string((uint64_t *)&v52, a3);
        uint64_t v20 = __p;
        if (v17 < 0) {
          uint64_t v20 = v18;
        }
        xpc_object_t v21 = (v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? &v52
            : (std::string *)v52.__r_.__value_.__r.__words[0];
        ctu::LogMessageBuffer::createWithFormat((uint64_t *)&v51, (ctu::LogMessageBuffer *)"%s %s", v19, v20, v21);
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
        MEMORY[0x223C1F270](&v51);
        if ((SHIBYTE(v52.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_61;
        }
        size_t v22 = (uint64_t *)v52.__r_.__value_.__r.__words[0];
        goto LABEL_60;
      }
      if (v16)
      {
        v47 = __p;
        if (SHIBYTE(__p[2]) < 0) {
          v47 = (void **)__p[0];
        }
        LODWORD(v51.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)v51.__r_.__value_.__r.__words + 4) = (std::string::size_type)v47;
        _os_log_debug_impl(&dword_21E069000, v15, OS_LOG_TYPE_DEBUG, "#D %s will be terminated", (uint8_t *)&v51, 0xCu);
      }
      if (!(**v14)(v14, 20)) {
        goto LABEL_61;
      }
      v40 = __p;
      if (SHIBYTE(__p[2]) < 0) {
        v40 = (void **)__p[0];
      }
      ctu::LogMessageBuffer::createWithFormat((uint64_t *)&v51, (ctu::LogMessageBuffer *)"%s will be terminated", v39, v40);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    }
    MEMORY[0x223C1F270](&v51);
    goto LABEL_61;
  }
  xpc_object_t v23 = *(NSObject **)(a1 + 112);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v43 = __p;
    if (SHIBYTE(__p[2]) < 0) {
      uint64_t v43 = (void **)__p[0];
    }
    LODWORD(v51.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)v51.__r_.__value_.__r.__words + 4) = (std::string::size_type)v43;
    _os_log_debug_impl(&dword_21E069000, v23, OS_LOG_TYPE_DEBUG, "#D %s disappeared", (uint8_t *)&v51, 0xCu);
  }
  if ((**(unsigned int (***)(uint64_t, uint64_t))(a1 + 80))(a1 + 80, 20))
  {
    xpc_object_t v25 = __p;
    if (SHIBYTE(__p[2]) < 0) {
      xpc_object_t v25 = (void **)__p[0];
    }
    ctu::LogMessageBuffer::createWithFormat((uint64_t *)&v51, (ctu::LogMessageBuffer *)"%s disappeared", v24, v25);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x223C1F270](&v51);
  }
  unint64_t v26 = *(uint64_t **)(a1 + 304);
  if (!v26) {
    goto LABEL_61;
  }
  xpc_object_t v27 = *a2;
  unint64_t v28 = (uint64_t *)(a1 + 304);
  uint64_t v29 = *(void **)(a1 + 304);
  do
  {
    unint64_t v30 = v29[4];
    BOOL v31 = v30 >= (unint64_t)v27;
    if (v30 >= (unint64_t)v27) {
      uint64_t v32 = v29;
    }
    else {
      uint64_t v32 = v29 + 1;
    }
    if (v31) {
      unint64_t v28 = v29;
    }
    uint64_t v29 = (void *)*v32;
  }
  while (*v32);
  if (v28 == (uint64_t *)(a1 + 304) || v28[4] > (unint64_t)v27) {
    goto LABEL_61;
  }
  uint64_t v33 = (uint64_t *)v28[1];
  if (v33)
  {
    do
    {
      uint64_t v34 = v33;
      uint64_t v33 = (uint64_t *)*v33;
    }
    while (v33);
  }
  else
  {
    v41 = v28;
    do
    {
      uint64_t v34 = (uint64_t *)v41[2];
      BOOL v42 = *v34 == (void)v41;
      v41 = v34;
    }
    while (!v42);
  }
  if (*(uint64_t **)(a1 + 296) == v28) {
    *(void *)(a1 + 296) = v34;
  }
  --*(void *)(a1 + 312);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v26, v28);
  std::__destroy_at[abi:ne180100]<std::pair<xpc::connection const,TelephonyXPC::ServerClientState>,0>((uint64_t)(v28 + 4));
  size_t v22 = v28;
LABEL_60:
  operator delete(v22);
LABEL_61:
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
LABEL_63:
  if (v50) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v50);
  }
}

void sub_21E06E990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, std::__shared_weak_count *a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a19);
  }
  _Unwind_Resume(a1);
}

uint64_t ctu::Loggable<TelephonyXPC::Server::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x270F97428](a1 + 8);
}

void ctu::Loggable<TelephonyXPC::Server::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  if (*(char *)(a1 - 9) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)(a1 - 32), *(void *)(a1 - 24));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)(a1 - 32);
    a2->__r_.__value_.__r.__words[2] = *(void *)(a1 - 16);
  }
}

uint64_t ctu::Loggable<TelephonyXPC::Server::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x270F978E0](a1 + 8);
}

void *ctu::Loggable<TelephonyXPC::Server::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CEE4848;
  MEMORY[0x223C1F210](a1 + 1);
  return a1;
}

void ctu::Loggable<TelephonyXPC::Server::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CEE4848;
  MEMORY[0x223C1F210](a1 + 1);
  operator delete(a1);
}

xpc_object_t xpc::dict::object_proxy::operator xpc::object(void *a1, xpc_object_t xdict, char *key)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, key);
  *a1 = value;
  if (value) {
    return xpc_retain(value);
  }
  xpc_object_t result = xpc_null_create();
  *a1 = result;
  return result;
}

std::string *TelephonyXPC::Server::State::Parameters::Parameters(std::string *this, const TelephonyXPC::Server::State::Parameters *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *(_OWORD *)a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(this + 1, *((const std::string::value_type **)a2 + 3), *((void *)a2 + 4));
  }
  else
  {
    long long v5 = *(_OWORD *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((void *)a2 + 5);
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = v5;
  }
  xpc_object_t v6 = this + 2;
  if (*((char *)a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *((const std::string::value_type **)a2 + 6), *((void *)a2 + 7));
  }
  else
  {
    long long v7 = *((_OWORD *)a2 + 3);
    this[2].__r_.__value_.__r.__words[2] = *((void *)a2 + 8);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  std::string v8 = (void *)*((void *)a2 + 9);
  this[3].__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
  if (v8) {
    xpc_retain(v8);
  }
  else {
    this[3].__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  }
  LOWORD(this[3].__r_.__value_.__r.__words[1]) = *((_WORD *)a2 + 40);
  return this;
}

void sub_21E06EC5C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 47) < 0) {
    operator delete(*v2);
  }
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void xpc::connection::~connection(xpc_object_t *this)
{
  *this = 0;
}

void std::__shared_ptr_pointer<TelephonyXPC::Server::State *,std::shared_ptr<TelephonyXPC::Server::State>::__shared_ptr_default_delete<TelephonyXPC::Server::State,TelephonyXPC::Server::State>,std::allocator<TelephonyXPC::Server::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Server::State *,std::shared_ptr<TelephonyXPC::Server::State>::__shared_ptr_default_delete<TelephonyXPC::Server::State,TelephonyXPC::Server::State>,std::allocator<TelephonyXPC::Server::State>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 32))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Server::State *,std::shared_ptr<TelephonyXPC::Server::State>::__shared_ptr_default_delete<TelephonyXPC::Server::State,TelephonyXPC::Server::State>,std::allocator<TelephonyXPC::Server::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void ___ZN12TelephonyXPC6Server5State4initEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 225))
  {
    *(void *)(v1 + 288) = dispatch_source_create(MEMORY[0x263EF83F0], 0xFuLL, 0, *(dispatch_queue_t *)(v1 + 24));
    uint64_t v2 = *(std::__shared_weak_count **)(v1 + 16);
    if (!v2 || (uint64_t v3 = *(void *)(v1 + 8), (v4 = std::__shared_weak_count::lock(v2)) == 0)) {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    long long v5 = v4;
    p_shared_weak_owners = &v4->__shared_weak_owners_;
    atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    long long v7 = *(NSObject **)(v1 + 288);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 1174405120;
    handler[2] = ___ZN12TelephonyXPC6Server5State4initEv_block_invoke_2;
    handler[3] = &__block_descriptor_tmp_0;
    handler[4] = v1;
    handler[5] = v3;
    uint64_t v20 = v5;
    atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
    dispatch_source_set_event_handler(v7, handler);
    dispatch_activate(*(dispatch_object_t *)(v1 + 288));
    signal(15, (void (__cdecl *)(int))1);
    if (v20) {
      std::__shared_weak_count::__release_weak(v20);
    }
    std::__shared_weak_count::__release_weak(v5);
  }
  if (*(unsigned char *)(v1 + 224))
  {
    std::string v8 = *(std::__shared_weak_count **)(v1 + 264);
    v18[0] = *(void *)(v1 + 256);
    v18[1] = (uint64_t)v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN12TelephonyXPC6Server5State4initEv_block_invoke_22;
    aBlock[3] = &__block_descriptor_tmp_28;
    void aBlock[4] = v1;
    long long v9 = _Block_copy(aBlock);
    char v10 = *(NSObject **)(v1 + 24);
    if (v10) {
      dispatch_retain(*(dispatch_object_t *)(v1 + 24));
    }
    v17[0] = v9;
    v17[1] = v10;
    TelephonyXPC::ServerPowerObserver::create(v18, (uint64_t)v17, (uint64_t *)v15);
    long long v11 = v15[0];
    v15[0] = 0uLL;
    uint64_t v12 = *(std::__shared_weak_count **)(v1 + 280);
    *(_OWORD *)(v1 + 272) = v11;
    if (v12)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
      if (*((void *)&v15[0] + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v15[0] + 1));
      }
    }
    if (v10) {
      dispatch_release(v10);
    }
    if (v9) {
      _Block_release(v9);
    }
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    uint64_t v13 = *(NSObject **)(v1 + 112);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v15[0]) = 0;
      _os_log_debug_impl(&dword_21E069000, v13, OS_LOG_TYPE_DEBUG, "#D Server power observer enabled", (uint8_t *)v15, 2u);
    }
    if ((**(unsigned int (***)(uint64_t, uint64_t))(v1 + 80))(v1 + 80, 20))
    {
      ctu::LogMessageBuffer::createWithFormat((uint64_t *)v15, (ctu::LogMessageBuffer *)"Server power observer enabled", v14);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x223C1F270](v15);
    }
  }
}

void ___ZN12TelephonyXPC6Server5State4initEv_block_invoke_2(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = a1[4];
    long long v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      long long v5 = v4;
      if (a1[5])
      {
        xpc_object_t v6 = *(NSObject **)(v3 + 112);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21E069000, v6, OS_LOG_TYPE_DEFAULT, "#I SIGTERM received", buf, 2u);
        }
        if ((**(unsigned int (***)(uint64_t, uint64_t))(v3 + 80))(v3 + 80, 40))
        {
          ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"SIGTERM received", v7);
          ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
          MEMORY[0x223C1F270](buf);
        }
        std::string v8 = *(std::__shared_weak_count **)(v3 + 16);
        if (!v8 || (uint64_t v9 = *(void *)(v3 + 8), (v10 = std::__shared_weak_count::lock(v8)) == 0)) {
          std::__throw_bad_weak_ptr[abi:ne180100]();
        }
        long long v11 = v10;
        p_shared_weak_owners = &v10->__shared_weak_owners_;
        atomic_fetch_add_explicit(&v10->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        std::__shared_weak_count::__release_shared[abi:ne180100](v10);
        std::string::basic_string[abi:ne180100]<0>(__p, "EventServerSIGTERM");
        *(void *)buf = MEMORY[0x263EF8330];
        uint64_t v19 = 1174405120;
        uint64_t v20 = ___ZN12TelephonyXPC6Server5State13handleSIGTERMEv_block_invoke;
        xpc_object_t v21 = &__block_descriptor_tmp_36;
        uint64_t v22 = v3;
        uint64_t v23 = v9;
        int v24 = v11;
        atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
        uint64_t v13 = _Block_copy(buf);
        uint64_t v14 = *(NSObject **)(v3 + 24);
        if (v14) {
          dispatch_retain(*(dispatch_object_t *)(v3 + 24));
        }
        v15[0] = v13;
        v15[1] = v14;
        TelephonyXPC::Server::State::broadcast((void *)v3, (uint64_t)__p, (uint64_t)v15);
        if (v14) {
          dispatch_release(v14);
        }
        if (v13) {
          _Block_release(v13);
        }
        if (v17 < 0) {
          operator delete(__p[0]);
        }
        if (v24) {
          std::__shared_weak_count::__release_weak(v24);
        }
        std::__shared_weak_count::__release_weak(v11);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
}

uint64_t __copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcServerEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcServerEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZN12TelephonyXPC6Server5State4initEv_block_invoke_22(uint64_t a1, unsigned int a2, unsigned int a3, NSObject **a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = *(void *)(a1 + 32);
  memset(&v28, 0, sizeof(v28));
  std::string v8 = (unsigned int (***)(uint64_t, uint64_t))(v7 + 80);
  uint64_t v9 = *(NSObject **)(v7 + 112);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 2) {
      char v10 = "Unknown";
    }
    else {
      char v10 = (&off_264490CA8)[a3];
    }
    *(_DWORD *)buf = 136315138;
    unint64_t v30 = v10;
    _os_log_impl(&dword_21E069000, v9, OS_LOG_TYPE_DEFAULT, "#I Power state: %s", buf, 0xCu);
  }
  if ((**v8)(v7 + 80, 40))
  {
    if (a3 > 2) {
      uint64_t v12 = "Unknown";
    }
    else {
      uint64_t v12 = (&off_264490CA8)[a3];
    }
    ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"Power state: %s", v11, v12);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x223C1F270](buf);
  }
  uint64_t v13 = "EventSystemShuttingDown";
  std::string::size_type v14 = 23;
  switch(a2)
  {
    case 0u:
      if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
      {
        v28.__r_.__value_.__l.__size_ = 20;
        xpc_object_t v15 = (std::string *)v28.__r_.__value_.__r.__words[0];
      }
      else
      {
        *((unsigned char *)&v28.__r_.__value_.__s + 23) = 20;
        xpc_object_t v15 = &v28;
      }
      strcpy((char *)v15, "EventSystemPoweredOn");
      break;
    case 1u:
      goto LABEL_16;
    case 2u:
      uint64_t v13 = "EventSystemEnteringLowPower";
      std::string::size_type v14 = 27;
      goto LABEL_16;
    case 3u:
      uint64_t v13 = "EventSystemExitingLowPower";
      std::string::size_type v14 = 26;
LABEL_16:
      std::string::__assign_external(&v28, v13, v14);
      break;
    default:
      break;
  }
  std::string::size_type size = HIBYTE(v28.__r_.__value_.__r.__words[2]);
  if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v28.__r_.__value_.__l.__size_;
  }
  if (size)
  {
    char v17 = *(NSObject **)(v7 + 112);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      if (a2 > 3) {
        xpc_object_t v18 = "Unknown";
      }
      else {
        xpc_object_t v18 = (&off_264490CC0)[a2];
      }
      *(_DWORD *)buf = 136315138;
      unint64_t v30 = v18;
      _os_log_impl(&dword_21E069000, v17, OS_LOG_TYPE_DEFAULT, "#I Sending server power event: %s", buf, 0xCu);
    }
    if ((**v8)(v7 + 80, 40))
    {
      if (a2 > 3) {
        uint64_t v20 = "Unknown";
      }
      else {
        uint64_t v20 = (&off_264490CC0)[a2];
      }
      ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"Sending server power event: %s", v19, v20);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x223C1F270](buf);
    }
    if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v27, v28.__r_.__value_.__l.__data_, v28.__r_.__value_.__l.__size_);
    }
    else {
      std::string v27 = v28;
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZN12TelephonyXPC6Server5State4initEv_block_invoke_25;
    aBlock[3] = &__block_descriptor_tmp_26;
    xpc_object_t v21 = *a4;
    dispatch_group_t group = v21;
    if (v21)
    {
      dispatch_retain(v21);
      dispatch_group_enter(group);
    }
    uint64_t v22 = _Block_copy(aBlock);
    uint64_t v23 = *(NSObject **)(v7 + 24);
    if (v23) {
      dispatch_retain(*(dispatch_object_t *)(v7 + 24));
    }
    v26[0] = v22;
    v26[1] = v23;
    TelephonyXPC::Server::State::broadcast((void *)v7, (uint64_t)&v27, (uint64_t)v26);
    if (v23) {
      dispatch_release(v23);
    }
    if (v22) {
      _Block_release(v22);
    }
    if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v27.__r_.__value_.__l.__data_);
    }
    if (group)
    {
      dispatch_group_leave(group);
      if (group) {
        dispatch_release(group);
      }
    }
  }
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v28.__r_.__value_.__l.__data_);
  }
}

void sub_21E06F700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, dispatch_group_t group, char a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,char a29)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32c30_ZTSN8dispatch13group_sessionE(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(a2 + 32);
  *(void *)(a1 + 32) = v3;
  if (v3)
  {
    dispatch_retain(v3);
    long long v4 = *(NSObject **)(a1 + 32);
    if (v4)
    {
      dispatch_group_enter(v4);
    }
  }
}

void __destroy_helper_block_e8_32c30_ZTSN8dispatch13group_sessionE(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *(NSObject **)(a1 + 32);
    if (v3)
    {
      dispatch_release(v3);
    }
  }
}

void *___ZNK3ctu20SharedSynchronizableINS_9XpcServerEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

void ___ZN12TelephonyXPC6Server5State13handleSIGTERMEv_block_invoke(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = a1[4];
    long long v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      long long v5 = v4;
      if (a1[5])
      {
        xpc_object_t v6 = *(const void **)(v3 + 240);
        if (v6) {
          uint64_t v7 = _Block_copy(v6);
        }
        else {
          uint64_t v7 = 0;
        }
        std::string v8 = *(NSObject **)(v3 + 248);
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 1174405120;
        void v10[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC6Server12ServerStatusEEEclIJS3_EEEvDpT__block_invoke;
        v10[3] = &__block_descriptor_tmp_37;
        if (v7) {
          uint64_t v9 = _Block_copy(v7);
        }
        else {
          uint64_t v9 = 0;
        }
        aBlock = v9;
        int v12 = 2;
        dispatch_async(v8, v10);
        if (aBlock) {
          _Block_release(aBlock);
        }
        if (v7) {
          _Block_release(v7);
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC6Server12ServerStatusEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void *__copy_helper_block_e8_32c79_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC6Server12ServerStatusEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 32);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c79_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC6Server12ServerStatusEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  if ((SHIBYTE(this->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v7 = 22;
LABEL_5:
    std::string::__grow_by_and_replace(this, v7, __n - v7, size, 0, size, __n, __s);
    return this;
  }
  std::string::size_type v7 = (this->__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
  if (v7 < __n)
  {
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    goto LABEL_5;
  }
  std::string::size_type v9 = this->__r_.__value_.__r.__words[0];
  memmove(this->__r_.__value_.__l.__data_, __s, __n);
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    this->__r_.__value_.__l.__size_ = __n;
  }
  else {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
  }
  *(unsigned char *)(v9 + __n) = 0;
  return this;
}

uint64_t ___ZN12TelephonyXPC6Server5State5startEv_block_invoke(uint64_t result)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_DWORD *)(v1 + 232))
  {
    ctu::XpcServer::startListener_sync(*(ctu::XpcServer **)(result + 32));
    uint64_t v2 = (const char *)(v1 + 168);
    if (*(char *)(v1 + 191) < 0) {
      uint64_t v2 = *(const char **)v2;
    }
    CFStringRef v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v2, 0x600u);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, 0, 0, 1u);
    CFRelease(v3);
    *(_DWORD *)(v1 + 232) = 1;
    long long v5 = *(const void **)(v1 + 240);
    if (v5) {
      xpc_object_t v6 = _Block_copy(v5);
    }
    else {
      xpc_object_t v6 = 0;
    }
    std::string::size_type v7 = *(NSObject **)(v1 + 248);
    *(void *)&long long block = MEMORY[0x263EF8330];
    *((void *)&block + 1) = 1174405120;
    xpc_object_t v18 = ___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC6Server12ServerStatusEEEclIJS3_EEEvDpT__block_invoke;
    uint64_t v19 = &__block_descriptor_tmp_37;
    if (v6) {
      std::string v8 = _Block_copy(v6);
    }
    else {
      std::string v8 = 0;
    }
    aBlock = v8;
    int v21 = 1;
    dispatch_async(v7, &block);
    if (aBlock) {
      _Block_release(aBlock);
    }
    if (v6) {
      _Block_release(v6);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "ServerStateStarted");
    TelephonyXPC::Server::State::broadcastServerState((void *)v1, (const char *)__p);
    if (v16 < 0) {
      operator delete(__p[0]);
    }
    std::string::size_type v9 = *(NSObject **)(v1 + 112);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(int *)(v1 + 232);
      if (v10 > 3) {
        long long v11 = "Unknown";
      }
      else {
        long long v11 = (&off_264490CE0)[v10];
      }
      LODWORD(block) = 136315138;
      *(void *)((char *)&block + 4) = v11;
      _os_log_impl(&dword_21E069000, v9, OS_LOG_TYPE_DEFAULT, "#I %s", (uint8_t *)&block, 0xCu);
    }
    uint64_t result = (**(uint64_t (***)(uint64_t, uint64_t))(v1 + 80))(v1 + 80, 40);
    if (result)
    {
      uint64_t v13 = *(int *)(v1 + 232);
      if (v13 > 3) {
        std::string::size_type v14 = "Unknown";
      }
      else {
        std::string::size_type v14 = (&off_264490CE0)[v13];
      }
      ctu::LogMessageBuffer::createWithFormat((uint64_t *)&block, (ctu::LogMessageBuffer *)"%s", v12, v14);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      return MEMORY[0x223C1F270](&block);
    }
  }
  return result;
}

void TelephonyXPC::Server::State::broadcastServerState(void *a1, const char *a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (v4 || (xpc_object_t v4 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x223C1F7A0](v4) == MEMORY[0x263EF8708])
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
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  xpc_object_t object = xpc_string_create(a2);
  if (!object) {
    xpc_object_t object = xpc_null_create();
  }
  xpc::dict::object_proxy::operator=(&v12, v5, "KeyServerState", &object);
  xpc_release(v12);
  xpc_object_t v12 = 0;
  xpc_release(object);
  xpc_object_t object = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "EventServerStateChange");
  if (v5)
  {
    xpc_retain(v5);
    xpc_object_t v6 = v5;
  }
  else
  {
    xpc_object_t v6 = xpc_null_create();
  }
  aBlock = 0;
  dispatch_object_t v8 = 0;
  TelephonyXPC::Server::State::broadcast(a1, (uint64_t)__p, v6, (uint64_t)&aBlock);
  if (v8) {
    dispatch_release(v8);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  xpc_release(v6);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  xpc_release(v5);
}

void sub_21E06FED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  dispatch::callback<void({block_pointer})(void)>::~callback((uint64_t)&a10);
  xpc_release(v18);
  if (a17 < 0) {
    operator delete(__p);
  }
  xpc_release(v17);
  _Unwind_Resume(a1);
}

xpc_object_t xpc::dict::object_proxy::operator=(xpc_object_t *a1, xpc_object_t xdict, char *key, xpc_object_t *a4)
{
  xpc_dictionary_set_value(xdict, key, *a4);
  *a1 = *a4;
  xpc_object_t result = xpc_null_create();
  *a4 = result;
  return result;
}

{
  xpc_object_t result;

  xpc_dictionary_set_value(xdict, key, *a4);
  *a1 = *a4;
  xpc_object_t result = xpc_null_create();
  *a4 = result;
  return result;
}

void ___ZN12TelephonyXPC6Server5State9broadcastENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN3xpc4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke(uint64_t a1)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  uint64_t v4 = MEMORY[0x263EF8708];
  if (v3 || (xpc_object_t v3 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x223C1F7A0](v3) == v4)
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
  xpc_object_t v40 = v5;
  if (MEMORY[0x223C1F7A0](*(void *)(a1 + 40)) == v4)
  {
    xpc_object_t v6 = *(void **)(a1 + 40);
    xpc_object_t v67 = v6;
    if (v6) {
      xpc_retain(v6);
    }
    else {
      xpc_object_t v67 = xpc_null_create();
    }
    xpc::dict::object_proxy::operator=(&v68, v5, "eventData", &v67);
    xpc_release(v68);
    xpc_object_t v68 = 0;
    xpc_release(v67);
    xpc_object_t v67 = 0;
  }
  xpc_object_t v65 = xpc_string_create("eventNotification");
  if (!v65) {
    xpc_object_t v65 = xpc_null_create();
  }
  xpc::dict::object_proxy::operator=(&v66, v5, "command", &v65);
  xpc_release(v66);
  xpc_object_t v66 = 0;
  xpc_release(v65);
  xpc_object_t v65 = 0;
  std::string::size_type v7 = (std::string *)(a1 + 48);
  dispatch_object_t v8 = (const char *)(a1 + 48);
  if (*(char *)(a1 + 71) < 0) {
    dispatch_object_t v8 = (const char *)v7->__r_.__value_.__r.__words[0];
  }
  xpc_object_t v63 = xpc_string_create(v8);
  if (!v63) {
    xpc_object_t v63 = xpc_null_create();
  }
  xpc::dict::object_proxy::operator=(&v64, v5, "event", &v63);
  xpc_release(v64);
  xpc_object_t v64 = 0;
  xpc_release(v63);
  xpc_object_t v63 = 0;
  dispatch_group_t group = dispatch_group_create();
  std::string::size_type v9 = (std::__shared_weak_count *)v2[2];
  if (!v9 || (v38 = v2[1], (char v10 = std::__shared_weak_count::lock(v9)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  atomic_fetch_add_explicit(&v10->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  v39 = v10;
  std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  long long v11 = (void *)v2[37];
  v44 = v2 + 38;
  if (v11 != v2 + 38)
  {
    uint64_t v43 = (unsigned int (***)(void, uint64_t))(v2 + 10);
    BOOL v42 = v2;
    do
    {
      unint64_t v61 = 0xAAAAAAAAAAAAAAAALL;
      v62 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
      xpc_object_t v12 = (xpc_object_t)v11[4];
      xpc_object_t v60 = v12;
      if (v12)
      {
        xpc_retain(v12);
      }
      else
      {
        xpc_object_t v12 = xpc_null_create();
        xpc_object_t v60 = v12;
      }
      uint64_t v13 = v11[5];
      std::string::size_type v14 = (std::__shared_weak_count *)v11[6];
      unint64_t v61 = v13;
      v62 = v14;
      if (v14) {
        atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (v12) {
        xpc_retain(v12);
      }
      else {
        xpc_object_t v12 = xpc_null_create();
      }
      uint64_t v58 = v13;
      uint64_t v59 = v14;
      if (v14) {
        atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (*(char *)(a1 + 71) < 0) {
        std::string::__init_copy_ctor_external(&v57, *(const std::string::value_type **)(a1 + 48), *(void *)(a1 + 56));
      }
      else {
        std::string v57 = *v7;
      }
      BOOL isNotificationRegistered_sync = TelephonyXPC::ServerClientState::isNotificationRegistered_sync(&v58, (uint64_t)&v57);
      BOOL v16 = isNotificationRegistered_sync;
      if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v57.__r_.__value_.__l.__data_);
        if (v16)
        {
LABEL_39:
          char v17 = v2[14];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            xpc_object_t v18 = v7;
            if (*(char *)(a1 + 71) < 0) {
              xpc_object_t v18 = (std::string *)v7->__r_.__value_.__r.__words[0];
            }
            if (*(char *)(v13 + 23) < 0)
            {
              std::string::__init_copy_ctor_external(&v56, *(const std::string::value_type **)v13, *(void *)(v13 + 8));
            }
            else
            {
              long long v19 = *(_OWORD *)v13;
              v56.__r_.__value_.__r.__words[2] = *(void *)(v13 + 16);
              *(_OWORD *)&v56.__r_.__value_.__l.__data_ = v19;
            }
            int v20 = SHIBYTE(v56.__r_.__value_.__r.__words[2]);
            std::string::size_type v21 = v56.__r_.__value_.__r.__words[0];
            uint64_t SystemTime = TelephonyUtilGetSystemTime();
            *(_DWORD *)buf = 136315650;
            uint64_t v23 = &v56;
            if (v20 < 0) {
              uint64_t v23 = (std::string *)v21;
            }
            v70 = v18;
            __int16 v71 = 2080;
            v72 = v23;
            __int16 v73 = 2048;
            uint64_t v74 = SystemTime;
            _os_log_impl(&dword_21E069000, v17, OS_LOG_TYPE_DEFAULT, "#I Sending %s to %s at %llu", buf, 0x20u);
            if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v56.__r_.__value_.__l.__data_);
            }
            xpc_object_t v5 = v40;
            uint64_t v2 = v42;
            std::string::size_type v7 = (std::string *)(a1 + 48);
          }
          if ((**v43)(v43, 40))
          {
            int v24 = v7;
            if (*(char *)(a1 + 71) < 0) {
              int v24 = (std::string *)v7->__r_.__value_.__r.__words[0];
            }
            if (*(char *)(v13 + 23) < 0)
            {
              std::string::__init_copy_ctor_external(&v56, *(const std::string::value_type **)v13, *(void *)(v13 + 8));
            }
            else
            {
              long long v25 = *(_OWORD *)v13;
              v56.__r_.__value_.__r.__words[2] = *(void *)(v13 + 16);
              *(_OWORD *)&v56.__r_.__value_.__l.__data_ = v25;
            }
            int v26 = SHIBYTE(v56.__r_.__value_.__r.__words[2]);
            std::string::size_type v27 = v56.__r_.__value_.__r.__words[0];
            uint64_t v28 = TelephonyUtilGetSystemTime();
            if (v26 >= 0) {
              unint64_t v30 = &v56;
            }
            else {
              unint64_t v30 = (std::string *)v27;
            }
            ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"Sending %s to %s at %llu", v29, v24, v30, v28);
            ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
            std::string::size_type v7 = (std::string *)(a1 + 48);
            MEMORY[0x223C1F270](buf);
            uint64_t v2 = v42;
            if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v56.__r_.__value_.__l.__data_);
            }
          }
          if (*(void *)(a1 + 72) && *(void *)(a1 + 80))
          {
            dispatch_group_enter(group);
            uint64_t v31 = v2[3];
            handler[0] = MEMORY[0x263EF8330];
            handler[1] = 1174405120;
            handler[2] = ___ZN12TelephonyXPC6Server5State9broadcastENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN3xpc4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke_41;
            handler[3] = &__block_descriptor_tmp_44;
            handler[4] = v2;
            handler[5] = v38;
            std::string v51 = v39;
            atomic_fetch_add_explicit(&v39->__shared_weak_owners_, 1uLL, memory_order_relaxed);
            uint64_t v52 = v13;
            uint64_t v53 = v14;
            if (v14) {
              atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            if (*(char *)(a1 + 71) < 0) {
              std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 48), *(void *)(a1 + 56));
            }
            else {
              std::string __p = *v7;
            }
            std::string v55 = group;
            xpc_connection_send_message_with_reply((xpc_connection_t)v12, v5, v31, handler);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
            if (v53) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v53);
            }
            if (v51) {
              std::__shared_weak_count::__release_weak(v51);
            }
          }
          else
          {
            xpc_connection_send_message((xpc_connection_t)v12, v5);
          }
        }
      }
      else if (isNotificationRegistered_sync)
      {
        goto LABEL_39;
      }
      if (v59) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v59);
      }
      xpc_release(v12);
      if (v62) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v62);
      }
      xpc_release(v60);
      uint64_t v32 = (void *)v11[1];
      if (v32)
      {
        do
        {
          uint64_t v33 = v32;
          uint64_t v32 = (void *)*v32;
        }
        while (v32);
      }
      else
      {
        do
        {
          uint64_t v33 = (void *)v11[2];
          BOOL v34 = *v33 == (void)v11;
          long long v11 = v33;
        }
        while (!v34);
      }
      long long v11 = v33;
    }
    while (v33 != v44);
  }
  if (*(void *)(a1 + 72) && *(void *)(a1 + 80))
  {
    std::string::size_type v35 = v2[3];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN12TelephonyXPC6Server5State9broadcastENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN3xpc4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke_45;
    block[3] = &__block_descriptor_tmp_47;
    block[4] = v2;
    block[5] = v38;
    v46 = v39;
    atomic_fetch_add_explicit(&v39->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    if (*(char *)(a1 + 71) < 0) {
      std::string::__init_copy_ctor_external(&v47, *(const std::string::value_type **)(a1 + 48), *(void *)(a1 + 56));
    }
    else {
      std::string v47 = *(std::string *)(a1 + 48);
    }
    v36 = *(void **)(a1 + 72);
    if (v36) {
      v36 = _Block_copy(v36);
    }
    v37 = *(NSObject **)(a1 + 80);
    aBlock = v36;
    dispatch_object_t object = v37;
    if (v37) {
      dispatch_retain(v37);
    }
    dispatch_group_notify(group, v35, block);
    if (object) {
      dispatch_release(object);
    }
    if (aBlock) {
      _Block_release(aBlock);
    }
    if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v47.__r_.__value_.__l.__data_);
    }
    if (v46) {
      std::__shared_weak_count::__release_weak(v46);
    }
  }
  dispatch_release(group);
  std::__shared_weak_count::__release_weak(v39);
  xpc_release(v5);
}

void sub_21E0706E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17, xpc_object_t object, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,std::__shared_weak_count *a30)
{
  if (a30) {
    std::__shared_weak_count::__release_weak(a30);
  }
  std::__shared_weak_count::__release_weak(a17);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void ___ZN12TelephonyXPC6Server5State9broadcastENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN3xpc4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke_41(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2 && (uint64_t v3 = *(void *)(a1 + 32), (v4 = std::__shared_weak_count::lock(v2)) != 0))
  {
    xpc_object_t v5 = v4;
    if (*(void *)(a1 + 40))
    {
      xpc_object_t v6 = *(NSObject **)(v3 + 112);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        std::string::size_type v7 = *(long long **)(a1 + 56);
        if (*((char *)v7 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v19, *(const std::string::value_type **)v7, *((void *)v7 + 1));
        }
        else
        {
          long long v8 = *v7;
          v19.__r_.__value_.__r.__words[2] = *((void *)v7 + 2);
          *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v8;
        }
        if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          char v10 = &v19;
        }
        else {
          char v10 = (std::string *)v19.__r_.__value_.__r.__words[0];
        }
        long long v11 = (void *)(a1 + 72);
        if (*(char *)(a1 + 95) < 0) {
          long long v11 = (void *)*v11;
        }
        uint64_t SystemTime = TelephonyUtilGetSystemTime();
        *(_DWORD *)buf = 136315650;
        std::string::size_type v21 = v10;
        __int16 v22 = 2080;
        uint64_t v23 = v11;
        __int16 v24 = 2048;
        uint64_t v25 = SystemTime;
        _os_log_impl(&dword_21E069000, v6, OS_LOG_TYPE_DEFAULT, "#I %s responded to %s at %llu", buf, 0x20u);
        if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v19.__r_.__value_.__l.__data_);
        }
      }
      if ((**(unsigned int (***)(uint64_t, uint64_t))(v3 + 80))(v3 + 80, 40))
      {
        uint64_t v13 = *(long long **)(a1 + 56);
        if (*((char *)v13 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v19, *(const std::string::value_type **)v13, *((void *)v13 + 1));
        }
        else
        {
          long long v14 = *v13;
          v19.__r_.__value_.__r.__words[2] = *((void *)v13 + 2);
          *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v14;
        }
        if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          xpc_object_t v15 = &v19;
        }
        else {
          xpc_object_t v15 = (std::string *)v19.__r_.__value_.__r.__words[0];
        }
        BOOL v16 = (void *)(a1 + 72);
        if (*(char *)(a1 + 95) < 0) {
          BOOL v16 = (void *)*v16;
        }
        uint64_t v17 = TelephonyUtilGetSystemTime();
        ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"%s responded to %s at %llu", v18, v15, v16, v17);
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
        MEMORY[0x223C1F270](buf);
        if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v19.__r_.__value_.__l.__data_);
        }
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 96));
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  else
  {
    std::string::size_type v9 = *(NSObject **)(a1 + 96);
    dispatch_group_leave(v9);
  }
}

void sub_21E070AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcServerEEE56c39_ZTSN12TelephonyXPC17ServerClientStateE72c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(std::string *a1, uint64_t a2)
{
  std::string::size_type v3 = *(void *)(a2 + 48);
  a1[1].__r_.__value_.__r.__words[2] = *(void *)(a2 + 40);
  a1[2].__r_.__value_.__r.__words[0] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  std::string::size_type v4 = *(void *)(a2 + 64);
  a1[2].__r_.__value_.__l.__size_ = *(void *)(a2 + 56);
  a1[2].__r_.__value_.__r.__words[2] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  xpc_object_t v5 = a1 + 3;
  if (*(char *)(a2 + 95) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a2 + 72), *(void *)(a2 + 80));
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 72);
    a1[3].__r_.__value_.__r.__words[2] = *(void *)(a2 + 88);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
}

void sub_21E070BA8(_Unwind_Exception *exception_object)
{
  std::string::size_type v3 = *(std::__shared_weak_count **)(v1 + 64);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  std::string::size_type v4 = *(std::__shared_weak_count **)(v1 + 48);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcServerEEE56c39_ZTSN12TelephonyXPC17ServerClientStateE72c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  std::string::size_type v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
  }
}

uint64_t std::pair<xpc::connection const,TelephonyXPC::ServerClientState>::~pair(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 16);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  xpc_release(*(xpc_object_t *)a1);
  *(void *)a1 = 0;
  return a1;
}

void ___ZN12TelephonyXPC6Server5State9broadcastENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN3xpc4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke_45(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    std::string::size_type v4 = std::__shared_weak_count::lock(v2);
    if (v4 && *(void *)(a1 + 40))
    {
      xpc_object_t v5 = (unsigned int (***)(void, uint64_t))(v3 + 80);
      long long v6 = *(NSObject **)(v3 + 112);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        std::string::size_type v7 = (void *)(a1 + 56);
        if (*(char *)(a1 + 79) < 0) {
          std::string::size_type v7 = (void *)*v7;
        }
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v7;
        _os_log_impl(&dword_21E069000, v6, OS_LOG_TYPE_DEFAULT, "#I All clients responded to %s", (uint8_t *)&buf, 0xCu);
      }
      if ((**v5)(v5, 40))
      {
        std::string::size_type v9 = (void *)(a1 + 56);
        if (*(char *)(a1 + 79) < 0) {
          std::string::size_type v9 = (void *)*v9;
        }
        ctu::LogMessageBuffer::createWithFormat((uint64_t *)&buf, (ctu::LogMessageBuffer *)"All clients responded to %s", v8, v9);
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
        MEMORY[0x223C1F270](&buf);
      }
    }
  }
  else
  {
    std::string::size_type v4 = 0;
  }
  char v10 = *(const void **)(a1 + 80);
  if (v10) {
    long long v11 = _Block_copy(v10);
  }
  else {
    long long v11 = 0;
  }
  xpc_object_t v12 = *(NSObject **)(a1 + 88);
  *(void *)&long long buf = MEMORY[0x263EF8330];
  *((void *)&buf + 1) = 1174405120;
  xpc_object_t v15 = ___ZNK8dispatch8callbackIU13block_pointerFvvEEclIJEEEvDpT__block_invoke;
  BOOL v16 = &__block_descriptor_tmp_50;
  if (v11) {
    uint64_t v13 = _Block_copy(v11);
  }
  else {
    uint64_t v13 = 0;
  }
  aBlock = v13;
  dispatch_async(v12, &buf);
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v11) {
    _Block_release(v11);
  }
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

void __copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcServerEEE56c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE80c46_ZTSN8dispatch8callbackIU13block_pointerFvvEEE(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 48);
  a1[5] = *(void *)(a2 + 40);
  a1[6] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
  xpc_object_t v5 = (std::string *)(a1 + 7);
  if (*(char *)(a2 + 79) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a2 + 56), *(void *)(a2 + 64));
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 56);
    a1[9] = *(void *)(a2 + 72);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  std::string::size_type v7 = *(void **)(a2 + 80);
  if (v7) {
    std::string::size_type v7 = _Block_copy(v7);
  }
  long long v8 = *(NSObject **)(a2 + 88);
  a1[10] = v7;
  a1[11] = v8;
  if (v8)
  {
    dispatch_retain(v8);
  }
}

void sub_21E070F48(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 48);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcServerEEE56c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE80c46_ZTSN8dispatch8callbackIU13block_pointerFvvEEE(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 88);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 80);
  if (v3) {
    _Block_release(v3);
  }
  if (*(char *)(a1 + 79) < 0) {
    operator delete(*(void **)(a1 + 56));
  }
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 48);
  if (v4)
  {
    std::__shared_weak_count::__release_weak(v4);
  }
}

void __copy_helper_block_e8_40c15_ZTSN3xpc4dictE48c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE72c46_ZTSN8dispatch8callbackIU13block_pointerFvvEEE(std::string *a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 40);
  a1[1].__r_.__value_.__r.__words[2] = (std::string::size_type)v4;
  if (v4) {
    xpc_retain(v4);
  }
  else {
    a1[1].__r_.__value_.__r.__words[2] = (std::string::size_type)xpc_null_create();
  }
  xpc_object_t v5 = a1 + 2;
  if (*(char *)(a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a2 + 48), *(void *)(a2 + 56));
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 48);
    a1[2].__r_.__value_.__r.__words[2] = *(void *)(a2 + 64);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  std::string::size_type v7 = *(void **)(a2 + 72);
  if (v7) {
    std::string::size_type v7 = _Block_copy(v7);
  }
  long long v8 = *(NSObject **)(a2 + 80);
  a1[3].__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
  a1[3].__r_.__value_.__l.__size_ = (std::string::size_type)v8;
  if (v8)
  {
    dispatch_retain(v8);
  }
}

void sub_21E071088(_Unwind_Exception *a1)
{
  xpc::dict::~dict(v1);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_40c15_ZTSN3xpc4dictE48c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE72c46_ZTSN8dispatch8callbackIU13block_pointerFvvEEE(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 80);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 72);
  if (v3) {
    _Block_release(v3);
  }
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(void *)(a1 + 40) = 0;
}

uint64_t ___ZNK3ctu20SharedSynchronizableINS_9XpcServerEE15execute_wrappedEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __copy_helper_block_e8_32b40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcServerEEE(void *a1, uint64_t a2)
{
  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 7);
  uint64_t v4 = *(void *)(a2 + 48);
  a1[5] = *(void *)(a2 + 40);
  a1[6] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
}

void __destroy_helper_block_e8_32b40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcServerEEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *(const void **)(a1 + 32);
  _Block_object_dispose(v3, 7);
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvvEEclIJEEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void *__copy_helper_block_e8_32c43_ZTSN8dispatch5blockIU13block_pointerFvvEEE(uint64_t a1, uint64_t a2)
{
  xpc_object_t result = *(void **)(a2 + 32);
  if (result) {
    xpc_object_t result = _Block_copy(result);
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

void ___ZN12TelephonyXPC6Server5State17setCommandHandlerENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS_17ServerClientStateEN3xpc4dictENSA_IU13block_pointerFviSD_EEEEEE_block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 112);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (void *)(a1 + 40);
    if (*(char *)(a1 + 63) < 0) {
      uint64_t v4 = (void *)*v4;
    }
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_21E069000, v3, OS_LOG_TYPE_DEFAULT, "#I Registered command %s", (uint8_t *)&buf, 0xCu);
  }
  if ((**(unsigned int (***)(uint64_t, uint64_t))(v2 + 80))(v2 + 80, 40))
  {
    long long v6 = (void *)(a1 + 40);
    if (*(char *)(a1 + 63) < 0) {
      long long v6 = (void *)*v6;
    }
    ctu::LogMessageBuffer::createWithFormat((uint64_t *)&buf, (ctu::LogMessageBuffer *)"Registered command %s", v5, v6);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x223C1F270](&buf);
  }
  std::string::size_type v7 = *(uint64_t **)(v2 + 328);
  long long v8 = (uint64_t **)(v2 + 328);
  std::string::size_type v9 = (uint64_t **)(v2 + 328);
  if (!v7) {
    goto LABEL_18;
  }
  long long v8 = (uint64_t **)(v2 + 328);
  while (1)
  {
    while (1)
    {
      std::string::size_type v9 = (uint64_t **)v7;
      char v10 = v7 + 4;
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((void *)(a1 + 40), (void **)v7 + 4) & 0x80) == 0)break; {
      std::string::size_type v7 = *v9;
      }
      long long v8 = v9;
      if (!*v9) {
        goto LABEL_18;
      }
    }
    if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v10, (void **)(a1 + 40)) & 0x80) == 0) {
      break;
    }
    long long v8 = v9 + 1;
    std::string::size_type v7 = v9[1];
    if (!v7) {
      goto LABEL_18;
    }
  }
  long long v11 = *v8;
  if (!*v8)
  {
LABEL_18:
    unint64_t v20 = 0xAAAAAAAAAAAAAA00;
    xpc_object_t v12 = (uint64_t *)operator new(0x48uLL);
    *(void *)&long long buf = v12;
    *((void *)&buf + 1) = v2 + 328;
    uint64_t v13 = (std::string *)(v12 + 4);
    if (*(char *)(a1 + 63) < 0)
    {
      std::string::__init_copy_ctor_external(v13, *(const std::string::value_type **)(a1 + 40), *(void *)(a1 + 48));
    }
    else
    {
      *(_OWORD *)&v13->__r_.__value_.__l.__data_ = *(_OWORD *)(a1 + 40);
      v12[6] = *(void *)(a1 + 56);
    }
    v12[7] = 0;
    v12[8] = 0;
    LOBYTE(v20) = 1;
    uint64_t *v12 = 0;
    v12[1] = 0;
    v12[2] = (uint64_t)v9;
    NSObject *v8 = v12;
    uint64_t v14 = **(void **)(v2 + 320);
    if (v14)
    {
      *(void *)(v2 + 320) = v14;
      xpc_object_t v12 = *v8;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v2 + 328), v12);
    ++*(void *)(v2 + 336);
    long long v11 = (uint64_t *)buf;
    *(void *)&long long buf = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,void *>>>>::reset[abi:ne180100]((uint64_t)&buf);
  }
  xpc_object_t v15 = *(void **)(a1 + 64);
  if (v15) {
    xpc_object_t v15 = _Block_copy(v15);
  }
  BOOL v16 = (const void *)v11[7];
  v11[7] = (uint64_t)v15;
  if (v16) {
    _Block_release(v16);
  }
  uint64_t v17 = *(NSObject **)(a1 + 72);
  if (v17) {
    dispatch_retain(v17);
  }
  uint64_t v18 = v11[8];
  v11[8] = (uint64_t)v17;
  if (v18) {
    dispatch_release(v18);
  }
}

void sub_21E07148C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,void *>>>>::reset[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c121_ZTSN8dispatch8callbackIU13block_pointerFvN12TelephonyXPC17ServerClientStateEN3xpc4dictENS0_IU13block_pointerFviS4_EEEEEE(uint64_t a1, uint64_t a2)
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
  long long v6 = *(void **)(a2 + 64);
  if (v6) {
    long long v6 = _Block_copy(v6);
  }
  std::string::size_type v7 = *(NSObject **)(a2 + 72);
  *(void *)(a1 + 64) = v6;
  *(void *)(a1 + 72) = v7;
  if (v7)
  {
    dispatch_retain(v7);
  }
}

void __destroy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c121_ZTSN8dispatch8callbackIU13block_pointerFvN12TelephonyXPC17ServerClientStateEN3xpc4dictENS0_IU13block_pointerFviS4_EEEEEE(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 72);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 64);
  if (v3) {
    _Block_release(v3);
  }
  if (*(char *)(a1 + 63) < 0)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    operator delete(v4);
  }
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, void **a2)
{
  size_t v2 = *((unsigned __int8 *)a1 + 23);
  size_t v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (void *)*a1;
    size_t v2 = v3;
  }
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    long long v5 = a2;
  }
  else {
    long long v5 = *a2;
  }
  if (v4 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  return std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(a1, v2, v5, v6);
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(const void *a1, size_t a2, void *__s2, size_t a4)
{
  if (a4 >= a2) {
    size_t v7 = a2;
  }
  else {
    size_t v7 = a4;
  }
  int v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0) {
      return 1;
    }
  }
  else
  {
    if (a2 == a4) {
      return 0;
    }
    if (a2 >= a4) {
      return 1;
    }
  }
  return 255;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      size_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      size_t v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), long long v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            std::string::size_type v9 = (uint64_t **)a2[2];
          }
          else
          {
            std::string::size_type v9 = (uint64_t **)v2[1];
            char v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              void v10[2] = (uint64_t)v2;
              size_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            void *v9 = v2;
            v2[2] = (uint64_t)v9;
            size_t v3 = v9[2];
            size_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), long long v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            size_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          size_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        size_t v2 = (uint64_t *)v3[1];
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
      *long long v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,0>((uint64_t)v1 + 32);
    }
    operator delete(v1);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,0>(uint64_t a1)
{
  size_t v2 = *(NSObject **)(a1 + 32);
  if (v2) {
    dispatch_release(v2);
  }
  size_t v3 = *(const void **)(a1 + 24);
  if (v3) {
    _Block_release(v3);
  }
  if (*(char *)(a1 + 23) < 0)
  {
    int v4 = *(void **)a1;
    operator delete(v4);
  }
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
    int v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    int v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void ___ZN12TelephonyXPC6Server5State20handleNewClient_syncEN3xpc10connectionE_block_invoke(uint64_t a1, void **a2, void **a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  size_t v5 = *a2;
  xpc_object_t v8 = v5;
  if (v5) {
    xpc_retain(v5);
  }
  else {
    xpc_object_t v8 = xpc_null_create();
  }
  int v6 = *a3;
  xpc_object_t object = v6;
  if (v6) {
    xpc_retain(v6);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  TelephonyXPC::Server::State::handleMessage_sync(v4, &v8, (xpc::object *)&object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v8);
}

void sub_21E0719EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, xpc_object_t a10)
{
}

void TelephonyXPC::Server::State::handleMessage_sync(uint64_t a1, xpc_object_t *a2, xpc::object *a3)
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  unint64_t v96 = 0xAAAAAAAAAAAAAAAALL;
  v97 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v6 = *a2;
  if (*a2) {
    xpc_retain(*a2);
  }
  else {
    xpc_object_t v6 = xpc_null_create();
  }
  TelephonyXPC::Server::State::getClientState_sync(&v96, a1, (unint64_t)v6);
  xpc_release(v6);
  unint64_t v7 = v96;
  xpc_object_t v8 = (unsigned int (***)(uint64_t, uint64_t))(a1 + 80);
  std::string::size_type v9 = *(NSObject **)(a1 + 112);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v10)
    {
      if (*(char *)(v7 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&block, *(const std::string::value_type **)v7, *(void *)(v7 + 8));
      }
      else
      {
        long long v35 = *(_OWORD *)v7;
        block.__r_.__value_.__r.__words[2] = *(void *)(v7 + 16);
        *(_OWORD *)&block.__r_.__value_.__l.__data_ = v35;
      }
      int v36 = SHIBYTE(block.__r_.__value_.__r.__words[2]);
      std::string::size_type v37 = block.__r_.__value_.__r.__words[0];
      xpc::object::to_string((uint64_t *)&aBlock, a3);
      p_std::string block = &block;
      if (v36 < 0) {
        p_std::string block = (std::string *)v37;
      }
      if ((aBlock.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_std::string aBlock = &aBlock;
      }
      else {
        p_std::string aBlock = (std::string *)aBlock.__r_.__value_.__r.__words[0];
      }
      LODWORD(__p[0]) = 136315394;
      *(void **)((char *)__p + 4) = p_block;
      WORD2(__p[1]) = 2080;
      *(void **)((char *)&__p[1] + 6) = p_aBlock;
      _os_log_debug_impl(&dword_21E069000, v9, OS_LOG_TYPE_DEBUG, "#D Got message from %s of %s", (uint8_t *)__p, 0x16u);
      if (SHIBYTE(aBlock.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(aBlock.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(block.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(block.__r_.__value_.__l.__data_);
      }
    }
    if ((**v8)(a1 + 80, 20))
    {
      if (*(char *)(v7 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&aBlock, *(const std::string::value_type **)v7, *(void *)(v7 + 8));
      }
      else
      {
        long long v11 = *(_OWORD *)v7;
        aBlock.__r_.__value_.__r.__words[2] = *(void *)(v7 + 16);
        *(_OWORD *)&aBlock.__r_.__value_.__l.__data_ = v11;
      }
      int v17 = SHIBYTE(aBlock.__r_.__value_.__r.__words[2]);
      std::string::size_type v18 = aBlock.__r_.__value_.__r.__words[0];
      xpc::object::to_string((uint64_t *)__p, a3);
      xpc_object_t v15 = &aBlock;
      if (v17 < 0) {
        xpc_object_t v15 = (std::string *)v18;
      }
      if (SHIBYTE(__p[2]) >= 0) {
        BOOL v16 = __p;
      }
      else {
        BOOL v16 = (void **)__p[0];
      }
LABEL_22:
      ctu::LogMessageBuffer::createWithFormat((uint64_t *)&block, (ctu::LogMessageBuffer *)"Got message from %s of %s", v14, v15, v16);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x223C1F270](&block);
      if (SHIBYTE(__p[2]) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(aBlock.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(aBlock.__r_.__value_.__l.__data_);
      }
    }
  }
  else
  {
    if (v10)
    {
      xpc::object::to_string((uint64_t *)&block, (xpc::object *)a2);
      int v31 = SHIBYTE(block.__r_.__value_.__r.__words[2]);
      std::string::size_type v32 = block.__r_.__value_.__r.__words[0];
      xpc::object::to_string((uint64_t *)&aBlock, a3);
      uint64_t v33 = &block;
      if (v31 < 0) {
        uint64_t v33 = (std::string *)v32;
      }
      if ((aBlock.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        BOOL v34 = &aBlock;
      }
      else {
        BOOL v34 = (std::string *)aBlock.__r_.__value_.__r.__words[0];
      }
      LODWORD(__p[0]) = 136315394;
      *(void **)((char *)__p + 4) = v33;
      WORD2(__p[1]) = 2080;
      *(void **)((char *)&__p[1] + 6) = v34;
      _os_log_debug_impl(&dword_21E069000, v9, OS_LOG_TYPE_DEBUG, "#D Got message from %s of %s", (uint8_t *)__p, 0x16u);
      if (SHIBYTE(aBlock.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(aBlock.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(block.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(block.__r_.__value_.__l.__data_);
      }
    }
    if ((**v8)(a1 + 80, 20))
    {
      xpc::object::to_string((uint64_t *)&aBlock, (xpc::object *)a2);
      int v12 = SHIBYTE(aBlock.__r_.__value_.__r.__words[2]);
      std::string::size_type v13 = aBlock.__r_.__value_.__r.__words[0];
      xpc::object::to_string((uint64_t *)__p, a3);
      xpc_object_t v15 = &aBlock;
      if (v12 < 0) {
        xpc_object_t v15 = (std::string *)v13;
      }
      if (SHIBYTE(__p[2]) >= 0) {
        BOOL v16 = __p;
      }
      else {
        BOOL v16 = (void **)__p[0];
      }
      goto LABEL_22;
    }
  }
  xpc_object_t v19 = *(xpc_object_t *)a3;
  if (v19) {
    xpc_retain(v19);
  }
  else {
    xpc_object_t v19 = xpc_null_create();
  }
  uint64_t v20 = MEMORY[0x223C1F7A0](v19);
  uint64_t v21 = MEMORY[0x263EF8708];
  if (v20 != MEMORY[0x263EF8708]) {
    goto LABEL_137;
  }
  xpc_object_t v22 = *a2;
  if (*a2) {
    xpc_retain(*a2);
  }
  else {
    xpc_object_t v22 = xpc_null_create();
  }
  memset(__p, 170, 24);
  xpc::dict::object_proxy::operator xpc::object(&aBlock, v19, "command");
  memset(&block, 0, sizeof(block));
  xpc::dyn_cast_or_default();
  if (SHIBYTE(block.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(block.__r_.__value_.__l.__data_);
  }
  xpc_release(aBlock.__r_.__value_.__l.__data_);
  uint64_t v23 = *(void **)(a1 + 328);
  if (!v23) {
    goto LABEL_47;
  }
  uint64_t v24 = a1 + 328;
  do
  {
    char v25 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v23 + 4, __p);
    if (v25 >= 0) {
      uint64_t v26 = v23;
    }
    else {
      uint64_t v26 = v23 + 1;
    }
    if (v25 >= 0) {
      uint64_t v24 = (uint64_t)v23;
    }
    uint64_t v23 = (void *)*v26;
  }
  while (*v26);
  if (v24 == a1 + 328)
  {
LABEL_47:
    uint64_t v21 = MEMORY[0x263EF8708];
  }
  else
  {
    char v27 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(__p, (void **)(v24 + 32));
    uint64_t v21 = MEMORY[0x263EF8708];
    if ((v27 & 0x80) == 0)
    {
      v100.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
      v100.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
      if (v22)
      {
        xpc_retain(v22);
        xpc_object_t v28 = v22;
      }
      else
      {
        xpc_object_t v28 = xpc_null_create();
      }
      TelephonyXPC::Server::State::getClientState_sync(&v100, a1, (unint64_t)v28);
      xpc_release(v28);
      xpc_object_t reply = xpc_dictionary_create_reply(v19);
      if (reply || (xpc_object_t reply = xpc_null_create()) != 0)
      {
        if (MEMORY[0x223C1F7A0](reply) == v21)
        {
          xpc_retain(reply);
          xpc_object_t v30 = reply;
        }
        else
        {
          xpc_object_t v30 = xpc_null_create();
        }
      }
      else
      {
        xpc_object_t v30 = xpc_null_create();
        xpc_object_t reply = 0;
      }
      xpc_release(reply);
      v98 = (void *)0xAAAAAAAAAAAAAAAALL;
      dispatch_object_t v99 = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
      aBlock.__r_.__value_.__r.__words[0] = MEMORY[0x263EF8330];
      aBlock.__r_.__value_.__l.__size_ = 1174405120;
      aBlock.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZN12TelephonyXPC6Server5State24handlePublicMessage_syncEN3xpc10connectionERNS2_4dictE_block_invoke;
      v107 = &__block_descriptor_tmp_61;
      xpc_object_t v108 = v30;
      if (v30) {
        xpc_retain(v30);
      }
      else {
        xpc_object_t v108 = xpc_null_create();
      }
      xpc_object_t object = v22;
      if (v22) {
        xpc_retain(v22);
      }
      else {
        xpc_object_t object = xpc_null_create();
      }
      v94 = _Block_copy(&aBlock);
      xpc_object_t v40 = *(NSObject **)(a1 + 24);
      if (v40) {
        dispatch_retain(*(dispatch_object_t *)(a1 + 24));
      }
      v98 = v94;
      dispatch_object_t v99 = v40;
      qos_class_t qos_class = qos_class_self();
      long long v41 = *(_OWORD *)&v100.__r_.__value_.__l.__data_;
      if (v100.__r_.__value_.__l.__size_) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v100.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
      }
      if (v19)
      {
        xpc_retain(v19);
        xpc_object_t v93 = v19;
      }
      else
      {
        xpc_object_t v93 = xpc_null_create();
      }
      if (v94)
      {
        v92 = _Block_copy(v94);
        if (!v40) {
          goto LABEL_92;
        }
      }
      else
      {
        v92 = 0;
        if (!v40)
        {
LABEL_92:
          BOOL v42 = *(const void **)(v24 + 56);
          if (v42) {
            uint64_t v43 = _Block_copy(v42);
          }
          else {
            uint64_t v43 = 0;
          }
          block.__r_.__value_.__r.__words[0] = MEMORY[0x263EF8330];
          block.__r_.__value_.__l.__size_ = 1174405120;
          block.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC17ServerClientStateEN3xpc4dictENS0_IU13block_pointerFviS4_EEEEEclIJS2_S4_S7_EEEv11qos_class_tDpT__block_invoke;
          v113 = &__block_descriptor_tmp_62;
          if (v43) {
            v44 = _Block_copy(v43);
          }
          else {
            v44 = 0;
          }
          v114 = v44;
          *(_OWORD *)v115 = v41;
          if (*((void *)&v41 + 1)) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v41 + 1) + 8), 1uLL, memory_order_relaxed);
          }
          *(void *)&v115[16] = v93;
          if (v93)
          {
            xpc_retain(v93);
            if (v92)
            {
LABEL_104:
              xpc_object_t v45 = _Block_copy(v92);
LABEL_107:
              *(void *)&v115[24] = v45;
              dispatch_object_t v116 = v40;
              if (v40) {
                dispatch_retain(v40);
              }
              dispatch_block_t v46 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, qos_class, 0, &block);
              dispatch_async(*(dispatch_queue_t *)(v24 + 64), v46);
              if (v46) {
                _Block_release(v46);
              }
              if (v116) {
                dispatch_release(v116);
              }
              if (*(void *)&v115[24]) {
                _Block_release(*(const void **)&v115[24]);
              }
              xpc_release(*(xpc_object_t *)&v115[16]);
              *(void *)&v115[16] = 0;
              if (*(void *)&v115[8]) {
                std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v115[8]);
              }
              if (v114) {
                _Block_release(v114);
              }
              if (v43) {
                _Block_release(v43);
              }
              if (v40) {
                dispatch_release(v40);
              }
              if (v92) {
                _Block_release(v92);
              }
              xpc_release(v93);
              if (*((void *)&v41 + 1)) {
                std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v41 + 1));
              }
              xpc_object_t v47 = xpc_null_create();
              xpc_object_t v48 = xpc_null_create();
              xpc_release(v19);
              xpc_release(v48);
              if (v40) {
                dispatch_release(v40);
              }
              if (v94) {
                _Block_release(v94);
              }
              xpc_release(object);
              uint64_t v21 = MEMORY[0x263EF8708];
              xpc_object_t object = 0;
              xpc_release(v108);
              xpc_object_t v108 = 0;
              xpc_release(v30);
              if (v100.__r_.__value_.__l.__size_) {
                std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v100.__r_.__value_.__l.__size_);
              }
              xpc_object_t v19 = v47;
              goto LABEL_134;
            }
          }
          else
          {
            *(void *)&v115[16] = xpc_null_create();
            if (v92) {
              goto LABEL_104;
            }
          }
          xpc_object_t v45 = 0;
          goto LABEL_107;
        }
      }
      dispatch_retain(v40);
      goto LABEL_92;
    }
  }
LABEL_134:
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  xpc_release(v22);
LABEL_137:
  if (MEMORY[0x223C1F7A0](v19) != v21) {
    goto LABEL_188;
  }
  unint64_t v49 = *a2;
  if (v49) {
    xpc_retain(v49);
  }
  else {
    unint64_t v49 = xpc_null_create();
  }
  memset(__p, 170, 24);
  xpc::dict::object_proxy::operator xpc::object(&aBlock, v19, "command");
  memset(&block, 0, sizeof(block));
  xpc::dyn_cast_or_default();
  if (SHIBYTE(block.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(block.__r_.__value_.__l.__data_);
  }
  xpc_release(aBlock.__r_.__value_.__l.__data_);
  char v50 = (void *)HIBYTE(__p[2]);
  char v51 = HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) < 0) {
    char v50 = __p[1];
  }
  if (v50)
  {
    xpc_object_t v52 = xpc_dictionary_create_reply(v19);
    if (v52 || (xpc_object_t v52 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x223C1F7A0](v52) == v21)
      {
        xpc_retain(v52);
        xpc_object_t v53 = v52;
      }
      else
      {
        xpc_object_t v53 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v53 = xpc_null_create();
      xpc_object_t v52 = 0;
    }
    xpc_release(v52);
    std::string v54 = (void *)HIBYTE(__p[2]);
    if (SHIBYTE(__p[2]) < 0) {
      std::string v54 = __p[1];
    }
    if (v54 == (void *)9)
    {
      xpc_object_t v63 = __p;
      if (SHIBYTE(__p[2]) < 0) {
        xpc_object_t v63 = (void **)__p[0];
      }
      xpc_object_t v64 = *v63;
      uint64_t v65 = *((unsigned __int8 *)v63 + 8);
      if (v64 != *(void **)"eventsOff" || v65 != str_11[8]) {
        goto LABEL_183;
      }
      block.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
      xpc::dict::object_proxy::operator xpc::object(&v100, v19, "eventList");
      xpc::bridge();
      ctu::cf::CFSharedRef<__CFArray const>::CFSharedRef<void const,void>(&block, aBlock.__r_.__value_.__l.__data_);
      ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&aBlock.__r_.__value_.__l.__data_);
      xpc_release(v100.__r_.__value_.__l.__data_);
      if (block.__r_.__value_.__r.__words[0]) {
        xpc_object_t v68 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
      }
      else {
        xpc_object_t v68 = 0;
      }
      if (v68)
      {
        if (v49)
        {
          xpc_retain(v49);
          xpc_object_t v69 = v49;
        }
        else
        {
          xpc_object_t v69 = xpc_null_create();
        }
        std::string::size_type v105 = block.__r_.__value_.__r.__words[0];
        if (block.__r_.__value_.__r.__words[0]) {
          CFRetain(block.__r_.__value_.__l.__data_);
        }
        TelephonyXPC::Server::State::registerNotification((void *)a1, v69, 0, (const void **)&v105);
        ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&v105);
        xpc_release(v69);
        uint64_t v70 = 0;
        goto LABEL_214;
      }
    }
    else
    {
      if (v54 != (void *)8)
      {
        if (v54 != (void *)7) {
          goto LABEL_183;
        }
        std::string v55 = __p;
        if (SHIBYTE(__p[2]) < 0) {
          std::string v55 = (void **)__p[0];
        }
        int v56 = *(_DWORD *)v55;
        int v57 = *(_DWORD *)((char *)v55 + 3);
        if (v56 != *(_DWORD *)"checkIn" || v57 != *(_DWORD *)"ckIn")
        {
LABEL_183:
          xpc_object_t v67 = v19;
LABEL_184:
          xpc_release(v53);
          char v51 = HIBYTE(__p[2]);
          xpc_object_t v19 = v67;
          goto LABEL_185;
        }
        memset(&aBlock, 170, sizeof(aBlock));
        xpc::dict::object_proxy::operator xpc::object(&v100, v19, "clientName");
        memset(&block, 0, sizeof(block));
        xpc::dyn_cast_or_default();
        if (SHIBYTE(block.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(block.__r_.__value_.__l.__data_);
        }
        xpc_release(v100.__r_.__value_.__l.__data_);
        block.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
        block.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
        if (v49)
        {
          xpc_retain(v49);
          xpc_object_t v59 = v49;
        }
        else
        {
          xpc_object_t v59 = xpc_null_create();
        }
        TelephonyXPC::Server::State::getClientState_sync(&block, a1, (unint64_t)v59);
        xpc_release(v59);
        std::string::size_type v71 = block.__r_.__value_.__r.__words[0];
        if (block.__r_.__value_.__r.__words[0])
        {
          std::string::operator=((std::string *)block.__r_.__value_.__l.__data_, &aBlock);
          *(unsigned char *)(v71 + 24) = 1;
        }
        if (block.__r_.__value_.__l.__size_) {
          std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)block.__r_.__value_.__l.__size_);
        }
        if (SHIBYTE(aBlock.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(aBlock.__r_.__value_.__l.__data_);
        }
        uint64_t v70 = 0;
LABEL_215:
        xpc_object_t v103 = xpc_int64_create((int)v70);
        if (!v103) {
          xpc_object_t v103 = xpc_null_create();
        }
        xpc::dict::object_proxy::operator=(&v104, v53, "commandResult", &v103);
        xpc_release(v104);
        xpc_object_t v104 = 0;
        xpc_release(v103);
        xpc_object_t v103 = 0;
        v72 = *(NSObject **)(a1 + 112);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        {
          v80 = __p;
          if (SHIBYTE(__p[2]) < 0) {
            v80 = (void **)__p[0];
          }
          LODWORD(block.__r_.__value_.__l.__data_) = 136315394;
          *(std::string::size_type *)((char *)block.__r_.__value_.__r.__words + 4) = (std::string::size_type)v80;
          WORD2(block.__r_.__value_.__r.__words[1]) = 1024;
          *(_DWORD *)((char *)&block.__r_.__value_.__r.__words[1] + 6) = v70;
          _os_log_debug_impl(&dword_21E069000, v72, OS_LOG_TYPE_DEBUG, "#D Replying to client's command: %s, with return code: %d", (uint8_t *)&block, 0x12u);
        }
        if ((**v8)(a1 + 80, 20))
        {
          uint64_t v74 = __p;
          if (SHIBYTE(__p[2]) < 0) {
            uint64_t v74 = (void **)__p[0];
          }
          ctu::LogMessageBuffer::createWithFormat((uint64_t *)&block, (ctu::LogMessageBuffer *)"Replying to client's command: %s, with return code: %d", v73, v74, v70);
          ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
          MEMORY[0x223C1F270](&block);
        }
        xpc_connection_send_message((xpc_connection_t)v49, v53);
        xpc_object_t v67 = xpc_null_create();
        xpc_object_t v75 = xpc_null_create();
        xpc_release(v19);
        xpc_release(v75);
        v76 = (void *)HIBYTE(__p[2]);
        if (SHIBYTE(__p[2]) < 0) {
          v76 = __p[1];
        }
        if (v76 == (void *)8)
        {
          v77 = __p;
          if (SHIBYTE(__p[2]) < 0) {
            v77 = (void **)__p[0];
          }
          if (*v77 == *(void **)"eventsOn" && *(_DWORD *)(a1 + 232) == 1)
          {
            xpc_object_t v78 = xpc_dictionary_create(0, 0, 0);
            if (v78 || (xpc_object_t v78 = xpc_null_create()) != 0)
            {
              if (MEMORY[0x223C1F7A0](v78) == v21)
              {
                xpc_retain(v78);
                xpc_object_t v79 = v78;
              }
              else
              {
                xpc_object_t v79 = xpc_null_create();
              }
            }
            else
            {
              xpc_object_t v79 = xpc_null_create();
              xpc_object_t v78 = 0;
            }
            xpc_release(v78);
            xpc_object_t v101 = xpc_string_create("ServerStateStarted");
            if (!v101) {
              xpc_object_t v101 = xpc_null_create();
            }
            xpc::dict::object_proxy::operator=(&v102, v79, "KeyServerState", &v101);
            xpc_release(v102);
            xpc_object_t v102 = 0;
            xpc_release(v101);
            xpc_object_t v101 = 0;
            if (v49)
            {
              xpc_retain(v49);
              v81 = v49;
            }
            else
            {
              v81 = xpc_null_create();
            }
            std::string::basic_string[abi:ne180100]<0>(&v100, "EventServerStateChange");
            if (v79)
            {
              xpc_retain(v79);
              xpc_object_t v82 = v79;
            }
            else
            {
              xpc_object_t v82 = xpc_null_create();
            }
            v98 = 0;
            dispatch_object_t v99 = 0;
            block.__r_.__value_.__r.__words[0] = MEMORY[0x263EF8330];
            block.__r_.__value_.__l.__size_ = 1174405120;
            block.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZN12TelephonyXPC6Server5State7unicastEN3xpc10connectionENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS2_4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke;
            v113 = &__block_descriptor_tmp_73;
            v114 = (const void *)a1;
            *(void *)v115 = v82;
            if (v82) {
              xpc_retain(v82);
            }
            else {
              *(void *)v115 = xpc_null_create();
            }
            if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0) {
              std::string::__init_copy_ctor_external((std::string *)&v115[8], v100.__r_.__value_.__l.__data_, v100.__r_.__value_.__l.__size_);
            }
            else {
              *(std::string *)&v115[8] = v100;
            }
            dispatch_object_t v116 = v81;
            if (v81) {
              xpc_retain(v81);
            }
            else {
              dispatch_object_t v116 = (dispatch_object_t)xpc_null_create();
            }
            v83 = v98;
            v95 = v79;
            if (v98) {
              v84 = _Block_copy(v98);
            }
            else {
              v84 = 0;
            }
            v85 = v99;
            v117 = v84;
            dispatch_object_t v118 = v99;
            if (v99) {
              dispatch_retain(v99);
            }
            v86 = *(std::__shared_weak_count **)(a1 + 16);
            if (!v86 || (v87 = *(void **)(a1 + 8), (v88 = std::__shared_weak_count::lock(v86)) == 0)) {
              std::__throw_bad_weak_ptr[abi:ne180100]();
            }
            v89 = v88;
            v90 = *(NSObject **)(a1 + 24);
            aBlock.__r_.__value_.__r.__words[0] = MEMORY[0x263EF8330];
            aBlock.__r_.__value_.__l.__size_ = 1174405120;
            aBlock.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZNK3ctu20SharedSynchronizableINS_9XpcServerEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
            v107 = &__block_descriptor_tmp_49;
            xpc_object_t object = v87;
            v110 = v89;
            atomic_fetch_add_explicit(&v89->__shared_owners_, 1uLL, memory_order_relaxed);
            xpc_object_t v108 = &block;
            dispatch_async(v90, &aBlock);
            if (v110) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v110);
            }
            std::__shared_weak_count::__release_shared[abi:ne180100](v89);
            if (v118) {
              dispatch_release(v118);
            }
            if (v117) {
              _Block_release(v117);
            }
            xpc_release(v116);
            dispatch_object_t v116 = 0;
            if ((v115[31] & 0x80000000) != 0) {
              operator delete(*(void **)&v115[8]);
            }
            xpc_release(*(xpc_object_t *)v115);
            if (v85) {
              dispatch_release(v85);
            }
            if (v83) {
              _Block_release(v83);
            }
            xpc_release(v82);
            if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v100.__r_.__value_.__l.__data_);
            }
            xpc_release(v81);
            xpc_release(v95);
          }
        }
        goto LABEL_184;
      }
      xpc_object_t v60 = __p;
      if (SHIBYTE(__p[2]) < 0) {
        xpc_object_t v60 = (void **)__p[0];
      }
      if (*v60 != *(void **)"eventsOn") {
        goto LABEL_183;
      }
      block.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
      xpc::dict::object_proxy::operator xpc::object(&v100, v19, "eventList");
      xpc::bridge();
      ctu::cf::CFSharedRef<__CFArray const>::CFSharedRef<void const,void>(&block, aBlock.__r_.__value_.__l.__data_);
      ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&aBlock.__r_.__value_.__l.__data_);
      xpc_release(v100.__r_.__value_.__l.__data_);
      if (block.__r_.__value_.__r.__words[0]) {
        unint64_t v61 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
      }
      else {
        unint64_t v61 = 0;
      }
      if (v61)
      {
        if (v49)
        {
          xpc_retain(v49);
          xpc_object_t v62 = v49;
        }
        else
        {
          xpc_object_t v62 = xpc_null_create();
        }
        std::string::size_type v105 = block.__r_.__value_.__r.__words[0];
        if (block.__r_.__value_.__r.__words[0]) {
          CFRetain(block.__r_.__value_.__l.__data_);
        }
        TelephonyXPC::Server::State::registerNotification((void *)a1, v62, 1, (const void **)&v105);
        ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&v105);
        xpc_release(v62);
        uint64_t v70 = 0;
        goto LABEL_214;
      }
    }
    uint64_t v70 = 3760250882;
LABEL_214:
    ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&block.__r_.__value_.__l.__data_);
    goto LABEL_215;
  }
LABEL_185:
  if (v51 < 0) {
    operator delete(__p[0]);
  }
  xpc_release(v49);
LABEL_188:
  xpc_release(v19);
  if (v97) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v97);
  }
}

void sub_21E072B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18, char a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,xpc_object_t a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,uint64_t a38,xpc_object_t a39,xpc_object_t object,uint64_t a41,uint64_t a42,void *a43,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  xpc_release(*(xpc_object_t *)(v54 - 184));
  dispatch::callback<void({block_pointer})(void)>::~callback((uint64_t)&a19);
  xpc_release(v53);
  if (a26 < 0) {
    operator delete(__p);
  }
  xpc_release(v52);
  xpc_release(v49);
  xpc_release(v51);
  if (a48 < 0) {
    operator delete(a43);
  }
  xpc_release(v50);
  xpc_release(v48);
  if (a18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a18);
  }
  _Unwind_Resume(a1);
}

void xpc::connection::to_debug_string(xpc::connection *this, uint64_t a2)
{
  size_t v3 = (char *)MEMORY[0x223C1F740](a2);
  memset(this, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(this, v3);
  free(v3);
}

xpc_object_t *xpc::array::iterator::iterator(xpc_object_t *a1, xpc_object_t object, void *a3)
{
  *a1 = object;
  if (object) {
    xpc_retain(object);
  }
  else {
    *a1 = xpc_null_create();
  }
  a1[1] = a3;
  return a1;
}

uint64_t *std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>(uint64_t **a1, void **a2, uint64_t a3)
{
  uint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  size_t v5 = (uint64_t **)std::__tree<std::string>::__find_equal<std::string>((uint64_t)a1, &v8, a2);
  xpc_object_t result = *v5;
  if (!*v5)
  {
    memset(v7, 170, sizeof(v7));
    std::__tree<std::string>::__construct_node<std::string const&>((uint64_t)a1, a3, v7);
    std::__tree<std::string>::__insert_node_at(a1, v8, v5, v7[0]);
    return v7[0];
  }
  return result;
}

void *std::__tree<std::string>::__find_equal<std::string>(uint64_t a1, void *a2, void **a3)
{
  size_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        unint64_t v7 = v4;
        uint64_t v8 = v4 + 4;
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a3, (void **)v4 + 4) & 0x80) == 0) {
          break;
        }
        uint64_t v4 = (void *)*v7;
        size_t v5 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v8, a3) & 0x80) == 0) {
        break;
      }
      size_t v5 = v7 + 1;
      uint64_t v4 = (void *)v7[1];
    }
    while (v4);
  }
  else
  {
    unint64_t v7 = (void *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

void std::__tree<std::string>::__construct_node<std::string const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  memset(a3, 170, 24);
  xpc_object_t v6 = (char *)operator new(0x38uLL);
  *a3 = v6;
  a3[1] = v5;
  *((unsigned char *)a3 + 16) = 0;
  unint64_t v7 = (std::string *)(v6 + 32);
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    v7->__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
  }
  *((unsigned char *)a3 + 16) = 1;
}

void sub_21E0731A8(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::string,void *>>>::operator()[abi:ne180100](v2, v3);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::string>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  xpc_object_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::string,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 55) < 0) {
      operator delete(__p[4]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t *std::set<std::string>::set[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::set<std::string>::insert[abi:ne180100]<std::__tree_const_iterator<std::string,std::__tree_node<std::string,void *> *,long>>(a1, *(void ***)a2, (void **)(a2 + 8));
  return a1;
}

void sub_21E0732BC(_Unwind_Exception *a1)
{
  std::__tree<std::string>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::set<std::string>::insert[abi:ne180100]<std::__tree_const_iterator<std::string,std::__tree_node<std::string,void *> *,long>>(uint64_t *result, void **a2, void **a3)
{
  if (a2 != a3)
  {
    uint64_t v4 = a2;
    uint64_t v5 = (uint64_t **)result;
    uint64_t v6 = (uint64_t)(result + 1);
    do
    {
      xpc_object_t result = std::__tree<std::string>::__emplace_hint_unique_key_args<std::string,std::string const&>(v5, v6, v4 + 4, (uint64_t)(v4 + 4));
      unint64_t v7 = (void **)v4[1];
      if (v7)
      {
        do
        {
          uint64_t v8 = v7;
          unint64_t v7 = (void **)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          uint64_t v8 = (void **)v4[2];
          BOOL v9 = *v8 == v4;
          uint64_t v4 = v8;
        }
        while (!v9);
      }
      uint64_t v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::string>::__emplace_hint_unique_key_args<std::string,std::string const&>(uint64_t **a1, uint64_t a2, void **a3, uint64_t a4)
{
  uint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  BOOL v10 = (void **)0xAAAAAAAAAAAAAAAALL;
  uint64_t v6 = (uint64_t **)std::__tree<std::string>::__find_equal<std::string>(a1, a2, &v10, &v9, a3);
  xpc_object_t result = *v6;
  if (!*v6)
  {
    memset(v8, 170, sizeof(v8));
    std::__tree<std::string>::__construct_node<std::string const&>((uint64_t)a1, a4, v8);
    std::__tree<std::string>::__insert_node_at(a1, (uint64_t)v10, v6, v8[0]);
    return v8[0];
  }
  return result;
}

void **std::__tree<std::string>::__find_equal<std::string>(void *a1, uint64_t a2, void ***a3, uint64_t *a4, void **a5)
{
  uint64_t v9 = (void **)(a1 + 1);
  if (a1 + 1 == (void *)a2
    || (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a5, (void **)(a2 + 32)) & 0x80) != 0)
  {
    if (*a1 == a2)
    {
      int v12 = (void *)a2;
    }
    else
    {
      long long v11 = *(void **)a2;
      if (*(void *)a2)
      {
        do
        {
          int v12 = v11;
          long long v11 = (void *)v11[1];
        }
        while (v11);
      }
      else
      {
        BOOL v16 = (void *)a2;
        do
        {
          int v12 = (void *)v16[2];
          BOOL v17 = *v12 == (void)v16;
          BOOL v16 = v12;
        }
        while (v17);
      }
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v12 + 4, a5) & 0x80) == 0) {
        goto LABEL_17;
      }
    }
    if (*(void *)a2)
    {
      *a3 = (void **)v12;
      return (void **)(v12 + 1);
    }
    else
    {
      *a3 = (void **)a2;
      return (void **)a2;
    }
  }
  if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((void *)(a2 + 32), a5) & 0x80) == 0)
  {
    *a3 = (void **)a2;
    *a4 = a2;
    return (void **)a4;
  }
  a4 = (uint64_t *)(a2 + 8);
  uint64_t v13 = *(void *)(a2 + 8);
  if (v13)
  {
    uint64_t v14 = *(void ***)(a2 + 8);
    do
    {
      xpc_object_t v15 = v14;
      uint64_t v14 = (void **)*v14;
    }
    while (v14);
  }
  else
  {
    xpc_object_t v19 = (void **)a2;
    do
    {
      xpc_object_t v15 = (void **)v19[2];
      BOOL v17 = *v15 == v19;
      xpc_object_t v19 = v15;
    }
    while (!v17);
  }
  if (v15 == v9)
  {
LABEL_29:
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = (void **)a2;
    }
    return (void **)a4;
  }
  if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a5, v15 + 4) & 0x80) != 0)
  {
    uint64_t v13 = *a4;
    goto LABEL_29;
  }
LABEL_17:
  return (void **)std::__tree<std::string>::__find_equal<std::string>((uint64_t)a1, a3, a5);
}

void std::__destroy_at[abi:ne180100]<std::pair<xpc::connection const,TelephonyXPC::ServerClientState>,0>(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 16);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  xpc_release(*(xpc_object_t *)a1);
  *(void *)a1 = 0;
}

void *TelephonyXPC::Server::State::getClientState_sync(void *result, uint64_t a2, unint64_t a3)
{
  uint64_t *result = 0;
  result[1] = 0;
  size_t v3 = *(void **)(a2 + 304);
  if (v3)
  {
    uint64_t v4 = (void *)(a2 + 304);
    do
    {
      unint64_t v5 = v3[4];
      BOOL v6 = v5 >= a3;
      if (v5 >= a3) {
        unint64_t v7 = v3;
      }
      else {
        unint64_t v7 = v3 + 1;
      }
      if (v6) {
        uint64_t v4 = v3;
      }
      size_t v3 = (void *)*v7;
    }
    while (*v7);
    if (v4 != (void *)(a2 + 304) && v4[4] <= a3)
    {
      uint64_t v9 = v4[5];
      uint64_t v8 = v4[6];
      if (v8) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
      }
      uint64_t *result = v9;
      result[1] = v8;
    }
  }
  return result;
}

void ___ZN12TelephonyXPC6Server5State24handlePublicMessage_syncEN3xpc10connectionERNS2_4dictE_block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v6 = MEMORY[0x223C1F7A0](*(void *)(a1 + 32));
  uint64_t v7 = MEMORY[0x263EF8708];
  if (v6 == MEMORY[0x263EF8708])
  {
    xpc_object_t v13 = xpc_int64_create(a2);
    if (!v13) {
      xpc_object_t v13 = xpc_null_create();
    }
    xpc::dict::object_proxy::operator=(&object, *(xpc_object_t *)(a1 + 32), "commandResult", &v13);
    xpc_release(object);
    xpc_release(v13);
    if (MEMORY[0x223C1F7A0](*a3) == v7)
    {
      uint64_t v8 = (void *)*a3;
      xpc_object_t v11 = v8;
      if (v8) {
        xpc_retain(v8);
      }
      else {
        xpc_object_t v11 = xpc_null_create();
      }
      xpc::dict::object_proxy::operator=(&v12, *(xpc_object_t *)(a1 + 32), "commandData", &v11);
      xpc_release(v12);
      xpc_release(v11);
    }
    BOOL v10 = *(void **)(a1 + 32);
    uint64_t v9 = *(_xpc_connection_s **)(a1 + 40);
    xpc_connection_send_message(v9, v10);
  }
}

xpc_object_t __copy_helper_block_e8_32c15_ZTSN3xpc4dictE40c22_ZTSN3xpc10connectionE(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v4;
  if (v4) {
    xpc_retain(v4);
  }
  else {
    *(void *)(a1 + 32) = xpc_null_create();
  }
  unint64_t v5 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v5;
  if (v5) {
    return xpc_retain(v5);
  }
  xpc_object_t result = xpc_null_create();
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_32c15_ZTSN3xpc4dictE40c22_ZTSN3xpc10connectionE(uint64_t a1)
{
  *(void *)(a1 + 40) = 0;
  xpc_release(*(xpc_object_t *)(a1 + 32));
  *(void *)(a1 + 32) = 0;
}

uint64_t dispatch::callback<void({block_pointer})(int,xpc::dict)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

void ___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC17ServerClientStateEN3xpc4dictENS0_IU13block_pointerFviS4_EEEEEclIJS2_S4_S7_EEEv11qos_class_tDpT__block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  size_t v3 = (std::__shared_weak_count *)a1[6];
  uint64_t v10 = a1[5];
  xpc_object_t v11 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = (void *)a1[7];
  xpc_object_t v9 = v4;
  if (v4) {
    xpc_retain(v4);
  }
  else {
    xpc_object_t v9 = xpc_null_create();
  }
  unint64_t v5 = (void *)a1[8];
  if (v5) {
    unint64_t v5 = _Block_copy(v5);
  }
  uint64_t v6 = a1[9];
  std::string aBlock = v5;
  dispatch_object_t object = v6;
  if (v6) {
    dispatch_retain(v6);
  }
  (*(void (**)(uint64_t, uint64_t *, xpc_object_t *, void **))(v2 + 16))(v2, &v10, &v9, &aBlock);
  if (object) {
    dispatch_release(object);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  xpc_release(v9);
  xpc_object_t v9 = 0;
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
}

void sub_21E073914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *aBlock, dispatch_object_t object, xpc_object_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (object) {
    dispatch_release(object);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  xpc_release(a12);
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32c126_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC17ServerClientStateEN3xpc4dictENS_8callbackIU13block_pointerFviS4_EEEEEE40c39_ZTSN12TelephonyXPC17ServerClientStateE56c15_ZTSN3xpc4dictE64c57_ZTSN8dispatch8callbackIU13block_pointerFviN3xpc4dictEEEE(void *a1, void *a2)
{
  uint64_t v4 = (void *)a2[4];
  if (v4) {
    uint64_t v4 = _Block_copy(v4);
  }
  uint64_t v6 = a2[5];
  uint64_t v5 = a2[6];
  a1[4] = v4;
  a1[5] = v6;
  a1[6] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v7 = (void *)a2[7];
  a1[7] = v7;
  if (v7) {
    xpc_retain(v7);
  }
  else {
    a1[7] = xpc_null_create();
  }
  uint64_t v8 = (void *)a2[8];
  if (v8) {
    uint64_t v8 = _Block_copy(v8);
  }
  xpc_object_t v9 = a2[9];
  a1[8] = v8;
  a1[9] = v9;
  if (v9)
  {
    dispatch_retain(v9);
  }
}

void __destroy_helper_block_e8_32c126_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC17ServerClientStateEN3xpc4dictENS_8callbackIU13block_pointerFviS4_EEEEEE40c39_ZTSN12TelephonyXPC17ServerClientStateE56c15_ZTSN3xpc4dictE64c57_ZTSN8dispatch8callbackIU13block_pointerFviN3xpc4dictEEEE(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 72);
  if (v2) {
    dispatch_release(v2);
  }
  size_t v3 = *(const void **)(a1 + 64);
  if (v3) {
    _Block_release(v3);
  }
  xpc_release(*(xpc_object_t *)(a1 + 56));
  *(void *)(a1 + 56) = 0;
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 48);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  uint64_t v5 = *(const void **)(a1 + 32);
  if (v5) {
    _Block_release(v5);
  }
}

void TelephonyXPC::Server::State::registerNotification(void *a1, xpc_object_t object, char a3, const void **a4)
{
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1174405120;
  v12[2] = ___ZN12TelephonyXPC6Server5State20registerNotificationEN3xpc10connectionEbN3ctu2cf11CFSharedRefIK9__CFArrayEE_block_invoke;
  v12[3] = &__block_descriptor_tmp_65;
  v12[4] = a1;
  xpc_object_t objecta = object;
  if (object) {
    xpc_retain(object);
  }
  else {
    xpc_object_t objecta = xpc_null_create();
  }
  char v15 = a3;
  ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::SharedRef(&v14, a4);
  uint64_t v7 = (std::__shared_weak_count *)a1[2];
  if (!v7 || (v8 = a1[1], (xpc_object_t v9 = std::__shared_weak_count::lock(v7)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v10 = v9;
  xpc_object_t v11 = a1[3];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcServerEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &__block_descriptor_tmp_49;
  block[5] = v8;
  BOOL v17 = v10;
  atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  block[4] = v12;
  dispatch_async(v11, block);
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef(&v14);
  xpc_release(objecta);
}

void *ctu::cf::CFSharedRef<__CFArray const>::CFSharedRef<void const,void>(void *a1, CFTypeRef cf)
{
  if (cf && (CFTypeID v4 = CFGetTypeID(cf), v4 == CFArrayGetTypeID()))
  {
    *a1 = cf;
    CFRetain(cf);
  }
  else
  {
    *a1 = 0;
  }
  return a1;
}

const void **ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get(uint64_t a1)
{
  return *(void *)a1;
}

void ___ZN12TelephonyXPC6Server5State20registerNotificationEN3xpc10connectionEbN3ctu2cf11CFSharedRefIK9__CFArrayEE_block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  size_t v3 = (xpc::object *)(a1 + 40);
  xpc_object_t v4 = *(xpc_object_t *)(a1 + 40);
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v14 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  if (v4) {
    xpc_retain(v4);
  }
  else {
    xpc_object_t v4 = xpc_null_create();
  }
  TelephonyXPC::Server::State::getClientState_sync(&v13, v2, (unint64_t)v4);
  xpc_release(v4);
  if (v13)
  {
    int v5 = *(unsigned __int8 *)(a1 + 56);
    ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::SharedRef(&v12, (const void **)(a1 + 48));
    TelephonyXPC::ServerClientState::registerNotification_sync((void **)&v13, v5, &v12);
    ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef(&v12);
  }
  else if (MEMORY[0x223C1F7A0](*(void *)v3) == MEMORY[0x263EF86F0])
  {
    uint64_t v6 = *(NSObject **)(v2 + 112);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      xpc::object::to_string((uint64_t *)__p, v3);
      xpc_object_t v9 = v11 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_debug_impl(&dword_21E069000, v6, OS_LOG_TYPE_DEBUG, "#D %s is not in client list", buf, 0xCu);
      if (v11 < 0) {
        operator delete(__p[0]);
      }
    }
    if ((**(unsigned int (***)(uint64_t, uint64_t))(v2 + 80))(v2 + 80, 20))
    {
      xpc::object::to_string((uint64_t *)buf, v3);
      uint64_t v8 = v16 >= 0 ? buf : *(unsigned char **)buf;
      ctu::LogMessageBuffer::createWithFormat((uint64_t *)__p, (ctu::LogMessageBuffer *)"%s is not in client list", v7, v8);
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x223C1F270](__p);
      if (v16 < 0) {
        operator delete(*(void **)buf);
      }
    }
  }
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
}

const void **__copy_helper_block_e8_40c22_ZTSN3xpc10connectionE48c39_ZTSN3ctu2cf11CFSharedRefIK9__CFArrayEE(uint64_t a1, uint64_t a2)
{
  xpc_object_t v4 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v4;
  if (v4) {
    xpc_retain(v4);
  }
  else {
    *(void *)(a1 + 40) = xpc_null_create();
  }
  return ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::SharedRef((const void **)(a1 + 48), (const void **)(a2 + 48));
}

void __destroy_helper_block_e8_40c22_ZTSN3xpc10connectionE48c39_ZTSN3ctu2cf11CFSharedRefIK9__CFArrayEE(uint64_t a1)
{
  *(void *)(a1 + 40) = 0;
}

const void **ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::SharedRef(const void **a1, const void **a2)
{
  size_t v3 = *a2;
  *a1 = *a2;
  if (v3) {
    CFRetain(v3);
  }
  return a1;
}

const void **ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void ___ZN12TelephonyXPC6Server5State7unicastEN3xpc10connectionENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS2_4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  uint64_t v4 = MEMORY[0x263EF8708];
  if (v3 || (xpc_object_t v3 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x223C1F7A0](v3) == v4)
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
  if (MEMORY[0x223C1F7A0](*(void *)(a1 + 40)) == v4)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    xpc_object_t v62 = v6;
    if (v6) {
      xpc_retain(v6);
    }
    else {
      xpc_object_t v62 = xpc_null_create();
    }
    xpc::dict::object_proxy::operator=(&v63, v5, "eventData", &v62);
    xpc_release(v63);
    xpc_object_t v63 = 0;
    xpc_release(v62);
    xpc_object_t v62 = 0;
  }
  xpc_object_t v60 = xpc_string_create("eventNotification");
  if (!v60) {
    xpc_object_t v60 = xpc_null_create();
  }
  xpc::dict::object_proxy::operator=(&v61, v5, "command", &v60);
  xpc_release(v61);
  xpc_object_t v61 = 0;
  xpc_release(v60);
  xpc_object_t v60 = 0;
  uint64_t v7 = (const char **)(a1 + 48);
  uint64_t v8 = (const char *)(a1 + 48);
  if (*(char *)(a1 + 71) < 0) {
    uint64_t v8 = *v7;
  }
  xpc_object_t v58 = xpc_string_create(v8);
  if (!v58) {
    xpc_object_t v58 = xpc_null_create();
  }
  xpc::dict::object_proxy::operator=(&v59, v5, "event", &v58);
  xpc_release(v59);
  xpc_object_t v59 = 0;
  xpc_release(v58);
  xpc_object_t v58 = 0;
  xpc_object_t v9 = dispatch_group_create();
  uint64_t v10 = *(std::__shared_weak_count **)(v2 + 16);
  if (!v10 || (uint64_t v11 = *(void *)(v2 + 8), (v12 = std::__shared_weak_count::lock(v10)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  unint64_t v13 = v12;
  atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  int v56 = (long long *)0xAAAAAAAAAAAAAAAALL;
  int v57 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v14 = *(xpc_object_t *)(a1 + 72);
  if (v14) {
    xpc_retain(*(xpc_object_t *)(a1 + 72));
  }
  else {
    xpc_object_t v14 = xpc_null_create();
  }
  TelephonyXPC::Server::State::getClientState_sync(&v56, v2, (unint64_t)v14);
  xpc_release(v14);
  if (*(char *)(a1 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(&v55, *(const std::string::value_type **)(a1 + 48), *(void *)(a1 + 56));
  }
  else
  {
    *(_OWORD *)&v55.__r_.__value_.__l.__data_ = *(_OWORD *)v7;
    v55.__r_.__value_.__r.__words[2] = *(void *)(a1 + 64);
  }
  BOOL isNotificationRegistered_sync = TelephonyXPC::ServerClientState::isNotificationRegistered_sync((uint64_t *)&v56, (uint64_t)&v55);
  BOOL v16 = isNotificationRegistered_sync;
  if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v55.__r_.__value_.__l.__data_);
    if (!v16) {
      goto LABEL_66;
    }
  }
  else if (!isNotificationRegistered_sync)
  {
    goto LABEL_66;
  }
  uint64_t v17 = *(NSObject **)(v2 + 112);
  xpc_object_t v41 = v5;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    std::string::size_type v18 = (const char *)(a1 + 48);
    if (*(char *)(a1 + 71) < 0) {
      std::string::size_type v18 = *v7;
    }
    xpc_object_t v19 = v9;
    uint64_t v20 = v11;
    if (*((char *)v56 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v54, *(const std::string::value_type **)v56, *((void *)v56 + 1));
    }
    else
    {
      long long v21 = *v56;
      v54.__r_.__value_.__r.__words[2] = *((void *)v56 + 2);
      *(_OWORD *)&v54.__r_.__value_.__l.__data_ = v21;
    }
    int v22 = SHIBYTE(v54.__r_.__value_.__r.__words[2]);
    std::string::size_type v23 = v54.__r_.__value_.__r.__words[0];
    uint64_t SystemTime = TelephonyUtilGetSystemTime();
    *(_DWORD *)long long buf = 136315650;
    char v25 = &v54;
    if (v22 < 0) {
      char v25 = (std::string *)v23;
    }
    uint64_t v65 = v18;
    __int16 v66 = 2080;
    xpc_object_t v67 = v25;
    __int16 v68 = 2048;
    uint64_t v69 = SystemTime;
    _os_log_impl(&dword_21E069000, v17, OS_LOG_TYPE_DEFAULT, "#I Sending %s to %s at %llu", buf, 0x20u);
    if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v54.__r_.__value_.__l.__data_);
    }
    uint64_t v11 = v20;
    xpc_object_t v9 = v19;
    xpc_object_t v5 = v41;
  }
  if ((**(unsigned int (***)(uint64_t, uint64_t))(v2 + 80))(v2 + 80, 40))
  {
    uint64_t v26 = (const char *)(a1 + 48);
    if (*(char *)(a1 + 71) < 0) {
      uint64_t v26 = *v7;
    }
    char v27 = v9;
    uint64_t v28 = v11;
    if (*((char *)v56 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v54, *(const std::string::value_type **)v56, *((void *)v56 + 1));
    }
    else
    {
      long long v29 = *v56;
      v54.__r_.__value_.__r.__words[2] = *((void *)v56 + 2);
      *(_OWORD *)&v54.__r_.__value_.__l.__data_ = v29;
    }
    int v30 = SHIBYTE(v54.__r_.__value_.__r.__words[2]);
    std::string::size_type v31 = v54.__r_.__value_.__r.__words[0];
    uint64_t v32 = TelephonyUtilGetSystemTime();
    BOOL v34 = &v54;
    if (v30 < 0) {
      BOOL v34 = (std::string *)v31;
    }
    ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"Sending %s to %s at %llu", v33, v26, v34, v32);
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x223C1F270](buf);
    uint64_t v11 = v28;
    if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v54.__r_.__value_.__l.__data_);
    }
    xpc_object_t v9 = v27;
    xpc_object_t v5 = v41;
  }
  if (*(void *)(a1 + 80) && *(void *)(a1 + 88))
  {
    dispatch_group_enter(v9);
    long long v35 = *(_xpc_connection_s **)(a1 + 72);
    int v36 = *(NSObject **)(v2 + 24);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 1174405120;
    handler[2] = ___ZN12TelephonyXPC6Server5State7unicastEN3xpc10connectionENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS2_4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke_66;
    handler[3] = &__block_descriptor_tmp_69;
    handler[4] = v2;
    handler[5] = v11;
    unint64_t v49 = v13;
    atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    uint64_t v50 = (uint64_t)v56;
    char v51 = v57;
    if (v57) {
      atomic_fetch_add_explicit(&v57->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (*(char *)(a1 + 71) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 48), *(void *)(a1 + 56));
    }
    else
    {
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *(_OWORD *)v7;
      __p.__r_.__value_.__r.__words[2] = *(void *)(a1 + 64);
    }
    xpc_object_t v53 = v9;
    xpc_connection_send_message_with_reply(v35, v5, v36, handler);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v51) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v51);
    }
    if (v49) {
      std::__shared_weak_count::__release_weak(v49);
    }
  }
  else
  {
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 72), v5);
  }
LABEL_66:
  if (*(void *)(a1 + 80) && *(void *)(a1 + 88))
  {
    std::string::size_type v37 = *(NSObject **)(v2 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN12TelephonyXPC6Server5State7unicastEN3xpc10connectionENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS2_4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke_70;
    block[3] = &__block_descriptor_tmp_72;
    block[4] = v2;
    block[5] = v11;
    uint64_t v43 = v13;
    atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    uint64_t v38 = *(void **)(a1 + 72);
    xpc_object_t v44 = v38;
    if (v38) {
      xpc_retain(v38);
    }
    else {
      xpc_object_t v44 = xpc_null_create();
    }
    if (*(char *)(a1 + 71) < 0)
    {
      std::string::__init_copy_ctor_external(&v45, *(const std::string::value_type **)(a1 + 48), *(void *)(a1 + 56));
    }
    else
    {
      *(_OWORD *)&v45.__r_.__value_.__l.__data_ = *(_OWORD *)v7;
      v45.__r_.__value_.__r.__words[2] = *(void *)(a1 + 64);
    }
    v39 = *(void **)(a1 + 80);
    if (v39) {
      v39 = _Block_copy(v39);
    }
    xpc_object_t v40 = *(NSObject **)(a1 + 88);
    std::string aBlock = v39;
    dispatch_object_t object = v40;
    if (v40) {
      dispatch_retain(v40);
    }
    dispatch_group_notify(v9, v37, block);
    if (object) {
      dispatch_release(object);
    }
    if (aBlock) {
      _Block_release(aBlock);
    }
    if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v45.__r_.__value_.__l.__data_);
    }
    xpc_release(v44);
    xpc_object_t v44 = 0;
    if (v43) {
      std::__shared_weak_count::__release_weak(v43);
    }
  }
  dispatch_release(v9);
  if (v57) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v57);
  }
  std::__shared_weak_count::__release_weak(v13);
  xpc_release(v5);
}

void sub_21E0746B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, xpc_object_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,std::__shared_weak_count *a32,uint64_t a33,std::__shared_weak_count *a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,void *a42,uint64_t a43,int a44,__int16 a45,char a46,char a47)
{
  if (a34) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a34);
  }
  if (a32) {
    std::__shared_weak_count::__release_weak(a32);
  }
  uint64_t v50 = *(std::__shared_weak_count **)(v48 - 216);
  if (v50) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v50);
  }
  std::__shared_weak_count::__release_weak(v47);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void ___ZN12TelephonyXPC6Server5State7unicastEN3xpc10connectionENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS2_4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke_66(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2 && (uint64_t v3 = *(void *)(a1 + 32), (v4 = std::__shared_weak_count::lock(v2)) != 0))
  {
    xpc_object_t v5 = v4;
    if (*(void *)(a1 + 40))
    {
      uint64_t v6 = *(NSObject **)(v3 + 112);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(long long **)(a1 + 56);
        if (*((char *)v7 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v19, *(const std::string::value_type **)v7, *((void *)v7 + 1));
        }
        else
        {
          long long v8 = *v7;
          v19.__r_.__value_.__r.__words[2] = *((void *)v7 + 2);
          *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v8;
        }
        if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v10 = &v19;
        }
        else {
          uint64_t v10 = (std::string *)v19.__r_.__value_.__r.__words[0];
        }
        uint64_t v11 = (void *)(a1 + 72);
        if (*(char *)(a1 + 95) < 0) {
          uint64_t v11 = (void *)*v11;
        }
        uint64_t SystemTime = TelephonyUtilGetSystemTime();
        *(_DWORD *)long long buf = 136315650;
        long long v21 = v10;
        __int16 v22 = 2080;
        std::string::size_type v23 = v11;
        __int16 v24 = 2048;
        uint64_t v25 = SystemTime;
        _os_log_impl(&dword_21E069000, v6, OS_LOG_TYPE_DEFAULT, "#I %s responded to %s at %llu", buf, 0x20u);
        if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v19.__r_.__value_.__l.__data_);
        }
      }
      if ((**(unsigned int (***)(uint64_t, uint64_t))(v3 + 80))(v3 + 80, 40))
      {
        unint64_t v13 = *(long long **)(a1 + 56);
        if (*((char *)v13 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v19, *(const std::string::value_type **)v13, *((void *)v13 + 1));
        }
        else
        {
          long long v14 = *v13;
          v19.__r_.__value_.__r.__words[2] = *((void *)v13 + 2);
          *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v14;
        }
        if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          char v15 = &v19;
        }
        else {
          char v15 = (std::string *)v19.__r_.__value_.__r.__words[0];
        }
        BOOL v16 = (void *)(a1 + 72);
        if (*(char *)(a1 + 95) < 0) {
          BOOL v16 = (void *)*v16;
        }
        uint64_t v17 = TelephonyUtilGetSystemTime();
        ctu::LogMessageBuffer::createWithFormat((uint64_t *)buf, (ctu::LogMessageBuffer *)"%s responded to %s at %llu", v18, v15, v16, v17);
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
        MEMORY[0x223C1F270](buf);
        if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v19.__r_.__value_.__l.__data_);
        }
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 96));
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  else
  {
    xpc_object_t v9 = *(NSObject **)(a1 + 96);
    dispatch_group_leave(v9);
  }
}

void sub_21E074A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  _Unwind_Resume(a1);
}

void ___ZN12TelephonyXPC6Server5State7unicastEN3xpc10connectionENSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEENS2_4dictEN8dispatch8callbackIU13block_pointerFvvEEE_block_invoke_70(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4 && *(void *)(a1 + 40))
    {
      xpc_object_t v5 = *(NSObject **)(v3 + 112);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        xpc::object::to_string((uint64_t *)__p, (xpc::object *)(a1 + 56));
        uint64_t v6 = (void **)__p[0];
        if (SHIBYTE(v16) >= 0) {
          uint64_t v6 = __p;
        }
        uint64_t v7 = (void *)(a1 + 64);
        if (*(char *)(a1 + 87) < 0) {
          uint64_t v7 = (void *)*v7;
        }
        *(_DWORD *)long long buf = 136315394;
        *(void *)&uint8_t buf[4] = v6;
        __int16 v20 = 2080;
        long long v21 = v7;
        _os_log_impl(&dword_21E069000, v5, OS_LOG_TYPE_DEFAULT, "#I Client %s responded to %s", buf, 0x16u);
        if (SHIBYTE(v16) < 0) {
          operator delete(__p[0]);
        }
      }
      if ((**(unsigned int (***)(uint64_t, uint64_t))(v3 + 80))(v3 + 80, 40))
      {
        xpc::object::to_string((uint64_t *)buf, (xpc::object *)(a1 + 56));
        if (v22 >= 0) {
          xpc_object_t v9 = buf;
        }
        else {
          xpc_object_t v9 = *(unsigned char **)buf;
        }
        uint64_t v10 = (void *)(a1 + 64);
        if (*(char *)(a1 + 87) < 0) {
          uint64_t v10 = (void *)*v10;
        }
        ctu::LogMessageBuffer::createWithFormat((uint64_t *)__p, (ctu::LogMessageBuffer *)"Client %s responded to %s", v8, v9, v10);
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
        MEMORY[0x223C1F270](__p);
        if (v22 < 0) {
          operator delete(*(void **)buf);
        }
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v11 = *(const void **)(a1 + 88);
  if (v11) {
    xpc_object_t v12 = _Block_copy(v11);
  }
  else {
    xpc_object_t v12 = 0;
  }
  unint64_t v13 = *(NSObject **)(a1 + 96);
  __p[0] = (void *)MEMORY[0x263EF8330];
  __p[1] = (void *)1174405120;
  BOOL v16 = ___ZNK8dispatch8callbackIU13block_pointerFvvEEclIJEEEvDpT__block_invoke;
  uint64_t v17 = &__block_descriptor_tmp_50;
  if (v12) {
    long long v14 = _Block_copy(v12);
  }
  else {
    long long v14 = 0;
  }
  std::string aBlock = v14;
  dispatch_async(v13, __p);
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v12) {
    _Block_release(v12);
  }
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

void __copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcServerEEE56c23_ZTSKN3xpc10connectionE64c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE88c46_ZTSN8dispatch8callbackIU13block_pointerFvvEEE(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 48);
  a1[5] = *(void *)(a2 + 40);
  a1[6] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
  xpc_object_t v5 = *(void **)(a2 + 56);
  a1[7] = v5;
  if (v5) {
    xpc_retain(v5);
  }
  else {
    a1[7] = xpc_null_create();
  }
  uint64_t v6 = (std::string *)(a1 + 8);
  if (*(char *)(a2 + 87) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)(a2 + 64), *(void *)(a2 + 72));
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 64);
    a1[10] = *(void *)(a2 + 80);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  long long v8 = *(void **)(a2 + 88);
  if (v8) {
    long long v8 = _Block_copy(v8);
  }
  xpc_object_t v9 = *(NSObject **)(a2 + 96);
  a1[11] = v8;
  a1[12] = v9;
  if (v9)
  {
    dispatch_retain(v9);
  }
}

void sub_21E074E48(_Unwind_Exception *a1)
{
  xpc::connection::~connection(v2);
  uint64_t v4 = *(std::__shared_weak_count **)(v1 + 48);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcServerEEE56c23_ZTSKN3xpc10connectionE64c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE88c46_ZTSN8dispatch8callbackIU13block_pointerFvvEEE(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 96);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 88);
  if (v3) {
    _Block_release(v3);
  }
  if (*(char *)(a1 + 87) < 0) {
    operator delete(*(void **)(a1 + 64));
  }
  xpc_release(*(xpc_object_t *)(a1 + 56));
  *(void *)(a1 + 56) = 0;
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 48);
  if (v4)
  {
    std::__shared_weak_count::__release_weak(v4);
  }
}

void __copy_helper_block_e8_40c15_ZTSN3xpc4dictE48c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE72c23_ZTSKN3xpc10connectionE80c46_ZTSN8dispatch8callbackIU13block_pointerFvvEEE(std::string *a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 40);
  a1[1].__r_.__value_.__r.__words[2] = (std::string::size_type)v4;
  if (v4) {
    xpc_retain(v4);
  }
  else {
    a1[1].__r_.__value_.__r.__words[2] = (std::string::size_type)xpc_null_create();
  }
  xpc_object_t v5 = a1 + 2;
  if (*(char *)(a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a2 + 48), *(void *)(a2 + 56));
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 48);
    a1[2].__r_.__value_.__r.__words[2] = *(void *)(a2 + 64);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  long long v7 = *(void **)(a2 + 72);
  a1[3].__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
  if (v7) {
    xpc_retain(v7);
  }
  else {
    a1[3].__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  }
  long long v8 = *(void **)(a2 + 80);
  if (v8) {
    long long v8 = _Block_copy(v8);
  }
  xpc_object_t v9 = *(NSObject **)(a2 + 88);
  a1[3].__r_.__value_.__l.__size_ = (std::string::size_type)v8;
  a1[3].__r_.__value_.__r.__words[2] = (std::string::size_type)v9;
  if (v9)
  {
    dispatch_retain(v9);
  }
}

void sub_21E074FC0(_Unwind_Exception *a1)
{
  xpc::dict::~dict(v1);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_40c15_ZTSN3xpc4dictE48c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE72c23_ZTSKN3xpc10connectionE80c46_ZTSN8dispatch8callbackIU13block_pointerFvvEEE(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 88);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 80);
  if (v3) {
    _Block_release(v3);
  }
  xpc_release(*(xpc_object_t *)(a1 + 72));
  *(void *)(a1 + 72) = 0;
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(void *)(a1 + 40) = 0;
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
  long long v6 = (uint64_t **)v3[2];
  long long v7 = *v6;
  if (*v6 == v3)
  {
    std::string *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      long long v7 = 0;
      xpc_object_t result = (uint64_t *)v2;
    }
    else
    {
      long long v7 = v6[1];
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
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      xpc_object_t result = v3;
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
    if (*(uint64_t **)v12 != v7) {
      break;
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
        xpc_object_t result = v7;
      }
      long long v7 = *(uint64_t **)v12;
    }
    std::string v19 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v19 + 24)) {
      goto LABEL_68;
    }
    __int16 v20 = (uint64_t *)v7[1];
    if (v20 && !*((unsigned char *)v20 + 24))
    {
      if (v19 && !*((unsigned char *)v19 + 24))
      {
LABEL_68:
        __int16 v20 = v7;
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
        *__int16 v20 = (uint64_t)v7;
        void v7[2] = (uint64_t)v20;
        std::string v19 = v7;
      }
      uint64_t v23 = v20[2];
      *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v19 + 24) = 1;
      __int16 v24 = *(uint64_t **)v23;
      uint64_t v27 = *(void *)(*(void *)v23 + 8);
      *(void *)uint64_t v23 = v27;
      if (v27) {
        *(void *)(v27 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      v24[1] = v23;
      goto LABEL_72;
    }
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
LABEL_49:
    long long v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
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
    *unint64_t v13 = v12;
    *(void *)(v12 + 16) = v13;
    if (result == (uint64_t *)*v7) {
      xpc_object_t result = v7;
    }
    long long v7 = *(uint64_t **)(*v7 + 8);
  }
  char v15 = (void *)*v7;
  if (!*v7 || *((unsigned char *)v15 + 24))
  {
    BOOL v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_59;
    }
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      uint64_t v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  BOOL v16 = (uint64_t *)v7[1];
  if (v16 && !*((unsigned char *)v16 + 24))
  {
LABEL_59:
    char v15 = v7;
  }
  else
  {
    *((unsigned char *)v15 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v22 = v15[1];
    uint64_t *v7 = v22;
    if (v22) {
      *(void *)(v22 + 16) = v7;
    }
    void v15[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
    v15[1] = v7;
    void v7[2] = (uint64_t)v15;
    BOOL v16 = v7;
  }
  uint64_t v23 = v15[2];
  *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v16 + 24) = 1;
  __int16 v24 = *(uint64_t **)(v23 + 8);
  uint64_t v25 = *v24;
  *(void *)(v23 + 8) = *v24;
  if (v25) {
    *(void *)(v25 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  *__int16 v24 = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

void std::__tree<std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>,std::__map_value_compare<xpc::connection,std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>,std::less<xpc::connection>,true>,std::allocator<std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>,std::__map_value_compare<xpc::connection,std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>,std::less<xpc::connection>,true>,std::allocator<std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>>>::destroy(*a1);
    std::__tree<std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>,std::__map_value_compare<xpc::connection,std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>,std::less<xpc::connection>,true>,std::allocator<std::__value_type<xpc::connection,TelephonyXPC::ServerClientState>>>::destroy(a1[1]);
    std::__destroy_at[abi:ne180100]<std::pair<xpc::connection const,TelephonyXPC::ServerClientState>,0>((uint64_t)(a1 + 4));
    operator delete(a1);
  }
}

void std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(*a1);
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>>>::destroy(a1[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,dispatch::callback<void({block_pointer})(TelephonyXPC::ServerClientState,xpc::dict,dispatch::callback<void({block_pointer})(int,xpc::dict)>)>>,0>((uint64_t)(a1 + 4));
    operator delete(a1);
  }
}

void std::__shared_ptr_pointer<TelephonyXPC::Server *,std::shared_ptr<TelephonyXPC::Server>::__shared_ptr_default_delete<TelephonyXPC::Server,TelephonyXPC::Server>,std::allocator<TelephonyXPC::Server>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Server *,std::shared_ptr<TelephonyXPC::Server>::__shared_ptr_default_delete<TelephonyXPC::Server,TelephonyXPC::Server>,std::allocator<TelephonyXPC::Server>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Server *,std::shared_ptr<TelephonyXPC::Server>::__shared_ptr_default_delete<TelephonyXPC::Server,TelephonyXPC::Server>,std::allocator<TelephonyXPC::Server>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void *TelephonyXPC::ServerClientState::ServerClientState(void *a1, long long *a2)
{
  uint64_t v4 = (std::string *)operator new(0x50uLL);
  TelephonyXPC::ServerClientState::State::State(v4, a2);
  return std::shared_ptr<TelephonyXPC::ServerClientState::State>::shared_ptr[abi:ne180100]<TelephonyXPC::ServerClientState::State,void>(a1, (uint64_t)v4);
}

void sub_21E075570(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *TelephonyXPC::ServerClientState::ServerClientState(void *result, void *a2)
{
  uint64_t v2 = a2[1];
  uint64_t *result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

{
  uint64_t v2;

  uint64_t v2 = a2[1];
  uint64_t *result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

std::string *TelephonyXPC::ServerClientState::setCheckedIn(std::string **a1, const std::string *a2)
{
  uint64_t v2 = *a1;
  uint64_t result = std::string::operator=(*a1, a2);
  v2[1].__r_.__value_.__s.__data_[0] = 1;
  return result;
}

BOOL TelephonyXPC::ServerClientState::isNotificationRegistered_sync(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  uint64_t v3 = std::__tree<std::string>::find<std::string>(v2 + 32, (void **)&__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v2 + 40 != (void)v3;
}

void sub_21E075670(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

const void **TelephonyXPC::ServerClientState::registerNotification_sync(void **a1, int a2, const void **a3)
{
  uint64_t v4 = *a1;
  ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::SharedRef((const void **)&theArray, a3);
  CFArrayRef v5 = theArray;
  v6.length = CFArrayGetCount(theArray);
  if (a2) {
    long long v7 = (void (__cdecl *)(const void *, void *))TelephonyXPC::ServerClientState::State::registerNotificationApplier;
  }
  else {
    long long v7 = (void (__cdecl *)(const void *, void *))TelephonyXPC::ServerClientState::State::unregisterNotificationApplier;
  }
  v6.location = 0;
  CFArrayApplyFunction(v5, v6, v7, v4);
  return ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&theArray);
}

void sub_21E075718(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void TelephonyXPC::ServerClientState::getName(TelephonyXPC::ServerClientState *this@<X0>, std::string *a2@<X8>)
{
  uint64_t v2 = *(long long **)this;
  if (*(char *)(*(void *)this + 23) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)v2, *((void *)v2 + 1));
  }
  else
  {
    long long v3 = *v2;
    a2->__r_.__value_.__r.__words[2] = *((void *)v2 + 2);
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v3;
  }
}

void TelephonyXPC::ServerClientState::setClientEntitlements(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  std::set<std::string>::set[abi:ne180100]((uint64_t *)&v3, a2);
  if ((void **)(v2 + 56) != &v3) {
    std::__tree<std::string>::__assign_multi<std::__tree_const_iterator<std::string,std::__tree_node<std::string,void *> *,long>>((uint64_t *)(v2 + 56), v3, &v4);
  }
  std::__tree<std::string>::destroy((uint64_t)&v3, v4);
}

void sub_21E0757B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, char *a11)
{
}

BOOL TelephonyXPC::ServerClientState::isClientEntitled(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  return v2 + 64 != (void)std::__tree<std::string>::find<std::string>(*a1 + 56, a2);
}

std::string *TelephonyXPC::ServerClientState::State::State(std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v3 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
  }
  this[1].__r_.__value_.__s.__data_[0] = 0;
  this[1].__r_.__value_.__r.__words[2] = 0;
  this[1].__r_.__value_.__l.__size_ = (std::string::size_type)&this[1].__r_.__value_.__r.__words[2];
  this[3].__r_.__value_.__r.__words[0] = 0;
  this[2].__r_.__value_.__r.__words[2] = 0;
  this[2].__r_.__value_.__r.__words[0] = 0;
  this[2].__r_.__value_.__l.__size_ = (std::string::size_type)&this[2].__r_.__value_.__r.__words[2];
  return this;
}

void **std::__tree<std::string>::find<std::string>(uint64_t a1, void **a2)
{
  uint64_t v2 = (void **)(a1 + 8);
  long long v3 = *(void **)(a1 + 8);
  if (!v3) {
    return v2;
  }
  CFArrayRef v5 = (void **)(a1 + 8);
  do
  {
    char v6 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v3 + 4, a2);
    if (v6 >= 0) {
      long long v7 = v3;
    }
    else {
      long long v7 = v3 + 1;
    }
    if (v6 >= 0) {
      CFArrayRef v5 = (void **)v3;
    }
    long long v3 = (void *)*v7;
  }
  while (*v7);
  if (v5 == v2
    || (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, v5 + 4) & 0x80) != 0)
  {
    return v2;
  }
  return v5;
}

void TelephonyXPC::ServerClientState::State::registerNotificationApplier(TelephonyXPC::ServerClientState::State *this, uint64_t **a2, void *a3)
{
  long long v6 = 0uLL;
  uint64_t v7 = 0;
  ctu::cf::assign();
  *(_OWORD *)std::string __p = 0uLL;
  uint64_t v5 = 0;
  std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>(a2 + 4, __p, (uint64_t)__p);
  if (SHIBYTE(v5) < 0) {
    operator delete(__p[0]);
  }
}

void sub_21E075958(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void TelephonyXPC::ServerClientState::State::unregisterNotificationApplier(TelephonyXPC::ServerClientState::State *this, void *a2, void *a3)
{
  long long v14 = 0uLL;
  uint64_t v15 = 0;
  ctu::cf::assign();
  *(_OWORD *)std::string __p = 0uLL;
  uint64_t v13 = 0;
  uint64_t v4 = (void ***)(a2 + 4);
  uint64_t v5 = std::__tree<std::string>::find<std::string>((uint64_t)(a2 + 4), __p);
  long long v6 = v5;
  if (a2 + 5 != v5)
  {
    uint64_t v7 = (void **)v5[1];
    if (v7)
    {
      do
      {
        int v8 = v7;
        uint64_t v7 = (void **)*v7;
      }
      while (v7);
    }
    else
    {
      uint64_t v9 = v5;
      do
      {
        int v8 = (void **)v9[2];
        BOOL v10 = *v8 == v9;
        uint64_t v9 = v8;
      }
      while (!v10);
    }
    if (*v4 == v5) {
      char *v4 = v8;
    }
    uint64_t v11 = (uint64_t *)a2[5];
    --a2[6];
    std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v11, (uint64_t *)v6);
    if (*((char *)v6 + 55) < 0) {
      operator delete(v6[4]);
    }
    operator delete(v6);
  }
  if (SHIBYTE(v13) < 0) {
    operator delete(__p[0]);
  }
}

void sub_21E075A78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::__tree<std::string>::__assign_multi<std::__tree_const_iterator<std::string,std::__tree_node<std::string,void *> *,long>>(uint64_t *result, void *a2, void *a3)
{
  uint64_t v5 = (uint64_t **)result;
  if (result[2])
  {
    uint64_t v6 = *result;
    uint64_t v7 = result[1];
    std::string *result = (uint64_t)(result + 1);
    *(void *)(v7 + 16) = 0;
    result[1] = 0;
    result[2] = 0;
    if (*(void *)(v6 + 8)) {
      int v8 = *(uint64_t **)(v6 + 8);
    }
    else {
      int v8 = (uint64_t *)v6;
    }
    v18[0] = result;
    v18[1] = v8;
    uint64_t v18[2] = v8;
    if (v8)
    {
      v18[1] = std::__tree<std::string>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      if (a2 != a3)
      {
        uint64_t v9 = a2;
        do
        {
          std::string::operator=((std::string *)(v8 + 4), (const std::string *)(v9 + 4));
          BOOL v10 = v18[2];
          uint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
          leaf_high = (uint64_t **)std::__tree<std::string>::__find_leaf_high((uint64_t)v5, &v17, v18[2] + 4);
          std::__tree<std::string>::__insert_node_at(v5, v17, leaf_high, v10);
          int v8 = v18[1];
          uint64_t v18[2] = v18[1];
          if (v18[1]) {
            v18[1] = std::__tree<std::string>::_DetachedTreeCache::__detach_next((uint64_t)v18[1]);
          }
          uint64_t v12 = (void *)v9[1];
          if (v12)
          {
            do
            {
              a2 = v12;
              uint64_t v12 = (void *)*v12;
            }
            while (v12);
          }
          else
          {
            do
            {
              a2 = (void *)v9[2];
              BOOL v13 = *a2 == (void)v9;
              uint64_t v9 = a2;
            }
            while (!v13);
          }
          if (!v8) {
            break;
          }
          uint64_t v9 = a2;
        }
        while (a2 != a3);
      }
    }
    uint64_t result = (uint64_t *)std::__tree<std::string>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)v18);
  }
  if (a2 != a3)
  {
    do
    {
      memset(v18, 170, sizeof(v18));
      std::__tree<std::string>::__construct_node<std::string const&>((uint64_t)v5, (uint64_t)(a2 + 4), v18);
      uint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
      long long v14 = (uint64_t **)std::__tree<std::string>::__find_leaf_high((uint64_t)v5, &v17, v18[0] + 4);
      uint64_t result = std::__tree<std::string>::__insert_node_at(v5, v17, v14, v18[0]);
      uint64_t v15 = (void *)a2[1];
      if (v15)
      {
        do
        {
          BOOL v16 = v15;
          uint64_t v15 = (void *)*v15;
        }
        while (v15);
      }
      else
      {
        do
        {
          BOOL v16 = (void *)a2[2];
          BOOL v13 = *v16 == (void)a2;
          a2 = v16;
        }
        while (!v13);
      }
      a2 = v16;
    }
    while (v16 != a3);
  }
  return result;
}

void sub_21E075C58(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__tree<std::string>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::__tree<std::string>::__find_leaf_high(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        uint64_t v5 = (void *)v4;
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a3, (void **)(v4 + 32)) & 0x80) == 0) {
          break;
        }
        uint64_t v4 = *v5;
        uint64_t result = v5;
        if (!*v5) {
          goto LABEL_8;
        }
      }
      uint64_t v4 = v5[1];
    }
    while (v4);
    uint64_t result = v5 + 1;
  }
  else
  {
    uint64_t result = (void *)(a1 + 8);
  }
LABEL_8:
  *a2 = v5;
  return result;
}

void *std::__tree<std::string>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 16);
  if (result)
  {
    long long v3 = (void *)*result;
    if (*result == a1)
    {
      void *result = 0;
      while (1)
      {
        uint64_t v4 = (void *)result[1];
        if (!v4) {
          break;
        }
        do
        {
          uint64_t result = v4;
          uint64_t v4 = (void *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; long long v3 = (void *)result[1])
      {
        do
        {
          uint64_t result = v3;
          long long v3 = (void *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t std::__tree<std::string>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  std::__tree<std::string>::destroy(*(void *)a1, *(char **)(a1 + 16));
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 16);
    if (v3)
    {
      do
      {
        uint64_t v2 = v3;
        uint64_t v3 = *(void *)(v3 + 16);
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    std::__tree<std::string>::destroy(*(void *)a1, (char *)v2);
  }
  return a1;
}

void *std::shared_ptr<TelephonyXPC::ServerClientState::State>::shared_ptr[abi:ne180100]<TelephonyXPC::ServerClientState::State,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = operator new(0x20uLL);
  void *v4 = &unk_26CEE4C78;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_21E075DF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  a10 = 0;
  if (v10) {
    std::default_delete<TelephonyXPC::ServerClientState::State>::operator()[abi:ne180100]((uint64_t)&a10, v10);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<TelephonyXPC::ServerClientState::State *,std::shared_ptr<TelephonyXPC::ServerClientState::State>::__shared_ptr_default_delete<TelephonyXPC::ServerClientState::State,TelephonyXPC::ServerClientState::State>,std::allocator<TelephonyXPC::ServerClientState::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<TelephonyXPC::ServerClientState::State *,std::shared_ptr<TelephonyXPC::ServerClientState::State>::__shared_ptr_default_delete<TelephonyXPC::ServerClientState::State,TelephonyXPC::ServerClientState::State>,std::allocator<TelephonyXPC::ServerClientState::State>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::ServerClientState::State *,std::shared_ptr<TelephonyXPC::ServerClientState::State>::__shared_ptr_default_delete<TelephonyXPC::ServerClientState::State,TelephonyXPC::ServerClientState::State>,std::allocator<TelephonyXPC::ServerClientState::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::default_delete<TelephonyXPC::ServerClientState::State>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    std::__tree<std::string>::destroy(a2 + 56, *(char **)(a2 + 64));
    std::__tree<std::string>::destroy(a2 + 32, *(char **)(a2 + 40));
    if (*(char *)(a2 + 23) < 0) {
      operator delete(*(void **)a2);
    }
    operator delete((void *)a2);
  }
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

uint64_t TelephonyUtilGetSystemTime()
{
  return MEMORY[0x270F970B8]();
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

uint64_t ctu::LogMessageBuffer::createWithFormat(ctu::LogMessageBuffer *this, const char *a2, ...)
{
  return MEMORY[0x270F973F8](this, a2);
}

uint64_t ctu::LogMessageBuffer::LogMessageBuffer(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x270F97410](this);
}

void ctu::LogMessageBuffer::~LogMessageBuffer(ctu::LogMessageBuffer *this)
{
}

uint64_t ctu::LoggerCommonBase::setLogLevel()
{
  return MEMORY[0x270F97420]();
}

uint64_t ctu::LoggerCommonBase::LoggerCommonBase()
{
  return MEMORY[0x270F97430]();
}

{
  return MEMORY[0x270F97438]();
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x270F97550]();
}

uint64_t ctu::power::manager::registerListener()
{
  return MEMORY[0x270F97100]();
}

uint64_t ctu::power::manager::get(ctu::power::manager *this)
{
  return MEMORY[0x270F97108](this);
}

uint64_t ctu::XpcServer::startListener_sync(ctu::XpcServer *this)
{
  return MEMORY[0x270F97760](this);
}

uint64_t ctu::XpcServer::XpcServer()
{
  return MEMORY[0x270F97768]();
}

void ctu::XpcServer::~XpcServer(ctu::XpcServer *this)
{
}

uint64_t ctu::operator<<()
{
  return MEMORY[0x270F977A0]();
}

{
  return MEMORY[0x270F977A8]();
}

{
  return MEMORY[0x270F977C0]();
}

{
  return MEMORY[0x270F977C8]();
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x270F977D8]();
}

{
  return MEMORY[0x270F977E0]();
}

{
  return MEMORY[0x270F977F0]();
}

uint64_t xpc::bridge()
{
  return MEMORY[0x270F97830]();
}

uint64_t ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog()
{
  return MEMORY[0x270F97838]();
}

uint64_t ctu::LoggerCommonBase::getLogLevel(ctu::LoggerCommonBase *this)
{
  return MEMORY[0x270F978D0](this);
}

uint64_t xpc::object::to_string(xpc::object *this)
{
  return MEMORY[0x270F97948](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x270EDB4D0](*(void *)&a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

void syslog(int a1, const char *a2, ...)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBEA0](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x270EDBF50]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
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