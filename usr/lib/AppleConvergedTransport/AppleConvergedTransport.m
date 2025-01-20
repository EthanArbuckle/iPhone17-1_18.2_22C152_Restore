uint64_t std::shared_ptr<pci::event::Listener>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

double AppleConvergedTransportInitParameters(uint64_t a1)
{
  if (a1) {
    return pci::transport::th::initParams(a1);
  }
  return result;
}

uint64_t AppleConvergedTransportCreate(uint64_t a1, void *a2)
{
  if (a2)
  {
    a1 = pci::transport::th::validateParams((pci::log *)a1);
    if (a1)
    {
      *a2 = 0;
      memset(buf, 170, sizeof(buf));
      pci::transport::th::create(buf);
    }
  }
  v3 = pci::log::get((pci::log *)a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_26361C000, v3, OS_LOG_TYPE_DEFAULT, "bad parameter", buf, 2u);
  }
  return 0;
}

void sub_26361DA40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AppleConvergedTransportFree(unint64_t *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a1)
  {
    unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
    v10 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
    pci::system::info::get(&buf);
    pci::system::info::getTH((os_unfair_lock_s *)buf, *a1, &v9);
    v2 = (pci::log *)*((void *)&buf + 1);
    if (*((void *)&buf + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
    }
    unint64_t v3 = v9;
    if (v9)
    {
      pci::system::info::get(&buf);
      pci::system::info::eraseTH((pci::system::info *)buf, *a1);
      if (*((void *)&buf + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
      }
    }
    else
    {
      v7 = pci::log::get(v2);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v8 = *a1;
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_26361C000, v7, OS_LOG_TYPE_DEFAULT, "handle %p is not valid", (uint8_t *)&buf, 0xCu);
      }
    }
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    }
    if (v3)
    {
      *a1 = 0;
      return 1;
    }
  }
  else
  {
    v4 = pci::log::get(0);
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v5) {
      return result;
    }
    LOWORD(v9) = 0;
    _os_log_impl(&dword_26361C000, v4, OS_LOG_TYPE_DEFAULT, "bad parameter", (uint8_t *)&v9, 2u);
  }
  return 0;
}

void sub_26361DBE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, uint64_t a12)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void (*AppleConvergedTransportWrite(pci::log *a1, const unsigned __int8 *a2, int a3, _DWORD *a4, int a5, void (*a6)(void *)))(void *)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3 && a2 && a4)
  {
    *a4 = 0;
    v14 = (pci::log *)0xAAAAAAAAAAAAAAAALL;
    v15 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
    pci::system::info::get(&buf);
    pci::system::info::getTH((os_unfair_lock_s *)buf, (unint64_t)a1, &v14);
    if (*((void *)&buf + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
    }
    if (v14)
    {
      if (*((unsigned char *)v14 + 75)) {
        pci::transport::th::writeAsync(v14, a2, a3, a6);
      }
      pci::transport::th::write(v14, a2, a3, a6, a5);
    }
    uint64_t v12 = pci::log::get(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a1;
      _os_log_impl(&dword_26361C000, v12, OS_LOG_TYPE_DEFAULT, "handle %p is not valid", (uint8_t *)&buf, 0xCu);
    }
    if (a6)
    {
      a6((void *)a2);
      a6 = 0;
    }
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
  }
  else
  {
    v11 = pci::log::get(a1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_26361C000, v11, OS_LOG_TYPE_DEFAULT, "invalid parameter", (uint8_t *)&v14, 2u);
    }
    if (a6)
    {
      a6((void *)a2);
      return 0;
    }
  }
  return a6;
}

void sub_26361DDEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, uint64_t a12)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void (*AppleConvergedTransportRead(pci::log *a1, const unsigned __int8 *a2, unsigned int a3, _DWORD *a4, int a5, void (*a6)(void *)))(void *)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unsigned int v19 = a3;
  if (a3 && a2 && a4)
  {
    *a4 = 0;
    uint64_t v17 = (pci::log *)0xAAAAAAAAAAAAAAAALL;
    v18 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
    pci::system::info::get(&buf);
    pci::system::info::getTH((os_unfair_lock_s *)buf, (unint64_t)a1, &v17);
    if (*((void *)&buf + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
    }
    if (v17)
    {
      if (!*((unsigned char *)v17 + 75)) {
        pci::transport::th::read(v17, a2, &v19, a6, a5);
      }
      v10 = pci::log::get(v17);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      LOWORD(buf) = 0;
      v11 = "client cannot issue read for async transport";
      uint64_t v12 = v10;
      uint32_t v13 = 2;
    }
    else
    {
      v15 = pci::log::get(0);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
LABEL_17:
        if (a6)
        {
          a6((void *)a2);
          a6 = 0;
        }
        if (v18) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v18);
        }
        return a6;
      }
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a1;
      v11 = "handle %p is not valid";
      uint64_t v12 = v15;
      uint32_t v13 = 12;
    }
    _os_log_impl(&dword_26361C000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&buf, v13);
    goto LABEL_17;
  }
  v14 = pci::log::get(a1);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_26361C000, v14, OS_LOG_TYPE_DEFAULT, "invalid parameter", (uint8_t *)&v17, 2u);
  }
  if (a6)
  {
    a6((void *)a2);
    return 0;
  }
  return a6;
}

void sub_26361E000(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void (*AppleConvergedTransportSendImage(pci::log *a1, const unsigned __int8 *a2, int a3, _DWORD *a4, int a5, _DWORD *a6, void (*a7)(void *)))(void *)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unsigned int v17 = 0;
  if (a3 && a2 && a4 && a6)
  {
    *a4 = 0;
    *a6 = 0;
    v15 = (pci::log *)0xAAAAAAAAAAAAAAAALL;
    v16 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
    pci::system::info::get(&buf);
    pci::system::info::getTH((os_unfair_lock_s *)buf, (unint64_t)a1, &v15);
    if (*((void *)&buf + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
    }
    if (v15)
    {
      if (*((unsigned char *)v15 + 75)) {
        pci::transport::th::sendImageAsync(v15, a2, a3, a7);
      }
      pci::transport::th::sendImage(v15, a2, a3, &v17, a7, a5);
    }
    uint32_t v13 = pci::log::get(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a1;
      _os_log_impl(&dword_26361C000, v13, OS_LOG_TYPE_DEFAULT, "handle %p is not valid", (uint8_t *)&buf, 0xCu);
    }
    if (a7)
    {
      a7((void *)a2);
      a7 = 0;
    }
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
  }
  else
  {
    uint64_t v12 = pci::log::get(a1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_26361C000, v12, OS_LOG_TYPE_DEFAULT, "invalid parameter", (uint8_t *)&v15, 2u);
    }
    if (a7)
    {
      a7((void *)a2);
      return 0;
    }
  }
  return a7;
}

void sub_26361E218(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AppleConvergedTransportReadRegister(pci::log *a1, int a2, const unsigned __int8 *a3, unsigned int a4, _DWORD *a5)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unsigned int v13 = a4;
  if (a4 && a3 && a5)
  {
    *a5 = 0;
    v11 = (pci::log *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v12 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
    pci::system::info::get(&buf);
    pci::system::info::getTH((os_unfair_lock_s *)buf, (unint64_t)a1, &v11);
    if (*((void *)&buf + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
    }
    if (v11) {
      pci::transport::th::readRegister(v11, a2, a3, &v13, -1);
    }
    unint64_t v9 = pci::log::get(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a1;
      _os_log_impl(&dword_26361C000, v9, OS_LOG_TYPE_DEFAULT, "handle %p is not valid", (uint8_t *)&buf, 0xCu);
    }
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
  }
  else
  {
    unint64_t v8 = pci::log::get(a1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_26361C000, v8, OS_LOG_TYPE_DEFAULT, "invalid parameters", (uint8_t *)&v11, 2u);
    }
  }
  return 0;
}

void sub_26361E3CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

BOOL AppleConvergedTransportIsValid(unint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
  v7 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, a1, &v6);
  v2 = (pci::log *)*((void *)&buf + 1);
  if (*((void *)&buf + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
  }
  unint64_t v3 = v6;
  if (!v6)
  {
    v4 = pci::log::get(v2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a1;
      _os_log_impl(&dword_26361C000, v4, OS_LOG_TYPE_DEFAULT, "handle %p is not valid", (uint8_t *)&buf, 0xCu);
    }
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return v3 != 0;
}

void sub_26361E4EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, uint64_t a12)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AppleConvergedTransportRegisterEventBlock(uint64_t a1)
{
  std::mutex::lock(&eventLock);
  if (!(void)eventListener)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 0x40000000;
    aBlock[2] = __AppleConvergedTransportRegisterEventBlock_block_invoke;
    aBlock[3] = &unk_2655D23C0;
    aBlock[4] = a1;
    v4 = _Block_copy(aBlock);
    if (v4) {
      _Block_copy(v4);
    }
    pci::event::Listener::create();
  }
  unint64_t v3 = pci::log::get(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_26361C000, v3, OS_LOG_TYPE_DEFAULT, "another block is already registered", buf, 2u);
  }
  std::mutex::unlock(&eventLock);
  return 0;
}

void sub_26361E698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *aBlock)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v10) {
    _Block_release(v10);
  }
  std::mutex::unlock(&eventLock);
  _Unwind_Resume(a1);
}

uint64_t __AppleConvergedTransportRegisterEventBlock_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*((char *)a3 + 23) < 0) {
    a3 = (uint64_t *)*a3;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *))(v3 + 16))(v3, a2, a3);
}

uint64_t AppleConvergedTransportRegisterEventBlockQ(uint64_t a1)
{
  std::mutex::lock(&eventLock);
  if (!(void)eventListener)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 0x40000000;
    aBlock[2] = __AppleConvergedTransportRegisterEventBlockQ_block_invoke;
    aBlock[3] = &unk_2655D23E8;
    aBlock[4] = a1;
    v4 = _Block_copy(aBlock);
    if (v4) {
      _Block_copy(v4);
    }
    pci::event::Listener::create();
  }
  uint64_t v3 = pci::log::get(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_26361C000, v3, OS_LOG_TYPE_DEFAULT, "another block is already registered", buf, 2u);
  }
  std::mutex::unlock(&eventLock);
  return 0;
}

void sub_26361E878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *aBlock)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v10) {
    _Block_release(v10);
  }
  std::mutex::unlock(&eventLock);
  _Unwind_Resume(a1);
}

uint64_t __AppleConvergedTransportRegisterEventBlockQ_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*((char *)a3 + 23) < 0) {
    a3 = (uint64_t *)*a3;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *))(v3 + 16))(v3, a2, a3);
}

BOOL AppleConvergedTransportUnregisterEventBlock()
{
  std::mutex::lock(&eventLock);
  uint64_t v1 = eventListener;
  if ((void)eventListener)
  {
    v2 = (std::__shared_weak_count *)*((void *)&eventListener + 1);
    eventListener = 0uLL;
    if (v2) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v2);
    }
  }
  else
  {
    uint64_t v3 = pci::log::get(v0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_26361C000, v3, OS_LOG_TYPE_DEFAULT, "no block registered", v5, 2u);
    }
  }
  std::mutex::unlock(&eventLock);
  return v1 != 0;
}

void sub_26361E988(_Unwind_Exception *a1)
{
}

uint64_t AppleConvergedTransportRegisterTimeSyncEventBlock()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  std::mutex::lock(&eventLock);
  if (!timesyncListener) {
    operator new();
  }
  uint64_t v1 = pci::log::get(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_26361C000, v1, OS_LOG_TYPE_DEFAULT, "another block is already registered", buf, 2u);
  }
  std::mutex::unlock(&eventLock);
  return 0;
}

void sub_26361EB8C(_Unwind_Exception *a1)
{
}

uint64_t AppleConvergedTransportRegisterTimeSyncEventBlockQ()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  std::mutex::lock(&eventLock);
  if (!timesyncListener) {
    operator new();
  }
  uint64_t v1 = pci::log::get(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_26361C000, v1, OS_LOG_TYPE_DEFAULT, "another block is already registered", buf, 2u);
  }
  std::mutex::unlock(&eventLock);
  return 0;
}

void sub_26361EDC0(_Unwind_Exception *a1)
{
}

pci::log *AppleConvergedTransportUnregisterTimeSyncEventBlock()
{
  std::mutex::lock(&eventLock);
  if (timesyncListener)
  {
    ACIPCBTControlClass::deregisterEventNotification((ACIPCBTControlClass *)timesyncListener, 0);
    v0 = (pci::log *)ACIPCBTControlClass::stop((ACIPCBTControlClass *)timesyncListener);
    uint64_t v1 = v0;
    if ((v0 & 1) == 0)
    {
      v2 = pci::log::get(v0);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v6[0] = 0;
        _os_log_impl(&dword_26361C000, v2, OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::stop() returned failure", (uint8_t *)v6, 2u);
      }
    }
    if (timesyncListener)
    {
      uint64_t v3 = MEMORY[0x263E65FA0]();
      MEMORY[0x263E66140](v3, 0x10A0C404E5F9E8ELL);
    }
    timesyncListener = 0;
  }
  else
  {
    uint64_t v4 = pci::log::get(0);
    uint64_t v1 = 0;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_26361C000, v4, OS_LOG_TYPE_DEFAULT, "no block registered", buf, 2u);
      uint64_t v1 = 0;
    }
  }
  std::mutex::unlock(&eventLock);
  return v1;
}

void sub_26361EF1C(_Unwind_Exception *a1)
{
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void __clang_call_terminate(void *a1)
{
}

uint64_t _GLOBAL__sub_I_AppleConvergedTransport_cpp()
{
  __cxa_atexit(MEMORY[0x263F8C118], &eventLock, &dword_26361C000);

  return __cxa_atexit((void (*)(void *))std::shared_ptr<pci::event::Listener>::~shared_ptr[abi:ne180100], &eventListener, &dword_26361C000);
}

void pci::system::info::get(void *a1@<X8>)
{
  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<pci::system::info>::~shared_ptr[abi:ne180100], &pci::system::info::get(void)::sInstance, &dword_26361C000);
  }
  if (pci::system::info::get(void)::sOnce != -1) {
    dispatch_once(&pci::system::info::get(void)::sOnce, &__block_literal_global);
  }
  uint64_t v3 = *((void *)&pci::system::info::get(void)::sInstance + 1);
  *a1 = pci::system::info::get(void)::sInstance;
  a1[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
}

uint64_t std::shared_ptr<pci::system::info>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void ___ZN3pci6system4info3getEv_block_invoke()
{
}

void sub_26361F1A0(_Unwind_Exception *a1)
{
  MEMORY[0x263E66140](v1, 0x1020C40399D3DCFLL);
  _Unwind_Resume(a1);
}

pci::system::info *pci::system::info::info(pci::system::info *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 4) = 0;
  v2 = (pci::log *)dispatch_workloop_create("com.apple.AppleConvergedIPC.pci_workloop");
  *((void *)this + 11) = 0;
  *((void *)this + 10) = (char *)this + 88;
  *((void *)this + 3) = v2;
  *((void *)this + 5) = 0;
  *((void *)this + 4) = (char *)this + 40;
  *((void *)this + 8) = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = (char *)this + 64;
  *((void *)this + 9) = 0;
  *((void *)this + 12) = 0;
  uint64_t v3 = pci::log::get(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    pci::system::info::info(v3);
  }
  return this;
}

void sub_26361F270(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;
  std::__tree<std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>>>::destroy(v5, *(void **)(v1 + 88));
  std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::destroy(v4, *(void **)(v1 + 64));
  std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::destroy(v2, *(void **)(v1 + 40));
  v7 = *(std::__shared_weak_count **)(v1 + 8);
  if (v7) {
    std::__shared_weak_count::__release_weak(v7);
  }
  _Unwind_Resume(a1);
}

void pci::system::info::~info(dispatch_object_t *this)
{
  dispatch_release(this[3]);
  uint64_t v3 = pci::log::get(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    pci::system::info::info(v3);
  }
  std::__tree<std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>>>::destroy((uint64_t)(this + 10), this[11]);
  std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::destroy((uint64_t)(this + 7), this[8]);
  std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::destroy((uint64_t)(this + 4), this[5]);
  uint64_t v4 = (std::__shared_weak_count *)this[1];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
}

void pci::system::info::lock(os_unfair_lock_s *this)
{
}

void pci::system::info::unlock(os_unfair_lock_s *this)
{
}

uint64_t pci::system::info::insertTH(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  uint64_t v5 = ++pci::system::info::insertTH(std::shared_ptr<pci::transport::th>)::unique;
  uint64_t v7 = *a2;
  unint64_t v6 = (std::__shared_weak_count *)a2[1];
  *(void *)&long long v9 = pci::system::info::insertTH(std::shared_ptr<pci::transport::th>)::unique;
  *((void *)&v9 + 1) = v7;
  v10 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__emplace_multi<std::pair<void const*,std::shared_ptr<pci::transport::th>>>((uint64_t **)(a1 + 32), &v9);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  os_unfair_lock_unlock(v4);
  return v5;
}

void sub_26361F3D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t pci::system::info::eraseTH(pci::system::info *this, unint64_t a2)
{
  uint64_t v4 = (os_unfair_lock_s *)((char *)this + 16);
  os_unfair_lock_lock((os_unfair_lock_t)this + 4);
  uint64_t v5 = (void *)*((void *)this + 5);
  if (!v5) {
    goto LABEL_12;
  }
  unint64_t v6 = (uint64_t *)((char *)this + 40);
  do
  {
    unint64_t v7 = v5[4];
    BOOL v8 = v7 >= a2;
    if (v7 >= a2) {
      long long v9 = v5;
    }
    else {
      long long v9 = v5 + 1;
    }
    if (v8) {
      unint64_t v6 = v5;
    }
    uint64_t v5 = (void *)*v9;
  }
  while (*v9);
  if (v6 == (uint64_t *)((char *)this + 40) || v6[4] > a2) {
LABEL_12:
  }
    pci::system::info::eraseTH();
  std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::erase((uint64_t **)this + 4, v6);
  os_unfair_lock_unlock(v4);
  return 1;
}

void pci::system::info::getTH(os_unfair_lock_s *this@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  unint64_t v6 = this + 4;
  os_unfair_lock_lock(this + 4);
  long long v9 = *(void **)&this[10]._os_unfair_lock_opaque;
  BOOL v8 = this + 10;
  unint64_t v7 = v9;
  if (v9)
  {
    v10 = v8;
    do
    {
      unint64_t v11 = v7[4];
      BOOL v12 = v11 >= a2;
      if (v11 >= a2) {
        unsigned int v13 = v7;
      }
      else {
        unsigned int v13 = v7 + 1;
      }
      if (v12) {
        v10 = (os_unfair_lock_s *)v7;
      }
      unint64_t v7 = (void *)*v13;
    }
    while (*v13);
    if (v10 != v8 && *(void *)&v10[8]._os_unfair_lock_opaque <= a2)
    {
      uint64_t v15 = *(void *)&v10[10]._os_unfair_lock_opaque;
      uint64_t v14 = *(void *)&v10[12]._os_unfair_lock_opaque;
      if (v14) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 8), 1uLL, memory_order_relaxed);
      }
      *a3 = v15;
      a3[1] = v14;
    }
  }

  os_unfair_lock_unlock(v6);
}

uint64_t pci::system::info::insertBH(uint64_t a1, uint64_t a2, uint64_t **a3, unsigned int a4)
{
  int v75 = a2;
  BOOL v8 = pci::log::get((pci::log *)a1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    pci::system::info::insertBH(a2, v8, v9, v10, v11, v12, v13, v14);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  uint64_t v15 = *(void *)(a1 + 64);
  if (!v15) {
    goto LABEL_13;
  }
  uint64_t v16 = a1 + 64;
  do
  {
    int v17 = *(_DWORD *)(v15 + 32);
    BOOL v18 = v17 < v75;
    if (v17 >= v75) {
      uint64_t v19 = (uint64_t *)v15;
    }
    else {
      uint64_t v19 = (uint64_t *)(v15 + 8);
    }
    if (!v18) {
      uint64_t v16 = v15;
    }
    uint64_t v15 = *v19;
  }
  while (*v19);
  if (v16 != a1 + 64 && v75 >= *(_DWORD *)(v16 + 32))
  {
    v35 = (uint64_t *)(a1 + 88);
    uint64_t v34 = *(void *)(a1 + 88);
    if (!v34) {
      goto LABEL_31;
    }
    uint64_t v36 = a1 + 88;
    do
    {
      int v37 = *(_DWORD *)(v34 + 32);
      BOOL v38 = v37 < v75;
      if (v37 >= v75) {
        v39 = (uint64_t *)v34;
      }
      else {
        v39 = (uint64_t *)(v34 + 8);
      }
      if (!v38) {
        uint64_t v36 = v34;
      }
      uint64_t v34 = *v39;
    }
    while (*v39);
    if ((uint64_t *)v36 != v35 && v75 >= *(_DWORD *)(v36 + 32))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      v55 = pci::log::get(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
        pci::system::info::insertBH((uint64_t)&v75, v55, v56, v57, v58, v59, v60, v61);
      }
      return 0;
    }
    else
    {
LABEL_31:
      uint64_t v71 = 0;
      v72 = &v71;
      uint64_t v73 = 0x2000000000;
      char v74 = 1;
      v65 = 0;
      v66 = &v65;
      uint64_t v67 = 0x3002000000;
      v68 = __Block_byref_object_copy_;
      v69 = __Block_byref_object_dispose_;
      dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
      dispatch_object_t object = dispatch_semaphore_create(0);
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 1174405120;
      v62[2] = ___ZN3pci6system4info8insertBHEiNSt3__18weak_ptrINS_9transport2bhEEEj_block_invoke;
      v62[3] = &unk_270EA1820;
      v62[4] = &v71;
      int v64 = v75;
      v41 = *a3;
      v40 = (std::__shared_weak_count *)a3[1];
      v62[6] = a1;
      v62[7] = v41;
      v63 = v40;
      if (v40) {
        atomic_fetch_add_explicit(&v40->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      }
      v62[5] = &v65;
      v42 = _Block_copy(v62);
      v43 = (void (**)(void, void))v42;
      if (v42) {
        v44 = (uint64_t *)_Block_copy(v42);
      }
      else {
        v44 = 0;
      }
      v76 = &v75;
      v45 = std::__tree<std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)(a1 + 80), &v75, (uint64_t)&std::piecewise_construct, &v76);
      v46 = v45[5];
      v45[5] = v44;
      if (v46) {
        _Block_release(v46);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      v47 = v66;
      if (a4 == -1) {
        dispatch_time_t v48 = -1;
      }
      else {
        dispatch_time_t v48 = dispatch_time(0, 1000000 * a4);
      }
      if (dispatch_semaphore_wait((dispatch_semaphore_t)v47[5], v48))
      {
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
        if (v43)
        {
          uint64_t v49 = *v35;
          if (*v35)
          {
            uint64_t v50 = a1 + 88;
            do
            {
              int v51 = *(_DWORD *)(v49 + 32);
              BOOL v52 = v51 < v75;
              if (v51 >= v75) {
                v53 = (uint64_t *)v49;
              }
              else {
                v53 = (uint64_t *)(v49 + 8);
              }
              if (!v52) {
                uint64_t v50 = v49;
              }
              uint64_t v49 = *v53;
            }
            while (*v53);
            if ((uint64_t *)v50 != v35 && v75 >= *(_DWORD *)(v50 + 32))
            {
              v43[2](v43, 0);
              std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__remove_node_pointer((uint64_t **)(a1 + 80), (uint64_t *)v50);
              std::__destroy_at[abi:ne180100]<std::pair<int const,applesauce::dispatch::v1::block<void ()(BOOL)>>,0>(v50 + 32);
              operator delete((void *)v50);
            }
          }
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
        dispatch_semaphore_wait((dispatch_semaphore_t)v66[5], 0xFFFFFFFFFFFFFFFFLL);
      }
      BOOL v32 = *((unsigned char *)v72 + 24) != 0;
      if (v63) {
        std::__shared_weak_count::__release_weak(v63);
      }
      _Block_object_dispose(&v65, 8);
      if (object) {
        dispatch_release(object);
      }
      if (v43) {
        _Block_release(v43);
      }
      _Block_object_dispose(&v71, 8);
    }
  }
  else
  {
LABEL_13:
    v65 = &v75;
    v20 = std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)(a1 + 56), &v75, (uint64_t)&std::piecewise_construct, &v65);
    v22 = *a3;
    uint64_t v21 = a3[1];
    if (v21) {
      atomic_fetch_add_explicit(v21 + 2, 1uLL, memory_order_relaxed);
    }
    v23 = (std::__shared_weak_count *)v20[6];
    v20[5] = v22;
    v20[6] = v21;
    if (v23) {
      std::__shared_weak_count::__release_weak(v23);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    v25 = pci::log::get(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      pci::system::info::insertBH((uint64_t)&v75, v25, v26, v27, v28, v29, v30, v31);
    }
    return 1;
  }
  return v32;
}

void sub_26361F93C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,dispatch_object_t object)
{
  if (a17) {
    std::__shared_weak_count::__release_weak(a17);
  }
  _Block_object_dispose(&a19, 8);
  if (object) {
    dispatch_release(object);
  }
  if (v24) {
    _Block_release(v24);
  }
  _Block_object_dispose((const void *)(v25 - 112), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 40) = v3;
  if (v3) {
    dispatch_retain(v3);
  }
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

intptr_t ___ZN3pci6system4info8insertBHEiNSt3__18weak_ptrINS_9transport2bhEEEj_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = pci::log::get((pci::log *)a1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    ___ZN3pci6system4info8insertBHEiNSt3__18weak_ptrINS_9transport2bhEEEj_block_invoke_cold_1(a2, v5, v6, v7, v8, v9, v10, v11);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 2os_unfair_lock_unlock(this + 4) = a2;
  if (a2)
  {
    int v17 = (_DWORD *)(a1 + 72);
    uint64_t v12 = std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)(v4 + 56), (int *)(a1 + 72), (uint64_t)&std::piecewise_construct, &v17);
    uint64_t v14 = *(uint64_t **)(a1 + 56);
    uint64_t v13 = *(uint64_t **)(a1 + 64);
    if (v13) {
      atomic_fetch_add_explicit(v13 + 2, 1uLL, memory_order_relaxed);
    }
    uint64_t v15 = (std::__shared_weak_count *)v12[6];
    v12[5] = v14;
    v12[6] = v13;
    if (v15) {
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t __copy_helper_block_e8_56c42_ZTSNSt3__18weak_ptrIN3pci9transport2bhEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 64);
  *(void *)(result + 56) = *(void *)(a2 + 56);
  *(void *)(result + 6os_unfair_lock_unlock(this + 4) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_56c42_ZTSNSt3__18weak_ptrIN3pci9transport2bhEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 64);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

uint64_t pci::system::info::removeBH(uint64_t **this, uint64_t a2)
{
  uint64_t v4 = pci::log::get((pci::log *)this);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    pci::system::info::insertBH(a2, v4, v5, v6, v7, v8, v9, v10);
  }
  uint64_t v11 = (os_unfair_lock_s *)(this + 2);
  os_unfair_lock_lock((os_unfair_lock_t)this + 4);
  uint64_t v12 = this[8];
  if (!v12) {
    goto LABEL_13;
  }
  uint64_t v13 = (uint64_t *)(this + 8);
  do
  {
    int v14 = *((_DWORD *)v12 + 8);
    BOOL v15 = v14 < (int)a2;
    if (v14 >= (int)a2) {
      uint64_t v16 = v12;
    }
    else {
      uint64_t v16 = v12 + 1;
    }
    if (!v15) {
      uint64_t v13 = v12;
    }
    uint64_t v12 = (uint64_t *)*v16;
  }
  while (*v16);
  if (v13 == (uint64_t *)(this + 8) || *((_DWORD *)v13 + 8) > (int)a2) {
LABEL_13:
  }
    pci::system::info::removeBH();
  std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::erase(this + 7, v13);
  uint64_t v19 = this[11];
  BOOL v18 = this + 11;
  int v17 = (char *)v19;
  if (v19)
  {
    v20 = v18;
    do
    {
      int v21 = *((_DWORD *)v17 + 8);
      BOOL v22 = v21 < (int)a2;
      if (v21 >= (int)a2) {
        v23 = (char **)v17;
      }
      else {
        v23 = (char **)(v17 + 8);
      }
      if (!v22) {
        v20 = (uint64_t **)v17;
      }
      int v17 = *v23;
    }
    while (*v23);
    if (v20 != v18 && *((_DWORD *)v20 + 8) <= (int)a2)
    {
      ((void (*)(void))v20[5][2])();
      std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__remove_node_pointer(v18 - 1, (uint64_t *)v20);
      std::__destroy_at[abi:ne180100]<std::pair<int const,applesauce::dispatch::v1::block<void ()(BOOL)>>,0>((uint64_t)(v20 + 4));
      operator delete(v20);
    }
  }
  os_unfair_lock_unlock(v11);
  return 1;
}

void std::shared_ptr<pci::system::info>::shared_ptr[abi:ne180100]<pci::system::info,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_26361FC7C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<pci::system::info>::reset[abi:ne180100]((dispatch_object_t **)va, 0);
  _Unwind_Resume(a1);
}

void std::shared_ptr<pci::system::info>::__enable_weak_this[abi:ne180100]<pci::system::info,pci::system::info,void>(uint64_t a1, void *a2, uint64_t a3)
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

void std::__shared_ptr_pointer<pci::system::info *,std::shared_ptr<pci::system::info>::__shared_ptr_default_delete<pci::system::info,pci::system::info>,std::allocator<pci::system::info>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x263E66140);
}

dispatch_object_t *std::__shared_ptr_pointer<pci::system::info *,std::shared_ptr<pci::system::info>::__shared_ptr_default_delete<pci::system::info,pci::system::info>,std::allocator<pci::system::info>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(dispatch_object_t **)(a1 + 24);
  if (result)
  {
    pci::system::info::~info(result);
    JUMPOUT(0x263E66140);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<pci::system::info *,std::shared_ptr<pci::system::info>::__shared_ptr_default_delete<pci::system::info,pci::system::info>,std::allocator<pci::system::info>>::__get_deleter(uint64_t a1, uint64_t a2)
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

dispatch_object_t *std::unique_ptr<pci::system::info>::reset[abi:ne180100](dispatch_object_t **a1, dispatch_object_t *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    pci::system::info::~info(result);
    JUMPOUT(0x263E66140);
  }
  return result;
}

void std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::destroy(a1, a2[1]);
    uint64_t v4 = (std::__shared_weak_count *)a2[6];
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    operator delete(a2);
  }
}

void std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::destroy(a1, a2[1]);
    uint64_t v4 = (std::__shared_weak_count *)a2[6];
    if (v4) {
      std::__shared_weak_count::__release_weak(v4);
    }
    operator delete(a2);
  }
}

void std::__tree<std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<int const,applesauce::dispatch::v1::block<void ()(BOOL)>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<int const,applesauce::dispatch::v1::block<void ()(BOOL)>>,0>(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 8);
  if (v1) {
    _Block_release(v1);
  }
}

_OWORD *std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__emplace_multi<std::pair<void const*,std::shared_ptr<pci::transport::th>>>(uint64_t **a1, long long *a2)
{
  uint64_t v4 = operator new(0x38uLL);
  long long v5 = *a2;
  uint64_t v6 = *((void *)a2 + 2);
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  uint64_t v7 = a1 + 1;
  uint64_t v8 = a1[1];
  v4[2] = v5;
  *((void *)v4 + 6) = v6;
  if (v8)
  {
    do
    {
      while (1)
      {
        uint64_t v7 = (uint64_t **)v8;
        if ((unint64_t)v5 >= v8[4]) {
          break;
        }
        uint64_t v8 = (uint64_t *)*v8;
        uint64_t v9 = v7;
        if (!*v7) {
          goto LABEL_8;
        }
      }
      uint64_t v8 = (uint64_t *)v8[1];
    }
    while (v8);
    uint64_t v9 = v7 + 1;
  }
  else
  {
    uint64_t v9 = a1 + 1;
  }
LABEL_8:
  std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, (uint64_t)v7, v9, (uint64_t *)v4);
  return v4;
}

uint64_t *std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  long long v5 = (uint64_t *)**a1;
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
  *((unsigned char *)a2 + 2os_unfair_lock_unlock(this + 4) = a2 == result;
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
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), long long v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            uint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            uint64_t v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *uint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 2os_unfair_lock_unlock(this + 4) = 1;
          *((unsigned char *)v3 + 2os_unfair_lock_unlock(this + 4) = 0;
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
        *((unsigned char *)a2 + 2os_unfair_lock_unlock(this + 4) = 1;
        *((unsigned char *)v3 + 2os_unfair_lock_unlock(this + 4) = 0;
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
      *((unsigned char *)v2 + 2os_unfair_lock_unlock(this + 4) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 2os_unfair_lock_unlock(this + 4) = v3 == result;
      *long long v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::erase(uint64_t **a1, uint64_t *a2)
{
  uint64_t v3 = std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__remove_node_pointer(a1, a2);
  uint64_t v4 = (std::__shared_weak_count *)a2[6];
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  operator delete(a2);
  return v3;
}

uint64_t *std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
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
  int v6 = a1[1];
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
  int v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *int v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0;
      uint64_t result = (uint64_t *)v2;
    }
    else
    {
      uint64_t v7 = v6[1];
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
    *((unsigned char *)v3 + 2os_unfair_lock_unlock(this + 4) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 2os_unfair_lock_unlock(this + 4) = 1;
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
      *((unsigned char *)v7 + 2os_unfair_lock_unlock(this + 4) = 1;
      *(unsigned char *)(v12 + 2os_unfair_lock_unlock(this + 4) = 0;
      uint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      *uint64_t v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        uint64_t result = v7;
      }
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    BOOL v15 = (void *)*v7;
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
        *((unsigned char *)v15 + 2os_unfair_lock_unlock(this + 4) = 1;
        *((unsigned char *)v7 + 2os_unfair_lock_unlock(this + 4) = 0;
        uint64_t v22 = v15[1];
        uint64_t *v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        uint64_t v16 = v7;
      }
      else
      {
        BOOL v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 2os_unfair_lock_unlock(this + 4) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 2os_unfair_lock_unlock(this + 4) = 1;
      *((unsigned char *)v16 + 2os_unfair_lock_unlock(this + 4) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      uint64_t *v24 = v23;
      goto LABEL_72;
    }
    uint64_t v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 2os_unfair_lock_unlock(this + 4) = 0;
    int v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      int v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 2os_unfair_lock_unlock(this + 4) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    uint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 2os_unfair_lock_unlock(this + 4) = 1;
    *(unsigned char *)(v12 + 2os_unfair_lock_unlock(this + 4) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      uint64_t result = v7;
    }
    uint64_t v7 = *(uint64_t **)v12;
  }
  uint64_t v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 2os_unfair_lock_unlock(this + 4) = 0;
    int v17 = (uint64_t *)v7[2];
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
    v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 2os_unfair_lock_unlock(this + 4) = 1;
    *((unsigned char *)v7 + 2os_unfair_lock_unlock(this + 4) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    uint64_t *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    uint64_t v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 2os_unfair_lock_unlock(this + 4) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 2os_unfair_lock_unlock(this + 4) = 1;
  *((unsigned char *)v19 + 2os_unfair_lock_unlock(this + 4) = 1;
  v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

uint64_t **std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  int v6 = a1[1];
  if (v6)
  {
    int v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        int v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      int v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = operator new(0x38uLL);
    v11[8] = **a4;
    *((void *)v11 + 5) = 0;
    *((void *)v11 + 6) = 0;
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t **std::__tree<std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  int v6 = a1[1];
  int v8 = a1 + 1;
  uint64_t v9 = a1 + 1;
  if (v6)
  {
    int v10 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        int v11 = *((_DWORD *)v6 + 8);
        if (v10 >= v11) {
          break;
        }
        int v6 = *v9;
        int v8 = v9;
        if (!*v9) {
          goto LABEL_9;
        }
      }
      if (v11 >= v10) {
        break;
      }
      int v6 = v9[1];
      if (!v6)
      {
        int v8 = v9 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v12 = operator new(0x30uLL);
    v14[1] = v7;
    v12[8] = **a4;
    *((void *)v12 + 5) = 0;
    LOBYTE(v15) = 1;
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, (uint64_t)v9, v8, (uint64_t *)v12);
    v14[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>,void *>>>>::reset[abi:ne180100]((uint64_t)v14, 0);
    return (uint64_t **)v12;
  }
  return v9;
}

void std::unique_ptr<std::__tree_node<std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<int,applesauce::dispatch::v1::block<void ()(BOOL)>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<int const,applesauce::dispatch::v1::block<void ()(BOOL)>>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

uint64_t *std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::erase(uint64_t **a1, uint64_t *a2)
{
  uint64_t v3 = std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__remove_node_pointer(a1, a2);
  uint64_t v4 = (std::__shared_weak_count *)a2[6];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  operator delete(a2);
  return v3;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

uint64_t std::map<PCITransportRegister,unsigned int>::~map[abi:ne180100](uint64_t a1)
{
  return a1;
}

void pci::transport::bh::create(void *a1@<X8>)
{
  *a1 = 0xAAAAAAAAAAAAAAAALL;
  a1[1] = 0xAAAAAAAAAAAAAAAALL;
  operator new();
}

void sub_2636209C4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t pci::transport::bh::init(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2000000000;
  int v19 = *(_DWORD *)(a2 + 8);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2000000000;
  char v17 = 1;
  v14[0] = 0;
  v14[1] = v14;
  void v14[2] = 0x3002000000;
  v14[3] = __Block_byref_object_copy__0;
  v14[4] = __Block_byref_object_dispose__0;
  unint64_t v15 = 0;
  uint64_t v4 = pci::log::get((pci::log *)a1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    pci::transport::bh::init();
  }
  uint64_t v5 = *(void *)(a1 + 88);
  uint64_t v6 = *(unsigned int *)(a1 + 28);
  std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(buf, (void *)a1);
  uint64_t v12 = *(uint64_t **)buf;
  uint64_t v13 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8]) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 16), 1uLL, memory_order_relaxed);
  }
  char inserted = pci::system::info::insertBH(v5, v6, &v12, *(_DWORD *)(a2 + 4));
  if (v13) {
    std::__shared_weak_count::__release_weak(v13);
  }
  int v8 = *(pci::log **)&buf[8];
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  if (inserted)
  {
    *(unsigned char *)(a1 + 32) = 1;
    operator new();
  }
  uint64_t v9 = pci::log::get(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *(_DWORD *)(a1 + 28);
    *(_DWORD *)long long buf = 136315650;
    *(void *)&uint8_t buf[4] = "bh";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a1;
    __int16 v21 = 1024;
    int v22 = v10;
    _os_log_impl(&dword_26361C000, v9, OS_LOG_TYPE_DEFAULT, "%s::%p::%d:failed to insert in system", buf, 0x1Cu);
  }
  _Block_object_dispose(v14, 8);
  if (v15) {
    _Block_release(v15);
  }
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
  return 0;
}

void sub_2636211CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,std::__shared_weak_count *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,std::__shared_weak_count *a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,std::__shared_weak_count *a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,dispatch_object_t object,uint64_t a50,std::__shared_weak_count *a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *aBlock,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  uint64_t v66 = 0;
  uint64_t v67 = v64 - 256;
  do
  {
    if (*(char *)(v67 + v66 + 127) < 0) {
      operator delete(*(void **)(v67 + v66 + 104));
    }
    v66 -= 32;
  }
  while (v66 != -128);
  if (a26) {
    std::__shared_weak_count::__release_weak(a26);
  }
  if (a33) {
    std::__shared_weak_count::__release_weak(a33);
  }
  if (a41) {
    std::__shared_weak_count::__release_weak(a41);
  }
  if (object)
  {
    dispatch_release(object);
    if (!v63)
    {
LABEL_13:
      if (!v62) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if (!v63)
  {
    goto LABEL_13;
  }
  dispatch_release(v63);
  if (!v62)
  {
LABEL_15:
    _Block_object_dispose(&a52, 8);
    if (aBlock) {
      _Block_release(aBlock);
    }
    _Block_object_dispose(&a58, 8);
    _Block_object_dispose(&a62, 8);
    _Unwind_Resume(a1);
  }
LABEL_14:
  std::__shared_weak_count::__release_weak(v62);
  goto LABEL_15;
}

uint64_t pci::transport::bh::bh(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  std::string::basic_string[abi:ne180100]<0>(v13, "pci_transport_bh");
  std::string::basic_string[abi:ne180100]<0>(v11, "_");
  p_p = (const char *)&__p;
  pci::transport::bh::generateString(a1, (uint64_t)v13, (uint64_t)v11);
  if (v16 < 0) {
    p_p = (const char *)__p;
  }
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  uint64_t v6 = dispatch_queue_attr_make_with_qos_class(initially_inactive, (dispatch_qos_class_t)*(_DWORD *)(a2 + 32), 0);
  *(void *)(a1 + 16) = dispatch_queue_create(p_p, v6);
  if (v16 < 0) {
    operator delete(__p);
  }
  if (v12 < 0) {
    operator delete(v11[0]);
  }
  if (v14 < 0) {
    operator delete(v13[0]);
  }
  *(_DWORD *)(a1 + 28) = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 2os_unfair_lock_unlock(this + 4) = 0;
  *(_WORD *)(a1 + 32) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 6os_unfair_lock_unlock(this + 4) = a1 + 64;
  *(void *)(a1 + 72) = a1 + 64;
  *(void *)(a1 + 80) = 0;
  pci::system::info::get((void *)(a1 + 88));
  uint64_t v7 = *(NSObject **)(a2 + 16);
  *(void *)(a1 + 10os_unfair_lock_unlock(this + 4) = v7;
  if (v7)
  {
    dispatch_retain(v7);
    dispatch_group_enter(v7);
  }
  dispatch_set_target_queue(*(dispatch_object_t *)(a1 + 16), *(dispatch_queue_t *)(a2 + 24));
  dispatch_activate(*(dispatch_object_t *)(a1 + 16));
  uint64_t v9 = pci::log::get(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    pci::transport::bh::bh();
  }
  return a1;
}

void sub_26362150C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  applesauce::dispatch::v1::group_session::~group_session(v23);
  uint64_t v25 = (std::__shared_weak_count *)v21[12];
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  std::__list_imp<void const*>::clear(v22);
  uint64_t v26 = (std::__shared_weak_count *)v21[7];
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
  uint64_t v27 = v21[2];
  if (v27) {
    dispatch_release(v27);
  }
  uint64_t v28 = (std::__shared_weak_count *)v21[1];
  if (v28) {
    std::__shared_weak_count::__release_weak(v28);
  }
  _Unwind_Resume(a1);
}

uint64_t pci::transport::bh::generateString(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v18[7] = v5;
  v18[8] = v5;
  v18[5] = v5;
  v18[6] = v5;
  void v18[3] = v5;
  v18[4] = v5;
  v18[1] = v5;
  v18[2] = v5;
  long long v17 = v5;
  v18[0] = v5;
  *(_OWORD *)__p = v5;
  long long v16 = v5;
  void v14[2] = v5;
  v14[3] = v5;
  v14[0] = v5;
  v14[1] = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v14);
  int v6 = *(char *)(a2 + 23);
  if (v6 >= 0) {
    uint64_t v7 = a2;
  }
  else {
    uint64_t v7 = *(void *)a2;
  }
  if (v6 >= 0) {
    uint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v8 = *(void *)(a2 + 8);
  }
  uint64_t v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, v7, v8);
  int v10 = *(char *)(a3 + 23);
  if (v10 >= 0) {
    uint64_t v11 = a3;
  }
  else {
    uint64_t v11 = *(void *)a3;
  }
  if (v10 >= 0) {
    uint64_t v12 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    uint64_t v12 = *(void *)(a3 + 8);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, v11, v12);
  std::ostream::operator<<();
  std::stringbuf::str();
  *(void *)&v14[0] = *MEMORY[0x263F8C2C8];
  *(void *)((char *)v14 + *(void *)(*(void *)&v14[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v14[0] + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v16) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x263E66110](v18);
}

void sub_263621740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void applesauce::dispatch::v1::group_session::~group_session(dispatch_object_t *this)
{
  uint64_t v2 = *this;
  if (v2)
  {
    dispatch_group_leave(v2);
    if (*this) {
      dispatch_release(*this);
    }
  }
}

void pci::transport::bh::~bh(uint64_t ***this)
{
  uint64_t v2 = pci::log::get((pci::log *)this);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    pci::transport::bh::init();
  }
  if (this[10]) {
    __assert_rtn("~bh", "PCITransportBH.cpp", 79, "fCBL.empty()");
  }
  uint64_t v3 = (pci::transport::task *)this[6];
  if (v3)
  {
    pci::transport::task::complete(v3, -536870183, 0, -1);
    uint64_t v4 = (std::__shared_weak_count *)this[7];
    this[6] = 0;
    this[7] = 0;
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
  if (this[5])
  {
    uint64_t v5 = MEMORY[0x263E65F30]();
    MEMORY[0x263E66140](v5, 0x10F0C40BBF4CE08);
    this[5] = 0;
  }
  if (*((unsigned char *)this + 32))
  {
    pci::system::info::removeBH(this[11], *((unsigned int *)this + 7));
    *((unsigned char *)this + 32) = 0;
  }
  int v6 = (std::__shared_weak_count *)this[12];
  this[11] = 0;
  this[12] = 0;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  uint64_t v7 = pci::log::get((pci::log *)v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    pci::transport::bh::~bh();
  }
  uint64_t v8 = this[13];
  if (v8)
  {
    dispatch_group_leave(v8);
    uint64_t v9 = this[13];
    if (v9) {
      dispatch_release(v9);
    }
  }
  int v10 = (std::__shared_weak_count *)this[12];
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  std::__list_imp<void const*>::clear(this + 8);
  uint64_t v11 = (std::__shared_weak_count *)this[7];
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  uint64_t v12 = this[2];
  if (v12) {
    dispatch_release(v12);
  }
  uint64_t v13 = (std::__shared_weak_count *)this[1];
  if (v13) {
    std::__shared_weak_count::__release_weak(v13);
  }
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

intptr_t ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = pci::log::get((pci::log *)a1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v17 = *(_DWORD *)(v8 + 28);
    int v18 = 136316418;
    unint64_t v19 = "bh";
    __int16 v20 = 2048;
    uint64_t v21 = v8;
    __int16 v22 = 1024;
    int v23 = v17;
    __int16 v24 = 1024;
    int v25 = a2;
    __int16 v26 = 1024;
    int v27 = a3;
    __int16 v28 = 1024;
    int v29 = a4;
    _os_log_debug_impl(&dword_26361C000, v9, OS_LOG_TYPE_DEBUG, "%s::%p::%d:in addComp added %u, started %u, service 0x%x", (uint8_t *)&v18, 0x2Eu);
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(v8 + 24));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 2os_unfair_lock_unlock(this + 4) = a2 & a3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_12;
  }
  int v10 = (pci::log *)ACIPCBTClass::open(*(ACIPCBTClass **)(v8 + 40));
  if (!v10) {
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  }
  int v11 = (int)v10;
  if (v10 != -536870203)
  {
    char v14 = pci::log::get(v10);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = *(_DWORD *)(v8 + 28);
      int v18 = 136315906;
      unint64_t v19 = "bh";
      __int16 v20 = 2048;
      uint64_t v21 = v8;
      __int16 v22 = 1024;
      int v23 = v15;
      __int16 v24 = 1024;
      int v25 = v11;
      _os_log_impl(&dword_26361C000, v14, OS_LOG_TYPE_DEFAULT, "%s::%p::%d:failed to open 0x%x", (uint8_t *)&v18, 0x22u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 2os_unfair_lock_unlock(this + 4) = 0;
LABEL_12:
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 2os_unfair_lock_unlock(this + 4) = 0;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  }
  uint64_t v12 = pci::log::get(v10);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = *(_DWORD *)(v8 + 28);
    int v18 = 136315906;
    unint64_t v19 = "bh";
    __int16 v20 = 2048;
    uint64_t v21 = v8;
    __int16 v22 = 1024;
    int v23 = v13;
    __int16 v24 = 1024;
    int v25 = -536870203;
    _os_log_impl(&dword_26361C000, v12, OS_LOG_TYPE_DEFAULT, "%s::%p::%d:failed to open 0x%x", (uint8_t *)&v18, 0x22u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 2os_unfair_lock_unlock(this + 4) = 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void __copy_helper_block_e8_56c40_ZTSN10applesauce8dispatch2v19semaphoreE(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(a2 + 56);
  *(void *)(a1 + 56) = v3;
  if (v3) {
    dispatch_retain(v3);
  }
}

void __destroy_helper_block_e8_56c40_ZTSN10applesauce8dispatch2v19semaphoreE(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 56);
  if (v1) {
    dispatch_release(v1);
  }
}

void ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_5(void *a1, uint64_t a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a1[7];
  if (v3)
  {
    uint64_t v5 = (os_unfair_lock_s *)a1[5];
    int v6 = (pci::log *)std::__shared_weak_count::lock(v3);
    if (v6)
    {
      uint64_t v7 = (std::__shared_weak_count *)v6;
      if (a1[6])
      {
        uint64_t v8 = pci::log::get(v6);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_5_cold_1();
        }
        uint64_t v9 = v5 + 6;
        os_unfair_lock_lock(v9);
        uint64_t v10 = *(void *)(*(void *)(a1[4] + 8) + 40);
        if (v10)
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, 1, 1, a2);
          uint64_t v11 = *(void *)(a1[4] + 8);
          uint64_t v12 = *(const void **)(v11 + 40);
          *(void *)(v11 + 40) = 0;
          if (v12) {
            _Block_release(v12);
          }
        }
        os_unfair_lock_unlock(v9);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
}

void sub_263621C98(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_48c42_ZTSNSt3__18weak_ptrIN3pci9transport2bhEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 56);
  *(void *)(result + 48) = *(void *)(a2 + 48);
  *(void *)(result + 56) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_48c42_ZTSNSt3__18weak_ptrIN3pci9transport2bhEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_8(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = (pci::log *)std::__shared_weak_count::lock(v2);
    if (v4)
    {
      uint64_t v5 = (std::__shared_weak_count *)v4;
      if (a1[5])
      {
        int v6 = pci::log::get(v4);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_8_cold_2();
        }
        uint64_t v7 = (os_unfair_lock_s *)(v3 + 24);
        os_unfair_lock_lock((os_unfair_lock_t)(v3 + 24));
        uint64_t v9 = (void *)(v3 + 48);
        if (*(void *)(v3 + 48))
        {
          if (!*(unsigned char *)(v3 + 33)) {
            __assert_rtn("init_block_invoke", "PCITransportBH.cpp", 236, "fActive");
          }
          uint64_t v10 = pci::log::get(v8);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_8_cold_1();
          }
          uint64_t v12 = *(pci::transport::task **)(v3 + 48);
          uint64_t v11 = *(std::__shared_weak_count **)(v3 + 56);
          *uint64_t v9 = 0;
          v9[1] = 0;
          os_unfair_lock_unlock(v7);
          if (v12) {
            pci::transport::task::complete(v12, 0, 0, 0);
          }
          if (v11) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v11);
          }
        }
        else
        {
          os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 24));
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
}

void sub_263621E00(_Unwind_Exception *a1)
{
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c42_ZTSNSt3__18weak_ptrIN3pci9transport2bhEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c42_ZTSNSt3__18weak_ptrIN3pci9transport2bhEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_11(void *a1, int a2, int a3, int a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v5 = (std::__shared_weak_count *)a1[6];
  if (v5)
  {
    uint64_t v9 = (os_unfair_lock_s *)a1[4];
    uint64_t v10 = std::__shared_weak_count::lock(v5);
    if (v10)
    {
      uint64_t v11 = v10;
      if (a1[5])
      {
        os_unfair_lock_lock(v9 + 6);
        int v13 = pci::log::get(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint32_t os_unfair_lock_opaque = v9[7]._os_unfair_lock_opaque;
          int v15 = 136316674;
          long long v16 = "bh";
          __int16 v17 = 2048;
          int v18 = v9;
          __int16 v19 = 1024;
          uint32_t v20 = os_unfair_lock_opaque;
          __int16 v21 = 2080;
          uint64_t ACIPCErrorTypeString = getACIPCErrorTypeString();
          __int16 v23 = 1024;
          int v24 = a2;
          __int16 v25 = 1024;
          int v26 = a3;
          __int16 v27 = 1024;
          int v28 = a4;
          _os_log_impl(&dword_26361C000, v13, OS_LOG_TYPE_DEFAULT, "%s::%p::%d:%s (%u): param 0x%x: status 0x%x", (uint8_t *)&v15, 0x38u);
        }
        os_unfair_lock_unlock(v9 + 6);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
}

void sub_263621FA8(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void pci::transport::bh::setNotify(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  if (*(void *)(a1 + 48)) {
    pci::transport::bh::setNotify();
  }
  uint64_t v6 = *a2;
  uint64_t v5 = a2[1];
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v7 = *(std::__shared_weak_count **)(a1 + 56);
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v5;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }

  os_unfair_lock_unlock(v4);
}

void pci::transport::bh::generateCallback(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, void *a5@<X8>)
{
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3802000000;
  v28[3] = __Block_byref_object_copy__17;
  v28[4] = __Block_byref_object_dispose__18;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v30 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(&v29, (void *)a1);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2000000000;
  char v27 = 0;
  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x2000000000;
  uint64_t v25 = 0;
  *a5 = 0xAAAAAAAAAAAAAAAALL;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN3pci9transport2bh16generateCallbackENSt3__110shared_ptrINS0_4taskEEEPKcb_block_invoke;
  aBlock[3] = &unk_270EA19A0;
  aBlock[4] = v28;
  void aBlock[5] = v26;
  char v21 = a4;
  aBlock[6] = &v22;
  aBlock[7] = a1;
  uint64_t v11 = *a2;
  uint64_t v10 = (std::__shared_weak_count *)a2[1];
  aBlock[8] = a3;
  aBlock[9] = v11;
  uint32_t v20 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v12 = _Block_copy(aBlock);
  *a5 = v12;
  v23[3] = (uint64_t)v12;
  int v13 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  char v14 = v23;
  int v15 = operator new(0x18uLL);
  uint64_t v16 = v14[3];
  uint64_t v18 = *(void *)(a1 + 64);
  __int16 v17 = (void *)(a1 + 64);
  v15[1] = v17;
  v15[2] = v16;
  void *v15 = v18;
  *(void *)(v18 + 8) = v15;
  *__int16 v17 = v15;
  ++v17[2];
  os_unfair_lock_unlock(v13);
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
}

void sub_26362220C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  if (v26) {
    _Block_release(v26);
  }
  if (a20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a20);
  }
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v27 - 120), 8);
  unint64_t v29 = *(std::__shared_weak_count **)(v27 - 72);
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__17(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void ___ZN3pci9transport2bh16generateCallbackENSt3__110shared_ptrINS0_4taskEEEPKcb_block_invoke(uint64_t a1, int a2, unsigned int a3, int a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(void *)(a1 + 56);
  os_unfair_lock_lock((os_unfair_lock_t)(v8 + 24));
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v8 + 16));
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v10 + 24)) {
    ___ZN3pci9transport2bh16generateCallbackENSt3__110shared_ptrINS0_4taskEEEPKcb_block_invoke_cold_1();
  }
  *(unsigned char *)(v10 + 2os_unfair_lock_unlock(this + 4) = 1;
  uint64_t v11 = pci::log::get(v9);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    int v17 = *(_DWORD *)(v8 + 28);
    uint64_t v18 = *(void *)(a1 + 64);
    int v19 = 136316674;
    uint32_t v20 = "bh";
    __int16 v21 = 2048;
    uint64_t v22 = v8;
    __int16 v23 = 1024;
    int v24 = v17;
    __int16 v25 = 2080;
    uint64_t v26 = v18;
    __int16 v27 = 1024;
    int v28 = a2;
    __int16 v29 = 1024;
    unsigned int v30 = a3;
    __int16 v31 = 1024;
    int v32 = a4;
    _os_log_debug_impl(&dword_26361C000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d:%s complete 0x%x, size %u, cookie %u", (uint8_t *)&v19, 0x38u);
  }
  if (*(unsigned char *)(a1 + 88)) {
    BOOL v13 = a2 == -536870168;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13) {
    a2 = 0;
  }
  if (a2)
  {
    char v14 = pci::log::get((pci::log *)v12);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = *(_DWORD *)(v8 + 28);
      uint64_t v16 = *(void *)(a1 + 64);
      int v19 = 136316674;
      uint32_t v20 = "bh";
      __int16 v21 = 2048;
      uint64_t v22 = v8;
      __int16 v23 = 1024;
      int v24 = v15;
      __int16 v25 = 2080;
      uint64_t v26 = v16;
      __int16 v27 = 1024;
      int v28 = a2;
      __int16 v29 = 1024;
      unsigned int v30 = a3;
      __int16 v31 = 1024;
      int v32 = a4;
      _os_log_impl(&dword_26361C000, v14, OS_LOG_TYPE_DEFAULT, "%s::%p::%d:%s failed, complete 0x%x, size %u, cookie %u", (uint8_t *)&v19, 0x38u);
    }
  }
  std::list<void const*>::remove(v8 + 64, (void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 24));
  pci::transport::task::complete(*(pci::transport::task **)(a1 + 72), a2, a3, a4);
}

void *std::list<void const*>::remove(uint64_t a1, void *a2)
{
  v10[0] = (uint64_t)v10;
  v10[1] = (uint64_t)v10;
  v10[2] = 0;
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2 != (void *)a1)
  {
    do
    {
      uint64_t v6 = (void *)v2[1];
      uint64_t v5 = v2[2];
      if (v5 == *a2)
      {
        if (v6 == (void *)a1)
        {
          BOOL v8 = 1;
LABEL_8:
          uint64_t v6 = (void *)a1;
        }
        else
        {
          while (1)
          {
            uint64_t v7 = v6[2];
            BOOL v8 = v7 == v5;
            if (v7 != v5) {
              break;
            }
            uint64_t v6 = (void *)v6[1];
            if (v6 == (void *)a1) {
              goto LABEL_8;
            }
          }
        }
        std::list<void const*>::splice((uint64_t)v10, v10, a1, v2, v6);
        if (!v8) {
          uint64_t v6 = (void *)v6[1];
        }
      }
      uint64_t v2 = v6;
    }
    while (v6 != (void *)a1);
  }
  return std::__list_imp<void const*>::clear(v10);
}

void sub_263622568(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__list_imp<void const*>::clear((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_72c47_ZTSNSt3__110shared_ptrIN3pci9transport4taskEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 80);
  *(void *)(result + 72) = *(void *)(a2 + 72);
  *(void *)(result + 80) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_72c47_ZTSNSt3__110shared_ptrIN3pci9transport4taskEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 80);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void pci::transport::bh::invokeCallbackAsync(uint64_t a1, void **a2, int a3, int a4, int a5)
{
  BOOL v8 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZN3pci9transport2bh19invokeCallbackAsyncEN10applesauce8dispatch2v15blockIFvijjEEEijj_block_invoke;
  block[3] = &__block_descriptor_tmp_23_0;
  uint64_t v9 = *a2;
  if (*a2) {
    uint64_t v9 = _Block_copy(v9);
  }
  aBlock = v9;
  int v12 = a3;
  int v13 = a4;
  int v14 = a5;
  dispatch_async(v8, block);
  if (aBlock) {
    _Block_release(aBlock);
  }
}

uint64_t ___ZN3pci9transport2bh19invokeCallbackAsyncEN10applesauce8dispatch2v15blockIFvijjEEEijj_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 48));
}

void *__copy_helper_block_e8_32c44_ZTSN10applesauce8dispatch2v15blockIFvijjEEE(uint64_t a1, uint64_t a2)
{
  __n128 result = *(void **)(a2 + 32);
  if (result) {
    __n128 result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c44_ZTSN10applesauce8dispatch2v15blockIFvijjEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void pci::transport::bh::open(os_unfair_lock_s *a1, uint64_t *a2, int a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = (std::__shared_weak_count *)a2[1];
  v15[0] = *a2;
  v15[1] = (uint64_t)v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  aBlock = (void *)0xAAAAAAAAAAAAAAAALL;
  pci::transport::bh::generateCallback((uint64_t)a1, v15, (uint64_t)"open pipe", 0, &aBlock);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  os_unfair_lock_lock(a1 + 6);
  if (a1[7]._os_unfair_lock_opaque == 1)
  {
    uint64_t v6 = aBlock;
    if (aBlock)
    {
      uint64_t v7 = _Block_copy(aBlock);
      int v14 = v7;
      pci::transport::bh::invokeCallbackAsync((uint64_t)a1, &v14, 0, 0, 0);
      if (v7) {
        _Block_release(v7);
      }
    }
    else
    {
      int v14 = 0;
      pci::transport::bh::invokeCallbackAsync((uint64_t)a1, &v14, 0, 0, 0);
    }
  }
  else
  {
    if (!a3) {
      __assert_rtn("open", "PCITransportBH.cpp", 408, "dir != kPCITransportDirectionInvalid");
    }
    uint64_t v6 = aBlock;
    _Block_copy(aBlock);
    started = (pci::log *)ACIPCBTClass::startChannelAsync();
    int v9 = (int)started;
    if (started)
    {
      uint64_t v10 = pci::log::get(started);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint32_t os_unfair_lock_opaque = a1[7]._os_unfair_lock_opaque;
        *(_DWORD *)long long buf = 136315906;
        uint64_t v18 = "bh";
        __int16 v19 = 2048;
        uint32_t v20 = a1;
        __int16 v21 = 1024;
        uint32_t v22 = os_unfair_lock_opaque;
        __int16 v23 = 1024;
        int v24 = v9;
        _os_log_impl(&dword_26361C000, v10, OS_LOG_TYPE_DEFAULT, "%s::%p::%d:open pipe failed 0x%x", buf, 0x22u);
      }
      if (v6)
      {
        int v12 = _Block_copy(v6);
        int v13 = v12;
        pci::transport::bh::invokeCallbackAsync((uint64_t)a1, &v13, v9, 0, 0);
        if (v12) {
          _Block_release(v12);
        }
      }
      else
      {
        int v13 = 0;
        pci::transport::bh::invokeCallbackAsync((uint64_t)a1, &v13, v9, 0, 0);
      }
      _Block_release(v6);
    }
  }
  os_unfair_lock_unlock(a1 + 6);
  if (v6) {
    _Block_release(v6);
  }
}

void sub_263622948(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void pci::transport::bh::cmdCompletion(pci::transport::bh *this, void *a2)
{
  if (!this || (uint64_t v3 = _Block_copy(this), (v4 = v3) == 0)) {
    pci::transport::bh::cmdCompletion();
  }
  (*((void (**)(void *, void *, void, void))v3 + 2))(v3, a2, 0, 0);
  _Block_release(v4);
  _Block_release(v4);
}

void sub_263622A10(_Unwind_Exception *a1)
{
  _Block_release(v1);
  _Unwind_Resume(a1);
}

void pci::transport::bh::close(os_unfair_lock_s *a1, uint64_t *a2, int a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = (std::__shared_weak_count *)a2[1];
  v15[0] = *a2;
  v15[1] = (uint64_t)v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  aBlock = (void *)0xAAAAAAAAAAAAAAAALL;
  pci::transport::bh::generateCallback((uint64_t)a1, v15, (uint64_t)"close pipe", 0, &aBlock);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  os_unfair_lock_lock(a1 + 6);
  if (a1[7]._os_unfair_lock_opaque == 1)
  {
    uint64_t v6 = aBlock;
    if (aBlock)
    {
      uint64_t v7 = _Block_copy(aBlock);
      int v14 = v7;
      pci::transport::bh::invokeCallbackAsync((uint64_t)a1, &v14, 0, 0, 0);
      if (v7) {
        _Block_release(v7);
      }
    }
    else
    {
      int v14 = 0;
      pci::transport::bh::invokeCallbackAsync((uint64_t)a1, &v14, 0, 0, 0);
    }
  }
  else
  {
    if (!a3) {
      __assert_rtn("close", "PCITransportBH.cpp", 439, "dir != kPCITransportDirectionInvalid");
    }
    uint64_t v6 = aBlock;
    _Block_copy(aBlock);
    BOOL v8 = (pci::log *)ACIPCBTClass::abortChannelAsync();
    int v9 = (int)v8;
    if (v8)
    {
      uint64_t v10 = pci::log::get(v8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint32_t os_unfair_lock_opaque = a1[7]._os_unfair_lock_opaque;
        *(_DWORD *)long long buf = 136315906;
        uint64_t v18 = "bh";
        __int16 v19 = 2048;
        uint32_t v20 = a1;
        __int16 v21 = 1024;
        uint32_t v22 = os_unfair_lock_opaque;
        __int16 v23 = 1024;
        int v24 = v9;
        _os_log_impl(&dword_26361C000, v10, OS_LOG_TYPE_DEFAULT, "%s::%p::%d:close pipe failed 0x%x", buf, 0x22u);
      }
      if (v6)
      {
        int v12 = _Block_copy(v6);
        int v13 = v12;
        pci::transport::bh::invokeCallbackAsync((uint64_t)a1, &v13, v9, 0, 0);
        if (v12) {
          _Block_release(v12);
        }
      }
      else
      {
        int v13 = 0;
        pci::transport::bh::invokeCallbackAsync((uint64_t)a1, &v13, v9, 0, 0);
      }
      _Block_release(v6);
    }
  }
  os_unfair_lock_unlock(a1 + 6);
  if (v6) {
    _Block_release(v6);
  }
}

void sub_263622CA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void pci::transport::bh::write(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(std::__shared_weak_count **)(a2 + 8);
  v16[0] = *(void *)a2;
  v16[1] = (uint64_t)v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  aBlock = (void *)0xAAAAAAAAAAAAAAAALL;
  pci::transport::bh::generateCallback(a1, v16, (uint64_t)"write", 0, &aBlock);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  uint64_t v5 = *(ACIPCBTClass **)(a1 + 40);
  Data = (const void *)pci::transport::task::getData(*(pci::transport::task **)a2);
  uint64_t Size = pci::transport::task::getSize(*(pci::transport::task **)a2);
  BOOL v8 = aBlock;
  int v9 = _Block_copy(aBlock);
  uint64_t v10 = (pci::log *)ACIPCBTClass::writeAsync(v5, Data, Size, (void (*)(void *, int, void *))pci::transport::bh::ioCompletion, v9);
  int v11 = (int)v10;
  if (v10)
  {
    int v12 = pci::log::get(v10);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)long long buf = 136315906;
      __int16 v19 = "bh";
      __int16 v20 = 2048;
      uint64_t v21 = a1;
      __int16 v22 = 1024;
      int v23 = v13;
      __int16 v24 = 1024;
      int v25 = v11;
      _os_log_impl(&dword_26361C000, v12, OS_LOG_TYPE_DEFAULT, "%s::%p::%d:write failed 0x%x", buf, 0x22u);
    }
    if (v8)
    {
      int v14 = _Block_copy(v8);
      int v15 = v14;
      pci::transport::bh::invokeCallbackAsync(a1, &v15, v11, 0, 0);
      if (v14) {
        _Block_release(v14);
      }
    }
    else
    {
      int v15 = 0;
      pci::transport::bh::invokeCallbackAsync(a1, &v15, v11, 0, 0);
    }
    _Block_release(v8);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v8) {
    _Block_release(v8);
  }
}

void sub_263622F00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void pci::transport::bh::ioCompletion(pci::transport::bh *this, void *a2, uint64_t a3, void *a4)
{
  if (!this || (uint64_t v6 = _Block_copy(this), (v7 = v6) == 0)) {
    pci::transport::bh::ioCompletion();
  }
  (*((void (**)(void *, void *, uint64_t, void))v6 + 2))(v6, a2, a3, 0);
  _Block_release(v7);
  _Block_release(v7);
}

void sub_263622FC8(_Unwind_Exception *a1)
{
  _Block_release(v1);
  _Unwind_Resume(a1);
}

void pci::transport::bh::read(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(std::__shared_weak_count **)(a2 + 8);
  v17[0] = *(void *)a2;
  v17[1] = (uint64_t)v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  aBlock = (void *)0xAAAAAAAAAAAAAAAALL;
  pci::transport::bh::generateCallback(a1, v17, (uint64_t)"read", a3, &aBlock);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  uint64_t v6 = *(ACIPCBTClass **)(a1 + 40);
  Data = (void *)pci::transport::task::getData(*(pci::transport::task **)a2);
  uint64_t Size = pci::transport::task::getSize(*(pci::transport::task **)a2);
  int v9 = aBlock;
  uint64_t v10 = _Block_copy(aBlock);
  Async = (pci::log *)ACIPCBTClass::readAsync(v6, Data, Size, (void (*)(void *, int, void *))pci::transport::bh::ioCompletion, v10);
  int v12 = (int)Async;
  if (Async)
  {
    int v13 = pci::log::get(Async);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)long long buf = 136315906;
      __int16 v20 = "bh";
      __int16 v21 = 2048;
      uint64_t v22 = a1;
      __int16 v23 = 1024;
      int v24 = v14;
      __int16 v25 = 1024;
      int v26 = v12;
      _os_log_impl(&dword_26361C000, v13, OS_LOG_TYPE_DEFAULT, "%s::%p::%d:read failed 0x%x", buf, 0x22u);
    }
    if (v9)
    {
      int v15 = _Block_copy(v9);
      uint64_t v16 = v15;
      pci::transport::bh::invokeCallbackAsync(a1, &v16, v12, 0, 0);
      if (v15) {
        _Block_release(v15);
      }
    }
    else
    {
      uint64_t v16 = 0;
      pci::transport::bh::invokeCallbackAsync(a1, &v16, v12, 0, 0);
    }
    _Block_release(v9);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v9) {
    _Block_release(v9);
  }
}

void sub_2636231E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void pci::transport::bh::sendImage(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(std::__shared_weak_count **)(a2 + 8);
  v16[0] = *(void *)a2;
  v16[1] = (uint64_t)v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  aBlock = (void *)0xAAAAAAAAAAAAAAAALL;
  pci::transport::bh::generateCallback(a1, v16, (uint64_t)"send image", 0, &aBlock);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  uint64_t v5 = *(ACIPCBTClass **)(a1 + 40);
  Data = (const void *)pci::transport::task::getData(*(pci::transport::task **)a2);
  uint64_t Size = pci::transport::task::getSize(*(pci::transport::task **)a2);
  BOOL v8 = aBlock;
  int v9 = _Block_copy(aBlock);
  uint64_t v10 = (pci::log *)ACIPCBTClass::sendImageAsync(v5, Data, Size, (void (*)(void *, int, void *, void *))pci::transport::bh::imageCompletion, v9);
  int v11 = (int)v10;
  if (v10)
  {
    int v12 = pci::log::get(v10);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)long long buf = 136315906;
      __int16 v19 = "bh";
      __int16 v20 = 2048;
      uint64_t v21 = a1;
      __int16 v22 = 1024;
      int v23 = v13;
      __int16 v24 = 1024;
      int v25 = v11;
      _os_log_impl(&dword_26361C000, v12, OS_LOG_TYPE_DEFAULT, "%s::%p::%d:send image failed 0x%x", buf, 0x22u);
    }
    if (v8)
    {
      int v14 = _Block_copy(v8);
      int v15 = v14;
      pci::transport::bh::invokeCallbackAsync(a1, &v15, v11, 0, 0);
      if (v14) {
        _Block_release(v14);
      }
    }
    else
    {
      int v15 = 0;
      pci::transport::bh::invokeCallbackAsync(a1, &v15, v11, 0, 0);
    }
    _Block_release(v8);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v8) {
    _Block_release(v8);
  }
}

void sub_263623430(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void pci::transport::bh::imageCompletion(pci::transport::bh *this, void *a2, uint64_t a3, void *a4, void *a5)
{
  if (!this || (BOOL v8 = _Block_copy(this), (v9 = v8) == 0)) {
    pci::transport::bh::imageCompletion();
  }
  (*((void (**)(void *, void *, uint64_t, void *))v8 + 2))(v8, a2, a3, a4);
  _Block_release(v9);
  _Block_release(v9);
}

void sub_263623500(_Unwind_Exception *a1)
{
  _Block_release(v1);
  _Unwind_Resume(a1);
}

void pci::transport::bh::readRegister(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(std::__shared_weak_count **)(a2 + 8);
  v18[0] = *(void *)a2;
  v18[1] = (uint64_t)v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  aBlock = (void *)0xAAAAAAAAAAAAAAAALL;
  pci::transport::bh::generateCallback(a1, v18, (uint64_t)"read register", 0, &aBlock);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  unsigned int Size = pci::transport::task::getSize(*(pci::transport::task **)a2);
  uint64_t v7 = *(ACIPCBTClass **)(a1 + 40);
  *(_DWORD *)long long buf = a3;
  uint64_t v8 = *(unsigned int *)std::map<PCITransportRegister,unsigned int>::at((uint64_t)&pciTransportToACIPCRegisterMap, (int *)buf);
  Data = (void *)pci::transport::task::getData(*(pci::transport::task **)a2);
  uint64_t v10 = (pci::log *)ACIPCBTClass::readRegister(v7, v8, Data, &Size);
  int v11 = (int)v10;
  int v12 = pci::log::get(v10);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = *(_DWORD *)(a1 + 28);
    *(_DWORD *)long long buf = 136315906;
    uint64_t v21 = "bh";
    __int16 v22 = 2048;
    uint64_t v23 = a1;
    __int16 v24 = 1024;
    int v25 = v13;
    __int16 v26 = 1024;
    int v27 = v11;
    _os_log_impl(&dword_26361C000, v12, OS_LOG_TYPE_DEFAULT, "%s::%p::%d:read register 0x%x", buf, 0x22u);
  }
  int v14 = aBlock;
  if (aBlock) {
    int v15 = _Block_copy(aBlock);
  }
  else {
    int v15 = 0;
  }
  uint64_t v16 = v15;
  pci::transport::bh::invokeCallbackAsync(a1, &v16, v11, Size, 0);
  if (v15) {
    _Block_release(v15);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v14) {
    _Block_release(v14);
  }
}

void sub_2636236EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *aBlock)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void *std::__list_imp<void const*>::clear(void *result)
{
  if (result[2])
  {
    uint64_t v1 = result;
    __n128 result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        uint64_t v4 = (void *)result[1];
        operator delete(result);
        __n128 result = v4;
      }
      while (v4 != v1);
    }
  }
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
  *(_DWORD *)(a1 + 10os_unfair_lock_unlock(this + 4) = 16;
  return a1;
}

void sub_263623914(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x263E66110](v1);
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
  MEMORY[0x263E66110](a1 + 112);
  return a1;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x263E65FF0](v13, a1);
  if (LOBYTE(v13[0]))
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 14os_unfair_lock_unlock(this + 4) = v9;
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
  MEMORY[0x263E66000](v13);
  return a1;
}

void sub_263623B84(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x263E66000](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x263623B64);
}

void sub_263623BD8(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      memset(__p, 170, sizeof(__p));
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      int v13 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (SHIBYTE(__p[2]) < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 2os_unfair_lock_unlock(this + 4) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_263623D64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2655D2370, MEMORY[0x263F8C060]);
}

void sub_263623E8C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  __n128 result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

uint64_t std::map<PCITransportInterface,std::string>::~map[abi:ne180100](uint64_t a1)
{
  return a1;
}

uint64_t *std::map<PCITransportInterface,std::string>::at(uint64_t a1, int *a2)
{
  uint64_t v2 = *(uint64_t **)(a1 + 8);
  if (!v2) {
LABEL_8:
  }
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  int v3 = *a2;
  while (1)
  {
    while (1)
    {
      int v4 = *((_DWORD *)v2 + 8);
      if (v3 >= v4) {
        break;
      }
      uint64_t v2 = (uint64_t *)*v2;
      if (!v2) {
        goto LABEL_8;
      }
    }
    if (v4 >= v3) {
      return v2 + 5;
    }
    uint64_t v2 = (uint64_t *)v2[1];
    if (!v2) {
      goto LABEL_8;
    }
  }
}

uint64_t std::map<PCITransportInterface,std::string>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  int v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 32 * a3;
    do
    {
      std::__tree<std::__value_type<PCITransportInterface,std::string>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,std::string>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,std::string>>>::__emplace_hint_unique_key_args<PCITransportInterface,std::pair<PCITransportInterface const,std::string> const&>((uint64_t **)a1, v4, a2, (uint64_t)a2);
      a2 += 8;
      v6 -= 32;
    }
    while (v6);
  }
  return a1;
}

void sub_263623FC0(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<PCITransportInterface,std::string>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,std::string>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,std::string>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<PCITransportInterface,std::string>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,std::string>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,std::string>>>::__emplace_hint_unique_key_args<PCITransportInterface,std::pair<PCITransportInterface const,std::string> const&>(uint64_t **a1, uint64_t *a2, int *a3, uint64_t a4)
{
  uint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v10 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v6 = (uint64_t **)std::__tree<std::__value_type<PCITransportInterface,std::string>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,std::string>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,std::string>>>::__find_equal<PCITransportInterface>(a1, a2, &v10, &v9, a3);
  __n128 result = *v6;
  if (!*v6)
  {
    memset(v8, 170, sizeof(v8));
    std::__tree<std::__value_type<PCITransportInterface,std::string>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,std::string>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,std::string>>>::__construct_node<std::pair<PCITransportInterface const,std::string> const&>((uint64_t)a1, a4, v8);
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, (uint64_t)v10, v6, v8[0]);
    return v8[0];
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<PCITransportInterface,std::string>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,std::string>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,std::string>>>::__find_equal<PCITransportInterface>(void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  uint64_t v5 = a1 + 1;
  if (a1 + 1 == a2 || (int v6 = *a5, v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    size_t v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      uint64_t v9 = (uint64_t *)*a2;
      do
      {
        uint64_t v10 = v9;
        uint64_t v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      int v13 = a2;
      do
      {
        uint64_t v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        int v13 = v10;
      }
      while (v14);
    }
    int v15 = *a5;
    if (*((_DWORD *)v10 + 8) < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          int v17 = (uint64_t *)v16;
          int v18 = *(_DWORD *)(v16 + 32);
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = *v17;
          uint64_t v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        uint64_t v5 = v17 + 1;
        uint64_t v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      int v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    int64_t v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      int64_t v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    __int16 v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      __int16 v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 8))
  {
    uint64_t v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v21 = (uint64_t *)v20;
          int v22 = *(_DWORD *)(v20 + 32);
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = *v21;
          uint64_t v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        uint64_t v5 = v21 + 1;
        uint64_t v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      uint64_t v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void std::__tree<std::__value_type<PCITransportInterface,std::string>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,std::string>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,std::string>>>::__construct_node<std::pair<PCITransportInterface const,std::string> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  memset(a3, 170, 24);
  int v6 = (char *)operator new(0x40uLL);
  *a3 = v6;
  a3[1] = v5;
  *((unsigned char *)a3 + 16) = 0;
  *((_DWORD *)v6 + 8) = *(_DWORD *)a2;
  int v7 = (std::string *)(v6 + 40);
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)(a2 + 8), *(void *)(a2 + 16));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)(a2 + 8);
    v7->__r_.__value_.__r.__words[2] = *(void *)(a2 + 24);
  }
  *((unsigned char *)a3 + 16) = 1;
}

void sub_2636242B4(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<PCITransportInterface,std::string>,void *>>>::operator()[abi:ne180100](v2, v3);
  _Unwind_Resume(a1);
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
    size_t v8 = (std::string *)operator new(v6 + 1);
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

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<PCITransportInterface,std::string>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 63) < 0) {
      operator delete(__p[5]);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void std::__tree<std::__value_type<PCITransportInterface,std::string>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,std::string>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,std::string>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<PCITransportInterface,std::string>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,std::string>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,std::string>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<PCITransportInterface,std::string>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,std::string>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,std::string>>>::destroy(a1, *((void *)a2 + 1));
    if (a2[63] < 0) {
      operator delete(*((void **)a2 + 5));
    }
    operator delete(a2);
  }
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2655D2378, MEMORY[0x263F8C068]);
}

void sub_26362447C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  __n128 result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

uint64_t *std::map<PCITransportRegister,unsigned int>::at(uint64_t a1, int *a2)
{
  uint64_t v2 = *(uint64_t **)(a1 + 8);
  if (!v2) {
LABEL_8:
  }
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  int v3 = *a2;
  while (1)
  {
    while (1)
    {
      int v4 = *((_DWORD *)v2 + 7);
      if (v3 >= v4) {
        break;
      }
      uint64_t v2 = (uint64_t *)*v2;
      if (!v2) {
        goto LABEL_8;
      }
    }
    if (v4 >= v3) {
      return v2 + 4;
    }
    uint64_t v2 = (uint64_t *)v2[1];
    if (!v2) {
      goto LABEL_8;
    }
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
    std::string::size_type v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    std::string::size_type v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::__tree<std::__value_type<PCITransportRegister,unsigned int>,std::__map_value_compare<PCITransportRegister,std::__value_type<PCITransportRegister,unsigned int>,std::less<PCITransportRegister>,true>,std::allocator<std::__value_type<PCITransportRegister,unsigned int>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<PCITransportRegister,unsigned int>,std::__map_value_compare<PCITransportRegister,std::__value_type<PCITransportRegister,unsigned int>,std::less<PCITransportRegister>,true>,std::allocator<std::__value_type<PCITransportRegister,unsigned int>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<PCITransportRegister,unsigned int>,std::__map_value_compare<PCITransportRegister,std::__value_type<PCITransportRegister,unsigned int>,std::less<PCITransportRegister>,true>,std::allocator<std::__value_type<PCITransportRegister,unsigned int>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_2636246A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<pci::transport::bh>::reset[abi:ne180100]((uint64_t ****)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<pci::transport::bh *,std::shared_ptr<pci::transport::bh>::__shared_ptr_default_delete<pci::transport::bh,pci::transport::bh>,std::allocator<pci::transport::bh>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x263E66140);
}

uint64_t ***std::__shared_ptr_pointer<pci::transport::bh *,std::shared_ptr<pci::transport::bh>::__shared_ptr_default_delete<pci::transport::bh,pci::transport::bh>,std::allocator<pci::transport::bh>>::__on_zero_shared(uint64_t a1)
{
  __n128 result = *(uint64_t ****)(a1 + 24);
  if (result)
  {
    pci::transport::bh::~bh(result);
    JUMPOUT(0x263E66140);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<pci::transport::bh *,std::shared_ptr<pci::transport::bh>::__shared_ptr_default_delete<pci::transport::bh,pci::transport::bh>,std::allocator<pci::transport::bh>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t ***std::unique_ptr<pci::transport::bh>::reset[abi:ne180100](uint64_t ****a1, uint64_t ***a2)
{
  __n128 result = *a1;
  *a1 = a2;
  if (result)
  {
    pci::transport::bh::~bh(result);
    JUMPOUT(0x263E66140);
  }
  return result;
}

void *std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(void *a1, void *a2)
{
  int v3 = (std::__shared_weak_count *)a2[1];
  *a1 = *a2;
  if (!v3)
  {
    a1[1] = 0;
LABEL_5:
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  size_t v4 = std::__shared_weak_count::lock(v3);
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

uint64_t std::list<void const*>::splice(uint64_t result, uint64_t *a2, uint64_t a3, void *a4, void *a5)
{
  if (a4 != a5)
  {
    size_t v5 = (void *)*a5;
    if (result != a3)
    {
      uint64_t v6 = 1;
      if (v5 != a4)
      {
        uint64_t v7 = a4;
        do
        {
          uint64_t v7 = (void *)v7[1];
          ++v6;
        }
        while (v7 != v5);
      }
      *(void *)(a3 + 16) -= v6;
      *(void *)(result + 16) += v6;
    }
    uint64_t v8 = *a4;
    *(void *)(v8 + 8) = v5[1];
    *(void *)v5[1] = v8;
    uint64_t v9 = *a2;
    *(void *)(v9 + 8) = a4;
    *a4 = v9;
    *a2 = (uint64_t)v5;
    v5[1] = a2;
  }
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t _GLOBAL__sub_I_PCITransportBH_cpp()
{
  qword_26B431A00 = 0;
  qword_26B4319F8 = 0;
  pciTransportToACIPCRegisterMap = (uint64_t)&qword_26B4319F8;
  return __cxa_atexit((void (*)(void *))std::map<PCITransportRegister,unsigned int>::~map[abi:ne180100], &pciTransportToACIPCRegisterMap, &dword_26361C000);
}

void pci::event::Listener::create()
{
  v0[0] = (pci::event::Listener *)0xAAAAAAAAAAAAAAAALL;
  v0[1] = (pci::event::Listener *)0xAAAAAAAAAAAAAAAALL;
  operator new();
}

{
  pci::event::Listener *v0[2];

  v0[0] = (pci::event::Listener *)0xAAAAAAAAAAAAAAAALL;
  v0[1] = (pci::event::Listener *)0xAAAAAAAAAAAAAAAALL;
  operator new();
}

void sub_263624A40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

BOOL pci::event::Listener::init(pci::event::Listener *this)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!*((void *)this + 2)) {
    goto LABEL_4;
  }
  uint64_t v2 = *((void *)this + 4);
  if (!*((void *)this + 3))
  {
    if (v2) {
      goto LABEL_9;
    }
LABEL_4:
    int v3 = pci::log::get(this);
    BOOL v4 = 0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      size_t v5 = "bad argument";
LABEL_6:
      _os_log_impl(&dword_26361C000, v3, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
      return 0;
    }
    return v4;
  }
  if (v2) {
    goto LABEL_4;
  }
LABEL_9:
  uint64_t v7 = (pci::event::Listener *)((char *)this + 40);
  uint64_t v8 = (pci::log *)ACIPCBTControlClass::start((pci::event::Listener *)((char *)this + 40));
  if (!v8)
  {
    int v3 = pci::log::get(v8);
    BOOL v4 = 0;
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      return v4;
    }
    *(_WORD *)long long buf = 0;
    size_t v5 = "ACIPCBTControlClass::start() returned failure";
    goto LABEL_6;
  }
  std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(buf, this);
  uint64_t v10 = *(void *)buf;
  uint64_t v9 = v17;
  if (v17)
  {
    atomic_fetch_add_explicit(&v17->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1174405120;
  void v14[2] = ___ZN3pci5event8Listener4initEv_block_invoke;
  v14[3] = &__block_descriptor_tmp_4;
  _OWORD v14[4] = this;
  void v14[5] = v10;
  int v15 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  *(_DWORD *)&uint8_t buf[4] = -1431655766;
  int v17 = (std::__shared_weak_count *)v14;
  *(_DWORD *)long long buf = 0;
  if (*((void *)this + 3)) {
    uint64_t v11 = (pci::log *)ACIPCBTControlClass::registerEventNotification();
  }
  else {
    uint64_t v11 = (pci::log *)ACIPCBTControlClass::registerEventNotification();
  }
  int v12 = (int)v11;
  BOOL v4 = v11 == 0;
  if (v11)
  {
    int v13 = pci::log::get(v11);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v18 = 67109120;
      int v19 = v12;
      _os_log_impl(&dword_26361C000, v13, OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::registerEventCallback() returned %#x", v18, 8u);
    }
    ACIPCBTControlClass::stop(v7);
  }
  if (v15) {
    std::__shared_weak_count::__release_weak(v15);
  }
  if (v9) {
    std::__shared_weak_count::__release_weak(v9);
  }
  return v4;
}

void sub_263624CC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  if (v16) {
    std::__shared_weak_count::__release_weak(v16);
  }
  _Unwind_Resume(exception_object);
}

void sub_263624DDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

void pci::event::Listener::~Listener(pci::event::Listener *this)
{
  uint64_t v2 = (pci::event::Listener *)((char *)this + 40);
  ACIPCBTControlClass::deregisterEventNotification((pci::event::Listener *)((char *)this + 40), 0);
  int v3 = (pci::log *)ACIPCBTControlClass::stop(v2);
  if ((v3 & 1) == 0)
  {
    BOOL v4 = pci::log::get(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_26361C000, v4, OS_LOG_TYPE_DEFAULT, "ACIPCBTControlClass::stop() returned failure", v9, 2u);
    }
  }
  size_t v5 = (const void *)*((void *)this + 3);
  if (v5)
  {
    CFRelease(v5);
    *((void *)this + 3) = 0;
  }
  MEMORY[0x263E65FA0](v2);
  uint64_t v6 = *((void *)this + 4);
  if (v6) {
    dispatch_release(v6);
  }
  uint64_t v7 = (const void *)*((void *)this + 2);
  if (v7) {
    _Block_release(v7);
  }
  uint64_t v8 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
}

void *pci::event::Listener::Listener(void *a1, void **a2, const void *a3, dispatch_object_t object)
{
  *a1 = 0;
  a1[1] = 0;
  uint64_t v7 = *a2;
  if (*a2) {
    uint64_t v7 = _Block_copy(v7);
  }
  a1[2] = v7;
  a1[3] = a3;
  if (object) {
    dispatch_retain(object);
  }
  a1[4] = object;
  ACIPCBTControlClass::ACIPCBTControlClass((ACIPCBTControlClass *)(a1 + 5));
  if (a3) {
    CFRetain(a3);
  }
  return a1;
}

uint64_t pci::event::Listener::notify(pci::log *a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  uint64_t v8 = pci::log::get(a1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315906;
    *(void *)&uint8_t buf[4] = getACIPCErrorTypeString();
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a2;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = a3;
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = a4;
    _os_log_debug_impl(&dword_26361C000, v8, OS_LOG_TYPE_DEBUG, "%s (%u), arg1 %p, arg2 %p", buf, 0x26u);
  }
  unint64_t v64 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v63[7] = v9;
  v63[8] = v9;
  v63[5] = v9;
  v63[6] = v9;
  v63[3] = v9;
  v63[4] = v9;
  v63[1] = v9;
  v63[2] = v9;
  v63[0] = v9;
  long long v61 = v9;
  long long v62 = v9;
  long long v59 = v9;
  *(_OWORD *)uint64_t v60 = v9;
  *(_OWORD *)&uint8_t buf[16] = v9;
  *(_OWORD *)&buf[32] = v9;
  *(_OWORD *)long long buf = v9;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)buf);
  uint64_t v10 = "timesync protocol error";
  uint64_t v11 = buf;
  uint64_t v12 = 23;
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 35:
    case 36:
    case 37:
    case 38:
    case 40:
    case 41:
    case 42:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 56:
    case 57:
    case 59:
      int v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"pci error: ", 11);
      uint64_t ACIPCErrorTypeString = (const char *)getACIPCErrorTypeString();
      size_t v15 = strlen(ACIPCErrorTypeString);
      uint64_t v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)ACIPCErrorTypeString, v15);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)": (", 3);
      int v17 = (void *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)", ", 2);
      uint64_t v11 = (void *)std::ostream::operator<<();
      uint64_t v10 = ")";
      uint64_t v12 = 1;
      goto LABEL_5;
    case 39:
      if (a3 >= 3)
      {
        if (a3 == 3)
        {
          dispatch_time_t v48 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"pci error: ", 11);
          uint64_t v49 = (const char *)getACIPCErrorTypeString();
          size_t v50 = strlen(v49);
          int v51 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v48, (uint64_t)v49, v50);
          BOOL v52 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)": ", 2);
          ACIPCLinkStateString = (const char *)getACIPCLinkStateString();
          size_t v54 = strlen(ACIPCLinkStateString);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v52, (uint64_t)ACIPCLinkStateString, v54);
        }
        else
        {
          if (a3 != 4)
          {
            v55 = pci::log::get((pci::log *)buf);
            pci::event::Listener::notify(v55, a3);
            __assert_rtn("notify", "PCIEvent.cpp", 109, "false");
          }
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"User-requested device reset", 27);
        }
      }
      else
      {
        int v27 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"pci error: ", 11);
        uint64_t v28 = (const char *)getACIPCErrorTypeString();
        size_t v29 = strlen(v28);
        unsigned int v30 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)v28, v29);
        __int16 v31 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v30, (uint64_t)": ", 2);
        int v32 = (const char *)getACIPCLinkStateString();
        size_t v33 = strlen(v32);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)v32, v33);
      }
      break;
    case 43:
      int v19 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"pci error: ", 11);
      uint64_t v20 = (const char *)getACIPCErrorTypeString();
      size_t v21 = strlen(v20);
      int v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)v20, v21);
      uint64_t v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)": ", 2);
      ACIPCAERErrorTypeString = (const char *)getACIPCAERErrorTypeString();
      size_t v25 = strlen(ACIPCAERErrorTypeString);
      __int16 v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)ACIPCAERErrorTypeString, v25);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)": ", 2);
      std::ostream::operator<<();
      break;
    case 45:
      uint64_t v34 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"Firmware crash detected :(pc = 0x", 35);
      *(_DWORD *)((char *)v34 + *(void *)(*v34 - 24) + 8) = *(_DWORD *)((unsigned char *)v34 + *(void *)(*v34 - 24) + 8) & 0xFFFFFFB5 | 8;
      v35 = (void *)std::ostream::operator<<();
      uint64_t v36 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v35, (uint64_t)", lr = 0x", 9);
      *(_DWORD *)((char *)v36 + *(void *)(*v36 - 24) + 8) = *(_DWORD *)((unsigned char *)v36 + *(void *)(*v36 - 24) + 8) & 0xFFFFFFB5 | 8;
      int v37 = (void *)std::ostream::operator<<();
      BOOL v38 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v37, (uint64_t)", bcsReason = 0x", 16);
      *(_DWORD *)((char *)v38 + *(void *)(*v38 - 24) + 8) = *(_DWORD *)((unsigned char *)v38 + *(void *)(*v38 - 24) + 8) & 0xFFFFFFB5 | 8;
      v39 = (void *)std::ostream::operator<<();
      v40 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v39, (uint64_t)", trapReason = 0x", 17);
      *(_DWORD *)((char *)v40 + *(void *)(*v40 - 24) + 8) = *(_DWORD *)((unsigned char *)v40 + *(void *)(*v40 - 24) + 8) & 0xFFFFFFB5 | 8;
      v41 = (void *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v41, (uint64_t)")", 2);
      break;
    case 58:
      goto LABEL_5;
    case 62:
      uint64_t v10 = "User-requested reset for WLAN FLR";
      uint64_t v11 = buf;
      uint64_t v12 = 33;
      goto LABEL_5;
    case 65:
      uint64_t v10 = "Host detected wake from low-power sleep";
      uint64_t v11 = buf;
      uint64_t v12 = 39;
LABEL_5:
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)v10, v12);
      break;
    case 68:
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"Host initiated trap before device reset", 39);
      break;
    default:
      v42 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"pci error: ", 11);
      v43 = (const char *)getACIPCErrorTypeString();
      size_t v44 = strlen(v43);
      v45 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v42, (uint64_t)v43, v44);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v45, (uint64_t)": (", 3);
      v46 = (void *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v46, (uint64_t)", ", 2);
      v47 = (void *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v47, (uint64_t)")", 1);
      break;
  }
  std::stringbuf::str();
  (*(void (**)(void))(*((void *)a1 + 2) + 16))();
  if (v57 < 0) {
    operator delete(__p);
  }
  *(void *)long long buf = *MEMORY[0x263F8C2C8];
  *(void *)&buf[*(void *)(*(void *)buf - 24)] = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *(void *)&uint8_t buf[8] = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v61) < 0) {
    operator delete(v60[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x263E66110](v63);
}

void sub_263625660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
}

void ___ZN3pci5event8Listener4initEv_block_invoke(void *a1, int a2, uint64_t a3, uint64_t a4)
{
  size_t v5 = (std::__shared_weak_count *)a1[6];
  if (v5)
  {
    long long v9 = (pci::log *)a1[4];
    uint64_t v10 = std::__shared_weak_count::lock(v5);
    if (v10)
    {
      uint64_t v11 = v10;
      if (a1[5]) {
        pci::event::Listener::notify(v9, a2, a3, a4);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
}

void sub_263625850(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c44_ZTSNSt3__18weak_ptrIN3pci5event8ListenerEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c44_ZTSNSt3__18weak_ptrIN3pci5event8ListenerEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void std::shared_ptr<pci::event::Listener>::shared_ptr[abi:ne180100]<pci::event::Listener,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_263625914(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<pci::event::Listener>::reset[abi:ne180100]((pci::event::Listener **)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<pci::event::Listener *,std::shared_ptr<pci::event::Listener>::__shared_ptr_default_delete<pci::event::Listener,pci::event::Listener>,std::allocator<pci::event::Listener>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x263E66140);
}

pci::event::Listener *std::__shared_ptr_pointer<pci::event::Listener *,std::shared_ptr<pci::event::Listener>::__shared_ptr_default_delete<pci::event::Listener,pci::event::Listener>,std::allocator<pci::event::Listener>>::__on_zero_shared(uint64_t a1)
{
  __n128 result = *(pci::event::Listener **)(a1 + 24);
  if (result)
  {
    pci::event::Listener::~Listener(result);
    JUMPOUT(0x263E66140);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<pci::event::Listener *,std::shared_ptr<pci::event::Listener>::__shared_ptr_default_delete<pci::event::Listener,pci::event::Listener>,std::allocator<pci::event::Listener>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

pci::event::Listener *std::unique_ptr<pci::event::Listener>::reset[abi:ne180100](pci::event::Listener **a1, pci::event::Listener *a2)
{
  __n128 result = *a1;
  *a1 = a2;
  if (result)
  {
    pci::event::Listener::~Listener(result);
    JUMPOUT(0x263E66140);
  }
  return result;
}

void pci::transport::th::create(void *a1@<X8>)
{
  *a1 = 0xAAAAAAAAAAAAAAAALL;
  a1[1] = 0xAAAAAAAAAAAAAAAALL;
  operator new();
}

void sub_263625AE4(_Unwind_Exception *exception_object)
{
  int v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

void pci::transport::th::init(pci::transport::th *this)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v15[0] = 0;
  v15[1] = v15;
  uint64_t v15[2] = 0x2000000000;
  char v16 = 1;
  uint64_t v2 = (pci::log *)dispatch_group_create();
  int v3 = pci::log::get(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::init();
  }
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  if (!*((void *)this + 6))
  {
    std::string::basic_string[abi:ne180100]<0>(&v12, "com.apple.AppleConvergedIPC.pci_client");
    std::string::basic_string[abi:ne180100]<0>(&__p, "_");
    BOOL v4 = buf;
    pci::transport::th::generateString((uint64_t)this, (uint64_t)&v12, (uint64_t)&__p);
    if (v20 < 0) {
      BOOL v4 = *(const char **)buf;
    }
    initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
    uint64_t v6 = dispatch_queue_attr_make_with_qos_class(initially_inactive, (dispatch_qos_class_t)*((_DWORD *)this + 30), 0);
    dispatch_queue_t v7 = dispatch_queue_create(v4, v6);
    uint64_t v8 = *((void *)this + 6);
    *((void *)this + 6) = v7;
    if (v8) {
      dispatch_release(v8);
    }
    if (v20 < 0) {
      operator delete(*(void **)buf);
    }
    if (v18 < 0) {
      operator delete(__p);
    }
    if (SHIBYTE(v13) < 0) {
      operator delete((void *)v12);
    }
    dispatch_set_target_queue(*((dispatch_object_t *)this + 6), *((dispatch_queue_t *)this + 14));
    dispatch_activate(*((dispatch_object_t *)this + 6));
  }
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v14 = v9;
  int v13 = 0;
  LODWORD(v12) = *((_DWORD *)this + 10);
  *(void *)((char *)&v12 + os_unfair_lock_unlock(this + 4) = *((void *)this + 8);
  if (*((unsigned char *)this + 74))
  {
    uint64_t v10 = *((void *)this + 2);
    if (v10)
    {
      dispatch_retain(*((dispatch_object_t *)this + 2));
      uint64_t v11 = v13;
      int v13 = v10;
      if (v11) {
        dispatch_release(v11);
      }
    }
  }
  *(void *)&long long v14 = *((void *)this + 14);
  DWORD2(v1os_unfair_lock_unlock(this + 4) = *((_DWORD *)this + 30);
  pci::transport::bh::create(buf);
}

void sub_26362625C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, dispatch_object_t object, void *a20,uint64_t a21,dispatch_object_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (object) {
    dispatch_release(object);
  }
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)(v37 - 144));
  if (a22)
  {
    dispatch_release(a22);
    if (!v34)
    {
LABEL_5:
      if (!v36) {
        goto LABEL_6;
      }
      goto LABEL_11;
    }
  }
  else if (!v34)
  {
    goto LABEL_5;
  }
  dispatch_release(v34);
  if (!v36)
  {
LABEL_6:
    if (!v35) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_11:
  std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  if (!v35)
  {
LABEL_8:
    _Block_object_dispose(&a25, 8);
    _Unwind_Resume(a1);
  }
LABEL_7:
  std::__shared_weak_count::__release_shared[abi:ne180100](v35);
  goto LABEL_8;
}

uint64_t pci::transport::th::th(uint64_t a1, uint64_t a2)
{
  BOOL v4 = operator new(0x20uLL);
  v4[1] = 0;
  v4[2] = 0;
  void *v4 = &unk_270EA1CC0;
  *(void *)(a1 + 8) = v4;
  *((_DWORD *)v4 + 6) = 0;
  *(void *)a1 = v4 + 3;
  dispatch_group_t v5 = dispatch_group_create();
  *(void *)(a1 + 2os_unfair_lock_unlock(this + 4) = 0;
  *(void *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)a2;
  *(void *)(a1 + 16) = v5;
  uint64_t v6 = *(void *)(a2 + 8);
  if (v6) {
    dispatch_retain(*(dispatch_object_t *)(a2 + 8));
  }
  *(void *)(a1 + 48) = v6;
  dispatch_queue_t v7 = *(void **)(a2 + 16);
  if (v7) {
    dispatch_queue_t v7 = _Block_copy(v7);
  }
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 6os_unfair_lock_unlock(this + 4) = *(void *)(a2 + 24);
  char v8 = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 72) = v8 & 1;
  *(unsigned char *)(a1 + 73) = (v8 & 2) != 0;
  *(unsigned char *)(a1 + 7os_unfair_lock_unlock(this + 4) = (v8 & 8) != 0;
  *(unsigned char *)(a1 + 75) = (v8 & 4) != 0;
  *(void *)(a1 + 76) = *(void *)(a2 + 36);
  long long v9 = *(void **)(a2 + 48);
  if (v9) {
    long long v9 = _Block_copy(v9);
  }
  *(void *)(a1 + 88) = v9;
  uint64_t v10 = *(void **)(a2 + 56);
  if (v10) {
    uint64_t v10 = _Block_copy(v10);
  }
  *(void *)(a1 + 96) = v10;
  uint64_t v11 = *(void **)(a2 + 64);
  if (v11) {
    uint64_t v11 = _Block_copy(v11);
  }
  *(void *)(a1 + 10os_unfair_lock_unlock(this + 4) = v11;
  uint64_t v12 = *(void *)(a2 + 72);
  if (v12)
  {
    dispatch_retain(*(dispatch_object_t *)(a2 + 72));
    *(void *)(a1 + 112) = v12;
  }
  else
  {
    pci::system::info::get(&v17);
    uint64_t v14 = *(void *)(v17 + 24);
    if (v14) {
      dispatch_retain(*(dispatch_object_t *)(v17 + 24));
    }
    *(void *)(a1 + 112) = v14;
    int v13 = (pci::log *)v18;
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
  }
  *(_DWORD *)(a1 + 120) = *(_DWORD *)(a2 + 80);
  *(void *)(a1 + 128) = a1 + 128;
  *(void *)(a1 + 136) = a1 + 128;
  *(void *)(a1 + 14os_unfair_lock_unlock(this + 4) = 0;
  *(unsigned char *)(a1 + 152) = 0;
  size_t v15 = pci::log::get(v13);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::th();
  }
  return a1;
}

void sub_263626538(_Unwind_Exception *a1)
{
  uint64_t v6 = (const void *)v1[13];
  if (v6) {
    _Block_release(v6);
  }
  dispatch_queue_t v7 = (const void *)v1[12];
  if (v7) {
    _Block_release(v7);
  }
  char v8 = (const void *)v1[11];
  if (v8) {
    _Block_release(v8);
  }
  long long v9 = (const void *)v1[7];
  if (v9) {
    _Block_release(v9);
  }
  pci::transport::th::th((NSObject **)(v3 + 8), v2, v4, (uint64_t)v1);
  _Unwind_Resume(a1);
}

void pci::transport::th::~th(dispatch_object_t *this)
{
  uint64_t v2 = pci::log::get((pci::log *)this);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::init();
  }
  os_unfair_lock_lock((os_unfair_lock_t)*this);
  *((unsigned char *)this + 152) = 1;
  if (this[3])
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)__int16 v31 = v3;
    *(_OWORD *)&v31[16] = v3;
    *(_OWORD *)aBlock = 0u;
    *(_OWORD *)dispatch_object_t object = 0u;
    BOOL v4 = _Block_copy(&__block_literal_global_0);
    dispatch_group_t v5 = v4;
    *(_DWORD *)__int16 v31 = *((_DWORD *)this + 10);
    memset(&v31[4], 0, 24);
    if (v4) {
      uint64_t v6 = _Block_copy(v4);
    }
    else {
      uint64_t v6 = 0;
    }
    dispatch_queue_t v7 = aBlock[0];
    aBlock[0] = v6;
    if (v7) {
      _Block_release(v7);
    }
    dispatch_object_t v9 = *this;
    dispatch_object_t v8 = this[1];
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)&v8[1], 1uLL, memory_order_relaxed);
    }
    uint64_t v10 = (std::__shared_weak_count *)object[0];
    aBlock[1] = v9;
    object[0] = v8;
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    }
    uint64_t v11 = this[2];
    if (v11) {
      dispatch_retain(this[2]);
    }
    uint64_t v12 = object[1];
    object[1] = v11;
    if (v12) {
      dispatch_release(v12);
    }
    if (v5) {
      _Block_release(v5);
    }
    LODWORD(v29) = *((_DWORD *)this + 10);
    getPciTransportToDirectionMap();
    if ((*(_DWORD *)std::map<PCITransportRegister,unsigned int>::at((uint64_t)&getPciTransportToDirectionMap(void)::sMap, (int *)&v29) & 0xFFFFFFFD) == 1)
    {
      unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
      pci::transport::task::create(&v29);
    }
    LODWORD(v29) = *((_DWORD *)this + 10);
    getPciTransportToDirectionMap();
    if ((*(_DWORD *)std::map<PCITransportRegister,unsigned int>::at((uint64_t)&getPciTransportToDirectionMap(void)::sMap, (int *)&v29) & 0xFFFFFFFE) == 2)
    {
      unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
      pci::transport::task::create(&v29);
    }
    int v13 = (pci::transport::th *)this[17];
    if (v13 != (pci::transport::th *)(this + 16))
    {
      do
      {
        size_t v15 = (pci::transport::th *)*((void *)v13 + 1);
        uint64_t v14 = (const os_unfair_lock **)*((void *)v13 + 2);
        char v16 = (std::__shared_weak_count *)*((void *)v13 + 3);
        if (v16) {
          atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (!*((unsigned char *)this + 73) || pci::transport::task::getType((pci::transport::task *)v14) == 1) {
          pci::transport::task::poison(v14, 0xE00002EB);
        }
        if (v16) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v16);
        }
        int v13 = v15;
      }
      while (v15 != (pci::transport::th *)(this + 16));
    }
    uint64_t v17 = (std::__shared_weak_count *)this[4];
    this[3] = 0;
    this[4] = 0;
    if (v17) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v17);
    }
    if (object[1]) {
      dispatch_release(object[1]);
    }
    if (object[0]) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)object[0]);
    }
    if (aBlock[0]) {
      _Block_release(aBlock[0]);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)*this);
  char v18 = (pci::log *)dispatch_group_wait(this[2], 0xFFFFFFFFFFFFFFFFLL);
  int v19 = pci::log::get(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::~th();
  }
  std::__list_imp<std::shared_ptr<pci::transport::task>>::clear((uint64_t *)this + 16);
  char v20 = this[14];
  if (v20) {
    dispatch_release(v20);
  }
  dispatch_object_t v21 = this[13];
  if (v21) {
    _Block_release(v21);
  }
  dispatch_object_t v22 = this[12];
  if (v22) {
    _Block_release(v22);
  }
  dispatch_object_t v23 = this[11];
  if (v23) {
    _Block_release(v23);
  }
  dispatch_object_t v24 = this[7];
  if (v24) {
    _Block_release(v24);
  }
  size_t v25 = this[6];
  if (v25) {
    dispatch_release(v25);
  }
  __int16 v26 = (std::__shared_weak_count *)this[4];
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
  int v27 = this[2];
  if (v27) {
    dispatch_release(v27);
  }
  uint64_t v28 = (std::__shared_weak_count *)this[1];
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
  }
}

void pci::transport::th::lock(os_unfair_lock_t *this)
{
}

void pci::transport::task::parameters::~parameters(pci::transport::task::parameters *this)
{
  uint64_t v2 = *((void *)this + 7);
  if (v2) {
    dispatch_release(v2);
  }
  long long v3 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  BOOL v4 = (const void *)*((void *)this + 4);
  if (v4) {
    _Block_release(v4);
  }
}

void pci::transport::th::unlock(os_unfair_lock_t *this)
{
}

uint64_t pci::transport::th::generateString(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v18[7] = v5;
  v18[8] = v5;
  v18[5] = v5;
  v18[6] = v5;
  void v18[3] = v5;
  uint8_t v18[4] = v5;
  v18[1] = v5;
  uint64_t v18[2] = v5;
  long long v17 = v5;
  v18[0] = v5;
  *(_OWORD *)__p = v5;
  long long v16 = v5;
  void v14[2] = v5;
  v14[3] = v5;
  v14[0] = v5;
  v14[1] = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v14);
  int v6 = *(char *)(a2 + 23);
  if (v6 >= 0) {
    uint64_t v7 = a2;
  }
  else {
    uint64_t v7 = *(void *)a2;
  }
  if (v6 >= 0) {
    uint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v8 = *(void *)(a2 + 8);
  }
  dispatch_object_t v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, v7, v8);
  int v10 = *(char *)(a3 + 23);
  if (v10 >= 0) {
    uint64_t v11 = a3;
  }
  else {
    uint64_t v11 = *(void *)a3;
  }
  if (v10 >= 0) {
    uint64_t v12 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    uint64_t v12 = *(void *)(a3 + 8);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, v11, v12);
  std::ostream::operator<<();
  std::stringbuf::str();
  *(void *)&v14[0] = *MEMORY[0x263F8C2C8];
  *(void *)((char *)v14 + *(void *)(*(void *)&v14[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v14[0] + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v16) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x263E66110](v18);
}

void sub_263626B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void ___ZN3pci9transport2th4initEv_block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(a1 + 40);
  uint64_t v4 = *(void *)(v3 + 8);
  if (a2) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = *(unsigned char *)(v4 + 24) == 0;
  }
  char v6 = !v5;
  *(unsigned char *)(v4 + 2os_unfair_lock_unlock(this + 4) = v6;
  dispatch_group_leave(v2);
}

void __copy_helper_block_e8_40c36_ZTSN10applesauce8dispatch2v15groupE(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 40) = v3;
  if (v3) {
    dispatch_retain(v3);
  }
}

void __destroy_helper_block_e8_40c36_ZTSN10applesauce8dispatch2v15groupE(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

void pci::transport::th::notify(dispatch_object_t *this)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = pci::log::get((pci::log *)this);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::init();
  }
  os_unfair_lock_lock((os_unfair_lock_t)*this);
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v12 = v3;
  long long v13 = v3;
  *(_OWORD *)uint64_t v14 = 0u;
  *(_OWORD *)dispatch_object_t object = 0u;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th6notifyEv_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_6;
  aBlock[4] = this;
  uint64_t v4 = _Block_copy(aBlock);
  BOOL v5 = v4;
  LODWORD(v12) = *((_DWORD *)this + 10);
  DWORD1(v12) = 1;
  *((void *)&v12 + 1) = 0;
  *(void *)&long long v13 = 0;
  DWORD2(v13) = 0;
  if (v4) {
    char v6 = _Block_copy(v4);
  }
  else {
    char v6 = 0;
  }
  v14[0] = v6;
  dispatch_object_t v8 = *this;
  dispatch_object_t v7 = this[1];
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)&v7[1], 1uLL, memory_order_relaxed);
  }
  v14[1] = v8;
  object[0] = v7;
  dispatch_object_t v9 = this[2];
  if (v9) {
    dispatch_retain(this[2]);
  }
  object[1] = v9;
  if (v5) {
    _Block_release(v5);
  }
  v10[0] = 0xAAAAAAAAAAAAAAAALL;
  v10[1] = 0xAAAAAAAAAAAAAAAALL;
  pci::transport::task::create(v10);
}

void sub_263626E2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, std::__shared_weak_count *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  if (a6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a6);
  }
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)va);
  _Unwind_Resume(a1);
}

void pci::transport::th::readAsync(pci::transport::th *this)
{
  uint64_t v2 = pci::log::get(this);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::init();
  }
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3002000000;
  long long v13 = __Block_byref_object_copy__12;
  uint64_t v14 = __Block_byref_object_dispose__13;
  size_t v15 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th9readAsyncEv_block_invoke;
  aBlock[3] = &unk_2655D24E0;
  aBlock[4] = &v10;
  void aBlock[5] = this;
  long long v3 = _Block_copy(aBlock);
  uint64_t v4 = (const void *)v11[5];
  v11[5] = (uint64_t)v3;
  if (v4) {
    _Block_release(v4);
  }
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  v8[1] = (const void *)0xAAAAAAAAAAAAAAAALL;
  v8[2] = (const void *)0xAAAAAAAAAAAAAAAALL;
  int v5 = *((_DWORD *)this + 20);
  char v6 = (const void *)v11[5];
  if (v6) {
    dispatch_object_t v7 = _Block_copy(v6);
  }
  else {
    dispatch_object_t v7 = 0;
  }
  v8[0] = v7;
  pci::transport::th::readInternal((uint64_t)this, 0, v5, 0, v8);
}

void sub_263627028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *aBlock)
{
  if (v24) {
    _Block_release(v24);
  }
  _Block_object_dispose(&a19, 8);
  if (aBlock) {
    _Block_release(aBlock);
  }
  _Unwind_Resume(a1);
}

double pci::transport::th::initParams(uint64_t a1)
{
  *(void *)(a1 + 80) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 6os_unfair_lock_unlock(this + 4) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_DWORD *)(a1 + 80) = 21;
  return result;
}

uint64_t pci::transport::th::validateParams(pci::log *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    dispatch_object_t v9 = pci::log::get(0);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v10) {
      return result;
    }
    LOWORD(v12[0]) = 0;
    char v6 = "no params";
    goto LABEL_11;
  }
  if (*(int *)a1 >= 5)
  {
    uint64_t v2 = pci::log::get(a1);
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v3) {
      return result;
    }
    int v5 = *(_DWORD *)a1;
    v12[0] = 67109120;
    v12[1] = v5;
    char v6 = "invalid interface number %d";
    dispatch_object_t v7 = v2;
    uint32_t v8 = 8;
    goto LABEL_12;
  }
  if (*((void *)a1 + 2)) {
    return 1;
  }
  dispatch_object_t v9 = pci::log::get(a1);
  BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0;
  if (v11)
  {
    LOWORD(v12[0]) = 0;
    char v6 = "status block is required";
LABEL_11:
    dispatch_object_t v7 = v9;
    uint32_t v8 = 2;
LABEL_12:
    _os_log_impl(&dword_26361C000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)v12, v8);
    return 0;
  }
  return result;
}

void ___ZN3pci9transport2th6notifyEv_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  if (!a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    dispatch_object_t v7 = *(const void **)(v6 + 56);
    if (v7) {
      uint32_t v8 = _Block_copy(v7);
    }
    else {
      uint32_t v8 = 0;
    }
    dispatch_object_t v9 = *(NSObject **)(v6 + 48);
    if (v9) {
      dispatch_retain(v9);
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 1174405120;
    v11[2] = ___ZN3pci9transport2th6notifyEv_block_invoke_2;
    v11[3] = &__block_descriptor_tmp_5_0;
    if (v8) {
      BOOL v10 = _Block_copy(v8);
    }
    else {
      BOOL v10 = 0;
    }
    aBlock = v10;
    int v13 = a5;
    dispatch_async(v9, v11);
    if (aBlock) {
      _Block_release(aBlock);
    }
    if (v9) {
      dispatch_release(v9);
    }
    if (v8) {
      _Block_release(v8);
    }
  }
}

uint64_t ___ZN3pci9transport2th6notifyEv_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), 0, 0);
}

void *__copy_helper_block_e8_32c66_ZTSN10applesauce8dispatch2v15blockIFv18PCITransportStatusPvS4_EEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 32);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c66_ZTSN10applesauce8dispatch2v15blockIFv18PCITransportStatusPvS4_EEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void pci::transport::th::write(pci::transport::th *this, const unsigned __int8 *a2, int a3, void (*a4)(void *), int a5)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2000000000;
  char v20 = 1;
  v17[0] = 0;
  v17[1] = v17;
  uint64_t v17[2] = 0x3002000000;
  v17[3] = __Block_byref_object_copy__1;
  v17[4] = __Block_byref_object_dispose__1;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  BOOL v10 = pci::log::get((pci::log *)object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v13 = *((_DWORD *)this + 10);
    int buf = 136316674;
    buf_4 = "th";
    __int16 v23 = 2048;
    dispatch_object_t v24 = this;
    __int16 v25 = 1024;
    int v26 = v13;
    __int16 v27 = 2048;
    uint64_t v28 = a2;
    __int16 v29 = 1024;
    int v30 = a3;
    __int16 v31 = 2048;
    int v32 = a4;
    __int16 v33 = 1024;
    int v34 = a5;
    _os_log_debug_impl(&dword_26361C000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d:buffer %p, length %u, dDtor %p, timeout %u", (uint8_t *)&buf, 0x3Cu);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th5writeEPKhjPFvPvEj_block_invoke;
  aBlock[3] = &unk_2655D2470;
  void aBlock[6] = this;
  aBlock[7] = a2;
  aBlock[8] = a4;
  int v16 = a3;
  aBlock[4] = v19;
  void aBlock[5] = v17;
  BOOL v11 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  if (v11) {
    uint64_t v12 = _Block_copy(v11);
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v14 = v12;
  pci::transport::th::writeInternal((uint64_t)this, (uint64_t)a2, a3, (uint64_t)a4, &v14);
}

void sub_263627644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object,char a27)
{
  if (v28) {
    _Block_release(v28);
  }
  _Block_object_dispose(&a21, 8);
  if (object) {
    dispatch_release(object);
  }
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  BOOL v3 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 40) = v3;
  if (v3) {
    dispatch_retain(v3);
  }
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

intptr_t ___ZN3pci9transport2th5writeEPKhjPFvPvEj_block_invoke(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(void *)(a1 + 48);
  dispatch_object_t v9 = pci::log::get((pci::log *)a1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v18 = *(_DWORD *)(v8 + 40);
    int v19 = 136316418;
    char v20 = "th";
    __int16 v21 = 2048;
    uint64_t v22 = v8;
    __int16 v23 = 1024;
    int v24 = v18;
    __int16 v25 = 1024;
    int v26 = a2;
    __int16 v27 = 2048;
    uint64_t v28 = a3;
    __int16 v29 = 1024;
    int v30 = a4;
    _os_log_debug_impl(&dword_26361C000, v9, OS_LOG_TYPE_DEBUG, "%s::%p::%d:status 0x%x, buff %p, size %u", (uint8_t *)&v19, 0x32u);
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  if (a2) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = *(unsigned char *)(v10 + 24) == 0;
  }
  char v12 = !v11;
  *(unsigned char *)(v10 + 2os_unfair_lock_unlock(this + 4) = v12;
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  char v14 = *(unsigned char *)(v13 + 24);
  if (v14)
  {
    if (*(void *)(a1 + 56) == a3 && !*(void *)(a1 + 64))
    {
      char v14 = 1;
    }
    else if (a3)
    {
      char v14 = 0;
    }
    else
    {
      char v14 = *(void *)(a1 + 64) != 0;
    }
  }
  *(unsigned char *)(v13 + 2os_unfair_lock_unlock(this + 4) = v14;
  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
  char v16 = *(unsigned char *)(v15 + 24);
  if (v16)
  {
    if (*(_DWORD *)(a1 + 72) == a4 && !*(void *)(a1 + 64))
    {
      char v16 = 1;
    }
    else if (a4)
    {
      char v16 = 0;
    }
    else
    {
      char v16 = *(void *)(a1 + 64) != 0;
    }
  }
  *(unsigned char *)(v15 + 2os_unfair_lock_unlock(this + 4) = v16;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void pci::transport::th::writeInternal(uint64_t a1, uint64_t a2, int a3, uint64_t a4, const void **a5)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)a1);
  BOOL v11 = pci::log::get(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    int v20 = *(_DWORD *)(a1 + 40);
    LODWORD(v22[0]) = 136316418;
    *(void *)((char *)v22 + os_unfair_lock_unlock(this + 4) = "th";
    WORD6(v22[0]) = 2048;
    *(void *)((char *)v22 + 1os_unfair_lock_unlock(this + 4) = a1;
    WORD3(v22[1]) = 1024;
    DWORD2(v22[1]) = v20;
    WORD6(v22[1]) = 2048;
    *(void *)((char *)&v22[1] + 1os_unfair_lock_unlock(this + 4) = a2;
    WORD3(v22[2]) = 1024;
    DWORD2(v22[2]) = a3;
    WORD6(v22[2]) = 2048;
    *(void *)((char *)&v22[2] + 1os_unfair_lock_unlock(this + 4) = a4;
    _os_log_debug_impl(&dword_26361C000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d:buffer %p, size %u, dDtor %p", (uint8_t *)v22, 0x36u);
    if (!a2) {
      goto LABEL_5;
    }
  }
  else if (!a2)
  {
    goto LABEL_5;
  }
  uint64_t v13 = pci::log::get((pci::log *)v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::writeInternal();
  }
LABEL_5:
  *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22[0] = v14;
  v22[1] = v14;
  memset(&v22[2], 0, 32);
  if (*a5) {
    uint64_t v15 = _Block_copy(*a5);
  }
  else {
    uint64_t v15 = 0;
  }
  LODWORD(v22[0]) = *(_DWORD *)(a1 + 40);
  DWORD1(v22[0]) = 3;
  *((void *)&v22[0] + 1) = a4;
  *(void *)&v22[1] = a2;
  DWORD2(v22[1]) = a3;
  if (v15) {
    char v16 = _Block_copy(v15);
  }
  else {
    char v16 = 0;
  }
  *(void *)&v22[2] = v16;
  int v18 = *(const os_unfair_lock **)a1;
  uint64_t v17 = *(void *)(a1 + 8);
  if (v17) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
  }
  *((void *)&v22[2] + 1) = v18;
  *(void *)&v22[3] = v17;
  uint64_t v19 = *(void *)(a1 + 16);
  if (v19) {
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  }
  *((void *)&v22[3] + 1) = v19;
  if (v15) {
    _Block_release(v15);
  }
  pci::transport::task::create(buf);
}

void sub_263627B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)va);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  _Unwind_Resume(a1);
}

void pci::transport::th::writeAsync(pci::transport::th *this, const unsigned __int8 *a2, int a3, void (*a4)(void *))
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v8 = pci::log::get(this);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = *((_DWORD *)this + 10);
    *(_DWORD *)int buf = 136316418;
    *(void *)&uint8_t buf[4] = "th";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = this;
    __int16 v15 = 1024;
    int v16 = v11;
    __int16 v17 = 2048;
    int v18 = a2;
    __int16 v19 = 1024;
    int v20 = a3;
    __int16 v21 = 2048;
    uint64_t v22 = a4;
    _os_log_debug_impl(&dword_26361C000, v8, OS_LOG_TYPE_DEBUG, "%s::%p::%d:buffer %p, size %u, dDtor %p", buf, 0x36u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th10writeAsyncEPKhjPFvPvE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_10;
  aBlock[4] = this;
  dispatch_object_t v9 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  memset(buf, 170, 16);
  if (v9) {
    uint64_t v10 = _Block_copy(v9);
  }
  else {
    uint64_t v10 = 0;
  }
  BOOL v12 = v10;
  pci::transport::th::writeInternal((uint64_t)this, (uint64_t)a2, a3, (uint64_t)a4, &v12);
}

void sub_263627D9C(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void ___ZN3pci9transport2th10writeAsyncEPKhjPFvPvE_block_invoke(pci::log *a1, int a2, uint64_t a3, int a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = *((void *)a1 + 4);
  uint64_t v8 = pci::log::get(a1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v13 = *(_DWORD *)(v7 + 40);
    *(_DWORD *)int buf = 136316418;
    int v20 = "th";
    __int16 v21 = 2048;
    uint64_t v22 = v7;
    __int16 v23 = 1024;
    int v24 = v13;
    __int16 v25 = 1024;
    int v26 = a2;
    __int16 v27 = 2048;
    uint64_t v28 = a3;
    __int16 v29 = 1024;
    int v30 = a4;
    _os_log_debug_impl(&dword_26361C000, v8, OS_LOG_TYPE_DEBUG, "%s::%p::%d:status 0x%x, buff %p, size %u", buf, 0x32u);
  }
  dispatch_object_t v9 = *(const void **)(v7 + 96);
  if (v9)
  {
    uint64_t v10 = _Block_copy(v9);
    int v11 = *(NSObject **)(v7 + 48);
    if (v11) {
      dispatch_retain(v11);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN3pci9transport2th10writeAsyncEPKhjPFvPvE_block_invoke_8;
    block[3] = &__block_descriptor_tmp_9;
    if (v10) {
      BOOL v12 = _Block_copy(v10);
    }
    else {
      BOOL v12 = 0;
    }
    aBlock = v12;
    uint64_t v16 = a3;
    int v17 = a2;
    int v18 = a4;
    dispatch_async(v11, block);
    if (aBlock) {
      _Block_release(aBlock);
    }
    if (v11) {
      dispatch_release(v11);
    }
    if (v10) {
      _Block_release(v10);
    }
  }
}

void sub_263627F90(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t ___ZN3pci9transport2th10writeAsyncEPKhjPFvPvE_block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 48), *(void *)(a1 + 40), *(unsigned int *)(a1 + 52));
}

void *__copy_helper_block_e8_32c45_ZTSN10applesauce8dispatch2v15blockIFviPvjEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 32);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c45_ZTSN10applesauce8dispatch2v15blockIFviPvjEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void pci::transport::th::read(pci::transport::th *this, const unsigned __int8 *a2, unsigned int *a3, void (*a4)(void *), int a5)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2000000000;
  char v21 = 1;
  v18[0] = 0;
  v18[1] = v18;
  uint64_t v18[2] = 0x3002000000;
  void v18[3] = __Block_byref_object_copy__1;
  uint8_t v18[4] = __Block_byref_object_dispose__1;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v10 = pci::log::get((pci::log *)object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v14 = *((_DWORD *)this + 10);
    int v15 = *a3;
    int buf = 136316674;
    buf_4 = "th";
    __int16 v24 = 2048;
    __int16 v25 = this;
    __int16 v26 = 1024;
    int v27 = v14;
    __int16 v28 = 2048;
    __int16 v29 = a2;
    __int16 v30 = 1024;
    int v31 = v15;
    __int16 v32 = 2048;
    __int16 v33 = a4;
    __int16 v34 = 1024;
    int v35 = a5;
    _os_log_debug_impl(&dword_26361C000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d:buffer %p, length %u, dDtor %p, timeout %u", (uint8_t *)&buf, 0x3Cu);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th4readEPKhRjPFvPvEj_block_invoke;
  aBlock[3] = &unk_2655D24B8;
  void aBlock[6] = this;
  aBlock[7] = a2;
  aBlock[8] = a3;
  aBlock[4] = v20;
  void aBlock[5] = v18;
  int v11 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  int v12 = *a3;
  if (v11) {
    int v13 = _Block_copy(v11);
  }
  else {
    int v13 = 0;
  }
  uint64_t v16 = v13;
  pci::transport::th::readInternal((uint64_t)this, (uint64_t)a2, v12, (uint64_t)a4, &v16);
}

void sub_263628328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,dispatch_object_t object,char a25)
{
  if (v25) {
    _Block_release(v25);
  }
  _Block_object_dispose(&a19, 8);
  if (object) {
    dispatch_release(object);
  }
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

intptr_t ___ZN3pci9transport2th4readEPKhRjPFvPvEj_block_invoke(pci::log *a1, int a2, uint64_t a3, unsigned int a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v8 = *((void *)a1 + 6);
  dispatch_object_t v9 = pci::log::get(a1);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    int v21 = *(_DWORD *)(v8 + 40);
    int v22 = 136316418;
    __int16 v23 = "th";
    __int16 v24 = 2048;
    uint64_t v25 = v8;
    __int16 v26 = 1024;
    int v27 = v21;
    __int16 v28 = 1024;
    int v29 = a2;
    __int16 v30 = 2048;
    uint64_t v31 = a3;
    __int16 v32 = 1024;
    unsigned int v33 = a4;
    _os_log_debug_impl(&dword_26361C000, v9, OS_LOG_TYPE_DEBUG, "%s::%p::%d:status 0x%x, buff %p, size %u", (uint8_t *)&v22, 0x32u);
    if (!a3) {
      goto LABEL_5;
    }
  }
  else if (!a3)
  {
    goto LABEL_5;
  }
  int v11 = pci::log::get((pci::log *)v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::writeInternal();
  }
LABEL_5:
  uint64_t v12 = *(void *)(*((void *)a1 + 4) + 8);
  if (a2) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = *(unsigned char *)(v12 + 24) == 0;
  }
  char v14 = !v13;
  *(unsigned char *)(v12 + 2os_unfair_lock_unlock(this + 4) = v14;
  uint64_t v15 = *(void *)(*((void *)a1 + 4) + 8);
  char v16 = *(unsigned char *)(v15 + 24);
  if (v16) {
    char v16 = *((void *)a1 + 7) == a3;
  }
  *(unsigned char *)(v15 + 2os_unfair_lock_unlock(this + 4) = v16;
  uint64_t v17 = *(void *)(*((void *)a1 + 4) + 8);
  char v18 = *(unsigned char *)(v17 + 24);
  __int16 v19 = (unsigned int *)*((void *)a1 + 8);
  if (v18) {
    char v18 = *v19 >= a4;
  }
  *(unsigned char *)(v17 + 2os_unfair_lock_unlock(this + 4) = v18;
  *__int16 v19 = a4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*((void *)a1 + 5) + 8) + 40));
}

void pci::transport::th::readInternal(uint64_t a1, uint64_t a2, int a3, uint64_t a4, const void **a5)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)a1);
  int v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v18 = *(_DWORD *)(a1 + 40);
    LODWORD(v20[0]) = 136316418;
    *(void *)((char *)v20 + os_unfair_lock_unlock(this + 4) = "th";
    WORD6(v20[0]) = 2048;
    *(void *)((char *)v20 + 1os_unfair_lock_unlock(this + 4) = a1;
    WORD3(v20[1]) = 1024;
    DWORD2(v20[1]) = v18;
    WORD6(v20[1]) = 2048;
    *(void *)((char *)&v20[1] + 1os_unfair_lock_unlock(this + 4) = a2;
    WORD3(v20[2]) = 1024;
    DWORD2(v20[2]) = a3;
    WORD6(v20[2]) = 2048;
    *(void *)((char *)&v20[2] + 1os_unfair_lock_unlock(this + 4) = a4;
    _os_log_debug_impl(&dword_26361C000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d:buffer %p, size %u, dDtor %p", (uint8_t *)v20, 0x36u);
  }
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20[0] = v12;
  v20[1] = v12;
  memset(&v20[2], 0, 32);
  if (*a5) {
    BOOL v13 = _Block_copy(*a5);
  }
  else {
    BOOL v13 = 0;
  }
  LODWORD(v20[0]) = *(_DWORD *)(a1 + 40);
  DWORD1(v20[0]) = 2;
  *((void *)&v20[0] + 1) = a4;
  *(void *)&v20[1] = a2;
  DWORD2(v20[1]) = a3;
  if (v13) {
    char v14 = _Block_copy(v13);
  }
  else {
    char v14 = 0;
  }
  *(void *)&v20[2] = v14;
  char v16 = *(const os_unfair_lock **)a1;
  uint64_t v15 = *(void *)(a1 + 8);
  if (v15) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
  }
  *((void *)&v20[2] + 1) = v16;
  *(void *)&void v20[3] = v15;
  uint64_t v17 = *(void *)(a1 + 16);
  if (v17) {
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  }
  *((void *)&v20[3] + 1) = v17;
  if (v13) {
    _Block_release(v13);
  }
  pci::transport::task::create(buf);
}

void sub_2636287E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)va);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

void ___ZN3pci9transport2th9readAsyncEv_block_invoke(pci::log *a1, int a2, uint64_t a3, int a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v8 = *((void *)a1 + 5);
  dispatch_object_t v9 = pci::log::get(a1);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    int v21 = *(_DWORD *)(v8 + 40);
    *(_DWORD *)int buf = 136316418;
    int v29 = "th";
    __int16 v30 = 2048;
    uint64_t v31 = v8;
    __int16 v32 = 1024;
    int v33 = v21;
    __int16 v34 = 1024;
    int v35 = a2;
    __int16 v36 = 2048;
    uint64_t v37 = a3;
    __int16 v38 = 1024;
    int v39 = a4;
    _os_log_debug_impl(&dword_26361C000, v9, OS_LOG_TYPE_DEBUG, "%s::%p::%d:status 0x%x, buff %p, size %u", buf, 0x32u);
    if (!a3) {
      goto LABEL_5;
    }
  }
  else if (!a3)
  {
    goto LABEL_5;
  }
  int v11 = pci::log::get((pci::log *)v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::writeInternal();
  }
LABEL_5:
  long long v12 = *(const void **)(v8 + 88);
  if (v12) {
    BOOL v13 = _Block_copy(v12);
  }
  else {
    BOOL v13 = 0;
  }
  char v14 = *(NSObject **)(v8 + 48);
  if (v14) {
    dispatch_retain(*(dispatch_object_t *)(v8 + 48));
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZN3pci9transport2th9readAsyncEv_block_invoke_14;
  block[3] = &__block_descriptor_tmp_17;
  if (v13) {
    uint64_t v15 = _Block_copy(v13);
  }
  else {
    uint64_t v15 = 0;
  }
  aBlock = v15;
  uint64_t v25 = a3;
  int v26 = a2;
  int v27 = a4;
  dispatch_async(v14, block);
  if (!a2 && !*(unsigned char *)(v8 + 152))
  {
    int v18 = *(_DWORD *)(v8 + 80);
    __int16 v19 = *(const void **)(*(void *)(*((void *)a1 + 4) + 8) + 40);
    if (v19) {
      int v20 = _Block_copy(v19);
    }
    else {
      int v20 = 0;
    }
    int v22 = v20;
    pci::transport::th::readInternal(v8, 0, v18, 0, &v22);
  }
  uint64_t v16 = *(void *)(*((void *)a1 + 4) + 8);
  uint64_t v17 = *(const void **)(v16 + 40);
  *(void *)(v16 + 40) = 0;
  if (v17) {
    _Block_release(v17);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v14) {
    dispatch_release(v14);
  }
  if (v13) {
    _Block_release(v13);
  }
}

void sub_263628AE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *aBlock)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN3pci9transport2th9readAsyncEv_block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 48), *(void *)(a1 + 40), *(unsigned int *)(a1 + 52));
}

void pci::transport::th::sendImage(pci::transport::th *this, const unsigned __int8 *a2, int a3, unsigned int *a4, void (*a5)(void *), int a6)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2000000000;
  char v23 = 1;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3002000000;
  void v20[3] = __Block_byref_object_copy__1;
  _OWORD v20[4] = __Block_byref_object_dispose__1;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  long long v12 = pci::log::get((pci::log *)object);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v15 = *((_DWORD *)this + 10);
    int v16 = *a4;
    int buf = 136316930;
    buf_4 = "th";
    __int16 v26 = 2048;
    int v27 = this;
    __int16 v28 = 1024;
    int v29 = v15;
    __int16 v30 = 2048;
    uint64_t v31 = a2;
    __int16 v32 = 1024;
    int v33 = a3;
    __int16 v34 = 1024;
    int v35 = v16;
    __int16 v36 = 2048;
    uint64_t v37 = a5;
    __int16 v38 = 1024;
    int v39 = a6;
    _os_log_debug_impl(&dword_26361C000, v12, OS_LOG_TYPE_DEBUG, "%s::%p::%d:buffer %p, length %u, cookie %u, dDtor %p, timeout %u", (uint8_t *)&buf, 0x42u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th9sendImageEPKhjRjPFvPvEj_block_invoke;
  aBlock[3] = &unk_2655D2508;
  void aBlock[6] = this;
  aBlock[7] = a2;
  int v19 = a3;
  aBlock[8] = a5;
  void aBlock[9] = a4;
  aBlock[4] = v22;
  void aBlock[5] = v20;
  BOOL v13 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  if (v13) {
    char v14 = _Block_copy(v13);
  }
  else {
    char v14 = 0;
  }
  uint64_t v17 = v14;
  pci::transport::th::sendImageInternal((uint64_t)this, (uint64_t)a2, a3, (uint64_t)a5, &v17);
}

void sub_263628E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object,char a27)
{
  if (v28) {
    _Block_release(v28);
  }
  _Block_object_dispose(&a21, 8);
  if (object) {
    dispatch_release(object);
  }
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

intptr_t ___ZN3pci9transport2th9sendImageEPKhjRjPFvPvEj_block_invoke(uint64_t a1, int a2, uint64_t a3, int a4, int a5)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v10 = *(void *)(a1 + 48);
  int v11 = pci::log::get((pci::log *)a1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v20 = *(_DWORD *)(v10 + 40);
    int v21 = 136316674;
    int v22 = "th";
    __int16 v23 = 2048;
    uint64_t v24 = v10;
    __int16 v25 = 1024;
    int v26 = v20;
    __int16 v27 = 1024;
    int v28 = a2;
    __int16 v29 = 2048;
    uint64_t v30 = a3;
    __int16 v31 = 1024;
    int v32 = a4;
    __int16 v33 = 1024;
    int v34 = a5;
    _os_log_debug_impl(&dword_26361C000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d:status 0x%x, buff %p, size %u, code %u", (uint8_t *)&v21, 0x38u);
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  if (a2) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = *(unsigned char *)(v12 + 24) == 0;
  }
  char v14 = !v13;
  *(unsigned char *)(v12 + 2os_unfair_lock_unlock(this + 4) = v14;
  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
  char v16 = *(unsigned char *)(v15 + 24);
  if (v16)
  {
    if (*(void *)(a1 + 56) == a3 && !*(void *)(a1 + 64))
    {
      char v16 = 1;
    }
    else if (a3)
    {
      char v16 = 0;
    }
    else
    {
      char v16 = *(void *)(a1 + 64) != 0;
    }
  }
  *(unsigned char *)(v15 + 2os_unfair_lock_unlock(this + 4) = v16;
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
  char v18 = *(unsigned char *)(v17 + 24);
  if (v18)
  {
    if (*(_DWORD *)(a1 + 80) == a4 && !*(void *)(a1 + 64))
    {
      char v18 = 1;
    }
    else if (a4)
    {
      char v18 = 0;
    }
    else
    {
      char v18 = *(void *)(a1 + 64) != 0;
    }
  }
  *(unsigned char *)(v17 + 2os_unfair_lock_unlock(this + 4) = v18;
  **(_DWORD **)(a1 + 72) = a5;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void pci::transport::th::sendImageInternal(uint64_t a1, uint64_t a2, int a3, uint64_t a4, const void **a5)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)a1);
  int v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v18 = *(_DWORD *)(a1 + 40);
    LODWORD(v20[0]) = 136316418;
    *(void *)((char *)v20 + os_unfair_lock_unlock(this + 4) = "th";
    WORD6(v20[0]) = 2048;
    *(void *)((char *)v20 + 1os_unfair_lock_unlock(this + 4) = a1;
    WORD3(v20[1]) = 1024;
    DWORD2(v20[1]) = v18;
    WORD6(v20[1]) = 2048;
    *(void *)((char *)&v20[1] + 1os_unfair_lock_unlock(this + 4) = a2;
    WORD3(v20[2]) = 1024;
    DWORD2(v20[2]) = a3;
    WORD6(v20[2]) = 2048;
    *(void *)((char *)&v20[2] + 1os_unfair_lock_unlock(this + 4) = a4;
    _os_log_debug_impl(&dword_26361C000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d:buffer %p, size %u, dDtor %p", (uint8_t *)v20, 0x36u);
  }
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20[0] = v12;
  v20[1] = v12;
  memset(&v20[2], 0, 32);
  if (*a5) {
    BOOL v13 = _Block_copy(*a5);
  }
  else {
    BOOL v13 = 0;
  }
  LODWORD(v20[0]) = *(_DWORD *)(a1 + 40);
  DWORD1(v20[0]) = 3;
  *((void *)&v20[0] + 1) = a4;
  *(void *)&v20[1] = a2;
  DWORD2(v20[1]) = a3;
  if (v13) {
    char v14 = _Block_copy(v13);
  }
  else {
    char v14 = 0;
  }
  *(void *)&v20[2] = v14;
  char v16 = *(const os_unfair_lock **)a1;
  uint64_t v15 = *(void *)(a1 + 8);
  if (v15) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
  }
  *((void *)&v20[2] + 1) = v16;
  *(void *)&void v20[3] = v15;
  uint64_t v17 = *(void *)(a1 + 16);
  if (v17) {
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  }
  *((void *)&v20[3] + 1) = v17;
  if (v13) {
    _Block_release(v13);
  }
  pci::transport::task::create(buf);
}

void sub_26362937C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)va);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  _Unwind_Resume(a1);
}

void pci::transport::th::sendImageAsync(pci::transport::th *this, const unsigned __int8 *a2, int a3, void (*a4)(void *))
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v8 = pci::log::get(this);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = *((_DWORD *)this + 10);
    *(_DWORD *)int buf = 136316418;
    *(void *)&uint8_t buf[4] = "th";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = this;
    __int16 v15 = 1024;
    int v16 = v11;
    __int16 v17 = 2048;
    int v18 = a2;
    __int16 v19 = 1024;
    int v20 = a3;
    __int16 v21 = 2048;
    int v22 = a4;
    _os_log_debug_impl(&dword_26361C000, v8, OS_LOG_TYPE_DEBUG, "%s::%p::%d:buffer %p, size %u, dDtor %p", buf, 0x36u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th14sendImageAsyncEPKhjPFvPvE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_22;
  aBlock[4] = this;
  dispatch_object_t v9 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  memset(buf, 170, 16);
  if (v9) {
    uint64_t v10 = _Block_copy(v9);
  }
  else {
    uint64_t v10 = 0;
  }
  long long v12 = v10;
  pci::transport::th::sendImageInternal((uint64_t)this, (uint64_t)a2, a3, (uint64_t)a4, &v12);
}

void sub_2636295A4(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void ___ZN3pci9transport2th14sendImageAsyncEPKhjPFvPvE_block_invoke(pci::log *a1, int a2, uint64_t a3, int a4, int a5)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v9 = *((void *)a1 + 4);
  uint64_t v10 = pci::log::get(a1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v15 = *(_DWORD *)(v9 + 40);
    *(_DWORD *)int buf = 136316674;
    uint64_t v23 = "th";
    __int16 v24 = 2048;
    uint64_t v25 = v9;
    __int16 v26 = 1024;
    int v27 = v15;
    __int16 v28 = 1024;
    int v29 = a2;
    __int16 v30 = 2048;
    uint64_t v31 = a3;
    __int16 v32 = 1024;
    int v33 = a4;
    __int16 v34 = 1024;
    int v35 = a5;
    _os_log_debug_impl(&dword_26361C000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d:status 0x%x, buff %p, size %u, code %u", buf, 0x38u);
  }
  int v11 = *(const void **)(v9 + 104);
  if (v11) {
    long long v12 = _Block_copy(v11);
  }
  else {
    long long v12 = 0;
  }
  BOOL v13 = *(NSObject **)(v9 + 48);
  if (v13) {
    dispatch_retain(v13);
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 1174405120;
  uint64_t v16[2] = ___ZN3pci9transport2th14sendImageAsyncEPKhjPFvPvE_block_invoke_20;
  void v16[3] = &__block_descriptor_tmp_21_0;
  if (v12) {
    char v14 = _Block_copy(v12);
  }
  else {
    char v14 = 0;
  }
  aBlock = v14;
  uint64_t v18 = a3;
  int v19 = a2;
  int v20 = a4;
  int v21 = a5;
  dispatch_async(v13, v16);
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v13) {
    dispatch_release(v13);
  }
  if (v12) {
    _Block_release(v12);
  }
}

void sub_2636297B0(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t ___ZN3pci9transport2th14sendImageAsyncEPKhjPFvPvE_block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 48), *(void *)(a1 + 40), *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56));
}

void *__copy_helper_block_e8_32c46_ZTSN10applesauce8dispatch2v15blockIFviPvjjEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 32);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c46_ZTSN10applesauce8dispatch2v15blockIFviPvjjEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void pci::transport::th::readRegister(pci::transport::th *this, int a2, const unsigned __int8 *a3, unsigned int *a4, int a5)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2000000000;
  char v21 = 1;
  v18[0] = 0;
  v18[1] = v18;
  uint64_t v18[2] = 0x3002000000;
  void v18[3] = __Block_byref_object_copy__1;
  uint8_t v18[4] = __Block_byref_object_dispose__1;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = dispatch_semaphore_create(0);
  uint64_t v10 = pci::log::get((pci::log *)object);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v14 = *((_DWORD *)this + 10);
    int v15 = *a4;
    int buf = 136316674;
    buf_4 = "th";
    __int16 v24 = 2048;
    uint64_t v25 = this;
    __int16 v26 = 1024;
    int v27 = v14;
    __int16 v28 = 1024;
    int v29 = a2;
    __int16 v30 = 2048;
    uint64_t v31 = a3;
    __int16 v32 = 1024;
    int v33 = v15;
    __int16 v34 = 1024;
    int v35 = a5;
    _os_log_debug_impl(&dword_26361C000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d:reg %u, buffer %p, length %u, timeout %u", (uint8_t *)&buf, 0x38u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th12readRegisterEjPKhRjj_block_invoke;
  aBlock[3] = &unk_2655D2550;
  void aBlock[6] = this;
  aBlock[7] = a3;
  aBlock[8] = a4;
  aBlock[4] = v20;
  void aBlock[5] = v18;
  int v11 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  int v12 = *a4;
  if (v11) {
    BOOL v13 = _Block_copy(v11);
  }
  else {
    BOOL v13 = 0;
  }
  int v16 = v13;
  pci::transport::th::readRegisterInternal((uint64_t)this, a2, (uint64_t)a3, v12, &v16);
}

void sub_263629B4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,dispatch_object_t object,char a25)
{
  if (v25) {
    _Block_release(v25);
  }
  _Block_object_dispose(&a19, 8);
  if (object) {
    dispatch_release(object);
  }
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

intptr_t ___ZN3pci9transport2th12readRegisterEjPKhRjj_block_invoke(pci::log *a1, int a2, uint64_t a3, unsigned int a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v8 = *((void *)a1 + 6);
  uint64_t v9 = pci::log::get(a1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v19 = *(_DWORD *)(v8 + 40);
    int v20 = 136316418;
    char v21 = "th";
    __int16 v22 = 2048;
    uint64_t v23 = v8;
    __int16 v24 = 1024;
    int v25 = v19;
    __int16 v26 = 1024;
    int v27 = a2;
    __int16 v28 = 2048;
    uint64_t v29 = a3;
    __int16 v30 = 1024;
    unsigned int v31 = a4;
    _os_log_debug_impl(&dword_26361C000, v9, OS_LOG_TYPE_DEBUG, "%s::%p::%d:status 0x%x, buff %p, size %u", (uint8_t *)&v20, 0x32u);
  }
  uint64_t v10 = *(void *)(*((void *)a1 + 4) + 8);
  if (a2) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = *(unsigned char *)(v10 + 24) == 0;
  }
  char v12 = !v11;
  *(unsigned char *)(v10 + 2os_unfair_lock_unlock(this + 4) = v12;
  uint64_t v13 = *(void *)(*((void *)a1 + 4) + 8);
  char v14 = *(unsigned char *)(v13 + 24);
  if (v14) {
    char v14 = *((void *)a1 + 7) == a3;
  }
  *(unsigned char *)(v13 + 2os_unfair_lock_unlock(this + 4) = v14;
  uint64_t v15 = *(void *)(*((void *)a1 + 4) + 8);
  char v16 = *(unsigned char *)(v15 + 24);
  __int16 v17 = (unsigned int *)*((void *)a1 + 8);
  if (v16) {
    char v16 = *v17 >= a4;
  }
  *(unsigned char *)(v15 + 2os_unfair_lock_unlock(this + 4) = v16;
  *__int16 v17 = a4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*((void *)a1 + 5) + 8) + 40));
}

void pci::transport::th::readRegisterInternal(uint64_t a1, int a2, uint64_t a3, int a4, const void **a5)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)a1);
  BOOL v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v18 = *(_DWORD *)(a1 + 40);
    LODWORD(v20[0]) = 136316418;
    *(void *)((char *)v20 + os_unfair_lock_unlock(this + 4) = "th";
    WORD6(v20[0]) = 2048;
    *(void *)((char *)v20 + 1os_unfair_lock_unlock(this + 4) = a1;
    WORD3(v20[1]) = 1024;
    DWORD2(v20[1]) = v18;
    WORD6(v20[1]) = 1024;
    *(_DWORD *)((char *)&v20[1] + 1os_unfair_lock_unlock(this + 4) = a2;
    WORD1(v20[2]) = 2048;
    *(void *)((char *)&v20[2] + os_unfair_lock_unlock(this + 4) = a3;
    WORD6(v20[2]) = 1024;
    *(_DWORD *)((char *)&v20[2] + 1os_unfair_lock_unlock(this + 4) = a4;
    _os_log_debug_impl(&dword_26361C000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d:reg %u, buffer %p, size %u", (uint8_t *)v20, 0x32u);
  }
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20[0] = v12;
  v20[1] = v12;
  memset(&v20[2], 0, 32);
  if (*a5) {
    uint64_t v13 = _Block_copy(*a5);
  }
  else {
    uint64_t v13 = 0;
  }
  LODWORD(v20[0]) = *(_DWORD *)(a1 + 40);
  DWORD1(v20[0]) = 2;
  *((void *)&v20[0] + 1) = 0;
  *(void *)&v20[1] = a3;
  DWORD2(v20[1]) = a4;
  if (v13) {
    char v14 = _Block_copy(v13);
  }
  else {
    char v14 = 0;
  }
  *(void *)&v20[2] = v14;
  char v16 = *(const os_unfair_lock **)a1;
  uint64_t v15 = *(void *)(a1 + 8);
  if (v15) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
  }
  *((void *)&v20[2] + 1) = v16;
  *(void *)&void v20[3] = v15;
  uint64_t v17 = *(void *)(a1 + 16);
  if (v17) {
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  }
  *((void *)&v20[3] + 1) = v17;
  if (v13) {
    _Block_release(v13);
  }
  pci::transport::task::create(buf);
}

void sub_263629FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)va);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  _Unwind_Resume(a1);
}

uint64_t pci::transport::th::unblockRead(pci::transport::th **this)
{
  uint64_t v2 = pci::log::get((pci::log *)this);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::init();
  }
  if (!*((unsigned char *)this + 75))
  {
    os_unfair_lock_lock((os_unfair_lock_t)*this);
    BOOL v3 = this[17];
    if (v3 != (pci::transport::th *)(this + 16))
    {
      do
      {
        int v5 = (pci::transport::th *)*((void *)v3 + 1);
        uint64_t v4 = (const os_unfair_lock **)*((void *)v3 + 2);
        uint64_t v6 = (std::__shared_weak_count *)*((void *)v3 + 3);
        if (v6) {
          atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (pci::transport::task::getType((pci::transport::task *)v4) == 2) {
          pci::transport::task::poison(v4, 0xE00002EB);
        }
        if (v6) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v6);
        }
        BOOL v3 = v5;
      }
      while (v5 != (pci::transport::th *)(this + 16));
    }
    os_unfair_lock_unlock((os_unfair_lock_t)*this);
  }
  return 1;
}

void sub_26362A10C(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

BOOL pci::transport::th::flushRead(dispatch_object_t *this)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v2 = pci::log::get((pci::log *)this);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::init();
  }
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2000000000;
  int v39 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3002000000;
  v34[3] = __Block_byref_object_copy__1;
  v34[4] = __Block_byref_object_dispose__1;
  dispatch_object_t v35 = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t v35 = dispatch_semaphore_create(0);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th9flushReadEv_block_invoke;
  aBlock[3] = &unk_2655D2578;
  void aBlock[5] = v34;
  void aBlock[6] = this;
  aBlock[4] = &v36;
  BOOL v3 = _Block_copy(aBlock);
  clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  if (!*((_DWORD *)v37 + 6))
  {
    os_unfair_lock_lock((os_unfair_lock_t)*this);
    memset(&v19[3], 170, sizeof(_OWORD));
    if (v3) {
      uint64_t v4 = _Block_copy(v3);
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v32 = v4;
    pci::transport::th::readInternal((uint64_t)this, 0, 0x2000, 0, &v32);
  }
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2000000000;
  char v31 = 1;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3002000000;
  int v25 = __Block_byref_object_copy__25;
  __int16 v26 = __Block_byref_object_dispose__26;
  dispatch_object_t v27 = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t v27 = dispatch_group_create();
  os_unfair_lock_lock((os_unfair_lock_t)*this);
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  void v19[3] = v5;
  v19[4] = v5;
  *(_OWORD *)int v20 = 0u;
  *(_OWORD *)dispatch_object_t object = 0u;
  *(void *)&v19[0] = MEMORY[0x263EF8330];
  *((void *)&v19[0] + 1) = 0x40000000;
  *(void *)&v19[1] = ___ZN3pci9transport2th9flushReadEv_block_invoke_27;
  *((void *)&v19[1] + 1) = &unk_2655D25A0;
  *(void *)&v19[2] = &v28;
  *((void *)&v19[2] + 1) = &v22;
  uint64_t v6 = _Block_copy(v19);
  uint64_t v7 = v6;
  LODWORD(v19[3]) = *((_DWORD *)this + 10);
  memset((char *)&v19[3] + 4, 0, 24);
  if (v6) {
    uint64_t v8 = _Block_copy(v6);
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v20[0];
  v20[0] = v8;
  if (v9) {
    _Block_release(v9);
  }
  dispatch_object_t v11 = *this;
  dispatch_object_t v10 = this[1];
  if (v10) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)&v10[1], 1uLL, memory_order_relaxed);
  }
  long long v12 = (std::__shared_weak_count *)object[0];
  v20[1] = v11;
  object[0] = v10;
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  uint64_t v13 = this[2];
  if (v13) {
    dispatch_retain(this[2]);
  }
  char v14 = object[1];
  object[1] = v13;
  if (v14) {
    dispatch_release(v14);
  }
  if (v7) {
    _Block_release(v7);
  }
  if (*((unsigned char *)v29 + 24))
  {
    dispatch_group_enter((dispatch_group_t)v23[5]);
    pci::transport::task::create(buf);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)*this);
  uint64_t v15 = v23;
  dispatch_time_t v16 = dispatch_time(0, 2000000000);
  if (dispatch_group_wait((dispatch_group_t)v15[5], v16))
  {
    os_unfair_lock_lock((os_unfair_lock_t)*this);
    os_unfair_lock_unlock((os_unfair_lock_t)*this);
    dispatch_group_wait((dispatch_group_t)v23[5], 0xFFFFFFFFFFFFFFFFLL);
  }
  if (*((unsigned char *)v29 + 24))
  {
    if (*((unsigned char *)this + 75) && *((_DWORD *)this + 19)) {
      pci::transport::th::readAsync((pci::transport::th *)this);
    }
    int v17 = 1;
  }
  else
  {
    int v17 = 0;
  }
  if (object[1]) {
    dispatch_release(object[1]);
  }
  if (object[0]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)object[0]);
  }
  if (v20[0]) {
    _Block_release(v20[0]);
  }
  _Block_object_dispose(&v22, 8);
  if (v27) {
    dispatch_release(v27);
  }
  _Block_object_dispose(&v28, 8);
  if (v3) {
    _Block_release(v3);
  }
  _Block_object_dispose(v34, 8);
  if (v35) {
    dispatch_release(v35);
  }
  _Block_object_dispose(&v36, 8);
  return v17 != 0;
}

void sub_26362A824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,dispatch_object_t object,char a33)
{
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)&a19);
  _Block_object_dispose(&a27, 8);
  if (object)
  {
    dispatch_release(object);
    if (!v35)
    {
LABEL_3:
      if (!v34)
      {
LABEL_5:
        _Block_object_dispose(&a33, 8);
        if (v33) {
          _Block_release(v33);
        }
        pci::transport::th::flushRead((const void *)(v37 - 240), (dispatch_object_t *)(v36 + 40));
        _Block_object_dispose((const void *)(v37 - 192), 8);
        _Unwind_Resume(a1);
      }
LABEL_4:
      std::__shared_weak_count::__release_shared[abi:ne180100](v34);
      goto LABEL_5;
    }
  }
  else if (!v35)
  {
    goto LABEL_3;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v35);
  if (!v34) {
    goto LABEL_5;
  }
  goto LABEL_4;
}

intptr_t ___ZN3pci9transport2th9flushReadEv_block_invoke(pci::log *a1, int a2, void *a3, int a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = *((void *)a1 + 6);
  *(_DWORD *)(*(void *)(*((void *)a1 + 4) + 8) + 2os_unfair_lock_unlock(this + 4) = a2;
  if (a2 != -536870165)
  {
    if (!a2) {
      goto LABEL_6;
    }
    uint64_t v9 = pci::log::get(a1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *(_DWORD *)(v5 + 40);
      int v12 = 136316418;
      uint64_t v13 = "th";
      __int16 v14 = 2048;
      uint64_t v15 = v5;
      __int16 v16 = 1024;
      int v17 = v10;
      __int16 v18 = 1024;
      int v19 = a2;
      __int16 v20 = 2048;
      uint64_t v21 = a3;
      __int16 v22 = 1024;
      int v23 = a4;
      _os_log_impl(&dword_26361C000, v9, OS_LOG_TYPE_DEFAULT, "%s::%p::%d:status 0x%x, buff %p, size %u", (uint8_t *)&v12, 0x32u);
    }
    if (!a2) {
LABEL_6:
    }
      free(a3);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*((void *)a1 + 5) + 8) + 40));
}

void __Block_byref_object_copy__25(uint64_t a1, uint64_t a2)
{
  BOOL v3 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 40) = v3;
  if (v3) {
    dispatch_retain(v3);
  }
}

void __Block_byref_object_dispose__26(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

void ___ZN3pci9transport2th9flushReadEv_block_invoke_27(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (a2) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = *(unsigned char *)(v2 + 24) == 0;
  }
  char v4 = !v3;
  *(unsigned char *)(v2 + 2os_unfair_lock_unlock(this + 4) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void std::__list_imp<std::shared_ptr<pci::transport::task>>::clear(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    BOOL v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        uint64_t v5 = (uint64_t *)v3[1];
        uint64_t v6 = (std::__shared_weak_count *)v3[3];
        if (v6) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v6);
        }
        operator delete(v3);
        BOOL v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void getPciTransportToDirectionMap(void)
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  {
    {
      v0[0] = xmmword_26362E9C0;
      v0[1] = unk_26362E9D0;
      std::map<PCITransportInterface,PCITransportDirection>::map[abi:ne180100]((uint64_t)&getPciTransportToDirectionMap(void)::sMap, (int *)v0, 4);
      __cxa_atexit((void (*)(void *))std::map<PCITransportInterface,PCITransportDirection>::~map[abi:ne180100], &getPciTransportToDirectionMap(void)::sMap, &dword_26361C000);
    }
  }
}

void sub_26362AC2C(_Unwind_Exception *a1)
{
}

uint64_t std::map<PCITransportInterface,PCITransportDirection>::~map[abi:ne180100](uint64_t a1)
{
  return a1;
}

uint64_t std::map<PCITransportInterface,PCITransportDirection>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 8 * a3;
    do
    {
      std::__tree<std::__value_type<PCITransportInterface,PCITransportDirection>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,PCITransportDirection>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,PCITransportDirection>>>::__emplace_hint_unique_key_args<PCITransportInterface,std::pair<PCITransportInterface const,PCITransportDirection> const&>((uint64_t **)a1, v4, a2, (uint64_t *)a2);
      a2 += 2;
      v6 -= 8;
    }
    while (v6);
  }
  return a1;
}

void sub_26362ACD8(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<PCITransportRegister,unsigned int>,std::__map_value_compare<PCITransportRegister,std::__value_type<PCITransportRegister,unsigned int>,std::less<PCITransportRegister>,true>,std::allocator<std::__value_type<PCITransportRegister,unsigned int>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<PCITransportInterface,PCITransportDirection>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,PCITransportDirection>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,PCITransportDirection>>>::__emplace_hint_unique_key_args<PCITransportInterface,std::pair<PCITransportInterface const,PCITransportDirection> const&>(uint64_t **a1, uint64_t *a2, int *a3, uint64_t *a4)
{
  uint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t v11 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v6 = std::__tree<std::__value_type<PCITransportInterface,PCITransportDirection>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,PCITransportDirection>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,PCITransportDirection>>>::__find_equal<PCITransportInterface>(a1, a2, &v11, &v10, a3);
  uint64_t v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    uint64_t v7 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v7 + 28) = *a4;
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, (uint64_t)v11, v8, v7);
  }
  return v7;
}

uint64_t *std::__tree<std::__value_type<PCITransportInterface,PCITransportDirection>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,PCITransportDirection>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,PCITransportDirection>>>::__find_equal<PCITransportInterface>(void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  uint64_t v5 = a1 + 1;
  if (a1 + 1 == a2 || (int v6 = *a5, v7 = *((_DWORD *)a2 + 7), *a5 < v7))
  {
    uint64_t v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      uint64_t v9 = (uint64_t *)*a2;
      do
      {
        uint64_t v10 = v9;
        uint64_t v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      uint64_t v13 = a2;
      do
      {
        uint64_t v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        uint64_t v13 = v10;
      }
      while (v14);
    }
    int v15 = *a5;
    if (*((_DWORD *)v10 + 7) < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          int v17 = (uint64_t *)v16;
          int v18 = *(_DWORD *)(v16 + 28);
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = *v17;
          uint64_t v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        uint64_t v5 = v17 + 1;
        uint64_t v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      int v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    int v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      int v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    int v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      int v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 7))
  {
    uint64_t v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v21 = (uint64_t *)v20;
          int v22 = *(_DWORD *)(v20 + 28);
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = *v21;
          uint64_t v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        uint64_t v5 = v21 + 1;
        uint64_t v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      uint64_t v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void std::shared_ptr<pci::transport::th>::shared_ptr[abi:ne180100]<pci::transport::th,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_26362AF9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<pci::transport::th>::reset[abi:ne180100]((dispatch_object_t **)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<pci::transport::th *,std::shared_ptr<pci::transport::th>::__shared_ptr_default_delete<pci::transport::th,pci::transport::th>,std::allocator<pci::transport::th>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x263E66140);
}

dispatch_object_t *std::__shared_ptr_pointer<pci::transport::th *,std::shared_ptr<pci::transport::th>::__shared_ptr_default_delete<pci::transport::th,pci::transport::th>,std::allocator<pci::transport::th>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(dispatch_object_t **)(a1 + 24);
  if (result)
  {
    pci::transport::th::~th(result);
    JUMPOUT(0x263E66140);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<pci::transport::th *,std::shared_ptr<pci::transport::th>::__shared_ptr_default_delete<pci::transport::th,pci::transport::th>,std::allocator<pci::transport::th>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

dispatch_object_t *std::unique_ptr<pci::transport::th>::reset[abi:ne180100](dispatch_object_t **a1, dispatch_object_t *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    pci::transport::th::~th(result);
    JUMPOUT(0x263E66140);
  }
  return result;
}

void std::__shared_ptr_emplace<os_unfair_lock_s>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EA1CC0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<os_unfair_lock_s>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EA1CC0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x263E66140);
}

void OUTLINED_FUNCTION_3(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

uint64_t pci::transport::bind::bind(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  int v6 = *(NSObject **)(a2 + 24);
  *(void *)(a1 + 2os_unfair_lock_unlock(this + 4) = 0;
  *(void *)(a1 + 32) = v6;
  if (v6) {
    dispatch_retain(v6);
  }
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 32);
  *(void *)(a1 + 48) = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 56) = a3;
  *(void *)(a1 + 6os_unfair_lock_unlock(this + 4) = -536870911;
  uint64_t v8 = pci::log::get((pci::log *)v6);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    pci::transport::bind::bind();
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  std::list<std::shared_ptr<pci::transport::task>>::push_back(*(uint64_t **)(a1 + 56), (void *)(a1 + 40));
  return a1;
}

void sub_26362B24C(_Unwind_Exception *exception_object)
{
  BOOL v3 = (std::__shared_weak_count *)v1[6];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  uint64_t v4 = v1[4];
  if (v4) {
    dispatch_release(v4);
  }
  uint64_t v5 = (const void *)v1[3];
  if (v5) {
    _Block_release(v5);
  }
  _Unwind_Resume(exception_object);
}

void *std::list<std::shared_ptr<pci::transport::task>>::push_back(uint64_t *a1, void *a2)
{
  uint64_t result = operator new(0x20uLL);
  uint64_t v5 = a2[1];
  result[2] = *a2;
  result[3] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = *a1;
  *uint64_t result = *a1;
  result[1] = a1;
  *(void *)(v6 + 8) = result;
  *a1 = (uint64_t)result;
  ++a1[2];
  return result;
}

void pci::transport::bind::~bind(pci::transport::bind *this)
{
  uint64_t v2 = pci::log::get(this);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    pci::transport::bind::bind();
  }
  uint64_t v3 = *((void *)this + 3);
  if (v3)
  {
    uint64_t v4 = *((unsigned int *)this + 16);
    if (v4 == -536870911) {
      __assert_rtn("~bind", "PCITransportTask.cpp", 46, "fStatus != kIOReturnInvalid");
    }
    (*(void (**)(uint64_t, uint64_t, void, void, void))(v3 + 16))(v3, v4, *((void *)this + 1), *((unsigned int *)this + 4), *((unsigned int *)this + 17));
    uint64_t v5 = (const void *)*((void *)this + 3);
    *((void *)this + 3) = 0;
    if (v5) {
      _Block_release(v5);
    }
  }
  std::list<std::shared_ptr<pci::transport::task>>::remove(*((void *)this + 7), (void *)this + 5);
  dispatch_group_leave(*((dispatch_group_t *)this + 4));
  uint64_t v6 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  uint64_t v7 = *((void *)this + 4);
  if (v7) {
    dispatch_release(v7);
  }
  uint64_t v8 = (const void *)*((void *)this + 3);
  if (v8) {
    _Block_release(v8);
  }
}

void std::list<std::shared_ptr<pci::transport::task>>::remove(uint64_t a1, void *a2)
{
  v9[0] = (uint64_t)v9;
  v9[1] = (uint64_t)v9;
  v9[2] = 0;
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2 != (void *)a1)
  {
    do
    {
      uint64_t v6 = (void *)v2[1];
      uint64_t v5 = v2[2];
      if (v5 == *a2)
      {
        if (v6 == (void *)a1)
        {
          BOOL v8 = 1;
LABEL_8:
          uint64_t v6 = (void *)a1;
        }
        else
        {
          while (1)
          {
            uint64_t v7 = v6[2];
            BOOL v8 = v7 == v5;
            if (v7 != v5) {
              break;
            }
            uint64_t v6 = (void *)v6[1];
            if (v6 == (void *)a1) {
              goto LABEL_8;
            }
          }
        }
        std::list<void const*>::splice((uint64_t)v9, v9, a1, v2, v6);
        if (!v8) {
          uint64_t v6 = (void *)v6[1];
        }
      }
      uint64_t v2 = v6;
    }
    while (v6 != (void *)a1);
  }
  std::__list_imp<std::shared_ptr<pci::transport::task>>::clear(v9);
}

void sub_26362B494(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__list_imp<std::shared_ptr<pci::transport::task>>::clear((uint64_t *)va);
  _Unwind_Resume(a1);
}

void pci::transport::bind::setCompletion(uint64_t a1, void **a2)
{
  uint64_t v3 = *a2;
  if (*a2) {
    uint64_t v3 = _Block_copy(v3);
  }
  uint64_t v4 = *(const void **)(a1 + 24);
  *(void *)(a1 + 2os_unfair_lock_unlock(this + 4) = v3;
  if (v4) {
    _Block_release(v4);
  }
}

uint64_t pci::transport::bind::setCIO(uint64_t this, void *a2)
{
  *(void *)(this + 8) = a2;
  return this;
}

uint64_t pci::transport::bind::setStatus(uint64_t result, int a2, int a3, int a4, char a5, int a6)
{
  *(_DWORD *)(result + 16) = a3;
  *(_DWORD *)(result + 6os_unfair_lock_unlock(this + 4) = a2;
  *(_DWORD *)(result + 68) = a4;
  if ((a5 & 1) == 0 && (a2 || a6 == 3))
  {
    *(void *)(result + 8) = 0;
    *(_DWORD *)(result + 16) = 0;
  }
  return result;
}

uint64_t pci::transport::bind::getCIO(pci::transport::bind *this)
{
  return *((void *)this + 1);
}

uint64_t pci::transport::bind::getSize(pci::transport::bind *this)
{
  return *((unsigned int *)this + 4);
}

void pci::transport::task::create(void *a1@<X8>)
{
  *a1 = 0xAAAAAAAAAAAAAAAALL;
  a1[1] = 0xAAAAAAAAAAAAAAAALL;
  operator new();
}

void sub_26362B5D8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

void pci::transport::task::init(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a1 + 32));
  memset(v7, 170, sizeof(v7));
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v5 = pci::log::get(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    pci::transport::task::init();
  }
  LODWORD(v7[0]) = *(_DWORD *)a2;
  v7[1] = *(void *)(a2 + 16);
  LODWORD(v7[2]) = *(_DWORD *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 56);
  if (v6) {
    dispatch_retain(*(dispatch_object_t *)(a2 + 56));
  }
  uint64_t v8 = v6;
  std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(buf, (void *)a1);
  uint64_t v9 = *(void *)buf;
  uint64_t v10 = v12;
  operator new();
}

void sub_26362B8F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  pci::transport::bind::parameters::~parameters((pci::transport::bind::parameters *)va);
  _Unwind_Resume(a1);
}

pci::transport::task *pci::transport::task::task(pci::transport::task *this, const pci::transport::task::parameters *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = *(void *)a2;
  uint64_t v3 = *((void *)a2 + 1);
  *((void *)this + 3) = v3;
  *((void *)this + os_unfair_lock_unlock(this + 4) = *((void *)a2 + 5);
  uint64_t v4 = *((void *)a2 + 6);
  *((void *)this + 5) = v4;
  if (v4)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
    uint64_t v3 = *((void *)a2 + 1);
  }
  *((unsigned char *)this + 48) = v3 == 0;
  *((void *)this + 7) = 0;
  *((_DWORD *)this + 16) = *((_DWORD *)a2 + 6);
  *((void *)this + 9) = 0;
  uint64_t v5 = pci::log::get(this);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = *((_DWORD *)this + 4);
    TypeString = getTypeString(*((_DWORD *)this + 5));
    int v9 = 136315906;
    uint64_t v10 = "task";
    __int16 v11 = 2048;
    uint64_t v12 = this;
    __int16 v13 = 1024;
    int v14 = v7;
    __int16 v15 = 2080;
    uint64_t v16 = TypeString;
    _os_log_debug_impl(&dword_26361C000, v5, OS_LOG_TYPE_DEBUG, "%s::%p::%d:%s: ", (uint8_t *)&v9, 0x26u);
  }
  return this;
}

void sub_26362BA84(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 40);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  uint64_t v4 = *(std::__shared_weak_count **)(v1 + 8);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  _Unwind_Resume(exception_object);
}

char *getTypeString(unsigned int a1)
{
  if (a1 >= 4) {
    getTypeString();
  }
  return off_2655D25C0[a1];
}

void pci::transport::task::~task(pci::transport::task *this)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = pci::log::get(this);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v5 = *((_DWORD *)this + 4);
    TypeString = getTypeString(*((_DWORD *)this + 5));
    int v7 = 136315906;
    uint64_t v8 = "task";
    __int16 v9 = 2048;
    uint64_t v10 = this;
    __int16 v11 = 1024;
    int v12 = v5;
    __int16 v13 = 2080;
    int v14 = TypeString;
    _os_log_debug_impl(&dword_26361C000, v2, OS_LOG_TYPE_DEBUG, "%s::%p::%d:%s: ", (uint8_t *)&v7, 0x26u);
  }
  if (*((void *)this + 9)) {
    __assert_rtn("~task", "PCITransportTask.cpp", 169, "!fBind");
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
}

void sub_26362BBFC(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void pci::transport::bind::parameters::~parameters(pci::transport::bind::parameters *this)
{
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *((void *)this + 3);
  if (v3) {
    dispatch_release(v3);
  }
}

os_unfair_lock *pci::transport::task::poison(const os_unfair_lock **this, uint32_t a2)
{
  os_unfair_lock_assert_owner(this[4]);
  int v5 = pci::log::get(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    pci::transport::task::poison((uint64_t)this);
  }
  uint64_t result = (os_unfair_lock *)this[9];
  if (result)
  {
    int v7 = *((unsigned __int8 *)this + 48);
    int v8 = *((_DWORD *)this + 5);
    result[4]._uint32_t os_unfair_lock_opaque = 0;
    result[16]._uint32_t os_unfair_lock_opaque = a2;
    result[17]._uint32_t os_unfair_lock_opaque = -1;
    if (!v7 && (a2 || v8 == 3)) {
      *(void *)&result[2]._uint32_t os_unfair_lock_opaque = 0;
    }
    pci::transport::bind::~bind((pci::transport::bind *)result);
    uint64_t result = (os_unfair_lock *)MEMORY[0x263E66140]();
    this[9] = 0;
  }
  return result;
}

void pci::transport::task::complete(pci::transport::task *this, int a2, unsigned int a3, int a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock(*((os_unfair_lock_t *)this + 4));
  __int16 v9 = pci::log::get(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    pci::transport::task::poison((uint64_t)this);
  }
  uint64_t v10 = *((void *)this + 9);
  if (v10) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = a2 == 0;
  }
  if (v11) {
    int v12 = -536870166;
  }
  else {
    int v12 = a2;
  }
  unsigned int v13 = *((_DWORD *)this + 5);
  if (v13 >= 2)
  {
    if (v13 - 2 > 1) {
      pci::transport::task::complete();
    }
    if (v13 != 2 || v12)
    {
      uint64_t v15 = (void *)((char *)this + 56);
      (*((void (**)(void))this + 3))(*((void *)this + 7));
    }
    else
    {
      int v14 = *(void **)(v10 + 8);
      if (v14 && *((unsigned char *)this + 48))
      {
        if (*((_DWORD *)this + 16) < a3) {
          pci::transport::task::complete();
        }
        memcpy(v14, *((const void **)this + 7), a3);
        (*((void (**)(void))this + 3))(*((void *)this + 7));
      }
      else
      {
        *(void *)(v10 + 8) = *((void *)this + 7);
      }
      uint64_t v15 = (void *)((char *)this + 56);
    }
    void *v15 = 0;
  }
  uint64_t v16 = *((void *)this + 9);
  if (v16)
  {
    int v17 = *((unsigned __int8 *)this + 48);
    int v18 = *((_DWORD *)this + 5);
    *(_DWORD *)(v16 + 16) = a3;
    *(_DWORD *)(v16 + 6os_unfair_lock_unlock(this + 4) = v12;
    *(_DWORD *)(v16 + 68) = a4;
    if (!v17 && (v12 || v18 == 3))
    {
      *(void *)(v16 + 8) = 0;
      *(_DWORD *)(v16 + 16) = 0;
    }
    pci::transport::bind::~bind((pci::transport::bind *)v16);
    MEMORY[0x263E66140]();
    *((void *)this + 9) = 0;
  }
  else
  {
    int v19 = pci::log::get(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      int v20 = *((_DWORD *)this + 4);
      TypeString = getTypeString(*((_DWORD *)this + 5));
      int v22 = 136316162;
      int v23 = "task";
      __int16 v24 = 2048;
      int v25 = this;
      __int16 v26 = 1024;
      int v27 = v20;
      __int16 v28 = 2080;
      uint64_t v29 = TypeString;
      __int16 v30 = 1024;
      int v31 = a2;
      _os_log_debug_impl(&dword_26361C000, v19, OS_LOG_TYPE_DEBUG, "%s::%p::%d:%s: poisoned completion, status 0x%x", (uint8_t *)&v22, 0x2Cu);
    }
  }
  os_unfair_lock_unlock(*((os_unfair_lock_t *)this + 4));
}

uint64_t pci::transport::task::getData(pci::transport::task *this)
{
  return *((void *)this + 7);
}

uint64_t pci::transport::task::getSize(pci::transport::task *this)
{
  return *((unsigned int *)this + 16);
}

uint64_t pci::transport::task::getType(pci::transport::task *this)
{
  return *((unsigned int *)this + 5);
}

void std::shared_ptr<pci::transport::task>::shared_ptr[abi:ne180100]<pci::transport::task,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_26362BFAC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<pci::transport::task>::reset[abi:ne180100]((pci::transport::task **)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<pci::transport::task *,std::shared_ptr<pci::transport::task>::__shared_ptr_default_delete<pci::transport::task,pci::transport::task>,std::allocator<pci::transport::task>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x263E66140);
}

pci::transport::task *std::__shared_ptr_pointer<pci::transport::task *,std::shared_ptr<pci::transport::task>::__shared_ptr_default_delete<pci::transport::task,pci::transport::task>,std::allocator<pci::transport::task>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(pci::transport::task **)(a1 + 24);
  if (result)
  {
    pci::transport::task::~task(result);
    JUMPOUT(0x263E66140);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<pci::transport::task *,std::shared_ptr<pci::transport::task>::__shared_ptr_default_delete<pci::transport::task,pci::transport::task>,std::allocator<pci::transport::task>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

pci::transport::task *std::unique_ptr<pci::transport::task>::reset[abi:ne180100](pci::transport::task **a1, pci::transport::task *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    pci::transport::task::~task(result);
    JUMPOUT(0x263E66140);
  }
  return result;
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Cu);
}

uint64_t pci::log::get(pci::log *this)
{
  if (pci::log::get(void)::once != -1) {
    dispatch_once(&pci::log::get(void)::once, &__block_literal_global_1);
  }
  return pci::log::get(void)::logger;
}

os_log_t ___ZN3pci3log3getEv_block_invoke()
{
  os_log_t result = os_log_create("com.apple.appleconvergedipc", "appleconvergedtransport");
  pci::log::get(void)::logger = (uint64_t)result;
  return result;
}

void pci::system::info::info(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_26361C000, log, OS_LOG_TYPE_DEBUG, (const char *)&unk_26362EDA9, v1, 2u);
}

void pci::system::info::eraseTH()
{
  __assert_rtn("eraseTH", "PCISystem.cpp", 90, "it != mth.end()");
}

void pci::system::info::insertBH(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_26361C000, a2, a3, "already pending for interface %d", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_26361C000, a2, a3, "%u", a5, a6, a7, a8, 0);
}

void ___ZN3pci6system4info8insertBHEiNSt3__18weak_ptrINS_9transport2bhEEEj_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void pci::system::info::removeBH()
{
  __assert_rtn("removeBH", "PCISystem.cpp", 202, "it != mbh.end()");
}

void pci::transport::bh::init()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_26361C000, v0, v1, "%s::%p::%d:", v2, v3, v4, v5, 2u);
}

void pci::transport::bh::bh()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_26361C000, v0, OS_LOG_TYPE_DEBUG, "%s::%p::%d:", (uint8_t *)v1, 0x1Cu);
}

void pci::transport::bh::~bh()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_26361C000, v0, v1, "%s::%p::%d:--done", v2, v3, v4, v5, 2u);
}

void ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_26361C000, v0, v1, "%s::%p::%d:interface added", v2, v3, v4, v5, 2u);
}

void ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_8_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_26361C000, v0, v1, "%s::%p::%d:notify interface removed", v2, v3, v4, v5, 2u);
}

void ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_8_cold_2()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_26361C000, v0, v1, "%s::%p::%d:interface removed", v2, v3, v4, v5, 2u);
}

void pci::transport::bh::setNotify()
{
}

void ___ZN3pci9transport2bh16generateCallbackENSt3__110shared_ptrINS0_4taskEEEPKcb_block_invoke_cold_1()
{
}

void pci::transport::bh::cmdCompletion()
{
}

void pci::transport::bh::ioCompletion()
{
}

void pci::transport::bh::imageCompletion()
{
}

void pci::event::Listener::notify(NSObject *a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_26361C000, a1, OS_LOG_TYPE_DEFAULT, "unknown link down type %u", (uint8_t *)v4, 8u);
  }
}

void pci::transport::th::init()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_26361C000, v0, v1, "%s::%p::%d:", v2, v3, v4, v5, 2u);
}

void pci::transport::th::th()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_26361C000, v0, OS_LOG_TYPE_DEBUG, "%s::%p::%d:", (uint8_t *)v1, 0x1Cu);
}

void pci::transport::th::th(NSObject **a1, std::__shared_weak_count **a2, dispatch_object_t *a3, uint64_t a4)
{
  int v7 = *a1;
  if (v7) {
    dispatch_release(v7);
  }
  int v8 = *(std::__shared_weak_count **)(a4 + 32);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  if (*a3) {
    dispatch_release(*a3);
  }
  if (*a2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*a2);
  }
}

void pci::transport::th::~th()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_26361C000, v0, v1, "%s::%p::%d:--done", v2, v3, v4, v5, 2u);
}

void pci::transport::th::writeInternal()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_26361C000, v0, v1, "%.*P");
}

void pci::transport::th::flushRead(const void *a1, dispatch_object_t *a2)
{
  if (*a2) {
    dispatch_release(*a2);
  }
}

void pci::transport::bind::bind()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_26361C000, v0, v1, "%s::%p::%d:", v2, v3, v4, v5, 2u);
}

void pci::transport::task::init()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_26361C000, v0, v1, "%s::%p::%d:", v2, v3, v4, v5, 2u);
}

void getTypeString()
{
}

void pci::transport::task::poison(uint64_t a1)
{
  getTypeString(*(_DWORD *)(a1 + 20));
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_26361C000, v1, v2, "%s::%p::%d:%s: status 0x%x", v3, v4, v5, v6, 2u);
}

void pci::transport::task::complete()
{
}

{
  __assert_rtn("complete", "PCITransportTask.cpp", 289, "size <= fSize");
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
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

uint64_t getACIPCErrorTypeString()
{
  return MEMORY[0x270F8C668]();
}

uint64_t getACIPCLinkStateString()
{
  return MEMORY[0x270F8C670]();
}

uint64_t getACIPCAERErrorTypeString()
{
  return MEMORY[0x270F8C678]();
}

uint64_t ACIPCBTClass::writeAsync(ACIPCBTClass *this, const void *a2, uint64_t a3, void (*a4)(void *, int, void *), void *a5)
{
  return MEMORY[0x270F8C680](this, a2, a3, a4, a5);
}

uint64_t ACIPCBTClass::readRegister(ACIPCBTClass *this, uint64_t a2, void *a3, unsigned int *a4)
{
  return MEMORY[0x270F8C688](this, a2, a3, a4);
}

uint64_t ACIPCBTClass::sendImageAsync(ACIPCBTClass *this, const void *a2, uint64_t a3, void (*a4)(void *, int, void *, void *), void *a5)
{
  return MEMORY[0x270F8C690](this, a2, a3, a4, a5);
}

uint64_t ACIPCBTClass::abortChannelAsync()
{
  return MEMORY[0x270F8C698]();
}

uint64_t ACIPCBTClass::startChannelAsync()
{
  return MEMORY[0x270F8C6A0]();
}

uint64_t ACIPCBTClass::open(ACIPCBTClass *this)
{
  return MEMORY[0x270F8C6A8](this);
}

uint64_t ACIPCBTClass::stop(ACIPCBTClass *this, dispatch_group_s *a2)
{
  return MEMORY[0x270F8C6B0](this, a2);
}

uint64_t ACIPCBTClass::start()
{
  return MEMORY[0x270F8C6B8]();
}

uint64_t ACIPCBTClass::readAsync(ACIPCBTClass *this, void *a2, uint64_t a3, void (*a4)(void *, int, void *), void *a5)
{
  return MEMORY[0x270F8C6C0](this, a2, a3, a4, a5);
}

void ACIPCBTClass::ACIPCBTClass(ACIPCBTClass *this)
{
}

void ACIPCBTClass::~ACIPCBTClass(ACIPCBTClass *this)
{
}

uint64_t ACIPCBTControlClass::registerEventNotification()
{
  return MEMORY[0x270F8C6D8]();
}

{
  return MEMORY[0x270F8C6E0]();
}

uint64_t ACIPCBTControlClass::deregisterEventNotification(ACIPCBTControlClass *this, dispatch_group_s *a2)
{
  return MEMORY[0x270F8C6E8](this, a2);
}

uint64_t ACIPCBTControlClass::stop(ACIPCBTControlClass *this)
{
  return MEMORY[0x270F8C6F0](this);
}

uint64_t ACIPCBTControlClass::start(ACIPCBTControlClass *this)
{
  return MEMORY[0x270F8C6F8](this);
}

void ACIPCBTControlClass::ACIPCBTControlClass(ACIPCBTControlClass *this)
{
}

void ACIPCBTControlClass::~ACIPCBTControlClass(ACIPCBTControlClass *this)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
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
  return MEMORY[0x270F98778]();
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x270ED8EF8](*(void *)&__clock_id);
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x270ED95C8](label);
}

void free(void *a1)
{
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

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}